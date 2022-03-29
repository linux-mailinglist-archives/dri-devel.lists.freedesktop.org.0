Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC2E4EA9B3
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 10:51:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4637E10E7F3;
	Tue, 29 Mar 2022 08:50:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF3E10E7EE
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 08:50:41 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 240D583FBC;
 Tue, 29 Mar 2022 10:50:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1648543840;
 bh=Fm60AjpTcY9icu5ZbSFyUjTew8+IiQUC+nOYJVxB1Hg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GFXGUrIQ9V6NbEiGEWskXY/ZeZ7Pp6W33UM42HvWF2dhpWAFbY7V0KRk3FVdxImAV
 h90PEqlomGldT0ufm06rfyA32ppaMWfY+hEF3aqNs7SyJKhJTIdC9qW5DQDmcf9Y2d
 5F4lsUjI077mTqAY/Kk6rbDAv44NyCD6kElQKnV5oRn7C68kIwE6DI91P+oBKjy58z
 YV9XHSv1Ky8pnXM5Qgq0klEFO6o0KB0IeXZRcrdPRoWmZ/UXWGwfzX2UIRivlNQixp
 GUb1NLgHhnOehrqCRmDwpQDFh8Lt7XQu2FD7vfOIDSTW9NUZFX81PABB2D1J9yThqH
 W4DlS4GPeuWCA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 09/11] drm/bridge: tc358767: Detect bridge mode from
 connected endpoints in DT
Date: Tue, 29 Mar 2022 10:50:13 +0200
Message-Id: <20220329085015.39159-10-marex@denx.de>
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
V5: - No change
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

