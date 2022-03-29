Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C7D4EA9B4
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 10:51:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7318210E7F5;
	Tue, 29 Mar 2022 08:50:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C1610E7EF
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 08:50:40 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id B4E98839C7;
 Tue, 29 Mar 2022 10:50:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1648543839;
 bh=QIaG6gHyZptYsn2U303RijW8hMRKU7mKhveiH1Hg1+Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=J5xb+K2i/cCNcDlNYMPZ8ttcTEBxiNJwYvGzyKFpDh70njzZ01ebF2coyvkqfXDJF
 5H6lAvScJX9cFIHcNRgvZnZtKEZjlHGMjewo99wDqPCkkzik9YoqvMCJoNXcxSvHTP
 eXEiVJmCEIdz4Pie+jXCyy8Yf3DAkioO9Cj6nAVzVbckw0YV8fJLa44Z+xNZY1FT3y
 pH/3doAQS1Buxxux225lbBAWX5n/higoF/+R+4SXJVE5Br+j6hz/H5pIMUVCL7vq0y
 UXbY03xkqSVz0wjNv0qOfdR9zOg6NrOpS0yUMyBiOKI3YqW/IzbYWn70toovqts/2s
 A2SXDayup+YAA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 06/11] drm/bridge: tc358767: Move (e)DP bridge endpoint
 parsing into dedicated function
Date: Tue, 29 Mar 2022 10:50:10 +0200
Message-Id: <20220329085015.39159-7-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329085015.39159-1-marex@denx.de>
References: <20220329085015.39159-1-marex@denx.de>
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

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
Tested-by: Lucas Stach <l.stach@pengutronix.de> # In both DPI to eDP and DSI to DPI mode.
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
V2: - Rename tc_probe_bridge_mode() to tc_probe_edp_bridge_endpoint()
      to better reflect that it parses the (e)DP output endpoint
V3: - Add RB from Lucas
V4: - Add TB from Lucas
V5: - No change
---
 drivers/gpu/drm/bridge/tc358767.c | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index e95153d9c1499..0f24156543bae 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1583,19 +1583,12 @@ static irqreturn_t tc_irq_handler(int irq, void *arg)
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
@@ -1614,6 +1607,25 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
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
2.35.1

