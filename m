Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7284FA1BB
	for <lists+dri-devel@lfdr.de>; Sat,  9 Apr 2022 04:37:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A979510E22D;
	Sat,  9 Apr 2022 02:37:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E94B610E209
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Apr 2022 02:37:08 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id bo5so9987056pfb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 19:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P+4B9VZqL5jIvczk1CaOVWkNfySt1cT6osyGLgTnwSY=;
 b=k7QxZ7tjs5d7WytyQLNKCOlmID1fy4+B+8Baj1jZuvNY8qkePxZvPREuL644WYZR+U
 wDo3DKUgXhvJmvzbHG92cLUN0jrjwCLMQ2oPrxjjT2YSCclVvUziw8quzLYHRbwg6C8B
 6grIU4ndH8qWUq/EmX7U3IC4Tgu2WR1x0IkfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P+4B9VZqL5jIvczk1CaOVWkNfySt1cT6osyGLgTnwSY=;
 b=eObFXH1SpjmLAp7g2X6c8Yxl6dWShz7pP7n8QzsKzGtsSTQdWJaSwI+H47Ue9TcFEw
 Adq4mAocABznql8zOiDCrV7p+bPhfCbj4UBNiEXaNi7yHCETf686hg5sD9/Si1seU1Vv
 yflOF7l2kSMCUIevIN1RzmSpt852shok7EL/uBTWv2KOyB8OsMwKnfzW4qBPEbL4H/2z
 1XV3NGboIVzw9KvJyeI/XvUpe3Zics+sDwyXM5TqdKVU7igaJdrdhQ1XzQ+BzzuyY7EO
 xM+6rqfE6rzKmBQEjkkFIS2kFNb6nVBf1aJGgKjg64qDeMpBVmGLGuD4gS2WSPwB0VMR
 9v6A==
X-Gm-Message-State: AOAM530bpwEu5DUCwV/lW3J8bdAtOx9XvGhZ1jThcNmF6jHxZURa9XZO
 gwiULebboZ1GSnvPf/rvqxz/G+yfy+Iz5EDd9jVdGQ==
X-Google-Smtp-Source: ABdhPJx2Qn55vuhb0i/A319oTIt5Xlsg2IJgX6xY7+/M+P1CNWVeQFfa1aJkz+iCeezxOeyYVl5MUQ==
X-Received: by 2002:a63:214b:0:b0:39c:c451:be39 with SMTP id
 s11-20020a63214b000000b0039cc451be39mr10102090pgm.391.1649471828391; 
 Fri, 08 Apr 2022 19:37:08 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:17db:64e:48d4:a4e])
 by smtp.gmail.com with ESMTPSA id
 188-20020a6215c5000000b0050597294893sm759999pfv.124.2022.04.08.19.37.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 19:37:08 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 2/6] drm/bridge: parade-ps8640: Break probe in two to
 handle DP AUX better
Date: Fri,  8 Apr 2022 19:36:24 -0700
Message-Id: <20220408193536.RFC.2.Ia6324ebc848cd40b4dbd3ad3289a7ffb5c197779@changeid>
X-Mailer: git-send-email 2.35.1.1178.g4f1659d476-goog
In-Reply-To: <20220409023628.2104952-1-dianders@chromium.org>
References: <20220409023628.2104952-1-dianders@chromium.org>
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
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
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

It's really not that crazy to just break the probe up. Let's use the
new helpers introduced in the patch ("drm/dp: Helpers to make it
easier for drivers to use DP AUX bus properly") to break the driver
into two.

With this change, the device still boots (though obviously the panel
doesn't come up) if I force panel-edp to always return -EPROBE_DEFER.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/bridge/parade-ps8640.c | 66 +++++++++++++++-----------
 1 file changed, 39 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index 9766cbbd62ad..96e883985608 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -93,6 +93,7 @@ enum ps8640_vdo_control {
 };
 
 struct ps8640 {
+	struct dp_aux_ep_client ep_client;
 	struct drm_bridge bridge;
 	struct drm_bridge *panel_bridge;
 	struct drm_dp_aux aux;
@@ -584,10 +585,36 @@ static int ps8640_bridge_host_attach(struct device *dev, struct ps8640 *ps_bridg
 	return 0;
 }
 
+static int ps8640_bridge_probe(struct device *clientdev, struct dp_aux_ep_client *client)
+{
+	struct ps8640 *ps_bridge = container_of(client, struct ps8640, ep_client);
+	struct device_node *np = clientdev->of_node;
+	int ret;
+
+	/* port@1 is ps8640 output port */
+	ps_bridge->panel_bridge = devm_drm_of_get_bridge(clientdev, np, 1, 0);
+	if (IS_ERR(ps_bridge->panel_bridge))
+		return PTR_ERR(ps_bridge->panel_bridge);
+
+	drm_bridge_add(&ps_bridge->bridge);
+
+	ret = ps8640_bridge_host_attach(clientdev, ps_bridge);
+	if (ret)
+		drm_bridge_remove(&ps_bridge->bridge);
+
+	return ret;
+}
+
+static void ps8640_bridge_remove(struct device *clientdev, struct dp_aux_ep_client *client)
+{
+	struct ps8640 *ps_bridge = container_of(client, struct ps8640, ep_client);
+
+	drm_bridge_remove(&ps_bridge->bridge);
+}
+
 static int ps8640_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
-	struct device_node *np = dev->of_node;
 	struct ps8640 *ps_bridge;
 	int ret;
 	u32 i;
@@ -672,31 +699,17 @@ static int ps8640_probe(struct i2c_client *client)
 
 	devm_of_dp_aux_populate_ep_devices(&ps_bridge->aux);
 
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
-}
-
-static int ps8640_remove(struct i2c_client *client)
-{
-	struct ps8640 *ps_bridge = i2c_get_clientdata(client);
-
-	drm_bridge_remove(&ps_bridge->bridge);
-
-	return 0;
+	/*
+	 * Create a sub-device and kick off a probe to it. This effectively
+	 * breaks our probe in two and lets the first half complete even if
+	 * the second half might return -EPROBE_DEFER. If we didn't do this
+	 * then if a panel isn't immediately ready we'd delete it right away
+	 * and never give it a chance to finish.
+	 */
+	ps_bridge->ep_client.probe = ps8640_bridge_probe;
+	ps_bridge->ep_client.remove = ps8640_bridge_remove;
+	ps_bridge->ep_client.aux = &ps_bridge->aux;
+	return devm_dp_aux_register_ep_client(&ps_bridge->ep_client);
 }
 
 static const struct of_device_id ps8640_match[] = {
@@ -707,7 +720,6 @@ MODULE_DEVICE_TABLE(of, ps8640_match);
 
 static struct i2c_driver ps8640_driver = {
 	.probe_new = ps8640_probe,
-	.remove = ps8640_remove,
 	.driver = {
 		.name = "ps8640",
 		.of_match_table = ps8640_match,
-- 
2.35.1.1178.g4f1659d476-goog

