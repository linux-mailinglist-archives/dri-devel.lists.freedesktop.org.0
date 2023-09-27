Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 595B77B01DC
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 12:28:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF95810E4D8;
	Wed, 27 Sep 2023 10:28:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29D6F10E4C8;
 Wed, 27 Sep 2023 10:28:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D3E501F385;
 Wed, 27 Sep 2023 10:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695810497; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tMxeMgDvWDR0018WJO/0EOcmCAShjZLP01STYD6TzEQ=;
 b=ge5knsDrSIxV578yutsK5nx6w8quPXyz9FI5l1+hGyqGgQGnedd/q6KIt+8Rzf+PMeWJ5U
 HFd2za9z2wIHjZ1FypCKNRVRixc8+aanxb6m9E8St9Re3WAXvxFq6+wFwQr8cVKhbWKTpH
 W63H18UGvwGtuTKjGIe4W/XG9fk0OFs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695810497;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tMxeMgDvWDR0018WJO/0EOcmCAShjZLP01STYD6TzEQ=;
 b=LwlGpD8r4vEAc2rNL8W6MZNCSg1SBWpaitvEm0lw8tGsI9osrouyiWY5TYI5HjEC6JQU0g
 1UIoQHm4dJafcPBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 95D6213479;
 Wed, 27 Sep 2023 10:28:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OMXPI8EDFGXlMgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 27 Sep 2023 10:28:17 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com,
 ville.syrjala@linux.intel.com, imre.deak@intel.com,
 tejas.upadhyay@intel.com, javierm@redhat.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v5 4/7] drm/i915: Move fbdev functions
Date: Wed, 27 Sep 2023 12:26:49 +0200
Message-ID: <20230927102808.18650-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230927102808.18650-1-tzimmermann@suse.de>
References: <20230927102808.18650-1-tzimmermann@suse.de>
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

Move functions within intel_fbdev.c to simplify later updates. Minor
style fixes to make checkpatch happy, but no functional changes.

v5:
	* style fixes (checkpatch)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/i915/display/intel_fbdev.c | 154 ++++++++++-----------
 1 file changed, 77 insertions(+), 77 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 31d0d695d5671..2695c65b55ddc 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -545,58 +545,6 @@ static void intel_fbdev_suspend_worker(struct work_struct *work)
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
@@ -607,31 +555,6 @@ static void intel_fbdev_sync(struct intel_fbdev *ifbdev)
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
@@ -748,6 +671,83 @@ void intel_fbdev_restore_mode(struct drm_i915_private *dev_priv)
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
2.42.0

