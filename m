Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C73886E29A
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 14:45:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20A1910EE5B;
	Fri,  1 Mar 2024 13:44:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="TToUHhCl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OPcvTgzc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TToUHhCl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OPcvTgzc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67D9E10EE40;
 Fri,  1 Mar 2024 13:44:55 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 07571204C0;
 Fri,  1 Mar 2024 13:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709300694; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=voIm1aPxeihKq2+sPrO56bwiW2amoEZLtYGE0BO8fM4=;
 b=TToUHhCl3Tr+STLSOHOMVrsj/p8HHc4S9GmlHXDodHCnkxIusi1pYYMmsmqjB/ai4jyH1T
 3D/fgFw4atSOc7SamcMNZieVMrP+OKDVc2UjvEg2GflA3oRq/Wj5kRpTpDYk75b4rswOG2
 uNLJU0bIxkid9KQ59KcbuqLmJ/mvVXU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709300694;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=voIm1aPxeihKq2+sPrO56bwiW2amoEZLtYGE0BO8fM4=;
 b=OPcvTgzc1mxccr1yVQGvSLGTlzLzI1vyxvjECHNEOEUyRMtf1dkQKaRTSM9rsXGUXKaD07
 IukbF/BBzCjpCpDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709300694; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=voIm1aPxeihKq2+sPrO56bwiW2amoEZLtYGE0BO8fM4=;
 b=TToUHhCl3Tr+STLSOHOMVrsj/p8HHc4S9GmlHXDodHCnkxIusi1pYYMmsmqjB/ai4jyH1T
 3D/fgFw4atSOc7SamcMNZieVMrP+OKDVc2UjvEg2GflA3oRq/Wj5kRpTpDYk75b4rswOG2
 uNLJU0bIxkid9KQ59KcbuqLmJ/mvVXU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709300694;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=voIm1aPxeihKq2+sPrO56bwiW2amoEZLtYGE0BO8fM4=;
 b=OPcvTgzc1mxccr1yVQGvSLGTlzLzI1vyxvjECHNEOEUyRMtf1dkQKaRTSM9rsXGUXKaD07
 IukbF/BBzCjpCpDg==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 79A9513581;
 Fri,  1 Mar 2024 13:44:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id IJcxHNXb4WU2WAAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Fri, 01 Mar 2024 13:44:53 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com,
 ville.syrjala@linux.intel.com, imre.deak@intel.com,
 tejas.upadhyay@intel.com, jouni.hogander@intel.com, javierm@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch, lucas.demarchi@intel.com,
 ogabbay@kernel.org, thomas.hellstrom@linux.intel.com
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v7 4/6] drm/i915: Initialize fbdev DRM client with callback
 functions
Date: Fri,  1 Mar 2024 14:42:57 +0100
Message-ID: <20240301134448.31289-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240301134448.31289-1-tzimmermann@suse.de>
References: <20240301134448.31289-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: ***
X-Spam-Score: 3.62
X-Spamd-Result: default: False [3.62 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 BROKEN_CONTENT_TYPE(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_RATELIMIT(0.00)[to_ip_from(RL9pqk354j4esf7wsagg6iyf8a)];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_TWELVE(0.00)[18];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FREEMAIL_TO(0.00)[linux.intel.com,intel.com,redhat.com,gmail.com,ffwll.ch,kernel.org];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-0.08)[63.39%]
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

Initialize i915's fbdev client by giving an instance of struct
drm_client_funcs to drm_client_init(). Also clean up with
drm_client_release().

Doing this in i915 prevents fbdev helpers from initializing and
releasing the client internally (see drm_fb_helper_init()). No
functional change yet; the client callbacks will be filled later.

v6:
	* rename client to "intel-fbdev" (Jouni)
v2:
	* call drm_fb_helper_unprepare() in error handling (Jani)
	* fix typo in commit message (Sam)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/i915/display/intel_fbdev.c | 43 ++++++++++++++++++++--
 1 file changed, 39 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 76c0e89bf25e8..32aeb5faf706b 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -286,6 +286,7 @@ static void intel_fbdev_destroy(struct intel_fbdev *ifbdev)
 	if (ifbdev->fb)
 		drm_framebuffer_remove(&ifbdev->fb->base);
 
+	drm_client_release(&ifbdev->helper.client);
 	drm_fb_helper_unprepare(&ifbdev->helper);
 	kfree(ifbdev);
 }
@@ -579,6 +580,30 @@ void intel_fbdev_restore_mode(struct drm_i915_private *dev_priv)
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
@@ -600,16 +625,26 @@ int intel_fbdev_init(struct drm_device *dev)
 	else
 		ifbdev->preferred_bpp = ifbdev->helper.preferred_bpp;
 
+	ret = drm_client_init(dev, &ifbdev->helper.client, "intel-fbdev",
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
2.43.2

