Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF509311D6
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 11:58:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C8B910E31C;
	Mon, 15 Jul 2024 09:58:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="oiKtljGE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 213F510E31C
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 09:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1721037510; x=1752573510;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7tuZlXiYnik21gWdnh+Ko3vaG08naB71m+TmE0iPu2A=;
 b=oiKtljGEs42+pXmYpBb/nIWcFdgxP8GKJK0gTt/Ljtlun00GF7yamqjx
 Jhu4pfHjjlollm6VuhorS8TQS4dUhUXuNe9Gs+3NSdBhRMgJbNjM0ICmj
 25920t/q5kkm6qZWny2zO2xS1g8IUV63u+pRehTePIt8VOGpsFMntL6cc
 0J8pgwliVrJFfr5yFIkc3adeeA5N3XHzCbCV7MQ152T+cHhXJXaYrJnlZ
 VufcBYgL8UWZFyzhxny6d5cxlIUbA+7DJUcczyKTRGlU/bz85R3Qy5DIN
 IXAmQ7aOlc2ALQpyzk+u1N+UQ9XUfNB9QU0p3p08qHMO9/HV4run6Tbe5 Q==;
X-CSE-ConnectionGUID: J1GDDvyAS1e0dCw8Izmz8Q==
X-CSE-MsgGUID: Bx2miPLxT4S4VDGG1e+nRA==
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="29237626"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Jul 2024 02:58:29 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Jul 2024 02:58:14 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 15 Jul 2024 02:58:03 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <linux@armlinux.org.uk>,
 <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>, <arnd@arndb.de>, <Jason@zx2c4.com>,
 <rdunlap@infradead.org>, <akpm@linux-foundation.org>,
 <geert+renesas@glider.be>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
CC: <manikandan.m@microchip.com>, <Hari.PrasathGE@microchip.com>,
 <Nicolas.Ferre@microchip.com>
Subject: [PATCH v2 2/4] drm/bridge: add Microchip DSI controller support for
 sam9x7 SoC series
Date: Mon, 15 Jul 2024 15:27:34 +0530
Message-ID: <20240715095736.618246-3-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240715095736.618246-1-manikandan.m@microchip.com>
References: <20240715095736.618246-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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

Add the Microchip's DSI controller wrapper driver that uses
the Synopsys DesignWare MIPI DSI host controller bridge.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
changes in v2:
- use static const with global variables
- replace dev_err with dev_err_probe
- move clk_prepare_enable to simplify the error path
- use FIELD_PREP calls
- remove unused macros and unused functions
- rename function name with mchp_ suffix
- add suspend and resume pm calls to handle pllref_clk
---
 drivers/gpu/drm/bridge/Kconfig            |   8 +
 drivers/gpu/drm/bridge/Makefile           |   1 +
 drivers/gpu/drm/bridge/dw-mipi-dsi-mchp.c | 546 ++++++++++++++++++++++
 3 files changed, 555 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/dw-mipi-dsi-mchp.c

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index c621be1a99a8..459ad9768234 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -196,6 +196,14 @@ config DRM_MICROCHIP_LVDS_SERIALIZER
 	help
 	  Support for Microchip's LVDS serializer.
 
+config DRM_MICROCHIP_DW_MIPI_DSI
+	tristate "Microchip specific extensions for Synopsys DW MIPI DSI"
+	depends on DRM_ATMEL_HLCDC
+	select DRM_DW_MIPI_DSI
+	help
+	  This selects support for Microchip's SoC specific extensions
+	  for the Synopsys DesignWare dsi driver.
+
 config DRM_NWL_MIPI_DSI
 	tristate "Northwest Logic MIPI DSI Host controller"
 	depends on DRM
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index 7df87b582dca..aff5052100b9 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -14,6 +14,7 @@ obj-$(CONFIG_DRM_LONTIUM_LT9611UXC) += lontium-lt9611uxc.o
 obj-$(CONFIG_DRM_LVDS_CODEC) += lvds-codec.o
 obj-$(CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW) += megachips-stdpxxxx-ge-b850v3-fw.o
 obj-$(CONFIG_DRM_MICROCHIP_LVDS_SERIALIZER) += microchip-lvds.o
+obj-$(CONFIG_DRM_MICROCHIP_DW_MIPI_DSI) += dw-mipi-dsi-mchp.o
 obj-$(CONFIG_DRM_NXP_PTN3460) += nxp-ptn3460.o
 obj-$(CONFIG_DRM_PARADE_PS8622) += parade-ps8622.o
 obj-$(CONFIG_DRM_PARADE_PS8640) += parade-ps8640.o
diff --git a/drivers/gpu/drm/bridge/dw-mipi-dsi-mchp.c b/drivers/gpu/drm/bridge/dw-mipi-dsi-mchp.c
new file mode 100644
index 000000000000..4f397296e5e0
--- /dev/null
+++ b/drivers/gpu/drm/bridge/dw-mipi-dsi-mchp.c
@@ -0,0 +1,546 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2024 Microchip Technology Inc. and its subsidiaries
+ *
+ * Author: Manikandan Muralidharan <manikandan.m@microchip.com>
+ *
+ */
+
+#include <drm/bridge/dw_mipi_dsi.h>
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_print.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/mfd/syscon.h>
+#include <linux/mod_devicetable.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#define DSI_PLL_REF_CLK			24000000
+
+#define DSI_PWR_UP			0x04
+#define HOST_RESET			BIT(0)
+#define HOST_PWRUP			0
+
+#define DSI_PHY_RSTZ			0xa0
+#define PHY_SHUTDOWNZ			0
+
+#define DSI_PHY_TST_CTRL0		0xb4
+#define PHY_TESTCLK			BIT(1)
+#define PHY_UNTESTCLK			0
+#define PHY_UNTESTCLR			0
+
+#define DSI_PHY_TST_CTRL1		0xb8
+#define PHY_TESTEN			BIT(16)
+#define PHY_UNTESTEN			0
+#define PHY_TESTDOUT_MASK		GENMASK(15, 8)
+#define PHY_TESTDIN_MASK		GENMASK(7, 0)
+
+#define BYPASS_VCO_RANGE		BIT(7)
+#define VCO_RANGE_CON_SEL_MASK		GENMASK(5, 3)
+#define VCO_IN_CAP_CON_LOW		BIT(1)
+
+#define CP_CURRENT_0			0x2
+#define CP_CURRENT_1			0x4
+#define CP_CURRENT_2			0x5
+#define CP_CURRENT_3			0x6
+#define CP_CURRENT_4			0x7
+#define CP_CURRENT_5			0x8
+#define CP_CURRENT_6			0xc
+#define CP_CURRENT_SEL_MASK		GENMASK(3, 0)
+#define CP_PROGRAM_EN			BIT(7)
+
+#define LPF_RESISTORS_15_6KOHM		0x1
+#define LPF_RESISTORS_14_4KOHM		0x4
+#define LPF_RESISTORS_12_8KOHM		0x8
+#define LPF_RESISTORS_11_4KOHM		0x10
+#define LPF_PROGRAM_EN			BIT(6)
+#define LPF_RESISTORS_SEL_MASK		GENMASK(5, 0)
+
+#define INPUT_DIVIDER(val)		(((val) - 1) & 0x7f)
+#define LOW_PROGRAM_EN			0
+#define HIGH_PROGRAM_EN			BIT(7)
+#define LOOP_DIV_LOW_SEL(val)		(((val) - 1) & 0x1f)
+#define LOOP_DIV_HIGH_SEL(val)		((((val) - 1) >> 5) & 0xf)
+#define PLL_LOOP_DIV_EN			BIT(5)
+#define PLL_INPUT_DIV_EN		BIT(4)
+
+#define PLL_BIAS_CUR_SEL_CAP_VCO_CONTROL		0x10
+#define PLL_CP_CONTROL_PLL_LOCK_BYPASS			0x11
+#define PLL_LPF_AND_CP_CONTROL				0x12
+#define PLL_INPUT_DIVIDER_RATIO				0x17
+#define PLL_LOOP_DIVIDER_RATIO				0x18
+#define PLL_INPUT_AND_LOOP_DIVIDER_RATIOS_CONTROL	0x19
+
+#define SFR_ISS_CFG			0x240
+#define ISS_CFG_DSI_MODE		1
+
+struct dw_mipi_dsi_mchp_chip_data {
+	const struct dw_mipi_dsi_phy_ops *phy_ops;
+	unsigned int max_data_lanes;
+};
+
+struct dw_mipi_dsi_mchp {
+	struct device *dev;
+	void __iomem *base;
+	struct dw_mipi_dsi *dsi;
+	struct clk *pllref_clk;
+	struct dw_mipi_dsi_plat_data pdata;
+
+	/* For PLL config */
+	unsigned int lane_mbps;
+	u16 input_div;
+	u16 feedback_div;
+	u32 format;
+};
+
+struct dphy_pll_parameter_map {
+	unsigned int max_mbps;
+	u8 hsfreqrange;
+	u8 icpctrl;
+	u8 lpfctrl;
+};
+
+static const struct dphy_pll_parameter_map dppa_map[] = {
+	{  89, 0x00, CP_CURRENT_1, LPF_RESISTORS_11_4KOHM },
+	{  99, 0x20, CP_CURRENT_1, LPF_RESISTORS_11_4KOHM },
+	{ 109, 0x40, CP_CURRENT_1, LPF_RESISTORS_11_4KOHM },
+	{ 129, 0x02, CP_CURRENT_5, LPF_RESISTORS_12_8KOHM },
+	{ 139, 0x22, CP_CURRENT_5, LPF_RESISTORS_12_8KOHM },
+	{ 149, 0x42, CP_CURRENT_5, LPF_RESISTORS_12_8KOHM },
+	{ 169, 0x04, CP_CURRENT_6, LPF_RESISTORS_12_8KOHM },
+	{ 179, 0x24, CP_CURRENT_6, LPF_RESISTORS_12_8KOHM },
+	{ 199, 0x44, CP_CURRENT_6, LPF_RESISTORS_12_8KOHM },
+	{ 219, 0x06, CP_CURRENT_6, LPF_RESISTORS_12_8KOHM },
+	{ 239, 0x26, CP_CURRENT_6, LPF_RESISTORS_12_8KOHM },
+	{ 249, 0x46, CP_CURRENT_6, LPF_RESISTORS_12_8KOHM },
+	{ 269, 0x08, CP_CURRENT_0, LPF_RESISTORS_12_8KOHM },
+	{ 299, 0x28, CP_CURRENT_0, LPF_RESISTORS_12_8KOHM },
+	{ 329, 0x0a, CP_CURRENT_2, LPF_RESISTORS_12_8KOHM },
+	{ 359, 0x2a, CP_CURRENT_2, LPF_RESISTORS_12_8KOHM },
+	{ 399, 0x4a, CP_CURRENT_2, LPF_RESISTORS_12_8KOHM },
+	{ 449, 0x0C, CP_CURRENT_2, LPF_RESISTORS_15_6KOHM },
+	{ 499, 0x2c, CP_CURRENT_2, LPF_RESISTORS_15_6KOHM },
+	{ 549, 0x0e, CP_CURRENT_3, LPF_RESISTORS_11_4KOHM },
+	{ 599, 0x2e, CP_CURRENT_3, LPF_RESISTORS_11_4KOHM },
+	{ 649, 0x10, CP_CURRENT_3, LPF_RESISTORS_14_4KOHM },
+	{ 699, 0x30, CP_CURRENT_3, LPF_RESISTORS_14_4KOHM },
+	{ 749, 0x12, CP_CURRENT_3, LPF_RESISTORS_14_4KOHM },
+	{ 799, 0x32, CP_CURRENT_3, LPF_RESISTORS_14_4KOHM },
+	{ 849, 0x52, CP_CURRENT_3, LPF_RESISTORS_14_4KOHM },
+	{ 899, 0x72, CP_CURRENT_3, LPF_RESISTORS_14_4KOHM },
+	{ 949, 0x14, CP_CURRENT_4, LPF_RESISTORS_11_4KOHM },
+	{1000, 0x34, CP_CURRENT_4, LPF_RESISTORS_11_4KOHM }
+};
+
+struct hstt {
+	unsigned int maxfreq;
+	struct dw_mipi_dsi_dphy_timing timing;
+};
+
+#define HSTT(_maxfreq, _c_lp2hs, _c_hs2lp, _d_lp2hs, _d_hs2lp)	\
+{					\
+	.maxfreq = _maxfreq,		\
+	.timing = {			\
+		.clk_lp2hs = _c_lp2hs,	\
+		.clk_hs2lp = _c_hs2lp,	\
+		.data_lp2hs = _d_lp2hs,	\
+		.data_hs2lp = _d_hs2lp,	\
+	}				\
+}
+
+static const struct hstt hstt_table[] = {
+	HSTT(90,  32, 20,  26, 13),
+	HSTT(100,  35, 23,  28, 14),
+	HSTT(110,  32, 22,  26, 13),
+	HSTT(130,  31, 20,  27, 13),
+	HSTT(140,  33, 22,  26, 14),
+	HSTT(150,  33, 21,  26, 14),
+	HSTT(170,  32, 20,  27, 13),
+	HSTT(180,  36, 23,  30, 15),
+	HSTT(200,  40, 22,  33, 15),
+	HSTT(220,  40, 22,  33, 15),
+	HSTT(240,  44, 24,  36, 16),
+	HSTT(250,  48, 24,  38, 17),
+	HSTT(270,  48, 24,  38, 17),
+	HSTT(300,  50, 27,  41, 18),
+	HSTT(330,  56, 28,  45, 18),
+	HSTT(360,  59, 28,  48, 19),
+	HSTT(400,  61, 30,  50, 20),
+	HSTT(450,  67, 31,  55, 21),
+	HSTT(500,  73, 31,  59, 22),
+	HSTT(550,  79, 36,  63, 24),
+	HSTT(600,  83, 37,  68, 25),
+	HSTT(650,  90, 38,  73, 27),
+	HSTT(700,  95, 40,  77, 28),
+	HSTT(750, 102, 40,  84, 28),
+	HSTT(800, 106, 42,  87, 30),
+	HSTT(850, 113, 44,  93, 31),
+	HSTT(900, 118, 47,  98, 32),
+	HSTT(950, 124, 47, 102, 34),
+	HSTT(1000, 130, 49, 107, 35),
+};
+
+static int mchp_max_mbps_to_parameter(unsigned int max_mbps)
+{
+	for (int index = 0; index < ARRAY_SIZE(dppa_map); index++)
+		if (dppa_map[index].max_mbps >= max_mbps)
+			return index;
+
+	return -EINVAL;
+}
+
+static inline void mchp_phy_write(struct dw_mipi_dsi_mchp *dsi, u32 reg, u32 val)
+{
+	writel(val, dsi->base + reg);
+}
+
+static void dw_mipi_dsi_mchp_phy_write(struct dw_mipi_dsi_mchp *dsi,
+				       u8 test_code,
+				       u8 test_data)
+{
+	/* General DPHY control operation */
+
+	mchp_phy_write(dsi, DSI_PHY_TST_CTRL0, PHY_TESTCLK | PHY_UNTESTCLR);
+	mchp_phy_write(dsi, DSI_PHY_TST_CTRL1, PHY_TESTEN |
+		       FIELD_PREP(PHY_TESTDOUT_MASK, 1) |
+		       FIELD_PREP(PHY_TESTDIN_MASK, test_code));
+	mchp_phy_write(dsi, DSI_PHY_TST_CTRL0, PHY_UNTESTCLK | PHY_UNTESTCLR);
+	mchp_phy_write(dsi, DSI_PHY_TST_CTRL1, PHY_UNTESTEN |
+		       FIELD_PREP(PHY_TESTDOUT_MASK, 0) |
+		       FIELD_PREP(PHY_TESTDIN_MASK, test_data));
+	mchp_phy_write(dsi, DSI_PHY_TST_CTRL0, PHY_TESTCLK | PHY_UNTESTCLR);
+	mchp_phy_write(dsi, DSI_PHY_TST_CTRL0, PHY_UNTESTCLK | PHY_UNTESTCLR);
+}
+
+static int dw_mipi_dsi_mchp_init(void *priv_data)
+{
+	struct dw_mipi_dsi_mchp *dsi = priv_data;
+	int index, vco, ret = 0;
+
+	/*
+	 * Get vco from frequency(lane_mbps)
+	 * vco	frequency table
+	 * 000 - between   80 and  200 MHz
+	 * 001 - between  200 and  300 MHz
+	 * 010 - between  300 and  500 MHz
+	 * 011 - between  500 and  700 MHz
+	 * 100 - between  700 and  900 MHz
+	 * 101 - between  900 and 1000 MHz
+	 */
+	vco = (dsi->lane_mbps < 200) ? 0 : (dsi->lane_mbps + 100) / 200;
+
+	index = mchp_max_mbps_to_parameter(dsi->lane_mbps);
+	if (index < 0) {
+		dev_err(dsi->dev,
+			"failed to get parameter for %dmbps clock\n",
+			dsi->lane_mbps);
+		return index;
+	}
+
+	/* D-PHY in Shutdown mode */
+	mchp_phy_write(dsi, DSI_PHY_RSTZ, PHY_SHUTDOWNZ);
+
+	dw_mipi_dsi_mchp_phy_write(dsi, PLL_BIAS_CUR_SEL_CAP_VCO_CONTROL,
+				   BYPASS_VCO_RANGE |
+				   FIELD_PREP(VCO_RANGE_CON_SEL_MASK, vco) |
+				   VCO_IN_CAP_CON_LOW);
+
+	dw_mipi_dsi_mchp_phy_write(dsi, PLL_CP_CONTROL_PLL_LOCK_BYPASS,
+				   FIELD_PREP(CP_CURRENT_SEL_MASK, dppa_map[index].icpctrl));
+
+	dw_mipi_dsi_mchp_phy_write(dsi, PLL_LPF_AND_CP_CONTROL,
+				   CP_PROGRAM_EN | LPF_PROGRAM_EN |
+				   FIELD_PREP(LPF_RESISTORS_SEL_MASK, dppa_map[index].lpfctrl));
+
+	dw_mipi_dsi_mchp_phy_write(dsi, PLL_INPUT_AND_LOOP_DIVIDER_RATIOS_CONTROL,
+				   PLL_LOOP_DIV_EN | PLL_INPUT_DIV_EN);
+
+	dw_mipi_dsi_mchp_phy_write(dsi, PLL_INPUT_DIVIDER_RATIO,
+				   INPUT_DIVIDER(dsi->input_div));
+
+	dw_mipi_dsi_mchp_phy_write(dsi, PLL_LOOP_DIVIDER_RATIO,
+				   LOOP_DIV_LOW_SEL(dsi->feedback_div) |
+				   LOW_PROGRAM_EN);
+
+	dw_mipi_dsi_mchp_phy_write(dsi, PLL_LOOP_DIVIDER_RATIO,
+				   LOOP_DIV_HIGH_SEL(dsi->feedback_div) |
+				   HIGH_PROGRAM_EN);
+
+	return ret;
+}
+
+static int dw_mipi_dsi_mchp_get_lane_mbps(void *priv_data,
+					  const struct drm_display_mode *mode,
+					  unsigned long mode_flags, u32 lanes,
+					  u32 format, unsigned int *lane_mbps)
+{
+	struct dw_mipi_dsi_mchp *dsi = priv_data;
+	unsigned long best_freq, fvco_min, fvco_max, fin, fout;
+	unsigned long min_delta = ULONG_MAX, delta;
+	unsigned int mpclk, target_mbps, desired_mbps;
+	unsigned int max_mbps = dppa_map[ARRAY_SIZE(dppa_map) - 1].max_mbps;
+	unsigned int bpp, min_prediv, max_prediv;
+	unsigned int _fbdiv, best_fbdiv, _prediv, best_prediv;
+	u64 freq_factor;
+
+	dsi->format = format;
+	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
+	if (bpp < 0) {
+		dev_err(dsi->dev,
+			"failed to get bpp for pixel format %d\n",
+			dsi->format);
+		return bpp;
+	}
+
+	mpclk = DIV_ROUND_UP(mode->clock, MSEC_PER_SEC);
+	if (mpclk) {
+		/* take 1/0.8, since mbps must be bigger than bandwidth of RGB */
+		desired_mbps = mpclk * (bpp / lanes) * 10 / 8;
+		if (desired_mbps < max_mbps) {
+			target_mbps = desired_mbps;
+		} else {
+			dev_err(dsi->dev,
+				"DPHY clock frequency is out of range\n");
+			return -ERANGE;
+		}
+	}
+
+	fin = clk_get_rate(dsi->pllref_clk);
+	fout = target_mbps * USEC_PER_SEC;
+
+	/* constraint: 5Mhz <= Fref / N <= 40MHz */
+	min_prediv = DIV_ROUND_UP(fin, 40 * USEC_PER_SEC);
+	max_prediv = fin / (5 * USEC_PER_SEC);
+
+	/* constraint: 80MHz <= Fvco <= 1000Mhz */
+	fvco_min = 80 * USEC_PER_SEC;
+	fvco_max = 1000 * USEC_PER_SEC;
+
+	for (best_freq = 0, _prediv = min_prediv; _prediv <= max_prediv; _prediv++) {
+		/* Fvco = Fref * M / N */
+		freq_factor = fout * _prediv;
+		do_div(freq_factor, fin);
+		_fbdiv = freq_factor;
+		/*
+		 * Due to the use of a "by 2 pre-scaler," the range of the
+		 * feedback multiplication value M is limited to even division
+		 * numbers, and m must be greater than 6, not bigger than 512.
+		 */
+		if (_fbdiv < 6 || _fbdiv > 512)
+			continue;
+
+		_fbdiv += _fbdiv % 2;
+
+		freq_factor = _fbdiv * fin;
+		do_div(freq_factor, _prediv);
+		if (freq_factor < fvco_min || freq_factor > fvco_max)
+			continue;
+
+		delta = abs(fout - freq_factor);
+		if (delta < min_delta) {
+			best_prediv = _prediv;
+			best_fbdiv = _fbdiv;
+			min_delta = delta;
+			best_freq = freq_factor;
+		}
+	}
+
+	if (best_freq) {
+		dsi->lane_mbps = DIV_ROUND_UP(best_freq, USEC_PER_SEC);
+		*lane_mbps = dsi->lane_mbps;
+		dsi->input_div = best_prediv;
+		dsi->feedback_div = best_fbdiv;
+	} else {
+		dev_err(dsi->dev, "Can not find best_freq for DPHY\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int dw_mipi_dsi_mchp_get_timing(void *priv_data, unsigned int lane_mbps,
+				       struct dw_mipi_dsi_dphy_timing *timing)
+{
+	int index = 0;
+
+	for (; index < ARRAY_SIZE(hstt_table); index++)
+		if (lane_mbps < hstt_table[index].maxfreq)
+			break;
+
+	if (index == ARRAY_SIZE(hstt_table))
+		index--;
+
+	*timing = hstt_table[index].timing;
+
+	return 0;
+}
+
+static void dw_mipi_dsi_mchp_power_on(void *priv_data)
+{
+	struct dw_mipi_dsi_mchp *dsi = priv_data;
+
+	/* Enable the DSI wrapper */
+	mchp_phy_write(dsi, DSI_PWR_UP, HOST_PWRUP);
+}
+
+static void dw_mipi_dsi_mchp_power_off(void *priv_data)
+{
+	struct dw_mipi_dsi_mchp *dsi = priv_data;
+
+	/* Disable the DSI wrapper */
+	mchp_phy_write(dsi, DSI_PWR_UP, HOST_RESET);
+}
+
+static int dw_mipi_dsi_mchp_probe(struct platform_device *pdev)
+{
+	struct dw_mipi_dsi_mchp *dsi;
+	struct regmap *sfr;
+	const struct dw_mipi_dsi_mchp_chip_data *cdata;
+	int ret;
+
+	dsi = devm_kzalloc(&pdev->dev, sizeof(*dsi), GFP_KERNEL);
+	if (!dsi)
+		return -ENOMEM;
+
+	dsi->dev = &pdev->dev;
+	cdata = of_device_get_match_data(dsi->dev);
+
+	dsi->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(dsi->base)) {
+		ret = PTR_ERR(dsi->base);
+		dev_err_probe(dsi->dev, ret, "Unable to get DSI Base address\n");
+		return ret;
+	}
+
+	dsi->pllref_clk = devm_clk_get(&pdev->dev, "refclk");
+	if (IS_ERR(dsi->pllref_clk)) {
+		ret = PTR_ERR(dsi->pllref_clk);
+		dev_err_probe(dsi->dev, ret, "Unable to get DSI PHY PLL reference clock\n");
+		return ret;
+	}
+
+	sfr = syscon_regmap_lookup_by_phandle(pdev->dev.of_node, "microchip,sfr");
+	if (IS_ERR(sfr)) {
+		ret = PTR_ERR(sfr);
+		dev_err_probe(dsi->dev, ret, "Failed to get handle on Special Function Register\n");
+		return ret;
+	}
+	/* Select DSI in SFR's ISS Configuration Register */
+	ret = regmap_write(sfr, SFR_ISS_CFG, ISS_CFG_DSI_MODE);
+	if (ret) {
+		dev_err_probe(dsi->dev, ret, "Failed to enable DSI in SFR_ISS_CFG Register\n");
+		return ret;
+	}
+
+	clk_set_rate(dsi->pllref_clk, DSI_PLL_REF_CLK);
+	if (clk_get_rate(dsi->pllref_clk) != DSI_PLL_REF_CLK) {
+		ret = -EINVAL;
+		dev_err_probe(dsi->dev, ret, "Failed to set DSI PHY PLL reference clock\n");
+		return ret;
+	}
+
+	ret = clk_prepare_enable(dsi->pllref_clk);
+	if (ret) {
+		dev_err_probe(dsi->dev, ret, "Failed to enable DSI PHY PLL reference clock\n");
+		return ret;
+	}
+
+	dsi->pdata.base = dsi->base;
+	dsi->pdata.max_data_lanes = cdata->max_data_lanes;
+	dsi->pdata.phy_ops = cdata->phy_ops;
+	dsi->pdata.priv_data = dsi;
+	platform_set_drvdata(pdev, dsi);
+
+	/* call synopsis probe */
+	dsi->dsi = dw_mipi_dsi_probe(pdev, &dsi->pdata);
+	if (IS_ERR(dsi->dsi)) {
+		ret = PTR_ERR(dsi->dsi);
+		dev_err_probe(dsi->dev, ret, "Failed to initialize mipi dsi host\n");
+		clk_disable_unprepare(dsi->pllref_clk);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int dw_mipi_dsi_mchp_remove(struct platform_device *pdev)
+{
+	struct dw_mipi_dsi_mchp *dsi = platform_get_drvdata(pdev);
+
+	dw_mipi_dsi_remove(dsi->dsi);
+	clk_disable_unprepare(dsi->pllref_clk);
+
+	return 0;
+}
+
+static int dw_mipi_dsi_mchp_suspend(struct device *dev)
+{
+	struct dw_mipi_dsi_mchp *dsi = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(dsi->pllref_clk);
+
+	return 0;
+}
+
+static int dw_mipi_dsi_mchp_resume(struct device *dev)
+{
+	struct dw_mipi_dsi_mchp *dsi = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(dsi->pllref_clk);
+	if (ret) {
+		dev_err(dsi->dev, "Failed to enable pllref_clk: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct dev_pm_ops dw_mipi_dsi_mchp_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(dw_mipi_dsi_mchp_suspend,
+			    dw_mipi_dsi_mchp_resume)
+	RUNTIME_PM_OPS(dw_mipi_dsi_mchp_suspend,
+		       dw_mipi_dsi_mchp_resume, NULL)
+};
+
+static const struct dw_mipi_dsi_phy_ops dw_mipi_dsi_mchp_phy_ops = {
+	.init = dw_mipi_dsi_mchp_init,
+	.power_on = dw_mipi_dsi_mchp_power_on,
+	.power_off = dw_mipi_dsi_mchp_power_off,
+	.get_lane_mbps = dw_mipi_dsi_mchp_get_lane_mbps,
+	.get_timing = dw_mipi_dsi_mchp_get_timing,
+};
+
+static const struct dw_mipi_dsi_mchp_chip_data sam9x75_chip_data = {
+	.max_data_lanes = 4,
+	.phy_ops = &dw_mipi_dsi_mchp_phy_ops,
+};
+
+static const struct of_device_id dw_mipi_dsi_mchp_dt_ids[] = {
+	{
+	 .compatible	= "microchip,sam9x75-mipi-dsi",
+	 .data		= &sam9x75_chip_data,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, dw_mipi_dsi_mchp_dt_ids);
+
+struct platform_driver dw_mipi_dsi_mchp_driver = {
+	.probe		= dw_mipi_dsi_mchp_probe,
+	.remove		= dw_mipi_dsi_mchp_remove,
+	.driver		= {
+		.of_match_table = dw_mipi_dsi_mchp_dt_ids,
+		.name		= "dw-mipi-dsi-mchp",
+		.pm		= &dw_mipi_dsi_mchp_pm_ops,
+	},
+};
+module_platform_driver(dw_mipi_dsi_mchp_driver);
+
+MODULE_AUTHOR("Manikandan Muralidharan <manikandan.m@microchip.com>");
+MODULE_DESCRIPTION("Microchip DW MIPI DSI controller wrapper driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1

