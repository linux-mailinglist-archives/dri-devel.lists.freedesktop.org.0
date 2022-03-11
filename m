Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6454D69D0
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 22:03:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CED110E665;
	Fri, 11 Mar 2022 21:03:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E971710E665
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 21:03:02 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id C63B282F70;
 Fri, 11 Mar 2022 22:03:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1647032581;
 bh=WJwwKHVlb3dwYrcLXRCetMqYb5sutm3HBB+2/Rk0wlc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=A+bzJmyT0Tf1gw1N9zLsq3B+3kgkavCltq+kVprUAVR7XyFGVfUe4SiJxp11129X/
 4o/DhaKuNFZkVVFx0lnbNlAbv2x6kFzsXjLCFAGnpLFfFEE/Rw2uQRUGZDddk41S9w
 flAX719P6u7HbyfHGjUe5Vp8LF0Mak5RVuccS+4TFz/DA/NDkqSJDuhnVIdP2qGpYD
 8JD40I40tvrMZHJgRqxWzAWBuCcLnClwWQd/ua+3gN3bud0DSUDQD7WXH2QxX51iwa
 dyBrk0GNc3evNhblPAOyvqAeP8rMUTLx0QKC7Y3V1AS/RP4MdfQQGqKz4fGiIzXjsB
 8a+hPY5WBCH7w==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 05/13] drm: bridge: icn6211: Add DSI lane count DT property
 parsing
Date: Fri, 11 Mar 2022 22:02:19 +0100
Message-Id: <20220311210227.124331-6-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220311210227.124331-1-marex@denx.de>
References: <20220311210227.124331-1-marex@denx.de>
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
Cc: Marek Vasut <marex@denx.de>, Robert Foss <robert.foss@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver currently hard-codes DSI lane count to two, however the chip
is capable of operating in 1..4 DSI lanes mode. Parse 'data-lanes' DT
property and program the result into DSI_CTRL register.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
To: dri-devel@lists.freedesktop.org
---
V2: Rebase on next-20220214
V3: Default to 4 data lanes unless specified otherwise
V4: Move host_node caching to i2c addition patch
---
 drivers/gpu/drm/bridge/chipone-icn6211.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index 30db8d1783cef..fc99dae185dbc 100644
--- a/drivers/gpu/drm/bridge/chipone-icn6211.c
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -140,6 +140,7 @@ struct chipone {
 	struct regulator *vdd1;
 	struct regulator *vdd2;
 	struct regulator *vdd3;
+	int dsi_lanes;
 };
 
 static inline struct chipone *bridge_to_chipone(struct drm_bridge *bridge)
@@ -212,6 +213,11 @@ static void chipone_atomic_enable(struct drm_bridge *bridge,
 	/* dsi specific sequence */
 	ICN6211_DSI(icn, SYNC_EVENT_DLY, 0x80);
 	ICN6211_DSI(icn, HFP_MIN, hfp & 0xff);
+
+	/* DSI data lane count */
+	ICN6211_DSI(icn, DSI_CTRL,
+		    DSI_CTRL_UNKNOWN | DSI_CTRL_DSI_LANES(icn->dsi_lanes - 1));
+
 	ICN6211_DSI(icn, MIPI_PD_CK_LANE, 0xa0);
 	ICN6211_DSI(icn, PLL_CTRL(12), 0xff);
 
@@ -314,6 +320,8 @@ static const struct drm_bridge_funcs chipone_bridge_funcs = {
 static int chipone_parse_dt(struct chipone *icn)
 {
 	struct device *dev = icn->dev;
+	struct device_node *endpoint;
+	int dsi_lanes;
 	int ret;
 
 	icn->vdd1 = devm_regulator_get_optional(dev, "vdd1");
@@ -349,6 +357,19 @@ static int chipone_parse_dt(struct chipone *icn)
 		return PTR_ERR(icn->enable_gpio);
 	}
 
+	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
+	dsi_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
+	of_node_put(endpoint);
+
+	/*
+	 * If the 'data-lanes' property does not exist in DT or is invalid,
+	 * default to previously hard-coded behavior, which was 4 data lanes.
+	 */
+	if (dsi_lanes >= 1 && dsi_lanes <= 4)
+		icn->dsi_lanes = dsi_lanes;
+	else
+		icn->dsi_lanes = 4;
+
 	icn->panel_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
 	if (IS_ERR(icn->panel_bridge))
 		return PTR_ERR(icn->panel_bridge);
@@ -379,7 +400,7 @@ static int chipone_probe(struct mipi_dsi_device *dsi)
 
 	drm_bridge_add(&icn->bridge);
 
-	dsi->lanes = 4;
+	dsi->lanes = icn->dsi_lanes;
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
 
-- 
2.34.1

