Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6388F266069
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 15:39:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42C426EA41;
	Fri, 11 Sep 2020 13:39:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF7DD6E116
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 13:39:12 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kGjGg-0005Is-PM; Fri, 11 Sep 2020 15:39:10 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 06/21] drm/imx: imx-ldb: move initialization into probe
Date: Fri, 11 Sep 2020 15:38:40 +0200
Message-Id: <20200911133855.29801-6-p.zabel@pengutronix.de>
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

The parts of the initialization that do not require the drm device can
be done once during probe instead of possibly multiple times during
bind. The bind function only creates the encoders.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
New in v2.
---
 drivers/gpu/drm/imx/imx-ldb.c | 72 ++++++++++++++++++-----------------
 1 file changed, 37 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/imx/imx-ldb.c b/drivers/gpu/drm/imx/imx-ldb.c
index 288a81f134fe..c3639cc32ddf 100644
--- a/drivers/gpu/drm/imx/imx-ldb.c
+++ b/drivers/gpu/drm/imx/imx-ldb.c
@@ -415,6 +415,9 @@ static int imx_ldb_register(struct drm_device *drm,
 	struct drm_encoder *encoder = &imx_ldb_ch->encoder;
 	int ret;
 
+	memset(connector, 0, sizeof(*connector));
+	memset(encoder, 0, sizeof(*encoder));
+
 	ret = imx_drm_encoder_parse_of(drm, encoder, imx_ldb_ch->child);
 	if (ret)
 		return ret;
@@ -559,17 +562,42 @@ static int imx_ldb_panel_ddc(struct device *dev,
 static int imx_ldb_bind(struct device *dev, struct device *master, void *data)
 {
 	struct drm_device *drm = data;
+	struct imx_ldb *imx_ldb = dev_get_drvdata(dev);
+	int ret;
+	int i;
+
+	for (i = 0; i < 2; i++) {
+		struct imx_ldb_channel *channel = &imx_ldb->channel[i];
+
+		if (!channel->ldb)
+			break;
+
+		ret = imx_ldb_register(drm, channel);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct component_ops imx_ldb_ops = {
+	.bind	= imx_ldb_bind,
+};
+
+static int imx_ldb_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	const struct of_device_id *of_id =
-			of_match_device(imx_ldb_dt_ids, dev);
+	const struct of_device_id *of_id = of_match_device(imx_ldb_dt_ids, dev);
 	struct device_node *child;
 	struct imx_ldb *imx_ldb;
 	int dual;
 	int ret;
 	int i;
 
-	imx_ldb = dev_get_drvdata(dev);
-	memset(imx_ldb, 0, sizeof(*imx_ldb));
+	imx_ldb = devm_kzalloc(dev, sizeof(*imx_ldb), GFP_KERNEL);
+	if (!imx_ldb)
+		return -ENOMEM;
 
 	imx_ldb->regmap = syscon_regmap_lookup_by_phandle(np, "gpr");
 	if (IS_ERR(imx_ldb->regmap)) {
@@ -669,25 +697,20 @@ static int imx_ldb_bind(struct device *dev, struct device *master, void *data)
 		}
 		channel->bus_format = bus_format;
 		channel->child = child;
-
-		ret = imx_ldb_register(drm, channel);
-		if (ret) {
-			channel->child = NULL;
-			goto free_child;
-		}
 	}
 
-	return 0;
+	platform_set_drvdata(pdev, imx_ldb);
+
+	return component_add(&pdev->dev, &imx_ldb_ops);
 
 free_child:
 	of_node_put(child);
 	return ret;
 }
 
-static void imx_ldb_unbind(struct device *dev, struct device *master,
-	void *data)
+static int imx_ldb_remove(struct platform_device *pdev)
 {
-	struct imx_ldb *imx_ldb = dev_get_drvdata(dev);
+	struct imx_ldb *imx_ldb = platform_get_drvdata(pdev);
 	int i;
 
 	for (i = 0; i < 2; i++) {
@@ -696,28 +719,7 @@ static void imx_ldb_unbind(struct device *dev, struct device *master,
 		kfree(channel->edid);
 		i2c_put_adapter(channel->ddc);
 	}
-}
-
-static const struct component_ops imx_ldb_ops = {
-	.bind	= imx_ldb_bind,
-	.unbind	= imx_ldb_unbind,
-};
 
-static int imx_ldb_probe(struct platform_device *pdev)
-{
-	struct imx_ldb *imx_ldb;
-
-	imx_ldb = devm_kzalloc(&pdev->dev, sizeof(*imx_ldb), GFP_KERNEL);
-	if (!imx_ldb)
-		return -ENOMEM;
-
-	platform_set_drvdata(pdev, imx_ldb);
-
-	return component_add(&pdev->dev, &imx_ldb_ops);
-}
-
-static int imx_ldb_remove(struct platform_device *pdev)
-{
 	component_del(&pdev->dev, &imx_ldb_ops);
 	return 0;
 }
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
