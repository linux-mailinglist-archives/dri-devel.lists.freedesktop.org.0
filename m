Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FD358F7EC
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 08:50:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB345A46FB;
	Thu, 11 Aug 2022 06:49:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (unknown [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE0814B61D
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 03:54:40 +0000 (UTC)
X-UUID: 328f09c9b7304a3a8d9a50012db37c3f-20220809
X-Spam-Fingerprint: 0
X-GW-Reason: 11109
X-Policy-Incident: 5pS25Lu25Lq66LaF6L+HMeS6uumcgOimgeWuoeaguA==
X-Content-Feature: ica/max.line-size 104 audit/email.address 1 dict/adv 1
 dict/contack 1 dict/notice 2 dict/operate 1 meta/cnt.alert 1
X-UUID: 328f09c9b7304a3a8d9a50012db37c3f-20220809
X-User: oushixiong@kylinos.cn
Received: from localhost.localdomain [(116.128.244.169)] by mailgw
 (envelope-from <oushixiong@kylinos.cn>) (Generic MTA)
 with ESMTP id 20370262; Tue, 09 Aug 2022 19:44:41 +0800
From: oushixiong <oushixiong@kylinos.cn>
To: Dave Airlie <airlied@redhat.com>
Subject: [PATCH] drm/ast: radeon amdgpu for ast add prime
Date: Tue,  9 Aug 2022 19:44:39 +0800
Message-Id: <20220809114439.2063863-1-oushixiong@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 11 Aug 2022 06:49:27 +0000
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
Cc: oushixiong <oushixiong@kylinos.cn>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds ast specific codes for DRM prime feature.
Add the prime function to solve the xorg conflict problem when AST
and AMD are in place at the same time, so that both can be displayed.

Signed-off-by: oushixiong <oushixiong@kylinos.cn>
---
 drivers/gpu/drm/ast/ast_drv.c                |  22 ++++
 drivers/gpu/drm/ast/ast_mode.c               | 115 ++++++++++++++++++-
 drivers/gpu/drm/drm_gem_framebuffer_helper.c |   1 -
 drivers/gpu/drm/drm_gem_vram_helper.c        |  16 ++-
 include/drm/drm_gem_vram_helper.h            |   4 +-
 5 files changed, 150 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index 7465c4f0156a..3650462a8734 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -28,6 +28,7 @@
 
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/dma-buf.h>
 
 #include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
@@ -50,6 +51,23 @@ module_param_named(modeset, ast_modeset, int, 0400);
 
 DEFINE_DRM_GEM_FOPS(ast_fops);
 
+struct drm_gem_object *ast_gem_prime_import_sg_table(struct drm_device *dev,
+					struct dma_buf_attachment *attach,
+					struct sg_table *sg)
+{
+	struct drm_gem_vram_object *gbo;
+	struct dma_resv *resv = attach->dmabuf->resv;
+
+	ww_mutex_lock(&resv->lock, NULL);
+	gbo = drm_gem_vram_create(dev, attach->dmabuf->size, 0, sg, resv);
+	ww_mutex_unlock(&resv->lock);
+
+	if (IS_ERR(gbo))
+		return NULL;
+
+	return &gbo->bo.base;
+}
+
 static const struct drm_driver ast_driver = {
 	.driver_features = DRIVER_ATOMIC |
 			   DRIVER_GEM |
@@ -63,6 +81,10 @@ static const struct drm_driver ast_driver = {
 	.minor = DRIVER_MINOR,
 	.patchlevel = DRIVER_PATCHLEVEL,
 
+	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
+	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
+	.gem_prime_import_sg_table = ast_gem_prime_import_sg_table,
+
 	DRM_GEM_VRAM_DRIVER
 };
 
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 45b56b39ad47..f059faa8c35a 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -48,6 +48,8 @@
 #include "ast_drv.h"
 #include "ast_tables.h"
 
+MODULE_IMPORT_NS(DMA_BUF);
+
 static inline void ast_load_palette_index(struct ast_private *ast,
 				     u8 index, u8 red, u8 green,
 				     u8 blue)
@@ -926,7 +928,7 @@ static int ast_cursor_plane_init(struct ast_private *ast)
 	size = roundup(AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE, PAGE_SIZE);
 
 	for (i = 0; i < ARRAY_SIZE(ast_cursor_plane->hwc); ++i) {
-		gbo = drm_gem_vram_create(dev, size, 0);
+		gbo = drm_gem_vram_create(dev, size, 0, NULL, NULL);
 		if (IS_ERR(gbo)) {
 			ret = PTR_ERR(gbo);
 			goto err_hwc;
@@ -1535,8 +1537,117 @@ static const struct drm_mode_config_helper_funcs ast_mode_config_helper_funcs =
 	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
 };
 
+int ast_handle_damage(struct drm_framebuffer *fb, int x, int y,
+					int width, int height)
+{
+	struct drm_gem_vram_object *dst_bo = NULL;
+	void *dst = NULL;
+	int ret = 0, i;
+	unsigned long offset = 0;
+	bool unmap = false;
+	unsigned int bytesPerPixel;
+	struct iosys_map map;
+	struct iosys_map dmabuf_map;
+
+	bytesPerPixel = fb->format->cpp[0];
+
+	if (!fb->obj[0]->import_attach)
+		return -EINVAL;
+
+	if (!fb->obj[0]->import_attach->dmabuf->vmap_ptr.vaddr) {
+		ret = dma_buf_vmap(fb->obj[0]->import_attach->dmabuf, &dmabuf_map);
+		if (ret)
+			return 0;
+	} else {
+		dmabuf_map.vaddr = fb->obj[0]->import_attach->dmabuf->vmap_ptr.vaddr;
+	}
+
+	dst_bo = drm_gem_vram_of_gem(fb->obj[0]);
+
+	ret = drm_gem_vram_pin(dst_bo, 0);
+	if (ret) {
+		DRM_ERROR("ast_bo_pin failed\n");
+		goto error;
+	}
+
+	if (!dst_bo->map.vaddr) {
+		ret = drm_gem_vram_vmap(dst_bo, &map);
+		if (ret) {
+			DRM_ERROR("failed to vmap fbcon\n");
+			drm_gem_vram_unpin(dst_bo);
+			goto error;
+		}
+		unmap = true;
+	}
+	dst = dst_bo->map.vaddr;
+
+	for (i = y; i < y + height; i++) {
+		offset = i * fb->pitches[0] + (x * bytesPerPixel);
+		memcpy_toio(dst + offset, dmabuf_map.vaddr + offset,
+			width * bytesPerPixel);
+	}
+
+	if (unmap)
+		drm_gem_vram_vunmap(dst_bo, &map);
+
+	drm_gem_vram_unpin(dst_bo);
+error:
+	return 0;
+}
+
+
+int ast_user_framebuffer_dirty(struct drm_framebuffer *fb,
+				struct drm_file *file,
+				unsigned int flags,
+				unsigned int color,
+				struct drm_clip_rect *clips,
+				unsigned int num_clips)
+{
+	int i, ret = 0;
+
+	drm_modeset_lock_all(fb->dev);
+	if (fb->obj[0]->import_attach) {
+		ret = dma_buf_begin_cpu_access(fb->obj[0]->import_attach->dmabuf,
+				DMA_FROM_DEVICE);
+		if (ret)
+			goto unlock;
+	}
+
+	for (i = 0; i < num_clips; i++) {
+		ret = ast_handle_damage(fb, clips[i].x1, clips[i].y1,
+				clips[i].x2 - clips[i].x1, clips[i].y2 - clips[i].y1);
+		if (ret)
+			break;
+	}
+
+	if (fb->obj[0]->import_attach) {
+		dma_buf_end_cpu_access(fb->obj[0]->import_attach->dmabuf,
+				DMA_FROM_DEVICE);
+	}
+
+unlock:
+	drm_modeset_unlock_all(fb->dev);
+
+	return ret;
+}
+EXPORT_SYMBOL(ast_user_framebuffer_dirty);
+
+static const struct drm_framebuffer_funcs ast_gem_fb_funcs_dirtyfb = {
+	.destroy	= drm_gem_fb_destroy,
+	.create_handle	= drm_gem_fb_create_handle,
+	.dirty		= ast_user_framebuffer_dirty,
+};
+
+struct drm_framebuffer *
+ast_gem_fb_create_with_dirty(struct drm_device *dev, struct drm_file *file,
+				const struct drm_mode_fb_cmd2 *mode_cmd)
+{
+	return drm_gem_fb_create_with_funcs(dev, file, mode_cmd,
+					&ast_gem_fb_funcs_dirtyfb);
+}
+
 static const struct drm_mode_config_funcs ast_mode_config_funcs = {
-	.fb_create = drm_gem_fb_create,
+	.fb_create = ast_gem_fb_create_with_dirty,
 	.mode_valid = drm_vram_helper_mode_valid,
 	.atomic_check = drm_atomic_helper_check,
 	.atomic_commit = drm_atomic_helper_commit,
diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
index f4619803acd0..f65165d5e86c 100644
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
@@ -15,7 +15,6 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_modeset_helper.h>
-
 #include "drm_internal.h"
 
 MODULE_IMPORT_NS(DMA_BUF);
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index dc7f938bfff2..a31adb3c546d 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -184,14 +184,22 @@ static void drm_gem_vram_placement(struct drm_gem_vram_object *gbo,
  */
 struct drm_gem_vram_object *drm_gem_vram_create(struct drm_device *dev,
 						size_t size,
-						unsigned long pg_align)
+						unsigned long pg_align,
+						struct sg_table *sg,
+						struct dma_resv *resv)
 {
 	struct drm_gem_vram_object *gbo;
 	struct drm_gem_object *gem;
 	struct drm_vram_mm *vmm = dev->vram_mm;
 	struct ttm_device *bdev;
+	enum ttm_bo_type type;
 	int ret;
 
+	if (sg)
+		type = ttm_bo_type_sg;
+	else
+		type = ttm_bo_type_device;
+
 	if (WARN_ONCE(!vmm, "VRAM MM not initialized"))
 		return ERR_PTR(-EINVAL);
 
@@ -225,8 +233,8 @@ struct drm_gem_vram_object *drm_gem_vram_create(struct drm_device *dev,
 	 * A failing ttm_bo_init will call ttm_buffer_object_destroy
 	 * to release gbo->bo.base and kfree gbo.
 	 */
-	ret = ttm_bo_init(bdev, &gbo->bo, size, ttm_bo_type_device,
-			  &gbo->placement, pg_align, false, NULL, NULL,
+	ret = ttm_bo_init(bdev, &gbo->bo, size, type,
+			  &gbo->placement, pg_align, false, sg, resv,
 			  ttm_buffer_object_destroy);
 	if (ret)
 		return ERR_PTR(ret);
@@ -521,7 +529,7 @@ int drm_gem_vram_fill_create_dumb(struct drm_file *file,
 	if (!size)
 		return -EINVAL;
 
-	gbo = drm_gem_vram_create(dev, size, pg_align);
+	gbo = drm_gem_vram_create(dev, size, pg_align, NULL, NULL);
 	if (IS_ERR(gbo))
 		return PTR_ERR(gbo);
 
diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
index c083a1d71cf4..42c8f181cbd7 100644
--- a/include/drm/drm_gem_vram_helper.h
+++ b/include/drm/drm_gem_vram_helper.h
@@ -92,7 +92,9 @@ static inline struct drm_gem_vram_object *drm_gem_vram_of_gem(
 
 struct drm_gem_vram_object *drm_gem_vram_create(struct drm_device *dev,
 						size_t size,
-						unsigned long pg_align);
+						unsigned long pg_align,
+						struct sg_table *sg,
+						struct dma_resv *resv);
 void drm_gem_vram_put(struct drm_gem_vram_object *gbo);
 s64 drm_gem_vram_offset(struct drm_gem_vram_object *gbo);
 int drm_gem_vram_pin(struct drm_gem_vram_object *gbo, unsigned long pl_flag);
-- 
2.17.1


No virus found
		Checked by Hillstone Network AntiVirus
