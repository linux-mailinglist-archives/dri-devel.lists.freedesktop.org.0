Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AADD57E98A4
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 10:15:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDADF10E18A;
	Mon, 13 Nov 2023 09:14:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 162C410E011
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 09:14:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A790221904;
 Mon, 13 Nov 2023 09:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1699866884; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QdkLe4hv65BbS4stMNyWjHVsqnjTMyuYmEkHswoG+wY=;
 b=xQDYeDSGjFw6RoGMxDPjxnpwqQlxaTVr4NYTfi/RXTJZ/o24ruYtW4E/7UrbEO6YroElxz
 F0hpFLqC7d6xKqTQonq2jHiGhI3VRONxh2Qt7KVrFpuOtiQpGUwgAfdDnklewWvbEhkBm9
 zMouKBWE0NVKriBkqo9b3te03k5fD8w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1699866884;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QdkLe4hv65BbS4stMNyWjHVsqnjTMyuYmEkHswoG+wY=;
 b=IvtHnbKU6nuIGg4TLxYs+DqFranPGGxfQ0hOMBs9i8AZnduyGEbDqTXI7jU3YLHbboDZCw
 7OgEiQ1dyVPFNwDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 78D6813398;
 Mon, 13 Nov 2023 09:14:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kGl7HATpUWW0BwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 13 Nov 2023 09:14:44 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, daniel@ffwll.ch, airlied@gmail.com
Subject: [PATCH 05/10] drm/ast: Enable VGA without ast device instance
Date: Mon, 13 Nov 2023 09:50:27 +0100
Message-ID: <20231113091439.17181-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231113091439.17181-1-tzimmermann@suse.de>
References: <20231113091439.17181-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We'll have to enable the VGA functionality for detecting the ast
device type. Make this work without an instance of the ast device.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_main.c | 29 ++++++++++++-----------------
 drivers/gpu/drm/ast/ast_reg.h  |  9 +++++++--
 2 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 43116df577276..1d2ec77c1d8d9 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -35,22 +35,17 @@
 
 #include "ast_drv.h"
 
-static bool ast_is_vga_enabled(struct drm_device *dev)
+static bool ast_is_vga_enabled(void __iomem *ioregs)
 {
-	struct ast_device *ast = to_ast_device(dev);
-	u8 ch;
-
-	ch = ast_io_read8(ast, AST_IO_VGAER);
+	u8 vgaer = __ast_read8(ioregs, AST_IO_VGAER);
 
-	return !!(ch & 0x01);
+	return vgaer & AST_IO_VGAER_VGA_ENABLE;
 }
 
-static void ast_enable_vga(struct drm_device *dev)
+static void ast_enable_vga(void __iomem *ioregs)
 {
-	struct ast_device *ast = to_ast_device(dev);
-
-	ast_io_write8(ast, AST_IO_VGAER, 0x01);
-	ast_io_write8(ast, AST_IO_VGAMR_W, 0x01);
+	__ast_write8(ioregs, AST_IO_VGAER, AST_IO_VGAER_VGA_ENABLE);
+	__ast_write8(ioregs, AST_IO_VGAMR_W, AST_IO_VGAMR_IOSEL);
 }
 
 /*
@@ -74,9 +69,9 @@ static int ast_enable_mmio(struct ast_device *ast)
 	return devm_add_action_or_reset(dev->dev, ast_enable_mmio_release, ast);
 }
 
-static void ast_open_key(struct ast_device *ast)
+static void ast_open_key(void __iomem *ioregs)
 {
-	ast_set_index_reg(ast, AST_IO_VGACRI, 0x80, 0xA8);
+	__ast_write8_i(ioregs, AST_IO_VGACRI, 0x80, AST_IO_VGACR80_PASSWORD);
 }
 
 static int ast_device_config_init(struct ast_device *ast)
@@ -487,7 +482,7 @@ struct ast_device *ast_device_create(const struct drm_driver *drv,
 	ast->regs = regs;
 	ast->ioregs = ioregs;
 
-	if (!ast_is_vga_enabled(dev)) {
+	if (!ast_is_vga_enabled(ioregs)) {
 		drm_info(dev, "VGA not enabled on entry, requesting chip POST\n");
 		need_post = true;
 	}
@@ -497,10 +492,10 @@ struct ast_device *ast_device_create(const struct drm_driver *drv,
 	 * access to the scratch registers will fail.
 	 */
 	if (need_post)
-		ast_enable_vga(dev);
-
+		ast_enable_vga(ioregs);
 	/* Enable extended register access */
-	ast_open_key(ast);
+	ast_open_key(ioregs);
+
 	ret = ast_enable_mmio(ast);
 	if (ret)
 		return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/ast/ast_reg.h b/drivers/gpu/drm/ast/ast_reg.h
index f1e1700c01ed2..826fcb08398ec 100644
--- a/drivers/gpu/drm/ast/ast_reg.h
+++ b/drivers/gpu/drm/ast/ast_reg.h
@@ -13,8 +13,14 @@
 #define AST_IO_MM_LENGTH		(0xff)
 
 #define AST_IO_VGAARI_W			(0x40)
+
 #define AST_IO_VGAMR_W			(0x42)
+#define AST_IO_VGAMR_R			(0x4c)
+#define AST_IO_VGAMR_IOSEL		BIT(0)
+
 #define AST_IO_VGAER			(0x43)
+#define AST_IO_VGAER_VGA_ENABLE		BIT(0)
+
 #define AST_IO_VGASRI			(0x44)
 #define AST_IO_VGADRR			(0x47)
 #define AST_IO_VGADWR			(0x48)
@@ -22,14 +28,13 @@
 #define AST_IO_VGAGRI			(0x4E)
 
 #define AST_IO_VGACRI			(0x54)
+#define AST_IO_VGACR80_PASSWORD		(0xa8)
 #define AST_IO_VGACRCB_HWC_16BPP	BIT(0) /* set: ARGB4444, cleared: 2bpp palette */
 #define AST_IO_VGACRCB_HWC_ENABLED	BIT(1)
 
 #define AST_IO_VGAIR1_R			(0x5A)
 #define AST_IO_VGAIR1_VREFRESH		BIT(3)
 
-#define AST_IO_VGAMR_R			(0x4C)
-
 /*
  * Display Transmitter Type
  */
-- 
2.42.0

