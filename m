Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2259E25C7AE
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 18:57:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F0F66EA16;
	Thu,  3 Sep 2020 16:57:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 293236EA1D
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 16:57:28 +0000 (UTC)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mtr@pengutronix.de>)
 id 1kDsY9-0003Y7-OW; Thu, 03 Sep 2020 18:57:26 +0200
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
 id 1kDsY3-005L39-IZ; Thu, 03 Sep 2020 18:57:19 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org
Date: Thu,  3 Sep 2020 18:57:04 +0200
Message-Id: <20200903165717.1272492-4-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200903165717.1272492-1-m.tretter@pengutronix.de>
References: <20200903165717.1272492-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
 metis.ext.pengutronix.de
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=4.0 tests=AWL,BAYES_00,RDNS_NONE,
 SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no autolearn_force=no
 version=3.4.2
Subject: [PATCH 03/16] drm/exynos: remove in_bridge_node from exynos_dsi
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

We do not need to keep a reference to the in_bridge_node, but we can
simply drop it, once we found and attached the previous bridge.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 32f999dfd8c1..ddbda33dea91 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -282,7 +282,6 @@ struct exynos_dsi {
 	struct list_head transfer_list;
 
 	const struct exynos_dsi_driver_data *driver_data;
-	struct device_node *in_bridge_node;
 };
 
 #define host_to_dsi(host) container_of(host, struct exynos_dsi, dsi_host)
@@ -1687,8 +1686,6 @@ static int exynos_dsi_parse_dt(struct exynos_dsi *dsi)
 	if (ret < 0)
 		return ret;
 
-	dsi->in_bridge_node = of_graph_get_remote_node(node, DSI_PORT_IN, 0);
-
 	return 0;
 }
 
@@ -1698,6 +1695,7 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
 	struct drm_encoder *encoder = dev_get_drvdata(dev);
 	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
 	struct drm_device *drm_dev = data;
+	struct device_node *in_bridge_node;
 	struct drm_bridge *in_bridge;
 	int ret;
 
@@ -1709,10 +1707,12 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
 	if (ret < 0)
 		return ret;
 
-	if (dsi->in_bridge_node) {
-		in_bridge = of_drm_find_bridge(dsi->in_bridge_node);
+	in_bridge_node = of_graph_get_remote_node(dev->of_node, DSI_PORT_IN, 0);
+	if (in_bridge_node) {
+		in_bridge = of_drm_find_bridge(in_bridge_node);
 		if (in_bridge)
 			drm_bridge_attach(encoder, in_bridge, NULL, 0);
+		of_node_put(in_bridge_node);
 	}
 
 	return mipi_dsi_host_register(&dsi->dsi_host);
@@ -1828,8 +1828,6 @@ static struct exynos_dsi *__exynos_dsi_probe(struct platform_device *pdev)
 
 static void __exynos_dsi_remove(struct exynos_dsi *dsi)
 {
-	of_node_put(dsi->in_bridge_node);
-
 	pm_runtime_disable(dsi->dev);
 }
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
