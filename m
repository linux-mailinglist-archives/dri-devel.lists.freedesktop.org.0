Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F067EDE21
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 11:03:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6360410E2E2;
	Thu, 16 Nov 2023 10:03:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BD1F10E2C6
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 10:02:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A077520506;
 Thu, 16 Nov 2023 10:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1700128963; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AUqDHcdjZnixCD4ITNgiqlYnWVfdiHIFnixjZW3iR6A=;
 b=oB1+KZ6FJiAGcJgTHP7qQDxWuB9NaDglFAgQt9YHAmcAer5lXBPSdRQJPS6vSNebdU4ajV
 aUb5bgDLhYwF+C/aktif+YtD8bR5hM0oF402RyVDzQH//88MVXvVtQx93WkzasSoXR2zNG
 Ld1QVjwBHn/8TahsamAo515Rk2C3SFc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1700128963;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AUqDHcdjZnixCD4ITNgiqlYnWVfdiHIFnixjZW3iR6A=;
 b=PePQFr91GnnOLUxUs/q09wZ/m04lhiHcPV9MtJjp7WPSuPOsOLSNnw3P6R+8yE3x4LJwNy
 UmF4lfpcT+LS3iDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6F9011377E;
 Thu, 16 Nov 2023 10:02:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GElmGsPoVWXSGgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 16 Nov 2023 10:02:43 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, daniel@ffwll.ch, airlied@gmail.com
Subject: [PATCH v2 10/10] drm/ast: Move detection code into PCI probe helper
Date: Thu, 16 Nov 2023 10:59:29 +0100
Message-ID: <20231116100240.22975-11-tzimmermann@suse.de>
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
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-3.00)[100.00%]
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

Detect device type and config mode in the PCI probe helper, but leave
DRM device initialization where it is. Structures the driver probe and
setup code into a detection and an initialization phase.

A later patch can add branching to the device-initialization code. Each
chip type can have it own initializer function, if necessary.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_drv.c  | 263 +++++++++++++++++++++++++++++++-
 drivers/gpu/drm/ast/ast_drv.h  |  10 +-
 drivers/gpu/drm/ast/ast_main.c | 270 ++-------------------------------
 3 files changed, 274 insertions(+), 269 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index cf5b754f044c7..90bcb1eb9cd94 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -89,11 +89,194 @@ static const struct pci_device_id ast_pciidlist[] = {
 
 MODULE_DEVICE_TABLE(pci, ast_pciidlist);
 
+static bool ast_is_vga_enabled(void __iomem *ioregs)
+{
+	u8 vgaer = __ast_read8(ioregs, AST_IO_VGAER);
+
+	return vgaer & AST_IO_VGAER_VGA_ENABLE;
+}
+
+static void ast_enable_vga(void __iomem *ioregs)
+{
+	__ast_write8(ioregs, AST_IO_VGAER, AST_IO_VGAER_VGA_ENABLE);
+	__ast_write8(ioregs, AST_IO_VGAMR_W, AST_IO_VGAMR_IOSEL);
+}
+
+/*
+ * Run this function as part of the HW device cleanup; not
+ * when the DRM device gets released.
+ */
+static void ast_enable_mmio_release(void *data)
+{
+	void __iomem *ioregs = (void __force __iomem *)data;
+
+	/* enable standard VGA decode */
+	__ast_write8_i(ioregs, AST_IO_VGACRI, 0xa1, AST_IO_VGACRA1_MMIO_ENABLED);
+}
+
+static int ast_enable_mmio(struct device *dev, void __iomem *ioregs)
+{
+	void *data = (void __force *)ioregs;
+
+	__ast_write8_i(ioregs, AST_IO_VGACRI, 0xa1,
+		       AST_IO_VGACRA1_MMIO_ENABLED |
+		       AST_IO_VGACRA1_VGAIO_DISABLED);
+
+	return devm_add_action_or_reset(dev, ast_enable_mmio_release, data);
+}
+
+static void ast_open_key(void __iomem *ioregs)
+{
+	__ast_write8_i(ioregs, AST_IO_VGACRI, 0x80, AST_IO_VGACR80_PASSWORD);
+}
+
+static int ast_detect_chip(struct pci_dev *pdev,
+			   void __iomem *regs, void __iomem *ioregs,
+			   enum ast_chip *chip_out,
+			   enum ast_config_mode *config_mode_out)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	enum ast_config_mode config_mode = ast_use_defaults;
+	uint32_t scu_rev = 0xffffffff;
+	enum ast_chip chip;
+	u32 data;
+	u8 vgacrd0, vgacrd1;
+
+	/*
+	 * Find configuration mode and read SCU revision
+	 */
+
+	/* Check if we have device-tree properties */
+	if (np && !of_property_read_u32(np, "aspeed,scu-revision-id", &data)) {
+		/* We do, disable P2A access */
+		config_mode = ast_use_dt;
+		scu_rev = data;
+	} else if (pdev->device == PCI_CHIP_AST2000) { // Not all families have a P2A bridge
+		/*
+		 * The BMC will set SCU 0x40 D[12] to 1 if the P2 bridge
+		 * is disabled. We force using P2A if VGA only mode bit
+		 * is set D[7]
+		 */
+		vgacrd0 = __ast_read8_i(ioregs, AST_IO_VGACRI, 0xd0);
+		vgacrd1 = __ast_read8_i(ioregs, AST_IO_VGACRI, 0xd1);
+		if (!(vgacrd0 & 0x80) || !(vgacrd1 & 0x10)) {
+
+			/*
+			 * We have a P2A bridge and it is enabled.
+			 */
+
+			/* Patch AST2500/AST2510 */
+			if ((pdev->revision & 0xf0) == 0x40) {
+				if (!(vgacrd0 & AST_VRAM_INIT_STATUS_MASK))
+					ast_patch_ahb_2500(regs);
+			}
+
+			/* Double check that it's actually working */
+			data = __ast_read32(regs, 0xf004);
+			if ((data != 0xffffffff) && (data != 0x00)) {
+				config_mode = ast_use_p2a;
+
+				/* Read SCU7c (silicon revision register) */
+				__ast_write32(regs, 0xf004, 0x1e6e0000);
+				__ast_write32(regs, 0xf000, 0x1);
+				scu_rev = __ast_read32(regs, 0x1207c);
+			}
+		}
+	}
+
+	switch (config_mode) {
+	case ast_use_defaults:
+		dev_info(dev, "Using default configuration\n");
+		break;
+	case ast_use_dt:
+		dev_info(dev, "Using device-tree for configuration\n");
+		break;
+	case ast_use_p2a:
+		dev_info(dev, "Using P2A bridge for configuration\n");
+		break;
+	}
+
+	/*
+	 * Identify chipset
+	 */
+
+	if (pdev->revision >= 0x50) {
+		chip = AST2600;
+		dev_info(dev, "AST 2600 detected\n");
+	} else if (pdev->revision >= 0x40) {
+		switch (scu_rev & 0x300) {
+		case 0x0100:
+			chip = AST2510;
+			dev_info(dev, "AST 2510 detected\n");
+			break;
+		default:
+			chip = AST2500;
+			dev_info(dev, "AST 2500 detected\n");
+			break;
+		}
+	} else if (pdev->revision >= 0x30) {
+		switch (scu_rev & 0x300) {
+		case 0x0100:
+			chip = AST1400;
+			dev_info(dev, "AST 1400 detected\n");
+			break;
+		default:
+			chip = AST2400;
+			dev_info(dev, "AST 2400 detected\n");
+			break;
+		}
+	} else if (pdev->revision >= 0x20) {
+		switch (scu_rev & 0x300) {
+		case 0x0000:
+			chip = AST1300;
+			dev_info(dev, "AST 1300 detected\n");
+			break;
+		default:
+			chip = AST2300;
+			dev_info(dev, "AST 2300 detected\n");
+			break;
+		}
+	} else if (pdev->revision >= 0x10) {
+		switch (scu_rev & 0x0300) {
+		case 0x0200:
+			chip = AST1100;
+			dev_info(dev, "AST 1100 detected\n");
+			break;
+		case 0x0100:
+			chip = AST2200;
+			dev_info(dev, "AST 2200 detected\n");
+			break;
+		case 0x0000:
+			chip = AST2150;
+			dev_info(dev, "AST 2150 detected\n");
+			break;
+		default:
+			chip = AST2100;
+			dev_info(dev, "AST 2100 detected\n");
+			break;
+		}
+	} else {
+		chip = AST2000;
+		dev_info(dev, "AST 2000 detected\n");
+	}
+
+	*chip_out = chip;
+	*config_mode_out = config_mode;
+
+	return 0;
+}
+
 static int ast_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
-	struct ast_device *ast;
-	struct drm_device *dev;
+	struct device *dev = &pdev->dev;
 	int ret;
+	void __iomem *regs;
+	void __iomem *ioregs;
+	enum ast_config_mode config_mode;
+	enum ast_chip chip;
+	struct drm_device *drm;
+	bool need_post = false;
 
 	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &ast_driver);
 	if (ret)
@@ -103,16 +286,80 @@ static int ast_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (ret)
 		return ret;
 
-	ast = ast_device_create(&ast_driver, pdev, ent->driver_data);
-	if (IS_ERR(ast))
-		return PTR_ERR(ast);
-	dev = &ast->base;
+	regs = pcim_iomap(pdev, 1, 0);
+	if (!regs)
+		return -EIO;
+
+	if (pdev->revision >= 0x40) {
+		/*
+		 * On AST2500 and later models, MMIO is enabled by
+		 * default. Adopt it to be compatible with ARM.
+		 */
+		resource_size_t len = pci_resource_len(pdev, 1);
+
+		if (len < AST_IO_MM_OFFSET)
+			return -EIO;
+		if ((len - AST_IO_MM_OFFSET) < AST_IO_MM_LENGTH)
+			return -EIO;
+		ioregs = regs + AST_IO_MM_OFFSET;
+	} else if (pci_resource_flags(pdev, 2) & IORESOURCE_IO) {
+		/*
+		 * Map I/O registers if we have a PCI BAR for I/O.
+		 */
+		resource_size_t len = pci_resource_len(pdev, 2);
+
+		if (len < AST_IO_MM_LENGTH)
+			return -EIO;
+		ioregs = pcim_iomap(pdev, 2, 0);
+		if (!ioregs)
+			return -EIO;
+	} else {
+		/*
+		 * Anything else is best effort.
+		 */
+		resource_size_t len = pci_resource_len(pdev, 1);
+
+		if (len < AST_IO_MM_OFFSET)
+			return -EIO;
+		if ((len - AST_IO_MM_OFFSET) < AST_IO_MM_LENGTH)
+			return -EIO;
+		ioregs = regs + AST_IO_MM_OFFSET;
+
+		dev_info(dev, "Platform has no I/O space, using MMIO\n");
+	}
+
+	if (!ast_is_vga_enabled(ioregs)) {
+		dev_info(dev, "VGA not enabled on entry, requesting chip POST\n");
+		need_post = true;
+	}
+
+	/*
+	 * If VGA isn't enabled, we need to enable now or subsequent
+	 * access to the scratch registers will fail.
+	 */
+	if (need_post)
+		ast_enable_vga(ioregs);
+	/* Enable extended register access */
+	ast_open_key(ioregs);
+
+	ret = ast_enable_mmio(dev, ioregs);
+	if (ret)
+		return ret;
+
+	ret = ast_detect_chip(pdev, regs, ioregs, &chip, &config_mode);
+	if (ret)
+		return ret;
+
+	drm = ast_device_create(pdev, &ast_driver, chip, config_mode, regs, ioregs, need_post);
+	if (IS_ERR(drm))
+		return PTR_ERR(drm);
+	pci_set_drvdata(pdev, drm);
 
-	ret = drm_dev_register(dev, ent->driver_data);
+	ret = drm_dev_register(drm, ent->driver_data);
 	if (ret)
 		return ret;
 
-	drm_fbdev_generic_setup(dev, 32);
+	drm_fbdev_generic_setup(drm, 32);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index b0c899f2ecfd7..c70de7b224c5a 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -243,9 +243,13 @@ static inline struct ast_device *to_ast_device(struct drm_device *dev)
 	return container_of(dev, struct ast_device, base);
 }
 
-struct ast_device *ast_device_create(const struct drm_driver *drv,
-				     struct pci_dev *pdev,
-				     unsigned long flags);
+struct drm_device *ast_device_create(struct pci_dev *pdev,
+				     const struct drm_driver *drv,
+				     enum ast_chip chip,
+				     enum ast_config_mode config_mode,
+				     void __iomem *regs,
+				     void __iomem *ioregs,
+				     bool need_post);
 
 static inline unsigned long __ast_gen(struct ast_device *ast)
 {
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index ad5b758153de1..2f3ad5f949fcb 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -35,184 +35,6 @@
 
 #include "ast_drv.h"
 
-static bool ast_is_vga_enabled(void __iomem *ioregs)
-{
-	u8 vgaer = __ast_read8(ioregs, AST_IO_VGAER);
-
-	return vgaer & AST_IO_VGAER_VGA_ENABLE;
-}
-
-static void ast_enable_vga(void __iomem *ioregs)
-{
-	__ast_write8(ioregs, AST_IO_VGAER, AST_IO_VGAER_VGA_ENABLE);
-	__ast_write8(ioregs, AST_IO_VGAMR_W, AST_IO_VGAMR_IOSEL);
-}
-
-/*
- * Run this function as part of the HW device cleanup; not
- * when the DRM device gets released.
- */
-static void ast_enable_mmio_release(void *data)
-{
-	void __iomem *ioregs = (void __force __iomem *)data;
-
-	/* enable standard VGA decode */
-	__ast_write8_i(ioregs, AST_IO_VGACRI, 0xa1, AST_IO_VGACRA1_MMIO_ENABLED);
-}
-
-static int ast_enable_mmio(struct device *dev, void __iomem *ioregs)
-{
-	void *data = (void __force *)ioregs;
-
-	__ast_write8_i(ioregs, AST_IO_VGACRI, 0xa1,
-		       AST_IO_VGACRA1_MMIO_ENABLED |
-		       AST_IO_VGACRA1_VGAIO_DISABLED);
-
-	return devm_add_action_or_reset(dev, ast_enable_mmio_release, data);
-}
-
-static void ast_open_key(void __iomem *ioregs)
-{
-	__ast_write8_i(ioregs, AST_IO_VGACRI, 0x80, AST_IO_VGACR80_PASSWORD);
-}
-
-static int ast_detect_chip(struct pci_dev *pdev,
-			   void __iomem *regs, void __iomem *ioregs,
-			   enum ast_chip *chip_out,
-			   enum ast_config_mode *config_mode_out)
-{
-	struct device *dev = &pdev->dev;
-	struct device_node *np = dev->of_node;
-	enum ast_config_mode config_mode = ast_use_defaults;
-	uint32_t scu_rev = 0xffffffff;
-	enum ast_chip chip;
-	u32 data;
-	u8 vgacrd0, vgacrd1;
-
-	/*
-	 * Find configuration mode and read SCU revision
-	 */
-
-	/* Check if we have device-tree properties */
-	if (np && !of_property_read_u32(np, "aspeed,scu-revision-id", &data)) {
-		/* We do, disable P2A access */
-		config_mode = ast_use_dt;
-		scu_rev = data;
-	} else if (pdev->device == PCI_CHIP_AST2000) { // Not all families have a P2A bridge
-		/*
-		 * The BMC will set SCU 0x40 D[12] to 1 if the P2 bridge
-		 * is disabled. We force using P2A if VGA only mode bit
-		 * is set D[7]
-		 */
-		vgacrd0 = __ast_read8_i(ioregs, AST_IO_VGACRI, 0xd0);
-		vgacrd1 = __ast_read8_i(ioregs, AST_IO_VGACRI, 0xd1);
-		if (!(vgacrd0 & 0x80) || !(vgacrd1 & 0x10)) {
-
-			/*
-			 * We have a P2A bridge and it is enabled.
-			 */
-
-			/* Patch AST2500/AST2510 */
-			if ((pdev->revision & 0xf0) == 0x40) {
-				if (!(vgacrd0 & AST_VRAM_INIT_STATUS_MASK))
-					ast_patch_ahb_2500(regs);
-			}
-
-			/* Double check that it's actually working */
-			data = __ast_read32(regs, 0xf004);
-			if ((data != 0xffffffff) && (data != 0x00)) {
-				config_mode = ast_use_p2a;
-
-				/* Read SCU7c (silicon revision register) */
-				__ast_write32(regs, 0xf004, 0x1e6e0000);
-				__ast_write32(regs, 0xf000, 0x1);
-				scu_rev = __ast_read32(regs, 0x1207c);
-			}
-		}
-	}
-
-	switch (config_mode) {
-	case ast_use_defaults:
-		dev_info(dev, "Using default configuration\n");
-		break;
-	case ast_use_dt:
-		dev_info(dev, "Using device-tree for configuration\n");
-		break;
-	case ast_use_p2a:
-		dev_info(dev, "Using P2A bridge for configuration\n");
-		break;
-	}
-
-	/*
-	 * Identify chipset
-	 */
-
-	if (pdev->revision >= 0x50) {
-		chip = AST2600;
-		dev_info(dev, "AST 2600 detected\n");
-	} else if (pdev->revision >= 0x40) {
-		switch (scu_rev & 0x300) {
-		case 0x0100:
-			chip = AST2510;
-			dev_info(dev, "AST 2510 detected\n");
-			break;
-		default:
-			chip = AST2500;
-			dev_info(dev, "AST 2500 detected\n");
-			break;
-		}
-	} else if (pdev->revision >= 0x30) {
-		switch (scu_rev & 0x300) {
-		case 0x0100:
-			chip = AST1400;
-			dev_info(dev, "AST 1400 detected\n");
-			break;
-		default:
-			chip = AST2400;
-			dev_info(dev, "AST 2400 detected\n");
-			break;
-		}
-	} else if (pdev->revision >= 0x20) {
-		switch (scu_rev & 0x300) {
-		case 0x0000:
-			chip = AST1300;
-			dev_info(dev, "AST 1300 detected\n");
-			break;
-		default:
-			chip = AST2300;
-			dev_info(dev, "AST 2300 detected\n");
-			break;
-		}
-	} else if (pdev->revision >= 0x10) {
-		switch (scu_rev & 0x0300) {
-		case 0x0200:
-			chip = AST1100;
-			dev_info(dev, "AST 1100 detected\n");
-			break;
-		case 0x0100:
-			chip = AST2200;
-			dev_info(dev, "AST 2200 detected\n");
-			break;
-		case 0x0000:
-			chip = AST2150;
-			dev_info(dev, "AST 2150 detected\n");
-			break;
-		default:
-			chip = AST2100;
-			dev_info(dev, "AST 2100 detected\n");
-			break;
-		}
-	} else {
-		chip = AST2000;
-		dev_info(dev, "AST 2000 detected\n");
-	}
-
-	*chip_out = chip;
-	*config_mode_out = config_mode;
-
-	return 0;
-}
-
 static void ast_detect_widescreen(struct ast_device *ast)
 {
 	u8 jreg;
@@ -428,95 +250,27 @@ static int ast_get_dram_info(struct drm_device *dev)
 	return 0;
 }
 
-struct ast_device *ast_device_create(const struct drm_driver *drv,
-				     struct pci_dev *pdev,
-				     unsigned long flags)
+struct drm_device *ast_device_create(struct pci_dev *pdev,
+				     const struct drm_driver *drv,
+				     enum ast_chip chip,
+				     enum ast_config_mode config_mode,
+				     void __iomem *regs,
+				     void __iomem *ioregs,
+				     bool need_post)
 {
 	struct drm_device *dev;
 	struct ast_device *ast;
-	bool need_post = false;
-	int ret = 0;
-	void __iomem *regs;
-	void __iomem *ioregs;
-	enum ast_config_mode config_mode;
-	enum ast_chip chip;
+	int ret;
 
 	ast = devm_drm_dev_alloc(&pdev->dev, drv, struct ast_device, base);
 	if (IS_ERR(ast))
-		return ast;
+		return ERR_CAST(ast);
 	dev = &ast->base;
 
-	pci_set_drvdata(pdev, dev);
-
-	regs = pcim_iomap(pdev, 1, 0);
-	if (!regs)
-		return ERR_PTR(-EIO);
-
-	if (pdev->revision >= 0x40) {
-		/*
-		 * On AST2500 and later models, MMIO is enabled by
-		 * default. Adopt it to be compatible with ARM.
-		 */
-		resource_size_t len = pci_resource_len(pdev, 1);
-
-		if (len < AST_IO_MM_OFFSET)
-			return ERR_PTR(-EIO);
-		if ((len - AST_IO_MM_OFFSET) < AST_IO_MM_LENGTH)
-			return ERR_PTR(-EIO);
-		ioregs = regs + AST_IO_MM_OFFSET;
-	} else if (pci_resource_flags(pdev, 2) & IORESOURCE_IO) {
-		/*
-		 * Map I/O registers if we have a PCI BAR for I/O.
-		 */
-		resource_size_t len = pci_resource_len(pdev, 2);
-
-		if (len < AST_IO_MM_LENGTH)
-			return -EIO;
-		ioregs = pcim_iomap(pdev, 2, 0);
-		if (!ioregs)
-			return ERR_PTR(-EIO);
-	} else {
-		/*
-		 * Anything else is best effort.
-		 */
-		resource_size_t len = pci_resource_len(pdev, 1);
-
-		if (len < AST_IO_MM_OFFSET)
-			return ERR_PTR(-EIO);
-		if ((len - AST_IO_MM_OFFSET) < AST_IO_MM_LENGTH)
-			return ERR_PTR(-EIO);
-		ioregs = regs + AST_IO_MM_OFFSET;
-
-		drm_info(dev, "Platform has no I/O space, using MMIO\n");
-	}
-
-	ast->regs = regs;
-	ast->ioregs = ioregs;
-
-	if (!ast_is_vga_enabled(ioregs)) {
-		drm_info(dev, "VGA not enabled on entry, requesting chip POST\n");
-		need_post = true;
-	}
-
-	/*
-	 * If VGA isn't enabled, we need to enable now or subsequent
-	 * access to the scratch registers will fail.
-	 */
-	if (need_post)
-		ast_enable_vga(ioregs);
-	/* Enable extended register access */
-	ast_open_key(ioregs);
-
-	ret = ast_enable_mmio(&pdev->dev, ioregs);
-	if (ret)
-		return ERR_PTR(ret);
-
-	ret = ast_detect_chip(pdev, regs, ioregs, &chip, &config_mode);
-	if (ret)
-		return ERR_PTR(ret);
-
 	ast->chip = chip;
 	ast->config_mode = config_mode;
+	ast->regs = regs;
+	ast->ioregs = ioregs;
 
 	ast_detect_widescreen(ast);
 	ast_detect_tx_chip(ast, need_post);
@@ -547,5 +301,5 @@ struct ast_device *ast_device_create(const struct drm_driver *drv,
 	if (ret)
 		return ERR_PTR(ret);
 
-	return ast;
+	return dev;
 }
-- 
2.42.0

