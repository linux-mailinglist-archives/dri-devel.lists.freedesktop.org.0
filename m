Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5697D125FA9
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 11:46:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD5986EB17;
	Thu, 19 Dec 2019 10:46:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42C476EB10
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 10:45:51 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A84CE12E7;
 Thu, 19 Dec 2019 11:45:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576752349;
 bh=a3ExfPE6mkonEvdDX9WP5SMg0lAr63PwRlUen4xmuAY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ReltRM1aq67UYZFblg+iHNg/PNV+Y40/yoBEF2oae6XbFryBoTNqW3fkNtd0PhjJG
 qnRvrnDqWpGvVdngKE99uSs4ZQYvk6zqUFC8TttTuarHOTbeU/2WcU2E8pYxqNrNg0
 nrP8muPTtfNgqiADs3pT6xWQ+qH82/brUFSGd9TU=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 12/51] drm/bridge: Add driver for the TI TPD12S015 HDMI
 level shifter
Date: Thu, 19 Dec 2019 12:44:43 +0200
Message-Id: <20191219104522.9379-13-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191219104522.9379-1-laurent.pinchart@ideasonboard.com>
References: <20191219104522.9379-1-laurent.pinchart@ideasonboard.com>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The TI TPD12S015 is an HDMI level shifter and ESD protector controlled
through GPIOs. Add a DRM bridge driver for the device.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
Changes since v2:

- Control CT_CP_HPD GPIO from .hpd_enable() and .hpd_disable()
- Remove unneeded hpd_gpio zero check
- Update copyright notice

Changes since v1:

- Remove empty .hpd_enable() and .hpd_disable() operations
---
 drivers/gpu/drm/bridge/Kconfig        |   8 +
 drivers/gpu/drm/bridge/Makefile       |   1 +
 drivers/gpu/drm/bridge/ti-tpd12s015.c | 211 ++++++++++++++++++++++++++
 3 files changed, 220 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/ti-tpd12s015.c

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index f14f63e0f6df..d020f120cf21 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -150,6 +150,14 @@ config DRM_TI_SN65DSI86
 	help
 	  Texas Instruments SN65DSI86 DSI to eDP Bridge driver
 
+config DRM_TI_TPD12S015
+	tristate "TI TPD12S015 HDMI level shifter and ESD protection"
+	depends on OF
+	select DRM_KMS_HELPER
+	help
+	  Texas Instruments TPD12S015 HDMI level shifter and ESD protection
+	  driver.
+
 source "drivers/gpu/drm/bridge/analogix/Kconfig"
 
 source "drivers/gpu/drm/bridge/adv7511/Kconfig"
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index bef919d3bca6..4fa7786dcc8f 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_DRM_TOSHIBA_TC358767) += tc358767.o
 obj-$(CONFIG_DRM_I2C_ADV7511) += adv7511/
 obj-$(CONFIG_DRM_TI_SN65DSI86) += ti-sn65dsi86.o
 obj-$(CONFIG_DRM_TI_TFP410) += ti-tfp410.o
+obj-$(CONFIG_DRM_TI_TPD12S015) += ti-tpd12s015.o
 
 obj-y += analogix/
 obj-y += synopsys/
diff --git a/drivers/gpu/drm/bridge/ti-tpd12s015.c b/drivers/gpu/drm/bridge/ti-tpd12s015.c
new file mode 100644
index 000000000000..514cbf0eac75
--- /dev/null
+++ b/drivers/gpu/drm/bridge/ti-tpd12s015.c
@@ -0,0 +1,211 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * TPD12S015 HDMI ESD protection & level shifter chip driver
+ *
+ * Copyright (C) 2019 Texas Instruments Incorporated
+ *
+ * Based on the omapdrm-specific encoder-opa362 driver
+ *
+ * Copyright (C) 2013 Texas Instruments Incorporated
+ * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+
+#include <drm/drm_bridge.h>
+
+struct tpd12s015_device {
+	struct drm_bridge bridge;
+
+	struct gpio_desc *ct_cp_hpd_gpio;
+	struct gpio_desc *ls_oe_gpio;
+	struct gpio_desc *hpd_gpio;
+	int hpd_irq;
+
+	struct drm_bridge *next_bridge;
+};
+
+static inline struct tpd12s015_device *to_tpd12s015(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct tpd12s015_device, bridge);
+}
+
+static int tpd12s015_attach(struct drm_bridge *bridge,
+			    enum drm_bridge_attach_flags flags)
+{
+	struct tpd12s015_device *tpd = to_tpd12s015(bridge);
+	int ret;
+
+	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
+		return -EINVAL;
+
+	ret = drm_bridge_attach(bridge->encoder, tpd->next_bridge,
+				bridge, flags);
+	if (ret < 0)
+		return ret;
+
+	gpiod_set_value_cansleep(tpd->ls_oe_gpio, 1);
+
+	/* DC-DC converter needs at max 300us to get to 90% of 5V. */
+	usleep_range(300, 1000);
+
+	return 0;
+}
+
+static void tpd12s015_detach(struct drm_bridge *bridge)
+{
+	struct tpd12s015_device *tpd = to_tpd12s015(bridge);
+
+	gpiod_set_value_cansleep(tpd->ls_oe_gpio, 0);
+}
+
+static enum drm_connector_status tpd12s015_detect(struct drm_bridge *bridge)
+{
+	struct tpd12s015_device *tpd = to_tpd12s015(bridge);
+
+	if (gpiod_get_value_cansleep(tpd->hpd_gpio))
+		return connector_status_connected;
+	else
+		return connector_status_disconnected;
+}
+
+static void tpd12s015_hpd_enable(struct drm_bridge *bridge)
+{
+	struct tpd12s015_device *tpd = to_tpd12s015(bridge);
+
+	gpiod_set_value_cansleep(tpd->ct_cp_hpd_gpio, 1);
+}
+
+static void tpd12s015_hpd_disable(struct drm_bridge *bridge)
+{
+	struct tpd12s015_device *tpd = to_tpd12s015(bridge);
+
+	gpiod_set_value_cansleep(tpd->ct_cp_hpd_gpio, 0);
+}
+
+static const struct drm_bridge_funcs tpd12s015_bridge_funcs = {
+	.attach			= tpd12s015_attach,
+	.detach			= tpd12s015_detach,
+	.detect			= tpd12s015_detect,
+	.hpd_enable		= tpd12s015_hpd_enable,
+	.hpd_disable		= tpd12s015_hpd_disable,
+};
+
+static irqreturn_t tpd12s015_hpd_isr(int irq, void *data)
+{
+	struct tpd12s015_device *tpd = data;
+	struct drm_bridge *bridge = &tpd->bridge;
+
+	drm_bridge_hpd_notify(bridge, tpd12s015_detect(bridge));
+
+	return IRQ_HANDLED;
+}
+
+static int tpd12s015_probe(struct platform_device *pdev)
+{
+	struct tpd12s015_device *tpd;
+	struct device_node *node;
+	struct gpio_desc *gpio;
+	int ret;
+
+	tpd = devm_kzalloc(&pdev->dev, sizeof(*tpd), GFP_KERNEL);
+	if (!tpd)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, tpd);
+
+	tpd->bridge.funcs = &tpd12s015_bridge_funcs;
+	tpd->bridge.of_node = pdev->dev.of_node;
+	tpd->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
+	tpd->bridge.ops = DRM_BRIDGE_OP_DETECT;
+
+	/* Get the next bridge, connected to port@1. */
+	node = of_graph_get_remote_node(pdev->dev.of_node, 1, -1);
+	if (!node)
+		return -ENODEV;
+
+	tpd->next_bridge = of_drm_find_bridge(node);
+	of_node_put(node);
+
+	if (!tpd->next_bridge)
+		return -EPROBE_DEFER;
+
+	/* Get the control and HPD GPIOs. */
+	gpio = devm_gpiod_get_index_optional(&pdev->dev, NULL, 0,
+					     GPIOD_OUT_LOW);
+	if (IS_ERR(gpio))
+		return PTR_ERR(gpio);
+
+	tpd->ct_cp_hpd_gpio = gpio;
+
+	gpio = devm_gpiod_get_index_optional(&pdev->dev, NULL, 1,
+					     GPIOD_OUT_LOW);
+	if (IS_ERR(gpio))
+		return PTR_ERR(gpio);
+
+	tpd->ls_oe_gpio = gpio;
+
+	gpio = devm_gpiod_get_index(&pdev->dev, NULL, 2, GPIOD_IN);
+	if (IS_ERR(gpio))
+		return PTR_ERR(gpio);
+
+	tpd->hpd_gpio = gpio;
+
+	/* Register the IRQ if the HPD GPIO is IRQ-capable. */
+	tpd->hpd_irq = gpiod_to_irq(tpd->hpd_gpio);
+	if (tpd->hpd_irq) {
+		ret = devm_request_threaded_irq(&pdev->dev, tpd->hpd_irq, NULL,
+						tpd12s015_hpd_isr,
+						IRQF_TRIGGER_RISING |
+						IRQF_TRIGGER_FALLING |
+						IRQF_ONESHOT,
+						"tpd12s015 hpd", tpd);
+		if (ret)
+			return ret;
+
+		tpd->bridge.ops |= DRM_BRIDGE_OP_HPD;
+	}
+
+	/* Register the DRM bridge. */
+	drm_bridge_add(&tpd->bridge);
+
+	return 0;
+}
+
+static int __exit tpd12s015_remove(struct platform_device *pdev)
+{
+	struct tpd12s015_device *tpd = platform_get_drvdata(pdev);
+
+	drm_bridge_remove(&tpd->bridge);
+
+	return 0;
+}
+
+static const struct of_device_id tpd12s015_of_match[] = {
+	{ .compatible = "ti,tpd12s015", },
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, tpd12s015_of_match);
+
+static struct platform_driver tpd12s015_driver = {
+	.probe	= tpd12s015_probe,
+	.remove	= __exit_p(tpd12s015_remove),
+	.driver	= {
+		.name	= "tpd12s015",
+		.of_match_table = tpd12s015_of_match,
+	},
+};
+
+module_platform_driver(tpd12s015_driver);
+
+MODULE_AUTHOR("Tomi Valkeinen <tomi.valkeinen@ti.com>");
+MODULE_DESCRIPTION("TPD12S015 HDMI level shifter and ESD protection driver");
+MODULE_LICENSE("GPL");
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
