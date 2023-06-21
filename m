Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F0B738441
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 15:01:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3441D10E460;
	Wed, 21 Jun 2023 13:00:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CB1A10E465
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 13:00:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 84A2921C9C;
 Wed, 21 Jun 2023 13:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1687352435; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ewQZFs6cAM0pnz/b7PpC+eNKnCHMCZsg1C653e7Lwjk=;
 b=nziRzsFLPn78HHb2XpKH0OsZj6Rr8hmgdKDquIOFW4YeYKmk1dQ7b9VSEvDAmgxqC9xwO7
 py6C2AuoPtJ8zKXxwUvvRUzNmtcdEOc9w4vDWBNcXNDhVwsPJeoxsiQZIUAlbPuw1QtAqy
 t1fsqui2P35bcArbaTZiYzvGKR/lD2U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1687352435;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ewQZFs6cAM0pnz/b7PpC+eNKnCHMCZsg1C653e7Lwjk=;
 b=aLrvdFSBVCClzVYP8NqIQnLcdf1OkYXo7ePdr/X+PdqWenskXbl2KJBg0AitoV3ZH5Efpd
 j5EoSfGi+J7OSBBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 52F66134B1;
 Wed, 21 Jun 2023 13:00:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0HpgE3P0kmTaWgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 21 Jun 2023 13:00:35 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, daniel@ffwll.ch,
 jammy_huang@aspeedtech.com, suijingfeng@loongson.cn
Subject: [PATCH v2 07/14] drm/ast: Enable and unlock device access early
 during init
Date: Wed, 21 Jun 2023 14:53:41 +0200
Message-ID: <20230621130032.3568-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230621130032.3568-1-tzimmermann@suse.de>
References: <20230621130032.3568-1-tzimmermann@suse.de>
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

POST and memory management contains code to enable access to the
device's memory spaces. This is too late. Consolidate this code at
the beginning of the device initialization.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
Tested-by: Jocelyn Falempe <jfalempe@redhat.com> # AST2600
---
 drivers/gpu/drm/ast/ast_drv.h  |  8 --------
 drivers/gpu/drm/ast/ast_main.c | 30 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/ast/ast_mm.c   |  2 --
 drivers/gpu/drm/ast/ast_post.c | 29 -----------------------------
 4 files changed, 30 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 630105feec18a..31fead32b19cc 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -287,11 +287,6 @@ static inline void ast_set_index_reg_mask(struct ast_device *ast, u32 base, u8 i
 	ast_set_index_reg(ast, base, index, tmp);
 }
 
-static inline void ast_open_key(struct ast_device *ast)
-{
-	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0x80, 0xA8);
-}
-
 #define AST_VIDMEM_SIZE_8M    0x00800000
 #define AST_VIDMEM_SIZE_16M   0x01000000
 #define AST_VIDMEM_SIZE_32M   0x02000000
@@ -470,9 +465,6 @@ int ast_mode_config_init(struct ast_device *ast);
 int ast_mm_init(struct ast_device *ast);
 
 /* ast post */
-void ast_enable_vga(struct drm_device *dev);
-void ast_enable_mmio(struct drm_device *dev);
-bool ast_is_vga_enabled(struct drm_device *dev);
 void ast_post_gpu(struct drm_device *dev);
 u32 ast_mindwm(struct ast_device *ast, u32 r);
 void ast_moutdwm(struct ast_device *ast, u32 r, u32 v);
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 01f938c2da28f..031ff4ed1920f 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -52,6 +52,36 @@ static int ast_init_pci_config(struct pci_dev *pdev)
 	return pcibios_err_to_errno(err);
 }
 
+static bool ast_is_vga_enabled(struct drm_device *dev)
+{
+	struct ast_device *ast = to_ast_device(dev);
+	u8 ch;
+
+	ch = ast_io_read8(ast, AST_IO_VGA_ENABLE_PORT);
+
+	return !!(ch & 0x01);
+}
+
+static void ast_enable_vga(struct drm_device *dev)
+{
+	struct ast_device *ast = to_ast_device(dev);
+
+	ast_io_write8(ast, AST_IO_VGA_ENABLE_PORT, 0x01);
+	ast_io_write8(ast, AST_IO_MISC_PORT_WRITE, 0x01);
+}
+
+static void ast_enable_mmio(struct drm_device *dev)
+{
+	struct ast_device *ast = to_ast_device(dev);
+
+	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa1, 0x06);
+}
+
+static void ast_open_key(struct ast_device *ast)
+{
+	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0x80, 0xA8);
+}
+
 static void ast_detect_config_mode(struct drm_device *dev, u32 *scu_rev)
 {
 	struct device_node *np = dev->dev->of_node;
diff --git a/drivers/gpu/drm/ast/ast_mm.c b/drivers/gpu/drm/ast/ast_mm.c
index e16af60deef90..bc174bd933b97 100644
--- a/drivers/gpu/drm/ast/ast_mm.c
+++ b/drivers/gpu/drm/ast/ast_mm.c
@@ -38,8 +38,6 @@ static u32 ast_get_vram_size(struct ast_device *ast)
 	u8 jreg;
 	u32 vram_size;
 
-	ast_open_key(ast);
-
 	vram_size = AST_VIDMEM_DEFAULT_SIZE;
 	jreg = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xaa, 0xff);
 	switch (jreg & 3) {
diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c
index 2da5bdb4bac45..b765eeb55e5f1 100644
--- a/drivers/gpu/drm/ast/ast_post.c
+++ b/drivers/gpu/drm/ast/ast_post.c
@@ -37,32 +37,6 @@
 static void ast_post_chip_2300(struct drm_device *dev);
 static void ast_post_chip_2500(struct drm_device *dev);
 
-void ast_enable_vga(struct drm_device *dev)
-{
-	struct ast_device *ast = to_ast_device(dev);
-
-	ast_io_write8(ast, AST_IO_VGA_ENABLE_PORT, 0x01);
-	ast_io_write8(ast, AST_IO_MISC_PORT_WRITE, 0x01);
-}
-
-void ast_enable_mmio(struct drm_device *dev)
-{
-	struct ast_device *ast = to_ast_device(dev);
-
-	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa1, 0x06);
-}
-
-
-bool ast_is_vga_enabled(struct drm_device *dev)
-{
-	struct ast_device *ast = to_ast_device(dev);
-	u8 ch;
-
-	ch = ast_io_read8(ast, AST_IO_VGA_ENABLE_PORT);
-
-	return !!(ch & 0x01);
-}
-
 static const u8 extreginfo[] = { 0x0f, 0x04, 0x1c, 0xff };
 static const u8 extreginfo_ast2300[] = { 0x0f, 0x04, 0x1f, 0xff };
 
@@ -362,9 +336,6 @@ void ast_post_gpu(struct drm_device *dev)
 {
 	struct ast_device *ast = to_ast_device(dev);
 
-	ast_enable_vga(dev);
-	ast_open_key(ast);
-	ast_enable_mmio(dev);
 	ast_set_def_ext_reg(dev);
 
 	if (ast->chip == AST2600) {
-- 
2.41.0

