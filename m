Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93739A1B14C
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 09:06:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A2B910E908;
	Fri, 24 Jan 2025 08:05:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF0A10E902
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 08:05:56 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3E09C21175;
 Fri, 24 Jan 2025 08:05:55 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1AE08139CB;
 Fri, 24 Jan 2025 08:05:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id iLpYBeNJk2coNgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 24 Jan 2025 08:05:55 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, dri-devel@lists.freedesktop.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 05/15] drm/ast: Add support_fullhd flag to struct ast_device
Date: Fri, 24 Jan 2025 08:57:43 +0100
Message-ID: <20250124080546.9956-6-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: 3E09C21175
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

Detect support for 1920x1080 (FullHD) in ast_detect_widescreen(). The
flag is cleared by default. The test logic has been taken from existing
code in ast_crtc_helper_mode_valid(). The code in that function is being
replaced by the new flag.

For Gen3, a new branch duplicates the Gen2 logic and adds a test for
AST2200. Gen2 adds a test for AST2100.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_drv.h  |  1 +
 drivers/gpu/drm/ast/ast_main.c | 22 ++++++++++++++++++++++
 drivers/gpu/drm/ast/ast_mode.c |  5 +----
 3 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index ec5b204be1dae..01ef0c0d5db7d 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -206,6 +206,7 @@ struct ast_device {
 	} output;
 
 	bool support_wsxga_p; /* 1680x1050 */
+	bool support_fullhd; /* 1920x1080 */
 
 	u8 *dp501_fw_addr;
 	const struct firmware *dp501_fw;	/* dp501 fw */
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index e1cfb2a1a5448..e6237ba92cce3 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -41,9 +41,11 @@ static void ast_detect_widescreen(struct ast_device *ast)
 	u8 vgacrd0;
 
 	ast->support_wsxga_p = false;
+	ast->support_fullhd = false;
 
 	if (AST_GEN(ast) >= 7) {
 		ast->support_wsxga_p = true;
+		ast->support_fullhd = true;
 	} else if (AST_GEN(ast) >= 6) {
 		vgacrd0 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd0);
 		if (!(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_BY_BMC))
@@ -52,6 +54,8 @@ static void ast_detect_widescreen(struct ast_device *ast)
 			ast->support_wsxga_p = true;
 		else if (ast->chip == AST2510)
 			ast->support_wsxga_p = true;
+		if (ast->support_wsxga_p)
+			ast->support_fullhd = true;
 	} else if (AST_GEN(ast) >= 5) {
 		vgacrd0 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd0);
 		if (!(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_BY_BMC))
@@ -60,6 +64,8 @@ static void ast_detect_widescreen(struct ast_device *ast)
 			ast->support_wsxga_p = true;
 		else if (ast->chip == AST1400)
 			ast->support_wsxga_p = true;
+		if (ast->support_wsxga_p)
+			ast->support_fullhd = true;
 	} else if (AST_GEN(ast) >= 4) {
 		vgacrd0 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd0);
 		if (!(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_BY_BMC))
@@ -68,12 +74,28 @@ static void ast_detect_widescreen(struct ast_device *ast)
 			ast->support_wsxga_p = true;
 		else if (ast->chip == AST1300)
 			ast->support_wsxga_p = true;
+		if (ast->support_wsxga_p)
+			ast->support_fullhd = true;
+	} else if (AST_GEN(ast) >= 3) {
+		vgacrd0 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd0);
+		if (!(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_BY_BMC))
+			ast->support_wsxga_p = true;
+		else if (vgacrd0 & AST_IO_VGACRD0_IKVM_WIDESCREEN)
+			ast->support_wsxga_p = true;
+		if (ast->support_wsxga_p) {
+			if (ast->chip == AST2200)
+				ast->support_fullhd = true;
+		}
 	} else if (AST_GEN(ast) >= 2) {
 		vgacrd0 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd0);
 		if (!(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_BY_BMC))
 			ast->support_wsxga_p = true;
 		else if (vgacrd0 & AST_IO_VGACRD0_IKVM_WIDESCREEN)
 			ast->support_wsxga_p = true;
+		if (ast->support_wsxga_p) {
+			if (ast->chip == AST2100)
+				ast->support_fullhd = true;
+		}
 	}
 }
 
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index d1b3136b37693..594a58401cf66 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1036,10 +1036,7 @@ ast_crtc_helper_mode_valid(struct drm_crtc *crtc, const struct drm_display_mode
 		if ((mode->hdisplay == 1600) && (mode->vdisplay == 900))
 			return MODE_OK;
 
-		if ((ast->chip == AST2100) || // GEN2, but not AST1100 (?)
-		    (ast->chip == AST2200) || // GEN3, but not AST2150 (?)
-		    IS_AST_GEN4(ast) || IS_AST_GEN5(ast) ||
-		    IS_AST_GEN6(ast) || IS_AST_GEN7(ast)) {
+		if (ast->support_fullhd) {
 			if ((mode->hdisplay == 1920) && (mode->vdisplay == 1080))
 				return MODE_OK;
 
-- 
2.47.1

