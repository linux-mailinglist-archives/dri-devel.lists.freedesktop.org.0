Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A5C4EA28B
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 23:44:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EC4910EDB9;
	Mon, 28 Mar 2022 21:44:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA8C10E12F
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 21:43:57 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 954A983F77;
 Mon, 28 Mar 2022 23:43:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1648503836;
 bh=1W94ZbFAApjlD15602n623KT6J7S5nkeEhfKgoQwP6E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BdTTxt8atbWy6IGjg8S/E//rIbdhkrXzlq+prGMKiNDwKJI88xrxmSk+9mWtPnWJR
 O70hIMkFBmRZ0byVW4LV4c5U3dm3m3pwoFFvWTzHKURIny1rGmoYTabC89BK4XTVPr
 +tTBntPksDWEnlPNR0/nFHYV8aU4gbh+SElQemdB+Tm13oAYToKw2in5ClEp29uDTk
 DOljbdD5vD4STZtjT50MwIfvkWGgqLdb09KegD960ALU+UNoPVVyUgCgkzzEa6xOO5
 FrCvZw5bUMuFU/Qz8DGHUcBf0s5/+JjZk9OWVLuQM+7DYCdfIkJfSFvn8Smse0q3g+
 UpifYv90vKEbg==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 09/11] drm/bridge: tc358767: Detect bridge mode from
 connected endpoints in DT
Date: Mon, 28 Mar 2022 23:43:22 +0200
Message-Id: <20220328214324.252472-10-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220328214324.252472-1-marex@denx.de>
References: <20220328214324.252472-1-marex@denx.de>
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

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
Tested-by: Lucas Stach <l.stach@pengutronix.de> # In both DPI to eDP and DSI to DPI mode.
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
V2: - New patch
V3: - Add RB from Lucas
V4: - Add TB from Lucas
---
 drivers/gpu/drm/bridge/tc358767.c | 46 ++++++++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 8c468f77618d2..dd324cf16e4d0 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1621,6 +1621,50 @@ static int tc_probe_edp_bridge_endpoint(struct tc_data *tc)
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
@@ -1633,7 +1677,7 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
 
 	tc->dev = dev;
 
-	ret = tc_probe_edp_bridge_endpoint(tc);
+	ret = tc_probe_bridge_endpoint(tc);
 	if (ret)
 		return ret;
 
-- 
2.35.1

