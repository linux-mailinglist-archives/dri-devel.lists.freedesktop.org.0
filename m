Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A49A8BCF1C
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 15:36:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49DE310FCE5;
	Mon,  6 May 2024 13:36:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fXCiQTLN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20AAD10FCBC
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 13:36:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 32F85CE0E70;
 Mon,  6 May 2024 13:36:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6620FC4AF67;
 Mon,  6 May 2024 13:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715002576;
 bh=t32YVBoUFvxxQC9832AhjslFW+xryk5tC8Zkli2Jjbk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=fXCiQTLNBW1QCbwM7CA/NjrZt96tU22qx432VWneCzxNbb+h6R9ts6xbg+AZULVjd
 QvxeG3U8al57+bnJxGuLJwXx2M9ALysruModd3d6cigU04CYQYiJ2ubYIpasrIwAx6
 5SYK0uVcJBVY20IB/vG3nwXoHtMpWNZdqOIjT4xCn/DdoI7pmUoadUM596UpFDnX9r
 oqlyFj/rA3QFjb0m0EhTHVcunpddivBJDmJsJsORD8iCvhfFUuEywBKucFme8QNKfP
 jLEiW7p0Ynizwy9ux3agCH8KktVkN4Wn9UQuYegwOXLO3pZXuBaxaPY8dMTr9qpcQT
 cheJ0Vaq/mw0A==
From: Michael Walle <mwalle@kernel.org>
Date: Mon, 06 May 2024 15:34:44 +0200
Subject: [PATCH 15/20] drm/bridge: tc358775: dynamically configure DSI link
 settings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240506-tc358775-fix-powerup-v1-15-545dcf00b8dd@kernel.org>
References: <20240506-tc358775-fix-powerup-v1-0-545dcf00b8dd@kernel.org>
In-Reply-To: <20240506-tc358775-fix-powerup-v1-0-545dcf00b8dd@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sam Ravnborg <sam@ravnborg.org>, Vinay Simha BN <simhavcs@gmail.com>, 
 Tony Lindgren <tony@atomide.com>
Cc: Daniel Semkowicz <dse@thaumatec.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Michael Walle <mwalle@kernel.org>
X-Mailer: b4 0.12.4
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

Instead of hardcoding the settings for just one (unknown) particular
frequency and lane setting, compute the DSI link parameters using the
handy phy_mipi_dphy_get_default_config() helper function.

The DSI_START and DSI_BUSY registers were removed in version 0.6 of the
datasheet. It seems that it applies to a different bridge and was just a
leftover. Remove the DSI_START handling and the (unused) DSI_BUSY macro.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/gpu/drm/bridge/Kconfig    |  1 +
 drivers/gpu/drm/bridge/tc358775.c | 58 +++++++++++++++++++++++----------------
 2 files changed, 35 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index c621be1a99a8..ed018d6f1da3 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -349,6 +349,7 @@ config DRM_TOSHIBA_TC358775
 	select REGMAP_I2C
 	select DRM_PANEL
 	select DRM_MIPI_DSI
+	select GENERIC_PHY_MIPI_DPHY
 	help
 	  Toshiba TC358775 DSI/LVDS bridge chip driver.
 
diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
index e3fba7ac71ec..33a97ddba7b5 100644
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -19,6 +19,7 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
+#include <linux/phy/phy-mipi-dphy.h>
 
 #include <asm/unaligned.h>
 
@@ -49,12 +50,14 @@
 
 /* DSI PPI Layer Registers */
 #define PPI_STARTPPI    0x0104  /* START control bit of PPI-TX function. */
-#define PPI_START_FUNCTION      1
+#define PPI_STARTPPI_STARTPPI	BIT(0)
 
 #define PPI_BUSYPPI     0x0108
 #define PPI_LINEINITCNT 0x0110  /* Line Initialization Wait Counter  */
 #define PPI_LPTXTIMECNT 0x0114
 #define PPI_LANEENABLE  0x0134  /* Enables each lane at the PPI layer. */
+#define LANEENABLE_CLEN	BIT(0)
+#define LANEENABLE_L0EN	BIT(1)
 #define PPI_TX_RX_TA    0x013C  /* DSI Bus Turn Around timing parameters */
 
 /* Analog timer function enable */
@@ -89,10 +92,7 @@
 #define PPI_CLRSIPO     0x01E4  /* Clear SIPO values, Slave mode use only. */
 #define HSTIMEOUT       0x01F0  /* HS Rx Time Out Counter */
 #define HSTIMEOUTENABLE 0x01F4  /* Enable HS Rx Time Out Counter */
-#define DSI_STARTDSI    0x0204  /* START control bit of DSI-TX function */
-#define DSI_RX_START	1
 
-#define DSI_BUSYDSI     0x0208
 #define DSI_LANEENABLE  0x0210  /* Enables each lane at the Protocol layer. */
 #define DSI_LANESTATUS0 0x0214  /* Displays lane is in HS RX mode. */
 #define DSI_LANESTATUS1 0x0218  /* Displays lane is in ULPS or STOP state */
@@ -174,21 +174,12 @@ enum {
 /* Chip ID and Revision ID Register */
 #define IDREG           0x0580
 
-#define LPX_PERIOD		4
-#define TTA_GET			0x40000
-#define TTA_SURE		6
-#define SINGLE_LINK		1
-#define DUAL_LINK		2
-
 #define TC358775XBG_ID  0x00007500
 
 /* Debug Registers */
 #define DEBUG00         0x05A0  /* Debug */
 #define DEBUG01         0x05A4  /* LVDS Data */
 
-#define DSI_CLEN_BIT		BIT(0)
-#define L0EN BIT(1)
-
 enum tc358775_ports {
 	TC358775_DSI_IN,
 	TC358775_LVDS_OUT0,
@@ -314,23 +305,42 @@ static const struct reg_sequence tc_lvmux_jeida18_24[] = {
 	{ LV_MX2427, LV_MX(LVI_HS, LVI_VS, LVI_DE, LVI_R0) },
 };
 
-static void tc358775_configure_dsi(struct tc_data *tc)
+/* All the DSI timing is counted by the HS byte clock internally */
+static uint32_t tc358775_ps_to_cnt(unsigned long long ps,
+				   struct phy_configure_opts_mipi_dphy *cfg)
 {
+	unsigned long hs_byte_clk = cfg->hs_clk_rate / 8;
+
+	return DIV_ROUND_UP(ps * hs_byte_clk, PSEC_PER_SEC);
+}
+
+static void tc358775_configure_dsi(struct tc_data *tc, unsigned int pixelclk)
+{
+	int bpp = mipi_dsi_pixel_format_to_bpp(tc->dsi->format);
+	struct phy_configure_opts_mipi_dphy cfg;
 	unsigned int val;
 
-	regmap_write(tc->regmap, PPI_TX_RX_TA, TTA_GET | TTA_SURE);
-	regmap_write(tc->regmap, PPI_LPTXTIMECNT, LPX_PERIOD);
-	regmap_write(tc->regmap, PPI_D0S_CLRSIPOCOUNT, 3);
-	regmap_write(tc->regmap, PPI_D1S_CLRSIPOCOUNT, 3);
-	regmap_write(tc->regmap, PPI_D2S_CLRSIPOCOUNT, 3);
-	regmap_write(tc->regmap, PPI_D3S_CLRSIPOCOUNT, 3);
+	phy_mipi_dphy_get_default_config(pixelclk * 1000, bpp,
+					 tc->num_dsi_lanes, &cfg);
+
+	regmap_write(tc->regmap, PPI_TX_RX_TA,
+		     (tc358775_ps_to_cnt(cfg.ta_get, &cfg) << 16) |
+		     tc358775_ps_to_cnt(cfg.ta_sure, &cfg));
+	regmap_write(tc->regmap, PPI_LPTXTIMECNT,
+		     tc358775_ps_to_cnt(cfg.lpx, &cfg));
+
+	val = tc358775_ps_to_cnt(cfg.hs_settle, &cfg);
+	regmap_write(tc->regmap, PPI_D0S_CLRSIPOCOUNT, val);
+	regmap_write(tc->regmap, PPI_D1S_CLRSIPOCOUNT, val);
+	regmap_write(tc->regmap, PPI_D2S_CLRSIPOCOUNT, val);
+	regmap_write(tc->regmap, PPI_D3S_CLRSIPOCOUNT, val);
 
-	val = ((L0EN << tc->num_dsi_lanes) - L0EN) | DSI_CLEN_BIT;
+	val = LANEENABLE_CLEN;
+	val |= (LANEENABLE_L0EN << tc->num_dsi_lanes) - LANEENABLE_L0EN;
 	regmap_write(tc->regmap, PPI_LANEENABLE, val);
 	regmap_write(tc->regmap, DSI_LANEENABLE, val);
 
-	regmap_write(tc->regmap, PPI_STARTPPI, PPI_START_FUNCTION);
-	regmap_write(tc->regmap, DSI_STARTDSI, DSI_RX_START);
+	regmap_write(tc->regmap, PPI_STARTPPI, PPI_STARTPPI_STARTPPI);
 }
 
 static void tc358775_configure_lvds_timings(struct tc_data *tc,
@@ -461,7 +471,7 @@ static void tc358775_bridge_enable(struct drm_bridge *bridge)
 		     SYS_RST_I2CM);
 	usleep_range(30000, 40000);
 
-	tc358775_configure_dsi(tc);
+	tc358775_configure_dsi(tc, mode->crtc_clock);
 	tc358775_configure_lvds_timings(tc, mode);
 	tc358775_configure_pll(tc, mode->crtc_clock);
 	tc358775_configure_color_mapping(tc, connector->display_info.bus_formats[0]);

-- 
2.39.2

