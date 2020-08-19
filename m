Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A10249C42
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 13:47:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00C4B6E243;
	Wed, 19 Aug 2020 11:46:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68B246E22F
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 11:46:23 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de
 [95.90.213.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 45DF622CA0;
 Wed, 19 Aug 2020 11:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597837582;
 bh=VjNc5JFUvoN5A0Ro+s3Ld1Lo9J+b152vB+hxRMelsFc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BA5qOAXEqN55ggNtrgIejmWTeCp3mIWRwmoYjzZdKSzGQ26FtS1kwnkF/MmghyhrY
 72n0PqjIoDY32qjo3lELyTeIUl0rl1QI3MKor4ThRAa6d9v4jE+GI3HG43MMGxhsT0
 ju9mcFXyRPRZ6RyLPMk4TDpKeKtf6T5bMyqlfdcI=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1k8MXs-00Euaq-7z; Wed, 19 Aug 2020 13:46:20 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 21/49] staging: hikey9xx/gpu: add support for using a reserved
 CMA memory
Date: Wed, 19 Aug 2020 13:45:49 +0200
Message-Id: <04e21a7298d2c076d5de89a1a937b9cb40bcc213.1597833138.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1597833138.git.mchehab+huawei@kernel.org>
References: <cover.1597833138.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
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
Cc: devel@driverdev.osuosl.org, Liwei Cai <cailiwei@hisilicon.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Chen Feng <puck.chen@hisilicon.com>,
 Wanchun Zheng <zhengwanchun@hisilicon.com>, linuxarm@huawei.com,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xiubin Zhang <zhangxiubin1@huawei.com>, mauro.chehab@huawei.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allocate the framebuffer memory via CMA, as otherwise the
drm driver may not work properly with X11.

Part of the changes here were based on a patch originally
authored by:

	alik <hou.xiaoyong@hihope.org>

The original version can be found at:
	https://github.com/Bigcountry907/linux/commit/046e29834ef1c523c73614747377d3660eec3964

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../staging/hikey9xx/gpu/kirin9xx_drm_drv.c   | 36 ++++++-------------
 .../staging/hikey9xx/gpu/kirin9xx_drm_drv.h   |  4 +--
 .../hikey9xx/gpu/kirin9xx_drm_overlay_utils.c | 16 ++-------
 3 files changed, 13 insertions(+), 43 deletions(-)

diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.c b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.c
index 49f591da1cf7..fee686760c78 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.c
@@ -21,6 +21,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_fb_helper.h>
 #include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
@@ -29,13 +30,6 @@
 
 #include "kirin9xx_drm_drv.h"
 
-#ifdef CONFIG_DRM_FBDEV_EMULATION
-static bool fbdev = true;
-MODULE_PARM_DESC(fbdev, "Enable fbdev compat layer");
-module_param(fbdev, bool, 0600);
-#endif
-
-
 static struct kirin_dc_ops *dc_ops;
 
 static int kirin_drm_kms_cleanup(struct drm_device *dev)
@@ -60,22 +54,7 @@ static void kirin_fbdev_output_poll_changed(struct drm_device *dev)
 
 	dsi_set_output_client(dev);
 
-#ifdef CMA_BUFFER_USED
-	if (priv->fbdev) {
-		DRM_INFO("hotplug_event!!!!!!\n");
-		drm_fbdev_cma_hotplug_event(priv->fbdev);
-	} else {
-		DRM_INFO("cma_init!!!!!!\n");
-		priv->fbdev = drm_fbdev_cma_init(dev, 32,
-				dev->mode_config.num_crtc,
-				dev->mode_config.num_connector);
-		if (IS_ERR(priv->fbdev))
-			priv->fbdev = NULL;
-	}
-#else
-	if (priv->fbdev)
-		drm_fb_helper_hotplug_event(priv->fbdev);
-#endif
+	drm_fb_helper_hotplug_event(priv->fbdev);
 }
 
 static const struct drm_mode_config_funcs kirin_drm_mode_config_funcs = {
@@ -98,7 +77,7 @@ static void kirin_drm_mode_config_init(struct drm_device *dev)
 
 static int kirin_drm_kms_init(struct drm_device *dev)
 {
-	struct kirin_drm_private *priv;
+	struct kirin_drm_private *priv = dev->dev_private;
 	int ret;
 
 	priv = devm_kzalloc(dev->dev, sizeof(*priv), GFP_KERNEL);
@@ -256,6 +235,7 @@ static int kirin_drm_bind(struct device *dev)
 {
 	struct drm_driver *driver = &kirin_drm_driver;
 	struct drm_device *drm_dev;
+	struct kirin_drm_private *priv;
 	int ret;
 
 	drm_dev = drm_dev_alloc(driver, dev);
@@ -270,6 +250,9 @@ static int kirin_drm_bind(struct device *dev)
 	if (ret)
 		goto err_kms_cleanup;
 
+	drm_fbdev_generic_setup(drm_dev, 32);
+	priv = drm_dev->dev_private;
+
 	/* connectors should be registered after drm device register */
 	ret = kirin_drm_connectors_register(drm_dev);
 	if (ret)
@@ -340,6 +323,7 @@ static int kirin_drm_platform_probe(struct platform_device *pdev)
 	struct device_node *np = dev->of_node;
 	struct component_match *match = NULL;
 	struct device_node *remote;
+	int ret;
 
 	dc_ops = (struct kirin_dc_ops *)of_device_get_match_data(dev);
 	if (!dc_ops) {
@@ -356,9 +340,9 @@ static int kirin_drm_platform_probe(struct platform_device *pdev)
 
 	component_match_add(dev, &match, compare_of, remote);
 
+	if (ret)
+		DRM_ERROR("cma device init failed!");
 	return component_master_add_with_match(dev, &kirin_drm_ops, match);
-
-	return 0;
 }
 
 static int kirin_drm_platform_remove(struct platform_device *pdev)
diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.h b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.h
index b704f025d64b..261259cb8f5f 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.h
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.h
@@ -13,6 +13,7 @@
 
 #include <drm/drm_crtc.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_print.h>
 
@@ -21,8 +22,6 @@
 
 #define MAX_CRTC	2
 
-#define to_kirin_fbdev(x) container_of(x, struct kirin_fbdev, fb_helper)
-
 /* display controller init/cleanup ops */
 struct kirin_dc_ops {
 	int (*init)(struct drm_device *dev);
@@ -32,7 +31,6 @@ struct kirin_dc_ops {
 };
 
 struct kirin_drm_private {
-	struct drm_fb_helper *fb_helper;
 	struct drm_fb_helper *fbdev;
 	struct drm_crtc *crtc[MAX_CRTC];
 };
diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_overlay_utils.c b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_overlay_utils.c
index 8be5865b615c..2b9672a3d057 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_overlay_utils.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_overlay_utils.c
@@ -1517,15 +1517,10 @@ void hisi_fb_pan_display(struct drm_plane *plane)
 	struct dss_crtc *acrtc = aplane->acrtc;
 	struct dss_hw_ctx *ctx = acrtc->ctx;
 
-#ifndef CMA_BUFFER_USED
-	struct kirin_drm_private *priv = plane->dev->dev_private;
-	struct kirin_fbdev *fbdev = to_kirin_fbdev(priv->fbdev);
-#else
 	struct drm_gem_cma_object *obj = drm_fb_cma_get_gem_obj(state->fb, 0);
-#endif
 
 	bool afbcd = false;
-	bool mmu_enable = true;
+	bool mmu_enable = false;
 	dss_rect_ltrb_t rect;
 	u32 bpp;
 	u32 stride;
@@ -1550,14 +1545,7 @@ void hisi_fb_pan_display(struct drm_plane *plane)
 	bpp = fb->format->cpp[0];
 	stride = fb->pitches[0];
 
-#ifndef CMA_BUFFER_USED
-	if (fbdev)
-		display_addr = (u32)fbdev->smem_start + src_y * stride;
-	else
-		DRM_ERROR("fbdev is null? \n");
-#else
 	display_addr = (u32)obj->paddr + src_y * stride;
-#endif
 
 	rect.left = 0;
 	rect.right = src_w - 1;
@@ -1609,7 +1597,7 @@ void hisi_dss_online_play(struct kirin_fbdev *fbdev, struct drm_plane *plane, dr
 	struct dss_hw_ctx *ctx = acrtc->ctx;
 
 	bool afbcd = false;
-	bool mmu_enable = true;
+	bool mmu_enable = false;
 	dss_rect_ltrb_t rect;
 	u32 bpp;
 	u32 stride;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
