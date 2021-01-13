Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A422F52F8
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 20:03:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C68AC6E896;
	Wed, 13 Jan 2021 19:03:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-001.vmware.com (ex13-edg-ou-001.vmware.com
 [208.91.0.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E5EB6EBA8
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 19:03:43 +0000 (UTC)
Received: from sc9-mailhost1.vmware.com (10.113.161.71) by
 EX13-EDG-OU-001.vmware.com (10.113.208.155) with Microsoft SMTP Server id
 15.0.1156.6; Wed, 13 Jan 2021 11:03:35 -0800
Received: from vertex.vmware.com (unknown [10.21.245.145])
 by sc9-mailhost1.vmware.com (Postfix) with ESMTP id 3BF6C202F1;
 Wed, 13 Jan 2021 11:03:40 -0800 (PST)
From: Zack Rusin <zackr@vmware.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 2/8] drm/vmwgfx: Remove stealth mode
Date: Wed, 13 Jan 2021 14:03:32 -0500
Message-ID: <20210113190338.292507-3-zackr@vmware.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210113190338.292507-1-zackr@vmware.com>
References: <20210113190338.292507-1-zackr@vmware.com>
MIME-Version: 1.0
Received-SPF: None (EX13-EDG-OU-001.vmware.com: zackr@vmware.com does not
 designate permitted sender hosts)
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
Cc: Martin Krastev <krastevm@vmware.com>,
 Roland Scheidegger <sroland@vmware.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Before drm got helpers for removing conflicting pci framebuffer devices
we implemented something known as "stealth" mode which allowed vmwgfx
to run even if it couldn't reserve pci resources. We can just switch
to regular drm helpers instead of keeping the stealth mode alive as
it makes our code a lot cleaner.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
Reviewed-by: Roland Scheidegger <sroland@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 31 ++++++++++-------------------
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h |  5 -----
 2 files changed, 10 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 1f3d67582c87..99bbc25fce31 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -32,6 +32,7 @@
 #include <linux/mem_encrypt.h>
 
 #include <drm/drm_drv.h>
+#include <drm/drm_fb_helper.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_sysfs.h>
 #include <drm/ttm/ttm_bo_driver.h>
@@ -841,19 +842,9 @@ static int vmw_driver_load(struct drm_device *dev, unsigned long chipset)
 	dev->dev_private = dev_priv;
 
 	ret = pci_request_regions(pdev, "vmwgfx probe");
-	dev_priv->stealth = (ret != 0);
-	if (dev_priv->stealth) {
-		/**
-		 * Request at least the mmio PCI resource.
-		 */
-
-		DRM_INFO("It appears like vesafb is loaded. "
-			 "Ignore above error if any.\n");
-		ret = pci_request_region(pdev, 2, "vmwgfx stealth probe");
-		if (unlikely(ret != 0)) {
-			DRM_ERROR("Failed reserving the SVGA MMIO resource.\n");
-			goto out_no_device;
-		}
+	if (ret) {
+		DRM_ERROR("Failed reserving PCI regions.\n");
+		goto out_no_device;
 	}
 
 	if (dev_priv->capabilities & SVGA_CAP_IRQMASK) {
@@ -1002,10 +993,7 @@ static int vmw_driver_load(struct drm_device *dev, unsigned long chipset)
 	if (dev_priv->capabilities & SVGA_CAP_IRQMASK)
 		vmw_irq_uninstall(dev_priv->dev);
 out_no_irq:
-	if (dev_priv->stealth)
-		pci_release_region(pdev, 2);
-	else
-		pci_release_regions(pdev);
+	pci_release_regions(pdev);
 out_no_device:
 	ttm_object_device_release(&dev_priv->tdev);
 out_err4:
@@ -1054,10 +1042,7 @@ static void vmw_driver_unload(struct drm_device *dev)
 	vmw_fence_manager_takedown(dev_priv->fman);
 	if (dev_priv->capabilities & SVGA_CAP_IRQMASK)
 		vmw_irq_uninstall(dev_priv->dev);
-	if (dev_priv->stealth)
-		pci_release_region(pdev, 2);
-	else
-		pci_release_regions(pdev);
+	pci_release_regions(pdev);
 
 	ttm_object_device_release(&dev_priv->tdev);
 	memunmap(dev_priv->mmio_virt);
@@ -1511,6 +1496,10 @@ static int vmw_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	struct drm_device *dev;
 	int ret;
 
+	ret = drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, "svgadrmfb");
+	if (ret)
+		return ret;
+
 	ret = pci_enable_device(pdev);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index 5b9a28157dd3..5509f9b66bfd 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -590,11 +590,6 @@ struct vmw_private {
 	struct mutex cmdbuf_mutex;
 	struct mutex binding_mutex;
 
-	/**
-	 * Operating mode.
-	 */
-
-	bool stealth;
 	bool enable_fb;
 	spinlock_t svga_lock;
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
