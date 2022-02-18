Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EBF4BAEED
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 02:01:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB83710E949;
	Fri, 18 Feb 2022 01:01:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A4610E213
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 01:01:21 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id EF5CD83B74;
 Fri, 18 Feb 2022 02:01:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1645146080;
 bh=oa0Unz9KaJ6tNMLEwNbDw+0fgoHZrji8KkFMp9mHT9M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gw6Y/S+mTPg+puW9ctYDTQBbCOHSAXWjg1YvQAY367yOfEgmk2eUNsF8ReJmgPvpL
 HbS5Q9roHxMFhqdhLUgVl3Rxjvfph754comDblH1JLmDdvJwZG/AvpX9ZBHaAhxzkC
 nS+MwnR5JGU4gFvmqu/NXZbUUoDN/5x5gRi2FCZMQuxq3JPIQz0yJFwZwrZykvsIv2
 InI/eDdYtROixjDKD1goXE1uAwtUqmANBnzzGmsUvshd6giCJh/mW3kQaTYe6pc3Za
 BRe3l+BXPWhtfAY1nQIdCtnQeEr8N9RokN+I5pU9Vw+bnykbYIiAukAwsMjTM52dTe
 MTh/fQYav4ccA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V2 09/11] drm/bridge: tc358767: Detect bridge mode from
 connected endpoints in DT
Date: Fri, 18 Feb 2022 02:00:52 +0100
Message-Id: <20220218010054.315026-10-marex@denx.de>
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
currently supported. It is possible to find out the mode in which the
bridge should be operated by testing connected endpoints in DT.

Port allocation:
port@0 - DSI input
port@1 - DPI input/output
port@2 - eDP output

Possible connections:
DPI -> port@1 -> port@2 -> eDP :: [port@0 is not connected]
DSI -> port@0 -> port@2 -> eDP :: [port@1 is not connected]
DSI -> port@0 -> port@1 -> DPI :: [port@2 is not connected]

Add function to determine the bridge mode based on connected endpoints.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
V2: - New patch
---
 drivers/gpu/drm/bridge/tc358767.c | 46 ++++++++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 7dae18de76c97..4af0ad5db2148 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1684,6 +1684,50 @@ static int tc_probe_edp_bridge_endpoint(struct tc_data *tc)
 	return ret;
 }
 
+static int tc_probe_bridge_endpoint(struct tc_data *tc)
+{
+	struct device *dev = tc->dev;
+	struct of_endpoint endpoint;
+	struct device_node *node = NULL;
+	const u8 mode_dpi_to_edp = BIT(1) | BIT(2);
+	const u8 mode_dsi_to_edp = BIT(0) | BIT(2);
+	const u8 mode_dsi_to_dpi = BIT(0) | BIT(1);
+	u8 mode = 0;
+
+	/*
+	 * Determine bridge configuration.
+	 *
+	 * Port allocation:
+	 * port@0 - DSI input
+	 * port@1 - DPI input/output
+	 * port@2 - eDP output
+	 *
+	 * Possible connections:
+	 * DPI -> port@1 -> port@2 -> eDP :: [port@0 is not connected]
+	 * DSI -> port@0 -> port@2 -> eDP :: [port@1 is not connected]
+	 * DSI -> port@0 -> port@1 -> DPI :: [port@2 is not connected]
+	 */
+
+	for_each_endpoint_of_node(dev->of_node, node) {
+		of_graph_parse_endpoint(node, &endpoint);
+		if (endpoint.port > 2)
+			return -EINVAL;
+
+		mode |= BIT(endpoint.port);
+	}
+
+	if (mode == mode_dpi_to_edp)
+		return tc_probe_edp_bridge_endpoint(tc);
+	else if (mode == mode_dsi_to_dpi)
+		dev_warn(dev, "The mode DSI-to-DPI is not supported!\n");
+	else if (mode == mode_dsi_to_edp)
+		dev_warn(dev, "The mode DSI-to-(e)DP is not supported!\n");
+	else
+		dev_warn(dev, "Invalid mode (0x%x) is not supported!\n", mode);
+
+	return -EINVAL;
+}
+
 static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
 {
 	struct device *dev = &client->dev;
@@ -1696,7 +1740,7 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
 
 	tc->dev = dev;
 
-	ret = tc_probe_edp_bridge_endpoint(tc);
+	ret = tc_probe_bridge_endpoint(tc);
 	if (ret)
 		return ret;
 
-- 
2.34.1

