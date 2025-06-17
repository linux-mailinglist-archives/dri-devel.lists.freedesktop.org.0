Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0005DADC823
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 12:26:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF61210E5EB;
	Tue, 17 Jun 2025 10:26:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3045910E5E0;
 Tue, 17 Jun 2025 10:26:31 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 55HAQKkH2441150; Tue, 17 Jun 2025 15:56:20 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 55HAQKN72441149;
 Tue, 17 Jun 2025 15:56:20 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v3 2/4] drm: add debugfs support on per client-id basis
Date: Tue, 17 Jun 2025 15:56:17 +0530
Message-Id: <20250617102619.2441095-3-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250617102619.2441095-1-sunil.khatri@amd.com>
References: <20250617102619.2441095-1-sunil.khatri@amd.com>
MIME-Version: 1.0
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

Also create a symlink back to the parent drm device
from each client.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/drm_debugfs.c | 37 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_file.c    | 10 ++++++++++
 include/drm/drm_debugfs.h     | 12 ++++++++++++
 include/drm/drm_device.h      |  4 ++++
 include/drm/drm_file.h        |  7 +++++++
 5 files changed, 70 insertions(+)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 5a33ec299c04..37c85c5ec957 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -298,6 +298,43 @@ void drm_debugfs_remove_dir(void)
 	debugfs_remove(drm_debugfs_root);
 }
 
+int drm_debugfs_clients_add(struct drm_file *file)
+{
+	struct drm_device *dev;
+	char *dir_name, *drm_name, *symlink;
+
+	dev = file->minor->dev;
+
+	dir_name = kasprintf(GFP_KERNEL, "client-%llu", file->client_id);
+	if (!dir_name)
+		return -ENOMEM;
+
+	/* Create a debugfs directory for the client in root on drm debugfs */
+	file->debugfs_client = debugfs_create_dir(dir_name, drm_debugfs_root);
+	kfree(dir_name);
+
+	drm_name = kasprintf(GFP_KERNEL, "%d", file->minor->index);
+	if (!drm_name)
+		return -ENOMEM;
+
+	symlink = kasprintf(GFP_KERNEL, "%s", dev->unique);
+	if (!symlink)
+		return -ENOMEM;
+
+	/* Create a link from client_id to the drm device this client id belongs to */
+	debugfs_create_symlink(drm_name, file->debugfs_client, symlink);
+	kfree(drm_name);
+	kfree(symlink);
+
+	return 0;
+}
+
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
index 06ba6dcbf5ae..8502c5a630b1 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -39,12 +39,14 @@
 #include <linux/poll.h>
 #include <linux/slab.h>
 #include <linux/vga_switcheroo.h>
+#include <linux/debugfs.h>
 
 #include <drm/drm_client_event.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_print.h>
+#include <drm/drm_debugfs.h>
 
 #include "drm_crtc_internal.h"
 #include "drm_internal.h"
@@ -143,6 +145,13 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
 	rcu_assign_pointer(file->pid, get_pid(task_tgid(current)));
 	file->minor = minor;
 
+	ret = drm_debugfs_clients_add(file);
+	if (ret) {
+		put_pid(rcu_access_pointer(file->pid));
+		kfree(file);
+		return ERR_PTR(ret);
+	}
+
 	/* for compatibility root is always authenticated */
 	file->authenticated = capable(CAP_SYS_ADMIN);
 
@@ -236,6 +245,7 @@ void drm_file_free(struct drm_file *file)
 		     atomic_read(&dev->open_count));
 
 	drm_events_release(file);
+	drm_debugfs_clients_remove(file);
 
 	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
 		drm_fb_release(file);
diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
index cf06cee4343f..4bd6cc1d0900 100644
--- a/include/drm/drm_debugfs.h
+++ b/include/drm/drm_debugfs.h
@@ -153,6 +153,9 @@ void drm_debugfs_add_files(struct drm_device *dev,
 
 int drm_debugfs_gpuva_info(struct seq_file *m,
 			   struct drm_gpuvm *gpuvm);
+
+int drm_debugfs_clients_add(struct drm_file *file);
+void drm_debugfs_clients_remove(struct drm_file *file);
 #else
 static inline void drm_debugfs_create_files(const struct drm_info_list *files,
 					    int count, struct dentry *root,
@@ -181,6 +184,15 @@ static inline int drm_debugfs_gpuva_info(struct seq_file *m,
 {
 	return 0;
 }
+
+int drm_debugfs_clients_add(struct drm_file *file)
+{
+	return 0;
+}
+
+void drm_debugfs_clients_remove(struct drm_file *file)
+{
+}
 #endif
 
 #endif /* _DRM_DEBUGFS_H_ */
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index 6ea54a578cda..ec20b777b3cc 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -325,6 +325,10 @@ struct drm_device {
 	 * Root directory for debugfs files.
 	 */
 	struct dentry *debugfs_root;
+	/**
+	 * @drm_debugfs_root;
+	 */
+	struct dentry *drm_debugfs_root;
 };
 
 #endif
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

