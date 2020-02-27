Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 110761723A4
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 17:40:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B12676E94A;
	Thu, 27 Feb 2020 16:40:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E47266E93B
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 16:40:35 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.lab.pengutronix.de)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1j7Lum-0001sX-9E; Thu, 27 Feb 2020 17:21:32 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1j7Luk-00081M-R5; Thu, 27 Feb 2020 17:21:30 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 shawnguo@kernel.org, stefan@agner.ch, rmk+kernel@armlinux.org.uk
Subject: [PATCH 15/17] drm/imx: imx-ldb: split encoder and decoder states
Date: Thu, 27 Feb 2020 17:21:23 +0100
Message-Id: <20200227162125.10450-16-m.felsch@pengutronix.de>
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

The race condition reported by [1] applies to the all drm-imx
subcomponent drivers which implements an encoder:connector combination.
The goal is to switch from the devres-kmalloc and the component
framework to a 'normal' kmalloc and the drm framework to release the
memory resources. So all acquired memory resoruces are freed by a
drm_mode_config_cleanup() call and the ->destroy() callbacks. For this
purpose we need to slit the drm_encoder and the drm_connector state.

[1] https://www.spinics.net/lists/dri-devel/msg189388.html

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/gpu/drm/imx/imx-ldb.c | 106 +++++++++++++++++++++-------------
 1 file changed, 66 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/imx/imx-ldb.c b/drivers/gpu/drm/imx/imx-ldb.c
index 5ef9fcb9ae94..0e5a3c84df10 100644
--- a/drivers/gpu/drm/imx/imx-ldb.c
+++ b/drivers/gpu/drm/imx/imx-ldb.c
@@ -50,7 +50,6 @@ struct imx_ldb;
 
 struct imx_ldb_channel {
 	struct imx_ldb *ldb;
-	struct drm_connector connector;
 	struct drm_encoder encoder;
 
 	/* Defines what is connected to the ldb, only one at a time */
@@ -58,19 +57,26 @@ struct imx_ldb_channel {
 	struct drm_bridge *bridge;
 
 	struct device_node *child;
-	struct i2c_adapter *ddc;
 	int chno;
+	u32 bus_format;
+	u32 bus_flags;
+};
+
+struct imx_ldb_connector {
+	struct imx_ldb_channel *ldb_channel;
+	struct drm_connector connector;
+
+	struct i2c_adapter *ddc;
 	void *edid;
 	int edid_len;
+
 	struct drm_display_mode mode;
 	int mode_valid;
-	u32 bus_format;
-	u32 bus_flags;
 };
 
-static inline struct imx_ldb_channel *con_to_imx_ldb_ch(struct drm_connector *c)
+static inline struct imx_ldb_connector *con_to_imx_ldb_con(struct drm_connector *c)
 {
-	return container_of(c, struct imx_ldb_channel, connector);
+	return container_of(c, struct imx_ldb_connector, connector);
 }
 
 static inline struct imx_ldb_channel *enc_to_imx_ldb_ch(struct drm_encoder *e)
@@ -126,31 +132,41 @@ static void imx_ldb_ch_set_bus_format(struct imx_ldb_channel *imx_ldb_ch,
 	}
 }
 
+static void imx_ldb_connector_destroy(struct drm_connector *connector)
+{
+	struct imx_ldb_connector *imx_ldb_con = con_to_imx_ldb_con(connector);
+
+	imx_drm_connector_destroy(connector);
+	i2c_put_adapter(imx_ldb_con->ddc);
+	/* avoid dangling pointers */
+	imx_ldb_con->ldb_channel = NULL;
+}
+
 static int imx_ldb_connector_get_modes(struct drm_connector *connector)
 {
-	struct imx_ldb_channel *imx_ldb_ch = con_to_imx_ldb_ch(connector);
+	struct imx_ldb_connector *imx_ldb_con = con_to_imx_ldb_con(connector);
+	struct imx_ldb_channel *imx_ldb_ch = imx_ldb_con->ldb_channel;
 	int num_modes;
 
 	num_modes = drm_panel_get_modes(imx_ldb_ch->panel, connector);
 	if (num_modes > 0)
 		return num_modes;
 
-	if (!imx_ldb_ch->edid && imx_ldb_ch->ddc)
-		imx_ldb_ch->edid = drm_get_edid(connector, imx_ldb_ch->ddc);
+	if (!imx_ldb_con->edid && imx_ldb_con->ddc)
+		imx_ldb_con->edid = drm_get_edid(connector, imx_ldb_con->ddc);
 
-	if (imx_ldb_ch->edid) {
-		drm_connector_update_edid_property(connector,
-							imx_ldb_ch->edid);
-		num_modes = drm_add_edid_modes(connector, imx_ldb_ch->edid);
+	if (imx_ldb_con->edid) {
+		drm_connector_update_edid_property(connector, imx_ldb_con->edid);
+		num_modes = drm_add_edid_modes(connector, imx_ldb_con->edid);
 	}
 
-	if (imx_ldb_ch->mode_valid) {
+	if (imx_ldb_con->mode_valid) {
 		struct drm_display_mode *mode;
 
 		mode = drm_mode_create(connector->dev);
 		if (!mode)
 			return -EINVAL;
-		drm_mode_copy(mode, &imx_ldb_ch->mode);
+		drm_mode_copy(mode, &imx_ldb_con->mode);
 		mode->type |= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
 		drm_mode_probed_add(connector, mode);
 		num_modes++;
@@ -166,7 +182,8 @@ static void imx_ldb_encoder_destroy(struct drm_encoder *encoder)
 	if (channel->panel)
 		drm_panel_detach(channel->panel);
 	drm_encoder_cleanup(encoder);
-	i2c_put_adapter(channel->ddc);
+	/* avoid dangling pointers */
+	channel->ldb = NULL;
 }
 
 static void imx_ldb_set_clock(struct imx_ldb *ldb, int mux, int chno,
@@ -388,7 +405,7 @@ static int imx_ldb_encoder_atomic_check(struct drm_encoder *encoder,
 
 static const struct drm_connector_funcs imx_ldb_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = imx_drm_connector_destroy,
+	.destroy = imx_ldb_connector_destroy,
 	.reset = drm_atomic_helper_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
@@ -424,11 +441,13 @@ static int imx_ldb_get_clk(struct imx_ldb *ldb, int chno)
 	return PTR_ERR_OR_ZERO(ldb->clk_pll[chno]);
 }
 
-static int imx_ldb_register(struct drm_device *drm,
-	struct imx_ldb_channel *imx_ldb_ch)
+static int imx_ldb_register_channel(struct drm_device *drm,
+				    struct imx_ldb_channel *imx_ldb_ch,
+				    struct imx_ldb_connector *imx_ldb_con)
 {
 	struct imx_ldb *ldb = imx_ldb_ch->ldb;
 	struct drm_encoder *encoder = &imx_ldb_ch->encoder;
+	struct drm_connector *connector = &imx_ldb_con->connector;
 	int ret;
 
 	ret = imx_drm_encoder_parse_of(drm, encoder, imx_ldb_ch->child);
@@ -450,8 +469,7 @@ static int imx_ldb_register(struct drm_device *drm,
 			 DRM_MODE_ENCODER_LVDS, NULL);
 
 	if (imx_ldb_ch->bridge) {
-		ret = drm_bridge_attach(&imx_ldb_ch->encoder,
-					imx_ldb_ch->bridge, NULL);
+		ret = drm_bridge_attach(encoder, imx_ldb_ch->bridge, NULL);
 		if (ret) {
 			DRM_ERROR("Failed to initialize bridge with drm\n");
 			return ret;
@@ -463,18 +481,17 @@ static int imx_ldb_register(struct drm_device *drm,
 		 * historical reasons, the ldb driver can also work without
 		 * a panel.
 		 */
-		drm_connector_helper_add(&imx_ldb_ch->connector,
-				&imx_ldb_connector_helper_funcs);
-		drm_connector_init_with_ddc(drm, &imx_ldb_ch->connector,
+		drm_connector_helper_add(connector,
+					 &imx_ldb_connector_helper_funcs);
+		drm_connector_init_with_ddc(drm, connector,
 					    &imx_ldb_connector_funcs,
 					    DRM_MODE_CONNECTOR_LVDS,
-					    imx_ldb_ch->ddc);
-		drm_connector_attach_encoder(&imx_ldb_ch->connector, encoder);
+					    imx_ldb_con->ddc);
+		drm_connector_attach_encoder(connector, encoder);
 	}
 
 	if (imx_ldb_ch->panel) {
-		ret = drm_panel_attach(imx_ldb_ch->panel,
-				       &imx_ldb_ch->connector);
+		ret = drm_panel_attach(imx_ldb_ch->panel, connector);
 		if (ret)
 			return ret;
 	}
@@ -518,7 +535,9 @@ static u32 of_get_bus_format(struct device *dev, struct device_node *np)
 }
 
 static int imx_ldb_panel_ddc(struct device *dev,
-		struct imx_ldb_channel *channel, struct device_node *child)
+			     struct imx_ldb_channel *channel,
+			     struct imx_ldb_connector *connector,
+			     struct device_node *child)
 {
 	struct device_node *ddc_node;
 	const u8 *edidp;
@@ -526,32 +545,32 @@ static int imx_ldb_panel_ddc(struct device *dev,
 
 	ddc_node = of_parse_phandle(child, "ddc-i2c-bus", 0);
 	if (ddc_node) {
-		channel->ddc = of_find_i2c_adapter_by_node(ddc_node);
+		connector->ddc = of_find_i2c_adapter_by_node(ddc_node);
 		of_node_put(ddc_node);
-		if (!channel->ddc) {
+		if (!connector->ddc) {
 			dev_warn(dev, "failed to get ddc i2c adapter\n");
 			return -EPROBE_DEFER;
 		}
 	}
 
-	if (!channel->ddc) {
+	if (!connector->ddc) {
 		/* if no DDC available, fallback to hardcoded EDID */
 		dev_dbg(dev, "no ddc available\n");
 
 		edidp = of_get_property(child, "edid",
-					&channel->edid_len);
+					&connector->edid_len);
 		if (edidp) {
-			channel->edid = devm_kmemdup(dev, edidp,
-						     channel->edid_len,
-						     GFP_KERNEL);
+			connector->edid = devm_kmemdup(dev, edidp,
+						       connector->edid_len,
+						       GFP_KERNEL);
 		} else if (!channel->panel) {
 			/* fallback to display-timings node */
 			ret = of_get_drm_display_mode(child,
-						      &channel->mode,
+						      &connector->mode,
 						      &channel->bus_flags,
 						      OF_USE_NATIVE_MODE);
 			if (!ret)
-				channel->mode_valid = 1;
+				connector->mode_valid = 1;
 		}
 	}
 	return 0;
@@ -569,6 +588,7 @@ static int imx_ldb_bind(struct device *dev, struct device *master, void *data)
 
 	for_each_child_of_node(np, child) {
 		struct imx_ldb_channel *channel;
+		struct imx_ldb_connector *connector;
 		int bus_format;
 
 		ret = of_property_read_u32(child, "reg", &i);
@@ -604,9 +624,15 @@ static int imx_ldb_bind(struct device *dev, struct device *master, void *data)
 
 		/* panel ddc only if there is no bridge */
 		if (!channel->bridge) {
-			ret = imx_ldb_panel_ddc(dev, channel, child);
+			connector = devm_kzalloc(dev, sizeof(*connector), GFP_KERNEL);
+			if (!connector)
+				return -ENOMEM;
+
+			ret = imx_ldb_panel_ddc(dev, channel, connector, child);
 			if (ret)
 				goto free_child;
+
+			connector->ldb_channel = channel;
 		}
 
 		bus_format = of_get_bus_format(dev, child);
@@ -628,7 +654,7 @@ static int imx_ldb_bind(struct device *dev, struct device *master, void *data)
 		channel->bus_format = bus_format;
 		channel->child = child;
 
-		ret = imx_ldb_register(drm, channel);
+		ret = imx_ldb_register_channel(drm, channel, connector);
 		if (ret) {
 			channel->child = NULL;
 			goto free_child;
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
