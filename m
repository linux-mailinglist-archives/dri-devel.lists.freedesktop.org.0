Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 448C29EF48A
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 18:09:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F81E10EE4A;
	Thu, 12 Dec 2024 17:09:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="BLjPXkuB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fgGKkIqb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BLjPXkuB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fgGKkIqb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5908010E63E;
 Thu, 12 Dec 2024 17:09:23 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 14EFA21181;
 Thu, 12 Dec 2024 17:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1734023362; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yykF6ncnoT5jQ8TNXZFWVULPxlRBGxz4qhMVSbBbY3I=;
 b=BLjPXkuBdVvwMfdnOJMqHW4QjTen7RYacGduqx7nFqxGP8DSD9fnj13qILq9/84tqdxUqc
 JyPAUdLd309R8dXliEA4OCASCG6Qf6GmifZbCE+K6p+tY8XRHJzKsoVy7bePDxaeK66GRS
 bdkf1uIUpcOr0RMi44wTevIeOFQUcLc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1734023362;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yykF6ncnoT5jQ8TNXZFWVULPxlRBGxz4qhMVSbBbY3I=;
 b=fgGKkIqb/7t+ynKsbU0UjmU9ttMHN/rQ+a13B9MvzCv+Ky72K8J/nhG8kXbFPOrsi/8e2/
 8lxFWS9CC4UJx7AA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1734023362; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yykF6ncnoT5jQ8TNXZFWVULPxlRBGxz4qhMVSbBbY3I=;
 b=BLjPXkuBdVvwMfdnOJMqHW4QjTen7RYacGduqx7nFqxGP8DSD9fnj13qILq9/84tqdxUqc
 JyPAUdLd309R8dXliEA4OCASCG6Qf6GmifZbCE+K6p+tY8XRHJzKsoVy7bePDxaeK66GRS
 bdkf1uIUpcOr0RMi44wTevIeOFQUcLc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1734023362;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yykF6ncnoT5jQ8TNXZFWVULPxlRBGxz4qhMVSbBbY3I=;
 b=fgGKkIqb/7t+ynKsbU0UjmU9ttMHN/rQ+a13B9MvzCv+Ky72K8J/nhG8kXbFPOrsi/8e2/
 8lxFWS9CC4UJx7AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A43A813508;
 Thu, 12 Dec 2024 17:09:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 4KjSJsEYW2etIQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 12 Dec 2024 17:09:21 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net,
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, jfalempe@redhat.com, javierm@redhat.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 04/12] drm/i915/display: Remove fbdev suspend and hotplug
 tracking
Date: Thu, 12 Dec 2024 18:08:45 +0100
Message-ID: <20241212170913.185939-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241212170913.185939-1-tzimmermann@suse.de>
References: <20241212170913.185939-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; RCPT_COUNT_TWELVE(0.00)[16];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
 FREEMAIL_TO(0.00)[linux.intel.com,intel.com,ursulin.net,ffwll.ch,gmail.com,kernel.org,redhat.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -2.80
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

The DRM client code already tracks suspend status and hotplug events
for each client. Remove similar code from i915's fbdev client.

Allows for the removal of all hdp_* fields form struct intel_fbdev.
Calls to intel_fbdev_output_poll_changed() are reduced the shared
helper drm_fb_helper_hotplug_event().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/i915/display/intel_fbdev.c | 63 +---------------------
 1 file changed, 2 insertions(+), 61 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index a51d1dfd1b58..cd111d8dcab0 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -59,14 +59,6 @@ struct intel_fbdev {
 	struct i915_vma *vma;
 	unsigned long vma_flags;
 	int preferred_bpp;
-
-	/* Whether or not fbdev hpd processing is temporarily suspended */
-	bool hpd_suspended: 1;
-	/* Set when a hotplug was received while HPD processing was suspended */
-	bool hpd_waiting: 1;
-
-	/* Protects hpd_suspended */
-	struct mutex hpd_lock;
 };
 
 static struct intel_fbdev *to_intel_fbdev(struct drm_fb_helper *fb_helper)
@@ -188,12 +180,6 @@ static int intelfb_create(struct drm_fb_helper *helper,
 	struct drm_gem_object *obj;
 	int ret;
 
-	mutex_lock(&ifbdev->hpd_lock);
-	ret = ifbdev->hpd_suspended ? -EAGAIN : 0;
-	mutex_unlock(&ifbdev->hpd_lock);
-	if (ret)
-		return ret;
-
 	ifbdev->fb = NULL;
 
 	if (fb &&
@@ -458,27 +444,6 @@ static void intel_fbdev_suspend_worker(struct work_struct *work)
 				true);
 }
 
-/* Suspends/resumes fbdev processing of incoming HPD events. When resuming HPD
- * processing, fbdev will perform a full connector reprobe if a hotplug event
- * was received while HPD was suspended.
- */
-static void intel_fbdev_hpd_set_suspend(struct drm_i915_private *i915, int state)
-{
-	struct intel_fbdev *ifbdev = i915->display.fbdev.fbdev;
-	bool send_hpd = false;
-
-	mutex_lock(&ifbdev->hpd_lock);
-	ifbdev->hpd_suspended = state == FBINFO_STATE_SUSPENDED;
-	send_hpd = !ifbdev->hpd_suspended && ifbdev->hpd_waiting;
-	ifbdev->hpd_waiting = false;
-	mutex_unlock(&ifbdev->hpd_lock);
-
-	if (send_hpd) {
-		drm_dbg_kms(&i915->drm, "Handling delayed fbcon HPD event\n");
-		drm_fb_helper_hotplug_event(&ifbdev->helper);
-	}
-}
-
 void intel_fbdev_set_suspend(struct drm_device *dev, int state, bool synchronous)
 {
 	struct drm_i915_private *dev_priv = to_i915(dev);
@@ -492,7 +457,7 @@ void intel_fbdev_set_suspend(struct drm_device *dev, int state, bool synchronous
 		return;
 
 	if (!ifbdev->vma)
-		goto set_suspend;
+		return;
 
 	info = ifbdev->helper.info;
 
@@ -535,28 +500,6 @@ void intel_fbdev_set_suspend(struct drm_device *dev, int state, bool synchronous
 
 	drm_fb_helper_set_suspend(&ifbdev->helper, state);
 	console_unlock();
-
-set_suspend:
-	intel_fbdev_hpd_set_suspend(dev_priv, state);
-}
-
-static int intel_fbdev_output_poll_changed(struct drm_device *dev)
-{
-	struct intel_fbdev *ifbdev = to_i915(dev)->display.fbdev.fbdev;
-	bool send_hpd;
-
-	if (!ifbdev)
-		return -EINVAL;
-
-	mutex_lock(&ifbdev->hpd_lock);
-	send_hpd = !ifbdev->hpd_suspended;
-	ifbdev->hpd_waiting = true;
-	mutex_unlock(&ifbdev->hpd_lock);
-
-	if (send_hpd && (ifbdev->vma || ifbdev->helper.deferred_setup))
-		drm_fb_helper_hotplug_event(&ifbdev->helper);
-
-	return 0;
 }
 
 static int intel_fbdev_restore_mode(struct drm_i915_private *dev_priv)
@@ -621,7 +564,7 @@ static int intel_fbdev_client_hotplug(struct drm_client_dev *client)
 	int ret;
 
 	if (dev->fb_helper)
-		return intel_fbdev_output_poll_changed(dev);
+		return drm_fb_helper_hotplug_event(dev->fb_helper);
 
 	ret = drm_fb_helper_init(dev, fb_helper);
 	if (ret)
@@ -681,7 +624,6 @@ void intel_fbdev_setup(struct drm_i915_private *i915)
 
 	i915->display.fbdev.fbdev = ifbdev;
 	INIT_WORK(&i915->display.fbdev.suspend_work, intel_fbdev_suspend_worker);
-	mutex_init(&ifbdev->hpd_lock);
 	if (intel_fbdev_init_bios(dev, ifbdev))
 		ifbdev->helper.preferred_bpp = ifbdev->preferred_bpp;
 	else
@@ -700,7 +642,6 @@ void intel_fbdev_setup(struct drm_i915_private *i915)
 
 err_drm_fb_helper_unprepare:
 	drm_fb_helper_unprepare(&ifbdev->helper);
-	mutex_destroy(&ifbdev->hpd_lock);
 	kfree(ifbdev);
 }
 
-- 
2.47.1

