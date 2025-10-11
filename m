Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEBBBCF9A3
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 19:04:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE31C10E33C;
	Sat, 11 Oct 2025 17:04:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="hq1MHg5u";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="PmzoWNpY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9EDF10E33C
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 17:04:20 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4ckVMR3nZ5z9smD;
 Sat, 11 Oct 2025 19:04:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760202259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Y+LdeX9seq1Gdbe7EN0yiDfqxBb5o/O+XFhadqynYs=;
 b=hq1MHg5uNyk4J3Gl7bJbxVg5YGPRc1ckcEuhXllYAIrX4ShEjikgxyCN3IJLKrA62pq+Tj
 MNbVSwgoWITln8pD3FM1YRjawr2Uc17pd0NLDdf57kFT9NMEQ4T1Ec+0wBEIkQkKjNDSl7
 EdB7qfmW6oL5SkLGN1UZK9QQb9hv5kEKsQJ66UPy0bMnpb2o74r+6WHbUHz/eeXA7Z+AkL
 nIJVpky9s1Hg2xKMYLBYbfHZENHri1kFvWb8e2f5WR+tg+XhpHZO+PrCRhVPiAfsckDk2l
 ev7+In1OioACJmGVmkM5lPNImnWiu0aWXKt3MRkj/gDH7cwmwLhrPFHNVbjdcw==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760202257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Y+LdeX9seq1Gdbe7EN0yiDfqxBb5o/O+XFhadqynYs=;
 b=PmzoWNpYNP/YHRvS9PC1VRMVvev9z/kMx8xLTLXLJCydIXG5FHgUi8mFU6Xi6lIKp5vRfA
 ovvcB5ncxYf62/e6SQpYwZNJ2synHFEPcTksC3vqK9SvSq8c6OkdQutkWkwhYkYFc2Xe93
 GHoh5NHqBDjLDJmKv08W3myof5uu21Ag2dpk8Ht9mCcnGw51d0ZlbkW0zcHR/67P7zIfKE
 j8ay5waLINnX6sPmY2iPZ6ff2467BhJKIw7dmvz5S4koWTJnn2YAZAKqjfinmoyIaTzT+G
 M85sXUzyvzyn5ZlzR5nSAI+rj/4a3R/5VH9rcmw4JII1VRjdbi+HG+8kl+tl8w==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut@mailbox.org>, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: [PATCH 30/39] drm/bridge: imx93-mipi-dsi: Add i.MX95 PLL
 initialization
Date: Sat, 11 Oct 2025 18:51:45 +0200
Message-ID: <20251011170213.128907-31-marek.vasut@mailbox.org>
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 9d6ea4e12d6ee44f74c
X-MBO-RS-META: kia57kc5cqrybmn617bi9x5kdyrbh9fa
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

Add PLL initialization for the i.MX95 SoC, which differs from the i.MX93.
Unlike the i.MX93 PHY, the i.MX95 PHY uses more syscon interfaces to configure
the PHY. Retain common code where possible, which are frequency table look ups
and matching tables.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
---
 drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c | 612 ++++++++++++++++++--
 1 file changed, 575 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c b/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
index 8f7a0d46601a4..d0fda2fca2b43 100644
--- a/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
@@ -13,6 +13,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/phy/phy.h>
 #include <linux/phy/phy-mipi-dphy.h>
 #include <linux/platform_device.h>
@@ -23,7 +24,7 @@
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_modes.h>
 
-/* DPHY PLL configuration registers */
+/* i.MX93 DPHY PLL configuration registers */
 #define DSI_REG				0x4c
 #define  CFGCLKFREQRANGE_MASK		GENMASK(5, 0)
 #define  CFGCLKFREQRANGE(x)		FIELD_PREP(CFGCLKFREQRANGE_MASK, (x))
@@ -70,6 +71,123 @@
 #define  RGB888_TO_RGB666		FIELD_PREP(LCDIF_CROSS_LINE_PATTERN, 6)
 #define  RGB565_TO_RGB565		FIELD_PREP(LCDIF_CROSS_LINE_PATTERN, 7)
 
+/* i.MX95 DPHY PLL configuration registers */
+#define DSI_DPI_CFG_POL			0x14
+#define  COLORM_ACTIVE_LOW		BIT(4)
+#define  SHUTD_ACTIVE_LOW		BIT(3)
+#define  HSYNC_ACTIVE_LOW		BIT(2)
+#define  VSYNC_ACTIVE_LOW		BIT(1)
+#define  DATAEN_ACTIVE_LOW		BIT(0)
+
+#define DSI_PHY_TST_CTRL0		0xb4
+#define  PHY_TESTCLK			BIT(1)
+#define  PHY_UNTESTCLK			0
+#define  PHY_TESTCLR			BIT(0)
+#define  PHY_UNTESTCLR			0
+
+#define DSI_PHY_TST_CTRL1		0xb8
+#define  PHY_TESTEN			BIT(16)
+#define  PHY_UNTESTEN			0
+#define  PHY_TESTDOUT_MASK		GENMASK(15, 8)
+#define  PHY_TESTDOUT(n)		FIELD_PREP(PHY_TESTDOUT_MASK, (n))
+#define  PHY_TESTDIN(n)			FIELD_PREP(GENMASK(7, 0), (n))
+
+/* master CSR */
+#define DSI_CLOCK_GATING_CONTROL	0x0
+#define  DISPLAY_ASYNC_FIFO(n)		BIT(0 + (n))
+#define  DPHY_PLL_CLKIN			BIT(2)
+#define  DPHY_PLL_CLKOUT		BIT(3)
+#define  DPHY_PLL_CLKEXT		BIT(4)
+
+#define DSI_PIXEL_LINK_CONTROL		0x4
+#define  PIXEL_LINK_SEL			BIT(0)
+
+#define DSI_CLOCK_SETTING		0x8
+#define  DPHY_REF_CLOCK_DIV(n)		FIELD_PREP(GENMASK(3, 0), (n))
+#define  DPHY_BYPASS_CLOCK		BIT(6)
+#define  DPHY_REF_CLOCK_SOURCE		BIT(7)
+#define  DPHY_PLL_DIV(n)		FIELD_PREP(GENMASK(11, 8), (n))
+#define  PL_SLV_DSI_INGRESS_CLK_SEL(n)	BIT(16 + (n))
+
+/* stream CSR */
+#define DSI_HOST_CONFIGURATION		0x0
+#define  PIXEL_LINK_FORMAT_MASK		GENMASK(2, 0)
+#define  SHUTDOWN			BIT(4)
+#define  COLORMODE			BIT(5)
+
+#define DSI_PARITY_ERROR_STATUS		0x4
+#define DSI_PARITY_ERROR_THRESHOLD	0x8
+
+/* DPHY CSR */
+#define PHY_MODE_CONTROL		0x0
+#define  PHY_ENABLE_EXT(n)		FIELD_PREP(GENMASK(7, 4), (n))
+#define  PLL_GP_CLK_EN			BIT(3)
+#define  PLL_CLKSEL_MASK		GENMASK(2, 1)
+#define  PLL_CLKSEL_STOP		FIELD_PREP(PLL_CLKSEL_MASK, 0)
+#define  PLL_CLKSEL_GEN			FIELD_PREP(PLL_CLKSEL_MASK, 1)
+#define  PLL_CLKSEL_EXT			FIELD_PREP(PLL_CLKSEL_MASK, 2)
+#define  TX_RXZ_DSI_MODE		BIT(0)
+
+#define PHY_FREQ_CONTROL		0x4
+#define  PHY_HSFREQRANGE(n)		FIELD_PREP(GENMASK(22, 16), (n))
+#define  PHY_CFGCLKFREQRANGE(n)		FIELD_PREP(GENMASK(7, 0), (n))
+
+#define PHY_TEST_MODE_CONTROL		0x8
+#define	 EXT_SIGNAL_ALL			GENMASK(19, 14)
+#define  TURNDISABLE_0			BIT(13)
+#define  ENABLECLK_EXT			BIT(12)
+
+#define PHY_TEST_MODE_STATUS		0xc
+#define  PHY_LOCK			BIT(11)
+
+/* DPHY test control register */
+#define DIG_RDWR_TX_PLL_1		0x15e
+#define  PLL_CPBIAS_CNTRL_RW_MASK	GENMASK(6, 0)
+#define  PLL_CPBIAS_CNTRL_RW(n)		FIELD_PREP(PLL_CPBIAS_CNTRL_RW_MASK, (n))
+#define DIG_RDWR_TX_PLL_5		0x162
+#define  PLL_INT_CNTRL_RW(n)		FIELD_PREP(GENMASK(7, 2), (n))
+#define  PLL_GMP_CNTRL_RW(n)		FIELD_PREP(GENMASK(1, 0), (n))
+#define DIG_RDWR_TX_PLL_9		0x166
+#define  PLL_LOCK_SEL_RW		BIT(2)
+#define DIG_RDWR_TX_PLL_13		0x16a
+#define DIG_RDWR_TX_PLL_17		0x16e
+#define  PLL_PWRON_OVR_RW		BIT(7)
+#define  PLL_PWRON_OVR_EN_RW		BIT(6)
+#define  PLL_PROP_CNTRL_RW_MASK		GENMASK(5, 0)
+#define  PLL_PROP_CNTRL_RW(n)		FIELD_PREP(PLL_PROP_CNTRL_RW_MASK, (n))
+#define DIG_RDWR_TX_PLL_22		0x173
+#define DIG_RDWR_TX_PLL_23		0x174
+#define DIG_RDWR_TX_PLL_24		0x175
+#define  PLL_TH2_RW(n)			FIELD_PREP(GENMASK(7, 0), (n))
+#define DIG_RDWR_TX_PLL_25		0x176
+#define  PLL_TH3_RW(n)			FIELD_PREP(GENMASK(7, 0), (n))
+#define DIG_RDWR_TX_PLL_27		0x178
+#define  PLL_N_OVR_EN_RW		BIT(7)
+#define  PLL_N_OVR_RW_MASK		GENMASK(6, 3)
+#define  PLL_N_OVR_RW(n)		FIELD_PREP(PLL_N_OVR_RW_MASK, ((n) - 1))
+#define DIG_RDWR_TX_PLL_28		0x179
+#define  PLL_M_LOW(n)			(((n) - 2) & 0xff)
+#define DIG_RDWR_TX_PLL_29		0x17a
+#define  PLL_M_HIGH(n)			((((n) - 2) >> 8) & 0xff)
+#define DIG_RDWR_TX_PLL_30		0x17b
+#define  PLL_VCO_CNTRL_OVR_EN_RW	BIT(7)
+#define  PLL_VCO_CNTRL_OVR_RW_MASK	GENMASK(6, 1)
+#define  PLL_VCO_CNTRL_OVR_RW(n)	FIELD_PREP(PLL_VCO_CNTRL_OVR_RW_MASK, (n))
+#define  PLL_M_OVR_EN_RW		BIT(0)
+#define DIG_RDWR_TX_PLL_31		0x17c
+#define  PLL_CLKOUTEN_RIGHT_RW		BIT(1)
+#define  PLL_CLKOUTEN_LEFT_RW		BIT(0)
+#define DIG_RDWR_TX_CB_0		0x1aa
+#define DIG_RDWR_TX_CB_1		0x1ab
+#define DIG_RDWR_TX_TX_SLEW_0		0x26b
+#define DIG_RDWR_TX_TX_SLEW_5		0x270
+#define DIG_RDWR_TX_TX_SLEW_6		0x271
+#define DIG_RDWR_TX_TX_SLEW_7		0x272
+#define DIG_RDWR_TX_CLK_TERMLOWCAP	0x402
+
+#define IMX95_DSI_ENDPOINT_PL0		0
+#define IMX95_DSI_ENDPOINT_PL1		1
+
 #define MHZ(x)				((x) * 1000000UL)
 
 #define REF_CLK_RATE_MAX		MHZ(64)
@@ -89,9 +207,24 @@
 #define N_MAX				16U
 #define N_MIN				1U
 
+#define PIXEL_LINK_STREAMS		2
+
+enum dsi_pixel_link_format {
+	RGB_24BIT,
+	RGB_30BIT,
+	RGB_18BIT,
+	RGB_16BIT,
+	YCBCR_20BIT_422,
+	YCBCR_16BIT_422,
+};
+
 struct imx93_dsi {
 	struct device *dev;
+	void __iomem *base;
 	struct regmap *regmap;
+	struct regmap *mst;
+	struct regmap *str;
+	struct regmap *phy;
 	struct clk *clk_pixel;
 	struct clk *clk_ref;
 	struct clk *clk_cfg;
@@ -99,6 +232,10 @@ struct imx93_dsi {
 	struct dw_mipi_dsi_plat_data pdata;
 	union phy_configure_opts phy_cfg;
 	unsigned long ref_clk_rate;
+	unsigned int lanes;
+	unsigned int lane_mbps;
+	bool use_pl0;
+	u32 fixed_format;
 	u32 format;
 };
 
@@ -200,7 +337,7 @@ static const struct dphy_pll_hsfreqrange hsfreqrange_map[] = {
 	{ 2500, 0x49 },
 };
 
-static void dphy_pll_write(struct imx93_dsi *dsi, unsigned int reg, u32 value)
+static void imx93_dsi_pll_write(struct imx93_dsi *dsi, unsigned int reg, u32 value)
 {
 	int ret;
 
@@ -293,19 +430,19 @@ dphy_pll_get_configure_from_opts(struct imx93_dsi *dsi,
 	return 0;
 }
 
-static void dphy_pll_clear_shadow(struct imx93_dsi *dsi)
+static void imx93_dsi_pll_clear_shadow(struct imx93_dsi *dsi)
 {
 	/* Reference DPHY Databook Figure 3-3 Initialization Timing Diagram. */
 	/* Select clock generation first. */
-	dphy_pll_write(dsi, DSI_REG, CLKSEL_GEN);
+	imx93_dsi_pll_write(dsi, DSI_REG, CLKSEL_GEN);
 
 	/* Clear shadow after clock selection is done a while. */
 	fsleep(1);
-	dphy_pll_write(dsi, DSI_REG, CLKSEL_GEN | SHADOW_CLR);
+	imx93_dsi_pll_write(dsi, DSI_REG, CLKSEL_GEN | SHADOW_CLR);
 
 	/* A minimum pulse of 5ns on shadow_clear signal. */
 	fsleep(1);
-	dphy_pll_write(dsi, DSI_REG, CLKSEL_GEN);
+	imx93_dsi_pll_write(dsi, DSI_REG, CLKSEL_GEN);
 }
 
 static unsigned long dphy_pll_get_cfgclkrange(struct imx93_dsi *dsi)
@@ -354,7 +491,7 @@ static u8 dphy_pll_get_prop(struct phy_configure_opts_mipi_dphy *dphy_opts)
 	return 0;
 }
 
-static int dphy_pll_update(struct imx93_dsi *dsi)
+static int imx93_dsi_pll_update(struct imx93_dsi *dsi)
 {
 	int ret;
 
@@ -380,7 +517,7 @@ static int dphy_pll_update(struct imx93_dsi *dsi)
 	return 0;
 }
 
-static int dphy_pll_configure(struct imx93_dsi *dsi, union phy_configure_opts *opts)
+static int imx93_dsi_pll_configure(struct imx93_dsi *dsi, union phy_configure_opts *opts)
 {
 	struct dphy_pll_cfg cfg = { 0 };
 	u32 val;
@@ -392,22 +529,22 @@ static int dphy_pll_configure(struct imx93_dsi *dsi, union phy_configure_opts *o
 		return ret;
 	}
 
-	dphy_pll_clear_shadow(dsi);
+	imx93_dsi_pll_clear_shadow(dsi);
 
 	/* DSI_REG */
 	val = CLKSEL_GEN |
 	      CFGCLKFREQRANGE(dphy_pll_get_cfgclkrange(dsi)) |
 	      HSFREQRANGE(dphy_pll_get_hsfreqrange(&opts->mipi_dphy));
-	dphy_pll_write(dsi, DSI_REG, val);
+	imx93_dsi_pll_write(dsi, DSI_REG, val);
 
 	/* DSI_WRITE_REG0 */
 	val = M(cfg.m) | N(cfg.n) | INT_CTRL(0) |
 	      VCO_CTRL(dphy_pll_get_vco(&opts->mipi_dphy)) |
 	      PROP_CTRL(dphy_pll_get_prop(&opts->mipi_dphy));
-	dphy_pll_write(dsi, DSI_WRITE_REG0, val);
+	imx93_dsi_pll_write(dsi, DSI_WRITE_REG0, val);
 
 	/* DSI_WRITE_REG1 */
-	dphy_pll_write(dsi, DSI_WRITE_REG1, GMP_CTRL(1) | CPBIAS_CTRL(0x10));
+	imx93_dsi_pll_write(dsi, DSI_WRITE_REG1, GMP_CTRL(1) | CPBIAS_CTRL(0x10));
 
 	ret = clk_prepare_enable(dsi->clk_ref);
 	if (ret < 0) {
@@ -421,7 +558,7 @@ static int dphy_pll_configure(struct imx93_dsi *dsi, union phy_configure_opts *o
 	 */
 	fsleep(10);
 
-	ret = dphy_pll_update(dsi);
+	ret = imx93_dsi_pll_update(dsi);
 	if (ret < 0) {
 		clk_disable_unprepare(dsi->clk_ref);
 		return ret;
@@ -430,14 +567,14 @@ static int dphy_pll_configure(struct imx93_dsi *dsi, union phy_configure_opts *o
 	return 0;
 }
 
-static void dphy_pll_clear_reg(struct imx93_dsi *dsi)
+static void imx93_dsi_pll_clear_reg(struct imx93_dsi *dsi)
 {
-	dphy_pll_write(dsi, DSI_REG, 0);
-	dphy_pll_write(dsi, DSI_WRITE_REG0, 0);
-	dphy_pll_write(dsi, DSI_WRITE_REG1, 0);
+	imx93_dsi_pll_write(dsi, DSI_REG, 0);
+	imx93_dsi_pll_write(dsi, DSI_WRITE_REG0, 0);
+	imx93_dsi_pll_write(dsi, DSI_WRITE_REG1, 0);
 }
 
-static int dphy_pll_init(struct imx93_dsi *dsi)
+static int imx93_dsi_pll_init(struct imx93_dsi *dsi)
 {
 	int ret;
 
@@ -447,20 +584,20 @@ static int dphy_pll_init(struct imx93_dsi *dsi)
 		return ret;
 	}
 
-	dphy_pll_clear_reg(dsi);
+	imx93_dsi_pll_clear_reg(dsi);
 
 	return 0;
 }
 
-static void dphy_pll_uninit(struct imx93_dsi *dsi)
+static void imx93_dsi_pll_uninit(struct imx93_dsi *dsi)
 {
-	dphy_pll_clear_reg(dsi);
+	imx93_dsi_pll_clear_reg(dsi);
 	clk_disable_unprepare(dsi->clk_cfg);
 }
 
-static void dphy_pll_power_off(struct imx93_dsi *dsi)
+static void imx93_pll_power_off(struct imx93_dsi *dsi)
 {
-	dphy_pll_clear_reg(dsi);
+	imx93_dsi_pll_clear_reg(dsi);
 	clk_disable_unprepare(dsi->clk_ref);
 }
 
@@ -581,6 +718,10 @@ static bool imx93_dsi_mode_fixup(void *priv_data,
 	dev_dbg(dsi->dev, "adj clock %d for mode " DRM_MODE_FMT "\n",
 		adjusted_mode->clock, DRM_MODE_ARG(mode));
 
+	/* pixel link always generates active low HSYNC and VSYNC */
+	adjusted_mode->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
+	adjusted_mode->flags |= DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC;
+
 	return true;
 }
 
@@ -592,6 +733,7 @@ static u32 *imx93_dsi_get_input_bus_fmts(void *priv_data,
 					 u32 output_fmt,
 					 unsigned int *num_input_fmts)
 {
+	struct imx93_dsi *dsi = priv_data;
 	u32 *input_fmts, input_fmt;
 
 	*num_input_fmts = 0;
@@ -599,12 +741,15 @@ static u32 *imx93_dsi_get_input_bus_fmts(void *priv_data,
 	switch (output_fmt) {
 	case MEDIA_BUS_FMT_RGB888_1X24:
 	case MEDIA_BUS_FMT_RGB666_1X18:
-	case MEDIA_BUS_FMT_FIXED:
 		input_fmt = MEDIA_BUS_FMT_RGB888_1X24;
 		break;
 	case MEDIA_BUS_FMT_RGB565_1X16:
 		input_fmt = output_fmt;
 		break;
+	case MEDIA_BUS_FMT_FIXED:
+		input_fmt = dsi->fixed_format;
+		break;
+
 	default:
 		return NULL;
 	}
@@ -647,16 +792,16 @@ static int imx93_dsi_phy_init(void *priv_data)
 
 	regmap_update_bits(dsi->regmap, DISPLAY_MUX, LCDIF_CROSS_LINE_PATTERN, fmt);
 
-	ret = dphy_pll_init(dsi);
+	ret = imx93_dsi_pll_init(dsi);
 	if (ret < 0) {
 		dev_err(dsi->dev, "failed to init phy pll: %d\n", ret);
 		return ret;
 	}
 
-	ret = dphy_pll_configure(dsi, &dsi->phy_cfg);
+	ret = imx93_dsi_pll_configure(dsi, &dsi->phy_cfg);
 	if (ret < 0) {
 		dev_err(dsi->dev, "failed to configure phy pll: %d\n", ret);
-		dphy_pll_uninit(dsi);
+		imx93_dsi_pll_uninit(dsi);
 		return ret;
 	}
 
@@ -667,8 +812,342 @@ static void imx93_dsi_phy_power_off(void *priv_data)
 {
 	struct imx93_dsi *dsi = priv_data;
 
-	dphy_pll_power_off(dsi);
-	dphy_pll_uninit(dsi);
+	imx93_pll_power_off(dsi);
+	imx93_dsi_pll_uninit(dsi);
+}
+
+static void
+imx95_dsi_phy_csr_write(struct imx93_dsi *dsi, unsigned int reg, u32 value)
+{
+	int ret;
+
+	ret = regmap_write(dsi->phy, reg, value);
+	if (ret < 0)
+		dev_err(dsi->dev, "failed to write 0x%08x to phy reg 0x%x: %d\n",
+			value, reg, ret);
+}
+
+static int imx95_dsi_select_input(struct imx93_dsi *dsi)
+{
+	struct device *dev = dsi->dev;
+	struct device_node *remote0, *remote1 = NULL;
+	struct device_node *remote_pi0, *remote_pi1 = NULL;
+	struct device_node *remote_ldb_ch0, *remote_ldb_ch1 = NULL;
+	u32 port;
+	int ret;
+
+	/* pixel link0 */
+	remote0 = of_graph_get_remote_node(dev->of_node, 0,
+					   IMX95_DSI_ENDPOINT_PL0);
+	/* pixel interleaver channel0 */
+	remote_pi0 = of_graph_get_remote_node(remote0,
+					      IMX95_DSI_ENDPOINT_PL0, 0);
+	/* ldb channel0 */
+	port = IMX95_DSI_ENDPOINT_PL0 + PIXEL_LINK_STREAMS;
+	remote_ldb_ch0 = of_graph_get_remote_node(remote0, port, 1);
+	if (remote_pi0 && !remote_ldb_ch0) {
+		dsi->use_pl0 = true;
+	} else {
+		/* pixel link1 */
+		remote1 = of_graph_get_remote_node(dev->of_node, 0,
+						   IMX95_DSI_ENDPOINT_PL1);
+		/* pixel interleaver channel1 */
+		remote_pi1 = of_graph_get_remote_node(remote1,
+						      IMX95_DSI_ENDPOINT_PL1, 0);
+		/* ldb channel1 */
+		port = IMX95_DSI_ENDPOINT_PL1 + PIXEL_LINK_STREAMS;
+		remote_ldb_ch1 = of_graph_get_remote_node(remote1, port, 1);
+		if (!remote_pi1 || remote_ldb_ch1) {
+			dev_err(dev, "No valid input endpoint found\n");
+			ret = -EINVAL;
+			goto out;
+		}
+
+		dsi->use_pl0 = false;
+	}
+
+	dev_info(dev, "Using Pixel Link%d as input source\n",
+		 dsi->use_pl0 ? 0 : 1);
+
+	return 0;
+
+out:
+	of_node_put(remote_ldb_ch1);
+	of_node_put(remote_pi1);
+	of_node_put(remote1);
+	of_node_put(remote_ldb_ch0);
+	of_node_put(remote_pi0);
+	of_node_put(remote0);
+
+	return ret;
+}
+
+static inline void imx95_dsi_write(struct imx93_dsi *dsi, u32 reg, u32 val)
+{
+	writel(val, dsi->base + reg);
+}
+
+static inline u32 imx95_dsi_read(struct imx93_dsi *dsi, u32 reg)
+{
+	return readl(dsi->base + reg);
+}
+
+static void imx95_dsi_phy_write_testcode(struct imx93_dsi *dsi, u16 test_code)
+{
+	/*
+	 * Each control register address is composed by a 4-bit word(testcode
+	 * MSBs) and an 8-bit word(testcode LSBs).
+	 */
+
+	/* 1. For writing the 4-bit testcode MSBs: */
+	/* a. Ensure that TESTCLK and TESTEN are set to low. */
+	imx95_dsi_write(dsi, DSI_PHY_TST_CTRL0, PHY_UNTESTCLK);
+	imx95_dsi_write(dsi, DSI_PHY_TST_CTRL1, PHY_UNTESTEN);
+	/* b. Set TESTEN to high. */
+	imx95_dsi_write(dsi, DSI_PHY_TST_CTRL1, PHY_TESTEN);
+	/* c. Set TESTCLK to high. */
+	imx95_dsi_write(dsi, DSI_PHY_TST_CTRL0, PHY_TESTCLK);
+	/* d. Place 0x00 in TESTDIN. */
+	imx95_dsi_write(dsi, DSI_PHY_TST_CTRL1, PHY_TESTEN | PHY_TESTDIN(0));
+	/*
+	 * e. Set TESTCLK to low(with the falling edge on TESTCLK, the TESTDIN
+	 * signal content is latched internally).
+	 */
+	imx95_dsi_write(dsi, DSI_PHY_TST_CTRL0, PHY_UNTESTCLK);
+	/* f. Set TESTEN to low. */
+	imx95_dsi_write(dsi, DSI_PHY_TST_CTRL1, PHY_UNTESTEN);
+	/* g. Place the MSB 8-bit word of testcode in TESTDIN. */
+	imx95_dsi_write(dsi, DSI_PHY_TST_CTRL1, PHY_TESTDIN(test_code >> 8));
+	/* h. Set TESTCLK to high. */
+	imx95_dsi_write(dsi, DSI_PHY_TST_CTRL0, PHY_TESTCLK);
+
+	/* 2. For writing the 8-bit testcode LSBs: */
+	/* a. Set TESTCLK to low. */
+	imx95_dsi_write(dsi, DSI_PHY_TST_CTRL0, PHY_UNTESTCLK);
+	/* b. Set TESTEN to high. */
+	imx95_dsi_write(dsi, DSI_PHY_TST_CTRL1, PHY_TESTEN);
+	/* c. Set TESTCLK to high. */
+	imx95_dsi_write(dsi, DSI_PHY_TST_CTRL0, PHY_TESTCLK);
+	/* d. Place the LSB 8-bit word of testcode in TESTDIN. */
+	imx95_dsi_write(dsi, DSI_PHY_TST_CTRL1,
+			PHY_TESTEN | PHY_TESTDIN(test_code & 0xff));
+	/*
+	 * e. Set TESTCLK to low(with the falling edge on TESTCLK, the TESTDIN
+	 * signal content is latched internally).
+	 */
+	imx95_dsi_write(dsi, DSI_PHY_TST_CTRL0, PHY_UNTESTCLK);
+	/* f. Set TESTEN to low. */
+	imx95_dsi_write(dsi, DSI_PHY_TST_CTRL1,
+			PHY_UNTESTEN | PHY_TESTDIN(test_code & 0xff));
+}
+
+static void
+imx95_dsi_phy_tst_ctrl_write(struct imx93_dsi *dsi, u16 test_code, u8 test_data)
+{
+	imx95_dsi_phy_write_testcode(dsi, test_code);
+
+	/* For writing the data: */
+	/* a. Place the 8-bit word in TESTDIN. */
+	imx95_dsi_write(dsi, DSI_PHY_TST_CTRL1, PHY_TESTDIN(test_data));
+	/* b. Set TESTCLK to high. */
+	imx95_dsi_write(dsi, DSI_PHY_TST_CTRL0, PHY_TESTCLK);
+}
+
+static u8 imx95_dsi_phy_tst_ctrl_read(struct imx93_dsi *dsi, u16 test_code)
+{
+	u32 val;
+
+	imx95_dsi_phy_write_testcode(dsi, test_code);
+
+	/* For reading the data: */
+	val = imx95_dsi_read(dsi, DSI_PHY_TST_CTRL1);
+	return FIELD_GET(PHY_TESTDOUT_MASK, val);
+}
+
+static void
+imx95_dsi_phy_tst_ctrl_update(struct imx93_dsi *dsi, u16 test_code, u8 mask, u8 val)
+{
+	u8 tmp;
+
+	tmp = imx95_dsi_phy_tst_ctrl_read(dsi, test_code);
+	tmp &= ~mask;
+	imx95_dsi_phy_tst_ctrl_write(dsi, test_code, tmp | val);
+}
+
+static int imx95_dsi_pll_configure(struct imx93_dsi *dsi, union phy_configure_opts *opts)
+{
+	struct dphy_pll_cfg cfg = { 0 };
+	u32 val;
+	int ret;
+
+	ret = dphy_pll_get_configure_from_opts(dsi, &opts->mipi_dphy, &cfg);
+	if (ret) {
+		dev_err(dsi->dev, "failed to get phy pll cfg %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(dsi->clk_ref);
+	if (ret < 0) {
+		dev_err(dsi->dev, "failed to enable ref clock: %d\n", ret);
+		return ret;
+	}
+
+	val = PHY_CFGCLKFREQRANGE(dphy_pll_get_cfgclkrange(dsi)) |
+	      PHY_HSFREQRANGE(dphy_pll_get_hsfreqrange(&opts->mipi_dphy));
+	imx95_dsi_phy_csr_write(dsi, PHY_FREQ_CONTROL, val);
+
+	/* set pll_mpll_prog_rw (bits1:0) to 2'b11 */
+	imx95_dsi_phy_tst_ctrl_write(dsi, DIG_RDWR_TX_PLL_13, 0x03);
+	/* set cb_sel_vref_lprx_rw (bits 1:0) to 2'b10 */
+	imx95_dsi_phy_tst_ctrl_write(dsi, DIG_RDWR_TX_CB_1, 0x06);
+	/* set cb_sel_vrefcd_lprx_rw (bits 6:5) to 2'b10 */
+	imx95_dsi_phy_tst_ctrl_write(dsi, DIG_RDWR_TX_CB_0, 0x53);
+	/*
+	 * set txclk_term_lowcap_lp00_en_ovr_en and
+	 * txclk_term_lowcap_lp00_en_ovr(bits 1:0) to 2'b10
+	 */
+	imx95_dsi_phy_tst_ctrl_write(dsi, DIG_RDWR_TX_CLK_TERMLOWCAP, 0x02);
+	/* bit [5:4] of TX control register with address 0x272 to 2'b00 */
+	imx95_dsi_phy_tst_ctrl_write(dsi, DIG_RDWR_TX_TX_SLEW_7, 0x00);
+	/* sr_osc_freq_target */
+	imx95_dsi_phy_tst_ctrl_write(dsi, DIG_RDWR_TX_TX_SLEW_6, 0x07);
+	imx95_dsi_phy_tst_ctrl_write(dsi, DIG_RDWR_TX_TX_SLEW_5, 0xd0);
+	/* enable slew rate calibration */
+	imx95_dsi_phy_tst_ctrl_write(dsi, DIG_RDWR_TX_TX_SLEW_7, 0x10);
+
+	ret = clk_prepare_enable(dsi->clk_cfg);
+	if (ret < 0) {
+		dev_err(dsi->dev, "failed to enable cfg clock: %d\n", ret);
+		return ret;
+	}
+
+	/* pll m */
+	imx95_dsi_phy_tst_ctrl_write(dsi, DIG_RDWR_TX_PLL_28,
+				     PLL_M_LOW(cfg.m));
+	imx95_dsi_phy_tst_ctrl_write(dsi, DIG_RDWR_TX_PLL_29,
+				     PLL_M_HIGH(cfg.m));
+	imx95_dsi_phy_tst_ctrl_update(dsi, DIG_RDWR_TX_PLL_30,
+				      PLL_M_OVR_EN_RW, PLL_M_OVR_EN_RW);
+
+	/* pll n */
+	imx95_dsi_phy_tst_ctrl_update(dsi, DIG_RDWR_TX_PLL_27,
+				      PLL_N_OVR_RW_MASK | PLL_N_OVR_EN_RW,
+				      PLL_N_OVR_RW(cfg.n) | PLL_N_OVR_EN_RW);
+
+	/* vco ctrl */
+	val = dphy_pll_get_vco(&opts->mipi_dphy);
+	imx95_dsi_phy_tst_ctrl_update(dsi, DIG_RDWR_TX_PLL_30,
+				      PLL_VCO_CNTRL_OVR_RW_MASK |
+				      PLL_VCO_CNTRL_OVR_EN_RW,
+				      PLL_VCO_CNTRL_OVR_RW(val) |
+				      PLL_VCO_CNTRL_OVR_EN_RW);
+
+	/* cpbias ctrl */
+	imx95_dsi_phy_tst_ctrl_update(dsi, DIG_RDWR_TX_PLL_1,
+				      PLL_CPBIAS_CNTRL_RW_MASK,
+				      PLL_CPBIAS_CNTRL_RW(0x10));
+
+	/* int ctrl & gmp ctrl */
+	imx95_dsi_phy_tst_ctrl_write(dsi, DIG_RDWR_TX_PLL_5,
+				     PLL_INT_CNTRL_RW(0x0) |
+				     PLL_GMP_CNTRL_RW(0x1));
+
+	/* prop ctrl */
+	val = dphy_pll_get_prop(&opts->mipi_dphy);
+	imx95_dsi_phy_tst_ctrl_update(dsi, DIG_RDWR_TX_PLL_17,
+				      PLL_PROP_CNTRL_RW_MASK,
+				      PLL_PROP_CNTRL_RW(val));
+
+	/* pll lock configurations */
+	imx95_dsi_phy_tst_ctrl_write(dsi, DIG_RDWR_TX_PLL_22, 0x2);	/* TH1 */
+	imx95_dsi_phy_tst_ctrl_write(dsi, DIG_RDWR_TX_PLL_23, 0x0);	/* TH1 */
+	imx95_dsi_phy_tst_ctrl_write(dsi, DIG_RDWR_TX_PLL_24,
+				     PLL_TH2_RW(0x60));
+	imx95_dsi_phy_tst_ctrl_write(dsi, DIG_RDWR_TX_PLL_25,
+				     PLL_TH3_RW(0x3));
+	imx95_dsi_phy_tst_ctrl_update(dsi, DIG_RDWR_TX_PLL_9,
+				      PLL_LOCK_SEL_RW, PLL_LOCK_SEL_RW);
+
+	/* pll power on */
+	imx95_dsi_phy_tst_ctrl_update(dsi, DIG_RDWR_TX_PLL_17,
+				      PLL_PWRON_OVR_RW | PLL_PWRON_OVR_EN_RW,
+				      PLL_PWRON_OVR_RW | PLL_PWRON_OVR_EN_RW);
+
+	/* pll clkouten right/left */
+	imx95_dsi_phy_tst_ctrl_write(dsi, DIG_RDWR_TX_PLL_31,
+				     PLL_CLKOUTEN_RIGHT_RW |
+				     PLL_CLKOUTEN_LEFT_RW);
+
+	return 0;
+}
+
+static int imx95_dsi_phy_init(void *priv_data)
+{
+	struct imx93_dsi *dsi = priv_data;
+	u64 lane_mask;
+	int bpp, ret;
+
+	regmap_write(dsi->mst, DSI_PIXEL_LINK_CONTROL, dsi->use_pl0 ? 0 : PIXEL_LINK_SEL);
+
+	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
+	if (bpp < 0) {
+		dev_err(dsi->dev, "failed to get dsi format bpp\n");
+		return bpp;
+	}
+
+	imx95_dsi_write(dsi, DSI_DPI_CFG_POL, VSYNC_ACTIVE_LOW | HSYNC_ACTIVE_LOW);
+
+	regmap_write(dsi->mst, DSI_CLOCK_SETTING, 0);
+
+	switch (bpp) {
+	case 24:
+		regmap_write(dsi->str, DSI_HOST_CONFIGURATION, RGB_24BIT);
+		break;
+	case 18:
+		regmap_write(dsi->str, DSI_HOST_CONFIGURATION, RGB_18BIT);
+		break;
+	case 16:
+		regmap_write(dsi->str, DSI_HOST_CONFIGURATION, RGB_16BIT);
+		break;
+	default:
+		dev_err(dsi->dev, "invalid dsi format bpp %d\n", bpp);
+		return -EINVAL;
+	}
+
+	lane_mask = int_pow(2, dsi->lanes) - 1;
+	imx95_dsi_phy_csr_write(dsi, PHY_MODE_CONTROL,
+				PHY_ENABLE_EXT(lane_mask) | PLL_CLKSEL_GEN |
+				TX_RXZ_DSI_MODE);
+
+	ret = imx95_dsi_pll_configure(dsi, &dsi->phy_cfg);
+	if (ret < 0) {
+		dev_err(dsi->dev, "failed to configure phy pll: %d\n", ret);
+		return ret;
+	}
+
+	imx95_dsi_phy_csr_write(dsi, PHY_TEST_MODE_CONTROL, TURNDISABLE_0);
+
+	regmap_write(dsi->mst, DSI_CLOCK_GATING_CONTROL,
+		     DISPLAY_ASYNC_FIFO(dsi->use_pl0));
+
+	return 0;
+}
+
+static void imx95_dsi_phy_power_off(void *priv_data)
+{
+	struct imx93_dsi *dsi = priv_data;
+
+	/* set 1 to disable */
+	regmap_write(dsi->mst, DSI_CLOCK_GATING_CONTROL,
+		     DPHY_PLL_CLKEXT | DPHY_PLL_CLKOUT | DPHY_PLL_CLKIN |
+		     DISPLAY_ASYNC_FIFO(0) | DISPLAY_ASYNC_FIFO(1));
+
+	imx95_dsi_phy_csr_write(dsi, PHY_MODE_CONTROL, TX_RXZ_DSI_MODE);
+
+	clk_disable_unprepare(dsi->clk_cfg);
+	clk_disable_unprepare(dsi->clk_ref);
+
+	regmap_write(dsi->mst, DSI_PIXEL_LINK_CONTROL, 0);
 }
 
 static int
@@ -814,10 +1293,18 @@ static const struct dw_mipi_dsi_phy_ops imx93_dsi_phy_ops = {
 	.get_timing = imx93_dsi_phy_get_timing,
 };
 
+static const struct dw_mipi_dsi_phy_ops imx95_dsi_phy_ops = {
+	.init = imx95_dsi_phy_init,
+	.power_off = imx95_dsi_phy_power_off,
+	.get_lane_mbps = imx93_dsi_get_lane_mbps,
+	.get_timing = imx93_dsi_phy_get_timing,
+};
+
 static int imx93_dsi_host_attach(void *priv_data, struct mipi_dsi_device *device)
 {
 	struct imx93_dsi *dsi = priv_data;
 
+	dsi->lanes = device->lanes;
 	dsi->format = device->format;
 
 	return 0;
@@ -827,17 +1314,12 @@ static const struct dw_mipi_dsi_host_ops imx93_dsi_host_ops = {
 	.attach = imx93_dsi_host_attach,
 };
 
-static int imx93_dsi_probe(struct platform_device *pdev)
+static int imx93_dsi_parse_dt(struct imx93_dsi *dsi)
 {
-	struct device *dev = &pdev->dev;
+	struct device *dev = dsi->dev;
 	struct device_node *np = dev->of_node;
-	struct imx93_dsi *dsi;
 	int ret;
 
-	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
-	if (!dsi)
-		return -ENOMEM;
-
 	dsi->regmap = syscon_regmap_lookup_by_phandle(np, "fsl,media-blk-ctrl");
 	if (IS_ERR(dsi->regmap)) {
 		ret = PTR_ERR(dsi->regmap);
@@ -845,6 +1327,46 @@ static int imx93_dsi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	return 0;
+}
+
+static int imx95_dsi_parse_dt(struct platform_device *pdev, struct imx93_dsi *dsi)
+{
+	struct device *dev = dsi->dev;
+	struct device_node *np = dev->of_node;
+
+	dsi->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(dsi->base))
+		return PTR_ERR(dsi->base);
+
+	dsi->mst = syscon_regmap_lookup_by_phandle(np, "fsl,disp-master-csr");
+	if (IS_ERR(dsi->mst))
+		return dev_err_probe(dev, PTR_ERR(dsi->mst),
+				     "failed to get master CSR\n");
+
+	dsi->str = syscon_regmap_lookup_by_phandle(np, "fsl,disp-stream-csr");
+	if (IS_ERR(dsi->str))
+		return dev_err_probe(dev, PTR_ERR(dsi->str),
+				     "failed to get stream CSR\n");
+
+	dsi->phy = syscon_regmap_lookup_by_phandle(np, "fsl,mipi-combo-phy-csr");
+	if (IS_ERR(dsi->phy))
+		return dev_err_probe(dev, PTR_ERR(dsi->phy),
+				     "failed to get phy CSR\n");
+
+	return imx95_dsi_select_input(dsi);
+}
+
+static int imx93_dsi_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct imx93_dsi *dsi;
+	int ret;
+
+	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
+	if (!dsi)
+		return -ENOMEM;
+
 	dsi->clk_pixel = devm_clk_get(dev, "pix");
 	if (IS_ERR(dsi->clk_pixel))
 		return dev_err_probe(dev, PTR_ERR(dsi->clk_pixel),
@@ -870,11 +1392,26 @@ static int imx93_dsi_probe(struct platform_device *pdev)
 	dev_dbg(dev, "phy ref clock rate: %lu\n", dsi->ref_clk_rate);
 
 	dsi->dev = dev;
+
+	if (of_device_is_compatible(dev->of_node, "fsl,imx93-mipi-dsi"))
+		ret = imx93_dsi_parse_dt(dsi);
+	else
+		ret = imx95_dsi_parse_dt(pdev, dsi);
+	if (ret)
+		return ret;
+
+	dsi->pdata.base = dsi->base;
 	dsi->pdata.max_data_lanes = 4;
 	dsi->pdata.mode_valid = imx93_dsi_mode_valid;
 	dsi->pdata.mode_fixup = imx93_dsi_mode_fixup;
 	dsi->pdata.get_input_bus_fmts = imx93_dsi_get_input_bus_fmts;
-	dsi->pdata.phy_ops = &imx93_dsi_phy_ops;
+	if (of_device_is_compatible(dev->of_node, "fsl,imx93-mipi-dsi")) {
+		dsi->pdata.phy_ops = &imx93_dsi_phy_ops;
+		dsi->fixed_format = MEDIA_BUS_FMT_RGB888_1X24;
+	} else {
+		dsi->pdata.phy_ops = &imx95_dsi_phy_ops;
+		dsi->fixed_format = MEDIA_BUS_FMT_RGB888_1X36_CPADLO;
+	}
 	dsi->pdata.host_ops = &imx93_dsi_host_ops;
 	dsi->pdata.priv_data = dsi;
 	platform_set_drvdata(pdev, dsi);
@@ -896,6 +1433,7 @@ static void imx93_dsi_remove(struct platform_device *pdev)
 
 static const struct of_device_id imx93_dsi_dt_ids[] = {
 	{ .compatible = "fsl,imx93-mipi-dsi", },
+	{ .compatible = "fsl,imx95-mipi-dsi", },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, imx93_dsi_dt_ids);
-- 
2.51.0

