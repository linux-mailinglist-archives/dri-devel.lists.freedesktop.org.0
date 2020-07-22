Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B587D229938
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 15:31:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B470A6E40D;
	Wed, 22 Jul 2020 13:30:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E996E049
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 13:30:48 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1jyEpb-0002o0-1g; Wed, 22 Jul 2020 15:30:47 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/8] drm/imx: dw_hdmi-imx: use drm managed resources,
 switch to dw_hdmi_probe
Date: Wed, 22 Jul 2020 15:30:36 +0200
Message-Id: <20200722133042.30140-2-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200722133042.30140-1-p.zabel@pengutronix.de>
References: <20200722133042.30140-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: kernel@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move bridge creation into probe, during bind only create the encoder and
attach the bridge.
Use drmm_kzalloc() to align encoder memory lifetime with the drm device,
and use drmm_add_action_or_reset() to make sure drm_encoder_cleanup() is
called before the memory is freed.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/gpu/drm/imx/dw_hdmi-imx.c | 108 ++++++++++++++----------------
 1 file changed, 51 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/imx/dw_hdmi-imx.c b/drivers/gpu/drm/imx/dw_hdmi-imx.c
index a4f178c1d9bc..b5106792725f 100644
--- a/drivers/gpu/drm/imx/dw_hdmi-imx.c
+++ b/drivers/gpu/drm/imx/dw_hdmi-imx.c
@@ -15,23 +15,32 @@
 
 #include <drm/bridge/dw_hdmi.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_encoder.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_of.h>
 #include <drm/drm_simple_kms_helper.h>
 
 #include "imx-drm.h"
 
+struct imx_hdmi;
+
+struct imx_hdmi_encoder {
+	struct drm_encoder encoder;
+	struct imx_hdmi *hdmi;
+};
+
 struct imx_hdmi {
 	struct device *dev;
-	struct drm_encoder encoder;
+	struct drm_bridge *bridge;
 	struct dw_hdmi *hdmi;
 	struct regmap *regmap;
 };
 
 static inline struct imx_hdmi *enc_to_imx_hdmi(struct drm_encoder *e)
 {
-	return container_of(e, struct imx_hdmi, encoder);
+	return container_of(e, struct imx_hdmi_encoder, encoder)->hdmi;
 }
 
 static const struct dw_hdmi_mpll_config imx_mpll_cfg[] = {
@@ -98,23 +107,6 @@ static const struct dw_hdmi_phy_config imx_phy_config[] = {
 	{ ~0UL,      0x0000, 0x0000, 0x0000}
 };
 
-static int dw_hdmi_imx_parse_dt(struct imx_hdmi *hdmi)
-{
-	struct device_node *np = hdmi->dev->of_node;
-
-	hdmi->regmap = syscon_regmap_lookup_by_phandle(np, "gpr");
-	if (IS_ERR(hdmi->regmap)) {
-		dev_err(hdmi->dev, "Unable to get gpr\n");
-		return PTR_ERR(hdmi->regmap);
-	}
-
-	return 0;
-}
-
-static void dw_hdmi_imx_encoder_disable(struct drm_encoder *encoder)
-{
-}
-
 static void dw_hdmi_imx_encoder_enable(struct drm_encoder *encoder)
 {
 	struct imx_hdmi *hdmi = enc_to_imx_hdmi(encoder);
@@ -140,7 +132,6 @@ static int dw_hdmi_imx_atomic_check(struct drm_encoder *encoder,
 
 static const struct drm_encoder_helper_funcs dw_hdmi_imx_encoder_helper_funcs = {
 	.enable     = dw_hdmi_imx_encoder_enable,
-	.disable    = dw_hdmi_imx_encoder_disable,
 	.atomic_check = dw_hdmi_imx_atomic_check,
 };
 
@@ -195,68 +186,51 @@ static const struct of_device_id dw_hdmi_imx_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, dw_hdmi_imx_dt_ids);
 
+static void dw_hdmi_imx_encoder_cleanup(struct drm_device *drm, void *data)
+{
+	struct drm_encoder *encoder = data;
+
+	drm_encoder_cleanup(encoder);
+}
+
 static int dw_hdmi_imx_bind(struct device *dev, struct device *master,
 			    void *data)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	const struct dw_hdmi_plat_data *plat_data;
-	const struct of_device_id *match;
 	struct drm_device *drm = data;
 	struct drm_encoder *encoder;
-	struct imx_hdmi *hdmi;
+	struct imx_hdmi_encoder *hdmi_encoder;
+	struct imx_hdmi *hdmi = dev_get_drvdata(dev);
 	int ret;
 
-	if (!pdev->dev.of_node)
-		return -ENODEV;
-
-	hdmi = dev_get_drvdata(dev);
-	memset(hdmi, 0, sizeof(*hdmi));
+	hdmi_encoder = drmm_kzalloc(drm, sizeof(*hdmi_encoder), GFP_KERNEL);
+	if (!hdmi_encoder)
+		return -ENOMEM;
 
-	match = of_match_node(dw_hdmi_imx_dt_ids, pdev->dev.of_node);
-	plat_data = match->data;
-	hdmi->dev = &pdev->dev;
-	encoder = &hdmi->encoder;
+	hdmi_encoder->hdmi = hdmi;
+	encoder = &hdmi_encoder->encoder;
 
 	ret = imx_drm_encoder_parse_of(drm, encoder, dev->of_node);
 	if (ret)
 		return ret;
 
-	ret = dw_hdmi_imx_parse_dt(hdmi);
-	if (ret < 0)
-		return ret;
-
 	drm_encoder_helper_add(encoder, &dw_hdmi_imx_encoder_helper_funcs);
 	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
 
-	hdmi->hdmi = dw_hdmi_bind(pdev, encoder, plat_data);
-
-	/*
-	 * If dw_hdmi_bind() fails we'll never call dw_hdmi_unbind(),
-	 * which would have called the encoder cleanup.  Do it manually.
-	 */
-	if (IS_ERR(hdmi->hdmi)) {
-		ret = PTR_ERR(hdmi->hdmi);
-		drm_encoder_cleanup(encoder);
-	}
-
-	return ret;
-}
-
-static void dw_hdmi_imx_unbind(struct device *dev, struct device *master,
-			       void *data)
-{
-	struct imx_hdmi *hdmi = dev_get_drvdata(dev);
+	ret = drmm_add_action_or_reset(drm, dw_hdmi_imx_encoder_cleanup, encoder);
+	if (ret)
+		return ret;
 
-	dw_hdmi_unbind(hdmi->hdmi);
+	return drm_bridge_attach(encoder, hdmi->bridge, NULL, 0);
 }
 
 static const struct component_ops dw_hdmi_imx_ops = {
 	.bind	= dw_hdmi_imx_bind,
-	.unbind	= dw_hdmi_imx_unbind,
 };
 
 static int dw_hdmi_imx_probe(struct platform_device *pdev)
 {
+	struct device_node *np = pdev->dev.of_node;
+	const struct of_device_id *match = of_match_node(dw_hdmi_imx_dt_ids, np);
 	struct imx_hdmi *hdmi;
 
 	hdmi = devm_kzalloc(&pdev->dev, sizeof(*hdmi), GFP_KERNEL);
@@ -264,13 +238,33 @@ static int dw_hdmi_imx_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	platform_set_drvdata(pdev, hdmi);
+	hdmi->dev = &pdev->dev;
+
+	hdmi->regmap = syscon_regmap_lookup_by_phandle(np, "gpr");
+	if (IS_ERR(hdmi->regmap)) {
+		dev_err(hdmi->dev, "Unable to get gpr\n");
+		return PTR_ERR(hdmi->regmap);
+	}
+
+	hdmi->hdmi = dw_hdmi_probe(pdev, match->data);
+	if (IS_ERR(hdmi->hdmi))
+		return PTR_ERR(hdmi->hdmi);
+
+	hdmi->bridge = of_drm_find_bridge(np);
+	if (!hdmi->bridge) {
+		dev_err(hdmi->dev, "Unable to find bridge\n");
+		return -ENODEV;
+	}
 
 	return component_add(&pdev->dev, &dw_hdmi_imx_ops);
 }
 
 static int dw_hdmi_imx_remove(struct platform_device *pdev)
 {
+	struct imx_hdmi *hdmi = platform_get_drvdata(pdev);
+
 	component_del(&pdev->dev, &dw_hdmi_imx_ops);
+	dw_hdmi_remove(hdmi->hdmi);
 
 	return 0;
 }
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
