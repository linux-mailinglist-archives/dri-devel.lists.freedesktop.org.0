Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C5556BE8F
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 20:21:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1283210EBA9;
	Fri,  8 Jul 2022 18:21:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 892FC10EBA4
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 18:21:10 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.186.194])
 by laurent.telenet-ops.be with bizsmtp
 id siM72700E4C55Sk01iM7mq; Fri, 08 Jul 2022 20:21:09 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o9sbD-002fGn-2I; Fri, 08 Jul 2022 20:21:07 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o9sbC-00BtJi-Fw; Fri, 08 Jul 2022 20:21:06 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 06/10] drm/fb-helper: Add support for DRM_FORMAT_C[124]
Date: Fri,  8 Jul 2022 20:20:51 +0200
Message-Id: <db3e80b445df661ff0cd7e698507a8d24a4c867e.1657294931.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657294931.git.geert@linux-m68k.org>
References: <cover.1657294931.git.geert@linux-m68k.org>
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
Cc: linux-fbdev@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for color-indexed frame buffer formats with two, four, and
sixteen colors to the DRM framebuffer helper functions:
  1. Add support for 1, 2, and 4 bits per pixel to the damage helper,
  2. For color-indexed modes, the length of the color bitfields must be
     set to the color depth, else the logo code may pick a logo with too
     many colors.  Drop the incorrect DAC width comment, which
     originates from the i915 driver.
  3. Accept C[124] modes when validating or filling in struct
     fb_var_screeninfo, and use the correct number of bits per pixel.
  4. Set the visual to FB_VISUAL_PSEUDOCOLOR for all color-indexed
     modes.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
If "[PATCH] drm/fb-helper: Remove helpers to change frame buffer
config"[1] is accepted, the changes to drm_fb_helper_check_var() can
just be removed.

v3:
  - Fix FB_VISUAL_TRUECOLOR,
  - Add Reviewed-by,

v2:
  - Use drm_format_info_bpp() helper instead of deprecated .depth field
    or format-dependent calculations,
  - Use new .is_color_indexed field instead of checking against a list
    of formats.

[1] Link: https://lore.kernel.org/r/20220629105658.1373770-1-geert@linux-m68k.org
---
 drivers/gpu/drm/drm_fb_helper.c | 101 ++++++++++++++++++++++++--------
 1 file changed, 75 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 1705e8d345aba50a..5098efb374fe64ed 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -376,12 +376,31 @@ static void drm_fb_helper_damage_blit_real(struct drm_fb_helper *fb_helper,
 					   struct iosys_map *dst)
 {
 	struct drm_framebuffer *fb = fb_helper->fb;
-	unsigned int cpp = fb->format->cpp[0];
-	size_t offset = clip->y1 * fb->pitches[0] + clip->x1 * cpp;
-	void *src = fb_helper->fbdev->screen_buffer + offset;
-	size_t len = (clip->x2 - clip->x1) * cpp;
+	size_t offset = clip->y1 * fb->pitches[0];
+	size_t len = clip->x2 - clip->x1;
 	unsigned int y;
+	void *src;
 
+	switch (drm_format_info_bpp(fb->format, 0)) {
+	case 1:
+		offset += clip->x1 / 8;
+		len = DIV_ROUND_UP(len + clip->x1 % 8, 8);
+		break;
+	case 2:
+		offset += clip->x1 / 4;
+		len = DIV_ROUND_UP(len + clip->x1 % 4, 4);
+		break;
+	case 4:
+		offset += clip->x1 / 2;
+		len = DIV_ROUND_UP(len + clip->x1 % 2, 2);
+		break;
+	default:
+		offset += clip->x1 * fb->format->cpp[0];
+		len *= fb->format->cpp[0];
+		break;
+	}
+
+	src = fb_helper->fbdev->screen_buffer + offset;
 	iosys_map_incr(dst, offset); /* go to first pixel within clip rect */
 
 	for (y = clip->y1; y < clip->y2; y++) {
@@ -1273,19 +1292,23 @@ static bool drm_fb_pixel_format_equal(const struct fb_var_screeninfo *var_1,
 }
 
 static void drm_fb_helper_fill_pixel_fmt(struct fb_var_screeninfo *var,
-					 u8 depth)
+					 const struct drm_format_info *format)
 {
-	switch (depth) {
-	case 8:
+	u8 depth = format->depth;
+
+	if (format->is_color_indexed) {
 		var->red.offset = 0;
 		var->green.offset = 0;
 		var->blue.offset = 0;
-		var->red.length = 8; /* 8bit DAC */
-		var->green.length = 8;
-		var->blue.length = 8;
+		var->red.length = depth;
+		var->green.length = depth;
+		var->blue.length = depth;
 		var->transp.offset = 0;
 		var->transp.length = 0;
-		break;
+		return;
+	}
+
+	switch (depth) {
 	case 15:
 		var->red.offset = 10;
 		var->green.offset = 5;
@@ -1340,7 +1363,9 @@ int drm_fb_helper_check_var(struct fb_var_screeninfo *var,
 {
 	struct drm_fb_helper *fb_helper = info->par;
 	struct drm_framebuffer *fb = fb_helper->fb;
+	const struct drm_format_info *format = fb->format;
 	struct drm_device *dev = fb_helper->dev;
+	unsigned int bpp;
 
 	if (in_dbg_master())
 		return -EINVAL;
@@ -1350,22 +1375,33 @@ int drm_fb_helper_check_var(struct fb_var_screeninfo *var,
 		var->pixclock = 0;
 	}
 
-	if ((drm_format_info_block_width(fb->format, 0) > 1) ||
-	    (drm_format_info_block_height(fb->format, 0) > 1))
-		return -EINVAL;
+	switch (format->format) {
+	case DRM_FORMAT_C1:
+	case DRM_FORMAT_C2:
+	case DRM_FORMAT_C4:
+		/* supported format with sub-byte pixels */
+		break;
+
+	default:
+		if ((drm_format_info_block_width(format, 0) > 1) ||
+		    (drm_format_info_block_height(format, 0) > 1))
+			return -EINVAL;
+		break;
+	}
 
 	/*
 	 * Changes struct fb_var_screeninfo are currently not pushed back
 	 * to KMS, hence fail if different settings are requested.
 	 */
-	if (var->bits_per_pixel > fb->format->cpp[0] * 8 ||
+	bpp = drm_format_info_bpp(format, 0);
+	if (var->bits_per_pixel > bpp ||
 	    var->xres > fb->width || var->yres > fb->height ||
 	    var->xres_virtual > fb->width || var->yres_virtual > fb->height) {
 		drm_dbg_kms(dev, "fb requested width/height/bpp can't fit in current fb "
 			  "request %dx%d-%d (virtual %dx%d) > %dx%d-%d\n",
 			  var->xres, var->yres, var->bits_per_pixel,
 			  var->xres_virtual, var->yres_virtual,
-			  fb->width, fb->height, fb->format->cpp[0] * 8);
+			  fb->width, fb->height, bpp);
 		return -EINVAL;
 	}
 
@@ -1380,13 +1416,13 @@ int drm_fb_helper_check_var(struct fb_var_screeninfo *var,
 	    !var->blue.length    && !var->transp.length   &&
 	    !var->red.msb_right  && !var->green.msb_right &&
 	    !var->blue.msb_right && !var->transp.msb_right) {
-		drm_fb_helper_fill_pixel_fmt(var, fb->format->depth);
+		drm_fb_helper_fill_pixel_fmt(var, format);
 	}
 
 	/*
 	 * Likewise, bits_per_pixel should be rounded up to a supported value.
 	 */
-	var->bits_per_pixel = fb->format->cpp[0] * 8;
+	var->bits_per_pixel = bpp;
 
 	/*
 	 * drm fbdev emulation doesn't support changing the pixel format at all,
@@ -1722,11 +1758,11 @@ static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper,
 }
 
 static void drm_fb_helper_fill_fix(struct fb_info *info, uint32_t pitch,
-				   uint32_t depth)
+				   bool is_color_indexed)
 {
 	info->fix.type = FB_TYPE_PACKED_PIXELS;
-	info->fix.visual = depth == 8 ? FB_VISUAL_PSEUDOCOLOR :
-		FB_VISUAL_TRUECOLOR;
+	info->fix.visual = is_color_indexed ? FB_VISUAL_PSEUDOCOLOR
+					    : FB_VISUAL_TRUECOLOR;
 	info->fix.mmio_start = 0;
 	info->fix.mmio_len = 0;
 	info->fix.type_aux = 0;
@@ -1743,19 +1779,31 @@ static void drm_fb_helper_fill_var(struct fb_info *info,
 				   uint32_t fb_width, uint32_t fb_height)
 {
 	struct drm_framebuffer *fb = fb_helper->fb;
+	const struct drm_format_info *format = fb->format;
+
+	switch (format->format) {
+	case DRM_FORMAT_C1:
+	case DRM_FORMAT_C2:
+	case DRM_FORMAT_C4:
+		/* supported format with sub-byte pixels */
+		break;
+
+	default:
+		WARN_ON((drm_format_info_block_width(format, 0) > 1) ||
+			(drm_format_info_block_height(format, 0) > 1));
+		break;
+	}
 
-	WARN_ON((drm_format_info_block_width(fb->format, 0) > 1) ||
-		(drm_format_info_block_height(fb->format, 0) > 1));
 	info->pseudo_palette = fb_helper->pseudo_palette;
 	info->var.xres_virtual = fb->width;
 	info->var.yres_virtual = fb->height;
-	info->var.bits_per_pixel = fb->format->cpp[0] * 8;
+	info->var.bits_per_pixel = drm_format_info_bpp(format, 0);
 	info->var.accel_flags = FB_ACCELF_TEXT;
 	info->var.xoffset = 0;
 	info->var.yoffset = 0;
 	info->var.activate = FB_ACTIVATE_NOW;
 
-	drm_fb_helper_fill_pixel_fmt(&info->var, fb->format->depth);
+	drm_fb_helper_fill_pixel_fmt(&info->var, format);
 
 	info->var.xres = fb_width;
 	info->var.yres = fb_height;
@@ -1780,7 +1828,8 @@ void drm_fb_helper_fill_info(struct fb_info *info,
 {
 	struct drm_framebuffer *fb = fb_helper->fb;
 
-	drm_fb_helper_fill_fix(info, fb->pitches[0], fb->format->depth);
+	drm_fb_helper_fill_fix(info, fb->pitches[0],
+			       fb->format->is_color_indexed);
 	drm_fb_helper_fill_var(info, fb_helper,
 			       sizes->fb_width, sizes->fb_height);
 
-- 
2.25.1

