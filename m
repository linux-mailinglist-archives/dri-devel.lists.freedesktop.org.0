Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BC855FDF5
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 12:57:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D26412BD98;
	Wed, 29 Jun 2022 10:57:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6C2412BD97
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 10:57:10 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.186.194])
 by xavier.telenet-ops.be with bizsmtp
 id oyx02700b4C55Sk01yx0FS; Wed, 29 Jun 2022 12:57:08 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o6VNT-001IKo-VH; Wed, 29 Jun 2022 12:56:59 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o6VNT-005lOL-EE; Wed, 29 Jun 2022 12:56:59 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Tomi Valkeinen <tomba@kernel.org>
Subject: [PATCH] drm/fb-helper: Remove helpers to change frame buffer config
Date: Wed, 29 Jun 2022 12:56:58 +0200
Message-Id: <20220629105658.1373770-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-fbdev@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DRM fbdev emulation layer does not support pushing back
changes to fb_var_screeninfo to KMS.

However, drm_fb_helper still implements the fb_ops.fb_check_var() and
fb_ops.fb_set_par() callbacks, but the former fails to validate various
parameters passed from userspace.  Hence unsanitized and possible
invaled values are passed up through the fbdev, fbcon, and console
stack, which has become an endless source of security issues reported
against fbdev.

Fix this by not populating the fb_ops.fb_check_var() and
fb_ops.fb_set_par() callbacks, as there is no point in providing them if
the frame buffer config cannot be changed anyway.  This makes the fbdev
core aware that making changes to the frame buffer config is not
supported, so it will always return the current config.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
The only remaining DRM driver that implements fb_ops.fb_check_var() is
also broken, as it fails to validate various parameters passed from
userspace.  So vmw_fb_check_var() should either be fixed, or removed.
---
 drivers/gpu/drm/drm_fb_helper.c            | 180 ++-------------------
 drivers/gpu/drm/i915/display/intel_fbdev.c |  15 --
 drivers/gpu/drm/omapdrm/omap_fbdev.c       |   2 -
 include/drm/drm_fb_helper.h                |  16 --
 4 files changed, 13 insertions(+), 200 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 2d4cee6a10ffffe7..1041a11c410d7967 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -228,9 +228,18 @@ int drm_fb_helper_debug_leave(struct fb_info *info)
 }
 EXPORT_SYMBOL(drm_fb_helper_debug_leave);
 
-static int
-__drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_helper,
-					    bool force)
+/**
+ * drm_fb_helper_restore_fbdev_mode_unlocked - restore fbdev configuration
+ * @fb_helper: driver-allocated fbdev helper, can be NULL
+ *
+ * This should be called from driver's drm &drm_driver.lastclose callback
+ * when implementing an fbcon on top of kms using this helper. This ensures that
+ * the user isn't greeted with a black screen when e.g. X dies.
+ *
+ * RETURNS:
+ * Zero if everything went ok, negative error code otherwise.
+ */
+int drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_helper)
 {
 	bool do_delayed;
 	int ret;
@@ -242,16 +251,7 @@ __drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_helper,
 		return 0;
 
 	mutex_lock(&fb_helper->lock);
-	if (force) {
-		/*
-		 * Yes this is the _locked version which expects the master lock
-		 * to be held. But for forced restores we're intentionally
-		 * racing here, see drm_fb_helper_set_par().
-		 */
-		ret = drm_client_modeset_commit_locked(&fb_helper->client);
-	} else {
-		ret = drm_client_modeset_commit(&fb_helper->client);
-	}
+	ret = drm_client_modeset_commit(&fb_helper->client);
 
 	do_delayed = fb_helper->delayed_hotplug;
 	if (do_delayed)
@@ -263,22 +263,6 @@ __drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_helper,
 
 	return ret;
 }
-
-/**
- * drm_fb_helper_restore_fbdev_mode_unlocked - restore fbdev configuration
- * @fb_helper: driver-allocated fbdev helper, can be NULL
- *
- * This should be called from driver's drm &drm_driver.lastclose callback
- * when implementing an fbcon on top of kms using this helper. This ensures that
- * the user isn't greeted with a black screen when e.g. X dies.
- *
- * RETURNS:
- * Zero if everything went ok, negative error code otherwise.
- */
-int drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_helper)
-{
-	return __drm_fb_helper_restore_fbdev_mode_unlocked(fb_helper, false);
-}
 EXPORT_SYMBOL(drm_fb_helper_restore_fbdev_mode_unlocked);
 
 #ifdef CONFIG_MAGIC_SYSRQ
@@ -1254,25 +1238,6 @@ int drm_fb_helper_ioctl(struct fb_info *info, unsigned int cmd,
 }
 EXPORT_SYMBOL(drm_fb_helper_ioctl);
 
-static bool drm_fb_pixel_format_equal(const struct fb_var_screeninfo *var_1,
-				      const struct fb_var_screeninfo *var_2)
-{
-	return var_1->bits_per_pixel == var_2->bits_per_pixel &&
-	       var_1->grayscale == var_2->grayscale &&
-	       var_1->red.offset == var_2->red.offset &&
-	       var_1->red.length == var_2->red.length &&
-	       var_1->red.msb_right == var_2->red.msb_right &&
-	       var_1->green.offset == var_2->green.offset &&
-	       var_1->green.length == var_2->green.length &&
-	       var_1->green.msb_right == var_2->green.msb_right &&
-	       var_1->blue.offset == var_2->blue.offset &&
-	       var_1->blue.length == var_2->blue.length &&
-	       var_1->blue.msb_right == var_2->blue.msb_right &&
-	       var_1->transp.offset == var_2->transp.offset &&
-	       var_1->transp.length == var_2->transp.length &&
-	       var_1->transp.msb_right == var_2->transp.msb_right;
-}
-
 static void drm_fb_helper_fill_pixel_fmt(struct fb_var_screeninfo *var,
 					 u8 depth)
 {
@@ -1331,123 +1296,6 @@ static void drm_fb_helper_fill_pixel_fmt(struct fb_var_screeninfo *var,
 	}
 }
 
-/**
- * drm_fb_helper_check_var - implementation for &fb_ops.fb_check_var
- * @var: screeninfo to check
- * @info: fbdev registered by the helper
- */
-int drm_fb_helper_check_var(struct fb_var_screeninfo *var,
-			    struct fb_info *info)
-{
-	struct drm_fb_helper *fb_helper = info->par;
-	struct drm_framebuffer *fb = fb_helper->fb;
-	struct drm_device *dev = fb_helper->dev;
-
-	if (in_dbg_master())
-		return -EINVAL;
-
-	if (var->pixclock != 0) {
-		drm_dbg_kms(dev, "fbdev emulation doesn't support changing the pixel clock, value of pixclock is ignored\n");
-		var->pixclock = 0;
-	}
-
-	if ((drm_format_info_block_width(fb->format, 0) > 1) ||
-	    (drm_format_info_block_height(fb->format, 0) > 1))
-		return -EINVAL;
-
-	/*
-	 * Changes struct fb_var_screeninfo are currently not pushed back
-	 * to KMS, hence fail if different settings are requested.
-	 */
-	if (var->bits_per_pixel > fb->format->cpp[0] * 8 ||
-	    var->xres > fb->width || var->yres > fb->height ||
-	    var->xres_virtual > fb->width || var->yres_virtual > fb->height) {
-		drm_dbg_kms(dev, "fb requested width/height/bpp can't fit in current fb "
-			  "request %dx%d-%d (virtual %dx%d) > %dx%d-%d\n",
-			  var->xres, var->yres, var->bits_per_pixel,
-			  var->xres_virtual, var->yres_virtual,
-			  fb->width, fb->height, fb->format->cpp[0] * 8);
-		return -EINVAL;
-	}
-
-	/*
-	 * Workaround for SDL 1.2, which is known to be setting all pixel format
-	 * fields values to zero in some cases. We treat this situation as a
-	 * kind of "use some reasonable autodetected values".
-	 */
-	if (!var->red.offset     && !var->green.offset    &&
-	    !var->blue.offset    && !var->transp.offset   &&
-	    !var->red.length     && !var->green.length    &&
-	    !var->blue.length    && !var->transp.length   &&
-	    !var->red.msb_right  && !var->green.msb_right &&
-	    !var->blue.msb_right && !var->transp.msb_right) {
-		drm_fb_helper_fill_pixel_fmt(var, fb->format->depth);
-	}
-
-	/*
-	 * Likewise, bits_per_pixel should be rounded up to a supported value.
-	 */
-	var->bits_per_pixel = fb->format->cpp[0] * 8;
-
-	/*
-	 * drm fbdev emulation doesn't support changing the pixel format at all,
-	 * so reject all pixel format changing requests.
-	 */
-	if (!drm_fb_pixel_format_equal(var, &info->var)) {
-		drm_dbg_kms(dev, "fbdev emulation doesn't support changing the pixel format\n");
-		return -EINVAL;
-	}
-
-	return 0;
-}
-EXPORT_SYMBOL(drm_fb_helper_check_var);
-
-/**
- * drm_fb_helper_set_par - implementation for &fb_ops.fb_set_par
- * @info: fbdev registered by the helper
- *
- * This will let fbcon do the mode init and is called at initialization time by
- * the fbdev core when registering the driver, and later on through the hotplug
- * callback.
- */
-int drm_fb_helper_set_par(struct fb_info *info)
-{
-	struct drm_fb_helper *fb_helper = info->par;
-	struct fb_var_screeninfo *var = &info->var;
-	bool force;
-
-	if (oops_in_progress)
-		return -EBUSY;
-
-	if (var->pixclock != 0) {
-		drm_err(fb_helper->dev, "PIXEL CLOCK SET\n");
-		return -EINVAL;
-	}
-
-	/*
-	 * Normally we want to make sure that a kms master takes precedence over
-	 * fbdev, to avoid fbdev flickering and occasionally stealing the
-	 * display status. But Xorg first sets the vt back to text mode using
-	 * the KDSET IOCTL with KD_TEXT, and only after that drops the master
-	 * status when exiting.
-	 *
-	 * In the past this was caught by drm_fb_helper_lastclose(), but on
-	 * modern systems where logind always keeps a drm fd open to orchestrate
-	 * the vt switching, this doesn't work.
-	 *
-	 * To not break the userspace ABI we have this special case here, which
-	 * is only used for the above case. Everything else uses the normal
-	 * commit function, which ensures that we never steal the display from
-	 * an active drm master.
-	 */
-	force = var->activate & FB_ACTIVATE_KD_TEXT;
-
-	__drm_fb_helper_restore_fbdev_mode_unlocked(fb_helper, force);
-
-	return 0;
-}
-EXPORT_SYMBOL(drm_fb_helper_set_par);
-
 static void pan_set(struct drm_fb_helper *fb_helper, int x, int y)
 {
 	struct drm_mode_set *mode_set;
@@ -2028,8 +1876,6 @@ int drm_fb_helper_hotplug_event(struct drm_fb_helper *fb_helper)
 	drm_setup_crtcs_fb(fb_helper);
 	mutex_unlock(&fb_helper->lock);
 
-	drm_fb_helper_set_par(fb_helper->fbdev);
-
 	return 0;
 }
 EXPORT_SYMBOL(drm_fb_helper_hotplug_event);
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 221336178991f04f..26dbe9487c79ae1b 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -77,20 +77,6 @@ static void intel_fbdev_invalidate(struct intel_fbdev *ifbdev)
 	intel_frontbuffer_invalidate(to_frontbuffer(ifbdev), ORIGIN_CPU);
 }
 
-static int intel_fbdev_set_par(struct fb_info *info)
-{
-	struct drm_fb_helper *fb_helper = info->par;
-	struct intel_fbdev *ifbdev =
-		container_of(fb_helper, struct intel_fbdev, helper);
-	int ret;
-
-	ret = drm_fb_helper_set_par(info);
-	if (ret == 0)
-		intel_fbdev_invalidate(ifbdev);
-
-	return ret;
-}
-
 static int intel_fbdev_blank(int blank, struct fb_info *info)
 {
 	struct drm_fb_helper *fb_helper = info->par;
@@ -123,7 +109,6 @@ static int intel_fbdev_pan_display(struct fb_var_screeninfo *var,
 static const struct fb_ops intelfb_ops = {
 	.owner = THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
-	.fb_set_par = intel_fbdev_set_par,
 	.fb_fillrect = drm_fb_helper_cfb_fillrect,
 	.fb_copyarea = drm_fb_helper_cfb_copyarea,
 	.fb_imageblit = drm_fb_helper_cfb_imageblit,
diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
index 40706c5aad7b5c9b..2df8875baaca10b6 100644
--- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
+++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
@@ -74,8 +74,6 @@ static int omap_fbdev_pan_display(struct fb_var_screeninfo *var,
 static const struct fb_ops omap_fb_ops = {
 	.owner = THIS_MODULE,
 
-	.fb_check_var	= drm_fb_helper_check_var,
-	.fb_set_par	= drm_fb_helper_set_par,
 	.fb_setcmap	= drm_fb_helper_setcmap,
 	.fb_blank	= drm_fb_helper_blank,
 	.fb_pan_display = omap_fbdev_pan_display,
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index 329607ca65c06684..19b40adc156295a1 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -200,8 +200,6 @@ drm_fb_helper_from_client(struct drm_client_dev *client)
  * functions. To be used in struct fb_ops of drm drivers.
  */
 #define DRM_FB_HELPER_DEFAULT_OPS \
-	.fb_check_var	= drm_fb_helper_check_var, \
-	.fb_set_par	= drm_fb_helper_set_par, \
 	.fb_setcmap	= drm_fb_helper_setcmap, \
 	.fb_blank	= drm_fb_helper_blank, \
 	.fb_pan_display	= drm_fb_helper_pan_display, \
@@ -217,9 +215,6 @@ void drm_fb_helper_fini(struct drm_fb_helper *helper);
 int drm_fb_helper_blank(int blank, struct fb_info *info);
 int drm_fb_helper_pan_display(struct fb_var_screeninfo *var,
 			      struct fb_info *info);
-int drm_fb_helper_set_par(struct fb_info *info);
-int drm_fb_helper_check_var(struct fb_var_screeninfo *var,
-			    struct fb_info *info);
 
 int drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_helper);
 
@@ -303,17 +298,6 @@ static inline int drm_fb_helper_pan_display(struct fb_var_screeninfo *var,
 	return 0;
 }
 
-static inline int drm_fb_helper_set_par(struct fb_info *info)
-{
-	return 0;
-}
-
-static inline int drm_fb_helper_check_var(struct fb_var_screeninfo *var,
-					  struct fb_info *info)
-{
-	return 0;
-}
-
 static inline int
 drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_helper)
 {
-- 
2.25.1

