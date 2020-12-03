Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B6F2CD869
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 15:03:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 779526EB73;
	Thu,  3 Dec 2020 14:03:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0862E6EB68
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 14:03:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9CC83AD8A;
 Thu,  3 Dec 2020 14:03:07 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, hdegoede@redhat.com, christian.koenig@amd.com,
 sumit.semwal@linaro.org
Subject: [PATCH v2 3/7] drm/vram-helper: Move BO locking from vmap code into
 callers
Date: Thu,  3 Dec 2020 15:02:55 +0100
Message-Id: <20201203140259.26580-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201203140259.26580-1-tzimmermann@suse.de>
References: <20201203140259.26580-1-tzimmermann@suse.de>
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
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implementations of the vmap/vunmap callbacks may expect that the caller
holds the reservation lock. Therefore push the locking from vmap and
vunmap into the callers.

This affects fbdev emulation, and cursor updates in ast and vboxvideo.
Ast and vboxvideo acquire the BO's reservation lock directly.

Fbdev emulation uses DRM client helpers for locking. This is solely done
for consistency with the rest of the interface. Fbdev emulation tries to
avoid calling GEM interfaces.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_cursor.c      | 21 ++++++++++++++++--
 drivers/gpu/drm/drm_client.c          | 31 +++++++++++++++++++++++++++
 drivers/gpu/drm/drm_fb_helper.c       | 10 +++++++--
 drivers/gpu/drm/drm_gem_vram_helper.c | 18 +++-------------
 drivers/gpu/drm/vboxvideo/vbox_mode.c | 11 ++++++----
 include/drm/drm_client.h              |  2 ++
 6 files changed, 70 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_cursor.c
index fac1ee79c372..15e5c4fd301d 100644
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
@@ -168,9 +170,13 @@ int ast_cursor_blit(struct ast_private *ast, struct drm_framebuffer *fb)
 	    drm_WARN_ON_ONCE(dev, fb->height > AST_MAX_HWC_HEIGHT))
 		return -EINVAL;
 
-	ret = drm_gem_vram_vmap(src_gbo, &src_map);
+	ret = drm_gem_lock_reservations(objs, ARRAY_SIZE(objs), &ctx);
 	if (ret)
 		return ret;
+
+	ret = drm_gem_vram_vmap(src_gbo, &src_map);
+	if (ret)
+		goto err_drm_gem_unlock_reservations;
 	src = src_map.vaddr; /* TODO: Use mapping abstraction properly */
 
 	ret = drm_gem_vram_vmap(dst_gbo, &dst_map);
@@ -184,10 +190,14 @@ int ast_cursor_blit(struct ast_private *ast, struct drm_framebuffer *fb)
 	drm_gem_vram_vunmap(dst_gbo, &dst_map);
 	drm_gem_vram_vunmap(src_gbo, &src_map);
 
+	drm_gem_unlock_reservations(objs, ARRAY_SIZE(objs), &ctx);
+
 	return 0;
 
 err_drm_gem_vram_vunmap:
 	drm_gem_vram_vunmap(src_gbo, &src_map);
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
@@ -248,9 +259,14 @@ void ast_cursor_show(struct ast_private *ast, int x, int y,
 	u8 jreg;
 	int ret;
 
+	ret = dma_resv_lock(obj->resv, NULL);
+	if (ret)
+		return;
 	ret = drm_gem_vram_vmap(gbo, &map);
-	if (drm_WARN_ONCE(dev, ret, "drm_gem_vram_vmap() failed, ret=%d\n", ret))
+	if (drm_WARN_ONCE(dev, ret, "drm_gem_vram_vmap() failed, ret=%d\n", ret)) {
+		dma_resv_unlock(obj->resv);
 		return;
+	}
 	dst = map.vaddr_iomem; /* TODO: Use mapping abstraction properly */
 
 	sig = dst + AST_HWC_SIZE;
@@ -258,6 +274,7 @@ void ast_cursor_show(struct ast_private *ast, int x, int y,
 	writel(y, sig + AST_HWC_SIGNATURE_Y);
 
 	drm_gem_vram_vunmap(gbo, &map);
+	dma_resv_unlock(obj->resv);
 
 	if (x < 0) {
 		x_offset = (-x) + offset_x;
diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index ce45e380f4a2..82453ca0b3ec 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -288,6 +288,37 @@ drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height, u
 	return ERR_PTR(ret);
 }
 
+/**
+ * drm_client_buffer_lock - Locks the DRM client buffer
+ * @buffer: DRM client buffer
+ *
+ * This function locks the client buffer by acquiring the buffer
+ * object's reservation lock.
+ *
+ * Unlock the buffer with drm_client_buffer_unlock().
+ *
+ * Returns:
+ *	0 on success, or a negative errno code otherwise.
+ */
+int
+drm_client_buffer_lock(struct drm_client_buffer *buffer)
+{
+	return dma_resv_lock(buffer->gem->resv, NULL);
+}
+EXPORT_SYMBOL(drm_client_buffer_lock);
+
+/**
+ * drm_client_buffer_unlock - Unlock DRM client buffer
+ * @buffer: DRM client buffer
+ *
+ * Unlocks a client buffer. See drm_client_buffer_lock().
+ */
+void drm_client_buffer_unlock(struct drm_client_buffer *buffer)
+{
+	dma_resv_unlock(buffer->gem->resv);
+}
+EXPORT_SYMBOL(drm_client_buffer_unlock);
+
 /**
  * drm_client_buffer_vmap - Map DRM client buffer into address space
  * @buffer: DRM client buffer
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 4b8119510687..97856d9194de 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -411,16 +411,22 @@ static int drm_fb_helper_damage_blit(struct drm_fb_helper *fb_helper,
 	 */
 	mutex_lock(&fb_helper->lock);
 
+	ret = drm_client_buffer_lock(buffer);
+	if (ret)
+		goto out_mutex_unlock;
+
 	ret = drm_client_buffer_vmap(buffer, &map);
 	if (ret)
-		goto out;
+		goto out_drm_client_buffer_unlock;
 
 	dst = map;
 	drm_fb_helper_damage_blit_real(fb_helper, clip, &dst);
 
 	drm_client_buffer_vunmap(buffer);
 
-out:
+out_drm_client_buffer_unlock:
+	drm_client_buffer_unlock(buffer);
+out_mutex_unlock:
 	mutex_unlock(&fb_helper->lock);
 
 	return ret;
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 02ca22e90290..35a30dafccce 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -440,25 +440,19 @@ int drm_gem_vram_vmap(struct drm_gem_vram_object *gbo, struct dma_buf_map *map)
 {
 	int ret;
 
-	ret = ttm_bo_reserve(&gbo->bo, true, false, NULL);
-	if (ret)
-		return ret;
+	dma_resv_assert_held(gbo->bo.base.resv);
 
 	ret = drm_gem_vram_pin_locked(gbo, 0);
 	if (ret)
-		goto err_ttm_bo_unreserve;
+		return ret;
 	ret = drm_gem_vram_kmap_locked(gbo, map);
 	if (ret)
 		goto err_drm_gem_vram_unpin_locked;
 
-	ttm_bo_unreserve(&gbo->bo);
-
 	return 0;
 
 err_drm_gem_vram_unpin_locked:
 	drm_gem_vram_unpin_locked(gbo);
-err_ttm_bo_unreserve:
-	ttm_bo_unreserve(&gbo->bo);
 	return ret;
 }
 EXPORT_SYMBOL(drm_gem_vram_vmap);
@@ -473,16 +467,10 @@ EXPORT_SYMBOL(drm_gem_vram_vmap);
  */
 void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo, struct dma_buf_map *map)
 {
-	int ret;
-
-	ret = ttm_bo_reserve(&gbo->bo, false, false, NULL);
-	if (WARN_ONCE(ret, "ttm_bo_reserve_failed(): ret=%d\n", ret))
-		return;
+	dma_resv_assert_held(gbo->bo.base.resv);
 
 	drm_gem_vram_kunmap_locked(gbo, map);
 	drm_gem_vram_unpin_locked(gbo);
-
-	ttm_bo_unreserve(&gbo->bo);
 }
 EXPORT_SYMBOL(drm_gem_vram_vunmap);
 
diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
index dbc0dd53c69e..8b1a8522144e 100644
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
 
+	ret = dma_resv_lock(obj->resv, NULL);
+	if (ret)
+		return;
 	ret = drm_gem_vram_vmap(gbo, &map);
 	if (ret) {
-		/*
-		 * BUG: we should have pinned the BO in prepare_fb().
-		 */
+		dma_resv_unlock(obj->resv);
 		mutex_unlock(&vbox->hw_mutex);
 		DRM_WARN("Could not map cursor bo, skipping update\n");
 		return;
@@ -422,6 +424,7 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
 
 	copy_cursor_image(src, vbox->cursor_data, width, height, mask_size);
 	drm_gem_vram_vunmap(gbo, &map);
+	dma_resv_unlock(obj->resv);
 
 	flags = VBOX_MOUSE_POINTER_VISIBLE | VBOX_MOUSE_POINTER_SHAPE |
 		VBOX_MOUSE_POINTER_ALPHA;
diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
index f07f2fb02e75..1cf811471fc4 100644
--- a/include/drm/drm_client.h
+++ b/include/drm/drm_client.h
@@ -156,6 +156,8 @@ struct drm_client_buffer *
 drm_client_framebuffer_create(struct drm_client_dev *client, u32 width, u32 height, u32 format);
 void drm_client_framebuffer_delete(struct drm_client_buffer *buffer);
 int drm_client_framebuffer_flush(struct drm_client_buffer *buffer, struct drm_rect *rect);
+int drm_client_buffer_lock(struct drm_client_buffer *buffer);
+void drm_client_buffer_unlock(struct drm_client_buffer *buffer);
 int drm_client_buffer_vmap(struct drm_client_buffer *buffer, struct dma_buf_map *map);
 void drm_client_buffer_vunmap(struct drm_client_buffer *buffer);
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
