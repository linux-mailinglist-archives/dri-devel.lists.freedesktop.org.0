Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3AEA1B150
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 09:06:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB08110E90F;
	Fri, 24 Jan 2025 08:05:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="YRb56+5h";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+BWbRK9+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YRb56+5h";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+BWbRK9+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9BFB10E903
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 08:05:57 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6ED191F396;
 Fri, 24 Jan 2025 08:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1737705956; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tz9pNIgF+F3QxTlFRahlatYj7cq/a+72xD9gWR+ZSEo=;
 b=YRb56+5hTN1vPzTevuEAOn7ctRg2I3fSK9V4vFQxWR6vdRBCYUlZ96woEdSFe+qTnbR7V8
 S/8NnWwtsXUnZmJZ9D35WO47BjHFF8Jee/caxzq2UR53PKb1Td5A+7rdLpGOogo3C1lV2s
 SWHWR2f4Ue2SrCsGelsWeZD9ny8UJpY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1737705956;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tz9pNIgF+F3QxTlFRahlatYj7cq/a+72xD9gWR+ZSEo=;
 b=+BWbRK9+vxmyRha068jlEW3jjphIHVTx8e9LCLck/hGaM5fw9saRpUgFR6LoPI45lGlMzv
 MQC9ngib6yuIKWBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1737705956; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tz9pNIgF+F3QxTlFRahlatYj7cq/a+72xD9gWR+ZSEo=;
 b=YRb56+5hTN1vPzTevuEAOn7ctRg2I3fSK9V4vFQxWR6vdRBCYUlZ96woEdSFe+qTnbR7V8
 S/8NnWwtsXUnZmJZ9D35WO47BjHFF8Jee/caxzq2UR53PKb1Td5A+7rdLpGOogo3C1lV2s
 SWHWR2f4Ue2SrCsGelsWeZD9ny8UJpY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1737705956;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tz9pNIgF+F3QxTlFRahlatYj7cq/a+72xD9gWR+ZSEo=;
 b=+BWbRK9+vxmyRha068jlEW3jjphIHVTx8e9LCLck/hGaM5fw9saRpUgFR6LoPI45lGlMzv
 MQC9ngib6yuIKWBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4979213AA3;
 Fri, 24 Jan 2025 08:05:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id eMe0EORJk2coNgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 24 Jan 2025 08:05:56 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, dri-devel@lists.freedesktop.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 12/15] drm/ast: Inline ast_get_vbios_mode_info()
Date: Fri, 24 Jan 2025 08:57:50 +0100
Message-ID: <20250124080546.9956-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250124080546.9956-1-tzimmermann@suse.de>
References: <20250124080546.9956-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_TLS_ALL(0.00)[]
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

The helper ast_get_vbios_mode_info() retrieves hardware-specific format
and display-mode information. Inline the function into its only caller.

While at it, also replace a use of struct drm_format_info.cpp with the
correct DRM 4CC codes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_mode.c | 112 ++++++++++++++++-----------------
 1 file changed, 54 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 372abff1c8673..a823dcbf73c4b 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -107,59 +107,6 @@ static void ast_crtc_set_gamma(struct ast_device *ast,
 	}
 }
 
-static bool ast_get_vbios_mode_info(struct ast_device *ast,
-				    const struct drm_format_info *format,
-				    const struct drm_display_mode *mode,
-				    struct drm_display_mode *adjusted_mode,
-				    struct ast_vbios_mode_info *vbios_mode)
-{
-	u32 hborder, vborder;
-
-	switch (format->cpp[0] * 8) {
-	case 8:
-		vbios_mode->std_table = &vbios_stdtable[VGAModeIndex];
-		break;
-	case 16:
-		vbios_mode->std_table = &vbios_stdtable[HiCModeIndex];
-		break;
-	case 24:
-	case 32:
-		vbios_mode->std_table = &vbios_stdtable[TrueCModeIndex];
-		break;
-	default:
-		return false;
-	}
-
-	vbios_mode->enh_table = ast_vbios_find_mode(ast, mode);
-	if (!vbios_mode->enh_table)
-		return false;
-
-	hborder = (vbios_mode->enh_table->flags & HBorder) ? 8 : 0;
-	vborder = (vbios_mode->enh_table->flags & VBorder) ? 8 : 0;
-
-	adjusted_mode->crtc_hdisplay = vbios_mode->enh_table->hde;
-	adjusted_mode->crtc_htotal = vbios_mode->enh_table->ht;
-	adjusted_mode->crtc_hblank_start = vbios_mode->enh_table->hde + hborder;
-	adjusted_mode->crtc_hblank_end = vbios_mode->enh_table->ht - hborder;
-	adjusted_mode->crtc_hsync_start = vbios_mode->enh_table->hde + hborder +
-		vbios_mode->enh_table->hfp;
-	adjusted_mode->crtc_hsync_end = (vbios_mode->enh_table->hde + hborder +
-					 vbios_mode->enh_table->hfp +
-					 vbios_mode->enh_table->hsync);
-
-	adjusted_mode->crtc_vdisplay = vbios_mode->enh_table->vde;
-	adjusted_mode->crtc_vtotal = vbios_mode->enh_table->vt;
-	adjusted_mode->crtc_vblank_start = vbios_mode->enh_table->vde + vborder;
-	adjusted_mode->crtc_vblank_end = vbios_mode->enh_table->vt - vborder;
-	adjusted_mode->crtc_vsync_start = vbios_mode->enh_table->vde + vborder +
-		vbios_mode->enh_table->vfp;
-	adjusted_mode->crtc_vsync_end = (vbios_mode->enh_table->vde + vborder +
-					 vbios_mode->enh_table->vfp +
-					 vbios_mode->enh_table->vsync);
-
-	return true;
-}
-
 static void ast_set_vbios_color_reg(struct ast_device *ast,
 				    const struct drm_format_info *format,
 				    const struct ast_vbios_mode_info *vbios_mode)
@@ -990,13 +937,17 @@ static int ast_crtc_helper_atomic_check(struct drm_crtc *crtc,
 					struct drm_atomic_state *state)
 {
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
 	struct drm_crtc_state *old_crtc_state = drm_atomic_get_old_crtc_state(state, crtc);
 	struct ast_crtc_state *old_ast_crtc_state = to_ast_crtc_state(old_crtc_state);
 	struct drm_device *dev = crtc->dev;
 	struct ast_device *ast = to_ast_device(dev);
 	struct ast_crtc_state *ast_state;
 	const struct drm_format_info *format;
-	bool succ;
+	struct ast_vbios_mode_info *vbios_mode;
+	const struct ast_vbios_enhtable *vmode;
+	unsigned int hborder = 0;
+	unsigned int vborder = 0;
 	int ret;
 
 	if (!crtc_state->enable)
@@ -1028,11 +979,56 @@ static int ast_crtc_helper_atomic_check(struct drm_crtc *crtc,
 		}
 	}
 
-	succ = ast_get_vbios_mode_info(ast, format, &crtc_state->mode,
-				       &crtc_state->adjusted_mode,
-				       &ast_state->vbios_mode_info);
-	if (!succ)
+	vbios_mode = &ast_state->vbios_mode_info;
+
+	/*
+	 * Set register tables.
+	 *
+	 * TODO: These tables mix all kinds of fields and should
+	 *       probably be resolved into various helper functions.
+	 */
+	switch (format->format) {
+	case DRM_FORMAT_C8:
+		vbios_mode->std_table = &vbios_stdtable[VGAModeIndex];
+		break;
+	case DRM_FORMAT_RGB565:
+		vbios_mode->std_table = &vbios_stdtable[HiCModeIndex];
+		break;
+	case DRM_FORMAT_RGB888:
+	case DRM_FORMAT_XRGB8888:
+		vbios_mode->std_table = &vbios_stdtable[TrueCModeIndex];
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/*
+	 * Find the VBIOS mode and adjust the DRM display mode accordingly.
+	 */
+
+	vmode = ast_vbios_find_mode(ast, &crtc_state->mode);
+	if (!vmode)
 		return -EINVAL;
+	ast_state->vbios_mode_info.enh_table = vmode;
+
+	if (vmode->flags & HBorder)
+		hborder = 8;
+	if (vmode->flags & VBorder)
+		vborder = 8;
+
+	adjusted_mode->crtc_hdisplay = vmode->hde;
+	adjusted_mode->crtc_hblank_start = vmode->hde + hborder;
+	adjusted_mode->crtc_hblank_end = vmode->ht - hborder;
+	adjusted_mode->crtc_hsync_start = vmode->hde + hborder + vmode->hfp;
+	adjusted_mode->crtc_hsync_end = vmode->hde + hborder + vmode->hfp + vmode->hsync;
+	adjusted_mode->crtc_htotal = vmode->ht;
+
+	adjusted_mode->crtc_vdisplay = vmode->vde;
+	adjusted_mode->crtc_vblank_start = vmode->vde + vborder;
+	adjusted_mode->crtc_vblank_end = vmode->vt - vborder;
+	adjusted_mode->crtc_vsync_start = vmode->vde + vborder + vmode->vfp;
+	adjusted_mode->crtc_vsync_end = vmode->vde + vborder + vmode->vfp + vmode->vsync;
+	adjusted_mode->crtc_vtotal = vmode->vt;
 
 	return 0;
 }
-- 
2.47.1

