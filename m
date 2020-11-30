Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBAD2C83C9
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 13:04:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A43D89DB4;
	Mon, 30 Nov 2020 12:04:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DFB289D66
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 12:04:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 30E9CAE6E;
 Mon, 30 Nov 2020 12:04:40 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, hdegoede@redhat.com, christian.koenig@amd.com
Subject: [PATCH 6/8] drm/vram-helper: Remove pinning and locking from
 drm_gem_vram_vmap()
Date: Mon, 30 Nov 2020 13:04:31 +0100
Message-Id: <20201130120433.7205-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201130120433.7205-1-tzimmermann@suse.de>
References: <20201130120433.7205-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

BO pinning was never meant to be part of a GEM object's vmap operation.
Remove it from the related code in VRAM helpers. Pinning requires a
locking operation in the vmap code, which we also remove. Callers of
drm_gem_vram_vmap()/_vunmap() are now responsible for acquiring the GEM
object's reservation lock around their vmap/vunmap blocks.

The two remaining callers are fb helpers and ast cursor updates. The
fbdev helpers now call an explicit lock/unlock in their damage worker
to prevent the BO from being evicted.

The ast cursor code acquires the reservation locks of the cursor's HW BO
and the cursor plane's framebuffer BO. Once acquired, it vmaps both BOs
and updates the HW BO from the plane's BO.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_cursor.c      | 18 +++++++++------
 drivers/gpu/drm/drm_client.c          | 31 +++++++++++++++++++++++++
 drivers/gpu/drm/drm_fb_helper.c       | 10 ++++++--
 drivers/gpu/drm/drm_gem_vram_helper.c | 33 +++------------------------
 include/drm/drm_client.h              |  2 ++
 5 files changed, 55 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_cursor.c
index 7a56838fb703..9273276d278a 100644
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
@@ -168,17 +170,18 @@ int ast_cursor_blit(struct ast_private *ast, struct drm_framebuffer *fb)
 	    drm_WARN_ON_ONCE(dev, fb->height > AST_MAX_HWC_HEIGHT))
 		return -EINVAL;
 
-	ret = drm_gem_vram_pin(src_gbo, 0);
+	ret = drm_gem_lock_reservations(objs, ARRAY_SIZE(objs), &ctx);
 	if (ret)
 		return ret;
+
 	ret = drm_gem_vram_vmap(src_gbo, &src_map);
 	if (ret)
-		goto err_drm_gem_vram_unpin_src;
+		goto err_drm_gem_unlock_reservations;
 	src = src_map.vaddr; /* TODO: Use mapping abstraction properly */
 
 	ret = drm_gem_vram_vmap(dst_gbo, &dst_map);
 	if (ret)
-		goto err_drm_gem_vram_vunmap_src;
+		goto err_drm_gem_vram_vunmap;
 	dst = dst_map.vaddr_iomem; /* TODO: Use mapping abstraction properly */
 
 	/* do data transfer to cursor BO */
@@ -186,14 +189,15 @@ int ast_cursor_blit(struct ast_private *ast, struct drm_framebuffer *fb)
 
 	drm_gem_vram_vunmap(dst_gbo, &dst_map);
 	drm_gem_vram_vunmap(src_gbo, &src_map);
-	drm_gem_vram_unpin(src_gbo);
+
+	drm_gem_unlock_reservations(objs, ARRAY_SIZE(objs), &ctx);
 
 	return 0;
 
-err_drm_gem_vram_vunmap_src:
+err_drm_gem_vram_vunmap:
 	drm_gem_vram_vunmap(src_gbo, &src_map);
-err_drm_gem_vram_unpin_src:
-	drm_gem_vram_unpin(src_gbo);
+err_drm_gem_unlock_reservations:
+	drm_gem_unlock_reservations(objs, ARRAY_SIZE(objs), &ctx);
 	return ret;
 }
 
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
index af54cb52423b..ac0fa9da1c83 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -438,28 +438,9 @@ static void drm_gem_vram_kunmap_locked(struct drm_gem_vram_object *gbo,
  */
 int drm_gem_vram_vmap(struct drm_gem_vram_object *gbo, struct dma_buf_map *map)
 {
-	int ret;
+	dma_resv_assert_held(gbo->bo.base.resv);
 
-	ret = ttm_bo_reserve(&gbo->bo, true, false, NULL);
-	if (ret)
-		return ret;
-
-	ret = drm_gem_vram_pin_locked(gbo, 0);
-	if (ret)
-		goto err_ttm_bo_unreserve;
-	ret = drm_gem_vram_kmap_locked(gbo, map);
-	if (ret)
-		goto err_drm_gem_vram_unpin_locked;
-
-	ttm_bo_unreserve(&gbo->bo);
-
-	return 0;
-
-err_drm_gem_vram_unpin_locked:
-	drm_gem_vram_unpin_locked(gbo);
-err_ttm_bo_unreserve:
-	ttm_bo_unreserve(&gbo->bo);
-	return ret;
+	return drm_gem_vram_kmap_locked(gbo, map);
 }
 EXPORT_SYMBOL(drm_gem_vram_vmap);
 
@@ -473,16 +454,8 @@ EXPORT_SYMBOL(drm_gem_vram_vmap);
  */
 void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo, struct dma_buf_map *map)
 {
-	int ret;
-
-	ret = ttm_bo_reserve(&gbo->bo, false, false, NULL);
-	if (WARN_ONCE(ret, "ttm_bo_reserve_failed(): ret=%d\n", ret))
-		return;
-
+	dma_resv_assert_held(gbo->bo.base.resv);
 	drm_gem_vram_kunmap_locked(gbo, map);
-	drm_gem_vram_unpin_locked(gbo);
-
-	ttm_bo_unreserve(&gbo->bo);
 }
 EXPORT_SYMBOL(drm_gem_vram_vunmap);
 
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
