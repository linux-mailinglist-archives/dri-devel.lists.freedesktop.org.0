Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D60673331D
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 16:08:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99BB510E63A;
	Fri, 16 Jun 2023 14:07:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C29710E62F
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 14:07:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id ECFDA21E60;
 Fri, 16 Jun 2023 14:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686924463; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sk/SDLr4DGo5OyVHSyj7uaw7REF97GjJ9edmInQKRkE=;
 b=OiMKsM8ceo599T6/5t2VHHFBKNphscGK9btq+PslAQRaYCcG2yQsJ/nm23thlbbDO3AO8R
 kTNSqAh0FFcYPkA2VU502RbVvxNhTR6eLjHHPpJZarwc/SV1/hCY8tgaMKeU0hHOVdg7NS
 r12utCdOjooSsJ4PvjSvk6rbs/ZBHwU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686924463;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sk/SDLr4DGo5OyVHSyj7uaw7REF97GjJ9edmInQKRkE=;
 b=VuYhiHz+e+HcegAvFXiqYUNhRwUgbuH5An9Fg313cJnYqe7Lzsrod5fL+6Z0HqmYD5SiYA
 osG7lSYznc7iFICQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C92C4138E8;
 Fri, 16 Jun 2023 14:07:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CBI4MK9sjGTfWgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 16 Jun 2023 14:07:43 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, daniel@ffwll.ch,
 jammy_huang@aspeedtech.com
Subject: [PATCH 14/14] drm/ast: Merge config and chip detection
Date: Fri, 16 Jun 2023 15:52:36 +0200
Message-ID: <20230616140739.32042-15-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230616140739.32042-1-tzimmermann@suse.de>
References: <20230616140739.32042-1-tzimmermann@suse.de>
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

Detection of the configuration mode and the chipset model are
linked to each other. One uses values from the other; namely the
PCI device revision and the SCU revision. Merge this code into
a single function.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_main.c | 108 +++++++++++++++++----------------
 1 file changed, 57 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index f028b5b47c56e..5fcddd0dac5e8 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -97,68 +97,75 @@ static void ast_open_key(struct ast_device *ast)
 	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0x80, 0xA8);
 }
 
-static void ast_detect_config_mode(struct drm_device *dev, u32 *scu_rev)
+static int ast_device_config_init(struct ast_device *ast)
 {
-	struct device_node *np = dev->dev->of_node;
-	struct ast_device *ast = to_ast_device(dev);
+	struct drm_device *dev = &ast->base;
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
-	uint32_t data, jregd0, jregd1;
+	struct device_node *np = dev->dev->of_node;
+	uint32_t scu_rev = 0xffffffff;
+	u32 data;
+	u8 jregd0, jregd1;
+
+	/*
+	 * Find configuration mode and read SCU revision
+	 */
 
-	/* Defaults */
 	ast->config_mode = ast_use_defaults;
 
 	/* Check if we have device-tree properties */
-	if (np && !of_property_read_u32(np, "aspeed,scu-revision-id",
-					scu_rev)) {
+	if (np && !of_property_read_u32(np, "aspeed,scu-revision-id", &data)) {
 		/* We do, disable P2A access */
 		ast->config_mode = ast_use_dt;
-		drm_info(dev, "Using device-tree for configuration\n");
-		return;
-	}
+		scu_rev = data;
+	} else if (pdev->device == PCI_CHIP_AST2000) { // Not all families have a P2A bridge
+		/*
+		 * The BMC will set SCU 0x40 D[12] to 1 if the P2 bridge
+		 * is disabled. We force using P2A if VGA only mode bit
+		 * is set D[7]
+		 */
+		jregd0 = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xd0, 0xff);
+		jregd1 = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xd1, 0xff);
+		if (!(jregd0 & 0x80) || !(jregd1 & 0x10)) {
+
+			/*
+			 * We have a P2A bridge and it is enabled.
+			 */
+
+			/* Patch AST2500/AST2510 */
+			if ((pdev->revision & 0xf0) == 0x40) {
+				if (!(jregd0 & AST_VRAM_INIT_STATUS_MASK))
+					ast_patch_ahb_2500(ast);
+			}
 
-	/* Not all families have a P2A bridge */
-	if (pdev->device != PCI_CHIP_AST2000)
-		return;
+			/* Double check that it's actually working */
+			data = ast_read32(ast, 0xf004);
+			if ((data != 0xffffffff) && (data != 0x00)) {
+				ast->config_mode = ast_use_p2a;
 
-	/*
-	 * The BMC will set SCU 0x40 D[12] to 1 if the P2 bridge
-	 * is disabled. We force using P2A if VGA only mode bit
-	 * is set D[7]
-	 */
-	jregd0 = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xd0, 0xff);
-	jregd1 = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xd1, 0xff);
-	if (!(jregd0 & 0x80) || !(jregd1 & 0x10)) {
-		/* Patch GEN6 */
-		if (((pdev->revision & 0xF0) == 0x40)
-			&& ((jregd0 & AST_VRAM_INIT_STATUS_MASK) == 0))
-			ast_patch_ahb_2500(ast);
-
-		/* Double check it's actually working */
-		data = ast_read32(ast, 0xf004);
-		if ((data != 0xFFFFFFFF) && (data != 0x00)) {
-			/* P2A works, grab silicon revision */
-			ast->config_mode = ast_use_p2a;
-
-			drm_info(dev, "Using P2A bridge for configuration\n");
-
-			/* Read SCU7c (silicon revision register) */
-			ast_write32(ast, 0xf004, 0x1e6e0000);
-			ast_write32(ast, 0xf000, 0x1);
-			*scu_rev = ast_read32(ast, 0x1207c);
-			return;
+				/* Read SCU7c (silicon revision register) */
+				ast_write32(ast, 0xf004, 0x1e6e0000);
+				ast_write32(ast, 0xf000, 0x1);
+				scu_rev = ast_read32(ast, 0x1207c);
+			}
 		}
 	}
 
-	/* We have a P2A bridge but it's disabled */
-	drm_info(dev, "P2A bridge disabled, using default configuration\n");
-}
+	switch (ast->config_mode) {
+	case ast_use_defaults:
+		drm_info(dev, "Using default configuration\n");
+		break;
+	case ast_use_dt:
+		drm_info(dev, "Using device-tree for configuration\n");
+		break;
+	case ast_use_p2a:
+		drm_info(dev, "Using P2A bridge for configuration\n");
+		break;
+	}
 
-static int ast_detect_chip(struct drm_device *dev, bool need_post, u32 scu_rev)
-{
-	struct ast_device *ast = to_ast_device(dev);
-	struct pci_dev *pdev = to_pci_dev(dev->dev);
+	/*
+	 * Identify chipset
+	 */
 
-	/* Identify chipset */
 	if (pdev->revision >= 0x50) {
 		ast->chip = AST2600;
 		drm_info(dev, "AST 2600 detected\n");
@@ -443,7 +450,6 @@ struct ast_device *ast_device_create(const struct drm_driver *drv,
 	struct ast_device *ast;
 	bool need_post = false;
 	int ret = 0;
-	u32 scu_rev = 0xffffffff;
 
 	ast = devm_drm_dev_alloc(&pdev->dev, drv, struct ast_device, base);
 	if (IS_ERR(ast))
@@ -500,10 +506,10 @@ struct ast_device *ast_device_create(const struct drm_driver *drv,
 	if (ret)
 		return ERR_PTR(ret);
 
-	/* Find out whether P2A works or whether to use device-tree */
-	ast_detect_config_mode(dev, &scu_rev);
+	ret = ast_device_config_init(ast);
+	if (ret)
+		return ERR_PTR(ret);
 
-	ast_detect_chip(dev, need_post, scu_rev);
 	ast_detect_widescreen(ast);
 	ast_detect_tx_chip(ast, need_post);
 
-- 
2.41.0

