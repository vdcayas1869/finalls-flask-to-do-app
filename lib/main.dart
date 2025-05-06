import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AsianCollege To-Do-App',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TodoListScreen(),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<String> todoItems = [];

  TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _addTodoItem(String task) {
    if (task.isNotEmpty) {
      setState(() {
        todoItems.add(task);

      });
      _controller.clear();
    }
  }

  void _deleteTodoItem(int index) {
    setState(() {
      todoItems.removeAt(index);
    });
  }
//AppBar Theme
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor:  const Color.fromARGB(255, 0, 162, 255),
        centerTitle: true,
        title: Text('AsianCollege To-Do-App'), titleTextStyle: TextStyle(fontSize: 30, color: const Color.fromARGB(255, 161, 15, 4), fontWeight: FontWeight.bold),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Add a new task',
                      fillColor: Colors.black,
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (value) {
                      _addTodoItem(value);
                    },
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    _addTodoItem(_controller.text);
                  },
                  child: Text('Add'),
                ),
              ],
            ),
          ),

          Expanded(
            child: todoItems.isEmpty
                ? Center(child: Text('You dont have any task.'))
                : ListView.builder(
              itemCount: todoItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(todoItems[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _deleteTodoItem(index);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}