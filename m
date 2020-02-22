Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A37F4168F8B
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2020 16:02:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FA666E944;
	Sat, 22 Feb 2020 15:02:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 746B86E91B
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 15:01:55 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4923933E;
 Sat, 22 Feb 2020 16:01:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582383712;
 bh=PGD/Wlfji5rxMEDhznmDOjqEqrOADwcPJSFXW2OfNaE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SYij/I2Bnec9j3y0C17kXzQKKqHo3LhctW98zTvLzl85mDsVe3Eo5nN1wuIC8tqOz
 5NXsTa+Q2WlrPNxalO3uEuO5IPYom9VukIVXnISmD/PRlIu0/T2Y82iEums56oYxo3
 y8hIkM8c28k/95LipsOTpK7EoY21nVieajPG+JOg=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 18/54] drm/bridge: tfp410: Replace manual connector
 handling with bridge
Date: Sat, 22 Feb 2020 17:00:30 +0200
Message-Id: <20200222150106.22919-19-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200222150106.22919-1-laurent.pinchart@ideasonboard.com>
References: <20200222150106.22919-1-laurent.pinchart@ideasonboard.com>
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that a driver is available for display connectors, replace the
manual connector handling code with usage of the DRM bridge API. The
tfp410 driver doesn't deal with the display connector directly anymore,
but still delegates drm_connector operations to the next bridge. This
brings us one step closer to having the tfp410 driver handling the
TFP410 only.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Tested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Changes since v2:

- Use drm_bridge_get_edid() and drm_bridge_detect() helpers
---
 drivers/gpu/drm/bridge/ti-tfp410.c | 216 ++++++++++-------------------
 1 file changed, 75 insertions(+), 141 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index 193c9368f664..2b8741ebc696 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -4,14 +4,12 @@
  * Author: Jyri Sarha <jsarha@ti.com>
  */
 
-#include <linux/delay.h>
-#include <linux/fwnode.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
-#include <linux/irq.h>
 #include <linux/module.h>
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
+#include <linux/workqueue.h>
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
@@ -24,16 +22,13 @@
 struct tfp410 {
 	struct drm_bridge	bridge;
 	struct drm_connector	connector;
-	unsigned int		connector_type;
 
 	u32			bus_format;
-	struct i2c_adapter	*ddc;
-	struct gpio_desc	*hpd;
-	int			hpd_irq;
 	struct delayed_work	hpd_work;
 	struct gpio_desc	*powerdown;
 
 	struct drm_bridge_timings timings;
+	struct drm_bridge	*next_bridge;
 
 	struct device *dev;
 };
@@ -56,13 +51,18 @@ static int tfp410_get_modes(struct drm_connector *connector)
 	struct edid *edid;
 	int ret;
 
-	if (!dvi->ddc)
-		goto fallback;
+	edid = drm_bridge_get_edid(dvi->next_bridge, connector);
+	if (IS_ERR_OR_NULL(edid)) {
+		if (edid != ERR_PTR(-ENOTSUPP))
+			DRM_INFO("EDID read failed. Fallback to standard modes\n");
 
-	edid = drm_get_edid(connector, dvi->ddc);
-	if (!edid) {
-		DRM_INFO("EDID read failed. Fallback to standard modes\n");
-		goto fallback;
+		/*
+		 * No EDID, fallback on the XGA standard modes and prefer a mode
+		 * pretty much anything can handle.
+		 */
+		ret = drm_add_modes_noedid(connector, 1920, 1200);
+		drm_set_preferred_mode(connector, 1024, 768);
+		return ret;
 	}
 
 	drm_connector_update_edid_property(connector, edid);
@@ -71,15 +71,6 @@ static int tfp410_get_modes(struct drm_connector *connector)
 
 	kfree(edid);
 
-	return ret;
-
-fallback:
-	/* No EDID, fallback on the XGA standard modes */
-	ret = drm_add_modes_noedid(connector, 1920, 1200);
-
-	/* And prefer a mode pretty much anything can handle */
-	drm_set_preferred_mode(connector, 1024, 768);
-
 	return ret;
 }
 
@@ -92,21 +83,7 @@ tfp410_connector_detect(struct drm_connector *connector, bool force)
 {
 	struct tfp410 *dvi = drm_connector_to_tfp410(connector);
 
-	if (dvi->hpd) {
-		if (gpiod_get_value_cansleep(dvi->hpd))
-			return connector_status_connected;
-		else
-			return connector_status_disconnected;
-	}
-
-	if (dvi->ddc) {
-		if (drm_probe_ddc(dvi->ddc))
-			return connector_status_connected;
-		else
-			return connector_status_disconnected;
-	}
-
-	return connector_status_unknown;
+	return drm_bridge_detect(dvi->next_bridge);
 }
 
 static const struct drm_connector_funcs tfp410_con_funcs = {
@@ -118,12 +95,35 @@ static const struct drm_connector_funcs tfp410_con_funcs = {
 	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
 };
 
+static void tfp410_hpd_work_func(struct work_struct *work)
+{
+	struct tfp410 *dvi;
+
+	dvi = container_of(work, struct tfp410, hpd_work.work);
+
+	if (dvi->bridge.dev)
+		drm_helper_hpd_irq_event(dvi->bridge.dev);
+}
+
+static void tfp410_hpd_callback(void *arg, enum drm_connector_status status)
+{
+	struct tfp410 *dvi = arg;
+
+	mod_delayed_work(system_wq, &dvi->hpd_work,
+			 msecs_to_jiffies(HOTPLUG_DEBOUNCE_MS));
+}
+
 static int tfp410_attach(struct drm_bridge *bridge,
 			 enum drm_bridge_attach_flags flags)
 {
 	struct tfp410 *dvi = drm_bridge_to_tfp410(bridge);
 	int ret;
 
+	ret = drm_bridge_attach(bridge->encoder, dvi->next_bridge, bridge,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	if (ret < 0)
+		return ret;
+
 	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
 		DRM_ERROR("Fix bridge driver to make connector optional!");
 		return -EINVAL;
@@ -134,17 +134,23 @@ static int tfp410_attach(struct drm_bridge *bridge,
 		return -ENODEV;
 	}
 
-	if (dvi->hpd_irq >= 0)
+	if (dvi->next_bridge->ops & DRM_BRIDGE_OP_DETECT)
 		dvi->connector.polled = DRM_CONNECTOR_POLL_HPD;
 	else
 		dvi->connector.polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
 
+	if (dvi->next_bridge->ops & DRM_BRIDGE_OP_HPD) {
+		INIT_DELAYED_WORK(&dvi->hpd_work, tfp410_hpd_work_func);
+		drm_bridge_hpd_enable(dvi->next_bridge, tfp410_hpd_callback,
+				      dvi);
+	}
+
 	drm_connector_helper_add(&dvi->connector,
 				 &tfp410_con_helper_funcs);
 	ret = drm_connector_init_with_ddc(bridge->dev, &dvi->connector,
 					  &tfp410_con_funcs,
-					  dvi->connector_type,
-					  dvi->ddc);
+					  dvi->next_bridge->type,
+					  dvi->next_bridge->ddc);
 	if (ret) {
 		dev_err(dvi->dev, "drm_connector_init() failed: %d\n", ret);
 		return ret;
@@ -153,12 +159,21 @@ static int tfp410_attach(struct drm_bridge *bridge,
 	drm_display_info_set_bus_formats(&dvi->connector.display_info,
 					 &dvi->bus_format, 1);
 
-	drm_connector_attach_encoder(&dvi->connector,
-					  bridge->encoder);
+	drm_connector_attach_encoder(&dvi->connector, bridge->encoder);
 
 	return 0;
 }
 
+static void tfp410_detach(struct drm_bridge *bridge)
+{
+	struct tfp410 *dvi = drm_bridge_to_tfp410(bridge);
+
+	if (dvi->connector.dev && dvi->next_bridge->ops & DRM_BRIDGE_OP_HPD) {
+		drm_bridge_hpd_disable(dvi->next_bridge);
+		cancel_delayed_work_sync(&dvi->hpd_work);
+	}
+}
+
 static void tfp410_enable(struct drm_bridge *bridge)
 {
 	struct tfp410 *dvi = drm_bridge_to_tfp410(bridge);
@@ -187,31 +202,12 @@ static enum drm_mode_status tfp410_mode_valid(struct drm_bridge *bridge,
 
 static const struct drm_bridge_funcs tfp410_bridge_funcs = {
 	.attach		= tfp410_attach,
+	.detach		= tfp410_detach,
 	.enable		= tfp410_enable,
 	.disable	= tfp410_disable,
 	.mode_valid	= tfp410_mode_valid,
 };
 
-static void tfp410_hpd_work_func(struct work_struct *work)
-{
-	struct tfp410 *dvi;
-
-	dvi = container_of(work, struct tfp410, hpd_work.work);
-
-	if (dvi->bridge.dev)
-		drm_helper_hpd_irq_event(dvi->bridge.dev);
-}
-
-static irqreturn_t tfp410_hpd_irq_thread(int irq, void *arg)
-{
-	struct tfp410 *dvi = arg;
-
-	mod_delayed_work(system_wq, &dvi->hpd_work,
-			msecs_to_jiffies(HOTPLUG_DEBOUNCE_MS));
-
-	return IRQ_HANDLED;
-}
-
 static const struct drm_bridge_timings tfp410_default_timings = {
 	.input_bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE
 			 | DRM_BUS_FLAG_DE_HIGH,
@@ -289,51 +285,9 @@ static int tfp410_parse_timings(struct tfp410 *dvi, bool i2c)
 	return 0;
 }
 
-static int tfp410_get_connector_properties(struct tfp410 *dvi)
-{
-	struct device_node *connector_node, *ddc_phandle;
-	int ret = 0;
-
-	/* port@1 is the connector node */
-	connector_node = of_graph_get_remote_node(dvi->dev->of_node, 1, -1);
-	if (!connector_node)
-		return -ENODEV;
-
-	if (of_device_is_compatible(connector_node, "hdmi-connector"))
-		dvi->connector_type = DRM_MODE_CONNECTOR_HDMIA;
-	else
-		dvi->connector_type = DRM_MODE_CONNECTOR_DVID;
-
-	dvi->hpd = fwnode_gpiod_get_index(&connector_node->fwnode,
-					  "hpd", 0, GPIOD_IN, "hpd");
-	if (IS_ERR(dvi->hpd)) {
-		ret = PTR_ERR(dvi->hpd);
-		dvi->hpd = NULL;
-		if (ret == -ENOENT)
-			ret = 0;
-		else
-			goto fail;
-	}
-
-	ddc_phandle = of_parse_phandle(connector_node, "ddc-i2c-bus", 0);
-	if (!ddc_phandle)
-		goto fail;
-
-	dvi->ddc = of_get_i2c_adapter_by_node(ddc_phandle);
-	if (dvi->ddc)
-		dev_info(dvi->dev, "Connector's ddc i2c bus found\n");
-	else
-		ret = -EPROBE_DEFER;
-
-	of_node_put(ddc_phandle);
-
-fail:
-	of_node_put(connector_node);
-	return ret;
-}
-
 static int tfp410_init(struct device *dev, bool i2c)
 {
+	struct device_node *node;
 	struct tfp410 *dvi;
 	int ret;
 
@@ -345,21 +299,31 @@ static int tfp410_init(struct device *dev, bool i2c)
 	dvi = devm_kzalloc(dev, sizeof(*dvi), GFP_KERNEL);
 	if (!dvi)
 		return -ENOMEM;
+
+	dvi->dev = dev;
 	dev_set_drvdata(dev, dvi);
 
 	dvi->bridge.funcs = &tfp410_bridge_funcs;
 	dvi->bridge.of_node = dev->of_node;
 	dvi->bridge.timings = &dvi->timings;
-	dvi->dev = dev;
+	dvi->bridge.type = DRM_MODE_CONNECTOR_DVID;
 
 	ret = tfp410_parse_timings(dvi, i2c);
 	if (ret)
-		goto fail;
+		return ret;
 
-	ret = tfp410_get_connector_properties(dvi);
-	if (ret)
-		goto fail;
+	/* Get the next bridge, connected to port@1. */
+	node = of_graph_get_remote_node(dev->of_node, 1, -1);
+	if (!node)
+		return -ENODEV;
+
+	dvi->next_bridge = of_drm_find_bridge(node);
+	of_node_put(node);
 
+	if (!dvi->next_bridge)
+		return -EPROBE_DEFER;
+
+	/* Get the powerdown GPIO. */
 	dvi->powerdown = devm_gpiod_get_optional(dev, "powerdown",
 						 GPIOD_OUT_HIGH);
 	if (IS_ERR(dvi->powerdown)) {
@@ -367,48 +331,18 @@ static int tfp410_init(struct device *dev, bool i2c)
 		return PTR_ERR(dvi->powerdown);
 	}
 
-	if (dvi->hpd)
-		dvi->hpd_irq = gpiod_to_irq(dvi->hpd);
-	else
-		dvi->hpd_irq = -ENXIO;
-
-	if (dvi->hpd_irq >= 0) {
-		INIT_DELAYED_WORK(&dvi->hpd_work, tfp410_hpd_work_func);
-
-		ret = devm_request_threaded_irq(dev, dvi->hpd_irq,
-			NULL, tfp410_hpd_irq_thread, IRQF_TRIGGER_RISING |
-			IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
-			"hdmi-hpd", dvi);
-		if (ret) {
-			DRM_ERROR("failed to register hpd interrupt\n");
-			goto fail;
-		}
-	}
-
+	/*  Register the DRM bridge. */
 	drm_bridge_add(&dvi->bridge);
 
 	return 0;
-fail:
-	i2c_put_adapter(dvi->ddc);
-	if (dvi->hpd)
-		gpiod_put(dvi->hpd);
-	return ret;
 }
 
 static int tfp410_fini(struct device *dev)
 {
 	struct tfp410 *dvi = dev_get_drvdata(dev);
 
-	if (dvi->hpd_irq >= 0)
-		cancel_delayed_work_sync(&dvi->hpd_work);
-
 	drm_bridge_remove(&dvi->bridge);
 
-	if (dvi->ddc)
-		i2c_put_adapter(dvi->ddc);
-	if (dvi->hpd)
-		gpiod_put(dvi->hpd);
-
 	return 0;
 }
 
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
