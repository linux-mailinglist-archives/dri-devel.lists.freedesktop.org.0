Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE819A14D9F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 11:35:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1F6610E17D;
	Fri, 17 Jan 2025 10:34:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="nIwNUPmm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iDG+InIA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nIwNUPmm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iDG+InIA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFF5A10E17D
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 10:34:57 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 362651F387;
 Fri, 17 Jan 2025 10:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1737110096; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C+en2xeEY6vA0c83REzETX4qIDE4Adq2pmPXY5D3no0=;
 b=nIwNUPmmT/hqLH0E8hVJnNn1c7fhx0HTbqhGkuX7tlLzCSt8Tj5Styds5f/+Gd8PDxF2t6
 SoQXLHODck/d0b2Euze1n4p5F11qHbVoflGGtdbh+hvEA8YOVhbZ+MDc0b02l3qGj7V49c
 d+aI2g4EJDK+YGaIN4Vh9/hgHuHmTRE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1737110096;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C+en2xeEY6vA0c83REzETX4qIDE4Adq2pmPXY5D3no0=;
 b=iDG+InIA8Gj55j8yeb5C5ETB5c79TSuJzzugpd1aHoJevq77s7riOxW8kDOhqi2sFneeNZ
 Z9fvSOy0ZYduiLCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1737110096; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C+en2xeEY6vA0c83REzETX4qIDE4Adq2pmPXY5D3no0=;
 b=nIwNUPmmT/hqLH0E8hVJnNn1c7fhx0HTbqhGkuX7tlLzCSt8Tj5Styds5f/+Gd8PDxF2t6
 SoQXLHODck/d0b2Euze1n4p5F11qHbVoflGGtdbh+hvEA8YOVhbZ+MDc0b02l3qGj7V49c
 d+aI2g4EJDK+YGaIN4Vh9/hgHuHmTRE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1737110096;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C+en2xeEY6vA0c83REzETX4qIDE4Adq2pmPXY5D3no0=;
 b=iDG+InIA8Gj55j8yeb5C5ETB5c79TSuJzzugpd1aHoJevq77s7riOxW8kDOhqi2sFneeNZ
 Z9fvSOy0ZYduiLCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0466A13AF0;
 Fri, 17 Jan 2025 10:34:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id sFt3O08yimewLAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 17 Jan 2025 10:34:55 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 4/8] drm/ast: Initialize ASTDP in ast_post_gpu()
Date: Fri, 17 Jan 2025 11:29:09 +0100
Message-ID: <20250117103450.28692-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117103450.28692-1-tzimmermann@suse.de>
References: <20250117103450.28692-1-tzimmermann@suse.de>
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
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
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

Remove the call to ast_dp_launch() from ast_detect_tx_chip() and
perform it unconditionally in ast_post_gpu().

Also add error handling: the detection code apparently used
ast_dp_launch() to test for a working ASTDP, falling back to VGA on
errors. As the VBIOS reports ASTDP, silently ignoring errors is
questionable behavior. With the refactoring, failing to initialize
the ASTDP will also fail probing the driver.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_drv.c  |  6 +++++-
 drivers/gpu/drm/ast/ast_drv.h  |  2 +-
 drivers/gpu/drm/ast/ast_main.c | 19 +++++++++++++------
 drivers/gpu/drm/ast/ast_post.c | 13 ++++++++++---
 4 files changed, 29 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index ff3bcdd1cff2a..cddd69972e89d 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -393,11 +393,15 @@ static int ast_drm_freeze(struct drm_device *dev)
 static int ast_drm_thaw(struct drm_device *dev)
 {
 	struct ast_device *ast = to_ast_device(dev);
+	int ret;
 
 	ast_enable_vga(ast->ioregs);
 	ast_open_key(ast->ioregs);
 	ast_enable_mmio(dev->dev, ast->ioregs);
-	ast_post_gpu(ast);
+
+	ret = ast_post_gpu(ast);
+	if (ret)
+		return ret;
 
 	return drm_mode_config_helper_resume(dev);
 }
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 6b4305ac07d4f..cf9edef8fca66 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -445,7 +445,7 @@ int ast_mode_config_init(struct ast_device *ast);
 int ast_mm_init(struct ast_device *ast);
 
 /* ast post */
-void ast_post_gpu(struct ast_device *ast);
+int ast_post_gpu(struct ast_device *ast);
 u32 ast_mindwm(struct ast_device *ast, u32 r);
 void ast_moutdwm(struct ast_device *ast, u32 r, u32 v);
 void ast_patch_ahb_2500(void __iomem *regs);
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 456230bef2736..474eb255b325b 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -138,10 +138,7 @@ static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
 	} else if (IS_AST_GEN7(ast)) {
 		if (ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd1, AST_IO_VGACRD1_TX_TYPE_MASK) ==
 		    AST_IO_VGACRD1_TX_ASTDP) {
-			int ret = ast_dp_launch(ast);
-
-			if (!ret)
-				ast->tx_chip = AST_TX_ASTDP;
+			ast->tx_chip = AST_TX_ASTDP;
 		}
 	}
 
@@ -297,8 +294,18 @@ struct drm_device *ast_device_create(struct pci_dev *pdev,
 		 ast->mclk, ast->dram_type, ast->dram_bus_width);
 
 	ast_detect_tx_chip(ast, need_post);
-	if (need_post)
-		ast_post_gpu(ast);
+	switch (ast->tx_chip) {
+	case AST_TX_ASTDP:
+		ret = ast_post_gpu(ast);
+		break;
+	default:
+		ret = 0;
+		if (need_post)
+			ret = ast_post_gpu(ast);
+		break;
+	}
+	if (ret)
+		return ERR_PTR(ret);
 
 	ret = ast_mm_init(ast);
 	if (ret)
diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c
index 49f661760f9e5..0daa8e52a092a 100644
--- a/drivers/gpu/drm/ast/ast_post.c
+++ b/drivers/gpu/drm/ast/ast_post.c
@@ -340,13 +340,18 @@ static void ast_init_dram_reg(struct ast_device *ast)
 	} while ((j & 0x40) == 0);
 }
 
-void ast_post_gpu(struct ast_device *ast)
+int ast_post_gpu(struct ast_device *ast)
 {
+	int ret;
+
 	ast_set_def_ext_reg(ast);
 
 	if (AST_GEN(ast) >= 7) {
-		if (ast->tx_chip == AST_TX_ASTDP)
-			ast_dp_launch(ast);
+		if (ast->tx_chip == AST_TX_ASTDP) {
+			ret = ast_dp_launch(ast);
+			if (ret)
+				return ret;
+		}
 	} else if (AST_GEN(ast) >= 6) {
 		if (ast->config_mode == ast_use_p2a) {
 			ast_post_chip_2500(ast);
@@ -376,6 +381,8 @@ void ast_post_gpu(struct ast_device *ast)
 			}
 		}
 	}
+
+	return 0;
 }
 
 /* AST 2300 DRAM settings */
-- 
2.47.1

