Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0446F4BC35E
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 01:29:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0944F10EA7E;
	Sat, 19 Feb 2022 00:29:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A459E10E180
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Feb 2022 00:29:07 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 0864583BB0;
 Sat, 19 Feb 2022 01:29:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1645230546;
 bh=OCkQAsxoUpuY5fWMkO0fSy3ic5e8fU+Ljiosq6sOEfg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZMnNyNGo8pdo1XDaHMNTZqw0hg5ozz7zt/H/mLxWP7EaEmKGqsT2f7Zw/jI7mHOUn
 YCp0SSR8ze36rKTnchQHlWi4iTWb12aJfx3sI2DL9wJdrz6CoC+g8n/t91D3/sHn4p
 PdLnuzAnchXcND/ahCQxHWLHKY3npVQa9uZW4KnNivO/CNS40uWibpHaR2aNk8+bad
 ChgGJaCwRFYoH7ES4ifS9/XHngQgmBm9Yl2D0mARuU7Rn+qm2id0zdER5DyAG+UG6S
 kCoSFmWGfX/A7pP5Jr5rSWa+L7E0qheUR4yAoM7dr2HPtBk40JNf95VTCVpqoe5e1V
 yMS3IuenJzphA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 7/7] drm/bridge: tc358767: Add support for PLL clock
 derivation from DSI HS clock
Date: Sat, 19 Feb 2022 01:28:44 +0100
Message-Id: <20220219002844.362157-8-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220219002844.362157-1-marex@denx.de>
References: <20220219002844.362157-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <narmstrong@baylibre.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The TC358767/TC358867/TC9595 are all capable of operating without RefClk
Xtal in DSI-to-DPI mode. In this mode of operation, the chip PLLs are fed
with clock derived from the DSI HS clock.

The SYSPLL is fed from DSI HS clock divided by 2*7 and the resulting clock
must match the allowed RefClk supported by the chip, which is either of
13 MHz, 26 MHz, 19.2 MHz, 38.4 MHz and no other RefClk clock are allowed.
That limits the allowed DSI HS clock as well. The PixelPLL is fed directly
with DSI HS clock SDR and derives DPI pixel clock from those clock.

In order to impose these very specific limitations on DSI HS clock, this
patch implements .atomic_get_input_bus_cfgs callback and calculates the
most suitable clock to be passed on to the DSI host bridge.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/bridge/tc358767.c | 97 +++++++++++++++++++++++++------
 1 file changed, 79 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 2b9fceb1333fa..98ea07912f721 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -250,11 +250,13 @@
 #define PLLEN				BIT(0)
 #define PXL_PLLPARAM		0x0914
 #define IN_SEL_REFCLK			(0 << 14)
+#define IN_SEL_DSI_HSCK			(1 << 14)
 #define SYS_PLLPARAM		0x0918
 #define REF_FREQ_38M4			(0 << 8) /* 38.4 MHz */
 #define REF_FREQ_19M2			(1 << 8) /* 19.2 MHz */
 #define REF_FREQ_26M			(2 << 8) /* 26 MHz */
 #define REF_FREQ_13M			(3 << 8) /* 13 MHz */
+#define SYSCLK_SEL_DSI_HSCLK		(1 << 4)
 #define SYSCLK_SEL_LSCLK		(0 << 4)
 #define LSCLK_DIV_1			(0 << 0)
 #define LSCLK_DIV_2			(1 << 0)
@@ -492,6 +494,27 @@ static u32 tc_srcctrl(struct tc_data *tc)
 	return reg;
 }
 
+static int tc_mode_to_refclk(struct tc_data *tc, struct drm_display_mode *mode)
+{
+	u32 clock;
+
+	/* Minimum DSI clock lane clock. */
+	clock = (mode->htotal * mode->vtotal * 24 * 60) / tc->dsi_lanes / 2;
+	clock /= 7;	/* DSIClk/7 */
+
+	/* Round the DSI clock to nearest supported faster clock. */
+	if (clock < 13000000)		/* DSIClk / 2 / 7 = 13 MHz RefClk */
+		return 13000000;
+	else if (clock < 19200000)	/* DSIClk / 2 / 7 = 19.2 MHz RefClk */
+		return 19200000;
+	else if (clock < 26000000)	/* DSIClk / 2 / 7 = 26 MHz RefClk */
+		return 26000000;
+	else if (clock < 38400000)	/* DSIClk / 2 / 7 = 38.4 MHz RefClk */
+		return 38400000;
+	else
+		return 0;
+}
+
 static int tc_pllupdate(struct tc_data *tc, unsigned int pllctrl)
 {
 	int ret;
@@ -508,6 +531,7 @@ static int tc_pllupdate(struct tc_data *tc, unsigned int pllctrl)
 
 static int tc_pxl_pll_en(struct tc_data *tc, u32 refclk, u32 pixelclock)
 {
+	unsigned long rate;
 	int ret;
 	int i_pre, best_pre = 1;
 	int i_post, best_post = 1;
@@ -596,10 +620,17 @@ static int tc_pxl_pll_en(struct tc_data *tc, u32 refclk, u32 pixelclock)
 	pxl_pllparam  = vco_hi << 24; /* For PLL VCO >= 300 MHz = 1 */
 	pxl_pllparam |= ext_div[best_pre] << 20; /* External Pre-divider */
 	pxl_pllparam |= ext_div[best_post] << 16; /* External Post-divider */
-	pxl_pllparam |= IN_SEL_REFCLK; /* Use RefClk as PLL input */
 	pxl_pllparam |= best_div << 8; /* Divider for PLL RefClk */
 	pxl_pllparam |= best_mul; /* Multiplier for PLL */
 
+	rate = clk_get_rate(tc->refclk);
+
+	/* DSI-to-DPI mode with clock inferred from DSI HS */
+	if (rate == 0 && tc->bridge.type == DRM_MODE_CONNECTOR_DPI)
+		pxl_pllparam |= IN_SEL_DSI_HSCK; /* Use DSI HSCK as PLL input */
+	else
+		pxl_pllparam |= IN_SEL_REFCLK; /* Use RefClk as PLL input */
+
 	ret = regmap_write(tc->regmap, PXL_PLLPARAM, pxl_pllparam);
 	if (ret)
 		return ret;
@@ -637,9 +668,19 @@ static int tc_stream_clock_calc(struct tc_data *tc)
 static int tc_set_syspllparam(struct tc_data *tc)
 {
 	unsigned long rate;
-	u32 pllparam = SYSCLK_SEL_LSCLK | LSCLK_DIV_2;
+	u32 pllparam = LSCLK_DIV_2;
 
 	rate = clk_get_rate(tc->refclk);
+
+	/* DSI-to-DPI mode with clock inferred from DSI HS */
+	if (rate == 0 && tc->bridge.type == DRM_MODE_CONNECTOR_DPI) {
+		pllparam |= SYSCLK_SEL_DSI_HSCLK;
+		/* Get RefClk rate from DSI HS clock. */
+		rate = tc_mode_to_refclk(tc, &tc->mode);
+	} else {
+		pllparam |= SYSCLK_SEL_LSCLK;
+	}
+
 	switch (rate) {
 	case 38400000:
 		pllparam |= REF_FREQ_38M4;
@@ -1266,9 +1307,18 @@ static int tc_dpi_stream_enable(struct tc_data *tc)
 	if (ret)
 		return ret;
 
+	value = clk_get_rate(tc->refclk);
+	if (!value) {
+		/*
+		 * If RefClk Xtal is not connected, it is the DSI HS clock
+		 * SDR that is directly fed into the Pixel PLL and used as
+		 * input clock. Hence no multiplication of this value by 2.
+		 */
+		value = 7 * tc_mode_to_refclk(tc, &tc->mode);
+	}
+
 	/* Pixel PLL must always be enabled for DPI mode */
-	ret = tc_pxl_pll_en(tc, clk_get_rate(tc->refclk),
-			    1000 * tc->mode.clock);
+	ret = tc_pxl_pll_en(tc, value, 1000 * tc->mode.clock);
 	if (ret)
 		return ret;
 
@@ -1781,30 +1831,38 @@ static void tc_edp_bridge_detach(struct drm_bridge *bridge)
 	drm_dp_aux_unregister(&bridge_to_tc(bridge)->aux);
 }
 
-#define MAX_INPUT_SEL_FORMATS	1
+#define MAX_INPUT_SEL_CONFIGS	1
 
-static u32 *
-tc_dpi_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+static struct drm_bus_cfg *
+tc_dpi_atomic_get_input_bus_cfgs(struct drm_bridge *bridge,
 				    struct drm_bridge_state *bridge_state,
 				    struct drm_crtc_state *crtc_state,
 				    struct drm_connector_state *conn_state,
-				    u32 output_fmt,
-				    unsigned int *num_input_fmts)
+				    struct drm_bus_cfg *out_cfg,
+				    unsigned int *num_input_cfgs)
 {
-	u32 *input_fmts;
+	struct tc_data *tc = bridge_to_tc(bridge);
+	struct drm_bus_cfg *input_cfgs;
+	u32 clock;
 
-	*num_input_fmts = 0;
+	/* Minimum DSI clock lane clock in kHz (DSIClk / 7 = RefClk). */
+	clock = 2 * 7 * tc_mode_to_refclk(tc, &crtc_state->adjusted_mode) / 1000;
+	if (clock == 0)
+		return NULL;
 
-	input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts),
+	*num_input_cfgs = 0;
+
+	input_cfgs = kcalloc(MAX_INPUT_SEL_CONFIGS, sizeof(*input_cfgs),
 			     GFP_KERNEL);
-	if (!input_fmts)
+	if (!input_cfgs)
 		return NULL;
 
 	/* This is the DSI-end bus format */
-	input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
-	*num_input_fmts = 1;
+	input_cfgs[0].format = MEDIA_BUS_FMT_RGB888_1X24;
+	input_cfgs[0].clock = clock;	/* kHz */
+	*num_input_cfgs = MAX_INPUT_SEL_CONFIGS;
 
-	return input_fmts;
+	return input_cfgs;
 }
 
 static const struct drm_bridge_funcs tc_dpi_bridge_funcs = {
@@ -1817,7 +1875,7 @@ static const struct drm_bridge_funcs tc_dpi_bridge_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
-	.atomic_get_input_bus_fmts = tc_dpi_atomic_get_input_bus_fmts,
+	.atomic_get_input_bus_cfgs = tc_dpi_atomic_get_input_bus_cfgs,
 };
 
 static const struct drm_bridge_funcs tc_bridge_funcs = {
@@ -2107,7 +2165,10 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		usleep_range(5000, 10000);
 	}
 
-	tc->refclk = devm_clk_get(dev, "ref");
+	if (tc->bridge.type == DRM_MODE_CONNECTOR_DPI)
+		tc->refclk = devm_clk_get_optional(dev, "ref");
+	else
+		tc->refclk = devm_clk_get(dev, "ref");
 	if (IS_ERR(tc->refclk)) {
 		ret = PTR_ERR(tc->refclk);
 		dev_err(dev, "Failed to get refclk: %d\n", ret);
-- 
2.34.1

