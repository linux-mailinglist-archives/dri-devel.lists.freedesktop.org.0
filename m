Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C527A51918C
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 00:41:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D90610EA30;
	Tue,  3 May 2022 22:40:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4C7610E37E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 22:40:54 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id j14so730087plx.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 May 2022 15:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BJTMp60yVPlpACNJP/dPSerG6q4+tCNFLovcxZfzgpw=;
 b=mPiekIzUJZ1ORsFOwevg29S0fjLLyCb6eTpc6bO+PI8+8zvjqyUtZHNV+eui9dr/wu
 7z7br0XhXN9ubuQQnpWD+kemfxzRMjMKbepsIZdLeBz5BSRZcTf9HqMWSsD1AaxuTv30
 ywRf8Bx6v27k7tzIVuZ6SpHE1vyE5QcghEj4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BJTMp60yVPlpACNJP/dPSerG6q4+tCNFLovcxZfzgpw=;
 b=7JtiH3pfYtGdz0m8PkWxQj8U7KEkAj6rB5aWKJg61fCTxtq13xGtoeV3b4mBzxzvWq
 a1jJ2owcHpGNr9n4EvMgaDaj/Xy0uj5LbmRP6P8FpsyAkcfLk8ACDpJaWB7yc6Cda2xZ
 zW5Gy7ojWs9aCUEGrTlkr5laxMLMTSXM5dlCHF5Ogb3uSh6mhEEJ5kY1LoZQT204IMJT
 26RNp4GMsZoqxkZX50gok3615lfIo5r4x9aHtZKjhjzU55wgvavBZnodUDQ7WIY+5A6j
 DrNfZjSx3hHRtVN/fD9oiKOR7o4q5/kH7Cgo80PeJthanGhsDGdf4L/QygfUmRlOCbvd
 6GFw==
X-Gm-Message-State: AOAM532wvXniaRE/UvexsTeJ+zFdz32LivZNTFMf7vGZNj+mtB/+o0IW
 3whSE4ehbvFnNBODugfLtom2cgTi46eVOQNI31c=
X-Google-Smtp-Source: ABdhPJxI1px4iialtat/eNsHwtP473+rj8LypxEcCFT7XlM63zuMiRvvrL3tTsdNa82uXlSxVWhzsA==
X-Received: by 2002:a17:902:9001:b0:156:a567:2683 with SMTP id
 a1-20020a170902900100b00156a5672683mr18769417plp.164.1651617654273; 
 Tue, 03 May 2022 15:40:54 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:93ca:84cb:c452:c0a3])
 by smtp.gmail.com with ESMTPSA id
 az12-20020a170902a58c00b0015e8d4eb27esm6803778plb.200.2022.05.03.15.40.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 15:40:53 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/bridge: parade-ps8640: Handle DP AUX more properly
Date: Tue,  3 May 2022 15:40:29 -0700
Message-Id: <20220503153850.v2.2.Ia6324ebc848cd40b4dbd3ad3289a7ffb5c197779@changeid>
X-Mailer: git-send-email 2.36.0.464.gb9c8b46e94-goog
In-Reply-To: <20220503224029.3195306-1-dianders@chromium.org>
References: <20220503224029.3195306-1-dianders@chromium.org>
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
Cc: Douglas Anderson <dianders@chromium.org>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Philip Chen <philipchen@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While it works, for the most part, to assume that the panel has
finished probing when devm_of_dp_aux_populate_ep_devices() returns,
it's a bit fragile. This is talked about at length in commit
a1e3667a9835 ("drm/bridge: ti-sn65dsi86: Promote the AUX channel to
its own sub-dev").

When reviewing the ps8640 code, I managed to convince myself that it
was OK not to worry about it there and that maybe it wasn't really
_that_ fragile. However, it turns out that it really is. Simply
hardcoding panel_edp_probe() to return -EPROBE_DEFER was enough to put
the boot process into an infinite loop. I believe this manages to trip
the same issues that we used to trip with the main MSM code where
something about our actions trigger Linux to re-probe previously
deferred devices right away and each time we try again we re-trigger
Linux to re-probe.

Let's fix this using the callback introduced in the patch ("drm/dp:
Callbacks to make it easier for drivers to use DP AUX bus properly").
When using the new callback, we have to be a little careful. The
probe_done() callback is no longer (always) called in the context of
our probe routine. That means we can't rely on being able to return
-EPROBE_DEFER from it. We re-jigger the order of things a bit to
account for that.

With this change, the device still boots (though obviously the panel
doesn't come up) if I force panel-edp to always return
-EPROBE_DEFER. If I fake it and make the panel probe exactly once it
also works.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Rewrote atop new method introduced by patch #1.

 drivers/gpu/drm/bridge/parade-ps8640.c | 77 +++++++++++++++++---------
 1 file changed, 52 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index edb939b14c04..68131ca91eac 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -104,6 +104,7 @@ struct ps8640 {
 	struct gpio_desc *gpio_powerdown;
 	struct device_link *link;
 	bool pre_enabled;
+	bool bridge_added;
 };
 
 static const struct regmap_config ps8640_regmap_config[] = {
@@ -537,12 +538,11 @@ static const struct drm_bridge_funcs ps8640_bridge_funcs = {
 	.pre_enable = ps8640_pre_enable,
 };
 
-static int ps8640_bridge_host_attach(struct device *dev, struct ps8640 *ps_bridge)
+static int ps8640_bridge_get_dsi_resources(struct device *dev, struct ps8640 *ps_bridge)
 {
 	struct device_node *in_ep, *dsi_node;
 	struct mipi_dsi_device *dsi;
 	struct mipi_dsi_host *host;
-	int ret;
 	const struct mipi_dsi_device_info info = { .type = "ps8640",
 						   .channel = 0,
 						   .node = NULL,
@@ -577,17 +577,44 @@ static int ps8640_bridge_host_attach(struct device *dev, struct ps8640 *ps_bridg
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->lanes = NUM_MIPI_LANES;
 
-	ret = devm_mipi_dsi_attach(dev, dsi);
+	return 0;
+}
+
+static int ps8640_bridge_link_panel(struct drm_dp_aux *aux)
+{
+	struct ps8640 *ps_bridge = aux_to_ps8640(aux);
+	struct device *dev = aux->dev;
+	struct device_node *np = dev->of_node;
+	int ret;
+
+	/*
+	 * NOTE about returning -EPROBE_DEFER from this function: if we
+	 * return an error (most relevant to -EPROBE_DEFER) it will only
+	 * be passed out to ps8640_probe() if we don't have our panel
+	 * under the "aux-bus". That should be fine because if the panel is
+	 * under "aux-bus" it's guaranteed to have probed by the time this
+	 * function has been called.
+	 */
+
+	/* port@1 is ps8640 output port */
+	ps_bridge->panel_bridge = devm_drm_of_get_bridge(dev, np, 1, 0);
+	if (IS_ERR(ps_bridge->panel_bridge))
+		return PTR_ERR(ps_bridge->panel_bridge);
+
+	drm_bridge_add(&ps_bridge->bridge);
+
+	ret = devm_mipi_dsi_attach(dev, ps_bridge->dsi);
 	if (ret)
-		return ret;
+		drm_bridge_remove(&ps_bridge->bridge);
+	else
+		ps_bridge->bridge_added = true;
 
-	return 0;
+	return ret;
 }
 
 static int ps8640_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
-	struct device_node *np = dev->of_node;
 	struct ps8640 *ps_bridge;
 	int ret;
 	u32 i;
@@ -628,6 +655,14 @@ static int ps8640_probe(struct i2c_client *client)
 	if (!ps8640_of_panel_on_aux_bus(&client->dev))
 		ps_bridge->bridge.ops = DRM_BRIDGE_OP_EDID;
 
+	/*
+	 * Get MIPI DSI resources early. These can return -EPROBE_DEFER so
+	 * we want to get them out of the way sooner.
+	 */
+	ret = ps8640_bridge_get_dsi_resources(&client->dev, ps_bridge);
+	if (ret)
+		return ret;
+
 	ps_bridge->page[PAGE0_DP_CNTL] = client;
 
 	ps_bridge->regmap[PAGE0_DP_CNTL] = devm_regmap_init_i2c(client, ps8640_regmap_config);
@@ -670,31 +705,23 @@ static int ps8640_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
-	devm_of_dp_aux_populate_ep_devices(&ps_bridge->aux);
-
-	/* port@1 is ps8640 output port */
-	ps_bridge->panel_bridge = devm_drm_of_get_bridge(dev, np, 1, 0);
-	if (IS_ERR(ps_bridge->panel_bridge))
-		return PTR_ERR(ps_bridge->panel_bridge);
-
-	drm_bridge_add(&ps_bridge->bridge);
-
-	ret = ps8640_bridge_host_attach(dev, ps_bridge);
-	if (ret)
-		goto err_bridge_remove;
-
-	return 0;
-
-err_bridge_remove:
-	drm_bridge_remove(&ps_bridge->bridge);
-	return ret;
+	/*
+	 * Kick off the probe for our panel if it's on the dp-aux bus.
+	 * If the panel is on the aux bus ps8640_bridge_link_panel() will
+	 * get called when it finishes probing. If the panel is an old-style
+	 * platform device ps8640_bridge_link_panel() will be called directly
+	 * and its return value will be the return value of our function.
+	 */
+	return devm_of_dp_aux_populate_ep_device(&ps_bridge->aux,
+						 ps8640_bridge_link_panel);
 }
 
 static int ps8640_remove(struct i2c_client *client)
 {
 	struct ps8640 *ps_bridge = i2c_get_clientdata(client);
 
-	drm_bridge_remove(&ps_bridge->bridge);
+	if (ps_bridge->bridge_added)
+		drm_bridge_remove(&ps_bridge->bridge);
 
 	return 0;
 }
-- 
2.36.0.464.gb9c8b46e94-goog

