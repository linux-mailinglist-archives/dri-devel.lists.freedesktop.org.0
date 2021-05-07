Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8F0376A31
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 20:57:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9BE46EDD7;
	Fri,  7 May 2021 18:57:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7220E6E0FD;
 Fri,  7 May 2021 18:57:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DAF67B1C9;
 Fri,  7 May 2021 18:57:12 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, alexander.deucher@amd.com, christian.koenig@amd.com
Subject: [PATCH 3/4] drm: Mark PCI AGP helpers as legacy
Date: Fri,  7 May 2021 20:57:08 +0200
Message-Id: <20210507185709.22797-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210507185709.22797-1-tzimmermann@suse.de>
References: <20210507185709.22797-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DRM's AGP helpers for PCI are only required by legacy drivers. Put them
behind CONFIG_DRM_LEGACY and add the _legacy_ infix.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_drv.c      |  4 +---
 drivers/gpu/drm/drm_internal.h |  5 -----
 drivers/gpu/drm/drm_legacy.h   |  6 ++++++
 drivers/gpu/drm/drm_pci.c      | 20 ++++++++++----------
 4 files changed, 17 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index c2f78dee9f2d..3d8d68a98b95 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -941,9 +941,7 @@ void drm_dev_unregister(struct drm_device *dev)
 	if (dev->driver->unload)
 		dev->driver->unload(dev);
 
-	if (dev->agp)
-		drm_pci_agp_destroy(dev);
-
+	drm_legacy_pci_agp_destroy(dev);
 	drm_legacy_rmmaps(dev);
 
 	remove_compat_control_link(dev);
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index 1265de2b9d90..1dcb5797a3bb 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -56,7 +56,6 @@ void drm_lastclose(struct drm_device *dev);
 /* drm_pci.c */
 int drm_legacy_irq_by_busid(struct drm_device *dev, void *data,
 			    struct drm_file *file_priv);
-void drm_pci_agp_destroy(struct drm_device *dev);
 int drm_pci_set_busid(struct drm_device *dev, struct drm_master *master);
 
 #else
@@ -67,10 +66,6 @@ static inline int drm_legacy_irq_by_busid(struct drm_device *dev, void *data,
 	return -EINVAL;
 }
 
-static inline void drm_pci_agp_destroy(struct drm_device *dev)
-{
-}
-
 static inline int drm_pci_set_busid(struct drm_device *dev,
 				    struct drm_master *master)
 {
diff --git a/drivers/gpu/drm/drm_legacy.h b/drivers/gpu/drm/drm_legacy.h
index f71358f9eac9..ae2d7d2a31c7 100644
--- a/drivers/gpu/drm/drm_legacy.h
+++ b/drivers/gpu/drm/drm_legacy.h
@@ -211,4 +211,10 @@ void drm_master_legacy_init(struct drm_master *master);
 static inline void drm_master_legacy_init(struct drm_master *master) {}
 #endif
 
+#if IS_ENABLED(CONFIG_DRM_LEGACY) && IS_ENABLED(CONFIG_PCI)
+void drm_legacy_pci_agp_destroy(struct drm_device *dev);
+#else
+static inline void drm_legacy_pci_agp_destroy(struct drm_device *dev) {}
+#endif
+
 #endif /* __DRM_LEGACY_H__ */
diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
index 03bd863ff0b2..6e9af8b40419 100644
--- a/drivers/gpu/drm/drm_pci.c
+++ b/drivers/gpu/drm/drm_pci.c
@@ -119,7 +119,9 @@ int drm_legacy_irq_by_busid(struct drm_device *dev, void *data,
 	return drm_pci_irq_by_busid(dev, p);
 }
 
-void drm_pci_agp_destroy(struct drm_device *dev)
+#ifdef CONFIG_DRM_LEGACY
+
+void drm_legacy_pci_agp_destroy(struct drm_device *dev)
 {
 	if (dev->agp) {
 		arch_phys_wc_del(dev->agp->agp_mtrr);
@@ -129,9 +131,7 @@ void drm_pci_agp_destroy(struct drm_device *dev)
 	}
 }
 
-#ifdef CONFIG_DRM_LEGACY
-
-static void drm_pci_agp_init(struct drm_device *dev)
+static void drm_legacy_pci_agp_init(struct drm_device *dev)
 {
 	if (drm_core_check_feature(dev, DRIVER_USE_AGP)) {
 		if (pci_find_capability(to_pci_dev(dev->dev), PCI_CAP_ID_AGP))
@@ -145,9 +145,9 @@ static void drm_pci_agp_init(struct drm_device *dev)
 	}
 }
 
-static int drm_get_pci_dev(struct pci_dev *pdev,
-			   const struct pci_device_id *ent,
-			   const struct drm_driver *driver)
+static int drm_legacy_get_pci_dev(struct pci_dev *pdev,
+				  const struct pci_device_id *ent,
+				  const struct drm_driver *driver)
 {
 	struct drm_device *dev;
 	int ret;
@@ -169,7 +169,7 @@ static int drm_get_pci_dev(struct pci_dev *pdev,
 	if (drm_core_check_feature(dev, DRIVER_MODESET))
 		pci_set_drvdata(pdev, dev);
 
-	drm_pci_agp_init(dev);
+	drm_legacy_pci_agp_init(dev);
 
 	ret = drm_dev_register(dev, ent->driver_data);
 	if (ret)
@@ -184,7 +184,7 @@ static int drm_get_pci_dev(struct pci_dev *pdev,
 	return 0;
 
 err_agp:
-	drm_pci_agp_destroy(dev);
+	drm_legacy_pci_agp_destroy(dev);
 	pci_disable_device(pdev);
 err_free:
 	drm_dev_put(dev);
@@ -231,7 +231,7 @@ int drm_legacy_pci_init(const struct drm_driver *driver,
 
 			/* stealth mode requires a manual probe */
 			pci_dev_get(pdev);
-			drm_get_pci_dev(pdev, pid, driver);
+			drm_legacy_get_pci_dev(pdev, pid, driver);
 		}
 	}
 	return 0;
-- 
2.31.1

