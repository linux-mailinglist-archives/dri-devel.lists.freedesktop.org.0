Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4F689D3CF
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 10:10:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6039A112B75;
	Tue,  9 Apr 2024 08:10:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B88112B69;
 Tue,  9 Apr 2024 08:10:35 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6245420893;
 Tue,  9 Apr 2024 08:10:34 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id EC9E013AA0;
 Tue,  9 Apr 2024 08:10:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id YMiAOPn3FGbWNAAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Tue, 09 Apr 2024 08:10:33 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, ville.syrjala@linux.intel.com, imre.deak@intel.com,
 tejas.upadhyay@intel.com, jouni.hogander@intel.com, javierm@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch, lucas.demarchi@intel.com,
 ogabbay@kernel.org, thomas.hellstrom@linux.intel.com
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v8 5/6] drm/{i915,xe}: Implement fbdev client callbacks
Date: Tue,  9 Apr 2024 10:04:27 +0200
Message-ID: <20240409081029.17843-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240409081029.17843-1-tzimmermann@suse.de>
References: <20240409081029.17843-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 6245420893
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

Move code from ad-hoc fbdev callbacks into DRM client functions
and remove the old callbacks. The functions instruct the client
to poll for changed output or restore the display.

The DRM core calls both, the old callbacks and the new client
helpers, from the same places. The new functions perform the same
operation as before, so there's no change in functionality.

Fox xe, remove xe_display_last_close(), which restored the fbdev
display. As with i915, the DRM core's drm_lastclose() performs
this operation automatically.

v8:
- mention xe in commit message

v7:
- update xe driver

v6:
- return errors from client callbacks (Jouni)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
---
 .../drm/i915/display/intel_display_driver.c   |  1 -
 drivers/gpu/drm/i915/display/intel_fbdev.c    | 33 ++++++++++++++-----
 drivers/gpu/drm/i915/display/intel_fbdev.h    |  9 -----
 drivers/gpu/drm/i915/i915_driver.c            | 22 -------------
 drivers/gpu/drm/xe/display/xe_display.c       |  9 -----
 5 files changed, 25 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index b7d636980d83a..e5f052d4ff1cc 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -99,7 +99,6 @@ void intel_display_driver_init_hw(struct drm_i915_private *i915)
 static const struct drm_mode_config_funcs intel_mode_funcs = {
 	.fb_create = intel_user_framebuffer_create,
 	.get_format_info = intel_fb_get_format_info,
-	.output_poll_changed = intel_fbdev_output_poll_changed,
 	.mode_valid = intel_mode_valid,
 	.atomic_check = intel_atomic_check,
 	.atomic_commit = intel_atomic_commit,
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 4d0dba6c47d3a..f783de611a7f5 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -551,13 +551,13 @@ void intel_fbdev_set_suspend(struct drm_device *dev, int state, bool synchronous
 	intel_fbdev_hpd_set_suspend(dev_priv, state);
 }
 
-void intel_fbdev_output_poll_changed(struct drm_device *dev)
+static int intel_fbdev_output_poll_changed(struct drm_device *dev)
 {
 	struct intel_fbdev *ifbdev = to_i915(dev)->display.fbdev.fbdev;
 	bool send_hpd;
 
 	if (!ifbdev)
-		return;
+		return -EINVAL;
 
 	intel_fbdev_sync(ifbdev);
 
@@ -568,21 +568,29 @@ void intel_fbdev_output_poll_changed(struct drm_device *dev)
 
 	if (send_hpd && (ifbdev->vma || ifbdev->helper.deferred_setup))
 		drm_fb_helper_hotplug_event(&ifbdev->helper);
+
+	return 0;
 }
 
-void intel_fbdev_restore_mode(struct drm_i915_private *dev_priv)
+static int intel_fbdev_restore_mode(struct drm_i915_private *dev_priv)
 {
 	struct intel_fbdev *ifbdev = dev_priv->display.fbdev.fbdev;
+	int ret;
 
 	if (!ifbdev)
-		return;
+		return -EINVAL;
 
 	intel_fbdev_sync(ifbdev);
 	if (!ifbdev->vma)
-		return;
+		return -ENOMEM;
 
-	if (drm_fb_helper_restore_fbdev_mode_unlocked(&ifbdev->helper) == 0)
-		intel_fbdev_invalidate(ifbdev);
+	ret = drm_fb_helper_restore_fbdev_mode_unlocked(&ifbdev->helper);
+	if (ret)
+		return ret;
+
+	intel_fbdev_invalidate(ifbdev);
+
+	return 0;
 }
 
 /*
@@ -594,12 +602,21 @@ static void intel_fbdev_client_unregister(struct drm_client_dev *client)
 
 static int intel_fbdev_client_restore(struct drm_client_dev *client)
 {
+	struct drm_i915_private *dev_priv = to_i915(client->dev);
+	int ret;
+
+	ret = intel_fbdev_restore_mode(dev_priv);
+	if (ret)
+		return ret;
+
+	vga_switcheroo_process_delayed_switch();
+
 	return 0;
 }
 
 static int intel_fbdev_client_hotplug(struct drm_client_dev *client)
 {
-	return 0;
+	return intel_fbdev_output_poll_changed(client->dev);
 }
 
 static const struct drm_client_funcs intel_fbdev_client_funcs = {
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.h b/drivers/gpu/drm/i915/display/intel_fbdev.h
index 04fd523a50232..8c953f102ba22 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.h
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.h
@@ -19,8 +19,6 @@ void intel_fbdev_initial_config_async(struct drm_i915_private *dev_priv);
 void intel_fbdev_unregister(struct drm_i915_private *dev_priv);
 void intel_fbdev_fini(struct drm_i915_private *dev_priv);
 void intel_fbdev_set_suspend(struct drm_device *dev, int state, bool synchronous);
-void intel_fbdev_output_poll_changed(struct drm_device *dev);
-void intel_fbdev_restore_mode(struct drm_i915_private *dev_priv);
 struct intel_framebuffer *intel_fbdev_framebuffer(struct intel_fbdev *fbdev);
 #else
 static inline int intel_fbdev_init(struct drm_device *dev)
@@ -44,13 +42,6 @@ static inline void intel_fbdev_set_suspend(struct drm_device *dev, int state, bo
 {
 }
 
-static inline void intel_fbdev_output_poll_changed(struct drm_device *dev)
-{
-}
-
-static inline void intel_fbdev_restore_mode(struct drm_i915_private *i915)
-{
-}
 static inline struct intel_framebuffer *intel_fbdev_framebuffer(struct intel_fbdev *fbdev)
 {
 	return NULL;
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 4b9233c07a22c..6551c806e2ae0 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -920,27 +920,6 @@ static int i915_driver_open(struct drm_device *dev, struct drm_file *file)
 	return 0;
 }
 
-/**
- * i915_driver_lastclose - clean up after all DRM clients have exited
- * @dev: DRM device
- *
- * Take care of cleaning up after all DRM clients have exited.  In the
- * mode setting case, we want to restore the kernel's initial mode (just
- * in case the last client left us in a bad state).
- *
- * Additionally, in the non-mode setting case, we'll tear down the GTT
- * and DMA structures, since the kernel won't be using them, and clea
- * up any GEM state.
- */
-static void i915_driver_lastclose(struct drm_device *dev)
-{
-	struct drm_i915_private *i915 = to_i915(dev);
-
-	intel_fbdev_restore_mode(i915);
-
-	vga_switcheroo_process_delayed_switch();
-}
-
 static void i915_driver_postclose(struct drm_device *dev, struct drm_file *file)
 {
 	struct drm_i915_file_private *file_priv = file->driver_priv;
@@ -1831,7 +1810,6 @@ static const struct drm_driver i915_drm_driver = {
 	    DRIVER_SYNCOBJ_TIMELINE,
 	.release = i915_driver_release,
 	.open = i915_driver_open,
-	.lastclose = i915_driver_lastclose,
 	.postclose = i915_driver_postclose,
 	.show_fdinfo = PTR_IF(IS_ENABLED(CONFIG_PROC_FS), i915_drm_client_fdinfo),
 
diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index e4db069f0db3f..cdbc3f04c80a7 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -51,14 +51,6 @@ bool xe_display_driver_probe_defer(struct pci_dev *pdev)
 	return intel_display_driver_probe_defer(pdev);
 }
 
-static void xe_display_last_close(struct drm_device *dev)
-{
-	struct xe_device *xe = to_xe_device(dev);
-
-	if (xe->info.enable_display)
-		intel_fbdev_restore_mode(to_xe_device(dev));
-}
-
 /**
  * xe_display_driver_set_hooks - Add driver flags and hooks for display
  * @driver: DRM device driver
@@ -73,7 +65,6 @@ void xe_display_driver_set_hooks(struct drm_driver *driver)
 		return;
 
 	driver->driver_features |= DRIVER_MODESET | DRIVER_ATOMIC;
-	driver->lastclose = xe_display_last_close;
 }
 
 static void unset_display_features(struct xe_device *xe)
-- 
2.44.0

