Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D637E70DFF7
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 17:12:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC02710E0E0;
	Tue, 23 May 2023 15:12:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49B9210E0E0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 15:12:34 +0000 (UTC)
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:13])
 by riemann.telenet-ops.be (Postfix) with ESMTPS id 4QQd8w01yqz4x37v
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 17:12:32 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:b0ac:7afd:272:4cff])
 by baptiste.telenet-ops.be with bizsmtp
 id 0F6N2A0050Jkz7G01F6N0Z; Tue, 23 May 2023 17:06:24 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1q1TaR-002svP-Hg;
 Tue, 23 May 2023 17:06:22 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1q1Taf-00CkGs-VW;
 Tue, 23 May 2023 17:06:21 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>
Subject: [PATCH v2] drm/fb-helper: Fix height, width, and accel_flags in fb_var
Date: Tue, 23 May 2023 17:06:20 +0200
Message-Id: <57e6b334dae8148b1b8ae6ef308ce9a83810a850.1684854344.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Sui Jingfeng <suijingfeng@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fbtest contains some very simple validation of the fbdev userspace API
contract.  When used with shmob-drm, it reports the following warnings
and errors:

    height changed from 68 to 0
    height was rounded down
    width changed from 111 to 0
    width was rounded down
    accel_flags changed from 0 to 1

The first part happens because __fill_var() resets the physical
dimensions of the first connector, as filled in by drm_setup_crtcs_fb().
Fix this by retaining the original values.

The last part happens because __fill_var() forces the FB_ACCELF_TEXT
flag on, while fbtest disables all acceleration on purpose, so it can
draw safely to the frame buffer.  Fix this by setting accel_flags to
zero, as DRM does not implement any text console acceleration.
Note that this issue can also be seen in the output of fbset, which
reports "accel true".

Fixes: ee4cce0a8f03a333 ("drm/fb-helper: fix input validation gaps in check_var")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Tested-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
v2:
  - Add Reviewed-by, Tested-by.
---
 drivers/gpu/drm/drm_fb_helper.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index f0e9549b6bd751de..8dc376b771d2cf22 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -1379,17 +1379,19 @@ static void drm_fb_helper_fill_pixel_fmt(struct fb_var_screeninfo *var,
 	}
 }
 
-static void __fill_var(struct fb_var_screeninfo *var,
+static void __fill_var(struct fb_var_screeninfo *var, struct fb_info *info,
 		       struct drm_framebuffer *fb)
 {
 	int i;
 
 	var->xres_virtual = fb->width;
 	var->yres_virtual = fb->height;
-	var->accel_flags = FB_ACCELF_TEXT;
+	var->accel_flags = 0;
 	var->bits_per_pixel = drm_format_info_bpp(fb->format, 0);
 
-	var->height = var->width = 0;
+	var->height = info->var.height;
+	var->width = info->var.width;
+
 	var->left_margin = var->right_margin = 0;
 	var->upper_margin = var->lower_margin = 0;
 	var->hsync_len = var->vsync_len = 0;
@@ -1452,7 +1454,7 @@ int drm_fb_helper_check_var(struct fb_var_screeninfo *var,
 		return -EINVAL;
 	}
 
-	__fill_var(var, fb);
+	__fill_var(var, info, fb);
 
 	/*
 	 * fb_pan_display() validates this, but fb_set_par() doesn't and just
@@ -1908,7 +1910,7 @@ static void drm_fb_helper_fill_var(struct fb_info *info,
 	info->pseudo_palette = fb_helper->pseudo_palette;
 	info->var.xoffset = 0;
 	info->var.yoffset = 0;
-	__fill_var(&info->var, fb);
+	__fill_var(&info->var, info, fb);
 	info->var.activate = FB_ACTIVATE_NOW;
 
 	drm_fb_helper_fill_pixel_fmt(&info->var, format);
-- 
2.34.1

