Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 649C1305AA9
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 13:03:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1E036E2D8;
	Wed, 27 Jan 2021 12:03:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C516E039
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 12:03:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 798D2AE14;
 Wed, 27 Jan 2021 12:03:09 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	daniel@ffwll.ch
Subject: [PATCH 08/12] drm/ast: Map HW cursor BOs permanently
Date: Wed, 27 Jan 2021 13:02:58 +0100
Message-Id: <20210127120302.13532-9-tzimmermann@suse.de>
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

The BOs of the hardware cursor are now mapped permanently while the
cursor plane is being used. This reduces the CPU overhead of the cursor
plane's atomic_update function.

The change also resolves a problem with the vmap call in the commit tail.
The vmap implementation could acquire the DMA reservation lock on the
BO, which is not allowed that late in the atomic update. Removing the
vmap call from atomic_update fixes the issue.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_drv.h  |  1 +
 drivers/gpu/drm/ast/ast_mode.c | 32 +++++++++++++++-----------------
 2 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 4117c49096d4..22193cfde255 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -107,6 +107,7 @@ struct ast_cursor_plane {
 
 	struct {
 		struct drm_gem_vram_object *gbo;
+		struct dma_buf_map map;
 	} hwc[AST_DEFAULT_HWC_NUM];
 
 	unsigned int next_hwc_index;
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index dfff30e3d411..b9b9badcee00 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -759,10 +759,10 @@ ast_cursor_plane_helper_prepare_fb(struct drm_plane *plane,
 {
 	struct ast_cursor_plane *ast_cursor_plane = to_ast_cursor_plane(plane);
 	struct drm_framebuffer *fb = new_state->fb;
-	struct drm_gem_vram_object *dst_gbo =
-		ast_cursor_plane->hwc[ast_cursor_plane->next_hwc_index].gbo;
+	struct dma_buf_map dst_map =
+		ast_cursor_plane->hwc[ast_cursor_plane->next_hwc_index].map;
 	struct drm_gem_vram_object *src_gbo;
-	struct dma_buf_map src_map, dst_map;
+	struct dma_buf_map src_map;
 	void __iomem *dst;
 	void *src;
 	int ret;
@@ -777,22 +777,14 @@ ast_cursor_plane_helper_prepare_fb(struct drm_plane *plane,
 		return ret;
 	src = src_map.vaddr; /* TODO: Use mapping abstraction properly */
 
-	ret = drm_gem_vram_vmap(dst_gbo, &dst_map);
-	if (ret)
-		goto err_drm_gem_vram_vunmap;
 	dst = dst_map.vaddr_iomem; /* TODO: Use mapping abstraction properly */
 
 	/* do data transfer to cursor BO */
 	ast_update_cursor_image(dst, src, fb->width, fb->height);
 
-	drm_gem_vram_vunmap(dst_gbo, &dst_map);
 	drm_gem_vram_vunmap(src_gbo, &src_map);
 
 	return 0;
-
-err_drm_gem_vram_vunmap:
-	drm_gem_vram_vunmap(src_gbo, &src_map);
-	return ret;
 }
 
 static int ast_cursor_plane_helper_atomic_check(struct drm_plane *plane,
@@ -841,9 +833,9 @@ ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
 	u8 x_offset, y_offset;
 	u8 __iomem *dst;
 	u8 __iomem *sig;
-	int ret;
 
 	gbo = ast_cursor_plane->hwc[ast_cursor_plane->next_hwc_index].gbo;
+	map = ast_cursor_plane->hwc[ast_cursor_plane->next_hwc_index].map;
 
 	if (state->fb != old_state->fb) {
 		/* A new cursor image was installed. */
@@ -856,17 +848,12 @@ ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
 		ast_cursor_plane->next_hwc_index %= ARRAY_SIZE(ast_cursor_plane->hwc);
 	}
 
-	ret = drm_gem_vram_vmap(gbo, &map);
-	if (drm_WARN_ONCE(dev, ret, "drm_gem_vram_vmap() failed, ret=%d\n", ret))
-		return;
 	dst = map.vaddr_iomem; /* TODO: Use mapping abstraction properly */
 
 	sig = dst + AST_HWC_SIZE;
 	writel(state->crtc_x, sig + AST_HWC_SIGNATURE_X);
 	writel(state->crtc_y, sig + AST_HWC_SIGNATURE_Y);
 
-	drm_gem_vram_vunmap(gbo, &map);
-
 	offset_x = AST_MAX_HWC_WIDTH - fb->width;
 	offset_y = AST_MAX_HWC_HEIGHT - fb->height;
 
@@ -913,9 +900,12 @@ static void ast_cursor_plane_destroy(struct drm_plane *plane)
 	struct ast_cursor_plane *ast_cursor_plane = to_ast_cursor_plane(plane);
 	size_t i;
 	struct drm_gem_vram_object *gbo;
+	struct dma_buf_map map;
 
 	for (i = 0; i < ARRAY_SIZE(ast_cursor_plane->hwc); ++i) {
 		gbo = ast_cursor_plane->hwc[i].gbo;
+		map = ast_cursor_plane->hwc[i].map;
+		drm_gem_vram_vunmap(gbo, &map);
 		drm_gem_vram_unpin(gbo);
 		drm_gem_vram_put(gbo);
 	}
@@ -939,6 +929,7 @@ static int ast_cursor_plane_init(struct ast_private *ast)
 	struct drm_plane *cursor_plane = &ast_cursor_plane->base;
 	size_t size, i;
 	struct drm_gem_vram_object *gbo;
+	struct dma_buf_map map;
 	int ret;
 
 	/*
@@ -958,7 +949,11 @@ static int ast_cursor_plane_init(struct ast_private *ast)
 					    DRM_GEM_VRAM_PL_FLAG_TOPDOWN);
 		if (ret)
 			goto err_drm_gem_vram_put;
+		ret = drm_gem_vram_vmap(gbo, &map);
+		if (ret)
+			goto err_drm_gem_vram_unpin;
 		ast_cursor_plane->hwc[i].gbo = gbo;
+		ast_cursor_plane->hwc[i].map = map;
 	}
 
 	/*
@@ -983,6 +978,9 @@ static int ast_cursor_plane_init(struct ast_private *ast)
 	while (i) {
 		--i;
 		gbo = ast_cursor_plane->hwc[i].gbo;
+		map = ast_cursor_plane->hwc[i].map;
+		drm_gem_vram_vunmap(gbo, &map);
+err_drm_gem_vram_unpin:
 		drm_gem_vram_unpin(gbo);
 err_drm_gem_vram_put:
 		drm_gem_vram_put(gbo);
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
