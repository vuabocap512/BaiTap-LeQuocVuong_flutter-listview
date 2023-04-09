import 'package:flutter/material.dart';

void main() => runApp(listviewApp());

class listviewApp extends StatefulWidget {
  @override
  State<listviewApp> createState() => _listviewAppState();
}

class _listviewAppState extends State<listviewApp> {
  //const listviewApp({super.key});
  final List<String> fruits = [];
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    fruits.sort();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: TextField(
            controller: textController,
          ),
        ),
        body: fruits.length > 0
            ? ListView.separated(
                itemCount: fruits.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.local_grocery_store),
                    title: Text('${fruits[index]}'),
                    onLongPress: () {
                      setState(() {
                        fruits.removeAt(index);
                      });
                    },
                    trailing: Icon(Icons.remove_circle_outline),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(
                  color: Colors.greenAccent,
                ),
              )
            : Center(
                child: Text('No fruits in list of you'),
              ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                fruits.add(textController.text);
                textController.clear();
              });
            },
            child: Icon(Icons.save)),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
