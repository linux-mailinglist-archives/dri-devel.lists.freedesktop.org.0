Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D96D45FC5E
	for <lists+dri-devel@lfdr.de>; Sat, 27 Nov 2021 04:24:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F8C86EC53;
	Sat, 27 Nov 2021 03:24:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 494A56EC40
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Nov 2021 03:24:25 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 73C8F805F9;
 Sat, 27 Nov 2021 04:24:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1637983463;
 bh=p3XVKrl6BQYeR2xZ+XefoFnqpBNv8buDndndAEoFdUc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=joc+SaBH6mE5x5j7adZlKcDcAaSmWCUiHtvumvvG5Y4ViStLIb9BFhR5Pwt0tT8yP
 xCEKd3lkTxwsIZ8O9Iwn4MDpW1KKI2m6MrjZnvvuzlVcHGK1wdFmCODjRdMogONBjz
 Uu86wQpvwVmog8vcvmS+rw/TaaDy1ata1NUNebke2d7UQuZ7gq09gYSoC9w9d04R/O
 +FX0nIiKN2HxcznLsPzTWT5Sk1tOD00ahiDUh10xLvtXmk64oBXRCCG0KIKMSknxJh
 arr9XE41jpEDs4GdJV0RyQUwgZH3oaBCbzn6pDWugT+7kvuDldk07P+L4ZrGrp9E5s
 bROvOWgg0lyGA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm/bridge: tc358767: Add DSI-to-DPI mode support
Date: Sat, 27 Nov 2021 04:24:05 +0100
Message-Id: <20211127032405.283435-4-marex@denx.de>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211127032405.283435-1-marex@denx.de>
References: <20211127032405.283435-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
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
Cc: Marek Vasut <marex@denx.de>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The TC358767/TC358867/TC9595 are all capable of operating in multiple
modes, DPI-to-(e)DP, DSI-to-(e)DP, DSI-to-DPI. Add support for the
DSI-to-DPI mode.

This requires skipping most of the (e)DP initialization code, which is
currently a large part of this driver, hence it is better to have far
simpler separate tc_dpi_bridge_funcs and their implementation.

The configuration of DPI output is also much simpler. The configuration
of the DSI input is rather similar to the other TC bridge chips.

The Pixel PLL in DPI output mode does not have the 65..150 MHz limitation
imposed on the (e)DP output mode, so this limitation is skipped to permit
operating panels with far slower pixel clock, even below 9 MHz. This mode
of operation of the PLL is valid and tested.

The detection of bridge mode is now added into tc_probe_bridge_mode(),
where in case a DPI panel is found on port@1 endpoint@1, the mode is
assumed to be DSI-to-DPI. If (e)DP is detected on port@2, the mode is
assumed to be DPI-to-(e)DP.

The DSI-to-(e)DP mode is not supported due to lack of proper hardware,
but this would be some sort of mix between the two aforementioned modes.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/bridge/tc358767.c | 443 ++++++++++++++++++++++++------
 1 file changed, 356 insertions(+), 87 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 0e16ae2461fd..c653a0bd0f35 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1,6 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * tc358767 eDP bridge driver
+ * TC358767/TC358867/TC9595 DSI/DPI-to-DPI/(e)DP bridge driver
+ *
+ * The TC358767/TC358867/TC9595 can operate in multiple modes.
+ * The following modes are supported:
+ *   DPI->(e)DP -- supported
+ *   DSI->DPI .... supported
+ *   DSI->(e)DP .. NOT supported
  *
  * Copyright (C) 2016 CogentEmbedded Inc
  * Author: Andrey Gusakov <andrey.gusakov@cogentembedded.com>
@@ -29,6 +35,7 @@
 #include <drm/drm_bridge.h>
 #include <drm/drm_dp_helper.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
@@ -36,7 +43,35 @@
 
 /* Registers */
 
-/* Display Parallel Interface */
+/* PPI layer registers */
+#define PPI_STARTPPI		0x0104 /* START control bit */
+#define PPI_LPTXTIMECNT		0x0114 /* LPTX timing signal */
+#define LPX_PERIOD			3
+#define PPI_LANEENABLE		0x0134
+#define PPI_TX_RX_TA		0x013c
+#define TTA_GET				0x40000
+#define TTA_SURE			6
+#define PPI_D0S_ATMR		0x0144
+#define PPI_D1S_ATMR		0x0148
+#define PPI_D0S_CLRSIPOCOUNT	0x0164 /* Assertion timer for Lane 0 */
+#define PPI_D1S_CLRSIPOCOUNT	0x0168 /* Assertion timer for Lane 1 */
+#define PPI_D2S_CLRSIPOCOUNT	0x016c /* Assertion timer for Lane 2 */
+#define PPI_D3S_CLRSIPOCOUNT	0x0170 /* Assertion timer for Lane 3 */
+#define PPI_START_FUNCTION		BIT(0)
+
+/* DSI layer registers */
+#define DSI_STARTDSI		0x0204 /* START control bit of DSI-TX */
+#define DSI_LANEENABLE		0x0210 /* Enables each lane */
+#define DSI_RX_START			BIT(0)
+
+/* Lane enable PPI and DSI register bits */
+#define LANEENABLE_CLEN		BIT(0)
+#define LANEENABLE_L0EN		BIT(1)
+#define LANEENABLE_L1EN		BIT(2)
+#define LANEENABLE_L2EN		BIT(1)
+#define LANEENABLE_L3EN		BIT(2)
+
+/* Display Parallel Input Interface */
 #define DPIPXLFMT		0x0440
 #define VS_POL_ACTIVE_LOW		(1 << 10)
 #define HS_POL_ACTIVE_LOW		(1 << 9)
@@ -48,6 +83,14 @@
 #define DPI_BPP_RGB666			(1 << 0)
 #define DPI_BPP_RGB565			(2 << 0)
 
+/* Display Parallel Output Interface */
+#define POCTRL			0x0448
+#define POCTRL_S2P			BIT(7)
+#define POCTRL_PCLK_POL			BIT(3)
+#define POCTRL_VS_POL			BIT(2)
+#define POCTRL_HS_POL			BIT(1)
+#define POCTRL_DE_POL			BIT(0)
+
 /* Video Path */
 #define VPCTRL0			0x0450
 #define VSDELAY			GENMASK(31, 20)
@@ -247,6 +290,9 @@ struct tc_data {
 	struct drm_bridge	*panel_bridge;
 	struct drm_connector	connector;
 
+	struct mipi_dsi_device	*dsi;
+	u8			dsi_lanes;
+
 	/* link settings */
 	struct tc_edp_link	link;
 
@@ -502,8 +548,10 @@ static int tc_pxl_pll_en(struct tc_data *tc, u32 refclk, u32 pixelclock)
 				/*
 				 * refclk * mul / (ext_pre_div * pre_div)
 				 * should be in the 150 to 650 MHz range
+				 * for (e)DP
 				 */
-				if ((clk > 650000000) || (clk < 150000000))
+				if ((tc->bridge.type != DRM_MODE_CONNECTOR_DPI) &&
+				    ((clk > 650000000) || (clk < 150000000)))
 					continue;
 
 				clk = clk / ext_div[i_post];
@@ -741,7 +789,7 @@ static int tc_set_video_mode(struct tc_data *tc,
 	int upper_margin = mode->vtotal - mode->vsync_end;
 	int lower_margin = mode->vsync_start - mode->vdisplay;
 	int vsync_len = mode->vsync_end - mode->vsync_start;
-	u32 dp0_syncval;
+	u32 dp0_syncval, value;
 	u32 bits_per_pixel = 24;
 	u32 in_bw, out_bw;
 
@@ -815,56 +863,70 @@ static int tc_set_video_mode(struct tc_data *tc,
 	if (ret)
 		return ret;
 
-	/* DP Main Stream Attributes */
-	vid_sync_dly = hsync_len + left_margin + mode->hdisplay;
-	ret = regmap_write(tc->regmap, DP0_VIDSYNCDELAY,
-		 FIELD_PREP(THRESH_DLY, max_tu_symbol) |
-		 FIELD_PREP(VID_SYNC_DLY, vid_sync_dly));
+	if (tc->bridge.type == DRM_MODE_CONNECTOR_DPI) {
+		value = POCTRL_S2P;
 
-	ret = regmap_write(tc->regmap, DP0_TOTALVAL,
-			   FIELD_PREP(H_TOTAL, mode->htotal) |
-			   FIELD_PREP(V_TOTAL, mode->vtotal));
-	if (ret)
-		return ret;
+		if (tc->mode.flags & DRM_MODE_FLAG_NHSYNC)
+			value |= POCTRL_HS_POL;
 
-	ret = regmap_write(tc->regmap, DP0_STARTVAL,
-			   FIELD_PREP(H_START, left_margin + hsync_len) |
-			   FIELD_PREP(V_START, upper_margin + vsync_len));
-	if (ret)
-		return ret;
+		if (tc->mode.flags & DRM_MODE_FLAG_NVSYNC)
+			value |= POCTRL_VS_POL;
 
-	ret = regmap_write(tc->regmap, DP0_ACTIVEVAL,
-			   FIELD_PREP(V_ACT, mode->vdisplay) |
-			   FIELD_PREP(H_ACT, mode->hdisplay));
-	if (ret)
-		return ret;
+		ret = regmap_write(tc->regmap, POCTRL, value);
+		if (ret)
+			return ret;
+	} else {
+		/* DP Main Stream Attributes */
+		vid_sync_dly = hsync_len + left_margin + mode->hdisplay;
+		ret = regmap_write(tc->regmap, DP0_VIDSYNCDELAY,
+			 FIELD_PREP(THRESH_DLY, max_tu_symbol) |
+			 FIELD_PREP(VID_SYNC_DLY, vid_sync_dly));
+
+		ret = regmap_write(tc->regmap, DP0_TOTALVAL,
+				   FIELD_PREP(H_TOTAL, mode->htotal) |
+				   FIELD_PREP(V_TOTAL, mode->vtotal));
+		if (ret)
+			return ret;
 
-	dp0_syncval = FIELD_PREP(VS_WIDTH, vsync_len) |
-		      FIELD_PREP(HS_WIDTH, hsync_len);
+		ret = regmap_write(tc->regmap, DP0_STARTVAL,
+				   FIELD_PREP(H_START, left_margin + hsync_len) |
+				   FIELD_PREP(V_START, upper_margin + vsync_len));
+		if (ret)
+			return ret;
 
-	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
-		dp0_syncval |= SYNCVAL_VS_POL_ACTIVE_LOW;
+		ret = regmap_write(tc->regmap, DP0_ACTIVEVAL,
+				   FIELD_PREP(V_ACT, mode->vdisplay) |
+				   FIELD_PREP(H_ACT, mode->hdisplay));
+		if (ret)
+			return ret;
 
-	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
-		dp0_syncval |= SYNCVAL_HS_POL_ACTIVE_LOW;
+		dp0_syncval = FIELD_PREP(VS_WIDTH, vsync_len) |
+			      FIELD_PREP(HS_WIDTH, hsync_len);
 
-	ret = regmap_write(tc->regmap, DP0_SYNCVAL, dp0_syncval);
-	if (ret)
-		return ret;
+		if (mode->flags & DRM_MODE_FLAG_NVSYNC)
+			dp0_syncval |= SYNCVAL_VS_POL_ACTIVE_LOW;
 
-	ret = regmap_write(tc->regmap, DPIPXLFMT,
-			   VS_POL_ACTIVE_LOW | HS_POL_ACTIVE_LOW |
-			   DE_POL_ACTIVE_HIGH | SUB_CFG_TYPE_CONFIG1 |
-			   DPI_BPP_RGB888);
-	if (ret)
-		return ret;
+		if (mode->flags & DRM_MODE_FLAG_NHSYNC)
+			dp0_syncval |= SYNCVAL_HS_POL_ACTIVE_LOW;
 
-	ret = regmap_write(tc->regmap, DP0_MISC,
-			   FIELD_PREP(MAX_TU_SYMBOL, max_tu_symbol) |
-			   FIELD_PREP(TU_SIZE, TU_SIZE_RECOMMENDED) |
-			   BPC_8);
-	if (ret)
-		return ret;
+		ret = regmap_write(tc->regmap, DP0_SYNCVAL, dp0_syncval);
+		if (ret)
+			return ret;
+
+		ret = regmap_write(tc->regmap, DPIPXLFMT,
+				   VS_POL_ACTIVE_LOW | HS_POL_ACTIVE_LOW |
+				   DE_POL_ACTIVE_HIGH | SUB_CFG_TYPE_CONFIG1 |
+				   DPI_BPP_RGB888);
+		if (ret)
+			return ret;
+
+		ret = regmap_write(tc->regmap, DP0_MISC,
+				   FIELD_PREP(MAX_TU_SYMBOL, max_tu_symbol) |
+				   FIELD_PREP(TU_SIZE, TU_SIZE_RECOMMENDED) |
+				   BPC_8);
+		if (ret)
+			return ret;
+	}
 
 	return 0;
 }
@@ -1164,7 +1226,76 @@ static int tc_main_link_disable(struct tc_data *tc)
 	return regmap_write(tc->regmap, DP0CTL, 0);
 }
 
-static int tc_stream_enable(struct tc_data *tc)
+static int tc_dpi_stream_enable(struct tc_data *tc)
+{
+	int ret;
+	u32 value;
+
+	dev_dbg(tc->dev, "enable video stream\n");
+
+	/* Setup PLL */
+	ret = tc_set_syspllparam(tc);
+	if (ret)
+		return ret;
+
+	/* Pixel PLL must always be enabled for DPI mode */
+	ret = tc_pxl_pll_en(tc, clk_get_rate(tc->refclk),
+			    1000 * tc->mode.clock);
+	if (ret)
+		return ret;
+
+	regmap_write(tc->regmap, PPI_D0S_CLRSIPOCOUNT, 3);
+	regmap_write(tc->regmap, PPI_D1S_CLRSIPOCOUNT, 3);
+	regmap_write(tc->regmap, PPI_D2S_CLRSIPOCOUNT, 3);
+	regmap_write(tc->regmap, PPI_D3S_CLRSIPOCOUNT, 3);
+	regmap_write(tc->regmap, PPI_D0S_ATMR, 0);
+	regmap_write(tc->regmap, PPI_D1S_ATMR, 0);
+	regmap_write(tc->regmap, PPI_TX_RX_TA, TTA_GET | TTA_SURE);
+	regmap_write(tc->regmap, PPI_LPTXTIMECNT, LPX_PERIOD);
+
+	value = ((LANEENABLE_L0EN << tc->dsi_lanes) - LANEENABLE_L0EN) |
+		LANEENABLE_CLEN;
+	regmap_write(tc->regmap, PPI_LANEENABLE, value);
+	regmap_write(tc->regmap, DSI_LANEENABLE, value);
+
+	ret = tc_set_video_mode(tc, &tc->mode);
+	if (ret)
+		return ret;
+
+	/* Set input interface */
+	value = DP0_AUDSRC_NO_INPUT;
+	if (tc_test_pattern)
+		value |= DP0_VIDSRC_COLOR_BAR;
+	else
+		value |= DP0_VIDSRC_DSI_RX;
+	ret = regmap_write(tc->regmap, SYSCTRL, value);
+	if (ret)
+		return ret;
+
+	msleep(100);
+
+	regmap_write(tc->regmap, PPI_STARTPPI, PPI_START_FUNCTION);
+	regmap_write(tc->regmap, DSI_STARTDSI, DSI_RX_START);
+
+	return 0;
+}
+
+static int tc_dpi_stream_disable(struct tc_data *tc)
+{
+	int ret;
+
+	dev_dbg(tc->dev, "disable video stream\n");
+
+	ret = regmap_update_bits(tc->regmap, DP0CTL, VID_EN, 0);
+	if (ret)
+		return ret;
+
+	tc_pxl_pll_dis(tc);
+
+	return 0;
+}
+
+static int tc_edp_stream_enable(struct tc_data *tc)
 {
 	int ret;
 	u32 value;
@@ -1219,7 +1350,7 @@ static int tc_stream_enable(struct tc_data *tc)
 	return 0;
 }
 
-static int tc_stream_disable(struct tc_data *tc)
+static int tc_edp_stream_disable(struct tc_data *tc)
 {
 	int ret;
 
@@ -1291,7 +1422,36 @@ static int tc_hardware_init(struct tc_data *tc)
 	return 0;
 }
 
-static void tc_bridge_enable(struct drm_bridge *bridge)
+static void tc_dpi_bridge_enable(struct drm_bridge *bridge)
+{
+	struct tc_data *tc = bridge_to_tc(bridge);
+	int ret;
+
+	ret = tc_hardware_init(tc);
+	if (ret < 0) {
+		dev_err(tc->dev, "failed to initialize bridge: %d\n", ret);
+		return;
+	}
+
+	ret = tc_dpi_stream_enable(tc);
+	if (ret < 0) {
+		dev_err(tc->dev, "main link stream start error: %d\n", ret);
+		tc_main_link_disable(tc);
+		return;
+	}
+}
+
+static void tc_dpi_bridge_disable(struct drm_bridge *bridge)
+{
+	struct tc_data *tc = bridge_to_tc(bridge);
+	int ret;
+
+	ret = tc_dpi_stream_disable(tc);
+	if (ret < 0)
+		dev_err(tc->dev, "main link stream stop error: %d\n", ret);
+}
+
+static void tc_edp_bridge_enable(struct drm_bridge *bridge)
 {
 	struct tc_data *tc = bridge_to_tc(bridge);
 	int ret;
@@ -1314,7 +1474,7 @@ static void tc_bridge_enable(struct drm_bridge *bridge)
 		return;
 	}
 
-	ret = tc_stream_enable(tc);
+	ret = tc_edp_stream_enable(tc);
 	if (ret < 0) {
 		dev_err(tc->dev, "main link stream start error: %d\n", ret);
 		tc_main_link_disable(tc);
@@ -1322,12 +1482,12 @@ static void tc_bridge_enable(struct drm_bridge *bridge)
 	}
 }
 
-static void tc_bridge_disable(struct drm_bridge *bridge)
+static void tc_edp_bridge_disable(struct drm_bridge *bridge)
 {
 	struct tc_data *tc = bridge_to_tc(bridge);
 	int ret;
 
-	ret = tc_stream_disable(tc);
+	ret = tc_edp_stream_disable(tc);
 	if (ret < 0)
 		dev_err(tc->dev, "main link stream stop error: %d\n", ret);
 
@@ -1348,9 +1508,20 @@ static bool tc_bridge_mode_fixup(struct drm_bridge *bridge,
 	return true;
 }
 
-static enum drm_mode_status tc_mode_valid(struct drm_bridge *bridge,
-					  const struct drm_display_info *info,
-					  const struct drm_display_mode *mode)
+static enum drm_mode_status tc_dpi_mode_valid(struct drm_bridge *bridge,
+					      const struct drm_display_info *info,
+					      const struct drm_display_mode *mode)
+{
+	/* DPI interface clock limitation: upto 100 MHz */
+	if (mode->clock > 100000)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+
+static enum drm_mode_status tc_edp_mode_valid(struct drm_bridge *bridge,
+					      const struct drm_display_info *info,
+					      const struct drm_display_mode *mode)
 {
 	struct tc_data *tc = bridge_to_tc(bridge);
 	u32 req, avail;
@@ -1458,8 +1629,20 @@ static const struct drm_connector_funcs tc_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-static int tc_bridge_attach(struct drm_bridge *bridge,
-			    enum drm_bridge_attach_flags flags)
+static int tc_dpi_bridge_attach(struct drm_bridge *bridge,
+				enum drm_bridge_attach_flags flags)
+{
+	struct tc_data *tc = bridge_to_tc(bridge);
+
+	if (!tc->panel_bridge)
+		return 0;
+
+	return drm_bridge_attach(tc->bridge.encoder, tc->panel_bridge,
+				 &tc->bridge, flags);
+}
+
+static int tc_edp_bridge_attach(struct drm_bridge *bridge,
+				enum drm_bridge_attach_flags flags)
 {
 	u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
 	struct tc_data *tc = bridge_to_tc(bridge);
@@ -1511,18 +1694,26 @@ static int tc_bridge_attach(struct drm_bridge *bridge,
 	return ret;
 }
 
-static void tc_bridge_detach(struct drm_bridge *bridge)
+static void tc_edp_bridge_detach(struct drm_bridge *bridge)
 {
 	drm_dp_aux_unregister(&bridge_to_tc(bridge)->aux);
 }
 
-static const struct drm_bridge_funcs tc_bridge_funcs = {
-	.attach = tc_bridge_attach,
-	.detach = tc_bridge_detach,
-	.mode_valid = tc_mode_valid,
+static const struct drm_bridge_funcs tc_dpi_bridge_funcs = {
+	.attach = tc_dpi_bridge_attach,
+	.mode_valid = tc_dpi_mode_valid,
+	.mode_set = tc_bridge_mode_set,
+	.enable = tc_dpi_bridge_enable,
+	.disable = tc_dpi_bridge_disable,
+};
+
+static const struct drm_bridge_funcs tc_edp_bridge_funcs = {
+	.attach = tc_edp_bridge_attach,
+	.detach = tc_edp_bridge_detach,
+	.mode_valid = tc_edp_mode_valid,
 	.mode_set = tc_bridge_mode_set,
-	.enable = tc_bridge_enable,
-	.disable = tc_bridge_disable,
+	.enable = tc_edp_bridge_enable,
+	.disable = tc_edp_bridge_disable,
 	.mode_fixup = tc_bridge_mode_fixup,
 	.detect = tc_bridge_detect,
 	.get_edid = tc_get_edid,
@@ -1612,28 +1803,96 @@ static irqreturn_t tc_irq_handler(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
+static int tc_mipi_dsi_host_attach(struct tc_data *tc)
+{
+	struct device *dev = tc->dev;
+	struct device_node *host_node;
+	struct device_node *endpoint;
+	struct mipi_dsi_device *dsi;
+	struct mipi_dsi_host *host;
+	const struct mipi_dsi_device_info info = {
+		.type = "tc358767",
+		.channel = 0,
+		.node = NULL,
+	};
+	int ret;
+
+	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
+	tc->dsi_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
+	host_node = of_graph_get_remote_port_parent(endpoint);
+	host = of_find_mipi_dsi_host_by_node(host_node);
+	of_node_put(host_node);
+	of_node_put(endpoint);
+
+	if (tc->dsi_lanes < 0 || tc->dsi_lanes > 4)
+		return -EINVAL;
+
+	if (!host)
+		return -EPROBE_DEFER;
+
+	dsi = mipi_dsi_device_register_full(host, &info);
+	if (IS_ERR(dsi))
+		return dev_err_probe(dev, PTR_ERR(dsi),
+				     "failed to create dsi device\n");
+
+	tc->dsi = dsi;
+
+	dsi->lanes = tc->dsi_lanes;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0) {
+		dev_err(dev, "failed to attach dsi to host: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 static int tc_probe_bridge_mode(struct tc_data *tc)
 {
 	struct device *dev = tc->dev;
 	struct drm_panel *panel;
 	int ret;
 
-	/* port@2 is the output port */
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 2, 0, &panel, NULL);
-	if (ret && ret != -ENODEV)
+	/* port@1 is the DPI input/output port */
+	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);
+	if (ret == -EPROBE_DEFER)
 		return ret;
+	if (!ret || ret == -ENODEV) {
+		if (panel) {
+			struct drm_bridge *panel_bridge;
 
-	if (panel) {
-		struct drm_bridge *panel_bridge;
+			panel_bridge = devm_drm_panel_bridge_add(dev, panel);
+			if (IS_ERR(panel_bridge))
+				return PTR_ERR(panel_bridge);
 
-		panel_bridge = devm_drm_panel_bridge_add(dev, panel);
-		if (IS_ERR(panel_bridge))
-			return PTR_ERR(panel_bridge);
+			tc->panel_bridge = panel_bridge;
+		}
 
-		tc->panel_bridge = panel_bridge;
-		tc->bridge.type = DRM_MODE_CONNECTOR_eDP;
-	} else {
-		tc->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
+		tc->bridge.type = DRM_MODE_CONNECTOR_DPI;
+
+		return 0;
+	}
+
+	/* port@2 is the (e)DP output port */
+	ret = drm_of_find_panel_or_bridge(dev->of_node, 2, 0, &panel, NULL);
+	if (!ret || ret == -ENODEV) {
+		if (panel) {
+			struct drm_bridge *panel_bridge;
+
+			panel_bridge = devm_drm_panel_bridge_add(dev, panel);
+			if (IS_ERR(panel_bridge))
+				return PTR_ERR(panel_bridge);
+
+			tc->panel_bridge = panel_bridge;
+			tc->bridge.type = DRM_MODE_CONNECTOR_eDP;
+		} else {
+			tc->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
+		}
+
+		return 0;
 	}
 
 	return ret;
@@ -1713,26 +1972,36 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		tc->have_irq = true;
 	}
 
-	ret = tc_aux_link_setup(tc);
-	if (ret)
-		return ret;
+	if (tc->bridge.type == DRM_MODE_CONNECTOR_DPI) {
+		tc->bridge.funcs = &tc_dpi_bridge_funcs;
+	} else { /* (e)DP */
+		ret = tc_aux_link_setup(tc);
+		if (ret)
+			return ret;
 
-	/* Register DP AUX channel */
-	tc->aux.name = "TC358767 AUX i2c adapter";
-	tc->aux.dev = tc->dev;
-	tc->aux.transfer = tc_aux_transfer;
-	drm_dp_aux_init(&tc->aux);
+		/* Register DP AUX channel */
+		tc->aux.name = "TC358767 AUX i2c adapter";
+		tc->aux.dev = tc->dev;
+		tc->aux.transfer = tc_aux_transfer;
+		drm_dp_aux_init(&tc->aux);
 
-	tc->bridge.funcs = &tc_bridge_funcs;
-	if (tc->hpd_pin >= 0)
-		tc->bridge.ops |= DRM_BRIDGE_OP_DETECT;
-	tc->bridge.ops |= DRM_BRIDGE_OP_EDID;
+		tc->bridge.funcs = &tc_edp_bridge_funcs;
+		if (tc->hpd_pin >= 0)
+			tc->bridge.ops |= DRM_BRIDGE_OP_DETECT;
+		tc->bridge.ops |= DRM_BRIDGE_OP_EDID;
+	}
 
 	tc->bridge.of_node = dev->of_node;
 	drm_bridge_add(&tc->bridge);
 
 	i2c_set_clientdata(client, tc);
 
+	if (tc->bridge.type == DRM_MODE_CONNECTOR_DPI) {
+		ret = tc_mipi_dsi_host_attach(tc);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
-- 
2.33.0

