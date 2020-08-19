Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E33DD24AFCB
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 09:16:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 496B06E8E8;
	Thu, 20 Aug 2020 07:14:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D28189E8C
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 09:25:51 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id E94A07D411AA8952CCCE;
 Wed, 19 Aug 2020 17:25:47 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Wed, 19 Aug 2020 17:25:40 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <tzimmermann@suse.de>,
 <kraxel@redhat.com>, <alexander.deucher@amd.com>, <tglx@linutronix.de>,
 <dri-devel@lists.freedesktop.org>, <xinliang.liu@linaro.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH drm/hisilicon v2 3/4] drm/hisilicon: Use drm_err instead of
 DRM_ERROR in hibmc_drm_de
Date: Wed, 19 Aug 2020 17:23:33 +0800
Message-ID: <1597829014-39942-4-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1597829014-39942-1-git-send-email-tiantao6@hisilicon.com>
References: <1597829014-39942-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 20 Aug 2020 07:14:47 +0000
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

Use drm_err instead of DRM_ERROR in hibmc_drm_de

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
index d9062a3..4d57ec6 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
@@ -71,12 +71,12 @@ static int hibmc_plane_atomic_check(struct drm_plane *plane,
 		return PTR_ERR(crtc_state);
 
 	if (src_w != state->crtc_w || src_h != state->crtc_h) {
-		DRM_DEBUG_ATOMIC("scale not support\n");
+		drm_dbg_atomic(plane->dev, "scale not support\n");
 		return -EINVAL;
 	}
 
 	if (state->crtc_x < 0 || state->crtc_y < 0) {
-		DRM_DEBUG_ATOMIC("crtc_x/y of drm_plane state is invalid\n");
+		drm_dbg_atomic(plane->dev, "crtc_x/y of drm_plane state is invalid\n");
 		return -EINVAL;
 	}
 
@@ -87,12 +87,12 @@ static int hibmc_plane_atomic_check(struct drm_plane *plane,
 	    crtc_state->adjusted_mode.hdisplay ||
 	    state->crtc_y + state->crtc_h >
 	    crtc_state->adjusted_mode.vdisplay) {
-		DRM_DEBUG_ATOMIC("visible portion of plane is invalid\n");
+		drm_dbg_atomic(plane->dev, "visible portion of plane is invalid\n");
 		return -EINVAL;
 	}
 
 	if (state->fb->pitches[0] % 128 != 0) {
-		DRM_DEBUG_ATOMIC("wrong stride with 128-byte aligned\n");
+		drm_dbg_atomic(plane->dev, "wrong stride with 128-byte aligned\n");
 		return -EINVAL;
 	}
 	return 0;
@@ -515,7 +515,7 @@ int hibmc_de_init(struct hibmc_drm_private *priv)
 				       NULL);
 
 	if (ret) {
-		DRM_ERROR("failed to init plane: %d\n", ret);
+		drm_err(dev, "failed to init plane: %d\n", ret);
 		return ret;
 	}
 
@@ -524,13 +524,13 @@ int hibmc_de_init(struct hibmc_drm_private *priv)
 	ret = drm_crtc_init_with_planes(dev, crtc, plane,
 					NULL, &hibmc_crtc_funcs, NULL);
 	if (ret) {
-		DRM_ERROR("failed to init crtc: %d\n", ret);
+		drm_err(dev, "failed to init crtc: %d\n", ret);
 		return ret;
 	}
 
 	ret = drm_mode_crtc_set_gamma_size(crtc, 256);
 	if (ret) {
-		DRM_ERROR("failed to set gamma size: %d\n", ret);
+		drm_err(dev, "failed to set gamma size: %d\n", ret);
 		return ret;
 	}
 	drm_crtc_helper_add(crtc, &hibmc_crtc_helper_funcs);
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
