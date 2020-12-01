Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4062CAD62
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 21:33:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2731F6E8E6;
	Tue,  1 Dec 2020 20:33:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-001.vmware.com (ex13-edg-ou-001.vmware.com
 [208.91.0.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52D356E8E6
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 20:33:37 +0000 (UTC)
Received: from sc9-mailhost3.vmware.com (10.113.161.73) by
 EX13-EDG-OU-001.vmware.com (10.113.208.155) with Microsoft SMTP Server id
 15.0.1156.6; Tue, 1 Dec 2020 12:18:27 -0800
Received: from vertex.vmware.com (unknown [10.21.244.133])
 by sc9-mailhost3.vmware.com (Postfix) with ESMTP id 8065520ABB;
 Tue,  1 Dec 2020 12:18:29 -0800 (PST)
From: Zack Rusin <zackr@vmware.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/8] drm/vmwgfx: Remove stealth mode
Date: Tue, 1 Dec 2020 15:18:22 -0500
Message-ID: <20201201201828.808888-2-zackr@vmware.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201201201828.808888-1-zackr@vmware.com>
References: <20201201201828.808888-1-zackr@vmware.com>
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
index 31e3e5c9f362..0a3a2b6e4bf9 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -32,6 +32,7 @@
 #include <linux/mem_encrypt.h>
 
 #include <drm/drm_drv.h>
+#include <drm/drm_fb_helper.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_sysfs.h>
 #include <drm/ttm/ttm_bo_driver.h>
@@ -840,19 +841,9 @@ static int vmw_driver_load(struct drm_device *dev, unsigned long chipset)
 	dev->dev_private = dev_priv;
 
 	ret = pci_request_regions(dev->pdev, "vmwgfx probe");
-	dev_priv->stealth = (ret != 0);
-	if (dev_priv->stealth) {
-		/**
-		 * Request at least the mmio PCI resource.
-		 */
-
-		DRM_INFO("It appears like vesafb is loaded. "
-			 "Ignore above error if any.\n");
-		ret = pci_request_region(dev->pdev, 2, "vmwgfx stealth probe");
-		if (unlikely(ret != 0)) {
-			DRM_ERROR("Failed reserving the SVGA MMIO resource.\n");
-			goto out_no_device;
-		}
+	if (ret) {
+		DRM_ERROR("Failed reserving PCI regions.\n");
+		goto out_no_device;
 	}
 
 	if (dev_priv->capabilities & SVGA_CAP_IRQMASK) {
@@ -1000,10 +991,7 @@ static int vmw_driver_load(struct drm_device *dev, unsigned long chipset)
 	if (dev_priv->capabilities & SVGA_CAP_IRQMASK)
 		vmw_irq_uninstall(dev_priv->dev);
 out_no_irq:
-	if (dev_priv->stealth)
-		pci_release_region(dev->pdev, 2);
-	else
-		pci_release_regions(dev->pdev);
+	pci_release_regions(dev->pdev);
 out_no_device:
 	ttm_object_device_release(&dev_priv->tdev);
 out_err4:
@@ -1051,10 +1039,7 @@ static void vmw_driver_unload(struct drm_device *dev)
 	vmw_fence_manager_takedown(dev_priv->fman);
 	if (dev_priv->capabilities & SVGA_CAP_IRQMASK)
 		vmw_irq_uninstall(dev_priv->dev);
-	if (dev_priv->stealth)
-		pci_release_region(dev->pdev, 2);
-	else
-		pci_release_regions(dev->pdev);
+	pci_release_regions(dev->pdev);
 
 	ttm_object_device_release(&dev_priv->tdev);
 	memunmap(dev_priv->mmio_virt);
@@ -1504,6 +1489,10 @@ static int vmw_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
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
index 1523b51a7284..db3dc9f40dcb 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -593,11 +593,6 @@ struct vmw_private {
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
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
