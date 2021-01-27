Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCB4305AB2
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 13:03:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13C766E5D2;
	Wed, 27 Jan 2021 12:03:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F9B56E19B
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 12:03:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 32C83AE5C;
 Wed, 27 Jan 2021 12:03:09 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	daniel@ffwll.ch
Subject: [PATCH 07/12] drm/ast: Store cursor BOs in cursor plane
Date: Wed, 27 Jan 2021 13:02:57 +0100
Message-Id: <20210127120302.13532-8-tzimmermann@suse.de>
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

The cursor uses two BOs in video RAM to implement double buffering. Store
both in struct ast_cursor_plane.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_drv.h  | 11 ++++++-----
 drivers/gpu/drm/ast/ast_mode.c | 27 +++++++++++++++------------
 2 files changed, 21 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 9eefd3f01f4c..4117c49096d4 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -104,6 +104,12 @@ enum ast_tx_chip {
 
 struct ast_cursor_plane {
 	struct drm_plane base;
+
+	struct {
+		struct drm_gem_vram_object *gbo;
+	} hwc[AST_DEFAULT_HWC_NUM];
+
+	unsigned int next_hwc_index;
 };
 
 static inline struct ast_cursor_plane *
@@ -151,11 +157,6 @@ struct ast_private {
 
 	int fb_mtrr;
 
-	struct {
-		struct drm_gem_vram_object *gbo[AST_DEFAULT_HWC_NUM];
-		unsigned int next_index;
-	} cursor;
-
 	struct drm_plane primary_plane;
 	struct ast_cursor_plane cursor_plane;
 	struct drm_crtc crtc;
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 9dc70aa62fef..dfff30e3d411 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -757,9 +757,10 @@ static int
 ast_cursor_plane_helper_prepare_fb(struct drm_plane *plane,
 				   struct drm_plane_state *new_state)
 {
+	struct ast_cursor_plane *ast_cursor_plane = to_ast_cursor_plane(plane);
 	struct drm_framebuffer *fb = new_state->fb;
-	struct ast_private *ast = to_ast_private(plane->dev);
-	struct drm_gem_vram_object *dst_gbo = ast->cursor.gbo[ast->cursor.next_index];
+	struct drm_gem_vram_object *dst_gbo =
+		ast_cursor_plane->hwc[ast_cursor_plane->next_hwc_index].gbo;
 	struct drm_gem_vram_object *src_gbo;
 	struct dma_buf_map src_map, dst_map;
 	void __iomem *dst;
@@ -826,11 +827,13 @@ static void
 ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
 				      struct drm_plane_state *old_state)
 {
+	struct ast_cursor_plane *ast_cursor_plane = to_ast_cursor_plane(plane);
 	struct drm_plane_state *state = plane->state;
 	struct drm_framebuffer *fb = state->fb;
 	struct ast_private *ast = to_ast_private(plane->dev);
 	struct drm_device *dev = &ast->base;
-	struct drm_gem_vram_object *gbo = ast->cursor.gbo[ast->cursor.next_index];
+	struct drm_gem_vram_object *gbo =
+		ast_cursor_plane->hwc[ast_cursor_plane->next_hwc_index].gbo;
 	unsigned int offset_x, offset_y;
 	s64 off;
 	struct dma_buf_map map;
@@ -840,7 +843,7 @@ ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
 	u8 __iomem *sig;
 	int ret;
 
-	gbo = ast->cursor.gbo[ast->cursor.next_index];
+	gbo = ast_cursor_plane->hwc[ast_cursor_plane->next_hwc_index].gbo;
 
 	if (state->fb != old_state->fb) {
 		/* A new cursor image was installed. */
@@ -849,8 +852,8 @@ ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
 			return; /* Bug: we didn't pin the cursor HW BO to VRAM. */
 		ast_set_cursor_base(ast, off);
 
-		++ast->cursor.next_index;
-		ast->cursor.next_index %= ARRAY_SIZE(ast->cursor.gbo);
+		++ast_cursor_plane->next_hwc_index;
+		ast_cursor_plane->next_hwc_index %= ARRAY_SIZE(ast_cursor_plane->hwc);
 	}
 
 	ret = drm_gem_vram_vmap(gbo, &map);
@@ -907,12 +910,12 @@ static const struct drm_plane_helper_funcs ast_cursor_plane_helper_funcs = {
 
 static void ast_cursor_plane_destroy(struct drm_plane *plane)
 {
-	struct ast_private *ast = to_ast_private(plane->dev);
+	struct ast_cursor_plane *ast_cursor_plane = to_ast_cursor_plane(plane);
 	size_t i;
 	struct drm_gem_vram_object *gbo;
 
-	for (i = 0; i < ARRAY_SIZE(ast->cursor.gbo); ++i) {
-		gbo = ast->cursor.gbo[i];
+	for (i = 0; i < ARRAY_SIZE(ast_cursor_plane->hwc); ++i) {
+		gbo = ast_cursor_plane->hwc[i].gbo;
 		drm_gem_vram_unpin(gbo);
 		drm_gem_vram_put(gbo);
 	}
@@ -945,7 +948,7 @@ static int ast_cursor_plane_init(struct ast_private *ast)
 
 	size = roundup(AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE, PAGE_SIZE);
 
-	for (i = 0; i < ARRAY_SIZE(ast->cursor.gbo); ++i) {
+	for (i = 0; i < ARRAY_SIZE(ast_cursor_plane->hwc); ++i) {
 		gbo = drm_gem_vram_create(dev, size, 0);
 		if (IS_ERR(gbo)) {
 			ret = PTR_ERR(gbo);
@@ -955,7 +958,7 @@ static int ast_cursor_plane_init(struct ast_private *ast)
 					    DRM_GEM_VRAM_PL_FLAG_TOPDOWN);
 		if (ret)
 			goto err_drm_gem_vram_put;
-		ast->cursor.gbo[i] = gbo;
+		ast_cursor_plane->hwc[i].gbo = gbo;
 	}
 
 	/*
@@ -979,7 +982,7 @@ static int ast_cursor_plane_init(struct ast_private *ast)
 err_hwc:
 	while (i) {
 		--i;
-		gbo = ast->cursor.gbo[i];
+		gbo = ast_cursor_plane->hwc[i].gbo;
 		drm_gem_vram_unpin(gbo);
 err_drm_gem_vram_put:
 		drm_gem_vram_put(gbo);
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
