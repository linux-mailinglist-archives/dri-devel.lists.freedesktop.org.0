Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 548D62C24B0
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 12:39:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC176E4A6;
	Tue, 24 Nov 2020 11:38:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E3D6E34B;
 Tue, 24 Nov 2020 11:38:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BC685AE39;
 Tue, 24 Nov 2020 11:38:29 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH 14/15] drm/vmwgfx: Remove references to struct drm_device.pdev
Date: Tue, 24 Nov 2020 12:38:23 +0100
Message-Id: <20201124113824.19994-15-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201124113824.19994-1-tzimmermann@suse.de>
References: <20201124113824.19994-1-tzimmermann@suse.de>
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Roland Scheidegger <sroland@vmware.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, amd-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, spice-devel@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Using struct drm_device.pdev is deprecated. Convert vmwgfx to struct
drm_device.dev. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Roland Scheidegger <sroland@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c |  8 ++++----
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c    | 27 +++++++++++++-------------
 drivers/gpu/drm/vmwgfx/vmwgfx_fb.c     |  2 +-
 3 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c
index 9a9fe10d829b..83a8d34704ea 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c
@@ -1230,7 +1230,7 @@ int vmw_cmdbuf_set_pool_size(struct vmw_cmdbuf_man *man,
 
 	/* First, try to allocate a huge chunk of DMA memory */
 	size = PAGE_ALIGN(size);
-	man->map = dma_alloc_coherent(&dev_priv->dev->pdev->dev, size,
+	man->map = dma_alloc_coherent(dev_priv->dev->dev, size,
 				      &man->handle, GFP_KERNEL);
 	if (man->map) {
 		man->using_mob = false;
@@ -1313,7 +1313,7 @@ struct vmw_cmdbuf_man *vmw_cmdbuf_man_create(struct vmw_private *dev_priv)
 	man->num_contexts = (dev_priv->capabilities & SVGA_CAP_HP_CMD_QUEUE) ?
 		2 : 1;
 	man->headers = dma_pool_create("vmwgfx cmdbuf",
-				       &dev_priv->dev->pdev->dev,
+				       dev_priv->dev->dev,
 				       sizeof(SVGACBHeader),
 				       64, PAGE_SIZE);
 	if (!man->headers) {
@@ -1322,7 +1322,7 @@ struct vmw_cmdbuf_man *vmw_cmdbuf_man_create(struct vmw_private *dev_priv)
 	}
 
 	man->dheaders = dma_pool_create("vmwgfx inline cmdbuf",
-					&dev_priv->dev->pdev->dev,
+					dev_priv->dev->dev,
 					sizeof(struct vmw_cmdbuf_dheader),
 					64, PAGE_SIZE);
 	if (!man->dheaders) {
@@ -1387,7 +1387,7 @@ void vmw_cmdbuf_remove_pool(struct vmw_cmdbuf_man *man)
 		ttm_bo_put(man->cmd_space);
 		man->cmd_space = NULL;
 	} else {
-		dma_free_coherent(&man->dev_priv->dev->pdev->dev,
+		dma_free_coherent(man->dev_priv->dev->dev,
 				  man->size, man->map, man->handle);
 	}
 }
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 216daf93022c..e63e08f5b14f 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -652,6 +652,7 @@ static int vmw_driver_load(struct drm_device *dev, unsigned long chipset)
 	enum vmw_res_type i;
 	bool refuse_dma = false;
 	char host_log[100] = {0};
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
 
 	dev_priv = kzalloc(sizeof(*dev_priv), GFP_KERNEL);
 	if (unlikely(!dev_priv)) {
@@ -659,7 +660,7 @@ static int vmw_driver_load(struct drm_device *dev, unsigned long chipset)
 		return -ENOMEM;
 	}
 
-	pci_set_master(dev->pdev);
+	pci_set_master(pdev);
 
 	dev_priv->dev = dev;
 	dev_priv->vmw_chipset = chipset;
@@ -688,9 +689,9 @@ static int vmw_driver_load(struct drm_device *dev, unsigned long chipset)
 
 	dev_priv->used_memory_size = 0;
 
-	dev_priv->io_start = pci_resource_start(dev->pdev, 0);
-	dev_priv->vram_start = pci_resource_start(dev->pdev, 1);
-	dev_priv->mmio_start = pci_resource_start(dev->pdev, 2);
+	dev_priv->io_start = pci_resource_start(pdev, 0);
+	dev_priv->vram_start = pci_resource_start(pdev, 1);
+	dev_priv->mmio_start = pci_resource_start(pdev, 2);
 
 	dev_priv->assume_16bpp = !!vmw_assume_16bpp;
 
@@ -840,7 +841,7 @@ static int vmw_driver_load(struct drm_device *dev, unsigned long chipset)
 
 	dev->dev_private = dev_priv;
 
-	ret = pci_request_regions(dev->pdev, "vmwgfx probe");
+	ret = pci_request_regions(pdev, "vmwgfx probe");
 	dev_priv->stealth = (ret != 0);
 	if (dev_priv->stealth) {
 		/**
@@ -849,7 +850,7 @@ static int vmw_driver_load(struct drm_device *dev, unsigned long chipset)
 
 		DRM_INFO("It appears like vesafb is loaded. "
 			 "Ignore above error if any.\n");
-		ret = pci_request_region(dev->pdev, 2, "vmwgfx stealth probe");
+		ret = pci_request_region(pdev, 2, "vmwgfx stealth probe");
 		if (unlikely(ret != 0)) {
 			DRM_ERROR("Failed reserving the SVGA MMIO resource.\n");
 			goto out_no_device;
@@ -857,7 +858,7 @@ static int vmw_driver_load(struct drm_device *dev, unsigned long chipset)
 	}
 
 	if (dev_priv->capabilities & SVGA_CAP_IRQMASK) {
-		ret = vmw_irq_install(dev, dev->pdev->irq);
+		ret = vmw_irq_install(dev, pdev->irq);
 		if (ret != 0) {
 			DRM_ERROR("Failed installing irq: %d\n", ret);
 			goto out_no_irq;
@@ -1003,9 +1004,9 @@ static int vmw_driver_load(struct drm_device *dev, unsigned long chipset)
 		vmw_irq_uninstall(dev_priv->dev);
 out_no_irq:
 	if (dev_priv->stealth)
-		pci_release_region(dev->pdev, 2);
+		pci_release_region(pdev, 2);
 	else
-		pci_release_regions(dev->pdev);
+		pci_release_regions(pdev);
 out_no_device:
 	ttm_object_device_release(&dev_priv->tdev);
 out_err4:
@@ -1023,6 +1024,7 @@ static int vmw_driver_load(struct drm_device *dev, unsigned long chipset)
 static void vmw_driver_unload(struct drm_device *dev)
 {
 	struct vmw_private *dev_priv = vmw_priv(dev);
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	enum vmw_res_type i;
 
 	unregister_pm_notifier(&dev_priv->pm_nb);
@@ -1054,9 +1056,9 @@ static void vmw_driver_unload(struct drm_device *dev)
 	if (dev_priv->capabilities & SVGA_CAP_IRQMASK)
 		vmw_irq_uninstall(dev_priv->dev);
 	if (dev_priv->stealth)
-		pci_release_region(dev->pdev, 2);
+		pci_release_region(pdev, 2);
 	else
-		pci_release_regions(dev->pdev);
+		pci_release_regions(pdev);
 
 	ttm_object_device_release(&dev_priv->tdev);
 	memunmap(dev_priv->mmio_virt);
@@ -1409,7 +1411,7 @@ static int vmw_pm_freeze(struct device *kdev)
 
 	vmw_fence_fifo_down(dev_priv->fman);
 	__vmw_svga_disable(dev_priv);
-	
+
 	vmw_release_device_late(dev_priv);
 	return 0;
 }
@@ -1520,7 +1522,6 @@ static int vmw_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		goto err_pci_disable_device;
 	}
 
-	dev->pdev = pdev;
 	pci_set_drvdata(pdev, dev);
 
 	ret = vmw_driver_load(dev, ent->driver_data);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c
index 4d60201037d1..a244b6c3e5a1 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c
@@ -638,7 +638,7 @@ static const struct fb_ops vmw_fb_ops = {
 
 int vmw_fb_init(struct vmw_private *vmw_priv)
 {
-	struct device *device = &vmw_priv->dev->pdev->dev;
+	struct device *device = vmw_priv->dev->dev;
 	struct vmw_fb_par *par;
 	struct fb_info *info;
 	unsigned fb_width, fb_height;
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
