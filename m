Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 584CF16EAA6
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 16:59:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 922EB6EB38;
	Tue, 25 Feb 2020 15:59:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7F636E210;
 Tue, 25 Feb 2020 15:59:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2A026ADBE;
 Tue, 25 Feb 2020 15:59:05 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, bskeggs@redhat.com, emil.velikov@collabora.com,
 alexander.deucher@amd.com, sam@ravnborg.org
Subject: [PATCH 3/3] drm: Constify struct drm_driver in DRM core
Date: Tue, 25 Feb 2020 16:59:02 +0100
Message-Id: <20200225155902.9751-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200225155902.9751-1-tzimmermann@suse.de>
References: <20200225155902.9751-1-tzimmermann@suse.de>
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
Cc: nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Once used for creatign a DRM device, instances of struct drm_driver
are not modified. So all related variables in the DRM core can be
declared 'const'.

In addition to the core interfaces, the patch also changes tdfx
accordingly. The other non-KMS drivers set.num_ioctls outside of
their instance's initialization, so they cannot have the instance
declared const yet.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_drv.c       |  8 ++++----
 drivers/gpu/drm/drm_pci.c       |  8 +++++---
 drivers/gpu/drm/tdfx/tdfx_drv.c |  2 +-
 include/drm/drm_device.h        |  2 +-
 include/drm/drm_drv.h           |  6 +++---
 include/drm/drm_legacy.h        | 10 ++++++----
 include/drm/drm_pci.h           |  4 ++--
 7 files changed, 22 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 4875b76e7656..98d1f4169e6c 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -612,7 +612,7 @@ static void drm_fs_inode_free(struct inode *inode)
  * 0 on success, or error code on failure.
  */
 int drm_dev_init(struct drm_device *dev,
-		 struct drm_driver *driver,
+		 const struct drm_driver *driver,
 		 struct device *parent)
 {
 	int ret;
@@ -726,7 +726,7 @@ static void devm_drm_dev_init_release(void *data)
  */
 int devm_drm_dev_init(struct device *parent,
 		      struct drm_device *dev,
-		      struct drm_driver *driver)
+		      const struct drm_driver *driver)
 {
 	int ret;
 
@@ -804,7 +804,7 @@ EXPORT_SYMBOL(drm_dev_fini);
  * RETURNS:
  * Pointer to new DRM device, or ERR_PTR on failure.
  */
-struct drm_device *drm_dev_alloc(struct drm_driver *driver,
+struct drm_device *drm_dev_alloc(const struct drm_driver *driver,
 				 struct device *parent)
 {
 	struct drm_device *dev;
@@ -947,7 +947,7 @@ static void remove_compat_control_link(struct drm_device *dev)
  */
 int drm_dev_register(struct drm_device *dev, unsigned long flags)
 {
-	struct drm_driver *driver = dev->driver;
+	const struct drm_driver *driver = dev->driver;
 	int ret;
 
 	if (drm_dev_needs_global_mutex(dev))
diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
index 24ed0e92fd66..f6b7b30f7c5e 100644
--- a/drivers/gpu/drm/drm_pci.c
+++ b/drivers/gpu/drm/drm_pci.c
@@ -207,7 +207,7 @@ void drm_pci_agp_destroy(struct drm_device *dev)
  * Return: 0 on success or a negative error code on failure.
  */
 int drm_get_pci_dev(struct pci_dev *pdev, const struct pci_device_id *ent,
-		    struct drm_driver *driver)
+		    const struct drm_driver *driver)
 {
 	struct drm_device *dev;
 	int ret;
@@ -264,7 +264,8 @@ EXPORT_SYMBOL(drm_get_pci_dev);
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int drm_legacy_pci_init(struct drm_driver *driver, struct pci_driver *pdriver)
+int drm_legacy_pci_init(const struct drm_driver *driver,
+			struct pci_driver *pdriver)
 {
 	struct pci_dev *pdev = NULL;
 	const struct pci_device_id *pid;
@@ -310,7 +311,8 @@ EXPORT_SYMBOL(drm_legacy_pci_init);
  * Unregister a DRM driver shadow-attached through drm_legacy_pci_init(). This
  * is deprecated and only used by dri1 drivers.
  */
-void drm_legacy_pci_exit(struct drm_driver *driver, struct pci_driver *pdriver)
+void drm_legacy_pci_exit(const struct drm_driver *driver,
+			 struct pci_driver *pdriver)
 {
 	struct drm_device *dev, *tmp;
 	DRM_DEBUG("\n");
diff --git a/drivers/gpu/drm/tdfx/tdfx_drv.c b/drivers/gpu/drm/tdfx/tdfx_drv.c
index a8a6bce6afbe..637c9352c1af 100644
--- a/drivers/gpu/drm/tdfx/tdfx_drv.c
+++ b/drivers/gpu/drm/tdfx/tdfx_drv.c
@@ -59,7 +59,7 @@ static const struct file_operations tdfx_driver_fops = {
 static struct drm_legacy_state tdfx_legacy_state = {
 };
 
-static struct drm_driver driver = {
+static const struct drm_driver driver = {
 	.driver_features = DRIVER_LEGACY,
 	.fops = &tdfx_driver_fops,
 	.name = DRIVER_NAME,
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index bb60a949f416..6b2e2799d83c 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -68,7 +68,7 @@ struct drm_device {
 	struct device *dev;
 
 	/** @driver: DRM driver managing the device */
-	struct drm_driver *driver;
+	const struct drm_driver *driver;
 
 	/**
 	 * @dev_private:
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 15dd9a179216..887728d28226 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -604,14 +604,14 @@ struct drm_driver {
 };
 
 int drm_dev_init(struct drm_device *dev,
-		 struct drm_driver *driver,
+		 const struct drm_driver *driver,
 		 struct device *parent);
 int devm_drm_dev_init(struct device *parent,
 		      struct drm_device *dev,
-		      struct drm_driver *driver);
+		      const struct drm_driver *driver);
 void drm_dev_fini(struct drm_device *dev);
 
-struct drm_device *drm_dev_alloc(struct drm_driver *driver,
+struct drm_device *drm_dev_alloc(const struct drm_driver *driver,
 				 struct device *parent);
 int drm_dev_register(struct drm_device *dev, unsigned long flags);
 void drm_dev_unregister(struct drm_device *dev);
diff --git a/include/drm/drm_legacy.h b/include/drm/drm_legacy.h
index 7b5ee6a94a8c..abc77cf84752 100644
--- a/include/drm/drm_legacy.h
+++ b/include/drm/drm_legacy.h
@@ -211,18 +211,20 @@ void drm_legacy_idlelock_release(struct drm_lock_data *lock);
 
 #ifdef CONFIG_PCI
 
-int drm_legacy_pci_init(struct drm_driver *driver, struct pci_driver *pdriver);
-void drm_legacy_pci_exit(struct drm_driver *driver, struct pci_driver *pdriver);
+int drm_legacy_pci_init(const struct drm_driver *driver,
+			struct pci_driver *pdriver);
+void drm_legacy_pci_exit(const struct drm_driver *driver,
+			 struct pci_driver *pdriver);
 
 #else
 
-static inline int drm_legacy_pci_init(struct drm_driver *driver,
+static inline int drm_legacy_pci_init(const struct drm_driver *driver,
 				      struct pci_driver *pdriver)
 {
 	return -EINVAL;
 }
 
-static inline void drm_legacy_pci_exit(struct drm_driver *driver,
+static inline void drm_legacy_pci_exit(const struct drm_driver *driver,
 				       struct pci_driver *pdriver)
 {
 }
diff --git a/include/drm/drm_pci.h b/include/drm/drm_pci.h
index 9031e217b506..8f98ae8384c2 100644
--- a/include/drm/drm_pci.h
+++ b/include/drm/drm_pci.h
@@ -47,7 +47,7 @@ void drm_pci_free(struct drm_device *dev, struct drm_dma_handle * dmah);
 
 int drm_get_pci_dev(struct pci_dev *pdev,
 		    const struct pci_device_id *ent,
-		    struct drm_driver *driver);
+		    const struct drm_driver *driver);
 
 #else
 
@@ -64,7 +64,7 @@ static inline void drm_pci_free(struct drm_device *dev,
 
 static inline int drm_get_pci_dev(struct pci_dev *pdev,
 				  const struct pci_device_id *ent,
-				  struct drm_driver *driver)
+				  const struct drm_driver *driver)
 {
 	return -ENOSYS;
 }
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
