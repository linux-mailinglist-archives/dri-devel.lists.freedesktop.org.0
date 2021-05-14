Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0194381184
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 22:11:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2D5C6F45A;
	Fri, 14 May 2021 20:11:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 558386F45A
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 20:11:56 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 1/3] drm: Add support for GEM buffers backed by
 non-coherent memory
Date: Fri, 14 May 2021 21:11:36 +0100
Message-Id: <20210514201138.162230-2-paul@crapouillou.net>
In-Reply-To: <20210514201138.162230-1-paul@crapouillou.net>
References: <20210514201138.162230-1-paul@crapouillou.net>
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
Cc: Paul Cercueil <paul@crapouillou.net>, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, od@opendingux.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Having GEM buffers backed by non-coherent memory is interesting in the
particular case where it is faster to render to a non-coherent buffer
then sync the data cache, than to render to a write-combine buffer, and
(by extension) much faster than using a shadow buffer. This is true for
instance on some Ingenic SoCs, where even simple blits (e.g. memcpy)
are about three times faster using this method.

Add a 'map_noncoherent' flag to the drm_gem_cma_object structure, which
can be set by the drivers when they create the dumb buffer.

Since this really only applies to software rendering, disable this flag
as soon as the CMA objects are exported via PRIME.

v3: New patch. Now uses a simple 'map_noncoherent' flag to control how
    the objects are mapped, and use the new dma_mmap_pages function.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/drm_gem_cma_helper.c | 41 +++++++++++++++++++++++++---
 include/drm/drm_gem_cma_helper.h     |  7 ++++-
 2 files changed, 43 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
index 7942cf05cd93..81a31bcf7d68 100644
--- a/drivers/gpu/drm/drm_gem_cma_helper.c
+++ b/drivers/gpu/drm/drm_gem_cma_helper.c
@@ -115,8 +115,15 @@ struct drm_gem_cma_object *drm_gem_cma_create(struct drm_device *drm,
 	if (IS_ERR(cma_obj))
 		return cma_obj;
 
-	cma_obj->vaddr = dma_alloc_wc(drm->dev, size, &cma_obj->paddr,
-				      GFP_KERNEL | __GFP_NOWARN);
+	if (cma_obj->map_noncoherent) {
+		cma_obj->vaddr = dma_alloc_noncoherent(drm->dev, size,
+						       &cma_obj->paddr,
+						       DMA_TO_DEVICE,
+						       GFP_KERNEL | __GFP_NOWARN);
+	} else {
+		cma_obj->vaddr = dma_alloc_wc(drm->dev, size, &cma_obj->paddr,
+					      GFP_KERNEL | __GFP_NOWARN);
+	}
 	if (!cma_obj->vaddr) {
 		drm_dbg(drm, "failed to allocate buffer with size %zu\n",
 			 size);
@@ -499,8 +506,13 @@ int drm_gem_cma_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
 
 	cma_obj = to_drm_gem_cma_obj(obj);
 
-	ret = dma_mmap_wc(cma_obj->base.dev->dev, vma, cma_obj->vaddr,
-			  cma_obj->paddr, vma->vm_end - vma->vm_start);
+	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
+	if (!cma_obj->map_noncoherent)
+		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
+
+	ret = dma_mmap_pages(cma_obj->base.dev->dev,
+			     vma, vma->vm_end - vma->vm_start,
+			     virt_to_page(cma_obj->vaddr));
 	if (ret)
 		drm_gem_vm_close(vma);
 
@@ -556,3 +568,24 @@ drm_gem_cma_prime_import_sg_table_vmap(struct drm_device *dev,
 	return obj;
 }
 EXPORT_SYMBOL(drm_gem_cma_prime_import_sg_table_vmap);
+
+/**
+ * drm_gem_cma_prime_mmap - PRIME mmap function for CMA GEM drivers
+ * @obj: GEM object
+ * @vma: Virtual address range
+ *
+ * Carbon copy of drm_gem_prime_mmap, but the 'map_noncoherent' flag is
+ * disabled to ensure that the exported buffers have the expected cache
+ * coherency.
+ */
+int drm_gem_cma_prime_mmap(struct drm_gem_object *obj,
+			   struct vm_area_struct *vma)
+{
+	struct drm_gem_cma_object *cma_obj = to_drm_gem_cma_obj(obj);
+
+	/* Use standard cache settings for PRIME-exported GEM buffers */
+	cma_obj->map_noncoherent = false;
+
+	return drm_gem_prime_mmap(obj, vma);
+}
+EXPORT_SYMBOL(drm_gem_cma_prime_mmap);
diff --git a/include/drm/drm_gem_cma_helper.h b/include/drm/drm_gem_cma_helper.h
index 0a9711caa3e8..b597e00fd5f6 100644
--- a/include/drm/drm_gem_cma_helper.h
+++ b/include/drm/drm_gem_cma_helper.h
@@ -16,6 +16,7 @@ struct drm_mode_create_dumb;
  *       more than one entry but they are guaranteed to have contiguous
  *       DMA addresses.
  * @vaddr: kernel virtual address of the backing memory
+ * @map_noncoherent: if true, the GEM object is backed by non-coherent memory
  */
 struct drm_gem_cma_object {
 	struct drm_gem_object base;
@@ -24,6 +25,8 @@ struct drm_gem_cma_object {
 
 	/* For objects with DMA memory allocated by GEM CMA */
 	void *vaddr;
+
+	bool map_noncoherent;
 };
 
 #define to_drm_gem_cma_obj(gem_obj) \
@@ -119,7 +122,7 @@ int drm_gem_cma_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
 	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd, \
 	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle, \
 	.gem_prime_import_sg_table = drm_gem_cma_prime_import_sg_table, \
-	.gem_prime_mmap		= drm_gem_prime_mmap
+	.gem_prime_mmap		= drm_gem_cma_prime_mmap
 
 /**
  * DRM_GEM_CMA_DRIVER_OPS - CMA GEM driver operations
@@ -181,5 +184,7 @@ struct drm_gem_object *
 drm_gem_cma_prime_import_sg_table_vmap(struct drm_device *drm,
 				       struct dma_buf_attachment *attach,
 				       struct sg_table *sgt);
+int drm_gem_cma_prime_mmap(struct drm_gem_object *obj,
+			   struct vm_area_struct *vma);
 
 #endif /* __DRM_GEM_CMA_HELPER_H__ */
-- 
2.30.2

