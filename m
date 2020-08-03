Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C814423A0D3
	for <lists+dri-devel@lfdr.de>; Mon,  3 Aug 2020 10:21:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8653989971;
	Mon,  3 Aug 2020 08:20:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFA1189D9B
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Aug 2020 00:40:43 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id BD4E0F42E83C1676A573;
 Mon,  3 Aug 2020 08:40:38 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Mon, 3 Aug 2020 08:40:30 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <tzimmermann@suse.de>,
 <kraxel@redhat.com>, <alexander.deucher@amd.com>, <tglx@linutronix.de>,
 <dri-devel@lists.freedesktop.org>, <xinliang.liu@linaro.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH drm/hisilicon v2 2/3] drm/hisilicon: Code refactoring for
 hibmc_drv_de
Date: Mon, 3 Aug 2020 08:38:33 +0800
Message-ID: <1596415114-21175-3-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596415114-21175-1-git-send-email-tiantao6@hisilicon.com>
References: <1596415114-21175-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 03 Aug 2020 08:20:37 +0000
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

The memory used to be allocated with devres helpers and released
automatically. In rare circumstances, the memory's release could
have happened before the DRM device got released, which would have
caused memory corruption of some kind. Now we're embedding the data
structures in struct hibmc_drm_private. The whole release problem
has been resolved, because struct hibmc_drm_private is allocated
with drmm_kzalloc and always released with the DRM device.

v2:
edit commit message.

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
