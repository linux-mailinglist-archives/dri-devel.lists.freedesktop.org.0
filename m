Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2862C577CFA
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 10:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A521691F0C;
	Mon, 18 Jul 2022 08:00:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 303 seconds by postgrey-1.36 at gabe;
 Mon, 18 Jul 2022 01:51:14 UTC
Received: from mailgw.kylinos.cn (unknown [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93A7D8F896
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 01:51:14 +0000 (UTC)
X-UUID: 84e79db355a543c3bc97903c6cca7ee8-20220718
X-UUID: 84e79db355a543c3bc97903c6cca7ee8-20220718
X-User: oushixiong@kylinos.cn
Received: from localhost.localdomain [(111.48.58.12)] by mailgw
 (envelope-from <oushixiong@kylinos.cn>) (Generic MTA)
 with ESMTP id 214112793; Mon, 18 Jul 2022 09:46:43 +0800
From: oushixiong <oushixiong@kylinos.cn>
To: Dave Airlie <airlied@redhat.com>
Subject: [PATCH] drm/ast: add dmabuf/prime buffer sharing support
Date: Mon, 18 Jul 2022 09:45:59 +0800
Message-Id: <20220718014559.64069-1-oushixiong@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 18 Jul 2022 08:00:04 +0000
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
Cc: David Airlie <airlied@linux.ie>, oushixiong <oushixiong@kylinos.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds ast specific codes for DRM Prime feature.
User application can get file descriptor from gem handle and also
gem handle from file descriptor.this is to allow for offloading
of rendering in one direction and outputs in the other.

Signed-off-by: oushixiong <oushixiong@kylinos.cn>
---
 drivers/gpu/drm/ast/ast_drv.c  |  16 +++-
 drivers/gpu/drm/ast/ast_drv.h  |  19 ++++-
 drivers/gpu/drm/ast/ast_main.c | 115 ++++++++++++++++++++++++++++-
 drivers/gpu/drm/ast/ast_ttm.c  | 130 ++++++++++++++++++++++++++++++++-
 4 files changed, 273 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index bf589c53b908..084d0c8b0f6b 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -214,7 +214,7 @@ static const struct file_operations ast_fops = {
 };
 
 static struct drm_driver driver = {
-	.driver_features = DRIVER_MODESET | DRIVER_GEM,
+	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_PRIME,
 
 	.load = ast_driver_load,
 	.unload = ast_driver_unload,
@@ -231,6 +231,20 @@ static struct drm_driver driver = {
 	.dumb_create = ast_dumb_create,
 	.dumb_map_offset = ast_dumb_mmap_offset,
 
+	.prime_handle_to_fd     = drm_gem_prime_handle_to_fd,
+	.prime_fd_to_handle     = drm_gem_prime_fd_to_handle,
+	.gem_prime_import       = drm_gem_prime_import,
+	.gem_prime_export       = drm_gem_prime_export,
+
+	.gem_prime_get_sg_table = ast_gem_prime_get_sg_table,
+	.gem_prime_import_sg_table = ast_gem_prime_import_sg_table,
+	.gem_prime_vmap         = ast_gem_prime_vmap,
+	.gem_prime_vunmap       = ast_gem_prime_vunmap,
+	.gem_prime_pin          = ast_gem_prime_pin,
+	.gem_prime_unpin        = ast_gem_prime_unpin,
+
+	.gem_prime_res_obj = ast_gem_prime_res_obj,
+
 };
 
 static int __init ast_init(void)
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index e6c4cd3dc50e..b19b9aa5a517 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -258,6 +258,7 @@ struct ast_encoder {
 struct ast_framebuffer {
 	struct drm_framebuffer base;
 	struct drm_gem_object *obj;
+	void *vmapping;
 };
 
 struct ast_fbdev {
@@ -330,6 +331,7 @@ struct ast_bo {
 	struct drm_gem_object gem;
 	struct ttm_place placements[3];
 	int pin_count;
+	struct ttm_bo_kmap_obj dma_buf_vmap;
 };
 #define gem_to_ast_bo(gobj) container_of((gobj), struct ast_bo, gem)
 
@@ -361,7 +363,9 @@ int ast_mm_init(struct ast_private *ast);
 void ast_mm_fini(struct ast_private *ast);
 
 int ast_bo_create(struct drm_device *dev, int size, int align,
-		  uint32_t flags, struct ast_bo **pastbo);
+		uint32_t flags, struct sg_table *sg,
+		struct reservation_object *resv,
+		struct ast_bo **pastbo);
 
 int ast_gem_create(struct drm_device *dev,
 		   u32 size, bool iskernel,
@@ -369,6 +373,19 @@ int ast_gem_create(struct drm_device *dev,
 
 int ast_bo_pin(struct ast_bo *bo, u32 pl_flag, u64 *gpu_addr);
 int ast_bo_unpin(struct ast_bo *bo);
+struct sg_table *ast_gem_prime_get_sg_table(struct drm_gem_object *obj);
+void *ast_gem_prime_vmap(struct drm_gem_object *obj);
+void ast_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr);
+
+struct drm_gem_object *ast_gem_prime_import_sg_table(struct drm_device *dev,
+			struct dma_buf_attachment *attach,
+			struct sg_table *sg);
+
+int ast_gem_prime_pin(struct drm_gem_object *obj);
+void ast_gem_prime_unpin(struct drm_gem_object *obj);
+
+struct reservation_object *ast_gem_prime_res_obj(struct drm_gem_object *obj);
+
 
 static inline int ast_bo_reserve(struct ast_bo *bo, bool no_wait)
 {
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 224fa1ef87ff..6f8fc49b062c 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -28,7 +28,7 @@
 #include <drm/drmP.h>
 #include "ast_drv.h"
 
-
+#include <linux/dma-buf.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_crtc_helper.h>
 
@@ -383,17 +383,125 @@ static int ast_get_dram_info(struct drm_device *dev)
 	return 0;
 }
 
+int ast_handle_damage(struct ast_framebuffer *fb, int x, int y,
+			int width, int height)
+{
+	struct ast_bo *dst_bo = NULL;
+	void *dst = NULL;
+	int ret = 0, i;
+	unsigned long offset = 0;
+	bool unmap = false;
+	unsigned int bytesPerPixel;
+
+	bytesPerPixel = fb->base.format->cpp[0];
+
+	if (!fb->obj->import_attach)
+		return -EINVAL;
+
+	if (!fb->vmapping) {
+		fb->vmapping = dma_buf_vmap(fb->obj->import_attach->dmabuf);
+		if (!fb->vmapping)
+			return 0;
+	}
+	dst_bo = gem_to_ast_bo(fb->obj);
+	ret = ast_bo_reserve(dst_bo, true);
+	if (ret) {
+		DRM_ERROR("ast_bo_reserve failed\n");
+		ast_bo_unreserve(dst_bo);
+		goto error;
+	}
+	if (!dst_bo->dma_buf_vmap.virtual) {
+		ret = ttm_bo_kmap(&dst_bo->bo, 0,
+			dst_bo->bo.num_pages, &dst_bo->dma_buf_vmap);
+		if (ret) {
+			DRM_ERROR("failed to kmap fbcon\n");
+			goto error;
+		}
+		unmap = true;
+	}
+	dst = dst_bo->dma_buf_vmap.virtual;
+
+	for (i = y; i < y + height; i++) {
+		offset = i * fb->base.pitches[0] + (x * bytesPerPixel);
+		memcpy_toio(dst + offset, fb->vmapping + offset,
+			width * bytesPerPixel);
+	}
+
+	if (unmap)
+		ttm_bo_kunmap(&dst_bo->dma_buf_vmap);
+	ast_bo_unreserve(dst_bo);
+
+error:
+	return 0;
+}
+
 static void ast_user_framebuffer_destroy(struct drm_framebuffer *fb)
 {
 	struct ast_framebuffer *ast_fb = to_ast_framebuffer(fb);
 
+	if (ast_fb->obj->import_attach) {
+		if (ast_fb->vmapping)
+			dma_buf_vunmap(ast_fb->obj->import_attach->dmabuf,
+				ast_fb->vmapping);
+	}
+
 	drm_gem_object_put_unlocked(ast_fb->obj);
 	drm_framebuffer_cleanup(fb);
 	kfree(ast_fb);
 }
 
+static int ast_user_framebuffer_dirty(struct drm_framebuffer *fb,
+				struct drm_file *file,
+				unsigned int flags,
+				unsigned int color,
+				struct drm_clip_rect *clips,
+				unsigned int num_clips)
+{
+	struct ast_framebuffer *ast_fb = to_ast_framebuffer(fb);
+	int i, ret = 0;
+
+	drm_modeset_lock_all(fb->dev);
+
+	if (ast_fb->obj->import_attach) {
+		ret = dma_buf_begin_cpu_access(
+				ast_fb->obj->import_attach->dmabuf,
+				DMA_FROM_DEVICE);
+		if (ret)
+			goto unlock;
+		}
+
+	for (i = 0; i < num_clips; i++) {
+		ret = ast_handle_damage(ast_fb, clips[i].x1, clips[i].y1,
+			clips[i].x2 - clips[i].x1,
+			clips[i].y2 - clips[i].y1);
+		if (ret)
+			break;
+	}
+
+	if (ast_fb->obj->import_attach) {
+		dma_buf_end_cpu_access(ast_fb->obj->import_attach->dmabuf,
+			DMA_FROM_DEVICE);
+	}
+
+unlock:
+	drm_modeset_unlock_all(fb->dev);
+
+	return ret;
+}
+
+static int ast_user_framebuffer_create_handle(struct drm_framebuffer *fb,
+			struct drm_file *file_priv,
+			unsigned int *handle)
+{
+	struct ast_framebuffer *ast_fb = to_ast_framebuffer(fb);
+
+	return drm_gem_handle_create(file_priv, ast_fb->obj, handle);
+}
+
 static const struct drm_framebuffer_funcs ast_fb_funcs = {
+	.create_handle = ast_user_framebuffer_create_handle,
 	.destroy = ast_user_framebuffer_destroy,
+	.dirty = ast_user_framebuffer_dirty,
 };
 
 
@@ -605,7 +713,7 @@ int ast_gem_create(struct drm_device *dev,
 	if (size == 0)
 		return -EINVAL;
 
-	ret = ast_bo_create(dev, size, 0, 0, &astbo);
+	ret = ast_bo_create(dev, size, 0, 0, NULL, NULL, &astbo);
 	if (ret) {
 		if (ret != -ERESTARTSYS)
 			DRM_ERROR("failed to allocate GEM object\n");
@@ -656,6 +764,9 @@ void ast_gem_free_object(struct drm_gem_object *obj)
 {
 	struct ast_bo *ast_bo = gem_to_ast_bo(obj);
 
+	if (ast_bo->gem.import_attach)
+		drm_prime_gem_destroy(&ast_bo->gem, ast_bo->bo.sg);
+
 	ast_bo_unref(&ast_bo);
 }
 
diff --git a/drivers/gpu/drm/ast/ast_ttm.c b/drivers/gpu/drm/ast/ast_ttm.c
index fe354ebf374d..fea0429407e0 100644
--- a/drivers/gpu/drm/ast/ast_ttm.c
+++ b/drivers/gpu/drm/ast/ast_ttm.c
@@ -27,6 +27,7 @@
  */
 #include <drm/drmP.h>
 #include <drm/ttm/ttm_page_alloc.h>
+#include <linux/dma-buf.h>
 
 #include "ast_drv.h"
 
@@ -215,8 +216,38 @@ static struct ttm_tt *ast_ttm_tt_create(struct ttm_buffer_object *bo,
 	return tt;
 }
 
+static int ast_ttm_tt_populate(struct ttm_tt *ttm,
+			struct ttm_operation_ctx *ctx)
+{
+	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
+
+	if (ttm->state != tt_unpopulated)
+		return 0;
+
+	if (slave && ttm->sg) {
+		drm_prime_sg_to_page_addr_arrays(ttm->sg, ttm->pages,
+				NULL, ttm->num_pages);
+		ttm->state = tt_unbound;
+		return 0;
+	}
+
+	return ttm_pool_populate(ttm, ctx);
+}
+
+static void ast_ttm_tt_unpopulate(struct ttm_tt *ttm)
+{
+	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
+
+	if (slave)
+		return;
+
+	ttm_pool_unpopulate(ttm);
+}
+
 struct ttm_bo_driver ast_bo_driver = {
 	.ttm_tt_create = ast_ttm_tt_create,
+	.ttm_tt_populate = ast_ttm_tt_populate,
+	.ttm_tt_unpopulate = ast_ttm_tt_unpopulate,
 	.init_mem_type = ast_bo_init_mem_type,
 	.eviction_valuable = ttm_bo_eviction_valuable,
 	.evict_flags = ast_bo_evict_flags,
@@ -297,13 +328,21 @@ void ast_ttm_placement(struct ast_bo *bo, int domain)
 }
 
 int ast_bo_create(struct drm_device *dev, int size, int align,
-		  uint32_t flags, struct ast_bo **pastbo)
+		  uint32_t flags, struct sg_table *sg,
+		  struct reservation_object *resv,
+		  struct ast_bo **pastbo)
 {
 	struct ast_private *ast = dev->dev_private;
 	struct ast_bo *astbo;
 	size_t acc_size;
+	enum ttm_bo_type type;
 	int ret;
 
+	if (sg)
+		type = ttm_bo_type_sg;
+	else
+		type = ttm_bo_type_device;
+
 	astbo = kzalloc(sizeof(struct ast_bo), GFP_KERNEL);
 	if (!astbo)
 		return -ENOMEM;
@@ -320,9 +359,9 @@ int ast_bo_create(struct drm_device *dev, int size, int align,
 				       sizeof(struct ast_bo));
 
 	ret = ttm_bo_init(&ast->ttm.bdev, &astbo->bo, size,
-			  ttm_bo_type_device, &astbo->placement,
+			  type, &astbo->placement,
 			  align >> PAGE_SHIFT, false, acc_size,
-			  NULL, NULL, ast_bo_ttm_destroy);
+			  sg, resv, ast_bo_ttm_destroy);
 	if (ret)
 		goto error;
 
@@ -418,3 +457,88 @@ int ast_mmap(struct file *filp, struct vm_area_struct *vma)
 	ast = file_priv->minor->dev->dev_private;
 	return ttm_bo_mmap(filp, vma, &ast->ttm.bdev);
 }
+
+struct sg_table *ast_gem_prime_get_sg_table(struct drm_gem_object *obj)
+{
+	struct ast_bo *bo = gem_to_ast_bo(obj);
+	int npages = bo->bo.num_pages;
+
+	return drm_prime_pages_to_sg(bo->bo.ttm->pages, npages);
+}
+
+void *ast_gem_prime_vmap(struct drm_gem_object *obj)
+{
+	struct ast_bo *bo = gem_to_ast_bo(obj);
+	int ret;
+
+	ret = ttm_bo_kmap(&bo->bo, 0, bo->bo.num_pages,
+			&bo->dma_buf_vmap);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return bo->dma_buf_vmap.virtual;
+}
+
+void ast_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr)
+{
+	struct ast_bo *bo = gem_to_ast_bo(obj);
+
+	ttm_bo_kunmap(&bo->dma_buf_vmap);
+}
+
+struct drm_gem_object *ast_gem_prime_import_sg_table(struct drm_device *dev,
+				struct dma_buf_attachment *attach,
+				struct sg_table *sg)
+{
+	struct ast_bo *bo;
+	int ret;
+
+	struct reservation_object *resv = attach->dmabuf->resv;
+
+	ww_mutex_lock(&resv->lock, NULL);
+	ret = ast_bo_create(dev, attach->dmabuf->size,
+			PAGE_SIZE, 0, sg, resv, &bo);
+	ww_mutex_unlock(&resv->lock);
+
+	if (ret)
+		return ERR_PTR(ret);
+
+	return &bo->gem;
+}
+
+int ast_gem_prime_pin(struct drm_gem_object *obj)
+{
+	struct ast_bo *bo  = gem_to_ast_bo(obj);
+	int ret = 0;
+
+	ret = ast_bo_reserve(bo, false);
+	if (unlikely(ret != 0))
+		return ret;
+
+	/* pin buffer into GTT */
+	ret = ast_bo_pin(bo, TTM_PL_FLAG_SYSTEM, NULL);
+	ast_bo_unreserve(bo);
+
+	return ret;
+}
+
+void ast_gem_prime_unpin(struct drm_gem_object *obj)
+{
+	struct ast_bo *bo = gem_to_ast_bo(obj);
+	int ret = 0;
+
+	ret = ast_bo_reserve(bo, false);
+	if (unlikely(ret != 0))
+		return;
+
+	ast_bo_unpin(bo);
+	ast_bo_unreserve(bo);
+}
+
+struct reservation_object *ast_gem_prime_res_obj(struct drm_gem_object *obj)
+{
+	struct ast_bo *bo = gem_to_ast_bo(obj);
+
+	return bo->bo.resv;
+}
+
-- 
2.17.1

