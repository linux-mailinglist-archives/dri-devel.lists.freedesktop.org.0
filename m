Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E23B04354
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 17:18:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6007010E4B7;
	Mon, 14 Jul 2025 15:18:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="kz9Udry0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DI5QUclk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oOxoRVZR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HTrsxKHS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A03F10E4B8
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 15:18:33 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F17171F7C5;
 Mon, 14 Jul 2025 15:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1752506304; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eXTfxKRzyk1TqDXe+F7Q8ysMG1wyzCTGfrJiCm+iLIA=;
 b=kz9Udry0ZnYXlrjI74OdncTa1iBZWtDAWK/9qQd6kZKBpnC5tFkNH+d8+TWhow8oJphrhu
 YvwGspb8vflns6P2Zur1bNRxnIpYVCKr2C/YJ2SNKy0tckG4s9jHj8pkIxnPcNws4pkINu
 V7pQt5QB24nZT5PgUm4ZQYCJpxzNp2w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1752506304;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eXTfxKRzyk1TqDXe+F7Q8ysMG1wyzCTGfrJiCm+iLIA=;
 b=DI5QUclkOJRHIQwzkCCM2KWsg/HnYc3l1BvR7ykrghof7QOjJ3nUyIzhMM8MBpBRZsQupY
 COXP3ePK9NWw8sBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1752506303; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eXTfxKRzyk1TqDXe+F7Q8ysMG1wyzCTGfrJiCm+iLIA=;
 b=oOxoRVZRbZNlXPvS3ZD8Vb1wSGBi4ToRcC8CKewFgSgSKkszRkxUIY/40FNyLakAeUYVXV
 Knj9xT336kPySCzG4wucHwZ5v9SL6UFMmDdBa4uuUohBB8AUqxtsd+D0G8SZTemEhoCdnj
 xKmTTZy/GC1kZOLovyrQ+MjcRc7QCKs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1752506303;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eXTfxKRzyk1TqDXe+F7Q8ysMG1wyzCTGfrJiCm+iLIA=;
 b=HTrsxKHS7J6vLeArvtAn6U/Rv5nVhxqOOuK9y9U+6GW83jv+Rb2GEa69OLiKBN4+uJNBgn
 KZvkrFRGUPKwwrAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D0694138A1;
 Mon, 14 Jul 2025 15:18:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id cA98Mb8fdWhbMgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 14 Jul 2025 15:18:23 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 4/9] drm/sysfb: Blit to CRTC destination format
Date: Mon, 14 Jul 2025 17:13:04 +0200
Message-ID: <20250714151513.309475-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250714151513.309475-1-tzimmermann@suse.de>
References: <20250714151513.309475-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_CONTAINS_FROM(1.00)[]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 RCVD_COUNT_TWO(0.00)[2]; FROM_HAS_DN(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_THREE(0.00)[3]; RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -6.80
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

Use the color format stored in struct drm_sysfb_crtc_state for
color-format conversion instead of the scanout-buffer format
announced by firmware. Currently, both values are identical.

This will allow drivers to modify the CRTC's input format to a
certain extend. Specifically, vesadrm will be able to display RGB
framebuffers when the scanout buffer is of C8 format. With color-
format conversion to RGB332 and correct setup of the C8 palette,
displaying XRGB8888-based buffers under C8 can be achieved.

v2:
- refer to RGB332 as CRTC input format

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/sysfb/drm_sysfb_helper.h  |  2 +-
 drivers/gpu/drm/sysfb/drm_sysfb_modeset.c | 29 +++++++++++++++--------
 2 files changed, 20 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_helper.h b/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
index 1424b63dde99..89633e30ca62 100644
--- a/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
+++ b/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
@@ -132,7 +132,7 @@ int drm_sysfb_plane_helper_get_scanout_buffer(struct drm_plane *plane,
 struct drm_sysfb_crtc_state {
 	struct drm_crtc_state base;
 
-	/* Primary-plane format; required for color mgmt. */
+	/* CRTC input color format; required for color mgmt. */
 	const struct drm_format_info *format;
 };
 
diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c b/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
index 1bcdb5ee8f09..0e05345cdeee 100644
--- a/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
+++ b/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
@@ -210,7 +210,12 @@ int drm_sysfb_plane_helper_atomic_check(struct drm_plane *plane,
 	else if (!new_plane_state->visible)
 		return 0;
 
-	if (new_fb->format != sysfb->fb_format) {
+	new_crtc_state = drm_atomic_get_new_crtc_state(new_state, new_plane_state->crtc);
+
+	new_sysfb_crtc_state = to_drm_sysfb_crtc_state(new_crtc_state);
+	new_sysfb_crtc_state->format = sysfb->fb_format;
+
+	if (new_fb->format != new_sysfb_crtc_state->format) {
 		void *buf;
 
 		/* format conversion necessary; reserve buffer */
@@ -220,11 +225,6 @@ int drm_sysfb_plane_helper_atomic_check(struct drm_plane *plane,
 			return -ENOMEM;
 	}
 
-	new_crtc_state = drm_atomic_get_new_crtc_state(new_state, new_plane_state->crtc);
-
-	new_sysfb_crtc_state = to_drm_sysfb_crtc_state(new_crtc_state);
-	new_sysfb_crtc_state->format = new_fb->format;
-
 	return 0;
 }
 EXPORT_SYMBOL(drm_sysfb_plane_helper_atomic_check);
@@ -238,7 +238,10 @@ void drm_sysfb_plane_helper_atomic_update(struct drm_plane *plane, struct drm_at
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 	struct drm_framebuffer *fb = plane_state->fb;
 	unsigned int dst_pitch = sysfb->fb_pitch;
-	const struct drm_format_info *dst_format = sysfb->fb_format;
+	struct drm_crtc_state *crtc_state = crtc_state =
+		drm_atomic_get_new_crtc_state(state, plane_state->crtc);
+	struct drm_sysfb_crtc_state *sysfb_crtc_state = to_drm_sysfb_crtc_state(crtc_state);
+	const struct drm_format_info *dst_format = sysfb_crtc_state->format;
 	struct drm_atomic_helper_damage_iter iter;
 	struct drm_rect damage;
 	int ret, idx;
@@ -278,7 +281,10 @@ void drm_sysfb_plane_helper_atomic_disable(struct drm_plane *plane,
 	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
 	void __iomem *dst_vmap = dst.vaddr_iomem; /* TODO: Use mapping abstraction */
 	unsigned int dst_pitch = sysfb->fb_pitch;
-	const struct drm_format_info *dst_format = sysfb->fb_format;
+	struct drm_crtc_state *crtc_state = crtc_state =
+		drm_atomic_get_new_crtc_state(state, plane_state->crtc);
+	struct drm_sysfb_crtc_state *sysfb_crtc_state = to_drm_sysfb_crtc_state(crtc_state);
+	const struct drm_format_info *dst_format = sysfb_crtc_state->format;
 	struct drm_rect dst_clip;
 	unsigned long lines, linepixels, i;
 	int idx;
@@ -370,16 +376,19 @@ EXPORT_SYMBOL(drm_sysfb_crtc_helper_atomic_check);
 
 void drm_sysfb_crtc_reset(struct drm_crtc *crtc)
 {
+	struct drm_sysfb_device *sysfb = to_drm_sysfb_device(crtc->dev);
 	struct drm_sysfb_crtc_state *sysfb_crtc_state;
 
 	if (crtc->state)
 		drm_sysfb_crtc_state_destroy(to_drm_sysfb_crtc_state(crtc->state));
 
 	sysfb_crtc_state = kzalloc(sizeof(*sysfb_crtc_state), GFP_KERNEL);
-	if (sysfb_crtc_state)
+	if (sysfb_crtc_state) {
+		sysfb_crtc_state->format = sysfb->fb_format;
 		__drm_atomic_helper_crtc_reset(crtc, &sysfb_crtc_state->base);
-	else
+	} else {
 		__drm_atomic_helper_crtc_reset(crtc, NULL);
+	}
 }
 EXPORT_SYMBOL(drm_sysfb_crtc_reset);
 
-- 
2.50.0

