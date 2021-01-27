Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14886305AAF
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 13:03:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A5A6E5CF;
	Wed, 27 Jan 2021 12:03:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AEC96E039
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 12:03:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B270CAE1F;
 Wed, 27 Jan 2021 12:03:10 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	daniel@ffwll.ch
Subject: [PATCH 12/12] drm/ast: Store each HW cursor offset after pinning the
 rsp BO
Date: Wed, 27 Jan 2021 13:03:02 +0100
Message-Id: <20210127120302.13532-13-tzimmermann@suse.de>
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

As HW cursor BOs never move, we can store the offset in VRAM in the
cursor-plane's HWC state. This removes the last possible source of
runtime errors from atomic_update.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_drv.h  |  1 +
 drivers/gpu/drm/ast/ast_mode.c | 19 +++++++++++--------
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 22193cfde255..e82ab8628770 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -108,6 +108,7 @@ struct ast_cursor_plane {
 	struct {
 		struct drm_gem_vram_object *gbo;
 		struct dma_buf_map map;
+		u64 off;
 	} hwc[AST_DEFAULT_HWC_NUM];
 
 	unsigned int next_hwc_index;
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 716ed7025b41..6388e6364e8e 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -853,14 +853,12 @@ ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
 	struct ast_cursor_plane_state *ast_state = to_ast_cursor_plane_state(state);
 	struct drm_framebuffer *fb = state->fb;
 	struct ast_private *ast = to_ast_private(plane->dev);
-	struct drm_device *dev = &ast->base;
-	struct drm_gem_vram_object *dst_gbo =
-		ast_cursor_plane->hwc[ast_cursor_plane->next_hwc_index].gbo;
 	struct dma_buf_map dst_map =
 		ast_cursor_plane->hwc[ast_cursor_plane->next_hwc_index].map;
+	u64 dst_off =
+		ast_cursor_plane->hwc[ast_cursor_plane->next_hwc_index].off;
 	struct dma_buf_map src_map = ast_state->map;
 	unsigned int offset_x, offset_y;
-	s64 off;
 	u16 x, y;
 	u8 x_offset, y_offset;
 	u8 __iomem *dst;
@@ -879,10 +877,7 @@ ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
 	ast_update_cursor_image(dst, src, fb->width, fb->height);
 
 	if (state->fb != old_state->fb) {
-		off = drm_gem_vram_offset(dst_gbo);
-		if (drm_WARN_ON_ONCE(dev, off < 0))
-			return; /* Bug: we didn't pin the cursor HW BO to VRAM. */
-		ast_set_cursor_base(ast, off);
+		ast_set_cursor_base(ast, dst_off);
 
 		++ast_cursor_plane->next_hwc_index;
 		ast_cursor_plane->next_hwc_index %= ARRAY_SIZE(ast_cursor_plane->hwc);
@@ -998,6 +993,7 @@ static int ast_cursor_plane_init(struct ast_private *ast)
 	struct drm_gem_vram_object *gbo;
 	struct dma_buf_map map;
 	int ret;
+	s64 off;
 
 	/*
 	 * Allocate backing storage for cursors. The BOs are permanently
@@ -1019,8 +1015,14 @@ static int ast_cursor_plane_init(struct ast_private *ast)
 		ret = drm_gem_vram_vmap(gbo, &map);
 		if (ret)
 			goto err_drm_gem_vram_unpin;
+		off = drm_gem_vram_offset(gbo);
+		if (off < 0) {
+			ret = off;
+			goto err_drm_gem_vram_vunmap;
+		}
 		ast_cursor_plane->hwc[i].gbo = gbo;
 		ast_cursor_plane->hwc[i].map = map;
+		ast_cursor_plane->hwc[i].off = off;
 	}
 
 	/*
@@ -1046,6 +1048,7 @@ static int ast_cursor_plane_init(struct ast_private *ast)
 		--i;
 		gbo = ast_cursor_plane->hwc[i].gbo;
 		map = ast_cursor_plane->hwc[i].map;
+err_drm_gem_vram_vunmap:
 		drm_gem_vram_vunmap(gbo, &map);
 err_drm_gem_vram_unpin:
 		drm_gem_vram_unpin(gbo);
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
