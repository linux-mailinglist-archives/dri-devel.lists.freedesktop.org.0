Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D429FAF0092
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 18:50:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09FB810E5EE;
	Tue,  1 Jul 2025 16:50:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3103610E5E7;
 Tue,  1 Jul 2025 16:50:15 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 561Gns5R008170; Tue, 1 Jul 2025 22:19:54 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 561GnsWw008169;
 Tue, 1 Jul 2025 22:19:54 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, simona@ffwll.ch, tzimmermann@suse.de,
 tursulin@ursulin.net, phasta@kernel.org, dakr@kernel.org,
 linux-kernel@vger.kernel.org, Oded Gabbay <ogabbay@kernel.org>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v9 2/4] drm: add debugfs support on per client-id basis
Date: Tue,  1 Jul 2025 22:19:46 +0530
Message-Id: <20250701164948.8105-3-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701164948.8105-1-sunil.khatri@amd.com>
References: <20250701164948.8105-1-sunil.khatri@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

add support to add a directory for each client-id
with root at the dri level. Since the clients are
unique and not just related to one single drm device,
so it makes more sense to add all the client based
nodes with root as dri.

Also create a debugfs file which show the process
information for the client and create a symlink back
to the parent drm device from each client.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_debugfs.c | 81 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_file.c    |  9 ++++
 include/drm/drm_debugfs.h     | 11 +++++
 include/drm/drm_file.h        |  7 +++
 4 files changed, 108 insertions(+)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 1c0e43400475..2693f74fc891 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -304,6 +304,87 @@ void drm_debugfs_remove_root(void)
 	debugfs_remove(drm_debugfs_root);
 }
 
+static int drm_debugfs_proc_info_show(struct seq_file *m, void *unused)
+{
+	struct pid *pid;
+	struct task_struct *task;
+	struct drm_file *file = m->private;
+
+	if (!file)
+		return -EINVAL;
+
+	rcu_read_lock();
+	pid = rcu_dereference(file->pid);
+	task = pid_task(pid, PIDTYPE_TGID);
+
+	seq_printf(m, "pid: %d\n", task ? task->pid : 0);
+	seq_printf(m, "comm: %s\n", task ? task->comm : "Unset");
+	rcu_read_unlock();
+	return 0;
+}
+
+static int drm_debufs_proc_info_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, drm_debugfs_proc_info_show, inode->i_private);
+}
+
+static const struct file_operations drm_debugfs_proc_info_fops = {
+	.owner = THIS_MODULE,
+	.open = drm_debufs_proc_info_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = single_release,
+};
+
+/**
+ * drm_debugfs_clients_add - Add a per client debugfs directory
+ * @file: drm_file for a client
+ *
+ * Create the debugfs directory for each client. This will be used to populate
+ * driver specific data for each client.
+ *
+ * Also add the process information debugfs file for each client to tag
+ * which client belongs to which process.
+ */
+void drm_debugfs_clients_add(struct drm_file *file)
+{
+	char *client;
+
+	client = kasprintf(GFP_KERNEL, "client-%llu", file->client_id);
+	if (!client)
+		return;
+
+	/* Create a debugfs directory for the client in root on drm debugfs */
+	file->debugfs_client = debugfs_create_dir(client, drm_debugfs_root);
+	kfree(client);
+
+	debugfs_create_file("proc_info", 0444, file->debugfs_client, file,
+			    &drm_debugfs_proc_info_fops);
+
+	client = kasprintf(GFP_KERNEL, "../%s", file->minor->dev->unique);
+	if (!client)
+		return;
+
+	/* Create a link from client_id to the drm device this client id belongs to */
+	debugfs_create_symlink("device", file->debugfs_client, client);
+	kfree(client);
+}
+
+/**
+ * drm_debugfs_clients_remove - removes all debugfs directories and files
+ * @file: drm_file for a client
+ *
+ * Removes the debugfs directories recursively from the client directory.
+ *
+ * There is also a possibility that debugfs files are open while the drm_file
+ * is released.
+ */
+void drm_debugfs_clients_remove(struct drm_file *file)
+{
+	debugfs_remove_recursive(file->debugfs_client);
+	file->debugfs_client = NULL;
+}
+
 /**
  * drm_debugfs_dev_init - create debugfs directory for the device
  * @dev: the device which we want to create the directory for
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index dd351f601acd..95f31985cc4d 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -45,6 +45,7 @@
 #include <drm/drm_file.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_print.h>
+#include <drm/drm_debugfs.h>
 
 #include "drm_crtc_internal.h"
 #include "drm_internal.h"
@@ -167,6 +168,9 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
 
 	drm_prime_init_file_private(&file->prime);
 
+	if (!drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL))
+		drm_debugfs_clients_add(file);
+
 	if (dev->driver->open) {
 		ret = dev->driver->open(dev, file);
 		if (ret < 0)
@@ -181,6 +185,8 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
 		drm_syncobj_release(file);
 	if (drm_core_check_feature(dev, DRIVER_GEM))
 		drm_gem_release(dev, file);
+
+	drm_debugfs_clients_remove(file);
 	put_pid(rcu_access_pointer(file->pid));
 	kfree(file);
 
@@ -235,6 +241,9 @@ void drm_file_free(struct drm_file *file)
 		     (long)old_encode_dev(file->minor->kdev->devt),
 		     atomic_read(&dev->open_count));
 
+	if (!drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL))
+		drm_debugfs_clients_remove(file);
+
 	drm_events_release(file);
 
 	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
index cf06cee4343f..ea8cba94208a 100644
--- a/include/drm/drm_debugfs.h
+++ b/include/drm/drm_debugfs.h
@@ -153,6 +153,9 @@ void drm_debugfs_add_files(struct drm_device *dev,
 
 int drm_debugfs_gpuva_info(struct seq_file *m,
 			   struct drm_gpuvm *gpuvm);
+
+void drm_debugfs_clients_add(struct drm_file *file);
+void drm_debugfs_clients_remove(struct drm_file *file);
 #else
 static inline void drm_debugfs_create_files(const struct drm_info_list *files,
 					    int count, struct dentry *root,
@@ -181,6 +184,14 @@ static inline int drm_debugfs_gpuva_info(struct seq_file *m,
 {
 	return 0;
 }
+
+static inline void drm_debugfs_clients_add(struct drm_file *file)
+{
+}
+
+static inline void drm_debugfs_clients_remove(struct drm_file *file)
+{
+}
 #endif
 
 #endif /* _DRM_DEBUGFS_H_ */
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 5c3b2aa3e69d..eab7546aad79 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -400,6 +400,13 @@ struct drm_file {
 	 * @client_name_lock: Protects @client_name.
 	 */
 	struct mutex client_name_lock;
+
+	/**
+	 * @debugfs_client:
+	 *
+	 * debugfs directory for each client under a drm node.
+	 */
+	struct dentry *debugfs_client;
 };
 
 /**
-- 
2.34.1

