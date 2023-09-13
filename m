Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F81779EC05
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 17:04:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A893D10E4AB;
	Wed, 13 Sep 2023 15:04:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA64D10E0D9;
 Wed, 13 Sep 2023 15:04:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 536411F45B;
 Wed, 13 Sep 2023 15:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1694617469; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RVfZo3ejijgP+CuSi0fJq+5lAyIZTj2etDeZnvxOFPw=;
 b=xo5kO6pPPPP+9VAjlIHVq+BtzAWR1yrbfzlKtFh5fuUxUiRoiqai0qctIIfEKOlnfmagzY
 rCbyNSWlqLmBIWXyCSePku7Y6uO9JfSiogi0spYs3Rbne2ZI62zBJj7AhFI6/d4TTFuMHx
 860bBMy3vArCvFJVx2k3+wV6uoc+I/8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1694617469;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RVfZo3ejijgP+CuSi0fJq+5lAyIZTj2etDeZnvxOFPw=;
 b=4kTChOrhpSiyDgC8RKGJsl9poDzSbUSfBkfWgqgt42hdjmQwzWRZi5HXzVPudpkIw8r6tX
 Xu6ZMEge7u93bWAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 06D5813440;
 Wed, 13 Sep 2023 15:04:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0DS0AH3PAWXEdAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 13 Sep 2023 15:04:29 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com,
 ville.syrjala@linux.intel.com, imre.deak@intel.com,
 tejas.upadhyay@intel.com, javierm@redhat.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v2 2/4] drm/i915: Initialize fbdev DRM client with callback
 functions
Date: Wed, 13 Sep 2023 16:58:42 +0200
Message-ID: <20230913150425.5742-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230913150425.5742-1-tzimmermann@suse.de>
References: <20230913150425.5742-1-tzimmermann@suse.de>
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

Initialize i915's fbdev client by giving an instance of struct
drm_client_funcs to drm_client_init(). Also clean up with
drm_client_release().

Doing this in i915 prevents fbdev helpers from initializing and
releasing the client internally (see drm_fb_helper_init()). No
functional change yet; the client callbacks will be filled later.

v2:
	* call drm_fb_helper_unprepare() in error hndling (Jani)
	* fix typo in commit message (Sam)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/i915/display/intel_fbdev.c | 43 ++++++++++++++++++++--
 1 file changed, 39 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 8d51550e18fd5..d8a165582fd59 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -378,6 +378,7 @@ static void intel_fbdev_destroy(struct intel_fbdev *ifbdev)
 	if (ifbdev->fb)
 		drm_framebuffer_remove(&ifbdev->fb->base);
 
+	drm_client_release(&ifbdev->helper.client);
 	drm_fb_helper_unprepare(&ifbdev->helper);
 	kfree(ifbdev);
 }
@@ -671,6 +672,30 @@ void intel_fbdev_restore_mode(struct drm_i915_private *dev_priv)
 		intel_fbdev_invalidate(ifbdev);
 }
 
+/*
+ * Fbdev client and struct drm_client_funcs
+ */
+
+static void intel_fbdev_client_unregister(struct drm_client_dev *client)
+{ }
+
+static int intel_fbdev_client_restore(struct drm_client_dev *client)
+{
+	return 0;
+}
+
+static int intel_fbdev_client_hotplug(struct drm_client_dev *client)
+{
+	return 0;
+}
+
+static const struct drm_client_funcs intel_fbdev_client_funcs = {
+	.owner		= THIS_MODULE,
+	.unregister	= intel_fbdev_client_unregister,
+	.restore	= intel_fbdev_client_restore,
+	.hotplug	= intel_fbdev_client_hotplug,
+};
+
 int intel_fbdev_init(struct drm_device *dev)
 {
 	struct drm_i915_private *dev_priv = to_i915(dev);
@@ -692,16 +717,26 @@ int intel_fbdev_init(struct drm_device *dev)
 	else
 		ifbdev->preferred_bpp = ifbdev->helper.preferred_bpp;
 
+	ret = drm_client_init(dev, &ifbdev->helper.client, "i915-fbdev",
+			      &intel_fbdev_client_funcs);
+	if (ret)
+		goto err_drm_fb_helper_unprepare;
+
 	ret = drm_fb_helper_init(dev, &ifbdev->helper);
-	if (ret) {
-		kfree(ifbdev);
-		return ret;
-	}
+	if (ret)
+		goto err_drm_client_release;
 
 	dev_priv->display.fbdev.fbdev = ifbdev;
 	INIT_WORK(&dev_priv->display.fbdev.suspend_work, intel_fbdev_suspend_worker);
 
 	return 0;
+
+err_drm_client_release:
+	drm_client_release(&ifbdev->helper.client);
+err_drm_fb_helper_unprepare:
+	drm_fb_helper_unprepare(&ifbdev->helper);
+	kfree(ifbdev);
+	return ret;
 }
 
 static void intel_fbdev_initial_config(void *data, async_cookie_t cookie)
-- 
2.42.0

