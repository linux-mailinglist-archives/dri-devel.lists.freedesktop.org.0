Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD85E7DF355
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 14:11:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F00F10E88A;
	Thu,  2 Nov 2023 13:11:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D086B10E887;
 Thu,  2 Nov 2023 13:11:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7A04C21A60;
 Thu,  2 Nov 2023 13:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1698930660; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zCFcePGTN4VO1hSkVF6PzePCA4jWcgLb/XrFJRCKi7M=;
 b=hqjlae6egewr2VqPB0/8rSQEESDUVFlFnwODxh1ED//SY9hbeFB19yjqasDfR1jciZ9Ftt
 ECXooZBZGPZ8nvuBdB7zDtja47jwBd2+171zMn3jCiUE+mfePlXjh4oicFBjVzawEG0oIT
 V+IO5Yuk2yFyCHuft36oECCuQdZISj0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1698930660;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zCFcePGTN4VO1hSkVF6PzePCA4jWcgLb/XrFJRCKi7M=;
 b=RK5IlOYW5ZGJCL60J3/RVAjbuMAhKJOuEag7XEJ2OrDJPc+uHKY+78NFKV3ifeLNh/3OIh
 SxDFbnQICvSjDbAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 38A5713584;
 Thu,  2 Nov 2023 13:11:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0C3/DOSfQ2VRXwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 02 Nov 2023 13:11:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com,
 ville.syrjala@linux.intel.com, imre.deak@intel.com,
 tejas.upadhyay@intel.com, jouni.hogander@intel.com, javierm@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH v6 6/7] drm/i915: Implement fbdev client callbacks
Date: Thu,  2 Nov 2023 14:08:11 +0100
Message-ID: <20231102131056.7256-7-tzimmermann@suse.de>
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

Move code from ad-hoc fbdev callbacks into DRM client functions
and remove the old callbacks. The functions instruct the client
to poll for changed output or restore the display.

The DRM core calls both, the old callbacks and the new client
helpers, from the same places. The new functions perform the same
operation as before, so there's no change in functionality.

v6:
	* return errors from client callbacks (Jouni)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 .../drm/i915/display/intel_display_driver.c   |  1 -
 drivers/gpu/drm/i915/display/intel_fbdev.c    | 33 ++++++++++++++-----
 drivers/gpu/drm/i915/display/intel_fbdev.h    |  9 -----
 drivers/gpu/drm/i915/i915_driver.c            | 22 -------------
 4 files changed, 25 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index 44b59ac301e69..ffdcddd1943e0 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -96,7 +96,6 @@ void intel_display_driver_init_hw(struct drm_i915_private *i915)
 static const struct drm_mode_config_funcs intel_mode_funcs = {
 	.fb_create = intel_user_framebuffer_create,
 	.get_format_info = intel_fb_get_format_info,
-	.output_poll_changed = intel_fbdev_output_poll_changed,
 	.mode_valid = intel_mode_valid,
 	.atomic_check = intel_atomic_check,
 	.atomic_commit = intel_atomic_commit,
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 88c554ea7bb19..2837791613608 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -638,13 +638,13 @@ void intel_fbdev_set_suspend(struct drm_device *dev, int state, bool synchronous
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
 
@@ -655,21 +655,29 @@ void intel_fbdev_output_poll_changed(struct drm_device *dev)
 
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
@@ -681,12 +689,21 @@ static void intel_fbdev_client_unregister(struct drm_client_dev *client)
 
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
index f7b56dcc96a16..a69e132b62c4a 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -928,27 +928,6 @@ static int i915_driver_open(struct drm_device *dev, struct drm_file *file)
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
@@ -1824,7 +1803,6 @@ static const struct drm_driver i915_drm_driver = {
 	    DRIVER_SYNCOBJ_TIMELINE,
 	.release = i915_driver_release,
 	.open = i915_driver_open,
-	.lastclose = i915_driver_lastclose,
 	.postclose = i915_driver_postclose,
 	.show_fdinfo = PTR_IF(IS_ENABLED(CONFIG_PROC_FS), i915_drm_client_fdinfo),
 
-- 
2.42.0

