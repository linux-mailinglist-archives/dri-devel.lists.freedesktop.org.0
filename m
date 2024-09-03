Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 953FF969EFC
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 15:26:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18FD010E5AC;
	Tue,  3 Sep 2024 13:26:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Qi3a1ctx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lOuVsBEF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Qi3a1ctx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lOuVsBEF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B685B10E5AC
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 13:26:08 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 322701F37C;
 Tue,  3 Sep 2024 13:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725369967; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=3fxCQYxKCw1oLBtXks1f5iP1gIxDcq1a+ZonDTit4ek=;
 b=Qi3a1ctxbm6vhLGfkwIJ2uAztnzrC86iWkVn7GuVO8EZdGkwcqyoQkCepIw91znb2MBgoC
 WE8XOLREpmZLMtydYy5VGbi8Jy9RkDzr2JFYxHdtQFeCbO4EPQqgpvuGe5qgD/dstoUARI
 TucR2IQV3ZMJ6t/XcfsFIpizIGXcpEA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725369967;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=3fxCQYxKCw1oLBtXks1f5iP1gIxDcq1a+ZonDTit4ek=;
 b=lOuVsBEFyfyH6WLZO/gmz28KQQEUu45LlqrxztOXl7MwDMcBtq8GqshqEOeJnIH4pC6iWW
 +/aAH/IFR5lyTLCQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Qi3a1ctx;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=lOuVsBEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725369967; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=3fxCQYxKCw1oLBtXks1f5iP1gIxDcq1a+ZonDTit4ek=;
 b=Qi3a1ctxbm6vhLGfkwIJ2uAztnzrC86iWkVn7GuVO8EZdGkwcqyoQkCepIw91znb2MBgoC
 WE8XOLREpmZLMtydYy5VGbi8Jy9RkDzr2JFYxHdtQFeCbO4EPQqgpvuGe5qgD/dstoUARI
 TucR2IQV3ZMJ6t/XcfsFIpizIGXcpEA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725369967;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=3fxCQYxKCw1oLBtXks1f5iP1gIxDcq1a+ZonDTit4ek=;
 b=lOuVsBEFyfyH6WLZO/gmz28KQQEUu45LlqrxztOXl7MwDMcBtq8GqshqEOeJnIH4pC6iWW
 +/aAH/IFR5lyTLCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 022A513A52;
 Tue,  3 Sep 2024 13:26:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id oN3WOm4O12bcRgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 03 Sep 2024 13:26:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/ast: Remove TX-chip bitmask
Date: Tue,  3 Sep 2024 15:25:29 +0200
Message-ID: <20240903132601.91618-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 322701F37C
X-Spam-Score: -5.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCPT_COUNT_THREE(0.00)[4]; ARC_NA(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,
 imap1.dmz-prg2.suse.org:helo, suse.de:dkim, suse.de:mid, suse.de:email]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

The CRTC has only one output attached to it. Store the output's type
of TX chip in a single field and remove the related bitmask.

Turn the type-less output field in struct ast_device into a union, as
only one of its fields will be used at a time.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_dp501.c |  2 +-
 drivers/gpu/drm/ast/ast_drv.h   | 10 +++-------
 drivers/gpu/drm/ast/ast_main.c  | 27 +++++++++++++--------------
 drivers/gpu/drm/ast/ast_mode.c  | 26 +++++++++++---------------
 drivers/gpu/drm/ast/ast_post.c  |  4 ++--
 5 files changed, 30 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_dp501.c b/drivers/gpu/drm/ast/ast_dp501.c
index e4c636f45082..99bf44eec7b3 100644
--- a/drivers/gpu/drm/ast/ast_dp501.c
+++ b/drivers/gpu/drm/ast/ast_dp501.c
@@ -466,7 +466,7 @@ void ast_init_3rdtx(struct drm_device *dev)
 			ast_init_dvo(dev);
 			break;
 		default:
-			if (ast->tx_chip_types & BIT(AST_TX_SIL164))
+			if (ast->tx_chip == AST_TX_SIL164)
 				ast_init_dvo(dev);
 			else
 				ast_init_analog(dev);
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 91fe07cf7b07..b6ca14a3b967 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -91,11 +91,6 @@ enum ast_tx_chip {
 	AST_TX_ASTDP,
 };
 
-#define AST_TX_NONE_BIT		BIT(AST_TX_NONE)
-#define AST_TX_SIL164_BIT	BIT(AST_TX_SIL164)
-#define AST_TX_DP501_BIT	BIT(AST_TX_DP501)
-#define AST_TX_ASTDP_BIT	BIT(AST_TX_ASTDP)
-
 enum ast_config_mode {
 	ast_use_p2a,
 	ast_use_dt,
@@ -187,10 +182,12 @@ struct ast_device {
 
 	struct mutex modeset_lock; /* Protects access to modeset I/O registers in ioregs */
 
+	enum ast_tx_chip tx_chip;
+
 	struct ast_plane primary_plane;
 	struct ast_plane cursor_plane;
 	struct drm_crtc crtc;
-	struct {
+	union {
 		struct {
 			struct drm_encoder encoder;
 			struct ast_connector connector;
@@ -211,7 +208,6 @@ struct ast_device {
 
 	bool support_wide_screen;
 
-	unsigned long tx_chip_types;		/* bitfield of enum ast_chip_type */
 	u8 *dp501_fw_addr;
 	const struct firmware *dp501_fw;	/* dp501 fw */
 };
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index d836f2a4f9f3..d7d503e78e25 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -68,11 +68,18 @@ static void ast_detect_widescreen(struct ast_device *ast)
 
 static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
 {
+	static const char * const info_str[] = {
+		"analog VGA",
+		"Sil164 TMDS transmitter",
+		"DP501 DisplayPort transmitter",
+		"ASPEED DisplayPort transmitter",
+	};
+
 	struct drm_device *dev = &ast->base;
 	u8 jreg;
 
 	/* Check 3rd Tx option (digital output afaik) */
-	ast->tx_chip_types |= AST_TX_NONE_BIT;
+	ast->tx_chip = AST_TX_NONE;
 
 	/*
 	 * VGACRA3 Enhanced Color Mode Register, check if DVO is already
@@ -85,7 +92,7 @@ static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
 	if (!need_post) {
 		jreg = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xa3, 0xff);
 		if (jreg & 0x80)
-			ast->tx_chip_types = AST_TX_SIL164_BIT;
+			ast->tx_chip = AST_TX_SIL164;
 	}
 
 	if (IS_AST_GEN4(ast) || IS_AST_GEN5(ast) || IS_AST_GEN6(ast)) {
@@ -97,7 +104,7 @@ static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
 		jreg = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd1, 0xff);
 		switch (jreg) {
 		case 0x04:
-			ast->tx_chip_types = AST_TX_SIL164_BIT;
+			ast->tx_chip = AST_TX_SIL164;
 			break;
 		case 0x08:
 			ast->dp501_fw_addr = drmm_kzalloc(dev, 32*1024, GFP_KERNEL);
@@ -110,7 +117,7 @@ static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
 			}
 			fallthrough;
 		case 0x0c:
-			ast->tx_chip_types = AST_TX_DP501_BIT;
+			ast->tx_chip = AST_TX_DP501;
 		}
 	} else if (IS_AST_GEN7(ast)) {
 		if (ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xD1, TX_TYPE_MASK) ==
@@ -118,19 +125,11 @@ static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
 			int ret = ast_dp_launch(ast);
 
 			if (!ret)
-				ast->tx_chip_types = AST_TX_ASTDP_BIT;
+				ast->tx_chip = AST_TX_ASTDP;
 		}
 	}
 
-	/* Print stuff for diagnostic purposes */
-	if (ast->tx_chip_types & AST_TX_NONE_BIT)
-		drm_info(dev, "Using analog VGA\n");
-	if (ast->tx_chip_types & AST_TX_SIL164_BIT)
-		drm_info(dev, "Using Sil164 TMDS transmitter\n");
-	if (ast->tx_chip_types & AST_TX_DP501_BIT)
-		drm_info(dev, "Using DP501 DisplayPort transmitter\n");
-	if (ast->tx_chip_types & AST_TX_ASTDP_BIT)
-		drm_info(dev, "Using ASPEED DisplayPort transmitter\n");
+	drm_info(dev, "Using %s\n", info_str[ast->tx_chip]);
 }
 
 static int ast_get_dram_info(struct drm_device *dev)
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index ed496fb32bf3..784e8ac0e668 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1398,26 +1398,22 @@ int ast_mode_config_init(struct ast_device *ast)
 
 	ast_crtc_init(dev);
 
-	if (ast->tx_chip_types & AST_TX_NONE_BIT) {
+	switch (ast->tx_chip) {
+	case AST_TX_NONE:
 		ret = ast_vga_output_init(ast);
-		if (ret)
-			return ret;
-	}
-	if (ast->tx_chip_types & AST_TX_SIL164_BIT) {
+		break;
+	case AST_TX_SIL164:
 		ret = ast_sil164_output_init(ast);
-		if (ret)
-			return ret;
-	}
-	if (ast->tx_chip_types & AST_TX_DP501_BIT) {
+		break;
+	case AST_TX_DP501:
 		ret = ast_dp501_output_init(ast);
-		if (ret)
-			return ret;
-	}
-	if (ast->tx_chip_types & AST_TX_ASTDP_BIT) {
+		break;
+	case AST_TX_ASTDP:
 		ret = ast_astdp_output_init(ast);
-		if (ret)
-			return ret;
+		break;
 	}
+	if (ret)
+		return ret;
 
 	drm_mode_config_reset(dev);
 
diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c
index 65755798ab94..902bf8114b6e 100644
--- a/drivers/gpu/drm/ast/ast_post.c
+++ b/drivers/gpu/drm/ast/ast_post.c
@@ -350,7 +350,7 @@ void ast_post_gpu(struct drm_device *dev)
 	ast_set_def_ext_reg(dev);
 
 	if (IS_AST_GEN7(ast)) {
-		if (ast->tx_chip_types & AST_TX_ASTDP_BIT)
+		if (ast->tx_chip == AST_TX_ASTDP)
 			ast_dp_launch(ast);
 	} else if (ast->config_mode == ast_use_p2a) {
 		if (IS_AST_GEN6(ast))
@@ -362,7 +362,7 @@ void ast_post_gpu(struct drm_device *dev)
 
 		ast_init_3rdtx(dev);
 	} else {
-		if (ast->tx_chip_types & AST_TX_SIL164_BIT)
+		if (ast->tx_chip == AST_TX_SIL164)
 			ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xa3, 0xcf, 0x80);	/* Enable DVO */
 	}
 }
-- 
2.46.0

