Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EF4652460
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 17:12:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B6510E0BB;
	Tue, 20 Dec 2022 16:11:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C30FF10E0AE
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 16:11:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 483AE4D36A;
 Tue, 20 Dec 2022 16:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1671552712; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PmJxYbyzQQ4gJWpFAMnsp+n6r0ebmHNPQtcwl6OI2eI=;
 b=UlCXSKsoR0/EGc+w3awtFXDjsUuBkdWGWSgnMva/yx++1jnCPP/Y2YiJNskUG5rYADpbiS
 z/mqgIs1XYHx4Ks4NwXT0Psra3wrU8Pab01ser0zaXUlo83Q2b5+ZYgrpuztbEiNz8gXy1
 QPbblCoe0dANZmgRR4whBPt1wTYAmCQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1671552712;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PmJxYbyzQQ4gJWpFAMnsp+n6r0ebmHNPQtcwl6OI2eI=;
 b=9Rph3UBQj7c+vkQ1edNHKlmauY4GaUXqDxSu9P3AethuhBLRer+BuGXXIUJbf8pPvn9MR4
 DZloGfruIX9q2WAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1B8E113910;
 Tue, 20 Dec 2022 16:11:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qLXOBcjeoWMiZQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Dec 2022 16:11:52 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, javierm@redhat.com,
 jose.exposito89@gmail.com, mairacanal@riseup.net, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH v2 13/13] drm/format-helper: Remove unnecessary conversion
 helpers
Date: Tue, 20 Dec 2022 17:11:45 +0100
Message-Id: <20221220161145.27568-14-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221220161145.27568-1-tzimmermann@suse.de>
References: <20221220161145.27568-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Drivers only emulate XRGB8888 framebuffers. Remove all conversion
helpers that do not use XRGB8888 as their source format. Also remove
some special cases for alpha formats in the blit helper.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/drm_format_helper.c | 75 -----------------------------
 1 file changed, 75 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 07791aa5385d..820fcfd9d95d 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -649,65 +649,6 @@ void drm_fb_xrgb8888_to_argb8888(struct iosys_map *dst, const unsigned int *dst_
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_argb8888);
 
-static void drm_fb_rgb565_to_xrgb8888_line(void *dbuf, const void *sbuf, unsigned int pixels)
-{
-	__le32 *dbuf32 = dbuf;
-	const __le16 *sbuf16 = sbuf;
-	unsigned int x;
-
-	for (x = 0; x < pixels; x++) {
-		u16 val16 = le16_to_cpu(sbuf16[x]);
-		u32 val32 = ((val16 & 0xf800) << 8) |
-			    ((val16 & 0x07e0) << 5) |
-			    ((val16 & 0x001f) << 3);
-		val32 = 0xff000000 | val32 |
-			((val32 >> 3) & 0x00070007) |
-			((val32 >> 2) & 0x00000300);
-		dbuf32[x] = cpu_to_le32(val32);
-	}
-}
-
-static void drm_fb_rgb565_to_xrgb8888(struct iosys_map *dst, const unsigned int *dst_pitch,
-				      const struct iosys_map *src,
-				      const struct drm_framebuffer *fb,
-				      const struct drm_rect *clip)
-{
-	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
-		4,
-	};
-
-	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false,
-		    drm_fb_rgb565_to_xrgb8888_line);
-}
-
-static void drm_fb_rgb888_to_xrgb8888_line(void *dbuf, const void *sbuf, unsigned int pixels)
-{
-	__le32 *dbuf32 = dbuf;
-	const u8 *sbuf8 = sbuf;
-	unsigned int x;
-
-	for (x = 0; x < pixels; x++) {
-		u8 r = *sbuf8++;
-		u8 g = *sbuf8++;
-		u8 b = *sbuf8++;
-		u32 pix = 0xff000000 | (r << 16) | (g << 8) | b;
-		dbuf32[x] = cpu_to_le32(pix);
-	}
-}
-
-static void drm_fb_rgb888_to_xrgb8888(struct iosys_map *dst, const unsigned int *dst_pitch,
-				      const struct iosys_map *src,
-				      const struct drm_framebuffer *fb,
-				      const struct drm_rect *clip)
-{
-	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
-		4,
-	};
-
-	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false,
-		    drm_fb_rgb888_to_xrgb8888_line);
-}
-
 static void drm_fb_xrgb8888_to_xrgb2101010_line(void *dbuf, const void *sbuf, unsigned int pixels)
 {
 	__le32 *dbuf32 = dbuf;
@@ -899,12 +840,6 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
 {
 	uint32_t fb_format = fb->format->format;
 
-	/* treat alpha channel like filler bits */
-	if (fb_format == DRM_FORMAT_ARGB8888)
-		fb_format = DRM_FORMAT_XRGB8888;
-	if (fb_format == DRM_FORMAT_ARGB2101010)
-		fb_format = DRM_FORMAT_XRGB2101010;
-
 	if (fb_format == dst_format) {
 		drm_fb_memcpy(dst, dst_pitch, src, fb, clip);
 		return 0;
@@ -943,16 +878,6 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
 			drm_fb_swab(dst, dst_pitch, src, fb, clip, false);
 			return 0;
 		}
-	} else if (fb_format == DRM_FORMAT_RGB888) {
-		if (dst_format == DRM_FORMAT_XRGB8888) {
-			drm_fb_rgb888_to_xrgb8888(dst, dst_pitch, src, fb, clip);
-			return 0;
-		}
-	} else if (fb_format == DRM_FORMAT_RGB565) {
-		if (dst_format == DRM_FORMAT_XRGB8888) {
-			drm_fb_rgb565_to_xrgb8888(dst, dst_pitch, src, fb, clip);
-			return 0;
-		}
 	}
 
 	drm_warn_once(fb->dev, "No conversion helper from %p4cc to %p4cc found.\n",
-- 
2.39.0

