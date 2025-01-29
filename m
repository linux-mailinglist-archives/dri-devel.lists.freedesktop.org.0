Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE8CA21A89
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 10:59:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB68410E784;
	Wed, 29 Jan 2025 09:59:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="dkVHFrh6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dsWsBA18";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dkVHFrh6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dsWsBA18";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0531910E77C
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 09:58:49 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C235D1F387;
 Wed, 29 Jan 2025 09:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738144727; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ESjxAjyFNdnw06rkkQCl0Sd8j1J7Xwnh8FwRXw2yGkM=;
 b=dkVHFrh6SeRdzOINMvgW6+G6y4OorK9gw+ntk8bVgWuArrgmzxvVaY+wT9FIoqj7M3fmtN
 g0f4EP+xrhU8HLwUC9LCaBaJ9HPBCBUkSr4qjdAyG3vSOaS3L1LB7mShHXI6Yi74x7cUgv
 XY4+B6uGjiCXJ8+RkeRpaIt3Tvwtkl4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738144727;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ESjxAjyFNdnw06rkkQCl0Sd8j1J7Xwnh8FwRXw2yGkM=;
 b=dsWsBA18W/hjxh+34R9Hp1eUWojUtV89Wnzod823nL7BI/UYFQKMEhZsdWNuL0rOWBevbF
 Iqmewb112SjF6LCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738144727; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ESjxAjyFNdnw06rkkQCl0Sd8j1J7Xwnh8FwRXw2yGkM=;
 b=dkVHFrh6SeRdzOINMvgW6+G6y4OorK9gw+ntk8bVgWuArrgmzxvVaY+wT9FIoqj7M3fmtN
 g0f4EP+xrhU8HLwUC9LCaBaJ9HPBCBUkSr4qjdAyG3vSOaS3L1LB7mShHXI6Yi74x7cUgv
 XY4+B6uGjiCXJ8+RkeRpaIt3Tvwtkl4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738144727;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ESjxAjyFNdnw06rkkQCl0Sd8j1J7Xwnh8FwRXw2yGkM=;
 b=dsWsBA18W/hjxh+34R9Hp1eUWojUtV89Wnzod823nL7BI/UYFQKMEhZsdWNuL0rOWBevbF
 Iqmewb112SjF6LCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9C056137DB;
 Wed, 29 Jan 2025 09:58:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id yCW2JNf7mWflDQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 29 Jan 2025 09:58:47 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, dri-devel@lists.freedesktop.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 06/16] drm/ast: Add support_wuxga flag to struct ast_device
Date: Wed, 29 Jan 2025 10:54:52 +0100
Message-ID: <20250129095840.20629-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129095840.20629-1-tzimmermann@suse.de>
References: <20250129095840.20629-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -6.80
X-Spam-Flag: NO
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

Detect support for 1920x1200 (WUXGA) in ast_detect_widescreen(). The
flag is cleared by default. The test logic has been taken from existing
code in ast_crtc_helper_mode_valid(). The code in that function is being
replaced by the new flag.

v2:
- move shared detection code into helper (Jocelyn)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_drv.h  |  1 +
 drivers/gpu/drm/ast/ast_main.c | 27 +++++++++++++++++++++++++++
 drivers/gpu/drm/ast/ast_mode.c |  8 +++-----
 drivers/gpu/drm/ast/ast_reg.h  |  1 +
 4 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 01ef0c0d5db7d..4e3a88f8a85ca 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -207,6 +207,7 @@ struct ast_device {
 
 	bool support_wsxga_p; /* 1680x1050 */
 	bool support_fullhd; /* 1920x1080 */
+	bool support_wuxga; /* 1920x1200 */
 
 	u8 *dp501_fw_addr;
 	const struct firmware *dp501_fw;	/* dp501 fw */
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 6e964a0714b4b..44b9b5f659fc8 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -49,14 +49,31 @@ static bool __ast_2100_detect_wsxga_p(struct ast_device *ast)
 	return false;
 }
 
+/* Try to detect WUXGA on Gen2+ */
+static bool __ast_2100_detect_wuxga(struct ast_device *ast)
+{
+	u8 vgacrd1;
+
+	if (ast->support_fullhd) {
+		vgacrd1 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd1);
+		if (!(vgacrd1 & AST_IO_VGACRD1_SUPPORTS_WUXGA))
+			return true;
+	}
+
+	return false;
+}
+
 static void ast_detect_widescreen(struct ast_device *ast)
 {
 	ast->support_wsxga_p = false;
 	ast->support_fullhd = false;
+	ast->support_wuxga = false;
 
 	if (AST_GEN(ast) >= 7) {
 		ast->support_wsxga_p = true;
 		ast->support_fullhd = true;
+		if (__ast_2100_detect_wuxga(ast))
+			ast->support_wuxga = true;
 	} else if (AST_GEN(ast) >= 6) {
 		if (__ast_2100_detect_wsxga_p(ast))
 			ast->support_wsxga_p = true;
@@ -64,6 +81,8 @@ static void ast_detect_widescreen(struct ast_device *ast)
 			ast->support_wsxga_p = true;
 		if (ast->support_wsxga_p)
 			ast->support_fullhd = true;
+		if (__ast_2100_detect_wuxga(ast))
+			ast->support_wuxga = true;
 	} else if (AST_GEN(ast) >= 5) {
 		if (__ast_2100_detect_wsxga_p(ast))
 			ast->support_wsxga_p = true;
@@ -71,6 +90,8 @@ static void ast_detect_widescreen(struct ast_device *ast)
 			ast->support_wsxga_p = true;
 		if (ast->support_wsxga_p)
 			ast->support_fullhd = true;
+		if (__ast_2100_detect_wuxga(ast))
+			ast->support_wuxga = true;
 	} else if (AST_GEN(ast) >= 4) {
 		if (__ast_2100_detect_wsxga_p(ast))
 			ast->support_wsxga_p = true;
@@ -78,6 +99,8 @@ static void ast_detect_widescreen(struct ast_device *ast)
 			ast->support_wsxga_p = true;
 		if (ast->support_wsxga_p)
 			ast->support_fullhd = true;
+		if (__ast_2100_detect_wuxga(ast))
+			ast->support_wuxga = true;
 	} else if (AST_GEN(ast) >= 3) {
 		if (__ast_2100_detect_wsxga_p(ast))
 			ast->support_wsxga_p = true;
@@ -85,6 +108,8 @@ static void ast_detect_widescreen(struct ast_device *ast)
 			if (ast->chip == AST2200)
 				ast->support_fullhd = true;
 		}
+		if (__ast_2100_detect_wuxga(ast))
+			ast->support_wuxga = true;
 	} else if (AST_GEN(ast) >= 2) {
 		if (__ast_2100_detect_wsxga_p(ast))
 			ast->support_wsxga_p = true;
@@ -92,6 +117,8 @@ static void ast_detect_widescreen(struct ast_device *ast)
 			if (ast->chip == AST2100)
 				ast->support_fullhd = true;
 		}
+		if (__ast_2100_detect_wuxga(ast))
+			ast->support_wuxga = true;
 	}
 }
 
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index dda2c4fb0a48b..bc0c7db5ad46e 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1022,7 +1022,6 @@ ast_crtc_helper_mode_valid(struct drm_crtc *crtc, const struct drm_display_mode
 {
 	struct ast_device *ast = to_ast_device(crtc->dev);
 	enum drm_mode_status status;
-	uint32_t jtemp;
 
 	if (ast->support_wsxga_p) {
 		if ((mode->hdisplay == 1680) && (mode->vdisplay == 1050))
@@ -1041,11 +1040,10 @@ ast_crtc_helper_mode_valid(struct drm_crtc *crtc, const struct drm_display_mode
 				return MODE_OK;
 
 			if ((mode->hdisplay == 1920) && (mode->vdisplay == 1200)) {
-				jtemp = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd1, 0xff);
-				if (jtemp & 0x01)
-					return MODE_NOMODE;
-				else
+				if (ast->support_wuxga)
 					return MODE_OK;
+				else
+					return MODE_NOMODE;
 			}
 		}
 	}
diff --git a/drivers/gpu/drm/ast/ast_reg.h b/drivers/gpu/drm/ast/ast_reg.h
index b4ff38949a565..9db0d584652a4 100644
--- a/drivers/gpu/drm/ast/ast_reg.h
+++ b/drivers/gpu/drm/ast/ast_reg.h
@@ -55,6 +55,7 @@
 #define AST_IO_VGACRD1_TX_ANX9807_VBIOS		0x0a
 #define AST_IO_VGACRD1_TX_FW_EMBEDDED_FW	0x0c /* special case of DP501 */
 #define AST_IO_VGACRD1_TX_ASTDP			0x0e
+#define AST_IO_VGACRD1_SUPPORTS_WUXGA		BIT(0)
 
 #define AST_IO_VGACRD7_EDID_VALID_FLAG	BIT(0)
 #define AST_IO_VGACRDC_LINK_SUCCESS	BIT(0)
-- 
2.48.1

