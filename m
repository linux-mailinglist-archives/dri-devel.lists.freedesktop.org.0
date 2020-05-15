Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD7F1D4844
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 10:33:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE0A6EC1F;
	Fri, 15 May 2020 08:32:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA606E3AC
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 08:32:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 14389AFFD;
 Fri, 15 May 2020 08:32:42 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com, noralf@tronnes.org,
 sam@ravnborg.org, emil.velikov@collabora.com, john.p.donnelly@oracle.com
Subject: [PATCH v3 11/15] drm/mgag200: Move register initialization into
 separate function
Date: Fri, 15 May 2020 10:32:29 +0200
Message-Id: <20200515083233.32036-12-tzimmermann@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200515083233.32036-1-tzimmermann@suse.de>
References: <20200515083233.32036-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: John Donnelly <John.p.donnelly@oracle.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Registers are initialized with constants. This is now done in
mgag200_init_regs(), mgag200_set_dac_regs() and mgag200_set_pci_regs().
Later patches should move these calls from mode setting to device
initialization.

v2:
	* replace uint8_t with u8

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: John Donnelly <John.p.donnelly@oracle.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 261 ++++++++++++++-----------
 1 file changed, 147 insertions(+), 114 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 46122fa319889..199ae08976e16 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -919,6 +919,152 @@ static int mga_crtc_mode_set_base(struct drm_crtc *crtc, int x, int y,
 	return mga_crtc_do_set_base(mdev, fb, old_fb);
 }
 
+static void mgag200_set_pci_regs(struct mga_device *mdev)
+{
+	uint32_t option = 0, option2 = 0;
+	struct drm_device *dev = mdev->dev;
+
+	switch (mdev->type) {
+	case G200_SE_A:
+	case G200_SE_B:
+		if (mdev->has_sdram)
+			option = 0x40049120;
+		else
+			option = 0x4004d120;
+		option2 = 0x00008000;
+		break;
+	case G200_WB:
+	case G200_EW3:
+		option = 0x41049120;
+		option2 = 0x0000b000;
+		break;
+	case G200_EV:
+		option = 0x00000120;
+		option2 = 0x0000b000;
+		break;
+	case G200_EH:
+	case G200_EH3:
+		option = 0x00000120;
+		option2 = 0x0000b000;
+		break;
+	case G200_ER:
+		break;
+	}
+
+	if (option)
+		pci_write_config_dword(dev->pdev, PCI_MGA_OPTION, option);
+
+	if (option2)
+		pci_write_config_dword(dev->pdev, PCI_MGA_OPTION2, option2);
+}
+
+static void mgag200_set_dac_regs(struct mga_device *mdev)
+{
+	size_t i;
+	u8 dacvalue[] = {
+		/* 0x00: */        0,    0,    0,    0,    0,    0, 0x00,    0,
+		/* 0x08: */        0,    0,    0,    0,    0,    0,    0,    0,
+		/* 0x10: */        0,    0,    0,    0,    0,    0,    0,    0,
+		/* 0x18: */     0x00,    0, 0xC9, 0xFF, 0xBF, 0x20, 0x1F, 0x20,
+		/* 0x20: */     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+		/* 0x28: */     0x00, 0x00, 0x00, 0x00,    0,    0,    0, 0x40,
+		/* 0x30: */     0x00, 0xB0, 0x00, 0xC2, 0x34, 0x14, 0x02, 0x83,
+		/* 0x38: */     0x00, 0x93, 0x00, 0x77, 0x00, 0x00, 0x00, 0x3A,
+		/* 0x40: */        0,    0,    0,    0,    0,    0,    0,    0,
+		/* 0x48: */        0,    0,    0,    0,    0,    0,    0,    0
+	};
+
+	switch (mdev->type) {
+	case G200_SE_A:
+	case G200_SE_B:
+		dacvalue[MGA1064_VREF_CTL] = 0x03;
+		dacvalue[MGA1064_PIX_CLK_CTL] = MGA1064_PIX_CLK_CTL_SEL_PLL;
+		dacvalue[MGA1064_MISC_CTL] = MGA1064_MISC_CTL_DAC_EN |
+					     MGA1064_MISC_CTL_VGA8 |
+					     MGA1064_MISC_CTL_DAC_RAM_CS;
+		break;
+	case G200_WB:
+	case G200_EW3:
+		dacvalue[MGA1064_VREF_CTL] = 0x07;
+		break;
+	case G200_EV:
+		dacvalue[MGA1064_PIX_CLK_CTL] = MGA1064_PIX_CLK_CTL_SEL_PLL;
+		dacvalue[MGA1064_MISC_CTL] = MGA1064_MISC_CTL_VGA8 |
+					     MGA1064_MISC_CTL_DAC_RAM_CS;
+		break;
+	case G200_EH:
+	case G200_EH3:
+		dacvalue[MGA1064_MISC_CTL] = MGA1064_MISC_CTL_VGA8 |
+					     MGA1064_MISC_CTL_DAC_RAM_CS;
+		break;
+	case G200_ER:
+		break;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(dacvalue); i++) {
+		if ((i <= 0x17) ||
+		    (i == 0x1b) ||
+		    (i == 0x1c) ||
+		    ((i >= 0x1f) && (i <= 0x29)) ||
+		    ((i >= 0x30) && (i <= 0x37)))
+			continue;
+		if (IS_G200_SE(mdev) &&
+		    ((i == 0x2c) || (i == 0x2d) || (i == 0x2e)))
+			continue;
+		if ((mdev->type == G200_EV ||
+		    mdev->type == G200_WB ||
+		    mdev->type == G200_EH ||
+		    mdev->type == G200_EW3 ||
+		    mdev->type == G200_EH3) &&
+		    (i >= 0x44) && (i <= 0x4e))
+			continue;
+
+		WREG_DAC(i, dacvalue[i]);
+	}
+
+	if (mdev->type == G200_ER)
+		WREG_DAC(0x90, 0);
+}
+
+static void mgag200_init_regs(struct mga_device *mdev)
+{
+	u8 crtcext3, crtcext4, misc;
+
+	mgag200_set_pci_regs(mdev);
+	mgag200_set_dac_regs(mdev);
+
+	WREG_SEQ(2, 0x0f);
+	WREG_SEQ(3, 0x00);
+	WREG_SEQ(4, 0x0e);
+
+	WREG_CRT(10, 0);
+	WREG_CRT(11, 0);
+	WREG_CRT(12, 0);
+	WREG_CRT(13, 0);
+	WREG_CRT(14, 0);
+	WREG_CRT(15, 0);
+
+	RREG_ECRT(0x03, crtcext3);
+
+	crtcext3 |= BIT(7); /* enable MGA mode */
+	crtcext4 = 0x00;
+
+	WREG_ECRT(0x03, crtcext3);
+	WREG_ECRT(0x04, crtcext4);
+
+	if (mdev->type == G200_ER)
+		WREG_ECRT(0x24, 0x5);
+
+	if (mdev->type == G200_EW3)
+		WREG_ECRT(0x34, 0x5);
+
+	misc = RREG8(MGA_MISC_IN);
+	misc |= MGAREG_MISC_IOADSEL |
+		MGAREG_MISC_RAMMAPEN |
+		MGAREG_MISC_HIGH_PG_SEL;
+	WREG8(MGA_MISC_OUT, misc);
+}
+
 static void mgag200_set_mode_regs(struct mga_device *mdev,
 				  const struct drm_display_mode *mode)
 {
@@ -1191,121 +1337,8 @@ static int mga_crtc_mode_set(struct drm_crtc *crtc,
 	struct drm_device *dev = crtc->dev;
 	struct mga_device *mdev = to_mga_device(dev);
 	const struct drm_framebuffer *fb = crtc->primary->fb;
-	int option = 0, option2 = 0;
-	int i;
-	unsigned char misc = 0;
-	u8 crtcext3, crtcext4;
-
-	static unsigned char dacvalue[] = {
-		/* 0x00: */        0,    0,    0,    0,    0,    0, 0x00,    0,
-		/* 0x08: */        0,    0,    0,    0,    0,    0,    0,    0,
-		/* 0x10: */        0,    0,    0,    0,    0,    0,    0,    0,
-		/* 0x18: */     0x00,    0, 0xC9, 0xFF, 0xBF, 0x20, 0x1F, 0x20,
-		/* 0x20: */     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-		/* 0x28: */     0x00, 0x00, 0x00, 0x00,    0,    0,    0, 0x40,
-		/* 0x30: */     0x00, 0xB0, 0x00, 0xC2, 0x34, 0x14, 0x02, 0x83,
-		/* 0x38: */     0x00, 0x93, 0x00, 0x77, 0x00, 0x00, 0x00, 0x3A,
-		/* 0x40: */        0,    0,    0,    0,    0,    0,    0,    0,
-		/* 0x48: */        0,    0,    0,    0,    0,    0,    0,    0
-	};
 
-	switch (mdev->type) {
-	case G200_SE_A:
-	case G200_SE_B:
-		dacvalue[MGA1064_VREF_CTL] = 0x03;
-		dacvalue[MGA1064_PIX_CLK_CTL] = MGA1064_PIX_CLK_CTL_SEL_PLL;
-		dacvalue[MGA1064_MISC_CTL] = MGA1064_MISC_CTL_DAC_EN |
-					     MGA1064_MISC_CTL_VGA8 |
-					     MGA1064_MISC_CTL_DAC_RAM_CS;
-		if (mdev->has_sdram)
-			option = 0x40049120;
-		else
-			option = 0x4004d120;
-		option2 = 0x00008000;
-		break;
-	case G200_WB:
-	case G200_EW3:
-		dacvalue[MGA1064_VREF_CTL] = 0x07;
-		option = 0x41049120;
-		option2 = 0x0000b000;
-		break;
-	case G200_EV:
-		dacvalue[MGA1064_PIX_CLK_CTL] = MGA1064_PIX_CLK_CTL_SEL_PLL;
-		dacvalue[MGA1064_MISC_CTL] = MGA1064_MISC_CTL_VGA8 |
-					     MGA1064_MISC_CTL_DAC_RAM_CS;
-		option = 0x00000120;
-		option2 = 0x0000b000;
-		break;
-	case G200_EH:
-	case G200_EH3:
-		dacvalue[MGA1064_MISC_CTL] = MGA1064_MISC_CTL_VGA8 |
-					     MGA1064_MISC_CTL_DAC_RAM_CS;
-		option = 0x00000120;
-		option2 = 0x0000b000;
-		break;
-	case G200_ER:
-		break;
-	}
-
-	for (i = 0; i < sizeof(dacvalue); i++) {
-		if ((i <= 0x17) ||
-		    (i == 0x1b) ||
-		    (i == 0x1c) ||
-		    ((i >= 0x1f) && (i <= 0x29)) ||
-		    ((i >= 0x30) && (i <= 0x37)))
-			continue;
-		if (IS_G200_SE(mdev) &&
-		    ((i == 0x2c) || (i == 0x2d) || (i == 0x2e)))
-			continue;
-		if ((mdev->type == G200_EV ||
-		    mdev->type == G200_WB ||
-		    mdev->type == G200_EH ||
-		    mdev->type == G200_EW3 ||
-		    mdev->type == G200_EH3) &&
-		    (i >= 0x44) && (i <= 0x4e))
-			continue;
-
-		WREG_DAC(i, dacvalue[i]);
-	}
-
-	if (mdev->type == G200_ER)
-		WREG_DAC(0x90, 0);
-
-	if (option)
-		pci_write_config_dword(dev->pdev, PCI_MGA_OPTION, option);
-	if (option2)
-		pci_write_config_dword(dev->pdev, PCI_MGA_OPTION2, option2);
-
-	WREG_SEQ(2, 0xf);
-	WREG_SEQ(3, 0);
-	WREG_SEQ(4, 0xe);
-
-	WREG_CRT(10, 0);
-	WREG_CRT(11, 0);
-	WREG_CRT(12, 0);
-	WREG_CRT(13, 0);
-	WREG_CRT(14, 0);
-	WREG_CRT(15, 0);
-
-	RREG_ECRT(0x03, crtcext3);
-
-	crtcext3 |= BIT(7); /* enable MGA mode */
-	crtcext4 = 0x00;
-
-	WREG_ECRT(0x03, crtcext3);
-	WREG_ECRT(0x04, crtcext4);
-
-	if (mdev->type == G200_ER)
-		WREG_ECRT(0x24, 0x5);
-
-	if (mdev->type == G200_EW3)
-		WREG_ECRT(0x34, 0x5);
-
-	misc = RREG8(MGA_MISC_IN);
-	misc |= MGAREG_MISC_IOADSEL |
-		MGAREG_MISC_RAMMAPEN |
-		MGAREG_MISC_HIGH_PG_SEL;
-	WREG8(MGA_MISC_OUT, misc);
+	mgag200_init_regs(mdev);
 
 	mgag200_set_format_regs(mdev, fb);
 	mga_crtc_do_set_base(mdev, fb, old_fb);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
