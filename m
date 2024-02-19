Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8359B85A5BF
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 15:21:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85F7510E2D6;
	Mon, 19 Feb 2024 14:21:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=atomide.com header.i=@atomide.com header.b="LjnfjspU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23AE810E269
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 14:21:19 +0000 (UTC)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
 by mail5.25mail.st (Postfix) with ESMTPSA id DF0B66088D;
 Mon, 19 Feb 2024 14:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
 s=25mailst; t=1708352478;
 bh=2+gw+ZCvOzg8K6L47uCfoS1vDcz2pWSSndevxkn0Z5s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LjnfjspUcB19s1joTmF0IsWSr8pGHQOivb0aVeAMs9ctz0GEGoAAItcAZEzcErgDX
 qmv5eS8xVoXXs5uzUXYeM1u5suzT1Qkv1xUKwIZtwadU08gp4DcMIjsbqA8sbzGzqD
 oqr6QZFoi1pgffCnSM0a+j6wdbMOVXTTuIbZ8LOhewAAs1jgYWjcwfjzC36wXut0cY
 xqer1uhYo3vYqx3IQoY8gnbyYfVwJy7aMOre4WhSKEpHQ8m3HdkQB3Xdcw/fh50jUV
 hAUwaBotS/fNWtBKIF5h4TGRYRLJ7kqC8DrjGpfzokfIeG7S8VnBbuMSKYOy/csxmY
 hXKY2AM+kbczQ==
From: Tony Lindgren <tony@atomide.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/omapdrm: Fix console with deferred ops
Date: Mon, 19 Feb 2024 16:19:56 +0200
Message-ID: <20240219142001.19727-2-tony@atomide.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240219142001.19727-1-tony@atomide.com>
References: <20240219142001.19727-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Commit 95da53d63dcf ("drm/omapdrm: Use regular fbdev I/O helpers")
broke console because there is no damage handling in fb_sys_write()
unlike we have in drm_fb_helper_sys_write().

Let's fix the issue by using deferred ops with fb helpers for damage.

Fixes: 95da53d63dcf ("drm/omapdrm: Use regular fbdev I/O helpers")
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/gpu/drm/omapdrm/Kconfig      | 1 +
 drivers/gpu/drm/omapdrm/omap_fbdev.c | 8 ++++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/Kconfig b/drivers/gpu/drm/omapdrm/Kconfig
--- a/drivers/gpu/drm/omapdrm/Kconfig
+++ b/drivers/gpu/drm/omapdrm/Kconfig
@@ -5,6 +5,7 @@ config DRM_OMAP
 	depends on ARCH_OMAP2PLUS
 	select DRM_KMS_HELPER
 	select FB_DMAMEM_HELPERS if DRM_FBDEV_EMULATION
+	select FB_IOMEM_HELPERS if DRM_FBDEV_EMULATION
 	select VIDEOMODE_HELPERS
 	select HDMI
 	default n
diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
--- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
+++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
@@ -51,6 +51,10 @@ static void pan_worker(struct work_struct *work)
 	omap_gem_roll(bo, fbi->var.yoffset * npages);
 }
 
+FB_GEN_DEFAULT_DEFERRED_IOMEM_OPS(omap_fbdev,
+				  drm_fb_helper_damage_range,
+				  drm_fb_helper_damage_area)
+
 static int omap_fbdev_pan_display(struct fb_var_screeninfo *var,
 		struct fb_info *fbi)
 {
@@ -106,13 +110,13 @@ static void omap_fbdev_fb_destroy(struct fb_info *info)
 
 static const struct fb_ops omap_fb_ops = {
 	.owner = THIS_MODULE,
-	__FB_DEFAULT_DMAMEM_OPS_RDWR,
+	__FB_DEFAULT_DEFERRED_OPS_RDWR(omap_fbdev),
 	.fb_check_var	= drm_fb_helper_check_var,
 	.fb_set_par	= drm_fb_helper_set_par,
 	.fb_setcmap	= drm_fb_helper_setcmap,
 	.fb_blank	= drm_fb_helper_blank,
 	.fb_pan_display = omap_fbdev_pan_display,
-	__FB_DEFAULT_DMAMEM_OPS_DRAW,
+	__FB_DEFAULT_DEFERRED_OPS_DRAW(omap_fbdev),
 	.fb_ioctl	= drm_fb_helper_ioctl,
 	.fb_mmap	= omap_fbdev_fb_mmap,
 	.fb_destroy	= omap_fbdev_fb_destroy,
-- 
2.43.1
