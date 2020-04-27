Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 973CD1B99E0
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 10:20:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 125D66E102;
	Mon, 27 Apr 2020 08:20:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FFD36E0A1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 08:19:30 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id h4so3028618ljg.12
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 01:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MD6Cc48mPqUfbYyIOTQOUtDB50GD6TIAPPTOiyUgFog=;
 b=IFUqPzKmX6IZN4rxPobZg1QfBIMT+39zySUUXJ4WzlJrcIMXIWCz6Fn66sjE+K2wzi
 GEOkXcn1ivDShp+UfNbS/tlavfQEQX4R56c7X/tP/5LMrfFscGu3jGuX4ULcb1BUd8kE
 0Q2WGLLLewPR1cbY2P5kx4mRAm6iW6MtZvS9IsC2V7UbrZFGABjgkGFH+J6bEtFjVWCH
 T9VvCo0HshUZ+JgfsGt7O0w+edysvSf+AzvAVJeI9Y/QqPt4XE+BJPBsJ9aLf6vWn6Hl
 IPgBxHoZiPkjQnADHo7/C81Wz11oJg0I3GeQcAdZSN9Xs5GtYi3CKcVjQb1IO45SPzQg
 EpKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=MD6Cc48mPqUfbYyIOTQOUtDB50GD6TIAPPTOiyUgFog=;
 b=nlJns8LtwGMmzXBCFy9RIPmaN+HHQl+z1UJB5h4NGsbSUIPCQ/TdHpa4wbGAsFOofV
 qNrAfqpjtxKMEeth5d+msq70CdCLmA4Babz/pdMoeCoCPhaVaV/Ul9hlGwz6zaGoM8px
 o4RK7pQeTFWnlimvKAISACmcTa6RwE8bSsKwe+s8UZtQU6eoSOpDtFk2An2ez0tvOYDY
 9YBqTNJcWzYX699KUoBSJMq//yae7LKoZsgoMHEetNEa2Nq9OVkynhXSfTtswR8MPV2c
 6Lzhxg1h3z8mKCkHlJIs0IbGwoPbOJzTEn14Or9jsGH/emZ9OKtY+W+Jtg14UynXTfI7
 zikg==
X-Gm-Message-State: AGi0PuZvDdhrel1PPGBdkSIs+DNieSRU7amP1H81/zD1NJOb2QaupUMm
 j2ZB915PmKD5R5Xd6+isU19vxFZh
X-Google-Smtp-Source: APiQypJXVjYRCDY5O7BBbpip/6ZnQNdlD13cxDgrm1jaEWl6SmR4n03rw9RJfwi/KlIF/cJY5QK+HQ==
X-Received: by 2002:a2e:920e:: with SMTP id k14mr14204395ljg.288.1587975568186; 
 Mon, 27 Apr 2020 01:19:28 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 c20sm9846301ljk.59.2020.04.27.01.19.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 01:19:27 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 21/21] drm/bridge: ti-sn65dsi86: add drm_panel_bridge
 support
Date: Mon, 27 Apr 2020 10:18:50 +0200
Message-Id: <20200427081850.17512-22-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200427081850.17512-1-sam@ravnborg.org>
References: <20200427081850.17512-1-sam@ravnborg.org>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Martyn Welch <martyn.welch@collabora.co.uk>, Jonas Karlman <jonas@kwiboo.se>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Martin Donnelly <martin.donnelly@ge.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare the bridge driver for use in a chained setup by
replacing direct use of drm_panel with drm_panel_bridge support.

Note: the bridge panel will use the connector type from the panel.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 6ad688b320ae..c306d3069037 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -98,7 +98,7 @@ struct ti_sn_bridge {
 	struct device_node		*host_node;
 	struct mipi_dsi_device		*dsi;
 	struct clk			*refclk;
-	struct drm_panel		*panel;
+	struct drm_bridge		*panel_bridge;
 	struct gpio_desc		*enable_gpio;
 	struct regulator_bulk_data	supplies[SN_REGULATOR_SUPPLY_NUM];
 	int				dp_lanes;
@@ -208,7 +208,7 @@ static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
 {
 	struct ti_sn_bridge *pdata = connector_to_ti_sn_bridge(connector);
 
-	return drm_panel_get_modes(pdata->panel, connector);
+	return drm_bridge_get_modes(pdata->panel_bridge, connector);
 }
 
 static enum drm_mode_status
@@ -340,9 +340,8 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 	pdata->dsi = dsi;
 
 	/* attach panel to bridge */
-	drm_panel_attach(pdata->panel, &pdata->connector);
-
-	return 0;
+	return drm_bridge_attach(bridge->encoder, pdata->panel_bridge,
+				 bridge, flags);
 
 err_dsi_attach:
 	mipi_dsi_device_unregister(dsi);
@@ -355,16 +354,12 @@ static void ti_sn_bridge_disable(struct drm_bridge *bridge)
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
@@ -731,8 +726,6 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
 	/* enable video stream */
 	regmap_update_bits(pdata->regmap, SN_ENH_FRAME_REG, VSTREAM_ENABLE,
 			   VSTREAM_ENABLE);
-
-	drm_panel_enable(pdata->panel);
 }
 
 static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
@@ -762,8 +755,6 @@ static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
 	 */
 	regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
 			   HPD_DISABLE);
-
-	drm_panel_prepare(pdata->panel);
 }
 
 static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
@@ -878,6 +869,8 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
 			      const struct i2c_device_id *id)
 {
 	struct ti_sn_bridge *pdata;
+	struct drm_bridge *bridge;
+	struct drm_panel *panel;
 	int ret;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
@@ -900,12 +893,18 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
 	pdata->dev = &client->dev;
 
 	ret = drm_of_find_panel_or_bridge(pdata->dev->of_node, 1, 0,
-					  &pdata->panel, NULL);
+					  &panel, NULL);
 	if (ret) {
 		DRM_ERROR("could not find any panel node\n");
 		return ret;
 	}
 
+	bridge = devm_drm_panel_bridge_add(pdata->dev, panel);
+	if (IS_ERR(bridge))
+		return PTR_ERR(bridge);
+
+	pdata->panel_bridge = bridge;
+
 	dev_set_drvdata(&client->dev, pdata);
 
 	pdata->enable_gpio = devm_gpiod_get(pdata->dev, "enable",
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
