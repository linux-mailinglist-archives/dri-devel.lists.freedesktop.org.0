Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E31551B99C2
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 10:19:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C30DF6E0E2;
	Mon, 27 Apr 2020 08:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8A856E0A1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 08:19:15 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id a21so13706912ljj.11
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 01:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bt7QLXi92zUNaN3f6b0hoOVKRdATOXUeHv3J3k12mc8=;
 b=vg0Ly9eZybytYRwUereJlSxiVw/LwHnCm/AgIlqHzidqNxKyplJP1aq2QT+W3/xxQc
 qwuM/YKqJ1h2LHLx56kO6cjb4nK8OgPWWFqRMMls64EFTWxX0oCAoydVVup4X/fK3lLs
 Nq8KD/fBZsUWowQ0VyNILoFh27YReU6ZL5EBLnKRs6dt5BMCASKhlpCMIrO5b0D7syEn
 +xA7jgySbqnAG7dLtjT3wBNx/qPJuuK9k1Dy6xroVHjptACAp0dyJ9OR0CiIF5jvuvcK
 P1MhWuS7yIBeBeoKn7hfAYJ4ZlNPlBaUXOZtUkqEFxlwKrWwExVD7TNsix9IMHvhBw/p
 v2pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Bt7QLXi92zUNaN3f6b0hoOVKRdATOXUeHv3J3k12mc8=;
 b=hc+WLcJuNkZApBCctpYLtw9eT+k7PDrvwQ/tVdyVSZK9rZhUEXxPpwa1lagHtSOOnC
 v2GVmRQZnvtCcTxPXqXs+xJD2FyupwVad+XoqPro2YgnNEgM1bNANq3ZT0vre8nuYY1U
 i1TV5TcWQTzwYWbDCQLMBdUPl1JCVKnEceRxwF1Tx0BZCnU+78cw8wfLa/FIA7eb+H4p
 iNmlUcyDkTeNJWD8aU/slCg92TX51HGsZ/S936QSpERtukG+2xjdCVsKQRKFDNUr3oNE
 TW5PmA0+uZNivI287mgxIMa1zOPU/NadzAvVV8ECahTLXFscWi4PlSWuSOr8BH2YLOqJ
 fvew==
X-Gm-Message-State: AGi0Pubh/9tVDd7fhfQ3xp8SuIWMLtC2sNT80vTP407K89ZZk6f+CYs2
 eG61zLgtVNTJ45iQcquWm1kSwrcc
X-Google-Smtp-Source: APiQypL59dPmXD8K0UE4UFImvYoAXQSDDUqKAnJ4rB5xq+/Y83TJcJpSJHLGheQbL8hq7w19J1dQIQ==
X-Received: by 2002:a05:651c:48a:: with SMTP id
 s10mr12869944ljc.226.1587975553960; 
 Mon, 27 Apr 2020 01:19:13 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 c20sm9846301ljk.59.2020.04.27.01.19.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 01:19:13 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 11/21] drm/bridge: parade-ps8622: add drm_panel_bridge
 support
Date: Mon, 27 Apr 2020 10:18:40 +0200
Message-Id: <20200427081850.17512-12-sam@ravnborg.org>
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
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
