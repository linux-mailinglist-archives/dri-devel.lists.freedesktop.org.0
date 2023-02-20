Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B5D69D62B
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 23:10:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1912110E7D0;
	Mon, 20 Feb 2023 22:10:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D5610E7CE
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 22:10:43 +0000 (UTC)
Received: by mail-qv1-xf32.google.com with SMTP id ks17so2789760qvb.6
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 14:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=criticallink.com; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=p2rA8r1vRndMpn7srMUnFhgGhzOj7xn+WluRQ5bsA4A=;
 b=mHzqauryxWqiJhsXX519qgC/XvVGPTToLbjIMDtRBIXlluucPcVrT4NSWn0dTQNRKc
 ohvzm1+5gQILppRAnJSmmTGiLyJxjIBpPBcRPMUB7+ub7ke4xCwq6Hdd0RapW5loHlyp
 KeGQf0HaEd6yjcWFIrHXr/iauKC3YI48KJcreUbNA65EPggcExzigbMdo6iB7UpOApm9
 F4stavSuo+gKDZuqxygYDuS45PW4o6C5xiRAvFsfIHn7eKlZFDxDGflG0YM+n7ophqVo
 ZVHMZBiNUeZDXJprspDfQEMbC0QuWyb4f7JbvbA7Qy/OifikI66Ozl17BywWfCsw862m
 nRSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p2rA8r1vRndMpn7srMUnFhgGhzOj7xn+WluRQ5bsA4A=;
 b=TZkzAcRALUYXi7s+XhdzSJOvIEk4WEzOkvF+viIVe6xWdhGQvSNxZG6vfYm7n8Is7L
 bvYRjHaR2QG0c3atJHO0TxS80ulvxHb4RIrY8NeddfyDyYBaKT2HXuzZ3Q6TSPHrGl1e
 KcXlr3yrQq1NuOoejdSCHNRBGXITj1ZOmxm0IFJtCTMI5/DWEGuoTKG9I2Efbq0CtXy8
 6c6ftD8zL4ADLPFhMMCYBEb00OvExksdToaOAnpWUuRBGKOLvtUQMDPXnRQ5ZbXNFPfM
 8OCNsOjpV/B/VQ+a1N2egqDcaLFXsV9Jfw35G3F2JPe6hlTILKwitQe4Adzsez2dFYYn
 t7Nw==
X-Gm-Message-State: AO0yUKWuLtO+hXToRMlj0UgoLFqM7nLon5zLSteD93HVZBxTkQdWNbED
 hlzQjD3n8BC+vWLLs3IVQrpUrdx1aKi8D/jD02Q=
X-Google-Smtp-Source: AK7set/czFoeb6JnB9ReubAWJwYO5jY2BrfNQhvn7PFazujdE411zye5O68lhGjhi8fh2nldd78g/A==
X-Received: by 2002:ad4:5d65:0:b0:56e:b4e0:1bfc with SMTP id
 fn5-20020ad45d65000000b0056eb4e01bfcmr6137166qvb.11.1676931042265; 
 Mon, 20 Feb 2023 14:10:42 -0800 (PST)
Received: from [127.0.1.1] (static-72-90-70-109.syrcny.fios.verizon.net.
 [72.90.70.109]) by smtp.gmail.com with ESMTPSA id
 q13-20020a05620a024d00b006f9ddaaf01esm9766986qkn.102.2023.02.20.14.10.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 14:10:41 -0800 (PST)
From: Jonathan Cormier <jcormier@criticallink.com>
Date: Mon, 20 Feb 2023 17:10:33 -0500
Subject: [PATCH v3 1/3] drm/bridge: tfp410: Support basic I2C interface
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230125-tfp410_i2c-v3-1-a85d5f0f50f1@criticallink.com>
References: <20230125-tfp410_i2c-v3-0-a85d5f0f50f1@criticallink.com>
In-Reply-To: <20230125-tfp410_i2c-v3-0-a85d5f0f50f1@criticallink.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6492;
 i=jcormier@criticallink.com; h=from:subject:message-id;
 bh=XWThcU4Z36mFj7a764RgSd+QtYAddWcIDsaMnqm/1io=;
 b=owEBbQKS/ZANAwAKAdzX/S4LNuuqAcsmYgBj8+/fbtGOndOyo0WswmdkokqdCTIFg5SdE1jlnh1q
 6nYAEvSJAjMEAAEKAB0WIQT/MozqCeZtYxNnVN/c1/0uCzbrqgUCY/Pv3wAKCRDc1/0uCzbrqoBYD/
 9OavAPgKYdYrV1zvdJ/h+Ide2dnlgqfZPL18AN//wLzU1BabFk/duIci3N5Zjw8zlQcXbDSP2sptrk
 ZsQEkdqVLvDyVVfG+gmFIum4K+wyJIqhHFqBL1s5kTSFZCCcviodW9EfKXU7TpOhMjDRg04P+P9DEy
 6haeKMJLnoG5y8UlfErBrIeH+sob0zm8fkdPYnSXMJnYGgPx0cgwwuFIyCbLn+Vv1BuDQuaacP1aRo
 3TNL2l29HJw22mAX4XeFlqalc0MC7tSrZjYRt8uabgH+Q4BsqrUn6CKiXWKlRCGdeGHPz9biC27erL
 dI/rZvdHRFsI0gt2I1MH3NgL1kVrs7Ms+mDk+DYK4La/kgdigNzGumKz2SlwaP0ZAZ16xJvIYIf74m
 kKDhWg9Yeg7ZG1DX67K3+MBZIhodD+dsrki5fX5bUq6rX0K+1EDK7WyuESRK2Ax2cMGObe3J0+eKAn
 1zi1SKVTVy+m8d9esDuALiyfpTYOIn3rECCYXrlep7rS4bZ+Z+vbYPqoTUp/OYBj5BdwJGq/RL/+9h
 wS3iR26RCRR3FEtVVesNx9lEZ2wC+HkRBLwhZKASeo3JkVLK/n+OYgA2UKVsnzeW/7shxXTHT2SQ7Y
 V0gdTH//bYrHogVDE71KkUHlgp8mzaDqO1Fbwgr4hahSGFrVQ3tWoTTLPxQA==
X-Developer-Key: i=jcormier@criticallink.com; a=openpgp;
 fpr=FF328CEA09E66D63136754DFDCD7FD2E0B36EBAA
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
Cc: Jonathan Cormier <jcormier@criticallink.com>, devicetree@vger.kernel.org,
 Bob Duke <bduke@criticallink.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Michael Williamson <michael.williamson@criticallink.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michael Williamson <michael.williamson@criticallink.com>

The TFP410 driver does not support I2C.  As such, the device remains in
Power Down if the I2C is enabled by the bootstrap pins.

Add basic support for the I2C interface, and provide support to take
the device out of power down when enabled.  Also read the bootstrap mode
pins via the CTL_1_MODE register when using the I2C bus.

Signed-off-by: Michael Williamson <michael.williamson@criticallink.com>
Signed-off-by: Jonathan Cormier <jcormier@criticallink.com>
---
 drivers/gpu/drm/bridge/ti-tfp410.c | 93 +++++++++++++++++++++++++++-----------
 1 file changed, 67 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index b9635abbad16..bb3f8d0ff207 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -6,6 +6,7 @@
 
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
+#include <linux/regmap.h>
 #include <linux/media-bus-format.h>
 #include <linux/module.h>
 #include <linux/of_graph.h>
@@ -21,6 +22,20 @@
 
 #define HOTPLUG_DEBOUNCE_MS		1100
 
+#define TFP410_REG_CTL_1_MODE	0x08
+#define TFP410_BIT_PD   BIT(0)
+#define TFP410_BIT_EDGE BIT(1)
+#define TFP410_BIT_BSEL BIT(2)
+#define TFP410_BIT_DSEL BIT(3)
+
+static const struct regmap_config tfp410_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+
+	.max_register = 0xff,
+	.cache_type = REGCACHE_NONE,
+};
+
 struct tfp410 {
 	struct drm_bridge	bridge;
 	struct drm_connector	connector;
@@ -33,6 +48,8 @@ struct tfp410 {
 	struct drm_bridge	*next_bridge;
 
 	struct device *dev;
+	struct i2c_client *i2c;
+	struct regmap *regmap;
 };
 
 static inline struct tfp410 *
@@ -183,6 +200,9 @@ static void tfp410_enable(struct drm_bridge *bridge)
 {
 	struct tfp410 *dvi = drm_bridge_to_tfp410(bridge);
 
+	if (dvi->i2c)
+		regmap_set_bits(dvi->regmap, TFP410_REG_CTL_1_MODE, TFP410_BIT_PD);
+
 	gpiod_set_value_cansleep(dvi->powerdown, 0);
 }
 
@@ -190,6 +210,9 @@ static void tfp410_disable(struct drm_bridge *bridge)
 {
 	struct tfp410 *dvi = drm_bridge_to_tfp410(bridge);
 
+	if (dvi->i2c)
+		regmap_clear_bits(dvi->regmap, TFP410_REG_CTL_1_MODE, TFP410_BIT_PD);
+
 	gpiod_set_value_cansleep(dvi->powerdown, 1);
 }
 
@@ -221,38 +244,48 @@ static const struct drm_bridge_timings tfp410_default_timings = {
 	.hold_time_ps = 1300,
 };
 
-static int tfp410_parse_timings(struct tfp410 *dvi, bool i2c)
+static int tfp410_parse_timings(struct tfp410 *dvi)
 {
 	struct drm_bridge_timings *timings = &dvi->timings;
 	struct device_node *ep;
 	u32 pclk_sample = 0;
 	u32 bus_width = 24;
 	u32 deskew = 0;
+	unsigned int val = 0;
+	int ret = 0;
 
 	/* Start with defaults. */
 	*timings = tfp410_default_timings;
 
-	if (i2c)
+	if (dvi->i2c) {
 		/*
-		 * In I2C mode timings are configured through the I2C interface.
-		 * As the driver doesn't support I2C configuration yet, we just
-		 * go with the defaults (BSEL=1, DSEL=1, DKEN=0, EDGE=1).
+		 * For now, assume settings are latched from pins on reset / power up.
+		 * Should add options to optionally set them out of DT properties.
 		 */
-		return 0;
-
-	/*
-	 * In non-I2C mode, timings are configured through the BSEL, DSEL, DKEN
-	 * and EDGE pins. They are specified in DT through endpoint properties
-	 * and vendor-specific properties.
-	 */
-	ep = of_graph_get_endpoint_by_regs(dvi->dev->of_node, 0, 0);
-	if (!ep)
-		return -EINVAL;
-
-	/* Get the sampling edge from the endpoint. */
-	of_property_read_u32(ep, "pclk-sample", &pclk_sample);
-	of_property_read_u32(ep, "bus-width", &bus_width);
-	of_node_put(ep);
+		ret = regmap_read(dvi->regmap, TFP410_REG_CTL_1_MODE, &val);
+		if (ret) {
+			dev_err(dvi->dev, "Read failed on CTL_1_MODE\n");
+			return ret;
+		}
+		pclk_sample = (val & TFP410_BIT_EDGE) ? 1 : 0;
+		bus_width = (val & TFP410_BIT_BSEL) ? 24 : 12;
+		dev_dbg(dvi->dev, "(0x%02X) : detected %d bus width, %s edge sampling\n",
+			val, bus_width, pclk_sample ? "positive" : "negative");
+	} else {
+		/*
+		 * In non-I2C mode, timings are configured through the BSEL, DSEL, DKEN
+		 * and EDGE pins. They are specified in DT through endpoint properties
+		 * and vendor-specific properties.
+		 */
+		ep = of_graph_get_endpoint_by_regs(dvi->dev->of_node, 0, 0);
+		if (!ep)
+			return -EINVAL;
+
+		/* Get the sampling edge from the endpoint. */
+		of_property_read_u32(ep, "pclk-sample", &pclk_sample);
+		of_property_read_u32(ep, "bus-width", &bus_width);
+		of_node_put(ep);
+	}
 
 	timings->input_bus_flags = DRM_BUS_FLAG_DE_HIGH;
 
@@ -291,7 +324,7 @@ static int tfp410_parse_timings(struct tfp410 *dvi, bool i2c)
 	return 0;
 }
 
-static int tfp410_init(struct device *dev, bool i2c)
+static int tfp410_init(struct device *dev, struct i2c_client *i2c)
 {
 	struct device_node *node;
 	struct tfp410 *dvi;
@@ -313,15 +346,24 @@ static int tfp410_init(struct device *dev, bool i2c)
 	dvi->bridge.of_node = dev->of_node;
 	dvi->bridge.timings = &dvi->timings;
 	dvi->bridge.type = DRM_MODE_CONNECTOR_DVID;
+	dvi->i2c = i2c;
+
+	if (i2c) {
+		dvi->regmap = devm_regmap_init_i2c(i2c, &tfp410_regmap_config);
+		if (IS_ERR(dvi->regmap))
+			return PTR_ERR(dvi->regmap);
+	}
 
-	ret = tfp410_parse_timings(dvi, i2c);
+	ret = tfp410_parse_timings(dvi);
 	if (ret)
 		return ret;
 
 	/* Get the next bridge, connected to port@1. */
 	node = of_graph_get_remote_node(dev->of_node, 1, -1);
-	if (!node)
+	if (!node) {
+		dev_err(dev, "Could not find remote node\n");
 		return -ENODEV;
+	}
 
 	dvi->next_bridge = of_drm_find_bridge(node);
 	of_node_put(node);
@@ -352,7 +394,7 @@ static void tfp410_fini(struct device *dev)
 
 static int tfp410_probe(struct platform_device *pdev)
 {
-	return tfp410_init(&pdev->dev, false);
+	return tfp410_init(&pdev->dev, NULL);
 }
 
 static int tfp410_remove(struct platform_device *pdev)
@@ -378,7 +420,6 @@ static struct platform_driver tfp410_platform_driver = {
 };
 
 #if IS_ENABLED(CONFIG_I2C)
-/* There is currently no i2c functionality. */
 static int tfp410_i2c_probe(struct i2c_client *client,
 			    const struct i2c_device_id *id)
 {
@@ -391,7 +432,7 @@ static int tfp410_i2c_probe(struct i2c_client *client,
 		return -ENXIO;
 	}
 
-	return tfp410_init(&client->dev, true);
+	return tfp410_init(&client->dev, client);
 }
 
 static void tfp410_i2c_remove(struct i2c_client *client)

-- 
2.25.1

