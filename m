Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32367160687
	for <lists+dri-devel@lfdr.de>; Sun, 16 Feb 2020 22:04:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF6526E4C1;
	Sun, 16 Feb 2020 21:04:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB516E47A
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2020 21:04:04 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0575F5B2;
 Sun, 16 Feb 2020 22:04:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1581887043;
 bh=9DBQUI+obdGaMEKAhSBbDPK4D3Lv7pGe/QCEPyCFqnE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gW99nJKcH22gzS5ZGgVxe+w1D5zvGt03M0KteOI1Ws4vPjgYfCOur6PIIxL7F53gE
 5ZjbbnZnABvvN/OqLnORqzX3fniLcNCcjEGI0SXGSOYtKGVLeKCg/OxxJMjAx8Fbo+
 771DO/y/eezVasg6785w/SfoSwLtQo03E5lo3VUU=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 36/51] drm/omap: Switch the HDMI and VENC outputs to
 drm_bridge
Date: Sun, 16 Feb 2020 23:02:53 +0200
Message-Id: <20200216210308.17312-37-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200216210308.17312-1-laurent.pinchart@ideasonboard.com>
References: <20200216210308.17312-1-laurent.pinchart@ideasonboard.com>
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

The TPD12S015, OPA362 and analog and HDMI connectors are now supported
by DRM bridge drivers, and the omapdrm HDMI and VENC outputs can be
handled through the drm_bridge API. Switch the outputs to drm_bridge by
making the next bridge mandatory and removing the related
omapdrm-specific display drivers.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
Changes since v3:

- Update arch/arm/configs/omap2plus_defconfig
---
 arch/arm/configs/omap2plus_defconfig          |   7 +-
 drivers/gpu/drm/omapdrm/displays/Kconfig      |  22 --
 drivers/gpu/drm/omapdrm/displays/Makefile     |   4 -
 .../omapdrm/displays/connector-analog-tv.c    |  97 --------
 .../gpu/drm/omapdrm/displays/connector-hdmi.c | 183 ---------------
 .../gpu/drm/omapdrm/displays/encoder-opa362.c | 137 -----------
 .../drm/omapdrm/displays/encoder-tpd12s015.c  | 217 ------------------
 drivers/gpu/drm/omapdrm/dss/hdmi4.c           |   4 +-
 drivers/gpu/drm/omapdrm/dss/hdmi5.c           |   4 +-
 .../gpu/drm/omapdrm/dss/omapdss-boot-init.c   |   5 -
 drivers/gpu/drm/omapdrm/dss/output.c          |   5 +
 drivers/gpu/drm/omapdrm/dss/venc.c            |   4 +-
 12 files changed, 14 insertions(+), 675 deletions(-)
 delete mode 100644 drivers/gpu/drm/omapdrm/displays/connector-analog-tv.c
 delete mode 100644 drivers/gpu/drm/omapdrm/displays/connector-hdmi.c
 delete mode 100644 drivers/gpu/drm/omapdrm/displays/encoder-opa362.c
 delete mode 100644 drivers/gpu/drm/omapdrm/displays/encoder-tpd12s015.c

diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index 8c37cc8ab6f2..a74abf4ac468 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -348,14 +348,13 @@ CONFIG_DRM_OMAP=m
 CONFIG_OMAP5_DSS_HDMI=y
 CONFIG_OMAP2_DSS_SDI=y
 CONFIG_OMAP2_DSS_DSI=y
-CONFIG_DRM_OMAP_ENCODER_OPA362=m
-CONFIG_DRM_OMAP_ENCODER_TPD12S015=m
-CONFIG_DRM_OMAP_CONNECTOR_HDMI=m
-CONFIG_DRM_OMAP_CONNECTOR_ANALOG_TV=m
 CONFIG_DRM_OMAP_PANEL_DSI_CM=m
 CONFIG_DRM_TILCDC=m
 CONFIG_DRM_PANEL_SIMPLE=m
+CONFIG_DRM_DISPLAY_CONNECTOR=m
+CONFIG_DRM_SIMPLE_BRIDGE=m
 CONFIG_DRM_TI_TFP410=m
+CONFIG_DRM_TI_TPD12S015=m
 CONFIG_DRM_PANEL_LG_LB035Q02=m
 CONFIG_DRM_PANEL_NEC_NL8048HL11=m
 CONFIG_DRM_PANEL_SHARP_LS037V7DW01=m
diff --git a/drivers/gpu/drm/omapdrm/displays/Kconfig b/drivers/gpu/drm/omapdrm/displays/Kconfig
index b562a8cd61bf..f2be594c7eff 100644
--- a/drivers/gpu/drm/omapdrm/displays/Kconfig
+++ b/drivers/gpu/drm/omapdrm/displays/Kconfig
@@ -1,28 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 menu "OMAPDRM External Display Device Drivers"
 
-config DRM_OMAP_ENCODER_OPA362
-	tristate "OPA362 external analog amplifier"
-	help
-	  Driver for OPA362 external analog TV amplifier controlled
-	  through a GPIO.
-
-config DRM_OMAP_ENCODER_TPD12S015
-	tristate "TPD12S015 HDMI ESD protection and level shifter"
-	help
-	  Driver for TPD12S015, which offers HDMI ESD protection and level
-	  shifting.
-
-config DRM_OMAP_CONNECTOR_HDMI
-	tristate "HDMI Connector"
-	help
-	  Driver for a generic HDMI connector.
-
-config DRM_OMAP_CONNECTOR_ANALOG_TV
-	tristate "Analog TV Connector"
-	help
-	  Driver for a generic analog TV connector.
-
 config DRM_OMAP_PANEL_DSI_CM
 	tristate "Generic DSI Command Mode Panel"
 	depends on BACKLIGHT_CLASS_DEVICE
diff --git a/drivers/gpu/drm/omapdrm/displays/Makefile b/drivers/gpu/drm/omapdrm/displays/Makefile
index cb76859dc574..488ddf153613 100644
--- a/drivers/gpu/drm/omapdrm/displays/Makefile
+++ b/drivers/gpu/drm/omapdrm/displays/Makefile
@@ -1,6 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_DRM_OMAP_ENCODER_OPA362) += encoder-opa362.o
-obj-$(CONFIG_DRM_OMAP_ENCODER_TPD12S015) += encoder-tpd12s015.o
-obj-$(CONFIG_DRM_OMAP_CONNECTOR_HDMI) += connector-hdmi.o
-obj-$(CONFIG_DRM_OMAP_CONNECTOR_ANALOG_TV) += connector-analog-tv.o
 obj-$(CONFIG_DRM_OMAP_PANEL_DSI_CM) += panel-dsi-cm.o
diff --git a/drivers/gpu/drm/omapdrm/displays/connector-analog-tv.c b/drivers/gpu/drm/omapdrm/displays/connector-analog-tv.c
deleted file mode 100644
index f36aa1885d39..000000000000
--- a/drivers/gpu/drm/omapdrm/displays/connector-analog-tv.c
+++ /dev/null
@@ -1,97 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Analog TV Connector driver
- *
- * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com/
- * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
- */
-
-#include <linux/slab.h>
-#include <linux/module.h>
-#include <linux/platform_device.h>
-#include <linux/of.h>
-
-#include "../dss/omapdss.h"
-
-struct panel_drv_data {
-	struct omap_dss_device dssdev;
-
-	struct device *dev;
-};
-
-#define to_panel_data(x) container_of(x, struct panel_drv_data, dssdev)
-
-static int tvc_connect(struct omap_dss_device *src,
-		       struct omap_dss_device *dst)
-{
-	return 0;
-}
-
-static void tvc_disconnect(struct omap_dss_device *src,
-			   struct omap_dss_device *dst)
-{
-}
-
-static const struct omap_dss_device_ops tvc_ops = {
-	.connect		= tvc_connect,
-	.disconnect		= tvc_disconnect,
-};
-
-static int tvc_probe(struct platform_device *pdev)
-{
-	struct panel_drv_data *ddata;
-	struct omap_dss_device *dssdev;
-
-	ddata = devm_kzalloc(&pdev->dev, sizeof(*ddata), GFP_KERNEL);
-	if (!ddata)
-		return -ENOMEM;
-
-	platform_set_drvdata(pdev, ddata);
-	ddata->dev = &pdev->dev;
-
-	dssdev = &ddata->dssdev;
-	dssdev->ops = &tvc_ops;
-	dssdev->dev = &pdev->dev;
-	dssdev->type = OMAP_DISPLAY_TYPE_VENC;
-	dssdev->display = true;
-	dssdev->owner = THIS_MODULE;
-	dssdev->of_port = 0;
-
-	omapdss_display_init(dssdev);
-	omapdss_device_register(dssdev);
-
-	return 0;
-}
-
-static int __exit tvc_remove(struct platform_device *pdev)
-{
-	struct panel_drv_data *ddata = platform_get_drvdata(pdev);
-
-	omapdss_device_unregister(&ddata->dssdev);
-
-	return 0;
-}
-
-static const struct of_device_id tvc_of_match[] = {
-	{ .compatible = "omapdss,svideo-connector", },
-	{ .compatible = "omapdss,composite-video-connector", },
-	{},
-};
-
-MODULE_DEVICE_TABLE(of, tvc_of_match);
-
-static struct platform_driver tvc_connector_driver = {
-	.probe	= tvc_probe,
-	.remove	= __exit_p(tvc_remove),
-	.driver	= {
-		.name	= "connector-analog-tv",
-		.of_match_table = tvc_of_match,
-		.suppress_bind_attrs = true,
-	},
-};
-
-module_platform_driver(tvc_connector_driver);
-
-MODULE_AUTHOR("Tomi Valkeinen <tomi.valkeinen@ti.com>");
-MODULE_DESCRIPTION("Analog TV Connector driver");
-MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/omapdrm/displays/connector-hdmi.c b/drivers/gpu/drm/omapdrm/displays/connector-hdmi.c
deleted file mode 100644
index 37c212491cd3..000000000000
--- a/drivers/gpu/drm/omapdrm/displays/connector-hdmi.c
+++ /dev/null
@@ -1,183 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * HDMI Connector driver
- *
- * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com/
- * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
- */
-
-#include <linux/gpio/consumer.h>
-#include <linux/module.h>
-#include <linux/mutex.h>
-#include <linux/platform_device.h>
-#include <linux/slab.h>
-
-#include "../dss/omapdss.h"
-
-struct panel_drv_data {
-	struct omap_dss_device dssdev;
-	void (*hpd_cb)(void *cb_data, enum drm_connector_status status);
-	void *hpd_cb_data;
-	struct mutex hpd_lock;
-
-	struct device *dev;
-
-	struct gpio_desc *hpd_gpio;
-};
-
-#define to_panel_data(x) container_of(x, struct panel_drv_data, dssdev)
-
-static int hdmic_connect(struct omap_dss_device *src,
-			 struct omap_dss_device *dst)
-{
-	return 0;
-}
-
-static void hdmic_disconnect(struct omap_dss_device *src,
-			     struct omap_dss_device *dst)
-{
-}
-
-static bool hdmic_detect(struct omap_dss_device *dssdev)
-{
-	struct panel_drv_data *ddata = to_panel_data(dssdev);
-
-	return gpiod_get_value_cansleep(ddata->hpd_gpio);
-}
-
-static void hdmic_register_hpd_cb(struct omap_dss_device *dssdev,
-				  void (*cb)(void *cb_data,
-					    enum drm_connector_status status),
-				  void *cb_data)
-{
-	struct panel_drv_data *ddata = to_panel_data(dssdev);
-
-	mutex_lock(&ddata->hpd_lock);
-	ddata->hpd_cb = cb;
-	ddata->hpd_cb_data = cb_data;
-	mutex_unlock(&ddata->hpd_lock);
-}
-
-static void hdmic_unregister_hpd_cb(struct omap_dss_device *dssdev)
-{
-	struct panel_drv_data *ddata = to_panel_data(dssdev);
-
-	mutex_lock(&ddata->hpd_lock);
-	ddata->hpd_cb = NULL;
-	ddata->hpd_cb_data = NULL;
-	mutex_unlock(&ddata->hpd_lock);
-}
-
-static const struct omap_dss_device_ops hdmic_ops = {
-	.connect		= hdmic_connect,
-	.disconnect		= hdmic_disconnect,
-
-	.detect			= hdmic_detect,
-	.register_hpd_cb	= hdmic_register_hpd_cb,
-	.unregister_hpd_cb	= hdmic_unregister_hpd_cb,
-};
-
-static irqreturn_t hdmic_hpd_isr(int irq, void *data)
-{
-	struct panel_drv_data *ddata = data;
-
-	mutex_lock(&ddata->hpd_lock);
-	if (ddata->hpd_cb) {
-		enum drm_connector_status status;
-
-		if (hdmic_detect(&ddata->dssdev))
-			status = connector_status_connected;
-		else
-			status = connector_status_disconnected;
-
-		ddata->hpd_cb(ddata->hpd_cb_data, status);
-	}
-	mutex_unlock(&ddata->hpd_lock);
-
-	return IRQ_HANDLED;
-}
-
-static int hdmic_probe(struct platform_device *pdev)
-{
-	struct panel_drv_data *ddata;
-	struct omap_dss_device *dssdev;
-	struct gpio_desc *gpio;
-	int r;
-
-	ddata = devm_kzalloc(&pdev->dev, sizeof(*ddata), GFP_KERNEL);
-	if (!ddata)
-		return -ENOMEM;
-
-	platform_set_drvdata(pdev, ddata);
-	ddata->dev = &pdev->dev;
-
-	mutex_init(&ddata->hpd_lock);
-
-	/* HPD GPIO */
-	gpio = devm_gpiod_get_optional(&pdev->dev, "hpd", GPIOD_IN);
-	if (IS_ERR(gpio)) {
-		dev_err(&pdev->dev, "failed to parse HPD gpio\n");
-		return PTR_ERR(gpio);
-	}
-
-	ddata->hpd_gpio = gpio;
-
-	if (ddata->hpd_gpio) {
-		r = devm_request_threaded_irq(&pdev->dev,
-				gpiod_to_irq(ddata->hpd_gpio),
-				NULL, hdmic_hpd_isr,
-				IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING |
-				IRQF_ONESHOT,
-				"hdmic hpd", ddata);
-		if (r)
-			return r;
-	}
-
-	dssdev = &ddata->dssdev;
-	dssdev->ops = &hdmic_ops;
-	dssdev->dev = &pdev->dev;
-	dssdev->type = OMAP_DISPLAY_TYPE_HDMI;
-	dssdev->display = true;
-	dssdev->owner = THIS_MODULE;
-	dssdev->of_port = 0;
-	dssdev->ops_flags = ddata->hpd_gpio
-			  ? OMAP_DSS_DEVICE_OP_DETECT | OMAP_DSS_DEVICE_OP_HPD
-			  : 0;
-
-	omapdss_display_init(dssdev);
-	omapdss_device_register(dssdev);
-
-	return 0;
-}
-
-static int __exit hdmic_remove(struct platform_device *pdev)
-{
-	struct panel_drv_data *ddata = platform_get_drvdata(pdev);
-
-	omapdss_device_unregister(&ddata->dssdev);
-
-	return 0;
-}
-
-static const struct of_device_id hdmic_of_match[] = {
-	{ .compatible = "omapdss,hdmi-connector", },
-	{},
-};
-
-MODULE_DEVICE_TABLE(of, hdmic_of_match);
-
-static struct platform_driver hdmi_connector_driver = {
-	.probe	= hdmic_probe,
-	.remove	= __exit_p(hdmic_remove),
-	.driver	= {
-		.name	= "connector-hdmi",
-		.of_match_table = hdmic_of_match,
-		.suppress_bind_attrs = true,
-	},
-};
-
-module_platform_driver(hdmi_connector_driver);
-
-MODULE_AUTHOR("Tomi Valkeinen <tomi.valkeinen@ti.com>");
-MODULE_DESCRIPTION("HDMI Connector driver");
-MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/omapdrm/displays/encoder-opa362.c b/drivers/gpu/drm/omapdrm/displays/encoder-opa362.c
deleted file mode 100644
index 252705222ef1..000000000000
--- a/drivers/gpu/drm/omapdrm/displays/encoder-opa362.c
+++ /dev/null
@@ -1,137 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * OPA362 analog video amplifier with output/power control
- *
- * Copyright (C) 2014 Golden Delicious Computers
- * Author: H. Nikolaus Schaller <hns@goldelico.com>
- *
- * based on encoder-tfp410
- *
- * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com/
- * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
- */
-
-#include <linux/gpio/consumer.h>
-#include <linux/module.h>
-#include <linux/platform_device.h>
-#include <linux/slab.h>
-
-#include "../dss/omapdss.h"
-
-struct panel_drv_data {
-	struct omap_dss_device dssdev;
-
-	struct gpio_desc *enable_gpio;
-};
-
-#define to_panel_data(x) container_of(x, struct panel_drv_data, dssdev)
-
-static int opa362_connect(struct omap_dss_device *src,
-			  struct omap_dss_device *dst)
-{
-	return omapdss_device_connect(dst->dss, dst, dst->next);
-}
-
-static void opa362_disconnect(struct omap_dss_device *src,
-			      struct omap_dss_device *dst)
-{
-	omapdss_device_disconnect(dst, dst->next);
-}
-
-static void opa362_enable(struct omap_dss_device *dssdev)
-{
-	struct panel_drv_data *ddata = to_panel_data(dssdev);
-
-	if (ddata->enable_gpio)
-		gpiod_set_value_cansleep(ddata->enable_gpio, 1);
-}
-
-static void opa362_disable(struct omap_dss_device *dssdev)
-{
-	struct panel_drv_data *ddata = to_panel_data(dssdev);
-
-	if (ddata->enable_gpio)
-		gpiod_set_value_cansleep(ddata->enable_gpio, 0);
-}
-
-static const struct omap_dss_device_ops opa362_ops = {
-	.connect	= opa362_connect,
-	.disconnect	= opa362_disconnect,
-	.enable		= opa362_enable,
-	.disable	= opa362_disable,
-};
-
-static int opa362_probe(struct platform_device *pdev)
-{
-	struct panel_drv_data *ddata;
-	struct omap_dss_device *dssdev;
-	struct gpio_desc *gpio;
-
-	dev_dbg(&pdev->dev, "probe\n");
-
-	ddata = devm_kzalloc(&pdev->dev, sizeof(*ddata), GFP_KERNEL);
-	if (!ddata)
-		return -ENOMEM;
-
-	platform_set_drvdata(pdev, ddata);
-
-	gpio = devm_gpiod_get_optional(&pdev->dev, "enable", GPIOD_OUT_LOW);
-	if (IS_ERR(gpio))
-		return PTR_ERR(gpio);
-
-	ddata->enable_gpio = gpio;
-
-	dssdev = &ddata->dssdev;
-	dssdev->ops = &opa362_ops;
-	dssdev->dev = &pdev->dev;
-	dssdev->type = OMAP_DISPLAY_TYPE_VENC;
-	dssdev->owner = THIS_MODULE;
-	dssdev->of_port = 1;
-
-	dssdev->next = omapdss_of_find_connected_device(pdev->dev.of_node, 1);
-	if (IS_ERR(dssdev->next)) {
-		if (PTR_ERR(dssdev->next) != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "failed to find video sink\n");
-		return PTR_ERR(dssdev->next);
-	}
-
-	omapdss_device_register(dssdev);
-
-	return 0;
-}
-
-static int __exit opa362_remove(struct platform_device *pdev)
-{
-	struct panel_drv_data *ddata = platform_get_drvdata(pdev);
-	struct omap_dss_device *dssdev = &ddata->dssdev;
-
-	if (dssdev->next)
-		omapdss_device_put(dssdev->next);
-	omapdss_device_unregister(&ddata->dssdev);
-
-	opa362_disable(dssdev);
-
-	return 0;
-}
-
-static const struct of_device_id opa362_of_match[] = {
-	{ .compatible = "omapdss,ti,opa362", },
-	{},
-};
-MODULE_DEVICE_TABLE(of, opa362_of_match);
-
-static struct platform_driver opa362_driver = {
-	.probe	= opa362_probe,
-	.remove	= __exit_p(opa362_remove),
-	.driver	= {
-		.name	= "amplifier-opa362",
-		.of_match_table = opa362_of_match,
-		.suppress_bind_attrs = true,
-	},
-};
-
-module_platform_driver(opa362_driver);
-
-MODULE_AUTHOR("H. Nikolaus Schaller <hns@goldelico.com>");
-MODULE_DESCRIPTION("OPA362 analog video amplifier with output/power control");
-MODULE_LICENSE("GPL v2");
diff --git a/drivers/gpu/drm/omapdrm/displays/encoder-tpd12s015.c b/drivers/gpu/drm/omapdrm/displays/encoder-tpd12s015.c
deleted file mode 100644
index 857ae84cd7d1..000000000000
--- a/drivers/gpu/drm/omapdrm/displays/encoder-tpd12s015.c
+++ /dev/null
@@ -1,217 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * TPD12S015 HDMI ESD protection & level shifter chip driver
- *
- * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com/
- * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
- */
-
-#include <linux/completion.h>
-#include <linux/delay.h>
-#include <linux/module.h>
-#include <linux/slab.h>
-#include <linux/platform_device.h>
-#include <linux/gpio/consumer.h>
-#include <linux/mutex.h>
-
-#include "../dss/omapdss.h"
-
-struct panel_drv_data {
-	struct omap_dss_device dssdev;
-	void (*hpd_cb)(void *cb_data, enum drm_connector_status status);
-	void *hpd_cb_data;
-	struct mutex hpd_lock;
-
-	struct gpio_desc *ct_cp_hpd_gpio;
-	struct gpio_desc *ls_oe_gpio;
-	struct gpio_desc *hpd_gpio;
-};
-
-#define to_panel_data(x) container_of(x, struct panel_drv_data, dssdev)
-
-static int tpd_connect(struct omap_dss_device *src,
-		       struct omap_dss_device *dst)
-{
-	struct panel_drv_data *ddata = to_panel_data(dst);
-	int r;
-
-	r = omapdss_device_connect(dst->dss, dst, dst->next);
-	if (r)
-		return r;
-
-	gpiod_set_value_cansleep(ddata->ct_cp_hpd_gpio, 1);
-	gpiod_set_value_cansleep(ddata->ls_oe_gpio, 1);
-
-	/* DC-DC converter needs at max 300us to get to 90% of 5V */
-	udelay(300);
-
-	return 0;
-}
-
-static void tpd_disconnect(struct omap_dss_device *src,
-			   struct omap_dss_device *dst)
-{
-	struct panel_drv_data *ddata = to_panel_data(dst);
-
-	gpiod_set_value_cansleep(ddata->ct_cp_hpd_gpio, 0);
-	gpiod_set_value_cansleep(ddata->ls_oe_gpio, 0);
-
-	omapdss_device_disconnect(dst, dst->next);
-}
-
-static bool tpd_detect(struct omap_dss_device *dssdev)
-{
-	struct panel_drv_data *ddata = to_panel_data(dssdev);
-
-	return gpiod_get_value_cansleep(ddata->hpd_gpio);
-}
-
-static void tpd_register_hpd_cb(struct omap_dss_device *dssdev,
-				void (*cb)(void *cb_data,
-					  enum drm_connector_status status),
-				void *cb_data)
-{
-	struct panel_drv_data *ddata = to_panel_data(dssdev);
-
-	mutex_lock(&ddata->hpd_lock);
-	ddata->hpd_cb = cb;
-	ddata->hpd_cb_data = cb_data;
-	mutex_unlock(&ddata->hpd_lock);
-}
-
-static void tpd_unregister_hpd_cb(struct omap_dss_device *dssdev)
-{
-	struct panel_drv_data *ddata = to_panel_data(dssdev);
-
-	mutex_lock(&ddata->hpd_lock);
-	ddata->hpd_cb = NULL;
-	ddata->hpd_cb_data = NULL;
-	mutex_unlock(&ddata->hpd_lock);
-}
-
-static const struct omap_dss_device_ops tpd_ops = {
-	.connect		= tpd_connect,
-	.disconnect		= tpd_disconnect,
-	.detect			= tpd_detect,
-	.register_hpd_cb	= tpd_register_hpd_cb,
-	.unregister_hpd_cb	= tpd_unregister_hpd_cb,
-};
-
-static irqreturn_t tpd_hpd_isr(int irq, void *data)
-{
-	struct panel_drv_data *ddata = data;
-
-	mutex_lock(&ddata->hpd_lock);
-	if (ddata->hpd_cb) {
-		enum drm_connector_status status;
-
-		if (tpd_detect(&ddata->dssdev))
-			status = connector_status_connected;
-		else
-			status = connector_status_disconnected;
-
-		ddata->hpd_cb(ddata->hpd_cb_data, status);
-	}
-	mutex_unlock(&ddata->hpd_lock);
-
-	return IRQ_HANDLED;
-}
-
-static int tpd_probe(struct platform_device *pdev)
-{
-	struct omap_dss_device *dssdev;
-	struct panel_drv_data *ddata;
-	int r;
-	struct gpio_desc *gpio;
-
-	ddata = devm_kzalloc(&pdev->dev, sizeof(*ddata), GFP_KERNEL);
-	if (!ddata)
-		return -ENOMEM;
-
-	platform_set_drvdata(pdev, ddata);
-
-	gpio = devm_gpiod_get_index_optional(&pdev->dev, NULL, 0,
-		 GPIOD_OUT_LOW);
-	if (IS_ERR(gpio))
-		return PTR_ERR(gpio);
-
-	ddata->ct_cp_hpd_gpio = gpio;
-
-	gpio = devm_gpiod_get_index_optional(&pdev->dev, NULL, 1,
-		 GPIOD_OUT_LOW);
-	if (IS_ERR(gpio))
-		return PTR_ERR(gpio);
-
-	ddata->ls_oe_gpio = gpio;
-
-	gpio = devm_gpiod_get_index(&pdev->dev, NULL, 2,
-		GPIOD_IN);
-	if (IS_ERR(gpio))
-		return PTR_ERR(gpio);
-
-	ddata->hpd_gpio = gpio;
-
-	mutex_init(&ddata->hpd_lock);
-
-	r = devm_request_threaded_irq(&pdev->dev, gpiod_to_irq(ddata->hpd_gpio),
-		NULL, tpd_hpd_isr,
-		IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
-		"tpd12s015 hpd", ddata);
-	if (r)
-		return r;
-
-	dssdev = &ddata->dssdev;
-	dssdev->ops = &tpd_ops;
-	dssdev->dev = &pdev->dev;
-	dssdev->type = OMAP_DISPLAY_TYPE_HDMI;
-	dssdev->owner = THIS_MODULE;
-	dssdev->of_port = 1;
-	dssdev->ops_flags = OMAP_DSS_DEVICE_OP_DETECT
-			  | OMAP_DSS_DEVICE_OP_HPD;
-
-	dssdev->next = omapdss_of_find_connected_device(pdev->dev.of_node, 1);
-	if (IS_ERR(dssdev->next)) {
-		if (PTR_ERR(dssdev->next) != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "failed to find video sink\n");
-		return PTR_ERR(dssdev->next);
-	}
-
-	omapdss_device_register(dssdev);
-
-	return 0;
-}
-
-static int __exit tpd_remove(struct platform_device *pdev)
-{
-	struct panel_drv_data *ddata = platform_get_drvdata(pdev);
-	struct omap_dss_device *dssdev = &ddata->dssdev;
-
-	if (dssdev->next)
-		omapdss_device_put(dssdev->next);
-	omapdss_device_unregister(&ddata->dssdev);
-
-	return 0;
-}
-
-static const struct of_device_id tpd_of_match[] = {
-	{ .compatible = "omapdss,ti,tpd12s015", },
-	{},
-};
-
-MODULE_DEVICE_TABLE(of, tpd_of_match);
-
-static struct platform_driver tpd_driver = {
-	.probe	= tpd_probe,
-	.remove	= __exit_p(tpd_remove),
-	.driver	= {
-		.name	= "tpd12s015",
-		.of_match_table = tpd_of_match,
-		.suppress_bind_attrs = true,
-	},
-};
-
-module_platform_driver(tpd_driver);
-
-MODULE_AUTHOR("Tomi Valkeinen <tomi.valkeinen@ti.com>");
-MODULE_DESCRIPTION("TPD12S015 driver");
-MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index 73f1fab346e9..52daae36935a 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -444,8 +444,8 @@ static int hdmi4_bridge_attach(struct drm_bridge *bridge,
 {
 	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
 
-	if (!hdmi->output.next_bridge)
-		return 0;
+	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
+		return -EINVAL;
 
 	return drm_bridge_attach(bridge->encoder, hdmi->output.next_bridge,
 				 bridge, flags);
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5.c b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
index 52184797c858..f07fd5c6dc39 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi5.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
@@ -422,8 +422,8 @@ static int hdmi5_bridge_attach(struct drm_bridge *bridge,
 {
 	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
 
-	if (!hdmi->output.next_bridge)
-		return 0;
+	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
+		return -EINVAL;
 
 	return drm_bridge_attach(bridge->encoder, hdmi->output.next_bridge,
 				 bridge, flags);
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c b/drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c
index ce67891eedd4..00372f4ce711 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c
@@ -174,12 +174,7 @@ static const struct of_device_id omapdss_of_match[] __initconst = {
 };
 
 static const struct of_device_id omapdss_of_fixups_whitelist[] __initconst = {
-	{ .compatible = "composite-video-connector" },
-	{ .compatible = "hdmi-connector" },
 	{ .compatible = "panel-dsi-cm" },
-	{ .compatible = "svideo-connector" },
-	{ .compatible = "ti,opa362" },
-	{ .compatible = "ti,tpd12s015" },
 	{},
 };
 
diff --git a/drivers/gpu/drm/omapdrm/dss/output.c b/drivers/gpu/drm/omapdrm/dss/output.c
index 9ba7cc8539a1..ce21c798cca6 100644
--- a/drivers/gpu/drm/omapdrm/dss/output.c
+++ b/drivers/gpu/drm/omapdrm/dss/output.c
@@ -60,6 +60,11 @@ int omapdss_device_init_output(struct omap_dss_device *out,
 	}
 
 	if (local_bridge) {
+		if (!out->bridge) {
+			ret = -EPROBE_DEFER;
+			goto error;
+		}
+
 		out->next_bridge = out->bridge;
 		out->bridge = local_bridge;
 	}
diff --git a/drivers/gpu/drm/omapdrm/dss/venc.c b/drivers/gpu/drm/omapdrm/dss/venc.c
index cb9a689ed612..c8c19967a42f 100644
--- a/drivers/gpu/drm/omapdrm/dss/venc.c
+++ b/drivers/gpu/drm/omapdrm/dss/venc.c
@@ -626,8 +626,8 @@ static int venc_bridge_attach(struct drm_bridge *bridge,
 {
 	struct venc_device *venc = drm_bridge_to_venc(bridge);
 
-	if (venc->output.next_bridge)
-		return 0;
+	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
+		return -EINVAL;
 
 	return drm_bridge_attach(bridge->encoder, venc->output.next_bridge,
 				 bridge, flags);
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
