Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3411301FA
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jan 2020 12:24:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74CB46E3F5;
	Sat,  4 Jan 2020 11:23:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B53316E162
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2020 01:42:56 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 666E1C68E69381AA17F5;
 Fri,  3 Jan 2020 09:42:52 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.439.0; Fri, 3 Jan 2020 09:42:43 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <puck.chen@hisilicon.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <tzimmermann@suse.de>, <kraxel@redhat.com>, <alexander.deucher@amd.com>,
 <tglx@linutronix.de>, <dri-devel@lists.freedesktop.org>,
 <xinliang.liu@linaro.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/hisilicon: Enforce 128-byte stride alignment to fix the
 display problem
Date: Fri, 3 Jan 2020 09:42:50 +0800
Message-ID: <1578015770-36470-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 04 Jan 2020 11:23:45 +0000
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
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c    | 13 ++++++-------
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_fbdev.c |  4 ++--
 drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c       |  2 +-
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
index 12b38ac..843d784 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
@@ -83,9 +83,6 @@ static int hibmc_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 	}
 
-	if (!crtc_state->enable)
-		return 0;
-
 	if (state->crtc_x + state->crtc_w >
 	    crtc_state->adjusted_mode.hdisplay ||
 	    state->crtc_y + state->crtc_h >
@@ -94,6 +91,11 @@ static int hibmc_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 	}
 
+	if (state->fb->pitches[0] % 128 != 0) {
+		DRM_DEBUG_ATOMIC("wrong stride with 128-byte aligned\n");
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
@@ -119,11 +121,8 @@ static void hibmc_plane_atomic_update(struct drm_plane *plane,
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
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_fbdev.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_fbdev.c
index 1d15560..ca42dd7 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_fbdev.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_fbdev.c
@@ -73,7 +73,7 @@ static int hibmc_drm_fb_create(struct drm_fb_helper *helper,
 
 	mode_cmd.width = sizes->surface_width;
 	mode_cmd.height = sizes->surface_height;
-	mode_cmd.pitches[0] = mode_cmd.width * bytes_per_pixel;
+	mode_cmd.pitches[0] = ALIGN(mode_cmd.width * bytes_per_pixel, 128);
 	mode_cmd.pixel_format = drm_mode_legacy_fb_format(sizes->surface_bpp,
 							  sizes->surface_depth);
 
@@ -186,7 +186,7 @@ int hibmc_fbdev_init(struct hibmc_drm_private *priv)
 		goto fini;
 	}
 
-	ret = drm_fb_helper_initial_config(&hifbdev->helper, 16);
+	ret = drm_fb_helper_initial_config(&hifbdev->helper, 32);
 	if (ret) {
 		DRM_ERROR("failed to setup initial conn config: %d\n", ret);
 		goto fini;
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
index 19dc525..1cc702f 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c
@@ -76,7 +76,7 @@ int hibmc_dumb_create(struct drm_file *file, struct drm_device *dev,
 	u32 handle;
 	int ret;
 
-	args->pitch = ALIGN(args->width * DIV_ROUND_UP(args->bpp, 8), 16);
+	args->pitch = ALIGN(args->width * DIV_ROUND_UP(args->bpp, 8), 128);
 	args->size = args->pitch * args->height;
 
 	ret = hibmc_gem_create(dev, args->size, false,
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
