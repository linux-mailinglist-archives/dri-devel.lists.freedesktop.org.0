Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE7C54CFE3
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 19:30:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDB13112740;
	Wed, 15 Jun 2022 17:30:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C13B11275B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 17:30:11 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id 184so11957401pga.12
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 10:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6culLu8Dk3rzyJWu55f+Mr5Uwb5J3lBiEPJ8LAzaeEU=;
 b=efkj7DkT5itHUuSWTimca6V8Dl8BYgPcpa2YZNDQrmu3cIf6RC9eQVwsvgiC5s/Cj+
 Voz2aMekulQK0r89/sXT5fB8sfP+nMa4Kh56MgJ9o0kJTn9ch85lyVVTTDucSKFZ47pW
 oN75nop1FrxRtYmRt7+0gL5ZqE3X1kSpab7rA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6culLu8Dk3rzyJWu55f+Mr5Uwb5J3lBiEPJ8LAzaeEU=;
 b=rnCsSLHLICp3conr38uUdJ/h1A4O1sKG90DrFSlSlTgt8e1w2tCRAzhCi5O+jEV1J5
 v1Qvpvh+Bni/Wb32Rk9XJAHMWDQXFxtlaU/vfANQuraLXcsnrs30yvFaJBCvwiGGRigU
 XupKrNxesCbAXmLwR5stZsw/8l0+RlUbvmR1o1eetnHD1D6xsZSgn8P5OuRnbOr9NiMP
 Lv5Y7KM8WgvPBtS4Juc2vysgAmjF4h5lMsNeOJW13XMllJCUfeYxFOAOmzDUjQH0Fvjb
 NKbgh6UA8eB9eZ4o0TLE1Bi+Rgsb3IfoDXnvV5GtGlH/6rKxADHZ0doC5rRevFu55CKn
 tiWw==
X-Gm-Message-State: AJIora8DCOJub9153+3FMkROpk5iDZ/84U9HgQlWQR+jYb1/WP7DdcvV
 x+5qzeVO8awYM7yakwXAVMgekw==
X-Google-Smtp-Source: AGRyM1uyYuXv/zNVaSknswcFjiqrPpyY+9txa301mMTCpJQJ2mWo3Mt58qohGEwgUKir1yneBQXd+w==
X-Received: by 2002:a63:234f:0:b0:405:3981:be7 with SMTP id
 u15-20020a63234f000000b0040539810be7mr744099pgm.15.1655314210872; 
 Wed, 15 Jun 2022 10:30:10 -0700 (PDT)
Received: from pmalani.c.googlers.com.com
 (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7814a000000b005103abd2fdbsm10147433pfn.206.2022.06.15.10.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 10:30:10 -0700 (PDT)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v4 6/7] drm/bridge: anx7625: Register Type-C mode switches
Date: Wed, 15 Jun 2022 17:20:22 +0000
Message-Id: <20220615172129.1314056-7-pmalani@chromium.org>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
In-Reply-To: <20220615172129.1314056-1-pmalani@chromium.org>
References: <20220615172129.1314056-1-pmalani@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: heikki.krogerus@linux.intel.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, Jonas Karlman <jonas@kwiboo.se>,
 swboyd@chromium.org, Pin-Yen Lin <treapking@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Xin Ji <xji@analogixsemi.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Robert Foss <robert.foss@linaro.org>, Prashant Malani <pmalani@chromium.org>,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the DT node has "switches" available, register a Type-C mode-switch
for each listed "switch". This allows the driver to receive state
information about what operating mode a Type-C port and its connected
peripherals are in, as well as status information (like VDOs) related to
that state.

The callback function is currently a stub, but subsequent patches will
implement the required functionality.

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: Prashant Malani <pmalani@chromium.org>
---

Changes since v3:
- No changes.

Changes since v2:
- Updated dev_info() to dev_warn() print, but added a check to ensure it
  only triggers on non -ENODEV errors.
- Made conflict resolutions resulting from changes introduced in
  Patch v3 5/7 (add ret variable here instead of in Patch v3 5/7).
- Added Reviewed-by and Tested-by tags.

Changes since v1:
- No changes.

 drivers/gpu/drm/bridge/analogix/anx7625.c | 82 +++++++++++++++++++++--
 drivers/gpu/drm/bridge/analogix/anx7625.h |  6 ++
 2 files changed, 84 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index e3d4c2738b8c..bd21f159b973 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -15,6 +15,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <linux/usb/typec_mux.h>
 #include <linux/workqueue.h>
 
 #include <linux/of_gpio.h>
@@ -2581,10 +2582,61 @@ static void anx7625_runtime_disable(void *data)
 	pm_runtime_disable(data);
 }
 
+static int anx7625_typec_mux_set(struct typec_mux_dev *mux,
+				 struct typec_mux_state *state)
+{
+	return 0;
+}
+
+static int anx7625_register_mode_switch(struct device *dev, struct device_node *node,
+					struct anx7625_data *ctx)
+{
+	struct anx7625_port_data *port_data;
+	struct typec_mux_desc mux_desc = {};
+	char name[32];
+	u32 port_num;
+	int ret;
+
+	ret = of_property_read_u32(node, "reg", &port_num);
+	if (ret)
+		return ret;
+
+	if (port_num >= ctx->num_typec_switches) {
+		dev_err(dev, "Invalid port number specified: %d\n", port_num);
+		return -EINVAL;
+	}
+
+	port_data = &ctx->typec_ports[port_num];
+	port_data->ctx = ctx;
+	mux_desc.fwnode = &node->fwnode;
+	mux_desc.drvdata = port_data;
+	snprintf(name, sizeof(name), "%s-%u", node->name, port_num);
+	mux_desc.name = name;
+	mux_desc.set = anx7625_typec_mux_set;
+
+	port_data->typec_mux = typec_mux_register(dev, &mux_desc);
+	if (IS_ERR(port_data->typec_mux)) {
+		ret = PTR_ERR(port_data->typec_mux);
+		dev_err(dev, "Mode switch register for port %d failed: %d", port_num, ret);
+	}
+
+	return ret;
+}
+
+static void anx7625_unregister_typec_switches(struct anx7625_data *ctx)
+{
+	int i;
+
+	for (i = 0; i < ctx->num_typec_switches; i++)
+		typec_mux_unregister(ctx->typec_ports[i].typec_mux);
+}
+
 static int anx7625_register_typec_switches(struct device *device, struct anx7625_data *ctx)
 {
-	struct device_node *of = of_get_child_by_name(device->of_node, "switches");
+	struct device_node *of, *sw;
+	int ret = 0;
 
+	of = of_get_child_by_name(device->of_node, "switches");
 	if (!of)
 		return -ENODEV;
 
@@ -2592,7 +2644,27 @@ static int anx7625_register_typec_switches(struct device *device, struct anx7625
 	if (ctx->num_typec_switches <= 0)
 		return -ENODEV;
 
-	return 0;
+	ctx->typec_ports = devm_kzalloc(device,
+					ctx->num_typec_switches * sizeof(struct anx7625_port_data),
+					GFP_KERNEL);
+	if (!ctx->typec_ports)
+		return -ENOMEM;
+
+	/* Register switches for each connector. */
+	for_each_available_child_of_node(of, sw) {
+		if (!of_property_read_bool(sw, "mode-switch"))
+			continue;
+		ret = anx7625_register_mode_switch(device, sw, ctx);
+		if (ret) {
+			dev_err(device, "Failed to register mode switch: %d\n", ret);
+			break;
+		}
+	}
+
+	if (ret)
+		anx7625_unregister_typec_switches(ctx);
+
+	return ret;
 }
 
 static int anx7625_i2c_probe(struct i2c_client *client,
@@ -2701,8 +2773,8 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 		queue_work(platform->workqueue, &platform->work);
 
 	ret = anx7625_register_typec_switches(dev, platform);
-	if (ret)
-		dev_dbg(dev, "Didn't register Type C switches, err: %d\n", ret);
+	if (ret && ret != -ENODEV)
+		dev_warn(dev, "Didn't register Type C switches, err: %d\n", ret);
 
 	platform->bridge.funcs = &anx7625_bridge_funcs;
 	platform->bridge.of_node = client->dev.of_node;
@@ -2757,6 +2829,8 @@ static int anx7625_i2c_remove(struct i2c_client *client)
 
 	drm_bridge_remove(&platform->bridge);
 
+	anx7625_unregister_typec_switches(platform);
+
 	if (platform->pdata.intp_irq)
 		destroy_workqueue(platform->workqueue);
 
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
index d5cbca708842..76cfc64f7574 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.h
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
@@ -443,6 +443,11 @@ struct anx7625_i2c_client {
 	struct i2c_client *tcpc_client;
 };
 
+struct anx7625_port_data {
+	struct typec_mux_dev *typec_mux;
+	struct anx7625_data *ctx;
+};
+
 struct anx7625_data {
 	struct anx7625_platform_data pdata;
 	struct platform_device *audio_pdev;
@@ -474,6 +479,7 @@ struct anx7625_data {
 	struct mipi_dsi_device *dsi;
 	struct drm_dp_aux aux;
 	int num_typec_switches;
+	struct anx7625_port_data *typec_ports;
 };
 
 #endif  /* __ANX7625_H__ */
-- 
2.36.1.476.g0c4daa206d-goog

