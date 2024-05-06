Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EA68BCF11
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 15:35:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A888010FAAF;
	Mon,  6 May 2024 13:35:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="m2dHoQmP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8139810FB4C
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 13:35:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E1ED4612E3;
 Mon,  6 May 2024 13:35:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 164F2C4AF67;
 Mon,  6 May 2024 13:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715002537;
 bh=U6Bf7YERTTp7pbKyaw/KQvlawb1lIEL8sDO7oaHQpZQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=m2dHoQmP7x5wG3IIBLtnmmQDyx9SqxLrTj4xJculLfFkPUhYanD4Mec7MaiTXFuie
 OZemQmAHTYr3wRlOphe8AYM8dPZ6xcCYnEltEfXZF4dW8pKm84mCH1CpZzxRPLNwtE
 riLmbUg8L0uRlJ35mL0raZ8fw2GOjNn8ev/fASj7JI4cLVx7A4RQ4dpji3RoyOyJdv
 dse37L+DdeXYMvDGg2PcU/rb6/jd+0nJPAxEiUPanNU23f4KjCXzBtfJ18hiULHKFL
 owwn2bbc2SohpQnQ2lTuscKXRRvhlktUMJPdTjqKPxZctEih5joTgkZfrOkRHaEo+4
 s+rz/aGcPin5g==
From: Michael Walle <mwalle@kernel.org>
Date: Mon, 06 May 2024 15:34:36 +0200
Subject: [PATCH 07/20] drm/bridge: tc358775: use regmap instead of open
 coded access functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240506-tc358775-fix-powerup-v1-7-545dcf00b8dd@kernel.org>
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

The DSI bridge also supports access via DSI in-band reads and writes.
Prepare the driver for that by converting all the access functions to
regmap. This also have the advantage that it will make tracing and
debugging easier and we can use all the bit manipulation helpers from
regmap.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/gpu/drm/bridge/tc358775.c | 150 +++++++++++++++++---------------------
 1 file changed, 68 insertions(+), 82 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
index 7ae86e8d4c72..b7f15164e655 100644
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -16,6 +16,7 @@
 #include <linux/media-bus-format.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
+#include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 
@@ -238,7 +239,7 @@ enum tc3587x5_type {
 };
 
 struct tc_data {
-	struct i2c_client	*i2c;
+	struct regmap		*regmap;
 	struct device		*dev;
 
 	struct drm_bridge	bridge;
@@ -309,42 +310,6 @@ static void tc_bridge_post_disable(struct drm_bridge *bridge)
 	usleep_range(10000, 11000);
 }
 
-static void d2l_read(struct i2c_client *i2c, u16 addr, u32 *val)
-{
-	int ret;
-	u8 buf_addr[2];
-
-	put_unaligned_be16(addr, buf_addr);
-	ret = i2c_master_send(i2c, buf_addr, sizeof(buf_addr));
-	if (ret < 0)
-		goto fail;
-
-	ret = i2c_master_recv(i2c, (u8 *)val, sizeof(*val));
-	if (ret < 0)
-		goto fail;
-
-	pr_debug("d2l: I2C : addr:%04x value:%08x\n", addr, *val);
-	return;
-
-fail:
-	dev_err(&i2c->dev, "Error %d reading from subaddress 0x%x\n",
-		ret, addr);
-}
-
-static void d2l_write(struct i2c_client *i2c, u16 addr, u32 val)
-{
-	u8 data[6];
-	int ret;
-
-	put_unaligned_be16(addr, data);
-	put_unaligned_le32(val, data + 2);
-
-	ret = i2c_master_send(i2c, data, ARRAY_SIZE(data));
-	if (ret < 0)
-		dev_err(&i2c->dev, "Error %d writing to subaddress 0x%x\n",
-			ret, addr);
-}
-
 /* helper function to access bus_formats */
 static struct drm_connector *get_connector(struct drm_encoder *encoder)
 {
@@ -358,12 +323,33 @@ static struct drm_connector *get_connector(struct drm_encoder *encoder)
 	return NULL;
 }
 
+static const struct reg_sequence tc_lvmux_vesa24[] = {
+	{ LV_MX0003, LV_MX(LVI_R0, LVI_R1, LVI_R2, LVI_R3) },
+	{ LV_MX0407, LV_MX(LVI_R4, LVI_R7, LVI_R5, LVI_G0) },
+	{ LV_MX0811, LV_MX(LVI_G1, LVI_G2, LVI_G6, LVI_G7) },
+	{ LV_MX1215, LV_MX(LVI_G3, LVI_G4, LVI_G5, LVI_B0) },
+	{ LV_MX1619, LV_MX(LVI_B6, LVI_B7, LVI_B1, LVI_B2) },
+	{ LV_MX2023, LV_MX(LVI_B3, LVI_B4, LVI_B5, LVI_L0) },
+	{ LV_MX2427, LV_MX(LVI_HS, LVI_VS, LVI_DE, LVI_R6) },
+};
+
+/* JEIDA-24/JEIDA-18 have the same mapping */
+static const struct reg_sequence tc_lvmux_jeida18_24[] = {
+	{ LV_MX0003, LV_MX(LVI_R2, LVI_R3, LVI_R4, LVI_R5) },
+	{ LV_MX0407, LV_MX(LVI_R6, LVI_R1, LVI_R7, LVI_G2) },
+	{ LV_MX0811, LV_MX(LVI_G3, LVI_G4, LVI_G0, LVI_G1) },
+	{ LV_MX1215, LV_MX(LVI_G5, LVI_G6, LVI_G7, LVI_B2) },
+	{ LV_MX1619, LV_MX(LVI_B0, LVI_B1, LVI_B3, LVI_B4) },
+	{ LV_MX2023, LV_MX(LVI_B5, LVI_B6, LVI_B7, LVI_L0) },
+	{ LV_MX2427, LV_MX(LVI_HS, LVI_VS, LVI_DE, LVI_R0) },
+};
+
 static void tc_bridge_enable(struct drm_bridge *bridge)
 {
 	struct tc_data *tc = bridge_to_tc(bridge);
 	u32 hback_porch, hsync_len, hfront_porch, hactive, htime1, htime2;
 	u32 vback_porch, vsync_len, vfront_porch, vactive, vtime1, vtime2;
-	u32 val = 0;
+	unsigned int val = 0;
 	u16 dsiclk, clkdiv, byteclk, t1, t2, t3, vsdelay;
 	struct drm_display_mode *mode;
 	struct drm_connector *connector = get_connector(bridge->encoder);
@@ -386,28 +372,29 @@ static void tc_bridge_enable(struct drm_bridge *bridge)
 	htime2 = (hfront_porch << 16) + hactive;
 	vtime2 = (vfront_porch << 16) + vactive;
 
-	d2l_read(tc->i2c, IDREG, &val);
+	regmap_read(tc->regmap, IDREG, &val);
 
 	dev_info(tc->dev, "DSI2LVDS Chip ID.%02x Revision ID. %02x **\n",
 		 (val >> 8) & 0xFF, val & 0xFF);
 
-	d2l_write(tc->i2c, SYSRST, SYS_RST_REG | SYS_RST_DSIRX | SYS_RST_BM |
-		  SYS_RST_LCD | SYS_RST_I2CM);
+	regmap_write(tc->regmap, SYSRST,
+		     SYS_RST_REG | SYS_RST_DSIRX | SYS_RST_BM | SYS_RST_LCD |
+		     SYS_RST_I2CM);
 	usleep_range(30000, 40000);
 
-	d2l_write(tc->i2c, PPI_TX_RX_TA, TTA_GET | TTA_SURE);
-	d2l_write(tc->i2c, PPI_LPTXTIMECNT, LPX_PERIOD);
-	d2l_write(tc->i2c, PPI_D0S_CLRSIPOCOUNT, 3);
-	d2l_write(tc->i2c, PPI_D1S_CLRSIPOCOUNT, 3);
-	d2l_write(tc->i2c, PPI_D2S_CLRSIPOCOUNT, 3);
-	d2l_write(tc->i2c, PPI_D3S_CLRSIPOCOUNT, 3);
+	regmap_write(tc->regmap, PPI_TX_RX_TA, TTA_GET | TTA_SURE);
+	regmap_write(tc->regmap, PPI_LPTXTIMECNT, LPX_PERIOD);
+	regmap_write(tc->regmap, PPI_D0S_CLRSIPOCOUNT, 3);
+	regmap_write(tc->regmap, PPI_D1S_CLRSIPOCOUNT, 3);
+	regmap_write(tc->regmap, PPI_D2S_CLRSIPOCOUNT, 3);
+	regmap_write(tc->regmap, PPI_D3S_CLRSIPOCOUNT, 3);
 
 	val = ((L0EN << tc->num_dsi_lanes) - L0EN) | DSI_CLEN_BIT;
-	d2l_write(tc->i2c, PPI_LANEENABLE, val);
-	d2l_write(tc->i2c, DSI_LANEENABLE, val);
+	regmap_write(tc->regmap, PPI_LANEENABLE, val);
+	regmap_write(tc->regmap, DSI_LANEENABLE, val);
 
-	d2l_write(tc->i2c, PPI_STARTPPI, PPI_START_FUNCTION);
-	d2l_write(tc->i2c, DSI_STARTDSI, DSI_RX_START);
+	regmap_write(tc->regmap, PPI_STARTPPI, PPI_START_FUNCTION);
+	regmap_write(tc->regmap, DSI_STARTDSI, DSI_RX_START);
 
 	/* Video event mode vs pulse mode bit, does not exist for tc358775 */
 	if (tc->type == TC358765)
@@ -431,42 +418,28 @@ static void tc_bridge_enable(struct drm_bridge *bridge)
 	vsdelay = (clkdiv * (t1 + t3) / byteclk) - hback_porch - hsync_len - hactive;
 
 	val |= TC358775_VPCTRL_VSDELAY(vsdelay);
-	d2l_write(tc->i2c, VPCTRL, val);
+	regmap_write(tc->regmap, VPCTRL, val);
 
-	d2l_write(tc->i2c, HTIM1, htime1);
-	d2l_write(tc->i2c, VTIM1, vtime1);
-	d2l_write(tc->i2c, HTIM2, htime2);
-	d2l_write(tc->i2c, VTIM2, vtime2);
+	regmap_write(tc->regmap, HTIM1, htime1);
+	regmap_write(tc->regmap, VTIM1, vtime1);
+	regmap_write(tc->regmap, HTIM2, htime2);
+	regmap_write(tc->regmap, VTIM2, vtime2);
 
-	d2l_write(tc->i2c, VFUEN, VFUEN_EN);
-	d2l_write(tc->i2c, SYSRST, SYS_RST_LCD);
-	d2l_write(tc->i2c, LVPHY0, LV_PHY0_PRBS_ON(4) | LV_PHY0_ND(6));
+	regmap_write(tc->regmap, VFUEN, VFUEN_EN);
+	regmap_write(tc->regmap, SYSRST, SYS_RST_LCD);
+	regmap_write(tc->regmap, LVPHY0, LV_PHY0_PRBS_ON(4) | LV_PHY0_ND(6));
 
 	dev_dbg(tc->dev, "bus_formats %04x bpc %d\n",
 		connector->display_info.bus_formats[0],
 		tc->bpc);
-	if (connector->display_info.bus_formats[0] ==
-		MEDIA_BUS_FMT_RGB888_1X7X4_SPWG) {
-		/* VESA-24 */
-		d2l_write(tc->i2c, LV_MX0003, LV_MX(LVI_R0, LVI_R1, LVI_R2, LVI_R3));
-		d2l_write(tc->i2c, LV_MX0407, LV_MX(LVI_R4, LVI_R7, LVI_R5, LVI_G0));
-		d2l_write(tc->i2c, LV_MX0811, LV_MX(LVI_G1, LVI_G2, LVI_G6, LVI_G7));
-		d2l_write(tc->i2c, LV_MX1215, LV_MX(LVI_G3, LVI_G4, LVI_G5, LVI_B0));
-		d2l_write(tc->i2c, LV_MX1619, LV_MX(LVI_B6, LVI_B7, LVI_B1, LVI_B2));
-		d2l_write(tc->i2c, LV_MX2023, LV_MX(LVI_B3, LVI_B4, LVI_B5, LVI_L0));
-		d2l_write(tc->i2c, LV_MX2427, LV_MX(LVI_HS, LVI_VS, LVI_DE, LVI_R6));
-	} else {
-		/* JEIDA-18 and JEIDA-24 */
-		d2l_write(tc->i2c, LV_MX0003, LV_MX(LVI_R2, LVI_R3, LVI_R4, LVI_R5));
-		d2l_write(tc->i2c, LV_MX0407, LV_MX(LVI_R6, LVI_R1, LVI_R7, LVI_G2));
-		d2l_write(tc->i2c, LV_MX0811, LV_MX(LVI_G3, LVI_G4, LVI_G0, LVI_G1));
-		d2l_write(tc->i2c, LV_MX1215, LV_MX(LVI_G5, LVI_G6, LVI_G7, LVI_B2));
-		d2l_write(tc->i2c, LV_MX1619, LV_MX(LVI_B0, LVI_B1, LVI_B3, LVI_B4));
-		d2l_write(tc->i2c, LV_MX2023, LV_MX(LVI_B5, LVI_B6, LVI_B7, LVI_L0));
-		d2l_write(tc->i2c, LV_MX2427, LV_MX(LVI_HS, LVI_VS, LVI_DE, LVI_R0));
-	}
+	if (connector->display_info.bus_formats[0] == MEDIA_BUS_FMT_RGB888_1X7X4_SPWG)
+		regmap_multi_reg_write(tc->regmap, tc_lvmux_vesa24,
+				       ARRAY_SIZE(tc_lvmux_vesa24));
+	else
+		regmap_multi_reg_write(tc->regmap, tc_lvmux_jeida18_24,
+				       ARRAY_SIZE(tc_lvmux_jeida18_24));
 
-	d2l_write(tc->i2c, VFUEN, VFUEN_EN);
+	regmap_write(tc->regmap, VFUEN, VFUEN_EN);
 
 	val = LVCFG_LVEN_BIT;
 	if (tc->lvds_link == DUAL_LINK) {
@@ -475,7 +448,7 @@ static void tc_bridge_enable(struct drm_bridge *bridge)
 	} else {
 		val |= TC358775_LVCFG_PCLKDIV(DIVIDE_BY_3);
 	}
-	d2l_write(tc->i2c, LVCFG, val);
+	regmap_write(tc->regmap, LVCFG, val);
 }
 
 /*
@@ -617,7 +590,7 @@ static const struct drm_bridge_funcs tc_bridge_funcs = {
 
 static int tc_attach_host(struct tc_data *tc)
 {
-	struct device *dev = &tc->i2c->dev;
+	struct device *dev = tc->dev;
 	struct mipi_dsi_host *host;
 	struct mipi_dsi_device *dsi;
 	int ret;
@@ -665,6 +638,14 @@ static int tc_attach_host(struct tc_data *tc)
 	return 0;
 }
 
+static const struct regmap_config tc358775_regmap_config = {
+	.reg_bits = 16,
+	.val_bits = 32,
+	.max_register = 0xffff,
+	.reg_format_endian = REGMAP_ENDIAN_BIG,
+	.val_format_endian = REGMAP_ENDIAN_LITTLE,
+};
+
 static int tc_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
@@ -679,6 +660,11 @@ static int tc_probe(struct i2c_client *client)
 	tc->i2c = client;
 	tc->type = (enum tc3587x5_type)(unsigned long)of_device_get_match_data(dev);
 
+	tc->regmap = devm_regmap_init_i2c(client, &tc358775_regmap_config);
+	if (IS_ERR(tc->regmap))
+		return dev_err_probe(dev, PTR_ERR(tc->regmap),
+				     "regmap i2c init failed\n");
+
 	tc->panel_bridge = devm_drm_of_get_bridge(dev, dev->of_node,
 						  TC358775_LVDS_OUT0, 0);
 	if (IS_ERR(tc->panel_bridge))

-- 
2.39.2

