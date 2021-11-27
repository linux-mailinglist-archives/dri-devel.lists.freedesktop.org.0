Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 219E745FC5D
	for <lists+dri-devel@lfdr.de>; Sat, 27 Nov 2021 04:24:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B8296EC40;
	Sat, 27 Nov 2021 03:24:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA1EE6EC3E
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Nov 2021 03:24:24 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E955D802C6;
 Sat, 27 Nov 2021 04:24:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1637983463;
 bh=bwv9UIx58bIydHuclpuPYBxH8HZBIcbJFKnlw2rWkD4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eyLZ94tgmX7WrKC5AM9zJVZKagAbE7C+ARSZ+6Wu7CTFQSKP7+lsm4SEGeHNV3gBs
 AjivHlhKHimF2d1T5Xqi1GJEJXtaSye8pJsXMFsYpEGeC462GXOatDKqhaswKe2AHK
 WuQDieFG/ttJ37JMbQEcZEpVcTh8ru50NQPyfrAz4R7+shocrLM8Xjyl0JQL9fl50W
 Z9jn0QsrStuzzEzW/rddjPT7miZ5e0CfeoKKNatGTHM5GyUzYVkGX5D9fXaDY8OnMI
 /cxU9Fmff6rRmmmFy7CeKSoTxWlG6mDWpTnOMwQ0Ns4kS3wkkDm+4D5/iVPLgKYrBA
 DjThmooMOVMxQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] drm/bridge: tc358767: Move bridge endpoint parsing into
 dedicated function
Date: Sat, 27 Nov 2021 04:24:04 +0100
Message-Id: <20211127032405.283435-3-marex@denx.de>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211127032405.283435-1-marex@denx.de>
References: <20211127032405.283435-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
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
Cc: Marek Vasut <marex@denx.de>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The TC358767/TC358867/TC9595 are all capable of operating in multiple
modes, DPI-to-(e)DP, DSI-to-(e)DP, DSI-to-DPI. Only the first mode is
currently supported. In order to support the rest of the modes without
making the tc_probe() overly long, split the bridge endpoint parsing
into dedicated function, where the necessary logic to detect the bridge
mode based on which endpoints are connected, can be implemented.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/bridge/tc358767.c | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index f7fbf6f673e9..0e16ae2461fd 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1612,19 +1612,12 @@ static irqreturn_t tc_irq_handler(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
-static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
+static int tc_probe_bridge_mode(struct tc_data *tc)
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
@@ -1643,6 +1636,25 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
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
+	ret = tc_probe_bridge_mode(tc);
+	if (ret)
+		return ret;
+
 	/* Shut down GPIO is optional */
 	tc->sd_gpio = devm_gpiod_get_optional(dev, "shutdown", GPIOD_OUT_HIGH);
 	if (IS_ERR(tc->sd_gpio))
-- 
2.33.0

