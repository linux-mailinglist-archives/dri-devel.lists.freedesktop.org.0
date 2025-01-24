Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80844A1B153
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 09:06:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF51910E901;
	Fri, 24 Jan 2025 08:06:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0B4810E903
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 08:05:57 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C42181F397;
 Fri, 24 Jan 2025 08:05:56 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9FAB813AA3;
 Fri, 24 Jan 2025 08:05:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id EJDGJeRJk2coNgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 24 Jan 2025 08:05:56 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, dri-devel@lists.freedesktop.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 14/15] drm/ast: Remove struct ast_vbios_mode_info
Date: Fri, 24 Jan 2025 08:57:52 +0100
Message-ID: <20250124080546.9956-15-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250124080546.9956-1-tzimmermann@suse.de>
References: <20250124080546.9956-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: C42181F397
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The type struct ast_vbios_mode_info used to store information about
the color format and display mode. It has outlived its purpose. Inline
its fields into struct ast_crtc_state and replace all instances.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_dp.c   |  3 +-
 drivers/gpu/drm/ast/ast_drv.h  |  8 ++---
 drivers/gpu/drm/ast/ast_mode.c | 65 +++++++++++++++-------------------
 3 files changed, 32 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
index fe122828665fb..66451f1daf691 100644
--- a/drivers/gpu/drm/ast/ast_dp.c
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -323,11 +323,10 @@ static void ast_astdp_encoder_helper_atomic_mode_set(struct drm_encoder *encoder
 	struct drm_device *dev = encoder->dev;
 	struct ast_device *ast = to_ast_device(dev);
 	struct ast_crtc_state *ast_crtc_state = to_ast_crtc_state(crtc_state);
-	struct ast_vbios_mode_info *vbios_mode_info = &ast_crtc_state->vbios_mode_info;
 	int mode_index;
 	u8 vgacre0, vgacre1, vgacre2;
 
-	mode_index = ast_astdp_get_mode_index(vbios_mode_info->enh_table);
+	mode_index = ast_astdp_get_mode_index(ast_crtc_state->vmode);
 	if (drm_WARN_ON(dev, mode_index < 0))
 		return;
 
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 9309cc5e81b0f..022a8c070c1bc 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -358,18 +358,14 @@ struct ast_vbios_dclk_info {
 	u8 param3;
 };
 
-struct ast_vbios_mode_info {
-	const struct ast_vbios_stdtable *std_table;
-	const struct ast_vbios_enhtable *enh_table;
-};
-
 struct ast_crtc_state {
 	struct drm_crtc_state base;
 
 	/* Last known format of primary plane */
 	const struct drm_format_info *format;
 
-	struct ast_vbios_mode_info vbios_mode_info;
+	const struct ast_vbios_stdtable *std_table;
+	const struct ast_vbios_enhtable *vmode;
 };
 
 #define to_ast_crtc_state(state) container_of(state, struct ast_crtc_state, base)
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index a823dcbf73c4b..584fa37b8d6c3 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -109,7 +109,7 @@ static void ast_crtc_set_gamma(struct ast_device *ast,
 
 static void ast_set_vbios_color_reg(struct ast_device *ast,
 				    const struct drm_format_info *format,
-				    const struct ast_vbios_mode_info *vbios_mode)
+				    const struct ast_vbios_enhtable *vmode)
 {
 	u32 color_index;
 
@@ -132,7 +132,7 @@ static void ast_set_vbios_color_reg(struct ast_device *ast,
 
 	ast_set_index_reg(ast, AST_IO_VGACRI, 0x91, 0x00);
 
-	if (vbios_mode->enh_table->flags & NewModeInfo) {
+	if (vmode->flags & NewModeInfo) {
 		ast_set_index_reg(ast, AST_IO_VGACRI, 0x91, 0xa8);
 		ast_set_index_reg(ast, AST_IO_VGACRI, 0x92, format->cpp[0] * 8);
 	}
@@ -140,19 +140,19 @@ static void ast_set_vbios_color_reg(struct ast_device *ast,
 
 static void ast_set_vbios_mode_reg(struct ast_device *ast,
 				   const struct drm_display_mode *adjusted_mode,
-				   const struct ast_vbios_mode_info *vbios_mode)
+				   const struct ast_vbios_enhtable *vmode)
 {
 	u32 refresh_rate_index, mode_id;
 
-	refresh_rate_index = vbios_mode->enh_table->refresh_rate_index;
-	mode_id = vbios_mode->enh_table->mode_id;
+	refresh_rate_index = vmode->refresh_rate_index;
+	mode_id = vmode->mode_id;
 
 	ast_set_index_reg(ast, AST_IO_VGACRI, 0x8d, refresh_rate_index & 0xff);
 	ast_set_index_reg(ast, AST_IO_VGACRI, 0x8e, mode_id & 0xff);
 
 	ast_set_index_reg(ast, AST_IO_VGACRI, 0x91, 0x00);
 
-	if (vbios_mode->enh_table->flags & NewModeInfo) {
+	if (vmode->flags & NewModeInfo) {
 		ast_set_index_reg(ast, AST_IO_VGACRI, 0x91, 0xa8);
 		ast_set_index_reg(ast, AST_IO_VGACRI, 0x93, adjusted_mode->clock / 1000);
 		ast_set_index_reg(ast, AST_IO_VGACRI, 0x94, adjusted_mode->crtc_hdisplay);
@@ -164,14 +164,11 @@ static void ast_set_vbios_mode_reg(struct ast_device *ast,
 
 static void ast_set_std_reg(struct ast_device *ast,
 			    struct drm_display_mode *mode,
-			    struct ast_vbios_mode_info *vbios_mode)
+			    const struct ast_vbios_stdtable *stdtable)
 {
-	const struct ast_vbios_stdtable *stdtable;
 	u32 i;
 	u8 jreg;
 
-	stdtable = vbios_mode->std_table;
-
 	jreg = stdtable->misc;
 	ast_io_write8(ast, AST_IO_VGAMR_W, jreg);
 
@@ -212,13 +209,13 @@ static void ast_set_std_reg(struct ast_device *ast,
 
 static void ast_set_crtc_reg(struct ast_device *ast,
 			     struct drm_display_mode *mode,
-			     struct ast_vbios_mode_info *vbios_mode)
+			     const struct ast_vbios_enhtable *vmode)
 {
 	u8 jreg05 = 0, jreg07 = 0, jreg09 = 0, jregAC = 0, jregAD = 0, jregAE = 0;
 	u16 temp, precache = 0;
 
 	if ((IS_AST_GEN6(ast) || IS_AST_GEN7(ast)) &&
-	    (vbios_mode->enh_table->flags & AST2500PreCatchCRT))
+	    (vmode->flags & AST2500PreCatchCRT))
 		precache = 40;
 
 	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0x11, 0x7f, 0x00);
@@ -337,14 +334,14 @@ static void ast_set_offset_reg(struct ast_device *ast,
 
 static void ast_set_dclk_reg(struct ast_device *ast,
 			     struct drm_display_mode *mode,
-			     struct ast_vbios_mode_info *vbios_mode)
+			     const struct ast_vbios_enhtable *vmode)
 {
 	const struct ast_vbios_dclk_info *clk_info;
 
 	if (IS_AST_GEN6(ast) || IS_AST_GEN7(ast))
-		clk_info = &dclk_table_ast2500[vbios_mode->enh_table->dclk_index];
+		clk_info = &dclk_table_ast2500[vmode->dclk_index];
 	else
-		clk_info = &dclk_table[vbios_mode->enh_table->dclk_index];
+		clk_info = &dclk_table[vmode->dclk_index];
 
 	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xc0, 0x00, clk_info->param1);
 	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xc1, 0x00, clk_info->param2);
@@ -402,15 +399,15 @@ static void ast_set_crtthd_reg(struct ast_device *ast)
 
 static void ast_set_sync_reg(struct ast_device *ast,
 			     struct drm_display_mode *mode,
-			     struct ast_vbios_mode_info *vbios_mode)
+			     const struct ast_vbios_enhtable *vmode)
 {
 	u8 jreg;
 
 	jreg  = ast_io_read8(ast, AST_IO_VGAMR_R);
 	jreg &= ~0xC0;
-	if (vbios_mode->enh_table->flags & NVSync)
+	if (vmode->flags & NVSync)
 		jreg |= 0x80;
-	if (vbios_mode->enh_table->flags & NHSync)
+	if (vmode->flags & NHSync)
 		jreg |= 0x40;
 	ast_io_write8(ast, AST_IO_VGAMR_W, jreg);
 }
@@ -530,10 +527,9 @@ static void ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
 
 	if (!old_fb || (fb->format != old_fb->format) || crtc_state->mode_changed) {
 		struct ast_crtc_state *ast_crtc_state = to_ast_crtc_state(crtc_state);
-		struct ast_vbios_mode_info *vbios_mode_info = &ast_crtc_state->vbios_mode_info;
 
 		ast_set_color_reg(ast, fb->format);
-		ast_set_vbios_color_reg(ast, fb->format, vbios_mode_info);
+		ast_set_vbios_color_reg(ast, fb->format, ast_crtc_state->vmode);
 	}
 
 	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
@@ -912,8 +908,8 @@ static void ast_crtc_helper_mode_set_nofb(struct drm_crtc *crtc)
 	struct ast_device *ast = to_ast_device(dev);
 	struct drm_crtc_state *crtc_state = crtc->state;
 	struct ast_crtc_state *ast_crtc_state = to_ast_crtc_state(crtc_state);
-	struct ast_vbios_mode_info *vbios_mode_info =
-		&ast_crtc_state->vbios_mode_info;
+	const struct ast_vbios_stdtable *std_table = ast_crtc_state->std_table;
+	const struct ast_vbios_enhtable *vmode = ast_crtc_state->vmode;
 	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
 
 	/*
@@ -924,13 +920,13 @@ static void ast_crtc_helper_mode_set_nofb(struct drm_crtc *crtc)
 	 */
 	ast_wait_for_vretrace(ast);
 
-	ast_set_vbios_mode_reg(ast, adjusted_mode, vbios_mode_info);
+	ast_set_vbios_mode_reg(ast, adjusted_mode, vmode);
 	ast_set_index_reg(ast, AST_IO_VGACRI, 0xa1, 0x06);
-	ast_set_std_reg(ast, adjusted_mode, vbios_mode_info);
-	ast_set_crtc_reg(ast, adjusted_mode, vbios_mode_info);
-	ast_set_dclk_reg(ast, adjusted_mode, vbios_mode_info);
+	ast_set_std_reg(ast, adjusted_mode, std_table);
+	ast_set_crtc_reg(ast, adjusted_mode, vmode);
+	ast_set_dclk_reg(ast, adjusted_mode, vmode);
 	ast_set_crtthd_reg(ast);
-	ast_set_sync_reg(ast, adjusted_mode, vbios_mode_info);
+	ast_set_sync_reg(ast, adjusted_mode, vmode);
 }
 
 static int ast_crtc_helper_atomic_check(struct drm_crtc *crtc,
@@ -944,7 +940,6 @@ static int ast_crtc_helper_atomic_check(struct drm_crtc *crtc,
 	struct ast_device *ast = to_ast_device(dev);
 	struct ast_crtc_state *ast_state;
 	const struct drm_format_info *format;
-	struct ast_vbios_mode_info *vbios_mode;
 	const struct ast_vbios_enhtable *vmode;
 	unsigned int hborder = 0;
 	unsigned int vborder = 0;
@@ -979,8 +974,6 @@ static int ast_crtc_helper_atomic_check(struct drm_crtc *crtc,
 		}
 	}
 
-	vbios_mode = &ast_state->vbios_mode_info;
-
 	/*
 	 * Set register tables.
 	 *
@@ -989,14 +982,14 @@ static int ast_crtc_helper_atomic_check(struct drm_crtc *crtc,
 	 */
 	switch (format->format) {
 	case DRM_FORMAT_C8:
-		vbios_mode->std_table = &vbios_stdtable[VGAModeIndex];
+		ast_state->std_table = &vbios_stdtable[VGAModeIndex];
 		break;
 	case DRM_FORMAT_RGB565:
-		vbios_mode->std_table = &vbios_stdtable[HiCModeIndex];
+		ast_state->std_table = &vbios_stdtable[HiCModeIndex];
 		break;
 	case DRM_FORMAT_RGB888:
 	case DRM_FORMAT_XRGB8888:
-		vbios_mode->std_table = &vbios_stdtable[TrueCModeIndex];
+		ast_state->std_table = &vbios_stdtable[TrueCModeIndex];
 		break;
 	default:
 		return -EINVAL;
@@ -1009,7 +1002,7 @@ static int ast_crtc_helper_atomic_check(struct drm_crtc *crtc,
 	vmode = ast_vbios_find_mode(ast, &crtc_state->mode);
 	if (!vmode)
 		return -EINVAL;
-	ast_state->vbios_mode_info.enh_table = vmode;
+	ast_state->vmode = vmode;
 
 	if (vmode->flags & HBorder)
 		hborder = 8;
@@ -1130,8 +1123,8 @@ ast_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
 	ast_state = to_ast_crtc_state(crtc->state);
 
 	new_ast_state->format = ast_state->format;
-	memcpy(&new_ast_state->vbios_mode_info, &ast_state->vbios_mode_info,
-	       sizeof(new_ast_state->vbios_mode_info));
+	new_ast_state->std_table = ast_state->std_table;
+	new_ast_state->vmode = ast_state->vmode;
 
 	return &new_ast_state->base;
 }
-- 
2.47.1

