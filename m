Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8237D7EDE1E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 11:03:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DE6210E2DA;
	Thu, 16 Nov 2023 10:02:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E082210E2AD
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 10:02:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 686B620502;
 Thu, 16 Nov 2023 10:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1700128963; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5sEw0vmefy/zDCp+lUAqkdFoT6KfMLahEcNrTSIfUMM=;
 b=BVrqff5OIoLrDB9w5SSuU5L71hFXu863na1ridx2fT+xl2ka5RbUbGqBSYAQJB8pfNSZDm
 73LxGw/AHiJAlXC8VuUAU1TcSnXYWcih6fCzLePzIgL9KUWIn7wI/7HzRdvkx3R6uuC/ld
 eyOmnqj1HuSHI9XehadzEKHQfwqj1lc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1700128963;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5sEw0vmefy/zDCp+lUAqkdFoT6KfMLahEcNrTSIfUMM=;
 b=EGcJPb09fTdLPhr9MR6M55XmxdjVsqSw0iI+hILjv9QTeZrA3bv9VRYJWdaLZw7l1qtW5C
 68xXjIsFdU9iGcAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4420C13A67;
 Thu, 16 Nov 2023 10:02:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QKbID8PoVWXSGgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 16 Nov 2023 10:02:43 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, daniel@ffwll.ch, airlied@gmail.com
Subject: [PATCH v2 09/10] drm/ast: Detect ast device type and config mode
 without ast device
Date: Thu, 16 Nov 2023 10:59:28 +0100
Message-ID: <20231116100240.22975-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231116100240.22975-1-tzimmermann@suse.de>
References: <20231116100240.22975-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 R_MISSING_CHARSET(2.50)[]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; REPLY(-4.00)[];
 BROKEN_CONTENT_TYPE(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_RATELIMIT(0.00)[to_ip_from(RL5hwym8k7wjfpcebf457xyjzi)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_SEVEN(0.00)[8];
 MID_CONTAINS_FROM(1.00)[];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,ffwll.ch,gmail.com];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-3.00)[99.99%]
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Return the ast chip and config in the detection function's parameters
instead of storing them directly in the ast device instance.

v2:
	* add break statements to switch default branches (Jocelyn)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_main.c | 106 ++++++++++++++++++---------------
 1 file changed, 59 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 19c8894e391a0..ad5b758153de1 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -76,25 +76,27 @@ static void ast_open_key(void __iomem *ioregs)
 	__ast_write8_i(ioregs, AST_IO_VGACRI, 0x80, AST_IO_VGACR80_PASSWORD);
 }
 
-static int ast_device_config_init(struct ast_device *ast)
+static int ast_detect_chip(struct pci_dev *pdev,
+			   void __iomem *regs, void __iomem *ioregs,
+			   enum ast_chip *chip_out,
+			   enum ast_config_mode *config_mode_out)
 {
-	struct drm_device *dev = &ast->base;
-	struct pci_dev *pdev = to_pci_dev(dev->dev);
-	struct device_node *np = dev->dev->of_node;
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	enum ast_config_mode config_mode = ast_use_defaults;
 	uint32_t scu_rev = 0xffffffff;
+	enum ast_chip chip;
 	u32 data;
-	u8 jregd0, jregd1;
+	u8 vgacrd0, vgacrd1;
 
 	/*
 	 * Find configuration mode and read SCU revision
 	 */
 
-	ast->config_mode = ast_use_defaults;
-
 	/* Check if we have device-tree properties */
 	if (np && !of_property_read_u32(np, "aspeed,scu-revision-id", &data)) {
 		/* We do, disable P2A access */
-		ast->config_mode = ast_use_dt;
+		config_mode = ast_use_dt;
 		scu_rev = data;
 	} else if (pdev->device == PCI_CHIP_AST2000) { // Not all families have a P2A bridge
 		/*
@@ -102,9 +104,9 @@ static int ast_device_config_init(struct ast_device *ast)
 		 * is disabled. We force using P2A if VGA only mode bit
 		 * is set D[7]
 		 */
-		jregd0 = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd0, 0xff);
-		jregd1 = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd1, 0xff);
-		if (!(jregd0 & 0x80) || !(jregd1 & 0x10)) {
+		vgacrd0 = __ast_read8_i(ioregs, AST_IO_VGACRI, 0xd0);
+		vgacrd1 = __ast_read8_i(ioregs, AST_IO_VGACRI, 0xd1);
+		if (!(vgacrd0 & 0x80) || !(vgacrd1 & 0x10)) {
 
 			/*
 			 * We have a P2A bridge and it is enabled.
@@ -112,32 +114,32 @@ static int ast_device_config_init(struct ast_device *ast)
 
 			/* Patch AST2500/AST2510 */
 			if ((pdev->revision & 0xf0) == 0x40) {
-				if (!(jregd0 & AST_VRAM_INIT_STATUS_MASK))
-					ast_patch_ahb_2500(ast->regs);
+				if (!(vgacrd0 & AST_VRAM_INIT_STATUS_MASK))
+					ast_patch_ahb_2500(regs);
 			}
 
 			/* Double check that it's actually working */
-			data = ast_read32(ast, 0xf004);
+			data = __ast_read32(regs, 0xf004);
 			if ((data != 0xffffffff) && (data != 0x00)) {
-				ast->config_mode = ast_use_p2a;
+				config_mode = ast_use_p2a;
 
 				/* Read SCU7c (silicon revision register) */
-				ast_write32(ast, 0xf004, 0x1e6e0000);
-				ast_write32(ast, 0xf000, 0x1);
-				scu_rev = ast_read32(ast, 0x1207c);
+				__ast_write32(regs, 0xf004, 0x1e6e0000);
+				__ast_write32(regs, 0xf000, 0x1);
+				scu_rev = __ast_read32(regs, 0x1207c);
 			}
 		}
 	}
 
-	switch (ast->config_mode) {
+	switch (config_mode) {
 	case ast_use_defaults:
-		drm_info(dev, "Using default configuration\n");
+		dev_info(dev, "Using default configuration\n");
 		break;
 	case ast_use_dt:
-		drm_info(dev, "Using device-tree for configuration\n");
+		dev_info(dev, "Using device-tree for configuration\n");
 		break;
 	case ast_use_p2a:
-		drm_info(dev, "Using P2A bridge for configuration\n");
+		dev_info(dev, "Using P2A bridge for configuration\n");
 		break;
 	}
 
@@ -146,63 +148,68 @@ static int ast_device_config_init(struct ast_device *ast)
 	 */
 
 	if (pdev->revision >= 0x50) {
-		ast->chip = AST2600;
-		drm_info(dev, "AST 2600 detected\n");
+		chip = AST2600;
+		dev_info(dev, "AST 2600 detected\n");
 	} else if (pdev->revision >= 0x40) {
 		switch (scu_rev & 0x300) {
 		case 0x0100:
-			ast->chip = AST2510;
-			drm_info(dev, "AST 2510 detected\n");
+			chip = AST2510;
+			dev_info(dev, "AST 2510 detected\n");
 			break;
 		default:
-			ast->chip = AST2500;
-			drm_info(dev, "AST 2500 detected\n");
+			chip = AST2500;
+			dev_info(dev, "AST 2500 detected\n");
+			break;
 		}
 	} else if (pdev->revision >= 0x30) {
 		switch (scu_rev & 0x300) {
 		case 0x0100:
-			ast->chip = AST1400;
-			drm_info(dev, "AST 1400 detected\n");
+			chip = AST1400;
+			dev_info(dev, "AST 1400 detected\n");
 			break;
 		default:
-			ast->chip = AST2400;
-			drm_info(dev, "AST 2400 detected\n");
+			chip = AST2400;
+			dev_info(dev, "AST 2400 detected\n");
+			break;
 		}
 	} else if (pdev->revision >= 0x20) {
 		switch (scu_rev & 0x300) {
 		case 0x0000:
-			ast->chip = AST1300;
-			drm_info(dev, "AST 1300 detected\n");
+			chip = AST1300;
+			dev_info(dev, "AST 1300 detected\n");
 			break;
 		default:
-			ast->chip = AST2300;
-			drm_info(dev, "AST 2300 detected\n");
+			chip = AST2300;
+			dev_info(dev, "AST 2300 detected\n");
 			break;
 		}
 	} else if (pdev->revision >= 0x10) {
 		switch (scu_rev & 0x0300) {
 		case 0x0200:
-			ast->chip = AST1100;
-			drm_info(dev, "AST 1100 detected\n");
+			chip = AST1100;
+			dev_info(dev, "AST 1100 detected\n");
 			break;
 		case 0x0100:
-			ast->chip = AST2200;
-			drm_info(dev, "AST 2200 detected\n");
+			chip = AST2200;
+			dev_info(dev, "AST 2200 detected\n");
 			break;
 		case 0x0000:
-			ast->chip = AST2150;
-			drm_info(dev, "AST 2150 detected\n");
+			chip = AST2150;
+			dev_info(dev, "AST 2150 detected\n");
 			break;
 		default:
-			ast->chip = AST2100;
-			drm_info(dev, "AST 2100 detected\n");
+			chip = AST2100;
+			dev_info(dev, "AST 2100 detected\n");
 			break;
 		}
 	} else {
-		ast->chip = AST2000;
-		drm_info(dev, "AST 2000 detected\n");
+		chip = AST2000;
+		dev_info(dev, "AST 2000 detected\n");
 	}
 
+	*chip_out = chip;
+	*config_mode_out = config_mode;
+
 	return 0;
 }
 
@@ -431,6 +438,8 @@ struct ast_device *ast_device_create(const struct drm_driver *drv,
 	int ret = 0;
 	void __iomem *regs;
 	void __iomem *ioregs;
+	enum ast_config_mode config_mode;
+	enum ast_chip chip;
 
 	ast = devm_drm_dev_alloc(&pdev->dev, drv, struct ast_device, base);
 	if (IS_ERR(ast))
@@ -502,10 +511,13 @@ struct ast_device *ast_device_create(const struct drm_driver *drv,
 	if (ret)
 		return ERR_PTR(ret);
 
-	ret = ast_device_config_init(ast);
+	ret = ast_detect_chip(pdev, regs, ioregs, &chip, &config_mode);
 	if (ret)
 		return ERR_PTR(ret);
 
+	ast->chip = chip;
+	ast->config_mode = config_mode;
+
 	ast_detect_widescreen(ast);
 	ast_detect_tx_chip(ast, need_post);
 
-- 
2.42.0

