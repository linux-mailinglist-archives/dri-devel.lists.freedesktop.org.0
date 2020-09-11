Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 304D82660C5
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 15:57:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F0026E958;
	Fri, 11 Sep 2020 13:57:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB7B6EA6C
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 13:57:29 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kGjYN-0000W2-Eg; Fri, 11 Sep 2020 15:57:27 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 7/7] drm/imx: ipuv3-crtc: use drmm_crtc_alloc_with_planes()
Date: Fri, 11 Sep 2020 15:57:24 +0200
Message-Id: <20200911135724.25833-7-p.zabel@pengutronix.de>
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

Merge ipu_crtc_init into ipu_drm_bind and use
drmm_crtc_alloc_with_planes().
This allows to drop the custom drm_crtc_cleanup action.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
New in v3, example conversion of drm_crtc_init_with_planes() user.
---
 drivers/gpu/drm/imx/ipuv3-crtc.c | 71 ++++++++++++--------------------
 1 file changed, 26 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3-crtc.c b/drivers/gpu/drm/imx/ipuv3-crtc.c
index f284e4ea6d5f..982ef79653ae 100644
--- a/drivers/gpu/drm/imx/ipuv3-crtc.c
+++ b/drivers/gpu/drm/imx/ipuv3-crtc.c
@@ -349,47 +349,43 @@ static int ipu_get_resources(struct drm_device *dev, struct ipu_crtc *ipu_crtc,
 	return 0;
 }
 
-static void ipu_crtc_cleanup(struct drm_device *drm, void *ptr)
-{
-	struct drm_crtc *crtc = ptr;
-
-	drm_crtc_cleanup(crtc);
-}
-
-static int ipu_crtc_init(struct ipu_crtc *ipu_crtc,
-	struct ipu_client_platformdata *pdata, struct drm_device *drm)
+static int ipu_drm_bind(struct device *dev, struct device *master, void *data)
 {
-	struct ipu_soc *ipu = dev_get_drvdata(ipu_crtc->dev->parent);
-	struct drm_crtc *crtc = &ipu_crtc->base;
+	struct ipu_client_platformdata *pdata = dev->platform_data;
+	struct ipu_soc *ipu = dev_get_drvdata(dev->parent);
+	struct drm_device *drm = data;
+	struct ipu_plane *primary_plane;
+	struct ipu_crtc *ipu_crtc;
+	struct drm_crtc *crtc;
 	int dp = -EINVAL;
 	int ret;
 
-	ret = ipu_get_resources(drm, ipu_crtc, pdata);
-	if (ret) {
-		dev_err(ipu_crtc->dev, "getting resources failed with %d.\n",
-				ret);
-		return ret;
-	}
-
 	if (pdata->dp >= 0)
 		dp = IPU_DP_FLOW_SYNC_BG;
-	ipu_crtc->plane[0] = ipu_plane_init(drm, ipu, pdata->dma[0], dp, 0,
-					    DRM_PLANE_TYPE_PRIMARY);
-	if (IS_ERR(ipu_crtc->plane[0])) {
-		ret = PTR_ERR(ipu_crtc->plane[0]);
-		return ret;
-	}
+	primary_plane = ipu_plane_init(drm, ipu, pdata->dma[0], dp, 0,
+				       DRM_PLANE_TYPE_PRIMARY);
+	if (IS_ERR(primary_plane))
+		return PTR_ERR(primary_plane);
 
+	ipu_crtc = drmm_crtc_alloc_with_planes(drm, struct ipu_crtc, base,
+					       &primary_plane->base, NULL,
+					       &ipu_crtc_funcs, NULL);
+	if (IS_ERR(ipu_crtc))
+		return PTR_ERR(ipu_crtc);
+
+	ipu_crtc->dev = dev;
+	ipu_crtc->plane[0] = primary_plane;
+
+	crtc = &ipu_crtc->base;
 	crtc->port = pdata->of_node;
 	drm_crtc_helper_add(crtc, &ipu_helper_funcs);
-	ret = drm_crtc_init_with_planes(drm, crtc, &ipu_crtc->plane[0]->base,
-					NULL, &ipu_crtc_funcs, NULL);
-	if (ret)
-		return ret;
 
-	ret = drmm_add_action_or_reset(drm, ipu_crtc_cleanup, crtc);
-	if (ret)
+	ret = ipu_get_resources(drm, ipu_crtc, pdata);
+	if (ret) {
+		dev_err(ipu_crtc->dev, "getting resources failed with %d.\n",
+			ret);
 		return ret;
+	}
 
 	/* If this crtc is using the DP, add an overlay plane */
 	if (pdata->dp >= 0 && pdata->dma[1] > 0) {
@@ -414,21 +410,6 @@ static int ipu_crtc_init(struct ipu_crtc *ipu_crtc,
 	return 0;
 }
 
-static int ipu_drm_bind(struct device *dev, struct device *master, void *data)
-{
-	struct ipu_client_platformdata *pdata = dev->platform_data;
-	struct drm_device *drm = data;
-	struct ipu_crtc *ipu_crtc;
-
-	ipu_crtc = drmm_kzalloc(drm, sizeof(*ipu_crtc), GFP_KERNEL);
-	if (!ipu_crtc)
-		return -ENOMEM;
-
-	ipu_crtc->dev = dev;
-
-	return ipu_crtc_init(ipu_crtc, pdata, drm);
-}
-
 static const struct component_ops ipu_crtc_ops = {
 	.bind = ipu_drm_bind,
 };
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
