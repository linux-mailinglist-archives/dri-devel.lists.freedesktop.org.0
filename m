Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E947436C69
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 23:06:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF056E4B1;
	Thu, 21 Oct 2021 21:06:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F65B6E4B3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 21:06:13 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id m14so1745829pfc.9
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 14:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TLTeEW4ubje/3SefLdQBbUREZFjtzhe+o6xHhQLDFD0=;
 b=hxlVD/meKlsC5GTwQbS0b4QmODkcWp6HIo48ZXewZ8NVKPH6afQFJ4SUe6/40/1spy
 2H6KAJYDMAFPKdgtv/pzSBLV5k1tIzd+W3XylwNXyDTetF8E+8cuG2KrBo2hRpm7V3H6
 l3deu31t2gh/+Ph6XJwv6hWE76ncsq+lqoRf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TLTeEW4ubje/3SefLdQBbUREZFjtzhe+o6xHhQLDFD0=;
 b=6ozxNzuYbwnoD1KMRif0mP539OK6HE9hxiAQlkHSVuGA6OLk4ONUOkARZlH963CIMH
 Glt/m7ZtaH81qBKErIOtkRta2zW7Jy9t9lhU7fks/uXC7pntT2CSlSyZYL7lKuPQYYvd
 HjE1qISkMxEJS3NiSa3yIkNElSrR/L2osmfkyR63Zw3Grppo/JGU6kammFPjGd/DQLbW
 9Z32XyncfqDt3cGnQi5l4ZaPYXpd6MFwF2Ta/NSVc9RG7hOE8YFXCBWntQ2LX0uYHX57
 pcQCtkQ62hsne0JSz0Lb8cpt+mciAmvVXD7qScL9NLlvQUNzdZU7Cst9B7/2DywQfxKp
 LD1g==
X-Gm-Message-State: AOAM531IHnsmq5uWvG2j3xEufGU1/O5iHw1UvdXQc/oHEc+IIasYoNwP
 M7z7tDoL4bjIbbnV+nTHI3Ol298sYOMAAg==
X-Google-Smtp-Source: ABdhPJz70YcY7fyHfN6NjmPc5Eg4JwuU/KZJee2P8wW6qJQNkGNKhY/hTmofemTL0Cvmh0SV/yhLkQ==
X-Received: by 2002:a63:3c4c:: with SMTP id i12mr6094063pgn.447.1634850373153; 
 Thu, 21 Oct 2021 14:06:13 -0700 (PDT)
Received: from philipchen.mtv.corp.google.com
 ([2620:15c:202:201:8cbf:fe7f:37b3:4b3f])
 by smtp.gmail.com with ESMTPSA id d15sm8326264pfu.12.2021.10.21.14.06.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 14:06:12 -0700 (PDT)
From: Philip Chen <philipchen@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: dianders@chromium.org, swboyd@chromium.org,
 Philip Chen <philipchen@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/bridge: parade-ps8640: Populate devices on aux-bus
Date: Thu, 21 Oct 2021 14:06:00 -0700
Message-Id: <20211021140552.v2.2.I3ed2a84c58d9e81965f497d587f735eea56c1684@changeid>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
In-Reply-To: <20211021140552.v2.1.I9d81c3b44f350707b5373d00524af77c4aae862b@changeid>
References: <20211021140552.v2.1.I9d81c3b44f350707b5373d00524af77c4aae862b@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Conventionally, panel is listed under the root of the device tree.
When userland asks for display mode, ps8640 bridge is responsible
for returning EDID when ps8640_bridge_get_edid() is called.

Now enable a new option of listing panel under "aux-bus" of ps8640
bridge node in the device tree. In this case, panel driver can retrieve
EDID by triggering AUX transactions, without ps8640_bridge_get_edid()
calls at all.

To prevent the "old" and "new" options from interfering with each
other's logic flow, disable DRM_BRIDGE_OP_EDID when the new option
is taken.

Signed-off-by: Philip Chen <philipchen@chromium.org>
---

Changes in v2:
- Add of_node_put() calls in ps8640_of_panel_on_aux_bus()
- Select DRM_DP_AUX_BUS for PS8640 driver in Kconfig
- Replace _put_sync() with _put_sync_suspend() in ps8640_post_disable()

 drivers/gpu/drm/bridge/Kconfig         |  1 +
 drivers/gpu/drm/bridge/parade-ps8640.c | 53 +++++++++++++++++++-------
 2 files changed, 41 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 431b6e12a81f..61db5a66b493 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -182,6 +182,7 @@ config DRM_PARADE_PS8622
 config DRM_PARADE_PS8640
 	tristate "Parade PS8640 MIPI DSI to eDP Converter"
 	depends on OF
+	select DRM_DP_AUX_BUS
 	select DRM_KMS_HELPER
 	select DRM_MIPI_DSI
 	select DRM_PANEL
diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index 220ca3b03d24..f99a2e0808b7 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -14,6 +14,7 @@
 #include <linux/regulator/consumer.h>
 
 #include <drm/drm_bridge.h>
+#include <drm/drm_dp_aux_bus.h>
 #include <drm/drm_dp_helper.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
@@ -149,6 +150,23 @@ static inline struct ps8640 *aux_to_ps8640(struct drm_dp_aux *aux)
 	return container_of(aux, struct ps8640, aux);
 }
 
+static bool ps8640_of_panel_on_aux_bus(struct device *dev)
+{
+	struct device_node *bus, *panel;
+
+	bus = of_get_child_by_name(dev->of_node, "aux-bus");
+	if (!bus)
+		return false;
+	of_node_put(bus);
+
+	panel = of_get_child_by_name(bus, "panel");
+	if (!panel)
+		return false;
+	of_node_put(panel);
+
+	return true;
+}
+
 static void ps8640_ensure_hpd(struct ps8640 *ps_bridge)
 {
 	struct regmap *map = ps_bridge->regmap[PAGE2_TOP_CNTL];
@@ -411,7 +429,7 @@ static void ps8640_post_disable(struct drm_bridge *bridge)
 	ps_bridge->pre_enabled = false;
 
 	ps8640_bridge_vdo_control(ps_bridge, DISABLE);
-	pm_runtime_put_sync(&ps_bridge->page[PAGE0_DP_CNTL]->dev);
+	pm_runtime_put_sync_suspend(&ps_bridge->page[PAGE0_DP_CNTL]->dev);
 }
 
 static int ps8640_bridge_attach(struct drm_bridge *bridge,
@@ -549,17 +567,6 @@ static int ps8640_probe(struct i2c_client *client)
 	if (!ps_bridge)
 		return -ENOMEM;
 
-	/* port@1 is ps8640 output port */
-	ret = drm_of_find_panel_or_bridge(np, 1, 0, &panel, NULL);
-	if (ret < 0)
-		return ret;
-	if (!panel)
-		return -ENODEV;
-
-	ps_bridge->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
-	if (IS_ERR(ps_bridge->panel_bridge))
-		return PTR_ERR(ps_bridge->panel_bridge);
-
 	ps_bridge->supplies[0].supply = "vdd33";
 	ps_bridge->supplies[1].supply = "vdd12";
 	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ps_bridge->supplies),
@@ -582,9 +589,16 @@ static int ps8640_probe(struct i2c_client *client)
 
 	ps_bridge->bridge.funcs = &ps8640_bridge_funcs;
 	ps_bridge->bridge.of_node = dev->of_node;
-	ps_bridge->bridge.ops = DRM_BRIDGE_OP_EDID;
 	ps_bridge->bridge.type = DRM_MODE_CONNECTOR_eDP;
 
+	/*
+	 * In the device tree, if panel is listed under aux-bus of the bridge
+	 * node, panel driver should be able to retrieve EDID by itself using
+	 * aux-bus. So let's not set DRM_BRIDGE_OP_EDID here.
+	 */
+	if (!ps8640_of_panel_on_aux_bus(&client->dev))
+		ps_bridge->bridge.ops = DRM_BRIDGE_OP_EDID;
+
 	ps_bridge->page[PAGE0_DP_CNTL] = client;
 
 	ps_bridge->regmap[PAGE0_DP_CNTL] = devm_regmap_init_i2c(client, ps8640_regmap_config);
@@ -618,6 +632,19 @@ static int ps8640_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
+	devm_of_dp_aux_populate_ep_devices(&ps_bridge->aux);
+
+	/* port@1 is ps8640 output port */
+	ret = drm_of_find_panel_or_bridge(np, 1, 0, &panel, NULL);
+	if (ret < 0)
+		return ret;
+	if (!panel)
+		return -ENODEV;
+
+	ps_bridge->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
+	if (IS_ERR(ps_bridge->panel_bridge))
+		return PTR_ERR(ps_bridge->panel_bridge);
+
 	drm_bridge_add(&ps_bridge->bridge);
 
 	return 0;
-- 
2.33.0.1079.g6e70778dc9-goog

