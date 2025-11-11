Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A90C4C768
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 09:51:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4497210E0F6;
	Tue, 11 Nov 2025 08:51:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="NfG24dvu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFAD310E0F6
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 08:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1762851078;
 bh=4iDxQ35M1HGVRofSX2thOxygXWkFL0XhCKYd64ibuPs=;
 h=From:To:Cc:Subject:Date:From;
 b=NfG24dvuD02Jc+WXXxmHT5U+oE4qsObARtSuusl6Q7nvRz5VBTL62rVWlqz4ZHO7Z
 jIWzIzR+n6nSCk9n2Ib8v684km5d3c77aFATax8mpe4ojZ/zdbFAmp68gPkzCHLqN6
 DzgxjUmr2cW/rXmSWvXvQbEjObIdZ6UBfPkfYWGqbIXbbIdisCNN/BV8NS84m1b2LR
 FVDMJ6aCfXsSTXNqqiqP1uGPdWHH4P1WJElYfy/bVxtZjHqW31p5mbC2r/TnM3H1JO
 3SwZcOQuwghmTPP2H6/fgn6wvJvASXoBxDM11eAs2GbPanmaDwIE9CCEMGdq1+E4+a
 jUHhsPzvCXejw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E3B8217E00A6;
 Tue, 11 Nov 2025 09:51:17 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 javierm@redhat.com, tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: [PATCH] drm/mediatek: mtk_gem: Partial refactor and use
 drm_gem_dma_object
Date: Tue, 11 Nov 2025 09:51:14 +0100
Message-ID: <20251111085114.9752-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.1
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

Partially refactor mtk_gem to stop using (and remove) the unneeded
custom mtk_gem_obj structure and migrate drivers to use the API
defined drm_gem_dma_object structure instead, and to align all of
the functions to be similar to the logic from drm_gem_dma_helper.

Unfortunately, for this driver it wasn't possible to directly use
the drm_gem_dma_helper callbacks (apart from .print_info), as the
DMA mapping here is done on specific dma devices instead of the
main DRM device.

Also, since the mtk_gem_obj structure is no more, also migrate the
mtk_plane.c code to grab the DMA address from a drm_gem_dma_object
and replace the inclusion of the custom mtk_gem.h header (as it is
now unneeded) with the DRM API provided drm_gem_dma_helper.

While at it, also set DRM_GEM_DMA_HELPER as an unconditional
dependency (remove the `if DRM_FBDEV_EMULATION` from the select
DRM_GEM_DMA_HELPER statement in Kconfig).

This resolves an issue pointed by UBSAN, as when using drm_fbdev_dma
the drm_gem_object is supposed to be child of a drm_gem_dma_object
instead of a custom mtk_gem_obj (or the mtk_gem_obj should have been
reordered to have the same fields as drm_gem_dma_object, but that
would have been too fragile and generally a bad idea anyway).

Fixes: 0992284b4fe4 ("drm/mediatek: Use fbdev-dma")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---

For reference, the UBSAN warning:

[    7.049322] mediatek-drm mediatek-drm.6.auto: bound 1c110000.merge (ops mtk_disp_merge_component_ops [mediatek_drm])
[    7.049414] mediatek-drm mediatek-drm.4.auto: Not creating crtc 1 because component 9 is disabled or missing
[    7.063371] [drm] Initialized mediatek 1.0.0 for mediatek-drm.4.auto on minor 1
[    7.064544] ------------[ cut here ]------------
[    7.064552] UBSAN: invalid-load in /build/linux-genio/drivers/gpu/drm/drm_fbdev_dma.c:212:13
[    7.066759] load of value 20 is not a valid value for type '_Bool'
[    7.068537] CPU: 6 UID: 0 PID: 444 Comm: kworker/u32:8 Not tainted 6.17.0-next-20251007+ #1187 PREEMPT(full) 
[    7.068543] Hardware name: Acer Tomato (rev2) board (DT)
[    7.068545] Workqueue: events_unbound deferred_probe_work_func
[    7.068555] Call trace:
[    7.068557]  show_stack+0x34/0xd8 (C)
[    7.068564]  dump_stack_lvl+0x80/0xc0
[    7.068568]  dump_stack+0x1c/0x40
[    7.068571]  ubsan_epilogue+0x14/0x60
[    7.068575]  __ubsan_handle_load_invalid_value+0xb8/0xe0
[    7.068579]  drm_fbdev_dma_driver_fbdev_probe_tail.isra.0+0x1d0/0x1f0 [drm_dma_helper]
[    7.068588]  drm_fbdev_dma_driver_fbdev_probe+0x20c/0x2a0 [drm_dma_helper]
[    7.068591]  drm_fb_helper_single_fb_probe+0xbc/0x220
[    7.068595]  __drm_fb_helper_initial_config_and_unlock+0x3c/0x170
[    7.068597]  drm_fb_helper_initial_config+0x4c/0x98
[    7.068599]  drm_fbdev_client_hotplug+0x9c/0x100
[    7.068603]  drm_client_register+0x64/0xd0
[    7.068605]  drm_fbdev_client_setup+0xf8/0x260
[    7.068608]  drm_client_setup+0xfc/0x130
[    7.068610]  mtk_drm_bind+0x110/0x218 [mediatek_drm]
[    7.068622]  try_to_bring_up_aggregate_device+0xcc/0x1b0
[    7.068625]  __component_add+0x12c/0x218
[    7.068627]  component_add+0x20/0x48
[    7.068629]  mtk_disp_rdma_probe+0x1b0/0x308 [mediatek_drm]
[    7.068635]  platform_probe+0x70/0x128
[    7.068638]  really_probe+0xd8/0x3e8
[    7.068640]  __driver_probe_device+0x94/0x1a8
[    7.068642]  driver_probe_device+0x4c/0x1a0
[    7.068644]  __device_attach_driver+0x10c/0x238
[    7.068645]  bus_for_each_drv+0x94/0x120
[    7.068647]  __device_attach+0xa8/0x210
[    7.068648]  device_initial_probe+0x20/0x50
[    7.068650]  bus_probe_device+0xc0/0xd8
[    7.068652]  deferred_probe_work_func+0xac/0x120
[    7.068654]  process_one_work+0x174/0x428
[    7.068658]  worker_thread+0x310/0x440
[    7.068661]  kthread+0x110/0x130
[    7.068663]  ret_from_fork+0x10/0x20
[    7.068667] ---[ end trace ]---

 drivers/gpu/drm/mediatek/Kconfig     |   2 +-
 drivers/gpu/drm/mediatek/mtk_gem.c   | 267 +++++++++++----------------
 drivers/gpu/drm/mediatek/mtk_gem.h   |  33 +---
 drivers/gpu/drm/mediatek/mtk_plane.c |   8 +-
 4 files changed, 110 insertions(+), 200 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
index e47debd60619..5bd024fcbfa1 100644
--- a/drivers/gpu/drm/mediatek/Kconfig
+++ b/drivers/gpu/drm/mediatek/Kconfig
@@ -8,7 +8,7 @@ config DRM_MEDIATEK
 	depends on OF
 	depends on MTK_MMSYS
 	select DRM_CLIENT_SELECTION
-	select DRM_GEM_DMA_HELPER if DRM_FBDEV_EMULATION
+	select DRM_GEM_DMA_HELPER
 	select DRM_KMS_HELPER
 	select DRM_DISPLAY_HELPER
 	select DRM_BRIDGE_CONNECTOR
diff --git a/drivers/gpu/drm/mediatek/mtk_gem.c b/drivers/gpu/drm/mediatek/mtk_gem.c
index a172456d1d7b..c19844bb2fde 100644
--- a/drivers/gpu/drm/mediatek/mtk_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_gem.c
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (c) 2015 MediaTek Inc.
+ * Copyright (c) 2025 Collabora Ltd.
+ *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  */
 
 #include <linux/dma-buf.h>
@@ -17,24 +19,64 @@
 
 static int mtk_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
 
-static const struct vm_operations_struct vm_ops = {
-	.open = drm_gem_vm_open,
-	.close = drm_gem_vm_close,
-};
+static void mtk_gem_free_object(struct drm_gem_object *obj)
+{
+	struct drm_gem_dma_object *dma_obj = to_drm_gem_dma_obj(obj);
+	struct mtk_drm_private *priv = obj->dev->dev_private;
+
+	if (dma_obj->sgt)
+		drm_prime_gem_destroy(obj, dma_obj->sgt);
+	else
+		dma_free_wc(priv->dma_dev, dma_obj->base.size,
+			    dma_obj->vaddr, dma_obj->dma_addr);
+
+	/* release file pointer to gem object. */
+	drm_gem_object_release(obj);
+
+	kfree(dma_obj);
+}
+
+/*
+ * Allocate a sg_table for this GEM object.
+ * Note: Both the table's contents, and the sg_table itself must be freed by
+ *       the caller.
+ * Returns a pointer to the newly allocated sg_table, or an ERR_PTR() error.
+ */
+static struct sg_table *mtk_gem_prime_get_sg_table(struct drm_gem_object *obj)
+{
+	struct drm_gem_dma_object *dma_obj = to_drm_gem_dma_obj(obj);
+	struct mtk_drm_private *priv = obj->dev->dev_private;
+	struct sg_table *sgt;
+	int ret;
+
+	sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
+	if (!sgt)
+		return ERR_PTR(-ENOMEM);
+
+	ret = dma_get_sgtable(priv->dma_dev, sgt, dma_obj->vaddr,
+			      dma_obj->dma_addr, obj->size);
+	if (ret) {
+		DRM_ERROR("failed to allocate sgt, %d\n", ret);
+		kfree(sgt);
+		return ERR_PTR(ret);
+	}
+
+	return sgt;
+}
 
 static const struct drm_gem_object_funcs mtk_gem_object_funcs = {
 	.free = mtk_gem_free_object,
+	.print_info = drm_gem_dma_object_print_info,
 	.get_sg_table = mtk_gem_prime_get_sg_table,
-	.vmap = mtk_gem_prime_vmap,
-	.vunmap = mtk_gem_prime_vunmap,
+	.vmap = drm_gem_dma_object_vmap,
 	.mmap = mtk_gem_object_mmap,
-	.vm_ops = &vm_ops,
+	.vm_ops = &drm_gem_dma_vm_ops,
 };
 
-static struct mtk_gem_obj *mtk_gem_init(struct drm_device *dev,
-					unsigned long size)
+static struct drm_gem_dma_object *mtk_gem_init(struct drm_device *dev,
+					unsigned long size, bool private)
 {
-	struct mtk_gem_obj *mtk_gem_obj;
+	struct drm_gem_dma_object *dma_obj;
 	int ret;
 
 	size = round_up(size, PAGE_SIZE);
@@ -42,86 +84,65 @@ static struct mtk_gem_obj *mtk_gem_init(struct drm_device *dev,
 	if (size == 0)
 		return ERR_PTR(-EINVAL);
 
-	mtk_gem_obj = kzalloc(sizeof(*mtk_gem_obj), GFP_KERNEL);
-	if (!mtk_gem_obj)
+	dma_obj = kzalloc(sizeof(*dma_obj), GFP_KERNEL);
+	if (!dma_obj)
 		return ERR_PTR(-ENOMEM);
 
-	mtk_gem_obj->base.funcs = &mtk_gem_object_funcs;
+	dma_obj->base.funcs = &mtk_gem_object_funcs;
 
-	ret = drm_gem_object_init(dev, &mtk_gem_obj->base, size);
-	if (ret < 0) {
+	if (private) {
+		ret = 0;
+		drm_gem_private_object_init(dev, &dma_obj->base, size);
+	} else {
+		ret = drm_gem_object_init(dev, &dma_obj->base, size);
+	}
+	if (ret) {
 		DRM_ERROR("failed to initialize gem object\n");
-		kfree(mtk_gem_obj);
+		kfree(dma_obj);
 		return ERR_PTR(ret);
 	}
 
-	return mtk_gem_obj;
+	return dma_obj;
 }
 
-struct mtk_gem_obj *mtk_gem_create(struct drm_device *dev,
-				   size_t size, bool alloc_kmap)
+static struct drm_gem_dma_object *mtk_gem_create(struct drm_device *dev, size_t size)
 {
 	struct mtk_drm_private *priv = dev->dev_private;
-	struct mtk_gem_obj *mtk_gem;
+	struct drm_gem_dma_object *dma_obj;
 	struct drm_gem_object *obj;
 	int ret;
 
-	mtk_gem = mtk_gem_init(dev, size);
-	if (IS_ERR(mtk_gem))
-		return ERR_CAST(mtk_gem);
-
-	obj = &mtk_gem->base;
-
-	mtk_gem->dma_attrs = DMA_ATTR_WRITE_COMBINE;
+	dma_obj = mtk_gem_init(dev, size, false);
+	if (IS_ERR(dma_obj))
+		return ERR_CAST(dma_obj);
 
-	if (!alloc_kmap)
-		mtk_gem->dma_attrs |= DMA_ATTR_NO_KERNEL_MAPPING;
+	obj = &dma_obj->base;
 
-	mtk_gem->cookie = dma_alloc_attrs(priv->dma_dev, obj->size,
-					  &mtk_gem->dma_addr, GFP_KERNEL,
-					  mtk_gem->dma_attrs);
-	if (!mtk_gem->cookie) {
+	dma_obj->vaddr = dma_alloc_wc(priv->dma_dev, obj->size,
+				      &dma_obj->dma_addr,
+				      GFP_KERNEL | __GFP_NOWARN);
+	if (!dma_obj->vaddr) {
 		DRM_ERROR("failed to allocate %zx byte dma buffer", obj->size);
 		ret = -ENOMEM;
 		goto err_gem_free;
 	}
 
-	if (alloc_kmap)
-		mtk_gem->kvaddr = mtk_gem->cookie;
-
-	DRM_DEBUG_DRIVER("cookie = %p dma_addr = %pad size = %zu\n",
-			 mtk_gem->cookie, &mtk_gem->dma_addr,
+	DRM_DEBUG_DRIVER("vaddr = %p dma_addr = %pad size = %zu\n",
+			 dma_obj->vaddr, &dma_obj->dma_addr,
 			 size);
 
-	return mtk_gem;
+	return dma_obj;
 
 err_gem_free:
 	drm_gem_object_release(obj);
-	kfree(mtk_gem);
+	kfree(dma_obj);
 	return ERR_PTR(ret);
 }
 
-void mtk_gem_free_object(struct drm_gem_object *obj)
-{
-	struct mtk_gem_obj *mtk_gem = to_mtk_gem_obj(obj);
-	struct mtk_drm_private *priv = obj->dev->dev_private;
-
-	if (mtk_gem->sg)
-		drm_prime_gem_destroy(obj, mtk_gem->sg);
-	else
-		dma_free_attrs(priv->dma_dev, obj->size, mtk_gem->cookie,
-			       mtk_gem->dma_addr, mtk_gem->dma_attrs);
-
-	/* release file pointer to gem object. */
-	drm_gem_object_release(obj);
-
-	kfree(mtk_gem);
-}
-
 int mtk_gem_dumb_create(struct drm_file *file_priv, struct drm_device *dev,
 			struct drm_mode_create_dumb *args)
 {
-	struct mtk_gem_obj *mtk_gem;
+	struct drm_gem_dma_object *dma_obj;
 	int ret;
 
 	args->pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
@@ -134,25 +155,24 @@ int mtk_gem_dumb_create(struct drm_file *file_priv, struct drm_device *dev,
 	args->size = args->pitch;
 	args->size *= args->height;
 
-	mtk_gem = mtk_gem_create(dev, args->size, false);
-	if (IS_ERR(mtk_gem))
-		return PTR_ERR(mtk_gem);
+	dma_obj = mtk_gem_create(dev, args->size);
+	if (IS_ERR(dma_obj))
+		return PTR_ERR(dma_obj);
 
 	/*
 	 * allocate a id of idr table where the obj is registered
 	 * and handle has the id what user can see.
 	 */
-	ret = drm_gem_handle_create(file_priv, &mtk_gem->base, &args->handle);
+	ret = drm_gem_handle_create(file_priv, &dma_obj->base, &args->handle);
+	/* drop reference from allocate - handle holds it now. */
+	drm_gem_object_put(&dma_obj->base);
 	if (ret)
 		goto err_handle_create;
 
-	/* drop reference from allocate - handle holds it now. */
-	drm_gem_object_put(&mtk_gem->base);
-
 	return 0;
 
 err_handle_create:
-	mtk_gem_free_object(&mtk_gem->base);
+	mtk_gem_free_object(&dma_obj->base);
 	return ret;
 }
 
@@ -160,129 +180,50 @@ static int mtk_gem_object_mmap(struct drm_gem_object *obj,
 			       struct vm_area_struct *vma)
 
 {
-	int ret;
-	struct mtk_gem_obj *mtk_gem = to_mtk_gem_obj(obj);
+	struct drm_gem_dma_object *dma_obj = to_drm_gem_dma_obj(obj);
 	struct mtk_drm_private *priv = obj->dev->dev_private;
+	int ret;
 
 	/*
 	 * Set vm_pgoff (used as a fake buffer offset by DRM) to 0 and map the
 	 * whole buffer from the start.
 	 */
-	vma->vm_pgoff = 0;
+	vma->vm_pgoff -= drm_vma_node_start(&obj->vma_node);
 
 	/*
 	 * dma_alloc_attrs() allocated a struct page table for mtk_gem, so clear
 	 * VM_PFNMAP flag that was set by drm_gem_mmap_obj()/drm_gem_mmap().
 	 */
-	vm_flags_set(vma, VM_IO | VM_DONTEXPAND | VM_DONTDUMP);
+	vm_flags_mod(vma, VM_IO | VM_DONTEXPAND | VM_DONTDUMP, VM_PFNMAP);
+
 	vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
 	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
 
-	ret = dma_mmap_attrs(priv->dma_dev, vma, mtk_gem->cookie,
-			     mtk_gem->dma_addr, obj->size, mtk_gem->dma_attrs);
+	ret = dma_mmap_wc(priv->dma_dev, vma, dma_obj->vaddr,
+			  dma_obj->dma_addr, obj->size);
+	if (ret)
+		drm_gem_vm_close(vma);
 
 	return ret;
 }
 
-/*
- * Allocate a sg_table for this GEM object.
- * Note: Both the table's contents, and the sg_table itself must be freed by
- *       the caller.
- * Returns a pointer to the newly allocated sg_table, or an ERR_PTR() error.
- */
-struct sg_table *mtk_gem_prime_get_sg_table(struct drm_gem_object *obj)
-{
-	struct mtk_gem_obj *mtk_gem = to_mtk_gem_obj(obj);
-	struct mtk_drm_private *priv = obj->dev->dev_private;
-	struct sg_table *sgt;
-	int ret;
-
-	sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
-	if (!sgt)
-		return ERR_PTR(-ENOMEM);
-
-	ret = dma_get_sgtable_attrs(priv->dma_dev, sgt, mtk_gem->cookie,
-				    mtk_gem->dma_addr, obj->size,
-				    mtk_gem->dma_attrs);
-	if (ret) {
-		DRM_ERROR("failed to allocate sgt, %d\n", ret);
-		kfree(sgt);
-		return ERR_PTR(ret);
-	}
-
-	return sgt;
-}
-
 struct drm_gem_object *mtk_gem_prime_import_sg_table(struct drm_device *dev,
-			struct dma_buf_attachment *attach, struct sg_table *sg)
+			struct dma_buf_attachment *attach, struct sg_table *sgt)
 {
-	struct mtk_gem_obj *mtk_gem;
+	struct drm_gem_dma_object *dma_obj;
 
 	/* check if the entries in the sg_table are contiguous */
-	if (drm_prime_get_contiguous_size(sg) < attach->dmabuf->size) {
+	if (drm_prime_get_contiguous_size(sgt) < attach->dmabuf->size) {
 		DRM_ERROR("sg_table is not contiguous");
 		return ERR_PTR(-EINVAL);
 	}
 
-	mtk_gem = mtk_gem_init(dev, attach->dmabuf->size);
-	if (IS_ERR(mtk_gem))
-		return ERR_CAST(mtk_gem);
-
-	mtk_gem->dma_addr = sg_dma_address(sg->sgl);
-	mtk_gem->sg = sg;
-
-	return &mtk_gem->base;
-}
-
-int mtk_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map)
-{
-	struct mtk_gem_obj *mtk_gem = to_mtk_gem_obj(obj);
-	struct sg_table *sgt = NULL;
-	unsigned int npages;
-
-	if (mtk_gem->kvaddr)
-		goto out;
-
-	sgt = mtk_gem_prime_get_sg_table(obj);
-	if (IS_ERR(sgt))
-		return PTR_ERR(sgt);
-
-	npages = obj->size >> PAGE_SHIFT;
-	mtk_gem->pages = kcalloc(npages, sizeof(*mtk_gem->pages), GFP_KERNEL);
-	if (!mtk_gem->pages) {
-		sg_free_table(sgt);
-		kfree(sgt);
-		return -ENOMEM;
-	}
-
-	drm_prime_sg_to_page_array(sgt, mtk_gem->pages, npages);
-
-	mtk_gem->kvaddr = vmap(mtk_gem->pages, npages, VM_MAP,
-			       pgprot_writecombine(PAGE_KERNEL));
-	if (!mtk_gem->kvaddr) {
-		sg_free_table(sgt);
-		kfree(sgt);
-		kfree(mtk_gem->pages);
-		return -ENOMEM;
-	}
-	sg_free_table(sgt);
-	kfree(sgt);
-
-out:
-	iosys_map_set_vaddr(map, mtk_gem->kvaddr);
-
-	return 0;
-}
-
-void mtk_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
-{
-	struct mtk_gem_obj *mtk_gem = to_mtk_gem_obj(obj);
-	void *vaddr = map->vaddr;
+	dma_obj = mtk_gem_init(dev, attach->dmabuf->size, true);
+	if (IS_ERR(dma_obj))
+		return ERR_CAST(dma_obj);
 
-	if (!mtk_gem->pages)
-		return;
+	dma_obj->dma_addr = sg_dma_address(sgt->sgl);
+	dma_obj->sgt = sgt;
 
-	vunmap(vaddr);
-	mtk_gem->kvaddr = NULL;
-	kfree(mtk_gem->pages);
+	return &dma_obj->base;
 }
diff --git a/drivers/gpu/drm/mediatek/mtk_gem.h b/drivers/gpu/drm/mediatek/mtk_gem.h
index 66e5f154f698..afebc3a970a8 100644
--- a/drivers/gpu/drm/mediatek/mtk_gem.h
+++ b/drivers/gpu/drm/mediatek/mtk_gem.h
@@ -7,42 +7,11 @@
 #define _MTK_GEM_H_
 
 #include <drm/drm_gem.h>
+#include <drm/drm_gem_dma_helper.h>
 
-/*
- * mtk drm buffer structure.
- *
- * @base: a gem object.
- *	- a new handle to this gem object would be created
- *	by drm_gem_handle_create().
- * @cookie: the return value of dma_alloc_attrs(), keep it for dma_free_attrs()
- * @kvaddr: kernel virtual address of gem buffer.
- * @dma_addr: dma address of gem buffer.
- * @dma_attrs: dma attributes of gem buffer.
- *
- * P.S. this object would be transferred to user as kms_bo.handle so
- *	user can access the buffer through kms_bo.handle.
- */
-struct mtk_gem_obj {
-	struct drm_gem_object	base;
-	void			*cookie;
-	void			*kvaddr;
-	dma_addr_t		dma_addr;
-	unsigned long		dma_attrs;
-	struct sg_table		*sg;
-	struct page		**pages;
-};
-
-#define to_mtk_gem_obj(x) container_of(x, struct mtk_gem_obj, base)
-
-void mtk_gem_free_object(struct drm_gem_object *gem);
-struct mtk_gem_obj *mtk_gem_create(struct drm_device *dev, size_t size,
-				   bool alloc_kmap);
 int mtk_gem_dumb_create(struct drm_file *file_priv, struct drm_device *dev,
 			struct drm_mode_create_dumb *args);
-struct sg_table *mtk_gem_prime_get_sg_table(struct drm_gem_object *obj);
 struct drm_gem_object *mtk_gem_prime_import_sg_table(struct drm_device *dev,
 			struct dma_buf_attachment *attach, struct sg_table *sg);
-int mtk_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map);
-void mtk_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map *map);
 
 #endif
diff --git a/drivers/gpu/drm/mediatek/mtk_plane.c b/drivers/gpu/drm/mediatek/mtk_plane.c
index 1b5667ddbb03..2c632c171b73 100644
--- a/drivers/gpu/drm/mediatek/mtk_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_plane.c
@@ -11,12 +11,12 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_gem_dma_helper.h>
 #include <linux/align.h>
 
 #include "mtk_crtc.h"
 #include "mtk_ddp_comp.h"
 #include "mtk_drm_drv.h"
-#include "mtk_gem.h"
 #include "mtk_plane.h"
 
 static const u64 modifiers[] = {
@@ -135,8 +135,8 @@ static void mtk_plane_update_new_state(struct drm_plane_state *new_state,
 				       struct mtk_plane_state *mtk_plane_state)
 {
 	struct drm_framebuffer *fb = new_state->fb;
+	struct drm_gem_dma_object *dma_obj;
 	struct drm_gem_object *gem;
-	struct mtk_gem_obj *mtk_gem;
 	unsigned int pitch, format;
 	u64 modifier;
 	dma_addr_t addr;
@@ -145,8 +145,8 @@ static void mtk_plane_update_new_state(struct drm_plane_state *new_state,
 	int offset;
 
 	gem = fb->obj[0];
-	mtk_gem = to_mtk_gem_obj(gem);
-	addr = mtk_gem->dma_addr;
+	dma_obj = to_drm_gem_dma_obj(gem);
+	addr = dma_obj->dma_addr;
 	pitch = fb->pitches[0];
 	format = fb->format->format;
 	modifier = fb->modifier;
-- 
2.51.1

