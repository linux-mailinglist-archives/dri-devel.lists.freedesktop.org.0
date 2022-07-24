Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D74257F765
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 00:43:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 617D310FFBF;
	Sun, 24 Jul 2022 22:43:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C5510FFBF
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Jul 2022 22:43:30 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 1540380741;
 Mon, 25 Jul 2022 00:43:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1658702608;
 bh=9izFcWaoOmQK75cIoGRl9jciTfrxA0QNGtAFsEnXpIE=;
 h=From:To:Cc:Subject:Date:From;
 b=GNsywHTg/rQCY3LS69XKQgsaxrNPduoDOvqUB+FAkSNX4XNMzGFAvYwGH21/+aJQn
 YTYLfKtJICGOOuKrUjLjInI51tPsPCxN2c2JVkQAOwfHENHgtzmXyH8vz/8t5eDR1Y
 Bt3Jv3ebXh/HS4903XpxDvrvyzGVZv2RmB/x22e4H0UciiP6DItfnXuMK1YaGPjwgY
 3FXV46nSyvK23g4dzdmwh5exqSzf/b4n/hOIrkWluFsw+P/PIDIVg84VpQb2AaotH9
 2hddh5g+FmG8zNi3czy0PaVaV8aRLXD9dBuRaFTKzJftIFHiEHPZFIKbXXBnG191Hp
 zAbD+TrF1YVKg==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/bridge: tc358767: Handle bridge past DPI output
Date: Mon, 25 Jul 2022 00:43:17 +0200
Message-Id: <20220724224317.288727-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
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
Cc: Marek Vasut <marex@denx.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Neil Armstrong <narmstrong@baylibre.com>,
 robert.foss@linaro.org, Maxime Ripard <maxime@cerno.tech>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently the driver only handles panel directly connected to the DPI output.
Handle the case where a bridge is connected past DPI output of this bridge.
This could be e.g. DPI to LVDS encoder chip.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/bridge/tc358767.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index f8c1cd711753b..814ab206fe7ef 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1926,22 +1926,23 @@ static int tc_mipi_dsi_host_attach(struct tc_data *tc)
 static int tc_probe_dpi_bridge_endpoint(struct tc_data *tc)
 {
 	struct device *dev = tc->dev;
+	struct drm_bridge *bridge;
 	struct drm_panel *panel;
 	int ret;
 
 	/* port@1 is the DPI input/output port */
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);
+	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, &bridge);
 	if (ret && ret != -ENODEV)
 		return ret;
 
 	if (panel) {
-		struct drm_bridge *panel_bridge;
-
-		panel_bridge = devm_drm_panel_bridge_add(dev, panel);
-		if (IS_ERR(panel_bridge))
-			return PTR_ERR(panel_bridge);
+		bridge = devm_drm_panel_bridge_add(dev, panel);
+		if (IS_ERR(bridge))
+			return PTR_ERR(bridge);
+	}
 
-		tc->panel_bridge = panel_bridge;
+	if (bridge) {
+		tc->panel_bridge = bridge;
 		tc->bridge.type = DRM_MODE_CONNECTOR_DPI;
 		tc->bridge.funcs = &tc_dpi_bridge_funcs;
 
-- 
2.35.1

