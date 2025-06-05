Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC90EACF316
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 17:30:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E57310E898;
	Thu,  5 Jun 2025 15:30:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="DpfIyMpt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="J3CCjzUS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="W2WK5XIz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kcBUrlVB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F1D310E933
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 15:30:40 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F09DE33775;
 Thu,  5 Jun 2025 15:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749137420; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TWZYf/4Hp4po+YB+KpUBSXdQFsIqSWkSI0Twjkm0c10=;
 b=DpfIyMptzj1CViu0SpRLDE4DXbsTW5Ng1Mimhe/0Ql4f2t7gAWxK8TJ0nN6cKpYMknCghO
 u97qqIMz7avbs5KUxkQErEz5cRslaGEPfCIQqiZFhc/sRCgCLIy4EkgKrIt2hTMrARB5jV
 MCUvFzlbB9zygXC6Ly06s66fa1SZFlI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749137420;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TWZYf/4Hp4po+YB+KpUBSXdQFsIqSWkSI0Twjkm0c10=;
 b=J3CCjzUSn9nulESTF2+XIXA/hgbkRnFaZC6jMpGzl1GihGBfUVgD8gjt4xyWQIzATR5o/1
 QwT4d3EypGy58kBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749137419; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TWZYf/4Hp4po+YB+KpUBSXdQFsIqSWkSI0Twjkm0c10=;
 b=W2WK5XIzycyrSzYU+Rkomw3+1kQIGywLGtnhydI08Y2JA1Md2jj3kChtxjxXUhr6YuZsfa
 llsB4oXCQXcYySGlWwIW6mCawamFg0F09Rh5T0wvJu4UZnJ4cUepRexDZOfkiQqxOkrn1R
 xx86uevk2RO0/RNA1z5FCODgt6u+qR4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749137419;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TWZYf/4Hp4po+YB+KpUBSXdQFsIqSWkSI0Twjkm0c10=;
 b=kcBUrlVBQdp+MN5pVAyJHRL6Gj8hr31WwYctFAfR4QRlQgzsSFc/hwV8bnyXJjOV3aoHaF
 IUnY/MuYjCc5ixAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8ADCD1373E;
 Thu,  5 Jun 2025 15:30:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id aHVwIAu4QWj3XwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 05 Jun 2025 15:30:19 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: mhklinux@outlook.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 drawat.floss@gmail.com, javierm@redhat.com, kraxel@redhat.com,
 louis.chauvet@bootlin.com, hamohammed.sa@gmail.com, melissa.srw@gmail.com,
 fvogt@suse.com
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 virtualization@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 6/6] drm/fb-helper: Synchronize dirty worker with vblank
Date: Thu,  5 Jun 2025 17:24:44 +0200
Message-ID: <20250605152637.98493-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605152637.98493-1-tzimmermann@suse.de>
References: <20250605152637.98493-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TAGGED_RCPT(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
 RCPT_COUNT_TWELVE(0.00)[16]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[]; FROM_HAS_DN(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_TO(0.00)[outlook.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,redhat.com,bootlin.com,suse.com];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLgb6padn6wcu17bxtda1k7h6p)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,outlook.com]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -1.30
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

Before updating the display from the console's shadow buffer, the dirty
worker now waits for a vblank. This allows several screen updates to pile
up and acts as a rate limiter. If a DRM master is present, it could
interfere with the vblank. Don't wait in this case.

v3:
	* add back helper->lock
	* acquire DRM master status while waiting for vblank
v2:
	* don't hold helper->lock while waiting for vblank

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fb_helper.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 937c3939e502..e0b780634a84 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -364,9 +364,29 @@ static void drm_fb_helper_fb_dirty(struct drm_fb_helper *helper)
 	struct drm_device *dev = helper->dev;
 	struct drm_clip_rect *clip = &helper->damage_clip;
 	struct drm_clip_rect clip_copy;
+	struct drm_crtc *crtc;
 	unsigned long flags;
 	int ret;
 
+	/*
+	 * Rate-limit update frequency to vblank. If there's a DRM master
+	 * present, it could interfere while we're waiting for the vblank
+	 * event. Don't wait in this case.
+	 */
+	mutex_lock(&helper->lock);
+	if (!drm_master_internal_acquire(helper->dev)) {
+		goto unlock;
+	}
+	crtc = helper->client.modesets[0].crtc;
+	ret = drm_crtc_vblank_get(crtc);
+	if (!ret) {
+		drm_crtc_wait_one_vblank(crtc);
+		drm_crtc_vblank_put(crtc);
+	}
+	drm_master_internal_release(helper->dev);
+unlock:
+	mutex_unlock(&helper->lock);
+
 	if (drm_WARN_ON_ONCE(dev, !helper->funcs->fb_dirty))
 		return;
 
-- 
2.49.0

