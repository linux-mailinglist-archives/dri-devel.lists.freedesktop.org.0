Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3F025C7B2
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 18:57:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FA5C6EA24;
	Thu,  3 Sep 2020 16:57:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A1B6EA1C
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 16:57:28 +0000 (UTC)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mtr@pengutronix.de>)
 id 1kDsY9-0003YA-Ok; Thu, 03 Sep 2020 18:57:26 +0200
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
 id 1kDsY3-005L3Q-Kq; Thu, 03 Sep 2020 18:57:19 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org
Date: Thu,  3 Sep 2020 18:57:09 +0200
Message-Id: <20200903165717.1272492-9-m.tretter@pengutronix.de>
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
Subject: [PATCH 08/16] drm/exynos: use exynos_dsi as drvdata
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

Use the exynos_dsi as drvdata instead of the encoder to further decouple
the driver from the encoder.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 23 +++++++----------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 51ec37304a69..2e8142464b74 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -290,11 +290,6 @@ struct exynos_dsi {
 #define host_to_dsi(host) container_of(host, struct exynos_dsi, dsi_host)
 #define connector_to_dsi(c) container_of(c, struct exynos_dsi, connector)
 
-static inline struct exynos_dsi *encoder_to_dsi(struct drm_encoder *e)
-{
-	return container_of(e, struct exynos_dsi, encoder);
-}
-
 enum reg_idx {
 	DSIM_STATUS_REG,	/* Status register */
 	DSIM_SWRST_REG,		/* Software reset register */
@@ -1738,8 +1733,8 @@ static int exynos_dsi_parse_dt(struct exynos_dsi *dsi)
 static int exynos_dsi_bind(struct device *dev, struct device *master,
 				void *data)
 {
-	struct drm_encoder *encoder = dev_get_drvdata(dev);
-	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
+	struct exynos_dsi *dsi = dev_get_drvdata(dev);
+	struct drm_encoder *encoder = &dsi->encoder;
 	struct drm_device *drm_dev = data;
 	struct device_node *in_bridge_node;
 	struct drm_bridge *in_bridge;
@@ -1769,8 +1764,7 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
 static void exynos_dsi_unbind(struct device *dev, struct device *master,
 				void *data)
 {
-	struct drm_encoder *encoder = dev_get_drvdata(dev);
-	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
+	struct exynos_dsi *dsi = dev_get_drvdata(dev);
 
 	exynos_dsi_disable(dsi);
 
@@ -1896,15 +1890,14 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	dsi = __exynos_dsi_probe(pdev);
 	if (IS_ERR(dsi))
 		return PTR_ERR(dsi);
-	platform_set_drvdata(pdev, &dsi->encoder);
+	platform_set_drvdata(pdev, dsi);
 
 	return component_add(&pdev->dev, &exynos_dsi_component_ops);
 }
 
 static int exynos_dsi_remove(struct platform_device *pdev)
 {
-	struct drm_encoder *encoder = platform_get_drvdata(pdev);
-	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
+	struct exynos_dsi *dsi = platform_get_drvdata(pdev);
 
 	__exynos_dsi_remove(dsi);
 
@@ -1915,8 +1908,7 @@ static int exynos_dsi_remove(struct platform_device *pdev)
 
 static int __maybe_unused exynos_dsi_suspend(struct device *dev)
 {
-	struct drm_encoder *encoder = dev_get_drvdata(dev);
-	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
+	struct exynos_dsi *dsi = dev_get_drvdata(dev);
 	const struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
 	int ret, i;
 
@@ -1946,8 +1938,7 @@ static int __maybe_unused exynos_dsi_suspend(struct device *dev)
 
 static int __maybe_unused exynos_dsi_resume(struct device *dev)
 {
-	struct drm_encoder *encoder = dev_get_drvdata(dev);
-	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
+	struct exynos_dsi *dsi = dev_get_drvdata(dev);
 	const struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
 	int ret, i;
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
