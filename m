Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 669524EDC5C
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 17:06:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7F2D10F2DC;
	Thu, 31 Mar 2022 15:05:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D10110F239
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 15:05:49 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 812D6840A6;
 Thu, 31 Mar 2022 17:05:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1648739147;
 bh=4mlKVdAG0x4m9/mriWPZjdetJ5ijAF+DmtWS2sRRNdg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=yIqTijc4+ML2M1k92D7qq8AVNqJORHTLokESwnx6nHgXGLK/fD2wIHwkbMlKLGrdK
 eXxuo5IuFzvVxIOMVF9YewWAwO/k128Ionn+bm/SE6j/kyKqy1vo+T2k0r1aIaILbz
 njTSZ9hWtvfGmW0ig0FM7CoZAXzuJHqun6VgCd0z6vZWlDe8MLgkPC+ivZ/Qd9VVWf
 lOkZu0DgJ+ZShshl8XvMXEmoEvs4ea8utZcx1559KPcIf80Y3TCy1mRUMpKTLQ35II
 nhzFBt/b0dogQWjkzXUoc86wSDcn6miIw8QdVG+zX/voN7MQTvWTydAlwDMndvRAg4
 ti7oU1STd14ew==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 09/11] drm: bridge: icn6211: Add I2C configuration support
Date: Thu, 31 Mar 2022 17:05:07 +0200
Message-Id: <20220331150509.9838-10-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220331150509.9838-1-marex@denx.de>
References: <20220331150509.9838-1-marex@denx.de>
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
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ICN6211 chip starts in I2C configuration mode after cold boot.
Implement support for configuring the chip via I2C in addition to
the current DSI LP command mode configuration support. The later
seems to be available only on chips which have additional MCU on
the panel/bridge board which preconfigures the ICN6211, while the
I2C configuration mode added by this patch does not require any
such MCU.

Acked-by: Maxime Ripard <maxime@cerno.tech>
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
To: dri-devel@lists.freedesktop.org
---
V2: - Drop the abridge variable
    - Rename chipone_dsi_setup to chipone_dsi_host_attach and call
      it from chipone_i2c_probe()
V3: Add AB from Maxime
V4: - Update on top of small change in
      drm: bridge: icn6211: Add generic DSI-to-DPI PLL configuration
    - Look up host_node locally in chipone_dsi_host_attach()
    - Drop AB from Maxime
V5: Fix compile error in chipone_dsi_write()
V6: Add AB from Maxime
---
 drivers/gpu/drm/bridge/chipone-icn6211.c | 178 ++++++++++++++++++++---
 1 file changed, 156 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index 42e3581d7652..9fdc0307266d 100644
--- a/drivers/gpu/drm/bridge/chipone-icn6211.c
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -11,6 +11,7 @@
 
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/regulator/consumer.h>
@@ -133,6 +134,7 @@
 
 struct chipone {
 	struct device *dev;
+	struct i2c_client *client;
 	struct drm_bridge bridge;
 	struct drm_display_mode mode;
 	struct drm_bridge *panel_bridge;
@@ -141,6 +143,7 @@ struct chipone {
 	struct regulator *vdd1;
 	struct regulator *vdd2;
 	struct regulator *vdd3;
+	bool interface_i2c;
 };
 
 static inline struct chipone *bridge_to_chipone(struct drm_bridge *bridge)
@@ -148,12 +151,15 @@ static inline struct chipone *bridge_to_chipone(struct drm_bridge *bridge)
 	return container_of(bridge, struct chipone, bridge);
 }
 
-static inline int chipone_dsi_write(struct chipone *icn,  const void *seq,
+static inline int chipone_dsi_write(struct chipone *icn, const u8 *seq,
 				    size_t len)
 {
-	struct mipi_dsi_device *dsi = to_mipi_dsi_device(icn->dev);
-
-	return mipi_dsi_generic_write(dsi, seq, len);
+	if (icn->interface_i2c) {
+		return i2c_smbus_write_byte_data(icn->client, seq[0], seq[1]);
+	} else {
+		return mipi_dsi_generic_write(icn->dsi,
+					      (u8[]){seq[0], seq[1]}, 2);
+	}
 }
 
 #define ICN6211_DSI(icn, seq...)				\
@@ -258,7 +264,10 @@ static void chipone_atomic_enable(struct drm_bridge *bridge,
 	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
 	bus_flags = bridge_state->output_bus_cfg.flags;
 
-	ICN6211_DSI(icn, MIPI_CFG_PW, MIPI_CFG_PW_CONFIG_DSI);
+	if (icn->interface_i2c)
+		ICN6211_DSI(icn, MIPI_CFG_PW, MIPI_CFG_PW_CONFIG_I2C)
+	else
+		ICN6211_DSI(icn, MIPI_CFG_PW, MIPI_CFG_PW_CONFIG_DSI)
 
 	ICN6211_DSI(icn, HACTIVE_LI, mode->hdisplay & 0xff);
 
@@ -374,6 +383,67 @@ static void chipone_mode_set(struct drm_bridge *bridge,
 	struct chipone *icn = bridge_to_chipone(bridge);
 
 	drm_mode_copy(&icn->mode, adjusted_mode);
+};
+
+static int chipone_dsi_attach(struct chipone *icn)
+{
+	struct mipi_dsi_device *dsi = icn->dsi;
+	int ret;
+
+	dsi->lanes = 4;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0)
+		dev_err(icn->dev, "failed to attach dsi\n");
+
+	return ret;
+}
+
+static int chipone_dsi_host_attach(struct chipone *icn)
+{
+	struct device *dev = icn->dev;
+	struct device_node *host_node;
+	struct device_node *endpoint;
+	struct mipi_dsi_device *dsi;
+	struct mipi_dsi_host *host;
+	int ret = 0;
+
+	const struct mipi_dsi_device_info info = {
+		.type = "chipone",
+		.channel = 0,
+		.node = NULL,
+	};
+
+	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
+	host_node = of_graph_get_remote_port_parent(endpoint);
+	of_node_put(endpoint);
+
+	if (!host_node)
+		return -EINVAL;
+
+	host = of_find_mipi_dsi_host_by_node(host_node);
+	of_node_put(host_node);
+	if (!host) {
+		dev_err(dev, "failed to find dsi host\n");
+		return -EPROBE_DEFER;
+	}
+
+	dsi = mipi_dsi_device_register_full(host, &info);
+	if (IS_ERR(dsi)) {
+		return dev_err_probe(dev, PTR_ERR(dsi),
+				     "failed to create dsi device\n");
+	}
+
+	icn->dsi = dsi;
+
+	ret = chipone_dsi_attach(icn);
+	if (ret < 0)
+		mipi_dsi_device_unregister(dsi);
+
+	return ret;
 }
 
 static int chipone_attach(struct drm_bridge *bridge, enum drm_bridge_attach_flags flags)
@@ -466,9 +536,8 @@ static int chipone_parse_dt(struct chipone *icn)
 	return 0;
 }
 
-static int chipone_probe(struct mipi_dsi_device *dsi)
+static int chipone_common_probe(struct device *dev, struct chipone **icnr)
 {
-	struct device *dev = &dsi->dev;
 	struct chipone *icn;
 	int ret;
 
@@ -476,7 +545,6 @@ static int chipone_probe(struct mipi_dsi_device *dsi)
 	if (!icn)
 		return -ENOMEM;
 
-	mipi_dsi_set_drvdata(dsi, icn);
 	icn->dev = dev;
 
 	ret = chipone_parse_dt(icn);
@@ -486,25 +554,58 @@ static int chipone_probe(struct mipi_dsi_device *dsi)
 	icn->bridge.funcs = &chipone_bridge_funcs;
 	icn->bridge.type = DRM_MODE_CONNECTOR_DPI;
 	icn->bridge.of_node = dev->of_node;
+
+	*icnr = icn;
+
+	return ret;
+}
+
+static int chipone_dsi_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct chipone *icn;
+	int ret;
+
+	ret = chipone_common_probe(dev, &icn);
+	if (ret)
+		return ret;
+
+	icn->interface_i2c = false;
 	icn->dsi = dsi;
 
-	drm_bridge_add(&icn->bridge);
+	mipi_dsi_set_drvdata(dsi, icn);
 
-	dsi->lanes = 4;
-	dsi->format = MIPI_DSI_FMT_RGB888;
-	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
-			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
+	drm_bridge_add(&icn->bridge);
 
-	ret = mipi_dsi_attach(dsi);
-	if (ret < 0) {
+	ret = chipone_dsi_attach(icn);
+	if (ret)
 		drm_bridge_remove(&icn->bridge);
-		dev_err(dev, "failed to attach dsi\n");
-	}
 
 	return ret;
 }
 
-static int chipone_remove(struct mipi_dsi_device *dsi)
+static int chipone_i2c_probe(struct i2c_client *client,
+			     const struct i2c_device_id *id)
+{
+	struct device *dev = &client->dev;
+	struct chipone *icn;
+	int ret;
+
+	ret = chipone_common_probe(dev, &icn);
+	if (ret)
+		return ret;
+
+	icn->interface_i2c = true;
+	icn->client = client;
+	dev_set_drvdata(dev, icn);
+	i2c_set_clientdata(client, icn);
+
+	drm_bridge_add(&icn->bridge);
+
+	return chipone_dsi_host_attach(icn);
+}
+
+static int chipone_dsi_remove(struct mipi_dsi_device *dsi)
 {
 	struct chipone *icn = mipi_dsi_get_drvdata(dsi);
 
@@ -520,16 +621,49 @@ static const struct of_device_id chipone_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, chipone_of_match);
 
-static struct mipi_dsi_driver chipone_driver = {
-	.probe = chipone_probe,
-	.remove = chipone_remove,
+static struct mipi_dsi_driver chipone_dsi_driver = {
+	.probe = chipone_dsi_probe,
+	.remove = chipone_dsi_remove,
 	.driver = {
 		.name = "chipone-icn6211",
 		.owner = THIS_MODULE,
 		.of_match_table = chipone_of_match,
 	},
 };
-module_mipi_dsi_driver(chipone_driver);
+
+static struct i2c_device_id chipone_i2c_id[] = {
+	{ "chipone,icn6211" },
+	{},
+};
+MODULE_DEVICE_TABLE(i2c, chipone_i2c_id);
+
+static struct i2c_driver chipone_i2c_driver = {
+	.probe = chipone_i2c_probe,
+	.id_table = chipone_i2c_id,
+	.driver = {
+		.name = "chipone-icn6211-i2c",
+		.owner = THIS_MODULE,
+		.of_match_table = chipone_of_match,
+	},
+};
+
+static int __init chipone_init(void)
+{
+	if (IS_ENABLED(CONFIG_DRM_MIPI_DSI))
+		mipi_dsi_driver_register(&chipone_dsi_driver);
+
+	return i2c_add_driver(&chipone_i2c_driver);
+}
+module_init(chipone_init);
+
+static void __init chipone_exit(void)
+{
+	i2c_del_driver(&chipone_i2c_driver);
+
+	if (IS_ENABLED(CONFIG_DRM_MIPI_DSI))
+		mipi_dsi_driver_unregister(&chipone_dsi_driver);
+}
+module_exit(chipone_exit);
 
 MODULE_AUTHOR("Jagan Teki <jagan@amarulasolutions.com>");
 MODULE_DESCRIPTION("Chipone ICN6211 MIPI-DSI to RGB Converter Bridge");
-- 
2.35.1

