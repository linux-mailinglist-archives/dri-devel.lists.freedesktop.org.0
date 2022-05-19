Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1411C52D164
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 13:25:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA70B11A2C1;
	Thu, 19 May 2022 11:25:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47A2F11A2C1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 11:25:05 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id A002D83C01;
 Thu, 19 May 2022 13:25:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1652959504;
 bh=UxNiUMkdLdkuX8BJjtqHE+UdoKRwzEcwzrgBgz1CZ50=;
 h=From:To:Cc:Subject:Date:From;
 b=f3N2tF1mXQJhY8SKd50BdZfjR8tf5bkDuQa4ArQ5IJjKBXG29g0hnCeIH/twfzY6q
 EVj4o4AtfHA2xWFjA5tiNu7BzTqZk/q+WRKmwnuwk7zXsZ1g2ShoO5irsxOXwiIQzf
 oDtEx3x/XUlwcbZOmrb/Gnlhdyw58CU4c6lPOWXDjAgPTSSesFw6IyQMgrtRQMBjId
 9GdBoiyCtVG0E1g+8nF2SSdVlzvY3ToFxKAil7rbuIvDtFGmx8PvGmxbCpTsShXvkY
 QATw7loMZ2cY+47PTxKs2L3JwV6ej4Ll3IkuBT7E23bhdfhl9jlZwbyuQ/8izm0PaU
 XDyQdrkCPzt8w==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/bridge: ti-sn65dsi83: Do not cache dsi_lanes and host
 twice
Date: Thu, 19 May 2022 13:24:58 +0200
Message-Id: <20220519112458.62259-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
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
Cc: Marek Vasut <marex@denx.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, robert.foss@linaro.org,
 Maxime Ripard <maxime@cerno.tech>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DSI lane count can be accessed via the dsi device pointer, make use
of that. The DSI host pointer is only used in sn65dsi83_host_attach(),
move the code around so that the host does not have to be cached in the
driver private data. This simplifies the code further. No functional
change.

This has the added bonus that lt9211, tc358767, sn65dsi83 now use very
similar *_mipi_dsi_host_attach() which is ripe for deduplication.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 64 +++++++++------------------
 1 file changed, 22 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index dc65f424e7f3c..f5c1819857665 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -141,12 +141,10 @@ struct sn65dsi83 {
 	struct drm_bridge		bridge;
 	struct device			*dev;
 	struct regmap			*regmap;
-	struct device_node		*host_node;
 	struct mipi_dsi_device		*dsi;
 	struct drm_bridge		*panel_bridge;
 	struct gpio_desc		*enable_gpio;
 	struct regulator		*vcc;
-	int				dsi_lanes;
 	bool				lvds_dual_link;
 	bool				lvds_dual_link_even_odd_swap;
 	atomic_t			enable_count;
@@ -308,7 +306,7 @@ static u8 sn65dsi83_get_dsi_range(struct sn65dsi83 *ctx,
 	 */
 	return DIV_ROUND_UP(clamp((unsigned int)mode->clock *
 			    mipi_dsi_pixel_format_to_bpp(ctx->dsi->format) /
-			    ctx->dsi_lanes / 2, 40000U, 500000U), 5000U);
+			    ctx->dsi->lanes / 2, 40000U, 500000U), 5000U);
 }
 
 static u8 sn65dsi83_get_dsi_div(struct sn65dsi83 *ctx)
@@ -316,7 +314,7 @@ static u8 sn65dsi83_get_dsi_div(struct sn65dsi83 *ctx)
 	/* The divider is (DSI_CLK / LVDS_CLK) - 1, which really is: */
 	unsigned int dsi_div = mipi_dsi_pixel_format_to_bpp(ctx->dsi->format);
 
-	dsi_div /= ctx->dsi_lanes;
+	dsi_div /= ctx->dsi->lanes;
 
 	if (!ctx->lvds_dual_link)
 		dsi_div /= 2;
@@ -411,7 +409,7 @@ static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
 	/* Set number of DSI lanes and LVDS link config. */
 	regmap_write(ctx->regmap, REG_DSI_LANE,
 		     REG_DSI_LANE_DSI_CHANNEL_MODE_SINGLE |
-		     REG_DSI_LANE_CHA_DSI_LANES(~(ctx->dsi_lanes - 1)) |
+		     REG_DSI_LANE_CHA_DSI_LANES(~(ctx->dsi->lanes - 1)) |
 		     /* CHB is DSI85-only, set to default on DSI83/DSI84 */
 		     REG_DSI_LANE_CHB_DSI_LANES(3));
 	/* No equalization. */
@@ -577,22 +575,6 @@ static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx, enum sn65dsi83_model model)
 {
 	struct drm_bridge *panel_bridge;
 	struct device *dev = ctx->dev;
-	struct device_node *endpoint;
-	int ret;
-
-	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
-	ctx->dsi_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
-	ctx->host_node = of_graph_get_remote_port_parent(endpoint);
-	of_node_put(endpoint);
-
-	if (ctx->dsi_lanes <= 0 || ctx->dsi_lanes > 4) {
-		ret = -EINVAL;
-		goto err_put_node;
-	}
-	if (!ctx->host_node) {
-		ret = -ENODEV;
-		goto err_put_node;
-	}
 
 	ctx->lvds_dual_link = false;
 	ctx->lvds_dual_link_even_odd_swap = false;
@@ -618,10 +600,8 @@ static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx, enum sn65dsi83_model model)
 	}
 
 	panel_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 2, 0);
-	if (IS_ERR(panel_bridge)) {
-		ret = PTR_ERR(panel_bridge);
-		goto err_put_node;
-	}
+	if (IS_ERR(panel_bridge))
+		return PTR_ERR(panel_bridge);
 
 	ctx->panel_bridge = panel_bridge;
 
@@ -631,15 +611,13 @@ static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx, enum sn65dsi83_model model)
 				     "Failed to get supply 'vcc'\n");
 
 	return 0;
-
-err_put_node:
-	of_node_put(ctx->host_node);
-	return ret;
 }
 
 static int sn65dsi83_host_attach(struct sn65dsi83 *ctx)
 {
 	struct device *dev = ctx->dev;
+	struct device_node *host_node;
+	struct device_node *endpoint;
 	struct mipi_dsi_device *dsi;
 	struct mipi_dsi_host *host;
 	const struct mipi_dsi_device_info info = {
@@ -647,13 +625,20 @@ static int sn65dsi83_host_attach(struct sn65dsi83 *ctx)
 		.channel = 0,
 		.node = NULL,
 	};
-	int ret;
+	int dsi_lanes, ret;
+
+	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
+	dsi_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
+	host_node = of_graph_get_remote_port_parent(endpoint);
+	host = of_find_mipi_dsi_host_by_node(host_node);
+	of_node_put(host_node);
+	of_node_put(endpoint);
 
-	host = of_find_mipi_dsi_host_by_node(ctx->host_node);
-	if (!host) {
-		dev_err(dev, "failed to find dsi host\n");
+	if (!host)
 		return -EPROBE_DEFER;
-	}
+
+	if (dsi_lanes < 0)
+		return dsi_lanes;
 
 	dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
 	if (IS_ERR(dsi))
@@ -662,7 +647,7 @@ static int sn65dsi83_host_attach(struct sn65dsi83 *ctx)
 
 	ctx->dsi = dsi;
 
-	dsi->lanes = ctx->dsi_lanes;
+	dsi->lanes = dsi_lanes;
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST;
 
@@ -709,10 +694,8 @@ static int sn65dsi83_probe(struct i2c_client *client,
 		return ret;
 
 	ctx->regmap = devm_regmap_init_i2c(client, &sn65dsi83_regmap_config);
-	if (IS_ERR(ctx->regmap)) {
-		ret = PTR_ERR(ctx->regmap);
-		goto err_put_node;
-	}
+	if (IS_ERR(ctx->regmap))
+		return PTR_ERR(ctx->regmap);
 
 	dev_set_drvdata(dev, ctx);
 	i2c_set_clientdata(client, ctx);
@@ -729,8 +712,6 @@ static int sn65dsi83_probe(struct i2c_client *client,
 
 err_remove_bridge:
 	drm_bridge_remove(&ctx->bridge);
-err_put_node:
-	of_node_put(ctx->host_node);
 	return ret;
 }
 
@@ -739,7 +720,6 @@ static int sn65dsi83_remove(struct i2c_client *client)
 	struct sn65dsi83 *ctx = i2c_get_clientdata(client);
 
 	drm_bridge_remove(&ctx->bridge);
-	of_node_put(ctx->host_node);
 
 	return 0;
 }
-- 
2.35.1

