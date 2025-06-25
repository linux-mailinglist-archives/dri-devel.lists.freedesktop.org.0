Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2BCAE8A75
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 18:47:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C448210E79B;
	Wed, 25 Jun 2025 16:47:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="f3ZG4WsA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A7910E78D
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 16:46:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C41094437E;
 Wed, 25 Jun 2025 16:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1750869987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fWAgdYIhe6WRxC8lPfOBRIJNcNMxQ9jgzYlq7+Z1pYI=;
 b=f3ZG4WsAd8pCNZFsWigf1jN4+wCzNAyxyqy7bG4EkmH1wpIQ7NM9UJzwsLLMj7n/YqZbKQ
 fvTiBHGbpnHGz5FZBscC+Jrg4yOAViIKjVTl/I6haOGJJHCcJWoPL0k+Fu8ErB+zYpXl4U
 gf33JNIosj8d0suoHVPuL78ZmiK//2oHQJ+7ymWOKu2qplqhcQLrOyIapLEft1JZaXhpXx
 s+ihgISCTX9IEHZT3Regv4hRN2Q4VFn/dfH0wDjUMWbKF2DrnetgUGlFZu6V+MtBWxOs1W
 w5bBaaL2ol/9BW+9Wl9ChPitf5Y3wBbne7+XC5wYJuFaiOiRaqGddjRf4NbWmw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 25 Jun 2025 18:45:33 +0200
Subject: [PATCH 29/32] drm/bridge: synopsys: dw-mipi-dsi: convert to the
 .attach_new op
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-drm-dsi-host-no-device-ptr-v1-29-e36bc258a7c5@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvfedvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieeiuedvffetgfeuudelheeutefggfejieettdetteekueeuueeukeevvedvueevnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgepvdeknecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghloheplgduledvrdduieekrddujeekrdejhegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddvpdhrtghpthhtohepjhhonhgrsheskhifihgsohhordhsvgdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhsuhhngihisehlihhsthhsrdhlihhnuhigrdguvghvp
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

This requires propagating the change to the dw-mipi-dsi-specific host op in
struct dw_mipi_dsi_host_ops and thus to the drivers based on
dw-mipi-dsi.c.

Among those, the meson driver uses the DSI device format parameters in
various places outside the .attach op, and currently it does so by storing
a pointer to the struct mipi_dsi_device. That's exactly what .attach_new
aims at removing, so store a copy of the format parameters instead of the
struct mipi_dsi_device pointer.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c     |  4 ++--
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c   | 18 +++++++++---------
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c       | 16 ++++++++--------
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c |  2 +-
 include/drm/bridge/dw_mipi_dsi.h                |  3 ++-
 5 files changed, 22 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c b/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
index bea8346515b8c8ce150040f58d288ac564eeb563..7bd48952cee571709a39fdf969f05ac61422862a 100644
--- a/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
@@ -816,11 +816,11 @@ static const struct dw_mipi_dsi_phy_ops imx93_dsi_phy_ops = {
 	.get_timing = imx93_dsi_phy_get_timing,
 };
 
-static int imx93_dsi_host_attach(void *priv_data, struct mipi_dsi_device *device)
+static int imx93_dsi_host_attach(void *priv_data, const struct mipi_dsi_bus_fmt *bus_fmt)
 {
 	struct imx93_dsi *dsi = priv_data;
 
-	dsi->format = device->format;
+	dsi->format = bus_fmt->format;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index 8fc2e282ff114db363a6cf0fe085684449b26438..ee84e773215c106651dad30de36e76a5be480553 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -315,23 +315,23 @@ static inline u32 dsi_read(struct dw_mipi_dsi *dsi, u32 reg)
 }
 
 static int dw_mipi_dsi_host_attach(struct mipi_dsi_host *host,
-				   struct mipi_dsi_device *device)
+				   const struct mipi_dsi_bus_fmt *bus_fmt)
 {
 	struct dw_mipi_dsi *dsi = host_to_dsi(host);
 	const struct dw_mipi_dsi_plat_data *pdata = dsi->plat_data;
 	struct drm_bridge *bridge;
 	int ret;
 
-	if (device->lanes > dsi->plat_data->max_data_lanes) {
+	if (bus_fmt->lanes > dsi->plat_data->max_data_lanes) {
 		dev_err(dsi->dev, "the number of data lanes(%u) is too many\n",
-			device->lanes);
+			bus_fmt->lanes);
 		return -EINVAL;
 	}
 
-	dsi->lanes = device->lanes;
-	dsi->channel = device->channel;
-	dsi->format = device->format;
-	dsi->mode_flags = device->mode_flags;
+	dsi->lanes = bus_fmt->lanes;
+	dsi->channel = bus_fmt->channel;
+	dsi->format = bus_fmt->format;
+	dsi->mode_flags = bus_fmt->mode_flags;
 
 	bridge = devm_drm_of_get_bridge(dsi->dev, dsi->dev->of_node, 1, 0);
 	if (IS_ERR(bridge))
@@ -343,7 +343,7 @@ static int dw_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 	drm_bridge_add(&dsi->bridge);
 
 	if (pdata->host_ops && pdata->host_ops->attach) {
-		ret = pdata->host_ops->attach(pdata->priv_data, device);
+		ret = pdata->host_ops->attach(pdata->priv_data, bus_fmt);
 		if (ret < 0)
 			return ret;
 	}
@@ -537,7 +537,7 @@ static ssize_t dw_mipi_dsi_host_transfer(struct mipi_dsi_host *host,
 }
 
 static const struct mipi_dsi_host_ops dw_mipi_dsi_host_ops = {
-	.attach = dw_mipi_dsi_host_attach,
+	.attach_new = dw_mipi_dsi_host_attach,
 	.detach = dw_mipi_dsi_host_detach,
 	.transfer = dw_mipi_dsi_host_transfer,
 };
diff --git a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
index 4dc726cef5455075def7927a469ae23020ebfec7..b3354243a5b22d46f1cf3d8f75e602f4fc26081f 100644
--- a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
+++ b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
@@ -41,7 +41,7 @@ struct meson_dw_mipi_dsi {
 	union phy_configure_opts phy_opts;
 	struct dw_mipi_dsi *dmd;
 	struct dw_mipi_dsi_plat_data pdata;
-	struct mipi_dsi_device *dsi_device;
+	struct mipi_dsi_bus_fmt bus_fmt;
 	const struct drm_display_mode *mode;
 	struct clk *bit_clk;
 	struct clk *px_clk;
@@ -110,7 +110,7 @@ static int dw_mipi_dsi_phy_init(void *priv_data)
 		return ret;
 	}
 
-	switch (mipi_dsi->dsi_device->format) {
+	switch (mipi_dsi->bus_fmt.format) {
 	case MIPI_DSI_FMT_RGB888:
 		dpi_data_format = DPI_COLOR_24BIT;
 		venc_data_width = VENC_IN_COLOR_24B;
@@ -164,10 +164,10 @@ dw_mipi_dsi_get_lane_mbps(void *priv_data, const struct drm_display_mode *mode,
 
 	mipi_dsi->mode = mode;
 
-	bpp = mipi_dsi_pixel_format_to_bpp(mipi_dsi->dsi_device->format);
+	bpp = mipi_dsi_pixel_format_to_bpp(mipi_dsi->bus_fmt.format);
 
 	phy_mipi_dphy_get_default_config(mode->clock * 1000,
-					 bpp, mipi_dsi->dsi_device->lanes,
+					 bpp, mipi_dsi->bus_fmt.lanes,
 					 &mipi_dsi->phy_opts.mipi_dphy);
 
 	*lane_mbps = DIV_ROUND_UP(mipi_dsi->phy_opts.mipi_dphy.hs_clk_rate, USEC_PER_SEC);
@@ -220,21 +220,21 @@ static const struct dw_mipi_dsi_phy_ops meson_dw_mipi_dsi_phy_ops = {
 };
 
 static int meson_dw_mipi_dsi_host_attach(void *priv_data,
-					 struct mipi_dsi_device *device)
+					 const struct mipi_dsi_bus_fmt *bus_fmt)
 {
 	struct meson_dw_mipi_dsi *mipi_dsi = priv_data;
 	int ret;
 
-	mipi_dsi->dsi_device = device;
+	mipi_dsi->bus_fmt = *bus_fmt;
 
-	switch (device->format) {
+	switch (bus_fmt->format) {
 	case MIPI_DSI_FMT_RGB888:
 		break;
 	case MIPI_DSI_FMT_RGB666:
 		break;
 	case MIPI_DSI_FMT_RGB666_PACKED:
 	case MIPI_DSI_FMT_RGB565:
-		dev_err(mipi_dsi->dev, "invalid pixel format %d\n", device->format);
+		dev_err(mipi_dsi->dev, "invalid pixel format %d\n", bus_fmt->format);
 		return -EINVAL;
 	}
 
diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index 3398160ad75e4a9629082bc47491eab473caecc0..5d360d7bea9b4a6663133b440dd70cc19abee2f0 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -1030,7 +1030,7 @@ static const struct component_ops dw_mipi_dsi_rockchip_ops = {
 };
 
 static int dw_mipi_dsi_rockchip_host_attach(void *priv_data,
-					    struct mipi_dsi_device *device)
+					    const struct mipi_dsi_bus_fmt *bus_fmt)
 {
 	struct dw_mipi_dsi_rockchip *dsi = priv_data;
 	struct device *second;
diff --git a/include/drm/bridge/dw_mipi_dsi.h b/include/drm/bridge/dw_mipi_dsi.h
index 65d5e68065e3d8bd38986b993653c467a18e3a58..452218cb03d91fa4cdc9cd67004395bd20a9a748 100644
--- a/include/drm/bridge/dw_mipi_dsi.h
+++ b/include/drm/bridge/dw_mipi_dsi.h
@@ -15,6 +15,7 @@
 #include <drm/drm_bridge.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_crtc.h>
+#include <drm/drm_mipi_dsi.h>
 #include <drm/drm_modes.h>
 
 struct drm_display_mode;
@@ -45,7 +46,7 @@ struct dw_mipi_dsi_phy_ops {
 
 struct dw_mipi_dsi_host_ops {
 	int (*attach)(void *priv_data,
-		      struct mipi_dsi_device *dsi);
+		      const struct mipi_dsi_bus_fmt *bus_fmt);
 	int (*detach)(void *priv_data,
 		      struct mipi_dsi_device *dsi);
 };

-- 
2.49.0

