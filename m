Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 345F63436FD
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 04:02:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 872C589D2F;
	Mon, 22 Mar 2021 03:02:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8C0589D2F
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 03:02:26 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 84FDB1576;
 Mon, 22 Mar 2021 04:02:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1616382145;
 bh=0AuFffxtjvDe8goCN1bN05eBkjAlHyMXGznRyAOzdDM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=erO7guZ6EAtGgAzfrjvBBdYprfVyVsrr+txOHcWheRRlTM4oogbUbo7n4Vc4V2r8+
 RGgZFXi+ESuRVKb5ZFRidOSsUp16oa2LOx5plaWP/kcdTC3vlr5vwlakFpIN0xGZyl
 5scarMsOl+BAkuZR2jzlDEWzUNRrgkrlujVpVt0E=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 11/11] drm/bridge: ti-sn65dsi86: Support hotplug detection
Date: Mon, 22 Mar 2021 05:01:28 +0200
Message-Id: <20210322030128.2283-12-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
In-Reply-To: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 linux-renesas-soc@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the SN65DSI86 is used in DisplayPort mode, its output is likely
routed to a DisplayPort connector, which can benefit from hotplug
detection. Support it in such cases, with polling mode only for now.

The implementation is limited to the bridge operations, as the connector
operations are legacy and new users should use
DRM_BRIDGE_ATTACH_NO_CONNECTOR.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 46 +++++++++++++++++++--------
 1 file changed, 33 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index f792227142a7..72f6362adf44 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -167,6 +167,8 @@ struct ti_sn_bridge {
 	struct gpio_chip		gchip;
 	DECLARE_BITMAP(gchip_output, SN_NUM_GPIOS);
 #endif
+
+	bool				no_hpd;
 };
 
 static const struct regmap_range ti_sn_bridge_volatile_ranges[] = {
@@ -862,23 +864,28 @@ static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
 	ti_sn_bridge_set_refclk_freq(pdata);
 
 	/*
-	 * HPD on this bridge chip is a bit useless.  This is an eDP bridge
-	 * so the HPD is an internal signal that's only there to signal that
-	 * the panel is done powering up.  ...but the bridge chip debounces
-	 * this signal by between 100 ms and 400 ms (depending on process,
-	 * voltage, and temperate--I measured it at about 200 ms).  One
+	 * As this is an eDP bridge, the output will be connected to a fixed
+	 * panel in most systems. HPD is in that case only an internal signal
+	 * to signal that the panel is done powering up. The bridge chip
+	 * debounces this signal by between 100 ms and 400 ms (depending on
+	 * process, voltage, and temperate--I measured it at about 200 ms). One
 	 * particular panel asserted HPD 84 ms after it was powered on meaning
 	 * that we saw HPD 284 ms after power on.  ...but the same panel said
 	 * that instead of looking at HPD you could just hardcode a delay of
-	 * 200 ms.  We'll assume that the panel driver will have the hardcoded
-	 * delay in its prepare and always disable HPD.
+	 * 200 ms. HPD is thus a bit useless. For this type of use cases, we'll
+	 * assume that the panel driver will have the hardcoded delay in its
+	 * prepare and always disable HPD.
 	 *
-	 * If HPD somehow makes sense on some future panel we'll have to
-	 * change this to be conditional on someone specifying that HPD should
-	 * be used.
+	 * However, on some systems, the output is connected to a DisplayPort
+	 * connector. HPD is needed in such cases. To accommodate both use
+	 * cases, enable HPD only when requested.
 	 */
-	regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
-			   HPD_DISABLE);
+	if (pdata->no_hpd)
+		regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG,
+				   HPD_DISABLE, HPD_DISABLE);
+	else
+		regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG,
+				   HPD_DISABLE, 0);
 }
 
 static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
@@ -890,6 +897,15 @@ static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
 	pm_runtime_put_sync(pdata->dev);
 }
 
+static enum drm_connector_status ti_sn_bridge_detect(struct drm_bridge *bridge)
+{
+	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
+	int val;
+
+	regmap_read(pdata->regmap, SN_HPD_DISABLE_REG, &val);
+	return val ? connector_status_connected : connector_status_disconnected;
+}
+
 static struct edid *ti_sn_bridge_get_edid(struct drm_bridge *bridge,
 					  struct drm_connector *connector)
 {
@@ -904,6 +920,7 @@ static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
 	.enable = ti_sn_bridge_enable,
 	.disable = ti_sn_bridge_disable,
 	.post_disable = ti_sn_bridge_post_disable,
+	.detect = ti_sn_bridge_detect,
 	.get_edid = ti_sn_bridge_get_edid,
 };
 
@@ -1327,6 +1344,8 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
 		return ret;
 	}
 
+	pdata->no_hpd = of_property_read_bool(pdata->dev->of_node, "no-hpd");
+
 	ti_sn_bridge_parse_lanes(pdata, client->dev.of_node);
 
 	ret = ti_sn_bridge_parse_regulators(pdata);
@@ -1365,7 +1384,8 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
 
 	pdata->bridge.funcs = &ti_sn_bridge_funcs;
 	pdata->bridge.of_node = client->dev.of_node;
-	pdata->bridge.ops = DRM_BRIDGE_OP_EDID;
+	pdata->bridge.ops = (pdata->no_hpd ? 0 : DRM_BRIDGE_OP_DETECT)
+			  | DRM_BRIDGE_OP_EDID;
 	pdata->bridge.type = pdata->panel ? DRM_MODE_CONNECTOR_eDP
 			   : DRM_MODE_CONNECTOR_DisplayPort;
 
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
