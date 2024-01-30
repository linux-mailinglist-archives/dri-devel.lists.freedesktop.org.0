Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 413628420A1
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 11:07:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95718112ECF;
	Tue, 30 Jan 2024 10:07:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CA2F112EC2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 10:07:19 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 47BFE222D4;
 Tue, 30 Jan 2024 10:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706609237; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3zNjDqCjN8TGc6lhR0sWaXfik1s0qkOkit6Lf8EF4uY=;
 b=L6g/1fEoN8jfQWgofMwHnF8OkFrspugtaxWuILdmfCJQ8W2FxakTuFf/smUTeMZZvV8YgT
 ZEx95pPQNknrqhY7GGGsoSY6aZofaziLqeUWWrWpOMA76mFer1zQTjY3OaWVmaeEhNlWPS
 qagN8+8oSruBtfrslOh7mp9UsyKyOBI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706609237;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3zNjDqCjN8TGc6lhR0sWaXfik1s0qkOkit6Lf8EF4uY=;
 b=hvrF0FHiK2CApYuaL2+jdRX78WrId0YUg7rvQ9A89rgDAcZ7aJffRohty/RfRw5pYTGpSL
 zupB7xGSh9HkjbDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706609237; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3zNjDqCjN8TGc6lhR0sWaXfik1s0qkOkit6Lf8EF4uY=;
 b=L6g/1fEoN8jfQWgofMwHnF8OkFrspugtaxWuILdmfCJQ8W2FxakTuFf/smUTeMZZvV8YgT
 ZEx95pPQNknrqhY7GGGsoSY6aZofaziLqeUWWrWpOMA76mFer1zQTjY3OaWVmaeEhNlWPS
 qagN8+8oSruBtfrslOh7mp9UsyKyOBI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706609237;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3zNjDqCjN8TGc6lhR0sWaXfik1s0qkOkit6Lf8EF4uY=;
 b=hvrF0FHiK2CApYuaL2+jdRX78WrId0YUg7rvQ9A89rgDAcZ7aJffRohty/RfRw5pYTGpSL
 zupB7xGSh9HkjbDA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 223821376E;
 Tue, 30 Jan 2024 10:07:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id yLw8B1XKuGXdcwAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Tue, 30 Jan 2024 10:07:17 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	javierm@redhat.com
Subject: [PATCH 04/23] drm/format-helper: Use struct drm_pixmap internally
Date: Tue, 30 Jan 2024 10:53:39 +0100
Message-ID: <20240130100714.12608-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240130100714.12608-1-tzimmermann@suse.de>
References: <20240130100714.12608-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: 0.70
X-Spamd-Result: default: False [0.70 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[4]; R_MISSING_CHARSET(2.50)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 BROKEN_CONTENT_TYPE(1.50)[]; TO_DN_SOME(0.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-3.00)[100.00%]
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement drm_fb_xfrm() with struct drm_pixmap and adapt all
callers. The internal instances if struct drm_pixmap will eventually
be pushed into external callers of the format-helper interface.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_format_helper.c | 76 +++++++++++++++++++++--------
 1 file changed, 57 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index d59e38bcb942f..3bb3fb0703122 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -268,8 +268,7 @@ static int __drm_fb_xfrm_toio(void __iomem *dst, unsigned long dst_pitch, unsign
 /* TODO: Make this function work with multi-plane formats. */
 static int drm_fb_xfrm(struct iosys_map *dst,
 		       const unsigned int *dst_pitch, const u8 *dst_pixsize,
-		       const struct iosys_map *src, const struct drm_framebuffer *fb,
-		       const struct drm_rect *clip, bool vaddr_cached_hint,
+		       const struct drm_pixmap *src_pix, bool vaddr_cached_hint,
 		       struct drm_format_conv_state *state,
 		       void (*xfrm_line)(void *dbuf, const void *sbuf, unsigned int npixels))
 {
@@ -284,13 +283,13 @@ static int drm_fb_xfrm(struct iosys_map *dst,
 	if (dst[0].is_iomem)
 		return __drm_fb_xfrm_toio(
 			dst[0].vaddr_iomem, dst_pitch[0], dst_pixsize[0],
-			src[0].vaddr, fb->pitches[0], fb->format->cpp[0],
-			clip, vaddr_cached_hint, state, xfrm_line);
+			src_pix->data[0].vaddr, src_pix->pitches[0], src_pix->format->cpp[0],
+			&src_pix->clip, vaddr_cached_hint, state, xfrm_line);
 	else
 		return __drm_fb_xfrm(
 			dst[0].vaddr, dst_pitch[0], dst_pixsize[0],
-			src[0].vaddr, fb->pitches[0], fb->format->cpp[0],
-			clip, vaddr_cached_hint, state, xfrm_line);
+			src_pix->data[0].vaddr, src_pix->pitches[0], src_pix->format->cpp[0],
+			&src_pix->clip, vaddr_cached_hint, state, xfrm_line);
 }
 
 /**
@@ -397,6 +396,9 @@ void drm_fb_swab(struct iosys_map *dst, const unsigned int *dst_pitch,
 	const struct drm_format_info *format = fb->format;
 	u8 cpp = DIV_ROUND_UP(drm_format_info_bpp(format, 0), 8);
 	void (*swab_line)(void *dbuf, const void *sbuf, unsigned int npixels);
+	struct drm_pixmap pixmap;
+	struct drm_pixmap *src_pix = &pixmap;
+	drm_pixmap_init_from_framebuffer(src_pix, fb, src, clip);
 
 	switch (cpp) {
 	case 4:
@@ -411,7 +413,7 @@ void drm_fb_swab(struct iosys_map *dst, const unsigned int *dst_pitch,
 		return;
 	}
 
-	drm_fb_xfrm(dst, dst_pitch, &cpp, src, fb, clip, cached, state, swab_line);
+	drm_fb_xfrm(dst, dst_pitch, &cpp, src_pix, cached, state, swab_line);
 }
 EXPORT_SYMBOL(drm_fb_swab);
 
@@ -458,8 +460,11 @@ void drm_fb_xrgb8888_to_rgb332(struct iosys_map *dst, const unsigned int *dst_pi
 	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
 		1,
 	};
+	struct drm_pixmap pixmap;
+	struct drm_pixmap *src_pix = &pixmap;
+	drm_pixmap_init_from_framebuffer(src_pix, fb, src, clip);
 
-	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, state,
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src_pix, false, state,
 		    drm_fb_xrgb8888_to_rgb332_line);
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb332);
@@ -530,6 +535,9 @@ void drm_fb_xrgb8888_to_rgb565(struct iosys_map *dst, const unsigned int *dst_pi
 	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
 		2,
 	};
+	struct drm_pixmap pixmap;
+	struct drm_pixmap *src_pix = &pixmap;
+	drm_pixmap_init_from_framebuffer(src_pix, fb, src, clip);
 
 	void (*xfrm_line)(void *dbuf, const void *sbuf, unsigned int npixels);
 
@@ -538,7 +546,7 @@ void drm_fb_xrgb8888_to_rgb565(struct iosys_map *dst, const unsigned int *dst_pi
 	else
 		xfrm_line = drm_fb_xrgb8888_to_rgb565_line;
 
-	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, state, xfrm_line);
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src_pix, false, state, xfrm_line);
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb565);
 
@@ -588,8 +596,11 @@ void drm_fb_xrgb8888_to_xrgb1555(struct iosys_map *dst, const unsigned int *dst_
 	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
 		2,
 	};
+	struct drm_pixmap pixmap;
+	struct drm_pixmap *src_pix = &pixmap;
+	drm_pixmap_init_from_framebuffer(src_pix, fb, src, clip);
 
-	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, state,
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src_pix, false, state,
 		    drm_fb_xrgb8888_to_xrgb1555_line);
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_xrgb1555);
@@ -641,8 +652,11 @@ void drm_fb_xrgb8888_to_argb1555(struct iosys_map *dst, const unsigned int *dst_
 	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
 		2,
 	};
+	struct drm_pixmap pixmap;
+	struct drm_pixmap *src_pix = &pixmap;
+	drm_pixmap_init_from_framebuffer(src_pix, fb, src, clip);
 
-	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, state,
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src_pix, false, state,
 		    drm_fb_xrgb8888_to_argb1555_line);
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_argb1555);
@@ -694,8 +708,11 @@ void drm_fb_xrgb8888_to_rgba5551(struct iosys_map *dst, const unsigned int *dst_
 	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
 		2,
 	};
+	struct drm_pixmap pixmap;
+	struct drm_pixmap *src_pix = &pixmap;
+	drm_pixmap_init_from_framebuffer(src_pix, fb, src, clip);
 
-	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, state,
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src_pix, false, state,
 		    drm_fb_xrgb8888_to_rgba5551_line);
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgba5551);
@@ -745,8 +762,11 @@ void drm_fb_xrgb8888_to_rgb888(struct iosys_map *dst, const unsigned int *dst_pi
 	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
 		3,
 	};
+	struct drm_pixmap pixmap;
+	struct drm_pixmap *src_pix = &pixmap;
+	drm_pixmap_init_from_framebuffer(src_pix, fb, src, clip);
 
-	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, state,
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src_pix, false, state,
 		    drm_fb_xrgb8888_to_rgb888_line);
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb888);
@@ -794,8 +814,11 @@ void drm_fb_xrgb8888_to_argb8888(struct iosys_map *dst, const unsigned int *dst_
 	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
 		4,
 	};
+	struct drm_pixmap pixmap;
+	struct drm_pixmap *src_pix = &pixmap;
+	drm_pixmap_init_from_framebuffer(src_pix, fb, src, clip);
 
-	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, state,
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src_pix, false, state,
 		    drm_fb_xrgb8888_to_argb8888_line);
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_argb8888);
@@ -826,8 +849,11 @@ static void drm_fb_xrgb8888_to_abgr8888(struct iosys_map *dst, const unsigned in
 	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
 		4,
 	};
+	struct drm_pixmap pixmap;
+	struct drm_pixmap *src_pix = &pixmap;
+	drm_pixmap_init_from_framebuffer(src_pix, fb, src, clip);
 
-	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, state,
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src_pix, false, state,
 		    drm_fb_xrgb8888_to_abgr8888_line);
 }
 
@@ -857,8 +883,11 @@ static void drm_fb_xrgb8888_to_xbgr8888(struct iosys_map *dst, const unsigned in
 	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
 		4,
 	};
+	struct drm_pixmap pixmap;
+	struct drm_pixmap *src_pix = &pixmap;
+	drm_pixmap_init_from_framebuffer(src_pix, fb, src, clip);
 
-	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, state,
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src_pix, false, state,
 		    drm_fb_xrgb8888_to_xbgr8888_line);
 }
 
@@ -910,8 +939,11 @@ void drm_fb_xrgb8888_to_xrgb2101010(struct iosys_map *dst, const unsigned int *d
 	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
 		4,
 	};
+	struct drm_pixmap pixmap;
+	struct drm_pixmap *src_pix = &pixmap;
+	drm_pixmap_init_from_framebuffer(src_pix, fb, src, clip);
 
-	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, state,
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src_pix, false, state,
 		    drm_fb_xrgb8888_to_xrgb2101010_line);
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_xrgb2101010);
@@ -965,8 +997,11 @@ void drm_fb_xrgb8888_to_argb2101010(struct iosys_map *dst, const unsigned int *d
 	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
 		4,
 	};
+	struct drm_pixmap pixmap;
+	struct drm_pixmap *src_pix = &pixmap;
+	drm_pixmap_init_from_framebuffer(src_pix, fb, src, clip);
 
-	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, state,
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src_pix, false, state,
 		    drm_fb_xrgb8888_to_argb2101010_line);
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_argb2101010);
@@ -1021,8 +1056,11 @@ void drm_fb_xrgb8888_to_gray8(struct iosys_map *dst, const unsigned int *dst_pit
 	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
 		1,
 	};
+	struct drm_pixmap pixmap;
+	struct drm_pixmap *src_pix = &pixmap;
+	drm_pixmap_init_from_framebuffer(src_pix, fb, src, clip);
 
-	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, state,
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src_pix, false, state,
 		    drm_fb_xrgb8888_to_gray8_line);
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_gray8);
-- 
2.43.0

