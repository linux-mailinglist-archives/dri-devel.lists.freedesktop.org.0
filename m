Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3712F213FED
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 21:24:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E9B6EBB9;
	Fri,  3 Jul 2020 19:24:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69D596EBB4
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 19:24:38 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id t9so19074961lfl.5
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jul 2020 12:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B5UFi+Myhc1G+0PO6AW3i0j1KDWVWYjhATwDqBAjUTE=;
 b=GQarI06kUCuIWrxvVyCVQfnoemHkyqH5w1Tx/DQX+bWxdZCFE+GU5XwRGjD5iISo/V
 Ld75mgy6zvVcTfek5Udg0NaidJfr2dipswngs4KkdTlZTqzQYp0tad954nqN19kW+42L
 gs1E4oAPyXvCxGayBHvanT4n79EKcO5UxCuLPSSt9dPSW5CML8otCbhxQ+ReImUH0xom
 9+3iA/2ktReJ77KjcmdQ4Lt4jIl6OJ2CMl9VkXx130r2YibM/s3dEk4RQ2/uDCBogoDO
 P22kB80vHDBKCXlB6k7WlU/VJtPe5rD+OHKoSCq53RNlA3wGAz1ysRuHcIoe/VVKdoNJ
 jijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=B5UFi+Myhc1G+0PO6AW3i0j1KDWVWYjhATwDqBAjUTE=;
 b=dQKaNZezDLq+k6pf/Q7gdSaPbCeDjeAm/uB8fUrd2tT18/5O9shwAOEG/Moj5kNEFD
 CuO3qacz+6DBo2IvfRxKt28G3o1+Im8Hexp33MPB9EYDY1Y+S2w2qxadza7oVd9Zu1ca
 nydNfYFPqz1AMxeNktK0uOP/WLdpg28B24oYIMx+F0hL0N2vuBaMaCdq/dRj5AWRex7d
 aPVxOYMeuQSU6fq02zev+oLYphYAqhBWKfTPQ4TBEYFBPziWifZiazHgf2jdb4vHHYRE
 /3V7qerU96eMmqhICibXEtChFZ97LSWeJgKiL4XV/xC2b2n8btl4DhQsIDC8E7qJsVsi
 uriA==
X-Gm-Message-State: AOAM530MTES1TAc4j72xttvb9WmuQ0CfNK+teWwZfIKINL9B7jAucUY0
 QUtPNHeHoAQRZNgKnv/hQXkRpzXnzDw=
X-Google-Smtp-Source: ABdhPJyhBiUQ9SiJoMjOPUUjeiIgo93eOzF5goMYEPWfF4nNr4sHQuW2dpy9LkHQRSP/74zxoya3pQ==
X-Received: by 2002:a19:23cc:: with SMTP id
 j195mr23039290lfj.210.1593804276551; 
 Fri, 03 Jul 2020 12:24:36 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:4025:a614:1d5c:b7bc])
 by smtp.gmail.com with ESMTPSA id y26sm4411791ljm.46.2020.07.03.12.24.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 12:24:36 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 11/21] drm/bridge: parade-ps8622: add drm_panel_bridge
 support
Date: Fri,  3 Jul 2020 21:24:07 +0200
Message-Id: <20200703192417.372164-12-sam@ravnborg.org>
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
 drivers/gpu/drm/bridge/parade-ps8622.c | 46 ++++++++------------------
 1 file changed, 13 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8622.c b/drivers/gpu/drm/bridge/parade-ps8622.c
index d789ea2a7fb9..6ab6f60b9091 100644
--- a/drivers/gpu/drm/bridge/parade-ps8622.c
+++ b/drivers/gpu/drm/bridge/parade-ps8622.c
@@ -45,7 +45,7 @@ struct ps8622_bridge {
 	struct drm_connector connector;
 	struct i2c_client *client;
 	struct drm_bridge bridge;
-	struct drm_panel *panel;
+	struct drm_bridge *panel_bridge;
 	struct regulator *v12;
 	struct backlight_device *bl;
 
@@ -365,11 +365,6 @@ static void ps8622_pre_enable(struct drm_bridge *bridge)
 			DRM_ERROR("fails to enable ps8622->v12");
 	}
 
-	if (drm_panel_prepare(ps8622->panel)) {
-		DRM_ERROR("failed to prepare panel\n");
-		return;
-	}
-
 	gpiod_set_value(ps8622->gpio_slp, 1);
 
 	/*
@@ -399,24 +394,8 @@ static void ps8622_pre_enable(struct drm_bridge *bridge)
 	ps8622->enabled = true;
 }
 
-static void ps8622_enable(struct drm_bridge *bridge)
-{
-	struct ps8622_bridge *ps8622 = bridge_to_ps8622(bridge);
-
-	if (drm_panel_enable(ps8622->panel)) {
-		DRM_ERROR("failed to enable panel\n");
-		return;
-	}
-}
-
 static void ps8622_disable(struct drm_bridge *bridge)
 {
-	struct ps8622_bridge *ps8622 = bridge_to_ps8622(bridge);
-
-	if (drm_panel_disable(ps8622->panel)) {
-		DRM_ERROR("failed to disable panel\n");
-		return;
-	}
 	msleep(PS8622_PWMO_END_T12_MS);
 }
 
@@ -436,11 +415,6 @@ static void ps8622_post_disable(struct drm_bridge *bridge)
 	 */
 	gpiod_set_value(ps8622->gpio_slp, 0);
 
-	if (drm_panel_unprepare(ps8622->panel)) {
-		DRM_ERROR("failed to unprepare panel\n");
-		return;
-	}
-
 	if (ps8622->v12)
 		regulator_disable(ps8622->v12);
 
@@ -461,7 +435,7 @@ static int ps8622_get_modes(struct drm_connector *connector)
 
 	ps8622 = connector_to_ps8622(connector);
 
-	return drm_panel_get_modes(ps8622->panel, connector);
+	return drm_bridge_get_modes(ps8622->panel_bridge, connector);
 }
 
 static const struct drm_connector_helper_funcs ps8622_connector_helper_funcs = {
@@ -482,6 +456,9 @@ static int ps8622_attach(struct drm_bridge *bridge,
 	struct ps8622_bridge *ps8622 = bridge_to_ps8622(bridge);
 	int ret;
 
+	ret = drm_bridge_attach(ps8622->bridge.encoder, ps8622->panel_bridge,
+				&ps8622->bridge, flags);
+
 	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
 		DRM_ERROR("Fix bridge driver to make connector optional!");
 		return -EINVAL;
@@ -505,9 +482,6 @@ static int ps8622_attach(struct drm_bridge *bridge,
 	drm_connector_attach_encoder(&ps8622->connector,
 							bridge->encoder);
 
-	if (ps8622->panel)
-		drm_panel_attach(ps8622->panel, &ps8622->connector);
-
 	drm_helper_hpd_irq_event(ps8622->connector.dev);
 
 	return ret;
@@ -515,7 +489,6 @@ static int ps8622_attach(struct drm_bridge *bridge,
 
 static const struct drm_bridge_funcs ps8622_bridge_funcs = {
 	.pre_enable = ps8622_pre_enable,
-	.enable = ps8622_enable,
 	.disable = ps8622_disable,
 	.post_disable = ps8622_post_disable,
 	.attach = ps8622_attach,
@@ -533,16 +506,23 @@ static int ps8622_probe(struct i2c_client *client,
 {
 	struct device *dev = &client->dev;
 	struct ps8622_bridge *ps8622;
+	struct drm_bridge *pbridge;
+	struct drm_panel *panel;
 	int ret;
 
 	ps8622 = devm_kzalloc(dev, sizeof(*ps8622), GFP_KERNEL);
 	if (!ps8622)
 		return -ENOMEM;
 
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &ps8622->panel, NULL);
+	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &panel, NULL);
 	if (ret)
 		return ret;
 
+	pbridge = devm_drm_panel_bridge_add(dev, panel);
+	if (IS_ERR(pbridge))
+		return PTR_ERR(pbridge);
+
+	ps8622->panel_bridge = pbridge;
 	ps8622->client = client;
 
 	ps8622->v12 = devm_regulator_get(dev, "vdd12");
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
