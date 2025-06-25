Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1317DAE8A70
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 18:46:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9323C10E794;
	Wed, 25 Jun 2025 16:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="NmDmyhdf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E8E710E78A
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 16:46:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7B6A744387;
 Wed, 25 Jun 2025 16:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1750869984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e4mNy/xB+s/exlR2a9UXks6ohH9fLyh7nhMEelyG0HM=;
 b=NmDmyhdfcMhbh5CWpGyiY+iA8p4LqHvuiTBBLFaKib6G84EmAV6mmFvGTRzcyxndCvPBXE
 x30wghVMeb4vUgXfcPq8jgpvVKeiaVuC7oQewhstZRwH8ctZ0BUwQChy0ZGl/Q0OXsEIrs
 qokQo122CYd64GqI5MMsqU7aHgIYW2benSiXcwVg5egnpmCzhhxOMFyapcC3Au3LhxE3Uh
 tS9TncKsha1ckGD0Eub1hbPBvd5zEtxgvUoNAuZs3wv1rhvKNtJv0M72kZPNJ7qkSoKbA3
 qeGk3otJ6Fdd8HE386udlGvQNBIoxiKxou8HzvzHzkLZXEH6LN/LVmPSNjjRYQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 25 Jun 2025 18:45:31 +0200
Subject: [PATCH 27/32] drm/bridge: tc358768: convert to the .attach_new op
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-drm-dsi-host-no-device-ptr-v1-27-e36bc258a7c5@bootlin.com>
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
 drivers/gpu/drm/bridge/tc358768.c | 40 +++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
index fbdc44e162293f2f9b090bc956604184a2a406b2..5793e15f23e4f36cb967a5c32eb8463eb47beded 100644
--- a/drivers/gpu/drm/bridge/tc358768.c
+++ b/drivers/gpu/drm/bridge/tc358768.c
@@ -133,9 +133,9 @@ static const char * const tc358768_supplies[] = {
 };
 
 struct tc358768_dsi_output {
-	struct mipi_dsi_device *dev;
 	struct drm_panel *panel;
 	struct drm_bridge *bridge;
+	struct mipi_dsi_bus_fmt bus_fmt;
 };
 
 struct tc358768_priv {
@@ -406,7 +406,7 @@ static int tc358768_calc_pll(struct tc358768_priv *priv,
 }
 
 static int tc358768_dsi_host_attach(struct mipi_dsi_host *host,
-				    struct mipi_dsi_device *dev)
+				    const struct mipi_dsi_bus_fmt *bus_fmt)
 {
 	struct tc358768_priv *priv = dsi_host_to_tc358768(host);
 	struct drm_bridge *bridge;
@@ -414,9 +414,9 @@ static int tc358768_dsi_host_attach(struct mipi_dsi_host *host,
 	struct device_node *ep;
 	int ret;
 
-	if (dev->lanes > 4) {
+	if (bus_fmt->lanes > 4) {
 		dev_err(priv->dev, "unsupported number of data lanes(%u)\n",
-			dev->lanes);
+			bus_fmt->lanes);
 		return -EINVAL;
 	}
 
@@ -424,7 +424,7 @@ static int tc358768_dsi_host_attach(struct mipi_dsi_host *host,
 	 * tc358768 supports both Video and Pulse mode, but the driver only
 	 * implements Video (event) mode currently
 	 */
-	if (!(dev->mode_flags & MIPI_DSI_MODE_VIDEO)) {
+	if (!(bus_fmt->mode_flags & MIPI_DSI_MODE_VIDEO)) {
 		dev_err(priv->dev, "Only MIPI_DSI_MODE_VIDEO is supported\n");
 		return -ENOTSUPP;
 	}
@@ -433,7 +433,7 @@ static int tc358768_dsi_host_attach(struct mipi_dsi_host *host,
 	 * tc358768 supports RGB888, RGB666, RGB666_PACKED and RGB565, but only
 	 * RGB888 is verified.
 	 */
-	if (dev->format != MIPI_DSI_FMT_RGB888) {
+	if (bus_fmt->format != MIPI_DSI_FMT_RGB888) {
 		dev_warn(priv->dev, "Only MIPI_DSI_FMT_RGB888 tested!\n");
 		return -ENOTSUPP;
 	}
@@ -450,12 +450,12 @@ static int tc358768_dsi_host_attach(struct mipi_dsi_host *host,
 			return PTR_ERR(bridge);
 	}
 
-	priv->output.dev = dev;
+	priv->output.bus_fmt = *bus_fmt;
 	priv->output.bridge = bridge;
 	priv->output.panel = panel;
 
-	priv->dsi_lanes = dev->lanes;
-	priv->dsi_bpp = mipi_dsi_pixel_format_to_bpp(dev->format);
+	priv->dsi_lanes = bus_fmt->lanes;
+	priv->dsi_bpp = mipi_dsi_pixel_format_to_bpp(bus_fmt->format);
 
 	/* get input ep (port0/endpoint0) */
 	ret = -EINVAL;
@@ -548,7 +548,7 @@ static ssize_t tc358768_dsi_host_transfer(struct mipi_dsi_host *host,
 }
 
 static const struct mipi_dsi_host_ops tc358768_dsi_host_ops = {
-	.attach = tc358768_dsi_host_attach,
+	.attach_new = tc358768_dsi_host_attach,
 	.detach = tc358768_dsi_host_detach,
 	.transfer = tc358768_dsi_host_transfer,
 };
@@ -689,8 +689,8 @@ static void tc358768_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 					      struct drm_atomic_state *state)
 {
 	struct tc358768_priv *priv = bridge_to_tc358768(bridge);
-	struct mipi_dsi_device *dsi_dev = priv->output.dev;
-	unsigned long mode_flags = dsi_dev->mode_flags;
+	const struct mipi_dsi_bus_fmt *bus_fmt = &priv->output.bus_fmt;
+	unsigned long mode_flags = bus_fmt->mode_flags;
 	u32 val, val2, lptxcnt, hact, data_type;
 	s32 raw_val;
 	struct drm_crtc_state *crtc_state;
@@ -744,7 +744,7 @@ static void tc358768_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 
 	/* Data Format Control Register */
 	val = BIT(2) | BIT(1) | BIT(0); /* rdswap_en | dsitx_en | txdt_en */
-	switch (dsi_dev->format) {
+	switch (bus_fmt->format) {
 	case MIPI_DSI_FMT_RGB888:
 		val |= (0x3 << 4);
 		hact = vm.hactive * 3;
@@ -769,7 +769,7 @@ static void tc358768_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 		break;
 	default:
 		dev_err(dev, "Invalid data format (%u)\n",
-			dsi_dev->format);
+			bus_fmt->format);
 		tc358768_hw_disable(priv);
 		return;
 	}
@@ -811,7 +811,7 @@ static void tc358768_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 	dsi_dpi_htot = tc358768_dpi_to_dsi_bytes(priv, dpi_htot);
 	dsi_dpi_data_start = tc358768_dpi_to_dsi_bytes(priv, dpi_data_start);
 
-	if (dsi_dev->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) {
+	if (bus_fmt->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) {
 		dsi_hsw = tc358768_dpi_to_dsi_bytes(priv, vm.hsync_len);
 		dsi_hbp = tc358768_dpi_to_dsi_bytes(priv, vm.hback_porch);
 	} else {
@@ -927,7 +927,7 @@ static void tc358768_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 	/* Enable D-PHY (HiZ->LP11) */
 	tc358768_write(priv, TC358768_CLW_CNTRL, 0x0000);
 	/* Enable lanes */
-	for (i = 0; i < dsi_dev->lanes; i++)
+	for (i = 0; i < bus_fmt->lanes; i++)
 		tc358768_write(priv, TC358768_D0W_CNTRL + i * 4, 0x0000);
 
 	/* DSI Timings */
@@ -995,7 +995,7 @@ static void tc358768_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 	tc358768_write(priv, TC358768_THS_TRAILCNT, val);
 
 	val = BIT(0);
-	for (i = 0; i < dsi_dev->lanes; i++)
+	for (i = 0; i < bus_fmt->lanes; i++)
 		val |= BIT(i + 1);
 	tc358768_write(priv, TC358768_HSTXVREGEN, val);
 
@@ -1015,7 +1015,7 @@ static void tc358768_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 	/* START[0] */
 	tc358768_write(priv, TC358768_STARTCNTRL, 1);
 
-	if (dsi_dev->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) {
+	if (bus_fmt->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) {
 		/* Set pulse mode */
 		tc358768_write(priv, TC358768_DSI_EVENT, 0);
 
@@ -1069,14 +1069,14 @@ static void tc358768_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 	tc358768_write(priv, TC358768_DSI_CONFW, val);
 
 	val = TC358768_DSI_CONFW_MODE_SET | TC358768_DSI_CONFW_ADDR_DSI_CONTROL;
-	val |= (dsi_dev->lanes - 1) << 1;
+	val |= (bus_fmt->lanes - 1) << 1;
 
 	val |= TC358768_DSI_CONTROL_TXMD;
 
 	if (!(mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS))
 		val |= TC358768_DSI_CONTROL_HSCKMD;
 
-	if (dsi_dev->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
+	if (bus_fmt->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
 		val |= TC358768_DSI_CONTROL_EOTDIS;
 
 	tc358768_write(priv, TC358768_DSI_CONFW, val);

-- 
2.49.0

