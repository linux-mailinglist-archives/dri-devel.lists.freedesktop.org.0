Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 046CA305AA6
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 13:03:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3B346E5AE;
	Wed, 27 Jan 2021 12:03:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AD986E19B
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 12:03:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 362E5AE1F;
 Wed, 27 Jan 2021 12:03:08 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	daniel@ffwll.ch
Subject: [PATCH 04/12] drm/ast: Allocate HW cursor BOs during cursor-plane
 initialization
Date: Wed, 27 Jan 2021 13:02:54 +0100
Message-Id: <20210127120302.13532-5-tzimmermann@suse.de>
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

The BOs are eventually released by the cursor plane's destroy callback.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_cursor.c | 58 ------------------------------
 drivers/gpu/drm/ast/ast_drv.h    |  1 -
 drivers/gpu/drm/ast/ast_mode.c   | 62 ++++++++++++++++++++++++++++----
 3 files changed, 55 insertions(+), 66 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_cursor.c
index 024858371f64..31c35296a107 100644
--- a/drivers/gpu/drm/ast/ast_cursor.c
+++ b/drivers/gpu/drm/ast/ast_cursor.c
@@ -32,64 +32,6 @@
 
 #include "ast_drv.h"
 
-static void ast_cursor_fini(struct ast_private *ast)
-{
-	size_t i;
-	struct drm_gem_vram_object *gbo;
-
-	for (i = 0; i < ARRAY_SIZE(ast->cursor.gbo); ++i) {
-		gbo = ast->cursor.gbo[i];
-		drm_gem_vram_unpin(gbo);
-		drm_gem_vram_put(gbo);
-	}
-}
-
-static void ast_cursor_release(struct drm_device *dev, void *ptr)
-{
-	struct ast_private *ast = to_ast_private(dev);
-
-	ast_cursor_fini(ast);
-}
-
-/*
- * Allocate cursor BOs and pin them at the end of VRAM.
- */
-int ast_cursor_init(struct ast_private *ast)
-{
-	struct drm_device *dev = &ast->base;
-	size_t size, i;
-	struct drm_gem_vram_object *gbo;
-	int ret;
-
-	size = roundup(AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE, PAGE_SIZE);
-
-	for (i = 0; i < ARRAY_SIZE(ast->cursor.gbo); ++i) {
-		gbo = drm_gem_vram_create(dev, size, 0);
-		if (IS_ERR(gbo)) {
-			ret = PTR_ERR(gbo);
-			goto err_drm_gem_vram_put;
-		}
-		ret = drm_gem_vram_pin(gbo, DRM_GEM_VRAM_PL_FLAG_VRAM |
-					    DRM_GEM_VRAM_PL_FLAG_TOPDOWN);
-		if (ret) {
-			drm_gem_vram_put(gbo);
-			goto err_drm_gem_vram_put;
-		}
-		ast->cursor.gbo[i] = gbo;
-	}
-
-	return drmm_add_action_or_reset(dev, ast_cursor_release, NULL);
-
-err_drm_gem_vram_put:
-	while (i) {
-		--i;
-		gbo = ast->cursor.gbo[i];
-		drm_gem_vram_unpin(gbo);
-		drm_gem_vram_put(gbo);
-	}
-	return ret;
-}
-
 static void update_cursor_image(u8 __iomem *dst, const u8 *src, int width, int height)
 {
 	union {
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 1575e8e636d7..c9c3950449b5 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -318,7 +318,6 @@ u8 ast_get_dp501_max_clk(struct drm_device *dev);
 void ast_init_3rdtx(struct drm_device *dev);
 
 /* ast_cursor.c */
-int ast_cursor_init(struct ast_private *ast);
 int ast_cursor_blit(struct ast_private *ast, struct drm_framebuffer *fb);
 void ast_cursor_page_flip(struct ast_private *ast);
 void ast_cursor_show(struct ast_private *ast, int x, int y,
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index f86773a869f0..99b6f7c5cb2f 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -736,10 +736,25 @@ static const struct drm_plane_helper_funcs ast_cursor_plane_helper_funcs = {
 	.atomic_disable = ast_cursor_plane_helper_atomic_disable,
 };
 
+static void ast_cursor_plane_destroy(struct drm_plane *plane)
+{
+	struct ast_private *ast = to_ast_private(plane->dev);
+	size_t i;
+	struct drm_gem_vram_object *gbo;
+
+	for (i = 0; i < ARRAY_SIZE(ast->cursor.gbo); ++i) {
+		gbo = ast->cursor.gbo[i];
+		drm_gem_vram_unpin(gbo);
+		drm_gem_vram_put(gbo);
+	}
+
+	drm_plane_cleanup(plane);
+}
+
 static const struct drm_plane_funcs ast_cursor_plane_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
-	.destroy = drm_plane_cleanup,
+	.destroy = ast_cursor_plane_destroy,
 	.reset = drm_atomic_helper_plane_reset,
 	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
@@ -749,20 +764,57 @@ static int ast_cursor_plane_init(struct ast_private *ast)
 {
 	struct drm_device *dev = &ast->base;
 	struct drm_plane *cursor_plane = &ast->cursor_plane;
+	size_t size, i;
+	struct drm_gem_vram_object *gbo;
 	int ret;
 
+	/*
+	 * Allocate backing storage for cursors. The BOs are permanently
+	 * pinned to the top end of the VRAM.
+	 */
+
+	size = roundup(AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE, PAGE_SIZE);
+
+	for (i = 0; i < ARRAY_SIZE(ast->cursor.gbo); ++i) {
+		gbo = drm_gem_vram_create(dev, size, 0);
+		if (IS_ERR(gbo)) {
+			ret = PTR_ERR(gbo);
+			goto err_hwc;
+		}
+		ret = drm_gem_vram_pin(gbo, DRM_GEM_VRAM_PL_FLAG_VRAM |
+					    DRM_GEM_VRAM_PL_FLAG_TOPDOWN);
+		if (ret)
+			goto err_drm_gem_vram_put;
+		ast->cursor.gbo[i] = gbo;
+	}
+
+	/*
+	 * Create the cursor plane. The plane's destroy callback will release
+	 * the backing storages' BO memory.
+	 */
+
 	ret = drm_universal_plane_init(dev, cursor_plane, 0x01,
 				       &ast_cursor_plane_funcs,
 				       ast_cursor_plane_formats,
 				       ARRAY_SIZE(ast_cursor_plane_formats),
 				       NULL, DRM_PLANE_TYPE_CURSOR, NULL);
 	if (ret) {
-		drm_err(dev, "drm_universal_plane_failed(): %d\n", ret);
-		return ret;
+		drm_err(dev, "drm_universal_plane failed(): %d\n", ret);
+		goto err_hwc;
 	}
 	drm_plane_helper_add(cursor_plane, &ast_cursor_plane_helper_funcs);
 
 	return 0;
+
+err_hwc:
+	while (i) {
+		--i;
+		gbo = ast->cursor.gbo[i];
+		drm_gem_vram_unpin(gbo);
+err_drm_gem_vram_put:
+		drm_gem_vram_put(gbo);
+	}
+	return ret;
 }
 
 /*
@@ -1149,10 +1201,6 @@ int ast_mode_config_init(struct ast_private *ast)
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	int ret;
 
-	ret = ast_cursor_init(ast);
-	if (ret)
-		return ret;
-
 	ret = drmm_mode_config_init(dev);
 	if (ret)
 		return ret;
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
