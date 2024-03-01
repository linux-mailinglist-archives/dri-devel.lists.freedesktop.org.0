Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 645BF86E29F
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 14:45:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E76A010EE71;
	Fri,  1 Mar 2024 13:45:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="zh1SxMK3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IZZ33eBR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zh1SxMK3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IZZ33eBR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3655E10EE4B;
 Fri,  1 Mar 2024 13:44:56 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 905AB204C2;
 Fri,  1 Mar 2024 13:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709300694; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gnBtoEMF31JCmy86fZpuTKohz+NdyJ/NIlAPUprEAUI=;
 b=zh1SxMK3fBoOp9d4Ccro9H7SfgR9IqyXyqgUEOPx4x8shmPTaraHGzWxuUDOCYyL9INwiI
 WS6ZtTeZLTXWuKW4E7/buEhvfJUZAZsYa9wkcRuPt73PVl5yLLJhcyUkqBW9xwjMAPFB//
 +N9PrvhGGekGaPhYnVXYoL9VMbrr8+0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709300694;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gnBtoEMF31JCmy86fZpuTKohz+NdyJ/NIlAPUprEAUI=;
 b=IZZ33eBRa1jt2Jxfs6J928AEgqRfxboNcbGOqtrVbTGRIMkfiiOLjk5P3rAe0Oke8Mlkf7
 alD5foyt/xWWntAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709300694; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gnBtoEMF31JCmy86fZpuTKohz+NdyJ/NIlAPUprEAUI=;
 b=zh1SxMK3fBoOp9d4Ccro9H7SfgR9IqyXyqgUEOPx4x8shmPTaraHGzWxuUDOCYyL9INwiI
 WS6ZtTeZLTXWuKW4E7/buEhvfJUZAZsYa9wkcRuPt73PVl5yLLJhcyUkqBW9xwjMAPFB//
 +N9PrvhGGekGaPhYnVXYoL9VMbrr8+0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709300694;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gnBtoEMF31JCmy86fZpuTKohz+NdyJ/NIlAPUprEAUI=;
 b=IZZ33eBRa1jt2Jxfs6J928AEgqRfxboNcbGOqtrVbTGRIMkfiiOLjk5P3rAe0Oke8Mlkf7
 alD5foyt/xWWntAw==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 105AF13A87;
 Fri,  1 Mar 2024 13:44:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id uPlzAtbb4WU2WAAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Fri, 01 Mar 2024 13:44:54 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com,
 ville.syrjala@linux.intel.com, imre.deak@intel.com,
 tejas.upadhyay@intel.com, jouni.hogander@intel.com, javierm@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch, lucas.demarchi@intel.com,
 ogabbay@kernel.org, thomas.hellstrom@linux.intel.com
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v7 5/6] drm/i915: Implement fbdev client callbacks
Date: Fri,  1 Mar 2024 14:42:58 +0100
Message-ID: <20240301134448.31289-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240301134448.31289-1-tzimmermann@suse.de>
References: <20240301134448.31289-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=zh1SxMK3;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=IZZ33eBR
X-Spamd-Result: default: False [0.19 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 BROKEN_CONTENT_TYPE(1.50)[];
 R_RATELIMIT(0.00)[to_ip_from(RLw1715dab7ink4c1kuyfofm5y)];
 RCVD_COUNT_THREE(0.00)[3]; DKIM_TRACE(0.00)[suse.de:+];
 MX_GOOD(-0.01)[];
 FREEMAIL_TO(0.00)[linux.intel.com,intel.com,redhat.com,gmail.com,ffwll.ch,kernel.org];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 BAYES_HAM(-3.00)[100.00%]; ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_DKIM_ARC_DNSWL_HI(-1.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_TWELVE(0.00)[18]; MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 RCVD_IN_DNSWL_HI(-0.50)[2a07:de40:b281:104:10:150:64:98:from];
 RCVD_TLS_ALL(0.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: 0.19
X-Rspamd-Queue-Id: 905AB204C2
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Bar: /
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

v7:
	* update xe driver
v6:
	* return errors from client callbacks (Jouni)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 .../drm/i915/display/intel_display_driver.c   |  1 -
 drivers/gpu/drm/i915/display/intel_fbdev.c    | 33 ++++++++++++++-----
 drivers/gpu/drm/i915/display/intel_fbdev.h    |  9 -----
 drivers/gpu/drm/i915/i915_driver.c            | 22 -------------
 drivers/gpu/drm/xe/display/xe_display.c       |  9 -----
 5 files changed, 25 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index 87dd07e0d138d..ca92c48fbdc49 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -98,7 +98,6 @@ void intel_display_driver_init_hw(struct drm_i915_private *i915)
 static const struct drm_mode_config_funcs intel_mode_funcs = {
 	.fb_create = intel_user_framebuffer_create,
 	.get_format_info = intel_fb_get_format_info,
-	.output_poll_changed = intel_fbdev_output_poll_changed,
 	.mode_valid = intel_mode_valid,
 	.atomic_check = intel_atomic_check,
 	.atomic_commit = intel_atomic_commit,
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 32aeb5faf706b..938ee709813df 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -546,13 +546,13 @@ void intel_fbdev_set_suspend(struct drm_device *dev, int state, bool synchronous
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
 
@@ -563,21 +563,29 @@ void intel_fbdev_output_poll_changed(struct drm_device *dev)
 
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
@@ -589,12 +597,21 @@ static void intel_fbdev_client_unregister(struct drm_client_dev *client)
 
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
index 97910a85e3917..e0f13c62a1832 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -923,27 +923,6 @@ static int i915_driver_open(struct drm_device *dev, struct drm_file *file)
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
@@ -1834,7 +1813,6 @@ static const struct drm_driver i915_drm_driver = {
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
2.43.2

