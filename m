Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A51C7305AAD
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 13:03:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10DF56E5C3;
	Wed, 27 Jan 2021 12:03:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 818EC6E039
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 12:03:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1D4FEAE56;
 Wed, 27 Jan 2021 12:03:10 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	daniel@ffwll.ch
Subject: [PATCH 10/12] drm/ast: Fix cursor BO pinning and mapping
Date: Wed, 27 Jan 2021 13:03:00 +0100
Message-Id: <20210127120302.13532-11-tzimmermann@suse.de>
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

GEM vmap operations are not allowed in commit tail. Therefore, we cannot
map the cursor source BO in atomic_update. Instead do this in prepare_fb.
There was no pin operation for the BO, so add this as well.

Hence the cursor source BO is now mapped while it's being displayed. The
change will allow us to move all cursor damage handling from prepare_fb
to atomic_update.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_mode.c | 37 +++++++++++++++++++++++++++++++---
 1 file changed, 34 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 199ad9f9c932..192d3d34b9ed 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -751,6 +751,10 @@ static void ast_set_cursor_enabled(struct ast_private *ast, bool enabled)
 
 struct ast_cursor_plane_state {
 	struct drm_plane_state base;
+
+	/* Transitional state - do not export or duplicate */
+
+	struct dma_buf_map map;
 };
 
 static inline struct ast_cursor_plane_state *
@@ -771,6 +775,7 @@ ast_cursor_plane_helper_prepare_fb(struct drm_plane *plane,
 	struct drm_framebuffer *fb = new_state->fb;
 	struct dma_buf_map dst_map =
 		ast_cursor_plane->hwc[ast_cursor_plane->next_hwc_index].map;
+	struct ast_cursor_plane_state *new_ast_state = to_ast_cursor_plane_state(new_state);
 	struct drm_gem_vram_object *src_gbo;
 	struct dma_buf_map src_map;
 	void __iomem *dst;
@@ -782,9 +787,13 @@ ast_cursor_plane_helper_prepare_fb(struct drm_plane *plane,
 
 	src_gbo = drm_gem_vram_of_gem(fb->obj[0]);
 
-	ret = drm_gem_vram_vmap(src_gbo, &src_map);
+	ret = drm_gem_vram_pin(src_gbo, 0);
 	if (ret)
 		return ret;
+
+	ret = drm_gem_vram_vmap(src_gbo, &src_map);
+	if (ret)
+		goto err_drm_gem_vram_unpin;
 	src = src_map.vaddr; /* TODO: Use mapping abstraction properly */
 
 	dst = dst_map.vaddr_iomem; /* TODO: Use mapping abstraction properly */
@@ -792,9 +801,31 @@ ast_cursor_plane_helper_prepare_fb(struct drm_plane *plane,
 	/* do data transfer to cursor BO */
 	ast_update_cursor_image(dst, src, fb->width, fb->height);
 
-	drm_gem_vram_vunmap(src_gbo, &src_map);
+	new_ast_state->map = src_map;
 
 	return 0;
+
+err_drm_gem_vram_unpin:
+	drm_gem_vram_unpin(src_gbo);
+	return ret;
+}
+
+static void ast_cursor_plane_helper_cleanup_fb(struct drm_plane *plane,
+					       struct drm_plane_state *old_state)
+{
+	struct ast_cursor_plane_state *old_ast_state = to_ast_cursor_plane_state(old_state);
+	struct drm_framebuffer *fb = old_state->fb;
+	struct drm_gem_vram_object *gbo;
+	struct dma_buf_map map;
+
+	if (!fb)
+		return;
+
+	gbo = drm_gem_vram_of_gem(fb->obj[0]);
+	map = old_ast_state->map;
+
+	drm_gem_vram_vunmap(gbo, &map);
+	drm_gem_vram_unpin(gbo);
 }
 
 static int ast_cursor_plane_helper_atomic_check(struct drm_plane *plane,
@@ -899,7 +930,7 @@ ast_cursor_plane_helper_atomic_disable(struct drm_plane *plane,
 
 static const struct drm_plane_helper_funcs ast_cursor_plane_helper_funcs = {
 	.prepare_fb = ast_cursor_plane_helper_prepare_fb,
-	.cleanup_fb = NULL, /* not required for cursor plane */
+	.cleanup_fb = ast_cursor_plane_helper_cleanup_fb,
 	.atomic_check = ast_cursor_plane_helper_atomic_check,
 	.atomic_update = ast_cursor_plane_helper_atomic_update,
 	.atomic_disable = ast_cursor_plane_helper_atomic_disable,
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
