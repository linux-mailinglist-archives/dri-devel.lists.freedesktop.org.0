Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A512D17E76E
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 19:44:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 176B66E516;
	Mon,  9 Mar 2020 18:44:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA786E516
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 18:44:41 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 284382D2;
 Mon,  9 Mar 2020 19:44:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1583779479;
 bh=FnaPKi9FUuBRyh+Indsj53Bc8KOQnLpvFfR//w1MQto=;
 h=From:To:Cc:Subject:Date:From;
 b=jDUJkbpb5MKBYu3BjJZEmesnlBJOucBWIl7nMDFCmFBl2Mf1RRF8gciKA6rRH7gw0
 mEfeu8YjrQC+KeBx9WCMfsLE1crZSSkZpLsqIsw2YZVcoKQyw7EKgpo8szM3MKh29u
 k2YBdfzhsG4YJ5LcJWeIdThxtdNs+m+Z3wA037bA=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: bridge: tfp410: Check device ID for I2C-connected TFP410
Date: Mon,  9 Mar 2020 20:44:32 +0200
Message-Id: <20200309184432.10293-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
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
 drivers/gpu/drm/bridge/ti-tfp410.c | 133 +++++++++++++++++++++++++----
 1 file changed, 115 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index f195a4732e0b..1404d1f0b1d2 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -12,6 +12,7 @@
 #include <linux/module.h>
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
@@ -32,6 +33,7 @@ struct tfp410 {
 	int			hpd_irq;
 	struct delayed_work	hpd_work;
 	struct gpio_desc	*powerdown;
+	struct regmap		*regmap;
 
 	struct drm_bridge_timings timings;
 
@@ -201,7 +203,7 @@ static const struct drm_bridge_timings tfp410_default_timings = {
 	.hold_time_ps = 1300,
 };
 
-static int tfp410_parse_timings(struct tfp410 *dvi, bool i2c)
+static int tfp410_parse_timings(struct tfp410 *dvi)
 {
 	struct drm_bridge_timings *timings = &dvi->timings;
 	struct device_node *ep;
@@ -212,7 +214,7 @@ static int tfp410_parse_timings(struct tfp410 *dvi, bool i2c)
 	/* Start with defaults. */
 	*timings = tfp410_default_timings;
 
-	if (i2c)
+	if (dvi->regmap)
 		/*
 		 * In I2C mode timings are configured through the I2C interface.
 		 * As the driver doesn't support I2C configuration yet, we just
@@ -314,9 +316,9 @@ static int tfp410_get_connector_properties(struct tfp410 *dvi)
 	return ret;
 }
 
-static int tfp410_init(struct device *dev, bool i2c)
+static int tfp410_init(struct tfp410 *dvi)
 {
-	struct tfp410 *dvi;
+	struct device *dev = dvi->dev;
 	int ret;
 
 	if (!dev->of_node) {
@@ -324,17 +326,13 @@ static int tfp410_init(struct device *dev, bool i2c)
 		return -ENXIO;
 	}
 
-	dvi = devm_kzalloc(dev, sizeof(*dvi), GFP_KERNEL);
-	if (!dvi)
-		return -ENOMEM;
 	dev_set_drvdata(dev, dvi);
 
 	dvi->bridge.funcs = &tfp410_bridge_funcs;
 	dvi->bridge.of_node = dev->of_node;
 	dvi->bridge.timings = &dvi->timings;
-	dvi->dev = dev;
 
-	ret = tfp410_parse_timings(dvi, i2c);
+	ret = tfp410_parse_timings(dvi);
 	if (ret)
 		goto fail;
 
@@ -396,7 +394,15 @@ static int tfp410_fini(struct device *dev)
 
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
@@ -420,20 +426,111 @@ static struct platform_driver tfp410_platform_driver = {
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
