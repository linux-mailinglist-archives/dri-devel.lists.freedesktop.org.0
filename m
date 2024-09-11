Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C3197512C
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 13:53:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6937510E9C7;
	Wed, 11 Sep 2024 11:53:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="APfmoWJi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AJKkK24i";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="APfmoWJi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AJKkK24i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7834C10E9C7
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 11:53:54 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3A1A41F8B4;
 Wed, 11 Sep 2024 11:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1726055633; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZSQz8C3TyKNgu/fGwsYJ+kMkbsBbbLA+gjxxbPuZUmg=;
 b=APfmoWJiR6aQMY5MVNQ9kAfPwLHOS/R0dhzuTxUDXVvXC77h2mEr+44lsQyKa3aCy7sWCa
 zQJFmNsAkHApJTGn+GkCpVKbTiH7VkPjMf+eYwpUejXt3/FA9kAZZVeAa0oXXE8Dxu6e7y
 FgTzniKVOEIc6ZkMspzR1ye8s5uqXcQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1726055633;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZSQz8C3TyKNgu/fGwsYJ+kMkbsBbbLA+gjxxbPuZUmg=;
 b=AJKkK24iEeDgqIv+nhG9JkFUUCodLqxaAzlGhJQuLnf/JzPEs4pe4yH3DbXojjYfZC0Wm9
 GU6m6Axeetp3LsCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1726055633; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZSQz8C3TyKNgu/fGwsYJ+kMkbsBbbLA+gjxxbPuZUmg=;
 b=APfmoWJiR6aQMY5MVNQ9kAfPwLHOS/R0dhzuTxUDXVvXC77h2mEr+44lsQyKa3aCy7sWCa
 zQJFmNsAkHApJTGn+GkCpVKbTiH7VkPjMf+eYwpUejXt3/FA9kAZZVeAa0oXXE8Dxu6e7y
 FgTzniKVOEIc6ZkMspzR1ye8s5uqXcQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1726055633;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZSQz8C3TyKNgu/fGwsYJ+kMkbsBbbLA+gjxxbPuZUmg=;
 b=AJKkK24iEeDgqIv+nhG9JkFUUCodLqxaAzlGhJQuLnf/JzPEs4pe4yH3DbXojjYfZC0Wm9
 GU6m6Axeetp3LsCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 067E413A7C;
 Wed, 11 Sep 2024 11:53:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id wMwsANGE4WbGIgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 11 Sep 2024 11:53:53 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 10/10] drm/ast: Avoid upcasting to struct ast_device
Date: Wed, 11 Sep 2024 13:51:28 +0200
Message-ID: <20240911115347.899148-11-tzimmermann@suse.de>
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
 RCVD_COUNT_TWO(0.00)[2]; FROM_HAS_DN(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+];
 R_RATELIMIT(0.00)[to_ip_from(RLc3yndobo9xjuzryszaastcfq)];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
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

Several functions receive an instance of struct drm_device only to
upcast it to struct ast_device. Improve type safety by passing the
AST device directly.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_drv.c  |  2 +-
 drivers/gpu/drm/ast/ast_drv.h  |  2 +-
 drivers/gpu/drm/ast/ast_main.c |  8 ++++----
 drivers/gpu/drm/ast/ast_mode.c |  6 +++---
 drivers/gpu/drm/ast/ast_post.c | 30 ++++++++++++------------------
 5 files changed, 21 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index 225817087b4d..63b7ef02513d 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -396,7 +396,7 @@ static int ast_drm_thaw(struct drm_device *dev)
 	ast_enable_vga(ast->ioregs);
 	ast_open_key(ast->ioregs);
 	ast_enable_mmio(dev->dev, ast->ioregs);
-	ast_post_gpu(dev);
+	ast_post_gpu(ast);
 
 	return drm_mode_config_helper_resume(dev);
 }
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index e29db59bb7d8..21ce3769bf0d 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -446,7 +446,7 @@ int ast_mode_config_init(struct ast_device *ast);
 int ast_mm_init(struct ast_device *ast);
 
 /* ast post */
-void ast_post_gpu(struct drm_device *dev);
+void ast_post_gpu(struct ast_device *ast);
 u32 ast_mindwm(struct ast_device *ast, u32 r);
 void ast_moutdwm(struct ast_device *ast, u32 r, u32 v);
 void ast_patch_ahb_2500(void __iomem *regs);
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 3aeb0f4b19d5..3d92d9e5208f 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -132,10 +132,10 @@ static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
 	drm_info(dev, "Using %s\n", info_str[ast->tx_chip]);
 }
 
-static int ast_get_dram_info(struct drm_device *dev)
+static int ast_get_dram_info(struct ast_device *ast)
 {
+	struct drm_device *dev = &ast->base;
 	struct device_node *np = dev->dev->of_node;
-	struct ast_device *ast = to_ast_device(dev);
 	uint32_t mcr_cfg, mcr_scu_mpll, mcr_scu_strap;
 	uint32_t denum, num, div, ref_pll, dsel;
 
@@ -277,7 +277,7 @@ struct drm_device *ast_device_create(struct pci_dev *pdev,
 	ast_detect_widescreen(ast);
 	ast_detect_tx_chip(ast, need_post);
 
-	ret = ast_get_dram_info(dev);
+	ret = ast_get_dram_info(ast);
 	if (ret)
 		return ERR_PTR(ret);
 
@@ -285,7 +285,7 @@ struct drm_device *ast_device_create(struct pci_dev *pdev,
 		 ast->mclk, ast->dram_type, ast->dram_bus_width);
 
 	if (need_post)
-		ast_post_gpu(dev);
+		ast_post_gpu(ast);
 
 	ret = ast_mm_init(ast);
 	if (ret)
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index f90fade5d681..9d5321c81e68 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1287,9 +1287,9 @@ static const struct drm_crtc_funcs ast_crtc_funcs = {
 	.atomic_destroy_state = ast_crtc_atomic_destroy_state,
 };
 
-static int ast_crtc_init(struct drm_device *dev)
+static int ast_crtc_init(struct ast_device *ast)
 {
-	struct ast_device *ast = to_ast_device(dev);
+	struct drm_device *dev = &ast->base;
 	struct drm_crtc *crtc = &ast->crtc;
 	int ret;
 
@@ -1396,7 +1396,7 @@ int ast_mode_config_init(struct ast_device *ast)
 	if (ret)
 		return ret;
 
-	ret = ast_crtc_init(dev);
+	ret = ast_crtc_init(ast);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c
index 324778c72d23..364030f97571 100644
--- a/drivers/gpu/drm/ast/ast_post.c
+++ b/drivers/gpu/drm/ast/ast_post.c
@@ -34,16 +34,14 @@
 #include "ast_dram_tables.h"
 #include "ast_drv.h"
 
-static void ast_post_chip_2300(struct drm_device *dev);
-static void ast_post_chip_2500(struct drm_device *dev);
+static void ast_post_chip_2300(struct ast_device *ast);
+static void ast_post_chip_2500(struct ast_device *ast);
 
 static const u8 extreginfo[] = { 0x0f, 0x04, 0x1c, 0xff };
 static const u8 extreginfo_ast2300[] = { 0x0f, 0x04, 0x1f, 0xff };
 
-static void
-ast_set_def_ext_reg(struct drm_device *dev)
+static void ast_set_def_ext_reg(struct ast_device *ast)
 {
-	struct ast_device *ast = to_ast_device(dev);
 	u8 i, index, reg;
 	const u8 *ext_reg_info;
 
@@ -252,9 +250,8 @@ static void cbrdlli_ast2150(struct ast_device *ast, int busw)
 
 
 
-static void ast_init_dram_reg(struct drm_device *dev)
+static void ast_init_dram_reg(struct ast_device *ast)
 {
-	struct ast_device *ast = to_ast_device(dev);
 	u8 j;
 	u32 data, temp, i;
 	const struct ast_dramstruct *dram_reg_info;
@@ -343,22 +340,20 @@ static void ast_init_dram_reg(struct drm_device *dev)
 	} while ((j & 0x40) == 0);
 }
 
-void ast_post_gpu(struct drm_device *dev)
+void ast_post_gpu(struct ast_device *ast)
 {
-	struct ast_device *ast = to_ast_device(dev);
-
-	ast_set_def_ext_reg(dev);
+	ast_set_def_ext_reg(ast);
 
 	if (IS_AST_GEN7(ast)) {
 		if (ast->tx_chip == AST_TX_ASTDP)
 			ast_dp_launch(ast);
 	} else if (ast->config_mode == ast_use_p2a) {
 		if (IS_AST_GEN6(ast))
-			ast_post_chip_2500(dev);
+			ast_post_chip_2500(ast);
 		else if (IS_AST_GEN5(ast) || IS_AST_GEN4(ast))
-			ast_post_chip_2300(dev);
+			ast_post_chip_2300(ast);
 		else
-			ast_init_dram_reg(dev);
+			ast_init_dram_reg(ast);
 
 		ast_init_3rdtx(ast);
 	} else {
@@ -1569,9 +1564,8 @@ static void ddr2_init(struct ast_device *ast, struct ast2300_dram_param *param)
 
 }
 
-static void ast_post_chip_2300(struct drm_device *dev)
+static void ast_post_chip_2300(struct ast_device *ast)
 {
-	struct ast_device *ast = to_ast_device(dev);
 	struct ast2300_dram_param param;
 	u32 temp;
 	u8 reg;
@@ -2038,9 +2032,9 @@ void ast_patch_ahb_2500(void __iomem *regs)
 	__ast_moutdwm(regs, 0x1e6e207c, 0x08000000); /* clear fast reset */
 }
 
-void ast_post_chip_2500(struct drm_device *dev)
+void ast_post_chip_2500(struct ast_device *ast)
 {
-	struct ast_device *ast = to_ast_device(dev);
+	struct drm_device *dev = &ast->base;
 	u32 temp;
 	u8 reg;
 
-- 
2.46.0

