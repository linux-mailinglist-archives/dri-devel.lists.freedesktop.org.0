Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A8F48E30F
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 04:49:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B4F510EB79;
	Fri, 14 Jan 2022 03:49:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A180B10EB61
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 03:49:00 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D9900832E9;
 Fri, 14 Jan 2022 04:48:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1642132139;
 bh=mg9NT/vi51ehASuTqH6pbw3X4azNrBz6t2NFnKl0B44=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qK8eieNxDbZS/my0jtEcslj+/sISluwXER++/24gYPFEO+d+P8zM4eTL44SOaWVLk
 s5Wv95/lLn953suxEE1UeQOAowjwnvhuoc0LbNo2XrtJfULFPmc1N+umFLwHDiIhp9
 uF7Dk5w2TwnMOcCNRL6wB8VgaAh/XMrOo3o3NS6rOVeuIaCSn57cO+efWtm8QK5kMa
 yu1I7tShCmmmDEYYsqg+tDEMJcxylNLBazgkNsk+d8ipWbwboL3NrDw8oMgwQbQjai
 HxNvXsqKT5yEO3uZx5lbd1ETZaGPYMLNiCZutZvxdB5ox4xe/3qyTTTDZTXflUQ2oC
 xFaLQ4P1+N5Iw==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 07/14] drm: bridge: icn6211: Add DSI lane count DT property
 parsing
Date: Fri, 14 Jan 2022 04:48:31 +0100
Message-Id: <20220114034838.546267-7-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220114034838.546267-1-marex@denx.de>
References: <20220114034838.546267-1-marex@denx.de>
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
Cc: Marek Vasut <marex@denx.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Robert Foss <robert.foss@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver currently hard-codes DSI lane count to two, however the chip
is capable of operating in 1..4 DSI lanes mode. Parse 'data-lanes' DT
property and program the result into DSI_CTRL register.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
To: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/bridge/chipone-icn6211.c | 35 ++++++++++++++++++++----
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index 3ad082c1d2bfd..400a566026ab4 100644
--- a/drivers/gpu/drm/bridge/chipone-icn6211.c
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -135,10 +135,12 @@ struct chipone {
 	struct device *dev;
 	struct drm_bridge bridge;
 	struct drm_bridge *panel_bridge;
+	struct device_node *host_node;
 	struct gpio_desc *enable_gpio;
 	struct regulator *vdd1;
 	struct regulator *vdd2;
 	struct regulator *vdd3;
+	int dsi_lanes;
 };
 
 static inline struct chipone *bridge_to_chipone(struct drm_bridge *bridge)
@@ -235,6 +237,11 @@ static void chipone_atomic_enable(struct drm_bridge *bridge,
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
 
@@ -354,6 +361,8 @@ static const struct drm_bridge_funcs chipone_bridge_funcs = {
 static int chipone_parse_dt(struct chipone *icn)
 {
 	struct device *dev = icn->dev;
+	struct drm_bridge *panel_bridge;
+	struct device_node *endpoint;
 	struct drm_panel *panel;
 	int ret;
 
@@ -390,13 +399,26 @@ static int chipone_parse_dt(struct chipone *icn)
 		return PTR_ERR(icn->enable_gpio);
 	}
 
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);
-	if (ret)
+	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
+	icn->dsi_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
+	icn->host_node = of_graph_get_remote_port_parent(endpoint);
+	of_node_put(endpoint);
+
+	if (icn->dsi_lanes < 0 || icn->dsi_lanes > 4)
+		return -EINVAL;
+	if (!icn->host_node)
+		return -ENODEV;
+
+	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, &panel_bridge);
+	if (ret < 0)
 		return ret;
+	if (panel) {
+		panel_bridge = devm_drm_panel_bridge_add(dev, panel);
+		if (IS_ERR(panel_bridge))
+			return PTR_ERR(panel_bridge);
+	}
 
-	icn->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
-	if (IS_ERR(icn->panel_bridge))
-		return PTR_ERR(icn->panel_bridge);
+	icn->panel_bridge = panel_bridge;
 
 	return 0;
 }
@@ -424,7 +446,7 @@ static int chipone_probe(struct mipi_dsi_device *dsi)
 
 	drm_bridge_add(&icn->bridge);
 
-	dsi->lanes = 4;
+	dsi->lanes = icn->dsi_lanes;
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
 
@@ -443,6 +465,7 @@ static int chipone_remove(struct mipi_dsi_device *dsi)
 
 	mipi_dsi_detach(dsi);
 	drm_bridge_remove(&icn->bridge);
+	of_node_put(icn->host_node);
 
 	return 0;
 }
-- 
2.34.1

