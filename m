Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BB1343700
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 04:02:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B93A89DB9;
	Mon, 22 Mar 2021 03:02:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE17289C98
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 03:02:23 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 780CCFDE;
 Mon, 22 Mar 2021 04:02:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1616382141;
 bh=gYbZqZLRY3efOTfZyuT1hEulqmaB6MAwH8HbB19Yvww=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vs0mVFC8hkZ4dgGM7QH09XyH/YC/D0htEYgOuE+5Uc9Io91x17irlrWjMql25zX5k
 Cx9BBVkgr8TEc0baCLQKrTzzBfg6F7f77sgf6h3eF2Rw9UW1GTL8tggZ+zSfM7rQqI
 Is8jVgdO8KnRI+I/OB35SY6+8EFeDJ/qfiUEJYuQ=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 06/11] drm/bridge: ti-sn65dsi86: Group code in sections
Date: Mon, 22 Mar 2021 05:01:23 +0200
Message-Id: <20210322030128.2283-7-laurent.pinchart+renesas@ideasonboard.com>
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

Reorganize the functions in sections, related to connector operations,
bridge operations, AUX adapter, GPIO controller and probe & remove.

This prepares for proper support of DRM_BRIDGE_ATTACH_NO_CONNECTOR that
will add more functions, to ensure that the code will stay readable.

No functional change intended.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 75 +++++++++++++++++----------
 1 file changed, 47 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index c21a7f7d452b..7f5d53c74978 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -261,7 +261,10 @@ static void ti_sn_debugfs_remove(struct ti_sn_bridge *pdata)
 	pdata->debugfs = NULL;
 }
 
-/* Connector funcs */
+/* -----------------------------------------------------------------------------
+ * DRM Connector Operations
+ */
+
 static struct ti_sn_bridge *
 connector_to_ti_sn_bridge(struct drm_connector *connector)
 {
@@ -328,25 +331,15 @@ static const struct drm_connector_funcs ti_sn_bridge_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
+/*------------------------------------------------------------------------------
+ * DRM Bridge Operations
+ */
+
 static struct ti_sn_bridge *bridge_to_ti_sn_bridge(struct drm_bridge *bridge)
 {
 	return container_of(bridge, struct ti_sn_bridge, bridge);
 }
 
-static int ti_sn_bridge_parse_regulators(struct ti_sn_bridge *pdata)
-{
-	unsigned int i;
-	const char * const ti_sn_bridge_supply_names[] = {
-		"vcca", "vcc", "vccio", "vpll",
-	};
-
-	for (i = 0; i < SN_REGULATOR_SUPPLY_NUM; i++)
-		pdata->supplies[i].supply = ti_sn_bridge_supply_names[i];
-
-	return devm_regulator_bulk_get(pdata->dev, SN_REGULATOR_SUPPLY_NUM,
-				       pdata->supplies);
-}
-
 static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 			       enum drm_bridge_attach_flags flags)
 {
@@ -875,6 +868,10 @@ static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
 	.post_disable = ti_sn_bridge_post_disable,
 };
 
+/* -----------------------------------------------------------------------------
+ * AUX Adapter
+ */
+
 static struct ti_sn_bridge *aux_to_ti_sn_bridge(struct drm_dp_aux *aux)
 {
 	return container_of(aux, struct ti_sn_bridge, aux);
@@ -973,19 +970,9 @@ static ssize_t ti_sn_aux_transfer(struct drm_dp_aux *aux,
 	return len;
 }
 
-static int ti_sn_bridge_parse_dsi_host(struct ti_sn_bridge *pdata)
-{
-	struct device_node *np = pdata->dev->of_node;
-
-	pdata->host_node = of_graph_get_remote_node(np, 0, 0);
-
-	if (!pdata->host_node) {
-		DRM_ERROR("remote dsi host node not found\n");
-		return -ENODEV;
-	}
-
-	return 0;
-}
+/* -----------------------------------------------------------------------------
+ * GPIO Controller
+ */
 
 #if defined(CONFIG_OF_GPIO)
 
@@ -1168,6 +1155,10 @@ static inline int ti_sn_setup_gpio_controller(struct ti_sn_bridge *pdata)
 
 #endif
 
+/* -----------------------------------------------------------------------------
+ * Probe & Remove
+ */
+
 static void ti_sn_bridge_parse_lanes(struct ti_sn_bridge *pdata,
 				     struct device_node *np)
 {
@@ -1217,6 +1208,34 @@ static void ti_sn_bridge_parse_lanes(struct ti_sn_bridge *pdata,
 	pdata->ln_polrs = ln_polrs;
 }
 
+static int ti_sn_bridge_parse_regulators(struct ti_sn_bridge *pdata)
+{
+	unsigned int i;
+	const char * const ti_sn_bridge_supply_names[] = {
+		"vcca", "vcc", "vccio", "vpll",
+	};
+
+	for (i = 0; i < SN_REGULATOR_SUPPLY_NUM; i++)
+		pdata->supplies[i].supply = ti_sn_bridge_supply_names[i];
+
+	return devm_regulator_bulk_get(pdata->dev, SN_REGULATOR_SUPPLY_NUM,
+				       pdata->supplies);
+}
+
+static int ti_sn_bridge_parse_dsi_host(struct ti_sn_bridge *pdata)
+{
+	struct device_node *np = pdata->dev->of_node;
+
+	pdata->host_node = of_graph_get_remote_node(np, 0, 0);
+
+	if (!pdata->host_node) {
+		DRM_ERROR("remote dsi host node not found\n");
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
 static int ti_sn_bridge_probe(struct i2c_client *client,
 			      const struct i2c_device_id *id)
 {
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
