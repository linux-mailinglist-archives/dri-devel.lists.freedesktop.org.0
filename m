Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EB5975131
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 13:54:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5180610E9CE;
	Wed, 11 Sep 2024 11:53:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="PP9QpLCv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7V3SZSIs";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PP9QpLCv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7V3SZSIs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C038310E9C7
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 11:53:53 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5C05F21AAA;
 Wed, 11 Sep 2024 11:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1726055632; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0TmAFUj3kYEJz1np9lxSvZq/5I6nFjFDPVQTCiis0UM=;
 b=PP9QpLCvbN+KLh7J8ed1T8KZs+R1U7i3MUeIOWkvI/2hYhnT5AH1VToR2qK1hMY+xvfafr
 8hXe/Lo5JouuIxXKDXY19qWwAlVYYLkAM1/rm79buRE3vuH7Nl2Wchszf4yJ6CSX2sahLx
 2WJvtYtjPjMbb5bXjyW6GGCtpK8mNEk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1726055632;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0TmAFUj3kYEJz1np9lxSvZq/5I6nFjFDPVQTCiis0UM=;
 b=7V3SZSIsyjgW47vXPIqBMl/PcUsfR+1SvenAE0MyufL0gVFCrGpxww2/fxTm03Ho/qiFln
 0buXeTjzgI1iiuDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1726055632; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0TmAFUj3kYEJz1np9lxSvZq/5I6nFjFDPVQTCiis0UM=;
 b=PP9QpLCvbN+KLh7J8ed1T8KZs+R1U7i3MUeIOWkvI/2hYhnT5AH1VToR2qK1hMY+xvfafr
 8hXe/Lo5JouuIxXKDXY19qWwAlVYYLkAM1/rm79buRE3vuH7Nl2Wchszf4yJ6CSX2sahLx
 2WJvtYtjPjMbb5bXjyW6GGCtpK8mNEk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1726055632;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0TmAFUj3kYEJz1np9lxSvZq/5I6nFjFDPVQTCiis0UM=;
 b=7V3SZSIsyjgW47vXPIqBMl/PcUsfR+1SvenAE0MyufL0gVFCrGpxww2/fxTm03Ho/qiFln
 0buXeTjzgI1iiuDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3434913A7C;
 Wed, 11 Sep 2024 11:53:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id SP5iC9CE4WbGIgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 11 Sep 2024 11:53:52 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 06/10] drm/ast: dp501: Avoid upcasting to struct ast_device
Date: Wed, 11 Sep 2024 13:51:24 +0200
Message-ID: <20240911115347.899148-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240911115347.899148-1-tzimmermann@suse.de>
References: <20240911115347.899148-1-tzimmermann@suse.de>
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

Several functions receive an instance of struct drm_device only to
upcast it to struct ast_device. Improve type safety by passing the
AST device directly.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_dp501.c | 53 ++++++++++++++-------------------
 drivers/gpu/drm/ast/ast_drv.h   |  4 +--
 drivers/gpu/drm/ast/ast_main.c  |  2 +-
 drivers/gpu/drm/ast/ast_post.c  |  2 +-
 4 files changed, 27 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_dp501.c b/drivers/gpu/drm/ast/ast_dp501.c
index abb03d14c338..e5553334bfde 100644
--- a/drivers/gpu/drm/ast/ast_dp501.c
+++ b/drivers/gpu/drm/ast/ast_dp501.c
@@ -21,9 +21,9 @@ static void ast_release_firmware(void *data)
 	ast->dp501_fw = NULL;
 }
 
-static int ast_load_dp501_microcode(struct drm_device *dev)
+static int ast_load_dp501_microcode(struct ast_device *ast)
 {
-	struct ast_device *ast = to_ast_device(dev);
+	struct drm_device *dev = &ast->base;
 	int ret;
 
 	ret = request_firmware(&ast->dp501_fw, "ast_dp501_fw.bin", dev->dev);
@@ -109,10 +109,10 @@ static bool wait_fw_ready(struct ast_device *ast)
 }
 #endif
 
-static bool ast_write_cmd(struct drm_device *dev, u8 data)
+static bool ast_write_cmd(struct ast_device *ast, u8 data)
 {
-	struct ast_device *ast = to_ast_device(dev);
 	int retry = 0;
+
 	if (wait_nack(ast)) {
 		send_nack(ast);
 		ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0x9a, 0x00, data);
@@ -131,10 +131,8 @@ static bool ast_write_cmd(struct drm_device *dev, u8 data)
 	return false;
 }
 
-static bool ast_write_data(struct drm_device *dev, u8 data)
+static bool ast_write_data(struct ast_device *ast, u8 data)
 {
-	struct ast_device *ast = to_ast_device(dev);
-
 	if (wait_nack(ast)) {
 		send_nack(ast);
 		ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0x9a, 0x00, data);
@@ -175,10 +173,10 @@ static void clear_cmd(struct ast_device *ast)
 }
 #endif
 
-static void ast_set_dp501_video_output(struct drm_device *dev, u8 mode)
+static void ast_set_dp501_video_output(struct ast_device *ast, u8 mode)
 {
-	ast_write_cmd(dev, 0x40);
-	ast_write_data(dev, mode);
+	ast_write_cmd(ast, 0x40);
+	ast_write_data(ast, mode);
 
 	msleep(10);
 }
@@ -188,9 +186,8 @@ static u32 get_fw_base(struct ast_device *ast)
 	return ast_mindwm(ast, 0x1e6e2104) & 0x7fffffff;
 }
 
-bool ast_backup_fw(struct drm_device *dev, u8 *addr, u32 size)
+bool ast_backup_fw(struct ast_device *ast, u8 *addr, u32 size)
 {
-	struct ast_device *ast = to_ast_device(dev);
 	u32 i, data;
 	u32 boot_address;
 
@@ -207,9 +204,8 @@ bool ast_backup_fw(struct drm_device *dev, u8 *addr, u32 size)
 	return false;
 }
 
-static bool ast_launch_m68k(struct drm_device *dev)
+static bool ast_launch_m68k(struct ast_device *ast)
 {
-	struct ast_device *ast = to_ast_device(dev);
 	u32 i, data, len = 0;
 	u32 boot_address;
 	u8 *fw_addr = NULL;
@@ -226,7 +222,7 @@ static bool ast_launch_m68k(struct drm_device *dev)
 			len = 32*1024;
 		} else {
 			if (!ast->dp501_fw &&
-			    ast_load_dp501_microcode(dev) < 0)
+			    ast_load_dp501_microcode(ast) < 0)
 				return false;
 
 			fw_addr = (u8 *)ast->dp501_fw->data;
@@ -348,9 +344,8 @@ static int ast_dp512_read_edid_block(void *data, u8 *buf, unsigned int block, si
 	return true;
 }
 
-static bool ast_init_dvo(struct drm_device *dev)
+static bool ast_init_dvo(struct ast_device *ast)
 {
-	struct ast_device *ast = to_ast_device(dev);
 	u8 jreg;
 	u32 data;
 	ast_write32(ast, 0xf004, 0x1e6e0000);
@@ -421,9 +416,8 @@ static bool ast_init_dvo(struct drm_device *dev)
 }
 
 
-static void ast_init_analog(struct drm_device *dev)
+static void ast_init_analog(struct ast_device *ast)
 {
-	struct ast_device *ast = to_ast_device(dev);
 	u32 data;
 
 	/*
@@ -448,28 +442,27 @@ static void ast_init_analog(struct drm_device *dev)
 	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xa3, 0xcf, 0x00);
 }
 
-void ast_init_3rdtx(struct drm_device *dev)
+void ast_init_3rdtx(struct ast_device *ast)
 {
-	struct ast_device *ast = to_ast_device(dev);
 	u8 jreg;
 
 	if (IS_AST_GEN4(ast) || IS_AST_GEN5(ast)) {
 		jreg = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd1, 0xff);
 		switch (jreg & 0x0e) {
 		case 0x04:
-			ast_init_dvo(dev);
+			ast_init_dvo(ast);
 			break;
 		case 0x08:
-			ast_launch_m68k(dev);
+			ast_launch_m68k(ast);
 			break;
 		case 0x0c:
-			ast_init_dvo(dev);
+			ast_init_dvo(ast);
 			break;
 		default:
 			if (ast->tx_chip == AST_TX_SIL164)
-				ast_init_dvo(dev);
+				ast_init_dvo(ast);
 			else
-				ast_init_analog(dev);
+				ast_init_analog(ast);
 		}
 	}
 }
@@ -485,17 +478,17 @@ static const struct drm_encoder_funcs ast_dp501_encoder_funcs = {
 static void ast_dp501_encoder_helper_atomic_enable(struct drm_encoder *encoder,
 						   struct drm_atomic_state *state)
 {
-	struct drm_device *dev = encoder->dev;
+	struct ast_device *ast = to_ast_device(encoder->dev);
 
-	ast_set_dp501_video_output(dev, 1);
+	ast_set_dp501_video_output(ast, 1);
 }
 
 static void ast_dp501_encoder_helper_atomic_disable(struct drm_encoder *encoder,
 						    struct drm_atomic_state *state)
 {
-	struct drm_device *dev = encoder->dev;
+	struct ast_device *ast = to_ast_device(encoder->dev);
 
-	ast_set_dp501_video_output(dev, 0);
+	ast_set_dp501_video_output(ast, 0);
 }
 
 static const struct drm_encoder_helper_funcs ast_dp501_encoder_helper_funcs = {
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index cafc4234e839..e29db59bb7d8 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -455,8 +455,8 @@ int ast_vga_output_init(struct ast_device *ast);
 int ast_sil164_output_init(struct ast_device *ast);
 
 /* ast dp501 */
-bool ast_backup_fw(struct drm_device *dev, u8 *addr, u32 size);
-void ast_init_3rdtx(struct drm_device *dev);
+bool ast_backup_fw(struct ast_device *ast, u8 *addr, u32 size);
+void ast_init_3rdtx(struct ast_device *ast);
 int ast_dp501_output_init(struct ast_device *ast);
 
 /* aspeed DP */
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index d7d503e78e25..3aeb0f4b19d5 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -110,7 +110,7 @@ static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
 			ast->dp501_fw_addr = drmm_kzalloc(dev, 32*1024, GFP_KERNEL);
 			if (ast->dp501_fw_addr) {
 				/* backup firmware */
-				if (ast_backup_fw(dev, ast->dp501_fw_addr, 32*1024)) {
+				if (ast_backup_fw(ast, ast->dp501_fw_addr, 32*1024)) {
 					drmm_kfree(dev, ast->dp501_fw_addr);
 					ast->dp501_fw_addr = NULL;
 				}
diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c
index 902bf8114b6e..324778c72d23 100644
--- a/drivers/gpu/drm/ast/ast_post.c
+++ b/drivers/gpu/drm/ast/ast_post.c
@@ -360,7 +360,7 @@ void ast_post_gpu(struct drm_device *dev)
 		else
 			ast_init_dram_reg(dev);
 
-		ast_init_3rdtx(dev);
+		ast_init_3rdtx(ast);
 	} else {
 		if (ast->tx_chip == AST_TX_SIL164)
 			ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xa3, 0xcf, 0x80);	/* Enable DVO */
-- 
2.46.0

