Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDB41D64B5
	for <lists+dri-devel@lfdr.de>; Sun, 17 May 2020 01:31:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18BA06E28B;
	Sat, 16 May 2020 23:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A91DC6E287
 for <dri-devel@lists.freedesktop.org>; Sat, 16 May 2020 21:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1589665876; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tcxd+kZrX3v8s5OuGM5zKUsvENuPYyPE3dJ2zI4er8o=;
 b=bnYWQA2t5evpKuuIrjnxR/AWDG8WtA4EoTJtbuG6VBsOejn3qaDMiUG4a2vbXLo5phfPyq
 0/ox4b7phztYfA/ztjFSb82quRklIH/Im0P1M4Qy+7jKH5TC8CKsPamRpcpPNpbK3aO/iz
 uAH+4bpiIchSvQpHUkm66tShG7CAJPI=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>
Subject: [PATCH 08/12] gpu/drm: Ingenic: Move register definitions to
 ingenic-drm.h
Date: Sat, 16 May 2020 23:50:53 +0200
Message-Id: <20200516215057.392609-8-paul@crapouillou.net>
In-Reply-To: <20200516215057.392609-1-paul@crapouillou.net>
References: <20200516215057.392609-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 16 May 2020 23:30:51 +0000
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
Cc: Paul Cercueil <paul@crapouillou.net>, devicetree@vger.kernel.org,
 od@zcrc.me, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the register definitions to ingenic-drm.h, to keep ingenic-drm.c
tidy.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm.c | 116 +----------------------
 drivers/gpu/drm/ingenic/ingenic-drm.h | 127 ++++++++++++++++++++++++++
 2 files changed, 129 insertions(+), 114 deletions(-)
 create mode 100644 drivers/gpu/drm/ingenic/ingenic-drm.h

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c b/drivers/gpu/drm/ingenic/ingenic-drm.c
index e43318938e9e..92c63d1303f9 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
@@ -4,6 +4,8 @@
 //
 // Copyright (C) 2019, Paul Cercueil <paul@crapouillou.net>
 
+#include "ingenic-drm.h"
+
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
 #include <linux/module.h>
@@ -32,120 +34,6 @@
 #include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
 
-#define JZ_REG_LCD_CFG				0x00
-#define JZ_REG_LCD_VSYNC			0x04
-#define JZ_REG_LCD_HSYNC			0x08
-#define JZ_REG_LCD_VAT				0x0C
-#define JZ_REG_LCD_DAH				0x10
-#define JZ_REG_LCD_DAV				0x14
-#define JZ_REG_LCD_PS				0x18
-#define JZ_REG_LCD_CLS				0x1C
-#define JZ_REG_LCD_SPL				0x20
-#define JZ_REG_LCD_REV				0x24
-#define JZ_REG_LCD_CTRL				0x30
-#define JZ_REG_LCD_STATE			0x34
-#define JZ_REG_LCD_IID				0x38
-#define JZ_REG_LCD_DA0				0x40
-#define JZ_REG_LCD_SA0				0x44
-#define JZ_REG_LCD_FID0				0x48
-#define JZ_REG_LCD_CMD0				0x4C
-#define JZ_REG_LCD_DA1				0x50
-#define JZ_REG_LCD_SA1				0x54
-#define JZ_REG_LCD_FID1				0x58
-#define JZ_REG_LCD_CMD1				0x5C
-
-#define JZ_LCD_CFG_SLCD				BIT(31)
-#define JZ_LCD_CFG_PS_DISABLE			BIT(23)
-#define JZ_LCD_CFG_CLS_DISABLE			BIT(22)
-#define JZ_LCD_CFG_SPL_DISABLE			BIT(21)
-#define JZ_LCD_CFG_REV_DISABLE			BIT(20)
-#define JZ_LCD_CFG_HSYNCM			BIT(19)
-#define JZ_LCD_CFG_PCLKM			BIT(18)
-#define JZ_LCD_CFG_INV				BIT(17)
-#define JZ_LCD_CFG_SYNC_DIR			BIT(16)
-#define JZ_LCD_CFG_PS_POLARITY			BIT(15)
-#define JZ_LCD_CFG_CLS_POLARITY			BIT(14)
-#define JZ_LCD_CFG_SPL_POLARITY			BIT(13)
-#define JZ_LCD_CFG_REV_POLARITY			BIT(12)
-#define JZ_LCD_CFG_HSYNC_ACTIVE_LOW		BIT(11)
-#define JZ_LCD_CFG_PCLK_FALLING_EDGE		BIT(10)
-#define JZ_LCD_CFG_DE_ACTIVE_LOW		BIT(9)
-#define JZ_LCD_CFG_VSYNC_ACTIVE_LOW		BIT(8)
-#define JZ_LCD_CFG_18_BIT			BIT(7)
-#define JZ_LCD_CFG_PDW				(BIT(5) | BIT(4))
-
-#define JZ_LCD_CFG_MODE_GENERIC_16BIT		0
-#define JZ_LCD_CFG_MODE_GENERIC_18BIT		BIT(7)
-#define JZ_LCD_CFG_MODE_GENERIC_24BIT		BIT(6)
-
-#define JZ_LCD_CFG_MODE_SPECIAL_TFT_1		1
-#define JZ_LCD_CFG_MODE_SPECIAL_TFT_2		2
-#define JZ_LCD_CFG_MODE_SPECIAL_TFT_3		3
-
-#define JZ_LCD_CFG_MODE_TV_OUT_P		4
-#define JZ_LCD_CFG_MODE_TV_OUT_I		6
-
-#define JZ_LCD_CFG_MODE_SINGLE_COLOR_STN	8
-#define JZ_LCD_CFG_MODE_SINGLE_MONOCHROME_STN	9
-#define JZ_LCD_CFG_MODE_DUAL_COLOR_STN		10
-#define JZ_LCD_CFG_MODE_DUAL_MONOCHROME_STN	11
-
-#define JZ_LCD_CFG_MODE_8BIT_SERIAL		12
-#define JZ_LCD_CFG_MODE_LCM			13
-
-#define JZ_LCD_VSYNC_VPS_OFFSET			16
-#define JZ_LCD_VSYNC_VPE_OFFSET			0
-
-#define JZ_LCD_HSYNC_HPS_OFFSET			16
-#define JZ_LCD_HSYNC_HPE_OFFSET			0
-
-#define JZ_LCD_VAT_HT_OFFSET			16
-#define JZ_LCD_VAT_VT_OFFSET			0
-
-#define JZ_LCD_DAH_HDS_OFFSET			16
-#define JZ_LCD_DAH_HDE_OFFSET			0
-
-#define JZ_LCD_DAV_VDS_OFFSET			16
-#define JZ_LCD_DAV_VDE_OFFSET			0
-
-#define JZ_LCD_CTRL_BURST_4			(0x0 << 28)
-#define JZ_LCD_CTRL_BURST_8			(0x1 << 28)
-#define JZ_LCD_CTRL_BURST_16			(0x2 << 28)
-#define JZ_LCD_CTRL_RGB555			BIT(27)
-#define JZ_LCD_CTRL_OFUP			BIT(26)
-#define JZ_LCD_CTRL_FRC_GRAYSCALE_16		(0x0 << 24)
-#define JZ_LCD_CTRL_FRC_GRAYSCALE_4		(0x1 << 24)
-#define JZ_LCD_CTRL_FRC_GRAYSCALE_2		(0x2 << 24)
-#define JZ_LCD_CTRL_PDD_MASK			(0xff << 16)
-#define JZ_LCD_CTRL_EOF_IRQ			BIT(13)
-#define JZ_LCD_CTRL_SOF_IRQ			BIT(12)
-#define JZ_LCD_CTRL_OFU_IRQ			BIT(11)
-#define JZ_LCD_CTRL_IFU0_IRQ			BIT(10)
-#define JZ_LCD_CTRL_IFU1_IRQ			BIT(9)
-#define JZ_LCD_CTRL_DD_IRQ			BIT(8)
-#define JZ_LCD_CTRL_QDD_IRQ			BIT(7)
-#define JZ_LCD_CTRL_REVERSE_ENDIAN		BIT(6)
-#define JZ_LCD_CTRL_LSB_FISRT			BIT(5)
-#define JZ_LCD_CTRL_DISABLE			BIT(4)
-#define JZ_LCD_CTRL_ENABLE			BIT(3)
-#define JZ_LCD_CTRL_BPP_1			0x0
-#define JZ_LCD_CTRL_BPP_2			0x1
-#define JZ_LCD_CTRL_BPP_4			0x2
-#define JZ_LCD_CTRL_BPP_8			0x3
-#define JZ_LCD_CTRL_BPP_15_16			0x4
-#define JZ_LCD_CTRL_BPP_18_24			0x5
-#define JZ_LCD_CTRL_BPP_MASK			(JZ_LCD_CTRL_RGB555 | (0x7 << 0))
-
-#define JZ_LCD_CMD_SOF_IRQ			BIT(31)
-#define JZ_LCD_CMD_EOF_IRQ			BIT(30)
-#define JZ_LCD_CMD_ENABLE_PAL			BIT(28)
-
-#define JZ_LCD_SYNC_MASK			0x3ff
-
-#define JZ_LCD_STATE_EOF_IRQ			BIT(5)
-#define JZ_LCD_STATE_SOF_IRQ			BIT(4)
-#define JZ_LCD_STATE_DISABLED			BIT(0)
-
 struct ingenic_dma_hwdesc {
 	u32 next;
 	u32 addr;
diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.h b/drivers/gpu/drm/ingenic/ingenic-drm.h
new file mode 100644
index 000000000000..4186708a67bc
--- /dev/null
+++ b/drivers/gpu/drm/ingenic/ingenic-drm.h
@@ -0,0 +1,127 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Ingenic JZ47xx KMS driver - Register definitions and private API
+ *
+ * Copyright (C) 2020, Paul Cercueil <paul@crapouillou.net>
+ */
+
+#ifndef DRIVERS_GPU_DRM_INGENIC_INGENIC_DRM_H
+#define DRIVERS_GPU_DRM_INGENIC_INGENIC_DRM_H
+
+#include <linux/bitops.h>
+
+#define JZ_REG_LCD_CFG				0x00
+#define JZ_REG_LCD_VSYNC			0x04
+#define JZ_REG_LCD_HSYNC			0x08
+#define JZ_REG_LCD_VAT				0x0C
+#define JZ_REG_LCD_DAH				0x10
+#define JZ_REG_LCD_DAV				0x14
+#define JZ_REG_LCD_PS				0x18
+#define JZ_REG_LCD_CLS				0x1C
+#define JZ_REG_LCD_SPL				0x20
+#define JZ_REG_LCD_REV				0x24
+#define JZ_REG_LCD_CTRL				0x30
+#define JZ_REG_LCD_STATE			0x34
+#define JZ_REG_LCD_IID				0x38
+#define JZ_REG_LCD_DA0				0x40
+#define JZ_REG_LCD_SA0				0x44
+#define JZ_REG_LCD_FID0				0x48
+#define JZ_REG_LCD_CMD0				0x4C
+#define JZ_REG_LCD_DA1				0x50
+#define JZ_REG_LCD_SA1				0x54
+#define JZ_REG_LCD_FID1				0x58
+#define JZ_REG_LCD_CMD1				0x5C
+
+#define JZ_LCD_CFG_SLCD				BIT(31)
+#define JZ_LCD_CFG_PS_DISABLE			BIT(23)
+#define JZ_LCD_CFG_CLS_DISABLE			BIT(22)
+#define JZ_LCD_CFG_SPL_DISABLE			BIT(21)
+#define JZ_LCD_CFG_REV_DISABLE			BIT(20)
+#define JZ_LCD_CFG_HSYNCM			BIT(19)
+#define JZ_LCD_CFG_PCLKM			BIT(18)
+#define JZ_LCD_CFG_INV				BIT(17)
+#define JZ_LCD_CFG_SYNC_DIR			BIT(16)
+#define JZ_LCD_CFG_PS_POLARITY			BIT(15)
+#define JZ_LCD_CFG_CLS_POLARITY			BIT(14)
+#define JZ_LCD_CFG_SPL_POLARITY			BIT(13)
+#define JZ_LCD_CFG_REV_POLARITY			BIT(12)
+#define JZ_LCD_CFG_HSYNC_ACTIVE_LOW		BIT(11)
+#define JZ_LCD_CFG_PCLK_FALLING_EDGE		BIT(10)
+#define JZ_LCD_CFG_DE_ACTIVE_LOW		BIT(9)
+#define JZ_LCD_CFG_VSYNC_ACTIVE_LOW		BIT(8)
+#define JZ_LCD_CFG_18_BIT			BIT(7)
+#define JZ_LCD_CFG_PDW				(BIT(5) | BIT(4))
+
+#define JZ_LCD_CFG_MODE_GENERIC_16BIT		0
+#define JZ_LCD_CFG_MODE_GENERIC_18BIT		BIT(7)
+#define JZ_LCD_CFG_MODE_GENERIC_24BIT		BIT(6)
+
+#define JZ_LCD_CFG_MODE_SPECIAL_TFT_1		1
+#define JZ_LCD_CFG_MODE_SPECIAL_TFT_2		2
+#define JZ_LCD_CFG_MODE_SPECIAL_TFT_3		3
+
+#define JZ_LCD_CFG_MODE_TV_OUT_P		4
+#define JZ_LCD_CFG_MODE_TV_OUT_I		6
+
+#define JZ_LCD_CFG_MODE_SINGLE_COLOR_STN	8
+#define JZ_LCD_CFG_MODE_SINGLE_MONOCHROME_STN	9
+#define JZ_LCD_CFG_MODE_DUAL_COLOR_STN		10
+#define JZ_LCD_CFG_MODE_DUAL_MONOCHROME_STN	11
+
+#define JZ_LCD_CFG_MODE_8BIT_SERIAL		12
+#define JZ_LCD_CFG_MODE_LCM			13
+
+#define JZ_LCD_VSYNC_VPS_OFFSET			16
+#define JZ_LCD_VSYNC_VPE_OFFSET			0
+
+#define JZ_LCD_HSYNC_HPS_OFFSET			16
+#define JZ_LCD_HSYNC_HPE_OFFSET			0
+
+#define JZ_LCD_VAT_HT_OFFSET			16
+#define JZ_LCD_VAT_VT_OFFSET			0
+
+#define JZ_LCD_DAH_HDS_OFFSET			16
+#define JZ_LCD_DAH_HDE_OFFSET			0
+
+#define JZ_LCD_DAV_VDS_OFFSET			16
+#define JZ_LCD_DAV_VDE_OFFSET			0
+
+#define JZ_LCD_CTRL_BURST_4			(0x0 << 28)
+#define JZ_LCD_CTRL_BURST_8			(0x1 << 28)
+#define JZ_LCD_CTRL_BURST_16			(0x2 << 28)
+#define JZ_LCD_CTRL_RGB555			BIT(27)
+#define JZ_LCD_CTRL_OFUP			BIT(26)
+#define JZ_LCD_CTRL_FRC_GRAYSCALE_16		(0x0 << 24)
+#define JZ_LCD_CTRL_FRC_GRAYSCALE_4		(0x1 << 24)
+#define JZ_LCD_CTRL_FRC_GRAYSCALE_2		(0x2 << 24)
+#define JZ_LCD_CTRL_PDD_MASK			(0xff << 16)
+#define JZ_LCD_CTRL_EOF_IRQ			BIT(13)
+#define JZ_LCD_CTRL_SOF_IRQ			BIT(12)
+#define JZ_LCD_CTRL_OFU_IRQ			BIT(11)
+#define JZ_LCD_CTRL_IFU0_IRQ			BIT(10)
+#define JZ_LCD_CTRL_IFU1_IRQ			BIT(9)
+#define JZ_LCD_CTRL_DD_IRQ			BIT(8)
+#define JZ_LCD_CTRL_QDD_IRQ			BIT(7)
+#define JZ_LCD_CTRL_REVERSE_ENDIAN		BIT(6)
+#define JZ_LCD_CTRL_LSB_FISRT			BIT(5)
+#define JZ_LCD_CTRL_DISABLE			BIT(4)
+#define JZ_LCD_CTRL_ENABLE			BIT(3)
+#define JZ_LCD_CTRL_BPP_1			0x0
+#define JZ_LCD_CTRL_BPP_2			0x1
+#define JZ_LCD_CTRL_BPP_4			0x2
+#define JZ_LCD_CTRL_BPP_8			0x3
+#define JZ_LCD_CTRL_BPP_15_16			0x4
+#define JZ_LCD_CTRL_BPP_18_24			0x5
+#define JZ_LCD_CTRL_BPP_MASK			(JZ_LCD_CTRL_RGB555 | 0x7)
+
+#define JZ_LCD_CMD_SOF_IRQ			BIT(31)
+#define JZ_LCD_CMD_EOF_IRQ			BIT(30)
+#define JZ_LCD_CMD_ENABLE_PAL			BIT(28)
+
+#define JZ_LCD_SYNC_MASK			0x3ff
+
+#define JZ_LCD_STATE_EOF_IRQ			BIT(5)
+#define JZ_LCD_STATE_SOF_IRQ			BIT(4)
+#define JZ_LCD_STATE_DISABLED			BIT(0)
+
+#endif /* DRIVERS_GPU_DRM_INGENIC_INGENIC_DRM_H */
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
