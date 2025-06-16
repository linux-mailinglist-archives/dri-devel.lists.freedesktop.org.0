Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C0DADACEC
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 12:05:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 896DA10E31D;
	Mon, 16 Jun 2025 10:05:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FDD610E308;
 Mon, 16 Jun 2025 10:05:11 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 55GA54DA1204204; Mon, 16 Jun 2025 15:35:04 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 55GA540J1204203;
 Mon, 16 Jun 2025 15:35:04 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v2 2/2] drm: add debugfs support on per client-id basis
Date: Mon, 16 Jun 2025 15:35:03 +0530
Message-Id: <20250616100503.1204166-3-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250616100503.1204166-1-sunil.khatri@amd.com>
References: <20250616100503.1204166-1-sunil.khatri@amd.com>
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
 drivers/gpu/drm/drm_debugfs.c |  1 +
 drivers/gpu/drm/drm_file.c    | 26 ++++++++++++++++++++++++++
 include/drm/drm_device.h      |  4 ++++
 include/drm/drm_file.h        |  7 +++++++
 4 files changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 2d43bda82887..b4956960ae76 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -296,6 +296,7 @@ EXPORT_SYMBOL(drm_debugfs_remove_files);
 void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root)
 {
 	dev->debugfs_root = debugfs_create_dir(dev->unique, root);
+	dev->drm_debugfs_root = root;
 }
 
 /**
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 06ba6dcbf5ae..32012e39dcb4 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -39,6 +39,7 @@
 #include <linux/poll.h>
 #include <linux/slab.h>
 #include <linux/vga_switcheroo.h>
+#include <linux/debugfs.h>
 
 #include <drm/drm_client_event.h>
 #include <drm/drm_drv.h>
@@ -133,6 +134,7 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
 	struct drm_device *dev = minor->dev;
 	struct drm_file *file;
 	int ret;
+	char *dir_name, *drm_name, *symlink;
 
 	file = kzalloc(sizeof(*file), GFP_KERNEL);
 	if (!file)
@@ -143,6 +145,27 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
 	rcu_assign_pointer(file->pid, get_pid(task_tgid(current)));
 	file->minor = minor;
 
+	dir_name = kasprintf(GFP_KERNEL, "client-%llu", file->client_id);
+	if (!dir_name)
+		return ERR_PTR(-ENOMEM);
+
+	/* Create a debugfs directory for the client in root on drm debugfs */
+	file->debugfs_client = debugfs_create_dir(dir_name, dev->drm_debugfs_root);
+	kfree(dir_name);
+
+	drm_name = kasprintf(GFP_KERNEL, "%d", minor->index);
+	if (!drm_name)
+		return ERR_PTR(-ENOMEM);
+
+	symlink = kasprintf(GFP_KERNEL, "../%d", minor->index);
+	if (!symlink)
+		return ERR_PTR(-ENOMEM);
+
+	/* Create a link from client_id to the drm device this client id belongs to */
+	debugfs_create_symlink(drm_name, file->debugfs_client, symlink);
+	kfree(drm_name);
+	kfree(symlink);
+
 	/* for compatibility root is always authenticated */
 	file->authenticated = capable(CAP_SYS_ADMIN);
 
@@ -237,6 +260,9 @@ void drm_file_free(struct drm_file *file)
 
 	drm_events_release(file);
 
+	debugfs_remove_recursive(file->debugfs_client);
+	file->debugfs_client = NULL;
+
 	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
 		drm_fb_release(file);
 		drm_property_destroy_user_blobs(dev, file);
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

