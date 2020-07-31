Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 473D223401A
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 09:36:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C6DD6E9F9;
	Fri, 31 Jul 2020 07:36:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB239896F7
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 01:07:35 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id C16B7AFCA5300A5F34C7;
 Fri, 31 Jul 2020 09:07:33 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Fri, 31 Jul 2020 09:07:26 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <tzimmermann@suse.de>,
 <kraxel@redhat.com>, <alexander.deucher@amd.com>, <tglx@linutronix.de>,
 <dri-devel@lists.freedesktop.org>, <xinliang.liu@linaro.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH drm/hisilicon 2/2] drm/hisilicon: Code refactoring for
 hibmc_drv_de
Date: Fri, 31 Jul 2020 09:05:32 +0800
Message-ID: <1596157532-50049-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 31 Jul 2020 07:36:08 +0000
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
Cc: linuxarm@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

code refactoring for hibmc_drv_de.c, no actual function changes.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c  | 55 ++++++-------------------
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h |  2 +
 2 files changed, 15 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
index 66132eb..af24c72 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
@@ -157,37 +157,6 @@ static const struct drm_plane_helper_funcs hibmc_plane_helper_funcs = {
 	.atomic_update = hibmc_plane_atomic_update,
 };
 
-static struct drm_plane *hibmc_plane_init(struct hibmc_drm_private *priv)
-{
-	struct drm_device *dev = priv->dev;
-	struct drm_plane *plane;
-	int ret = 0;
-
-	plane = devm_kzalloc(dev->dev, sizeof(*plane), GFP_KERNEL);
-	if (!plane) {
-		DRM_ERROR("failed to alloc memory when init plane\n");
-		return ERR_PTR(-ENOMEM);
-	}
-	/*
-	 * plane init
-	 * TODO: Now only support primary plane, overlay planes
-	 * need to do.
-	 */
-	ret = drm_universal_plane_init(dev, plane, 1, &hibmc_plane_funcs,
-				       channel_formats1,
-				       ARRAY_SIZE(channel_formats1),
-				       NULL,
-				       DRM_PLANE_TYPE_PRIMARY,
-				       NULL);
-	if (ret) {
-		DRM_ERROR("failed to init plane: %d\n", ret);
-		return ERR_PTR(ret);
-	}
-
-	drm_plane_helper_add(plane, &hibmc_plane_helper_funcs);
-	return plane;
-}
-
 static void hibmc_crtc_dpms(struct drm_crtc *crtc, int dpms)
 {
 	struct hibmc_drm_private *priv = crtc->dev->dev_private;
@@ -534,22 +503,24 @@ static const struct drm_crtc_helper_funcs hibmc_crtc_helper_funcs = {
 int hibmc_de_init(struct hibmc_drm_private *priv)
 {
 	struct drm_device *dev = priv->dev;
-	struct drm_crtc *crtc;
-	struct drm_plane *plane;
+	struct drm_crtc *crtc = &priv->crtc;
+	struct drm_plane *plane = &priv->plane;
 	int ret;
 
-	plane = hibmc_plane_init(priv);
-	if (IS_ERR(plane)) {
-		DRM_ERROR("failed to create plane: %ld\n", PTR_ERR(plane));
-		return PTR_ERR(plane);
-	}
+	ret = drm_universal_plane_init(dev, plane, 1, &hibmc_plane_funcs,
+				       channel_formats1,
+				       ARRAY_SIZE(channel_formats1),
+				       NULL,
+				       DRM_PLANE_TYPE_PRIMARY,
+				       NULL);
 
-	crtc = devm_kzalloc(dev->dev, sizeof(*crtc), GFP_KERNEL);
-	if (!crtc) {
-		DRM_ERROR("failed to alloc memory when init crtc\n");
-		return -ENOMEM;
+	if (ret) {
+		DRM_ERROR("failed to init plane: %d\n", ret);
+		return ret;
 	}
 
+	drm_plane_helper_add(plane, &hibmc_plane_helper_funcs);
+
 	ret = drm_crtc_init_with_planes(dev, crtc, plane,
 					NULL, &hibmc_crtc_funcs, NULL);
 	if (ret) {
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
index a683763..91ef15c 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
@@ -28,6 +28,8 @@ struct hibmc_drm_private {
 
 	/* drm */
 	struct drm_device  *dev;
+	struct drm_plane plane;
+	struct drm_crtc crtc;
 	struct drm_encoder encoder;
 	struct drm_connector connector;
 	bool mode_config_initialized;
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
