Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC0C9EF49B
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 18:09:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87C5410EE65;
	Thu, 12 Dec 2024 17:09:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="mOpW0Osv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cjcG9pZL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yfLfvJ5/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="s5+32rGE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF8C10E63E;
 Thu, 12 Dec 2024 17:09:24 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E58F91F383;
 Thu, 12 Dec 2024 17:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1734023363; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NEWVz73AE5VNRbDddG0sZ740zCBSSn0j0ZZhklTddJQ=;
 b=mOpW0OsvtkxkdxdOli3Y1QKVcvAcwcn5UDy4GUpExoGx8Xo0tvDKvWntcczim8lGK8Ug6M
 bCH/Q1R0DEC5z7ujQLbvc12uQzLiagXlo0gF87nGErPS4HDnoCx8A2e3CoUMJ6Yja3T6vS
 1KKa0ZYvXyVyqOStPd3tYWO5hzwLfxQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1734023363;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NEWVz73AE5VNRbDddG0sZ740zCBSSn0j0ZZhklTddJQ=;
 b=cjcG9pZL+v5i7ab+jK0IwW+ttCRwPoh7gKDn94mZ01TKqW67pm6ULIj8XqB0BCalSVkWgl
 w8RxkXT/h7EQmDBQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="yfLfvJ5/";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=s5+32rGE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1734023362; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NEWVz73AE5VNRbDddG0sZ740zCBSSn0j0ZZhklTddJQ=;
 b=yfLfvJ5/pqqwvmZCpZ1hsbrYFYaZA1K7bK7I/SqiEylM/uOJ+H9J7P0rXhxrQJysn8RH/8
 yOrjFcJ1FOJmQ7TdxrhytOLM39CasRGzlCvO3GiNhDdsEUvUv5xed7Xl2Zff3SDd5TXQC0
 NOR8ShPYf0Gsi1uUSiPonIQranBLmnM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1734023362;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NEWVz73AE5VNRbDddG0sZ740zCBSSn0j0ZZhklTddJQ=;
 b=s5+32rGEKmvgulvuL4rik3/IP32/9zc8Va5IDRBnfypVf6mXsbgvpB/aIw9gy8mCwU0Sm7
 RjQiqscEEVlwerBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 825ED13508;
 Thu, 12 Dec 2024 17:09:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id OOGVHsIYW2etIQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 12 Dec 2024 17:09:22 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net,
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, jfalempe@redhat.com, javierm@redhat.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 06/12] drm/i915/display: fbdev: Move custom suspend code to
 new callback
Date: Thu, 12 Dec 2024 18:08:47 +0100
Message-ID: <20241212170913.185939-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241212170913.185939-1-tzimmermann@suse.de>
References: <20241212170913.185939-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E58F91F383
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
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
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

If the fbdev buffer is backed by stolen memory, it has to be cleared
upon resume from hibernation. Move the code into the new callback
fb_set_suspend, so that it can run from DRM's generic fbdev client.
No functional change. Other drivers are not affected.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fb_helper.c            |  9 +++++--
 drivers/gpu/drm/i915/display/intel_fbdev.c | 28 +++++++++++++---------
 include/drm/drm_fb_helper.h                | 14 +++++++++++
 3 files changed, 38 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 05da8c398513..e800b43cfbf1 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -757,7 +757,12 @@ EXPORT_SYMBOL(drm_fb_helper_deferred_io);
  */
 void drm_fb_helper_set_suspend(struct drm_fb_helper *fb_helper, bool suspend)
 {
-	if (fb_helper && fb_helper->info)
+	if (!fb_helper || !fb_helper->info)
+		return;
+
+	if (fb_helper->funcs->fb_set_suspend)
+		fb_helper->funcs->fb_set_suspend(fb_helper, suspend);
+	else
 		fb_set_suspend(fb_helper->info, suspend);
 }
 EXPORT_SYMBOL(drm_fb_helper_set_suspend);
@@ -803,7 +808,7 @@ void drm_fb_helper_set_suspend_unlocked(struct drm_fb_helper *fb_helper,
 		}
 	}
 
-	fb_set_suspend(fb_helper->info, suspend);
+	drm_fb_helper_set_suspend(fb_helper, suspend);
 	console_unlock();
 }
 EXPORT_SYMBOL(drm_fb_helper_set_suspend_unlocked);
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 34133d01fc6f..49338a547d37 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -284,10 +284,27 @@ static void intelfb_restore(struct drm_fb_helper *fb_helper)
 	intel_fbdev_invalidate(ifbdev);
 }
 
+static void intelfb_set_suspend(struct drm_fb_helper *fb_helper, bool suspend)
+{
+	struct fb_info *info = fb_helper->info;
+
+	/*
+	 * When resuming from hibernation, Linux restores the object's
+	 * content from swap if the buffer is backed by shmemfs. If the
+	 * object is stolen however, it will be full of whatever garbage
+	 * was left in there. Clear it to zero in this case.
+	 */
+	if (!suspend && !intel_bo_is_shmem(intel_fb_bo(fb_helper->fb)))
+		memset_io(info->screen_base, 0, info->screen_size);
+
+	fb_set_suspend(info, suspend);
+}
+
 static const struct drm_fb_helper_funcs intel_fb_helper_funcs = {
 	.fb_probe = intelfb_create,
 	.fb_dirty = intelfb_dirty,
 	.fb_restore = intelfb_restore,
+	.fb_set_suspend = intelfb_set_suspend,
 };
 
 /*
@@ -456,7 +473,6 @@ void intel_fbdev_set_suspend(struct drm_device *dev, int state, bool synchronous
 {
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct intel_fbdev *ifbdev = dev_priv->display.fbdev.fbdev;
-	struct fb_info *info;
 
 	if (!ifbdev)
 		return;
@@ -467,8 +483,6 @@ void intel_fbdev_set_suspend(struct drm_device *dev, int state, bool synchronous
 	if (!ifbdev->vma)
 		return;
 
-	info = ifbdev->helper.info;
-
 	if (synchronous) {
 		/* Flush any pending work to turn the console on, and then
 		 * wait to turn it off. It must be synchronous as we are
@@ -498,14 +512,6 @@ void intel_fbdev_set_suspend(struct drm_device *dev, int state, bool synchronous
 		}
 	}
 
-	/* On resume from hibernation: If the object is shmemfs backed, it has
-	 * been restored from swap. If the object is stolen however, it will be
-	 * full of whatever garbage was left in there.
-	 */
-	if (state == FBINFO_STATE_RUNNING &&
-	    !intel_bo_is_shmem(intel_fb_bo(&ifbdev->fb->base)))
-		memset_io(info->screen_base, 0, info->screen_size);
-
 	drm_fb_helper_set_suspend(&ifbdev->helper, state);
 	console_unlock();
 }
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index a7d7a3b945ea..7de1abd2e0ea 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -112,6 +112,20 @@ struct drm_fb_helper_funcs {
 	 * TODO: Fix i915 to not require this callback.
 	 */
 	void (*fb_restore)(struct drm_fb_helper *helper);
+
+	/**
+	 * @fb_suspend
+	 *
+	 * Driver callback to suspend or resume, if set, fbdev emulation will
+	 * invoke this callback during suspend and resume. Driver should call
+	 * fb_set_suspend() from their implementation. If not set, fbdev
+	 * emulation will invoke fb_set_suspend() directly.
+	 *
+	 * Only for i915. Do not use in new code.
+	 *
+	 * TODO: Fix i915 to not require this callback.
+	 */
+	void (*fb_set_suspend)(struct drm_fb_helper *helper, bool suspend);
 };
 
 /**
-- 
2.47.1

