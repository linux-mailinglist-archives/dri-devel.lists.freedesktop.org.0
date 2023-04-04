Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 927956D68BA
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 18:27:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 997FE10E703;
	Tue,  4 Apr 2023 16:27:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E4C010E71A
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 16:27:13 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id hf2so32088261qtb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 09:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=criticallink.com; s=google; t=1680625632;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=S11u5DTA9h019l0IrQX+AN9OVNLb/rYYX+LKhYQ8rHU=;
 b=RASK7vLMEox4wcrZx3WZ1lA9nJRdmq6+T1OSO7Vhf7DudPiE7VgGm2Tm1HvCrAkkqa
 llLuE3qdsEVHFfqrLAnYFSV7D9M2DeQ7+JybpsxxpOGfWNY9q7xDVsn0MgykC4jH+HBI
 BLrsWNgnPsWdfx5hKtAThkfL78drNr9HaC0s6AfqIHP7RJKp7VsLKtNwccbCZE3HxkWf
 nhAfsaI0qt0LEU7ZCnn7aASy/VozpUv8O/0OmpHi8uLJSK8b/nPNTkNUyhMCnRn+grNS
 gyKG/OEWOj/aXu2JMkCmhUQwO9+KEMsLigfCQ0VmVi7F2vZi3eVNK34GHJxA+/3oupZT
 TaPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680625632;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S11u5DTA9h019l0IrQX+AN9OVNLb/rYYX+LKhYQ8rHU=;
 b=R4nS8PB98+w4QOZCHttHPQzNJAaclaOyh7epdcrY3sQTUoJACBK4na259QUuJFW9XG
 kfVFy98f2zrCjipmvspDe6Jt6hrt5+eJjsPLLvjZ3bPoMCH+ioWUYoGxp7icojZ8u/J3
 VcxeuTK/FlonwnOrVHvS/5c9Iz3lFjny5sm8gGP6RYS9vsRGL+NBYRTRSTOMVvvJUo9G
 x4UX9Jlr1KIgVGtLhdKfrPQTPsm8ZMo205Mlc7+i3twIlP+8yPeDcmvDAm6GHflXSpwW
 wT9tgmCaY7YG8N1yT9sVrFBWZFQtNjYpYX84MIGAUK2hk0yE3FqQfFfhbMt++6vrgJ8d
 jMBg==
X-Gm-Message-State: AAQBX9fFbSF9t8FNGApLTDQeZbwJqgzwzH979+63oVHkrEUgd9nyif1/
 ogRG0FXIGzCWR3TN7FizsrEkvA==
X-Google-Smtp-Source: AKy350actmNHw+OyMbNEwx6gUmFQOFhGfhU/+Fzp3SZHvwL73rlPQnYRTsAzJaWkBS1Vay65lg3gjw==
X-Received: by 2002:ac8:7fd5:0:b0:3e6:3929:e9ba with SMTP id
 b21-20020ac87fd5000000b003e63929e9bamr4362000qtk.66.1680625631766; 
 Tue, 04 Apr 2023 09:27:11 -0700 (PDT)
Received: from [127.0.1.1] (static-72-90-70-109.syrcny.fios.verizon.net.
 [72.90.70.109]) by smtp.gmail.com with ESMTPSA id
 m124-20020a375882000000b0073b8745fd39sm3699594qkb.110.2023.04.04.09.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 09:27:09 -0700 (PDT)
From: Jonathan Cormier <jcormier@criticallink.com>
Date: Tue, 04 Apr 2023 12:26:48 -0400
Subject: [PATCH v4 1/3] drm/bridge: tfp410: Support basic I2C interface
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230125-tfp410_i2c-v4-1-f983bcef2df8@criticallink.com>
References: <20230125-tfp410_i2c-v4-0-f983bcef2df8@criticallink.com>
In-Reply-To: <20230125-tfp410_i2c-v4-0-f983bcef2df8@criticallink.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6549;
 i=jcormier@criticallink.com; h=from:subject:message-id;
 bh=21jXZ+7XjoAljy4+OPvocGx/SSsnd1AKvRiNCdogF0A=;
 b=owEBbQKS/ZANAwAKAdzX/S4LNuuqAcsmYgBkLE/YFOKfMh9uwiFGyBNIIlSBVft4zR400ef4C0pF
 I+hykreJAjMEAAEKAB0WIQT/MozqCeZtYxNnVN/c1/0uCzbrqgUCZCxP2AAKCRDc1/0uCzbrqqU5EA
 CAnTpvqp0nQNk60kh6QCPyzN2jqhlAAV/WBwd8awLa/p++tjdMpwZIUZq93gwe1TlYws64v2Cp0T2n
 ruuQugpUea1Ln+Df1rPys/YhMWnURAblLw9BATgxu+1oO8R+NisIOvlUA3NtiK8o2RM4x2Ai1D3qxA
 PfcPbwaWTZ4b/zrKGpfn9PTnxV8k6PGM8oLMvSZ4fOrDGJsi5BSEm9kkS+zZtCvxs4O+sGAPPNRNe6
 56Le4k5D5f8U/Dx7rzG5KHpdARVABivIfQafNlVCDaeiQvc1isH/nZq9HEWH9oZpfvsUEC7pnOhbwv
 iKxISytMHft3XXDQxmKcfVIcDMxTkvqvuscFz88DGJ4kqwuDZDXlx4nHsQakB/Dr4Yw2gZE9uCJ8Wk
 Raph0G3xn01pe+EjvWmt8eM69TbQ6fHjIAJ1chqcWxMm2i2UrjeyIQkrpNB+KBVLcDHl/IOT+p0cR7
 rrKgGaN0k+xDA7UtDl6Z3C99KqB+Whskxtdty8JwxKn2w4OxWYQMq1ieFGWhWaDONvr0sF7aHwqM01
 st0i6ON3U6Md69Zh5bJWjVHV/8wKu97B2Os6X7BWrLRgtI72bRMlvzyCwZLtc1Xl5cpgnUyPdzL9n3
 AdyMjXehj9EZs6ypXPVRfigvR5utZUtiXwusm8m9nOk7B/hbPQ1V9QU8N64g==
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
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
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

