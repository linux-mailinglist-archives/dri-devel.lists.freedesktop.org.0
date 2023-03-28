Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 775966CBD3C
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 13:14:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40DD110E87B;
	Tue, 28 Mar 2023 11:14:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2511110E85E;
 Tue, 28 Mar 2023 11:14:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C6826219E4;
 Tue, 28 Mar 2023 11:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680002065; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LqnwFjIKQj7MNGtpHwqh2SmaI+hJFdiJMV/ktx/sdw4=;
 b=IpFO+NB/L7E7zZZdN0HSv7NXIXNH3dNVLuhsZM8HAhyNjuUb/mthZHWmK6VgHdCSKLFnqz
 LezV7/1FGZLg5/bvgd4cgeZUmL2h320u76VRRtA+vp94GfzdZG/BQzstPi8GcZhMDMkA/y
 t+7UGhxC1k9mr17vGL8nQgyPUM+fnDY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680002065;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LqnwFjIKQj7MNGtpHwqh2SmaI+hJFdiJMV/ktx/sdw4=;
 b=ODccKtEkH6AQqtFVAzwJDWD3ciHt9tsXz+kpaiuukH34QUW7X+n0SbJN0odqT/2/3LQzVp
 a3XgRVcQ3+D4cHAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 71EA91390F;
 Tue, 28 Mar 2023 11:14:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +MvVGhHMImThCAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 28 Mar 2023 11:14:25 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com, airlied@gmail.com,
 daniel@ffwll.ch, ville.syrjala@linux.intel.com, imre.deak@intel.com,
 tejas.upadhyay@intel.com, javierm@redhat.com
Subject: [PATCH 4/4] drm/i915: Implement fbdev emulation as in-kernel client
Date: Tue, 28 Mar 2023 13:14:22 +0200
Message-Id: <20230328111422.23986-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230328111422.23986-1-tzimmermann@suse.de>
References: <20230328111422.23986-1-tzimmermann@suse.de>
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
Cc: intel-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace all code that initializes or releases fbdev emulation
throughout the driver. Instead initialize the fbdev client by a
single call to i915_fbdev_setup() after i915 has registered its
DRM device. Just like in most drivers, i915 fbdev emulation now
acts like a regular DRM client.

The fbdev client setup consists of the initial preparation and the
hot-plugging of the display. The latter creates the fbdev device
and sets up the fbdev framebuffer. The setup performs display
hot-plugging once. If no display can be detected, DRM probe helpers
re-run the detection on each hotplug event.

A call to drm_dev_unregister() releases the client automatically.
No further action is required within i915. If the fbdev framebuffer
has been fully set up, struct fb_ops.fb_destroy implements the
release. For partially initialized emulation, the fbdev client
reverts the initial setup.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/i915/display/intel_display.c |  30 ---
 drivers/gpu/drm/i915/display/intel_fbdev.c   | 184 +++++++++----------
 drivers/gpu/drm/i915/display/intel_fbdev.h   |  20 +-
 drivers/gpu/drm/i915/i915_driver.c           |   2 +
 4 files changed, 87 insertions(+), 149 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 430a1016e013..1bbeb7a061e3 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -85,7 +85,6 @@
 #include "intel_dvo.h"
 #include "intel_fb.h"
 #include "intel_fbc.h"
-#include "intel_fbdev.h"
 #include "intel_fdi.h"
 #include "intel_fifo_underrun.h"
 #include "intel_frontbuffer.h"
@@ -8588,11 +8587,6 @@ int intel_modeset_init(struct drm_i915_private *i915)
 
 	intel_overlay_setup(i915);
 
-	ret = intel_fbdev_init(&i915->drm);
-	if (ret)
-		return ret;
-
-	/* Only enable hotplug handling once the fbdev is fully set up. */
 	intel_hpd_init(i915);
 	intel_hpd_poll_disable(i915);
 
@@ -8796,9 +8790,6 @@ void intel_modeset_driver_remove_noirq(struct drm_i915_private *i915)
 	 */
 	intel_hpd_poll_fini(i915);
 
-	/* poll work can call into fbdev, hence clean that up afterwards */
-	intel_fbdev_fini(i915);
-
 	intel_unregister_dsm_handler();
 
 	/* flush any delayed tasks or pending work */
@@ -8864,21 +8855,6 @@ void intel_display_driver_register(struct drm_i915_private *i915)
 
 	intel_display_debugfs_register(i915);
 
-	/*
-	 * Some ports require correctly set-up hpd registers for
-	 * detection to work properly (leading to ghost connected
-	 * connector status), e.g. VGA on gm45.  Hence we can only set
-	 * up the initial fbdev config after hpd irqs are fully
-	 * enabled. We do it last so that the async config cannot run
-	 * before the connectors are registered.
-	 */
-	intel_fbdev_initial_config_async(i915);
-
-	/*
-	 * We need to coordinate the hotplugs with the asynchronous
-	 * fbdev configuration, for which we use the
-	 * fbdev->async_cookie.
-	 */
 	drm_kms_helper_poll_init(&i915->drm);
 }
 
@@ -8887,14 +8863,8 @@ void intel_display_driver_unregister(struct drm_i915_private *i915)
 	if (!HAS_DISPLAY(i915))
 		return;
 
-	intel_fbdev_unregister(i915);
 	intel_audio_deinit(i915);
 
-	/*
-	 * After flushing the fbdev (incl. a late async config which
-	 * will have delayed queuing of a hotplug event), then flush
-	 * the hotplug events.
-	 */
 	drm_kms_helper_poll_fini(&i915->drm);
 	drm_atomic_helper_shutdown(&i915->drm);
 
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index bdb9e6f43602..8b618db30ee5 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -24,7 +24,6 @@
  *     David Airlie
  */
 
-#include <linux/async.h>
 #include <linux/console.h>
 #include <linux/delay.h>
 #include <linux/errno.h>
@@ -38,6 +37,7 @@
 #include <linux/vga_switcheroo.h>
 
 #include <drm/drm_crtc.h>
+#include <drm/drm_crtc_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
 
@@ -55,7 +55,6 @@ struct intel_fbdev {
 	struct intel_framebuffer *fb;
 	struct i915_vma *vma;
 	unsigned long vma_flags;
-	async_cookie_t cookie;
 	int preferred_bpp;
 
 	/* Whether or not fbdev hpd processing is temporarily suspended */
@@ -120,6 +119,26 @@ static int intel_fbdev_pan_display(struct fb_var_screeninfo *var,
 	return ret;
 }
 
+static void intel_fbdev_fb_destroy(struct fb_info *info)
+{
+	struct drm_fb_helper *fb_helper = info->par;
+	struct intel_fbdev *ifbdev = container_of(fb_helper, struct intel_fbdev, helper);
+
+	drm_fb_helper_fini(&ifbdev->helper);
+
+	/*
+	 * We rely on the object-free to release the VMA pinning for
+	 * the info->screen_base mmaping. Leaking the VMA is simpler than
+	 * trying to rectify all the possible error paths leading here.
+	 */
+	intel_unpin_fb_vma(ifbdev->vma, ifbdev->vma_flags);
+	drm_framebuffer_remove(&ifbdev->fb->base);
+
+	drm_client_release(&fb_helper->client);
+	drm_fb_helper_unprepare(&ifbdev->helper);
+	kfree(ifbdev);
+}
+
 static const struct fb_ops intelfb_ops = {
 	.owner = THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
@@ -131,6 +150,7 @@ static const struct fb_ops intelfb_ops = {
 	.fb_imageblit = drm_fb_helper_cfb_imageblit,
 	.fb_pan_display = intel_fbdev_pan_display,
 	.fb_blank = intel_fbdev_blank,
+	.fb_destroy = intel_fbdev_fb_destroy,
 };
 
 static int intelfb_alloc(struct drm_fb_helper *helper,
@@ -198,7 +218,6 @@ static int intelfb_create(struct drm_fb_helper *helper,
 	struct intel_framebuffer *intel_fb = ifbdev->fb;
 	struct drm_device *dev = helper->dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
-	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 	struct i915_ggtt *ggtt = to_gt(dev_priv)->ggtt;
 	const struct i915_gtt_view view = {
 		.type = I915_GTT_VIEW_NORMAL,
@@ -323,7 +342,7 @@ static int intelfb_create(struct drm_fb_helper *helper,
 	ifbdev->vma_flags = flags;
 
 	intel_runtime_pm_put(&dev_priv->runtime_pm, wakeref);
-	vga_switcheroo_client_fb_set(pdev, info);
+
 	return 0;
 
 out_unpin:
@@ -349,26 +368,6 @@ static const struct drm_fb_helper_funcs intel_fb_helper_funcs = {
 	.fb_dirty = intelfb_dirty,
 };
 
-static void intel_fbdev_destroy(struct intel_fbdev *ifbdev)
-{
-	/* We rely on the object-free to release the VMA pinning for
-	 * the info->screen_base mmaping. Leaking the VMA is simpler than
-	 * trying to rectify all the possible error paths leading here.
-	 */
-
-	drm_fb_helper_fini(&ifbdev->helper);
-
-	if (ifbdev->vma)
-		intel_unpin_fb_vma(ifbdev->vma, ifbdev->vma_flags);
-
-	if (ifbdev->fb)
-		drm_framebuffer_remove(&ifbdev->fb->base);
-
-	drm_client_release(&ifbdev->helper.client);
-	drm_fb_helper_unprepare(&ifbdev->helper);
-	kfree(ifbdev);
-}
-
 /*
  * Build an intel_fbdev struct using a BIOS allocated framebuffer, if possible.
  * The core display code will have read out the current plane configuration,
@@ -532,16 +531,6 @@ static void intel_fbdev_suspend_worker(struct work_struct *work)
 				true);
 }
 
-static void intel_fbdev_sync(struct intel_fbdev *ifbdev)
-{
-	if (!ifbdev->cookie)
-		return;
-
-	/* Only serialises with all preceding async calls, hence +1 */
-	async_synchronize_cookie(ifbdev->cookie + 1);
-	ifbdev->cookie = 0;
-}
-
 /* Suspends/resumes fbdev processing of incoming HPD events. When resuming HPD
  * processing, fbdev will perform a full connector reprobe if a hotplug event
  * was received while HPD was suspended.
@@ -631,8 +620,6 @@ static void intel_fbdev_output_poll_changed(struct drm_device *dev)
 	if (!ifbdev)
 		return;
 
-	intel_fbdev_sync(ifbdev);
-
 	mutex_lock(&ifbdev->hpd_lock);
 	send_hpd = !ifbdev->hpd_suspended;
 	ifbdev->hpd_waiting = true;
@@ -649,7 +636,6 @@ static void intel_fbdev_restore_mode(struct drm_i915_private *dev_priv)
 	if (!ifbdev)
 		return;
 
-	intel_fbdev_sync(ifbdev);
 	if (!ifbdev->vma)
 		return;
 
@@ -662,7 +648,20 @@ static void intel_fbdev_restore_mode(struct drm_i915_private *dev_priv)
  */
 
 static void intel_fbdev_client_unregister(struct drm_client_dev *client)
-{ }
+{
+	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
+	struct drm_device *dev = fb_helper->dev;
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
+
+	if (fb_helper->info) {
+		vga_switcheroo_client_fb_set(pdev, NULL);
+		drm_fb_helper_unregister_info(fb_helper);
+	} else {
+		drm_fb_helper_unprepare(fb_helper);
+		drm_client_release(&fb_helper->client);
+		kfree(fb_helper);
+	}
+}
 
 static int intel_fbdev_client_restore(struct drm_client_dev *client)
 {
@@ -676,9 +675,36 @@ static int intel_fbdev_client_restore(struct drm_client_dev *client)
 
 static int intel_fbdev_client_hotplug(struct drm_client_dev *client)
 {
-	intel_fbdev_output_poll_changed(client->dev);
+	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
+	struct drm_device *dev = client->dev;
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
+	int ret;
+
+	if (dev->fb_helper) {
+		intel_fbdev_output_poll_changed(dev);
+		return 0;
+	}
+
+	ret = drm_fb_helper_init(dev, fb_helper);
+	if (ret)
+		goto err_drm_err;
+
+	if (!drm_drv_uses_atomic_modeset(dev))
+		drm_helper_disable_unused_functions(dev);
+
+	ret = drm_fb_helper_initial_config(fb_helper);
+	if (ret)
+		goto err_drm_fb_helper_fini;
+
+	vga_switcheroo_client_fb_set(pdev, fb_helper->info);
 
 	return 0;
+
+err_drm_fb_helper_fini:
+	drm_fb_helper_fini(fb_helper);
+err_drm_err:
+	drm_err(dev, "Failed to setup radeon fbdev emulation (ret=%d)\n", ret);
+	return ret;
 }
 
 static const struct drm_client_funcs intel_fbdev_client_funcs = {
@@ -688,22 +714,23 @@ static const struct drm_client_funcs intel_fbdev_client_funcs = {
 	.hotplug	= intel_fbdev_client_hotplug,
 };
 
-int intel_fbdev_init(struct drm_device *dev)
+void intel_fbdev_setup(struct drm_i915_private *dev_priv)
 {
-	struct drm_i915_private *dev_priv = to_i915(dev);
+	struct drm_device *dev = &dev_priv->drm;
 	struct intel_fbdev *ifbdev;
 	int ret;
 
 	if (drm_WARN_ON(dev, !HAS_DISPLAY(dev_priv)))
-		return -ENODEV;
-
-	ifbdev = kzalloc(sizeof(struct intel_fbdev), GFP_KERNEL);
-	if (ifbdev == NULL)
-		return -ENOMEM;
+		return;
 
-	mutex_init(&ifbdev->hpd_lock);
+	ifbdev = kzalloc(sizeof(*ifbdev), GFP_KERNEL);
+	if (!ifbdev)
+		return;
 	drm_fb_helper_prepare(dev, &ifbdev->helper, 32, &intel_fb_helper_funcs);
 
+	dev_priv->display.fbdev.fbdev = ifbdev;
+	INIT_WORK(&dev_priv->display.fbdev.suspend_work, intel_fbdev_suspend_worker);
+	mutex_init(&ifbdev->hpd_lock);
 	if (intel_fbdev_init_bios(dev, ifbdev))
 		ifbdev->helper.preferred_bpp = ifbdev->preferred_bpp;
 	else
@@ -711,68 +738,23 @@ int intel_fbdev_init(struct drm_device *dev)
 
 	ret = drm_client_init(dev, &ifbdev->helper.client, "i915-fbdev",
 			      &intel_fbdev_client_funcs);
-	if (ret)
+	if (ret) {
+		drm_err(dev, "Failed to register client: %d\n", ret);
 		goto err_drm_fb_helper_unprepare;
+	}
 
-	ret = drm_fb_helper_init(dev, &ifbdev->helper);
+	ret = intel_fbdev_client_hotplug(&ifbdev->helper.client);
 	if (ret)
-		goto err_drm_client_release;
+		drm_dbg_kms(dev, "client hotplug ret=%d\n", ret);
 
-	dev_priv->display.fbdev.fbdev = ifbdev;
-	INIT_WORK(&dev_priv->display.fbdev.suspend_work, intel_fbdev_suspend_worker);
+	drm_client_register(&ifbdev->helper.client);
 
-	return 0;
+	return;
 
-err_drm_client_release:
-	drm_client_release(&ifbdev->helper.client);
 err_drm_fb_helper_unprepare:
-	drm_client_release(&ifbdev->helper.client);
+	drm_fb_helper_unprepare(&ifbdev->helper);
+	mutex_destroy(&ifbdev->hpd_lock);
 	kfree(ifbdev);
-	return ret;
-}
-
-static void intel_fbdev_initial_config(void *data, async_cookie_t cookie)
-{
-	struct intel_fbdev *ifbdev = data;
-
-	/* Due to peculiar init order wrt to hpd handling this is separate. */
-	if (drm_fb_helper_initial_config(&ifbdev->helper))
-		intel_fbdev_unregister(to_i915(ifbdev->helper.dev));
-}
-
-void intel_fbdev_initial_config_async(struct drm_i915_private *dev_priv)
-{
-	struct intel_fbdev *ifbdev = dev_priv->display.fbdev.fbdev;
-
-	if (!ifbdev)
-		return;
-
-	ifbdev->cookie = async_schedule(intel_fbdev_initial_config, ifbdev);
-}
-
-void intel_fbdev_unregister(struct drm_i915_private *dev_priv)
-{
-	struct intel_fbdev *ifbdev = dev_priv->display.fbdev.fbdev;
-
-	if (!ifbdev)
-		return;
-
-	intel_fbdev_set_suspend(&dev_priv->drm, FBINFO_STATE_SUSPENDED, true);
-
-	if (!current_is_async())
-		intel_fbdev_sync(ifbdev);
-
-	drm_fb_helper_unregister_info(&ifbdev->helper);
-}
-
-void intel_fbdev_fini(struct drm_i915_private *dev_priv)
-{
-	struct intel_fbdev *ifbdev = fetch_and_zero(&dev_priv->display.fbdev.fbdev);
-
-	if (!ifbdev)
-		return;
-
-	intel_fbdev_destroy(ifbdev);
 }
 
 struct intel_framebuffer *intel_fbdev_framebuffer(struct intel_fbdev *fbdev)
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.h b/drivers/gpu/drm/i915/display/intel_fbdev.h
index 8c953f102ba2..8123c813caaf 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.h
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.h
@@ -14,27 +14,11 @@ struct intel_fbdev;
 struct intel_framebuffer;
 
 #ifdef CONFIG_DRM_FBDEV_EMULATION
-int intel_fbdev_init(struct drm_device *dev);
-void intel_fbdev_initial_config_async(struct drm_i915_private *dev_priv);
-void intel_fbdev_unregister(struct drm_i915_private *dev_priv);
-void intel_fbdev_fini(struct drm_i915_private *dev_priv);
+void intel_fbdev_setup(struct drm_i915_private *dev_priv);
 void intel_fbdev_set_suspend(struct drm_device *dev, int state, bool synchronous);
 struct intel_framebuffer *intel_fbdev_framebuffer(struct intel_fbdev *fbdev);
 #else
-static inline int intel_fbdev_init(struct drm_device *dev)
-{
-	return 0;
-}
-
-static inline void intel_fbdev_initial_config_async(struct drm_i915_private *dev_priv)
-{
-}
-
-static inline void intel_fbdev_unregister(struct drm_i915_private *dev_priv)
-{
-}
-
-static inline void intel_fbdev_fini(struct drm_i915_private *dev_priv)
+void intel_fbdev_setup(struct drm_i915_private *dev_priv);
 {
 }
 
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index be804fd4f79f..0b6722bcfbb2 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -820,6 +820,8 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	i915->do_release = true;
 
+	intel_fbdev_setup(i915);
+
 	return 0;
 
 out_cleanup_gem:
-- 
2.40.0

