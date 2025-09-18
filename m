Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D54E1B85B8E
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 17:45:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFD8110E1FF;
	Thu, 18 Sep 2025 15:44:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="MEQNWNZL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fwbLfqV1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MEQNWNZL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fwbLfqV1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9F1810E1FF
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 15:44:56 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AC6811F38A;
 Thu, 18 Sep 2025 15:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758210295; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jlBxa3mFQvnQZMrQKBaLCHHxeKDlkAHA5qBc/1524TE=;
 b=MEQNWNZL5bOcq2Sm4lKoOw3PDUDHmHKljPe3CTiJTNuu8w7UjJvworGDpVvn/Nr+ZiqU6z
 719CsGES6PmM0CGw5ZXtddhVuGy8dqQYCpTqVAfyTf2EQ6j8cbXnhko0oC4p2nDgeV37p0
 WwvL8ox6IWht6NzHaNClUeHW2mttuiE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758210295;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jlBxa3mFQvnQZMrQKBaLCHHxeKDlkAHA5qBc/1524TE=;
 b=fwbLfqV1k+6GFnVYRPw1dJ7rhQNr3NPM1I8+wy+2VaaJH7mOD5cx3jvbHbDpaTQ0WcaROH
 cJAeohTzz299nfDw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=MEQNWNZL;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=fwbLfqV1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758210295; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jlBxa3mFQvnQZMrQKBaLCHHxeKDlkAHA5qBc/1524TE=;
 b=MEQNWNZL5bOcq2Sm4lKoOw3PDUDHmHKljPe3CTiJTNuu8w7UjJvworGDpVvn/Nr+ZiqU6z
 719CsGES6PmM0CGw5ZXtddhVuGy8dqQYCpTqVAfyTf2EQ6j8cbXnhko0oC4p2nDgeV37p0
 WwvL8ox6IWht6NzHaNClUeHW2mttuiE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758210295;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jlBxa3mFQvnQZMrQKBaLCHHxeKDlkAHA5qBc/1524TE=;
 b=fwbLfqV1k+6GFnVYRPw1dJ7rhQNr3NPM1I8+wy+2VaaJH7mOD5cx3jvbHbDpaTQ0WcaROH
 cJAeohTzz299nfDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 77C3313A51;
 Thu, 18 Sep 2025 15:44:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 4MYPHPcozGh/YQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 18 Sep 2025 15:44:55 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 2/3] drm/sysfb: Lookup blit function during atomic check
Date: Thu, 18 Sep 2025 17:39:50 +0200
Message-ID: <20250918154207.84714-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250918154207.84714-1-tzimmermann@suse.de>
References: <20250918154207.84714-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 MIME_TRACE(0.00)[0:+];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 ARC_NA(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 RCPT_COUNT_SEVEN(0.00)[7];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: AC6811F38A
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
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

Some configurations of sysfb outputs require format conversion from
framebuffer to scanout buffer. It is a driver bug if the conversion
helper is missing, yet it might happen on odd scanout formats. The old
code, based on drm_fb_blit(), only detects this situation during the
commit's hardware update, which is too late to abort the update.

Lookup the correct blit helper as part of the check phase. Then store
it in the sysfb plane state. Allows for detection of a missing helper
before the commit has started. Also avoids drm_fb_blit()'s large switch
statement on each updated scanline. Only a single lookup has to be done.

The lookup is in drm_sysfb_get_blit_func(), which only tracks formats
supported by sysfb drivers.

The lookup happens in sysfb's begin_fb_access helper instead of its
atomic_check helper. This allows vesadrm, and possibly other drivers,
to implement their own atomic_check without interfering with blit
lookups. Vesadrm implements XRGB8888 on top of R8 formats with the
help of the atomic_check. Doing the blit lookup in begin_fb_access then
always uses the correct CRTC format on all drivers.

v2:
- vesadrm: use drm_sysfb_plane_helper_begin_fb_access()
- fix type in commit description (Javier)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/sysfb/drm_sysfb_helper.h  |  14 ++-
 drivers/gpu/drm/sysfb/drm_sysfb_modeset.c | 102 +++++++++++++++++++++-
 drivers/gpu/drm/sysfb/vesadrm.c           |   3 +-
 3 files changed, 114 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_helper.h b/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
index 875dd6594760..da670d7eeb2e 100644
--- a/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
+++ b/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
@@ -17,6 +17,12 @@ struct drm_format_info;
 struct drm_scanout_buffer;
 struct screen_info;
 
+typedef void (*drm_sysfb_blit_func)(struct iosys_map *, const unsigned int *,
+				    const struct iosys_map *,
+				    const struct drm_framebuffer *,
+				    const struct drm_rect *,
+				    struct drm_format_conv_state *);
+
 /*
  * Input parsing
  */
@@ -96,6 +102,9 @@ static inline struct drm_sysfb_device *to_drm_sysfb_device(struct drm_device *de
 
 struct drm_sysfb_plane_state {
 	struct drm_shadow_plane_state base;
+
+	/* transfers framebuffer data to scanout buffer in CRTC format */
+	drm_sysfb_blit_func blit_to_crtc;
 };
 
 static inline struct drm_sysfb_plane_state *
@@ -108,6 +117,8 @@ size_t drm_sysfb_build_fourcc_list(struct drm_device *dev,
 				   const u32 *native_fourccs, size_t native_nfourccs,
 				   u32 *fourccs_out, size_t nfourccs_out);
 
+int drm_sysfb_plane_helper_begin_fb_access(struct drm_plane *plane,
+					   struct drm_plane_state *plane_state);
 int drm_sysfb_plane_helper_atomic_check(struct drm_plane *plane,
 					struct drm_atomic_state *new_state);
 void drm_sysfb_plane_helper_atomic_update(struct drm_plane *plane,
@@ -125,7 +136,8 @@ int drm_sysfb_plane_helper_get_scanout_buffer(struct drm_plane *plane,
 	DRM_FORMAT_MOD_INVALID
 
 #define DRM_SYSFB_PLANE_HELPER_FUNCS \
-	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS, \
+	.begin_fb_access = drm_sysfb_plane_helper_begin_fb_access, \
+	.end_fb_access = drm_gem_end_shadow_fb_access, \
 	.atomic_check = drm_sysfb_plane_helper_atomic_check, \
 	.atomic_update = drm_sysfb_plane_helper_atomic_update, \
 	.atomic_disable = drm_sysfb_plane_helper_atomic_disable, \
diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c b/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
index e7c5f8b3b99c..8517c490e815 100644
--- a/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
+++ b/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
@@ -191,6 +191,97 @@ static void drm_sysfb_plane_state_destroy(struct drm_sysfb_plane_state *sysfb_pl
 	kfree(sysfb_plane_state);
 }
 
+static void drm_sysfb_memcpy(struct iosys_map *dst, const unsigned int *dst_pitch,
+			     const struct iosys_map *src, const struct drm_framebuffer *fb,
+			     const struct drm_rect *clip, struct drm_format_conv_state *state)
+{
+	drm_fb_memcpy(dst, dst_pitch, src, fb, clip);
+}
+
+static drm_sysfb_blit_func drm_sysfb_get_blit_func(u32 dst_format, u32 src_format)
+{
+	if (src_format == dst_format) {
+		return drm_sysfb_memcpy;
+	} else if (src_format == DRM_FORMAT_XRGB8888) {
+		switch (dst_format) {
+		case DRM_FORMAT_RGB565:
+			return drm_fb_xrgb8888_to_rgb565;
+		case DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN:
+			return drm_fb_xrgb8888_to_rgb565be;
+		case DRM_FORMAT_XRGB1555:
+			return drm_fb_xrgb8888_to_xrgb1555;
+		case DRM_FORMAT_ARGB1555:
+			return drm_fb_xrgb8888_to_argb1555;
+		case DRM_FORMAT_RGBA5551:
+			return drm_fb_xrgb8888_to_rgba5551;
+		case DRM_FORMAT_RGB888:
+			return drm_fb_xrgb8888_to_rgb888;
+		case DRM_FORMAT_BGR888:
+			return drm_fb_xrgb8888_to_bgr888;
+		case DRM_FORMAT_ARGB8888:
+			return drm_fb_xrgb8888_to_argb8888;
+		case DRM_FORMAT_XBGR8888:
+			return drm_fb_xrgb8888_to_xbgr8888;
+		case DRM_FORMAT_ABGR8888:
+			return drm_fb_xrgb8888_to_abgr8888;
+		case DRM_FORMAT_XRGB2101010:
+			return drm_fb_xrgb8888_to_xrgb2101010;
+		case DRM_FORMAT_ARGB2101010:
+			return drm_fb_xrgb8888_to_argb2101010;
+		case DRM_FORMAT_BGRX8888:
+			return drm_fb_xrgb8888_to_bgrx8888;
+		case DRM_FORMAT_RGB332:
+			return drm_fb_xrgb8888_to_rgb332;
+		}
+	}
+
+	return NULL;
+}
+
+int drm_sysfb_plane_helper_begin_fb_access(struct drm_plane *plane,
+					   struct drm_plane_state *plane_state)
+{
+	struct drm_device *dev = plane->dev;
+	struct drm_sysfb_plane_state *sysfb_plane_state = to_drm_sysfb_plane_state(plane_state);
+	struct drm_framebuffer *fb = plane_state->fb;
+	struct drm_crtc_state *crtc_state;
+	struct drm_sysfb_crtc_state *sysfb_crtc_state;
+	drm_sysfb_blit_func blit_to_crtc;
+	int ret;
+
+	ret = drm_gem_begin_shadow_fb_access(plane, plane_state);
+	if (ret)
+		return ret;
+
+	if (!fb)
+		return 0;
+
+	ret = -EINVAL;
+
+	crtc_state = drm_atomic_get_crtc_state(plane_state->state, plane_state->crtc);
+	if (drm_WARN_ON_ONCE(dev, !crtc_state))
+		goto err_drm_gem_end_shadow_fb_access;
+	sysfb_crtc_state = to_drm_sysfb_crtc_state(crtc_state);
+
+	if (drm_WARN_ON_ONCE(dev, !sysfb_crtc_state->format))
+		goto err_drm_gem_end_shadow_fb_access;
+	blit_to_crtc = drm_sysfb_get_blit_func(sysfb_crtc_state->format->format,
+					       fb->format->format);
+	if (!blit_to_crtc) {
+		drm_warn_once(dev, "No blit helper from %p4cc to %p4cc found.\n",
+			      &fb->format->format, &sysfb_crtc_state->format->format);
+		goto err_drm_gem_end_shadow_fb_access;
+	}
+	sysfb_plane_state->blit_to_crtc = blit_to_crtc;
+
+	return 0;
+
+err_drm_gem_end_shadow_fb_access:
+	drm_gem_end_shadow_fb_access(plane, plane_state);
+	return ret;
+}
+EXPORT_SYMBOL(drm_sysfb_plane_helper_begin_fb_access);
+
 int drm_sysfb_plane_helper_atomic_check(struct drm_plane *plane,
 					struct drm_atomic_state *new_state)
 {
@@ -241,12 +332,14 @@ void drm_sysfb_plane_helper_atomic_update(struct drm_plane *plane, struct drm_at
 	struct drm_sysfb_device *sysfb = to_drm_sysfb_device(dev);
 	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
 	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
-	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
+	struct drm_sysfb_plane_state *sysfb_plane_state = to_drm_sysfb_plane_state(plane_state);
+	struct drm_shadow_plane_state *shadow_plane_state = &sysfb_plane_state->base;
 	struct drm_framebuffer *fb = plane_state->fb;
 	unsigned int dst_pitch = sysfb->fb_pitch;
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, plane_state->crtc);
 	struct drm_sysfb_crtc_state *sysfb_crtc_state = to_drm_sysfb_crtc_state(crtc_state);
 	const struct drm_format_info *dst_format = sysfb_crtc_state->format;
+	drm_sysfb_blit_func blit_to_crtc = sysfb_plane_state->blit_to_crtc;
 	struct drm_atomic_helper_damage_iter iter;
 	struct drm_rect damage;
 	int ret, idx;
@@ -267,8 +360,8 @@ void drm_sysfb_plane_helper_atomic_update(struct drm_plane *plane, struct drm_at
 			continue;
 
 		iosys_map_incr(&dst, drm_fb_clip_offset(dst_pitch, dst_format, &dst_clip));
-		drm_fb_blit(&dst, &dst_pitch, dst_format->format, shadow_plane_state->data, fb,
-			    &damage, &shadow_plane_state->fmtcnv_state);
+		blit_to_crtc(&dst, &dst_pitch, shadow_plane_state->data, fb, &damage,
+			     &shadow_plane_state->fmtcnv_state);
 	}
 
 	drm_dev_exit(idx);
@@ -346,11 +439,13 @@ struct drm_plane_state *drm_sysfb_plane_atomic_duplicate_state(struct drm_plane
 {
 	struct drm_device *dev = plane->dev;
 	struct drm_plane_state *plane_state = plane->state;
+	struct drm_sysfb_plane_state *sysfb_plane_state;
 	struct drm_sysfb_plane_state *new_sysfb_plane_state;
 	struct drm_shadow_plane_state *new_shadow_plane_state;
 
 	if (drm_WARN_ON(dev, !plane_state))
 		return NULL;
+	sysfb_plane_state = to_drm_sysfb_plane_state(plane_state);
 
 	new_sysfb_plane_state = kzalloc(sizeof(*new_sysfb_plane_state), GFP_KERNEL);
 	if (!new_sysfb_plane_state)
@@ -358,6 +453,7 @@ struct drm_plane_state *drm_sysfb_plane_atomic_duplicate_state(struct drm_plane
 	new_shadow_plane_state = &new_sysfb_plane_state->base;
 
 	__drm_gem_duplicate_shadow_plane_state(plane, new_shadow_plane_state);
+	new_sysfb_plane_state->blit_to_crtc = sysfb_plane_state->blit_to_crtc;
 
 	return &new_shadow_plane_state->base;
 }
diff --git a/drivers/gpu/drm/sysfb/vesadrm.c b/drivers/gpu/drm/sysfb/vesadrm.c
index 16a4b52d45c6..c318df0adad5 100644
--- a/drivers/gpu/drm/sysfb/vesadrm.c
+++ b/drivers/gpu/drm/sysfb/vesadrm.c
@@ -295,7 +295,8 @@ static int vesadrm_primary_plane_helper_atomic_check(struct drm_plane *plane,
 }
 
 static const struct drm_plane_helper_funcs vesadrm_primary_plane_helper_funcs = {
-	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
+	.begin_fb_access = drm_sysfb_plane_helper_begin_fb_access,
+	.end_fb_access = drm_gem_end_shadow_fb_access,
 	.atomic_check = vesadrm_primary_plane_helper_atomic_check,
 	.atomic_update = drm_sysfb_plane_helper_atomic_update,
 	.atomic_disable = drm_sysfb_plane_helper_atomic_disable,
-- 
2.51.0

