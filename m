Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E88A3150B1
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 14:47:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8E296EB56;
	Tue,  9 Feb 2021 13:46:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 996926EB42
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 13:46:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3C086AFF2;
 Tue,  9 Feb 2021 13:46:38 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	daniel@ffwll.ch
Subject: [PATCH v2 10/10] drm/ast: Move all of the cursor-update functionality
 to atomic_update
Date: Tue,  9 Feb 2021 14:46:32 +0100
Message-Id: <20210209134632.12157-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210209134632.12157-1-tzimmermann@suse.de>
References: <20210209134632.12157-1-tzimmermann@suse.de>
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

We used to update the cursor image in prepare_fb. Move all this code to
atomic_update (where it belongs). The generic helper for shadow-buffered
planes now implement the cursor plane's prepare_fb.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_mode.c | 66 ++++++++++++----------------------
 1 file changed, 22 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index e8de86d23805..617b4c4af1a5 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -37,6 +37,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_vram_helper.h>
 #include <drm/drm_plane_helper.h>
@@ -753,40 +754,6 @@ static const uint32_t ast_cursor_plane_formats[] = {
 	DRM_FORMAT_ARGB8888,
 };
 
-static int
-ast_cursor_plane_helper_prepare_fb(struct drm_plane *plane,
-				   struct drm_plane_state *new_state)
-{
-	struct ast_cursor_plane *ast_cursor_plane = to_ast_cursor_plane(plane);
-	struct drm_framebuffer *fb = new_state->fb;
-	struct dma_buf_map dst_map =
-		ast_cursor_plane->hwc[ast_cursor_plane->next_hwc_index].map;
-	struct drm_gem_vram_object *src_gbo;
-	struct dma_buf_map src_map;
-	void __iomem *dst;
-	void *src;
-	int ret;
-
-	if (!fb)
-		return 0;
-
-	src_gbo = drm_gem_vram_of_gem(fb->obj[0]);
-
-	ret = drm_gem_vram_vmap(src_gbo, &src_map);
-	if (ret)
-		return ret;
-	src = src_map.vaddr; /* TODO: Use mapping abstraction properly */
-
-	dst = dst_map.vaddr_iomem; /* TODO: Use mapping abstraction properly */
-
-	/* do data transfer to cursor BO */
-	ast_update_cursor_image(dst, src, fb->width, fb->height);
-
-	drm_gem_vram_vunmap(src_gbo, &src_map);
-
-	return 0;
-}
-
 static int ast_cursor_plane_helper_atomic_check(struct drm_plane *plane,
 						struct drm_plane_state *state)
 {
@@ -821,18 +788,31 @@ ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
 {
 	struct ast_cursor_plane *ast_cursor_plane = to_ast_cursor_plane(plane);
 	struct drm_plane_state *state = plane->state;
+	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(state);
 	struct drm_framebuffer *fb = state->fb;
 	struct ast_private *ast = to_ast_private(plane->dev);
+	struct dma_buf_map dst_map =
+		ast_cursor_plane->hwc[ast_cursor_plane->next_hwc_index].map;
 	u64 dst_off =
 		ast_cursor_plane->hwc[ast_cursor_plane->next_hwc_index].off;
+	struct dma_buf_map src_map = shadow_plane_state->map[0];
 	unsigned int offset_x, offset_y;
-	struct dma_buf_map map;
 	u16 x, y;
 	u8 x_offset, y_offset;
 	u8 __iomem *dst;
 	u8 __iomem *sig;
+	const u8 *src;
+
+	src = src_map.vaddr; /* TODO: Use mapping abstraction properly */
+	dst = dst_map.vaddr_iomem; /* TODO: Use mapping abstraction properly */
+	sig = dst + AST_HWC_SIZE; /* TODO: Use mapping abstraction properly */
 
-	map = ast_cursor_plane->hwc[ast_cursor_plane->next_hwc_index].map;
+	/*
+	 * Do data transfer to HW cursor BO. If a new cursor image was installed,
+	 * point the scanout engine to dst_gbo's offset and page-flip the HWC buffers.
+	 */
+
+	ast_update_cursor_image(dst, src, fb->width, fb->height);
 
 	if (state->fb != old_state->fb) {
 		ast_set_cursor_base(ast, dst_off);
@@ -841,9 +821,10 @@ ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
 		ast_cursor_plane->next_hwc_index %= ARRAY_SIZE(ast_cursor_plane->hwc);
 	}
 
-	dst = map.vaddr_iomem; /* TODO: Use mapping abstraction properly */
+	/*
+	 * Update location in HWC signature and registers.
+	 */
 
-	sig = dst + AST_HWC_SIZE;
 	writel(state->crtc_x, sig + AST_HWC_SIGNATURE_X);
 	writel(state->crtc_y, sig + AST_HWC_SIGNATURE_Y);
 
@@ -867,7 +848,7 @@ ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
 
 	ast_set_cursor_location(ast, x, y, x_offset, y_offset);
 
-	/* dummy write to fire HWC */
+	/* Dummy write to enable HWC and make the HW pick-up the changes. */
 	ast_set_cursor_enabled(ast, true);
 }
 
@@ -881,8 +862,7 @@ ast_cursor_plane_helper_atomic_disable(struct drm_plane *plane,
 }
 
 static const struct drm_plane_helper_funcs ast_cursor_plane_helper_funcs = {
-	.prepare_fb = ast_cursor_plane_helper_prepare_fb,
-	.cleanup_fb = NULL, /* not required for cursor plane */
+	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
 	.atomic_check = ast_cursor_plane_helper_atomic_check,
 	.atomic_update = ast_cursor_plane_helper_atomic_update,
 	.atomic_disable = ast_cursor_plane_helper_atomic_disable,
@@ -910,9 +890,7 @@ static const struct drm_plane_funcs ast_cursor_plane_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
 	.destroy = ast_cursor_plane_destroy,
-	.reset = drm_atomic_helper_plane_reset,
-	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
+	DRM_GEM_SHADOW_PLANE_FUNCS,
 };
 
 static int ast_cursor_plane_init(struct ast_private *ast)
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
