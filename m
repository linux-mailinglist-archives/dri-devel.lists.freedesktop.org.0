Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B3389D3D0
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 10:10:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F724112B77;
	Tue,  9 Apr 2024 08:10:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="yAfOBJ8s";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NK3340bp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yAfOBJ8s";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NK3340bp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A772112B6E;
 Tue,  9 Apr 2024 08:10:36 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D5E3A20895;
 Tue,  9 Apr 2024 08:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712650234; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aNSqeUxd8gmUs6un7MBqG2h8/QmT2FND1l9vTKFRIVw=;
 b=yAfOBJ8sBQ3HE9kQJOJyIkKxNFP4H2RlAg/j06lEI2UU4ut7ryMrHX+4set5Zyh/YLxsQQ
 4z7turKM/Z1ESPcAujjK24Y9EoheG0t0nX9SIKHdTvGXrzguoFDgpZ+Sbe9kXzWcmVaheJ
 7ID48DOFI7AUm8deJ95Wx3WzrHXTcPw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712650234;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aNSqeUxd8gmUs6un7MBqG2h8/QmT2FND1l9vTKFRIVw=;
 b=NK3340bpueRUke/vBhgPhaJAxNaPijJ7qODlzm+fQZZXmAq1UQFTbdhvjOX+ex827GCP/4
 ne7l+vAX4lPTynCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712650234; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aNSqeUxd8gmUs6un7MBqG2h8/QmT2FND1l9vTKFRIVw=;
 b=yAfOBJ8sBQ3HE9kQJOJyIkKxNFP4H2RlAg/j06lEI2UU4ut7ryMrHX+4set5Zyh/YLxsQQ
 4z7turKM/Z1ESPcAujjK24Y9EoheG0t0nX9SIKHdTvGXrzguoFDgpZ+Sbe9kXzWcmVaheJ
 7ID48DOFI7AUm8deJ95Wx3WzrHXTcPw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712650234;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aNSqeUxd8gmUs6un7MBqG2h8/QmT2FND1l9vTKFRIVw=;
 b=NK3340bpueRUke/vBhgPhaJAxNaPijJ7qODlzm+fQZZXmAq1UQFTbdhvjOX+ex827GCP/4
 ne7l+vAX4lPTynCQ==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 6896F13253;
 Tue,  9 Apr 2024 08:10:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id YOBCGPr3FGbWNAAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Tue, 09 Apr 2024 08:10:34 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, ville.syrjala@linux.intel.com, imre.deak@intel.com,
 tejas.upadhyay@intel.com, jouni.hogander@intel.com, javierm@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch, lucas.demarchi@intel.com,
 ogabbay@kernel.org, thomas.hellstrom@linux.intel.com
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v8 6/6] drm/{i915,
 xe}: Implement fbdev emulation as in-kernel client
Date: Tue,  9 Apr 2024 10:04:28 +0200
Message-ID: <20240409081029.17843-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240409081029.17843-1-tzimmermann@suse.de>
References: <20240409081029.17843-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -6.80
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap2.dmz-prg2.suse.org:helo,imap2.dmz-prg2.suse.org:rdns];
 RCPT_COUNT_TWELVE(0.00)[17]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_TO(0.00)[linux.intel.com,intel.com,redhat.com,gmail.com,ffwll.ch,kernel.org];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RL9pqk354j4esf7wsagg6iyf8a)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

Replace all code that initializes or releases fbdev emulation
throughout the driver. Instead initialize the fbdev client by a
single call to intel_fbdev_setup() after i915 has registered its
DRM device. Just like similar code in other drivers, i915 fbdev
emulation now acts like a regular DRM client. Do the same for xe.

The fbdev client setup consists of the initial preparation and the
hot-plugging of the display. The latter creates the fbdev device
and sets up the fbdev framebuffer. The setup performs display
hot-plugging once. If no display can be detected, DRM probe helpers
re-run the detection on each hotplug event.

A call to drm_client_dev_unregister() releases all in-kernel clients
automatically. No further action is required within i915. If the fbdev
framebuffer has been fully set up, struct fb_ops.fb_destroy implements
the release. For partially initialized emulation, the fbdev client
reverts the initial setup. Do the same for xe and remove its call to
intel_fbdev_fini().

v8:
- setup client in intel_display_driver_register (Jouni)
- mention xe in commit message

v7:
- update xe driver
- reword commit message

v6:
- use 'i915' for i915 device (Jouni)
- remove unnecessary code for non-atomic mode setting (Jouni, Ville)
- fix function name in commit message (Jouni)

v3:
-  as before, silently ignore devices without displays

v2:
-  let drm_client_register() handle initial hotplug
-  fix driver name in error message (Jani)
-  fix non-fbdev build (kernel test robot)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/i915/display/intel_display.c  |   1 -
 .../drm/i915/display/intel_display_driver.c   |  20 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c    | 177 ++++++++----------
 drivers/gpu/drm/i915/display/intel_fbdev.h    |  20 +-
 drivers/gpu/drm/xe/display/xe_display.c       |   2 -
 5 files changed, 80 insertions(+), 140 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 614e60420a29a..161a5aabf6746 100644
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
diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index e5f052d4ff1cc..ed8589fa35448 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -514,10 +514,6 @@ int intel_display_driver_probe(struct drm_i915_private *i915)
 
 	intel_overlay_setup(i915);
 
-	ret = intel_fbdev_init(&i915->drm);
-	if (ret)
-		return ret;
-
 	/* Only enable hotplug handling once the fbdev is fully set up. */
 	intel_hpd_init(i915);
 
@@ -544,16 +540,6 @@ void intel_display_driver_register(struct drm_i915_private *i915)
 
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
@@ -562,6 +548,8 @@ void intel_display_driver_register(struct drm_i915_private *i915)
 	drm_kms_helper_poll_init(&i915->drm);
 	intel_hpd_poll_disable(i915);
 
+	intel_fbdev_setup(i915);
+
 	intel_display_device_info_print(DISPLAY_INFO(i915),
 					DISPLAY_RUNTIME_INFO(i915), &p);
 }
@@ -597,9 +585,6 @@ void intel_display_driver_remove_noirq(struct drm_i915_private *i915)
 	 */
 	intel_hpd_poll_fini(i915);
 
-	/* poll work can call into fbdev, hence clean that up afterwards */
-	intel_fbdev_fini(i915);
-
 	intel_unregister_dsm_handler();
 
 	/* flush any delayed tasks or pending work */
@@ -640,7 +625,6 @@ void intel_display_driver_unregister(struct drm_i915_private *i915)
 
 	drm_client_dev_unregister(&i915->drm);
 
-	intel_fbdev_unregister(i915);
 	/*
 	 * After flushing the fbdev (incl. a late async config which
 	 * will have delayed queuing of a hotplug event), then flush
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index f783de611a7f5..bda702c2cab8e 100644
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
 __diag_push();
 __diag_ignore_all("-Woverride-init", "Allow field initialization overrides for fb ops");
 
@@ -147,6 +166,7 @@ static const struct fb_ops intelfb_ops = {
 	.fb_pan_display = intel_fbdev_pan_display,
 	__FB_DEFAULT_DEFERRED_OPS_DRAW(intel_fbdev),
 	.fb_mmap = intel_fbdev_mmap,
+	.fb_destroy = intel_fbdev_fb_destroy,
 };
 
 __diag_pop();
@@ -158,7 +178,6 @@ static int intelfb_create(struct drm_fb_helper *helper,
 	struct intel_framebuffer *intel_fb = ifbdev->fb;
 	struct drm_device *dev = helper->dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
-	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
 	const struct i915_gtt_view view = {
 		.type = I915_GTT_VIEW_NORMAL,
 	};
@@ -250,7 +269,7 @@ static int intelfb_create(struct drm_fb_helper *helper,
 	ifbdev->vma_flags = flags;
 
 	intel_runtime_pm_put(&dev_priv->runtime_pm, wakeref);
-	vga_switcheroo_client_fb_set(pdev, info);
+
 	return 0;
 
 out_unpin:
@@ -276,26 +295,6 @@ static const struct drm_fb_helper_funcs intel_fb_helper_funcs = {
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
@@ -459,16 +458,6 @@ static void intel_fbdev_suspend_worker(struct work_struct *work)
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
@@ -559,8 +548,6 @@ static int intel_fbdev_output_poll_changed(struct drm_device *dev)
 	if (!ifbdev)
 		return -EINVAL;
 
-	intel_fbdev_sync(ifbdev);
-
 	mutex_lock(&ifbdev->hpd_lock);
 	send_hpd = !ifbdev->hpd_suspended;
 	ifbdev->hpd_waiting = true;
@@ -580,7 +567,6 @@ static int intel_fbdev_restore_mode(struct drm_i915_private *dev_priv)
 	if (!ifbdev)
 		return -EINVAL;
 
-	intel_fbdev_sync(ifbdev);
 	if (!ifbdev->vma)
 		return -ENOMEM;
 
@@ -598,7 +584,20 @@ static int intel_fbdev_restore_mode(struct drm_i915_private *dev_priv)
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
@@ -616,7 +615,31 @@ static int intel_fbdev_client_restore(struct drm_client_dev *client)
 
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
@@ -626,22 +649,23 @@ static const struct drm_client_funcs intel_fbdev_client_funcs = {
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
@@ -649,68 +673,19 @@ int intel_fbdev_init(struct drm_device *dev)
 
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
 
diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index cdbc3f04c80a7..ca5cbe1d8a03b 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -214,9 +214,7 @@ void xe_display_fini(struct xe_device *xe)
 	if (!xe->info.enable_display)
 		return;
 
-	/* poll work can call into fbdev, hence clean that up afterwards */
 	intel_hpd_poll_fini(xe);
-	intel_fbdev_fini(xe);
 
 	intel_hdcp_component_fini(xe);
 	intel_audio_deinit(xe);
-- 
2.44.0

