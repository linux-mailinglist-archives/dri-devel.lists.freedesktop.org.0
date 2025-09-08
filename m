Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 932C7B48D5A
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 14:25:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B09110E4F5;
	Mon,  8 Sep 2025 12:25:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="hzHEbnhJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ao9nxm2C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE40110E4F5
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 12:25:35 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C04E2249A3;
 Mon,  8 Sep 2025 12:25:33 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1757334333; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8v/7z3hfck5uJh9EC8Kt/0FFsvCS0naF+jJzC0Nps7c=;
 b=hzHEbnhJwTWaEQZKAYjPOLICYFCzW8zYndqOnw7u165Tctzy6El5Wx7N4sqqaw0Zw5BlAH
 4hjlr4tqU4B8XGZTheYvStDQijqOqnlaT2wlIqQb7rK95625JARdkKnr2MpH7Wmr+6oCHy
 LwxOd4lsUDcHWJB24oKQOsz8B+DVmLQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1757334333;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8v/7z3hfck5uJh9EC8Kt/0FFsvCS0naF+jJzC0Nps7c=;
 b=Ao9nxm2C219GRpVHoGJEDgCcIhuGzvPum133l1KDJrYZYuBHx0z2FTT12PunuWuxQj6Al5
 SwVxSJVZDMTCD+CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 87C5113ABA;
 Mon,  8 Sep 2025 12:25:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id sEzjHz3LvmhnIwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 08 Sep 2025 12:25:33 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/3] drm/format-helper: Remove drm_fb_blit()
Date: Mon,  8 Sep 2025 14:19:27 +0200
Message-ID: <20250908122240.740033-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250908122240.740033-1-tzimmermann@suse.de>
References: <20250908122240.740033-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: C04E2249A3
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -4.00
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

The function is unused; remove it.

Instead of relying on a general blit helper, drivers should pick a blit
function by themselves from their list of supported color formats.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_format_helper.c | 91 -----------------------------
 include/drm/drm_format_helper.h     |  4 --
 2 files changed, 95 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 006836554cc2..6cddf05c493b 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -1165,97 +1165,6 @@ void drm_fb_argb8888_to_argb4444(struct iosys_map *dst, const unsigned int *dst_
 }
 EXPORT_SYMBOL(drm_fb_argb8888_to_argb4444);
 
-/**
- * drm_fb_blit - Copy parts of a framebuffer to display memory
- * @dst:	Array of display-memory addresses to copy to
- * @dst_pitch: Array of numbers of bytes between the start of two consecutive scanlines
- *             within @dst; can be NULL if scanlines are stored next to each other.
- * @dst_format:	FOURCC code of the display's color format
- * @src:	The framebuffer memory to copy from
- * @fb:		The framebuffer to copy from
- * @clip:	Clip rectangle area to copy
- * @state: Transform and conversion state
- *
- * This function copies parts of a framebuffer to display memory. If the
- * formats of the display and the framebuffer mismatch, the blit function
- * will attempt to convert between them during the process. The parameters @dst,
- * @dst_pitch and @src refer to arrays. Each array must have at least as many
- * entries as there are planes in @dst_format's format. Each entry stores the
- * value for the format's respective color plane at the same index.
- *
- * This function does not apply clipping on @dst (i.e. the destination is at the
- * top-left corner).
- *
- * Returns:
- * 0 on success, or
- * -EINVAL if the color-format conversion failed, or
- * a negative error code otherwise.
- */
-int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t dst_format,
-		const struct iosys_map *src, const struct drm_framebuffer *fb,
-		const struct drm_rect *clip, struct drm_format_conv_state *state)
-{
-	uint32_t fb_format = fb->format->format;
-
-	if (fb_format == dst_format) {
-		drm_fb_memcpy(dst, dst_pitch, src, fb, clip);
-		return 0;
-	} else if (fb_format == (dst_format | DRM_FORMAT_BIG_ENDIAN)) {
-		drm_fb_swab(dst, dst_pitch, src, fb, clip, false, state);
-		return 0;
-	} else if (fb_format == (dst_format & ~DRM_FORMAT_BIG_ENDIAN)) {
-		drm_fb_swab(dst, dst_pitch, src, fb, clip, false, state);
-		return 0;
-	} else if (fb_format == DRM_FORMAT_XRGB8888) {
-		if (dst_format == DRM_FORMAT_RGB565) {
-			drm_fb_xrgb8888_to_rgb565(dst, dst_pitch, src, fb, clip, state);
-			return 0;
-		} else if (dst_format == DRM_FORMAT_XRGB1555) {
-			drm_fb_xrgb8888_to_xrgb1555(dst, dst_pitch, src, fb, clip, state);
-			return 0;
-		} else if (dst_format == DRM_FORMAT_ARGB1555) {
-			drm_fb_xrgb8888_to_argb1555(dst, dst_pitch, src, fb, clip, state);
-			return 0;
-		} else if (dst_format == DRM_FORMAT_RGBA5551) {
-			drm_fb_xrgb8888_to_rgba5551(dst, dst_pitch, src, fb, clip, state);
-			return 0;
-		} else if (dst_format == DRM_FORMAT_RGB888) {
-			drm_fb_xrgb8888_to_rgb888(dst, dst_pitch, src, fb, clip, state);
-			return 0;
-		} else if (dst_format == DRM_FORMAT_BGR888) {
-			drm_fb_xrgb8888_to_bgr888(dst, dst_pitch, src, fb, clip, state);
-			return 0;
-		} else if (dst_format == DRM_FORMAT_ARGB8888) {
-			drm_fb_xrgb8888_to_argb8888(dst, dst_pitch, src, fb, clip, state);
-			return 0;
-		} else if (dst_format == DRM_FORMAT_XBGR8888) {
-			drm_fb_xrgb8888_to_xbgr8888(dst, dst_pitch, src, fb, clip, state);
-			return 0;
-		} else if (dst_format == DRM_FORMAT_ABGR8888) {
-			drm_fb_xrgb8888_to_abgr8888(dst, dst_pitch, src, fb, clip, state);
-			return 0;
-		} else if (dst_format == DRM_FORMAT_XRGB2101010) {
-			drm_fb_xrgb8888_to_xrgb2101010(dst, dst_pitch, src, fb, clip, state);
-			return 0;
-		} else if (dst_format == DRM_FORMAT_ARGB2101010) {
-			drm_fb_xrgb8888_to_argb2101010(dst, dst_pitch, src, fb, clip, state);
-			return 0;
-		} else if (dst_format == DRM_FORMAT_BGRX8888) {
-			drm_fb_swab(dst, dst_pitch, src, fb, clip, false, state);
-			return 0;
-		} else if (dst_format == DRM_FORMAT_RGB332) {
-			drm_fb_xrgb8888_to_rgb332(dst, dst_pitch, src, fb, clip, state);
-			return 0;
-		}
-	}
-
-	drm_warn_once(fb->dev, "No conversion helper from %p4cc to %p4cc found.\n",
-		      &fb_format, &dst_format);
-
-	return -EINVAL;
-}
-EXPORT_SYMBOL(drm_fb_blit);
-
 static void drm_fb_gray8_to_gray2_line(void *dbuf, const void *sbuf, unsigned int pixels)
 {
 	u8 *dbuf8 = dbuf;
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index 32d57d6c5327..2b5c1aef80b0 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -128,10 +128,6 @@ void drm_fb_argb8888_to_argb4444(struct iosys_map *dst, const unsigned int *dst_
 				 const struct iosys_map *src, const struct drm_framebuffer *fb,
 				 const struct drm_rect *clip, struct drm_format_conv_state *state);
 
-int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t dst_format,
-		const struct iosys_map *src, const struct drm_framebuffer *fb,
-		const struct drm_rect *clip, struct drm_format_conv_state *state);
-
 void drm_fb_xrgb8888_to_mono(struct iosys_map *dst, const unsigned int *dst_pitch,
 			     const struct iosys_map *src, const struct drm_framebuffer *fb,
 			     const struct drm_rect *clip, struct drm_format_conv_state *state);
-- 
2.51.0

