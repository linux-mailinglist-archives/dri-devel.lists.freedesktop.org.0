Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA98C212299
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 13:50:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8049D6EAD9;
	Thu,  2 Jul 2020 11:50:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED516EAD0
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 11:50:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1F5E6BD82;
 Thu,  2 Jul 2020 11:50:32 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, noralf@tronnes.org, kraxel@redhat.com,
 emil.l.velikov@gmail.com, sam@ravnborg.org, yc_chen@aspeedtech.com
Subject: [PATCH v2 05/14] drm/ast: Move cursor pageflip into helper
Date: Thu,  2 Jul 2020 13:50:20 +0200
Message-Id: <20200702115029.5281-6-tzimmermann@suse.de>
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

The new helper ast_cursor_page_flip() switches the cursor's front and
back BOs. This simplifies the cursor plane's update helper.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_cursor.c | 20 +++++++++++++++++++-
 drivers/gpu/drm/ast/ast_drv.h    |  2 +-
 drivers/gpu/drm/ast/ast_mode.c   | 12 +-----------
 3 files changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_cursor.c
index 7474baddf048..815d95b2f392 100644
--- a/drivers/gpu/drm/ast/ast_cursor.c
+++ b/drivers/gpu/drm/ast/ast_cursor.c
@@ -198,7 +198,7 @@ int ast_cursor_blit(struct ast_private *ast, struct drm_framebuffer *fb)
 	return ret;
 }
 
-void ast_cursor_set_base(struct ast_private *ast, u64 address)
+static void ast_cursor_set_base(struct ast_private *ast, u64 address)
 {
 	u8 addr0 = (address >> 3) & 0xff;
 	u8 addr1 = (address >> 11) & 0xff;
@@ -209,6 +209,24 @@ void ast_cursor_set_base(struct ast_private *ast, u64 address)
 	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xca, addr2);
 }
 
+void ast_cursor_page_flip(struct ast_private *ast)
+{
+	struct drm_device *dev = ast->dev;
+	struct drm_gem_vram_object *gbo;
+	s64 off;
+
+	gbo = ast->cursor.gbo[ast->cursor.next_index];
+
+	off = drm_gem_vram_offset(gbo);
+	if (drm_WARN_ON_ONCE(dev, off < 0))
+		return; /* Bug: we didn't pin the cursor HW BO to VRAM. */
+
+	ast_cursor_set_base(ast, off);
+
+	++ast->cursor.next_index;
+	ast->cursor.next_index %= ARRAY_SIZE(ast->cursor.gbo);
+}
+
 int ast_cursor_move(struct drm_crtc *crtc, int x, int y)
 {
 	struct ast_crtc *ast_crtc = to_ast_crtc(crtc);
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 9bc1bb76ec91..e973c1ab96cb 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -319,7 +319,7 @@ void ast_release_firmware(struct drm_device *dev);
 int ast_cursor_init(struct ast_private *ast);
 void ast_cursor_fini(struct ast_private *ast);
 int ast_cursor_blit(struct ast_private *ast, struct drm_framebuffer *fb);
-void ast_cursor_set_base(struct ast_private *ast, u64 address);
+void ast_cursor_page_flip(struct ast_private *ast);
 int ast_cursor_move(struct drm_crtc *crtc, int x, int y);
 
 #endif
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 701211050832..32365f16c78c 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -660,14 +660,11 @@ static void
 ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
 				      struct drm_plane_state *old_state)
 {
-	struct drm_device *dev = plane->dev;
 	struct drm_plane_state *state = plane->state;
 	struct drm_crtc *crtc = state->crtc;
 	struct drm_framebuffer *fb = state->fb;
 	struct ast_private *ast = to_ast_private(plane->dev);
 	struct ast_crtc *ast_crtc = to_ast_crtc(crtc);
-	struct drm_gem_vram_object *gbo;
-	s64 off;
 	u8 jreg;
 
 	ast_crtc->offset_x = AST_MAX_HWC_WIDTH - fb->width;
@@ -675,14 +672,7 @@ ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
 
 	if (state->fb != old_state->fb) {
 		/* A new cursor image was installed. */
-		gbo = ast->cursor.gbo[ast->cursor.next_index];
-		off = drm_gem_vram_offset(gbo);
-		if (drm_WARN_ON_ONCE(dev, off < 0))
-			return; /* Bug: we didn't pin cursor HW BO to VRAM. */
-		ast_cursor_set_base(ast, off);
-
-		++ast->cursor.next_index;
-		ast->cursor.next_index %= ARRAY_SIZE(ast->cursor.gbo);
+		ast_cursor_page_flip(ast);
 	}
 
 	ast_cursor_move(crtc, state->crtc_x, state->crtc_y);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
