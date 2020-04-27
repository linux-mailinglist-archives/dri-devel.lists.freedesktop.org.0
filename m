Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F021B99DC
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 10:20:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF47E6E0FB;
	Mon, 27 Apr 2020 08:20:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB05C6E0A1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 08:19:26 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id t11so13030734lfe.4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 01:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o5DJmdQFZpMVKr/FQEUxXPMg63d8Tk7lytsgMLwwR3s=;
 b=dSKE53MZfVaKlP7T5UuteccYi9Mxj3V9rpmMOAGuyGTp9mAHpebXts8J3jOzM9syEd
 e1VPJNz401DjJKV+0rw0ayFa7+xuxYCLIKkqs/BlaE1tb+TeIxlzTYYCTdln6UF84Dst
 P4IDY3Oz1sk3dfcv1dMCsmdoYm2Isc2v8nQ4ejwJUx9MQIIcp1XflulCiefWRxg0U3pZ
 +1rzK440kaLcC3t5hsA5nr4J29AqHab/lHgYnKSwKKdNvxfjp23b5EsqfOxXBUhMGime
 +p4NbhH4ny1m69Ze9S/Oz4vxX1SXiXE4KlPZ5TopIWswv8jwIEz4aGqlDx2F64Vjqz7f
 ZXHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=o5DJmdQFZpMVKr/FQEUxXPMg63d8Tk7lytsgMLwwR3s=;
 b=CfDzUwqVxxFpgalzAqvvtvvi6hT0suczFhXLhMB1361pcqkUC/ehz0+y2bRS5Gxfay
 MpfkcVW+zj+ip7mbLUHpmgZ3Jc0c8Oc+1sftxCtTnrloaJb1sEPFb+U7aBZU/ajOP/2B
 FQrlXoOOpxNmeIwu88M8tKr+GNheLLJaY4M8oTWjiXgwi+PxCMQasdptr0c2OOCy+Lfw
 8S5glbcUN7NQqhkzRfYIbSmnzLbP7/wmPbjNI2rAzDurqTyIAwPO88q80yA4nOHh0E0B
 CAhk3RtJs8UdQUUWY/mmrkCCczSRKlWGEYCCtx6gR6/m/XfDyY7uhLC1foZHQlTOdjfx
 7usA==
X-Gm-Message-State: AGi0PubdwB5eUCig6ZHnrQuAxCMnFR5X0RuWles1zf76W8vUjK2f56hi
 aiXIJ+eYOe6fWR7qnPg2vymxkjb2
X-Google-Smtp-Source: APiQypIuKuAgR+jezkYXHdlW7DQEQcK2psqgGs7oNqrV/Hh5eN6CwFMRt/erKiJdYaNlkyIM7zZxtg==
X-Received: by 2002:ac2:4a76:: with SMTP id q22mr14737001lfp.157.1587975564890; 
 Mon, 27 Apr 2020 01:19:24 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 c20sm9846301ljk.59.2020.04.27.01.19.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 01:19:23 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 18/21] drm/bridge: nxp-ptn3460: add drm_panel_bridge support
Date: Mon, 27 Apr 2020 10:18:47 +0200
Message-Id: <20200427081850.17512-19-sam@ravnborg.org>
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
 drivers/gpu/drm/bridge/nxp-ptn3460.c | 51 ++++++++--------------------
 1 file changed, 14 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c b/drivers/gpu/drm/bridge/nxp-ptn3460.c
index 438e566ce0a4..0bd9f0e451b3 100644
--- a/drivers/gpu/drm/bridge/nxp-ptn3460.c
+++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c
@@ -30,7 +30,7 @@ struct ptn3460_bridge {
 	struct i2c_client *client;
 	struct drm_bridge bridge;
 	struct edid *edid;
-	struct drm_panel *panel;
+	struct drm_bridge *panel_bridge;
 	struct gpio_desc *gpio_pd_n;
 	struct gpio_desc *gpio_rst_n;
 	u32 edid_emulation;
@@ -127,11 +127,6 @@ static void ptn3460_pre_enable(struct drm_bridge *bridge)
 	usleep_range(10, 20);
 	gpiod_set_value(ptn_bridge->gpio_rst_n, 1);
 
-	if (drm_panel_prepare(ptn_bridge->panel)) {
-		DRM_ERROR("failed to prepare panel\n");
-		return;
-	}
-
 	/*
 	 * There's a bug in the PTN chip where it falsely asserts hotplug before
 	 * it is fully functional. We're forced to wait for the maximum start up
@@ -146,16 +141,6 @@ static void ptn3460_pre_enable(struct drm_bridge *bridge)
 	ptn_bridge->enabled = true;
 }
 
-static void ptn3460_enable(struct drm_bridge *bridge)
-{
-	struct ptn3460_bridge *ptn_bridge = bridge_to_ptn3460(bridge);
-
-	if (drm_panel_enable(ptn_bridge->panel)) {
-		DRM_ERROR("failed to enable panel\n");
-		return;
-	}
-}
-
 static void ptn3460_disable(struct drm_bridge *bridge)
 {
 	struct ptn3460_bridge *ptn_bridge = bridge_to_ptn3460(bridge);
@@ -165,25 +150,10 @@ static void ptn3460_disable(struct drm_bridge *bridge)
 
 	ptn_bridge->enabled = false;
 
-	if (drm_panel_disable(ptn_bridge->panel)) {
-		DRM_ERROR("failed to disable panel\n");
-		return;
-	}
-
 	gpiod_set_value(ptn_bridge->gpio_rst_n, 1);
 	gpiod_set_value(ptn_bridge->gpio_pd_n, 0);
 }
 
-static void ptn3460_post_disable(struct drm_bridge *bridge)
-{
-	struct ptn3460_bridge *ptn_bridge = bridge_to_ptn3460(bridge);
-
-	if (drm_panel_unprepare(ptn_bridge->panel)) {
-		DRM_ERROR("failed to unprepare panel\n");
-		return;
-	}
-}
-
 static int ptn3460_get_modes(struct drm_connector *connector)
 {
 	struct ptn3460_bridge *ptn_bridge;
@@ -242,6 +212,11 @@ static int ptn3460_bridge_attach(struct drm_bridge *bridge,
 	struct ptn3460_bridge *ptn_bridge = bridge_to_ptn3460(bridge);
 	int ret;
 
+	ret = drm_bridge_attach(bridge->encoder, ptn_bridge->panel_bridge,
+				bridge, flags);
+	if (ret < 0)
+		return ret;
+
 	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
 		DRM_ERROR("Fix bridge driver to make connector optional!");
 		return -EINVAL;
@@ -265,9 +240,6 @@ static int ptn3460_bridge_attach(struct drm_bridge *bridge,
 	drm_connector_attach_encoder(&ptn_bridge->connector,
 							bridge->encoder);
 
-	if (ptn_bridge->panel)
-		drm_panel_attach(ptn_bridge->panel, &ptn_bridge->connector);
-
 	drm_helper_hpd_irq_event(ptn_bridge->connector.dev);
 
 	return ret;
@@ -275,9 +247,7 @@ static int ptn3460_bridge_attach(struct drm_bridge *bridge,
 
 static const struct drm_bridge_funcs ptn3460_bridge_funcs = {
 	.pre_enable = ptn3460_pre_enable,
-	.enable = ptn3460_enable,
 	.disable = ptn3460_disable,
-	.post_disable = ptn3460_post_disable,
 	.attach = ptn3460_bridge_attach,
 };
 
@@ -286,6 +256,8 @@ static int ptn3460_probe(struct i2c_client *client,
 {
 	struct device *dev = &client->dev;
 	struct ptn3460_bridge *ptn_bridge;
+	struct drm_bridge *pbridge;
+	struct drm_panel *panel;
 	int ret;
 
 	ptn_bridge = devm_kzalloc(dev, sizeof(*ptn_bridge), GFP_KERNEL);
@@ -293,10 +265,15 @@ static int ptn3460_probe(struct i2c_client *client,
 		return -ENOMEM;
 	}
 
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &ptn_bridge->panel, NULL);
+	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &panel, NULL);
 	if (ret)
 		return ret;
 
+	pbridge = devm_drm_panel_bridge_add(dev, panel);
+	if (IS_ERR(pbridge))
+		return PTR_ERR(pbridge);
+
+	ptn_bridge->panel_bridge = pbridge;
 	ptn_bridge->client = client;
 
 	ptn_bridge->gpio_pd_n = devm_gpiod_get(&client->dev, "powerdown",
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
