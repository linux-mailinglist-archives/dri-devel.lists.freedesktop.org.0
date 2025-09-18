Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 567A0B85B97
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 17:45:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A680710E212;
	Thu, 18 Sep 2025 15:45:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="nML3ivZw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MEJu0K8T";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1EHAI6HD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="l+I5fzOm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 823F610E212
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 15:45:04 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E9B64336BB;
 Thu, 18 Sep 2025 15:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758210296; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qdx5YYjcWAge+oyZciCviM2WRKltsXVLBzjSs0TJo+8=;
 b=nML3ivZw2hGfnSPYPxddmEkPZibgsBOk8SVG4r8JJG4wkea+S2hiCKFoaUkoQQWUcYYUIz
 zRII6Dm2K41vTphBW1igiN5m+GDkujlKhTUhv66L/CLUvksdLmV0/tavSmUFIQARmR6V4l
 j3p51u8UHcheOAZAIIzDEx9vJSUJRAI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758210296;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qdx5YYjcWAge+oyZciCviM2WRKltsXVLBzjSs0TJo+8=;
 b=MEJu0K8TxwfYnYTlblT+6WTZT3MTv5j23az+XjXlJek0etqmW1WMCp+fROYyMP4CsoR93C
 Rs6yZbzeH06lx7Cg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1EHAI6HD;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=l+I5fzOm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758210295; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qdx5YYjcWAge+oyZciCviM2WRKltsXVLBzjSs0TJo+8=;
 b=1EHAI6HD8Rqltcpxc6jo+rgvHF3+uzxcJLih6adJKbZAwZo4EpbLm9QavL6vrJ2I2oUarP
 VYsfNFDwh3gUdhQCvzk5nMrAfloYkw4rThnXBybsTVGU1wtFiRuirnVVvnBNaP6TVZN0KO
 sY+YWR+Dwwd6AC1wm9yX6uMZn48qS/g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758210295;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qdx5YYjcWAge+oyZciCviM2WRKltsXVLBzjSs0TJo+8=;
 b=l+I5fzOmTdxmKwTrgv3qYTjIMzkvJqTJlqtK2w3ICbotgYjrC/3Mt/LVBVS13wT8Rqsvrn
 eFian1/AIfgHPxDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B29DE13AAF;
 Thu, 18 Sep 2025 15:44:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id yJ5pKvcozGh/YQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 18 Sep 2025 15:44:55 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 3/3] drm/format-helper: Remove drm_fb_blit()
Date: Thu, 18 Sep 2025 17:39:51 +0200
Message-ID: <20250918154207.84714-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250918154207.84714-1-tzimmermann@suse.de>
References: <20250918154207.84714-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: E9B64336BB
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 MIME_TRACE(0.00)[0:+];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 ARC_NA(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 DKIM_TRACE(0.00)[suse.de:+]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[7];
 R_RATELIMIT(0.00)[to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc)];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

The function is unused; remove it.

Instead of relying on a general blit helper, drivers should pick a blit
function by themselves from their list of supported color formats.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
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

