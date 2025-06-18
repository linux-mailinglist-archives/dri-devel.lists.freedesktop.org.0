Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AC2ADEE50
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 15:48:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 787BE10E840;
	Wed, 18 Jun 2025 13:48:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A831910E83E;
 Wed, 18 Jun 2025 13:48:24 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 55IDlt693893203; Wed, 18 Jun 2025 19:17:55 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 55IDlrLT3893190;
 Wed, 18 Jun 2025 19:17:53 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, simona@ffwll.ch, tzimmermann@suse.de,
 tursulin@ursulin.net, phasta@kernel.org, dakr@kernel.org,
 Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v4 1/4] drm: move debugfs functionality from drm_drv.c to
 drm_debugfs.c
Date: Wed, 18 Jun 2025 19:17:44 +0530
Message-Id: <20250618134747.3893138-1-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
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

move the functions from drm_drv.c which uses the static
drm_debugfs_root as parent node in the debugfs by drm.

move this root node to the debugfs for easily handling
of future requirements to add more information in the
root directory and one of which is planned to have
directories for each client in the root directory
which is dri.

Suggested-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/drm_debugfs.c  | 22 ++++++++++++++++++----
 drivers/gpu/drm/drm_drv.c      | 11 ++++-------
 drivers/gpu/drm/drm_internal.h |  6 ++----
 include/drm/drm_drv.h          | 10 ++++++++++
 4 files changed, 34 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 2d43bda82887..5a33ec299c04 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -44,6 +44,8 @@
 #include "drm_crtc_internal.h"
 #include "drm_internal.h"
 
+static struct dentry *drm_debugfs_root;
+
 /***************************************************
  * Initialization, etc.
  **************************************************/
@@ -286,6 +288,16 @@ int drm_debugfs_remove_files(const struct drm_info_list *files, int count,
 }
 EXPORT_SYMBOL(drm_debugfs_remove_files);
 
+void drm_debugfs_create_dir(void)
+{
+	drm_debugfs_root = debugfs_create_dir("dri", NULL);
+}
+
+void drm_debugfs_remove_dir(void)
+{
+	debugfs_remove(drm_debugfs_root);
+}
+
 /**
  * drm_debugfs_dev_init - create debugfs directory for the device
  * @dev: the device which we want to create the directory for
@@ -295,7 +307,10 @@ EXPORT_SYMBOL(drm_debugfs_remove_files);
  */
 void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root)
 {
-	dev->debugfs_root = debugfs_create_dir(dev->unique, root);
+	if (!root)
+		dev->debugfs_root = debugfs_create_dir(dev->unique, drm_debugfs_root);
+	else
+		dev->debugfs_root = debugfs_create_dir(dev->unique, root);
 }
 
 /**
@@ -322,14 +337,13 @@ void drm_debugfs_dev_register(struct drm_device *dev)
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
index 17fc5dc708f4..8abc52eac8f3 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -69,8 +69,6 @@ DEFINE_XARRAY_ALLOC(drm_minors_xa);
  */
 static bool drm_core_init_complete;
 
-static struct dentry *drm_debugfs_root;
-
 DEFINE_STATIC_SRCU(drm_unplug_srcu);
 
 /*
@@ -183,8 +181,7 @@ static int drm_minor_register(struct drm_device *dev, enum drm_minor_type type)
 		return 0;
 
 	if (minor->type != DRM_MINOR_ACCEL) {
-		ret = drm_debugfs_register(minor, minor->index,
-					   drm_debugfs_root);
+		ret = drm_debugfs_register(minor, minor->index);
 		if (ret) {
 			DRM_ERROR("DRM: Failed to initialize /sys/kernel/debug/dri.\n");
 			goto err_debugfs;
@@ -754,7 +751,7 @@ static int drm_dev_init(struct drm_device *dev,
 	if (drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL))
 		accel_debugfs_init(dev);
 	else
-		drm_debugfs_dev_init(dev, drm_debugfs_root);
+		drm_debugfs_dev_init(dev, NULL);
 
 	return 0;
 
@@ -1168,7 +1165,7 @@ static void drm_core_exit(void)
 	drm_panic_exit();
 	accel_core_exit();
 	unregister_chrdev(DRM_MAJOR, "drm");
-	debugfs_remove(drm_debugfs_root);
+	drm_debugfs_remove_dir();
 	drm_sysfs_destroy();
 	WARN_ON(!xa_empty(&drm_minors_xa));
 	drm_connector_ida_destroy();
@@ -1187,7 +1184,7 @@ static int __init drm_core_init(void)
 		goto error;
 	}
 
-	drm_debugfs_root = debugfs_create_dir("dri", NULL);
+	drm_debugfs_create_dir();
 
 	ret = register_chrdev(DRM_MAJOR, "drm", &drm_stub_fops);
 	if (ret < 0)
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
index a43d707b5f36..4e77a0c4a7f9 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -567,10 +567,20 @@ static inline bool drm_firmware_drivers_only(void)
 
 #if defined(CONFIG_DEBUG_FS)
 void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root);
+void drm_debugfs_create_dir(void);
+void drm_debugfs_remove_dir(void);
 #else
 static inline void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root)
 {
 }
+
+static inline void drm_debugfs_create_dir(void)
+{
+}
+
+static inline void drm_debugfs_remove_dir(void)
+{
+}
 #endif
 
 #endif
-- 
2.34.1

