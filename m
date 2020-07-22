Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5097922993A
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 15:31:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0F5A6E828;
	Wed, 22 Jul 2020 13:30:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15D9B6E471
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 13:30:52 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1jyEpe-0002o0-KE; Wed, 22 Jul 2020 15:30:50 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 7/8] drm/imx: move call to ipu_plane_get_resources() into
 ipu_plane_init()
Date: Wed, 22 Jul 2020 15:30:41 +0200
Message-Id: <20200722133042.30140-7-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200722133042.30140-1-p.zabel@pengutronix.de>
References: <20200722133042.30140-1-p.zabel@pengutronix.de>
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

Use drm managed resources to get and put IPU resources automatically.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/gpu/drm/imx/ipuv3-crtc.c  | 25 +------------------------
 drivers/gpu/drm/imx/ipuv3-plane.c | 29 ++++++++++++++++++++---------
 drivers/gpu/drm/imx/ipuv3-plane.h |  3 ---
 3 files changed, 21 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3-crtc.c b/drivers/gpu/drm/imx/ipuv3-crtc.c
index 2256c9789fc2..b0dacbadaf52 100644
--- a/drivers/gpu/drm/imx/ipuv3-crtc.c
+++ b/drivers/gpu/drm/imx/ipuv3-crtc.c
@@ -385,29 +385,14 @@ static int ipu_crtc_init(struct ipu_crtc *ipu_crtc,
 	drm_crtc_init_with_planes(drm, crtc, &ipu_crtc->plane[0]->base, NULL,
 				  &ipu_crtc_funcs, NULL);
 
-	ret = ipu_plane_get_resources(ipu_crtc->plane[0]);
-	if (ret) {
-		dev_err(ipu_crtc->dev, "getting plane 0 resources failed with %d.\n",
-			ret);
-		goto err_put_resources;
-	}
-
 	/* If this crtc is using the DP, add an overlay plane */
 	if (pdata->dp >= 0 && pdata->dma[1] > 0) {
 		ipu_crtc->plane[1] = ipu_plane_init(drm, ipu, pdata->dma[1],
 						IPU_DP_FLOW_SYNC_FG,
 						drm_crtc_mask(&ipu_crtc->base),
 						DRM_PLANE_TYPE_OVERLAY);
-		if (IS_ERR(ipu_crtc->plane[1])) {
+		if (IS_ERR(ipu_crtc->plane[1]))
 			ipu_crtc->plane[1] = NULL;
-		} else {
-			ret = ipu_plane_get_resources(ipu_crtc->plane[1]);
-			if (ret) {
-				dev_err(ipu_crtc->dev, "getting plane 1 "
-					"resources failed with %d.\n", ret);
-				goto err_put_plane0_res;
-			}
-		}
 	}
 
 	ipu_crtc->irq = ipu_plane_irq(ipu_crtc->plane[0]);
@@ -422,11 +407,6 @@ static int ipu_crtc_init(struct ipu_crtc *ipu_crtc,
 
 	return 0;
 
-err_put_plane1_res:
-	if (ipu_crtc->plane[1])
-		ipu_plane_put_resources(ipu_crtc->plane[1]);
-err_put_plane0_res:
-	ipu_plane_put_resources(ipu_crtc->plane[0]);
 err_put_resources:
 	ipu_put_resources(ipu_crtc);
 
@@ -453,9 +433,6 @@ static void ipu_drm_unbind(struct device *dev, struct device *master,
 	struct ipu_crtc *ipu_crtc = dev_get_drvdata(dev);
 
 	ipu_put_resources(ipu_crtc);
-	if (ipu_crtc->plane[1])
-		ipu_plane_put_resources(ipu_crtc->plane[1]);
-	ipu_plane_put_resources(ipu_crtc->plane[0]);
 }
 
 static const struct component_ops ipu_crtc_ops = {
diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3-plane.c
index 9543e4c2907a..d7464051514f 100644
--- a/drivers/gpu/drm/imx/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3-plane.c
@@ -143,8 +143,10 @@ drm_plane_state_to_vbo(struct drm_plane_state *state)
 	       fb->format->cpp[2] * x - eba;
 }
 
-void ipu_plane_put_resources(struct ipu_plane *ipu_plane)
+static void ipu_plane_put_resources(struct drm_device *dev, void *ptr)
 {
+	struct ipu_plane *ipu_plane = ptr;
+
 	if (!IS_ERR_OR_NULL(ipu_plane->dp))
 		ipu_dp_put(ipu_plane->dp);
 	if (!IS_ERR_OR_NULL(ipu_plane->dmfc))
@@ -155,7 +157,8 @@ void ipu_plane_put_resources(struct ipu_plane *ipu_plane)
 		ipu_idmac_put(ipu_plane->alpha_ch);
 }
 
-int ipu_plane_get_resources(struct ipu_plane *ipu_plane)
+static int ipu_plane_get_resources(struct drm_device *dev,
+				   struct ipu_plane *ipu_plane)
 {
 	int ret;
 	int alpha_ch;
@@ -167,6 +170,10 @@ int ipu_plane_get_resources(struct ipu_plane *ipu_plane)
 		return ret;
 	}
 
+	ret = drmm_add_action_or_reset(dev, ipu_plane_put_resources, ipu_plane);
+	if (ret)
+		return ret;
+
 	alpha_ch = ipu_channel_alpha_channel(ipu_plane->dma);
 	if (alpha_ch >= 0) {
 		ipu_plane->alpha_ch = ipu_idmac_get(ipu_plane->ipu, alpha_ch);
@@ -182,7 +189,7 @@ int ipu_plane_get_resources(struct ipu_plane *ipu_plane)
 	if (IS_ERR(ipu_plane->dmfc)) {
 		ret = PTR_ERR(ipu_plane->dmfc);
 		DRM_ERROR("failed to get dmfc: ret %d\n", ret);
-		goto err_out;
+		return ret;
 	}
 
 	if (ipu_plane->dp_flow >= 0) {
@@ -190,15 +197,11 @@ int ipu_plane_get_resources(struct ipu_plane *ipu_plane)
 		if (IS_ERR(ipu_plane->dp)) {
 			ret = PTR_ERR(ipu_plane->dp);
 			DRM_ERROR("failed to get dp flow: %d\n", ret);
-			goto err_out;
+			return ret;
 		}
 	}
 
 	return 0;
-err_out:
-	ipu_plane_put_resources(ipu_plane);
-
-	return ret;
 }
 
 static bool ipu_plane_separate_alpha(struct ipu_plane *ipu_plane)
@@ -849,7 +852,8 @@ struct ipu_plane *ipu_plane_init(struct drm_device *dev, struct ipu_soc *ipu,
 				       ARRAY_SIZE(ipu_plane_formats),
 				       modifiers, type, NULL);
 	if (ret) {
-		DRM_ERROR("failed to initialize plane\n");
+		DRM_ERROR("failed to initialize %s plane\n",
+			  zpos ? "overlay" : "primary");
 		return ERR_PTR(ret);
 	}
 
@@ -868,5 +872,12 @@ struct ipu_plane *ipu_plane_init(struct drm_device *dev, struct ipu_soc *ipu,
 	if (ret)
 		return ERR_PTR(ret);
 
+	ret = ipu_plane_get_resources(dev, ipu_plane);
+	if (ret) {
+		DRM_ERROR("failed to get %s plane resources: %pe\n",
+			  zpos ? "overlay" : "primary", &ret);
+		return ERR_PTR(ret);
+	}
+
 	return ipu_plane;
 }
diff --git a/drivers/gpu/drm/imx/ipuv3-plane.h b/drivers/gpu/drm/imx/ipuv3-plane.h
index ffacbcdd2f98..6d544e6ce63f 100644
--- a/drivers/gpu/drm/imx/ipuv3-plane.h
+++ b/drivers/gpu/drm/imx/ipuv3-plane.h
@@ -41,9 +41,6 @@ int ipu_plane_mode_set(struct ipu_plane *plane, struct drm_crtc *crtc,
 		       uint32_t src_x, uint32_t src_y, uint32_t src_w,
 		       uint32_t src_h, bool interlaced);
 
-int ipu_plane_get_resources(struct ipu_plane *plane);
-void ipu_plane_put_resources(struct ipu_plane *plane);
-
 int ipu_plane_irq(struct ipu_plane *plane);
 
 void ipu_plane_disable(struct ipu_plane *ipu_plane, bool disable_dp_channel);
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
