Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46483AEE0E9
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 16:36:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9972710E46D;
	Mon, 30 Jun 2025 14:36:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7F4C10E468;
 Mon, 30 Jun 2025 14:36:36 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 55UEaGw52520158; Mon, 30 Jun 2025 20:06:17 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 55UEaG4E2520157;
 Mon, 30 Jun 2025 20:06:16 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, simona@ffwll.ch, tzimmermann@suse.de,
 tursulin@ursulin.net, phasta@kernel.org, dakr@kernel.org,
 Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v7 2/5] drm: move debugfs functionality from drm_drv.c to
 drm_debugfs.c
Date: Mon, 30 Jun 2025 20:06:10 +0530
Message-Id: <20250630143613.2520111-2-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250630143613.2520111-1-sunil.khatri@amd.com>
References: <20250630143613.2520111-1-sunil.khatri@amd.com>
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

move the debugfs functions from drm_drv.c to drm_debugfs.c

move this root node to the debugfs for easily handling
of future requirements to add more information in the
root directory and one of which is planned to have
directories for each client in the root directory
which is dri.

Suggested-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/drm_debugfs.c  | 28 ++++++++++++++++++++++------
 drivers/gpu/drm/drm_drv.c      | 18 ++++--------------
 drivers/gpu/drm/drm_internal.h |  6 ++----
 include/drm/drm_drv.h          | 14 ++++++++++++--
 4 files changed, 40 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 2d43bda82887..8aad5a4da279 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -44,6 +44,9 @@
 #include "drm_crtc_internal.h"
 #include "drm_internal.h"
 
+static struct dentry *accel_debugfs_root;
+static struct dentry *drm_debugfs_root;
+
 /***************************************************
  * Initialization, etc.
  **************************************************/
@@ -286,16 +289,30 @@ int drm_debugfs_remove_files(const struct drm_info_list *files, int count,
 }
 EXPORT_SYMBOL(drm_debugfs_remove_files);
 
+void drm_debugfs_init_root(void)
+{
+	drm_debugfs_root = debugfs_create_dir("dri", NULL);
+	accel_debugfs_root = debugfs_create_dir("accel", NULL);
+}
+
+void drm_debugfs_remove_root(void)
+{
+	debugfs_remove(accel_debugfs_root);
+	debugfs_remove(drm_debugfs_root);
+}
+
 /**
  * drm_debugfs_dev_init - create debugfs directory for the device
  * @dev: the device which we want to create the directory for
- * @root: the parent directory depending on the device type
  *
  * Creates the debugfs directory for the device under the given root directory.
  */
-void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root)
+void drm_debugfs_dev_init(struct drm_device *dev)
 {
-	dev->debugfs_root = debugfs_create_dir(dev->unique, root);
+	if (drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL))
+		dev->debugfs_root = debugfs_create_dir(dev->unique, accel_debugfs_root);
+	else
+		dev->debugfs_root = debugfs_create_dir(dev->unique, drm_debugfs_root);
 }
 
 /**
@@ -322,14 +339,13 @@ void drm_debugfs_dev_register(struct drm_device *dev)
 		drm_atomic_debugfs_init(dev);
 }
 
-int drm_debugfs_register(struct drm_minor *minor, int minor_id,
-			 struct dentry *root)
+int drm_debugfs_register(struct drm_minor *minor, int minor_id)
 {
 	struct drm_device *dev = minor->dev;
 	char name[64];
 
 	sprintf(name, "%d", minor_id);
-	minor->debugfs_symlink = debugfs_create_symlink(name, root,
+	minor->debugfs_symlink = debugfs_create_symlink(name, drm_debugfs_root,
 							dev->unique);
 
 	/* TODO: Only for compatibility with drivers */
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 5d57b622f9aa..b9b5c9f953af 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -69,9 +69,6 @@ DEFINE_XARRAY_ALLOC(drm_minors_xa);
  */
 static bool drm_core_init_complete;
 
-static struct dentry *drm_debugfs_root;
-static struct dentry *accel_debugfs_root;
-
 DEFINE_STATIC_SRCU(drm_unplug_srcu);
 
 /*
@@ -184,8 +181,7 @@ static int drm_minor_register(struct drm_device *dev, enum drm_minor_type type)
 		return 0;
 
 	if (minor->type != DRM_MINOR_ACCEL) {
-		ret = drm_debugfs_register(minor, minor->index,
-					   drm_debugfs_root);
+		ret = drm_debugfs_register(minor, minor->index);
 		if (ret) {
 			DRM_ERROR("DRM: Failed to initialize /sys/kernel/debug/dri.\n");
 			goto err_debugfs;
@@ -752,10 +748,7 @@ static int drm_dev_init(struct drm_device *dev,
 		goto err;
 	}
 
-	if (drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL))
-		drm_debugfs_dev_init(dev, accel_debugfs_root);
-	else
-		drm_debugfs_dev_init(dev, drm_debugfs_root);
+	drm_debugfs_dev_init(dev);
 
 	return 0;
 
@@ -1167,10 +1160,9 @@ static void drm_core_exit(void)
 {
 	drm_privacy_screen_lookup_exit();
 	drm_panic_exit();
-	debugfs_remove(accel_debugfs_root);
 	accel_core_exit();
 	unregister_chrdev(DRM_MAJOR, "drm");
-	debugfs_remove(drm_debugfs_root);
+	drm_debugfs_remove_root();
 	drm_sysfs_destroy();
 	WARN_ON(!xa_empty(&drm_minors_xa));
 	drm_connector_ida_destroy();
@@ -1189,14 +1181,12 @@ static int __init drm_core_init(void)
 		goto error;
 	}
 
-	drm_debugfs_root = debugfs_create_dir("dri", NULL);
+	drm_debugfs_init_root();
 
 	ret = register_chrdev(DRM_MAJOR, "drm", &drm_stub_fops);
 	if (ret < 0)
 		goto error;
 
-	accel_debugfs_root = debugfs_create_dir("accel", NULL);
-
 	ret = accel_core_init();
 	if (ret < 0)
 		goto error;
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index b2b6a8e49dda..d2d8e72f32d9 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -186,8 +186,7 @@ void drm_gem_vunmap(struct drm_gem_object *obj, struct iosys_map *map);
 #if defined(CONFIG_DEBUG_FS)
 void drm_debugfs_dev_fini(struct drm_device *dev);
 void drm_debugfs_dev_register(struct drm_device *dev);
-int drm_debugfs_register(struct drm_minor *minor, int minor_id,
-			 struct dentry *root);
+int drm_debugfs_register(struct drm_minor *minor, int minor_id);
 void drm_debugfs_unregister(struct drm_minor *minor);
 void drm_debugfs_connector_add(struct drm_connector *connector);
 void drm_debugfs_connector_remove(struct drm_connector *connector);
@@ -205,8 +204,7 @@ static inline void drm_debugfs_dev_register(struct drm_device *dev)
 {
 }
 
-static inline int drm_debugfs_register(struct drm_minor *minor, int minor_id,
-				       struct dentry *root)
+static inline int drm_debugfs_register(struct drm_minor *minor, int minor_id)
 {
 	return 0;
 }
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index a43d707b5f36..392baeaaa4a1 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -566,9 +566,19 @@ static inline bool drm_firmware_drivers_only(void)
 }
 
 #if defined(CONFIG_DEBUG_FS)
-void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root);
+void drm_debugfs_dev_init(struct drm_device *dev);
+void drm_debugfs_init_root(void);
+void drm_debugfs_remove_root(void);
 #else
-static inline void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root)
+static inline void drm_debugfs_dev_init(struct drm_device *dev)
+{
+}
+
+static inline void drm_debugfs_init_root(void)
+{
+}
+
+static inline void drm_debugfs_remove_root(void)
 {
 }
 #endif
-- 
2.34.1

