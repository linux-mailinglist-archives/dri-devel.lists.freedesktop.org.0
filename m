Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5D2B354D4
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 08:53:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DCE010E5D9;
	Tue, 26 Aug 2025 06:53:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="AUHnrIf6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JP1kBHsT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AUHnrIf6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JP1kBHsT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D6010E5DA
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 06:53:36 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 21BA921DB3;
 Tue, 26 Aug 2025 06:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756191204; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jik3AjZ8wCIXJVIKM1fi6SurdaMGns6uE5C+AZq8qrI=;
 b=AUHnrIf6EcSDF6WK7Do7lZkA/jdLcWjhJviczCbb78ZO3YIuvfpEQskOqDa+8E6ZR7ggwB
 HZtJQcnuNH5w1QJ1ZtvgFkyyFdEGKj+N9memKKejkEOSjk9grZBZSyjpOAeggk3eIvSa8K
 U9ZZI7hcWkjiDmulXlQvrnqWtnqu7VU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756191204;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jik3AjZ8wCIXJVIKM1fi6SurdaMGns6uE5C+AZq8qrI=;
 b=JP1kBHsT6Xv7h4++HpsDYbUJeQtBTWZrXtRRrSc0m16FQ1CAvwCC8saNcXRUWt+caNM1HF
 wKj11FH3OFCZoMCQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=AUHnrIf6;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=JP1kBHsT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756191204; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jik3AjZ8wCIXJVIKM1fi6SurdaMGns6uE5C+AZq8qrI=;
 b=AUHnrIf6EcSDF6WK7Do7lZkA/jdLcWjhJviczCbb78ZO3YIuvfpEQskOqDa+8E6ZR7ggwB
 HZtJQcnuNH5w1QJ1ZtvgFkyyFdEGKj+N9memKKejkEOSjk9grZBZSyjpOAeggk3eIvSa8K
 U9ZZI7hcWkjiDmulXlQvrnqWtnqu7VU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756191204;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jik3AjZ8wCIXJVIKM1fi6SurdaMGns6uE5C+AZq8qrI=;
 b=JP1kBHsT6Xv7h4++HpsDYbUJeQtBTWZrXtRRrSc0m16FQ1CAvwCC8saNcXRUWt+caNM1HF
 wKj11FH3OFCZoMCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D995213A51;
 Tue, 26 Aug 2025 06:53:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 4CbtM+NZrWhtMQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 26 Aug 2025 06:53:23 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 5/6] drm/ast: Move DRAM info next to its only user
Date: Tue, 26 Aug 2025 08:49:24 +0200
Message-ID: <20250826065032.344412-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250826065032.344412-1-tzimmermann@suse.de>
References: <20250826065032.344412-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 21BA921DB3
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 ARC_NA(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 DKIM_TRACE(0.00)[suse.de:+]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[8];
 R_RATELIMIT(0.00)[to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc)];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -3.01
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

The only place in the ast driver that uses the DRAM type is the
P2A DRAM initialization for Gen2 and Gen3 of the chip. Condense
the code in ast_get_dram_info() to exactly this use case and move
it into the Gen's custom source file. Remove the field dram_type
from struct ast_device.

The AST_DRAM_ constants are also used in Gen4 POST helpers, but
independently from the dram_type field. No changes there.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_2100.c | 47 +++++++++++++++++--
 drivers/gpu/drm/ast/ast_drv.h  |  2 -
 drivers/gpu/drm/ast/ast_main.c | 83 ----------------------------------
 3 files changed, 44 insertions(+), 88 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_2100.c b/drivers/gpu/drm/ast/ast_2100.c
index 477ee15eff5d..44c33dd050eb 100644
--- a/drivers/gpu/drm/ast/ast_2100.c
+++ b/drivers/gpu/drm/ast/ast_2100.c
@@ -31,6 +31,38 @@
 #include "ast_drv.h"
 #include "ast_post.h"
 
+/*
+ * DRAM type
+ */
+
+static int ast_2100_get_dram_type_p2a(struct ast_device *ast)
+{
+	u32 mcr_cfg;
+	int dram_type;
+
+	ast_write32(ast, 0xf004, 0x1e6e0000);
+	ast_write32(ast, 0xf000, 0x1);
+	mcr_cfg = ast_read32(ast, 0x10004);
+
+	switch (mcr_cfg & 0x0c) {
+	case 0:
+	case 4:
+		dram_type = AST_DRAM_512Mx16;
+		break;
+	case 8:
+		if (mcr_cfg & 0x40)
+			dram_type = AST_DRAM_1Gx16;
+		else
+			dram_type = AST_DRAM_512Mx32;
+		break;
+	case 0xc:
+		dram_type = AST_DRAM_1Gx32;
+		break;
+	}
+
+	return dram_type;
+}
+
 /*
  * POST
  */
@@ -266,6 +298,9 @@ static void ast_post_chip_2100(struct ast_device *ast)
 	u8 j;
 	u32 data, temp, i;
 	const struct ast_dramstruct *dram_reg_info;
+	int dram_type;
+
+	dram_type = ast_2100_get_dram_type_p2a(ast);
 
 	j = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd0, 0xff);
 
@@ -292,11 +327,17 @@ static void ast_post_chip_2100(struct ast_device *ast)
 				for (i = 0; i < 15; i++)
 					udelay(dram_reg_info->data);
 			} else if (AST_DRAMSTRUCT_IS(dram_reg_info, DRAM_TYPE)) {
-				data = dram_reg_info->data;
-				if (ast->dram_type == AST_DRAM_1Gx16)
+				switch (dram_type) {
+				case AST_DRAM_1Gx16:
 					data = 0x00000d89;
-				else if (ast->dram_type == AST_DRAM_1Gx32)
+					break;
+				case AST_DRAM_1Gx32:
 					data = 0x00000c8d;
+					break;
+				default:
+					data = dram_reg_info->data;
+					break;
+				};
 
 				temp = ast_read32(ast, 0x12070);
 				temp &= 0xc;
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index c9c933b5a70d..4c29ae9fb511 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -172,8 +172,6 @@ struct ast_device {
 	enum ast_config_mode config_mode;
 	enum ast_chip chip;
 
-	uint32_t dram_type;
-
 	void __iomem	*vram;
 	unsigned long	vram_base;
 	unsigned long	vram_size;
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 41ff880cfdec..3eea6a6cdacd 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -210,85 +210,6 @@ static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
 	drm_info(dev, "Using %s\n", info_str[ast->tx_chip]);
 }
 
-static int ast_get_dram_info(struct ast_device *ast)
-{
-	struct drm_device *dev = &ast->base;
-	struct device_node *np = dev->dev->of_node;
-	uint32_t mcr_cfg;
-
-	switch (ast->config_mode) {
-	case ast_use_dt:
-		/*
-		 * If some properties are missing, use reasonable
-		 * defaults for GEN5
-		 */
-		if (of_property_read_u32(np, "aspeed,mcr-configuration", &mcr_cfg))
-			mcr_cfg = 0x00000577;
-		break;
-	case ast_use_p2a:
-		ast_write32(ast, 0xf004, 0x1e6e0000);
-		ast_write32(ast, 0xf000, 0x1);
-		mcr_cfg = ast_read32(ast, 0x10004);
-		break;
-	case ast_use_defaults:
-	default:
-		ast->dram_type = AST_DRAM_1Gx16;
-		return 0;
-	}
-
-	if (IS_AST_GEN6(ast)) {
-		switch (mcr_cfg & 0x03) {
-		case 0:
-			ast->dram_type = AST_DRAM_1Gx16;
-			break;
-		default:
-		case 1:
-			ast->dram_type = AST_DRAM_2Gx16;
-			break;
-		case 2:
-			ast->dram_type = AST_DRAM_4Gx16;
-			break;
-		case 3:
-			ast->dram_type = AST_DRAM_8Gx16;
-			break;
-		}
-	} else if (IS_AST_GEN4(ast) || IS_AST_GEN5(ast)) {
-		switch (mcr_cfg & 0x03) {
-		case 0:
-			ast->dram_type = AST_DRAM_512Mx16;
-			break;
-		default:
-		case 1:
-			ast->dram_type = AST_DRAM_1Gx16;
-			break;
-		case 2:
-			ast->dram_type = AST_DRAM_2Gx16;
-			break;
-		case 3:
-			ast->dram_type = AST_DRAM_4Gx16;
-			break;
-		}
-	} else {
-		switch (mcr_cfg & 0x0c) {
-		case 0:
-		case 4:
-			ast->dram_type = AST_DRAM_512Mx16;
-			break;
-		case 8:
-			if (mcr_cfg & 0x40)
-				ast->dram_type = AST_DRAM_1Gx16;
-			else
-				ast->dram_type = AST_DRAM_512Mx32;
-			break;
-		case 0xc:
-			ast->dram_type = AST_DRAM_1Gx32;
-			break;
-		}
-	}
-
-	return 0;
-}
-
 struct drm_device *ast_device_create(struct pci_dev *pdev,
 				     const struct drm_driver *drv,
 				     enum ast_chip chip,
@@ -311,10 +232,6 @@ struct drm_device *ast_device_create(struct pci_dev *pdev,
 	ast->regs = regs;
 	ast->ioregs = ioregs;
 
-	ret = ast_get_dram_info(ast);
-	if (ret)
-		return ERR_PTR(ret);
-
 	ast_detect_tx_chip(ast, need_post);
 	switch (ast->tx_chip) {
 	case AST_TX_ASTDP:
-- 
2.50.1

