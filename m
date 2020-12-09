Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EE62D442A
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 15:25:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9E286EA62;
	Wed,  9 Dec 2020 14:25:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EABF6EA59
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 14:25:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BD0ECAD21;
 Wed,  9 Dec 2020 14:25:35 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, christian.koenig@amd.com, airlied@linux.ie,
 sumit.semwal@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kraxel@redhat.com, hdegoede@redhat.com,
 sean@poorly.run, eric@anholt.net, sam@ravnborg.org
Subject: [PATCH v3 7/8] drm/vram-helper: Provide a vmap function for
 short-term mappings
Date: Wed,  9 Dec 2020 15:25:26 +0100
Message-Id: <20201209142527.26415-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201209142527.26415-1-tzimmermann@suse.de>
References: <20201209142527.26415-1-tzimmermann@suse.de>
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
Cc: linaro-mm-sig@lists.linaro.org, virtualization@lists.linux-foundation.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implementations of the vmap/vunmap GEM callbacks may perform pinning
of the BO and may acquire the associated reservation object's lock.
It's somewhat inconvenient to callers that simply require a mapping of
the contained memory; and also ipmplies a certain overhead.

Therefore provide drm_gem_vram_vmap_local() drm_gem_vram_vunmap_local(),
which only perform the vmap/vunmap operations. Callers have to hold the
reservation lock while the mapping persists; or have to pin the BO by
themselves.

The affected callers are cursor updates in ast and vboxvideo. Both
are being changed to the new interface.

This patch connects GEM VRAM helpers to GEM object functions with
equivalent functionality.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_cursor.c      |  37 +++++--
 drivers/gpu/drm/drm_gem_vram_helper.c | 142 +++++++++++++++++---------
 drivers/gpu/drm/vboxvideo/vbox_mode.c |  15 +--
 include/drm/drm_gem_vram_helper.h     |   2 +
 4 files changed, 132 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_cursor.c
index fac1ee79c372..c38f435bcde2 100644
--- a/drivers/gpu/drm/ast/ast_cursor.c
+++ b/drivers/gpu/drm/ast/ast_cursor.c
@@ -159,6 +159,8 @@ int ast_cursor_blit(struct ast_private *ast, struct drm_framebuffer *fb)
 	struct drm_device *dev = &ast->base;
 	struct drm_gem_vram_object *dst_gbo = ast->cursor.gbo[ast->cursor.next_index];
 	struct drm_gem_vram_object *src_gbo = drm_gem_vram_of_gem(fb->obj[0]);
+	struct drm_gem_object *objs[] = {&src_gbo->bo.base, &dst_gbo->bo.base};
+	struct ww_acquire_ctx ctx;
 	struct dma_buf_map src_map, dst_map;
 	void __iomem *dst;
 	void *src;
@@ -168,26 +170,34 @@ int ast_cursor_blit(struct ast_private *ast, struct drm_framebuffer *fb)
 	    drm_WARN_ON_ONCE(dev, fb->height > AST_MAX_HWC_HEIGHT))
 		return -EINVAL;
 
-	ret = drm_gem_vram_vmap(src_gbo, &src_map);
+	ret = drm_gem_lock_reservations(objs, ARRAY_SIZE(objs), &ctx);
 	if (ret)
 		return ret;
+
+	ret = drm_gem_vram_vmap_local(src_gbo, &src_map);
+	if (ret)
+		goto err_drm_gem_unlock_reservations;
 	src = src_map.vaddr; /* TODO: Use mapping abstraction properly */
 
-	ret = drm_gem_vram_vmap(dst_gbo, &dst_map);
+	ret = drm_gem_vram_vmap_local(dst_gbo, &dst_map);
 	if (ret)
-		goto err_drm_gem_vram_vunmap;
+		goto err_drm_gem_vram_vunmap_local;
 	dst = dst_map.vaddr_iomem; /* TODO: Use mapping abstraction properly */
 
 	/* do data transfer to cursor BO */
 	update_cursor_image(dst, src, fb->width, fb->height);
 
-	drm_gem_vram_vunmap(dst_gbo, &dst_map);
-	drm_gem_vram_vunmap(src_gbo, &src_map);
+	drm_gem_vram_vunmap_local(dst_gbo, &dst_map);
+	drm_gem_vram_vunmap_local(src_gbo, &src_map);
+
+	drm_gem_unlock_reservations(objs, ARRAY_SIZE(objs), &ctx);
 
 	return 0;
 
-err_drm_gem_vram_vunmap:
-	drm_gem_vram_vunmap(src_gbo, &src_map);
+err_drm_gem_vram_vunmap_local:
+	drm_gem_vram_vunmap_local(src_gbo, &src_map);
+err_drm_gem_unlock_reservations:
+	drm_gem_unlock_reservations(objs, ARRAY_SIZE(objs), &ctx);
 	return ret;
 }
 
@@ -241,6 +251,7 @@ void ast_cursor_show(struct ast_private *ast, int x, int y,
 {
 	struct drm_device *dev = &ast->base;
 	struct drm_gem_vram_object *gbo = ast->cursor.gbo[ast->cursor.next_index];
+	struct drm_gem_object *obj = &gbo->bo.base;
 	struct dma_buf_map map;
 	u8 x_offset, y_offset;
 	u8 __iomem *dst;
@@ -248,16 +259,22 @@ void ast_cursor_show(struct ast_private *ast, int x, int y,
 	u8 jreg;
 	int ret;
 
-	ret = drm_gem_vram_vmap(gbo, &map);
-	if (drm_WARN_ONCE(dev, ret, "drm_gem_vram_vmap() failed, ret=%d\n", ret))
+	ret = dma_resv_lock(obj->resv, NULL);
+	if (ret)
+		return;
+	ret = drm_gem_vram_vmap_local(gbo, &map);
+	if (drm_WARN_ONCE(dev, ret, "drm_gem_vram_vmap_local() failed, ret=%d\n", ret)) {
+		dma_resv_unlock(obj->resv);
 		return;
+	}
 	dst = map.vaddr_iomem; /* TODO: Use mapping abstraction properly */
 
 	sig = dst + AST_HWC_SIZE;
 	writel(x, sig + AST_HWC_SIGNATURE_X);
 	writel(y, sig + AST_HWC_SIGNATURE_Y);
 
-	drm_gem_vram_vunmap(gbo, &map);
+	drm_gem_vram_vunmap_local(gbo, &map);
+	dma_resv_unlock(obj->resv);
 
 	if (x < 0) {
 		x_offset = (-x) + offset_x;
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 02ca22e90290..08a713993896 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -379,47 +379,6 @@ int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo)
 }
 EXPORT_SYMBOL(drm_gem_vram_unpin);
 
-static int drm_gem_vram_kmap_locked(struct drm_gem_vram_object *gbo,
-				    struct dma_buf_map *map)
-{
-	int ret;
-
-	if (gbo->vmap_use_count > 0)
-		goto out;
-
-	ret = ttm_bo_vmap(&gbo->bo, &gbo->map);
-	if (ret)
-		return ret;
-
-out:
-	++gbo->vmap_use_count;
-	*map = gbo->map;
-
-	return 0;
-}
-
-static void drm_gem_vram_kunmap_locked(struct drm_gem_vram_object *gbo,
-				       struct dma_buf_map *map)
-{
-	struct drm_device *dev = gbo->bo.base.dev;
-
-	if (drm_WARN_ON_ONCE(dev, !gbo->vmap_use_count))
-		return;
-
-	if (drm_WARN_ON_ONCE(dev, !dma_buf_map_is_equal(&gbo->map, map)))
-		return; /* BUG: map not mapped from this BO */
-
-	if (--gbo->vmap_use_count > 0)
-		return;
-
-	/*
-	 * Permanently mapping and unmapping buffers adds overhead from
-	 * updating the page tables and creates debugging output. Therefore,
-	 * we delay the actual unmap operation until the BO gets evicted
-	 * from memory. See drm_gem_vram_bo_driver_move_notify().
-	 */
-}
-
 /**
  * drm_gem_vram_vmap() - Pins and maps a GEM VRAM object into kernel address
  *                       space
@@ -447,7 +406,7 @@ int drm_gem_vram_vmap(struct drm_gem_vram_object *gbo, struct dma_buf_map *map)
 	ret = drm_gem_vram_pin_locked(gbo, 0);
 	if (ret)
 		goto err_ttm_bo_unreserve;
-	ret = drm_gem_vram_kmap_locked(gbo, map);
+	ret = drm_gem_vram_vmap_local(gbo, map);
 	if (ret)
 		goto err_drm_gem_vram_unpin_locked;
 
@@ -479,13 +438,84 @@ void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo, struct dma_buf_map *ma
 	if (WARN_ONCE(ret, "ttm_bo_reserve_failed(): ret=%d\n", ret))
 		return;
 
-	drm_gem_vram_kunmap_locked(gbo, map);
+	drm_gem_vram_vunmap_local(gbo, map);
 	drm_gem_vram_unpin_locked(gbo);
 
 	ttm_bo_unreserve(&gbo->bo);
 }
 EXPORT_SYMBOL(drm_gem_vram_vunmap);
 
+/**
+ * drm_gem_vram_vmap_local() - Maps a GEM VRAM object into kernel address space
+ * @gbo: The GEM VRAM object to map
+ * @map: Returns the kernel virtual address of the VRAM GEM object's backing
+ *       store.
+ *
+ * The vmap_local function maps the buffer of a GEM VRAM object into kernel address
+ * space. Call drm_gem_vram_vunmap_local() with the returned address to unmap and
+ * unpin the GEM VRAM object.
+ *
+ * The function is called with the BO's reservation object locked. For short-term
+ * mappings, callers must hold the lock until after unmapping the buffer. For
+ * long-term mappings, callers are required to pin the BO to it's current location
+ * before calling this function.
+ *
+ * Returns:
+ * 0 on success, or a negative error code otherwise.
+ */
+int drm_gem_vram_vmap_local(struct drm_gem_vram_object *gbo, struct dma_buf_map *map)
+{
+	int ret;
+
+	dma_resv_assert_held(gbo->bo.base.resv);
+
+	if (gbo->vmap_use_count > 0)
+		goto out;
+
+	ret = ttm_bo_vmap(&gbo->bo, &gbo->map);
+	if (ret)
+		return ret;
+
+out:
+	++gbo->vmap_use_count;
+	*map = gbo->map;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_gem_vram_vmap_local);
+
+/**
+ * drm_gem_vram_vunmap_local() - Unmaps a GEM VRAM object
+ * @gbo: The GEM VRAM object to unmap
+ * @map: Kernel virtual address where the VRAM GEM object was mapped
+ *
+ * A call to drm_gem_vram_vunmap_local() unmaps a GEM VRAM object's buffer. See
+ * the documentation for drm_gem_vram_vmap_local() for more information.
+ */
+void drm_gem_vram_vunmap_local(struct drm_gem_vram_object *gbo, struct dma_buf_map *map)
+{
+	struct drm_device *dev = gbo->bo.base.dev;
+
+	dma_resv_assert_held(gbo->bo.base.resv);
+
+	if (drm_WARN_ON_ONCE(dev, !gbo->vmap_use_count))
+		return;
+
+	if (drm_WARN_ON_ONCE(dev, !dma_buf_map_is_equal(&gbo->map, map)))
+		return; /* BUG: map not mapped from this BO */
+
+	if (--gbo->vmap_use_count > 0)
+		return;
+
+	/*
+	 * Permanently mapping and unmapping buffers adds overhead from
+	 * updating the page tables and creates debugging output. Therefore,
+	 * we delay the actual unmap operation until the BO gets evicted
+	 * from memory. See drm_gem_vram_bo_driver_move_notify().
+	 */
+}
+EXPORT_SYMBOL(drm_gem_vram_vunmap_local);
+
 /**
  * drm_gem_vram_fill_create_dumb() - \
 	Helper for implementing &struct drm_driver.dumb_create
@@ -871,17 +901,33 @@ static void drm_gem_vram_object_vunmap(struct drm_gem_object *gem, struct dma_bu
 	drm_gem_vram_vunmap(gbo, map);
 }
 
+static int drm_gem_vram_object_vmap_local(struct drm_gem_object *gem, struct dma_buf_map *map)
+{
+	struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(gem);
+
+	return drm_gem_vram_vmap_local(gbo, map);
+}
+
+static void drm_gem_vram_object_vunmap_local(struct drm_gem_object *gem, struct dma_buf_map *map)
+{
+	struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(gem);
+
+	drm_gem_vram_vunmap_local(gbo, map);
+}
+
 /*
  * GEM object funcs
  */
 
 static const struct drm_gem_object_funcs drm_gem_vram_object_funcs = {
-	.free	= drm_gem_vram_object_free,
-	.pin	= drm_gem_vram_object_pin,
-	.unpin	= drm_gem_vram_object_unpin,
-	.vmap	= drm_gem_vram_object_vmap,
+	.free = drm_gem_vram_object_free,
+	.pin = drm_gem_vram_object_pin,
+	.unpin = drm_gem_vram_object_unpin,
+	.vmap = drm_gem_vram_object_vmap,
 	.vunmap	= drm_gem_vram_object_vunmap,
-	.mmap   = drm_gem_ttm_mmap,
+	.vmap_local = drm_gem_vram_object_vmap_local,
+	.vunmap_local = drm_gem_vram_object_vunmap_local,
+	.mmap = drm_gem_ttm_mmap,
 	.print_info = drm_gem_ttm_print_info,
 };
 
diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
index dbc0dd53c69e..215b37c78c10 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
@@ -381,7 +381,8 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
 		container_of(plane->dev, struct vbox_private, ddev);
 	struct vbox_crtc *vbox_crtc = to_vbox_crtc(plane->state->crtc);
 	struct drm_framebuffer *fb = plane->state->fb;
-	struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(fb->obj[0]);
+	struct drm_gem_object *obj = fb->obj[0];
+	struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(obj);
 	u32 width = plane->state->crtc_w;
 	u32 height = plane->state->crtc_h;
 	size_t data_size, mask_size;
@@ -401,11 +402,12 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
 
 	vbox_crtc->cursor_enabled = true;
 
-	ret = drm_gem_vram_vmap(gbo, &map);
+	ret = dma_resv_lock(obj->resv, NULL);
+	if (ret)
+		return;
+	ret = drm_gem_vram_vmap_local(gbo, &map);
 	if (ret) {
-		/*
-		 * BUG: we should have pinned the BO in prepare_fb().
-		 */
+		dma_resv_unlock(obj->resv);
 		mutex_unlock(&vbox->hw_mutex);
 		DRM_WARN("Could not map cursor bo, skipping update\n");
 		return;
@@ -421,7 +423,8 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
 	data_size = width * height * 4 + mask_size;
 
 	copy_cursor_image(src, vbox->cursor_data, width, height, mask_size);
-	drm_gem_vram_vunmap(gbo, &map);
+	drm_gem_vram_vunmap_local(gbo, &map);
+	dma_resv_unlock(obj->resv);
 
 	flags = VBOX_MOUSE_POINTER_VISIBLE | VBOX_MOUSE_POINTER_SHAPE |
 		VBOX_MOUSE_POINTER_ALPHA;
diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
index a4bac02249c2..bd6a60e7c22b 100644
--- a/include/drm/drm_gem_vram_helper.h
+++ b/include/drm/drm_gem_vram_helper.h
@@ -99,6 +99,8 @@ int drm_gem_vram_pin(struct drm_gem_vram_object *gbo, unsigned long pl_flag);
 int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo);
 int drm_gem_vram_vmap(struct drm_gem_vram_object *gbo, struct dma_buf_map *map);
 void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo, struct dma_buf_map *map);
+int drm_gem_vram_vmap_local(struct drm_gem_vram_object *gbo, struct dma_buf_map *map);
+void drm_gem_vram_vunmap_local(struct drm_gem_vram_object *gbo, struct dma_buf_map *map);
 
 int drm_gem_vram_fill_create_dumb(struct drm_file *file,
 				  struct drm_device *dev,
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
