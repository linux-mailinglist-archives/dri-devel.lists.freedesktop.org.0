Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D748726606C
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 15:39:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFA4A6EA4A;
	Fri, 11 Sep 2020 13:39:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 107EA6EA43
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 13:39:13 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kGjGh-0005Is-00; Fri, 11 Sep 2020 15:39:11 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 19/21] drm/imx: ipuv3-plane: use drm managed resources
Date: Fri, 11 Sep 2020 15:38:53 +0200
Message-Id: <20200911133855.29801-19-p.zabel@pengutronix.de>
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

Use drmm_kzalloc() to align plane memory lifetime with the drm device,
and use drmm_add_action_or_reset() to make sure drm_plane_cleanup() is
called before the memory is freed. Also handle error return values of
the plane property creation functions.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/imx/ipuv3-plane.c | 34 +++++++++++++++++--------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3-plane.c
index 8a4235d9d9f1..d3e6c37bf0fb 100644
--- a/drivers/gpu/drm/imx/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3-plane.c
@@ -11,6 +11,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_plane_helper.h>
 
 #include <video/imx-ipu-v3.h>
@@ -262,16 +263,6 @@ void ipu_plane_disable_deferred(struct drm_plane *plane)
 }
 EXPORT_SYMBOL_GPL(ipu_plane_disable_deferred);
 
-static void ipu_plane_destroy(struct drm_plane *plane)
-{
-	struct ipu_plane *ipu_plane = to_ipu_plane(plane);
-
-	DRM_DEBUG_KMS("[%d] %s\n", __LINE__, __func__);
-
-	drm_plane_cleanup(plane);
-	kfree(ipu_plane);
-}
-
 static void ipu_plane_state_reset(struct drm_plane *plane)
 {
 	unsigned int zpos = (plane->type == DRM_PLANE_TYPE_PRIMARY) ? 0 : 1;
@@ -336,7 +327,6 @@ static bool ipu_plane_format_mod_supported(struct drm_plane *plane,
 static const struct drm_plane_funcs ipu_plane_funcs = {
 	.update_plane	= drm_atomic_helper_update_plane,
 	.disable_plane	= drm_atomic_helper_disable_plane,
-	.destroy	= ipu_plane_destroy,
 	.reset		= ipu_plane_state_reset,
 	.atomic_duplicate_state	= ipu_plane_duplicate_state,
 	.atomic_destroy_state	= ipu_plane_destroy_state,
@@ -822,6 +812,13 @@ int ipu_planes_assign_pre(struct drm_device *dev,
 }
 EXPORT_SYMBOL_GPL(ipu_planes_assign_pre);
 
+static void ipu_plane_cleanup(struct drm_device *dev, void *data)
+{
+	struct ipu_plane *ipu_plane = data;
+
+	drm_plane_cleanup(&ipu_plane->base);
+}
+
 struct ipu_plane *ipu_plane_init(struct drm_device *dev, struct ipu_soc *ipu,
 				 int dma, int dp, unsigned int possible_crtcs,
 				 enum drm_plane_type type)
@@ -834,7 +831,7 @@ struct ipu_plane *ipu_plane_init(struct drm_device *dev, struct ipu_soc *ipu,
 	DRM_DEBUG_KMS("channel %d, dp flow %d, possible_crtcs=0x%x\n",
 		      dma, dp, possible_crtcs);
 
-	ipu_plane = kzalloc(sizeof(*ipu_plane), GFP_KERNEL);
+	ipu_plane = drmm_kzalloc(dev, sizeof(*ipu_plane), GFP_KERNEL);
 	if (!ipu_plane) {
 		DRM_ERROR("failed to allocate plane\n");
 		return ERR_PTR(-ENOMEM);
@@ -853,16 +850,23 @@ struct ipu_plane *ipu_plane_init(struct drm_device *dev, struct ipu_soc *ipu,
 				       modifiers, type, NULL);
 	if (ret) {
 		DRM_ERROR("failed to initialize plane\n");
-		kfree(ipu_plane);
 		return ERR_PTR(ret);
 	}
 
+	ret = drmm_add_action_or_reset(dev, ipu_plane_cleanup, ipu_plane);
+	if (ret)
+		return ERR_PTR(ret);
+
 	drm_plane_helper_add(&ipu_plane->base, &ipu_plane_helper_funcs);
 
 	if (dp == IPU_DP_FLOW_SYNC_BG || dp == IPU_DP_FLOW_SYNC_FG)
-		drm_plane_create_zpos_property(&ipu_plane->base, zpos, 0, 1);
+		ret = drm_plane_create_zpos_property(&ipu_plane->base, zpos, 0,
+						     1);
 	else
-		drm_plane_create_zpos_immutable_property(&ipu_plane->base, 0);
+		ret = drm_plane_create_zpos_immutable_property(&ipu_plane->base,
+							       0);
+	if (ret)
+		return ERR_PTR(ret);
 
 	return ipu_plane;
 }
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
