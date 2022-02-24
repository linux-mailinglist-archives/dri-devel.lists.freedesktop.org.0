Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 378624C3663
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 20:59:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3251210E3F2;
	Thu, 24 Feb 2022 19:59:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F269610E299
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 19:58:54 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 6A08883CDD;
 Thu, 24 Feb 2022 20:58:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1645732733;
 bh=wwDOXRiQe6XCuUJrB4bkNRUz5egJu/PTAjlWr2WwO+c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=e8J2++WTpHOcCEoYErnQX5p9KVXn5kHk/vysK47f02TfUDm7o86GATlOO9DdUd9vL
 p7DPkjGQEOVnAurOAg+Vr3yVbJLGgmDYisklhpO1lFT0ymGifBSkHUBPtavReb0IMW
 hea9Wq993A/zU/F33zrhWhZbAogbEOc9Ib19/lSfJL8UtLBwkDP/uztT94weyhAndp
 IFd16bk8UfY7R28NPkPP3Yu/kWhHD4r/CLVR9kNOc4fs1qdWmaEi/WhztLIfiUP6Dk
 EZeAYan2pCjPsFyUdRUh1Sc2nS80g/M/vnviVbAurUPwvobdT8+EGWwQE+ZnfvD4IR
 B1KD5pTDJRYtg==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V3 07/12] drm/bridge: tc358767: Move (e)DP bridge endpoint
 parsing into dedicated function
Date: Thu, 24 Feb 2022 20:58:12 +0100
Message-Id: <20220224195817.68504-8-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220224195817.68504-1-marex@denx.de>
References: <20220224195817.68504-1-marex@denx.de>
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
---
 drivers/gpu/drm/bridge/tc358767.c | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index ea0d4467878f0..e9cec6f8e0e9d 100644
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

