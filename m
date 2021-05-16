Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 572943820AD
	for <lists+dri-devel@lfdr.de>; Sun, 16 May 2021 21:51:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 852136E862;
	Sun, 16 May 2021 19:51:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D02B36E862
 for <dri-devel@lists.freedesktop.org>; Sun, 16 May 2021 19:51:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5BBBAAFE8;
 Sun, 16 May 2021 19:51:38 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH] drm: Mark IRQ_BUSID ioctl as legacy
Date: Sun, 16 May 2021 21:51:35 +0200
Message-Id: <20210516195135.3755-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.31.1
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The functionality is only implemented for legacy drivers. Mark the ioctl
as legacy and move the code behind CONFIG_DRM_LEGACY. If legacy drivers
are disabled, the ioctl call now returns -EINVAL instead of -EOPNOTSUPP.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_internal.h | 8 --------
 drivers/gpu/drm/drm_ioctl.c    | 3 ++-
 drivers/gpu/drm/drm_legacy.h   | 8 ++++++++
 drivers/gpu/drm/drm_pci.c      | 8 ++++----
 4 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index 1dcb5797a3bb..17f3548c8ed2 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -54,18 +54,10 @@ void drm_lastclose(struct drm_device *dev);
 #ifdef CONFIG_PCI
 
 /* drm_pci.c */
-int drm_legacy_irq_by_busid(struct drm_device *dev, void *data,
-			    struct drm_file *file_priv);
 int drm_pci_set_busid(struct drm_device *dev, struct drm_master *master);
 
 #else
 
-static inline int drm_legacy_irq_by_busid(struct drm_device *dev, void *data,
-					  struct drm_file *file_priv)
-{
-	return -EINVAL;
-}
-
 static inline int drm_pci_set_busid(struct drm_device *dev,
 				    struct drm_master *master)
 {
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index b0856c139693..53d314103a37 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -577,7 +577,8 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
 	DRM_IOCTL_DEF(DRM_IOCTL_VERSION, drm_version, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF(DRM_IOCTL_GET_UNIQUE, drm_getunique, 0),
 	DRM_IOCTL_DEF(DRM_IOCTL_GET_MAGIC, drm_getmagic, 0),
-	DRM_IOCTL_DEF(DRM_IOCTL_IRQ_BUSID, drm_legacy_irq_by_busid, DRM_MASTER|DRM_ROOT_ONLY),
+	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_IRQ_BUSID, drm_legacy_irq_by_busid,
+			     DRM_MASTER|DRM_ROOT_ONLY),
 
 	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_GET_MAP, drm_legacy_getmap_ioctl, 0),
 
diff --git a/drivers/gpu/drm/drm_legacy.h b/drivers/gpu/drm/drm_legacy.h
index 7080d2538421..c9206840c87f 100644
--- a/drivers/gpu/drm/drm_legacy.h
+++ b/drivers/gpu/drm/drm_legacy.h
@@ -235,9 +235,17 @@ void drm_master_legacy_init(struct drm_master *master);
 static inline void drm_master_legacy_init(struct drm_master *master) {}
 #endif
 
+/* drm_pci.c */
 #if IS_ENABLED(CONFIG_DRM_LEGACY) && IS_ENABLED(CONFIG_PCI)
+int drm_legacy_irq_by_busid(struct drm_device *dev, void *data, struct drm_file *file_priv);
 void drm_legacy_pci_agp_destroy(struct drm_device *dev);
 #else
+static inline int drm_legacy_irq_by_busid(struct drm_device *dev, void *data,
+					  struct drm_file *file_priv)
+{
+	return -EINVAL;
+}
+
 static inline void drm_legacy_pci_agp_destroy(struct drm_device *dev) {}
 #endif
 
diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
index f508f70e7a3f..39d35fc3a43b 100644
--- a/drivers/gpu/drm/drm_pci.c
+++ b/drivers/gpu/drm/drm_pci.c
@@ -72,7 +72,9 @@ int drm_pci_set_busid(struct drm_device *dev, struct drm_master *master)
 	return 0;
 }
 
-static int drm_pci_irq_by_busid(struct drm_device *dev, struct drm_irq_busid *p)
+#ifdef CONFIG_DRM_LEGACY
+
+static int drm_legacy_pci_irq_by_busid(struct drm_device *dev, struct drm_irq_busid *p)
 {
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 
@@ -115,11 +117,9 @@ int drm_legacy_irq_by_busid(struct drm_device *dev, void *data,
 	if (!drm_core_check_feature(dev, DRIVER_HAVE_IRQ))
 		return -EOPNOTSUPP;
 
-	return drm_pci_irq_by_busid(dev, p);
+	return drm_legacy_pci_irq_by_busid(dev, p);
 }
 
-#ifdef CONFIG_DRM_LEGACY
-
 void drm_legacy_pci_agp_destroy(struct drm_device *dev)
 {
 	if (dev->agp) {
-- 
2.31.1

