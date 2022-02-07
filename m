Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFC94AB73E
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 10:09:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DAC410EE0A;
	Mon,  7 Feb 2022 09:09:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc
 [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4415B10E463
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Feb 2022 08:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9wsuAuJLz5eoH1KRtjPrpQVHg19ELZD+EX1VrO99v30=; b=U7p+06RgR7Dt7Cagug2rdsSWqw
 ZZJ3aFy8rJe6Ec+p8WRBLFv4szRRaOo+hHTthxCtXBraLeqNfiOwvYOGZb7Qn00lU0yymQ788n5kR
 qS93bNfvtQe168/Q2MTsl8GD4oB9Fw3oT37+o+yXY/kEVN/15BElrPMpP1D9a2yRHrkc=;
Received: from p200300ccff05f6001a3da2fffebfd33a.dip0.t-ipconnect.de
 ([2003:cc:ff05:f600:1a3d:a2ff:febf:d33a] helo=aktux)
 by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <andreas@kemnade.info>)
 id 1nGcTK-0006VM-Gv; Sun, 06 Feb 2022 09:00:35 +0100
Received: from andi by aktux with local (Exim 4.94.2)
 (envelope-from <andreas@kemnade.info>)
 id 1nGcTK-003LEl-0n; Sun, 06 Feb 2022 09:00:34 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 andreas@kemnade.info, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, alistair@alistair23.me, samuel@sholland.org,
 josua.mayer@jm0.eu, letux-kernel@openphoenux.org
Subject: [RFC PATCH 3/6] drm: mxc-epdc: Add display and waveform initialisation
Date: Sun,  6 Feb 2022 09:00:13 +0100
Message-Id: <20220206080016.796556-4-andreas@kemnade.info>
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

Adds display parameter initialisation, display power up/down and
waveform loading

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 drivers/gpu/drm/mxc-epdc/Makefile        |   2 +-
 drivers/gpu/drm/mxc-epdc/epdc_hw.c       | 495 +++++++++++++++++++++++
 drivers/gpu/drm/mxc-epdc/epdc_hw.h       |   8 +
 drivers/gpu/drm/mxc-epdc/epdc_waveform.c | 189 +++++++++
 drivers/gpu/drm/mxc-epdc/epdc_waveform.h |   7 +
 drivers/gpu/drm/mxc-epdc/mxc_epdc.h      |  81 ++++
 drivers/gpu/drm/mxc-epdc/mxc_epdc_drv.c  |  94 +++++
 7 files changed, 875 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/mxc-epdc/epdc_hw.c
 create mode 100644 drivers/gpu/drm/mxc-epdc/epdc_hw.h
 create mode 100644 drivers/gpu/drm/mxc-epdc/epdc_waveform.c
 create mode 100644 drivers/gpu/drm/mxc-epdc/epdc_waveform.h

diff --git a/drivers/gpu/drm/mxc-epdc/Makefile b/drivers/gpu/drm/mxc-epdc/Makefile
index a47ced72b7f6..0263ef2bf0db 100644
--- a/drivers/gpu/drm/mxc-epdc/Makefile
+++ b/drivers/gpu/drm/mxc-epdc/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-mxc_epdc_drm-y := mxc_epdc_drv.o
+mxc_epdc_drm-y := mxc_epdc_drv.o epdc_hw.o epdc_waveform.o
 
 obj-$(CONFIG_DRM_MXC_EPDC) += mxc_epdc_drm.o
 
diff --git a/drivers/gpu/drm/mxc-epdc/epdc_hw.c b/drivers/gpu/drm/mxc-epdc/epdc_hw.c
new file mode 100644
index 000000000000..a74cbd237e0d
--- /dev/null
+++ b/drivers/gpu/drm/mxc-epdc/epdc_hw.c
@@ -0,0 +1,495 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (C) 2022 Andreas Kemnade
+//
+/*
+ * based on the EPDC framebuffer driver
+ * Copyright (C) 2010-2016 Freescale Semiconductor, Inc.
+ * Copyright 2017 NXP
+ */
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
+
+#include "mxc_epdc.h"
+#include "epdc_regs.h"
+#include "epdc_hw.h"
+#include "epdc_waveform.h"
+
+void mxc_epdc_powerup(struct mxc_epdc *priv)
+{
+	int ret = 0;
+
+	mutex_lock(&priv->power_mutex);
+
+	/*
+	 * If power down request is pending, clear
+	 * powering_down to cancel the request.
+	 */
+	if (priv->powering_down)
+		priv->powering_down = false;
+
+	if (priv->powered) {
+		mutex_unlock(&priv->power_mutex);
+		return;
+	}
+
+	dev_dbg(priv->drm.dev, "EPDC Powerup\n");
+
+	priv->updates_active = true;
+
+	/* Enable the v3p3 regulator */
+	ret = regulator_enable(priv->v3p3_regulator);
+	if (IS_ERR((void *)ret)) {
+		dev_err(priv->drm.dev,
+			"Unable to enable V3P3 regulator. err = 0x%x\n",
+			ret);
+		mutex_unlock(&priv->power_mutex);
+		return;
+	}
+
+	usleep_range(1000, 2000);
+
+	pm_runtime_get_sync(priv->drm.dev);
+
+	/* Enable clocks to EPDC */
+	clk_prepare_enable(priv->epdc_clk_axi);
+	clk_prepare_enable(priv->epdc_clk_pix);
+
+	epdc_write(priv, EPDC_CTRL_CLEAR, EPDC_CTRL_CLKGATE);
+
+	/* Enable power to the EPD panel */
+	ret = regulator_enable(priv->display_regulator);
+	if (IS_ERR((void *)ret)) {
+		dev_err(priv->drm.dev,
+			"Unable to enable DISPLAY regulator. err = 0x%x\n",
+			ret);
+		mutex_unlock(&priv->power_mutex);
+		return;
+	}
+
+	ret = regulator_enable(priv->vcom_regulator);
+	if (IS_ERR((void *)ret)) {
+		dev_err(priv->drm.dev,
+			"Unable to enable VCOM regulator. err = 0x%x\n",
+			ret);
+		mutex_unlock(&priv->power_mutex);
+		return;
+	}
+
+	priv->powered = true;
+
+	mutex_unlock(&priv->power_mutex);
+}
+
+void mxc_epdc_powerdown(struct mxc_epdc *priv)
+{
+	mutex_lock(&priv->power_mutex);
+
+	/* If powering_down has been cleared, a powerup
+	 * request is pre-empting this powerdown request.
+	 */
+	if (!priv->powering_down
+		|| (!priv->powered)) {
+		mutex_unlock(&priv->power_mutex);
+		return;
+	}
+
+	dev_dbg(priv->drm.dev, "EPDC Powerdown\n");
+
+	/* Disable power to the EPD panel */
+	regulator_disable(priv->vcom_regulator);
+	regulator_disable(priv->display_regulator);
+
+	/* Disable clocks to EPDC */
+	epdc_write(priv, EPDC_CTRL_SET, EPDC_CTRL_CLKGATE);
+	clk_disable_unprepare(priv->epdc_clk_pix);
+	clk_disable_unprepare(priv->epdc_clk_axi);
+
+	pm_runtime_put_sync_suspend(priv->drm.dev);
+
+	/* turn off the V3p3 */
+	regulator_disable(priv->v3p3_regulator);
+
+	priv->powered = false;
+	priv->powering_down = false;
+
+	if (priv->wait_for_powerdown) {
+		priv->wait_for_powerdown = false;
+		complete(&priv->powerdown_compl);
+	}
+
+	mutex_unlock(&priv->power_mutex);
+}
+
+static void epdc_set_horizontal_timing(struct mxc_epdc *priv, u32 horiz_start,
+				       u32 horiz_end,
+				       u32 hsync_width, u32 hsync_line_length)
+{
+	u32 reg_val =
+	    ((hsync_width << EPDC_TCE_HSCAN1_LINE_SYNC_WIDTH_OFFSET) &
+	     EPDC_TCE_HSCAN1_LINE_SYNC_WIDTH_MASK)
+	    | ((hsync_line_length << EPDC_TCE_HSCAN1_LINE_SYNC_OFFSET) &
+	       EPDC_TCE_HSCAN1_LINE_SYNC_MASK);
+	epdc_write(priv, EPDC_TCE_HSCAN1, reg_val);
+
+	reg_val =
+	    ((horiz_start << EPDC_TCE_HSCAN2_LINE_BEGIN_OFFSET) &
+	     EPDC_TCE_HSCAN2_LINE_BEGIN_MASK)
+	    | ((horiz_end << EPDC_TCE_HSCAN2_LINE_END_OFFSET) &
+	       EPDC_TCE_HSCAN2_LINE_END_MASK);
+	epdc_write(priv, EPDC_TCE_HSCAN2, reg_val);
+}
+
+static void epdc_set_vertical_timing(struct mxc_epdc *priv,
+				     u32 vert_start,
+				     u32 vert_end,
+				     u32 vsync_width)
+{
+	u32 reg_val =
+	    ((vert_start << EPDC_TCE_VSCAN_FRAME_BEGIN_OFFSET) &
+	     EPDC_TCE_VSCAN_FRAME_BEGIN_MASK)
+	    | ((vert_end << EPDC_TCE_VSCAN_FRAME_END_OFFSET) &
+	       EPDC_TCE_VSCAN_FRAME_END_MASK)
+	    | ((vsync_width << EPDC_TCE_VSCAN_FRAME_SYNC_OFFSET) &
+	       EPDC_TCE_VSCAN_FRAME_SYNC_MASK);
+	epdc_write(priv, EPDC_TCE_VSCAN, reg_val);
+}
+
+static inline void epdc_set_screen_res(struct mxc_epdc *priv,
+				       u32 width, u32 height)
+{
+	u32 val = (height << EPDC_RES_VERTICAL_OFFSET) | width;
+
+	epdc_write(priv, EPDC_RES, val);
+}
+
+
+void epdc_init_settings(struct mxc_epdc *priv, struct drm_display_mode *m)
+{
+	u32 reg_val;
+	int num_ce;
+	int i;
+
+	/* Enable clocks to access EPDC regs */
+	clk_prepare_enable(priv->epdc_clk_axi);
+	clk_prepare_enable(priv->epdc_clk_pix);
+
+	/* Reset */
+	epdc_write(priv, EPDC_CTRL_SET, EPDC_CTRL_SFTRST);
+	while (!(epdc_read(priv, EPDC_CTRL) & EPDC_CTRL_CLKGATE))
+		;
+	epdc_write(priv, EPDC_CTRL_CLEAR, EPDC_CTRL_SFTRST);
+
+	/* Enable clock gating (clear to enable) */
+	epdc_write(priv, EPDC_CTRL_CLEAR, EPDC_CTRL_CLKGATE);
+	while (epdc_read(priv, EPDC_CTRL) & (EPDC_CTRL_SFTRST | EPDC_CTRL_CLKGATE))
+		;
+
+	/* EPDC_CTRL */
+	reg_val = epdc_read(priv, EPDC_CTRL);
+	reg_val &= ~EPDC_CTRL_UPD_DATA_SWIZZLE_MASK;
+	reg_val |= EPDC_CTRL_UPD_DATA_SWIZZLE_NO_SWAP;
+	reg_val &= ~EPDC_CTRL_LUT_DATA_SWIZZLE_MASK;
+	reg_val |= EPDC_CTRL_LUT_DATA_SWIZZLE_NO_SWAP;
+	epdc_write(priv, EPDC_CTRL_SET, reg_val);
+
+	/* EPDC_FORMAT - 2bit TFT and buf_pix_fmt Buf pixel format */
+	reg_val = EPDC_FORMAT_TFT_PIXEL_FORMAT_2BIT
+		| priv->buf_pix_fmt
+	    | ((0x0 << EPDC_FORMAT_DEFAULT_TFT_PIXEL_OFFSET) &
+	       EPDC_FORMAT_DEFAULT_TFT_PIXEL_MASK);
+	epdc_write(priv, EPDC_FORMAT, reg_val);
+	if (priv->rev >= 30) {
+		if (priv->buf_pix_fmt == EPDC_FORMAT_BUF_PIXEL_FORMAT_P5N) {
+			epdc_write(priv, EPDC_WB_FIELD2, 0xc554);
+			epdc_write(priv, EPDC_WB_FIELD1, 0xa004);
+		} else {
+			epdc_write(priv, EPDC_WB_FIELD2, 0xc443);
+			epdc_write(priv, EPDC_WB_FIELD1, 0xa003);
+		}
+	}
+
+	/* EPDC_FIFOCTRL (disabled) */
+	reg_val =
+	    ((100 << EPDC_FIFOCTRL_FIFO_INIT_LEVEL_OFFSET) &
+	     EPDC_FIFOCTRL_FIFO_INIT_LEVEL_MASK)
+	    | ((200 << EPDC_FIFOCTRL_FIFO_H_LEVEL_OFFSET) &
+	       EPDC_FIFOCTRL_FIFO_H_LEVEL_MASK)
+	    | ((100 << EPDC_FIFOCTRL_FIFO_L_LEVEL_OFFSET) &
+	       EPDC_FIFOCTRL_FIFO_L_LEVEL_MASK);
+	epdc_write(priv, EPDC_FIFOCTRL, reg_val);
+
+	/* EPDC_TEMP - Use default temp to get index */
+	epdc_write(priv, EPDC_TEMP,
+		   mxc_epdc_fb_get_temp_index(priv, TEMP_USE_AMBIENT));
+
+	/* EPDC_RES */
+	epdc_set_screen_res(priv, m->hdisplay, m->vdisplay);
+
+	/* EPDC_AUTOWV_LUT */
+	/* Initialize all auto-wavefrom look-up values to 2 - GC16 */
+	for (i = 0; i < 8; i++)
+		epdc_write(priv, EPDC_AUTOWV_LUT,
+			(2 << EPDC_AUTOWV_LUT_DATA_OFFSET) |
+			(i << EPDC_AUTOWV_LUT_ADDR_OFFSET));
+
+	/*
+	 * EPDC_TCE_CTRL
+	 * VSCAN_HOLDOFF = 4
+	 * VCOM_MODE = MANUAL
+	 * VCOM_VAL = 0
+	 * DDR_MODE = DISABLED
+	 * LVDS_MODE_CE = DISABLED
+	 * LVDS_MODE = DISABLED
+	 * DUAL_SCAN = DISABLED
+	 * SDDO_WIDTH = 8bit
+	 * PIXELS_PER_SDCLK = 4
+	 */
+	reg_val =
+	    ((priv->imx_mode.vscan_holdoff << EPDC_TCE_CTRL_VSCAN_HOLDOFF_OFFSET) &
+	     EPDC_TCE_CTRL_VSCAN_HOLDOFF_MASK)
+	    | EPDC_TCE_CTRL_PIXELS_PER_SDCLK_4;
+	epdc_write(priv, EPDC_TCE_CTRL, reg_val);
+
+	/* EPDC_TCE_HSCAN */
+	epdc_set_horizontal_timing(priv, m->hsync_start - m->hdisplay,
+				   m->htotal - m->hsync_end,
+				   m->hsync_end - m->hsync_start,
+				   m->hsync_end - m->hsync_start);
+
+	/* EPDC_TCE_VSCAN */
+	epdc_set_vertical_timing(priv, m->vsync_start - m->vdisplay,
+				 m->vtotal - m->vsync_end,
+				 m->vsync_end - m->vsync_start);
+
+	/* EPDC_TCE_OE */
+	reg_val =
+	    ((priv->imx_mode.sdoed_width << EPDC_TCE_OE_SDOED_WIDTH_OFFSET) &
+	     EPDC_TCE_OE_SDOED_WIDTH_MASK)
+	    | ((priv->imx_mode.sdoed_delay << EPDC_TCE_OE_SDOED_DLY_OFFSET) &
+	       EPDC_TCE_OE_SDOED_DLY_MASK)
+	    | ((priv->imx_mode.sdoez_width << EPDC_TCE_OE_SDOEZ_WIDTH_OFFSET) &
+	       EPDC_TCE_OE_SDOEZ_WIDTH_MASK)
+	    | ((priv->imx_mode.sdoez_delay << EPDC_TCE_OE_SDOEZ_DLY_OFFSET) &
+	       EPDC_TCE_OE_SDOEZ_DLY_MASK);
+	epdc_write(priv, EPDC_TCE_OE, reg_val);
+
+	/* EPDC_TCE_TIMING1 */
+	epdc_write(priv, EPDC_TCE_TIMING1, 0x0);
+
+	/* EPDC_TCE_TIMING2 */
+	reg_val =
+	    ((priv->imx_mode.gdclk_hp_offs << EPDC_TCE_TIMING2_GDCLK_HP_OFFSET) &
+	     EPDC_TCE_TIMING2_GDCLK_HP_MASK)
+	    | ((priv->imx_mode.gdsp_offs << EPDC_TCE_TIMING2_GDSP_OFFSET_OFFSET) &
+	       EPDC_TCE_TIMING2_GDSP_OFFSET_MASK);
+	epdc_write(priv, EPDC_TCE_TIMING2, reg_val);
+
+	/* EPDC_TCE_TIMING3 */
+	reg_val =
+	    ((priv->imx_mode.gdoe_offs << EPDC_TCE_TIMING3_GDOE_OFFSET_OFFSET) &
+	     EPDC_TCE_TIMING3_GDOE_OFFSET_MASK)
+	    | ((priv->imx_mode.gdclk_offs << EPDC_TCE_TIMING3_GDCLK_OFFSET_OFFSET) &
+	       EPDC_TCE_TIMING3_GDCLK_OFFSET_MASK);
+	epdc_write(priv, EPDC_TCE_TIMING3, reg_val);
+
+	/*
+	 * EPDC_TCE_SDCFG
+	 * SDCLK_HOLD = 1
+	 * SDSHR = 1
+	 * NUM_CE = 1
+	 * SDDO_REFORMAT = FLIP_PIXELS
+	 * SDDO_INVERT = DISABLED
+	 * PIXELS_PER_CE = display horizontal resolution
+	 */
+	num_ce = priv->imx_mode.num_ce;
+	if (num_ce == 0)
+		num_ce = 1;
+	reg_val = EPDC_TCE_SDCFG_SDCLK_HOLD | EPDC_TCE_SDCFG_SDSHR
+	    | ((num_ce << EPDC_TCE_SDCFG_NUM_CE_OFFSET) &
+	       EPDC_TCE_SDCFG_NUM_CE_MASK)
+	    | EPDC_TCE_SDCFG_SDDO_REFORMAT_FLIP_PIXELS
+	    | ((priv->epdc_mem_width/num_ce << EPDC_TCE_SDCFG_PIXELS_PER_CE_OFFSET) &
+	       EPDC_TCE_SDCFG_PIXELS_PER_CE_MASK);
+	epdc_write(priv, EPDC_TCE_SDCFG, reg_val);
+
+	/*
+	 * EPDC_TCE_GDCFG
+	 * GDRL = 1
+	 * GDOE_MODE = 0;
+	 * GDSP_MODE = 0;
+	 */
+	reg_val = EPDC_TCE_SDCFG_GDRL;
+	epdc_write(priv, EPDC_TCE_GDCFG, reg_val);
+
+	/*
+	 * EPDC_TCE_POLARITY
+	 * SDCE_POL = ACTIVE LOW
+	 * SDLE_POL = ACTIVE HIGH
+	 * SDOE_POL = ACTIVE HIGH
+	 * GDOE_POL = ACTIVE HIGH
+	 * GDSP_POL = ACTIVE LOW
+	 */
+	reg_val = EPDC_TCE_POLARITY_SDLE_POL_ACTIVE_HIGH
+	    | EPDC_TCE_POLARITY_SDOE_POL_ACTIVE_HIGH
+	    | EPDC_TCE_POLARITY_GDOE_POL_ACTIVE_HIGH;
+	epdc_write(priv, EPDC_TCE_POLARITY, reg_val);
+
+	/* EPDC_IRQ_MASK */
+	epdc_write(priv, EPDC_IRQ_MASK, EPDC_IRQ_TCE_UNDERRUN_IRQ);
+
+	/*
+	 * EPDC_GPIO
+	 * PWRCOM = ?
+	 * PWRCTRL = ?
+	 * BDR = ?
+	 */
+	reg_val = ((0 << EPDC_GPIO_PWRCTRL_OFFSET) & EPDC_GPIO_PWRCTRL_MASK)
+	    | ((0 << EPDC_GPIO_BDR_OFFSET) & EPDC_GPIO_BDR_MASK);
+	epdc_write(priv, EPDC_GPIO, reg_val);
+
+	epdc_write(priv, EPDC_WVADDR, priv->waveform_buffer_phys);
+	epdc_write(priv, EPDC_WB_ADDR, priv->working_buffer_phys);
+	if (priv->rev >= 30)
+		epdc_write(priv, EPDC_WB_ADDR_TCE_V3,
+			   priv->working_buffer_phys);
+	else
+		epdc_write(priv, EPDC_WB_ADDR_TCE,
+			   priv->working_buffer_phys);
+
+	/* Disable clock */
+	clk_disable_unprepare(priv->epdc_clk_axi);
+	clk_disable_unprepare(priv->epdc_clk_pix);
+}
+
+void mxc_epdc_init_sequence(struct mxc_epdc *priv, struct drm_display_mode *m)
+{
+	/* Initialize EPDC, passing pointer to EPDC registers */
+	struct clk *epdc_parent;
+	unsigned long rounded_parent_rate, epdc_pix_rate,
+			rounded_pix_clk, target_pix_clk;
+
+	/* Enable pix clk for EPDC */
+	clk_prepare_enable(priv->epdc_clk_axi);
+
+	target_pix_clk = m->clock * 1000;
+	rounded_pix_clk = clk_round_rate(priv->epdc_clk_pix, target_pix_clk);
+
+	if (((rounded_pix_clk >= target_pix_clk + target_pix_clk/100) ||
+		(rounded_pix_clk <= target_pix_clk - target_pix_clk/100))) {
+		/* Can't get close enough without changing parent clk */
+		epdc_parent = clk_get_parent(priv->epdc_clk_pix);
+		rounded_parent_rate = clk_round_rate(epdc_parent, target_pix_clk);
+
+		epdc_pix_rate = target_pix_clk;
+		while (epdc_pix_rate < rounded_parent_rate)
+			epdc_pix_rate *= 2;
+		clk_set_rate(epdc_parent, epdc_pix_rate);
+
+		rounded_pix_clk = clk_round_rate(priv->epdc_clk_pix, target_pix_clk);
+		if (((rounded_pix_clk >= target_pix_clk + target_pix_clk/100) ||
+			(rounded_pix_clk <= target_pix_clk - target_pix_clk/100)))
+			/* Still can't get a good clock, provide warning */
+			dev_err(priv->drm.dev,
+				"Unable to get an accurate EPDC pix clk desired = %lu, actual = %lu\n",
+				target_pix_clk,
+				rounded_pix_clk);
+	}
+
+	clk_set_rate(priv->epdc_clk_pix, rounded_pix_clk);
+	clk_prepare_enable(priv->epdc_clk_pix);
+
+	epdc_init_settings(priv, m);
+
+	priv->in_init = true;
+	mxc_epdc_powerup(priv);
+	/* Force power down event */
+	priv->powering_down = true;
+	mxc_epdc_powerdown(priv);
+	priv->updates_active = false;
+
+	/* Disable clocks */
+	clk_disable_unprepare(priv->epdc_clk_axi);
+	clk_disable_unprepare(priv->epdc_clk_pix);
+	priv->hw_ready = true;
+	priv->hw_initializing = false;
+
+}
+
+int mxc_epdc_init_hw(struct mxc_epdc *priv)
+{
+	struct pinctrl *pinctrl;
+	const char *thermal = NULL;
+	u32 val;
+
+	/* get pmic regulators */
+	priv->display_regulator = devm_regulator_get(priv->drm.dev, "DISPLAY");
+	if (IS_ERR(priv->display_regulator))
+		return dev_err_probe(priv->drm.dev, PTR_ERR(priv->display_regulator),
+				     "Unable to get display PMIC regulator\n");
+
+	priv->vcom_regulator = devm_regulator_get(priv->drm.dev, "VCOM");
+	if (IS_ERR(priv->vcom_regulator))
+		return dev_err_probe(priv->drm.dev, PTR_ERR(priv->vcom_regulator),
+				     "Unable to get VCOM regulator\n");
+
+	priv->v3p3_regulator = devm_regulator_get(priv->drm.dev, "V3P3");
+	if (IS_ERR(priv->v3p3_regulator))
+		return dev_err_probe(priv->drm.dev, PTR_ERR(priv->v3p3_regulator),
+				     "Unable to get V3P3 regulator\n");
+
+	of_property_read_string(priv->drm.dev->of_node,
+				"epd-thermal-zone", &thermal);
+	if (thermal) {
+		priv->thermal = thermal_zone_get_zone_by_name(thermal);
+		if (IS_ERR(priv->thermal))
+			return dev_err_probe(priv->drm.dev, PTR_ERR(priv->thermal),
+					     "unable to get thermal");
+	}
+	priv->iobase = devm_platform_get_and_ioremap_resource(to_platform_device(priv->drm.dev),
+							      0, NULL);
+	if (priv->iobase == NULL)
+		return -ENOMEM;
+
+	priv->epdc_clk_axi = devm_clk_get(priv->drm.dev, "axi");
+	if (IS_ERR(priv->epdc_clk_axi))
+		return dev_err_probe(priv->drm.dev, PTR_ERR(priv->epdc_clk_axi),
+				     "Unable to get EPDC AXI clk\n");
+
+	priv->epdc_clk_pix = devm_clk_get(priv->drm.dev, "pix");
+	if (IS_ERR(priv->epdc_clk_pix))
+		return dev_err_probe(priv->drm.dev, PTR_ERR(priv->epdc_clk_pix),
+				     "Unable to get EPDC pix clk\n");
+
+	clk_prepare_enable(priv->epdc_clk_axi);
+	val = epdc_read(priv, EPDC_VERSION);
+	clk_disable_unprepare(priv->epdc_clk_axi);
+	priv->rev = ((val & EPDC_VERSION_MAJOR_MASK) >>
+				EPDC_VERSION_MAJOR_OFFSET) * 10
+			+ ((val & EPDC_VERSION_MINOR_MASK) >>
+				EPDC_VERSION_MINOR_OFFSET);
+	dev_dbg(priv->drm.dev, "EPDC version = %d\n", priv->rev);
+
+	if (priv->rev <= 20) {
+		dev_err(priv->drm.dev, "Unsupported version (%d)\n", priv->rev);
+		return -ENODEV;
+	}
+
+	/* Initialize EPDC pins */
+	pinctrl = devm_pinctrl_get_select_default(priv->drm.dev);
+	if (IS_ERR(pinctrl)) {
+		dev_err(priv->drm.dev, "can't get/select pinctrl\n");
+		return PTR_ERR(pinctrl);
+	}
+
+	mutex_init(&priv->power_mutex);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/mxc-epdc/epdc_hw.h b/drivers/gpu/drm/mxc-epdc/epdc_hw.h
new file mode 100644
index 000000000000..dbf1f0d1e23e
--- /dev/null
+++ b/drivers/gpu/drm/mxc-epdc/epdc_hw.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/* Copyright (C) 2022 Andreas Kemnade */
+void mxc_epdc_init_sequence(struct mxc_epdc *priv, struct drm_display_mode *m);
+int mxc_epdc_init_hw(struct mxc_epdc *priv);
+
+void mxc_epdc_powerup(struct mxc_epdc *priv);
+void mxc_epdc_powerdown(struct mxc_epdc *priv);
+
diff --git a/drivers/gpu/drm/mxc-epdc/epdc_waveform.c b/drivers/gpu/drm/mxc-epdc/epdc_waveform.c
new file mode 100644
index 000000000000..4f2f199722d5
--- /dev/null
+++ b/drivers/gpu/drm/mxc-epdc/epdc_waveform.c
@@ -0,0 +1,189 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (C) 2022 Andreas Kemnade
+//
+/*
+ * based on the EPDC framebuffer driver
+ * Copyright (C) 2010-2016 Freescale Semiconductor, Inc.
+ * Copyright 2017 NXP
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/dma-mapping.h>
+#include "mxc_epdc.h"
+
+#define DEFAULT_TEMP_INDEX      0
+#define DEFAULT_TEMP            20 /* room temp in deg Celsius */
+
+struct waveform_data_header {
+	unsigned int wi0;
+	unsigned int wi1;
+	unsigned int wi2;
+	unsigned int wi3;
+	unsigned int wi4;
+	unsigned int wi5;
+	unsigned int wi6;
+	unsigned int xwia:24;
+	unsigned int cs1:8;
+	unsigned int wmta:24;
+	unsigned int fvsn:8;
+	unsigned int luts:8;
+	unsigned int mc:8;
+	unsigned int trc:8;
+	unsigned int reserved0_0:8;
+	unsigned int eb:8;
+	unsigned int sb:8;
+	unsigned int reserved0_1:8;
+	unsigned int reserved0_2:8;
+	unsigned int reserved0_3:8;
+	unsigned int reserved0_4:8;
+	unsigned int reserved0_5:8;
+	unsigned int cs2:8;
+};
+
+struct mxcfb_waveform_data_file {
+	struct waveform_data_header wdh;
+	u32 *data;      /* Temperature Range Table + Waveform Data */
+};
+
+void mxc_epdc_set_update_waveform(struct mxc_epdc *priv,
+				  struct mxcfb_waveform_modes *wv_modes)
+{
+	u32 val;
+
+	/* Configure the auto-waveform look-up table based on waveform modes */
+
+	/* Entry 1 = DU, 2 = GC4, 3 = GC8, etc. */
+	val = (wv_modes->mode_du << EPDC_AUTOWV_LUT_DATA_OFFSET) |
+		(0 << EPDC_AUTOWV_LUT_ADDR_OFFSET);
+	epdc_write(priv, EPDC_AUTOWV_LUT, val);
+	val = (wv_modes->mode_du << EPDC_AUTOWV_LUT_DATA_OFFSET) |
+		(1 << EPDC_AUTOWV_LUT_ADDR_OFFSET);
+	epdc_write(priv, EPDC_AUTOWV_LUT, val);
+	val = (wv_modes->mode_gc4 << EPDC_AUTOWV_LUT_DATA_OFFSET) |
+		(2 << EPDC_AUTOWV_LUT_ADDR_OFFSET);
+	epdc_write(priv, EPDC_AUTOWV_LUT, val);
+	val = (wv_modes->mode_gc8 << EPDC_AUTOWV_LUT_DATA_OFFSET) |
+		(3 << EPDC_AUTOWV_LUT_ADDR_OFFSET);
+	epdc_write(priv, EPDC_AUTOWV_LUT, val);
+	val = (wv_modes->mode_gc16 << EPDC_AUTOWV_LUT_DATA_OFFSET) |
+		(4 << EPDC_AUTOWV_LUT_ADDR_OFFSET);
+	epdc_write(priv, EPDC_AUTOWV_LUT, val);
+	val = (wv_modes->mode_gc32 << EPDC_AUTOWV_LUT_DATA_OFFSET) |
+		(5 << EPDC_AUTOWV_LUT_ADDR_OFFSET);
+	epdc_write(priv, EPDC_AUTOWV_LUT, val);
+}
+
+int mxc_epdc_fb_get_temp_index(struct mxc_epdc *priv, int temp)
+{
+	int i;
+	int index = -1;
+
+	if (temp == TEMP_USE_AMBIENT) {
+		if (priv->thermal) {
+			if (thermal_zone_get_temp(priv->thermal, &temp)) {
+				dev_err(priv->drm.dev,
+					"reading temperature failed");
+				return DEFAULT_TEMP_INDEX;
+			}
+			temp /= 1000;
+		} else
+			temp = DEFAULT_TEMP;
+	}
+
+	if (priv->trt_entries == 0) {
+		dev_err(priv->drm.dev,
+			"No TRT exists...using default temp index\n");
+		return DEFAULT_TEMP_INDEX;
+	}
+
+	/* Search temperature ranges for a match */
+	for (i = 0; i < priv->trt_entries - 1; i++) {
+		if ((temp >= priv->temp_range_bounds[i])
+			&& (temp < priv->temp_range_bounds[i+1])) {
+			index = i;
+			break;
+		}
+	}
+
+	if (index < 0) {
+		dev_err(priv->drm.dev,
+			"No TRT index match...using lowest/highest\n");
+		if (temp < priv->temp_range_bounds[0]) {
+			dev_dbg(priv->drm.dev, "temperature < minimum range\n");
+			return 0;
+		}
+
+		if (temp >= priv->temp_range_bounds[priv->trt_entries-1]) {
+			dev_dbg(priv->drm.dev, "temperature >= maximum range\n");
+			return priv->trt_entries-1;
+		}
+
+		return DEFAULT_TEMP_INDEX;
+	}
+
+	dev_dbg(priv->drm.dev, "Using temperature index %d\n", index);
+
+	return index;
+}
+
+
+
+int mxc_epdc_prepare_waveform(struct mxc_epdc *priv,
+			      const u8 *data, size_t size)
+{
+	const struct mxcfb_waveform_data_file *wv_file;
+	int wv_data_offs;
+	int i;
+
+	priv->wv_modes.mode_init = 0;
+	priv->wv_modes.mode_du = 1;
+	priv->wv_modes.mode_gc4 = 3;
+	priv->wv_modes.mode_gc8 = 2;
+	priv->wv_modes.mode_gc16 = 2;
+	priv->wv_modes.mode_gc32 = 2;
+	priv->wv_modes_update = true;
+
+	wv_file = (struct mxcfb_waveform_data_file *)data;
+
+	/* Get size and allocate temperature range table */
+	priv->trt_entries = wv_file->wdh.trc + 1;
+	priv->temp_range_bounds = devm_kzalloc(priv->drm.dev, priv->trt_entries, GFP_KERNEL);
+
+	for (i = 0; i < priv->trt_entries; i++)
+		dev_dbg(priv->drm.dev, "trt entry #%d = 0x%x\n", i, *((u8 *)&wv_file->data + i));
+
+	/* Copy TRT data */
+	memcpy(priv->temp_range_bounds, &wv_file->data, priv->trt_entries);
+
+	/* Set default temperature index using TRT and room temp */
+	priv->temp_index = mxc_epdc_fb_get_temp_index(priv, DEFAULT_TEMP);
+
+	/* Get offset and size for waveform data */
+	wv_data_offs = sizeof(wv_file->wdh) + priv->trt_entries + 1;
+	priv->waveform_buffer_size = size - wv_data_offs;
+
+	/* Allocate memory for waveform data */
+	priv->waveform_buffer_virt = dmam_alloc_coherent(priv->drm.dev,
+						priv->waveform_buffer_size,
+						&priv->waveform_buffer_phys,
+						GFP_DMA | GFP_KERNEL);
+	if (priv->waveform_buffer_virt == NULL) {
+		dev_err(priv->drm.dev, "Can't allocate mem for waveform!\n");
+		return -ENOMEM;
+	}
+
+	memcpy(priv->waveform_buffer_virt, (u8 *)(data) + wv_data_offs,
+		priv->waveform_buffer_size);
+
+	/* Read field to determine if 4-bit or 5-bit mode */
+	if ((wv_file->wdh.luts & 0xC) == 0x4)
+		priv->buf_pix_fmt = EPDC_FORMAT_BUF_PIXEL_FORMAT_P5N;
+	else
+		priv->buf_pix_fmt = EPDC_FORMAT_BUF_PIXEL_FORMAT_P4N;
+
+	dev_info(priv->drm.dev, "EPDC pix format: %x\n",
+		 priv->buf_pix_fmt);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/mxc-epdc/epdc_waveform.h b/drivers/gpu/drm/mxc-epdc/epdc_waveform.h
new file mode 100644
index 000000000000..c5c461b975cb
--- /dev/null
+++ b/drivers/gpu/drm/mxc-epdc/epdc_waveform.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/* Copyright (C) 2022 Andreas Kemnade */
+int mxc_epdc_fb_get_temp_index(struct mxc_epdc *priv, int temp);
+int mxc_epdc_prepare_waveform(struct mxc_epdc *priv,
+			      const u8 *waveform, size_t size);
+void mxc_epdc_set_update_waveform(struct mxc_epdc *priv,
+				  struct mxcfb_waveform_modes *wv_modes);
diff --git a/drivers/gpu/drm/mxc-epdc/mxc_epdc.h b/drivers/gpu/drm/mxc-epdc/mxc_epdc.h
index c5f5280b574f..f7b1cbc4cc4e 100644
--- a/drivers/gpu/drm/mxc-epdc/mxc_epdc.h
+++ b/drivers/gpu/drm/mxc-epdc/mxc_epdc.h
@@ -8,6 +8,32 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_simple_kms_helper.h>
+#include <linux/thermal.h>
+#include "epdc_regs.h"
+
+#define TEMP_USE_AMBIENT			0x1000
+
+struct mxcfb_waveform_modes {
+	int mode_init;
+	int mode_du;
+	int mode_gc4;
+	int mode_gc8;
+	int mode_gc16;
+	int mode_gc32;
+};
+
+struct imx_epdc_fb_mode {
+	u32 vscan_holdoff;
+	u32 sdoed_width;
+	u32 sdoed_delay;
+	u32 sdoez_width;
+	u32 sdoez_delay;
+	u32 gdclk_hp_offs;
+	u32 gdsp_offs;
+	u32 gdoe_offs;
+	u32 gdclk_offs;
+	u32 num_ce;
+};
 
 struct clk;
 struct regulator;
@@ -16,5 +42,60 @@ struct mxc_epdc {
 	struct drm_simple_display_pipe pipe;
 	struct drm_connector connector;
 	struct display_timing timing;
+	struct imx_epdc_fb_mode imx_mode;
+	void __iomem *iobase;
+	struct completion powerdown_compl;
+	struct clk *epdc_clk_axi;
+	struct clk *epdc_clk_pix;
+	struct regulator *display_regulator;
+	struct regulator *vcom_regulator;
+	struct regulator *v3p3_regulator;
+	struct thermal_zone_device *thermal;
+	int rev;
+
+	dma_addr_t epdc_mem_phys;
+	void *epdc_mem_virt;
+	int epdc_mem_width;
+	int epdc_mem_height;
+	u32 *working_buffer_virt;
+	dma_addr_t working_buffer_phys;
+	u32 working_buffer_size;
+
+	/* waveform related stuff */
+	int trt_entries;
+	int temp_index;
+	u8 *temp_range_bounds;
+	int buf_pix_fmt;
+	struct mxcfb_waveform_modes wv_modes;
+	bool wv_modes_update;
+	u32 *waveform_buffer_virt;
+	dma_addr_t waveform_buffer_phys;
+	u32 waveform_buffer_size;
+
+	struct mutex power_mutex;
+	bool powered;
+	bool powering_down;
+	bool updates_active;
+	int wait_for_powerdown;
+	int pwrdown_delay;
+
+	/* elements related to EPDC updates */
+	int num_luts;
+	int max_num_updates;
+	bool in_init;
+	bool hw_ready;
+	bool hw_initializing;
+	bool waiting_for_idle;
+
 };
 
+static inline u32 epdc_read(struct mxc_epdc *priv, u32 reg)
+{
+	return readl(priv->iobase + reg);
+}
+
+static inline void epdc_write(struct mxc_epdc *priv, u32 reg, u32 data)
+{
+	writel(data, priv->iobase + reg);
+}
+
diff --git a/drivers/gpu/drm/mxc-epdc/mxc_epdc_drv.c b/drivers/gpu/drm/mxc-epdc/mxc_epdc_drv.c
index c0b0a3bcdb57..4810e5c5bc6e 100644
--- a/drivers/gpu/drm/mxc-epdc/mxc_epdc_drv.c
+++ b/drivers/gpu/drm/mxc-epdc/mxc_epdc_drv.c
@@ -25,6 +25,8 @@
 #include <drm/drm_prime.h>
 #include <drm/drm_probe_helper.h>
 #include "mxc_epdc.h"
+#include "epdc_hw.h"
+#include "epdc_waveform.h"
 
 #define DRIVER_NAME "mxc_epdc"
 #define DRIVER_DESC "IMX EPDC"
@@ -122,6 +124,57 @@ int mxc_epdc_output(struct drm_device *drm)
 				 DRM_MODE_CONNECTOR_Unknown);
 	if (ret)
 		return ret;
+
+	ret = of_property_read_u32(drm->dev->of_node, "vscan-holdoff",
+				   &priv->imx_mode.vscan_holdoff);
+	if (ret)
+		return ret;
+
+	ret = of_property_read_u32(drm->dev->of_node, "sdoed-width",
+				   &priv->imx_mode.sdoed_width);
+	if (ret)
+		return ret;
+
+	ret = of_property_read_u32(drm->dev->of_node, "sdoed-delay",
+				   &priv->imx_mode.sdoed_delay);
+	if (ret)
+		return ret;
+
+	ret = of_property_read_u32(drm->dev->of_node, "sdoez-width",
+				   &priv->imx_mode.sdoez_width);
+	if (ret)
+		return ret;
+
+	ret = of_property_read_u32(drm->dev->of_node, "sdoez-delay",
+				   &priv->imx_mode.sdoez_delay);
+	if (ret)
+		return ret;
+
+	ret = of_property_read_u32(drm->dev->of_node, "gdclk-hp-offs",
+				   &priv->imx_mode.gdclk_hp_offs);
+	if (ret)
+		return ret;
+
+	ret = of_property_read_u32(drm->dev->of_node, "gdsp-offs",
+				   &priv->imx_mode.gdsp_offs);
+	if (ret)
+		return ret;
+
+	ret = of_property_read_u32(drm->dev->of_node, "gdoe-offs",
+				   &priv->imx_mode.gdoe_offs);
+	if (ret)
+		return ret;
+
+	ret = of_property_read_u32(drm->dev->of_node, "gdclk-offs",
+				   &priv->imx_mode.gdclk_offs);
+	if (ret)
+		return ret;
+
+	ret = of_property_read_u32(drm->dev->of_node, "num-ce",
+				   &priv->imx_mode.num_ce);
+	if (ret)
+		return ret;
+
 	ret = of_get_display_timing(drm->dev->of_node, "timing", &priv->timing);
 	if (ret)
 		return ret;
@@ -137,6 +190,20 @@ static void mxc_epdc_pipe_enable(struct drm_simple_display_pipe *pipe,
 	struct drm_display_mode *m = &pipe->crtc.state->adjusted_mode;
 
 	dev_info(priv->drm.dev, "Mode: %d x %d\n", m->hdisplay, m->vdisplay);
+	priv->epdc_mem_width = m->hdisplay;
+	priv->epdc_mem_height = m->vdisplay;
+	priv->epdc_mem_virt = dma_alloc_wc(priv->drm.dev,
+					   m->hdisplay * m->vdisplay,
+					   &priv->epdc_mem_phys, GFP_DMA | GFP_KERNEL);
+	priv->working_buffer_size = m->hdisplay * m->vdisplay * 2;
+	priv->working_buffer_virt =
+		dma_alloc_coherent(priv->drm.dev,
+				   priv->working_buffer_size,
+				   &priv->working_buffer_phys,
+				   GFP_DMA | GFP_KERNEL);
+
+	if (priv->working_buffer_virt && priv->epdc_mem_virt)
+		mxc_epdc_init_sequence(priv, m);
 }
 
 static void mxc_epdc_pipe_disable(struct drm_simple_display_pipe *pipe)
@@ -144,6 +211,19 @@ static void mxc_epdc_pipe_disable(struct drm_simple_display_pipe *pipe)
 	struct mxc_epdc *priv = drm_pipe_to_mxc_epdc(pipe);
 
 	dev_dbg(priv->drm.dev, "pipe disable\n");
+
+	if (priv->epdc_mem_virt) {
+		dma_free_wc(priv->drm.dev, priv->epdc_mem_width * priv->epdc_mem_height,
+			    priv->epdc_mem_virt, priv->epdc_mem_phys);
+		priv->epdc_mem_virt = NULL;
+	}
+
+	if (priv->working_buffer_virt) {
+		dma_free_wc(priv->drm.dev, priv->working_buffer_size,
+			    priv->working_buffer_virt,
+			    priv->working_buffer_phys);
+		priv->working_buffer_virt = NULL;
+	}
 }
 
 static void mxc_epdc_pipe_update(struct drm_simple_display_pipe *pipe,
@@ -187,6 +267,7 @@ static struct drm_driver mxc_epdc_driver = {
 static int mxc_epdc_probe(struct platform_device *pdev)
 {
 	struct mxc_epdc *priv;
+	const struct firmware *firmware;
 	int ret;
 
 	priv = devm_drm_dev_alloc(&pdev->dev, &mxc_epdc_driver, struct mxc_epdc, drm);
@@ -195,6 +276,19 @@ static int mxc_epdc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, priv);
 
+	ret = mxc_epdc_init_hw(priv);
+	if (ret)
+		return ret;
+
+	ret = request_firmware(&firmware, "imx/epdc/epdc.fw", priv->drm.dev);
+	if (ret)
+		return ret;
+
+	ret = mxc_epdc_prepare_waveform(priv, firmware->data, firmware->size);
+	release_firmware(firmware);
+	if (ret)
+		return ret;
+
 	mxc_epdc_setup_mode_config(&priv->drm);
 
 	ret = mxc_epdc_output(&priv->drm);
-- 
2.30.2

