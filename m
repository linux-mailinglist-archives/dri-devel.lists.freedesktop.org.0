Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E8C1723B1
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 17:41:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88F5E6E949;
	Thu, 27 Feb 2020 16:40:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B378C6E93B
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 16:40:54 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.lab.pengutronix.de)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1j7Lum-0001sY-9C; Thu, 27 Feb 2020 17:21:32 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1j7Luk-00082j-SP; Thu, 27 Feb 2020 17:21:30 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 shawnguo@kernel.org, stefan@agner.ch, rmk+kernel@armlinux.org.uk
Subject: [PATCH 16/17] drm/imx: imx-ldb: refactor imx_ldb_bind
Date: Thu, 27 Feb 2020 17:21:24 +0100
Message-Id: <20200227162125.10450-17-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200227162125.10450-1-m.felsch@pengutronix.de>
References: <20200227162125.10450-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Refactor the function to easaly construct error paths later on. The
error handling gets dirty if we don't refactor the code yet. While on it
I fixed a missing i2c_put_adapter() if the bind() fails.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/gpu/drm/imx/imx-ldb.c | 246 ++++++++++++++++++----------------
 1 file changed, 132 insertions(+), 114 deletions(-)

diff --git a/drivers/gpu/drm/imx/imx-ldb.c b/drivers/gpu/drm/imx/imx-ldb.c
index 0e5a3c84df10..5e6c1b09dbfa 100644
--- a/drivers/gpu/drm/imx/imx-ldb.c
+++ b/drivers/gpu/drm/imx/imx-ldb.c
@@ -441,64 +441,6 @@ static int imx_ldb_get_clk(struct imx_ldb *ldb, int chno)
 	return PTR_ERR_OR_ZERO(ldb->clk_pll[chno]);
 }
 
-static int imx_ldb_register_channel(struct drm_device *drm,
-				    struct imx_ldb_channel *imx_ldb_ch,
-				    struct imx_ldb_connector *imx_ldb_con)
-{
-	struct imx_ldb *ldb = imx_ldb_ch->ldb;
-	struct drm_encoder *encoder = &imx_ldb_ch->encoder;
-	struct drm_connector *connector = &imx_ldb_con->connector;
-	int ret;
-
-	ret = imx_drm_encoder_parse_of(drm, encoder, imx_ldb_ch->child);
-	if (ret)
-		return ret;
-
-	ret = imx_ldb_get_clk(ldb, imx_ldb_ch->chno);
-	if (ret)
-		return ret;
-
-	if (imx_ldb_is_dual(ldb)) {
-		ret = imx_ldb_get_clk(ldb, 1);
-		if (ret)
-			return ret;
-	}
-
-	drm_encoder_helper_add(encoder, &imx_ldb_encoder_helper_funcs);
-	drm_encoder_init(drm, encoder, &imx_ldb_encoder_funcs,
-			 DRM_MODE_ENCODER_LVDS, NULL);
-
-	if (imx_ldb_ch->bridge) {
-		ret = drm_bridge_attach(encoder, imx_ldb_ch->bridge, NULL);
-		if (ret) {
-			DRM_ERROR("Failed to initialize bridge with drm\n");
-			return ret;
-		}
-	} else {
-		/*
-		 * We want to add the connector whenever there is no bridge
-		 * that brings its own, not only when there is a panel. For
-		 * historical reasons, the ldb driver can also work without
-		 * a panel.
-		 */
-		drm_connector_helper_add(connector,
-					 &imx_ldb_connector_helper_funcs);
-		drm_connector_init_with_ddc(drm, connector,
-					    &imx_ldb_connector_funcs,
-					    DRM_MODE_CONNECTOR_LVDS,
-					    imx_ldb_con->ddc);
-		drm_connector_attach_encoder(connector, encoder);
-	}
-
-	if (imx_ldb_ch->panel) {
-		ret = drm_panel_attach(imx_ldb_ch->panel, connector);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
-}
-
 struct imx_ldb_bit_mapping {
 	u32 bus_format;
 	u32 datawidth;
@@ -576,6 +518,136 @@ static int imx_ldb_panel_ddc(struct device *dev,
 	return 0;
 }
 
+static int imx_ldb_setup_channel(struct device *dev,
+				 struct device_node *child,
+				 struct drm_device *drm,
+				 struct imx_ldb *ldb,
+				 int channel_number)
+{
+	struct imx_ldb_channel *channel;
+	struct imx_ldb_connector *imx_ldb_con;
+	struct drm_encoder *encoder;
+	struct drm_connector *connector = NULL;
+	int bus_format;
+	int ret;
+
+	/*
+	 * 1) Parse all available data and alloc needed structs
+	 * 2) Setup the HW
+	 * 3) Register it with the DRM framework
+	 * 4) Attach bridge or connector to encoder
+	 */
+	channel = devm_kzalloc(dev, sizeof(*channel), GFP_KERNEL);
+	if (!channel)
+		return -ENOMEM;
+
+	channel->ldb = ldb;
+	channel->chno = channel_number;
+	channel->child = child;
+	encoder = &channel->encoder;
+
+	/*
+	 * The output port is port@4 with an external 4-port mux or
+	 * port@2 with the internal 2-port mux.
+	 */
+	ret = drm_of_find_panel_or_bridge(child,
+					  ldb->lvds_mux ? 4 : 2, 0,
+					  &channel->panel, &channel->bridge);
+	if (ret && ret != -ENODEV)
+		return ret;
+
+	/* panel ddc only if there is no bridge */
+	if (!channel->bridge) {
+		imx_ldb_con = devm_kzalloc(dev, sizeof(*connector), GFP_KERNEL);
+		if (!imx_ldb_con)
+			return -ENOMEM;
+
+		ret = imx_ldb_panel_ddc(dev, channel, imx_ldb_con, child);
+		if (ret)
+			return ret;
+
+		imx_ldb_con->ldb_channel = channel;
+		connector = &imx_ldb_con->connector;
+	}
+
+	bus_format = of_get_bus_format(dev, child);
+	if (bus_format == -EINVAL) {
+		/*
+		 * If no bus format was specified in the device tree,
+		 * we can still get it from the connected panel later.
+		 */
+		if (channel->panel && channel->panel->funcs &&
+		    channel->panel->funcs->get_modes)
+			bus_format = 0;
+	}
+	if (bus_format < 0) {
+		dev_err(dev, "could not determine data mapping: %d\n",
+			bus_format);
+		ret = bus_format;
+		goto err_put_ddc;
+	}
+	channel->bus_format = bus_format;
+
+	/* 2) Setup the HW */
+	ret = imx_ldb_get_clk(channel->ldb, channel->chno);
+	if (ret)
+		goto err_put_ddc;
+
+	if (imx_ldb_is_dual(ldb)) {
+		ret = imx_ldb_get_clk(ldb, 1);
+		if (ret)
+			goto err_put_ddc;
+	}
+
+	/* 3) Register it with the DRM framework */
+	ret = imx_drm_encoder_parse_of(drm, encoder, channel->child);
+	if (ret)
+		goto err_put_ddc;
+
+	drm_encoder_helper_add(encoder, &imx_ldb_encoder_helper_funcs);
+	drm_encoder_init(drm, encoder, &imx_ldb_encoder_funcs,
+			 DRM_MODE_ENCODER_LVDS, NULL);
+
+	if (!channel->bridge) {
+		/*
+		 * We want to add the connector whenever there is no bridge
+		 * that brings its own, not only when there is a panel. For
+		 * historical reasons, the ldb driver can also work without
+		 * a panel.
+		 */
+		drm_connector_helper_add(connector,
+					 &imx_ldb_connector_helper_funcs);
+		drm_connector_init_with_ddc(drm, connector,
+					    &imx_ldb_connector_funcs,
+					    DRM_MODE_CONNECTOR_LVDS,
+					    imx_ldb_con->ddc);
+	}
+
+	/* 4) Attach bridge or connector to encoder */
+	if (channel->bridge) {
+		ret = drm_bridge_attach(encoder, channel->bridge, NULL);
+		if (ret) {
+			DRM_ERROR("Failed to initialize bridge with drm\n");
+			goto err_put_ddc;
+		}
+	} else {
+		drm_connector_attach_encoder(connector, encoder);
+	}
+
+	if (channel->panel) {
+		ret = drm_panel_attach(channel->panel, connector);
+		if (ret)
+			goto err_put_ddc;
+	}
+
+	return 0;
+
+err_put_ddc:
+	if (imx_ldb_con)
+		i2c_put_adapter(imx_ldb_con->ddc);
+	return ret;
+}
+
 static int imx_ldb_bind(struct device *dev, struct device *master, void *data)
 {
 	struct drm_device *drm = data;
@@ -587,9 +659,6 @@ static int imx_ldb_bind(struct device *dev, struct device *master, void *data)
 	int i;
 
 	for_each_child_of_node(np, child) {
-		struct imx_ldb_channel *channel;
-		struct imx_ldb_connector *connector;
-		int bus_format;
 
 		ret = of_property_read_u32(child, "reg", &i);
 		if (ret || i < 0 || i > 1) {
@@ -605,60 +674,9 @@ static int imx_ldb_bind(struct device *dev, struct device *master, void *data)
 			continue;
 		}
 
-		channel = devm_kzalloc(dev, sizeof(*channel), GFP_KERNEL);
-		if (!channel)
-			return -ENOMEM;
-
-		channel->ldb = imx_ldb;
-		channel->chno = i;
-
-		/*
-		 * The output port is port@4 with an external 4-port mux or
-		 * port@2 with the internal 2-port mux.
-		 */
-		ret = drm_of_find_panel_or_bridge(child,
-						  imx_ldb->lvds_mux ? 4 : 2, 0,
-						  &channel->panel, &channel->bridge);
-		if (ret && ret != -ENODEV)
-			goto free_child;
-
-		/* panel ddc only if there is no bridge */
-		if (!channel->bridge) {
-			connector = devm_kzalloc(dev, sizeof(*connector), GFP_KERNEL);
-			if (!connector)
-				return -ENOMEM;
-
-			ret = imx_ldb_panel_ddc(dev, channel, connector, child);
-			if (ret)
-				goto free_child;
-
-			connector->ldb_channel = channel;
-		}
-
-		bus_format = of_get_bus_format(dev, child);
-		if (bus_format == -EINVAL) {
-			/*
-			 * If no bus format was specified in the device tree,
-			 * we can still get it from the connected panel later.
-			 */
-			if (channel->panel && channel->panel->funcs &&
-			    channel->panel->funcs->get_modes)
-				bus_format = 0;
-		}
-		if (bus_format < 0) {
-			dev_err(dev, "could not determine data mapping: %d\n",
-				bus_format);
-			ret = bus_format;
-			goto free_child;
-		}
-		channel->bus_format = bus_format;
-		channel->child = child;
-
-		ret = imx_ldb_register_channel(drm, channel, connector);
-		if (ret) {
-			channel->child = NULL;
+		ret = imx_ldb_setup_channel(dev, child, drm, imx_ldb, i);
+		if (ret)
 			goto free_child;
-		}
 	}
 
 	return 0;
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
