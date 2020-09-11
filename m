Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9586D2660BD
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 15:54:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD7A36EA61;
	Fri, 11 Sep 2020 13:54:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E61C36EA58
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 13:54:24 +0000 (UTC)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mtr@pengutronix.de>)
 id 1kGjVN-0007wb-RG; Fri, 11 Sep 2020 15:54:23 +0200
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
 id 1kGjVH-00FKo2-Pu; Fri, 11 Sep 2020 15:54:15 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org
Date: Fri, 11 Sep 2020 15:54:11 +0200
Message-Id: <20200911135413.3654800-15-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200911135413.3654800-1-m.tretter@pengutronix.de>
References: <20200911135413.3654800-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
 metis.ext.pengutronix.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=4.0 tests=AWL,BAYES_00,RDNS_NONE,
 SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no autolearn_force=no
 version=3.4.2
Subject: [PATCH v2 14/16] drm/exynos: add API functions for platform drivers
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
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
Cc: jy0922.shim@samsung.com, b.zolnierkie@samsung.com, narmstrong@baylibre.com,
 sw0312.kim@samsung.com, Michael Tretter <m.tretter@pengutronix.de>,
 krzk@kernel.org, a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
 kernel@pengutronix.de, sylvester.nawrocki@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add new functions for the probe/remove API, the bind/unbind API and
resume/suspend calls. Move everything exynos drm specific into separate
functions, which can easily be moved to other files.

Also split struct exynos_dsi into a generic and a platform specific
struct.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
v2:
- new patch
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 114 +++++++++++++++++-------
 1 file changed, 82 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index b9216785b2d7..ad70f5ce81ad 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -265,7 +265,6 @@ struct exynos_dsi_driver_data {
 };
 
 struct exynos_dsi {
-	struct drm_encoder encoder;
 	struct drm_bridge bridge;
 	struct mipi_dsi_host dsi_host;
 	struct drm_connector connector;
@@ -419,6 +418,11 @@ enum reg_value_idx {
 	PHYTIMING_HS_TRAIL
 };
 
+struct exynos_dsi_pltfm {
+	struct exynos_dsi *dsi;
+	struct drm_encoder encoder;
+};
+
 static const unsigned int reg_values[] = {
 	[RESET_TYPE] = DSIM_SWRST,
 	[PLL_TIMER] = 500,
@@ -476,7 +480,7 @@ static const unsigned int exynos5433_reg_values[] = {
 static int __exynos_dsi_host_attach(struct device *dev,
 				    struct mipi_dsi_device *device)
 {
-	struct exynos_dsi *dsi = dev_get_drvdata(dev);
+	struct exynos_dsi_pltfm *dsi = dev_get_drvdata(dev);
 	struct drm_device *drm = dsi->encoder.dev;
 	struct exynos_drm_crtc *crtc;
 
@@ -494,7 +498,7 @@ static int __exynos_dsi_host_attach(struct device *dev,
 static int __exynos_dsi_host_detach(struct device *dev,
 				     struct mipi_dsi_device *device)
 {
-	struct exynos_dsi *dsi = dev_get_drvdata(dev);
+	struct exynos_dsi_pltfm *dsi = dev_get_drvdata(dev);
 	struct drm_device *drm = dsi->encoder.dev;
 
 	if (drm->mode_config.poll_enabled)
@@ -505,7 +509,7 @@ static int __exynos_dsi_host_detach(struct device *dev,
 
 static void __exynos_dsi_te_handler(struct device *dev)
 {
-	struct exynos_dsi *dsi = dev_get_drvdata(dev);
+	struct exynos_dsi_pltfm *dsi = dev_get_drvdata(dev);
 
 	exynos_drm_crtc_te_handler(dsi->encoder.crtc);
 }
@@ -1804,10 +1808,12 @@ static int exynos_dsi_parse_dt(struct exynos_dsi *dsi)
 	return 0;
 }
 
-static int exynos_dsi_bind(struct device *dev, struct device *master,
-				void *data)
+static int exynos_dsi_bind(struct exynos_dsi *dsi, struct drm_encoder *encoder);
+static void exynos_dsi_unbind(struct exynos_dsi *dsi);
+
+static int exynos_dsi_pltfm_bind(struct device *dev, struct device *master, void *data)
 {
-	struct exynos_dsi *dsi = dev_get_drvdata(dev);
+	struct exynos_dsi_pltfm *dsi = dev_get_drvdata(dev);
 	struct drm_encoder *encoder = &dsi->encoder;
 	struct drm_device *drm_dev = data;
 	struct device_node *in_bridge_node;
@@ -1828,7 +1834,7 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
 		of_node_put(in_bridge_node);
 	}
 
-	ret = drm_bridge_attach(encoder, &dsi->bridge, in_bridge, 0);
+	ret = exynos_dsi_bind(dsi->dsi, encoder);
 	if (ret)
 		goto err;
 
@@ -1839,20 +1845,20 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
 	return ret;
 }
 
-static void exynos_dsi_unbind(struct device *dev, struct device *master,
-				void *data)
+static void exynos_dsi_pltfm_unbind(struct device *dev, struct device *master,
+				    void *data)
 {
-	struct exynos_dsi *dsi = dev_get_drvdata(dev);
+	struct exynos_dsi_pltfm *dsi = dev_get_drvdata(dev);
 	struct drm_encoder *encoder = &dsi->encoder;
 
-	exynos_dsi_disable(dsi);
+	exynos_dsi_unbind(dsi->dsi);
 
 	drm_encoder_cleanup(encoder);
 }
 
-static const struct component_ops exynos_dsi_component_ops = {
-	.bind	= exynos_dsi_bind,
-	.unbind	= exynos_dsi_unbind,
+static const struct component_ops exynos_dsi_pltfm_component_ops = {
+	.bind	= exynos_dsi_pltfm_bind,
+	.unbind	= exynos_dsi_pltfm_unbind,
 };
 
 static struct exynos_dsi *__exynos_dsi_probe(struct platform_device *pdev)
@@ -1963,20 +1969,52 @@ static void __exynos_dsi_remove(struct exynos_dsi *dsi)
 	mipi_dsi_host_unregister(&dsi->dsi_host);
 }
 
-static int exynos_dsi_probe(struct platform_device *pdev)
+/*
+ * Probe/remove API, used from platforms based on the DRM bridge API.
+ */
+static struct exynos_dsi *exynos_dsi_probe(struct platform_device *pdev)
 {
-	struct exynos_dsi *dsi;
+	return __exynos_dsi_probe(pdev);
+}
+
+static void exynos_dsi_remove(struct exynos_dsi *dsi)
+{
+	return __exynos_dsi_remove(dsi);
+}
+
+/*
+ * Bind/unbind API, used from platforms based on the component framework.
+ */
+static int exynos_dsi_bind(struct exynos_dsi *dsi, struct drm_encoder *encoder)
+{
+	struct drm_bridge *previous = drm_bridge_chain_get_first_bridge(encoder);
+
+	return drm_bridge_attach(encoder, &dsi->bridge, previous, 0);
+}
+
+static void exynos_dsi_unbind(struct exynos_dsi *dsi)
+{
+	exynos_dsi_disable(dsi);
+}
+
+static int exynos_dsi_pltfm_probe(struct platform_device *pdev)
+{
+	struct exynos_dsi_pltfm *dsi;
 	struct device *dev = &pdev->dev;
 	int ret;
 
-	dsi = __exynos_dsi_probe(pdev);
-	if (IS_ERR(dsi))
-		return PTR_ERR(dsi);
+	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
+	if (!dsi)
+		return -ENOMEM;
 	platform_set_drvdata(pdev, dsi);
 
+	dsi->dsi = exynos_dsi_probe(pdev);
+	if (IS_ERR(dsi->dsi))
+		return PTR_ERR(dsi->dsi);
+
 	pm_runtime_enable(dev);
 
-	ret = component_add(dev, &exynos_dsi_component_ops);
+	ret = component_add(dev, &exynos_dsi_pltfm_component_ops);
 	if (ret)
 		goto err_disable_runtime;
 
@@ -1988,22 +2026,21 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int exynos_dsi_remove(struct platform_device *pdev)
+static int exynos_dsi_pltfm_remove(struct platform_device *pdev)
 {
-	struct exynos_dsi *dsi = platform_get_drvdata(pdev);
+	struct exynos_dsi_pltfm *dsi = platform_get_drvdata(pdev);
 
 	pm_runtime_disable(&pdev->dev);
 
-	__exynos_dsi_remove(dsi);
+	exynos_dsi_remove(dsi->dsi);
 
-	component_del(&pdev->dev, &exynos_dsi_component_ops);
+	component_del(&pdev->dev, &exynos_dsi_pltfm_component_ops);
 
 	return 0;
 }
 
-static int __maybe_unused exynos_dsi_suspend(struct device *dev)
+static int exynos_dsi_suspend(struct exynos_dsi *dsi)
 {
-	struct exynos_dsi *dsi = dev_get_drvdata(dev);
 	const struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
 	int ret, i;
 
@@ -2031,9 +2068,8 @@ static int __maybe_unused exynos_dsi_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused exynos_dsi_resume(struct device *dev)
+static int exynos_dsi_resume(struct exynos_dsi *dsi)
 {
-	struct exynos_dsi *dsi = dev_get_drvdata(dev);
 	const struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
 	int ret, i;
 
@@ -2065,15 +2101,29 @@ static int __maybe_unused exynos_dsi_resume(struct device *dev)
 	return ret;
 }
 
+static int __maybe_unused exynos_dsi_pltfm_suspend(struct device *dev)
+{
+	struct exynos_dsi_pltfm *dsi = dev_get_drvdata(dev);
+
+	return exynos_dsi_suspend(dsi->dsi);
+}
+
+static int __maybe_unused exynos_dsi_pltfm_resume(struct device *dev)
+{
+	struct exynos_dsi_pltfm *dsi = dev_get_drvdata(dev);
+
+	return exynos_dsi_resume(dsi->dsi);
+}
+
 static const struct dev_pm_ops exynos_dsi_pm_ops = {
-	SET_RUNTIME_PM_OPS(exynos_dsi_suspend, exynos_dsi_resume, NULL)
+	SET_RUNTIME_PM_OPS(exynos_dsi_pltfm_suspend, exynos_dsi_pltfm_resume, NULL)
 	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
 				pm_runtime_force_resume)
 };
 
 struct platform_driver dsi_driver = {
-	.probe = exynos_dsi_probe,
-	.remove = exynos_dsi_remove,
+	.probe = exynos_dsi_pltfm_probe,
+	.remove = exynos_dsi_pltfm_remove,
 	.driver = {
 		   .name = "exynos-dsi",
 		   .owner = THIS_MODULE,
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
