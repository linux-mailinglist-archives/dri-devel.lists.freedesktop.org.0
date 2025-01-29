Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE57A21A8C
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 10:59:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 383CF10E791;
	Wed, 29 Jan 2025 09:59:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C085110E77A
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 09:58:48 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 95B3921114;
 Wed, 29 Jan 2025 09:58:47 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6F225137DB;
 Wed, 29 Jan 2025 09:58:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id gAjqGdf7mWflDQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 29 Jan 2025 09:58:47 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, dri-devel@lists.freedesktop.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 05/16] drm/ast: Add support_fullhd flag to struct ast_device
Date: Wed, 29 Jan 2025 10:54:51 +0100
Message-ID: <20250129095840.20629-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129095840.20629-1-tzimmermann@suse.de>
References: <20250129095840.20629-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00]; REPLY(-4.00)[];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 95B3921114
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

v2:
- use fullhd flag for setting max width/height

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_drv.h  |  1 +
 drivers/gpu/drm/ast/ast_main.c | 19 +++++++++++++++++++
 drivers/gpu/drm/ast/ast_mode.c | 12 ++----------
 3 files changed, 22 insertions(+), 10 deletions(-)

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
index 93ae9a275c960..6e964a0714b4b 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -52,27 +52,46 @@ static bool __ast_2100_detect_wsxga_p(struct ast_device *ast)
 static void ast_detect_widescreen(struct ast_device *ast)
 {
 	ast->support_wsxga_p = false;
+	ast->support_fullhd = false;
 
 	if (AST_GEN(ast) >= 7) {
 		ast->support_wsxga_p = true;
+		ast->support_fullhd = true;
 	} else if (AST_GEN(ast) >= 6) {
 		if (__ast_2100_detect_wsxga_p(ast))
 			ast->support_wsxga_p = true;
 		else if (ast->chip == AST2510)
 			ast->support_wsxga_p = true;
+		if (ast->support_wsxga_p)
+			ast->support_fullhd = true;
 	} else if (AST_GEN(ast) >= 5) {
 		if (__ast_2100_detect_wsxga_p(ast))
 			ast->support_wsxga_p = true;
 		else if (ast->chip == AST1400)
 			ast->support_wsxga_p = true;
+		if (ast->support_wsxga_p)
+			ast->support_fullhd = true;
 	} else if (AST_GEN(ast) >= 4) {
 		if (__ast_2100_detect_wsxga_p(ast))
 			ast->support_wsxga_p = true;
 		else if (ast->chip == AST1300)
 			ast->support_wsxga_p = true;
+		if (ast->support_wsxga_p)
+			ast->support_fullhd = true;
+	} else if (AST_GEN(ast) >= 3) {
+		if (__ast_2100_detect_wsxga_p(ast))
+			ast->support_wsxga_p = true;
+		if (ast->support_wsxga_p) {
+			if (ast->chip == AST2200)
+				ast->support_fullhd = true;
+		}
 	} else if (AST_GEN(ast) >= 2) {
 		if (__ast_2100_detect_wsxga_p(ast))
 			ast->support_wsxga_p = true;
+		if (ast->support_wsxga_p) {
+			if (ast->chip == AST2100)
+				ast->support_fullhd = true;
+		}
 	}
 }
 
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index d1b3136b37693..dda2c4fb0a48b 100644
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
 
@@ -1371,12 +1368,7 @@ int ast_mode_config_init(struct ast_device *ast)
 	dev->mode_config.min_height = 0;
 	dev->mode_config.preferred_depth = 24;
 
-	if (ast->chip == AST2100 || // GEN2, but not AST1100 (?)
-	    ast->chip == AST2200 || // GEN3, but not AST2150 (?)
-	    IS_AST_GEN7(ast) ||
-	    IS_AST_GEN6(ast) ||
-	    IS_AST_GEN5(ast) ||
-	    IS_AST_GEN4(ast)) {
+	if (ast->support_fullhd) {
 		dev->mode_config.max_width = 1920;
 		dev->mode_config.max_height = 2048;
 	} else {
-- 
2.48.1

