Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F393AEB35C
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 11:49:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DF7410E9B9;
	Fri, 27 Jun 2025 09:49:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D1E210E9BC;
 Fri, 27 Jun 2025 09:49:43 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 55R9nOLD913008; Fri, 27 Jun 2025 15:19:24 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 55R9nNXU911533;
 Fri, 27 Jun 2025 15:19:23 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, simona@ffwll.ch, tzimmermann@suse.de,
 tursulin@ursulin.net, phasta@kernel.org, dakr@kernel.org,
 Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v6 1/5] drm: move the debugfs accel driver code to drm layer
Date: Fri, 27 Jun 2025 15:19:17 +0530
Message-Id: <20250627094921.911009-1-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
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

Move the debugfs accel driver code to the drm layer
and it is an intermediate step to move all debugfs
related handling into drm_debugfs.c

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/accel/drm_accel.c | 16 ----------------
 drivers/gpu/drm/drm_drv.c |  6 +++++-
 include/drm/drm_accel.h   |  5 -----
 3 files changed, 5 insertions(+), 22 deletions(-)

diff --git a/drivers/accel/drm_accel.c b/drivers/accel/drm_accel.c
index aa826033b0ce..ca3357acd127 100644
--- a/drivers/accel/drm_accel.c
+++ b/drivers/accel/drm_accel.c
@@ -20,8 +20,6 @@
 
 DEFINE_XARRAY_ALLOC(accel_minors_xa);
 
-static struct dentry *accel_debugfs_root;
-
 static const struct device_type accel_sysfs_device_minor = {
 	.name = "accel_minor"
 };
@@ -73,17 +71,6 @@ static const struct drm_info_list accel_debugfs_list[] = {
 };
 #define ACCEL_DEBUGFS_ENTRIES ARRAY_SIZE(accel_debugfs_list)
 
-/**
- * accel_debugfs_init() - Initialize debugfs for device
- * @dev: Pointer to the device instance.
- *
- * This function creates a root directory for the device in debugfs.
- */
-void accel_debugfs_init(struct drm_device *dev)
-{
-	drm_debugfs_dev_init(dev, accel_debugfs_root);
-}
-
 /**
  * accel_debugfs_register() - Register debugfs for device
  * @dev: Pointer to the device instance.
@@ -194,7 +181,6 @@ static const struct file_operations accel_stub_fops = {
 void accel_core_exit(void)
 {
 	unregister_chrdev(ACCEL_MAJOR, "accel");
-	debugfs_remove(accel_debugfs_root);
 	accel_sysfs_destroy();
 	WARN_ON(!xa_empty(&accel_minors_xa));
 }
@@ -209,8 +195,6 @@ int __init accel_core_init(void)
 		goto error;
 	}
 
-	accel_debugfs_root = debugfs_create_dir("accel", NULL);
-
 	ret = register_chrdev(ACCEL_MAJOR, "accel", &accel_stub_fops);
 	if (ret < 0)
 		DRM_ERROR("Cannot register ACCEL major: %d\n", ret);
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 17fc5dc708f4..5d57b622f9aa 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -70,6 +70,7 @@ DEFINE_XARRAY_ALLOC(drm_minors_xa);
 static bool drm_core_init_complete;
 
 static struct dentry *drm_debugfs_root;
+static struct dentry *accel_debugfs_root;
 
 DEFINE_STATIC_SRCU(drm_unplug_srcu);
 
@@ -752,7 +753,7 @@ static int drm_dev_init(struct drm_device *dev,
 	}
 
 	if (drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL))
-		accel_debugfs_init(dev);
+		drm_debugfs_dev_init(dev, accel_debugfs_root);
 	else
 		drm_debugfs_dev_init(dev, drm_debugfs_root);
 
@@ -1166,6 +1167,7 @@ static void drm_core_exit(void)
 {
 	drm_privacy_screen_lookup_exit();
 	drm_panic_exit();
+	debugfs_remove(accel_debugfs_root);
 	accel_core_exit();
 	unregister_chrdev(DRM_MAJOR, "drm");
 	debugfs_remove(drm_debugfs_root);
@@ -1193,6 +1195,8 @@ static int __init drm_core_init(void)
 	if (ret < 0)
 		goto error;
 
+	accel_debugfs_root = debugfs_create_dir("accel", NULL);
+
 	ret = accel_core_init();
 	if (ret < 0)
 		goto error;
diff --git a/include/drm/drm_accel.h b/include/drm/drm_accel.h
index 038ccb02f9a3..20a665ec6f16 100644
--- a/include/drm/drm_accel.h
+++ b/include/drm/drm_accel.h
@@ -58,7 +58,6 @@ void accel_core_exit(void);
 int accel_core_init(void);
 void accel_set_device_instance_params(struct device *kdev, int index);
 int accel_open(struct inode *inode, struct file *filp);
-void accel_debugfs_init(struct drm_device *dev);
 void accel_debugfs_register(struct drm_device *dev);
 
 #else
@@ -77,10 +76,6 @@ static inline void accel_set_device_instance_params(struct device *kdev, int ind
 {
 }
 
-static inline void accel_debugfs_init(struct drm_device *dev)
-{
-}
-
 static inline void accel_debugfs_register(struct drm_device *dev)
 {
 }
-- 
2.34.1

