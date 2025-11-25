Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8F7C8518F
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 14:06:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6F6D10E3EA;
	Tue, 25 Nov 2025 13:06:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="SO4GhwQa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lHrPBMIh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SO4GhwQa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lHrPBMIh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E793610E3EB
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 13:06:50 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 291A222805;
 Tue, 25 Nov 2025 13:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1764076003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kYYk9pHjgnzOJbsyaUeeXQ7iuT+IrWDkYOQgKfcyCoY=;
 b=SO4GhwQaYT+nw6VUdYmuRsnm0ZM1sBIlRZE/mfY3xfgMbHbqwHmqGUyOzKVQMC0PTbY4XK
 akmQQfGZSLStfvBOEg6mXq8k8LVp1etoUJQCVv26al0Z2HDYe6qgp+Z1epnl80thW/WRzD
 E8/2bVEXy5LvK0pnsNNcIulI81eXmhA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1764076003;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kYYk9pHjgnzOJbsyaUeeXQ7iuT+IrWDkYOQgKfcyCoY=;
 b=lHrPBMIhF7XIHQkpRvn26+YK4oBByrFfckLdR3Jj8N7gQLKGuHVWDtED6ujEGmK8VIyj+C
 cgwig7dJi3uJ1aAA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=SO4GhwQa;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=lHrPBMIh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1764076003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kYYk9pHjgnzOJbsyaUeeXQ7iuT+IrWDkYOQgKfcyCoY=;
 b=SO4GhwQaYT+nw6VUdYmuRsnm0ZM1sBIlRZE/mfY3xfgMbHbqwHmqGUyOzKVQMC0PTbY4XK
 akmQQfGZSLStfvBOEg6mXq8k8LVp1etoUJQCVv26al0Z2HDYe6qgp+Z1epnl80thW/WRzD
 E8/2bVEXy5LvK0pnsNNcIulI81eXmhA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1764076003;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kYYk9pHjgnzOJbsyaUeeXQ7iuT+IrWDkYOQgKfcyCoY=;
 b=lHrPBMIhF7XIHQkpRvn26+YK4oBByrFfckLdR3Jj8N7gQLKGuHVWDtED6ujEGmK8VIyj+C
 cgwig7dJi3uJ1aAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9CC4E3EA63;
 Tue, 25 Nov 2025 13:06:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id YKDVJOKpJWkDFAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 25 Nov 2025 13:06:42 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, airlied@gmail.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, lyude@redhat.com, dakr@kernel.org, deller@gmx.de,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 jason.wessel@windriver.com, danielt@kernel.org, dianders@chromium.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 4/5] drm/fbdev-helper: Remove
 drm_fb_helper_debug_enter/_leave()
Date: Tue, 25 Nov 2025 13:52:16 +0100
Message-ID: <20251125130634.1080966-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251125130634.1080966-1-tzimmermann@suse.de>
References: <20251125130634.1080966-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 291A222805
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_TRACE(0.00)[0:+];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_TWELVE(0.00)[19];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,amd.com,redhat.com,kernel.org,gmx.de,linux.intel.com,windriver.com,chromium.org];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 R_RATELIMIT(0.00)[to_ip_from(RLgosu6qu4h11rje89ht7rjgg5)];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Score: -3.01
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

Remove the debug_enter/debug_leave helpers, as there are no DRM
drivers supporting debugging with kgdb. Remove code to keep track
of existing fbdev-emulation state. None of this required any longer.

Also remove mode_set_base_atomic from struct drm_crtc_helper_funcs,
which has no callers or implementations.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fb_helper.c          | 108 -----------------------
 include/drm/drm_fb_helper.h              |  21 -----
 include/drm/drm_modeset_helper_vtables.h |  23 -----
 3 files changed, 152 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 4a7f72044ab8..29c3c7bb7d67 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -75,9 +75,6 @@ MODULE_PARM_DESC(drm_leak_fbdev_smem,
 		 "Allow unsafe leaking fbdev physical smem address [default=false]");
 #endif
 
-static LIST_HEAD(kernel_fb_helper_list);
-static DEFINE_MUTEX(kernel_fb_helper_lock);
-
 /**
  * DOC: fbdev helpers
  *
@@ -115,101 +112,6 @@ static DEFINE_MUTEX(kernel_fb_helper_lock);
  * mmap page writes.
  */
 
-static void drm_fb_helper_restore_lut_atomic(struct drm_crtc *crtc)
-{
-	uint16_t *r_base, *g_base, *b_base;
-
-	if (crtc->funcs->gamma_set == NULL)
-		return;
-
-	r_base = crtc->gamma_store;
-	g_base = r_base + crtc->gamma_size;
-	b_base = g_base + crtc->gamma_size;
-
-	crtc->funcs->gamma_set(crtc, r_base, g_base, b_base,
-			       crtc->gamma_size, NULL);
-}
-
-/**
- * drm_fb_helper_debug_enter - implementation for &fb_ops.fb_debug_enter
- * @info: fbdev registered by the helper
- */
-int drm_fb_helper_debug_enter(struct fb_info *info)
-{
-	struct drm_fb_helper *helper = info->par;
-	const struct drm_crtc_helper_funcs *funcs;
-	struct drm_mode_set *mode_set;
-
-	list_for_each_entry(helper, &kernel_fb_helper_list, kernel_fb_list) {
-		mutex_lock(&helper->client.modeset_mutex);
-		drm_client_for_each_modeset(mode_set, &helper->client) {
-			if (!mode_set->crtc->enabled)
-				continue;
-
-			funcs =	mode_set->crtc->helper_private;
-			if (funcs->mode_set_base_atomic == NULL)
-				continue;
-
-			if (drm_drv_uses_atomic_modeset(mode_set->crtc->dev))
-				continue;
-
-			funcs->mode_set_base_atomic(mode_set->crtc,
-						    mode_set->fb,
-						    mode_set->x,
-						    mode_set->y,
-						    ENTER_ATOMIC_MODE_SET);
-		}
-		mutex_unlock(&helper->client.modeset_mutex);
-	}
-
-	return 0;
-}
-EXPORT_SYMBOL(drm_fb_helper_debug_enter);
-
-/**
- * drm_fb_helper_debug_leave - implementation for &fb_ops.fb_debug_leave
- * @info: fbdev registered by the helper
- */
-int drm_fb_helper_debug_leave(struct fb_info *info)
-{
-	struct drm_fb_helper *helper = info->par;
-	struct drm_client_dev *client = &helper->client;
-	struct drm_device *dev = helper->dev;
-	struct drm_crtc *crtc;
-	const struct drm_crtc_helper_funcs *funcs;
-	struct drm_mode_set *mode_set;
-	struct drm_framebuffer *fb;
-
-	mutex_lock(&client->modeset_mutex);
-	drm_client_for_each_modeset(mode_set, client) {
-		crtc = mode_set->crtc;
-		if (drm_drv_uses_atomic_modeset(crtc->dev))
-			continue;
-
-		funcs = crtc->helper_private;
-		fb = crtc->primary->fb;
-
-		if (!crtc->enabled)
-			continue;
-
-		if (!fb) {
-			drm_err(dev, "no fb to restore?\n");
-			continue;
-		}
-
-		if (funcs->mode_set_base_atomic == NULL)
-			continue;
-
-		drm_fb_helper_restore_lut_atomic(mode_set->crtc);
-		funcs->mode_set_base_atomic(mode_set->crtc, fb, crtc->x,
-					    crtc->y, LEAVE_ATOMIC_MODE_SET);
-	}
-	mutex_unlock(&client->modeset_mutex);
-
-	return 0;
-}
-EXPORT_SYMBOL(drm_fb_helper_debug_leave);
-
 static int
 __drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_helper,
 					    bool force)
@@ -397,7 +299,6 @@ void drm_fb_helper_prepare(struct drm_device *dev, struct drm_fb_helper *helper,
 	if (!preferred_bpp)
 		preferred_bpp = 32;
 
-	INIT_LIST_HEAD(&helper->kernel_fb_list);
 	spin_lock_init(&helper->damage_lock);
 	INIT_WORK(&helper->resume_work, drm_fb_helper_resume_worker);
 	INIT_WORK(&helper->damage_work, drm_fb_helper_damage_work);
@@ -534,11 +435,6 @@ void drm_fb_helper_fini(struct drm_fb_helper *fb_helper)
 
 	drm_fb_helper_release_info(fb_helper);
 
-	mutex_lock(&kernel_fb_helper_lock);
-	if (!list_empty(&fb_helper->kernel_fb_list))
-		list_del(&fb_helper->kernel_fb_list);
-	mutex_unlock(&kernel_fb_helper_lock);
-
 	if (!fb_helper->client.funcs)
 		drm_client_release(&fb_helper->client);
 }
@@ -1766,10 +1662,6 @@ __drm_fb_helper_initial_config_and_unlock(struct drm_fb_helper *fb_helper)
 	drm_info(dev, "fb%d: %s frame buffer device\n",
 		 info->node, info->fix.id);
 
-	mutex_lock(&kernel_fb_helper_lock);
-	list_add(&fb_helper->kernel_fb_list, &kernel_fb_helper_list);
-	mutex_unlock(&kernel_fb_helper_lock);
-
 	return 0;
 
 err_drm_fb_helper_release_info:
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index dd9a18f8de5a..05cca77b7249 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -166,13 +166,6 @@ struct drm_fb_helper {
 	 */
 	struct mutex lock;
 
-	/**
-	 * @kernel_fb_list:
-	 *
-	 * Entry on the global kernel_fb_helper_list, used for kgdb entry/exit.
-	 */
-	struct list_head kernel_fb_list;
-
 	/**
 	 * @delayed_hotplug:
 	 *
@@ -236,8 +229,6 @@ drm_fb_helper_from_client(struct drm_client_dev *client)
 	.fb_setcmap	= drm_fb_helper_setcmap, \
 	.fb_blank	= drm_fb_helper_blank, \
 	.fb_pan_display	= drm_fb_helper_pan_display, \
-	.fb_debug_enter = drm_fb_helper_debug_enter, \
-	.fb_debug_leave = drm_fb_helper_debug_leave, \
 	.fb_ioctl	= drm_fb_helper_ioctl
 
 #ifdef CONFIG_DRM_FBDEV_EMULATION
@@ -280,8 +271,6 @@ int drm_fb_helper_ioctl(struct fb_info *info, unsigned int cmd,
 
 int drm_fb_helper_hotplug_event(struct drm_fb_helper *fb_helper);
 int drm_fb_helper_initial_config(struct drm_fb_helper *fb_helper);
-int drm_fb_helper_debug_enter(struct fb_info *info);
-int drm_fb_helper_debug_leave(struct fb_info *info);
 #else
 static inline void drm_fb_helper_prepare(struct drm_device *dev,
 					 struct drm_fb_helper *helper,
@@ -387,16 +376,6 @@ static inline int drm_fb_helper_initial_config(struct drm_fb_helper *fb_helper)
 {
 	return 0;
 }
-
-static inline int drm_fb_helper_debug_enter(struct fb_info *info)
-{
-	return 0;
-}
-
-static inline int drm_fb_helper_debug_leave(struct fb_info *info)
-{
-	return 0;
-}
 #endif
 
 #endif
diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
index fe32854b7ffe..3e68213958dd 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -52,11 +52,6 @@ struct drm_scanout_buffer;
 struct drm_writeback_connector;
 struct drm_writeback_job;
 
-enum mode_set_atomic {
-	LEAVE_ATOMIC_MODE_SET,
-	ENTER_ATOMIC_MODE_SET,
-};
-
 /**
  * struct drm_crtc_helper_funcs - helper operations for CRTCs
  *
@@ -253,24 +248,6 @@ struct drm_crtc_helper_funcs {
 	int (*mode_set_base)(struct drm_crtc *crtc, int x, int y,
 			     struct drm_framebuffer *old_fb);
 
-	/**
-	 * @mode_set_base_atomic:
-	 *
-	 * This callback is used by the fbdev helpers to set a new framebuffer
-	 * and scanout without sleeping, i.e. from an atomic calling context. It
-	 * is only used to implement kgdb support.
-	 *
-	 * This callback is optional and only needed for kgdb support in the fbdev
-	 * helpers.
-	 *
-	 * RETURNS:
-	 *
-	 * 0 on success or a negative error code on failure.
-	 */
-	int (*mode_set_base_atomic)(struct drm_crtc *crtc,
-				    struct drm_framebuffer *fb, int x, int y,
-				    enum mode_set_atomic);
-
 	/**
 	 * @disable:
 	 *
-- 
2.51.1

