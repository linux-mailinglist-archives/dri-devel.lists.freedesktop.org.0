Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D51E7D0FED
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 14:52:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01D7810E03F;
	Fri, 20 Oct 2023 12:52:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90F5D10E03F
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 12:52:31 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 46e09a7af769-6ce37d0f13fso335460a34.2
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 05:52:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697806351; x=1698411151;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xn9e38NL+2yw7cE8Hne2rqONLjHxjfyoCpZSa/4tQ4w=;
 b=FSX57F+kHygJr2BAYBCABc4VzOIHF1LFofKHml4kF1nA67p2VCDbrNJOCa7FD5gD3W
 tQAYDJUT5X7Gd3LLNuvft8m0BrEk0CvD62d818IP6jMPePInGSA9yLyyFOEPzwhJ+vCD
 /sdPgOL+RcusM41UuqWmqr0oOeFqqhC8h/sYLmFWBewARnLAEdm5h2/J1Sg4lHV4rt84
 jEkB5vnjeP4j4kacZVORmk0+aqz1s4BDa+3m2nN8hDYzSQ0msAwYUWkvJ2jOUfZc83rq
 l62Jdu0XvTi5KH2FrFO+968wzA7OAIsrUmwfsQUsTF88V8Ypi3i2obZGB26f/PVrD98o
 gwOw==
X-Gm-Message-State: AOJu0YzmGiH1r6SxuiM7IMbh6nbckOBRf6Jg52QRR78mdmRPBKto6h7F
 vcLUIAmDEtruFXPQuHQRrA==
X-Google-Smtp-Source: AGHT+IFron30buBMuGXE9aKsFvb6BnHdDTlQ+OFGLIcRg4wTZiiSvINrW5JAcCDc1w70jnOFpuJgEw==
X-Received: by 2002:a9d:63d9:0:b0:6c4:c026:a658 with SMTP id
 e25-20020a9d63d9000000b006c4c026a658mr1704794otl.26.1697806350742; 
 Fri, 20 Oct 2023 05:52:30 -0700 (PDT)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 b15-20020a9d6b8f000000b006cd0aa45fb4sm306486otq.55.2023.10.20.05.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Oct 2023 05:52:30 -0700 (PDT)
Received: (nullmailer pid 2930703 invoked by uid 1000);
 Fri, 20 Oct 2023 12:52:28 -0000
From: Rob Herring <robh@kernel.org>
To: Russell King <linux@armlinux.org.uk>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Joel Stanley <joel@jms.id.au>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH] drm: Use device_get_match_data()
Date: Fri, 20 Oct 2023 07:52:13 -0500
Message-ID: <20231020125214.2930329-1-robh@kernel.org>
X-Mailer: git-send-email 2.42.0
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
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use preferred device_get_match_data() instead of of_match_device() to
get the driver match data in a single step. With this, adjust the
includes to explicitly include the correct headers. That also serves as
preparation to remove implicit includes within the DT headers
(of_device.h in particular).

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/gpu/drm/armada/armada_crtc.c    | 24 +++++++-----------------
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 10 ++++------
 drivers/gpu/drm/exynos/exynos_drm_gsc.c |  9 +++++----
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c     |  9 ++++-----
 drivers/gpu/drm/mxsfb/mxsfb_drv.c       | 10 +++-------
 drivers/gpu/drm/omapdrm/dss/dispc.c     |  4 ++--
 drivers/gpu/drm/omapdrm/dss/dss.c       |  5 +++--
 7 files changed, 28 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/armada/armada_crtc.c b/drivers/gpu/drm/armada/armada_crtc.c
index 15dd667aa2e7..f2886e6f631b 100644
--- a/drivers/gpu/drm/armada/armada_crtc.c
+++ b/drivers/gpu/drm/armada/armada_crtc.c
@@ -7,8 +7,9 @@
 #include <linux/clk.h>
 #include <linux/component.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
@@ -1012,26 +1013,17 @@ armada_lcd_bind(struct device *dev, struct device *master, void *data)
 	int irq = platform_get_irq(pdev, 0);
 	const struct armada_variant *variant;
 	struct device_node *port = NULL;
+	struct device_node *np, *parent = dev->of_node;
 
 	if (irq < 0)
 		return irq;
 
-	if (!dev->of_node) {
-		const struct platform_device_id *id;
 
-		id = platform_get_device_id(pdev);
-		if (!id)
-			return -ENXIO;
-
-		variant = (const struct armada_variant *)id->driver_data;
-	} else {
-		const struct of_device_id *match;
-		struct device_node *np, *parent = dev->of_node;
-
-		match = of_match_device(dev->driver->of_match_table, dev);
-		if (!match)
-			return -ENXIO;
+	variant = device_get_match_data(dev);
+	if (!variant)
+		return -ENXIO;
 
+	if (parent) {
 		np = of_get_child_by_name(parent, "ports");
 		if (np)
 			parent = np;
@@ -1041,8 +1033,6 @@ armada_lcd_bind(struct device *dev, struct device *master, void *data)
 			dev_err(dev, "no port node found in %pOF\n", parent);
 			return -ENXIO;
 		}
-
-		variant = match->data;
 	}
 
 	return armada_drm_crtc_create(drm, dev, res, irq, variant, port);
diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index 78122b35a0cb..a7a6b70220eb 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -6,10 +6,10 @@
 #include <linux/irq.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
-#include <linux/of.h>
-#include <linux/of_device.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
@@ -143,7 +143,6 @@ static int aspeed_gfx_load(struct drm_device *drm)
 	struct aspeed_gfx *priv = to_aspeed_gfx(drm);
 	struct device_node *np = pdev->dev.of_node;
 	const struct aspeed_gfx_config *config;
-	const struct of_device_id *match;
 	struct resource *res;
 	int ret;
 
@@ -152,10 +151,9 @@ static int aspeed_gfx_load(struct drm_device *drm)
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
-	match = of_match_device(aspeed_gfx_match, &pdev->dev);
-	if (!match)
+	config = device_get_match_data(&pdev->dev);
+	if (!config)
 		return -EINVAL;
-	config = match->data;
 
 	priv->dac_reg = config->dac_reg;
 	priv->int_clr_reg = config->int_clear_reg;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
index 34cdabc30b4f..35771fb4e85d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
@@ -11,9 +11,10 @@
 #include <linux/component.h>
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
-#include <linux/of_device.h>
+#include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 
 #include <drm/drm_fourcc.h>
@@ -103,7 +104,7 @@ struct gsc_context {
 	unsigned int			num_formats;
 
 	void __iomem	*regs;
-	const char	**clk_names;
+	const char	*const *clk_names;
 	struct clk	*clocks[GSC_MAX_CLOCKS];
 	int		num_clocks;
 	struct gsc_scaler	sc;
@@ -1217,7 +1218,7 @@ static const unsigned int gsc_tiled_formats[] = {
 static int gsc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct gsc_driverdata *driver_data;
+	const struct gsc_driverdata *driver_data;
 	struct exynos_drm_ipp_formats *formats;
 	struct gsc_context *ctx;
 	int num_formats, ret, i, j;
@@ -1226,7 +1227,7 @@ static int gsc_probe(struct platform_device *pdev)
 	if (!ctx)
 		return -ENOMEM;
 
-	driver_data = (struct gsc_driverdata *)of_device_get_match_data(dev);
+	driver_data = device_get_match_data(dev);
 	ctx->dev = dev;
 	ctx->num_clocks = driver_data->num_clocks;
 	ctx->clk_names = driver_data->clk_names;
diff --git a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
index 989eca32d325..53840ab054c7 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
@@ -12,8 +12,10 @@
 #include <linux/mfd/syscon.h>
 #include <linux/mfd/syscon/imx6q-iomuxc-gpr.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/of_graph.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/videodev2.h>
 
@@ -617,7 +619,6 @@ static int imx_ldb_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	const struct of_device_id *of_id = of_match_device(imx_ldb_dt_ids, dev);
 	struct device_node *child;
 	struct imx_ldb *imx_ldb;
 	int dual;
@@ -638,9 +639,7 @@ static int imx_ldb_probe(struct platform_device *pdev)
 	regmap_write(imx_ldb->regmap, IOMUXC_GPR2, 0);
 
 	imx_ldb->dev = dev;
-
-	if (of_id)
-		imx_ldb->lvds_mux = of_id->data;
+	imx_ldb->lvds_mux = device_get_match_data(dev);
 
 	dual = of_property_read_bool(np, "fsl,dual-channel");
 	if (dual)
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 625c1bfc4173..b483ef48216a 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -11,9 +11,10 @@
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/pm_runtime.h>
 
 #include <drm/drm_atomic_helper.h>
@@ -346,18 +347,13 @@ MODULE_DEVICE_TABLE(of, mxsfb_dt_ids);
 static int mxsfb_probe(struct platform_device *pdev)
 {
 	struct drm_device *drm;
-	const struct of_device_id *of_id =
-			of_match_device(mxsfb_dt_ids, &pdev->dev);
 	int ret;
 
-	if (!pdev->dev.of_node)
-		return -ENODEV;
-
 	drm = drm_dev_alloc(&mxsfb_driver, &pdev->dev);
 	if (IS_ERR(drm))
 		return PTR_ERR(drm);
 
-	ret = mxsfb_load(drm, of_id->data);
+	ret = mxsfb_load(drm, device_get_match_data(&pdev->dev));
 	if (ret)
 		goto err_free;
 
diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
index c26aab4939fa..993691b3cc7e 100644
--- a/drivers/gpu/drm/omapdrm/dss/dispc.c
+++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
@@ -22,11 +22,11 @@
 #include <linux/hardirq.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/property.h>
 #include <linux/sizes.h>
 #include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/component.h>
 #include <linux/sys_soc.h>
 #include <drm/drm_fourcc.h>
@@ -4765,7 +4765,7 @@ static int dispc_bind(struct device *dev, struct device *master, void *data)
 	if (soc)
 		dispc->feat = soc->data;
 	else
-		dispc->feat = of_match_device(dispc_of_match, &pdev->dev)->data;
+		dispc->feat = device_get_match_data(&pdev->dev);
 
 	r = dispc_errata_i734_wa_init(dispc);
 	if (r)
diff --git a/drivers/gpu/drm/omapdrm/dss/dss.c b/drivers/gpu/drm/omapdrm/dss/dss.c
index 02955f976845..988888e164d7 100644
--- a/drivers/gpu/drm/omapdrm/dss/dss.c
+++ b/drivers/gpu/drm/omapdrm/dss/dss.c
@@ -22,12 +22,13 @@
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/property.h>
 #include <linux/gfp.h>
 #include <linux/sizes.h>
 #include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
+#include <linux/of_platform.h>
 #include <linux/of_graph.h>
 #include <linux/regulator/consumer.h>
 #include <linux/suspend.h>
@@ -1445,7 +1446,7 @@ static int dss_probe(struct platform_device *pdev)
 	if (soc)
 		dss->feat = soc->data;
 	else
-		dss->feat = of_match_device(dss_of_match, &pdev->dev)->data;
+		dss->feat = device_get_match_data(&pdev->dev);
 
 	/* Map I/O registers, get and setup clocks. */
 	dss->base = devm_platform_ioremap_resource(pdev, 0);
-- 
2.42.0

