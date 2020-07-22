Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E40229936
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 15:30:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86A316E459;
	Wed, 22 Jul 2020 13:30:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE01C6E049
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 13:30:50 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1jyEpd-0002o0-9D; Wed, 22 Jul 2020 15:30:49 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/8] drm/imx: parallel-display: use drm managed resources
Date: Wed, 22 Jul 2020 15:30:39 +0200
Message-Id: <20200722133042.30140-5-p.zabel@pengutronix.de>
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

Use drmm_kzalloc() to align encoder memory lifetime with the drm device,
and use drmm_add_action_or_reset() to make sure drm_encoder_cleanup() is
called before the memory is freed.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/gpu/drm/imx/parallel-display.c | 50 +++++++++++++-------------
 1 file changed, 26 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/imx/parallel-display.c b/drivers/gpu/drm/imx/parallel-display.c
index 8232f512b9ed..182d88d7f666 100644
--- a/drivers/gpu/drm/imx/parallel-display.c
+++ b/drivers/gpu/drm/imx/parallel-display.c
@@ -15,6 +15,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_fb_helper.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
@@ -28,7 +29,6 @@ struct imx_parallel_display {
 	struct drm_bridge bridge;
 	struct device *dev;
 	void *edid;
-	int edid_len;
 	u32 bus_format;
 	u32 bus_flags;
 	struct drm_display_mode mode;
@@ -259,6 +259,13 @@ static const struct drm_bridge_funcs imx_pd_bridge_funcs = {
 	.atomic_get_output_bus_fmts = imx_pd_bridge_atomic_get_output_bus_fmts,
 };
 
+static void imx_pd_encoder_cleanup(struct drm_device *drm, void *ptr)
+{
+	struct drm_encoder *encoder = ptr;
+
+	drm_encoder_cleanup(encoder);
+}
+
 static int imx_pd_register(struct drm_device *drm,
 	struct imx_parallel_display *imxpd)
 {
@@ -276,7 +283,13 @@ static int imx_pd_register(struct drm_device *drm,
 	 */
 	imxpd->connector.dpms = DRM_MODE_DPMS_OFF;
 
-	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_NONE);
+	ret = drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_NONE);
+	if (ret)
+		return ret;
+
+	ret = drmm_add_action_or_reset(drm, imx_pd_encoder_cleanup, encoder);
+	if (ret)
+		return ret;
 
 	imxpd->bridge.funcs = &imx_pd_bridge_funcs;
 	drm_bridge_attach(encoder, &imxpd->bridge, NULL, 0);
@@ -310,12 +323,14 @@ static int imx_pd_bind(struct device *dev, struct device *master, void *data)
 	struct device_node *np = dev->of_node;
 	const u8 *edidp;
 	struct imx_parallel_display *imxpd;
+	int edid_len;
 	int ret;
 	u32 bus_format = 0;
 	const char *fmt;
 
-	imxpd = dev_get_drvdata(dev);
-	memset(imxpd, 0, sizeof(*imxpd));
+	imxpd = drmm_kzalloc(drm, sizeof(*imxpd), GFP_KERNEL);
+	if (!imxpd)
+		return -ENOMEM;
 
 	/* port@1 is the output port */
 	ret = drm_of_find_panel_or_bridge(np, 1, 0, &imxpd->panel,
@@ -323,9 +338,13 @@ static int imx_pd_bind(struct device *dev, struct device *master, void *data)
 	if (ret && ret != -ENODEV)
 		return ret;
 
-	edidp = of_get_property(np, "edid", &imxpd->edid_len);
-	if (edidp)
-		imxpd->edid = kmemdup(edidp, imxpd->edid_len, GFP_KERNEL);
+	edidp = of_get_property(np, "edid", &edid_len);
+	if (edidp) {
+		imxpd->edid = drmm_kmalloc(drm, edid_len, GFP_KERNEL);
+		if (!imxpd->edid)
+			return -ENOMEM;
+		memcpy(imxpd->edid, edidp, edid_len);
+	}
 
 	ret = of_property_read_string(np, "interface-pix-fmt", &fmt);
 	if (!ret) {
@@ -349,29 +368,12 @@ static int imx_pd_bind(struct device *dev, struct device *master, void *data)
 	return 0;
 }
 
-static void imx_pd_unbind(struct device *dev, struct device *master,
-	void *data)
-{
-	struct imx_parallel_display *imxpd = dev_get_drvdata(dev);
-
-	kfree(imxpd->edid);
-}
-
 static const struct component_ops imx_pd_ops = {
 	.bind	= imx_pd_bind,
-	.unbind	= imx_pd_unbind,
 };
 
 static int imx_pd_probe(struct platform_device *pdev)
 {
-	struct imx_parallel_display *imxpd;
-
-	imxpd = devm_kzalloc(&pdev->dev, sizeof(*imxpd), GFP_KERNEL);
-	if (!imxpd)
-		return -ENOMEM;
-
-	platform_set_drvdata(pdev, imxpd);
-
 	return component_add(&pdev->dev, &imx_pd_ops);
 }
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
