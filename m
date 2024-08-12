Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A54C894E8A5
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 10:30:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C9DA10E161;
	Mon, 12 Aug 2024 08:30:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="VeoIuMqs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ezGyFUh9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VeoIuMqs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ezGyFUh9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C68B110E0DB;
 Mon, 12 Aug 2024 08:30:09 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5565020243;
 Mon, 12 Aug 2024 08:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723451408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rirjp6nzmlVJKJrtzhAtbsY/SjWJxp8UlichETaLI7I=;
 b=VeoIuMqsIT3ixBk/p95jWQ7rVazBiy7w0LiQwISZLryyGraNzmP11RDHR4KxUPX0yh6I9y
 stLlWz+o+T32K/XpeiWio8leLBQG+5ifk5cp4wCEum/iTabbUJMS+I426Cb5nG0SjL35dY
 DMN+h79zUNiJzVXJ9zL0hhla+ge8zGc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723451408;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rirjp6nzmlVJKJrtzhAtbsY/SjWJxp8UlichETaLI7I=;
 b=ezGyFUh9sclkM+GtwLhWKhv1xv4TSzOvCQ7NcTn0eTuJ44bz43UEnc0slQJkg1pFxrZ2qZ
 mOHe4eS7zqPMqfBw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=VeoIuMqs;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ezGyFUh9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723451408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rirjp6nzmlVJKJrtzhAtbsY/SjWJxp8UlichETaLI7I=;
 b=VeoIuMqsIT3ixBk/p95jWQ7rVazBiy7w0LiQwISZLryyGraNzmP11RDHR4KxUPX0yh6I9y
 stLlWz+o+T32K/XpeiWio8leLBQG+5ifk5cp4wCEum/iTabbUJMS+I426Cb5nG0SjL35dY
 DMN+h79zUNiJzVXJ9zL0hhla+ge8zGc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723451408;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rirjp6nzmlVJKJrtzhAtbsY/SjWJxp8UlichETaLI7I=;
 b=ezGyFUh9sclkM+GtwLhWKhv1xv4TSzOvCQ7NcTn0eTuJ44bz43UEnc0slQJkg1pFxrZ2qZ
 mOHe4eS7zqPMqfBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F3D5F13A3D;
 Mon, 12 Aug 2024 08:30:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 6ONJOg/IuWZpHwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 12 Aug 2024 08:30:07 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 7/9] drm/fbdev-helper: Remove
 drm_fb_helper_output_poll_changed()
Date: Mon, 12 Aug 2024 10:28:28 +0200
Message-ID: <20240812083000.337744-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240812083000.337744-1-tzimmermann@suse.de>
References: <20240812083000.337744-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.01 / 50.00]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 RCVD_TLS_ALL(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCPT_COUNT_TWELVE(0.00)[14];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FROM_HAS_DN(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,redhat.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]
X-Spamd-Bar: /
X-Rspamd-Queue-Id: 5565020243
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -0.01
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

The function is unused. Remove it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fb_helper.c | 15 ---------------
 include/drm/drm_fb_helper.h     |  6 ------
 2 files changed, 21 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index fe5667477839..29c53f9f449c 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -2003,18 +2003,3 @@ void drm_fb_helper_lastclose(struct drm_device *dev)
 	drm_fb_helper_restore_fbdev_mode_unlocked(dev->fb_helper);
 }
 EXPORT_SYMBOL(drm_fb_helper_lastclose);
-
-/**
- * drm_fb_helper_output_poll_changed - DRM mode config \.output_poll_changed
- *                                     helper for fbdev emulation
- * @dev: DRM device
- *
- * This function can be used as the
- * &drm_mode_config_funcs.output_poll_changed callback for drivers that only
- * need to call drm_fbdev.hotplug_event().
- */
-void drm_fb_helper_output_poll_changed(struct drm_device *dev)
-{
-	drm_fb_helper_hotplug_event(dev->fb_helper);
-}
-EXPORT_SYMBOL(drm_fb_helper_output_poll_changed);
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index 375737fd6c36..699f2790b9ac 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -271,9 +271,7 @@ int drm_fb_helper_hotplug_event(struct drm_fb_helper *fb_helper);
 int drm_fb_helper_initial_config(struct drm_fb_helper *fb_helper);
 int drm_fb_helper_debug_enter(struct fb_info *info);
 int drm_fb_helper_debug_leave(struct fb_info *info);
-
 void drm_fb_helper_lastclose(struct drm_device *dev);
-void drm_fb_helper_output_poll_changed(struct drm_device *dev);
 #else
 static inline void drm_fb_helper_prepare(struct drm_device *dev,
 					 struct drm_fb_helper *helper,
@@ -401,10 +399,6 @@ static inline int drm_fb_helper_debug_leave(struct fb_info *info)
 static inline void drm_fb_helper_lastclose(struct drm_device *dev)
 {
 }
-
-static inline void drm_fb_helper_output_poll_changed(struct drm_device *dev)
-{
-}
 #endif
 
 #endif
-- 
2.46.0

