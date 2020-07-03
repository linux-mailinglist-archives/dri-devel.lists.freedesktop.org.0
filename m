Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91610213FF8
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 21:25:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B346EBC5;
	Fri,  3 Jul 2020 19:24:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9C616EBC3
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 19:24:48 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id 9so38153465ljv.5
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jul 2020 12:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9V8PtqBKGrK9wme2ZlfDKfugqp+2ikNzpWbUymFtbiM=;
 b=LtfIg/B6LI48aFNC0vhZQYE9/5x1bldeYjl/wj9p9QG1XFN2vdsdryGPFYjyRrgVMe
 a6eIGetktVBb4yBbaNlUDExEdD0aeIf2Lxl6SIehE702eN0YAeim02y3qGbx9YqFghzS
 3w99FjCnDUQlstz1YxVNVh7a8plxsK63GSe6cGgIRCV/u99ic97ck6RQ4knPWsnBQ0r5
 eyHc5CX9ecmC96X/0rOO+09wU5AmQ+BeqPBwOIJUtWg3r3x88zgAz0ViP/E04MRhqJjE
 McokoR1lfWs79kbUkU90AR5XiwDEz3OV3vPDY/vqRjldqpFaEcFoHUI6lVaGLlDqwVkF
 +y5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9V8PtqBKGrK9wme2ZlfDKfugqp+2ikNzpWbUymFtbiM=;
 b=OQAliOaj/4VADe8EQr/qxPOQ2IA0x2ym2YBiW2cqulgGcHQrCGFXKDczdA3ktfi14u
 HAH+fkoJ9179HQAYYLaowxyGoLxffZtkjd/26pnQ5sryrthr76DvnvlzIhYI8ExFg6rR
 3/+k35qpdfEy0RiZKmM48u7G0BP+pAk4zY4K3A+u+cAEiL9cWMABXyRNMIeb2pxcYo2C
 4S9n/1uTYhMA4nNyWL/ozqLg2QH5XsO6r5nbh7Dg6YLCB6tdEgR/maaxerRbRQNd8tsn
 JDgOwzaqJybmtSGZ1WF3QoqJPZyRuyZv/vpai3GeaXL2PYz7nQcj7ptGWak4xrdFc3In
 D/ng==
X-Gm-Message-State: AOAM531YuEQDcJGBUxvW5cTVdXnoeHWop7iygHV4KacN3ZHTKizWm0+4
 PKZtp5wWTYM+XgoJZwbfi25RjNZQKrM=
X-Google-Smtp-Source: ABdhPJy4OTHQoWIkYJSwNVyV0OCnI/FWQo8n/hjTG+d+SKRtiBHffKuQmri9IplC4xqOuFdX/JKCSg==
X-Received: by 2002:a2e:9397:: with SMTP id g23mr21866042ljh.185.1593804287041; 
 Fri, 03 Jul 2020 12:24:47 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:4025:a614:1d5c:b7bc])
 by smtp.gmail.com with ESMTPSA id y26sm4411791ljm.46.2020.07.03.12.24.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 12:24:46 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 21/21] drm/bridge: ti-sn65dsi86: add drm_panel_bridge
 support
Date: Fri,  3 Jul 2020 21:24:17 +0200
Message-Id: <20200703192417.372164-22-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200703192417.372164-1-sam@ravnborg.org>
References: <20200703192417.372164-1-sam@ravnborg.org>
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
 Sam Ravnborg <sam@ravnborg.org>, kbuild test robot <lkp@intel.com>
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
index 0f75bb2d7f56..ecf0693e3018 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -144,7 +144,7 @@ struct ti_sn_bridge {
 	struct device_node		*host_node;
 	struct mipi_dsi_device		*dsi;
 	struct clk			*refclk;
-	struct drm_panel		*panel;
+	struct drm_bridge		*panel_bridge;
 	struct gpio_desc		*enable_gpio;
 	struct regulator_bulk_data	supplies[SN_REGULATOR_SUPPLY_NUM];
 	int				dp_lanes;
@@ -263,7 +263,7 @@ static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
 {
 	struct ti_sn_bridge *pdata = connector_to_ti_sn_bridge(connector);
 
-	return drm_panel_get_modes(pdata->panel, connector);
+	return drm_bridge_get_modes(pdata->panel_bridge, connector);
 }
 
 static enum drm_mode_status
@@ -395,9 +395,8 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 	pdata->dsi = dsi;
 
 	/* attach panel to bridge */
-	drm_panel_attach(pdata->panel, &pdata->connector);
-
-	return 0;
+	return drm_bridge_attach(bridge->encoder, pdata->panel_bridge,
+				 bridge, flags);
 
 err_dsi_attach:
 	mipi_dsi_device_unregister(dsi);
@@ -410,16 +409,12 @@ static void ti_sn_bridge_disable(struct drm_bridge *bridge)
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
@@ -780,8 +775,6 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
 	/* enable video stream */
 	regmap_update_bits(pdata->regmap, SN_ENH_FRAME_REG, VSTREAM_ENABLE,
 			   VSTREAM_ENABLE);
-
-	drm_panel_enable(pdata->panel);
 }
 
 static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
@@ -811,8 +804,6 @@ static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
 	 */
 	regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
 			   HPD_DISABLE);
-
-	drm_panel_prepare(pdata->panel);
 }
 
 static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
@@ -1163,6 +1154,8 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
 			      const struct i2c_device_id *id)
 {
 	struct ti_sn_bridge *pdata;
+	struct drm_bridge *bridge;
+	struct drm_panel *panel;
 	int ret;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
@@ -1185,12 +1178,18 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
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
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
