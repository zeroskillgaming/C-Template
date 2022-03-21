EXECUTABLE := program

BIN_DIR := ./bin
SRC_DIR := ./src

SRC_FILES := $(shell find $(SRC_DIR) -name '*.cpp' -or -name '*.c' -or -name '*.s')
OBJ_FILES := $(SRC_FILES:%=$(BIN_DIR)/%.o)

default: $(EXECUTABLE)

.PHONY: clean list init run
clean:
	rm -rf $(BIN_DIR)/*
list:
	@echo Object Files: $(OBJ_FILES)
	@echo Source Files: $(SRC_FILES)
run: $(EXECUTABLE)
	@./$(EXECUTABLE)
init:
	@mkdir bin
	@mkdir src
	@echo Initialized

$(EXECUTABLE): $(OBJ_FILES)
	$(CC) $(OBJ_FILES) -o $@ $(LDFLAGS)

$(BIN_DIR)/%.c.o: %.c
	mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

$(BIN_DIR)/%.cpp.o: %.cpp
	mkdir -p $(dir $@)
	$(CXX) $(CXXFLAGS) -c $< -o $@

