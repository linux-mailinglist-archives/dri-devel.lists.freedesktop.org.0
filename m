Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B39321724
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 13:43:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D56C36E4E3;
	Mon, 22 Feb 2021 12:43:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76CD46E4E3;
 Mon, 22 Feb 2021 12:43:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 099C7B117;
 Mon, 22 Feb 2021 12:43:33 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, yuq825@gmail.com, robh@kernel.org,
 tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, eric@anholt.net, sumit.semwal@linaro.org,
 christian.koenig@amd.com, stern@rowland.harvard.edu
Subject: [PATCH v2 3/3] drm/cma-helper: Implement struct
 drm_driver.gem_prime_create_object
Date: Mon, 22 Feb 2021 13:43:28 +0100
Message-Id: <20210222124328.27340-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210222124328.27340-1-tzimmermann@suse.de>
References: <20210222124328.27340-1-tzimmermann@suse.de>
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
Cc: linaro-mm-sig@lists.linaro.org, Thomas Zimmermann <tzimmermann@suse.de>,
 lima@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Moves the scatter/gather-table setup from PRIME helpers into CMA
helpers. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_cma_helper.c | 62 ++++++++++++++++------------
 drivers/gpu/drm/pl111/pl111_drv.c    |  8 ++--
 include/drm/drm_gem_cma_helper.h     | 12 ++----
 3 files changed, 42 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
index 7942cf05cd93..7200d0ae2e38 100644
--- a/drivers/gpu/drm/drm_gem_cma_helper.c
+++ b/drivers/gpu/drm/drm_gem_cma_helper.c
@@ -404,37 +404,44 @@ struct sg_table *drm_gem_cma_get_sg_table(struct drm_gem_object *obj)
 EXPORT_SYMBOL_GPL(drm_gem_cma_get_sg_table);
 
 /**
- * drm_gem_cma_prime_import_sg_table - produce a CMA GEM object from another
- *     driver's scatter/gather table of pinned pages
+ * drm_gem_cma_prime_create_object - produce a CMA GEM object from another
+ *     driver's DMA-BUF attachment
  * @dev: device to import into
  * @attach: DMA-BUF attachment
- * @sgt: scatter/gather table of pinned pages
  *
- * This function imports a scatter/gather table exported via DMA-BUF by
- * another driver. Imported buffers must be physically contiguous in memory
- * (i.e. the scatter/gather table must contain a single entry). Drivers that
- * use the CMA helpers should set this as their
- * &drm_driver.gem_prime_import_sg_table callback.
+ * This function imports a DMA-BUF exported by another driver. It sets a
+ * scatter/gather table of pinned pages. Imported buffers must be physically
+ * contiguous in memory (i.e. the scatter/gather table must contain a single
+ * entry). Drivers that use the CMA helpers should set this as their
+ * &drm_driver.gem_prime_create_object callback.
  *
  * Returns:
  * A pointer to a newly created GEM object or an ERR_PTR-encoded negative
  * error code on failure.
  */
 struct drm_gem_object *
-drm_gem_cma_prime_import_sg_table(struct drm_device *dev,
-				  struct dma_buf_attachment *attach,
-				  struct sg_table *sgt)
+drm_gem_cma_prime_create_object(struct drm_device *dev, struct dma_buf_attachment *attach)
 {
+	struct sg_table *sgt;
 	struct drm_gem_cma_object *cma_obj;
+	int ret;
+
+	sgt = dma_buf_map_attachment(attach, DMA_BIDIRECTIONAL);
+	if (IS_ERR(sgt))
+		return ERR_CAST(sgt);
 
 	/* check if the entries in the sg_table are contiguous */
-	if (drm_prime_get_contiguous_size(sgt) < attach->dmabuf->size)
-		return ERR_PTR(-EINVAL);
+	if (drm_prime_get_contiguous_size(sgt) < attach->dmabuf->size) {
+		ret = -EINVAL;
+		goto err;
+	}
 
 	/* Create a CMA GEM buffer. */
 	cma_obj = __drm_gem_cma_create(dev, attach->dmabuf->size);
-	if (IS_ERR(cma_obj))
-		return ERR_CAST(cma_obj);
+	if (IS_ERR(cma_obj)) {
+		ret = PTR_ERR(cma_obj);
+		goto err;
+	}
 
 	cma_obj->paddr = sg_dma_address(sgt->sgl);
 	cma_obj->sgt = sgt;
@@ -442,8 +449,12 @@ drm_gem_cma_prime_import_sg_table(struct drm_device *dev,
 	DRM_DEBUG_PRIME("dma_addr = %pad, size = %zu\n", &cma_obj->paddr, attach->dmabuf->size);
 
 	return &cma_obj->base;
+
+err:
+	dma_buf_unmap_attachment(attach, sgt, DMA_BIDIRECTIONAL);
+	return ERR_PTR(ret);
 }
-EXPORT_SYMBOL_GPL(drm_gem_cma_prime_import_sg_table);
+EXPORT_SYMBOL_GPL(drm_gem_cma_prime_create_object);
 
 /**
  * drm_gem_cma_vmap - map a CMA GEM object into the kernel's virtual
@@ -509,18 +520,17 @@ int drm_gem_cma_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
 EXPORT_SYMBOL_GPL(drm_gem_cma_mmap);
 
 /**
- * drm_gem_cma_prime_import_sg_table_vmap - PRIME import another driver's
- *	scatter/gather table and get the virtual address of the buffer
+ * drm_gem_cma_prime_create_object_vmap - produce a CMA GEM object from another
+ *     driver's DMA-BUF attachment and gets the virtual address of the buffer
  * @dev: DRM device
  * @attach: DMA-BUF attachment
- * @sgt: Scatter/gather table of pinned pages
  *
- * This function imports a scatter/gather table using
- * drm_gem_cma_prime_import_sg_table() and uses dma_buf_vmap() to get the kernel
+ * This function imports a DMA-BUF using
+ * drm_gem_cma_prime_create_object() and uses dma_buf_vmap() to get the kernel
  * virtual address. This ensures that a CMA GEM object always has its virtual
  * address set. This address is released when the object is freed.
  *
- * This function can be used as the &drm_driver.gem_prime_import_sg_table
+ * This function can be used as the &drm_driver.gem_prime_create_object
  * callback. The &DRM_GEM_CMA_DRIVER_OPS_VMAP macro provides a shortcut to set
  * the necessary DRM driver operations.
  *
@@ -529,9 +539,7 @@ EXPORT_SYMBOL_GPL(drm_gem_cma_mmap);
  * error code on failure.
  */
 struct drm_gem_object *
-drm_gem_cma_prime_import_sg_table_vmap(struct drm_device *dev,
-				       struct dma_buf_attachment *attach,
-				       struct sg_table *sgt)
+drm_gem_cma_prime_create_object_vmap(struct drm_device *dev, struct dma_buf_attachment *attach)
 {
 	struct drm_gem_cma_object *cma_obj;
 	struct drm_gem_object *obj;
@@ -544,7 +552,7 @@ drm_gem_cma_prime_import_sg_table_vmap(struct drm_device *dev,
 		return ERR_PTR(ret);
 	}
 
-	obj = drm_gem_cma_prime_import_sg_table(dev, attach, sgt);
+	obj = drm_gem_cma_prime_create_object(dev, attach);
 	if (IS_ERR(obj)) {
 		dma_buf_vunmap(attach->dmabuf, &map);
 		return obj;
@@ -555,4 +563,4 @@ drm_gem_cma_prime_import_sg_table_vmap(struct drm_device *dev,
 
 	return obj;
 }
-EXPORT_SYMBOL(drm_gem_cma_prime_import_sg_table_vmap);
+EXPORT_SYMBOL(drm_gem_cma_prime_create_object_vmap);
diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
index e4dcaef6c143..3dd6c7e46df0 100644
--- a/drivers/gpu/drm/pl111/pl111_drv.c
+++ b/drivers/gpu/drm/pl111/pl111_drv.c
@@ -194,9 +194,7 @@ static int pl111_modeset_init(struct drm_device *dev)
 }
 
 static struct drm_gem_object *
-pl111_gem_import_sg_table(struct drm_device *dev,
-			  struct dma_buf_attachment *attach,
-			  struct sg_table *sgt)
+pl111_gem_create_object(struct drm_device *dev, struct dma_buf_attachment *attach)
 {
 	struct pl111_drm_dev_private *priv = dev->dev_private;
 
@@ -208,7 +206,7 @@ pl111_gem_import_sg_table(struct drm_device *dev,
 	if (priv->use_device_memory)
 		return ERR_PTR(-EINVAL);
 
-	return drm_gem_cma_prime_import_sg_table(dev, attach, sgt);
+	return drm_gem_cma_prime_create_object(dev, attach);
 }
 
 DEFINE_DRM_GEM_CMA_FOPS(drm_fops);
@@ -227,7 +225,7 @@ static const struct drm_driver pl111_drm_driver = {
 	.dumb_create = drm_gem_cma_dumb_create,
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
-	.gem_prime_import_sg_table = pl111_gem_import_sg_table,
+	.gem_prime_create_object = pl111_gem_create_object,
 	.gem_prime_mmap = drm_gem_prime_mmap,
 
 #if defined(CONFIG_DEBUG_FS)
diff --git a/include/drm/drm_gem_cma_helper.h b/include/drm/drm_gem_cma_helper.h
index 0a9711caa3e8..54d7f4b11225 100644
--- a/include/drm/drm_gem_cma_helper.h
+++ b/include/drm/drm_gem_cma_helper.h
@@ -95,9 +95,7 @@ void drm_gem_cma_print_info(struct drm_printer *p, unsigned int indent,
 
 struct sg_table *drm_gem_cma_get_sg_table(struct drm_gem_object *obj);
 struct drm_gem_object *
-drm_gem_cma_prime_import_sg_table(struct drm_device *dev,
-				  struct dma_buf_attachment *attach,
-				  struct sg_table *sgt);
+drm_gem_cma_prime_create_object(struct drm_device *dev, struct dma_buf_attachment *attach);
 int drm_gem_cma_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
 int drm_gem_cma_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
 
@@ -118,7 +116,7 @@ int drm_gem_cma_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
 	.dumb_create		= (dumb_create_func), \
 	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd, \
 	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle, \
-	.gem_prime_import_sg_table = drm_gem_cma_prime_import_sg_table, \
+	.gem_prime_create_object = drm_gem_cma_prime_create_object, \
 	.gem_prime_mmap		= drm_gem_prime_mmap
 
 /**
@@ -156,7 +154,7 @@ int drm_gem_cma_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
 	.dumb_create		= dumb_create_func, \
 	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd, \
 	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle, \
-	.gem_prime_import_sg_table = drm_gem_cma_prime_import_sg_table_vmap, \
+	.gem_prime_create_object = drm_gem_cma_prime_create_object_vmap, \
 	.gem_prime_mmap		= drm_gem_prime_mmap
 
 /**
@@ -178,8 +176,6 @@ int drm_gem_cma_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
 	DRM_GEM_CMA_DRIVER_OPS_VMAP_WITH_DUMB_CREATE(drm_gem_cma_dumb_create)
 
 struct drm_gem_object *
-drm_gem_cma_prime_import_sg_table_vmap(struct drm_device *drm,
-				       struct dma_buf_attachment *attach,
-				       struct sg_table *sgt);
+drm_gem_cma_prime_create_object_vmap(struct drm_device *drm, struct dma_buf_attachment *attach);
 
 #endif /* __DRM_GEM_CMA_HELPER_H__ */
-- 
2.30.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
