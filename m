Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 666286CBD3D
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 13:14:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7511A10E87C;
	Tue, 28 Mar 2023 11:14:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7884310E86F;
 Tue, 28 Mar 2023 11:14:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 20C8B219E8;
 Tue, 28 Mar 2023 11:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680002065; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jj4rAaAp3K8vXXnHTClqooa+Cl2yJH6D4Zokn/f/lvQ=;
 b=tUAHPgdeie++K65T90MUl6nuvvmjmYgHlG+jL+SrDrfamlxqZ0IlO2g27QcshlW32GUc0n
 TZLsUREfuLmt6BlZqRXXN7SYTKDBrlaRiHo3jx5cyhWoEQ1zLiwIx4nLaGmOzB0aufNOf3
 pMZAFQyl4j2w7dyv4TY6DU26RDOS0v4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680002065;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jj4rAaAp3K8vXXnHTClqooa+Cl2yJH6D4Zokn/f/lvQ=;
 b=K+DTZQl/XHwAhl+lDXAl/KSRl2jgE1WnCliXZdXI3/X5wETP77jtPFP0U9NUU3STcslYxZ
 2aAhAZ+iQWY9PKBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D0E241390B;
 Tue, 28 Mar 2023 11:14:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iI74MRDMImThCAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 28 Mar 2023 11:14:24 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com, airlied@gmail.com,
 daniel@ffwll.ch, ville.syrjala@linux.intel.com, imre.deak@intel.com,
 tejas.upadhyay@intel.com, javierm@redhat.com
Subject: [PATCH 2/4] drm/i915: Initialize fbdev DRM client with callback
 functions
Date: Tue, 28 Mar 2023 13:14:20 +0200
Message-Id: <20230328111422.23986-3-tzimmermann@suse.de>
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

Initialize i915's fbdev client by giving an instance of struct
drm_client_funcsi to drm_client_init(). Also clean up with
drm_client_release().

Doing this in i915 prevents fbdev helpers from initializing and
releasing the client internally (see drm_fb_helper_init()). No
functional change yet; the client callbacks will be filled later.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/i915/display/intel_fbdev.c | 43 ++++++++++++++++++++--
 1 file changed, 39 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 88de79279ce5..290da5e94bc5 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -364,6 +364,7 @@ static void intel_fbdev_destroy(struct intel_fbdev *ifbdev)
 	if (ifbdev->fb)
 		drm_framebuffer_remove(&ifbdev->fb->base);
 
+	drm_client_release(&ifbdev->helper.client);
 	drm_fb_helper_unprepare(&ifbdev->helper);
 	kfree(ifbdev);
 }
@@ -656,6 +657,30 @@ void intel_fbdev_restore_mode(struct drm_i915_private *dev_priv)
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
@@ -677,16 +702,26 @@ int intel_fbdev_init(struct drm_device *dev)
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
+	drm_client_release(&ifbdev->helper.client);
+	kfree(ifbdev);
+	return ret;
 }
 
 static void intel_fbdev_initial_config(void *data, async_cookie_t cookie)
-- 
2.40.0

