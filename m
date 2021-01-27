Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B40F9305AA5
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 13:03:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 633B86E1B1;
	Wed, 27 Jan 2021 12:03:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C472F6E19B
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 12:03:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 67AACAC9B;
 Wed, 27 Jan 2021 12:03:10 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	daniel@ffwll.ch
Subject: [PATCH 11/12] drm/ast: Move all of the cursor-update functionality to
 atomic_update
Date: Wed, 27 Jan 2021 13:03:01 +0100
Message-Id: <20210127120302.13532-12-tzimmermann@suse.de>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210127120302.13532-1-tzimmermann@suse.de>
References: <20210127120302.13532-1-tzimmermann@suse.de>
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
atomic_update (were it belongs). Prepare_fb only prepares the source BO.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_mode.c | 56 +++++++++++++++++-----------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 192d3d34b9ed..716ed7025b41 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -771,42 +771,30 @@ static int
 ast_cursor_plane_helper_prepare_fb(struct drm_plane *plane,
 				   struct drm_plane_state *new_state)
 {
-	struct ast_cursor_plane *ast_cursor_plane = to_ast_cursor_plane(plane);
 	struct drm_framebuffer *fb = new_state->fb;
-	struct dma_buf_map dst_map =
-		ast_cursor_plane->hwc[ast_cursor_plane->next_hwc_index].map;
 	struct ast_cursor_plane_state *new_ast_state = to_ast_cursor_plane_state(new_state);
-	struct drm_gem_vram_object *src_gbo;
-	struct dma_buf_map src_map;
-	void __iomem *dst;
-	void *src;
+	struct drm_gem_vram_object *gbo;
+	struct dma_buf_map map;
 	int ret;
 
 	if (!fb)
 		return 0;
 
-	src_gbo = drm_gem_vram_of_gem(fb->obj[0]);
+	gbo = drm_gem_vram_of_gem(fb->obj[0]);
 
-	ret = drm_gem_vram_pin(src_gbo, 0);
+	ret = drm_gem_vram_pin(gbo, 0);
 	if (ret)
 		return ret;
 
-	ret = drm_gem_vram_vmap(src_gbo, &src_map);
+	ret = drm_gem_vram_vmap(gbo, &map);
 	if (ret)
 		goto err_drm_gem_vram_unpin;
-	src = src_map.vaddr; /* TODO: Use mapping abstraction properly */
-
-	dst = dst_map.vaddr_iomem; /* TODO: Use mapping abstraction properly */
-
-	/* do data transfer to cursor BO */
-	ast_update_cursor_image(dst, src, fb->width, fb->height);
-
-	new_ast_state->map = src_map;
+	new_ast_state->map = map;
 
 	return 0;
 
 err_drm_gem_vram_unpin:
-	drm_gem_vram_unpin(src_gbo);
+	drm_gem_vram_unpin(gbo);
 	return ret;
 }
 
@@ -862,25 +850,36 @@ ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
 {
 	struct ast_cursor_plane *ast_cursor_plane = to_ast_cursor_plane(plane);
 	struct drm_plane_state *state = plane->state;
+	struct ast_cursor_plane_state *ast_state = to_ast_cursor_plane_state(state);
 	struct drm_framebuffer *fb = state->fb;
 	struct ast_private *ast = to_ast_private(plane->dev);
 	struct drm_device *dev = &ast->base;
-	struct drm_gem_vram_object *gbo =
+	struct drm_gem_vram_object *dst_gbo =
 		ast_cursor_plane->hwc[ast_cursor_plane->next_hwc_index].gbo;
+	struct dma_buf_map dst_map =
+		ast_cursor_plane->hwc[ast_cursor_plane->next_hwc_index].map;
+	struct dma_buf_map src_map = ast_state->map;
 	unsigned int offset_x, offset_y;
 	s64 off;
-	struct dma_buf_map map;
 	u16 x, y;
 	u8 x_offset, y_offset;
 	u8 __iomem *dst;
 	u8 __iomem *sig;
+	const u8 *src;
 
-	gbo = ast_cursor_plane->hwc[ast_cursor_plane->next_hwc_index].gbo;
-	map = ast_cursor_plane->hwc[ast_cursor_plane->next_hwc_index].map;
+	src = src_map.vaddr; /* TODO: Use mapping abstraction properly */
+	dst = dst_map.vaddr_iomem; /* TODO: Use mapping abstraction properly */
+	sig = dst + AST_HWC_SIZE; /* TODO: Use mapping abstraction properly */
+
+	/*
+	 * Do data transfer to HW cursor BO. If a new cursor image was installed,
+	 * point the scanout engine to dst_gbo's offset and page-flip the HWC buffers.
+	 */
+
+	ast_update_cursor_image(dst, src, fb->width, fb->height);
 
 	if (state->fb != old_state->fb) {
-		/* A new cursor image was installed. */
-		off = drm_gem_vram_offset(gbo);
+		off = drm_gem_vram_offset(dst_gbo);
 		if (drm_WARN_ON_ONCE(dev, off < 0))
 			return; /* Bug: we didn't pin the cursor HW BO to VRAM. */
 		ast_set_cursor_base(ast, off);
@@ -889,9 +888,10 @@ ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
 		ast_cursor_plane->next_hwc_index %= ARRAY_SIZE(ast_cursor_plane->hwc);
 	}
 
-	dst = map.vaddr_iomem; /* TODO: Use mapping abstraction properly */
+	/*
+	 * Update location in HWC signature and registers.
+	 */
 
-	sig = dst + AST_HWC_SIZE;
 	writel(state->crtc_x, sig + AST_HWC_SIGNATURE_X);
 	writel(state->crtc_y, sig + AST_HWC_SIGNATURE_Y);
 
@@ -915,7 +915,7 @@ ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
 
 	ast_set_cursor_location(ast, x, y, x_offset, y_offset);
 
-	/* dummy write to fire HWC */
+	/* Dummy write to enable HWC and make the HW pick-up the changes. */
 	ast_set_cursor_enabled(ast, true);
 }
 
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
