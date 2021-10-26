Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB1943BCB9
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 23:57:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E1989E52;
	Tue, 26 Oct 2021 21:57:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA4CF89D6C
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 21:56:55 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id z11so522397plg.8
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 14:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9F+EWbh01K9eqvh7QO6VrhctGso+L9ps7sX+i8thX2Y=;
 b=Zdc4ztOZkl8MtmXXDulYtc8GEdI8IyMPqz3rieEXFQnL2Lqi1V7RuMN7H7cBLLh/WM
 /MIdKBeNWbepPud2CCiph86WRpuM3I7XKcdT+TO34XWvl8qHH7qYkb7bMs3S+fds2i43
 aGu4iuDM+PHXHHNwIcrFMr7ZDDW4/ailCSjR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9F+EWbh01K9eqvh7QO6VrhctGso+L9ps7sX+i8thX2Y=;
 b=vU33h0ayGrwTnT4KwhW2Mt1giR4cDWSw8y0tQ1zESe/QGcWgNK/nRMZ34Fyo49mYbw
 RpitCB8UjcE83oVf19CmODkeIP3ujyThkKAC3MKs4XHZMtSrngFwU+mshDq6rG0hQyo3
 0uraQ1h2iVLllA4qhD5SpFwXPJEc/4SRh6HRy1UAhiMlBEIeLjdVwDAJ0V9BHDJLdHbs
 KGMGLNX9xNARbqZIH3bNQ9K60uCbJSjRDBHopOuaflmawh2beUxXhYqblTUqCWrcimtf
 cat0nwA2zhSB7lEQotb4C4KoGhyOPd5Pnisanqp7V57s3OSc9Od2K31Uh+AvbPg92nJW
 OYzA==
X-Gm-Message-State: AOAM533Jdy7UG0+Zv1xQlDifVUZVDnw04Ktj4rcunlHaRo+M04I4fq9L
 TYkYIPjAg5nGgf3Vws7n4/yUTqTx490EJQ==
X-Google-Smtp-Source: ABdhPJzf1EEFbnTBWOPKTGgp7zivHRUhUNIS7IywoMnYJmw7DzXLac4ndmz27S1IJS0Os/VTjullCA==
X-Received: by 2002:a17:90b:198b:: with SMTP id
 mv11mr1503430pjb.235.1635285415549; 
 Tue, 26 Oct 2021 14:56:55 -0700 (PDT)
Received: from philipchen.mtv.corp.google.com
 ([2620:15c:202:201:dad:6684:6674:b268])
 by smtp.gmail.com with ESMTPSA id t8sm21225953pgk.66.2021.10.26.14.56.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 14:56:55 -0700 (PDT)
From: Philip Chen <philipchen@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: swboyd@chromium.org, dianders@chromium.org,
 Philip Chen <philipchen@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org
Subject: [PATCH v4 2/2] drm/bridge: parade-ps8640: Populate devices on aux-bus
Date: Tue, 26 Oct 2021 14:56:49 -0700
Message-Id: <20211026145622.v4.2.I09899dea340f11feab97d719cb4b62bef3179e4b@changeid>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
In-Reply-To: <20211026145622.v4.1.I9d81c3b44f350707b5373d00524af77c4aae862b@changeid>
References: <20211026145622.v4.1.I9d81c3b44f350707b5373d00524af77c4aae862b@changeid>
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

(no changes since v3)

Changes in v3:
- Fix when to call of_node_put() in ps8640_of_panel_on_aux_bus()

Changes in v2:
- Add of_node_put() calls in ps8640_of_panel_on_aux_bus()
- Select DRM_DP_AUX_BUS for PS8640 driver in Kconfig
- Replace _put_sync() with _put_sync_suspend() in ps8640_post_disable()

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
index cf1f630a3958..e737f1a27f30 100644
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
@@ -556,17 +574,6 @@ static int ps8640_probe(struct i2c_client *client)
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
@@ -589,9 +596,16 @@ static int ps8640_probe(struct i2c_client *client)
 
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
@@ -630,6 +644,19 @@ static int ps8640_probe(struct i2c_client *client)
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

