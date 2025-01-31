Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF52A23B51
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 10:23:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D9C10E053;
	Fri, 31 Jan 2025 09:23:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="D0C8+bYl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JrgvkpX+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="D0C8+bYl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JrgvkpX+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49B6510E19F
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 09:23:06 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 17CA821172;
 Fri, 31 Jan 2025 09:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738315385; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=motoWl8dHwObirFRniAM4prWRotSfkDA5/z16HfgdL4=;
 b=D0C8+bYlW+2IByj9hXjvabMIVvaXXi5Ot5G3AzsXTpiqfbMtp6X9HMd/DV8Ei9VOejHG5J
 a7upcB011iFxr5UoT1EqbBKIWI0oI9nPdJnY9URvxkOsaMWzH/aqH1GG3lS2XRtyjCcsha
 3rIapNdt0K/BsbRAV5uI97pGu4hyLKc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738315385;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=motoWl8dHwObirFRniAM4prWRotSfkDA5/z16HfgdL4=;
 b=JrgvkpX+QMJumldWKu8XfRhWpdvhOBgRh/MBfxkW/BKop0PwtvaG/d2WE/DXxd3BXWphgT
 TubHLz0vXjBnByDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738315385; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=motoWl8dHwObirFRniAM4prWRotSfkDA5/z16HfgdL4=;
 b=D0C8+bYlW+2IByj9hXjvabMIVvaXXi5Ot5G3AzsXTpiqfbMtp6X9HMd/DV8Ei9VOejHG5J
 a7upcB011iFxr5UoT1EqbBKIWI0oI9nPdJnY9URvxkOsaMWzH/aqH1GG3lS2XRtyjCcsha
 3rIapNdt0K/BsbRAV5uI97pGu4hyLKc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738315385;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=motoWl8dHwObirFRniAM4prWRotSfkDA5/z16HfgdL4=;
 b=JrgvkpX+QMJumldWKu8XfRhWpdvhOBgRh/MBfxkW/BKop0PwtvaG/d2WE/DXxd3BXWphgT
 TubHLz0vXjBnByDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E915B1364B;
 Fri, 31 Jan 2025 09:23:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id OBSzN3iWnGd+GwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 31 Jan 2025 09:23:04 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, dri-devel@lists.freedesktop.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 15/16] drm/ast: Remove struct ast_vbios_mode_info
Date: Fri, 31 Jan 2025 10:21:15 +0100
Message-ID: <20250131092257.115596-16-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250131092257.115596-1-tzimmermann@suse.de>
References: <20250131092257.115596-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_COUNT_TWO(0.00)[2]; FROM_HAS_DN(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+];
 R_RATELIMIT(0.00)[to_ip_from(RLc3yndobo9xjuzryszaastcfq)];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_THREE(0.00)[4]; RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
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
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_dp.c   |  3 +-
 drivers/gpu/drm/ast/ast_drv.h  |  8 ++---
 drivers/gpu/drm/ast/ast_mode.c | 65 +++++++++++++++-------------------
 3 files changed, 32 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
index 70fa754432bca..db3eb9ce1498e 100644
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
index 1676958e97683..a93994b00f40a 100644
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
2.48.1

