Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 033672660B5
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 15:54:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84E9C6EA60;
	Fri, 11 Sep 2020 13:54:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3148F6EA59
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 13:54:22 +0000 (UTC)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mtr@pengutronix.de>)
 id 1kGjVK-0007wX-4H; Fri, 11 Sep 2020 15:54:20 +0200
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
 id 1kGjVH-00FKnq-Nx; Fri, 11 Sep 2020 15:54:15 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org
Date: Fri, 11 Sep 2020 15:54:07 +0200
Message-Id: <20200911135413.3654800-11-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200911135413.3654800-1-m.tretter@pengutronix.de>
References: <20200911135413.3654800-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
 metis.ext.pengutronix.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=4.0 tests=AWL,BAYES_00,RDNS_NONE,
 SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no autolearn_force=no
 version=3.4.2
Subject: [PATCH v2 10/16] drm/exynos: implement a drm bridge
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

Make the exynos_dsi driver a full drm bridge that can be found and used
from other drivers.

Other drivers can only attach to the bridge, if a mipi dsi device
already attached to the bridge. This allows to defer the probe of the
display pipe until the downstream bridges are available, too.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
v2:
- move attach of out_bridge to bridge_attach
- add bridge_detach
- don't cleanup encoder if create_connector failed
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 103 +++++++++++++++++-------
 1 file changed, 75 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 2d75f9877dc0..5e7c1a99a3ee 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -266,6 +266,7 @@ struct exynos_dsi_driver_data {
 
 struct exynos_dsi {
 	struct drm_encoder encoder;
+	struct drm_bridge bridge;
 	struct mipi_dsi_host dsi_host;
 	struct drm_connector connector;
 	struct drm_panel *panel;
@@ -1602,6 +1603,60 @@ static const struct drm_encoder_helper_funcs exynos_dsi_encoder_helper_funcs = {
 	.disable = exynos_dsi_disable,
 };
 
+static int exynos_dsi_bridge_attach(struct drm_bridge *bridge,
+				    enum drm_bridge_attach_flags flags)
+{
+	struct exynos_dsi *dsi = bridge->driver_private;
+	struct drm_encoder *encoder = bridge->encoder;
+	int ret;
+
+	if (!dsi->out_bridge && !dsi->panel)
+		return -EPROBE_DEFER;
+
+	if (dsi->out_bridge) {
+		ret = drm_bridge_attach(encoder, dsi->out_bridge,
+					bridge, flags);
+		if (ret)
+			return ret;
+		list_splice_init(&encoder->bridge_chain, &dsi->bridge_chain);
+	} else {
+		ret = exynos_dsi_create_connector(encoder);
+		if (ret)
+			return ret;
+
+		if (dsi->panel) {
+			dsi->connector.status = connector_status_connected;
+		}
+	}
+
+	return 0;
+}
+
+static void exynos_dsi_bridge_detach(struct drm_bridge *bridge)
+{
+	struct exynos_dsi *dsi = bridge->driver_private;
+	struct drm_encoder *encoder = bridge->encoder;
+	struct drm_device *drm = encoder->dev;
+
+	if (dsi->panel) {
+		mutex_lock(&drm->mode_config.mutex);
+		exynos_dsi_disable(&dsi->encoder);
+		dsi->panel = NULL;
+		dsi->connector.status = connector_status_disconnected;
+		mutex_unlock(&drm->mode_config.mutex);
+	} else {
+		if (dsi->out_bridge->funcs->detach)
+			dsi->out_bridge->funcs->detach(dsi->out_bridge);
+		dsi->out_bridge = NULL;
+		INIT_LIST_HEAD(&dsi->bridge_chain);
+	}
+}
+
+static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
+	.attach = exynos_dsi_bridge_attach,
+	.detach = exynos_dsi_bridge_detach,
+};
+
 MODULE_DEVICE_TABLE(of, exynos_dsi_of_match);
 
 static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
@@ -1609,25 +1664,12 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 {
 	struct exynos_dsi *dsi = host_to_dsi(host);
 	const struct exynos_dsi_host_ops *ops = dsi->driver_data->host_ops;
-	struct drm_encoder *encoder = &dsi->encoder;
 	struct drm_bridge *out_bridge;
 
-	out_bridge  = of_drm_find_bridge(device->dev.of_node);
+	out_bridge = of_drm_find_bridge(device->dev.of_node);
 	if (out_bridge) {
-		drm_bridge_attach(encoder, out_bridge, NULL, 0);
 		dsi->out_bridge = out_bridge;
-		list_splice_init(&encoder->bridge_chain, &dsi->bridge_chain);
 	} else {
-		int ret = exynos_dsi_create_connector(encoder);
-
-		if (ret) {
-			DRM_DEV_ERROR(dsi->dev,
-				      "failed to create connector ret = %d\n",
-				      ret);
-			drm_encoder_cleanup(encoder);
-			return ret;
-		}
-
 		dsi->panel = of_drm_find_panel(device->dev.of_node);
 		if (IS_ERR(dsi->panel))
 			dsi->panel = NULL;
@@ -1662,20 +1704,6 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
 {
 	struct exynos_dsi *dsi = host_to_dsi(host);
 	const struct exynos_dsi_host_ops *ops = dsi->driver_data->host_ops;
-	struct drm_device *drm = dsi->encoder.dev;
-
-	if (dsi->panel) {
-		mutex_lock(&drm->mode_config.mutex);
-		exynos_dsi_disable(&dsi->encoder);
-		dsi->panel = NULL;
-		dsi->connector.status = connector_status_disconnected;
-		mutex_unlock(&drm->mode_config.mutex);
-	} else {
-		if (dsi->out_bridge->funcs->detach)
-			dsi->out_bridge->funcs->detach(dsi->out_bridge);
-		dsi->out_bridge = NULL;
-		INIT_LIST_HEAD(&dsi->bridge_chain);
-	}
 
 	if (ops && ops->detach)
 		ops->detach(dsi->dsi_host.dev, device);
@@ -1786,7 +1814,15 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
 		of_node_put(in_bridge_node);
 	}
 
+	ret = drm_bridge_attach(encoder, &dsi->bridge, in_bridge, 0);
+	if (ret)
+		goto err;
+
 	return 0;
+
+err:
+	drm_encoder_cleanup(encoder);
+	return ret;
 }
 
 static void exynos_dsi_unbind(struct device *dev, struct device *master,
@@ -1796,6 +1832,8 @@ static void exynos_dsi_unbind(struct device *dev, struct device *master,
 	struct drm_encoder *encoder = &dsi->encoder;
 
 	exynos_dsi_disable(encoder);
+
+	drm_encoder_cleanup(encoder);
 }
 
 static const struct component_ops exynos_dsi_component_ops = {
@@ -1806,6 +1844,7 @@ static const struct component_ops exynos_dsi_component_ops = {
 static struct exynos_dsi *__exynos_dsi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct drm_bridge *bridge;
 	struct resource *res;
 	struct exynos_dsi *dsi;
 	int ret, i;
@@ -1894,11 +1933,19 @@ static struct exynos_dsi *__exynos_dsi_probe(struct platform_device *pdev)
 	if (ret)
 		return ERR_PTR(ret);
 
+	bridge = &dsi->bridge;
+	bridge->driver_private = dsi;
+	bridge->funcs = &exynos_dsi_bridge_funcs;
+	bridge->of_node = dev->of_node;
+	drm_bridge_add(bridge);
+
 	return dsi;
 }
 
 static void __exynos_dsi_remove(struct exynos_dsi *dsi)
 {
+	drm_bridge_remove(&dsi->bridge);
+
 	mipi_dsi_host_unregister(&dsi->dsi_host);
 }
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
