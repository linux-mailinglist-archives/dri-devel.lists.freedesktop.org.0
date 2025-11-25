Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9DEC85174
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 14:06:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 192B210E3E3;
	Tue, 25 Nov 2025 13:06:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="jAdjHSx8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yUSvzEys";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jAdjHSx8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yUSvzEys";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC5910E3DD
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 13:06:46 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0D26222802;
 Tue, 25 Nov 2025 13:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1764076002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xo6OrbjBcCILD7HYBy/ieXFNo9FxPgLKVxPTqUByuuw=;
 b=jAdjHSx8FJhRCyesmVxTlp9e0vNIf57P+zPekc9ykypTuM7ehAsjDddaWqVLB4hk9CM2CD
 +gfI51GG7yddsagy/o50MrHhz/AlfUqcq7DNW23rAxdE32nJeEmYVEYyPph0QpOGzpIJcH
 tLKq3344bKDdWjVHGhIsGpiWWd10nho=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1764076002;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xo6OrbjBcCILD7HYBy/ieXFNo9FxPgLKVxPTqUByuuw=;
 b=yUSvzEysnq2n35o7/88DykRHj6/QfjR4pfEKh1uai6vdiRlvOVPd7FapDvf/ngvLlcKni3
 vLHqAzr4tXevo8BQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1764076002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xo6OrbjBcCILD7HYBy/ieXFNo9FxPgLKVxPTqUByuuw=;
 b=jAdjHSx8FJhRCyesmVxTlp9e0vNIf57P+zPekc9ykypTuM7ehAsjDddaWqVLB4hk9CM2CD
 +gfI51GG7yddsagy/o50MrHhz/AlfUqcq7DNW23rAxdE32nJeEmYVEYyPph0QpOGzpIJcH
 tLKq3344bKDdWjVHGhIsGpiWWd10nho=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1764076002;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xo6OrbjBcCILD7HYBy/ieXFNo9FxPgLKVxPTqUByuuw=;
 b=yUSvzEysnq2n35o7/88DykRHj6/QfjR4pfEKh1uai6vdiRlvOVPd7FapDvf/ngvLlcKni3
 vLHqAzr4tXevo8BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8174A3EA63;
 Tue, 25 Nov 2025 13:06:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id yIcjHuGpJWkDFAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 25 Nov 2025 13:06:41 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, airlied@gmail.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, lyude@redhat.com, dakr@kernel.org, deller@gmx.de,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 jason.wessel@windriver.com, danielt@kernel.org, dianders@chromium.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/5] drm/nouveau: Do not implement mode_set_base_atomic
 callback
Date: Tue, 25 Nov 2025 13:52:14 +0100
Message-ID: <20251125130634.1080966-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251125130634.1080966-1-tzimmermann@suse.de>
References: <20251125130634.1080966-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_TWELVE(0.00)[19];
 MIME_TRACE(0.00)[0:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,amd.com,redhat.com,kernel.org,gmx.de,linux.intel.com,windriver.com,chromium.org];
 RCVD_TLS_ALL(0.00)[]; TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Flag: NO
X-Spam-Score: -2.80
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

Remove the implementation of the CRTC helper mode_set_base_atomic
from nouveau. It pretends to provide mode setting for kdb debugging,
but has been broken for some time.

Kdb output has been supported only for non-atomic mode setting since
commit 9c79e0b1d096 ("drm/fb-helper: Give up on kgdb for atomic drivers")
from 2017.

While nouveau provides non-atomic mode setting for some devices, kdb
assumes that the GEM buffer object is at a fixed location in video
memory. This has not been the case since
commit 4a16dd9d18a0 ("drm/nouveau/kms: switch to drm fbdev helpers")
from 2022. Fbdev-ttm helpers use a shadow buffer with a movable GEM
buffer object. Triggering kdb does therefore not update the display.

Hence remove the whole kdb support from nouveau.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/nouveau/dispnv04/crtc.c | 24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
index c063756eaea3..80493224eb6c 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
@@ -837,7 +837,7 @@ nv_crtc_gamma_set(struct drm_crtc *crtc, u16 *r, u16 *g, u16 *b,
 static int
 nv04_crtc_do_mode_set_base(struct drm_crtc *crtc,
 			   struct drm_framebuffer *passed_fb,
-			   int x, int y, bool atomic)
+			   int x, int y)
 {
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
@@ -850,19 +850,12 @@ nv04_crtc_do_mode_set_base(struct drm_crtc *crtc,
 	NV_DEBUG(drm, "index %d\n", nv_crtc->index);
 
 	/* no fb bound */
-	if (!atomic && !crtc->primary->fb) {
+	if (!crtc->primary->fb) {
 		NV_DEBUG(drm, "No FB bound\n");
 		return 0;
 	}
 
-	/* If atomic, we want to switch to the fb we were passed, so
-	 * now we update pointers to do that.
-	 */
-	if (atomic) {
-		drm_fb = passed_fb;
-	} else {
-		drm_fb = crtc->primary->fb;
-	}
+	drm_fb = crtc->primary->fb;
 
 	nvbo = nouveau_gem_object(drm_fb->obj[0]);
 	nv_crtc->fb.offset = nvbo->offset;
@@ -920,15 +913,7 @@ nv04_crtc_mode_set_base(struct drm_crtc *crtc, int x, int y,
 	int ret = nv_crtc_swap_fbs(crtc, old_fb);
 	if (ret)
 		return ret;
-	return nv04_crtc_do_mode_set_base(crtc, old_fb, x, y, false);
-}
-
-static int
-nv04_crtc_mode_set_base_atomic(struct drm_crtc *crtc,
-			       struct drm_framebuffer *fb,
-			       int x, int y, enum mode_set_atomic state)
-{
-	return nv04_crtc_do_mode_set_base(crtc, fb, x, y, true);
+	return nv04_crtc_do_mode_set_base(crtc, old_fb, x, y);
 }
 
 static void nv04_cursor_upload(struct drm_device *dev, struct nouveau_bo *src,
@@ -1274,7 +1259,6 @@ static const struct drm_crtc_helper_funcs nv04_crtc_helper_funcs = {
 	.commit = nv_crtc_commit,
 	.mode_set = nv_crtc_mode_set,
 	.mode_set_base = nv04_crtc_mode_set_base,
-	.mode_set_base_atomic = nv04_crtc_mode_set_base_atomic,
 	.disable = nv_crtc_disable,
 	.get_scanout_position = nouveau_display_scanoutpos,
 };
-- 
2.51.1

