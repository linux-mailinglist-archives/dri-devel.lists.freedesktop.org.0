Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B37C922E3D9
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 04:07:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C6A86E135;
	Mon, 27 Jul 2020 02:07:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CD2E6E134
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 02:07:25 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4A7FA2F0F;
 Mon, 27 Jul 2020 04:07:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1595815642;
 bh=nOBFsgZMwbF0SI0ar4Uas2qduyYr222WLybcdVcI55g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mNBQXyNG838vO6HVZ/MihZnxkOhJ01Ufva2CHQe7seHH8d9kZYcXoRR8wRHh79JOt
 v6oaxl+9gMSBW780h0vVPF8u0lGbFo2S7PhQ5dulAffoQGiS6q+gFy6qwTdqNNwWSj
 q6agF9WV9wM7BwOW33mio9h9B6BJpeHHqfoNzFHE=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 18/22] drm: mxsfb: Drop non-OF support
Date: Mon, 27 Jul 2020 05:06:50 +0300
Message-Id: <20200727020654.8231-19-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200727020654.8231-1-laurent.pinchart@ideasonboard.com>
References: <20200727020654.8231-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
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
Cc: Marek Vasut <marex@denx.de>, linux-imx@nxp.com, kernel@pengutronix.de,
 robert.chiras@nxp.com, leonard.crestez@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The mxsfb driver is only used by OF platforms. Drop non-OF support.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Stefan Agner <stefan@agner.ch>
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 25 +++++++------------------
 1 file changed, 7 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 9fe0a37e007d..bb80e12d9120 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -131,7 +131,8 @@ static int mxsfb_attach_bridge(struct mxsfb_drm_private *mxsfb)
 	return 0;
 }
 
-static int mxsfb_load(struct drm_device *drm)
+static int mxsfb_load(struct drm_device *drm,
+		      const struct mxsfb_devdata *devdata)
 {
 	struct platform_device *pdev = to_platform_device(drm->dev);
 	struct mxsfb_drm_private *mxsfb;
@@ -144,7 +145,7 @@ static int mxsfb_load(struct drm_device *drm)
 
 	mxsfb->drm = drm;
 	drm->dev_private = mxsfb;
-	mxsfb->devdata = &mxsfb_devdata[pdev->id_entry->driver_data];
+	mxsfb->devdata = devdata;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	mxsfb->base = devm_ioremap_resource(drm->dev, res);
@@ -280,18 +281,10 @@ static struct drm_driver mxsfb_driver = {
 	.minor	= 0,
 };
 
-static const struct platform_device_id mxsfb_devtype[] = {
-	{ .name = "imx23-fb", .driver_data = MXSFB_V3, },
-	{ .name = "imx28-fb", .driver_data = MXSFB_V4, },
-	{ .name = "imx6sx-fb", .driver_data = MXSFB_V6, },
-	{ /* sentinel */ }
-};
-MODULE_DEVICE_TABLE(platform, mxsfb_devtype);
-
 static const struct of_device_id mxsfb_dt_ids[] = {
-	{ .compatible = "fsl,imx23-lcdif", .data = &mxsfb_devtype[0], },
-	{ .compatible = "fsl,imx28-lcdif", .data = &mxsfb_devtype[1], },
-	{ .compatible = "fsl,imx6sx-lcdif", .data = &mxsfb_devtype[2], },
+	{ .compatible = "fsl,imx23-lcdif", .data = &mxsfb_devdata[MXSFB_V3], },
+	{ .compatible = "fsl,imx28-lcdif", .data = &mxsfb_devdata[MXSFB_V4], },
+	{ .compatible = "fsl,imx6sx-lcdif", .data = &mxsfb_devdata[MXSFB_V6], },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mxsfb_dt_ids);
@@ -306,14 +299,11 @@ static int mxsfb_probe(struct platform_device *pdev)
 	if (!pdev->dev.of_node)
 		return -ENODEV;
 
-	if (of_id)
-		pdev->id_entry = of_id->data;
-
 	drm = drm_dev_alloc(&mxsfb_driver, &pdev->dev);
 	if (IS_ERR(drm))
 		return PTR_ERR(drm);
 
-	ret = mxsfb_load(drm);
+	ret = mxsfb_load(drm, of_id->data);
 	if (ret)
 		goto err_free;
 
@@ -367,7 +357,6 @@ static const struct dev_pm_ops mxsfb_pm_ops = {
 static struct platform_driver mxsfb_platform_driver = {
 	.probe		= mxsfb_probe,
 	.remove		= mxsfb_remove,
-	.id_table	= mxsfb_devtype,
 	.driver	= {
 		.name		= "mxsfb",
 		.of_match_table	= mxsfb_dt_ids,
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
