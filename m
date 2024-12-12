Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BC59EF499
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 18:09:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A04410EE60;
	Thu, 12 Dec 2024 17:09:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="xMq9icQ0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ShMS1mlC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xMq9icQ0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ShMS1mlC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E484310EE46
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 17:09:25 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A03A71F46E;
 Thu, 12 Dec 2024 17:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1734023364; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=abZACuWG57c8520eJPgk/YvjwvtpOcjfieW35yPTPBw=;
 b=xMq9icQ0/OIUEo8M1qzHUzxG5txAvbySopjOEUinbKrbgg0JvI+rLDDhOqVtfoa1Tk6Zjt
 Lp5wEEW50zE4dMPt0oNB+4H7/KJjlIaqf1aIcrdTiAZSOVGgi4FrcWZDJKmmeCBhJMEDgX
 HT0OxoOKcs+mgy3CzP3mmRo32924bqU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1734023364;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=abZACuWG57c8520eJPgk/YvjwvtpOcjfieW35yPTPBw=;
 b=ShMS1mlCGkCc2rmrQfqDY95ihGlH6hAgCjWKMD3z0QhMK4ZLj0aDnTGm+kipzirV0qI5g/
 w8r8dAYvHZIkFRAg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xMq9icQ0;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ShMS1mlC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1734023364; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=abZACuWG57c8520eJPgk/YvjwvtpOcjfieW35yPTPBw=;
 b=xMq9icQ0/OIUEo8M1qzHUzxG5txAvbySopjOEUinbKrbgg0JvI+rLDDhOqVtfoa1Tk6Zjt
 Lp5wEEW50zE4dMPt0oNB+4H7/KJjlIaqf1aIcrdTiAZSOVGgi4FrcWZDJKmmeCBhJMEDgX
 HT0OxoOKcs+mgy3CzP3mmRo32924bqU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1734023364;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=abZACuWG57c8520eJPgk/YvjwvtpOcjfieW35yPTPBw=;
 b=ShMS1mlCGkCc2rmrQfqDY95ihGlH6hAgCjWKMD3z0QhMK4ZLj0aDnTGm+kipzirV0qI5g/
 w8r8dAYvHZIkFRAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3E05213508;
 Thu, 12 Dec 2024 17:09:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 4LGrDcQYW2etIQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 12 Dec 2024 17:09:24 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net,
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, jfalempe@redhat.com, javierm@redhat.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 10/12] drm/{i915,xe}: Run DRM default client setup
Date: Thu, 12 Dec 2024 18:08:51 +0100
Message-ID: <20241212170913.185939-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241212170913.185939-1-tzimmermann@suse.de>
References: <20241212170913.185939-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A03A71F46E
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; MIME_TRACE(0.00)[0:+];
 RCPT_COUNT_TWELVE(0.00)[16]; RCVD_TLS_ALL(0.00)[];
 TO_DN_SOME(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[linux.intel.com,intel.com,ursulin.net,ffwll.ch,gmail.com,kernel.org,redhat.com];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 
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

Rework fbdev probing to support fbdev_probe in struct drm_driver
and remove the old fb_probe callback. Provide an initializer macro
that sets the callback in struct drm_driver according to the kernel
configuration. Call drm_client_setup_with_color_mode() to run the
kernel's default client setup for DRM.

This commit also prepares support for the kernel's drm_log client
(or any future client) in i915. Using drm_log will also require vmap
support in GEM objects.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 .../gpu/drm/i915/display/intel_display_core.h |   1 -
 drivers/gpu/drm/i915/display/intel_fbdev.c    | 194 +-----------------
 drivers/gpu/drm/i915/display/intel_fbdev.h    |  17 +-
 drivers/gpu/drm/i915/i915_driver.c            |   3 +
 drivers/gpu/drm/xe/display/xe_display.c       |   5 +
 5 files changed, 21 insertions(+), 199 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_core.h b/drivers/gpu/drm/i915/display/intel_display_core.h
index 554870d2494b..674913d6c11d 100644
--- a/drivers/gpu/drm/i915/display/intel_display_core.h
+++ b/drivers/gpu/drm/i915/display/intel_display_core.h
@@ -386,7 +386,6 @@ struct intel_display {
 	struct {
 		/* list of fbdev register on this device */
 		struct intel_fbdev *fbdev;
-		struct work_struct suspend_work;
 	} fbdev;
 
 	struct {
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index f5dc96a9f86d..de726a9c33c5 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -37,6 +37,7 @@
 #include <linux/tty.h>
 #include <linux/vga_switcheroo.h>
 
+#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_fb_helper.h>
@@ -54,9 +55,6 @@
 #include "intel_fbdev_fb.h"
 #include "intel_frontbuffer.h"
 
-static int intelfb_create(struct drm_fb_helper *helper,
-			  struct drm_fb_helper_surface_size *sizes);
-
 struct intel_fbdev {
 	struct intel_framebuffer *fb;
 	struct i915_vma *vma;
@@ -201,14 +199,13 @@ static void intelfb_set_suspend(struct drm_fb_helper *fb_helper, bool suspend)
 }
 
 static const struct drm_fb_helper_funcs intel_fb_helper_funcs = {
-	.fb_probe = intelfb_create,
 	.fb_dirty = intelfb_dirty,
 	.fb_restore = intelfb_restore,
 	.fb_set_suspend = intelfb_set_suspend,
 };
 
-static int intelfb_create(struct drm_fb_helper *helper,
-			  struct drm_fb_helper_surface_size *sizes)
+int intel_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
+				   struct drm_fb_helper_surface_size *sizes)
 {
 	struct intel_fbdev *ifbdev = to_intel_fbdev(helper);
 	struct intel_framebuffer *fb = ifbdev->fb;
@@ -272,6 +269,7 @@ static int intelfb_create(struct drm_fb_helper *helper,
 		goto out_unpin;
 	}
 
+	helper->funcs = &intel_fb_helper_funcs;
 	helper->fb = &fb->base;
 
 	info->fbops = &intelfb_ops;
@@ -480,174 +478,11 @@ static unsigned int intel_fbdev_color_mode(const struct drm_format_info *info)
 	}
 }
 
-static void intel_fbdev_suspend_worker(struct work_struct *work)
-{
-	intel_fbdev_set_suspend(&container_of(work,
-					      struct drm_i915_private,
-					      display.fbdev.suspend_work)->drm,
-				FBINFO_STATE_RUNNING,
-				true);
-}
-
-void intel_fbdev_set_suspend(struct drm_device *dev, int state, bool synchronous)
-{
-	struct drm_i915_private *dev_priv = to_i915(dev);
-	struct intel_fbdev *ifbdev = dev_priv->display.fbdev.fbdev;
-
-	if (!ifbdev)
-		return;
-
-	if (drm_WARN_ON(&dev_priv->drm, !HAS_DISPLAY(dev_priv)))
-		return;
-
-	if (!ifbdev->vma)
-		return;
-
-	if (synchronous) {
-		/* Flush any pending work to turn the console on, and then
-		 * wait to turn it off. It must be synchronous as we are
-		 * about to suspend or unload the driver.
-		 *
-		 * Note that from within the work-handler, we cannot flush
-		 * ourselves, so only flush outstanding work upon suspend!
-		 */
-		if (state != FBINFO_STATE_RUNNING)
-			flush_work(&dev_priv->display.fbdev.suspend_work);
-
-		console_lock();
-	} else {
-		/*
-		 * The console lock can be pretty contented on resume due
-		 * to all the printk activity.  Try to keep it out of the hot
-		 * path of resume if possible.
-		 */
-		drm_WARN_ON(dev, state != FBINFO_STATE_RUNNING);
-		if (!console_trylock()) {
-			/* Don't block our own workqueue as this can
-			 * be run in parallel with other i915.ko tasks.
-			 */
-			queue_work(dev_priv->unordered_wq,
-				   &dev_priv->display.fbdev.suspend_work);
-			return;
-		}
-	}
-
-	drm_fb_helper_set_suspend(dev->fb_helper, state);
-	console_unlock();
-}
-
-static int intel_fbdev_restore_mode(struct drm_i915_private *dev_priv)
-{
-	struct intel_fbdev *ifbdev = dev_priv->display.fbdev.fbdev;
-	struct drm_device *dev = &dev_priv->drm;
-	int ret;
-
-	if (!ifbdev)
-		return -EINVAL;
-
-	if (!ifbdev->vma)
-		return -ENOMEM;
-
-	ret = drm_fb_helper_restore_fbdev_mode_unlocked(dev->fb_helper);
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-/*
- * Fbdev client and struct drm_client_funcs
- */
-
-static void intel_fbdev_client_unregister(struct drm_client_dev *client)
-{
-	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
-	struct drm_device *dev = fb_helper->dev;
-	struct pci_dev *pdev = to_pci_dev(dev->dev);
-
-	if (fb_helper->info) {
-		vga_switcheroo_client_fb_set(pdev, NULL);
-		drm_fb_helper_unregister_info(fb_helper);
-	} else {
-		drm_fb_helper_unprepare(fb_helper);
-		drm_client_release(&fb_helper->client);
-		kfree(fb_helper);
-	}
-}
-
-static int intel_fbdev_client_restore(struct drm_client_dev *client)
-{
-	struct drm_i915_private *dev_priv = to_i915(client->dev);
-	int ret;
-
-	ret = intel_fbdev_restore_mode(dev_priv);
-	if (ret)
-		return ret;
-
-	vga_switcheroo_process_delayed_switch();
-
-	return 0;
-}
-
-static int intel_fbdev_client_hotplug(struct drm_client_dev *client)
-{
-	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
-	struct drm_device *dev = client->dev;
-	struct pci_dev *pdev = to_pci_dev(dev->dev);
-	int ret;
-
-	if (dev->fb_helper)
-		return drm_fb_helper_hotplug_event(dev->fb_helper);
-
-	ret = drm_fb_helper_init(dev, fb_helper);
-	if (ret)
-		goto err_drm_err;
-
-	ret = drm_fb_helper_initial_config(fb_helper);
-	if (ret)
-		goto err_drm_fb_helper_fini;
-
-	vga_switcheroo_client_fb_set(pdev, fb_helper->info);
-
-	return 0;
-
-err_drm_fb_helper_fini:
-	drm_fb_helper_fini(fb_helper);
-err_drm_err:
-	drm_err(dev, "Failed to setup i915 fbdev emulation (ret=%d)\n", ret);
-	return ret;
-}
-
-static int intel_fbdev_client_suspend(struct drm_client_dev *client, bool holds_console_lock)
-{
-	intel_fbdev_set_suspend(client->dev, FBINFO_STATE_SUSPENDED, true);
-
-	return 0;
-}
-
-static int intel_fbdev_client_resume(struct drm_client_dev *client, bool holds_console_lock)
-{
-	intel_fbdev_set_suspend(client->dev, FBINFO_STATE_RUNNING, false);
-
-	return 0;
-}
-
-static const struct drm_client_funcs intel_fbdev_client_funcs = {
-	.owner		= THIS_MODULE,
-	.unregister	= intel_fbdev_client_unregister,
-	.restore	= intel_fbdev_client_restore,
-	.hotplug	= intel_fbdev_client_hotplug,
-	.suspend	= intel_fbdev_client_suspend,
-	.resume		= intel_fbdev_client_resume,
-};
-
 void intel_fbdev_setup(struct drm_i915_private *i915)
 {
 	struct drm_device *dev = &i915->drm;
 	struct intel_fbdev *ifbdev;
-	struct drm_fb_helper *fb_helper;
 	unsigned int preferred_bpp = 0;
-	int ret;
 
 	if (!HAS_DISPLAY(i915))
 		return;
@@ -657,31 +492,12 @@ void intel_fbdev_setup(struct drm_i915_private *i915)
 		return;
 
 	i915->display.fbdev.fbdev = ifbdev;
-	INIT_WORK(&i915->display.fbdev.suspend_work, intel_fbdev_suspend_worker);
 	if (intel_fbdev_init_bios(dev, ifbdev))
 		preferred_bpp = intel_fbdev_color_mode(ifbdev->fb->base.format);
 	if (!preferred_bpp)
 		preferred_bpp = 32;
 
-	fb_helper = kzalloc(sizeof(*fb_helper), GFP_KERNEL);
-	if (!fb_helper)
-		return;
-	drm_fb_helper_prepare(dev, fb_helper, preferred_bpp, &intel_fb_helper_funcs);
-
-	ret = drm_client_init(dev, &fb_helper->client, "intel-fbdev",
-			      &intel_fbdev_client_funcs);
-	if (ret) {
-		drm_err(dev, "Failed to register client: %d\n", ret);
-		goto err_drm_fb_helper_unprepare;
-	}
-
-	drm_client_register(&fb_helper->client);
-
-	return;
-
-err_drm_fb_helper_unprepare:
-	drm_fb_helper_unprepare(dev->fb_helper);
-	kfree(fb_helper);
+	drm_client_setup_with_color_mode(dev, preferred_bpp);
 }
 
 struct intel_framebuffer *intel_fbdev_framebuffer(struct intel_fbdev *fbdev)
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.h b/drivers/gpu/drm/i915/display/intel_fbdev.h
index 08de2d5b3433..b2ca1fe3c9ae 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.h
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.h
@@ -6,26 +6,25 @@
 #ifndef __INTEL_FBDEV_H__
 #define __INTEL_FBDEV_H__
 
-#include <linux/types.h>
-
-struct drm_device;
+struct drm_fb_helper;
+struct drm_fb_helper_surface_size;
 struct drm_i915_private;
 struct intel_fbdev;
 struct intel_framebuffer;
 
 #ifdef CONFIG_DRM_FBDEV_EMULATION
+int intel_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
+				   struct drm_fb_helper_surface_size *sizes);
+#define INTEL_FBDEV_DRIVER_OPS \
+	.fbdev_probe = intel_fbdev_driver_fbdev_probe
 void intel_fbdev_setup(struct drm_i915_private *dev_priv);
-void intel_fbdev_set_suspend(struct drm_device *dev, int state, bool synchronous);
 struct intel_framebuffer *intel_fbdev_framebuffer(struct intel_fbdev *fbdev);
 #else
+#define INTEL_FBDEV_DRIVER_OPS \
+	.fbdev_probe = NULL
 static inline void intel_fbdev_setup(struct drm_i915_private *dev_priv)
 {
 }
-
-static inline void intel_fbdev_set_suspend(struct drm_device *dev, int state, bool synchronous)
-{
-}
-
 static inline struct intel_framebuffer *intel_fbdev_framebuffer(struct intel_fbdev *fbdev)
 {
 	return NULL;
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index e385e4947a91..1029bf8509b7 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -57,6 +57,7 @@
 #include "display/intel_dp.h"
 #include "display/intel_dpt.h"
 #include "display/intel_encoder.h"
+#include "display/intel_fbdev.h"
 #include "display/intel_hotplug.h"
 #include "display/intel_overlay.h"
 #include "display/intel_pch_refclk.h"
@@ -1798,6 +1799,8 @@ static const struct drm_driver i915_drm_driver = {
 	.dumb_create = i915_gem_dumb_create,
 	.dumb_map_offset = i915_gem_dumb_mmap_offset,
 
+	INTEL_FBDEV_DRIVER_OPS,
+
 	.ioctls = i915_ioctls,
 	.num_ioctls = ARRAY_SIZE(i915_ioctls),
 	.fops = &i915_driver_fops,
diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index bc73c9999c57..03554cf4894a 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -27,6 +27,7 @@
 #include "intel_dmc_wl.h"
 #include "intel_dp.h"
 #include "intel_encoder.h"
+#include "intel_fbdev.h"
 #include "intel_hdcp.h"
 #include "intel_hotplug.h"
 #include "intel_opregion.h"
@@ -67,6 +68,10 @@ void xe_display_driver_set_hooks(struct drm_driver *driver)
 	if (!xe_modparam.probe_display)
 		return;
 
+#ifdef CONFIG_DRM_FBDEV_EMULATION
+	driver->fbdev_probe = intel_fbdev_driver_fbdev_probe;
+#endif
+
 	driver->driver_features |= DRIVER_MODESET | DRIVER_ATOMIC;
 }
 
-- 
2.47.1

