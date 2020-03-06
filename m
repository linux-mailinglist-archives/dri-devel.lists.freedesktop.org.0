Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D0B17B7DD
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 09:03:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BADAA6EC6E;
	Fri,  6 Mar 2020 08:03:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E95D76EC59
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 03:43:43 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 8515FA1DDEA6F237EEE7;
 Fri,  6 Mar 2020 11:43:40 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.439.0; Fri, 6 Mar 2020 11:43:33 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <puck.chen@hisilicon.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <tzimmermann@suse.de>, <kraxel@redhat.com>, <alexander.deucher@amd.com>,
 <tglx@linutronix.de>, <dri-devel@lists.freedesktop.org>,
 <xinliang.liu@linaro.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/4] drm/hisilicon: Enforce 128-byte stride alignment to fix
 the hardware limitation
Date: Fri, 6 Mar 2020 11:43:01 +0800
Message-ID: <1583466184-7060-4-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583466184-7060-1-git-send-email-tiantao6@hisilicon.com>
References: <1583466184-7060-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 06 Mar 2020 08:03:01 +0000
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

because the hardware limitation,The initial color depth must set to 32bpp
and must set the FB Offset of the display hardware to 128Byte alignment,
which is used to solve the display problem at 800x600 and 1440x900
resolution under 16bpp.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
Signed-off-by: Gong junjie <gongjunjie2@huawei.com>
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c  | 9 +++++----
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 4 ++--
 drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c     | 2 +-
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
index 55b46a7..cc70e83 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
@@ -94,6 +94,10 @@ static int hibmc_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 	}
 
+	if (state->fb->pitches[0] % 128 != 0) {
+		DRM_DEBUG_ATOMIC("wrong stride with 128-byte aligned\n");
+		return -EINVAL;
+	}
 	return 0;
 }
 
@@ -119,11 +123,8 @@ static void hibmc_plane_atomic_update(struct drm_plane *plane,
 	writel(gpu_addr, priv->mmio + HIBMC_CRT_FB_ADDRESS);
 
 	reg = state->fb->width * (state->fb->format->cpp[0]);
-	/* now line_pad is 16 */
-	reg = PADDING(16, reg);
 
-	line_l = state->fb->width * state->fb->format->cpp[0];
-	line_l = PADDING(16, line_l);
+	line_l = state->fb->pitches[0];
 	writel(HIBMC_FIELD(HIBMC_CRT_FB_WIDTH_WIDTH, reg) |
 	       HIBMC_FIELD(HIBMC_CRT_FB_WIDTH_OFFS, line_l),
 	       priv->mmio + HIBMC_CRT_FB_WIDTH);
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index 222356a..79a180a 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -94,7 +94,7 @@ static int hibmc_kms_init(struct hibmc_drm_private *priv)
 	priv->dev->mode_config.max_height = 1200;
 
 	priv->dev->mode_config.fb_base = priv->fb_base;
-	priv->dev->mode_config.preferred_depth = 24;
+	priv->dev->mode_config.preferred_depth = 32;
 	priv->dev->mode_config.prefer_shadow = 1;
 
 	priv->dev->mode_config.funcs = (void *)&hibmc_mode_funcs;
@@ -307,7 +307,7 @@ static int hibmc_load(struct drm_device *dev)
 	/* reset all the states of crtc/plane/encoder/connector */
 	drm_mode_config_reset(dev);
 
-	ret = drm_fbdev_generic_setup(dev, 16);
+	ret = drm_fbdev_generic_setup(dev, dev->mode_config.preferred_depth);
 	if (ret) {
 		DRM_ERROR("failed to initialize fbdev: %d\n", ret);
 		goto err;
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
index 99397ac..322bd54 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
@@ -50,7 +50,7 @@ void hibmc_mm_fini(struct hibmc_drm_private *hibmc)
 int hibmc_dumb_create(struct drm_file *file, struct drm_device *dev,
 		      struct drm_mode_create_dumb *args)
 {
-	return drm_gem_vram_fill_create_dumb(file, dev, 0, 16, args);
+	return drm_gem_vram_fill_create_dumb(file, dev, 0, 128, args);
 }
 
 const struct drm_mode_config_funcs hibmc_mode_funcs = {
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
