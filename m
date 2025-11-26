Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B741EC8B3A2
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 18:37:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B2E10E6D0;
	Wed, 26 Nov 2025 17:37:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="LGH8c05S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3826C10E6BF
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 17:37:11 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 213254E418DB;
 Wed, 26 Nov 2025 17:37:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EA9A360721;
 Wed, 26 Nov 2025 17:37:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CE0ED102F23E6; Wed, 26 Nov 2025 18:37:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1764178628; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ebIEoOFbcxjNammgs1wFdNHVv2oGscjy71gi5++A4y8=;
 b=LGH8c05SNYhkFYRuok7i0iDh+CHzp2Xi/sndQtaKV0ld0jBYj20bVYOC3voXUIK0HwmHcm
 EpEtZz1+RQtpWkNemyNYPh9qfbznAwAKuvdIzuIKBg/QR24bA4Wr08q5cIKt2jGKlVcJso
 E1pmhoJPpB8qj0S3w3bGNnF4h+a3wG9hSVDc20Kl1eegc/BIbXyBhwQxyU9Wl/Akh2jhzh
 TTAimH+LE6kQN1NztjcTCA9YXcCku6cq2r6fchLgzn7lileME1S0GP8RvDaF0Xf53m/nR3
 FZBlNIpGB0N0Kt2MvSYN2/PEtDInKhPYc6dRXxa729jSyq6aoSLQ16t/nzeKSg==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Wed, 26 Nov 2025 18:35:50 +0100
Subject: [PATCH 08/21] drm/tilcdc: Remove component framework support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-feature_tilcdc-v1-8-49b9ef2e3aa0@bootlin.com>
References: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
In-Reply-To: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miguel Gazquez <miguel.gazquez@bootlin.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-omap@vger.kernel.org, 
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The tilcdc driver previously used the component framework to bind
external encoder subdrivers (specifically the TDA998x HDMI encoder).
With the removal of these subdrivers in previous commits, the component
framework is no longer needed.

This commit removes all component framework infrastructure including:
- Component master operations and bind/unbind callbacks
- The is_componentized flag and conditional code paths
- tilcdc_get_external_components() and tilcdc_add_component_encoder()
- TDA998x-specific panel configuration

The driver now uses a simplified initialization path that directly
attaches external devices via the DRM bridge API, eliminating the
complexity of dual code paths for componentized vs non-componentized
configurations.

This cleanup removes approximately 140 lines of code and makes the
driver initialization flow more straightforward.

Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c     | 10 ----
 drivers/gpu/drm/tilcdc/tilcdc_drv.c      | 80 ++++----------------------------
 drivers/gpu/drm/tilcdc/tilcdc_drv.h      |  1 -
 drivers/gpu/drm/tilcdc/tilcdc_external.c | 65 --------------------------
 drivers/gpu/drm/tilcdc/tilcdc_external.h |  3 --
 5 files changed, 9 insertions(+), 150 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
index 1b5475c48f6ad..a244051ab5163 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
@@ -1022,16 +1022,6 @@ int tilcdc_crtc_create(struct drm_device *dev)
 
 	drm_crtc_helper_add(crtc, &tilcdc_crtc_helper_funcs);
 
-	if (priv->is_componentized) {
-		crtc->port = of_graph_get_port_by_id(dev->dev->of_node, 0);
-		if (!crtc->port) { /* This should never happen */
-			dev_err(dev->dev, "Port node not found in %pOF\n",
-				dev->dev->of_node);
-			ret = -EINVAL;
-			goto fail;
-		}
-	}
-
 	priv->crtc = crtc;
 	return 0;
 
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index 411f0767d112d..2df3957ee0dc1 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -6,7 +6,6 @@
 
 /* LCDC DRM driver, based on da8xx-fb */
 
-#include <linux/component.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/pinctrl/consumer.h>
@@ -212,9 +211,6 @@ static int tilcdc_init(const struct drm_driver *ddrv, struct device *dev)
 	platform_set_drvdata(pdev, ddev);
 	drm_mode_config_init(ddev);
 
-	priv->is_componentized =
-		tilcdc_get_external_components(dev, NULL) > 0;
-
 	priv->wq = alloc_ordered_workqueue("tilcdc", 0);
 	if (!priv->wq) {
 		ret = -ENOMEM;
@@ -328,42 +324,32 @@ static int tilcdc_init(const struct drm_driver *ddrv, struct device *dev)
 	}
 #endif
 
-	if (priv->is_componentized) {
-		ret = component_bind_all(dev, ddev);
-		if (ret < 0)
-			goto unregister_cpufreq_notif;
-
-		ret = tilcdc_add_component_encoder(ddev);
-		if (ret < 0)
-			goto unbind_component;
-	} else {
-		ret = tilcdc_attach_external_device(ddev);
-		if (ret)
-			goto unregister_cpufreq_notif;
-	}
+	ret = tilcdc_attach_external_device(ddev);
+	if (ret)
+		goto unregister_cpufreq_notif;
 
 	if (!priv->external_connector &&
 	    ((priv->num_encoders == 0) || (priv->num_connectors == 0))) {
 		dev_err(dev, "no encoders/connectors found\n");
 		ret = -EPROBE_DEFER;
-		goto unbind_component;
+		goto unregister_cpufreq_notif;
 	}
 
 	ret = drm_vblank_init(ddev, 1);
 	if (ret < 0) {
 		dev_err(dev, "failed to initialize vblank\n");
-		goto unbind_component;
+		goto unregister_cpufreq_notif;
 	}
 
 	ret = platform_get_irq(pdev, 0);
 	if (ret < 0)
-		goto unbind_component;
+		goto unregister_cpufreq_notif;
 	priv->irq = ret;
 
 	ret = tilcdc_irq_install(ddev, priv->irq);
 	if (ret < 0) {
 		dev_err(dev, "failed to install IRQ handler\n");
-		goto unbind_component;
+		goto unregister_cpufreq_notif;
 	}
 
 	drm_mode_config_reset(ddev);
@@ -381,9 +367,6 @@ static int tilcdc_init(const struct drm_driver *ddrv, struct device *dev)
 stop_poll:
 	drm_kms_helper_poll_fini(ddev);
 	tilcdc_irq_uninstall(ddev);
-unbind_component:
-	if (priv->is_componentized)
-		component_unbind_all(dev, ddev);
 unregister_cpufreq_notif:
 #ifdef CONFIG_CPU_FREQ
 	cpufreq_unregister_notifier(&priv->freq_transition,
@@ -532,65 +515,20 @@ static int tilcdc_pm_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(tilcdc_pm_ops,
 				tilcdc_pm_suspend, tilcdc_pm_resume);
 
-/*
- * Platform driver:
- */
-static int tilcdc_bind(struct device *dev)
-{
-	return tilcdc_init(&tilcdc_driver, dev);
-}
-
-static void tilcdc_unbind(struct device *dev)
-{
-	struct drm_device *ddev = dev_get_drvdata(dev);
-
-	/* Check if a subcomponent has already triggered the unloading. */
-	if (!ddev->dev_private)
-		return;
-
-	tilcdc_fini(ddev);
-	dev_set_drvdata(dev, NULL);
-}
-
-static const struct component_master_ops tilcdc_comp_ops = {
-	.bind = tilcdc_bind,
-	.unbind = tilcdc_unbind,
-};
-
 static int tilcdc_pdev_probe(struct platform_device *pdev)
 {
-	struct component_match *match = NULL;
-	int ret;
-
 	/* bail out early if no DT data: */
 	if (!pdev->dev.of_node) {
 		dev_err(&pdev->dev, "device-tree data is missing\n");
 		return -ENXIO;
 	}
 
-	ret = tilcdc_get_external_components(&pdev->dev, &match);
-	if (ret < 0)
-		return ret;
-	else if (ret == 0)
-		return tilcdc_init(&tilcdc_driver, &pdev->dev);
-	else
-		return component_master_add_with_match(&pdev->dev,
-						       &tilcdc_comp_ops,
-						       match);
+	return tilcdc_init(&tilcdc_driver, &pdev->dev);
 }
 
 static void tilcdc_pdev_remove(struct platform_device *pdev)
 {
-	int ret;
-
-	ret = tilcdc_get_external_components(&pdev->dev, NULL);
-	if (ret < 0)
-		dev_err(&pdev->dev, "tilcdc_get_external_components() failed (%pe)\n",
-			ERR_PTR(ret));
-	else if (ret == 0)
-		tilcdc_fini(platform_get_drvdata(pdev));
-	else
-		component_master_del(&pdev->dev, &tilcdc_comp_ops);
+	tilcdc_fini(platform_get_drvdata(pdev));
 }
 
 static void tilcdc_pdev_shutdown(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.h b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
index 79078b4ae7393..c23b593dc61f6 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.h
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
@@ -84,7 +84,6 @@ struct tilcdc_drm_private {
 	struct drm_encoder *external_encoder;
 	struct drm_connector *external_connector;
 
-	bool is_componentized;
 	bool irq_enabled;
 };
 
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_external.c b/drivers/gpu/drm/tilcdc/tilcdc_external.c
index da755a411d9ff..2970c41d9c3eb 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_external.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_external.c
@@ -4,7 +4,6 @@
  * Author: Jyri Sarha <jsarha@ti.com>
  */
 
-#include <linux/component.h>
 #include <linux/of_graph.h>
 
 #include <drm/drm_atomic_helper.h>
@@ -15,19 +14,6 @@
 #include "tilcdc_drv.h"
 #include "tilcdc_external.h"
 
-static const struct tilcdc_panel_info panel_info_tda998x = {
-		.ac_bias                = 255,
-		.ac_bias_intrpt         = 0,
-		.dma_burst_sz           = 16,
-		.bpp                    = 16,
-		.fdd                    = 0x80,
-		.tft_alt_mode           = 0,
-		.invert_pxl_clk		= 1,
-		.sync_edge              = 1,
-		.sync_ctrl              = 1,
-		.raster_order           = 0,
-};
-
 static const struct tilcdc_panel_info panel_info_default = {
 		.ac_bias                = 255,
 		.ac_bias_intrpt         = 0,
@@ -57,34 +43,6 @@ struct drm_connector *tilcdc_encoder_find_connector(struct drm_device *ddev,
 	return NULL;
 }
 
-int tilcdc_add_component_encoder(struct drm_device *ddev)
-{
-	struct tilcdc_drm_private *priv = ddev->dev_private;
-	struct drm_encoder *encoder = NULL, *iter;
-
-	list_for_each_entry(iter, &ddev->mode_config.encoder_list, head)
-		if (iter->possible_crtcs & (1 << priv->crtc->index)) {
-			encoder = iter;
-			break;
-		}
-
-	if (!encoder) {
-		dev_err(ddev->dev, "%s: No suitable encoder found\n", __func__);
-		return -ENODEV;
-	}
-
-	priv->external_connector =
-		tilcdc_encoder_find_connector(ddev, encoder);
-
-	if (!priv->external_connector)
-		return -ENODEV;
-
-	/* Only tda998x is supported at the moment. */
-	tilcdc_crtc_set_panel_info(priv->crtc, &panel_info_tda998x);
-
-	return 0;
-}
-
 static
 int tilcdc_attach_bridge(struct drm_device *ddev, struct drm_bridge *bridge)
 {
@@ -153,26 +111,3 @@ int tilcdc_attach_external_device(struct drm_device *ddev)
 	drm_encoder_cleanup(priv->external_encoder);
 	return ret;
 }
-
-static int dev_match_of(struct device *dev, void *data)
-{
-	return dev->of_node == data;
-}
-
-int tilcdc_get_external_components(struct device *dev,
-				   struct component_match **match)
-{
-	struct device_node *node;
-
-	node = of_graph_get_remote_node(dev->of_node, 0, 0);
-
-	if (!of_device_is_compatible(node, "nxp,tda998x")) {
-		of_node_put(node);
-		return 0;
-	}
-
-	if (match)
-		drm_of_component_match_add(dev, match, dev_match_of, node);
-	of_node_put(node);
-	return 1;
-}
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_external.h b/drivers/gpu/drm/tilcdc/tilcdc_external.h
index fb4476694cd89..285a132f3035d 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_external.h
+++ b/drivers/gpu/drm/tilcdc/tilcdc_external.h
@@ -7,8 +7,5 @@
 #ifndef __TILCDC_EXTERNAL_H__
 #define __TILCDC_EXTERNAL_H__
 
-int tilcdc_add_component_encoder(struct drm_device *dev);
-int tilcdc_get_external_components(struct device *dev,
-				   struct component_match **match);
 int tilcdc_attach_external_device(struct drm_device *ddev);
 #endif /* __TILCDC_SLAVE_H__ */

-- 
2.43.0

