Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1C8168FBF
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2020 16:25:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE6A96E94E;
	Sat, 22 Feb 2020 15:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C7F6E94E
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 15:24:57 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1293CA2E;
 Sat, 22 Feb 2020 16:24:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582385095;
 bh=60iC11WiADIYnaVeZ6deQVO/doxpXku3OZgtlTWA+Ks=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RKpCoojcUYME+06NGP0lwv5A/xY1GTVtP1+LrcHikTban62WkeGZxO+z63cBVRybX
 gmtkxJvmkcGUn96e+TCnIMPCMcBoO7WjNKyWgJZHvKB7xjwb917UWwMzr7TokIrpqu
 hY0WjvKNAQu68r3cUKVtYr6HJJB4qQjwXZRAbWCc=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH/RFC 2/3] drm: Use a const drm_driver through the DRM core
Date: Sat, 22 Feb 2020 17:24:29 +0200
Message-Id: <20200222152430.2984-3-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200222152430.2984-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200222152430.2984-1-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_driver structure contains pointers to functions, which can be an
attack vector if an attacker can corrupt the structure. The DRM core
however never modifies the structure, so it could be declared as const
in drivers. Modify the DRM core to take const struct drm_driver
pointers in all APIs.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/drm_drv.c                | 10 +++++-----
 drivers/gpu/drm/drm_pci.c                |  8 +++++---
 drivers/gpu/drm/drm_vram_helper_common.c |  4 ++--
 include/drm/drm_device.h                 |  2 +-
 include/drm/drm_drv.h                    |  6 +++---
 include/drm/drm_legacy.h                 | 10 ++++++----
 include/drm/drm_pci.h                    |  4 ++--
 7 files changed, 24 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 7b1a628d1f6e..41654427d258 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -300,7 +300,7 @@ void drm_minor_release(struct drm_minor *minor)
  *		kfree(priv);
  *	}
  *
- *	static struct drm_driver driver_drm_driver = {
+ *	static const struct drm_driver driver_drm_driver = {
  *		[...]
  *		.release = driver_drm_release,
  *	};
@@ -612,7 +612,7 @@ static void drm_fs_inode_free(struct inode *inode)
  * 0 on success, or error code on failure.
  */
 int drm_dev_init(struct drm_device *dev,
-		 struct drm_driver *driver,
+		 const struct drm_driver *driver,
 		 struct device *parent)
 {
 	int ret;
@@ -722,7 +722,7 @@ static void devm_drm_dev_init_release(void *data)
  */
 int devm_drm_dev_init(struct device *parent,
 		      struct drm_device *dev,
-		      struct drm_driver *driver)
+		      const struct drm_driver *driver)
 {
 	int ret;
 
@@ -800,7 +800,7 @@ EXPORT_SYMBOL(drm_dev_fini);
  * RETURNS:
  * Pointer to new DRM device, or ERR_PTR on failure.
  */
-struct drm_device *drm_dev_alloc(struct drm_driver *driver,
+struct drm_device *drm_dev_alloc(const struct drm_driver *driver,
 				 struct device *parent)
 {
 	struct drm_device *dev;
@@ -943,7 +943,7 @@ static void remove_compat_control_link(struct drm_device *dev)
  */
 int drm_dev_register(struct drm_device *dev, unsigned long flags)
 {
-	struct drm_driver *driver = dev->driver;
+	const struct drm_driver *driver = dev->driver;
 	int ret;
 
 	if (drm_dev_needs_global_mutex(dev))
diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
index 44805ac3177c..2ca7adf270c6 100644
--- a/drivers/gpu/drm/drm_pci.c
+++ b/drivers/gpu/drm/drm_pci.c
@@ -215,7 +215,7 @@ void drm_pci_agp_destroy(struct drm_device *dev)
  * Return: 0 on success or a negative error code on failure.
  */
 int drm_get_pci_dev(struct pci_dev *pdev, const struct pci_device_id *ent,
-		    struct drm_driver *driver)
+		    const struct drm_driver *driver)
 {
 	struct drm_device *dev;
 	int ret;
@@ -274,7 +274,8 @@ EXPORT_SYMBOL(drm_get_pci_dev);
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int drm_legacy_pci_init(struct drm_driver *driver, struct pci_driver *pdriver)
+int drm_legacy_pci_init(const struct drm_driver *driver,
+			struct pci_driver *pdriver)
 {
 	struct pci_dev *pdev = NULL;
 	const struct pci_device_id *pid;
@@ -319,7 +320,8 @@ EXPORT_SYMBOL(drm_legacy_pci_init);
  * Unregister a DRM driver shadow-attached through drm_legacy_pci_init(). This
  * is deprecated and only used by dri1 drivers.
  */
-void drm_legacy_pci_exit(struct drm_driver *driver, struct pci_driver *pdriver)
+void drm_legacy_pci_exit(const struct drm_driver *driver,
+			 struct pci_driver *pdriver)
 {
 	struct drm_device *dev, *tmp;
 	DRM_DEBUG("\n");
diff --git a/drivers/gpu/drm/drm_vram_helper_common.c b/drivers/gpu/drm/drm_vram_helper_common.c
index 2000d9b33fd5..e93b04bbe2de 100644
--- a/drivers/gpu/drm/drm_vram_helper_common.c
+++ b/drivers/gpu/drm/drm_vram_helper_common.c
@@ -29,11 +29,11 @@
  *
  * .. code-block:: c
  *
- *	struct file_operations fops ={
+ *	const struct file_operations fops ={
  *		.owner = THIS_MODULE,
  *		DRM_VRAM_MM_FILE_OPERATION
  *	};
- *	struct drm_driver drv = {
+ *	const struct drm_driver drv = {
  *		.driver_feature = DRM_ ... ,
  *		.fops = &fops,
  *		DRM_GEM_VRAM_DRIVER
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index 215b3472c773..6ed5d84e5f5d 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -70,7 +70,7 @@ struct drm_device {
 	struct device *dev;
 
 	/** @driver: DRM driver managing the device */
-	struct drm_driver *driver;
+	const struct drm_driver *driver;
 
 	/**
 	 * @dev_private:
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 7dcf3b7bb5e6..02c9915a9244 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -613,14 +613,14 @@ struct drm_driver {
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
index dcef3598f49e..49f2fd963871 100644
--- a/include/drm/drm_legacy.h
+++ b/include/drm/drm_legacy.h
@@ -194,18 +194,20 @@ void drm_legacy_idlelock_release(struct drm_lock_data *lock);
 
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
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
