Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7DB266065
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 15:39:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DF186EA3F;
	Fri, 11 Sep 2020 13:39:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F246EA34
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 13:39:12 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kGjGg-0005Is-Uf; Fri, 11 Sep 2020 15:39:10 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 17/21] drm/imx: parallel-display: move initialization into
 probe
Date: Fri, 11 Sep 2020 15:38:51 +0200
Message-Id: <20200911133855.29801-17-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200911133855.29801-1-p.zabel@pengutronix.de>
References: <20200911133855.29801-1-p.zabel@pengutronix.de>
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

The parts of the initialization do not require the drm device can be
done once during probe instead of possibly multiple times during bind.
The bind function only creates the encoder.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
New in v2.
---
 drivers/gpu/drm/imx/parallel-display.c | 42 ++++++++++++--------------
 1 file changed, 20 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/imx/parallel-display.c b/drivers/gpu/drm/imx/parallel-display.c
index 16e576f8ee83..42b44dbf45f5 100644
--- a/drivers/gpu/drm/imx/parallel-display.c
+++ b/drivers/gpu/drm/imx/parallel-display.c
@@ -261,6 +261,10 @@ static int imx_pd_register(struct drm_device *drm,
 	struct drm_bridge *bridge = &imxpd->bridge;
 	int ret;
 
+	memset(connector, 0, sizeof(*connector));
+	memset(encoder, 0, sizeof(*encoder));
+	memset(bridge, 0, sizeof(*bridge));
+
 	ret = imx_drm_encoder_parse_of(drm, encoder, imxpd->dev->of_node);
 	if (ret)
 		return ret;
@@ -301,6 +305,18 @@ static int imx_pd_register(struct drm_device *drm,
 static int imx_pd_bind(struct device *dev, struct device *master, void *data)
 {
 	struct drm_device *drm = data;
+	struct imx_parallel_display *imxpd = dev_get_drvdata(dev);
+
+	return imx_pd_register(drm, imxpd);
+}
+
+static const struct component_ops imx_pd_ops = {
+	.bind	= imx_pd_bind,
+};
+
+static int imx_pd_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	const u8 *edidp;
 	struct imx_parallel_display *imxpd;
@@ -309,8 +325,9 @@ static int imx_pd_bind(struct device *dev, struct device *master, void *data)
 	u32 bus_format = 0;
 	const char *fmt;
 
-	imxpd = dev_get_drvdata(dev);
-	memset(imxpd, 0, sizeof(*imxpd));
+	imxpd = devm_kzalloc(dev, sizeof(*imxpd), GFP_KERNEL);
+	if (!imxpd)
+		return -ENOMEM;
 
 	/* port@1 is the output port */
 	ret = drm_of_find_panel_or_bridge(np, 1, 0, &imxpd->panel,
@@ -337,28 +354,9 @@ static int imx_pd_bind(struct device *dev, struct device *master, void *data)
 
 	imxpd->dev = dev;
 
-	ret = imx_pd_register(drm, imxpd);
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-static const struct component_ops imx_pd_ops = {
-	.bind	= imx_pd_bind,
-};
-
-static int imx_pd_probe(struct platform_device *pdev)
-{
-	struct imx_parallel_display *imxpd;
-
-	imxpd = devm_kzalloc(&pdev->dev, sizeof(*imxpd), GFP_KERNEL);
-	if (!imxpd)
-		return -ENOMEM;
-
 	platform_set_drvdata(pdev, imxpd);
 
-	return component_add(&pdev->dev, &imx_pd_ops);
+	return component_add(dev, &imx_pd_ops);
 }
 
 static int imx_pd_remove(struct platform_device *pdev)
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
