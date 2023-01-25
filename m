Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3154E67BE1F
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 22:22:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A192E10E8A6;
	Wed, 25 Jan 2023 21:21:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com
 [IPv6:2607:f8b0:4864:20::e32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4C9010E122
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 21:09:20 +0000 (UTC)
Received: by mail-vs1-xe32.google.com with SMTP id 3so21076767vsq.7
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 13:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=criticallink.com; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CoORX2qT8KsLgQJjE1ct6lyWG6kv2kixmCqMoh8qJXo=;
 b=QcLgSlHdcDxGf+qpVByR8C773P04A4qpawKGwbw4ewGUlB453uQc5keHWWpTCUV9Cv
 DVnng/U6kCWLhfaw/IxmUX9r+r5Nlx38R0yqBnB0XMGHYdXo3mQX8vMvjOmxJp3sqjJq
 pyPK/9b9mna03B8eDIPIVoEYEyxxJDaZgmD9UzqTBEqtBYnBj4dmG3/MewhhNfdOAyMS
 NsR2Wk4YWPXEig7BZaGL60ClS6qKPN5LtJ4T84HJI6zfmp3lcs87prOvBSOZ0kfdOoqv
 5nYto+pO/Cb4lC4VE17xyNAEw3bl0i0VXgfj1rqZS1qKK14vaxmQIvPSTMVgj/lkLn2Q
 /oQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CoORX2qT8KsLgQJjE1ct6lyWG6kv2kixmCqMoh8qJXo=;
 b=mQHcrDZDOYsTXT6prf3XRK0ErlXOXkWu7zyxc0pypgibruPQsSqj775zD3xd2a2NEg
 sQ3HTQzjRijX6HJNs4SdFyR7w4dhR+wyJ98Edo8Xr6sE7l5IWdtobIgXG5xD3goFG2j8
 vpYgvlIouRVxkGmTfMwZurr0/Y8RFjcVgbqVJ5sCCQbDsW8Ykpw3QIfB6BA0BcPpoRUs
 UVC+eHOMIOPbD1W6wJC0DkPMfqRdWLewxzt2FQB7fY9UFtBeBE/an0tSHkeZ8gE6uo02
 KqBjrd1vsdd3831P4MlWDmCrkUKApGHyfkg5I9XBmUBtC362miWmh1uWJLcBhDmbv6tv
 lpWQ==
X-Gm-Message-State: AO0yUKV35EJ3XkVAv222huwSBudCriq8G5u644lAPWwGvEInUo3eq4yt
 Snn+cOzQ/rtVJe59AcsVgcodsw==
X-Google-Smtp-Source: AK7set88rgKkpeUswsyGDOnBmgdF7dY8MzczVQYBpyLGr9q23x/8MYN337gCq+EwerC8IQYquiNgDA==
X-Received: by 2002:a05:6102:94d:b0:3e8:152e:3cf9 with SMTP id
 a13-20020a056102094d00b003e8152e3cf9mr4606692vsi.23.1674680959800; 
 Wed, 25 Jan 2023 13:09:19 -0800 (PST)
Received: from [127.0.1.1] (static-72-90-70-109.syrcny.fios.verizon.net.
 [72.90.70.109]) by smtp.gmail.com with ESMTPSA id
 q196-20020a3743cd000000b0070736988c10sm4177090qka.110.2023.01.25.13.09.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 13:09:18 -0800 (PST)
From: Jonathan Cormier <jcormier@criticallink.com>
Date: Wed, 25 Jan 2023 16:09:10 -0500
Subject: [PATCH 2/4] DRM: BRIDGE: TFP410: Support basic I2C interface
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230125-tfp410_i2c-v1-2-66a4d4e390b7@criticallink.com>
References: <20230125-tfp410_i2c-v1-0-66a4d4e390b7@criticallink.com>
In-Reply-To: <20230125-tfp410_i2c-v1-0-66a4d4e390b7@criticallink.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>
X-Mailer: b4 0.11.3-dev-d001f
X-Developer-Signature: v=1; a=openpgp-sha256; l=6795;
 i=jcormier@criticallink.com; h=from:subject:message-id;
 bh=3CSuTbFCeCLVpZgKlKSDCr9WJDIrZoWYhYxHZvRNRcc=;
 b=owEBbQKS/ZANAwAKAdzX/S4LNuuqAcsmYgBj0Zp7qUtXiXM4ecobzuoX+GaBUQancmttiP/Mov+2
 PQxtnX+JAjMEAAEKAB0WIQT/MozqCeZtYxNnVN/c1/0uCzbrqgUCY9GaewAKCRDc1/0uCzbrqk/qEA
 CE+Ihd65TsFnyYoy2u6/qk6K/p4qt57q5raMWzL0s71WDzwhjHJWCld/C23OdbvloCHLEut+OYqggp
 tEikXqd6jWS2OJgbyVpUyXmXq/Z539fFn5zvt+A8lRNWJ9s7txT5kqGah72B2i3Q/LCExS3fGprJV4
 VOal7eM3DrDR7QI3rPfKR0s2cPKRW7hNFF2uJLcyMBfMmvi63piuN7UIu//ATaOZtaR6JtviFU5Dgh
 SyHyf02GB6ARF6gONql2r+sswDFv92vyJUYkE2bKx/ggQKip7cKFTH30VJ9tL3NqLyvSytciPYsLpg
 PVX8rJHhjTmb3yZBUeeynIb6SfTHBQmwaD7udHxN//fYmmkcb1RLbwdqwcftrZCsb2Rqrp5vOTmbiL
 Hz6WkNatXdSR/EU2Z3jZY9XOQLjKMHAY0GENyBw3tzfJ2bfeY0F5ZEk5T1R/A/UVD5TPCglzwl6BZp
 Jk8GnrDps1UNFRTGPLevUZDMipX+Bj6RaIfFx6vjeClJgzeMBD+CJ85Z5JkpNmyuE5BlP2tapQaZDC
 TaY5Ma3pb1KoT/5Xq02HlXQtP6AS3AKL/T7rllwEeuUVWeZedgrP/UXsbWcYaKjGJSUetBz5OQmq3a
 TAj3gW1QyA3EDXX+9hJZ2/ta1vJ/IDD3JnwyyznuvWiFnsE3ohdkE+iaZ+NQ==
X-Developer-Key: i=jcormier@criticallink.com; a=openpgp;
 fpr=FF328CEA09E66D63136754DFDCD7FD2E0B36EBAA
X-Mailman-Approved-At: Wed, 25 Jan 2023 21:21:46 +0000
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
 drivers/gpu/drm/bridge/ti-tfp410.c | 95 +++++++++++++++++++++++++++-----------
 1 file changed, 68 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index b9635abbad16..323a6d9ed188 100644
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
@@ -408,7 +449,7 @@ MODULE_DEVICE_TABLE(i2c, tfp410_i2c_ids);
 static struct i2c_driver tfp410_i2c_driver = {
 	.driver = {
 		.name	= "tfp410",
-		.of_match_table = of_match_ptr(tfp410_match),
+		.of_match_table = tfp410_match,
 	},
 	.id_table	= tfp410_i2c_ids,
 	.probe		= tfp410_i2c_probe,

-- 
2.25.1
