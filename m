Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FB043FBC9
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 13:50:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 401B26EA50;
	Fri, 29 Oct 2021 11:50:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92D3E6EA46
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 11:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=metanate.com; s=stronger; h=Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Content-Type:Reply-To:Content-ID:Content-Description:
 In-Reply-To:References; bh=imNyHr0Qz5loN5vvGUmOIVYg0PJVih+KMZKIvy6syRc=; b=4P
 NcVx9zm4eCtmBXR506acvL8MA/bg95D7X/ld6qTi4rHbwmWG55axJ/r1NsLk10HwsB26ucf8s4xxw
 2HCUani0eLZisUENVDTvJmMJZ+fUBJb8DLi+4rpB2NSqJ+EWZ1FCALoZ5wLHUHY98KUMQbFvEtird
 q0kZSQ+UuYhDKCm+HC+YQL76ywwXs1jBxt441+rA5oL+6IAv9PipJydWq/j97llcYkQYnla7BH/NH
 HrbCYK3mUJm1gqfEJLNbYSc3R6qlJsbncecY1Hbl9i2ajkKx7BX5caZ8VKPIjqdOa8NOdKrkN1i25
 a/HftDhW65MKvKu2eQZTYVBzLS9yXQgA==;
Received: from [81.174.171.191] (helo=donbot.metanate.com)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.93) (envelope-from <john@metanate.com>)
 id 1mgQOp-00034N-IR; Fri, 29 Oct 2021 12:50:19 +0100
From: John Keeping <john@metanate.com>
To: dri-devel@lists.freedesktop.org
Cc: John Keeping <john@metanate.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: [PATCH] drm/rockchip: use generic fbdev setup
Date: Fri, 29 Oct 2021 12:50:13 +0100
Message-Id: <20211029115014.264084-1-john@metanate.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated: YES
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Rockchip fbdev code does not add anything compared to
drm_fbdev_generic_setup(); the one custom function for .fb_mmap does the
same thing as gem_prime_mmap which is called by the helper.

Signed-off-by: John Keeping <john@metanate.com>
---
 drivers/gpu/drm/rockchip/Makefile             |   1 -
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |  10 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h   |   2 -
 drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c | 164 ------------------
 drivers/gpu/drm/rockchip/rockchip_drm_fbdev.h |  24 ---
 5 files changed, 2 insertions(+), 199 deletions(-)
 delete mode 100644 drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c
 delete mode 100644 drivers/gpu/drm/rockchip/rockchip_drm_fbdev.h

diff --git a/drivers/gpu/drm/rockchip/Makefile b/drivers/gpu/drm/rockchip/Makefile
index 17a9e7eb2130..1a56f696558c 100644
--- a/drivers/gpu/drm/rockchip/Makefile
+++ b/drivers/gpu/drm/rockchip/Makefile
@@ -5,7 +5,6 @@
 
 rockchipdrm-y := rockchip_drm_drv.o rockchip_drm_fb.o \
 		rockchip_drm_gem.o rockchip_drm_vop.o rockchip_vop_reg.o
-rockchipdrm-$(CONFIG_DRM_FBDEV_EMULATION) += rockchip_drm_fbdev.o
 
 rockchipdrm-$(CONFIG_ROCKCHIP_ANALOGIX_DP) += analogix_dp-rockchip.o
 rockchipdrm-$(CONFIG_ROCKCHIP_CDN_DP) += cdn-dp-core.o cdn-dp-reg.o
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
index 69c699459dce..20d81ae69828 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
@@ -26,7 +26,6 @@
 
 #include "rockchip_drm_drv.h"
 #include "rockchip_drm_fb.h"
-#include "rockchip_drm_fbdev.h"
 #include "rockchip_drm_gem.h"
 
 #define DRIVER_NAME	"rockchip"
@@ -159,10 +158,6 @@ static int rockchip_drm_bind(struct device *dev)
 
 	drm_mode_config_reset(drm_dev);
 
-	ret = rockchip_drm_fbdev_init(drm_dev);
-	if (ret)
-		goto err_unbind_all;
-
 	/* init kms poll for handling hpd */
 	drm_kms_helper_poll_init(drm_dev);
 
@@ -170,10 +165,11 @@ static int rockchip_drm_bind(struct device *dev)
 	if (ret)
 		goto err_kms_helper_poll_fini;
 
+	drm_fbdev_generic_setup(drm_dev, 32);
+
 	return 0;
 err_kms_helper_poll_fini:
 	drm_kms_helper_poll_fini(drm_dev);
-	rockchip_drm_fbdev_fini(drm_dev);
 err_unbind_all:
 	component_unbind_all(dev, drm_dev);
 err_iommu_cleanup:
@@ -189,7 +185,6 @@ static void rockchip_drm_unbind(struct device *dev)
 
 	drm_dev_unregister(drm_dev);
 
-	rockchip_drm_fbdev_fini(drm_dev);
 	drm_kms_helper_poll_fini(drm_dev);
 
 	drm_atomic_helper_shutdown(drm_dev);
@@ -203,7 +198,6 @@ DEFINE_DRM_GEM_FOPS(rockchip_drm_driver_fops);
 
 static const struct drm_driver rockchip_drm_driver = {
 	.driver_features	= DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
-	.lastclose		= drm_fb_helper_lastclose,
 	.dumb_create		= rockchip_gem_dumb_create,
 	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h b/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
index aa0909e8edf9..143a48330f84 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
@@ -43,8 +43,6 @@ struct rockchip_crtc_state {
  * @mm_lock: protect drm_mm on multi-threads.
  */
 struct rockchip_drm_private {
-	struct drm_fb_helper fbdev_helper;
-	struct drm_gem_object *fbdev_bo;
 	struct iommu_domain *domain;
 	struct mutex mm_lock;
 	struct drm_mm mm;
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c b/drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c
deleted file mode 100644
index d8418dd39d0e..000000000000
--- a/drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c
+++ /dev/null
@@ -1,164 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) Fuzhou Rockchip Electronics Co.Ltd
- * Author:Mark Yao <mark.yao@rock-chips.com>
- */
-
-#include <drm/drm.h>
-#include <drm/drm_fb_helper.h>
-#include <drm/drm_fourcc.h>
-#include <drm/drm_prime.h>
-#include <drm/drm_probe_helper.h>
-
-#include "rockchip_drm_drv.h"
-#include "rockchip_drm_gem.h"
-#include "rockchip_drm_fb.h"
-#include "rockchip_drm_fbdev.h"
-
-#define PREFERRED_BPP		32
-#define to_drm_private(x) \
-		container_of(x, struct rockchip_drm_private, fbdev_helper)
-
-static int rockchip_fbdev_mmap(struct fb_info *info,
-			       struct vm_area_struct *vma)
-{
-	struct drm_fb_helper *helper = info->par;
-	struct rockchip_drm_private *private = to_drm_private(helper);
-
-	return drm_gem_prime_mmap(private->fbdev_bo, vma);
-}
-
-static const struct fb_ops rockchip_drm_fbdev_ops = {
-	.owner		= THIS_MODULE,
-	DRM_FB_HELPER_DEFAULT_OPS,
-	.fb_mmap	= rockchip_fbdev_mmap,
-	.fb_fillrect	= drm_fb_helper_cfb_fillrect,
-	.fb_copyarea	= drm_fb_helper_cfb_copyarea,
-	.fb_imageblit	= drm_fb_helper_cfb_imageblit,
-};
-
-static int rockchip_drm_fbdev_create(struct drm_fb_helper *helper,
-				     struct drm_fb_helper_surface_size *sizes)
-{
-	struct rockchip_drm_private *private = to_drm_private(helper);
-	struct drm_mode_fb_cmd2 mode_cmd = { 0 };
-	struct drm_device *dev = helper->dev;
-	struct rockchip_gem_object *rk_obj;
-	struct drm_framebuffer *fb;
-	unsigned int bytes_per_pixel;
-	unsigned long offset;
-	struct fb_info *fbi;
-	size_t size;
-	int ret;
-
-	bytes_per_pixel = DIV_ROUND_UP(sizes->surface_bpp, 8);
-
-	mode_cmd.width = sizes->surface_width;
-	mode_cmd.height = sizes->surface_height;
-	mode_cmd.pitches[0] = sizes->surface_width * bytes_per_pixel;
-	mode_cmd.pixel_format = drm_mode_legacy_fb_format(sizes->surface_bpp,
-		sizes->surface_depth);
-
-	size = mode_cmd.pitches[0] * mode_cmd.height;
-
-	rk_obj = rockchip_gem_create_object(dev, size, true);
-	if (IS_ERR(rk_obj))
-		return -ENOMEM;
-
-	private->fbdev_bo = &rk_obj->base;
-
-	fbi = drm_fb_helper_alloc_fbi(helper);
-	if (IS_ERR(fbi)) {
-		DRM_DEV_ERROR(dev->dev, "Failed to create framebuffer info.\n");
-		ret = PTR_ERR(fbi);
-		goto out;
-	}
-
-	helper->fb = rockchip_drm_framebuffer_init(dev, &mode_cmd,
-						   private->fbdev_bo);
-	if (IS_ERR(helper->fb)) {
-		DRM_DEV_ERROR(dev->dev,
-			      "Failed to allocate DRM framebuffer.\n");
-		ret = PTR_ERR(helper->fb);
-		goto out;
-	}
-
-	fbi->fbops = &rockchip_drm_fbdev_ops;
-
-	fb = helper->fb;
-	drm_fb_helper_fill_info(fbi, helper, sizes);
-
-	offset = fbi->var.xoffset * bytes_per_pixel;
-	offset += fbi->var.yoffset * fb->pitches[0];
-
-	dev->mode_config.fb_base = 0;
-	fbi->screen_base = rk_obj->kvaddr + offset;
-	fbi->screen_size = rk_obj->base.size;
-	fbi->fix.smem_len = rk_obj->base.size;
-
-	DRM_DEBUG_KMS("FB [%dx%d]-%d kvaddr=%p offset=%ld size=%zu\n",
-		      fb->width, fb->height, fb->format->depth,
-		      rk_obj->kvaddr,
-		      offset, size);
-
-	return 0;
-
-out:
-	rockchip_gem_free_object(&rk_obj->base);
-	return ret;
-}
-
-static const struct drm_fb_helper_funcs rockchip_drm_fb_helper_funcs = {
-	.fb_probe = rockchip_drm_fbdev_create,
-};
-
-int rockchip_drm_fbdev_init(struct drm_device *dev)
-{
-	struct rockchip_drm_private *private = dev->dev_private;
-	struct drm_fb_helper *helper;
-	int ret;
-
-	if (!dev->mode_config.num_crtc || !dev->mode_config.num_connector)
-		return -EINVAL;
-
-	helper = &private->fbdev_helper;
-
-	drm_fb_helper_prepare(dev, helper, &rockchip_drm_fb_helper_funcs);
-
-	ret = drm_fb_helper_init(dev, helper);
-	if (ret < 0) {
-		DRM_DEV_ERROR(dev->dev,
-			      "Failed to initialize drm fb helper - %d.\n",
-			      ret);
-		return ret;
-	}
-
-	ret = drm_fb_helper_initial_config(helper, PREFERRED_BPP);
-	if (ret < 0) {
-		DRM_DEV_ERROR(dev->dev,
-			      "Failed to set initial hw config - %d.\n",
-			      ret);
-		goto err_drm_fb_helper_fini;
-	}
-
-	return 0;
-
-err_drm_fb_helper_fini:
-	drm_fb_helper_fini(helper);
-	return ret;
-}
-
-void rockchip_drm_fbdev_fini(struct drm_device *dev)
-{
-	struct rockchip_drm_private *private = dev->dev_private;
-	struct drm_fb_helper *helper;
-
-	helper = &private->fbdev_helper;
-
-	drm_fb_helper_unregister_fbi(helper);
-
-	if (helper->fb)
-		drm_framebuffer_put(helper->fb);
-
-	drm_fb_helper_fini(helper);
-}
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_fbdev.h b/drivers/gpu/drm/rockchip/rockchip_drm_fbdev.h
deleted file mode 100644
index 5fb7ac2371a8..000000000000
--- a/drivers/gpu/drm/rockchip/rockchip_drm_fbdev.h
+++ /dev/null
@@ -1,24 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) Fuzhou Rockchip Electronics Co.Ltd
- * Author:Mark Yao <mark.yao@rock-chips.com>
- */
-
-#ifndef _ROCKCHIP_DRM_FBDEV_H
-#define _ROCKCHIP_DRM_FBDEV_H
-
-#ifdef CONFIG_DRM_FBDEV_EMULATION
-int rockchip_drm_fbdev_init(struct drm_device *dev);
-void rockchip_drm_fbdev_fini(struct drm_device *dev);
-#else
-static inline int rockchip_drm_fbdev_init(struct drm_device *dev)
-{
-	return 0;
-}
-
-static inline void rockchip_drm_fbdev_fini(struct drm_device *dev)
-{
-}
-#endif
-
-#endif /* _ROCKCHIP_DRM_FBDEV_H */
-- 
2.33.1

