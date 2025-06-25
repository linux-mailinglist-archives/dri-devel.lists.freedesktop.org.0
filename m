Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A79AE8A76
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 18:47:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16D3C10E792;
	Wed, 25 Jun 2025 16:47:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="KwMhO1fW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E63110E786
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 16:46:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C94EF44386;
 Wed, 25 Jun 2025 16:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1750869982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PhdruiDO3p/+Z0EKuOpJRIFOGJMP+PiOgTpEv4z015E=;
 b=KwMhO1fWnjVqOOMp6urimEkFl+ESq42B9iNjuacKArivE5QzI6MWLywJPvNxn5dKh/ECzi
 IVhsNaHW52CFt14jRY+8f/Pb50qMh3M6ymA4W9s7Vgdjpevj/nlFAUJ3zd3zl3axXq5y9I
 YLOj8+Zw4atqfyjX1pYJMAqHUIeQT85MkZRpmQQqE4rbj7BuaaLqG42LIroiBqweNflh7d
 H+QR2juwwKA1jFqs8usmdfolQOp+omTQar/sOVos/nAQz9BR1WMdlGA1yuXtxTt14eezIl
 OZm0UE+uNUFaJzIu2VNIF0e1yj8UyyE+1cBaPh+ZeqjAzDaLNxxi2SaO5+bRxg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 25 Jun 2025 18:45:30 +0200
Subject: [PATCH 26/32] drm/bridge: cdns-dsi: convert to the .attach_new op
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-drm-dsi-host-no-device-ptr-v1-26-e36bc258a7c5@bootlin.com>
References: <20250625-drm-dsi-host-no-device-ptr-v1-0-e36bc258a7c5@bootlin.com>
In-Reply-To: <20250625-drm-dsi-host-no-device-ptr-v1-0-e36bc258a7c5@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvfedvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieeiuedvffetgfeuudelheeutefggfejieettdetteekueeuueeukeevvedvueevnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgepvdehnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghloheplgduledvrdduieekrddujeekrdejhegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddvpdhrtghpthhtohepjhhonhgrsheskhifihgsohhordhsvgdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhsuhhngihisehlihhsthhsrdhlihhnuhigrdguvghvp
 dhrtghpthhtohepmhdrshiihihprhhofihskhhisehsrghmshhunhhgrdgtohhmpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtohepjhgrnhhirdhnihhkuhhlrgeslhhinhhugidrihhnthgvlhdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com
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

This op does not pass any pointer to the DSI device, so the DSI host driver
cannot store it.

This driver uses the DSI device format parameters in various places outside
the .attach op, and currently it does so by storing a pointer to the struct
mipi_dsi_device. That's exactly what .attach_new aims at removing.

Store a copy of the format parameters instead of the struct mipi_dsi_device
pointer.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 57 +++++++++++++-------------
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h |  2 +-
 2 files changed, 29 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index 005aa6121227b2f7ac682f3b724e4518e8e5f721..15743d29a8d4fb9074f04b65a3c4bb390a5829d2 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -487,10 +487,10 @@ static int cdns_dsi_mode2cfg(struct cdns_dsi *dsi,
 
 	memset(dsi_cfg, 0, sizeof(*dsi_cfg));
 
-	if (output->dev->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
+	if (output->bus_fmt.mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
 		sync_pulse = true;
 
-	bpp = mipi_dsi_pixel_format_to_bpp(output->dev->format);
+	bpp = mipi_dsi_pixel_format_to_bpp(output->bus_fmt.format);
 
 	if (mode_valid_check)
 		tmp = mode->htotal -
@@ -534,10 +534,10 @@ static int cdns_dsi_adjust_phy_config(struct cdns_dsi *dsi,
 	unsigned long dpi_htotal;
 	unsigned long dpi_hz;
 	unsigned int dsi_hfp_ext;
-	unsigned int lanes = output->dev->lanes;
+	unsigned int lanes = output->bus_fmt.lanes;
 
 	dsi_htotal = dsi_cfg->hbp + DSI_HBP_FRAME_OVERHEAD;
-	if (output->dev->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
+	if (output->bus_fmt.mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
 		dsi_htotal += dsi_cfg->hsa + DSI_HSA_FRAME_OVERHEAD;
 
 	dsi_htotal += dsi_cfg->hact;
@@ -578,7 +578,7 @@ static int cdns_dsi_check_conf(struct cdns_dsi *dsi,
 	struct cdns_dsi_output *output = &dsi->output;
 	struct phy_configure_opts_mipi_dphy *phy_cfg = &output->phy_opts.mipi_dphy;
 	unsigned long dsi_hss_hsa_hse_hbp;
-	unsigned int nlanes = output->dev->lanes;
+	unsigned int nlanes = output->bus_fmt.lanes;
 	int mode_clock = (mode_valid_check ? mode->clock : mode->crtc_clock);
 	int ret;
 
@@ -587,7 +587,7 @@ static int cdns_dsi_check_conf(struct cdns_dsi *dsi,
 		return ret;
 
 	ret = phy_mipi_dphy_get_default_config(mode_clock * 1000,
-					       mipi_dsi_pixel_format_to_bpp(output->dev->format),
+					       mipi_dsi_pixel_format_to_bpp(output->bus_fmt.format),
 					       nlanes, phy_cfg);
 	if (ret)
 		return ret;
@@ -601,7 +601,7 @@ static int cdns_dsi_check_conf(struct cdns_dsi *dsi,
 		return ret;
 
 	dsi_hss_hsa_hse_hbp = dsi_cfg->hbp + DSI_HBP_FRAME_OVERHEAD;
-	if (output->dev->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
+	if (output->bus_fmt.mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
 		dsi_hss_hsa_hse_hbp += dsi_cfg->hsa + DSI_HSA_FRAME_OVERHEAD;
 
 	/*
@@ -659,7 +659,7 @@ cdns_dsi_bridge_mode_valid(struct drm_bridge *bridge,
 		return MODE_V_ILLEGAL;
 
 	/* HACT must be 32-bits aligned. */
-	bpp = mipi_dsi_pixel_format_to_bpp(output->dev->format);
+	bpp = mipi_dsi_pixel_format_to_bpp(output->bus_fmt.format);
 	if ((mode->hdisplay * bpp) % 32)
 		return MODE_H_ILLEGAL;
 
@@ -739,7 +739,7 @@ static void cdns_dsi_hs_init(struct cdns_dsi *dsi)
 					status & PLL_LOCKED, 100, 100));
 	/* De-assert data and clock reset lines. */
 	writel(DPHY_CMN_PSO | DPHY_ALL_D_PDN | DPHY_C_PDN | DPHY_CMN_PDN |
-	       DPHY_D_RSTB(output->dev->lanes) | DPHY_C_RSTB,
+	       DPHY_D_RSTB(output->bus_fmt.lanes) | DPHY_C_RSTB,
 	       dsi->regs + MCTL_DPHY_CFG0);
 	dsi->phy_initialized = true;
 }
@@ -755,10 +755,10 @@ static void cdns_dsi_init_link(struct cdns_dsi *dsi)
 		return;
 
 	val = 0;
-	for (i = 1; i < output->dev->lanes; i++)
+	for (i = 1; i < output->bus_fmt.lanes; i++)
 		val |= DATA_LANE_EN(i);
 
-	if (!(output->dev->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS))
+	if (!(output->bus_fmt.mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS))
 		val |= CLK_CONTINUOUS;
 
 	writel(val, dsi->regs + MCTL_MAIN_PHY_CTL);
@@ -772,7 +772,7 @@ static void cdns_dsi_init_link(struct cdns_dsi *dsi)
 	writel(LINK_EN, dsi->regs + MCTL_MAIN_DATA_CTL);
 
 	val = CLK_LANE_EN | PLL_START;
-	for (i = 0; i < output->dev->lanes; i++)
+	for (i = 0; i < output->bus_fmt.lanes; i++)
 		val |= DATA_LANE_START(i);
 
 	writel(val, dsi->regs + MCTL_MAIN_EN);
@@ -830,7 +830,7 @@ static void cdns_dsi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 	conn_state = drm_atomic_get_new_connector_state(state, connector);
 	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
 	mode = &crtc_state->adjusted_mode;
-	nlanes = output->dev->lanes;
+	nlanes = output->bus_fmt.lanes;
 
 	cdns_dsi_init_link(dsi);
 	cdns_dsi_hs_init(dsi);
@@ -863,21 +863,21 @@ static void cdns_dsi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 	      (dsi_cfg.hsa + DSI_BLANKING_FRAME_OVERHEAD +
 	       DSI_HSA_FRAME_OVERHEAD);
 	writel(BLK_LINE_PULSE_PKT_LEN(tmp), dsi->regs + VID_BLKSIZE2);
-	if (output->dev->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
+	if (output->bus_fmt.mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
 		writel(MAX_LINE_LIMIT(tmp - DSI_NULL_FRAME_OVERHEAD),
 		       dsi->regs + VID_VCA_SETTING2);
 
 	tmp = dsi_cfg.htotal -
 	      (DSI_HSS_VSS_VSE_FRAME_OVERHEAD + DSI_BLANKING_FRAME_OVERHEAD);
 	writel(BLK_LINE_EVENT_PKT_LEN(tmp), dsi->regs + VID_BLKSIZE1);
-	if (!(output->dev->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE))
+	if (!(output->bus_fmt.mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE))
 		writel(MAX_LINE_LIMIT(tmp - DSI_NULL_FRAME_OVERHEAD),
 		       dsi->regs + VID_VCA_SETTING2);
 
 	tmp = DIV_ROUND_UP(dsi_cfg.htotal, nlanes) -
 	      DIV_ROUND_UP(dsi_cfg.hsa, nlanes);
 
-	if (!(output->dev->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET))
+	if (!(output->bus_fmt.mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET))
 		tmp -= DIV_ROUND_UP(DSI_EOT_PKT_SIZE, nlanes);
 
 	tx_byte_period = DIV_ROUND_DOWN_ULL((u64)NSEC_PER_SEC * 8,
@@ -909,8 +909,8 @@ static void cdns_dsi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 
 	writel(LPRX_TIMEOUT(tmp), dsi->regs + MCTL_DPHY_TIMEOUT2);
 
-	if (output->dev->mode_flags & MIPI_DSI_MODE_VIDEO) {
-		switch (output->dev->format) {
+	if (output->bus_fmt.mode_flags & MIPI_DSI_MODE_VIDEO) {
+		switch (output->bus_fmt.format) {
 		case MIPI_DSI_FMT_RGB888:
 			tmp = VID_PIXEL_MODE_RGB888 |
 			      VID_DATATYPE(MIPI_DSI_PACKED_PIXEL_STREAM_24);
@@ -936,7 +936,7 @@ static void cdns_dsi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 			return;
 		}
 
-		if (output->dev->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
+		if (output->bus_fmt.mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
 			tmp |= SYNC_PULSE_ACTIVE | SYNC_PULSE_HORIZONTAL;
 
 		tmp |= REG_BLKLINE_MODE(REG_BLK_MODE_BLANKING_PKT) |
@@ -950,10 +950,10 @@ static void cdns_dsi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 	tmp = readl(dsi->regs + MCTL_MAIN_DATA_CTL);
 	tmp &= ~(IF_VID_SELECT_MASK | HOST_EOT_GEN | IF_VID_MODE);
 
-	if (!(output->dev->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET))
+	if (!(output->bus_fmt.mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET))
 		tmp |= HOST_EOT_GEN;
 
-	if (output->dev->mode_flags & MIPI_DSI_MODE_VIDEO)
+	if (output->bus_fmt.mode_flags & MIPI_DSI_MODE_VIDEO)
 		tmp |= IF_VID_MODE | IF_VID_SELECT(input->id) | VID_EN;
 
 	writel(tmp, dsi->regs + MCTL_MAIN_DATA_CTL);
@@ -980,7 +980,7 @@ static u32 *cdns_dsi_bridge_get_input_bus_fmts(struct drm_bridge *bridge,
 	if (!input_fmts)
 		return NULL;
 
-	input_fmts[0] = drm_mipi_dsi_get_input_bus_fmt(output->dev->format);
+	input_fmts[0] = drm_mipi_dsi_get_input_bus_fmt(output->bus_fmt.format);
 	if (!input_fmts[0])
 		return NULL;
 
@@ -1066,7 +1066,7 @@ static const struct drm_bridge_funcs cdns_dsi_bridge_funcs = {
 };
 
 static int cdns_dsi_attach(struct mipi_dsi_host *host,
-			   struct mipi_dsi_device *dev)
+			   const struct mipi_dsi_bus_fmt *bus_fmt)
 {
 	struct cdns_dsi *dsi = to_cdns_dsi(host);
 	struct cdns_dsi_output *output = &dsi->output;
@@ -1078,11 +1078,11 @@ static int cdns_dsi_attach(struct mipi_dsi_host *host,
 	 * same host. In order to support that we'd need the DRM bridge
 	 * framework to allow dynamic reconfiguration of the bridge chain.
 	 */
-	if (output->dev)
+	if (output->bus_fmt.lanes)
 		return -EBUSY;
 
 	/* We do not support burst mode yet. */
-	if (dev->mode_flags & MIPI_DSI_MODE_VIDEO_BURST)
+	if (bus_fmt->mode_flags & MIPI_DSI_MODE_VIDEO_BURST)
 		return -ENOTSUPP;
 
 	/*
@@ -1091,12 +1091,12 @@ static int cdns_dsi_attach(struct mipi_dsi_host *host,
 	 * this representation.
 	 */
 	bridge = devm_drm_of_get_bridge(dsi->base.dev, dsi->base.dev->of_node,
-					DSI_OUTPUT_PORT, dev->channel);
+					DSI_OUTPUT_PORT, bus_fmt->channel);
 	if (IS_ERR(bridge))
 		return PTR_ERR(bridge);
 
-	output->dev = dev;
 	output->bridge = bridge;
+	output->bus_fmt = *bus_fmt;
 
 	/*
 	 * The DSI output has been properly configured, we can now safely
@@ -1254,7 +1254,7 @@ static ssize_t cdns_dsi_transfer(struct mipi_dsi_host *host,
 }
 
 static const struct mipi_dsi_host_ops cdns_dsi_ops = {
-	.attach = cdns_dsi_attach,
+	.attach_new = cdns_dsi_attach,
 	.detach = cdns_dsi_detach,
 	.transfer = cdns_dsi_transfer,
 };
@@ -1437,4 +1437,3 @@ MODULE_AUTHOR("Boris Brezillon <boris.brezillon@bootlin.com>");
 MODULE_DESCRIPTION("Cadence DSI driver");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:cdns-dsi");
-
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h
index 5db5dbbbcaadbe7a49596b349e381a671741a810..7439f88994cac1d454d7027fd88abcd82b7847e3 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h
@@ -19,9 +19,9 @@ struct clk;
 struct reset_control;
 
 struct cdns_dsi_output {
-	struct mipi_dsi_device *dev;
 	struct drm_bridge *bridge;
 	union phy_configure_opts phy_opts;
+	struct mipi_dsi_bus_fmt bus_fmt;
 };
 
 enum cdns_dsi_input_id {

-- 
2.49.0

