Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF90F2660C6
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 15:57:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22A806EA6C;
	Fri, 11 Sep 2020 13:57:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED6AE6EA6C
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 13:57:28 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kGjYN-0000W2-DO; Fri, 11 Sep 2020 15:57:27 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 5/7] drm/imx: use drmm_simple_encoder_alloc()
Date: Fri, 11 Sep 2020 15:57:22 +0200
Message-Id: <20200911135724.25833-5-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200911135724.25833-1-p.zabel@pengutronix.de>
References: <20200911135724.25833-1-p.zabel@pengutronix.de>
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

This allows to drop the custom drm_encoder_cleanup() actions.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
New in v3, example conversion of drm_simple_encoder_init() users.

This and the following patches depend on the drm/imx conversion to use managed
resources [1].

[1] https://lore.kernel.org/dri-devel/20200911133855.29801-3-p.zabel@pengutronix.de/T/#m335a28c5c26ab14bccc998d4dc0aed6850e9bc36
---
 drivers/gpu/drm/imx/dw_hdmi-imx.c      | 19 ++++---------------
 drivers/gpu/drm/imx/imx-ldb.c          | 20 ++++----------------
 drivers/gpu/drm/imx/imx-tve.c          | 22 ++++------------------
 drivers/gpu/drm/imx/parallel-display.c | 22 ++++------------------
 4 files changed, 16 insertions(+), 67 deletions(-)

diff --git a/drivers/gpu/drm/imx/dw_hdmi-imx.c b/drivers/gpu/drm/imx/dw_hdmi-imx.c
index 16be8bd92653..87428fb23d9f 100644
--- a/drivers/gpu/drm/imx/dw_hdmi-imx.c
+++ b/drivers/gpu/drm/imx/dw_hdmi-imx.c
@@ -188,13 +188,6 @@ static const struct of_device_id dw_hdmi_imx_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, dw_hdmi_imx_dt_ids);
 
-static void dw_hdmi_imx_encoder_cleanup(struct drm_device *drm, void *data)
-{
-	struct drm_encoder *encoder = data;
-
-	drm_encoder_cleanup(encoder);
-}
-
 static int dw_hdmi_imx_bind(struct device *dev, struct device *master,
 			    void *data)
 {
@@ -203,9 +196,10 @@ static int dw_hdmi_imx_bind(struct device *dev, struct device *master,
 	struct drm_encoder *encoder;
 	int ret;
 
-	hdmi_encoder = drmm_kzalloc(drm, sizeof(*hdmi_encoder), GFP_KERNEL);
-	if (!hdmi_encoder)
-		return -ENOMEM;
+	hdmi_encoder = drmm_simple_encoder_alloc(drm, struct imx_hdmi_encoder,
+						 encoder, DRM_MODE_ENCODER_TMDS);
+	if (IS_ERR(hdmi_encoder))
+		return PTR_ERR(hdmi_encoder);
 
 	hdmi_encoder->hdmi = dev_get_drvdata(dev);
 	encoder = &hdmi_encoder->encoder;
@@ -215,11 +209,6 @@ static int dw_hdmi_imx_bind(struct device *dev, struct device *master,
 		return ret;
 
 	drm_encoder_helper_add(encoder, &dw_hdmi_imx_encoder_helper_funcs);
-	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
-
-	ret = drmm_add_action_or_reset(drm, dw_hdmi_imx_encoder_cleanup, encoder);
-	if (ret)
-		return ret;
 
 	return drm_bridge_attach(encoder, hdmi_encoder->hdmi->bridge, NULL, 0);
 }
diff --git a/drivers/gpu/drm/imx/imx-ldb.c b/drivers/gpu/drm/imx/imx-ldb.c
index d4beb58f509d..dbfe39e2f7f6 100644
--- a/drivers/gpu/drm/imx/imx-ldb.c
+++ b/drivers/gpu/drm/imx/imx-ldb.c
@@ -414,13 +414,6 @@ static int imx_ldb_get_clk(struct imx_ldb *ldb, int chno)
 	return PTR_ERR_OR_ZERO(ldb->clk_pll[chno]);
 }
 
-static void imx_ldb_encoder_cleanup(struct drm_device *drm, void *data)
-{
-	struct drm_encoder *encoder = data;
-
-	drm_encoder_cleanup(encoder);
-}
-
 static int imx_ldb_register(struct drm_device *drm,
 	struct imx_ldb_channel *imx_ldb_ch)
 {
@@ -430,20 +423,15 @@ static int imx_ldb_register(struct drm_device *drm,
 	struct drm_encoder *encoder;
 	int ret;
 
-	ldb_encoder = drmm_kzalloc(drm, sizeof(*ldb_encoder), GFP_KERNEL);
-	if (!ldb_encoder)
-		return -ENOMEM;
+	ldb_encoder = drmm_simple_encoder_alloc(drm, struct imx_ldb_encoder,
+						encoder, DRM_MODE_ENCODER_LVDS);
+	if (IS_ERR(ldb_encoder))
+		return PTR_ERR(ldb_encoder);
 
 	ldb_encoder->channel = imx_ldb_ch;
 	connector = &ldb_encoder->connector;
 	encoder = &ldb_encoder->encoder;
 
-	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_LVDS);
-
-	ret = drmm_add_action_or_reset(drm, imx_ldb_encoder_cleanup, encoder);
-	if (ret)
-		return ret;
-
 	ret = imx_drm_encoder_parse_of(drm, encoder, imx_ldb_ch->child);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/imx/imx-tve.c b/drivers/gpu/drm/imx/imx-tve.c
index bac025eafa1f..0746f0b425df 100644
--- a/drivers/gpu/drm/imx/imx-tve.c
+++ b/drivers/gpu/drm/imx/imx-tve.c
@@ -433,13 +433,6 @@ static int tve_clk_init(struct imx_tve *tve, void __iomem *base)
 	return 0;
 }
 
-static void imx_tve_encoder_cleanup(struct drm_device *drm, void *ptr)
-{
-	struct drm_encoder *encoder = ptr;
-
-	drm_encoder_cleanup(encoder);
-}
-
 static void imx_tve_disable_regulator(void *data)
 {
 	struct imx_tve *tve = data;
@@ -498,22 +491,15 @@ static int imx_tve_bind(struct device *dev, struct device *master, void *data)
 	encoder_type = tve->mode == TVE_MODE_VGA ?
 		       DRM_MODE_ENCODER_DAC : DRM_MODE_ENCODER_TVDAC;
 
-	tvee = drmm_kzalloc(drm, sizeof(*tvee), GFP_KERNEL);
-	if (!tvee)
-		return -ENOMEM;
+	tvee = drmm_simple_encoder_alloc(drm, struct imx_tve_encoder, encoder,
+					 encoder_type);
+	if (IS_ERR(tvee))
+		return PTR_ERR(tvee);
 
 	tvee->tve = tve;
 	encoder = &tvee->encoder;
 	connector = &tvee->connector;
 
-	ret = drm_simple_encoder_init(drm, encoder, encoder_type);
-	if (ret)
-		return ret;
-
-	ret = drmm_add_action_or_reset(drm, imx_tve_encoder_cleanup, encoder);
-	if (ret)
-		return ret;
-
 	ret = imx_drm_encoder_parse_of(drm, encoder, tve->dev->of_node);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/imx/parallel-display.c b/drivers/gpu/drm/imx/parallel-display.c
index 50b5b89c2db2..9b1ec7e73c30 100644
--- a/drivers/gpu/drm/imx/parallel-display.c
+++ b/drivers/gpu/drm/imx/parallel-display.c
@@ -258,13 +258,6 @@ static const struct drm_bridge_funcs imx_pd_bridge_funcs = {
 	.atomic_get_output_bus_fmts = imx_pd_bridge_atomic_get_output_bus_fmts,
 };
 
-static void imx_pd_encoder_cleanup(struct drm_device *drm, void *ptr)
-{
-	struct drm_encoder *encoder = ptr;
-
-	drm_encoder_cleanup(encoder);
-}
-
 static int imx_pd_bind(struct device *dev, struct device *master, void *data)
 {
 	struct drm_device *drm = data;
@@ -275,23 +268,16 @@ static int imx_pd_bind(struct device *dev, struct device *master, void *data)
 	struct drm_bridge *bridge;
 	int ret;
 
-	imxpd_encoder = drmm_kzalloc(drm, sizeof(*imxpd_encoder), GFP_KERNEL);
-	if (!imxpd_encoder)
-		return -ENOMEM;
+	imxpd_encoder = drmm_simple_encoder_alloc(drm, struct imx_parallel_display_encoder,
+						  encoder, DRM_MODE_ENCODER_NONE);
+	if (IS_ERR(imxpd_encoder))
+		return PTR_ERR(imxpd_encoder);
 
 	imxpd_encoder->pd = imxpd;
 	connector = &imxpd_encoder->connector;
 	encoder = &imxpd_encoder->encoder;
 	bridge = &imxpd_encoder->bridge;
 
-	ret = drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_NONE);
-	if (ret)
-		return ret;
-
-	ret = drmm_add_action_or_reset(drm, imx_pd_encoder_cleanup, encoder);
-	if (ret)
-		return ret;
-
 	ret = imx_drm_encoder_parse_of(drm, encoder, imxpd->dev->of_node);
 	if (ret)
 		return ret;
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
