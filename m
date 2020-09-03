Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CED25C7AC
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 18:57:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A016EA1A;
	Thu,  3 Sep 2020 16:57:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53C736EA12
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 16:57:25 +0000 (UTC)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mtr@pengutronix.de>)
 id 1kDsY5-0003Y6-GD; Thu, 03 Sep 2020 18:57:23 +0200
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
 id 1kDsY3-005L3B-J4; Thu, 03 Sep 2020 18:57:19 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org
Date: Thu,  3 Sep 2020 18:57:05 +0200
Message-Id: <20200903165717.1272492-5-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200903165717.1272492-1-m.tretter@pengutronix.de>
References: <20200903165717.1272492-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
 metis.ext.pengutronix.de
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=4.0 tests=BAYES_00,RDNS_NONE,
 SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no autolearn_force=no
 version=3.4.2
Subject: [PATCH 04/16] drm/exynos: implement a drm bridge
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
Cc: Michael Tretter <m.tretter@pengutronix.de>, krzk@kernel.org,
 Laurent.pinchart@ideasonboard.com, kernel@pengutronix.de,
 narmstrong@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make the exynos_dsi driver a full drm bridge that can be found and used
from other drivers.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 45 +++++++++++++++++++++++--
 1 file changed, 42 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index ddbda33dea91..4d19630f33e7 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -253,6 +253,7 @@ struct exynos_dsi_driver_data {
 
 struct exynos_dsi {
 	struct drm_encoder encoder;
+	struct drm_bridge bridge;
 	struct mipi_dsi_host dsi_host;
 	struct drm_connector connector;
 	struct drm_panel *panel;
@@ -1523,19 +1524,43 @@ static const struct drm_encoder_helper_funcs exynos_dsi_encoder_helper_funcs = {
 	.disable = exynos_dsi_disable,
 };
 
+static int exynos_dsi_bridge_attach(struct drm_bridge *bridge,
+				    enum drm_bridge_attach_flags flags)
+{
+	struct exynos_dsi *dsi = bridge->driver_private;
+
+	if (!bridge->encoder) {
+		dev_err(dsi->dev, "missing encoder\n");
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
+	.attach = exynos_dsi_bridge_attach,
+};
+
 MODULE_DEVICE_TABLE(of, exynos_dsi_of_match);
 
 static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 				  struct mipi_dsi_device *device)
 {
 	struct exynos_dsi *dsi = host_to_dsi(host);
-	struct drm_encoder *encoder = &dsi->encoder;
-	struct drm_device *drm = encoder->dev;
+	struct drm_bridge *bridge = &dsi->bridge;
+	struct drm_encoder *encoder;
+	struct drm_device *drm;
 	struct drm_bridge *out_bridge;
 
+	if (!bridge->encoder)
+		return -EPROBE_DEFER;
+
+	encoder = bridge->encoder;
+	drm = encoder->dev;
+
 	out_bridge  = of_drm_find_bridge(device->dev.of_node);
 	if (out_bridge) {
-		drm_bridge_attach(encoder, out_bridge, NULL, 0);
+		drm_bridge_attach(encoder, out_bridge, bridge, 0);
 		dsi->out_bridge = out_bridge;
 		list_splice_init(&encoder->bridge_chain, &dsi->bridge_chain);
 	} else {
@@ -1715,6 +1740,10 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
 		of_node_put(in_bridge_node);
 	}
 
+	ret = drm_bridge_attach(encoder, &dsi->bridge, in_bridge, 0);
+	if (ret)
+		return ret;
+
 	return mipi_dsi_host_register(&dsi->dsi_host);
 }
 
@@ -1740,6 +1769,7 @@ static struct exynos_dsi *__exynos_dsi_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct exynos_dsi *dsi;
 	int ret, i;
+	struct drm_bridge *bridge;
 
 	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
 	if (!dsi)
@@ -1823,11 +1853,20 @@ static struct exynos_dsi *__exynos_dsi_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(dev);
 
+	bridge = &dsi->bridge;
+	bridge->driver_private = dsi;
+	bridge->funcs = &exynos_dsi_bridge_funcs;
+	bridge->of_node = dev->of_node;
+
+	drm_bridge_add(bridge);
+
 	return dsi;
 }
 
 static void __exynos_dsi_remove(struct exynos_dsi *dsi)
 {
+	drm_bridge_remove(&dsi->bridge);
+
 	pm_runtime_disable(dsi->dev);
 }
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
