Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3748A23B56
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 10:23:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6626310EA48;
	Fri, 31 Jan 2025 09:23:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="wVMpwepX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3b6GXzJ3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wVMpwepX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3b6GXzJ3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC00010E053
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 09:23:05 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B83C21F395;
 Fri, 31 Jan 2025 09:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738315384; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MRpludE9lAivckgBVAM5zeMpLOiARoIlu3SXf4Ecy6w=;
 b=wVMpwepXRwiJzj6Odkz/qOFWjL0+u/EpxqpJDjNSDy+EL4C0p0+3OR4kV04ken4mo1pMDA
 ZxWdHd+x4JkAu9e6QTPLM6iTG8PP658bC3aVNAQUzZp6odDio9K0PkVJVusYflAP8Ps7qP
 9iVTT5Oum2d+3nn4FHAvpQHqTJMmEFA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738315384;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MRpludE9lAivckgBVAM5zeMpLOiARoIlu3SXf4Ecy6w=;
 b=3b6GXzJ3gEl/2LAmts7vOOOMkuaPre74cYYbv0xbnCh0y51KSDieUq2dPc6KBaBPHBai1G
 KbEo1RIsnijY73CA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738315384; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MRpludE9lAivckgBVAM5zeMpLOiARoIlu3SXf4Ecy6w=;
 b=wVMpwepXRwiJzj6Odkz/qOFWjL0+u/EpxqpJDjNSDy+EL4C0p0+3OR4kV04ken4mo1pMDA
 ZxWdHd+x4JkAu9e6QTPLM6iTG8PP658bC3aVNAQUzZp6odDio9K0PkVJVusYflAP8Ps7qP
 9iVTT5Oum2d+3nn4FHAvpQHqTJMmEFA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738315384;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MRpludE9lAivckgBVAM5zeMpLOiARoIlu3SXf4Ecy6w=;
 b=3b6GXzJ3gEl/2LAmts7vOOOMkuaPre74cYYbv0xbnCh0y51KSDieUq2dPc6KBaBPHBai1G
 KbEo1RIsnijY73CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 959881364B;
 Fri, 31 Jan 2025 09:23:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id gDxSI3iWnGd+GwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 31 Jan 2025 09:23:04 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, dri-devel@lists.freedesktop.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 13/16] drm/ast: astdp: Rework display-mode setting
Date: Fri, 31 Jan 2025 10:21:13 +0100
Message-ID: <20250131092257.115596-14-tzimmermann@suse.de>
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

ASTDP requires a mode index, depending on the resolution. Move the
look-up code from ast_dp_set_mode() into a separate helper. Inline
the rest of the function into its only caller. Rename the variable
names and register constants to match the programming manual.

As before, the mode-index lookup still happens during the update's
atomic commit. Right now, there's no way of doing it during the atomic
check. The lookup requires the VBIOS mode, which is not available at
the atomic check's invocation. At least warn now if the mode index
could not be found.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_dp.c  | 172 +++++++++++++++++++---------------
 drivers/gpu/drm/ast/ast_reg.h |  18 +---
 2 files changed, 100 insertions(+), 90 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
index 37551c67e6c87..e1ca012e639be 100644
--- a/drivers/gpu/drm/ast/ast_dp.c
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -14,6 +14,82 @@
 #include "ast_drv.h"
 #include "ast_vbios.h"
 
+static int ast_astdp_get_mode_index(const struct ast_vbios_enhtable *vmode)
+{
+	u8 refresh_rate_index;
+
+	if (vmode->refresh_rate_index < 1 || vmode->refresh_rate_index > 255)
+		return -EINVAL;
+
+	refresh_rate_index = vmode->refresh_rate_index - 1;
+
+	switch (vmode->hde) {
+	case 320:
+		if (vmode->vde == 240)
+			return ASTDP_320x240_60;
+		break;
+	case 400:
+		if (vmode->vde == 300)
+			return ASTDP_400x300_60;
+		break;
+	case 512:
+		if (vmode->vde == 384)
+			return ASTDP_512x384_60;
+		break;
+	case 640:
+		if (vmode->vde == 480)
+			return (u8)(ASTDP_640x480_60 + (u8)refresh_rate_index);
+		break;
+	case 800:
+		if (vmode->vde == 600)
+			return (u8)(ASTDP_800x600_56 + (u8)refresh_rate_index);
+		break;
+	case 1024:
+		if (vmode->vde == 768)
+			return (u8)(ASTDP_1024x768_60 + (u8)refresh_rate_index);
+		break;
+	case 1152:
+		if (vmode->vde == 864)
+			return ASTDP_1152x864_75;
+		break;
+	case 1280:
+		if (vmode->vde == 800)
+			return (u8)(ASTDP_1280x800_60_RB - (u8)refresh_rate_index);
+		if (vmode->vde == 1024)
+			return (u8)(ASTDP_1280x1024_60 + (u8)refresh_rate_index);
+		break;
+	case 1360:
+	case 1366:
+		if (vmode->vde == 768)
+			return ASTDP_1366x768_60;
+		break;
+	case 1440:
+		if (vmode->vde == 900)
+			return (u8)(ASTDP_1440x900_60_RB - (u8)refresh_rate_index);
+		break;
+	case 1600:
+		if (vmode->vde == 900)
+			return (u8)(ASTDP_1600x900_60_RB - (u8)refresh_rate_index);
+		if (vmode->vde == 1200)
+			return ASTDP_1600x1200_60;
+		break;
+	case 1680:
+		if (vmode->vde == 1050)
+			return (u8)(ASTDP_1680x1050_60_RB - (u8)refresh_rate_index);
+		break;
+	case 1920:
+		if (vmode->vde == 1080)
+			return ASTDP_1920x1080_60;
+		if (vmode->vde == 1200)
+			return ASTDP_1920x1200_60;
+		break;
+	default:
+		break;
+	}
+
+	return -EINVAL;
+}
+
 static bool ast_astdp_is_connected(struct ast_device *ast)
 {
 	if (!ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDF, AST_IO_VGACRDF_HPD))
@@ -228,80 +304,6 @@ static void ast_dp_set_enable(struct ast_device *ast, bool enabled)
 	drm_WARN_ON(dev, !__ast_dp_wait_enable(ast, enabled));
 }
 
-static void ast_dp_set_mode(struct drm_crtc *crtc, struct ast_vbios_mode_info *vbios_mode)
-{
-	struct ast_device *ast = to_ast_device(crtc->dev);
-
-	u32 ulRefreshRateIndex;
-	u8 ModeIdx;
-
-	ulRefreshRateIndex = vbios_mode->enh_table->refresh_rate_index - 1;
-
-	switch (crtc->mode.crtc_hdisplay) {
-	case 320:
-		ModeIdx = ASTDP_320x240_60;
-		break;
-	case 400:
-		ModeIdx = ASTDP_400x300_60;
-		break;
-	case 512:
-		ModeIdx = ASTDP_512x384_60;
-		break;
-	case 640:
-		ModeIdx = (ASTDP_640x480_60 + (u8) ulRefreshRateIndex);
-		break;
-	case 800:
-		ModeIdx = (ASTDP_800x600_56 + (u8) ulRefreshRateIndex);
-		break;
-	case 1024:
-		ModeIdx = (ASTDP_1024x768_60 + (u8) ulRefreshRateIndex);
-		break;
-	case 1152:
-		ModeIdx = ASTDP_1152x864_75;
-		break;
-	case 1280:
-		if (crtc->mode.crtc_vdisplay == 800)
-			ModeIdx = (ASTDP_1280x800_60_RB - (u8) ulRefreshRateIndex);
-		else		// 1024
-			ModeIdx = (ASTDP_1280x1024_60 + (u8) ulRefreshRateIndex);
-		break;
-	case 1360:
-	case 1366:
-		ModeIdx = ASTDP_1366x768_60;
-		break;
-	case 1440:
-		ModeIdx = (ASTDP_1440x900_60_RB - (u8) ulRefreshRateIndex);
-		break;
-	case 1600:
-		if (crtc->mode.crtc_vdisplay == 900)
-			ModeIdx = (ASTDP_1600x900_60_RB - (u8) ulRefreshRateIndex);
-		else		//1200
-			ModeIdx = ASTDP_1600x1200_60;
-		break;
-	case 1680:
-		ModeIdx = (ASTDP_1680x1050_60_RB - (u8) ulRefreshRateIndex);
-		break;
-	case 1920:
-		if (crtc->mode.crtc_vdisplay == 1080)
-			ModeIdx = ASTDP_1920x1080_60;
-		else		//1200
-			ModeIdx = ASTDP_1920x1200_60;
-		break;
-	default:
-		return;
-	}
-
-	/*
-	 * CRE0[7:0]: MISC0 ((0x00: 18-bpp) or (0x20: 24-bpp)
-	 * CRE1[7:0]: MISC1 (default: 0x00)
-	 * CRE2[7:0]: video format index (0x00 ~ 0x20 or 0x40 ~ 0x50)
-	 */
-	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xE0, ASTDP_AND_CLEAR_MASK,
-			       ASTDP_MISC0_24bpp);
-	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xE1, ASTDP_AND_CLEAR_MASK, ASTDP_MISC1);
-	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xE2, ASTDP_AND_CLEAR_MASK, ModeIdx);
-}
-
 static void ast_wait_for_vretrace(struct ast_device *ast)
 {
 	unsigned long timeout = jiffies + HZ;
@@ -324,11 +326,29 @@ static void ast_astdp_encoder_helper_atomic_mode_set(struct drm_encoder *encoder
 						     struct drm_crtc_state *crtc_state,
 						     struct drm_connector_state *conn_state)
 {
-	struct drm_crtc *crtc = crtc_state->crtc;
+	struct drm_device *dev = encoder->dev;
+	struct ast_device *ast = to_ast_device(dev);
 	struct ast_crtc_state *ast_crtc_state = to_ast_crtc_state(crtc_state);
 	struct ast_vbios_mode_info *vbios_mode_info = &ast_crtc_state->vbios_mode_info;
+	int mode_index;
+	u8 vgacre0, vgacre1, vgacre2;
+
+	mode_index = ast_astdp_get_mode_index(vbios_mode_info->enh_table);
+	if (drm_WARN_ON(dev, mode_index < 0))
+		return;
+
+	/*
+	 * CRE0[7:0]: MISC0 ((0x00: 18-bpp) or (0x20: 24-bpp)
+	 * CRE1[7:0]: MISC1 (default: 0x00)
+	 * CRE2[7:0]: video format index (0x00 ~ 0x20 or 0x40 ~ 0x50)
+	 */
+	vgacre0 = AST_IO_VGACRE0_24BPP;
+	vgacre1 = 0x00;
+	vgacre2 = mode_index & 0xff;
 
-	ast_dp_set_mode(crtc, vbios_mode_info);
+	ast_set_index_reg(ast, AST_IO_VGACRI, 0xe0, vgacre0);
+	ast_set_index_reg(ast, AST_IO_VGACRI, 0xe1, vgacre1);
+	ast_set_index_reg(ast, AST_IO_VGACRI, 0xe2, vgacre2);
 }
 
 static void ast_astdp_encoder_helper_atomic_enable(struct drm_encoder *encoder,
diff --git a/drivers/gpu/drm/ast/ast_reg.h b/drivers/gpu/drm/ast/ast_reg.h
index 9db0d584652a4..bb2cc1d8b84ea 100644
--- a/drivers/gpu/drm/ast/ast_reg.h
+++ b/drivers/gpu/drm/ast/ast_reg.h
@@ -57,10 +57,14 @@
 #define AST_IO_VGACRD1_TX_ASTDP			0x0e
 #define AST_IO_VGACRD1_SUPPORTS_WUXGA		BIT(0)
 
+/*
+ * AST DisplayPort
+ */
 #define AST_IO_VGACRD7_EDID_VALID_FLAG	BIT(0)
 #define AST_IO_VGACRDC_LINK_SUCCESS	BIT(0)
 #define AST_IO_VGACRDF_HPD		BIT(0)
 #define AST_IO_VGACRDF_DP_VIDEO_ENABLE	BIT(4) /* mirrors AST_IO_VGACRE3_DP_VIDEO_ENABLE */
+#define AST_IO_VGACRE0_24BPP		BIT(5) /* 18 bpp, if unset  */
 #define AST_IO_VGACRE3_DP_VIDEO_ENABLE	BIT(0)
 #define AST_IO_VGACRE3_DP_PHY_SLEEP	BIT(4)
 #define AST_IO_VGACRE5_EDID_READ_DONE	BIT(0)
@@ -68,18 +72,4 @@
 #define AST_IO_VGAIR1_R			(0x5A)
 #define AST_IO_VGAIR1_VREFRESH		BIT(3)
 
-/*
- * AST DisplayPort
- */
-
-/*
- * ASTDP setmode registers:
- * CRE0[7:0]: MISC0 ((0x00: 18-bpp) or (0x20: 24-bpp)
- * CRE1[7:0]: MISC1 (default: 0x00)
- * CRE2[7:0]: video format index (0x00 ~ 0x20 or 0x40 ~ 0x50)
- */
-#define ASTDP_MISC0_24bpp		BIT(5)
-#define ASTDP_MISC1			0
-#define ASTDP_AND_CLEAR_MASK		0x00
-
 #endif
-- 
2.48.1

