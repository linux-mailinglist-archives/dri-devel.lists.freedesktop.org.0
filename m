Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D56019EF4A0
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 18:09:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 406EE10EE69;
	Thu, 12 Dec 2024 17:09:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="cZZZkMht";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="euxMZtZC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cZZZkMht";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="euxMZtZC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C88410E63E;
 Thu, 12 Dec 2024 17:09:25 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C3C331F394;
 Thu, 12 Dec 2024 17:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1734023363; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tqgC0j9ZXlLvwYUnuUAbiMhOJkaFUTAT1CpzWt8T9JU=;
 b=cZZZkMhtpBRq+/m0HN1TmMDulL6QJ/u5iVcnHnLZV38sp3kaD1XSmkfyPHug4r0Mk7nmev
 YcDwzO0B/KrN/twpqjCsT/OAR5MBSarE7MbgR3WR6RQTxucA7UIG6tcFSkdW3GusQSgW0L
 WBz6yt/WpZFdwdr2EK/J4T9c3zjF/g8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1734023363;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tqgC0j9ZXlLvwYUnuUAbiMhOJkaFUTAT1CpzWt8T9JU=;
 b=euxMZtZCnqtHrLEGBRpUZTue5EP4+NTErstXDjjAXSOihs8lbrA91G7g1KgwFb6AwWan6f
 iLfT1dp69buhFmDw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=cZZZkMht;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=euxMZtZC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1734023363; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tqgC0j9ZXlLvwYUnuUAbiMhOJkaFUTAT1CpzWt8T9JU=;
 b=cZZZkMhtpBRq+/m0HN1TmMDulL6QJ/u5iVcnHnLZV38sp3kaD1XSmkfyPHug4r0Mk7nmev
 YcDwzO0B/KrN/twpqjCsT/OAR5MBSarE7MbgR3WR6RQTxucA7UIG6tcFSkdW3GusQSgW0L
 WBz6yt/WpZFdwdr2EK/J4T9c3zjF/g8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1734023363;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tqgC0j9ZXlLvwYUnuUAbiMhOJkaFUTAT1CpzWt8T9JU=;
 b=euxMZtZCnqtHrLEGBRpUZTue5EP4+NTErstXDjjAXSOihs8lbrA91G7g1KgwFb6AwWan6f
 iLfT1dp69buhFmDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5EEA913508;
 Thu, 12 Dec 2024 17:09:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id gLDmFcMYW2etIQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 12 Dec 2024 17:09:23 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net,
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, jfalempe@redhat.com, javierm@redhat.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 08/12] drm/i915/display: Remove struct drm_fb_helper from
 struct intel_fbdev
Date: Thu, 12 Dec 2024 18:08:49 +0100
Message-ID: <20241212170913.185939-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241212170913.185939-1-tzimmermann@suse.de>
References: <20241212170913.185939-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C3C331F394
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; MIME_TRACE(0.00)[0:+];
 RCPT_COUNT_TWELVE(0.00)[16]; RCVD_TLS_ALL(0.00)[];
 TO_DN_SOME(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[linux.intel.com,intel.com,ursulin.net,ffwll.ch,gmail.com,kernel.org,redhat.com];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
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

Store instances of drm_fb_helper and struct intel_fbdev separately.
This will allow i915 to use the common fbdev client, which allocates
its own instance of struct drm_fb_helper.

There is at most one instance of type each per DRM device, so both can
be referenced directly from the i915 and DRM device structures. A later
patchset might rework the common fbdev client to allow for storing
both, drm_fb_helper and intel_fbdev, together in the same place.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/i915/display/intel_fbdev.c | 49 ++++++++++++----------
 1 file changed, 28 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 7e935121c445..0839c07b58c7 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -43,6 +43,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_managed.h>
 
 #include "i915_drv.h"
 #include "intel_bo.h"
@@ -54,7 +55,6 @@
 #include "intel_frontbuffer.h"
 
 struct intel_fbdev {
-	struct drm_fb_helper helper;
 	struct intel_framebuffer *fb;
 	struct i915_vma *vma;
 	unsigned long vma_flags;
@@ -62,7 +62,9 @@ struct intel_fbdev {
 
 static struct intel_fbdev *to_intel_fbdev(struct drm_fb_helper *fb_helper)
 {
-	return container_of(fb_helper, struct intel_fbdev, helper);
+	struct drm_i915_private *i915 = to_i915(fb_helper->client.dev);
+
+	return i915->display.fbdev.fbdev;
 }
 
 static struct intel_frontbuffer *to_frontbuffer(struct intel_fbdev *ifbdev)
@@ -118,8 +120,8 @@ static int intel_fbdev_pan_display(struct fb_var_screeninfo *var,
 
 static int intel_fbdev_mmap(struct fb_info *info, struct vm_area_struct *vma)
 {
-	struct intel_fbdev *fbdev = to_intel_fbdev(info->par);
-	struct drm_gem_object *obj = drm_gem_fb_get_obj(&fbdev->fb->base, 0);
+	struct drm_fb_helper *fb_helper = info->par;
+	struct drm_gem_object *obj = drm_gem_fb_get_obj(fb_helper->fb, 0);
 
 	return intel_bo_fb_mmap(obj, vma);
 }
@@ -127,9 +129,9 @@ static int intel_fbdev_mmap(struct fb_info *info, struct vm_area_struct *vma)
 static void intel_fbdev_fb_destroy(struct fb_info *info)
 {
 	struct drm_fb_helper *fb_helper = info->par;
-	struct intel_fbdev *ifbdev = container_of(fb_helper, struct intel_fbdev, helper);
+	struct intel_fbdev *ifbdev = to_intel_fbdev(fb_helper);
 
-	drm_fb_helper_fini(&ifbdev->helper);
+	drm_fb_helper_fini(fb_helper);
 
 	/*
 	 * We rely on the object-free to release the VMA pinning for
@@ -137,11 +139,11 @@ static void intel_fbdev_fb_destroy(struct fb_info *info)
 	 * trying to rectify all the possible error paths leading here.
 	 */
 	intel_fb_unpin_vma(ifbdev->vma, ifbdev->vma_flags);
-	drm_framebuffer_remove(&ifbdev->fb->base);
+	drm_framebuffer_remove(fb_helper->fb);
 
 	drm_client_release(&fb_helper->client);
-	drm_fb_helper_unprepare(&ifbdev->helper);
-	kfree(ifbdev);
+	drm_fb_helper_unprepare(fb_helper);
+	kfree(fb_helper);
 }
 
 __diag_push();
@@ -226,7 +228,7 @@ static int intelfb_create(struct drm_fb_helper *helper,
 		goto out_unpin;
 	}
 
-	ifbdev->helper.fb = &fb->base;
+	helper->fb = &fb->base;
 
 	info->fbops = &intelfb_ops;
 
@@ -236,7 +238,7 @@ static int intelfb_create(struct drm_fb_helper *helper,
 	if (ret)
 		goto out_unpin;
 
-	drm_fb_helper_fill_info(info, &ifbdev->helper, sizes);
+	drm_fb_helper_fill_info(info, dev->fb_helper, sizes);
 
 	/* If the object is shmemfs backed, it will have given us zeroed pages.
 	 * If the object is stolen however, it will be full of whatever
@@ -527,13 +529,14 @@ void intel_fbdev_set_suspend(struct drm_device *dev, int state, bool synchronous
 		}
 	}
 
-	drm_fb_helper_set_suspend(&ifbdev->helper, state);
+	drm_fb_helper_set_suspend(dev->fb_helper, state);
 	console_unlock();
 }
 
 static int intel_fbdev_restore_mode(struct drm_i915_private *dev_priv)
 {
 	struct intel_fbdev *ifbdev = dev_priv->display.fbdev.fbdev;
+	struct drm_device *dev = &dev_priv->drm;
 	int ret;
 
 	if (!ifbdev)
@@ -542,7 +545,7 @@ static int intel_fbdev_restore_mode(struct drm_i915_private *dev_priv)
 	if (!ifbdev->vma)
 		return -ENOMEM;
 
-	ret = drm_fb_helper_restore_fbdev_mode_unlocked(&ifbdev->helper);
+	ret = drm_fb_helper_restore_fbdev_mode_unlocked(dev->fb_helper);
 	if (ret)
 		return ret;
 
@@ -639,13 +642,14 @@ void intel_fbdev_setup(struct drm_i915_private *i915)
 {
 	struct drm_device *dev = &i915->drm;
 	struct intel_fbdev *ifbdev;
+	struct drm_fb_helper *fb_helper;
 	unsigned int preferred_bpp = 0;
 	int ret;
 
 	if (!HAS_DISPLAY(i915))
 		return;
 
-	ifbdev = kzalloc(sizeof(*ifbdev), GFP_KERNEL);
+	ifbdev = drmm_kzalloc(dev, sizeof(*ifbdev), GFP_KERNEL);
 	if (!ifbdev)
 		return;
 
@@ -656,28 +660,31 @@ void intel_fbdev_setup(struct drm_i915_private *i915)
 	if (!preferred_bpp)
 		preferred_bpp = 32;
 
-	drm_fb_helper_prepare(dev, &ifbdev->helper, preferred_bpp, &intel_fb_helper_funcs);
+	fb_helper = kzalloc(sizeof(*fb_helper), GFP_KERNEL);
+	if (!fb_helper)
+		return;
+	drm_fb_helper_prepare(dev, fb_helper, preferred_bpp, &intel_fb_helper_funcs);
 
-	ret = drm_client_init(dev, &ifbdev->helper.client, "intel-fbdev",
+	ret = drm_client_init(dev, &fb_helper->client, "intel-fbdev",
 			      &intel_fbdev_client_funcs);
 	if (ret) {
 		drm_err(dev, "Failed to register client: %d\n", ret);
 		goto err_drm_fb_helper_unprepare;
 	}
 
-	drm_client_register(&ifbdev->helper.client);
+	drm_client_register(&fb_helper->client);
 
 	return;
 
 err_drm_fb_helper_unprepare:
-	drm_fb_helper_unprepare(&ifbdev->helper);
-	kfree(ifbdev);
+	drm_fb_helper_unprepare(dev->fb_helper);
+	kfree(fb_helper);
 }
 
 struct intel_framebuffer *intel_fbdev_framebuffer(struct intel_fbdev *fbdev)
 {
-	if (!fbdev || !fbdev->helper.fb)
+	if (!fbdev)
 		return NULL;
 
-	return to_intel_framebuffer(fbdev->helper.fb);
+	return fbdev->fb;
 }
-- 
2.47.1

