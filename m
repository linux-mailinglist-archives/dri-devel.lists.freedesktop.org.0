Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AFE343702
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 04:02:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A184689DC2;
	Mon, 22 Mar 2021 03:02:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24FCE89C54
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 03:02:22 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BCE841051;
 Mon, 22 Mar 2021 04:02:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1616382140;
 bh=AntMdEuGmCvfBkkYwY3YUXXAUYVPF7aSkZv8tlndc7I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=suo+qtdmSGccEVvLMmiZ5ZutTCoY+bcubrtTmc3fk8jwjMvMt6Qzq/kWgEi5BwmHl
 sgExFXefwKa0/iKlqlXDIO1qkuW3JddLLrqYErtU9xlEnmp5nbGwpi1ftwQPrtFvH2
 dC/n7dz//SwhdDsocejPdfJsBHkLxc8dl1psXTBw=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 05/11] drm/bridge: ti-sn65dsi86: Wrap panel with
 panel-bridge
Date: Mon, 22 Mar 2021 05:01:22 +0200
Message-Id: <20210322030128.2283-6-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 linux-renesas-soc@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To simplify interfacing with the panel, wrap it in a panel-bridge and
let the DRM bridge helpers handle chaining of operations.

This also prepares for support of DRM_BRIDGE_ATTACH_NO_CONNECTOR, which
requires all components in the display pipeline to be represented by
bridges.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 30 +++++++++++++++++++--------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 1d1be791d5ba..c21a7f7d452b 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -124,6 +124,7 @@
  * @edid:         Detected EDID of eDP panel.
  * @refclk:       Our reference clock.
  * @panel:        Our panel.
+ * @next_bridge:  The next bridge.
  * @enable_gpio:  The GPIO we toggle to enable the bridge.
  * @supplies:     Data for bulk enabling/disabling our regulators.
  * @dp_lanes:     Count of dp_lanes we're using.
@@ -152,6 +153,7 @@ struct ti_sn_bridge {
 	struct mipi_dsi_device		*dsi;
 	struct clk			*refclk;
 	struct drm_panel		*panel;
+	struct drm_bridge		*next_bridge;
 	struct gpio_desc		*enable_gpio;
 	struct regulator_bulk_data	supplies[SN_REGULATOR_SUPPLY_NUM];
 	int				dp_lanes;
@@ -287,7 +289,7 @@ static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
 		}
 	}
 
-	return drm_panel_get_modes(pdata->panel, connector);
+	return drm_bridge_get_modes(pdata->next_bridge, connector);
 }
 
 static enum drm_mode_status
@@ -418,8 +420,18 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 	}
 	pdata->dsi = dsi;
 
+	/* Attach the next bridge */
+	ret = drm_bridge_attach(bridge->encoder, pdata->next_bridge,
+				&pdata->bridge, flags);
+	if (ret < 0) {
+		DRM_ERROR("failed to attach next bridge\n");
+		goto err_dsi_detach;
+	}
+
 	return 0;
 
+err_dsi_detach:
+	mipi_dsi_detach(dsi);
 err_dsi_attach:
 	mipi_dsi_device_unregister(dsi);
 err_dsi_host:
@@ -431,16 +443,12 @@ static void ti_sn_bridge_disable(struct drm_bridge *bridge)
 {
 	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
 
-	drm_panel_disable(pdata->panel);
-
 	/* disable video stream */
 	regmap_update_bits(pdata->regmap, SN_ENH_FRAME_REG, VSTREAM_ENABLE, 0);
 	/* semi auto link training mode OFF */
 	regmap_write(pdata->regmap, SN_ML_TX_MODE_REG, 0);
 	/* disable DP PLL */
 	regmap_write(pdata->regmap, SN_PLL_ENABLE_REG, 0);
-
-	drm_panel_unprepare(pdata->panel);
 }
 
 static u32 ti_sn_bridge_get_dsi_freq(struct ti_sn_bridge *pdata)
@@ -819,8 +827,6 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
 	/* enable video stream */
 	regmap_update_bits(pdata->regmap, SN_ENH_FRAME_REG, VSTREAM_ENABLE,
 			   VSTREAM_ENABLE);
-
-	drm_panel_enable(pdata->panel);
 }
 
 static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
@@ -850,8 +856,6 @@ static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
 	 */
 	regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
 			   HPD_DISABLE);
-
-	drm_panel_prepare(pdata->panel);
 }
 
 static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
@@ -1245,6 +1249,14 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
 		return ret;
 	}
 
+	pdata->next_bridge = devm_drm_panel_bridge_add(pdata->dev,
+						       pdata->panel);
+	if (IS_ERR(pdata->next_bridge)) {
+		DRM_ERROR("failed to create panel bridge\n");
+		ret = PTR_ERR(pdata->next_bridge);
+		return ret;
+	}
+
 	dev_set_drvdata(&client->dev, pdata);
 
 	pdata->enable_gpio = devm_gpiod_get_optional(pdata->dev, "enable",
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
