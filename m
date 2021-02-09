Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 250463150AB
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 14:46:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B32AC6EB42;
	Tue,  9 Feb 2021 13:46:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 533A56EB4D
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 13:46:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E88B9AFE2;
 Tue,  9 Feb 2021 13:46:37 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	daniel@ffwll.ch
Subject: [PATCH v2 09/10] drm/ast: Store each HW cursor offset after pinning
 the rsp BO
Date: Tue,  9 Feb 2021 14:46:31 +0100
Message-Id: <20210209134632.12157-10-tzimmermann@suse.de>
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

As HW cursor BOs never move, we can store the offset in VRAM in the
cursor-plane's HWC state. This removes the last possible source of
runtime errors from atomic_update.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_drv.h  |  1 +
 drivers/gpu/drm/ast/ast_mode.c | 21 +++++++++++----------
 2 files changed, 12 insertions(+), 10 deletions(-)

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
index b9b9badcee00..e8de86d23805 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -823,26 +823,19 @@ ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
 	struct drm_plane_state *state = plane->state;
 	struct drm_framebuffer *fb = state->fb;
 	struct ast_private *ast = to_ast_private(plane->dev);
-	struct drm_device *dev = &ast->base;
-	struct drm_gem_vram_object *gbo =
-		ast_cursor_plane->hwc[ast_cursor_plane->next_hwc_index].gbo;
+	u64 dst_off =
+		ast_cursor_plane->hwc[ast_cursor_plane->next_hwc_index].off;
 	unsigned int offset_x, offset_y;
-	s64 off;
 	struct dma_buf_map map;
 	u16 x, y;
 	u8 x_offset, y_offset;
 	u8 __iomem *dst;
 	u8 __iomem *sig;
 
-	gbo = ast_cursor_plane->hwc[ast_cursor_plane->next_hwc_index].gbo;
 	map = ast_cursor_plane->hwc[ast_cursor_plane->next_hwc_index].map;
 
 	if (state->fb != old_state->fb) {
-		/* A new cursor image was installed. */
-		off = drm_gem_vram_offset(gbo);
-		if (drm_WARN_ON_ONCE(dev, off < 0))
-			return; /* Bug: we didn't pin the cursor HW BO to VRAM. */
-		ast_set_cursor_base(ast, off);
+		ast_set_cursor_base(ast, dst_off);
 
 		++ast_cursor_plane->next_hwc_index;
 		ast_cursor_plane->next_hwc_index %= ARRAY_SIZE(ast_cursor_plane->hwc);
@@ -931,6 +924,7 @@ static int ast_cursor_plane_init(struct ast_private *ast)
 	struct drm_gem_vram_object *gbo;
 	struct dma_buf_map map;
 	int ret;
+	s64 off;
 
 	/*
 	 * Allocate backing storage for cursors. The BOs are permanently
@@ -952,8 +946,14 @@ static int ast_cursor_plane_init(struct ast_private *ast)
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
@@ -979,6 +979,7 @@ static int ast_cursor_plane_init(struct ast_private *ast)
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
