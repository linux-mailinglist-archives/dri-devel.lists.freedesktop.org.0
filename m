Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D907E98A8
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 10:15:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71A9410E2F9;
	Mon, 13 Nov 2023 09:15:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4926D10E15B
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 09:14:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0E5881F750;
 Mon, 13 Nov 2023 09:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1699866885; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aktxMqY/ugprwJs2gJYwfxuvyv++OJvKJmK8VhKFrlo=;
 b=um/kAGbCPBOFdDge/phF6StkEzVMrHU95RHeimpMzOvwa7vnQ7Hpgsuk/eNaDIV67mPLsx
 d0iPzpjsfAPe9tp6UgXj12NcFJLjJG4i8O3fO0UXpUqZVfU4IyQkfm16Unjr+/E4xAakMX
 /nK8NCn7pA/SL0B3sh81OBLe/xarMX4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1699866885;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aktxMqY/ugprwJs2gJYwfxuvyv++OJvKJmK8VhKFrlo=;
 b=FpZAx//ODgUaW/VBR0hZ885Tll8Z2tWISRjd4DgHSw0fDIbIKouMlSYc4vc69/YV0q+2qF
 +KFJoRzZPvaFYHAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D5E3F13398;
 Mon, 13 Nov 2023 09:14:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GNFgMwTpUWW0BwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 13 Nov 2023 09:14:44 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, daniel@ffwll.ch, airlied@gmail.com
Subject: [PATCH 07/10] drm/ast: Partially implement POST without ast device
 instance
Date: Mon, 13 Nov 2023 09:50:29 +0100
Message-ID: <20231113091439.17181-8-tzimmermann@suse.de>
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

We'll have to do some of the GPU POSTing for detecting the ast device
type. Make this work without an instance of the ast device.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_drv.h  |  2 +-
 drivers/gpu/drm/ast/ast_main.c |  2 +-
 drivers/gpu/drm/ast/ast_post.c | 73 +++++++++++++++++++++-------------
 3 files changed, 47 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index b82be890d9fce..491603a13151c 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -471,7 +471,7 @@ int ast_mm_init(struct ast_device *ast);
 void ast_post_gpu(struct drm_device *dev);
 u32 ast_mindwm(struct ast_device *ast, u32 r);
 void ast_moutdwm(struct ast_device *ast, u32 r, u32 v);
-void ast_patch_ahb_2500(struct ast_device *ast);
+void ast_patch_ahb_2500(void __iomem *regs);
 /* ast dp501 */
 void ast_set_dp501_video_output(struct drm_device *dev, u8 mode);
 bool ast_backup_fw(struct drm_device *dev, u8 *addr, u32 size);
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index a24d3529373c1..f100df8d74f71 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -113,7 +113,7 @@ static int ast_device_config_init(struct ast_device *ast)
 			/* Patch AST2500/AST2510 */
 			if ((pdev->revision & 0xf0) == 0x40) {
 				if (!(jregd0 & AST_VRAM_INIT_STATUS_MASK))
-					ast_patch_ahb_2500(ast);
+					ast_patch_ahb_2500(ast->regs);
 			}
 
 			/* Double check that it's actually working */
diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c
index 7a993a3843147..22f548805dfb0 100644
--- a/drivers/gpu/drm/ast/ast_post.c
+++ b/drivers/gpu/drm/ast/ast_post.c
@@ -77,28 +77,42 @@ ast_set_def_ext_reg(struct drm_device *dev)
 	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xff, reg);
 }
 
-u32 ast_mindwm(struct ast_device *ast, u32 r)
+static u32 __ast_mindwm(void __iomem *regs, u32 r)
 {
-	uint32_t data;
+	u32 data;
 
-	ast_write32(ast, 0xf004, r & 0xffff0000);
-	ast_write32(ast, 0xf000, 0x1);
+	__ast_write32(regs, 0xf004, r & 0xffff0000);
+	__ast_write32(regs, 0xf000, 0x1);
 
 	do {
-		data = ast_read32(ast, 0xf004) & 0xffff0000;
+		data = __ast_read32(regs, 0xf004) & 0xffff0000;
 	} while (data != (r & 0xffff0000));
-	return ast_read32(ast, 0x10000 + (r & 0x0000ffff));
+
+	return __ast_read32(regs, 0x10000 + (r & 0x0000ffff));
 }
 
-void ast_moutdwm(struct ast_device *ast, u32 r, u32 v)
+static void __ast_moutdwm(void __iomem *regs, u32 r, u32 v)
 {
-	uint32_t data;
-	ast_write32(ast, 0xf004, r & 0xffff0000);
-	ast_write32(ast, 0xf000, 0x1);
+	u32 data;
+
+	__ast_write32(regs, 0xf004, r & 0xffff0000);
+	__ast_write32(regs, 0xf000, 0x1);
+
 	do {
-		data = ast_read32(ast, 0xf004) & 0xffff0000;
+		data = __ast_read32(regs, 0xf004) & 0xffff0000;
 	} while (data != (r & 0xffff0000));
-	ast_write32(ast, 0x10000 + (r & 0x0000ffff), v);
+
+	__ast_write32(regs, 0x10000 + (r & 0x0000ffff), v);
+}
+
+u32 ast_mindwm(struct ast_device *ast, u32 r)
+{
+	return __ast_mindwm(ast->regs, r);
+}
+
+void ast_moutdwm(struct ast_device *ast, u32 r, u32 v)
+{
+	__ast_moutdwm(ast->regs, r, v);
 }
 
 /*
@@ -1987,17 +2001,18 @@ static bool ast_dram_init_2500(struct ast_device *ast)
 	return true;
 }
 
-void ast_patch_ahb_2500(struct ast_device *ast)
+void ast_patch_ahb_2500(void __iomem *regs)
 {
-	u32	data;
+	u32 data;
 
 	/* Clear bus lock condition */
-	ast_moutdwm(ast, 0x1e600000, 0xAEED1A03);
-	ast_moutdwm(ast, 0x1e600084, 0x00010000);
-	ast_moutdwm(ast, 0x1e600088, 0x00000000);
-	ast_moutdwm(ast, 0x1e6e2000, 0x1688A8A8);
-	data = ast_mindwm(ast, 0x1e6e2070);
-	if (data & 0x08000000) {					/* check fast reset */
+	__ast_moutdwm(regs, 0x1e600000, 0xAEED1A03);
+	__ast_moutdwm(regs, 0x1e600084, 0x00010000);
+	__ast_moutdwm(regs, 0x1e600088, 0x00000000);
+	__ast_moutdwm(regs, 0x1e6e2000, 0x1688A8A8);
+
+	data = __ast_mindwm(regs, 0x1e6e2070);
+	if (data & 0x08000000) { /* check fast reset */
 		/*
 		 * If "Fast restet" is enabled for ARM-ICE debugger,
 		 * then WDT needs to enable, that
@@ -2009,16 +2024,18 @@ void ast_patch_ahb_2500(struct ast_device *ast)
 		 *	[1]:= 1:WDT will be cleeared and disabled after timeout occurs
 		 *	[0]:= 1:WDT enable
 		 */
-		ast_moutdwm(ast, 0x1E785004, 0x00000010);
-		ast_moutdwm(ast, 0x1E785008, 0x00004755);
-		ast_moutdwm(ast, 0x1E78500c, 0x00000033);
+		__ast_moutdwm(regs, 0x1E785004, 0x00000010);
+		__ast_moutdwm(regs, 0x1E785008, 0x00004755);
+		__ast_moutdwm(regs, 0x1E78500c, 0x00000033);
 		udelay(1000);
 	}
+
 	do {
-		ast_moutdwm(ast, 0x1e6e2000, 0x1688A8A8);
-		data = ast_mindwm(ast, 0x1e6e2000);
-	}	while (data != 1);
-	ast_moutdwm(ast, 0x1e6e207c, 0x08000000);	/* clear fast reset */
+		__ast_moutdwm(regs, 0x1e6e2000, 0x1688A8A8);
+		data = __ast_mindwm(regs, 0x1e6e2000);
+	} while (data != 1);
+
+	__ast_moutdwm(regs, 0x1e6e207c, 0x08000000); /* clear fast reset */
 }
 
 void ast_post_chip_2500(struct drm_device *dev)
@@ -2030,7 +2047,7 @@ void ast_post_chip_2500(struct drm_device *dev)
 	reg = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd0, 0xff);
 	if ((reg & AST_VRAM_INIT_STATUS_MASK) == 0) {/* vga only */
 		/* Clear bus lock condition */
-		ast_patch_ahb_2500(ast);
+		ast_patch_ahb_2500(ast->regs);
 
 		/* Disable watchdog */
 		ast_moutdwm(ast, 0x1E78502C, 0x00000000);
-- 
2.42.0

