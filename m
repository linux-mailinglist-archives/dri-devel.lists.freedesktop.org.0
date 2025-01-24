Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE733A1B148
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 09:06:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C1E710E8FA;
	Fri, 24 Jan 2025 08:05:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9805A10E8FA
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 08:05:56 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6730C21176;
 Fri, 24 Jan 2025 08:05:55 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 43B87139CB;
 Fri, 24 Jan 2025 08:05:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id OKdSD+NJk2coNgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 24 Jan 2025 08:05:55 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, dri-devel@lists.freedesktop.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 06/15] drm/ast: Add support_wuxga flag to struct ast_device
Date: Fri, 24 Jan 2025 08:57:44 +0100
Message-ID: <20250124080546.9956-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250124080546.9956-1-tzimmermann@suse.de>
References: <20250124080546.9956-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 6730C21176
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
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

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_drv.h  |  1 +
 drivers/gpu/drm/ast/ast_main.c | 31 ++++++++++++++++++++++++++++++-
 drivers/gpu/drm/ast/ast_mode.c |  8 +++-----
 drivers/gpu/drm/ast/ast_reg.h  |  1 +
 4 files changed, 35 insertions(+), 6 deletions(-)

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
index e6237ba92cce3..1de6f1129e165 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -38,14 +38,18 @@
 
 static void ast_detect_widescreen(struct ast_device *ast)
 {
-	u8 vgacrd0;
+	u8 vgacrd0, vgacrd1;
 
 	ast->support_wsxga_p = false;
 	ast->support_fullhd = false;
+	ast->support_wuxga = false;
 
 	if (AST_GEN(ast) >= 7) {
 		ast->support_wsxga_p = true;
 		ast->support_fullhd = true;
+		vgacrd1 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd1);
+		if (!(vgacrd1 & AST_IO_VGACRD1_SUPPORTS_WUXGA))
+			ast->support_wuxga = true;
 	} else if (AST_GEN(ast) >= 6) {
 		vgacrd0 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd0);
 		if (!(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_BY_BMC))
@@ -56,6 +60,11 @@ static void ast_detect_widescreen(struct ast_device *ast)
 			ast->support_wsxga_p = true;
 		if (ast->support_wsxga_p)
 			ast->support_fullhd = true;
+		if (ast->support_fullhd) {
+			vgacrd1 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd1);
+			if (!(vgacrd1 & AST_IO_VGACRD1_SUPPORTS_WUXGA))
+				ast->support_wuxga = true;
+		}
 	} else if (AST_GEN(ast) >= 5) {
 		vgacrd0 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd0);
 		if (!(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_BY_BMC))
@@ -66,6 +75,11 @@ static void ast_detect_widescreen(struct ast_device *ast)
 			ast->support_wsxga_p = true;
 		if (ast->support_wsxga_p)
 			ast->support_fullhd = true;
+		if (ast->support_fullhd) {
+			vgacrd1 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd1);
+			if (!(vgacrd1 & AST_IO_VGACRD1_SUPPORTS_WUXGA))
+				ast->support_wuxga = true;
+		}
 	} else if (AST_GEN(ast) >= 4) {
 		vgacrd0 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd0);
 		if (!(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_BY_BMC))
@@ -76,6 +90,11 @@ static void ast_detect_widescreen(struct ast_device *ast)
 			ast->support_wsxga_p = true;
 		if (ast->support_wsxga_p)
 			ast->support_fullhd = true;
+		if (ast->support_fullhd) {
+			vgacrd1 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd1);
+			if (!(vgacrd1 & AST_IO_VGACRD1_SUPPORTS_WUXGA))
+				ast->support_wuxga = true;
+		}
 	} else if (AST_GEN(ast) >= 3) {
 		vgacrd0 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd0);
 		if (!(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_BY_BMC))
@@ -86,6 +105,11 @@ static void ast_detect_widescreen(struct ast_device *ast)
 			if (ast->chip == AST2200)
 				ast->support_fullhd = true;
 		}
+		if (ast->support_fullhd) {
+			vgacrd1 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd1);
+			if (!(vgacrd1 & AST_IO_VGACRD1_SUPPORTS_WUXGA))
+				ast->support_wuxga = true;
+		}
 	} else if (AST_GEN(ast) >= 2) {
 		vgacrd0 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd0);
 		if (!(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_BY_BMC))
@@ -96,6 +120,11 @@ static void ast_detect_widescreen(struct ast_device *ast)
 			if (ast->chip == AST2100)
 				ast->support_fullhd = true;
 		}
+		if (ast->support_fullhd) {
+			vgacrd1 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd1);
+			if (!(vgacrd1 & AST_IO_VGACRD1_SUPPORTS_WUXGA))
+				ast->support_wuxga = true;
+		}
 	}
 }
 
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 594a58401cf66..fca625518a873 100644
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
2.47.1

