Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AB14AB73B
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 10:09:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 487EC10EA0B;
	Mon,  7 Feb 2022 09:09:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc
 [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABD5010E463
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Feb 2022 08:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MYAUEC/UZMELo1MbqHK5rjmELyPMbcMZ9mxI9J7DMHw=; b=THAuS0BOl3FNWTO7FoaompxmQh
 49kneYzZfeE+gV/doz32Nr+jB6nJoP77s/rY7S5JRP1debSj2XUNyhhv1+JO53KG32Vg35VSi70bV
 4QPUwfXSHBfl6XVdq88x2n/IFf2N+bQWIWmwmpo/1SQL4fR11yTkVWsBVgPEBFQrLgc8=;
Received: from p200300ccff05f6001a3da2fffebfd33a.dip0.t-ipconnect.de
 ([2003:cc:ff05:f600:1a3d:a2ff:febf:d33a] helo=aktux)
 by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <andreas@kemnade.info>)
 id 1nGcTK-0006VA-6U; Sun, 06 Feb 2022 09:00:34 +0100
Received: from andi by aktux with local (Exim 4.94.2)
 (envelope-from <andreas@kemnade.info>)
 id 1nGcTJ-003LEh-LF; Sun, 06 Feb 2022 09:00:33 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 andreas@kemnade.info, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, alistair@alistair23.me, samuel@sholland.org,
 josua.mayer@jm0.eu, letux-kernel@openphoenux.org
Subject: [RFC PATCH 2/6] drm: Add skeleton for EPDC driver
Date: Sun,  6 Feb 2022 09:00:12 +0100
Message-Id: <20220206080016.796556-3-andreas@kemnade.info>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220206080016.796556-1-andreas@kemnade.info>
References: <20220206080016.796556-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.0 (-)
X-Mailman-Approved-At: Mon, 07 Feb 2022 09:09:20 +0000
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

This driver is for the EPD controller in the i.MX SoCs. Add a skeleton
and basic things for the driver

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 drivers/gpu/drm/Kconfig                 |   2 +
 drivers/gpu/drm/Makefile                |   1 +
 drivers/gpu/drm/mxc-epdc/Kconfig        |  15 +
 drivers/gpu/drm/mxc-epdc/Makefile       |   5 +
 drivers/gpu/drm/mxc-epdc/epdc_regs.h    | 442 ++++++++++++++++++++++++
 drivers/gpu/drm/mxc-epdc/mxc_epdc.h     |  20 ++
 drivers/gpu/drm/mxc-epdc/mxc_epdc_drv.c | 248 +++++++++++++
 7 files changed, 733 insertions(+)
 create mode 100644 drivers/gpu/drm/mxc-epdc/Kconfig
 create mode 100644 drivers/gpu/drm/mxc-epdc/Makefile
 create mode 100644 drivers/gpu/drm/mxc-epdc/epdc_regs.h
 create mode 100644 drivers/gpu/drm/mxc-epdc/mxc_epdc.h
 create mode 100644 drivers/gpu/drm/mxc-epdc/mxc_epdc_drv.c

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index b1f22e457fd0..6b6b44ff7556 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -390,6 +390,8 @@ source "drivers/gpu/drm/gud/Kconfig"
 
 source "drivers/gpu/drm/sprd/Kconfig"
 
+source "drivers/gpu/drm/mxc-epdc/Kconfig"
+
 config DRM_HYPERV
 	tristate "DRM Support for Hyper-V synthetic video device"
 	depends on DRM && PCI && MMU && HYPERV
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 301a44dc18e3..e5eb9815cf9a 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -131,6 +131,7 @@ obj-$(CONFIG_DRM_PANFROST) += panfrost/
 obj-$(CONFIG_DRM_ASPEED_GFX) += aspeed/
 obj-$(CONFIG_DRM_MCDE) += mcde/
 obj-$(CONFIG_DRM_TIDSS) += tidss/
+obj-$(CONFIG_DRM_MXC_EPDC) += mxc-epdc/
 obj-y			+= xlnx/
 obj-y			+= gud/
 obj-$(CONFIG_DRM_HYPERV) += hyperv/
diff --git a/drivers/gpu/drm/mxc-epdc/Kconfig b/drivers/gpu/drm/mxc-epdc/Kconfig
new file mode 100644
index 000000000000..3f5744161cff
--- /dev/null
+++ b/drivers/gpu/drm/mxc-epdc/Kconfig
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0
+config DRM_MXC_EPDC
+	tristate "i.MX EPD Controller"
+	depends on DRM && OF
+	depends on (COMPILE_TEST || ARCH_MXC)
+	select DRM_KMS_HELPER
+	select DRM_KMS_CMA_HELPER
+	select DMA_CMA if HAVE_DMA_CONTIGUOUS
+	select CMA if HAVE_DMA_CONTIGUOUS
+	help
+	  Choose this option if you have an i.MX system with an EPDC.
+	  It enables the usage of E-paper displays. A waveform is expected
+	  to be present in /lib/firmware/imx/epdc/epdc.fw
+
+	  If M is selected this module will be called mxc_epdc_drm.
diff --git a/drivers/gpu/drm/mxc-epdc/Makefile b/drivers/gpu/drm/mxc-epdc/Makefile
new file mode 100644
index 000000000000..a47ced72b7f6
--- /dev/null
+++ b/drivers/gpu/drm/mxc-epdc/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+mxc_epdc_drm-y := mxc_epdc_drv.o
+
+obj-$(CONFIG_DRM_MXC_EPDC) += mxc_epdc_drm.o
+
diff --git a/drivers/gpu/drm/mxc-epdc/epdc_regs.h b/drivers/gpu/drm/mxc-epdc/epdc_regs.h
new file mode 100644
index 000000000000..83445c56d911
--- /dev/null
+++ b/drivers/gpu/drm/mxc-epdc/epdc_regs.h
@@ -0,0 +1,442 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/* Copyright (C) 2010-2013 Freescale Semiconductor, Inc. */
+
+#ifndef __EPDC_REGS_INCLUDED__
+#define __EPDC_REGS_INCLUDED__
+
+/*************************************
+ * Register addresses
+ **************************************/
+
+#define EPDC_CTRL			0x000
+#define EPDC_CTRL_SET			0x004
+#define EPDC_CTRL_CLEAR			0x008
+#define EPDC_CTRL_TOGGLE		0x00C
+#define EPDC_WB_ADDR_TCE_V3		0x010
+#define EPDC_WVADDR			0x020
+#define EPDC_WB_ADDR			0x030
+#define EPDC_RES			0x040
+#define EPDC_FORMAT			0x050
+#define EPDC_FORMAT_SET			0x054
+#define EPDC_FORMAT_CLEAR		0x058
+#define EPDC_FORMAT_TOGGLE		0x05C
+#define EPDC_WB_FIELD0			0x060
+#define EPDC_WB_FIELD0_SET		0x064
+#define EPDC_WB_FIELD0_CLEAR		0x068
+#define EPDC_WB_FIELD0_TOGGLE		0x06C
+#define EPDC_WB_FIELD1			0x070
+#define EPDC_WB_FIELD1_SET		0x074
+#define EPDC_WB_FIELD1_CLEAR		0x078
+#define EPDC_WB_FIELD1_TOGGLE		0x07C
+#define EPDC_WB_FIELD2			0x080
+#define EPDC_WB_FIELD2_SET		0x084
+#define EPDC_WB_FIELD2_CLEAR		0x088
+#define EPDC_WB_FIELD2_TOGGLE		0x08C
+#define EPDC_WB_FIELD3			0x090
+#define EPDC_WB_FIELD3_SET		0x094
+#define EPDC_WB_FIELD3_CLEAR		0x098
+#define EPDC_WB_FIELD3_TOGGLE		0x09C
+#define EPDC_FIFOCTRL			0x0A0
+#define EPDC_FIFOCTRL_SET		0x0A4
+#define EPDC_FIFOCTRL_CLEAR		0x0A8
+#define EPDC_FIFOCTRL_TOGGLE		0x0AC
+#define EPDC_UPD_ADDR			0x100
+#define EPDC_UPD_STRIDE			0x110
+#define EPDC_UPD_CORD			0x120
+#define EPDC_UPD_SIZE			0x140
+#define EPDC_UPD_CTRL			0x160
+#define EPDC_UPD_FIXED			0x180
+#define EPDC_TEMP			0x1A0
+#define EPDC_AUTOWV_LUT			0x1C0
+#define EPDC_TCE_CTRL			0x200
+#define EPDC_TCE_SDCFG			0x220
+#define EPDC_TCE_GDCFG			0x240
+#define EPDC_TCE_HSCAN1			0x260
+#define EPDC_TCE_HSCAN2			0x280
+#define EPDC_TCE_VSCAN			0x2A0
+#define EPDC_TCE_OE			0x2C0
+#define EPDC_TCE_POLARITY		0x2E0
+#define EPDC_TCE_TIMING1		0x300
+#define EPDC_TCE_TIMING2		0x310
+#define EPDC_TCE_TIMING3		0x320
+#define EPDC_PIGEON_CTRL0		0x380
+#define EPDC_PIGEON_CTRL1		0x390
+#define EPDC_IRQ_MASK1			0x3C0
+#define EPDC_IRQ_MASK1_SET		0x3C4
+#define EPDC_IRQ_MASK1_CLEAR		0x3C8
+#define EPDC_IRQ_MASK1_TOGGLE		0x3CC
+#define EPDC_IRQ_MASK2			0x3D0
+#define EPDC_IRQ_MASK2_SET		0x3D4
+#define EPDC_IRQ_MASK2_CLEAR		0x3D8
+#define EPDC_IRQ_MASK2_TOGGLE		0x3DC
+#define EPDC_IRQ1			0x3E0
+#define EPDC_IRQ1_SET			0x3E4
+#define EPDC_IRQ1_CLEAR			0x3E8
+#define EPDC_IRQ1_TOGGLE		0x3EC
+#define EPDC_IRQ2			0x3F0
+#define EPDC_IRQ2_SET			0x3F4
+#define EPDC_IRQ2_CLEAR			0x3F8
+#define EPDC_IRQ2_TOGGLE		0x3FC
+#define EPDC_IRQ_MASK			0x400
+#define EPDC_IRQ_MASK_SET		0x404
+#define EPDC_IRQ_MASK_CLEAR		0x408
+#define EPDC_IRQ_MASK_TOGGLE		0x40C
+#define EPDC_IRQ			0x420
+#define EPDC_IRQ_SET			0x424
+#define EPDC_IRQ_CLEAR			0x428
+#define EPDC_IRQ_TOGGLE			0x42C
+#define EPDC_STATUS_LUTS		0x440
+#define EPDC_STATUS_LUTS_SET		0x444
+#define EPDC_STATUS_LUTS_CLEAR		0x448
+#define EPDC_STATUS_LUTS_TOGGLE		0x44C
+#define EPDC_STATUS_LUTS2		0x450
+#define EPDC_STATUS_LUTS2_SET		0x454
+#define EPDC_STATUS_LUTS2_CLEAR		0x458
+#define EPDC_STATUS_LUTS2_TOGGLE	0x45C
+#define EPDC_STATUS_NEXTLUT		0x460
+#define EPDC_STATUS_COL			0x480
+#define EPDC_STATUS_COL2		0x490
+#define EPDC_STATUS			0x4A0
+#define EPDC_STATUS_SET			0x4A4
+#define EPDC_STATUS_CLEAR		0x4A8
+#define EPDC_STATUS_TOGGLE		0x4AC
+#define EPDC_UPD_COL_CORD		0x4C0
+#define EPDC_UPD_COL_SIZE		0x4E0
+#define EPDC_DEBUG			0x500
+#define EPDC_DEBUG_LUT			0x530
+#define EPDC_HIST1_PARAM		0x600
+#define EPDC_HIST2_PARAM		0x610
+#define EPDC_HIST4_PARAM		0x620
+#define EPDC_HIST8_PARAM0		0x630
+#define EPDC_HIST8_PARAM1		0x640
+#define EPDC_HIST16_PARAM0		0x650
+#define EPDC_HIST16_PARAM1		0x660
+#define EPDC_HIST16_PARAM2		0x670
+#define EPDC_HIST16_PARAM3		0x680
+#define EPDC_GPIO			0x700
+#define EPDC_VERSION			0x7F0
+#define EPDC_PIGEON_0_0			0x800
+#define EPDC_PIGEON_0_1			0x810
+#define EPDC_PIGEON_0_2			0x820
+#define EPDC_PIGEON_1_0			0x840
+#define EPDC_PIGEON_1_1			0x850
+#define EPDC_PIGEON_1_2			0x860
+#define EPDC_PIGEON_2_0			0x880
+#define EPDC_PIGEON_2_1			0x890
+#define EPDC_PIGEON_2_2			0x8A0
+#define EPDC_PIGEON_3_0			0x8C0
+#define EPDC_PIGEON_3_1			0x8D0
+#define EPDC_PIGEON_3_2			0x8E0
+#define EPDC_PIGEON_4_0			0x900
+#define EPDC_PIGEON_4_1			0x910
+#define EPDC_PIGEON_4_2			0x920
+#define EPDC_PIGEON_5_0			0x940
+#define EPDC_PIGEON_5_1			0x950
+#define EPDC_PIGEON_5_2			0x960
+#define EPDC_PIGEON_6_0			0x980
+#define EPDC_PIGEON_6_1			0x990
+#define EPDC_PIGEON_6_2			0x9A0
+#define EPDC_PIGEON_7_0			0x9C0
+#define EPDC_PIGEON_7_1			0x9D0
+#define EPDC_PIGEON_7_2			0x9E0
+#define EPDC_PIGEON_8_0			0xA00
+#define EPDC_PIGEON_8_1			0xA10
+#define EPDC_PIGEON_8_2			0xA20
+#define EPDC_PIGEON_9_0			0xA40
+#define EPDC_PIGEON_9_1			0xA50
+#define EPDC_PIGEON_9_2			0xA60
+#define EPDC_PIGEON_10_0		0xA80
+#define EPDC_PIGEON_10_1		0xA90
+#define EPDC_PIGEON_10_2		0xAA0
+#define EPDC_PIGEON_11_0		0xAC0
+#define EPDC_PIGEON_11_1		0xAD0
+#define EPDC_PIGEON_11_2		0xAE0
+#define EPDC_PIGEON_12_0		0xB00
+#define EPDC_PIGEON_12_1		0xB10
+#define EPDC_PIGEON_12_2		0xB20
+#define EPDC_PIGEON_13_0		0xB40
+#define EPDC_PIGEON_13_1		0xB50
+#define EPDC_PIGEON_13_2		0xB60
+#define EPDC_PIGEON_14_0		0xB80
+#define EPDC_PIGEON_14_1		0xB90
+#define EPDC_PIGEON_14_2		0xBA0
+#define EPDC_PIGEON_15_0		0xBC0
+#define EPDC_PIGEON_15_1		0xBD0
+#define EPDC_PIGEON_15_2		0xBE0
+#define EPDC_WB_ADDR_TCE		0xC10
+
+/*
+ * Register field definitions
+ */
+
+enum {
+/* EPDC_CTRL field values */
+	EPDC_CTRL_SFTRST = 0x80000000,
+	EPDC_CTRL_CLKGATE = 0x40000000,
+	EPDC_CTRL_SRAM_POWERDOWN = 0x100,
+	EPDC_CTRL_UPD_DATA_SWIZZLE_MASK = 0xC0,
+	EPDC_CTRL_UPD_DATA_SWIZZLE_NO_SWAP = 0,
+	EPDC_CTRL_UPD_DATA_SWIZZLE_ALL_BYTES_SWAP = 0x40,
+	EPDC_CTRL_UPD_DATA_SWIZZLE_HWD_SWAP = 0x80,
+	EPDC_CTRL_UPD_DATA_SWIZZLE_HWD_BYTE_SWAP = 0xC0,
+	EPDC_CTRL_LUT_DATA_SWIZZLE_MASK = 0x30,
+	EPDC_CTRL_LUT_DATA_SWIZZLE_NO_SWAP = 0,
+	EPDC_CTRL_LUT_DATA_SWIZZLE_ALL_BYTES_SWAP = 0x10,
+	EPDC_CTRL_LUT_DATA_SWIZZLE_HWD_SWAP = 0x20,
+	EPDC_CTRL_LUT_DATA_SWIZZLE_HWD_BYTE_SWAP = 0x30,
+	EPDC_CTRL_BURST_LEN_8_8 = 0x1,
+	EPDC_CTRL_BURST_LEN_8_16 = 0,
+
+/* EPDC_RES field values */
+	EPDC_RES_VERTICAL_MASK = 0x1FFF0000,
+	EPDC_RES_VERTICAL_OFFSET = 16,
+	EPDC_RES_HORIZONTAL_MASK = 0x1FFF,
+	EPDC_RES_HORIZONTAL_OFFSET = 0,
+
+/* EPDC_FORMAT field values */
+	EPDC_FORMAT_BUF_PIXEL_SCALE_ROUND = 0x1000000,
+	EPDC_FORMAT_DEFAULT_TFT_PIXEL_MASK = 0xFF0000,
+	EPDC_FORMAT_DEFAULT_TFT_PIXEL_OFFSET = 16,
+	EPDC_FORMAT_BUF_PIXEL_FORMAT_MASK = 0x700,
+	EPDC_FORMAT_BUF_PIXEL_FORMAT_P2N = 0x200,
+	EPDC_FORMAT_BUF_PIXEL_FORMAT_P3N = 0x300,
+	EPDC_FORMAT_BUF_PIXEL_FORMAT_P4N = 0x400,
+	EPDC_FORMAT_BUF_PIXEL_FORMAT_P5N = 0x500,
+	EPDC_FORMAT_TFT_PIXEL_FORMAT_2BIT = 0x0,
+	EPDC_FORMAT_TFT_PIXEL_FORMAT_2BIT_VCOM = 0x1,
+	EPDC_FORMAT_TFT_PIXEL_FORMAT_4BIT = 0x2,
+	EPDC_FORMAT_TFT_PIXEL_FORMAT_4BIT_VCOM = 0x3,
+
+/* EPDC_FIFOCTRL field values */
+	EPDC_FIFOCTRL_ENABLE_PRIORITY = 0x80000000,
+	EPDC_FIFOCTRL_FIFO_INIT_LEVEL_MASK = 0xFF0000,
+	EPDC_FIFOCTRL_FIFO_INIT_LEVEL_OFFSET = 16,
+	EPDC_FIFOCTRL_FIFO_H_LEVEL_MASK = 0xFF00,
+	EPDC_FIFOCTRL_FIFO_H_LEVEL_OFFSET = 8,
+	EPDC_FIFOCTRL_FIFO_L_LEVEL_MASK = 0xFF,
+	EPDC_FIFOCTRL_FIFO_L_LEVEL_OFFSET = 0,
+
+/* EPDC_UPD_CORD field values */
+	EPDC_UPD_CORD_YCORD_MASK = 0x1FFF0000,
+	EPDC_UPD_CORD_YCORD_OFFSET = 16,
+	EPDC_UPD_CORD_XCORD_MASK = 0x1FFF,
+	EPDC_UPD_CORD_XCORD_OFFSET = 0,
+
+/* EPDC_UPD_SIZE field values */
+	EPDC_UPD_SIZE_HEIGHT_MASK = 0x1FFF0000,
+	EPDC_UPD_SIZE_HEIGHT_OFFSET = 16,
+	EPDC_UPD_SIZE_WIDTH_MASK = 0x1FFF,
+	EPDC_UPD_SIZE_WIDTH_OFFSET = 0,
+
+/* EPDC_UPD_CTRL field values */
+	EPDC_UPD_CTRL_USE_FIXED = 0x80000000,
+	EPDC_UPD_CTRL_LUT_SEL_MASK = 0x3F0000,
+	EPDC_UPD_CTRL_LUT_SEL_OFFSET = 16,
+	EPDC_UPD_CTRL_WAVEFORM_MODE_MASK = 0xFF00,
+	EPDC_UPD_CTRL_WAVEFORM_MODE_OFFSET = 8,
+	EPDC_UPD_CTRL_AUTOWV_PAUSE = 0x8,
+	EPDC_UPD_CTRL_AUTOWV = 0x4,
+	EPDC_UPD_CTRL_DRY_RUN = 0x2,
+	EPDC_UPD_CTRL_UPDATE_MODE_FULL = 0x1,
+
+/* EPDC_UPD_FIXED field values */
+	EPDC_UPD_FIXED_FIXNP_EN = 0x80000000,
+	EPDC_UPD_FIXED_FIXCP_EN = 0x40000000,
+	EPDC_UPD_FIXED_FIXNP_MASK = 0xFF00,
+	EPDC_UPD_FIXED_FIXNP_OFFSET = 8,
+	EPDC_UPD_FIXED_FIXCP_MASK = 0xFF,
+	EPDC_UPD_FIXED_FIXCP_OFFSET = 0,
+
+/* EPDC_AUTOWV_LUT field values */
+	EPDC_AUTOWV_LUT_DATA_MASK = 0xFF0000,
+	EPDC_AUTOWV_LUT_DATA_OFFSET = 16,
+	EPDC_AUTOWV_LUT_ADDR_MASK = 0xFF,
+	EPDC_AUTOWV_LUT_ADDR_OFFSET = 0,
+
+/* EPDC_TCE_CTRL field values */
+	EPDC_TCE_CTRL_VSCAN_HOLDOFF_MASK = 0x1FF0000,
+	EPDC_TCE_CTRL_VSCAN_HOLDOFF_OFFSET = 16,
+	EPDC_TCE_CTRL_VCOM_VAL_MASK = 0xC00,
+	EPDC_TCE_CTRL_VCOM_VAL_OFFSET = 10,
+	EPDC_TCE_CTRL_VCOM_MODE_AUTO = 0x200,
+	EPDC_TCE_CTRL_VCOM_MODE_MANUAL = 0x000,
+	EPDC_TCE_CTRL_DDR_MODE_ENABLE = 0x100,
+	EPDC_TCE_CTRL_LVDS_MODE_CE_ENABLE = 0x80,
+	EPDC_TCE_CTRL_LVDS_MODE_ENABLE = 0x40,
+	EPDC_TCE_CTRL_SCAN_DIR_1_UP = 0x20,
+	EPDC_TCE_CTRL_SCAN_DIR_0_UP = 0x10,
+	EPDC_TCE_CTRL_DUAL_SCAN_ENABLE = 0x8,
+	EPDC_TCE_CTRL_SDDO_WIDTH_16BIT = 0x4,
+	EPDC_TCE_CTRL_PIXELS_PER_SDCLK_2 = 1,
+	EPDC_TCE_CTRL_PIXELS_PER_SDCLK_4 = 2,
+	EPDC_TCE_CTRL_PIXELS_PER_SDCLK_8 = 3,
+
+/* EPDC_TCE_SDCFG field values */
+	EPDC_TCE_SDCFG_SDCLK_HOLD = 0x200000,
+	EPDC_TCE_SDCFG_SDSHR = 0x100000,
+	EPDC_TCE_SDCFG_NUM_CE_MASK = 0xF0000,
+	EPDC_TCE_SDCFG_NUM_CE_OFFSET = 16,
+	EPDC_TCE_SDCFG_SDDO_REFORMAT_STANDARD = 0,
+	EPDC_TCE_SDCFG_SDDO_REFORMAT_FLIP_PIXELS = 0x4000,
+	EPDC_TCE_SDCFG_SDDO_INVERT_ENABLE = 0x2000,
+	EPDC_TCE_SDCFG_PIXELS_PER_CE_MASK = 0x1FFF,
+	EPDC_TCE_SDCFG_PIXELS_PER_CE_OFFSET = 0,
+
+/* EPDC_TCE_GDCFG field values */
+	EPDC_TCE_SDCFG_GDRL = 0x10,
+	EPDC_TCE_SDCFG_GDOE_MODE_DELAYED_GDCLK = 0x2,
+	EPDC_TCE_SDCFG_GDSP_MODE_FRAME_SYNC = 0x1,
+	EPDC_TCE_SDCFG_GDSP_MODE_ONE_LINE = 0x0,
+
+/* EPDC_TCE_HSCAN1 field values */
+	EPDC_TCE_HSCAN1_LINE_SYNC_WIDTH_MASK = 0xFFF0000,
+	EPDC_TCE_HSCAN1_LINE_SYNC_WIDTH_OFFSET = 16,
+	EPDC_TCE_HSCAN1_LINE_SYNC_MASK = 0xFFF,
+	EPDC_TCE_HSCAN1_LINE_SYNC_OFFSET = 0,
+
+/* EPDC_TCE_HSCAN2 field values */
+	EPDC_TCE_HSCAN2_LINE_END_MASK = 0xFFF0000,
+	EPDC_TCE_HSCAN2_LINE_END_OFFSET = 16,
+	EPDC_TCE_HSCAN2_LINE_BEGIN_MASK = 0xFFF,
+	EPDC_TCE_HSCAN2_LINE_BEGIN_OFFSET = 0,
+
+/* EPDC_TCE_VSCAN field values */
+	EPDC_TCE_VSCAN_FRAME_END_MASK = 0xFF0000,
+	EPDC_TCE_VSCAN_FRAME_END_OFFSET = 16,
+	EPDC_TCE_VSCAN_FRAME_BEGIN_MASK = 0xFF00,
+	EPDC_TCE_VSCAN_FRAME_BEGIN_OFFSET = 8,
+	EPDC_TCE_VSCAN_FRAME_SYNC_MASK = 0xFF,
+	EPDC_TCE_VSCAN_FRAME_SYNC_OFFSET = 0,
+
+/* EPDC_TCE_OE field values */
+	EPDC_TCE_OE_SDOED_WIDTH_MASK = 0xFF000000,
+	EPDC_TCE_OE_SDOED_WIDTH_OFFSET = 24,
+	EPDC_TCE_OE_SDOED_DLY_MASK = 0xFF0000,
+	EPDC_TCE_OE_SDOED_DLY_OFFSET = 16,
+	EPDC_TCE_OE_SDOEZ_WIDTH_MASK = 0xFF00,
+	EPDC_TCE_OE_SDOEZ_WIDTH_OFFSET = 8,
+	EPDC_TCE_OE_SDOEZ_DLY_MASK = 0xFF,
+	EPDC_TCE_OE_SDOEZ_DLY_OFFSET = 0,
+
+/* EPDC_TCE_POLARITY field values */
+	EPDC_TCE_POLARITY_GDSP_POL_ACTIVE_HIGH = 0x10,
+	EPDC_TCE_POLARITY_GDOE_POL_ACTIVE_HIGH = 0x8,
+	EPDC_TCE_POLARITY_SDOE_POL_ACTIVE_HIGH = 0x4,
+	EPDC_TCE_POLARITY_SDLE_POL_ACTIVE_HIGH = 0x2,
+	EPDC_TCE_POLARITY_SDCE_POL_ACTIVE_HIGH = 0x1,
+
+/* EPDC_TCE_TIMING1 field values */
+	EPDC_TCE_TIMING1_SDLE_SHIFT_NONE = 0x00,
+	EPDC_TCE_TIMING1_SDLE_SHIFT_1 = 0x10,
+	EPDC_TCE_TIMING1_SDLE_SHIFT_2 = 0x20,
+	EPDC_TCE_TIMING1_SDLE_SHIFT_3 = 0x30,
+	EPDC_TCE_TIMING1_SDCLK_INVERT = 0x8,
+	EPDC_TCE_TIMING1_SDCLK_SHIFT_NONE = 0,
+	EPDC_TCE_TIMING1_SDCLK_SHIFT_1CYCLE = 1,
+	EPDC_TCE_TIMING1_SDCLK_SHIFT_2CYCLES = 2,
+	EPDC_TCE_TIMING1_SDCLK_SHIFT_3CYCLES = 3,
+
+/* EPDC_TCE_TIMING2 field values */
+	EPDC_TCE_TIMING2_GDCLK_HP_MASK = 0xFFFF0000,
+	EPDC_TCE_TIMING2_GDCLK_HP_OFFSET = 16,
+	EPDC_TCE_TIMING2_GDSP_OFFSET_MASK = 0xFFFF,
+	EPDC_TCE_TIMING2_GDSP_OFFSET_OFFSET = 0,
+
+/* EPDC_TCE_TIMING3 field values */
+	EPDC_TCE_TIMING3_GDOE_OFFSET_MASK = 0xFFFF0000,
+	EPDC_TCE_TIMING3_GDOE_OFFSET_OFFSET = 16,
+	EPDC_TCE_TIMING3_GDCLK_OFFSET_MASK = 0xFFFF,
+	EPDC_TCE_TIMING3_GDCLK_OFFSET_OFFSET = 0,
+
+/* EPDC_IRQ_MASK/EPDC_IRQ field values */
+	EPDC_IRQ_WB_CMPLT_IRQ = 0x10000,
+	EPDC_IRQ_LUT_COL_IRQ = 0x20000,
+	EPDC_IRQ_TCE_UNDERRUN_IRQ = 0x40000,
+	EPDC_IRQ_FRAME_END_IRQ = 0x80000,
+	EPDC_IRQ_BUS_ERROR_IRQ = 0x100000,
+	EPDC_IRQ_TCE_IDLE_IRQ = 0x200000,
+	EPDC_IRQ_UPD_DONE_IRQ = 0x400000,
+	EPDC_IRQ_PWR_IRQ = 0x800000,
+
+/* EPDC_STATUS_NEXTLUT field values */
+	EPDC_STATUS_NEXTLUT_NEXT_LUT_VALID = 0x100,
+	EPDC_STATUS_NEXTLUT_NEXT_LUT_MASK = 0x3F,
+	EPDC_STATUS_NEXTLUT_NEXT_LUT_OFFSET = 0,
+
+/* EPDC_STATUS field values */
+	EPDC_STATUS_HISTOGRAM_CP_MASK = 0x1F0000,
+	EPDC_STATUS_HISTOGRAM_CP_OFFSET = 16,
+	EPDC_STATUS_HISTOGRAM_NP_MASK = 0x1F00,
+	EPDC_STATUS_HISTOGRAM_NP_OFFSET = 8,
+	EPDC_STATUS_UPD_VOID = 0x8,
+	EPDC_STATUS_LUTS_UNDERRUN = 0x4,
+	EPDC_STATUS_LUTS_BUSY = 0x2,
+	EPDC_STATUS_WB_BUSY = 0x1,
+
+/* EPDC_UPD_COL_CORD field values */
+	EPDC_UPD_COL_CORD_YCORD_MASK = 0x1FFF0000,
+	EPDC_UPD_COL_CORD_YCORD_OFFSET = 16,
+	EPDC_UPD_COL_CORD_XCORD_MASK = 0x1FFF,
+	EPDC_UPD_COL_CORD_XCORD_OFFSET = 0,
+
+/* EPDC_UPD_COL_SIZE field values */
+	EPDC_UPD_COL_SIZE_HEIGHT_MASK = 0x1FFF0000,
+	EPDC_UPD_COL_SIZE_HEIGHT_OFFSET = 16,
+	EPDC_UPD_COL_SIZE_WIDTH_MASK = 0x1FFF,
+	EPDC_UPD_COL_SIZE_WIDTH_OFFSET = 0,
+
+/* EPDC_DEBUG field values */
+	EPDC_DEBUG_UNDERRUN_RECOVER = 0x2,
+	EPDC_DEBUG_COLLISION_OFF = 0x1,
+
+/* EPDC_HISTx_PARAM field values */
+	EPDC_HIST_PARAM_VALUE0_MASK = 0x1F,
+	EPDC_HIST_PARAM_VALUE0_OFFSET = 0,
+	EPDC_HIST_PARAM_VALUE1_MASK = 0x1F00,
+	EPDC_HIST_PARAM_VALUE1_OFFSET = 8,
+	EPDC_HIST_PARAM_VALUE2_MASK = 0x1F0000,
+	EPDC_HIST_PARAM_VALUE2_OFFSET = 16,
+	EPDC_HIST_PARAM_VALUE3_MASK = 0x1F000000,
+	EPDC_HIST_PARAM_VALUE3_OFFSET = 24,
+	EPDC_HIST_PARAM_VALUE4_MASK = 0x1F,
+	EPDC_HIST_PARAM_VALUE4_OFFSET = 0,
+	EPDC_HIST_PARAM_VALUE5_MASK = 0x1F00,
+	EPDC_HIST_PARAM_VALUE5_OFFSET = 8,
+	EPDC_HIST_PARAM_VALUE6_MASK = 0x1F0000,
+	EPDC_HIST_PARAM_VALUE6_OFFSET = 16,
+	EPDC_HIST_PARAM_VALUE7_MASK = 0x1F000000,
+	EPDC_HIST_PARAM_VALUE7_OFFSET = 24,
+	EPDC_HIST_PARAM_VALUE8_MASK = 0x1F,
+	EPDC_HIST_PARAM_VALUE8_OFFSET = 0,
+	EPDC_HIST_PARAM_VALUE9_MASK = 0x1F00,
+	EPDC_HIST_PARAM_VALUE9_OFFSET = 8,
+	EPDC_HIST_PARAM_VALUE10_MASK = 0x1F0000,
+	EPDC_HIST_PARAM_VALUE10_OFFSET = 16,
+	EPDC_HIST_PARAM_VALUE11_MASK = 0x1F000000,
+	EPDC_HIST_PARAM_VALUE11_OFFSET = 24,
+	EPDC_HIST_PARAM_VALUE12_MASK = 0x1F,
+	EPDC_HIST_PARAM_VALUE12_OFFSET = 0,
+	EPDC_HIST_PARAM_VALUE13_MASK = 0x1F00,
+	EPDC_HIST_PARAM_VALUE13_OFFSET = 8,
+	EPDC_HIST_PARAM_VALUE14_MASK = 0x1F0000,
+	EPDC_HIST_PARAM_VALUE14_OFFSET = 16,
+	EPDC_HIST_PARAM_VALUE15_MASK = 0x1F000000,
+	EPDC_HIST_PARAM_VALUE15_OFFSET = 24,
+
+/* EPDC_GPIO field values */
+	EPDC_GPIO_PWRCOM = 0x40,
+	EPDC_GPIO_PWRCTRL_MASK = 0x3C,
+	EPDC_GPIO_PWRCTRL_OFFSET = 2,
+	EPDC_GPIO_BDR_MASK = 0x3,
+	EPDC_GPIO_BDR_OFFSET = 0,
+
+/* EPDC_VERSION field values */
+	EPDC_VERSION_MAJOR_MASK = 0xFF000000,
+	EPDC_VERSION_MAJOR_OFFSET = 24,
+	EPDC_VERSION_MINOR_MASK = 0xFF0000,
+	EPDC_VERSION_MINOR_OFFSET = 16,
+	EPDC_VERSION_STEP_MASK = 0xFFFF,
+	EPDC_VERSION_STEP_OFFSET = 0,
+};
+
+#endif	/* __EPDC_REGS_INCLUDED__ */
diff --git a/drivers/gpu/drm/mxc-epdc/mxc_epdc.h b/drivers/gpu/drm/mxc-epdc/mxc_epdc.h
new file mode 100644
index 000000000000..c5f5280b574f
--- /dev/null
+++ b/drivers/gpu/drm/mxc-epdc/mxc_epdc.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/* Copyright (C) 2022 Andreas Kemnade */
+
+#include <video/display_timing.h>
+#include <video/of_display_timing.h>
+#include <video/videomode.h>
+
+#include <drm/drm_drv.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_simple_kms_helper.h>
+
+struct clk;
+struct regulator;
+struct mxc_epdc {
+	struct drm_device drm;
+	struct drm_simple_display_pipe pipe;
+	struct drm_connector connector;
+	struct display_timing timing;
+};
+
diff --git a/drivers/gpu/drm/mxc-epdc/mxc_epdc_drv.c b/drivers/gpu/drm/mxc-epdc/mxc_epdc_drv.c
new file mode 100644
index 000000000000..c0b0a3bcdb57
--- /dev/null
+++ b/drivers/gpu/drm/mxc-epdc/mxc_epdc_drv.c
@@ -0,0 +1,248 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (C) 2022 Andreas Kemnade
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/dma-mapping.h>
+#include <linux/firmware.h>
+#include <linux/fs.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_file.h>
+#include <drm/drm_format_helper.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_ioctl.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_prime.h>
+#include <drm/drm_probe_helper.h>
+#include "mxc_epdc.h"
+
+#define DRIVER_NAME "mxc_epdc"
+#define DRIVER_DESC "IMX EPDC"
+#define DRIVER_DATE "20220202"
+#define DRIVER_MAJOR 1
+#define DRIVER_MINOR 0
+#define DRIVER_PATCHLEVEL 0
+
+#define to_mxc_epdc(x) container_of(x, struct mxc_epdc, drm)
+
+static const struct drm_mode_config_funcs mxc_epdc_mode_config_funcs = {
+	.fb_create = drm_gem_fb_create_with_dirty,
+	.atomic_check	   = drm_atomic_helper_check,
+	.atomic_commit	  = drm_atomic_helper_commit,
+};
+
+static struct mxc_epdc *
+drm_pipe_to_mxc_epdc(struct drm_simple_display_pipe *pipe)
+{
+	return container_of(pipe, struct mxc_epdc, pipe);
+}
+
+static struct mxc_epdc *
+drm_connector_to_mxc_epdc(struct drm_connector *connector)
+{
+	return container_of(connector, struct mxc_epdc, connector);
+}
+
+static void mxc_epdc_setup_mode_config(struct drm_device *drm)
+{
+	drm_mode_config_init(drm);
+
+	drm->mode_config.min_width = 0;
+	drm->mode_config.min_height = 0;
+	/*
+	 * Maximum update buffer image width due to v2.0 and v2.1 errata
+	 * ERR005313.
+	 */
+	drm->mode_config.max_width = 2047;
+	drm->mode_config.max_height = 2048;
+	drm->mode_config.funcs = &mxc_epdc_mode_config_funcs;
+}
+
+
+DEFINE_DRM_GEM_CMA_FOPS(fops);
+
+static int mxc_epdc_get_modes(struct drm_connector *connector)
+{
+	struct mxc_epdc *priv = drm_connector_to_mxc_epdc(connector);
+	struct drm_display_mode *mode;
+	struct videomode vm;
+
+	videomode_from_timing(&priv->timing, &vm);
+	mode = drm_mode_create(connector->dev);
+	if (!mode) {
+		dev_err(priv->drm.dev, "failed to add mode\n");
+		return 0;
+	}
+
+	drm_display_mode_from_videomode(&vm, mode);
+	mode->type |= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
+
+	drm_mode_probed_add(connector, mode);
+
+	connector->display_info.width_mm = mode->width_mm;
+	connector->display_info.height_mm = mode->height_mm;
+
+	return 1;
+}
+
+static const struct
+drm_connector_helper_funcs mxc_epdc_connector_helper_funcs = {
+	.get_modes = mxc_epdc_get_modes,
+};
+
+static const struct drm_connector_funcs mxc_epdc_connector_funcs = {
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy  = drm_connector_cleanup,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+int mxc_epdc_output(struct drm_device *drm)
+{
+	struct mxc_epdc *priv = to_mxc_epdc(drm);
+	int ret;
+
+	priv->connector.dpms = DRM_MODE_DPMS_OFF;
+	priv->connector.polled = 0;
+	drm_connector_helper_add(&priv->connector,
+				 &mxc_epdc_connector_helper_funcs);
+	ret = drm_connector_init(drm, &priv->connector,
+				 &mxc_epdc_connector_funcs,
+				 DRM_MODE_CONNECTOR_Unknown);
+	if (ret)
+		return ret;
+	ret = of_get_display_timing(drm->dev->of_node, "timing", &priv->timing);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void mxc_epdc_pipe_enable(struct drm_simple_display_pipe *pipe,
+				   struct drm_crtc_state *crtc_state,
+				   struct drm_plane_state *plane_state)
+{
+	struct mxc_epdc *priv = drm_pipe_to_mxc_epdc(pipe);
+	struct drm_display_mode *m = &pipe->crtc.state->adjusted_mode;
+
+	dev_info(priv->drm.dev, "Mode: %d x %d\n", m->hdisplay, m->vdisplay);
+}
+
+static void mxc_epdc_pipe_disable(struct drm_simple_display_pipe *pipe)
+{
+	struct mxc_epdc *priv = drm_pipe_to_mxc_epdc(pipe);
+
+	dev_dbg(priv->drm.dev, "pipe disable\n");
+}
+
+static void mxc_epdc_pipe_update(struct drm_simple_display_pipe *pipe,
+				   struct drm_plane_state *plane_state)
+{
+	struct mxc_epdc *priv = drm_pipe_to_mxc_epdc(pipe);
+
+	dev_dbg(priv->drm.dev, "pipe update\n");
+}
+
+static const struct drm_simple_display_pipe_funcs mxc_epdc_funcs = {
+	.enable	 = mxc_epdc_pipe_enable,
+	.disable = mxc_epdc_pipe_disable,
+	.update	= mxc_epdc_pipe_update,
+	.prepare_fb = drm_gem_simple_display_pipe_prepare_fb,
+};
+
+
+static const uint32_t mxc_epdc_formats[] = {
+	DRM_FORMAT_XRGB8888,
+};
+
+static struct drm_driver mxc_epdc_driver = {
+	.driver_features = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
+	.fops = &fops,
+	.dumb_create	    = drm_gem_cma_dumb_create,
+	.prime_handle_to_fd     = drm_gem_prime_handle_to_fd,
+	.prime_fd_to_handle     = drm_gem_prime_fd_to_handle,
+	.gem_prime_import_sg_table = drm_gem_cma_prime_import_sg_table,
+	.gem_prime_mmap	 = drm_gem_prime_mmap,
+
+	.name = DRIVER_NAME,
+	.desc = DRIVER_DESC,
+	.date = DRIVER_DATE,
+	.major = DRIVER_MAJOR,
+	.minor = DRIVER_MINOR,
+	.patchlevel = DRIVER_PATCHLEVEL,
+};
+
+
+static int mxc_epdc_probe(struct platform_device *pdev)
+{
+	struct mxc_epdc *priv;
+	int ret;
+
+	priv = devm_drm_dev_alloc(&pdev->dev, &mxc_epdc_driver, struct mxc_epdc, drm);
+	if (IS_ERR(priv))
+		return PTR_ERR(priv);
+
+	platform_set_drvdata(pdev, priv);
+
+	mxc_epdc_setup_mode_config(&priv->drm);
+
+	ret = mxc_epdc_output(&priv->drm);
+	if (ret)
+		return ret;
+
+	drm_simple_display_pipe_init(&priv->drm, &priv->pipe, &mxc_epdc_funcs,
+				     mxc_epdc_formats,
+				     ARRAY_SIZE(mxc_epdc_formats),
+				     NULL,
+				     &priv->connector);
+	drm_plane_enable_fb_damage_clips(&priv->pipe.plane);
+
+	drm_mode_config_reset(&priv->drm);
+
+	ret = drm_dev_register(&priv->drm, 0);
+
+	drm_fbdev_generic_setup(&priv->drm, 32);
+	return 0;
+}
+
+static int mxc_epdc_remove(struct platform_device *pdev)
+{
+	struct mxc_epdc *priv = platform_get_drvdata(pdev);
+
+	drm_dev_unregister(&priv->drm);
+	drm_kms_helper_poll_fini(&priv->drm);
+	drm_mode_config_cleanup(&priv->drm);
+	return 0;
+}
+
+static const struct of_device_id imx_epdc_dt_ids[] = {
+	{ .compatible = "fsl,imx6sl-epdc", },
+	{ .compatible = "fsl,imx6sll-epdc", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, imx_epdc_dt_ids);
+
+static struct platform_driver pdev = {
+	.driver = {
+		.name   = "mxc_epdc",
+		.of_match_table = of_match_ptr(imx_epdc_dt_ids),
+	},
+	.probe  = mxc_epdc_probe,
+	.remove = mxc_epdc_remove,
+};
+
+module_platform_driver(pdev);
+MODULE_DESCRIPTION("IMX EPDC driver");
+MODULE_LICENSE("GPL");
+
-- 
2.30.2

