Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E35C82660C9
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 15:57:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB53C6EA6E;
	Fri, 11 Sep 2020 13:57:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 164AF6EA6D
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 13:57:29 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kGjYN-0000W2-EC; Fri, 11 Sep 2020 15:57:27 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 6/7] drm/imx: use drmm_universal_plane_alloc()
Date: Fri, 11 Sep 2020 15:57:23 +0200
Message-Id: <20200911135724.25833-6-p.zabel@pengutronix.de>
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

This allows to drop the custom drm_plane_cleanup action.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
New in v3, example conversion of drm_universal_plane_init() user.
---
 drivers/gpu/drm/imx/ipuv3-plane.c | 34 ++++++++-----------------------
 1 file changed, 9 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3-plane.c
index 38b959aa3564..075508051b5f 100644
--- a/drivers/gpu/drm/imx/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3-plane.c
@@ -815,13 +815,6 @@ int ipu_planes_assign_pre(struct drm_device *dev,
 }
 EXPORT_SYMBOL_GPL(ipu_planes_assign_pre);
 
-static void ipu_plane_cleanup(struct drm_device *dev, void *data)
-{
-	struct ipu_plane *ipu_plane = data;
-
-	drm_plane_cleanup(&ipu_plane->base);
-}
-
 struct ipu_plane *ipu_plane_init(struct drm_device *dev, struct ipu_soc *ipu,
 				 int dma, int dp, unsigned int possible_crtcs,
 				 enum drm_plane_type type)
@@ -834,10 +827,15 @@ struct ipu_plane *ipu_plane_init(struct drm_device *dev, struct ipu_soc *ipu,
 	DRM_DEBUG_KMS("channel %d, dp flow %d, possible_crtcs=0x%x\n",
 		      dma, dp, possible_crtcs);
 
-	ipu_plane = drmm_kzalloc(dev, sizeof(*ipu_plane), GFP_KERNEL);
-	if (!ipu_plane) {
-		DRM_ERROR("failed to allocate plane\n");
-		return ERR_PTR(-ENOMEM);
+	ipu_plane = drmm_universal_plane_alloc(dev, struct ipu_plane, base,
+					       possible_crtcs, &ipu_plane_funcs,
+					       ipu_plane_formats,
+					       ARRAY_SIZE(ipu_plane_formats),
+					       modifiers, type, NULL);
+	if (IS_ERR(ipu_plane)) {
+		DRM_ERROR("failed to allocate and initialize %s plane\n",
+			  zpos ? "overlay" : "primary");
+		return ipu_plane;
 	}
 
 	ipu_plane->ipu = ipu;
@@ -847,20 +845,6 @@ struct ipu_plane *ipu_plane_init(struct drm_device *dev, struct ipu_soc *ipu,
 	if (ipu_prg_present(ipu))
 		modifiers = pre_format_modifiers;
 
-	ret = drm_universal_plane_init(dev, &ipu_plane->base, possible_crtcs,
-				       &ipu_plane_funcs, ipu_plane_formats,
-				       ARRAY_SIZE(ipu_plane_formats),
-				       modifiers, type, NULL);
-	if (ret) {
-		DRM_ERROR("failed to initialize %s plane\n",
-			  zpos ? "overlay" : "primary");
-		return ERR_PTR(ret);
-	}
-
-	ret = drmm_add_action_or_reset(dev, ipu_plane_cleanup, ipu_plane);
-	if (ret)
-		return ERR_PTR(ret);
-
 	drm_plane_helper_add(&ipu_plane->base, &ipu_plane_helper_funcs);
 
 	if (dp == IPU_DP_FLOW_SYNC_BG || dp == IPU_DP_FLOW_SYNC_FG)
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
