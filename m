Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 820BA212298
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 13:50:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62B9D6EAD5;
	Thu,  2 Jul 2020 11:50:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB8F6EAC3
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 11:50:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 40D21BD84;
 Thu,  2 Jul 2020 11:50:32 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, noralf@tronnes.org, kraxel@redhat.com,
 emil.l.velikov@gmail.com, sam@ravnborg.org, yc_chen@aspeedtech.com
Subject: [PATCH v2 06/14] drm/ast: Replace ast_cursor_move() with
 ast_cursor_show()
Date: Thu,  2 Jul 2020 13:50:21 +0200
Message-Id: <20200702115029.5281-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200702115029.5281-1-tzimmermann@suse.de>
References: <20200702115029.5281-1-tzimmermann@suse.de>
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

Having a cursor move function is misleading, as it actually enables the
cursor's image for displaying. So rename it to ast_cursor_show(). It's
semantics is to show a cursor at the specified location on the screen.
The displayed cursor is always the image in the cursor front BO.

This change also simplifies struct ast_crtc to being a mere wrapper around
around struct drm_crtc. It will be removed by a later patch.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_cursor.c | 42 ++++++++++++++++++++------------
 drivers/gpu/drm/ast/ast_drv.h    |  4 +--
 drivers/gpu/drm/ast/ast_mode.c   | 12 ++++-----
 3 files changed, 35 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_cursor.c
index 815d95b2f392..8f8fdc831830 100644
--- a/drivers/gpu/drm/ast/ast_cursor.c
+++ b/drivers/gpu/drm/ast/ast_cursor.c
@@ -227,12 +227,27 @@ void ast_cursor_page_flip(struct ast_private *ast)
 	ast->cursor.next_index %= ARRAY_SIZE(ast->cursor.gbo);
 }
 
-int ast_cursor_move(struct drm_crtc *crtc, int x, int y)
+static void ast_cursor_set_location(struct ast_private *ast, u16 x, u16 y,
+				    u8 x_offset, u8 y_offset)
+{
+	u8 x0 = (x & 0x00ff);
+	u8 x1 = (x & 0x0f00) >> 8;
+	u8 y0 = (y & 0x00ff);
+	u8 y1 = (y & 0x0700) >> 8;
+
+	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xc2, x_offset);
+	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xc3, y_offset);
+	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xc4, x0);
+	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xc5, x1);
+	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xc6, y0);
+	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xc7, y1);
+}
+
+int ast_cursor_show(struct ast_private *ast, int x, int y,
+		    unsigned int offset_x, unsigned int offset_y)
 {
-	struct ast_crtc *ast_crtc = to_ast_crtc(crtc);
-	struct ast_private *ast = to_ast_private(crtc->dev);
 	struct drm_gem_vram_object *gbo;
-	int x_offset, y_offset;
+	u8 x_offset, y_offset;
 	u8 *dst, *sig;
 	u8 jreg;
 
@@ -245,23 +260,20 @@ int ast_cursor_move(struct drm_crtc *crtc, int x, int y)
 	writel(x, sig + AST_HWC_SIGNATURE_X);
 	writel(y, sig + AST_HWC_SIGNATURE_Y);
 
-	x_offset = ast_crtc->offset_x;
-	y_offset = ast_crtc->offset_y;
 	if (x < 0) {
-		x_offset = (-x) + ast_crtc->offset_x;
+		x_offset = (-x) + offset_x;
 		x = 0;
+	} else {
+		x_offset = offset_x;
 	}
-
 	if (y < 0) {
-		y_offset = (-y) + ast_crtc->offset_y;
+		y_offset = (-y) + offset_y;
 		y = 0;
+	} else {
+		y_offset = offset_y;
 	}
-	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xc2, x_offset);
-	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xc3, y_offset);
-	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xc4, (x & 0xff));
-	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xc5, ((x >> 8) & 0x0f));
-	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xc6, (y & 0xff));
-	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xc7, ((y >> 8) & 0x07));
+
+	ast_cursor_set_location(ast, x, y, x_offset, y_offset);
 
 	/* dummy write to fire HWC */
 	jreg = 0x02 |
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index e973c1ab96cb..b00091798ef5 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -239,7 +239,6 @@ struct ast_connector {
 
 struct ast_crtc {
 	struct drm_crtc base;
-	u8 offset_x, offset_y;
 };
 
 #define to_ast_crtc(x) container_of(x, struct ast_crtc, base)
@@ -320,6 +319,7 @@ int ast_cursor_init(struct ast_private *ast);
 void ast_cursor_fini(struct ast_private *ast);
 int ast_cursor_blit(struct ast_private *ast, struct drm_framebuffer *fb);
 void ast_cursor_page_flip(struct ast_private *ast);
-int ast_cursor_move(struct drm_crtc *crtc, int x, int y);
+int ast_cursor_show(struct ast_private *ast, int x, int y,
+		    unsigned int offset_x, unsigned int offset_y);
 
 #endif
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 32365f16c78c..b452f9e28d7c 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -661,21 +661,21 @@ ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
 				      struct drm_plane_state *old_state)
 {
 	struct drm_plane_state *state = plane->state;
-	struct drm_crtc *crtc = state->crtc;
 	struct drm_framebuffer *fb = state->fb;
-	struct ast_private *ast = to_ast_private(plane->dev);
-	struct ast_crtc *ast_crtc = to_ast_crtc(crtc);
+	struct ast_private *ast = plane->dev->dev_private;
+	unsigned int offset_x, offset_y;
 	u8 jreg;
 
-	ast_crtc->offset_x = AST_MAX_HWC_WIDTH - fb->width;
-	ast_crtc->offset_y = AST_MAX_HWC_WIDTH - fb->height;
+	offset_x = AST_MAX_HWC_WIDTH - fb->width;
+	offset_y = AST_MAX_HWC_WIDTH - fb->height;
 
 	if (state->fb != old_state->fb) {
 		/* A new cursor image was installed. */
 		ast_cursor_page_flip(ast);
 	}
 
-	ast_cursor_move(crtc, state->crtc_x, state->crtc_y);
+	ast_cursor_show(ast, state->crtc_x, state->crtc_y,
+			offset_x, offset_y);
 
 	jreg = 0x2;
 	/* enable ARGB cursor */
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
