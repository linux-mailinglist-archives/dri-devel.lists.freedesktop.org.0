Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4853117EA30
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 21:37:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A35356E58E;
	Mon,  9 Mar 2020 20:37:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 182826E58E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 20:37:45 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 69E312D2;
 Mon,  9 Mar 2020 21:37:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1583786263;
 bh=IRidg4uJLbaajePrraoh+e+quxqoEWLAizbqKNiJaHk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gwyccNNmwd7dDopDntVSa2eifSOq2ni4jTwbGmS0UFD/7+9xYrxZ59h5zNnInrV5h
 0l9lr8QRVAyElwmCuhpA220guSze1W47vDAQwML/+vszTnSyiNfnYEhTW265EBgrUA
 e7E6RSud0PQ/Y7qANmNlGPAM108RBxRdcf/Glhe8=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm: bridge: tfp410: Check device ID for I2C-connected
 TFP410
Date: Mon,  9 Mar 2020 22:37:36 +0200
Message-Id: <20200309203736.32695-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200309184432.10293-1-laurent.pinchart@ideasonboard.com>
References: <20200309184432.10293-1-laurent.pinchart@ideasonboard.com>
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
Cc: Andrzej Hajda <a.hajda@samsung.com>, Jyri Sarha <jsarha@ti.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The TFP410 supports configuration through I2C (in which case the
corresponding DT node is a child of an I2C controller) or through pins
(in which case the DT node creates a platform device). When I2C access
to the device is available, read and validate the device ID at probe
time to ensure that the device is present.

While at it, sort headers alphabetically.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
This time based on drm-misc-next instead of v5.6-rc5, with conflicts
resolved.

 drivers/gpu/drm/bridge/ti-tfp410.c | 134 +++++++++++++++++++++++++----
 1 file changed, 115 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index 40c4d4a5517b..be8d74ff632b 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -9,6 +9,7 @@
 #include <linux/module.h>
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/workqueue.h>
 
 #include <drm/drm_atomic_helper.h>
@@ -26,6 +27,7 @@ struct tfp410 {
 	u32			bus_format;
 	struct delayed_work	hpd_work;
 	struct gpio_desc	*powerdown;
+	struct regmap		*regmap;
 
 	struct drm_bridge_timings timings;
 	struct drm_bridge	*next_bridge;
@@ -213,7 +215,7 @@ static const struct drm_bridge_timings tfp410_default_timings = {
 	.hold_time_ps = 1300,
 };
 
-static int tfp410_parse_timings(struct tfp410 *dvi, bool i2c)
+static int tfp410_parse_timings(struct tfp410 *dvi)
 {
 	struct drm_bridge_timings *timings = &dvi->timings;
 	struct device_node *ep;
@@ -224,7 +226,7 @@ static int tfp410_parse_timings(struct tfp410 *dvi, bool i2c)
 	/* Start with defaults. */
 	*timings = tfp410_default_timings;
 
-	if (i2c)
+	if (dvi->regmap)
 		/*
 		 * In I2C mode timings are configured through the I2C interface.
 		 * As the driver doesn't support I2C configuration yet, we just
@@ -283,10 +285,10 @@ static int tfp410_parse_timings(struct tfp410 *dvi, bool i2c)
 	return 0;
 }
 
-static int tfp410_init(struct device *dev, bool i2c)
+static int tfp410_init(struct tfp410 *dvi)
 {
 	struct device_node *node;
-	struct tfp410 *dvi;
+	struct device *dev = dvi->dev;
 	int ret;
 
 	if (!dev->of_node) {
@@ -294,11 +296,6 @@ static int tfp410_init(struct device *dev, bool i2c)
 		return -ENXIO;
 	}
 
-	dvi = devm_kzalloc(dev, sizeof(*dvi), GFP_KERNEL);
-	if (!dvi)
-		return -ENOMEM;
-
-	dvi->dev = dev;
 	dev_set_drvdata(dev, dvi);
 
 	dvi->bridge.funcs = &tfp410_bridge_funcs;
@@ -306,7 +303,7 @@ static int tfp410_init(struct device *dev, bool i2c)
 	dvi->bridge.timings = &dvi->timings;
 	dvi->bridge.type = DRM_MODE_CONNECTOR_DVID;
 
-	ret = tfp410_parse_timings(dvi, i2c);
+	ret = tfp410_parse_timings(dvi);
 	if (ret)
 		return ret;
 
@@ -346,7 +343,15 @@ static int tfp410_fini(struct device *dev)
 
 static int tfp410_probe(struct platform_device *pdev)
 {
-	return tfp410_init(&pdev->dev, false);
+	struct tfp410 *dvi;
+
+	dvi = devm_kzalloc(&pdev->dev, sizeof(*dvi), GFP_KERNEL);
+	if (!dvi)
+		return -ENOMEM;
+
+	dvi->dev = &pdev->dev;
+
+	return tfp410_init(dvi);
 }
 
 static int tfp410_remove(struct platform_device *pdev)
@@ -370,20 +375,111 @@ static struct platform_driver tfp410_platform_driver = {
 };
 
 #if IS_ENABLED(CONFIG_I2C)
-/* There is currently no i2c functionality. */
+
+#define TFP410_VEN_ID_LO		0x00
+#define TFP410_VEN_ID_HI		0x01
+#define TFP410_DEV_ID_LO		0x02
+#define TFP410_DEV_ID_HI		0x03
+#define TFP410_REV_ID			0x04
+#define TFP410_CTL_1_MODE		0x08
+#define TFP410_CTL_2_MODE		0x09
+#define TFP410_CTL_3_MODE		0x0a
+#define TFP410_CFG			0x0b
+#define TFP410_DE_DLY			0x32
+#define TFP410_DE_CTL			0x33
+#define TFP410_DE_TOP			0x34
+#define TFP410_DE_CNT_LO		0x36
+#define TFP410_DE_CNT_HI		0x37
+#define TFP410_DE_LIN_LO		0x38
+#define TFP410_DE_LIN_HI		0x39
+#define TFP410_H_RES_LO			0x3a
+#define TFP410_H_RES_HI			0x3b
+#define TFP410_V_RES_LO			0x3c
+#define TFP410_V_RES_HI			0x3d
+
+static const struct regmap_config tfp410_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+
+	.max_register = 0x3d,
+	.wr_table = &(const struct regmap_access_table) {
+		.yes_ranges = (const struct regmap_range[]) {
+			{
+				.range_min = TFP410_CTL_1_MODE,
+				.range_max = TFP410_DE_LIN_HI,
+			},
+		},
+		.n_yes_ranges = 1,
+	},
+};
+
+static int tfp410_check_version(struct tfp410 *dvi)
+{
+	unsigned int value;
+	u16 vendor_id;
+	u16 device_id;
+	u8 revision_id;
+	int ret;
+
+	ret = regmap_read(dvi->regmap, TFP410_VEN_ID_LO, &value);
+	if (ret < 0)
+		return ret;
+	vendor_id = value;
+
+	ret = regmap_read(dvi->regmap, TFP410_VEN_ID_HI, &value);
+	if (ret < 0)
+		return ret;
+	vendor_id |= value << 8;
+
+	ret = regmap_read(dvi->regmap, TFP410_DEV_ID_LO, &value);
+	if (ret < 0)
+		return ret;
+	device_id = value;
+
+	ret = regmap_read(dvi->regmap, TFP410_DEV_ID_HI, &value);
+	if (ret < 0)
+		return ret;
+	device_id |= value << 8;
+
+	ret = regmap_read(dvi->regmap, TFP410_REV_ID, &value);
+	if (ret < 0)
+		return ret;
+	revision_id = value;
+
+	if (vendor_id != 0x014c || device_id != 0x0410) {
+		dev_err(dvi->dev, "invalid device ID %04x:%04x\n",
+			vendor_id, device_id);
+		return -ENODEV;
+	}
+
+	dev_info(dvi->dev, "Found TFP410 revision 0x%02x\n", revision_id);
+
+	return 0;
+}
+
 static int tfp410_i2c_probe(struct i2c_client *client,
 			    const struct i2c_device_id *id)
 {
-	int reg;
+	struct tfp410 *dvi;
+	int ret;
 
-	if (!client->dev.of_node ||
-	    of_property_read_u32(client->dev.of_node, "reg", &reg)) {
-		dev_err(&client->dev,
-			"Can't get i2c reg property from device-tree\n");
-		return -ENXIO;
+	dvi = devm_kzalloc(&client->dev, sizeof(*dvi), GFP_KERNEL);
+	if (!dvi)
+		return -ENOMEM;
+
+	dvi->dev = &client->dev;
+
+	dvi->regmap = devm_regmap_init_i2c(client, &tfp410_regmap_config);
+	if (IS_ERR(dvi->regmap))
+		return PTR_ERR(dvi->regmap);
+
+	ret = tfp410_check_version(dvi);
+	if (ret < 0) {
+		dev_err(dvi->dev, "failed to read device ID (%d)\n", ret);
+		return ret;
 	}
 
-	return tfp410_init(&client->dev, true);
+	return tfp410_init(dvi);
 }
 
 static int tfp410_i2c_remove(struct i2c_client *client)
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
