Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0B92CB2A9
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 03:13:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB99D6E834;
	Wed,  2 Dec 2020 02:13:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-002.vmware.com (ex13-edg-ou-002.vmware.com
 [208.91.0.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 305C06E834
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Dec 2020 02:13:03 +0000 (UTC)
Received: from sc9-mailhost3.vmware.com (10.113.161.73) by
 EX13-EDG-OU-002.vmware.com (10.113.208.156) with Microsoft SMTP Server id
 15.0.1156.6; Tue, 1 Dec 2020 18:12:59 -0800
Received: from vertex.vmware.com (unknown [10.21.244.133])
 by sc9-mailhost3.vmware.com (Postfix) with ESMTP id 5066720309;
 Tue,  1 Dec 2020 18:13:00 -0800 (PST)
From: Zack Rusin <zackr@vmware.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 3/8] drm/vmwgfx: Switch to a managed drm device
Date: Tue, 1 Dec 2020 21:12:59 -0500
Message-ID: <20201202021259.818917-1-zackr@vmware.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Received-SPF: None (EX13-EDG-OU-002.vmware.com: zackr@vmware.com does not
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

To cleanup some of the error handling and prepare for some
other work lets switch to a managed drm device. It will
let us get a better handle on some of the error paths.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
Reviewed-by: Roland Scheidegger <sroland@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c     |  8 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c        | 85 +++++++++-------------
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h        |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fb.c         | 10 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c      |  4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c        | 36 ++++-----
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c        |  4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c       |  4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c       |  4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 10 +--
 10 files changed, 75 insertions(+), 92 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c
index 3b41cf63110a..3cbc8f6f083f 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c
@@ -1230,7 +1230,7 @@ int vmw_cmdbuf_set_pool_size(struct vmw_cmdbuf_man *man,
 
 	/* First, try to allocate a huge chunk of DMA memory */
 	size = PAGE_ALIGN(size);
-	man->map = dma_alloc_coherent(&dev_priv->dev->pdev->dev, size,
+	man->map = dma_alloc_coherent(&dev_priv->drm.pdev->dev, size,
 				      &man->handle, GFP_KERNEL);
 	if (man->map) {
 		man->using_mob = false;
@@ -1313,7 +1313,7 @@ struct vmw_cmdbuf_man *vmw_cmdbuf_man_create(struct vmw_private *dev_priv)
 	man->num_contexts = (dev_priv->capabilities & SVGA_CAP_HP_CMD_QUEUE) ?
 		2 : 1;
 	man->headers = dma_pool_create("vmwgfx cmdbuf",
-				       &dev_priv->dev->pdev->dev,
+				       &dev_priv->drm.pdev->dev,
 				       sizeof(SVGACBHeader),
 				       64, PAGE_SIZE);
 	if (!man->headers) {
@@ -1322,7 +1322,7 @@ struct vmw_cmdbuf_man *vmw_cmdbuf_man_create(struct vmw_private *dev_priv)
 	}
 
 	man->dheaders = dma_pool_create("vmwgfx inline cmdbuf",
-					&dev_priv->dev->pdev->dev,
+					&dev_priv->drm.pdev->dev,
 					sizeof(struct vmw_cmdbuf_dheader),
 					64, PAGE_SIZE);
 	if (!man->dheaders) {
@@ -1387,7 +1387,7 @@ void vmw_cmdbuf_remove_pool(struct vmw_cmdbuf_man *man)
 		ttm_bo_put(man->cmd_space);
 		man->cmd_space = NULL;
 	} else {
-		dma_free_coherent(&man->dev_priv->dev->pdev->dev,
+		dma_free_coherent(&man->dev_priv->drm.pdev->dev,
 				  man->size, man->map, man->handle);
 	}
 }
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 0a3a2b6e4bf9..a6cc386ae680 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -608,7 +608,7 @@ static int vmw_dma_select_mode(struct vmw_private *dev_priv)
  */
 static int vmw_dma_masks(struct vmw_private *dev_priv)
 {
-	struct drm_device *dev = dev_priv->dev;
+	struct drm_device *dev = &dev_priv->drm;
 	int ret = 0;
 
 	ret = dma_set_mask_and_coherent(dev->dev, DMA_BIT_MASK(64));
@@ -643,24 +643,16 @@ static void vmw_vram_manager_fini(struct vmw_private *dev_priv)
 #endif
 }
 
-static int vmw_driver_load(struct drm_device *dev, unsigned long chipset)
+static int vmw_driver_load(struct vmw_private *dev_priv, unsigned long chipset)
 {
-	struct vmw_private *dev_priv;
 	int ret;
 	uint32_t svga_id;
 	enum vmw_res_type i;
 	bool refuse_dma = false;
 	char host_log[100] = {0};
 
-	dev_priv = kzalloc(sizeof(*dev_priv), GFP_KERNEL);
-	if (unlikely(!dev_priv)) {
-		DRM_ERROR("Failed allocating a device private struct.\n");
-		return -ENOMEM;
-	}
+	pci_set_master(dev_priv->drm.pdev);
 
-	pci_set_master(dev->pdev);
-
-	dev_priv->dev = dev;
 	dev_priv->vmw_chipset = chipset;
 	dev_priv->last_read_seqno = (uint32_t) -100;
 	mutex_init(&dev_priv->cmdbuf_mutex);
@@ -687,9 +679,9 @@ static int vmw_driver_load(struct drm_device *dev, unsigned long chipset)
 
 	dev_priv->used_memory_size = 0;
 
-	dev_priv->io_start = pci_resource_start(dev->pdev, 0);
-	dev_priv->vram_start = pci_resource_start(dev->pdev, 1);
-	dev_priv->mmio_start = pci_resource_start(dev->pdev, 2);
+	dev_priv->io_start = pci_resource_start(dev_priv->drm.pdev, 0);
+	dev_priv->vram_start = pci_resource_start(dev_priv->drm.pdev, 1);
+	dev_priv->mmio_start = pci_resource_start(dev_priv->drm.pdev, 2);
 
 	dev_priv->assume_16bpp = !!vmw_assume_16bpp;
 
@@ -793,8 +785,8 @@ static int vmw_driver_load(struct drm_device *dev, unsigned long chipset)
 	if (unlikely(ret != 0))
 		goto out_err0;
 
-	dma_set_max_seg_size(dev->dev, min_t(unsigned int, U32_MAX & PAGE_MASK,
-					     SCATTERLIST_MAX_SEGMENT));
+	dma_set_max_seg_size(dev_priv->drm.dev, min_t(unsigned int, U32_MAX & PAGE_MASK,
+						      SCATTERLIST_MAX_SEGMENT));
 
 	if (dev_priv->capabilities & SVGA_CAP_GMR2) {
 		DRM_INFO("Max GMR ids is %u\n",
@@ -838,16 +830,16 @@ static int vmw_driver_load(struct drm_device *dev, unsigned long chipset)
 		goto out_err4;
 	}
 
-	dev->dev_private = dev_priv;
+	dev_priv->drm.dev_private = dev_priv;
 
-	ret = pci_request_regions(dev->pdev, "vmwgfx probe");
+	ret = pci_request_regions(dev_priv->drm.pdev, "vmwgfx probe");
 	if (ret) {
 		DRM_ERROR("Failed reserving PCI regions.\n");
 		goto out_no_device;
 	}
 
 	if (dev_priv->capabilities & SVGA_CAP_IRQMASK) {
-		ret = vmw_irq_install(dev, dev->pdev->irq);
+		ret = vmw_irq_install(&dev_priv->drm, dev_priv->drm.pdev->irq);
 		if (ret != 0) {
 			DRM_ERROR("Failed installing irq: %d\n", ret);
 			goto out_no_irq;
@@ -865,7 +857,7 @@ static int vmw_driver_load(struct drm_device *dev, unsigned long chipset)
 				    DRM_FILE_PAGE_OFFSET_SIZE);
 	ret = ttm_bo_device_init(&dev_priv->bdev,
 				 &vmw_bo_driver,
-				 dev->anon_inode->i_mapping,
+				 dev_priv->drm.anon_inode->i_mapping,
 				 &dev_priv->vma_manager,
 				 false);
 	if (unlikely(ret != 0)) {
@@ -944,7 +936,7 @@ static int vmw_driver_load(struct drm_device *dev, unsigned long chipset)
 	if (ret)
 		goto out_no_fifo;
 
-	DRM_INFO("Atomic: %s\n", (dev->driver->driver_features & DRIVER_ATOMIC)
+	DRM_INFO("Atomic: %s\n", (dev_priv->drm.driver->driver_features & DRIVER_ATOMIC)
 		 ? "yes." : "no.");
 	if (dev_priv->sm_type == VMW_SM_5)
 		DRM_INFO("SM5 support available.\n");
@@ -989,9 +981,9 @@ static int vmw_driver_load(struct drm_device *dev, unsigned long chipset)
 	vmw_fence_manager_takedown(dev_priv->fman);
 out_no_fman:
 	if (dev_priv->capabilities & SVGA_CAP_IRQMASK)
-		vmw_irq_uninstall(dev_priv->dev);
+		vmw_irq_uninstall(&dev_priv->drm);
 out_no_irq:
-	pci_release_regions(dev->pdev);
+	pci_release_regions(dev_priv->drm.pdev);
 out_no_device:
 	ttm_object_device_release(&dev_priv->tdev);
 out_err4:
@@ -1038,7 +1030,7 @@ static void vmw_driver_unload(struct drm_device *dev)
 	vmw_release_device_late(dev_priv);
 	vmw_fence_manager_takedown(dev_priv->fman);
 	if (dev_priv->capabilities & SVGA_CAP_IRQMASK)
-		vmw_irq_uninstall(dev_priv->dev);
+		vmw_irq_uninstall(&dev_priv->drm);
 	pci_release_regions(dev->pdev);
 
 	ttm_object_device_release(&dev_priv->tdev);
@@ -1236,7 +1228,7 @@ void vmw_svga_disable(struct vmw_private *dev_priv)
 	 * to be inconsistent with the device, causing modesetting problems.
 	 *
 	 */
-	vmw_kms_lost_device(dev_priv->dev);
+	vmw_kms_lost_device(&dev_priv->drm);
 	ttm_write_lock(&dev_priv->reservation_sem, false);
 	spin_lock(&dev_priv->svga_lock);
 	if (ttm_resource_manager_used(man)) {
@@ -1258,8 +1250,6 @@ static void vmw_remove(struct pci_dev *pdev)
 
 	drm_dev_unregister(dev);
 	vmw_driver_unload(dev);
-	drm_dev_put(dev);
-	pci_disable_device(pdev);
 }
 
 static unsigned long
@@ -1356,7 +1346,7 @@ static int vmw_pm_freeze(struct device *kdev)
 	 * No user-space processes should be running now.
 	 */
 	ttm_suspend_unlock(&dev_priv->reservation_sem);
-	ret = vmw_kms_suspend(dev_priv->dev);
+	ret = vmw_kms_suspend(&dev_priv->drm);
 	if (ret) {
 		ttm_suspend_lock(&dev_priv->reservation_sem);
 		DRM_ERROR("Failed to freeze modesetting.\n");
@@ -1417,7 +1407,7 @@ static int vmw_pm_restore(struct device *kdev)
 	dev_priv->suspend_locked = false;
 	ttm_suspend_unlock(&dev_priv->reservation_sem);
 	if (dev_priv->suspend_state)
-		vmw_kms_resume(dev_priv->dev);
+		vmw_kms_resume(&dev_priv->drm);
 
 	if (dev_priv->enable_fb)
 		vmw_fb_on(dev_priv);
@@ -1486,43 +1476,36 @@ static struct pci_driver vmw_pci_driver = {
 
 static int vmw_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
-	struct drm_device *dev;
+	struct vmw_private *vmw;
 	int ret;
 
 	ret = drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, "svgadrmfb");
 	if (ret)
 		return ret;
 
-	ret = pci_enable_device(pdev);
+	ret = pcim_enable_device(pdev);
 	if (ret)
 		return ret;
 
-	dev = drm_dev_alloc(&driver, &pdev->dev);
-	if (IS_ERR(dev)) {
-		ret = PTR_ERR(dev);
-		goto err_pci_disable_device;
-	}
+	vmw = devm_drm_dev_alloc(&pdev->dev, &driver,
+				 struct vmw_private, drm);
+	if (IS_ERR(vmw))
+		return PTR_ERR(vmw);
 
-	dev->pdev = pdev;
-	pci_set_drvdata(pdev, dev);
+	vmw->drm.pdev = pdev;
+	pci_set_drvdata(pdev, &vmw->drm);
 
-	ret = vmw_driver_load(dev, ent->driver_data);
+	ret = vmw_driver_load(vmw, ent->device);
 	if (ret)
-		goto err_drm_dev_put;
+		return ret;
 
-	ret = drm_dev_register(dev, ent->driver_data);
-	if (ret)
-		goto err_vmw_driver_unload;
+	ret = drm_dev_register(&vmw->drm, 0);
+	if (ret) {
+		vmw_driver_unload(&vmw->drm);
+		return ret;
+	}
 
 	return 0;
-
-err_vmw_driver_unload:
-	vmw_driver_unload(dev);
-err_drm_dev_put:
-	drm_dev_put(dev);
-err_pci_disable_device:
-	pci_disable_device(pdev);
-	return ret;
 }
 
 static int __init vmwgfx_init(void)
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index db3dc9f40dcb..b9669867e177 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -492,11 +492,11 @@ enum vmw_sm_type {
 };
 
 struct vmw_private {
+	struct drm_device drm;
 	struct ttm_bo_device bdev;
 
 	struct vmw_fifo_state fifo;
 
-	struct drm_device *dev;
 	struct drm_vma_offset_manager vma_manager;
 	unsigned long vmw_chipset;
 	unsigned int io_start;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c
index c59806d40e15..770b906b18c3 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fb.c
@@ -481,7 +481,7 @@ static int vmw_fb_kms_detach(struct vmw_fb_par *par,
 			DRM_ERROR("Could not unset a mode.\n");
 			return ret;
 		}
-		drm_mode_destroy(par->vmw_priv->dev, par->set_mode);
+		drm_mode_destroy(&par->vmw_priv->drm, par->set_mode);
 		par->set_mode = NULL;
 	}
 
@@ -567,7 +567,7 @@ static int vmw_fb_set_par(struct fb_info *info)
 	struct drm_display_mode *mode;
 	int ret;
 
-	mode = drm_mode_duplicate(vmw_priv->dev, &new_mode);
+	mode = drm_mode_duplicate(&vmw_priv->drm, &new_mode);
 	if (!mode) {
 		DRM_ERROR("Could not create new fb mode.\n");
 		return -ENOMEM;
@@ -581,7 +581,7 @@ static int vmw_fb_set_par(struct fb_info *info)
 					mode->hdisplay *
 					DIV_ROUND_UP(var->bits_per_pixel, 8),
 					mode->vdisplay)) {
-		drm_mode_destroy(vmw_priv->dev, mode);
+		drm_mode_destroy(&vmw_priv->drm, mode);
 		return -EINVAL;
 	}
 
@@ -615,7 +615,7 @@ static int vmw_fb_set_par(struct fb_info *info)
 
 out_unlock:
 	if (par->set_mode)
-		drm_mode_destroy(vmw_priv->dev, par->set_mode);
+		drm_mode_destroy(&vmw_priv->drm, par->set_mode);
 	par->set_mode = mode;
 
 	mutex_unlock(&par->bo_mutex);
@@ -638,7 +638,7 @@ static const struct fb_ops vmw_fb_ops = {
 
 int vmw_fb_init(struct vmw_private *vmw_priv)
 {
-	struct device *device = &vmw_priv->dev->pdev->dev;
+	struct device *device = &vmw_priv->drm.pdev->dev;
 	struct vmw_fb_par *par;
 	struct fb_info *info;
 	unsigned fb_width, fb_height;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
index 0f8d29397157..66fa81e20990 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
@@ -1033,7 +1033,7 @@ int vmw_event_fence_action_queue(struct drm_file *file_priv,
 	eaction->action.type = VMW_ACTION_EVENT;
 
 	eaction->fence = vmw_fence_obj_reference(fence);
-	eaction->dev = fman->dev_priv->dev;
+	eaction->dev = &fman->dev_priv->drm;
 	eaction->tv_sec = tv_sec;
 	eaction->tv_usec = tv_usec;
 
@@ -1055,7 +1055,7 @@ static int vmw_event_fence_action_create(struct drm_file *file_priv,
 {
 	struct vmw_event_fence_pending *event;
 	struct vmw_fence_manager *fman = fman_from_fence(fence);
-	struct drm_device *dev = fman->dev_priv->dev;
+	struct drm_device *dev = &fman->dev_priv->drm;
 	int ret;
 
 	event = kzalloc(sizeof(*event), GFP_KERNEL);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 312ed0881a99..9c285c799fc8 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -236,7 +236,7 @@ void vmw_kms_cursor_snoop(struct vmw_surface *srf,
  */
 void vmw_kms_legacy_hotspot_clear(struct vmw_private *dev_priv)
 {
-	struct drm_device *dev = dev_priv->dev;
+	struct drm_device *dev = &dev_priv->drm;
 	struct vmw_display_unit *du;
 	struct drm_crtc *crtc;
 
@@ -252,7 +252,7 @@ void vmw_kms_legacy_hotspot_clear(struct vmw_private *dev_priv)
 
 void vmw_kms_cursor_post_execbuf(struct vmw_private *dev_priv)
 {
-	struct drm_device *dev = dev_priv->dev;
+	struct drm_device *dev = &dev_priv->drm;
 	struct vmw_display_unit *du;
 	struct drm_crtc *crtc;
 
@@ -889,7 +889,7 @@ static int vmw_kms_new_framebuffer_surface(struct vmw_private *dev_priv,
 					   bool is_bo_proxy)
 
 {
-	struct drm_device *dev = dev_priv->dev;
+	struct drm_device *dev = &dev_priv->drm;
 	struct vmw_framebuffer_surface *vfbs;
 	enum SVGA3dSurfaceFormat format;
 	int ret;
@@ -1001,11 +1001,11 @@ static int vmw_framebuffer_bo_dirty(struct drm_framebuffer *framebuffer,
 	struct drm_clip_rect norect;
 	int ret, increment = 1;
 
-	drm_modeset_lock_all(dev_priv->dev);
+	drm_modeset_lock_all(&dev_priv->drm);
 
 	ret = ttm_read_lock(&dev_priv->reservation_sem, true);
 	if (unlikely(ret != 0)) {
-		drm_modeset_unlock_all(dev_priv->dev);
+		drm_modeset_unlock_all(&dev_priv->drm);
 		return ret;
 	}
 
@@ -1034,7 +1034,7 @@ static int vmw_framebuffer_bo_dirty(struct drm_framebuffer *framebuffer,
 	vmw_fifo_flush(dev_priv, false);
 	ttm_read_unlock(&dev_priv->reservation_sem);
 
-	drm_modeset_unlock_all(dev_priv->dev);
+	drm_modeset_unlock_all(&dev_priv->drm);
 
 	return ret;
 }
@@ -1211,7 +1211,7 @@ static int vmw_kms_new_framebuffer_bo(struct vmw_private *dev_priv,
 				      *mode_cmd)
 
 {
-	struct drm_device *dev = dev_priv->dev;
+	struct drm_device *dev = &dev_priv->drm;
 	struct vmw_framebuffer_bo *vfbd;
 	unsigned int requested_size;
 	struct drm_format_name_buf format_name;
@@ -1317,7 +1317,7 @@ vmw_kms_new_framebuffer(struct vmw_private *dev_priv,
 	    bo && only_2d &&
 	    mode_cmd->width > 64 &&  /* Don't create a proxy for cursor */
 	    dev_priv->active_display_unit == vmw_du_screen_target) {
-		ret = vmw_create_bo_proxy(dev_priv->dev, mode_cmd,
+		ret = vmw_create_bo_proxy(&dev_priv->drm, mode_cmd,
 					  bo, &surface);
 		if (ret)
 			return ERR_PTR(ret);
@@ -1778,7 +1778,7 @@ vmw_kms_create_hotplug_mode_update_property(struct vmw_private *dev_priv)
 		return;
 
 	dev_priv->hotplug_mode_update_property =
-		drm_property_create_range(dev_priv->dev,
+		drm_property_create_range(&dev_priv->drm,
 					  DRM_MODE_PROP_IMMUTABLE,
 					  "hotplug_mode_update", 0, 1);
 
@@ -1789,7 +1789,7 @@ vmw_kms_create_hotplug_mode_update_property(struct vmw_private *dev_priv)
 
 int vmw_kms_init(struct vmw_private *dev_priv)
 {
-	struct drm_device *dev = dev_priv->dev;
+	struct drm_device *dev = &dev_priv->drm;
 	int ret;
 
 	drm_mode_config_init(dev);
@@ -1821,7 +1821,7 @@ int vmw_kms_close(struct vmw_private *dev_priv)
 	 * but since it destroys encoders and our destructor calls
 	 * drm_encoder_cleanup which takes the lock we deadlock.
 	 */
-	drm_mode_config_cleanup(dev_priv->dev);
+	drm_mode_config_cleanup(&dev_priv->drm);
 	if (dev_priv->active_display_unit == vmw_du_legacy)
 		ret = vmw_kms_ldu_close_display(dev_priv);
 
@@ -1932,7 +1932,7 @@ void vmw_disable_vblank(struct drm_crtc *crtc)
 static int vmw_du_update_layout(struct vmw_private *dev_priv,
 				unsigned int num_rects, struct drm_rect *rects)
 {
-	struct drm_device *dev = dev_priv->dev;
+	struct drm_device *dev = &dev_priv->drm;
 	struct vmw_display_unit *du;
 	struct drm_connector *con;
 	struct drm_connector_list_iter conn_iter;
@@ -2364,7 +2364,7 @@ int vmw_kms_helper_dirty(struct vmw_private *dev_priv,
 	if (dirty->crtc) {
 		units[num_units++] = vmw_crtc_to_du(dirty->crtc);
 	} else {
-		list_for_each_entry(crtc, &dev_priv->dev->mode_config.crtc_list,
+		list_for_each_entry(crtc, &dev_priv->drm.mode_config.crtc_list,
 				    head) {
 			struct drm_plane *plane = crtc->primary;
 
@@ -2566,8 +2566,8 @@ int vmw_kms_fbdev_init_data(struct vmw_private *dev_priv,
 	int i = 0;
 	int ret = 0;
 
-	mutex_lock(&dev_priv->dev->mode_config.mutex);
-	list_for_each_entry(con, &dev_priv->dev->mode_config.connector_list,
+	mutex_lock(&dev_priv->drm.mode_config.mutex);
+	list_for_each_entry(con, &dev_priv->drm.mode_config.connector_list,
 			    head) {
 		if (i == unit)
 			break;
@@ -2575,7 +2575,7 @@ int vmw_kms_fbdev_init_data(struct vmw_private *dev_priv,
 		++i;
 	}
 
-	if (&con->head == &dev_priv->dev->mode_config.connector_list) {
+	if (&con->head == &dev_priv->drm.mode_config.connector_list) {
 		DRM_ERROR("Could not find initial display unit.\n");
 		ret = -EINVAL;
 		goto out_unlock;
@@ -2609,7 +2609,7 @@ int vmw_kms_fbdev_init_data(struct vmw_private *dev_priv,
 	}
 
  out_unlock:
-	mutex_unlock(&dev_priv->dev->mode_config.mutex);
+	mutex_unlock(&dev_priv->drm.mode_config.mutex);
 
 	return ret;
 }
@@ -2629,7 +2629,7 @@ vmw_kms_create_implicit_placement_property(struct vmw_private *dev_priv)
 		return;
 
 	dev_priv->implicit_placement_property =
-		drm_property_create_range(dev_priv->dev,
+		drm_property_create_range(&dev_priv->drm,
 					  DRM_MODE_PROP_IMMUTABLE,
 					  "implicit_placement", 0, 1);
 }
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
index c4017c7a24db..45b8fee92b2f 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
@@ -355,7 +355,7 @@ static const struct drm_crtc_helper_funcs vmw_ldu_crtc_helper_funcs = {
 static int vmw_ldu_init(struct vmw_private *dev_priv, unsigned unit)
 {
 	struct vmw_legacy_display_unit *ldu;
-	struct drm_device *dev = dev_priv->dev;
+	struct drm_device *dev = &dev_priv->drm;
 	struct drm_connector *connector;
 	struct drm_encoder *encoder;
 	struct drm_plane *primary, *cursor;
@@ -479,7 +479,7 @@ static int vmw_ldu_init(struct vmw_private *dev_priv, unsigned unit)
 
 int vmw_kms_ldu_init_display(struct vmw_private *dev_priv)
 {
-	struct drm_device *dev = dev_priv->dev;
+	struct drm_device *dev = &dev_priv->drm;
 	int i, ret;
 
 	if (dev_priv->ldu_priv) {
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
index 4bf0f5ec4fc2..e60d0c570296 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
@@ -829,7 +829,7 @@ static const struct drm_crtc_helper_funcs vmw_sou_crtc_helper_funcs = {
 static int vmw_sou_init(struct vmw_private *dev_priv, unsigned unit)
 {
 	struct vmw_screen_object_unit *sou;
-	struct drm_device *dev = dev_priv->dev;
+	struct drm_device *dev = &dev_priv->drm;
 	struct drm_connector *connector;
 	struct drm_encoder *encoder;
 	struct drm_plane *primary, *cursor;
@@ -946,7 +946,7 @@ static int vmw_sou_init(struct vmw_private *dev_priv, unsigned unit)
 
 int vmw_kms_sou_init_display(struct vmw_private *dev_priv)
 {
-	struct drm_device *dev = dev_priv->dev;
+	struct drm_device *dev = &dev_priv->drm;
 	int i, ret;
 
 	if (!(dev_priv->capabilities & SVGA_CAP_SCREEN_OBJECT_2)) {
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
index cf3aafd00837..83b06f7bd63d 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
@@ -1713,7 +1713,7 @@ static const struct drm_crtc_helper_funcs vmw_stdu_crtc_helper_funcs = {
 static int vmw_stdu_init(struct vmw_private *dev_priv, unsigned unit)
 {
 	struct vmw_screen_target_display_unit *stdu;
-	struct drm_device *dev = dev_priv->dev;
+	struct drm_device *dev = &dev_priv->drm;
 	struct drm_connector *connector;
 	struct drm_encoder *encoder;
 	struct drm_plane *primary, *cursor;
@@ -1861,7 +1861,7 @@ static void vmw_stdu_destroy(struct vmw_screen_target_display_unit *stdu)
  */
 int vmw_kms_stdu_init_display(struct vmw_private *dev_priv)
 {
-	struct drm_device *dev = dev_priv->dev;
+	struct drm_device *dev = &dev_priv->drm;
 	int i, ret;
 
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index 73116ec70ba5..eb876c8ce0eb 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -382,7 +382,7 @@ void vmw_piter_start(struct vmw_piter *viter, const struct vmw_sg_table *vsgt,
  */
 static void vmw_ttm_unmap_from_dma(struct vmw_ttm_tt *vmw_tt)
 {
-	struct device *dev = vmw_tt->dev_priv->dev->dev;
+	struct device *dev = vmw_tt->dev_priv->drm.dev;
 
 	dma_unmap_sgtable(dev, &vmw_tt->sgt, DMA_BIDIRECTIONAL, 0);
 	vmw_tt->sgt.nents = vmw_tt->sgt.orig_nents;
@@ -403,7 +403,7 @@ static void vmw_ttm_unmap_from_dma(struct vmw_ttm_tt *vmw_tt)
  */
 static int vmw_ttm_map_for_dma(struct vmw_ttm_tt *vmw_tt)
 {
-	struct device *dev = vmw_tt->dev_priv->dev->dev;
+	struct device *dev = vmw_tt->dev_priv->drm.dev;
 
 	return dma_map_sgtable(dev, &vmw_tt->sgt, DMA_BIDIRECTIONAL, 0);
 }
@@ -458,7 +458,7 @@ static int vmw_ttm_map_dma(struct vmw_ttm_tt *vmw_tt)
 		sg = __sg_alloc_table_from_pages(&vmw_tt->sgt, vsgt->pages,
 				vsgt->num_pages, 0,
 				(unsigned long) vsgt->num_pages << PAGE_SHIFT,
-				dma_get_max_seg_size(dev_priv->dev->dev),
+				dma_get_max_seg_size(dev_priv->drm.dev),
 				NULL, 0, GFP_KERNEL);
 		if (IS_ERR(sg)) {
 			ret = PTR_ERR(sg);
@@ -664,7 +664,7 @@ static int vmw_ttm_populate(struct ttm_bo_device *bdev,
 		if (unlikely(ret != 0))
 			return ret;
 
-		ret = ttm_dma_populate(&vmw_tt->dma_ttm, dev_priv->dev->dev,
+		ret = ttm_dma_populate(&vmw_tt->dma_ttm, dev_priv->drm.dev,
 					ctx);
 		if (unlikely(ret != 0))
 			ttm_mem_global_free(glob, size);
@@ -693,7 +693,7 @@ static void vmw_ttm_unpopulate(struct ttm_bo_device *bdev,
 		size_t size =
 			ttm_round_pot(ttm->num_pages * sizeof(dma_addr_t));
 
-		ttm_dma_unpopulate(&vmw_tt->dma_ttm, dev_priv->dev->dev);
+		ttm_dma_unpopulate(&vmw_tt->dma_ttm, dev_priv->drm.dev);
 		ttm_mem_global_free(glob, size);
 	} else
 		ttm_pool_unpopulate(ttm);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
