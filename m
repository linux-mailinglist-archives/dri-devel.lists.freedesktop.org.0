Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B79B959E1F
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 15:08:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D469410EACB;
	Wed, 21 Aug 2024 13:04:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ZVZaapWV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Cuu9IEf/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZVZaapWV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Cuu9IEf/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C43B10EA23;
 Wed, 21 Aug 2024 13:04:24 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0595320085;
 Wed, 21 Aug 2024 13:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724245463; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AUFVDi2JG/7SiOTKFf5v/ioXdl90UqENQAq2wRzxRAQ=;
 b=ZVZaapWVyqptiER0ukvejzz2rK21dIy6jfY9ui9yRogqI01VX0NEVAMKSKPsga4lVPjHdj
 2hNfTcBOTLBXG+FQ6Sq9GpjhoXNRD5BQ0ZZXZEJcx1iFBgv9/QZCmIgzGpaFs66qyEEIsw
 3uAX5OQ9fQFh2uYykr4jYQs1/wt7l+Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724245463;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AUFVDi2JG/7SiOTKFf5v/ioXdl90UqENQAq2wRzxRAQ=;
 b=Cuu9IEf/EbHC82ChP+Bw5LwB1dSi95EGYtSvv4sqNFe5pdC1ZnszVVBzPljIMTmvwgDqBi
 7KCTaR3ksOwSowBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724245463; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AUFVDi2JG/7SiOTKFf5v/ioXdl90UqENQAq2wRzxRAQ=;
 b=ZVZaapWVyqptiER0ukvejzz2rK21dIy6jfY9ui9yRogqI01VX0NEVAMKSKPsga4lVPjHdj
 2hNfTcBOTLBXG+FQ6Sq9GpjhoXNRD5BQ0ZZXZEJcx1iFBgv9/QZCmIgzGpaFs66qyEEIsw
 3uAX5OQ9fQFh2uYykr4jYQs1/wt7l+Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724245463;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AUFVDi2JG/7SiOTKFf5v/ioXdl90UqENQAq2wRzxRAQ=;
 b=Cuu9IEf/EbHC82ChP+Bw5LwB1dSi95EGYtSvv4sqNFe5pdC1ZnszVVBzPljIMTmvwgDqBi
 7KCTaR3ksOwSowBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9784113B18;
 Wed, 21 Aug 2024 13:04:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id UMi5I9blxWbXGQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 21 Aug 2024 13:04:22 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v2 80/86] drm/i915: Remove struct drm_fb_helper from struct
 intel_fbdev
Date: Wed, 21 Aug 2024 15:00:17 +0200
Message-ID: <20240821130348.73038-81-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240821130348.73038-1-tzimmermann@suse.de>
References: <20240821130348.73038-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TO_DN_SOME(0.00)[]; ARC_NA(0.00)[];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,redhat.com];
 RCPT_COUNT_TWELVE(0.00)[16]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 R_RATELIMIT(0.00)[to(RLazpx1r3qpnsfr8nfakn),to_ip_from(RLw9gjjhh8cousxs3wi4trssza)];
 RCVD_TLS_ALL(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo, suse.de:email,
 suse.de:mid]
X-Spam-Score: -3.30
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

There is at most one instance of each per DRM device, so both can be
referenced directly from the i915 and DRM device structures. A later
patchset might rework the common fbdev client to allow for storing
both, drm_fb_helper and intel_fbdev, together in the same place.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbdev.c | 86 ++++++++++++----------
 1 file changed, 47 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 49a1ac4f5491..9ece62783ce1 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -42,6 +42,7 @@
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_managed.h>
 
 #include "gem/i915_gem_mman.h"
 #include "gem/i915_gem_object.h"
@@ -55,7 +56,6 @@
 #include "intel_frontbuffer.h"
 
 struct intel_fbdev {
-	struct drm_fb_helper helper;
 	struct intel_framebuffer *fb;
 	struct i915_vma *vma;
 	unsigned long vma_flags;
@@ -70,11 +70,6 @@ struct intel_fbdev {
 	struct mutex hpd_lock;
 };
 
-static struct intel_fbdev *to_intel_fbdev(struct drm_fb_helper *fb_helper)
-{
-	return container_of(fb_helper, struct intel_fbdev, helper);
-}
-
 static struct intel_frontbuffer *to_frontbuffer(struct intel_fbdev *ifbdev)
 {
 	return ifbdev->fb->frontbuffer;
@@ -91,7 +86,9 @@ FB_GEN_DEFAULT_DEFERRED_IOMEM_OPS(intel_fbdev,
 
 static int intel_fbdev_set_par(struct fb_info *info)
 {
-	struct intel_fbdev *ifbdev = to_intel_fbdev(info->par);
+	struct drm_fb_helper *fb_helper = info->par;
+	struct drm_i915_private *i915 = to_i915(fb_helper->client.dev);
+	struct intel_fbdev *ifbdev = i915->display.fbdev.fbdev;
 	int ret;
 
 	ret = drm_fb_helper_set_par(info);
@@ -103,7 +100,9 @@ static int intel_fbdev_set_par(struct fb_info *info)
 
 static int intel_fbdev_blank(int blank, struct fb_info *info)
 {
-	struct intel_fbdev *ifbdev = to_intel_fbdev(info->par);
+	struct drm_fb_helper *fb_helper = info->par;
+	struct drm_i915_private *i915 = to_i915(fb_helper->client.dev);
+	struct intel_fbdev *ifbdev = i915->display.fbdev.fbdev;
 	int ret;
 
 	ret = drm_fb_helper_blank(blank, info);
@@ -116,7 +115,9 @@ static int intel_fbdev_blank(int blank, struct fb_info *info)
 static int intel_fbdev_pan_display(struct fb_var_screeninfo *var,
 				   struct fb_info *info)
 {
-	struct intel_fbdev *ifbdev = to_intel_fbdev(info->par);
+	struct drm_fb_helper *fb_helper = info->par;
+	struct drm_i915_private *i915 = to_i915(fb_helper->client.dev);
+	struct intel_fbdev *ifbdev = i915->display.fbdev.fbdev;
 	int ret;
 
 	ret = drm_fb_helper_pan_display(var, info);
@@ -128,8 +129,8 @@ static int intel_fbdev_pan_display(struct fb_var_screeninfo *var,
 
 static int intel_fbdev_mmap(struct fb_info *info, struct vm_area_struct *vma)
 {
-	struct intel_fbdev *fbdev = to_intel_fbdev(info->par);
-	struct drm_gem_object *bo = drm_gem_fb_get_obj(&fbdev->fb->base, 0);
+	struct drm_fb_helper *fb_helper = info->par;
+	struct drm_gem_object *bo = drm_gem_fb_get_obj(fb_helper->fb, 0);
 	struct drm_i915_gem_object *obj = to_intel_bo(bo);
 
 	return i915_gem_fb_mmap(obj, vma);
@@ -138,9 +139,11 @@ static int intel_fbdev_mmap(struct fb_info *info, struct vm_area_struct *vma)
 static void intel_fbdev_fb_destroy(struct fb_info *info)
 {
 	struct drm_fb_helper *fb_helper = info->par;
-	struct intel_fbdev *ifbdev = container_of(fb_helper, struct intel_fbdev, helper);
+	struct drm_device *dev = fb_helper->client.dev;
+	struct drm_i915_private *i915 = to_i915(dev);
+	struct intel_fbdev *ifbdev = i915->display.fbdev.fbdev;
 
-	drm_fb_helper_fini(&ifbdev->helper);
+	drm_fb_helper_fini(fb_helper);
 
 	/*
 	 * We rely on the object-free to release the VMA pinning for
@@ -148,11 +151,11 @@ static void intel_fbdev_fb_destroy(struct fb_info *info)
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
@@ -175,10 +178,10 @@ __diag_pop();
 static int intelfb_create(struct drm_fb_helper *helper,
 			  struct drm_fb_helper_surface_size *sizes)
 {
-	struct intel_fbdev *ifbdev = to_intel_fbdev(helper);
-	struct intel_framebuffer *fb = ifbdev->fb;
-	struct drm_device *dev = helper->dev;
+	struct drm_device *dev = helper->client.dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
+	struct intel_fbdev *ifbdev = dev_priv->display.fbdev.fbdev;
+	struct intel_framebuffer *fb = ifbdev->fb;
 	const struct i915_gtt_view view = {
 		.type = I915_GTT_VIEW_NORMAL,
 	};
@@ -243,7 +246,7 @@ static int intelfb_create(struct drm_fb_helper *helper,
 		goto out_unpin;
 	}
 
-	ifbdev->helper.fb = &fb->base;
+	helper->fb = &fb->base;
 
 	info->fbops = &intelfb_ops;
 
@@ -253,7 +256,7 @@ static int intelfb_create(struct drm_fb_helper *helper,
 	if (ret)
 		goto out_unpin;
 
-	drm_fb_helper_fill_info(info, &ifbdev->helper, sizes);
+	drm_fb_helper_fill_info(info, dev->fb_helper, sizes);
 
 	/* If the object is shmemfs backed, it will have given us zeroed pages.
 	 * If the object is stolen however, it will be full of whatever
@@ -468,6 +471,7 @@ static void intel_fbdev_suspend_worker(struct work_struct *work)
 static void intel_fbdev_hpd_set_suspend(struct drm_i915_private *i915, int state)
 {
 	struct intel_fbdev *ifbdev = i915->display.fbdev.fbdev;
+	struct drm_device *dev = &i915->drm;
 	bool send_hpd = false;
 
 	mutex_lock(&ifbdev->hpd_lock);
@@ -478,7 +482,7 @@ static void intel_fbdev_hpd_set_suspend(struct drm_i915_private *i915, int state
 
 	if (send_hpd) {
 		drm_dbg_kms(&i915->drm, "Handling delayed fbcon HPD event\n");
-		drm_fb_helper_hotplug_event(&ifbdev->helper);
+		drm_fb_helper_hotplug_event(dev->fb_helper);
 	}
 }
 
@@ -497,7 +501,7 @@ void intel_fbdev_set_suspend(struct drm_device *dev, int state, bool synchronous
 	if (!ifbdev->vma)
 		goto set_suspend;
 
-	info = ifbdev->helper.info;
+	info = dev->fb_helper->info;
 
 	if (synchronous) {
 		/* Flush any pending work to turn the console on, and then
@@ -536,7 +540,7 @@ void intel_fbdev_set_suspend(struct drm_device *dev, int state, bool synchronous
 	    !i915_gem_object_is_shmem(intel_fb_obj(&ifbdev->fb->base)))
 		memset_io(info->screen_base, 0, info->screen_size);
 
-	drm_fb_helper_set_suspend(&ifbdev->helper, state);
+	drm_fb_helper_set_suspend(dev->fb_helper, state);
 	console_unlock();
 
 set_suspend:
@@ -556,8 +560,8 @@ static int intel_fbdev_output_poll_changed(struct drm_device *dev)
 	ifbdev->hpd_waiting = true;
 	mutex_unlock(&ifbdev->hpd_lock);
 
-	if (send_hpd && (ifbdev->vma || ifbdev->helper.deferred_setup))
-		drm_fb_helper_hotplug_event(&ifbdev->helper);
+	if (send_hpd && (ifbdev->vma || dev->fb_helper->deferred_setup))
+		drm_fb_helper_hotplug_event(dev->fb_helper);
 
 	return 0;
 }
@@ -565,6 +569,7 @@ static int intel_fbdev_output_poll_changed(struct drm_device *dev)
 static int intel_fbdev_restore_mode(struct drm_i915_private *dev_priv)
 {
 	struct intel_fbdev *ifbdev = dev_priv->display.fbdev.fbdev;
+	struct drm_device *dev = &dev_priv->drm;
 	int ret;
 
 	if (!ifbdev)
@@ -573,7 +578,7 @@ static int intel_fbdev_restore_mode(struct drm_i915_private *dev_priv)
 	if (!ifbdev->vma)
 		return -ENOMEM;
 
-	ret = drm_fb_helper_restore_fbdev_mode_unlocked(&ifbdev->helper);
+	ret = drm_fb_helper_restore_fbdev_mode_unlocked(dev->fb_helper);
 	if (ret)
 		return ret;
 
@@ -656,45 +661,48 @@ void intel_fbdev_setup(struct drm_i915_private *i915)
 {
 	struct drm_device *dev = &i915->drm;
 	struct intel_fbdev *ifbdev;
+	struct drm_fb_helper *fb_helper;
 	int ret;
 
 	if (!HAS_DISPLAY(i915))
 		return;
 
-	ifbdev = kzalloc(sizeof(*ifbdev), GFP_KERNEL);
+	ifbdev = drmm_kzalloc(dev, sizeof(*ifbdev), GFP_KERNEL);
 	if (!ifbdev)
 		return;
-	drm_fb_helper_prepare(dev, &ifbdev->helper, 32, &intel_fb_helper_funcs);
 
 	i915->display.fbdev.fbdev = ifbdev;
 	INIT_WORK(&i915->display.fbdev.suspend_work, intel_fbdev_suspend_worker);
 	mutex_init(&ifbdev->hpd_lock);
-	if (intel_fbdev_init_bios(dev, ifbdev))
-		ifbdev->helper.preferred_bpp = ifbdev->preferred_bpp;
-	else
-		ifbdev->preferred_bpp = ifbdev->helper.preferred_bpp;
+	if (!intel_fbdev_init_bios(dev, ifbdev))
+		ifbdev->preferred_bpp = 32;
+
+	fb_helper = kzalloc(sizeof(*fb_helper), GFP_KERNEL);
+	if (!fb_helper)
+		return;
+	drm_fb_helper_prepare(dev, fb_helper, ifbdev->preferred_bpp, &intel_fb_helper_funcs);
 
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
+	drm_fb_helper_unprepare(dev->fb_helper);
 	mutex_destroy(&ifbdev->hpd_lock);
-	kfree(ifbdev);
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
2.46.0

