Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B2622F5F9
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 19:03:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EE6089C17;
	Mon, 27 Jul 2020 17:03:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2A2889C17
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 17:03:32 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id d2so3772850lfj.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 10:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I1BQEmcf8qKHQLUrQbyardYkMB/P5LnXTuvRfef78PU=;
 b=US4eR0LS2MzNFav9q3+fGNdRsTztSshJ9E1m86penLyxcIfbUcgsyzjFdHuILmW1+B
 2RZOXCSUbiDXVQdScNxBBVe1EFgJyoMBtJZcw9hcHLhiwY53ElXvtMO90fOLwztvAihu
 ytfiUX7rl7TtQFmVLCABorVFj/IwyGG5fGsW1IxYL0Ey70Wfr6QaOP35kBwj9fGUq9uc
 xCyOqRETae8AtwmAskZi8Tl7i8uCvNNvIfjcONT8jwTSMKsY0n0A2St/FY7JIJX/GhlP
 8LkPaqh/LIkdcVOjCQOH0DflfH7H6V9DF0H4sVyDiWhQ84dmTOdHdszlIf1hlwlVCJRR
 L89g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=I1BQEmcf8qKHQLUrQbyardYkMB/P5LnXTuvRfef78PU=;
 b=oy50IE3WBeMlF7O9nA1BWCyAs5XegGBUd0qCv0xy0bqmSenVRQIUYKoEBHkWFhO2ut
 Ix0GO6D8w1eqFqCrmIwXMnKqxsiarwDTOXSkQ2Ztnps1nq170JmKyDh7rwlx4TvakE7s
 01nC0RTvaWfHWFD6VZUen6hwk87dhxDJjSp/xaXZFsdcodejwMkvEX+OWxQ572fe/v/T
 Uh7MaKaruFt2bVMlCLcnxq9vhF0EFRqI4fWG3epAAsNWKM7pCMw2jbVq0n+ynNriYodQ
 LSwkIkwiCSAIHoDRB1GaoNJxItdy6QpCqVb/UmvoxsBbjwijs30tNwPBglViwMoLsJTO
 6T3w==
X-Gm-Message-State: AOAM531wmkr+OT6P2mYdmVb20x0opp7k1/ZrxUJ5YLLc4SPS0byT1jmE
 BPT4Me6iVdBCHk9dYIWD4EJxL8/bxq8=
X-Google-Smtp-Source: ABdhPJxzU4u2J7br11eBanOtXIccWwJB8iGQKc+ald5Oy/AaQuU6jcq77kzrtbstbIFIgPmDfwGIWw==
X-Received: by 2002:a05:6512:3156:: with SMTP id
 s22mr12173817lfi.140.1595869410952; 
 Mon, 27 Jul 2020 10:03:30 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:a56d:c972:788a:ba53])
 by smtp.gmail.com with ESMTPSA id l3sm1417470lji.115.2020.07.27.10.03.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 10:03:30 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v5 3/5] drm/bridge: tc358767: add drm_panel_bridge support
Date: Mon, 27 Jul 2020 19:03:18 +0200
Message-Id: <20200727170320.959777-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200727170320.959777-1-sam@ravnborg.org>
References: <20200727170320.959777-1-sam@ravnborg.org>
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
Cc: Andrzej Hajda <a.hajda@samsung.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jonas Karlman <jonas@kwiboo.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With the bridge operations implemented the last step to prepare
this driver for a chained setup is the use of the bridge panel driver.

The bridge panel driver is only used when a port@2 is present in
the DT. So when the display driver requests a connector
support both situations:
- connector created by bridge panel driver
- connector created by this driver

And on top, support that the display driver creates the connector,
which is the preferred setup.

Note: the bridge panel will use the connector type from the panel.

v3:
  - Fix wrong logic in connector creation (Laurent)

v2:
  - Merge connector and drm_panel_bridge patches
    and fix so we do not create two connectors (Laurent)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/bridge/tc358767.c | 70 +++++++++++++++----------------
 1 file changed, 35 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index b26c669f3e91..cbad2607ab43 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -244,8 +244,8 @@ struct tc_data {
 	struct drm_dp_aux	aux;
 
 	struct drm_bridge	bridge;
+	struct drm_bridge	*panel_bridge;
 	struct drm_connector	connector;
-	struct drm_panel	*panel;
 
 	/* link settings */
 	struct tc_edp_link	link;
@@ -1234,13 +1234,6 @@ static int tc_stream_disable(struct tc_data *tc)
 	return 0;
 }
 
-static void tc_bridge_pre_enable(struct drm_bridge *bridge)
-{
-	struct tc_data *tc = bridge_to_tc(bridge);
-
-	drm_panel_prepare(tc->panel);
-}
-
 static void tc_bridge_enable(struct drm_bridge *bridge)
 {
 	struct tc_data *tc = bridge_to_tc(bridge);
@@ -1264,8 +1257,6 @@ static void tc_bridge_enable(struct drm_bridge *bridge)
 		tc_main_link_disable(tc);
 		return;
 	}
-
-	drm_panel_enable(tc->panel);
 }
 
 static void tc_bridge_disable(struct drm_bridge *bridge)
@@ -1273,8 +1264,6 @@ static void tc_bridge_disable(struct drm_bridge *bridge)
 	struct tc_data *tc = bridge_to_tc(bridge);
 	int ret;
 
-	drm_panel_disable(tc->panel);
-
 	ret = tc_stream_disable(tc);
 	if (ret < 0)
 		dev_err(tc->dev, "main link stream stop error: %d\n", ret);
@@ -1284,13 +1273,6 @@ static void tc_bridge_disable(struct drm_bridge *bridge)
 		dev_err(tc->dev, "main link disable error: %d\n", ret);
 }
 
-static void tc_bridge_post_disable(struct drm_bridge *bridge)
-{
-	struct tc_data *tc = bridge_to_tc(bridge);
-
-	drm_panel_unprepare(tc->panel);
-}
-
 static bool tc_bridge_mode_fixup(struct drm_bridge *bridge,
 				 const struct drm_display_mode *mode,
 				 struct drm_display_mode *adj)
@@ -1354,9 +1336,11 @@ static int tc_connector_get_modes(struct drm_connector *connector)
 		return 0;
 	}
 
-	num_modes = drm_panel_get_modes(tc->panel, connector);
-	if (num_modes > 0)
-		return num_modes;
+	if (tc->panel_bridge) {
+		num_modes = drm_bridge_get_modes(tc->panel_bridge, connector);
+		if (num_modes > 0)
+			return num_modes;
+	}
 
 	edid = tc_get_edid(&tc->bridge, connector);
 	num_modes = drm_add_edid_modes(connector, edid);
@@ -1396,7 +1380,7 @@ tc_connector_detect(struct drm_connector *connector, bool force)
 	if (tc->hpd_pin >= 0)
 		return tc_bridge_detect(&tc->bridge);
 
-	if (tc->panel)
+	if (tc->panel_bridge)
 		return connector_status_connected;
 	else
 		return connector_status_unknown;
@@ -1419,16 +1403,23 @@ static int tc_bridge_attach(struct drm_bridge *bridge,
 	struct drm_device *drm = bridge->dev;
 	int ret;
 
-	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
-		DRM_ERROR("Fix bridge driver to make connector optional!");
-		return -EINVAL;
+	if (tc->panel_bridge) {
+		enum drm_bridge_attach_flags panel_flags;
+
+		/* If a connector is required then this driver shall create it */
+		panel_flags = flags | DRM_BRIDGE_ATTACH_NO_CONNECTOR;
+		ret = drm_bridge_attach(tc->bridge.encoder, tc->panel_bridge,
+					&tc->bridge, panel_flags);
+		if (ret)
+			return ret;
 	}
 
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
+		return 0;
+
 	/* Create DP/eDP connector */
 	drm_connector_helper_add(&tc->connector, &tc_connector_helper_funcs);
-	ret = drm_connector_init(drm, &tc->connector, &tc_connector_funcs,
-				 tc->panel ? DRM_MODE_CONNECTOR_eDP :
-				 DRM_MODE_CONNECTOR_DisplayPort);
+	ret = drm_connector_init(drm, &tc->connector, &tc_connector_funcs, tc->bridge.type);
 	if (ret)
 		return ret;
 
@@ -1441,9 +1432,6 @@ static int tc_bridge_attach(struct drm_bridge *bridge,
 					       DRM_CONNECTOR_POLL_DISCONNECT;
 	}
 
-	if (tc->panel)
-		drm_panel_attach(tc->panel, &tc->connector);
-
 	drm_display_info_set_bus_formats(&tc->connector.display_info,
 					 &bus_format, 1);
 	tc->connector.display_info.bus_flags =
@@ -1459,10 +1447,8 @@ static const struct drm_bridge_funcs tc_bridge_funcs = {
 	.attach = tc_bridge_attach,
 	.mode_valid = tc_mode_valid,
 	.mode_set = tc_bridge_mode_set,
-	.pre_enable = tc_bridge_pre_enable,
 	.enable = tc_bridge_enable,
 	.disable = tc_bridge_disable,
-	.post_disable = tc_bridge_post_disable,
 	.mode_fixup = tc_bridge_mode_fixup,
 	.detect = tc_bridge_detect,
 	.get_edid = tc_get_edid,
@@ -1555,6 +1541,7 @@ static irqreturn_t tc_irq_handler(int irq, void *arg)
 static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
 {
 	struct device *dev = &client->dev;
+	struct drm_panel *panel;
 	struct tc_data *tc;
 	int ret;
 
@@ -1565,10 +1552,23 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	tc->dev = dev;
 
 	/* port@2 is the output port */
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 2, 0, &tc->panel, NULL);
+	ret = drm_of_find_panel_or_bridge(dev->of_node, 2, 0, &panel, NULL);
 	if (ret && ret != -ENODEV)
 		return ret;
 
+	if (panel) {
+		struct drm_bridge *panel_bridge;
+
+		panel_bridge = devm_drm_panel_bridge_add(dev, panel);
+		if (IS_ERR(panel_bridge))
+			return PTR_ERR(panel_bridge);
+
+		tc->panel_bridge = panel_bridge;
+		tc->bridge.type = DRM_MODE_CONNECTOR_eDP;
+	} else {
+		tc->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
+	}
+
 	/* Shut down GPIO is optional */
 	tc->sd_gpio = devm_gpiod_get_optional(dev, "shutdown", GPIOD_OUT_HIGH);
 	if (IS_ERR(tc->sd_gpio))
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
