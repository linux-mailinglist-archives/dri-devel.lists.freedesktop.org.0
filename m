Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F15C3147743
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2020 04:55:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D312E6FED1;
	Fri, 24 Jan 2020 03:55:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2DD46FECE
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2020 03:55:16 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 711C2380C;
 Fri, 24 Jan 2020 04:55:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1579838112;
 bh=q7SeF/aioktzO1SxOACvGlw2qg+M5fWq70FsP8Tq8EM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZAn6it9Uys1sULKEwmoN6zEmemCYAX4nZFZgiSb0oLHAh8tp05Hw8foazjhjLU/VE
 20cgU2KMHH15xFpwBjA86JNl5T2wMIuU+rNDb7OIVRX0EmoOs+neip6pUvAUhemC6w
 mbRWJPmy3aaGr+fQYjjMrzRVFyP2PF3h4OpUWQ/s=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 12/52] drm/bridge: Add bridge driver for display connectors
Date: Fri, 24 Jan 2020 05:54:05 +0200
Message-Id: <20200124035445.1830-13-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200124035445.1830-1-laurent.pinchart@ideasonboard.com>
References: <20200124035445.1830-1-laurent.pinchart@ideasonboard.com>
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

Display connectors are modelled in DT as a device node, but have so far
been handled manually in several bridge drivers. This resulted in
duplicate code in several bridge drivers, with slightly different (and
thus confusing) logics.

In order to fix this, implement a bridge driver for display connectors.
The driver centralises logic for the DVI, HDMI, VGAn composite and
S-video connectors and exposes corresponding bridge operations.

This driver in itself doesn't solve the issue completely, changes in
bridge and display controller drivers are needed to make use of the new
connector driver.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
Changes since v3:

- Turn probe confirmation message into a dev_dbg()

Changes since v2:

- Fall back to polling if the GPIO IRQ chip doesn't support
  edge-triggered interrupts

Changes since v1:

- Use drm_get_connector_type_name() instead of open-coding
  display_connector_type_name()
- Remove empty .hpd_enable() and .hpd_disable() operations
- Set bridge.ddc
---
 drivers/gpu/drm/bridge/Kconfig             |  11 +
 drivers/gpu/drm/bridge/Makefile            |   1 +
 drivers/gpu/drm/bridge/display-connector.c | 292 +++++++++++++++++++++
 3 files changed, 304 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/display-connector.c

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 09b2ca59576e..f69e7f52013e 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -27,6 +27,17 @@ config DRM_CDNS_DSI
 	  Support Cadence DPI to DSI bridge. This is an internal
 	  bridge and is meant to be directly embedded in a SoC.
 
+config DRM_DISPLAY_CONNECTOR
+	tristate "Display connector support"
+	depends on OF
+	help
+	  Driver for display connectors with support for DDC and hot-plug
+	  detection. Most display controller handle display connectors
+	  internally and don't need this driver, but the DRM subsystem is
+	  moving towards separating connector handling from display controllers
+	  on ARM-based platforms. Saying Y here when this driver is not needed
+	  will not cause any issue.
+
 config DRM_LVDS_CODEC
 	tristate "Transparent LVDS encoders and decoders support"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index 85d4d8336219..f77b34854b78 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_DRM_CDNS_DSI) += cdns-dsi.o
+obj-$(CONFIG_DRM_DISPLAY_CONNECTOR) += display-connector.o
 obj-$(CONFIG_DRM_LVDS_CODEC) += lvds-codec.o
 obj-$(CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW) += megachips-stdpxxxx-ge-b850v3-fw.o
 obj-$(CONFIG_DRM_NXP_PTN3460) += nxp-ptn3460.o
diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
new file mode 100644
index 000000000000..cce0eaec38df
--- /dev/null
+++ b/drivers/gpu/drm/bridge/display-connector.c
@@ -0,0 +1,292 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+ */
+
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+
+#include <drm/drm_bridge.h>
+#include <drm/drm_edid.h>
+
+struct display_connector {
+	struct drm_bridge	bridge;
+
+	struct gpio_desc	*hpd_gpio;
+	int			hpd_irq;
+};
+
+static inline struct display_connector *
+to_display_connector(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct display_connector, bridge);
+}
+
+static int display_connector_attach(struct drm_bridge *bridge,
+				    enum drm_bridge_attach_flags flags)
+{
+	return flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR ? 0 : -EINVAL;
+}
+
+static enum drm_connector_status
+display_connector_detect(struct drm_bridge *bridge)
+{
+	struct display_connector *conn = to_display_connector(bridge);
+
+	if (conn->hpd_gpio) {
+		if (gpiod_get_value_cansleep(conn->hpd_gpio))
+			return connector_status_connected;
+		else
+			return connector_status_disconnected;
+	}
+
+	if (conn->bridge.ddc && drm_probe_ddc(conn->bridge.ddc))
+		return connector_status_connected;
+
+	switch (conn->bridge.type) {
+	case DRM_MODE_CONNECTOR_DVIA:
+	case DRM_MODE_CONNECTOR_DVID:
+	case DRM_MODE_CONNECTOR_DVII:
+	case DRM_MODE_CONNECTOR_HDMIA:
+	case DRM_MODE_CONNECTOR_HDMIB:
+		/*
+		 * For DVI and HDMI connectors a DDC probe failure indicates
+		 * that no cable is connected.
+		 */
+		return connector_status_disconnected;
+
+	case DRM_MODE_CONNECTOR_Composite:
+	case DRM_MODE_CONNECTOR_SVIDEO:
+	case DRM_MODE_CONNECTOR_VGA:
+	default:
+		/*
+		 * Composite and S-Video connectors have no other detection
+		 * mean than the HPD GPIO. For VGA connectors, even if we have
+		 * an I2C bus, we can't assume that the cable is disconnected
+		 * if drm_probe_ddc fails, as some cables don't wire the DDC
+		 * pins.
+		 */
+		return connector_status_unknown;
+	}
+}
+
+static struct edid *display_connector_get_edid(struct drm_bridge *bridge,
+					       struct drm_connector *connector)
+{
+	struct display_connector *conn = to_display_connector(bridge);
+
+	return drm_get_edid(connector, conn->bridge.ddc);
+}
+
+static const struct drm_bridge_funcs display_connector_bridge_funcs = {
+	.attach = display_connector_attach,
+	.detect = display_connector_detect,
+	.get_edid = display_connector_get_edid,
+};
+
+static irqreturn_t display_connector_hpd_irq(int irq, void *arg)
+{
+	struct display_connector *conn = arg;
+	struct drm_bridge *bridge = &conn->bridge;
+
+	drm_bridge_hpd_notify(bridge, display_connector_detect(bridge));
+
+	return IRQ_HANDLED;
+}
+
+static int display_connector_probe(struct platform_device *pdev)
+{
+	struct display_connector *conn;
+	unsigned int type;
+	const char *label;
+	int ret;
+
+	conn = devm_kzalloc(&pdev->dev, sizeof(*conn), GFP_KERNEL);
+	if (!conn)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, conn);
+
+	type = (uintptr_t)of_device_get_match_data(&pdev->dev);
+
+	/* Get the exact connector type. */
+	switch (type) {
+	case DRM_MODE_CONNECTOR_DVII: {
+		bool analog, digital;
+
+		analog = of_property_read_bool(pdev->dev.of_node, "analog");
+		digital = of_property_read_bool(pdev->dev.of_node, "digital");
+		if (analog && !digital) {
+			conn->bridge.type = DRM_MODE_CONNECTOR_DVIA;
+		} else if (!analog && digital) {
+			conn->bridge.type = DRM_MODE_CONNECTOR_DVID;
+		} else if (analog && digital) {
+			conn->bridge.type = DRM_MODE_CONNECTOR_DVII;
+		} else {
+			dev_err(&pdev->dev, "DVI connector with no type\n");
+			return -EINVAL;
+		}
+		break;
+	}
+
+	case DRM_MODE_CONNECTOR_HDMIA: {
+		const char *hdmi_type;
+
+		ret = of_property_read_string(pdev->dev.of_node, "type",
+					      &hdmi_type);
+		if (ret < 0) {
+			dev_err(&pdev->dev, "HDMI connector with no type\n");
+			return -EINVAL;
+		}
+
+		if (!strcmp(hdmi_type, "a") || !strcmp(hdmi_type, "c") ||
+		    !strcmp(hdmi_type, "d") || !strcmp(hdmi_type, "e")) {
+			conn->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
+		} else if (!strcmp(hdmi_type, "b")) {
+			conn->bridge.type = DRM_MODE_CONNECTOR_HDMIB;
+		} else {
+			dev_err(&pdev->dev,
+				"Unsupported HDMI connector type '%s'\n",
+				hdmi_type);
+			return -EINVAL;
+		}
+
+		break;
+	}
+
+	default:
+		conn->bridge.type = type;
+		break;
+	}
+
+	/* Get the optional connector label. */
+	of_property_read_string(pdev->dev.of_node, "label", &label);
+
+	/*
+	 * Get the HPD GPIO for DVI and HDMI connectors. If the GPIO can provide
+	 * edge interrupts, register an interrupt handler.
+	 */
+	if (type == DRM_MODE_CONNECTOR_DVII ||
+	    type == DRM_MODE_CONNECTOR_HDMIA) {
+		conn->hpd_gpio = devm_gpiod_get_optional(&pdev->dev, "hpd",
+							 GPIOD_IN);
+		if (IS_ERR(conn->hpd_gpio)) {
+			if (PTR_ERR(conn->hpd_gpio) != -EPROBE_DEFER)
+				dev_err(&pdev->dev,
+					"Unable to retrieve HPD GPIO\n");
+			return PTR_ERR(conn->hpd_gpio);
+		}
+
+		conn->hpd_irq = gpiod_to_irq(conn->hpd_gpio);
+	} else {
+		conn->hpd_irq = -EINVAL;
+	}
+
+	if (conn->hpd_irq >= 0) {
+		ret = devm_request_threaded_irq(&pdev->dev, conn->hpd_irq,
+						NULL, display_connector_hpd_irq,
+						IRQF_TRIGGER_RISING |
+						IRQF_TRIGGER_FALLING |
+						IRQF_ONESHOT,
+						"HPD", conn);
+		if (ret) {
+			dev_info(&pdev->dev,
+				 "Failed to request HPD edge interrupt, falling back to polling\n");
+			conn->hpd_irq = -EINVAL;
+		}
+	}
+
+	/* Retrieve the DDC I2C adapter for DVI, HDMI and VGA connectors. */
+	if (type == DRM_MODE_CONNECTOR_DVII ||
+	    type == DRM_MODE_CONNECTOR_HDMIA ||
+	    type == DRM_MODE_CONNECTOR_VGA) {
+		struct device_node *phandle;
+
+		phandle = of_parse_phandle(pdev->dev.of_node, "ddc-i2c-bus", 0);
+		if (phandle) {
+			conn->bridge.ddc = of_get_i2c_adapter_by_node(phandle);
+			of_node_put(phandle);
+			if (!conn->bridge.ddc)
+				return -EPROBE_DEFER;
+		} else {
+			dev_dbg(&pdev->dev,
+				"No I2C bus specified, disabling EDID readout\n");
+		}
+	}
+
+	conn->bridge.funcs = &display_connector_bridge_funcs;
+	conn->bridge.of_node = pdev->dev.of_node;
+
+	if (conn->bridge.ddc)
+		conn->bridge.ops |= DRM_BRIDGE_OP_EDID
+				 |  DRM_BRIDGE_OP_DETECT;
+	if (conn->hpd_gpio)
+		conn->bridge.ops |= DRM_BRIDGE_OP_DETECT;
+	if (conn->hpd_irq >= 0)
+		conn->bridge.ops |= DRM_BRIDGE_OP_HPD;
+
+	dev_dbg(&pdev->dev,
+		"Found %s display connector '%s' %s DDC bus and %s HPD GPIO (ops 0x%x)\n",
+		drm_get_connector_type_name(conn->bridge.type),
+		label ? label : "<unlabelled>",
+		conn->bridge.ddc ? "with" : "without",
+		conn->hpd_gpio ? "with" : "without",
+		conn->bridge.ops);
+
+	drm_bridge_add(&conn->bridge);
+
+	return 0;
+}
+
+static int display_connector_remove(struct platform_device *pdev)
+{
+	struct display_connector *conn = platform_get_drvdata(pdev);
+
+	drm_bridge_remove(&conn->bridge);
+
+	if (!IS_ERR(conn->bridge.ddc))
+		i2c_put_adapter(conn->bridge.ddc);
+
+	return 0;
+}
+
+static const struct of_device_id display_connector_match[] = {
+	{
+		.compatible = "composite-video-connector",
+		.data = (void *)DRM_MODE_CONNECTOR_Composite,
+	}, {
+		.compatible = "dvi-connector",
+		.data = (void *)DRM_MODE_CONNECTOR_DVII,
+	}, {
+		.compatible = "hdmi-connector",
+		.data = (void *)DRM_MODE_CONNECTOR_HDMIA,
+	}, {
+		.compatible = "svideo-connector",
+		.data = (void *)DRM_MODE_CONNECTOR_SVIDEO,
+	}, {
+		.compatible = "vga-connector",
+		.data = (void *)DRM_MODE_CONNECTOR_VGA,
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, display_connector_match);
+
+static struct platform_driver display_connector_driver = {
+	.probe	= display_connector_probe,
+	.remove	= display_connector_remove,
+	.driver		= {
+		.name		= "display-connector",
+		.of_match_table	= display_connector_match,
+	},
+};
+module_platform_driver(display_connector_driver);
+
+MODULE_AUTHOR("Laurent Pinchart <laurent.pinchart@ideasonboard.com>");
+MODULE_DESCRIPTION("Display connector driver");
+MODULE_LICENSE("GPL");
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
