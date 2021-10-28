Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C4843E79B
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 19:58:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 494B56E0ED;
	Thu, 28 Oct 2021 17:58:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0769C6E0ED
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 17:58:19 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id b1so3193519pfm.6
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 10:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qjf/e3Fv2k4EEbSdFoguOmcAgMO1giT3H2d5/yVOr6A=;
 b=AN7AEtaN30Nyi+MwuHDw8qU04Itt2BNubkw+p1o82OfS3yqd2p8DCQOrwMpmV3XIhQ
 A1LoKCsbJTQwMM/cOZh6ZAH+xnmG37RzF304q7MOBL9fuPllxc9lQz3Se2w9SP/PN2rY
 YN0pB6v9vzYCchAAdTjpE9BNVd7xVBomRrmxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qjf/e3Fv2k4EEbSdFoguOmcAgMO1giT3H2d5/yVOr6A=;
 b=A3dT6cglabliBN1SbRm8a9wA0Pn1CaIEhddi/r/ZKf4dRK2PVRtNUTXgShc759kSYB
 LgA701ywPf21rmIqaTW8l9/rWR7E/UhQ5LE5zN9YKqEn1t84KmiIO/SRX9ubOYqUO003
 XTIlzZoUGwVB6fKQlKbApAQDJXuZ5dL+U5LETwTlaCM7rCzscItcgCCNjvigdzSUCcf7
 1aN0+BU1GpBrMXO2AAjLJ1boAq6tdyC5n0HyAWmbs1W3qJb2K7mCkCcOLpl9qWLJSF4B
 GHk8NbPt30WHz+wK9bCOWgPZNgSdV3j0wahqd478V4p4Pre3xAglBRjWSftvLkhyumGm
 JlHA==
X-Gm-Message-State: AOAM532dKe2B+PvCFWQnknsqFc7zvO2drZbk5EKNqZvtqoCI3KG2awdt
 Qdsg+AIF132YLG0szi7Y7hq7gQ==
X-Google-Smtp-Source: ABdhPJxiH3zw0F7UVrvnKWbBrhHTzzpCQk9MCiuLu+/2TKmMv/uXKnoAUx8eUerlfE/OHvMXHF1QGg==
X-Received: by 2002:a62:7dc7:0:b0:47e:50ae:b9eb with SMTP id
 y190-20020a627dc7000000b0047e50aeb9ebmr3900295pfc.77.1635443898562; 
 Thu, 28 Oct 2021 10:58:18 -0700 (PDT)
Received: from philipchen.mtv.corp.google.com
 ([2620:15c:202:201:9954:4c46:483e:f139])
 by smtp.gmail.com with ESMTPSA id d14sm4312109pfu.124.2021.10.28.10.58.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 10:58:18 -0700 (PDT)
From: Philip Chen <philipchen@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: swboyd@chromium.org, dianders@chromium.org,
 Philip Chen <philipchen@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org
Subject: [PATCH v5 2/2] drm/bridge: parade-ps8640: Populate devices on aux-bus
Date: Thu, 28 Oct 2021 10:58:11 -0700
Message-Id: <20211028105754.v5.2.I09899dea340f11feab97d719cb4b62bef3179e4b@changeid>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
In-Reply-To: <20211028105754.v5.1.I828f5db745535fb7e36e8ffdd62d546f6d08b6d1@changeid>
References: <20211028105754.v5.1.I828f5db745535fb7e36e8ffdd62d546f6d08b6d1@changeid>
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
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
In v4, I factored out the "ps8640_ensure_hpd" change and added it to patch 1/2
in this patch series. But I forgot to mention it in v4 change log. Edit v4
change log retroactively.

In v3, I factored out the "put_sync_suspend" change and added it to patch 1/2
in this patch series. But I forgot to mention it in v3 change log. Edit v3
change log retroactively.

(no changes since v4)

Changes in v4:
- Move the change of "ps8640_ensure_hpd" to patch 1/2 in this patch series.

Changes in v3:
- Fix when to call of_node_put() in ps8640_of_panel_on_aux_bus()
- Move the change of "put_sync_suspend" to patch 1/2 in this patch series.

Changes in v2:
- Add of_node_put() calls in ps8640_of_panel_on_aux_bus()
- Select DRM_DP_AUX_BUS for PS8640 driver in Kconfig

 drivers/gpu/drm/bridge/Kconfig         |  1 +
 drivers/gpu/drm/bridge/parade-ps8640.c | 51 ++++++++++++++++++++------
 2 files changed, 40 insertions(+), 12 deletions(-)

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
index 63a817d92c1d..448988d9eb41 100644
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
+
+	panel = of_get_child_by_name(bus, "panel");
+	of_node_put(bus);
+	if (!panel)
+		return false;
+	of_node_put(panel);
+
+	return true;
+}
+
 static int ps8640_ensure_hpd(struct ps8640 *ps_bridge)
 {
 	struct regmap *map = ps_bridge->regmap[PAGE2_TOP_CNTL];
@@ -555,17 +573,6 @@ static int ps8640_probe(struct i2c_client *client)
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
@@ -588,9 +595,16 @@ static int ps8640_probe(struct i2c_client *client)
 
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
@@ -633,6 +647,19 @@ static int ps8640_probe(struct i2c_client *client)
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
 
 	ret = ps8640_bridge_host_attach(dev, ps_bridge);
-- 
2.33.0.1079.g6e70778dc9-goog

