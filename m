Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C90BF7DF359
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 14:11:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49A7110E896;
	Thu,  2 Nov 2023 13:11:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B62410E879;
 Thu,  2 Nov 2023 13:11:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C8B0A1F8D4;
 Thu,  2 Nov 2023 13:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1698930660; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7KfJ4kmJmrCWA1BfGL+P6+SYEN6ZhqhnXEE9PTRpG+Y=;
 b=ogJEETK8YbZhNUGbBRgQOp1Elkh86KvnZI4E4cBULt5QXTLqgpi9KRSwJklPd4Re/MpR0/
 IcRuwRn1RQkevoyMK5lOsXXwl8iQsKid69WDxwJHxXnaU/h9Mmu2T3d7DCzks2vdu5AJRy
 uCmhE/DeDCKNdosJIh15WWt2IFafbt0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1698930660;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7KfJ4kmJmrCWA1BfGL+P6+SYEN6ZhqhnXEE9PTRpG+Y=;
 b=t4i6oj5qNmD1U+i58S/WSnRg3mEiWAqLG4JnMKwzQNguHxh4qFEBEjliczNXxSPTPZlXxI
 6vCV5z4oWfA2kdCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7A52713A8C;
 Thu,  2 Nov 2023 13:11:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kN4jHeSfQ2VRXwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 02 Nov 2023 13:11:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com,
 ville.syrjala@linux.intel.com, imre.deak@intel.com,
 tejas.upadhyay@intel.com, jouni.hogander@intel.com, javierm@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH v6 7/7] drm/i915: Implement fbdev emulation as in-kernel client
Date: Thu,  2 Nov 2023 14:08:12 +0100
Message-ID: <20231102131056.7256-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231102131056.7256-1-tzimmermann@suse.de>
References: <20231102131056.7256-1-tzimmermann@suse.de>
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
single call to intel_fbdev_setup() after i915 has registered its
DRM device. Just like similar code in other drivers, i915 fbdev
emulation now acts like a regular DRM client.

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

v6:
	* use 'i915' for i915 device (Jouni)
	* remove unnecessary code for non-atomic mode setting
	  (Jouni, Ville)
	* fix function name in commit message (Jouni)
v3:
	* as before, silently ignore devices without displays
v2:
	* let drm_client_register() handle initial hotplug
	* fix driver name in error message (Jani)
	* fix non-fbdev build (kernel test robot)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/i915/display/intel_display.c  |   1 -
 .../drm/i915/display/intel_display_driver.c   |  18 --
 drivers/gpu/drm/i915/display/intel_fbdev.c    | 177 ++++++++----------
 drivers/gpu/drm/i915/display/intel_fbdev.h    |  20 +-
 drivers/gpu/drm/i915/i915_driver.c            |   2 +
 5 files changed, 80 insertions(+), 138 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 28d85e1e858ea..7a8b50d6e52e1 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -82,7 +82,6 @@
 #include "intel_dvo.h"
 #include "intel_fb.h"
 #include "intel_fbc.h"
-#include "intel_fbdev.h"
 #include "intel_fdi.h"
 #include "intel_fifo_underrun.h"
 #include "intel_frontbuffer.h"
diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index ffdcddd1943e0..213a4ee93ffc2 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -364,10 +364,6 @@ int intel_display_driver_probe(struct drm_i915_private *i915)
 
 	intel_overlay_setup(i915);
 
-	ret = intel_fbdev_init(&i915->drm);
-	if (ret)
-		return ret;
-
 	/* Only enable hotplug handling once the fbdev is fully set up. */
 	intel_hpd_init(i915);
 	intel_hpd_poll_disable(i915);
@@ -392,16 +388,6 @@ void intel_display_driver_register(struct drm_i915_private *i915)
 
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
 	/*
 	 * We need to coordinate the hotplugs with the asynchronous
 	 * fbdev configuration, for which we use the
@@ -445,9 +431,6 @@ void intel_display_driver_remove_noirq(struct drm_i915_private *i915)
 	 */
 	intel_hpd_poll_fini(i915);
 
-	/* poll work can call into fbdev, hence clean that up afterwards */
-	intel_fbdev_fini(i915);
-
 	intel_unregister_dsm_handler();
 
 	/* flush any delayed tasks or pending work */
@@ -484,7 +467,6 @@ void intel_display_driver_unregister(struct drm_i915_private *i915)
 	if (!HAS_DISPLAY(i915))
 		return;
 
-	intel_fbdev_unregister(i915);
 	intel_audio_deinit(i915);
 
 	/*
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 2837791613608..023c71cabe477 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -24,7 +24,6 @@
  *     David Airlie
  */
 
-#include <linux/async.h>
 #include <linux/console.h>
 #include <linux/delay.h>
 #include <linux/errno.h>
@@ -39,6 +38,7 @@
 #include <linux/vga_switcheroo.h>
 
 #include <drm/drm_crtc.h>
+#include <drm/drm_crtc_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_framebuffer_helper.h>
@@ -58,7 +58,6 @@ struct intel_fbdev {
 	struct intel_framebuffer *fb;
 	struct i915_vma *vma;
 	unsigned long vma_flags;
-	async_cookie_t cookie;
 	int preferred_bpp;
 
 	/* Whether or not fbdev hpd processing is temporarily suspended */
@@ -135,6 +134,26 @@ static int intel_fbdev_mmap(struct fb_info *info, struct vm_area_struct *vma)
 	return i915_gem_fb_mmap(obj, vma);
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
 	__FB_DEFAULT_DEFERRED_OPS_RDWR(intel_fbdev),
@@ -144,6 +163,7 @@ static const struct fb_ops intelfb_ops = {
 	.fb_pan_display = intel_fbdev_pan_display,
 	__FB_DEFAULT_DEFERRED_OPS_DRAW(intel_fbdev),
 	.fb_mmap = intel_fbdev_mmap,
+	.fb_destroy = intel_fbdev_fb_destroy,
 };
 
 static int intelfb_alloc(struct drm_fb_helper *helper,
@@ -212,7 +232,6 @@ static int intelfb_create(struct drm_fb_helper *helper,
 	struct intel_framebuffer *intel_fb = ifbdev->fb;
 	struct drm_device *dev = helper->dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
-	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 	struct i915_ggtt *ggtt = to_gt(dev_priv)->ggtt;
 	const struct i915_gtt_view view = {
 		.type = I915_GTT_VIEW_NORMAL,
@@ -337,7 +356,7 @@ static int intelfb_create(struct drm_fb_helper *helper,
 	ifbdev->vma_flags = flags;
 
 	intel_runtime_pm_put(&dev_priv->runtime_pm, wakeref);
-	vga_switcheroo_client_fb_set(pdev, info);
+
 	return 0;
 
 out_unpin:
@@ -363,26 +382,6 @@ static const struct drm_fb_helper_funcs intel_fb_helper_funcs = {
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
@@ -546,16 +545,6 @@ static void intel_fbdev_suspend_worker(struct work_struct *work)
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
@@ -646,8 +635,6 @@ static int intel_fbdev_output_poll_changed(struct drm_device *dev)
 	if (!ifbdev)
 		return -EINVAL;
 
-	intel_fbdev_sync(ifbdev);
-
 	mutex_lock(&ifbdev->hpd_lock);
 	send_hpd = !ifbdev->hpd_suspended;
 	ifbdev->hpd_waiting = true;
@@ -667,7 +654,6 @@ static int intel_fbdev_restore_mode(struct drm_i915_private *dev_priv)
 	if (!ifbdev)
 		return -EINVAL;
 
-	intel_fbdev_sync(ifbdev);
 	if (!ifbdev->vma)
 		return -ENOMEM;
 
@@ -685,7 +671,20 @@ static int intel_fbdev_restore_mode(struct drm_i915_private *dev_priv)
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
@@ -703,7 +702,31 @@ static int intel_fbdev_client_restore(struct drm_client_dev *client)
 
 static int intel_fbdev_client_hotplug(struct drm_client_dev *client)
 {
-	return intel_fbdev_output_poll_changed(client->dev);
+	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
+	struct drm_device *dev = client->dev;
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
+	int ret;
+
+	if (dev->fb_helper)
+		return intel_fbdev_output_poll_changed(dev);
+
+	ret = drm_fb_helper_init(dev, fb_helper);
+	if (ret)
+		goto err_drm_err;
+
+	ret = drm_fb_helper_initial_config(fb_helper);
+	if (ret)
+		goto err_drm_fb_helper_fini;
+
+	vga_switcheroo_client_fb_set(pdev, fb_helper->info);
+
+	return 0;
+
+err_drm_fb_helper_fini:
+	drm_fb_helper_fini(fb_helper);
+err_drm_err:
+	drm_err(dev, "Failed to setup i915 fbdev emulation (ret=%d)\n", ret);
+	return ret;
 }
 
 static const struct drm_client_funcs intel_fbdev_client_funcs = {
@@ -713,22 +736,23 @@ static const struct drm_client_funcs intel_fbdev_client_funcs = {
 	.hotplug	= intel_fbdev_client_hotplug,
 };
 
-int intel_fbdev_init(struct drm_device *dev)
+void intel_fbdev_setup(struct drm_i915_private *i915)
 {
-	struct drm_i915_private *dev_priv = to_i915(dev);
+	struct drm_device *dev = &i915->drm;
 	struct intel_fbdev *ifbdev;
 	int ret;
 
-	if (drm_WARN_ON(dev, !HAS_DISPLAY(dev_priv)))
-		return -ENODEV;
+	if (!HAS_DISPLAY(i915))
+		return;
 
 	ifbdev = kzalloc(sizeof(*ifbdev), GFP_KERNEL);
 	if (!ifbdev)
-		return -ENOMEM;
-
-	mutex_init(&ifbdev->hpd_lock);
+		return;
 	drm_fb_helper_prepare(dev, &ifbdev->helper, 32, &intel_fb_helper_funcs);
 
+	i915->display.fbdev.fbdev = ifbdev;
+	INIT_WORK(&i915->display.fbdev.suspend_work, intel_fbdev_suspend_worker);
+	mutex_init(&ifbdev->hpd_lock);
 	if (intel_fbdev_init_bios(dev, ifbdev))
 		ifbdev->helper.preferred_bpp = ifbdev->preferred_bpp;
 	else
@@ -736,68 +760,19 @@ int intel_fbdev_init(struct drm_device *dev)
 
 	ret = drm_client_init(dev, &ifbdev->helper.client, "intel-fbdev",
 			      &intel_fbdev_client_funcs);
-	if (ret)
+	if (ret) {
+		drm_err(dev, "Failed to register client: %d\n", ret);
 		goto err_drm_fb_helper_unprepare;
+	}
 
-	ret = drm_fb_helper_init(dev, &ifbdev->helper);
-	if (ret)
-		goto err_drm_client_release;
-
-	dev_priv->display.fbdev.fbdev = ifbdev;
-	INIT_WORK(&dev_priv->display.fbdev.suspend_work, intel_fbdev_suspend_worker);
+	drm_client_register(&ifbdev->helper.client);
 
-	return 0;
+	return;
 
-err_drm_client_release:
-	drm_client_release(&ifbdev->helper.client);
 err_drm_fb_helper_unprepare:
 	drm_fb_helper_unprepare(&ifbdev->helper);
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
index 8c953f102ba22..08de2d5b34338 100644
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
+static inline void intel_fbdev_setup(struct drm_i915_private *dev_priv)
 {
 }
 
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index a69e132b62c4a..a5243e8683c33 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -819,6 +819,8 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	i915->do_release = true;
 
+	intel_fbdev_setup(i915);
+
 	return 0;
 
 out_cleanup_gem:
-- 
2.42.0

