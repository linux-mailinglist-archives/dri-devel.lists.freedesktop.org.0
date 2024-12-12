Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F699EF49A
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 18:09:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26CED10EE5D;
	Thu, 12 Dec 2024 17:09:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="QG8PSmTe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SqT6Au42";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QG8PSmTe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SqT6Au42";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78E7C10EE46;
 Thu, 12 Dec 2024 17:09:25 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 368022117B;
 Thu, 12 Dec 2024 17:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1734023364; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mScZuFeJ1PC1SgCts+ggMdKajjJN2r6ebITJiAEvSeE=;
 b=QG8PSmTeY9AeJnaW6yFeqz7fXAZKKIqkLU2GN7wTZ2BdwRCaNsxNhqRRTx6QndSiOF/PfH
 eGzgwKF50JtyLOXhAKMLde9uc+ljEe31MnxYZFghIIUc5SmwWfDXVugwwNmS/jbYPYy17P
 fW35vrePiakGcQ7u3WBzn0wmmwV6fJs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1734023364;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mScZuFeJ1PC1SgCts+ggMdKajjJN2r6ebITJiAEvSeE=;
 b=SqT6Au42wGbk+77TtBumJhZqYdoXCKGPJXqJVBeB1zD2H7ZCVfqTf+P94yX5BK6GRkhZZ6
 rCkiVFolBTO2hADQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=QG8PSmTe;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=SqT6Au42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1734023364; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mScZuFeJ1PC1SgCts+ggMdKajjJN2r6ebITJiAEvSeE=;
 b=QG8PSmTeY9AeJnaW6yFeqz7fXAZKKIqkLU2GN7wTZ2BdwRCaNsxNhqRRTx6QndSiOF/PfH
 eGzgwKF50JtyLOXhAKMLde9uc+ljEe31MnxYZFghIIUc5SmwWfDXVugwwNmS/jbYPYy17P
 fW35vrePiakGcQ7u3WBzn0wmmwV6fJs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1734023364;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mScZuFeJ1PC1SgCts+ggMdKajjJN2r6ebITJiAEvSeE=;
 b=SqT6Au42wGbk+77TtBumJhZqYdoXCKGPJXqJVBeB1zD2H7ZCVfqTf+P94yX5BK6GRkhZZ6
 rCkiVFolBTO2hADQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C8FF213A3D;
 Thu, 12 Dec 2024 17:09:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id yPfOL8MYW2etIQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 12 Dec 2024 17:09:23 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net,
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, jfalempe@redhat.com, javierm@redhat.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 09/12] drm/i915/display: Move fbdev code around
Date: Thu, 12 Dec 2024 18:08:50 +0100
Message-ID: <20241212170913.185939-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241212170913.185939-1-tzimmermann@suse.de>
References: <20241212170913.185939-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 368022117B
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

Move fbdev code around in the source file before switching to DRM's
generic fbdev client. This will make the conversion less intrusive.
No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/i915/display/intel_fbdev.c | 85 +++++++++++-----------
 1 file changed, 44 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 0839c07b58c7..f5dc96a9f86d 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -54,6 +54,9 @@
 #include "intel_fbdev_fb.h"
 #include "intel_frontbuffer.h"
 
+static int intelfb_create(struct drm_fb_helper *helper,
+			  struct drm_fb_helper_surface_size *sizes);
+
 struct intel_fbdev {
 	struct intel_framebuffer *fb;
 	struct i915_vma *vma;
@@ -163,6 +166,47 @@ static const struct fb_ops intelfb_ops = {
 
 __diag_pop();
 
+static int intelfb_dirty(struct drm_fb_helper *helper, struct drm_clip_rect *clip)
+{
+	if (!(clip->x1 < clip->x2 && clip->y1 < clip->y2))
+		return 0;
+
+	if (helper->fb->funcs->dirty)
+		return helper->fb->funcs->dirty(helper->fb, NULL, 0, 0, clip, 1);
+
+	return 0;
+}
+
+static void intelfb_restore(struct drm_fb_helper *fb_helper)
+{
+	struct intel_fbdev *ifbdev = to_intel_fbdev(fb_helper);
+
+	intel_fbdev_invalidate(ifbdev);
+}
+
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
+static const struct drm_fb_helper_funcs intel_fb_helper_funcs = {
+	.fb_probe = intelfb_create,
+	.fb_dirty = intelfb_dirty,
+	.fb_restore = intelfb_restore,
+	.fb_set_suspend = intelfb_set_suspend,
+};
+
 static int intelfb_create(struct drm_fb_helper *helper,
 			  struct drm_fb_helper_surface_size *sizes)
 {
@@ -267,47 +311,6 @@ static int intelfb_create(struct drm_fb_helper *helper,
 	return ret;
 }
 
-static int intelfb_dirty(struct drm_fb_helper *helper, struct drm_clip_rect *clip)
-{
-	if (!(clip->x1 < clip->x2 && clip->y1 < clip->y2))
-		return 0;
-
-	if (helper->fb->funcs->dirty)
-		return helper->fb->funcs->dirty(helper->fb, NULL, 0, 0, clip, 1);
-
-	return 0;
-}
-
-static void intelfb_restore(struct drm_fb_helper *fb_helper)
-{
-	struct intel_fbdev *ifbdev = to_intel_fbdev(fb_helper);
-
-	intel_fbdev_invalidate(ifbdev);
-}
-
-static void intelfb_set_suspend(struct drm_fb_helper *fb_helper, bool suspend)
-{
-	struct fb_info *info = fb_helper->info;
-
-	/*
-	 * When resuming from hibernation, Linux restores the object's
-	 * content from swap if the buffer is backed by shmemfs. If the
-	 * object is stolen however, it will be full of whatever garbage
-	 * was left in there. Clear it to zero in this case.
-	 */
-	if (!suspend && !intel_bo_is_shmem(intel_fb_bo(fb_helper->fb)))
-		memset_io(info->screen_base, 0, info->screen_size);
-
-	fb_set_suspend(info, suspend);
-}
-
-static const struct drm_fb_helper_funcs intel_fb_helper_funcs = {
-	.fb_probe = intelfb_create,
-	.fb_dirty = intelfb_dirty,
-	.fb_restore = intelfb_restore,
-	.fb_set_suspend = intelfb_set_suspend,
-};
-
 /*
  * Build an intel_fbdev struct using a BIOS allocated framebuffer, if possible.
  * The core display code will have read out the current plane configuration,
-- 
2.47.1

