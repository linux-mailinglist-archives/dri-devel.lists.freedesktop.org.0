Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B8E66BC6E
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 12:08:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E861910E3C9;
	Mon, 16 Jan 2023 11:08:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 674CF10E3C7
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 11:08:37 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id c6so30005843pls.4
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 03:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MsvXLO2LYgwrnisIBmhtUopgzlBZbEZ9q2CJUnQASFU=;
 b=jZHjclFFTN0lRqOF+89ClWqRX1oUTkgGLOjH/COUNSuLdHxmbhEaGXwnyUszMIBc2Y
 9PNg7kYoSl76o6nHKi4SmCGe6OTTF78uMSn3T94qr1toSq+ZTiEUUOUDiItwRikXYU43
 rtE6s9pWWJbzbBQMAPPiXA6Yq7uzYhz5OmYLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MsvXLO2LYgwrnisIBmhtUopgzlBZbEZ9q2CJUnQASFU=;
 b=a525DWAxWz9vIXUauuNL7yEYA3a+dEmRd5pNyTM6s2gxwUUm+qgn8sM0ye4Es5Q9e/
 wr0ePj88eqFj3hdnXt19tBLqyeqjvv1CTa5N8cyXAC10EcADqpLcK/v0M7nQ/OOKI6Hx
 eoLinIsLuIgYtxgTdP18qdvy7qMQ+btpUQm5vjD5i3I9h5V/bQF7DBszesOZ5BPwivUD
 ClrwCgcbgaaGrmm2ebUkYh2aTTHCOrZta2EgfLGpSkjjN8964ot0JqFB32MAzuUFF35O
 oJLQ9Jt/E2aSIOyTrKUnBYN8QsMmjFoKSs0OJ34csS5TCBefUSP3T0kPZDwnAQE+eGoJ
 KAHw==
X-Gm-Message-State: AFqh2ko5rIPFMDob7F1/hLb18NWIxBzM0WVZrl9PFJBwj3o3w8FlVuuO
 ukEFCI+4+AfSkTMCb7/MZMEKLw==
X-Google-Smtp-Source: AMrXdXs7sZF20EwrOSd/udSpFKMG+YWv5OfX+8QSfkMx/v6NRPXCaLivCKVs96K/psgoK7zovgOrZw==
X-Received: by 2002:a17:90b:2747:b0:21a:1b9b:139e with SMTP id
 qi7-20020a17090b274700b0021a1b9b139emr93039821pjb.8.1673867316896; 
 Mon, 16 Jan 2023 03:08:36 -0800 (PST)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:a3f3:9ba9:fe36:fbcb])
 by smtp.gmail.com with ESMTPSA id
 i8-20020a17090a138800b00226369149cesm17993686pja.21.2023.01.16.03.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 03:08:36 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 2/2] drm: bridge: Generic GPIO mux driver
Date: Mon, 16 Jan 2023 19:08:20 +0800
Message-Id: <20230116110820.2615650-3-treapking@chromium.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
In-Reply-To: <20230116110820.2615650-1-treapking@chromium.org>
References: <20230116110820.2615650-1-treapking@chromium.org>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Pin-yen Lin <treapking@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nicolas Boichat <drinkcat@chromium.org>

This driver supports single input, 2 output display mux (e.g.
HDMI mux), that provide its status via a GPIO.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---
Laurent in v1 pointed out that the driver doesn't support panels as a
downstream. IIUC this can be done by using drm_of_find_panel_or_bridge
callback, but we don't have the hardware for this use case for testing.

Changes in v2:
- Dropped attach/mode_set/enable/disable callbacks
- Fixed style issues
- Removed the special case for the HDMI connector
- Made the driver only read the GPIO status in IRQ handler
- Rebased to drm-misc-next
- Updated the license: "GPL v2" --> "GPL"

 drivers/gpu/drm/bridge/Kconfig            |  10 ++
 drivers/gpu/drm/bridge/Makefile           |   1 +
 drivers/gpu/drm/bridge/generic-gpio-mux.c | 201 ++++++++++++++++++++++
 3 files changed, 212 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/generic-gpio-mux.c

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 57946d80b02d..28f2221bc900 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -84,6 +84,16 @@ config DRM_FSL_LDB
 	help
 	  Support for i.MX8MP DPI-to-LVDS on-SoC encoder.
 
+config DRM_GENERIC_GPIO_MUX
+	tristate "Generic GPIO-controlled mux"
+	depends on OF
+	select DRM_KMS_HELPER
+	help
+	  This bridge driver models a GPIO-controlled display mux with one
+	  input, 2 outputs (e.g. an HDMI mux). The hardware decides which output
+	  is active, reports it as a GPIO, and the driver redirects calls to the
+	  appropriate downstream bridge (if any).
+
 config DRM_ITE_IT6505
         tristate "ITE IT6505 DisplayPort bridge"
         depends on OF
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index 1884803c6860..f5cfab100e8a 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -5,6 +5,7 @@ obj-$(CONFIG_DRM_CHRONTEL_CH7033) += chrontel-ch7033.o
 obj-$(CONFIG_DRM_CROS_EC_ANX7688) += cros-ec-anx7688.o
 obj-$(CONFIG_DRM_DISPLAY_CONNECTOR) += display-connector.o
 obj-$(CONFIG_DRM_FSL_LDB) += fsl-ldb.o
+obj-$(CONFIG_DRM_GENERIC_GPIO_MUX) += generic-gpio-mux.o
 obj-$(CONFIG_DRM_ITE_IT6505) += ite-it6505.o
 obj-$(CONFIG_DRM_LONTIUM_LT8912B) += lontium-lt8912b.o
 obj-$(CONFIG_DRM_LONTIUM_LT9211) += lontium-lt9211.o
diff --git a/drivers/gpu/drm/bridge/generic-gpio-mux.c b/drivers/gpu/drm/bridge/generic-gpio-mux.c
new file mode 100644
index 000000000000..9c26abab7778
--- /dev/null
+++ b/drivers/gpu/drm/bridge/generic-gpio-mux.c
@@ -0,0 +1,201 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Generic gpio mux bridge driver
+ *
+ * Copyright 2016 Google LLC
+ */
+
+#include <linux/gpio.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_gpio.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+
+#include <drm/drm_bridge.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_probe_helper.h>
+
+struct gpio_display_mux {
+	struct device *dev;
+
+	struct gpio_desc *gpiod_detect;
+	int detect_irq;
+	int cur_next;
+
+	struct drm_bridge bridge;
+
+	struct drm_bridge *next[2];
+};
+
+static inline struct gpio_display_mux *bridge_to_gpio_display_mux(
+		struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct gpio_display_mux, bridge);
+}
+
+static irqreturn_t gpio_display_mux_det_threaded_handler(int unused, void *data)
+{
+	struct gpio_display_mux *mux = data;
+	int active = gpiod_get_value(mux->gpiod_detect);
+
+	if (active < 0) {
+		dev_err(mux->dev, "Failed to get detect GPIO\n");
+		return IRQ_HANDLED;
+	}
+
+	dev_dbg(mux->dev, "Interrupt %d!\n", active);
+	mux->cur_next = active;
+
+	if (mux->bridge.dev)
+		drm_kms_helper_hotplug_event(mux->bridge.dev);
+
+	return IRQ_HANDLED;
+}
+
+static bool gpio_display_mux_mode_fixup(struct drm_bridge *bridge,
+				const struct drm_display_mode *mode,
+				struct drm_display_mode *adjusted_mode)
+{
+	struct gpio_display_mux *mux = bridge_to_gpio_display_mux(bridge);
+	struct drm_bridge *next;
+
+	next = mux->next[mux->cur_next];
+
+	/* Assume that we have a most one bridge in both downstreams */
+	if (next && next->funcs->mode_fixup)
+		return next->funcs->mode_fixup(next, mode, adjusted_mode);
+
+	return true;
+}
+
+static const struct drm_bridge_funcs gpio_display_mux_bridge_funcs = {
+	.mode_fixup = gpio_display_mux_mode_fixup,
+};
+
+static int gpio_display_mux_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct gpio_display_mux *mux;
+	struct device_node *port, *ep, *remote;
+	int ret;
+	u32 reg;
+
+	mux = devm_kzalloc(dev, sizeof(*mux), GFP_KERNEL);
+	if (!mux)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, mux);
+	mux->dev = &pdev->dev;
+
+	mux->bridge.of_node = dev->of_node;
+
+	mux->gpiod_detect = devm_gpiod_get(dev, "detect", GPIOD_IN);
+	if (IS_ERR(mux->gpiod_detect))
+		return PTR_ERR(mux->gpiod_detect);
+
+	mux->detect_irq = gpiod_to_irq(mux->gpiod_detect);
+	if (mux->detect_irq < 0) {
+		dev_err(dev, "Failed to get output irq %d\n",
+			mux->detect_irq);
+		return -ENODEV;
+	}
+
+	port = of_graph_get_port_by_id(dev->of_node, 1);
+	if (!port) {
+		dev_err(dev, "Missing output port node\n");
+		return -EINVAL;
+	}
+
+	for_each_child_of_node(port, ep) {
+		if (!ep->name || (of_node_cmp(ep->name, "endpoint") != 0)) {
+			of_node_put(ep);
+			continue;
+		}
+
+		if (of_property_read_u32(ep, "reg", &reg) < 0 ||
+		    reg >= ARRAY_SIZE(mux->next)) {
+			dev_err(dev,
+				"Missing/invalid reg property for endpoint %s\n",
+				ep->full_name);
+			of_node_put(ep);
+			of_node_put(port);
+			return -EINVAL;
+		}
+
+		remote = of_graph_get_remote_port_parent(ep);
+		if (!remote) {
+			dev_err(dev,
+				"Missing connector/bridge node for endpoint %s\n",
+				ep->full_name);
+			of_node_put(ep);
+			of_node_put(port);
+			return -EINVAL;
+		}
+
+		mux->next[reg] = of_drm_find_bridge(remote);
+		if (!mux->next[reg]) {
+			dev_err(dev, "Waiting for external bridge %s\n",
+				remote->name);
+			of_node_put(ep);
+			of_node_put(remote);
+			of_node_put(port);
+			return -EPROBE_DEFER;
+		}
+
+		of_node_put(remote);
+	}
+	of_node_put(port);
+
+	mux->bridge.funcs = &gpio_display_mux_bridge_funcs;
+	mux->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
+	drm_bridge_add(&mux->bridge);
+
+	ret = devm_request_threaded_irq(dev, mux->detect_irq, NULL,
+					gpio_display_mux_det_threaded_handler,
+					IRQF_TRIGGER_RISING |
+					IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
+					"gpio-display-mux-det", mux);
+	if (ret) {
+		dev_err(dev, "Failed to request MUX_DET threaded irq\n");
+		goto err_bridge_remove;
+	}
+
+	return 0;
+
+err_bridge_remove:
+	drm_bridge_remove(&mux->bridge);
+
+	return ret;
+}
+
+static int gpio_display_mux_remove(struct platform_device *pdev)
+{
+	struct gpio_display_mux *mux = platform_get_drvdata(pdev);
+
+	disable_irq(mux->detect_irq);
+	drm_bridge_remove(&mux->bridge);
+
+	return 0;
+}
+
+static const struct of_device_id gpio_display_mux_match[] = {
+	{ .compatible = "gpio-display-mux", },
+	{},
+};
+
+struct platform_driver gpio_display_mux_driver = {
+	.probe = gpio_display_mux_probe,
+	.remove = gpio_display_mux_remove,
+	.driver = {
+		.name = "gpio-display-mux",
+		.of_match_table = gpio_display_mux_match,
+	},
+};
+
+module_platform_driver(gpio_display_mux_driver);
+
+MODULE_DESCRIPTION("GPIO-controlled display mux");
+MODULE_AUTHOR("Nicolas Boichat <drinkcat@chromium.org>");
+MODULE_LICENSE("GPL");
-- 
2.39.0.314.g84b9a713c41-goog

