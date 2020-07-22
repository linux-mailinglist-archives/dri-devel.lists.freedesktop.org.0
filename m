Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 860A9229939
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 15:31:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B53F6E82B;
	Wed, 22 Jul 2020 13:30:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D92B6E049
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 13:30:49 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1jyEpb-0002o0-QA; Wed, 22 Jul 2020 15:30:47 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/8] drm/imx: imx-ldb: use drm managed resources
Date: Wed, 22 Jul 2020 15:30:37 +0200
Message-Id: <20200722133042.30140-3-p.zabel@pengutronix.de>
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
 drivers/gpu/drm/imx/imx-ldb.c | 67 +++++++++++++++++++----------------
 1 file changed, 36 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/imx/imx-ldb.c b/drivers/gpu/drm/imx/imx-ldb.c
index af757d1e21fe..ef26a2960db9 100644
--- a/drivers/gpu/drm/imx/imx-ldb.c
+++ b/drivers/gpu/drm/imx/imx-ldb.c
@@ -22,6 +22,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_fb_helper.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
@@ -62,7 +63,6 @@ struct imx_ldb_channel {
 	struct i2c_adapter *ddc;
 	int chno;
 	void *edid;
-	int edid_len;
 	struct drm_display_mode mode;
 	int mode_valid;
 	u32 bus_format;
@@ -408,6 +408,13 @@ static int imx_ldb_get_clk(struct imx_ldb *ldb, int chno)
 	return PTR_ERR_OR_ZERO(ldb->clk_pll[chno]);
 }
 
+static void imx_ldb_encoder_cleanup(struct drm_device *drm, void *data)
+{
+	struct drm_encoder *encoder = data;
+
+	drm_encoder_cleanup(encoder);
+}
+
 static int imx_ldb_register(struct drm_device *drm,
 	struct imx_ldb_channel *imx_ldb_ch)
 {
@@ -432,6 +439,10 @@ static int imx_ldb_register(struct drm_device *drm,
 	drm_encoder_helper_add(encoder, &imx_ldb_encoder_helper_funcs);
 	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_LVDS);
 
+	ret = drmm_add_action_or_reset(drm, imx_ldb_encoder_cleanup, encoder);
+	if (ret)
+		return ret;
+
 	if (imx_ldb_ch->bridge) {
 		ret = drm_bridge_attach(&imx_ldb_ch->encoder,
 					imx_ldb_ch->bridge, NULL, 0);
@@ -536,15 +547,14 @@ static int imx_ldb_panel_ddc(struct device *dev,
 	}
 
 	if (!channel->ddc) {
+		int edid_len;
+
 		/* if no DDC available, fallback to hardcoded EDID */
 		dev_dbg(dev, "no ddc available\n");
 
-		edidp = of_get_property(child, "edid",
-					&channel->edid_len);
+		edidp = of_get_property(child, "edid", &edid_len);
 		if (edidp) {
-			channel->edid = kmemdup(edidp,
-						channel->edid_len,
-						GFP_KERNEL);
+			channel->edid = kmemdup(edidp, edid_len, GFP_KERNEL);
 		} else if (!channel->panel) {
 			/* fallback to display-timings node */
 			ret = of_get_drm_display_mode(child,
@@ -558,6 +568,19 @@ static int imx_ldb_panel_ddc(struct device *dev,
 	return 0;
 }
 
+static void imx_ldb_cleanup(struct drm_device *drm, void *data)
+{
+	struct imx_ldb *imx_ldb = data;
+	int i;
+
+	for (i = 0; i < 2; i++) {
+		struct imx_ldb_channel *channel = &imx_ldb->channel[i];
+
+		kfree(channel->edid);
+		i2c_put_adapter(channel->ddc);
+	}
+}
+
 static int imx_ldb_bind(struct device *dev, struct device *master, void *data)
 {
 	struct drm_device *drm = data;
@@ -570,8 +593,13 @@ static int imx_ldb_bind(struct device *dev, struct device *master, void *data)
 	int ret;
 	int i;
 
-	imx_ldb = dev_get_drvdata(dev);
-	memset(imx_ldb, 0, sizeof(*imx_ldb));
+	imx_ldb = drmm_kzalloc(drm, sizeof(*imx_ldb), GFP_KERNEL);
+	if (!imx_ldb)
+		return -ENOMEM;
+
+	ret = drmm_add_action_or_reset(drm, imx_ldb_cleanup, imx_ldb);
+	if (ret)
+		return ret;
 
 	imx_ldb->regmap = syscon_regmap_lookup_by_phandle(np, "gpr");
 	if (IS_ERR(imx_ldb->regmap)) {
@@ -686,35 +714,12 @@ static int imx_ldb_bind(struct device *dev, struct device *master, void *data)
 	return ret;
 }
 
-static void imx_ldb_unbind(struct device *dev, struct device *master,
-	void *data)
-{
-	struct imx_ldb *imx_ldb = dev_get_drvdata(dev);
-	int i;
-
-	for (i = 0; i < 2; i++) {
-		struct imx_ldb_channel *channel = &imx_ldb->channel[i];
-
-		kfree(channel->edid);
-		i2c_put_adapter(channel->ddc);
-	}
-}
-
 static const struct component_ops imx_ldb_ops = {
 	.bind	= imx_ldb_bind,
-	.unbind	= imx_ldb_unbind,
 };
 
 static int imx_ldb_probe(struct platform_device *pdev)
 {
-	struct imx_ldb *imx_ldb;
-
-	imx_ldb = devm_kzalloc(&pdev->dev, sizeof(*imx_ldb), GFP_KERNEL);
-	if (!imx_ldb)
-		return -ENOMEM;
-
-	platform_set_drvdata(pdev, imx_ldb);
-
 	return component_add(&pdev->dev, &imx_ldb_ops);
 }
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
