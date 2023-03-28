Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CACC6CBD3B
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 13:14:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F68310E877;
	Tue, 28 Mar 2023 11:14:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3F5110E86A;
 Tue, 28 Mar 2023 11:14:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6CB0A1FD8E;
 Tue, 28 Mar 2023 11:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680002065; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3PpHCauz4nY03CEMehZy7jOoQNnKb5Eb792pnso5Rqo=;
 b=fyWokJusnpFGvx6MA3wghcCRmzFXF3IdMO7PDyz2cLoX4Jxu2XKGloiKUvGW7FtxVqF2kk
 EK05UDA4vrWwBg2mG+VGOpwVuiBgClwMSMh00qxs6Ozt5hHNTTDTLufoC/ho0BeIgiyDIj
 YpoutvQhhDNatQpmIIsY0mFJ9IASHog=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680002065;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3PpHCauz4nY03CEMehZy7jOoQNnKb5Eb792pnso5Rqo=;
 b=RVSo3709cs4zJ7InuVxzJSOYhpNXco3RfsqMFmA734P+1orrNp+/Sd6HLSjTjIdJDFpYla
 yS0gXFHR5tsZcNBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 29E9B1390B;
 Tue, 28 Mar 2023 11:14:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uEbVCBHMImThCAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 28 Mar 2023 11:14:25 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com, airlied@gmail.com,
 daniel@ffwll.ch, ville.syrjala@linux.intel.com, imre.deak@intel.com,
 tejas.upadhyay@intel.com, javierm@redhat.com
Subject: [PATCH 3/4] drm/i915: Implement fbdev client callbacks
Date: Tue, 28 Mar 2023 13:14:21 +0200
Message-Id: <20230328111422.23986-4-tzimmermann@suse.de>
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

Move code from ad-hoc fbdev callbacks into DRM client functions
and remove the old callbacks. The functions instruct the client
to poll for changed output or restore the display.

The DRM core calls both, the old callbacks and the new client
helpers, from the same places. The new functions perform the same
operation as before, so there's no change in functionality.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/i915/display/intel_display.c |  1 -
 drivers/gpu/drm/i915/display/intel_fbdev.c   | 11 ++++++++--
 drivers/gpu/drm/i915/display/intel_fbdev.h   |  9 --------
 drivers/gpu/drm/i915/i915_driver.c           | 22 --------------------
 4 files changed, 9 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index b53a1d969344..430a1016e013 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -8189,7 +8189,6 @@ intel_mode_valid_max_plane_size(struct drm_i915_private *dev_priv,
 static const struct drm_mode_config_funcs intel_mode_funcs = {
 	.fb_create = intel_user_framebuffer_create,
 	.get_format_info = intel_fb_get_format_info,
-	.output_poll_changed = intel_fbdev_output_poll_changed,
 	.mode_valid = intel_mode_valid,
 	.atomic_check = intel_atomic_check,
 	.atomic_commit = intel_atomic_commit,
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 290da5e94bc5..bdb9e6f43602 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -623,7 +623,7 @@ void intel_fbdev_set_suspend(struct drm_device *dev, int state, bool synchronous
 	intel_fbdev_hpd_set_suspend(dev_priv, state);
 }
 
-void intel_fbdev_output_poll_changed(struct drm_device *dev)
+static void intel_fbdev_output_poll_changed(struct drm_device *dev)
 {
 	struct intel_fbdev *ifbdev = to_i915(dev)->display.fbdev.fbdev;
 	bool send_hpd;
@@ -642,7 +642,7 @@ void intel_fbdev_output_poll_changed(struct drm_device *dev)
 		drm_fb_helper_hotplug_event(&ifbdev->helper);
 }
 
-void intel_fbdev_restore_mode(struct drm_i915_private *dev_priv)
+static void intel_fbdev_restore_mode(struct drm_i915_private *dev_priv)
 {
 	struct intel_fbdev *ifbdev = dev_priv->display.fbdev.fbdev;
 
@@ -666,11 +666,18 @@ static void intel_fbdev_client_unregister(struct drm_client_dev *client)
 
 static int intel_fbdev_client_restore(struct drm_client_dev *client)
 {
+	struct drm_i915_private *dev_priv = to_i915(client->dev);
+
+	intel_fbdev_restore_mode(dev_priv);
+	vga_switcheroo_process_delayed_switch();
+
 	return 0;
 }
 
 static int intel_fbdev_client_hotplug(struct drm_client_dev *client)
 {
+	intel_fbdev_output_poll_changed(client->dev);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.h b/drivers/gpu/drm/i915/display/intel_fbdev.h
index 04fd523a5023..8c953f102ba2 100644
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
index 8dde3512d2d1..be804fd4f79f 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -926,27 +926,6 @@ static int i915_driver_open(struct drm_device *dev, struct drm_file *file)
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
@@ -1804,7 +1783,6 @@ static const struct drm_driver i915_drm_driver = {
 	    DRIVER_SYNCOBJ_TIMELINE,
 	.release = i915_driver_release,
 	.open = i915_driver_open,
-	.lastclose = i915_driver_lastclose,
 	.postclose = i915_driver_postclose,
 
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
-- 
2.40.0

