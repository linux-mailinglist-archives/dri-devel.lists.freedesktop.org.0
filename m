Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 493452685B1
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 09:22:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAB876E288;
	Mon, 14 Sep 2020 07:22:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 440596E34B
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 07:22:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6E507AC6E;
 Mon, 14 Sep 2020 07:22:53 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@redhat.com, sam@ravnborg.org, kraxel@redhat.com,
 emil.l.velikov@gmail.com
Subject: [PATCH v3 1/4] drm/ast: Set format registers in primary plane's update
Date: Mon, 14 Sep 2020 09:22:33 +0200
Message-Id: <20200914072236.19398-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200914072236.19398-1-tzimmermann@suse.de>
References: <20200914072236.19398-1-tzimmermann@suse.de>
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

The atomic modesetting code tried to distinguish format changes from
full modesetting operations. But the implementation was buggy and the
format registers were often updated even for simple pageflips.

Fix this problem by handling format changes in the primary plane's
update function.

v3:
	* program format in primary plane's update function

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_mode.c | 44 +++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 62fe682a7de6..2323fe0b71bd 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -562,13 +562,24 @@ ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
 	struct drm_plane_state *state = plane->state;
 	struct drm_gem_vram_object *gbo;
 	s64 gpu_addr;
+	struct drm_framebuffer *fb = state->fb;
+	struct drm_framebuffer *old_fb = old_state->fb;
+
+	if (!old_fb || (fb->format != old_fb->format)) {
+		struct drm_crtc_state *crtc_state = state->crtc->state;
+		struct ast_crtc_state *ast_crtc_state = to_ast_crtc_state(crtc_state);
+		struct ast_vbios_mode_info *vbios_mode_info = &ast_crtc_state->vbios_mode_info;
+
+		ast_set_color_reg(ast, fb->format);
+		ast_set_vbios_color_reg(ast, fb->format, vbios_mode_info);
+	}
 
-	gbo = drm_gem_vram_of_gem(state->fb->obj[0]);
+	gbo = drm_gem_vram_of_gem(fb->obj[0]);
 	gpu_addr = drm_gem_vram_offset(gbo);
 	if (drm_WARN_ON_ONCE(dev, gpu_addr < 0))
 		return; /* Bug: we didn't pin the BO to VRAM in prepare_fb. */
 
-	ast_set_offset_reg(ast, state->fb);
+	ast_set_offset_reg(ast, fb);
 	ast_set_start_address_crt1(ast, (u32)gpu_addr);
 
 	ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT, 0x1, 0xdf, 0x00);
@@ -733,6 +744,7 @@ static void ast_crtc_dpms(struct drm_crtc *crtc, int mode)
 static int ast_crtc_helper_atomic_check(struct drm_crtc *crtc,
 					struct drm_crtc_state *state)
 {
+	struct drm_device *dev = crtc->dev;
 	struct ast_crtc_state *ast_state;
 	const struct drm_format_info *format;
 	bool succ;
@@ -743,8 +755,8 @@ static int ast_crtc_helper_atomic_check(struct drm_crtc *crtc,
 	ast_state = to_ast_crtc_state(state);
 
 	format = ast_state->format;
-	if (!format)
-		return 0;
+	if (drm_WARN_ON_ONCE(dev, !format))
+		return -EINVAL; /* BUG: We didn't set format in primary check(). */
 
 	succ = ast_get_vbios_mode_info(format, &state->mode,
 				       &state->adjusted_mode,
@@ -768,27 +780,15 @@ static void ast_crtc_helper_atomic_flush(struct drm_crtc *crtc,
 {
 	struct drm_device *dev = crtc->dev;
 	struct ast_private *ast = to_ast_private(dev);
-	struct ast_crtc_state *ast_state;
-	const struct drm_format_info *format;
-	struct ast_vbios_mode_info *vbios_mode_info;
-	struct drm_display_mode *adjusted_mode;
+	struct drm_crtc_state *crtc_state = crtc->state;
+	struct ast_crtc_state *ast_crtc_state = to_ast_crtc_state(crtc_state);
+	struct ast_vbios_mode_info *vbios_mode_info =
+		&ast_crtc_state->vbios_mode_info;
+	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
 
-	ast_state = to_ast_crtc_state(crtc->state);
-
-	format = ast_state->format;
-	if (!format)
-		return;
-
-	vbios_mode_info = &ast_state->vbios_mode_info;
-
-	ast_set_color_reg(ast, format);
-	ast_set_vbios_color_reg(ast, format, vbios_mode_info);
-
-	if (!crtc->state->mode_changed)
+	if (!drm_atomic_crtc_needs_modeset(crtc_state))
 		return;
 
-	adjusted_mode = &crtc->state->adjusted_mode;
-
 	ast_set_vbios_mode_reg(ast, adjusted_mode, vbios_mode_info);
 	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa1, 0x06);
 	ast_set_std_reg(ast, adjusted_mode, vbios_mode_info);
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
