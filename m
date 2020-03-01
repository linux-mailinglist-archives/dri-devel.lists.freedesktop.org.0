Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E57D174E1E
	for <lists+dri-devel@lfdr.de>; Sun,  1 Mar 2020 16:53:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C85D6E4AE;
	Sun,  1 Mar 2020 15:53:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C6A16E49B;
 Sun,  1 Mar 2020 15:53:31 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from haswell.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 20403941-1500050 
 for multiple; Sun, 01 Mar 2020 15:52:49 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] trace: Export anonymous tracing
Date: Sun,  1 Mar 2020 15:52:47 +0000
Message-Id: <20200301155248.4132645-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To facilitate construction of per-client event ringbuffers, in
particular for a per-client debug and error report log, it would be
extremely useful to create an anonymous file that can be handed to
userspace so that it can see its and only its events. trace already
provides a means of encapsulating the trace ringbuffer into a struct
file that can be opened via the tracefs, and so with a couple of minor
tweaks can provide the same access via an anonymous inode.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Steven Rostedt (VMware) <rostedt@goodmis.org>
---
 include/linux/trace.h |   4 ++
 kernel/trace/trace.c  | 142 ++++++++++++++++++++++++++++++------------
 2 files changed, 105 insertions(+), 41 deletions(-)

diff --git a/include/linux/trace.h b/include/linux/trace.h
index 7fd86d3c691f..337454e859f4 100644
--- a/include/linux/trace.h
+++ b/include/linux/trace.h
@@ -30,8 +30,12 @@ void trace_printk_init_buffers(void);
 int trace_array_printk(struct trace_array *tr, unsigned long ip,
 		const char *fmt, ...);
 void trace_array_put(struct trace_array *tr);
+struct trace_array *trace_array_create(void);
 struct trace_array *trace_array_get_by_name(const char *name);
 int trace_array_destroy(struct trace_array *tr);
+
+int anon_trace_getfd(const char *name, struct trace_array *tr);
+
 #endif	/* CONFIG_TRACING */
 
 #endif	/* _LINUX_TRACE_H */
diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index cf2e87b8cab1..792d7f2b86c1 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -48,6 +48,7 @@
 #include <linux/fsnotify.h>
 #include <linux/irq_work.h>
 #include <linux/workqueue.h>
+#include <linux/anon_inodes.h>
 
 #include "trace.h"
 #include "trace_output.h"
@@ -4162,7 +4163,7 @@ static int s_show(struct seq_file *m, void *v)
  */
 static inline int tracing_get_cpu(struct inode *inode)
 {
-	if (inode->i_cdev) /* See trace_create_cpu_file() */
+	if (inode && inode->i_cdev) /* See trace_create_cpu_file() */
 		return (long)inode->i_cdev - 1;
 	return RING_BUFFER_ALL_CPUS;
 }
@@ -5974,32 +5975,22 @@ tracing_max_lat_write(struct file *filp, const char __user *ubuf,
 
 #endif
 
-static int tracing_open_pipe(struct inode *inode, struct file *filp)
+static struct trace_iterator *
+tracing_create_pipe_iter(struct trace_array *tr, struct inode *inode)
 {
-	struct trace_array *tr = inode->i_private;
 	struct trace_iterator *iter;
-	int ret;
-
-	ret = tracing_check_open_get_tr(tr);
-	if (ret)
-		return ret;
-
-	mutex_lock(&trace_types_lock);
 
 	/* create a buffer to store the information to pass to userspace */
 	iter = kzalloc(sizeof(*iter), GFP_KERNEL);
-	if (!iter) {
-		ret = -ENOMEM;
-		__trace_array_put(tr);
-		goto out;
-	}
+	if (!iter)
+		return ERR_PTR(-ENOMEM);
 
 	trace_seq_init(&iter->seq);
 	iter->trace = tr->current_trace;
 
 	if (!alloc_cpumask_var(&iter->started, GFP_KERNEL)) {
-		ret = -ENOMEM;
-		goto fail;
+		kfree(iter);
+		return ERR_PTR(-ENOMEM);
 	}
 
 	/* trace pipe does not show start of buffer */
@@ -6016,6 +6007,29 @@ static int tracing_open_pipe(struct inode *inode, struct file *filp)
 	iter->array_buffer = &tr->array_buffer;
 	iter->cpu_file = tracing_get_cpu(inode);
 	mutex_init(&iter->mutex);
+
+	return iter;
+}
+
+static int tracing_open_pipe(struct inode *inode, struct file *filp)
+{
+	struct trace_array *tr = inode->i_private;
+	struct trace_iterator *iter;
+	int ret;
+
+	ret = tracing_check_open_get_tr(tr);
+	if (ret)
+		return ret;
+
+	mutex_lock(&trace_types_lock);
+
+	iter = tracing_create_pipe_iter(tr, inode);
+	if (IS_ERR(iter)) {
+		ret = PTR_ERR(iter);
+		__trace_array_put(tr);
+		goto out;
+	}
+
 	filp->private_data = iter;
 
 	if (iter->trace->pipe_open)
@@ -6027,18 +6041,12 @@ static int tracing_open_pipe(struct inode *inode, struct file *filp)
 out:
 	mutex_unlock(&trace_types_lock);
 	return ret;
-
-fail:
-	kfree(iter);
-	__trace_array_put(tr);
-	mutex_unlock(&trace_types_lock);
-	return ret;
 }
 
 static int tracing_release_pipe(struct inode *inode, struct file *file)
 {
 	struct trace_iterator *iter = file->private_data;
-	struct trace_array *tr = inode->i_private;
+	struct trace_array *tr = iter->tr;
 
 	mutex_lock(&trace_types_lock);
 
@@ -7904,7 +7912,7 @@ static inline __init int register_snapshot_cmd(void) { return 0; }
 
 static struct dentry *tracing_get_dentry(struct trace_array *tr)
 {
-	if (WARN_ON(!tr->dir))
+	if (!tr->dir)
 		return ERR_PTR(-ENODEV);
 
 	/* Top directory uses NULL as the parent */
@@ -8525,7 +8533,7 @@ struct trace_array *trace_array_find_get(const char *instance)
 	return tr;
 }
 
-static struct trace_array *trace_array_create(const char *name)
+static struct trace_array *__trace_array_create(const char *name)
 {
 	struct trace_array *tr;
 	int ret;
@@ -8535,9 +8543,11 @@ static struct trace_array *trace_array_create(const char *name)
 	if (!tr)
 		return ERR_PTR(ret);
 
-	tr->name = kstrdup(name, GFP_KERNEL);
-	if (!tr->name)
-		goto out_free_tr;
+	if (name) {
+		tr->name = kstrdup(name, GFP_KERNEL);
+		if (!tr->name)
+			goto out_free_tr;
+	}
 
 	if (!alloc_cpumask_var(&tr->tracing_cpumask, GFP_KERNEL))
 		goto out_free_tr;
@@ -8560,19 +8570,22 @@ static struct trace_array *trace_array_create(const char *name)
 	if (allocate_trace_buffers(tr, trace_buf_size) < 0)
 		goto out_free_tr;
 
-	tr->dir = tracefs_create_dir(name, trace_instance_dir);
-	if (!tr->dir)
-		goto out_free_tr;
+	if (name) {
+		tr->dir = tracefs_create_dir(name, trace_instance_dir);
+		if (!tr->dir)
+			goto out_free_tr;
 
-	ret = event_trace_add_tracer(tr->dir, tr);
-	if (ret) {
-		tracefs_remove(tr->dir);
-		goto out_free_tr;
+		ret = event_trace_add_tracer(tr->dir, tr);
+		if (ret) {
+			tracefs_remove(tr->dir);
+			goto out_free_tr;
+		}
+
+		init_tracer_tracefs(tr, tr->dir);
 	}
 
 	ftrace_init_trace_array(tr);
 
-	init_tracer_tracefs(tr, tr->dir);
 	init_trace_flags_index(tr);
 	__update_tracer_options(tr);
 
@@ -8580,7 +8593,6 @@ static struct trace_array *trace_array_create(const char *name)
 
 	tr->ref++;
 
-
 	return tr;
 
  out_free_tr:
@@ -8592,6 +8604,12 @@ static struct trace_array *trace_array_create(const char *name)
 	return ERR_PTR(ret);
 }
 
+struct trace_array *trace_array_create(void)
+{
+	return __trace_array_create(NULL);
+}
+EXPORT_SYMBOL_GPL(trace_array_create);
+
 static int instance_mkdir(const char *name)
 {
 	struct trace_array *tr;
@@ -8604,7 +8622,7 @@ static int instance_mkdir(const char *name)
 	if (trace_array_find(name))
 		goto out_unlock;
 
-	tr = trace_array_create(name);
+	tr = __trace_array_create(name);
 
 	ret = PTR_ERR_OR_ZERO(tr);
 
@@ -8642,7 +8660,7 @@ struct trace_array *trace_array_get_by_name(const char *name)
 			goto out_unlock;
 	}
 
-	tr = trace_array_create(name);
+	tr = __trace_array_create(name);
 
 	if (IS_ERR(tr))
 		tr = NULL;
@@ -8677,7 +8695,8 @@ static int __remove_instance(struct trace_array *tr)
 	event_trace_del_tracer(tr);
 	ftrace_clear_pids(tr);
 	ftrace_destroy_function_files(tr);
-	tracefs_remove(tr->dir);
+	if (tr->dir)
+		tracefs_remove(tr->dir);
 	free_trace_buffers(tr);
 
 	for (i = 0; i < tr->nr_topts; i++) {
@@ -9220,6 +9239,47 @@ void ftrace_dump(enum ftrace_dump_mode oops_dump_mode)
 }
 EXPORT_SYMBOL_GPL(ftrace_dump);
 
+int anon_trace_getfd(const char *name, struct trace_array *tr)
+{
+	struct trace_iterator *iter;
+	int ret;
+
+	if (!tr || trace_array_get(tr) < 0)
+		return -ENODEV;
+
+	mutex_lock(&trace_types_lock);
+
+	iter = tracing_create_pipe_iter(tr, NULL);
+	if (IS_ERR(iter)) {
+		ret = PTR_ERR(iter);
+		__trace_array_put(tr);
+		goto out;
+	}
+
+	ret = anon_inode_getfd(name, &tracing_pipe_fops, iter, O_CLOEXEC);
+	if (ret < 0)
+		goto fail;
+
+	if (iter->trace->pipe_open)
+		iter->trace->pipe_open(iter);
+
+	tr->current_trace->ref++;
+out:
+	mutex_unlock(&trace_types_lock);
+	return ret;
+
+fail:
+	mutex_unlock(&trace_types_lock);
+
+	free_cpumask_var(iter->started);
+	mutex_destroy(&iter->mutex);
+	kfree(iter);
+
+	trace_array_put(tr);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(anon_trace_getfd);
+
 int trace_run_command(const char *buf, int (*createfn)(int, char **))
 {
 	char **argv;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
