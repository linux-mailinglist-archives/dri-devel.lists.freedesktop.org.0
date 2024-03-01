Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F199B86E296
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 14:45:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D2710EE58;
	Fri,  1 Mar 2024 13:44:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="QwRYYM1t";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="76GXTTp0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QwRYYM1t";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="76GXTTp0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E87010EE3A;
 Fri,  1 Mar 2024 13:44:55 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7280633A4E;
 Fri,  1 Mar 2024 13:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709300693; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bXEy0brnyAf1Xo1DbFk2RO0Xx8cQvm5gSEuJ8zc2g7A=;
 b=QwRYYM1t8Sg5GQ416rq7xxzQ2LWOpqC4EN9K2B5DoI7GGK/h2acYVw30ToWJdem5C5MjVg
 fuEul5i7e6g+fA/warvLX9RmzC0V0kx3xKOx0Qe8RK2YLhLgp1H2EE4rEbunF+VbTJ35Ia
 lb710rOgRXqMNk0quKGnok2WIb7AoYA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709300693;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bXEy0brnyAf1Xo1DbFk2RO0Xx8cQvm5gSEuJ8zc2g7A=;
 b=76GXTTp08vJyoE6SkG5hsh2hRE/B+e0OC7c+5XYJOxJhu0/29/4YfupP6LFpmmeYneX2/V
 l91BqTBreCFOTGCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709300693; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bXEy0brnyAf1Xo1DbFk2RO0Xx8cQvm5gSEuJ8zc2g7A=;
 b=QwRYYM1t8Sg5GQ416rq7xxzQ2LWOpqC4EN9K2B5DoI7GGK/h2acYVw30ToWJdem5C5MjVg
 fuEul5i7e6g+fA/warvLX9RmzC0V0kx3xKOx0Qe8RK2YLhLgp1H2EE4rEbunF+VbTJ35Ia
 lb710rOgRXqMNk0quKGnok2WIb7AoYA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709300693;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bXEy0brnyAf1Xo1DbFk2RO0Xx8cQvm5gSEuJ8zc2g7A=;
 b=76GXTTp08vJyoE6SkG5hsh2hRE/B+e0OC7c+5XYJOxJhu0/29/4YfupP6LFpmmeYneX2/V
 l91BqTBreCFOTGCw==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id E334A13A87;
 Fri,  1 Mar 2024 13:44:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id uIoJNtTb4WU2WAAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Fri, 01 Mar 2024 13:44:52 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com,
 ville.syrjala@linux.intel.com, imre.deak@intel.com,
 tejas.upadhyay@intel.com, jouni.hogander@intel.com, javierm@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch, lucas.demarchi@intel.com,
 ogabbay@kernel.org, thomas.hellstrom@linux.intel.com
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v7 3/6] drm/i915: Move fbdev functions
Date: Fri,  1 Mar 2024 14:42:56 +0100
Message-ID: <20240301134448.31289-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240301134448.31289-1-tzimmermann@suse.de>
References: <20240301134448.31289-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -0.30
X-Spamd-Result: default: False [-0.30 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_RATELIMIT(0.00)[to_ip_from(RL9pqk354j4esf7wsagg6iyf8a)];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_TWELVE(0.00)[18];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,intel.com:email];
 FREEMAIL_TO(0.00)[linux.intel.com,intel.com,redhat.com,gmail.com,ffwll.ch,kernel.org];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
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

Move functions within intel_fbdev.c to simplify later updates. Minor
style fixes to make checkpatch happy, but no functional changes.

v5:
	* style fixes (checkpatch)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbdev.c | 154 ++++++++++-----------
 1 file changed, 77 insertions(+), 77 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 99894a855ef05..76c0e89bf25e8 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -453,58 +453,6 @@ static void intel_fbdev_suspend_worker(struct work_struct *work)
 				true);
 }
 
-int intel_fbdev_init(struct drm_device *dev)
-{
-	struct drm_i915_private *dev_priv = to_i915(dev);
-	struct intel_fbdev *ifbdev;
-	int ret;
-
-	if (drm_WARN_ON(dev, !HAS_DISPLAY(dev_priv)))
-		return -ENODEV;
-
-	ifbdev = kzalloc(sizeof(struct intel_fbdev), GFP_KERNEL);
-	if (ifbdev == NULL)
-		return -ENOMEM;
-
-	mutex_init(&ifbdev->hpd_lock);
-	drm_fb_helper_prepare(dev, &ifbdev->helper, 32, &intel_fb_helper_funcs);
-
-	if (intel_fbdev_init_bios(dev, ifbdev))
-		ifbdev->helper.preferred_bpp = ifbdev->preferred_bpp;
-	else
-		ifbdev->preferred_bpp = ifbdev->helper.preferred_bpp;
-
-	ret = drm_fb_helper_init(dev, &ifbdev->helper);
-	if (ret) {
-		kfree(ifbdev);
-		return ret;
-	}
-
-	dev_priv->display.fbdev.fbdev = ifbdev;
-	INIT_WORK(&dev_priv->display.fbdev.suspend_work, intel_fbdev_suspend_worker);
-
-	return 0;
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
 static void intel_fbdev_sync(struct intel_fbdev *ifbdev)
 {
 	if (!ifbdev->cookie)
@@ -515,31 +463,6 @@ static void intel_fbdev_sync(struct intel_fbdev *ifbdev)
 	ifbdev->cookie = 0;
 }
 
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
-}
-
 /* Suspends/resumes fbdev processing of incoming HPD events. When resuming HPD
  * processing, fbdev will perform a full connector reprobe if a hotplug event
  * was received while HPD was suspended.
@@ -656,6 +579,83 @@ void intel_fbdev_restore_mode(struct drm_i915_private *dev_priv)
 		intel_fbdev_invalidate(ifbdev);
 }
 
+int intel_fbdev_init(struct drm_device *dev)
+{
+	struct drm_i915_private *dev_priv = to_i915(dev);
+	struct intel_fbdev *ifbdev;
+	int ret;
+
+	if (drm_WARN_ON(dev, !HAS_DISPLAY(dev_priv)))
+		return -ENODEV;
+
+	ifbdev = kzalloc(sizeof(*ifbdev), GFP_KERNEL);
+	if (!ifbdev)
+		return -ENOMEM;
+
+	mutex_init(&ifbdev->hpd_lock);
+	drm_fb_helper_prepare(dev, &ifbdev->helper, 32, &intel_fb_helper_funcs);
+
+	if (intel_fbdev_init_bios(dev, ifbdev))
+		ifbdev->helper.preferred_bpp = ifbdev->preferred_bpp;
+	else
+		ifbdev->preferred_bpp = ifbdev->helper.preferred_bpp;
+
+	ret = drm_fb_helper_init(dev, &ifbdev->helper);
+	if (ret) {
+		kfree(ifbdev);
+		return ret;
+	}
+
+	dev_priv->display.fbdev.fbdev = ifbdev;
+	INIT_WORK(&dev_priv->display.fbdev.suspend_work, intel_fbdev_suspend_worker);
+
+	return 0;
+}
+
+static void intel_fbdev_initial_config(void *data, async_cookie_t cookie)
+{
+	struct intel_fbdev *ifbdev = data;
+
+	/* Due to peculiar init order wrt to hpd handling this is separate. */
+	if (drm_fb_helper_initial_config(&ifbdev->helper))
+		intel_fbdev_unregister(to_i915(ifbdev->helper.dev));
+}
+
+void intel_fbdev_initial_config_async(struct drm_i915_private *dev_priv)
+{
+	struct intel_fbdev *ifbdev = dev_priv->display.fbdev.fbdev;
+
+	if (!ifbdev)
+		return;
+
+	ifbdev->cookie = async_schedule(intel_fbdev_initial_config, ifbdev);
+}
+
+void intel_fbdev_unregister(struct drm_i915_private *dev_priv)
+{
+	struct intel_fbdev *ifbdev = dev_priv->display.fbdev.fbdev;
+
+	if (!ifbdev)
+		return;
+
+	intel_fbdev_set_suspend(&dev_priv->drm, FBINFO_STATE_SUSPENDED, true);
+
+	if (!current_is_async())
+		intel_fbdev_sync(ifbdev);
+
+	drm_fb_helper_unregister_info(&ifbdev->helper);
+}
+
+void intel_fbdev_fini(struct drm_i915_private *dev_priv)
+{
+	struct intel_fbdev *ifbdev = fetch_and_zero(&dev_priv->display.fbdev.fbdev);
+
+	if (!ifbdev)
+		return;
+
+	intel_fbdev_destroy(ifbdev);
+}
+
 struct intel_framebuffer *intel_fbdev_framebuffer(struct intel_fbdev *fbdev)
 {
 	if (!fbdev || !fbdev->helper.fb)
-- 
2.43.2

