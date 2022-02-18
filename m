Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA434BAEE8
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 02:01:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9432410E932;
	Fri, 18 Feb 2022 01:01:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EBE410E914
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 01:01:20 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id AC6D083B6D;
 Fri, 18 Feb 2022 02:01:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1645146079;
 bh=4F0zqmlV8G2YQGi0XKzd6Pxfwb3oVPyBv6P02xm50bw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=z/r6G+RzL7NVFz6hVUPpvRrdy8xSv8ey3wLl2tUEIFLyOpsyMvmEBW5Y5lImdnvDS
 dMI+FFVRmdMeGyQv6gKC5QLeCBPyzGdI/gbwbZK65vpfWZ14M6Jeb9aFqM63l4ZdnV
 gJligEXCNe2kd6ciI4l6QoTxjtPAlrmA9MofUOJk2I/SCv+AHBDhnKoUlkmsFYpcjC
 RKt96wnce7sh0WlaqYZ2XxDW+c+dLkpbER6vhytkxyoX30gyiHdbjsrZXpbq3GgsJP
 XMbpTavAIbY2sPfNyMEFk2smmRDPXgplVorQNHWSGSWrgvS5AqJDVimxhos1YtTnIW
 N6Ql3D4MiQFIQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V2 06/11] drm/bridge: tc358767: Move (e)DP bridge endpoint
 parsing into dedicated function
Date: Fri, 18 Feb 2022 02:00:49 +0100
Message-Id: <20220218010054.315026-7-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218010054.315026-1-marex@denx.de>
References: <20220218010054.315026-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <narmstrong@baylibre.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The TC358767/TC358867/TC9595 are all capable of operating in multiple
modes, DPI-to-(e)DP, DSI-to-(e)DP, DSI-to-DPI. Only the first mode is
currently supported. In order to support the rest of the modes without
making the tc_probe() overly long, split the bridge endpoint parsing
into dedicated function, where the necessary logic to detect the bridge
mode based on which endpoints are connected, can be implemented.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
V2: - Rename tc_probe_bridge_mode() to tc_probe_edp_bridge_endpoint()
      to better reflect that it parses the (e)DP output endpoint
---
 drivers/gpu/drm/bridge/tc358767.c | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 134c4d8621236..450a472888ba9 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1646,19 +1646,12 @@ static irqreturn_t tc_irq_handler(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
-static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
+static int tc_probe_edp_bridge_endpoint(struct tc_data *tc)
 {
-	struct device *dev = &client->dev;
+	struct device *dev = tc->dev;
 	struct drm_panel *panel;
-	struct tc_data *tc;
 	int ret;
 
-	tc = devm_kzalloc(dev, sizeof(*tc), GFP_KERNEL);
-	if (!tc)
-		return -ENOMEM;
-
-	tc->dev = dev;
-
 	/* port@2 is the output port */
 	ret = drm_of_find_panel_or_bridge(dev->of_node, 2, 0, &panel, NULL);
 	if (ret && ret != -ENODEV)
@@ -1677,6 +1670,25 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		tc->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
 	}
 
+	return ret;
+}
+
+static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
+{
+	struct device *dev = &client->dev;
+	struct tc_data *tc;
+	int ret;
+
+	tc = devm_kzalloc(dev, sizeof(*tc), GFP_KERNEL);
+	if (!tc)
+		return -ENOMEM;
+
+	tc->dev = dev;
+
+	ret = tc_probe_edp_bridge_endpoint(tc);
+	if (ret)
+		return ret;
+
 	/* Shut down GPIO is optional */
 	tc->sd_gpio = devm_gpiod_get_optional(dev, "shutdown", GPIOD_OUT_HIGH);
 	if (IS_ERR(tc->sd_gpio))
-- 
2.34.1

