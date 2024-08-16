Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61824954A8C
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 14:58:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78E8010E7BC;
	Fri, 16 Aug 2024 12:54:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB46D10E6C2;
 Fri, 16 Aug 2024 12:54:41 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 758911FB44;
 Fri, 16 Aug 2024 12:54:40 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0FFDE13A2F;
 Fri, 16 Aug 2024 12:54:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 0P+bAhBMv2bdbgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 16 Aug 2024 12:54:40 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 83/86] drm/{i915,xe}: Run DRM default client setup
Date: Fri, 16 Aug 2024 14:23:49 +0200
Message-ID: <20240816125408.310253-84-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240816125408.310253-1-tzimmermann@suse.de>
References: <20240816125408.310253-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 758911FB44
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
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
for struct drm_driver that sets the callback according to the kernel
configuration.

Call drm_client_setup_with_color_mode() to run the kernel's default
client setup for DRM. Set fbdev_probe in struct drm_driver, so that
the client setup can start the common fbdev client.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbdev.c | 216 ++++++---------------
 drivers/gpu/drm/i915/display/intel_fbdev.h |   8 +
 drivers/gpu/drm/i915/i915_driver.c         |   2 +
 drivers/gpu/drm/xe/xe_device.c             |   3 +
 4 files changed, 68 insertions(+), 161 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index abe77ef0bd84..50b8657e55d7 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -37,6 +37,7 @@
 #include <linux/tty.h>
 #include <linux/vga_switcheroo.h>
 
+#include <drm/drm_client_setup.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_fb_helper.h>
@@ -175,8 +176,55 @@ static const struct fb_ops intelfb_ops = {
 
 __diag_pop();
 
-static int intelfb_create(struct drm_fb_helper *helper,
-			  struct drm_fb_helper_surface_size *sizes)
+static int intelfb_dirty(struct drm_fb_helper *helper, struct drm_clip_rect *clip)
+{
+	if (!(clip->x1 < clip->x2 && clip->y1 < clip->y2))
+		return 0;
+
+	if (helper->fb->funcs->dirty)
+		return helper->fb->funcs->dirty(helper->fb, NULL, 0, 0, clip, 1);
+
+	return 0;
+}
+
+static void intelfb_restore(struct drm_fb_helper *fb_helper)
+{
+	struct drm_device *dev = fb_helper->client.dev;
+	struct drm_i915_private *dev_priv = to_i915(dev);
+	struct intel_fbdev *ifbdev = dev_priv->display.fbdev.fbdev;
+
+	intel_fbdev_invalidate(ifbdev);
+}
+
+static int intelfb_hotplug(struct drm_fb_helper *fb_helper)
+{
+	struct drm_device *dev = fb_helper->client.dev;
+	struct drm_i915_private *dev_priv = to_i915(dev);
+	struct intel_fbdev *ifbdev = dev_priv->display.fbdev.fbdev;
+	bool send_hpd;
+
+	if (!ifbdev)
+		return -EINVAL;
+
+	mutex_lock(&ifbdev->hpd_lock);
+	send_hpd = !ifbdev->hpd_suspended;
+	ifbdev->hpd_waiting = true;
+	mutex_unlock(&ifbdev->hpd_lock);
+
+	if (!send_hpd || !(ifbdev->vma || dev->fb_helper->deferred_setup))
+		return -EAGAIN;
+
+	return 0;
+}
+
+static const struct drm_fb_helper_funcs intel_fb_helper_funcs = {
+	.fb_dirty = intelfb_dirty,
+	.fb_restore = intelfb_restore,
+	.fb_hotplug = intelfb_hotplug,
+};
+
+int intel_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
+				   struct drm_fb_helper_surface_size *sizes)
 {
 	struct drm_device *dev = helper->client.dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
@@ -246,6 +294,7 @@ static int intelfb_create(struct drm_fb_helper *helper,
 		goto out_unpin;
 	}
 
+	helper->funcs = &intel_fb_helper_funcs;
 	helper->fb = &fb->base;
 
 	info->fbops = &intelfb_ops;
@@ -285,54 +334,6 @@ static int intelfb_create(struct drm_fb_helper *helper,
 	return ret;
 }
 
-static int intelfb_dirty(struct drm_fb_helper *helper, struct drm_clip_rect *clip)
-{
-	if (!(clip->x1 < clip->x2 && clip->y1 < clip->y2))
-		return 0;
-
-	if (helper->fb->funcs->dirty)
-		return helper->fb->funcs->dirty(helper->fb, NULL, 0, 0, clip, 1);
-
-	return 0;
-}
-
-static void intelfb_restore(struct drm_fb_helper *fb_helper)
-{
-	struct drm_device *dev = fb_helper->client.dev;
-	struct drm_i915_private *dev_priv = to_i915(dev);
-	struct intel_fbdev *ifbdev = dev_priv->display.fbdev.fbdev;
-
-	intel_fbdev_invalidate(ifbdev);
-}
-
-static int intelfb_hotplug(struct drm_fb_helper *fb_helper)
-{
-	struct drm_device *dev = fb_helper->client.dev;
-	struct drm_i915_private *dev_priv = to_i915(dev);
-	struct intel_fbdev *ifbdev = dev_priv->display.fbdev.fbdev;
-	bool send_hpd;
-
-	if (!ifbdev)
-		return -EINVAL;
-
-	mutex_lock(&ifbdev->hpd_lock);
-	send_hpd = !ifbdev->hpd_suspended;
-	ifbdev->hpd_waiting = true;
-	mutex_unlock(&ifbdev->hpd_lock);
-
-	if (!send_hpd || !(ifbdev->vma || dev->fb_helper->deferred_setup))
-		return -EAGAIN;
-
-	return 0;
-}
-
-static const struct drm_fb_helper_funcs intel_fb_helper_funcs = {
-	.fb_probe = intelfb_create,
-	.fb_dirty = intelfb_dirty,
-	.fb_restore = intelfb_restore,
-	.fb_hotplug = intelfb_hotplug,
-};
-
 /*
  * Build an intel_fbdev struct using a BIOS allocated framebuffer, if possible.
  * The core display code will have read out the current plane configuration,
@@ -579,100 +580,10 @@ void intel_fbdev_set_suspend(struct drm_device *dev, int state, bool synchronous
 	intel_fbdev_hpd_set_suspend(dev_priv, state);
 }
 
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
-		return drm_fb_helper_hotplug_event(fb_helper);
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
-static const struct drm_client_funcs intel_fbdev_client_funcs = {
-	.owner		= THIS_MODULE,
-	.unregister	= intel_fbdev_client_unregister,
-	.restore	= intel_fbdev_client_restore,
-	.hotplug	= intel_fbdev_client_hotplug,
-};
-
 void intel_fbdev_setup(struct drm_i915_private *i915)
 {
 	struct drm_device *dev = &i915->drm;
 	struct intel_fbdev *ifbdev;
-	struct drm_fb_helper *fb_helper;
 	int ret;
 
 	if (!HAS_DISPLAY(i915))
@@ -684,30 +595,13 @@ void intel_fbdev_setup(struct drm_i915_private *i915)
 
 	i915->display.fbdev.fbdev = ifbdev;
 	INIT_WORK(&i915->display.fbdev.suspend_work, intel_fbdev_suspend_worker);
-	mutex_init(&ifbdev->hpd_lock);
+	ret = drmm_mutex_init(dev, &ifbdev->hpd_lock);
+	if (ret)
+		return;
 	if (!intel_fbdev_init_bios(dev, ifbdev))
 		ifbdev->preferred_bpp = 32;
 
-	fb_helper = kzalloc(sizeof(*fb_helper), GFP_KERNEL);
-	if (!fb_helper)
-		return;
-	drm_fb_helper_prepare(dev, fb_helper, ifbdev->preferred_bpp, &intel_fb_helper_funcs);
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
-	mutex_destroy(&ifbdev->hpd_lock);
-	kfree(fb_helper);
+	drm_client_setup_with_color_mode(dev, ifbdev->preferred_bpp);
 }
 
 struct intel_framebuffer *intel_fbdev_framebuffer(struct intel_fbdev *fbdev)
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.h b/drivers/gpu/drm/i915/display/intel_fbdev.h
index 08de2d5b3433..b4184a679595 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.h
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.h
@@ -9,15 +9,23 @@
 #include <linux/types.h>
 
 struct drm_device;
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
 void intel_fbdev_set_suspend(struct drm_device *dev, int state, bool synchronous);
 struct intel_framebuffer *intel_fbdev_framebuffer(struct intel_fbdev *fbdev);
 #else
+#define INTEL_FBDEV_DRIVER_OPS \
+	.fbdev_probe = NULL
 static inline void intel_fbdev_setup(struct drm_i915_private *dev_priv)
 {
 }
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index e32766286369..d7c38e8facd2 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -1781,6 +1781,8 @@ static const struct drm_driver i915_drm_driver = {
 	.dumb_create = i915_gem_dumb_create,
 	.dumb_map_offset = i915_gem_dumb_mmap_offset,
 
+	INTEL_FBDEV_DRIVER_OPS,
+
 	.ioctls = i915_ioctls,
 	.num_ioctls = ARRAY_SIZE(i915_ioctls),
 	.fops = &i915_driver_fops,
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 206328387150..7a28396abb25 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -17,6 +17,8 @@
 #include <drm/drm_print.h>
 #include <drm/xe_drm.h>
 
+#include "intel_fbdev.h"
+
 #include "display/xe_display.h"
 #include "instructions/xe_gpu_commands.h"
 #include "regs/xe_gt_regs.h"
@@ -267,6 +269,7 @@ static struct drm_driver driver = {
 
 	.dumb_create = xe_bo_dumb_create,
 	.dumb_map_offset = drm_gem_ttm_dumb_map_offset,
+	INTEL_FBDEV_DRIVER_OPS,
 #ifdef CONFIG_PROC_FS
 	.show_fdinfo = xe_drm_client_fdinfo,
 #endif
-- 
2.46.0

