Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA9A7B9C08
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 11:05:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37D5F10E15F;
	Thu,  5 Oct 2023 09:05:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8A6610E0BE
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 09:05:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7E69D1F892;
 Thu,  5 Oct 2023 09:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1696496727; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1E3BOP9lFut/CnjkuHw4Dj2LwDVFINmZ0AVp/L8HnJo=;
 b=XWLii4/pdVRi8z47iE3UZThAqMH6obq8hdhQmgh8hCeSoBtXsX6IbeU8GEuNdx7ydvZqRj
 O1PgRbxvyjxVlcOr1AmLy5hfDllaPJDvRTHqZQC6DuYkN//9855DkiG84+Xw7Iv1jl0yHn
 bIBCBuZkcs1wDXwGg3mlzsoelRIrc+4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1696496727;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1E3BOP9lFut/CnjkuHw4Dj2LwDVFINmZ0AVp/L8HnJo=;
 b=odt1cs8PDgngb+QgXXGHXDvISdWvopUeVr+qzt6eCiKD4T625LR2MVQZX8j/w1WKurkOpi
 /SnywX9oCVuU/qAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2E43D13AD9;
 Thu,  5 Oct 2023 09:05:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0OyDCld8HmXkcQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 05 Oct 2023 09:05:27 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jfalempe@redhat.com, jose.exposito89@gmail.com,
 arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
Subject: [PATCH v4 3/7] drm/format-helper: Pass format-conversion state to
 helpers
Date: Thu,  5 Oct 2023 11:04:23 +0200
Message-ID: <20231005090520.16511-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231005090520.16511-1-tzimmermann@suse.de>
References: <20231005090520.16511-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: David Lechner <david@lechnology.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pass an instance of struct drm_format_conv_state to DRM's format
conversion helpers. Update all callers.

Most drivers can use the format-conversion state from their shadow-
plane state. The shadow plane's destroy function releases the
allocated buffer. Drivers will later be able to allocate a buffer
of appropriate size in their plane's atomic_check code.

The gud driver uses a separate thread for committing updates. For
now, the update worker contains its own format-conversion state.

Images in the format-helper tests are small. The tests preallocate
a static page for the temporary buffer. Unloading the module releases
the memory.

v3:
	* store buffer in shadow-plane state (Javier, Maxime)
	* replace ARRAY_SIZE() with sizeof() (Jani)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Noralf Trønnes <noralf@tronnes.org>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: David Lechner <david@lechnology.com>
---
 drivers/gpu/drm/drm_format_helper.c           | 123 ++++++++++--------
 drivers/gpu/drm/drm_mipi_dbi.c                |  19 ++-
 drivers/gpu/drm/gud/gud_pipe.c                |  30 +++--
 drivers/gpu/drm/solomon/ssd130x.c             |   8 +-
 .../gpu/drm/tests/drm_format_helper_test.c    |  72 ++++++----
 drivers/gpu/drm/tiny/cirrus.c                 |   3 +-
 drivers/gpu/drm/tiny/ili9225.c                |  10 +-
 drivers/gpu/drm/tiny/ofdrm.c                  |   2 +-
 drivers/gpu/drm/tiny/repaper.c                |   8 +-
 drivers/gpu/drm/tiny/simpledrm.c              |   2 +-
 drivers/gpu/drm/tiny/st7586.c                 |  19 +--
 include/drm/drm_format_helper.h               |  30 +++--
 include/drm/drm_mipi_dbi.h                    |   4 +-
 13 files changed, 193 insertions(+), 137 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 37c499ae4fe4f..b9b3dadf7b5f8 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -220,29 +220,25 @@ static int drm_fb_xfrm(struct iosys_map *dst,
 		       const unsigned int *dst_pitch, const u8 *dst_pixsize,
 		       const struct iosys_map *src, const struct drm_framebuffer *fb,
 		       const struct drm_rect *clip, bool vaddr_cached_hint,
+		       struct drm_format_conv_state *state,
 		       void (*xfrm_line)(void *dbuf, const void *sbuf, unsigned int npixels))
 {
 	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
 		0, 0, 0, 0
 	};
-	struct drm_format_conv_state fmtcnv_state = DRM_FORMAT_CONV_STATE_INIT;
-	int ret;
 
 	if (!dst_pitch)
 		dst_pitch = default_dst_pitch;
 
 	/* TODO: handle src in I/O memory here */
 	if (dst[0].is_iomem)
-		ret = __drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], dst_pixsize[0],
-					 src[0].vaddr, fb, clip, vaddr_cached_hint, &fmtcnv_state,
-					 xfrm_line);
+		return __drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], dst_pixsize[0],
+					  src[0].vaddr, fb, clip, vaddr_cached_hint, state,
+					  xfrm_line);
 	else
-		ret = __drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], dst_pixsize[0],
-				    src[0].vaddr, fb, clip, vaddr_cached_hint, &fmtcnv_state,
-				    xfrm_line);
-	drm_format_conv_state_release(&fmtcnv_state);
-
-	return ret;
+		return __drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], dst_pixsize[0],
+				     src[0].vaddr, fb, clip, vaddr_cached_hint, state,
+				     xfrm_line);
 }
 
 /**
@@ -328,6 +324,7 @@ static void drm_fb_swab32_line(void *dbuf, const void *sbuf, unsigned int pixels
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
  * @cached: Source buffer is mapped cached (eg. not write-combined)
+ * @xfrm: Transform and conversion state
  *
  * This function copies parts of a framebuffer to display memory and swaps per-pixel
  * bytes during the process. Destination and framebuffer formats must match. The
@@ -342,7 +339,8 @@ static void drm_fb_swab32_line(void *dbuf, const void *sbuf, unsigned int pixels
  */
 void drm_fb_swab(struct iosys_map *dst, const unsigned int *dst_pitch,
 		 const struct iosys_map *src, const struct drm_framebuffer *fb,
-		 const struct drm_rect *clip, bool cached)
+		 const struct drm_rect *clip, bool cached,
+		 struct drm_format_conv_state *state)
 {
 	const struct drm_format_info *format = fb->format;
 	u8 cpp = DIV_ROUND_UP(drm_format_info_bpp(format, 0), 8);
@@ -361,7 +359,7 @@ void drm_fb_swab(struct iosys_map *dst, const unsigned int *dst_pitch,
 		return;
 	}
 
-	drm_fb_xfrm(dst, dst_pitch, &cpp, src, fb, clip, cached, swab_line);
+	drm_fb_xfrm(dst, dst_pitch, &cpp, src, fb, clip, cached, state, swab_line);
 }
 EXPORT_SYMBOL(drm_fb_swab);
 
@@ -388,6 +386,7 @@ static void drm_fb_xrgb8888_to_rgb332_line(void *dbuf, const void *sbuf, unsigne
  * @src: Array of XRGB8888 source buffers
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
+ * @xfrm: Transform and conversion state
  *
  * This function copies parts of a framebuffer to display memory and converts the
  * color format during the process. Destination and framebuffer formats must match. The
@@ -402,13 +401,13 @@ static void drm_fb_xrgb8888_to_rgb332_line(void *dbuf, const void *sbuf, unsigne
  */
 void drm_fb_xrgb8888_to_rgb332(struct iosys_map *dst, const unsigned int *dst_pitch,
 			       const struct iosys_map *src, const struct drm_framebuffer *fb,
-			       const struct drm_rect *clip)
+			       const struct drm_rect *clip, struct drm_format_conv_state *state)
 {
 	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
 		1,
 	};
 
-	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false,
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, state,
 		    drm_fb_xrgb8888_to_rgb332_line);
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb332);
@@ -457,6 +456,7 @@ static void drm_fb_xrgb8888_to_rgb565_swab_line(void *dbuf, const void *sbuf,
  * @src: Array of XRGB8888 source buffer
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
+ * @xfrm: Transform and conversion state
  * @swab: Swap bytes
  *
  * This function copies parts of a framebuffer to display memory and converts the
@@ -472,7 +472,8 @@ static void drm_fb_xrgb8888_to_rgb565_swab_line(void *dbuf, const void *sbuf,
  */
 void drm_fb_xrgb8888_to_rgb565(struct iosys_map *dst, const unsigned int *dst_pitch,
 			       const struct iosys_map *src, const struct drm_framebuffer *fb,
-			       const struct drm_rect *clip, bool swab)
+			       const struct drm_rect *clip, struct drm_format_conv_state *state,
+			       bool swab)
 {
 	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
 		2,
@@ -485,7 +486,7 @@ void drm_fb_xrgb8888_to_rgb565(struct iosys_map *dst, const unsigned int *dst_pi
 	else
 		xfrm_line = drm_fb_xrgb8888_to_rgb565_line;
 
-	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, xfrm_line);
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, state, xfrm_line);
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb565);
 
@@ -514,6 +515,7 @@ static void drm_fb_xrgb8888_to_xrgb1555_line(void *dbuf, const void *sbuf, unsig
  * @src: Array of XRGB8888 source buffer
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
+ * @xfrm: Transform and conversion state
  *
  * This function copies parts of a framebuffer to display memory and converts
  * the color format during the process. The parameters @dst, @dst_pitch and
@@ -529,13 +531,13 @@ static void drm_fb_xrgb8888_to_xrgb1555_line(void *dbuf, const void *sbuf, unsig
  */
 void drm_fb_xrgb8888_to_xrgb1555(struct iosys_map *dst, const unsigned int *dst_pitch,
 				 const struct iosys_map *src, const struct drm_framebuffer *fb,
-				 const struct drm_rect *clip)
+				 const struct drm_rect *clip, struct drm_format_conv_state *state)
 {
 	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
 		2,
 	};
 
-	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false,
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, state,
 		    drm_fb_xrgb8888_to_xrgb1555_line);
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_xrgb1555);
@@ -566,6 +568,7 @@ static void drm_fb_xrgb8888_to_argb1555_line(void *dbuf, const void *sbuf, unsig
  * @src: Array of XRGB8888 source buffer
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
+ * @xfrm: Transform and conversion state
  *
  * This function copies parts of a framebuffer to display memory and converts
  * the color format during the process. The parameters @dst, @dst_pitch and
@@ -581,13 +584,13 @@ static void drm_fb_xrgb8888_to_argb1555_line(void *dbuf, const void *sbuf, unsig
  */
 void drm_fb_xrgb8888_to_argb1555(struct iosys_map *dst, const unsigned int *dst_pitch,
 				 const struct iosys_map *src, const struct drm_framebuffer *fb,
-				 const struct drm_rect *clip)
+				 const struct drm_rect *clip, struct drm_format_conv_state *state)
 {
 	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
 		2,
 	};
 
-	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false,
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, state,
 		    drm_fb_xrgb8888_to_argb1555_line);
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_argb1555);
@@ -618,6 +621,7 @@ static void drm_fb_xrgb8888_to_rgba5551_line(void *dbuf, const void *sbuf, unsig
  * @src: Array of XRGB8888 source buffer
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
+ * @xfrm: Transform and conversion state
  *
  * This function copies parts of a framebuffer to display memory and converts
  * the color format during the process. The parameters @dst, @dst_pitch and
@@ -633,13 +637,13 @@ static void drm_fb_xrgb8888_to_rgba5551_line(void *dbuf, const void *sbuf, unsig
  */
 void drm_fb_xrgb8888_to_rgba5551(struct iosys_map *dst, const unsigned int *dst_pitch,
 				 const struct iosys_map *src, const struct drm_framebuffer *fb,
-				 const struct drm_rect *clip)
+				 const struct drm_rect *clip, struct drm_format_conv_state *state)
 {
 	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
 		2,
 	};
 
-	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false,
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, state,
 		    drm_fb_xrgb8888_to_rgba5551_line);
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgba5551);
@@ -668,6 +672,7 @@ static void drm_fb_xrgb8888_to_rgb888_line(void *dbuf, const void *sbuf, unsigne
  * @src: Array of XRGB8888 source buffers
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
+ * @xfrm: Transform and conversion state
  *
  * This function copies parts of a framebuffer to display memory and converts the
  * color format during the process. Destination and framebuffer formats must match. The
@@ -683,13 +688,13 @@ static void drm_fb_xrgb8888_to_rgb888_line(void *dbuf, const void *sbuf, unsigne
  */
 void drm_fb_xrgb8888_to_rgb888(struct iosys_map *dst, const unsigned int *dst_pitch,
 			       const struct iosys_map *src, const struct drm_framebuffer *fb,
-			       const struct drm_rect *clip)
+			       const struct drm_rect *clip, struct drm_format_conv_state *state)
 {
 	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
 		3,
 	};
 
-	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false,
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, state,
 		    drm_fb_xrgb8888_to_rgb888_line);
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb888);
@@ -716,6 +721,7 @@ static void drm_fb_xrgb8888_to_argb8888_line(void *dbuf, const void *sbuf, unsig
  * @src: Array of XRGB8888 source buffer
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
+ * @xfrm: Transform and conversion state
  *
  * This function copies parts of a framebuffer to display memory and converts the
  * color format during the process. The parameters @dst, @dst_pitch and @src refer
@@ -731,13 +737,13 @@ static void drm_fb_xrgb8888_to_argb8888_line(void *dbuf, const void *sbuf, unsig
  */
 void drm_fb_xrgb8888_to_argb8888(struct iosys_map *dst, const unsigned int *dst_pitch,
 				 const struct iosys_map *src, const struct drm_framebuffer *fb,
-				 const struct drm_rect *clip)
+				 const struct drm_rect *clip, struct drm_format_conv_state *state)
 {
 	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
 		4,
 	};
 
-	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false,
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, state,
 		    drm_fb_xrgb8888_to_argb8888_line);
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_argb8888);
@@ -762,13 +768,14 @@ static void drm_fb_xrgb8888_to_abgr8888_line(void *dbuf, const void *sbuf, unsig
 static void drm_fb_xrgb8888_to_abgr8888(struct iosys_map *dst, const unsigned int *dst_pitch,
 					const struct iosys_map *src,
 					const struct drm_framebuffer *fb,
-					const struct drm_rect *clip)
+					const struct drm_rect *clip,
+					struct drm_format_conv_state *state)
 {
 	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
 		4,
 	};
 
-	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false,
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, state,
 		    drm_fb_xrgb8888_to_abgr8888_line);
 }
 
@@ -792,13 +799,14 @@ static void drm_fb_xrgb8888_to_xbgr8888_line(void *dbuf, const void *sbuf, unsig
 static void drm_fb_xrgb8888_to_xbgr8888(struct iosys_map *dst, const unsigned int *dst_pitch,
 					const struct iosys_map *src,
 					const struct drm_framebuffer *fb,
-					const struct drm_rect *clip)
+					const struct drm_rect *clip,
+					struct drm_format_conv_state *state)
 {
 	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
 		4,
 	};
 
-	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false,
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, state,
 		    drm_fb_xrgb8888_to_xbgr8888_line);
 }
 
@@ -828,6 +836,7 @@ static void drm_fb_xrgb8888_to_xrgb2101010_line(void *dbuf, const void *sbuf, un
  * @src: Array of XRGB8888 source buffers
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
+ * @xfrm: Transform and conversion state
  *
  * This function copies parts of a framebuffer to display memory and converts the
  * color format during the process. Destination and framebuffer formats must match. The
@@ -843,13 +852,14 @@ static void drm_fb_xrgb8888_to_xrgb2101010_line(void *dbuf, const void *sbuf, un
  */
 void drm_fb_xrgb8888_to_xrgb2101010(struct iosys_map *dst, const unsigned int *dst_pitch,
 				    const struct iosys_map *src, const struct drm_framebuffer *fb,
-				    const struct drm_rect *clip)
+				    const struct drm_rect *clip,
+				    struct drm_format_conv_state *state)
 {
 	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
 		4,
 	};
 
-	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false,
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, state,
 		    drm_fb_xrgb8888_to_xrgb2101010_line);
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_xrgb2101010);
@@ -881,6 +891,7 @@ static void drm_fb_xrgb8888_to_argb2101010_line(void *dbuf, const void *sbuf, un
  * @src: Array of XRGB8888 source buffers
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
+ * @xfrm: Transform and conversion state
  *
  * This function copies parts of a framebuffer to display memory and converts
  * the color format during the process. The parameters @dst, @dst_pitch and
@@ -896,13 +907,14 @@ static void drm_fb_xrgb8888_to_argb2101010_line(void *dbuf, const void *sbuf, un
  */
 void drm_fb_xrgb8888_to_argb2101010(struct iosys_map *dst, const unsigned int *dst_pitch,
 				    const struct iosys_map *src, const struct drm_framebuffer *fb,
-				    const struct drm_rect *clip)
+				    const struct drm_rect *clip,
+				    struct drm_format_conv_state *state)
 {
 	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
 		4,
 	};
 
-	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false,
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, state,
 		    drm_fb_xrgb8888_to_argb2101010_line);
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_argb2101010);
@@ -932,6 +944,7 @@ static void drm_fb_xrgb8888_to_gray8_line(void *dbuf, const void *sbuf, unsigned
  * @src: Array of XRGB8888 source buffers
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
+ * @xfrm: Transform and conversion state
  *
  * This function copies parts of a framebuffer to display memory and converts the
  * color format during the process. Destination and framebuffer formats must match. The
@@ -951,13 +964,13 @@ static void drm_fb_xrgb8888_to_gray8_line(void *dbuf, const void *sbuf, unsigned
  */
 void drm_fb_xrgb8888_to_gray8(struct iosys_map *dst, const unsigned int *dst_pitch,
 			      const struct iosys_map *src, const struct drm_framebuffer *fb,
-			      const struct drm_rect *clip)
+			      const struct drm_rect *clip, struct drm_format_conv_state *state)
 {
 	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
 		1,
 	};
 
-	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false,
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, state,
 		    drm_fb_xrgb8888_to_gray8_line);
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_gray8);
@@ -971,6 +984,7 @@ EXPORT_SYMBOL(drm_fb_xrgb8888_to_gray8);
  * @src:	The framebuffer memory to copy from
  * @fb:		The framebuffer to copy from
  * @clip:	Clip rectangle area to copy
+ * @xfrm: Transform and conversion state
  *
  * This function copies parts of a framebuffer to display memory. If the
  * formats of the display and the framebuffer mismatch, the blit function
@@ -989,7 +1003,7 @@ EXPORT_SYMBOL(drm_fb_xrgb8888_to_gray8);
  */
 int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t dst_format,
 		const struct iosys_map *src, const struct drm_framebuffer *fb,
-		const struct drm_rect *clip)
+		const struct drm_rect *clip, struct drm_format_conv_state *state)
 {
 	uint32_t fb_format = fb->format->format;
 
@@ -997,44 +1011,44 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
 		drm_fb_memcpy(dst, dst_pitch, src, fb, clip);
 		return 0;
 	} else if (fb_format == (dst_format | DRM_FORMAT_BIG_ENDIAN)) {
-		drm_fb_swab(dst, dst_pitch, src, fb, clip, false);
+		drm_fb_swab(dst, dst_pitch, src, fb, clip, false, state);
 		return 0;
 	} else if (fb_format == (dst_format & ~DRM_FORMAT_BIG_ENDIAN)) {
-		drm_fb_swab(dst, dst_pitch, src, fb, clip, false);
+		drm_fb_swab(dst, dst_pitch, src, fb, clip, false, state);
 		return 0;
 	} else if (fb_format == DRM_FORMAT_XRGB8888) {
 		if (dst_format == DRM_FORMAT_RGB565) {
-			drm_fb_xrgb8888_to_rgb565(dst, dst_pitch, src, fb, clip, false);
+			drm_fb_xrgb8888_to_rgb565(dst, dst_pitch, src, fb, clip, state, false);
 			return 0;
 		} else if (dst_format == DRM_FORMAT_XRGB1555) {
-			drm_fb_xrgb8888_to_xrgb1555(dst, dst_pitch, src, fb, clip);
+			drm_fb_xrgb8888_to_xrgb1555(dst, dst_pitch, src, fb, clip, state);
 			return 0;
 		} else if (dst_format == DRM_FORMAT_ARGB1555) {
-			drm_fb_xrgb8888_to_argb1555(dst, dst_pitch, src, fb, clip);
+			drm_fb_xrgb8888_to_argb1555(dst, dst_pitch, src, fb, clip, state);
 			return 0;
 		} else if (dst_format == DRM_FORMAT_RGBA5551) {
-			drm_fb_xrgb8888_to_rgba5551(dst, dst_pitch, src, fb, clip);
+			drm_fb_xrgb8888_to_rgba5551(dst, dst_pitch, src, fb, clip, state);
 			return 0;
 		} else if (dst_format == DRM_FORMAT_RGB888) {
-			drm_fb_xrgb8888_to_rgb888(dst, dst_pitch, src, fb, clip);
+			drm_fb_xrgb8888_to_rgb888(dst, dst_pitch, src, fb, clip, state);
 			return 0;
 		} else if (dst_format == DRM_FORMAT_ARGB8888) {
-			drm_fb_xrgb8888_to_argb8888(dst, dst_pitch, src, fb, clip);
+			drm_fb_xrgb8888_to_argb8888(dst, dst_pitch, src, fb, clip, state);
 			return 0;
 		} else if (dst_format == DRM_FORMAT_XBGR8888) {
-			drm_fb_xrgb8888_to_xbgr8888(dst, dst_pitch, src, fb, clip);
+			drm_fb_xrgb8888_to_xbgr8888(dst, dst_pitch, src, fb, clip, state);
 			return 0;
 		} else if (dst_format == DRM_FORMAT_ABGR8888) {
-			drm_fb_xrgb8888_to_abgr8888(dst, dst_pitch, src, fb, clip);
+			drm_fb_xrgb8888_to_abgr8888(dst, dst_pitch, src, fb, clip, state);
 			return 0;
 		} else if (dst_format == DRM_FORMAT_XRGB2101010) {
-			drm_fb_xrgb8888_to_xrgb2101010(dst, dst_pitch, src, fb, clip);
+			drm_fb_xrgb8888_to_xrgb2101010(dst, dst_pitch, src, fb, clip, state);
 			return 0;
 		} else if (dst_format == DRM_FORMAT_ARGB2101010) {
-			drm_fb_xrgb8888_to_argb2101010(dst, dst_pitch, src, fb, clip);
+			drm_fb_xrgb8888_to_argb2101010(dst, dst_pitch, src, fb, clip, state);
 			return 0;
 		} else if (dst_format == DRM_FORMAT_BGRX8888) {
-			drm_fb_swab(dst, dst_pitch, src, fb, clip, false);
+			drm_fb_swab(dst, dst_pitch, src, fb, clip, false, state);
 			return 0;
 		}
 	}
@@ -1071,6 +1085,7 @@ static void drm_fb_gray8_to_mono_line(void *dbuf, const void *sbuf, unsigned int
  * @src: Array of XRGB8888 source buffers
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
+ * @xfrm: Transform and conversion state
  *
  * This function copies parts of a framebuffer to display memory and converts the
  * color format during the process. Destination and framebuffer formats must match. The
@@ -1095,7 +1110,7 @@ static void drm_fb_gray8_to_mono_line(void *dbuf, const void *sbuf, unsigned int
  */
 void drm_fb_xrgb8888_to_mono(struct iosys_map *dst, const unsigned int *dst_pitch,
 			     const struct iosys_map *src, const struct drm_framebuffer *fb,
-			     const struct drm_rect *clip)
+			     const struct drm_rect *clip, struct drm_format_conv_state *state)
 {
 	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
 		0, 0, 0, 0
@@ -1135,7 +1150,7 @@ void drm_fb_xrgb8888_to_mono(struct iosys_map *dst, const unsigned int *dst_pitc
 	 * Allocate a buffer to be used for both copying from the cma
 	 * memory and to store the intermediate grayscale line pixels.
 	 */
-	src32 = kmalloc(len_src32 + linepixels, GFP_KERNEL);
+	src32 = drm_format_conv_state_reserve(state, len_src32 + linepixels, GFP_KERNEL);
 	if (!src32)
 		return;
 
@@ -1149,8 +1164,6 @@ void drm_fb_xrgb8888_to_mono(struct iosys_map *dst, const unsigned int *dst_pitc
 		vaddr += fb->pitches[0];
 		mono += dst_pitch_0;
 	}
-
-	kfree(src32);
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_mono);
 
diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index e90f0bf895b33..daac649aabdbe 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -197,12 +197,14 @@ EXPORT_SYMBOL(mipi_dbi_command_stackbuf);
  * @fb: The source framebuffer
  * @clip: Clipping rectangle of the area to be copied
  * @swap: When true, swap MSB/LSB of 16-bit values
+ * @fmtcnv_state: Format-conversion state
  *
  * Returns:
  * Zero on success, negative error code on failure.
  */
 int mipi_dbi_buf_copy(void *dst, struct iosys_map *src, struct drm_framebuffer *fb,
-		      struct drm_rect *clip, bool swap)
+		      struct drm_rect *clip, bool swap,
+		      struct drm_format_conv_state *fmtcnv_state)
 {
 	struct drm_gem_object *gem = drm_gem_fb_get_obj(fb, 0);
 	struct iosys_map dst_map = IOSYS_MAP_INIT_VADDR(dst);
@@ -215,12 +217,13 @@ int mipi_dbi_buf_copy(void *dst, struct iosys_map *src, struct drm_framebuffer *
 	switch (fb->format->format) {
 	case DRM_FORMAT_RGB565:
 		if (swap)
-			drm_fb_swab(&dst_map, NULL, src, fb, clip, !gem->import_attach);
+			drm_fb_swab(&dst_map, NULL, src, fb, clip, !gem->import_attach,
+				    fmtcnv_state);
 		else
 			drm_fb_memcpy(&dst_map, NULL, src, fb, clip);
 		break;
 	case DRM_FORMAT_XRGB8888:
-		drm_fb_xrgb8888_to_rgb565(&dst_map, NULL, src, fb, clip, swap);
+		drm_fb_xrgb8888_to_rgb565(&dst_map, NULL, src, fb, clip, fmtcnv_state, swap);
 		break;
 	default:
 		drm_err_once(fb->dev, "Format is not supported: %p4cc\n",
@@ -252,7 +255,7 @@ static void mipi_dbi_set_window_address(struct mipi_dbi_dev *dbidev,
 }
 
 static void mipi_dbi_fb_dirty(struct iosys_map *src, struct drm_framebuffer *fb,
-			      struct drm_rect *rect)
+			      struct drm_rect *rect, struct drm_format_conv_state *fmtcnv_state)
 {
 	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(fb->dev);
 	unsigned int height = rect->y2 - rect->y1;
@@ -270,7 +273,7 @@ static void mipi_dbi_fb_dirty(struct iosys_map *src, struct drm_framebuffer *fb,
 	if (!dbi->dc || !full || swap ||
 	    fb->format->format == DRM_FORMAT_XRGB8888) {
 		tr = dbidev->tx_buf;
-		ret = mipi_dbi_buf_copy(tr, src, fb, rect, swap);
+		ret = mipi_dbi_buf_copy(tr, src, fb, rect, swap, fmtcnv_state);
 		if (ret)
 			goto err_msg;
 	} else {
@@ -332,7 +335,8 @@ void mipi_dbi_pipe_update(struct drm_simple_display_pipe *pipe,
 		return;
 
 	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
-		mipi_dbi_fb_dirty(&shadow_plane_state->data[0], fb, &rect);
+		mipi_dbi_fb_dirty(&shadow_plane_state->data[0], fb, &rect,
+				  &shadow_plane_state->fmtcnv_state);
 
 	drm_dev_exit(idx);
 }
@@ -368,7 +372,8 @@ void mipi_dbi_enable_flush(struct mipi_dbi_dev *dbidev,
 	if (!drm_dev_enter(&dbidev->drm, &idx))
 		return;
 
-	mipi_dbi_fb_dirty(&shadow_plane_state->data[0], fb, &rect);
+	mipi_dbi_fb_dirty(&shadow_plane_state->data[0], fb, &rect,
+			  &shadow_plane_state->fmtcnv_state);
 	backlight_enable(dbidev->backlight);
 
 	drm_dev_exit(idx);
diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index d2f199ea3c111..28171de84718e 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -51,7 +51,8 @@ static bool gud_is_big_endian(void)
 
 static size_t gud_xrgb8888_to_r124(u8 *dst, const struct drm_format_info *format,
 				   void *src, struct drm_framebuffer *fb,
-				   struct drm_rect *rect)
+				   struct drm_rect *rect,
+				   struct drm_format_conv_state *fmtcnv_state)
 {
 	unsigned int block_width = drm_format_info_block_width(format, 0);
 	unsigned int bits_per_pixel = 8 / block_width;
@@ -75,7 +76,7 @@ static size_t gud_xrgb8888_to_r124(u8 *dst, const struct drm_format_info *format
 
 	iosys_map_set_vaddr(&dst_map, buf);
 	iosys_map_set_vaddr(&vmap, src);
-	drm_fb_xrgb8888_to_gray8(&dst_map, NULL, &vmap, fb, rect);
+	drm_fb_xrgb8888_to_gray8(&dst_map, NULL, &vmap, fb, rect, fmtcnv_state);
 	pix8 = buf;
 
 	for (y = 0; y < height; y++) {
@@ -152,7 +153,8 @@ static size_t gud_xrgb8888_to_color(u8 *dst, const struct drm_format_info *forma
 static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
 			  const struct iosys_map *src, bool cached_reads,
 			  const struct drm_format_info *format, struct drm_rect *rect,
-			  struct gud_set_buffer_req *req)
+			  struct gud_set_buffer_req *req,
+			  struct drm_format_conv_state *fmtcnv_state)
 {
 	u8 compression = gdrm->compression;
 	struct iosys_map dst;
@@ -178,23 +180,23 @@ static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
 	 */
 	if (format != fb->format) {
 		if (format->format == GUD_DRM_FORMAT_R1) {
-			len = gud_xrgb8888_to_r124(buf, format, vaddr, fb, rect);
+			len = gud_xrgb8888_to_r124(buf, format, vaddr, fb, rect, fmtcnv_state);
 			if (!len)
 				return -ENOMEM;
 		} else if (format->format == DRM_FORMAT_R8) {
-			drm_fb_xrgb8888_to_gray8(&dst, NULL, src, fb, rect);
+			drm_fb_xrgb8888_to_gray8(&dst, NULL, src, fb, rect, fmtcnv_state);
 		} else if (format->format == DRM_FORMAT_RGB332) {
-			drm_fb_xrgb8888_to_rgb332(&dst, NULL, src, fb, rect);
+			drm_fb_xrgb8888_to_rgb332(&dst, NULL, src, fb, rect, fmtcnv_state);
 		} else if (format->format == DRM_FORMAT_RGB565) {
-			drm_fb_xrgb8888_to_rgb565(&dst, NULL, src, fb, rect,
+			drm_fb_xrgb8888_to_rgb565(&dst, NULL, src, fb, rect, fmtcnv_state,
 						  gud_is_big_endian());
 		} else if (format->format == DRM_FORMAT_RGB888) {
-			drm_fb_xrgb8888_to_rgb888(&dst, NULL, src, fb, rect);
+			drm_fb_xrgb8888_to_rgb888(&dst, NULL, src, fb, rect, fmtcnv_state);
 		} else {
 			len = gud_xrgb8888_to_color(buf, format, vaddr, fb, rect);
 		}
 	} else if (gud_is_big_endian() && format->cpp[0] > 1) {
-		drm_fb_swab(&dst, NULL, src, fb, rect, cached_reads);
+		drm_fb_swab(&dst, NULL, src, fb, rect, cached_reads, fmtcnv_state);
 	} else if (compression && cached_reads && pitch == fb->pitches[0]) {
 		/* can compress directly from the framebuffer */
 		buf = vaddr + rect->y1 * pitch;
@@ -266,7 +268,8 @@ static int gud_usb_bulk(struct gud_device *gdrm, size_t len)
 
 static int gud_flush_rect(struct gud_device *gdrm, struct drm_framebuffer *fb,
 			  const struct iosys_map *src, bool cached_reads,
-			  const struct drm_format_info *format, struct drm_rect *rect)
+			  const struct drm_format_info *format, struct drm_rect *rect,
+			  struct drm_format_conv_state *fmtcnv_state)
 {
 	struct gud_set_buffer_req req;
 	size_t len, trlen;
@@ -274,7 +277,7 @@ static int gud_flush_rect(struct gud_device *gdrm, struct drm_framebuffer *fb,
 
 	drm_dbg(&gdrm->drm, "Flushing [FB:%d] " DRM_RECT_FMT "\n", fb->base.id, DRM_RECT_ARG(rect));
 
-	ret = gud_prep_flush(gdrm, fb, src, cached_reads, format, rect, &req);
+	ret = gud_prep_flush(gdrm, fb, src, cached_reads, format, rect, &req, fmtcnv_state);
 	if (ret)
 		return ret;
 
@@ -318,6 +321,7 @@ static void gud_flush_damage(struct gud_device *gdrm, struct drm_framebuffer *fb
 			     const struct iosys_map *src, bool cached_reads,
 			     struct drm_rect *damage)
 {
+	struct drm_format_conv_state fmtcnv_state = DRM_FORMAT_CONV_STATE_INIT;
 	const struct drm_format_info *format;
 	unsigned int i, lines;
 	size_t pitch;
@@ -340,7 +344,7 @@ static void gud_flush_damage(struct gud_device *gdrm, struct drm_framebuffer *fb
 		rect.y1 += i * lines;
 		rect.y2 = min_t(u32, rect.y1 + lines, damage->y2);
 
-		ret = gud_flush_rect(gdrm, fb, src, cached_reads, format, &rect);
+		ret = gud_flush_rect(gdrm, fb, src, cached_reads, format, &rect, &fmtcnv_state);
 		if (ret) {
 			if (ret != -ENODEV && ret != -ECONNRESET &&
 			    ret != -ESHUTDOWN && ret != -EPROTO)
@@ -350,6 +354,8 @@ static void gud_flush_damage(struct gud_device *gdrm, struct drm_framebuffer *fb
 			break;
 		}
 	}
+
+	drm_format_conv_state_release(&fmtcnv_state);
 }
 
 void gud_flush_work(struct work_struct *work)
diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 6dcf3e0411136..3dd8e8a444b6f 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -602,7 +602,8 @@ static void ssd130x_clear_screen(struct ssd130x_device *ssd130x, u8 *data_array)
 static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb,
 				const struct iosys_map *vmap,
 				struct drm_rect *rect,
-				u8 *buf, u8 *data_array)
+				u8 *buf, u8 *data_array,
+				struct drm_format_conv_state *fmtcnv_state)
 {
 	struct ssd130x_device *ssd130x = drm_to_ssd130x(fb->dev);
 	unsigned int page_height = ssd130x->device_info->page_height;
@@ -621,7 +622,7 @@ static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb,
 		return ret;
 
 	iosys_map_set_vaddr(&dst, buf);
-	drm_fb_xrgb8888_to_mono(&dst, &dst_pitch, vmap, fb, rect);
+	drm_fb_xrgb8888_to_mono(&dst, &dst_pitch, vmap, fb, rect, fmtcnv_state);
 
 	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
 
@@ -695,7 +696,8 @@ static void ssd130x_primary_plane_atomic_update(struct drm_plane *plane,
 
 		ssd130x_fb_blit_rect(fb, &shadow_plane_state->data[0], &dst_clip,
 				     ssd130x_plane_state->buffer,
-				     ssd130x_crtc_state->data_array);
+				     ssd130x_crtc_state->data_array,
+				     &shadow_plane_state->fmtcnv_state);
 	}
 
 	drm_dev_exit(idx);
diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index f6408e56f7861..08992636ec05f 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -20,6 +20,10 @@
 
 #define TEST_USE_DEFAULT_PITCH 0
 
+static unsigned char fmtcnv_state_mem[PAGE_SIZE];
+static struct drm_format_conv_state fmtcnv_state =
+	DRM_FORMAT_CONV_STATE_INIT_PREALLOCATED(fmtcnv_state_mem, sizeof(fmtcnv_state_mem));
+
 struct convert_to_gray8_result {
 	unsigned int dst_pitch;
 	const u8 expected[TEST_BUF_SIZE];
@@ -630,8 +634,7 @@ static void drm_test_fb_xrgb8888_to_gray8(struct kunit *test)
 	const unsigned int *dst_pitch = (result->dst_pitch == TEST_USE_DEFAULT_PITCH) ?
 		NULL : &result->dst_pitch;
 
-	drm_fb_xrgb8888_to_gray8(&dst, dst_pitch, &src, &fb, &params->clip);
-
+	drm_fb_xrgb8888_to_gray8(&dst, dst_pitch, &src, &fb, &params->clip, &fmtcnv_state);
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
 
@@ -664,7 +667,7 @@ static void drm_test_fb_xrgb8888_to_rgb332(struct kunit *test)
 	const unsigned int *dst_pitch = (result->dst_pitch == TEST_USE_DEFAULT_PITCH) ?
 		NULL : &result->dst_pitch;
 
-	drm_fb_xrgb8888_to_rgb332(&dst, dst_pitch, &src, &fb, &params->clip);
+	drm_fb_xrgb8888_to_rgb332(&dst, dst_pitch, &src, &fb, &params->clip, &fmtcnv_state);
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
 
@@ -697,12 +700,14 @@ static void drm_test_fb_xrgb8888_to_rgb565(struct kunit *test)
 	const unsigned int *dst_pitch = (result->dst_pitch == TEST_USE_DEFAULT_PITCH) ?
 		NULL : &result->dst_pitch;
 
-	drm_fb_xrgb8888_to_rgb565(&dst, dst_pitch, &src, &fb, &params->clip, false);
+	drm_fb_xrgb8888_to_rgb565(&dst, dst_pitch, &src, &fb, &params->clip,
+				  &fmtcnv_state, false);
 	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 
 	buf = dst.vaddr; /* restore original value of buf */
-	drm_fb_xrgb8888_to_rgb565(&dst, &result->dst_pitch, &src, &fb, &params->clip, true);
+	drm_fb_xrgb8888_to_rgb565(&dst, &result->dst_pitch, &src, &fb, &params->clip,
+				  &fmtcnv_state, true);
 	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected_swab, dst_size);
 
@@ -711,7 +716,8 @@ static void drm_test_fb_xrgb8888_to_rgb565(struct kunit *test)
 
 	int blit_result = 0;
 
-	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_RGB565, &src, &fb, &params->clip);
+	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_RGB565, &src, &fb, &params->clip,
+				  &fmtcnv_state);
 
 	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
 
@@ -748,7 +754,7 @@ static void drm_test_fb_xrgb8888_to_xrgb1555(struct kunit *test)
 	const unsigned int *dst_pitch = (result->dst_pitch == TEST_USE_DEFAULT_PITCH) ?
 		NULL : &result->dst_pitch;
 
-	drm_fb_xrgb8888_to_xrgb1555(&dst, dst_pitch, &src, &fb, &params->clip);
+	drm_fb_xrgb8888_to_xrgb1555(&dst, dst_pitch, &src, &fb, &params->clip, &fmtcnv_state);
 	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 
@@ -757,7 +763,8 @@ static void drm_test_fb_xrgb8888_to_xrgb1555(struct kunit *test)
 
 	int blit_result = 0;
 
-	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_XRGB1555, &src, &fb, &params->clip);
+	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_XRGB1555, &src, &fb, &params->clip,
+				  &fmtcnv_state);
 
 	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
 
@@ -794,7 +801,7 @@ static void drm_test_fb_xrgb8888_to_argb1555(struct kunit *test)
 	const unsigned int *dst_pitch = (result->dst_pitch == TEST_USE_DEFAULT_PITCH) ?
 		NULL : &result->dst_pitch;
 
-	drm_fb_xrgb8888_to_argb1555(&dst, dst_pitch, &src, &fb, &params->clip);
+	drm_fb_xrgb8888_to_argb1555(&dst, dst_pitch, &src, &fb, &params->clip, &fmtcnv_state);
 	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 
@@ -803,7 +810,8 @@ static void drm_test_fb_xrgb8888_to_argb1555(struct kunit *test)
 
 	int blit_result = 0;
 
-	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_ARGB1555, &src, &fb, &params->clip);
+	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_ARGB1555, &src, &fb, &params->clip,
+				  &fmtcnv_state);
 
 	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
 
@@ -840,7 +848,7 @@ static void drm_test_fb_xrgb8888_to_rgba5551(struct kunit *test)
 	const unsigned int *dst_pitch = (result->dst_pitch == TEST_USE_DEFAULT_PITCH) ?
 		NULL : &result->dst_pitch;
 
-	drm_fb_xrgb8888_to_rgba5551(&dst, dst_pitch, &src, &fb, &params->clip);
+	drm_fb_xrgb8888_to_rgba5551(&dst, dst_pitch, &src, &fb, &params->clip, &fmtcnv_state);
 	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 
@@ -849,7 +857,8 @@ static void drm_test_fb_xrgb8888_to_rgba5551(struct kunit *test)
 
 	int blit_result = 0;
 
-	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_RGBA5551, &src, &fb, &params->clip);
+	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_RGBA5551, &src, &fb, &params->clip,
+				  &fmtcnv_state);
 
 	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
 
@@ -890,7 +899,7 @@ static void drm_test_fb_xrgb8888_to_rgb888(struct kunit *test)
 	const unsigned int *dst_pitch = (result->dst_pitch == TEST_USE_DEFAULT_PITCH) ?
 		NULL : &result->dst_pitch;
 
-	drm_fb_xrgb8888_to_rgb888(&dst, dst_pitch, &src, &fb, &params->clip);
+	drm_fb_xrgb8888_to_rgb888(&dst, dst_pitch, &src, &fb, &params->clip, &fmtcnv_state);
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 
 	buf = dst.vaddr; /* restore original value of buf */
@@ -898,7 +907,8 @@ static void drm_test_fb_xrgb8888_to_rgb888(struct kunit *test)
 
 	int blit_result = 0;
 
-	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_RGB888, &src, &fb, &params->clip);
+	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_RGB888, &src, &fb, &params->clip,
+				  &fmtcnv_state);
 
 	KUNIT_EXPECT_FALSE(test, blit_result);
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
@@ -933,7 +943,7 @@ static void drm_test_fb_xrgb8888_to_argb8888(struct kunit *test)
 	const unsigned int *dst_pitch = (result->dst_pitch == TEST_USE_DEFAULT_PITCH) ?
 		NULL : &result->dst_pitch;
 
-	drm_fb_xrgb8888_to_argb8888(&dst, dst_pitch, &src, &fb, &params->clip);
+	drm_fb_xrgb8888_to_argb8888(&dst, dst_pitch, &src, &fb, &params->clip, &fmtcnv_state);
 	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 
@@ -942,7 +952,8 @@ static void drm_test_fb_xrgb8888_to_argb8888(struct kunit *test)
 
 	int blit_result = 0;
 
-	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_ARGB8888, &src, &fb, &params->clip);
+	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_ARGB8888, &src, &fb, &params->clip,
+				  &fmtcnv_state);
 
 	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
 
@@ -979,7 +990,7 @@ static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
 	const unsigned int *dst_pitch = (result->dst_pitch == TEST_USE_DEFAULT_PITCH) ?
 		NULL : &result->dst_pitch;
 
-	drm_fb_xrgb8888_to_xrgb2101010(&dst, dst_pitch, &src, &fb, &params->clip);
+	drm_fb_xrgb8888_to_xrgb2101010(&dst, dst_pitch, &src, &fb, &params->clip, &fmtcnv_state);
 	buf = le32buf_to_cpu(test, buf, dst_size / sizeof(u32));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 
@@ -989,7 +1000,7 @@ static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
 	int blit_result = 0;
 
 	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_XRGB2101010, &src, &fb,
-				  &params->clip);
+				  &params->clip, &fmtcnv_state);
 
 	KUNIT_EXPECT_FALSE(test, blit_result);
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
@@ -1024,7 +1035,7 @@ static void drm_test_fb_xrgb8888_to_argb2101010(struct kunit *test)
 	const unsigned int *dst_pitch = (result->dst_pitch == TEST_USE_DEFAULT_PITCH) ?
 		NULL : &result->dst_pitch;
 
-	drm_fb_xrgb8888_to_argb2101010(&dst, dst_pitch, &src, &fb, &params->clip);
+	drm_fb_xrgb8888_to_argb2101010(&dst, dst_pitch, &src, &fb, &params->clip, &fmtcnv_state);
 	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 
@@ -1034,7 +1045,7 @@ static void drm_test_fb_xrgb8888_to_argb2101010(struct kunit *test)
 	int blit_result = 0;
 
 	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_ARGB2101010, &src, &fb,
-				  &params->clip);
+				  &params->clip, &fmtcnv_state);
 
 	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
 
@@ -1071,7 +1082,7 @@ static void drm_test_fb_xrgb8888_to_mono(struct kunit *test)
 	const unsigned int *dst_pitch = (result->dst_pitch == TEST_USE_DEFAULT_PITCH) ?
 		NULL : &result->dst_pitch;
 
-	drm_fb_xrgb8888_to_mono(&dst, dst_pitch, &src, &fb, &params->clip);
+	drm_fb_xrgb8888_to_mono(&dst, dst_pitch, &src, &fb, &params->clip, &fmtcnv_state);
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
 
@@ -1104,7 +1115,7 @@ static void drm_test_fb_swab(struct kunit *test)
 	const unsigned int *dst_pitch = (result->dst_pitch == TEST_USE_DEFAULT_PITCH) ?
 		NULL : &result->dst_pitch;
 
-	drm_fb_swab(&dst, dst_pitch, &src, &fb, &params->clip, false);
+	drm_fb_swab(&dst, dst_pitch, &src, &fb, &params->clip, false, &fmtcnv_state);
 	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 
@@ -1114,7 +1125,7 @@ static void drm_test_fb_swab(struct kunit *test)
 	int blit_result;
 
 	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_XRGB8888 | DRM_FORMAT_BIG_ENDIAN,
-				  &src, &fb, &params->clip);
+				  &src, &fb, &params->clip, &fmtcnv_state);
 	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
 
 	KUNIT_EXPECT_FALSE(test, blit_result);
@@ -1123,7 +1134,8 @@ static void drm_test_fb_swab(struct kunit *test)
 	buf = dst.vaddr;
 	memset(buf, 0, dst_size);
 
-	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_BGRX8888, &src, &fb, &params->clip);
+	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_BGRX8888, &src, &fb, &params->clip,
+				  &fmtcnv_state);
 	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
 
 	KUNIT_EXPECT_FALSE(test, blit_result);
@@ -1137,7 +1149,8 @@ static void drm_test_fb_swab(struct kunit *test)
 	mock_format.format |= DRM_FORMAT_BIG_ENDIAN;
 	fb.format = &mock_format;
 
-	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_XRGB8888, &src, &fb, &params->clip);
+	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_XRGB8888, &src, &fb, &params->clip,
+				  &fmtcnv_state);
 	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
 
 	KUNIT_EXPECT_FALSE(test, blit_result);
@@ -1175,7 +1188,8 @@ static void drm_test_fb_xrgb8888_to_abgr8888(struct kunit *test)
 
 	int blit_result = 0;
 
-	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_ABGR8888, &src, &fb, &params->clip);
+	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_ABGR8888, &src, &fb, &params->clip,
+				  &fmtcnv_state);
 
 	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
 
@@ -1214,7 +1228,8 @@ static void drm_test_fb_xrgb8888_to_xbgr8888(struct kunit *test)
 
 	int blit_result = 0;
 
-	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_XBGR8888, &src, &fb, &params->clip);
+	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_XBGR8888, &src, &fb, &params->clip,
+				  &fmtcnv_state);
 
 	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
 
@@ -1817,7 +1832,8 @@ static void drm_test_fb_memcpy(struct kunit *test)
 
 	int blit_result;
 
-	blit_result = drm_fb_blit(dst, dst_pitches, params->format, src, &fb, &params->clip);
+	blit_result = drm_fb_blit(dst, dst_pitches, params->format, src, &fb, &params->clip,
+				  &fmtcnv_state);
 
 	KUNIT_EXPECT_FALSE(test, blit_result);
 	for (size_t i = 0; i < fb.format->num_planes; i++) {
diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index c5c34cd2edc1f..4e3a152f897ac 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -411,7 +411,8 @@ static void cirrus_primary_plane_helper_atomic_update(struct drm_plane *plane,
 		unsigned int offset = drm_fb_clip_offset(pitch, format, &damage);
 		struct iosys_map dst = IOSYS_MAP_INIT_OFFSET(&vaddr, offset);
 
-		drm_fb_blit(&dst, &pitch, format->format, shadow_plane_state->data, fb, &damage);
+		drm_fb_blit(&dst, &pitch, format->format, shadow_plane_state->data, fb,
+			    &damage, &shadow_plane_state->fmtcnv_state);
 	}
 
 	drm_dev_exit(idx);
diff --git a/drivers/gpu/drm/tiny/ili9225.c b/drivers/gpu/drm/tiny/ili9225.c
index 4ceb68ffac4be..dd8b0a181be94 100644
--- a/drivers/gpu/drm/tiny/ili9225.c
+++ b/drivers/gpu/drm/tiny/ili9225.c
@@ -78,7 +78,7 @@ static inline int ili9225_command(struct mipi_dbi *dbi, u8 cmd, u16 data)
 }
 
 static void ili9225_fb_dirty(struct iosys_map *src, struct drm_framebuffer *fb,
-			     struct drm_rect *rect)
+			     struct drm_rect *rect, struct drm_format_conv_state *fmtcnv_state)
 {
 	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(fb->dev);
 	unsigned int height = rect->y2 - rect->y1;
@@ -98,7 +98,7 @@ static void ili9225_fb_dirty(struct iosys_map *src, struct drm_framebuffer *fb,
 	if (!dbi->dc || !full || swap ||
 	    fb->format->format == DRM_FORMAT_XRGB8888) {
 		tr = dbidev->tx_buf;
-		ret = mipi_dbi_buf_copy(tr, src, fb, rect, swap);
+		ret = mipi_dbi_buf_copy(tr, src, fb, rect, swap, fmtcnv_state);
 		if (ret)
 			goto err_msg;
 	} else {
@@ -171,7 +171,8 @@ static void ili9225_pipe_update(struct drm_simple_display_pipe *pipe,
 		return;
 
 	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
-		ili9225_fb_dirty(&shadow_plane_state->data[0], fb, &rect);
+		ili9225_fb_dirty(&shadow_plane_state->data[0], fb, &rect,
+				 &shadow_plane_state->fmtcnv_state);
 
 	drm_dev_exit(idx);
 }
@@ -281,7 +282,8 @@ static void ili9225_pipe_enable(struct drm_simple_display_pipe *pipe,
 
 	ili9225_command(dbi, ILI9225_DISPLAY_CONTROL_1, 0x1017);
 
-	ili9225_fb_dirty(&shadow_plane_state->data[0], fb, &rect);
+	ili9225_fb_dirty(&shadow_plane_state->data[0], fb, &rect,
+			 &shadow_plane_state->fmtcnv_state);
 
 out_exit:
 	drm_dev_exit(idx);
diff --git a/drivers/gpu/drm/tiny/ofdrm.c b/drivers/gpu/drm/tiny/ofdrm.c
index 2d999a0facdee..404c83032cecc 100644
--- a/drivers/gpu/drm/tiny/ofdrm.c
+++ b/drivers/gpu/drm/tiny/ofdrm.c
@@ -817,7 +817,7 @@ static void ofdrm_primary_plane_helper_atomic_update(struct drm_plane *plane,
 
 		iosys_map_incr(&dst, drm_fb_clip_offset(dst_pitch, dst_format, &dst_clip));
 		drm_fb_blit(&dst, &dst_pitch, dst_format->format, shadow_plane_state->data, fb,
-			    &damage);
+			    &damage, &shadow_plane_state->fmtcnv_state);
 	}
 
 	drm_dev_exit(idx);
diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
index 73dd4f4289c20..826fb20dbbf0d 100644
--- a/drivers/gpu/drm/tiny/repaper.c
+++ b/drivers/gpu/drm/tiny/repaper.c
@@ -509,7 +509,8 @@ static void repaper_get_temperature(struct repaper_epd *epd)
 	epd->factored_stage_time = epd->stage_time * factor10x / 10;
 }
 
-static int repaper_fb_dirty(struct drm_framebuffer *fb)
+static int repaper_fb_dirty(struct drm_framebuffer *fb,
+			    struct drm_format_conv_state *fmtcnv_state)
 {
 	struct drm_gem_dma_object *dma_obj = drm_fb_dma_get_gem_obj(fb, 0);
 	struct repaper_epd *epd = drm_to_epd(fb->dev);
@@ -545,7 +546,7 @@ static int repaper_fb_dirty(struct drm_framebuffer *fb)
 
 	iosys_map_set_vaddr(&dst, buf);
 	iosys_map_set_vaddr(&vmap, dma_obj->vaddr);
-	drm_fb_xrgb8888_to_mono(&dst, &dst_pitch, &vmap, fb, &clip);
+	drm_fb_xrgb8888_to_mono(&dst, &dst_pitch, &vmap, fb, &clip, fmtcnv_state);
 
 	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
 
@@ -830,13 +831,14 @@ static void repaper_pipe_update(struct drm_simple_display_pipe *pipe,
 				struct drm_plane_state *old_state)
 {
 	struct drm_plane_state *state = pipe->plane.state;
+	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(state);
 	struct drm_rect rect;
 
 	if (!pipe->crtc.state->active)
 		return;
 
 	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
-		repaper_fb_dirty(state->fb);
+		repaper_fb_dirty(state->fb, &shadow_plane_state->fmtcnv_state);
 }
 
 static const struct drm_simple_display_pipe_funcs repaper_pipe_funcs = {
diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 9c597461d1e2a..6788f465995b3 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -609,7 +609,7 @@ static void simpledrm_primary_plane_helper_atomic_update(struct drm_plane *plane
 
 		iosys_map_incr(&dst, drm_fb_clip_offset(sdev->pitch, sdev->format, &dst_clip));
 		drm_fb_blit(&dst, &sdev->pitch, sdev->format->format, shadow_plane_state->data,
-			    fb, &damage);
+			    fb, &damage, &shadow_plane_state->fmtcnv_state);
 	}
 
 	drm_dev_exit(idx);
diff --git a/drivers/gpu/drm/tiny/st7586.c b/drivers/gpu/drm/tiny/st7586.c
index 3cf4eec16a813..7336fa1ddaed1 100644
--- a/drivers/gpu/drm/tiny/st7586.c
+++ b/drivers/gpu/drm/tiny/st7586.c
@@ -64,7 +64,8 @@ static const u8 st7586_lookup[] = { 0x7, 0x4, 0x2, 0x0 };
 
 static void st7586_xrgb8888_to_gray332(u8 *dst, void *vaddr,
 				       struct drm_framebuffer *fb,
-				       struct drm_rect *clip)
+				       struct drm_rect *clip,
+				       struct drm_format_conv_state *fmtcnv_state)
 {
 	size_t len = (clip->x2 - clip->x1) * (clip->y2 - clip->y1);
 	unsigned int x, y;
@@ -77,7 +78,7 @@ static void st7586_xrgb8888_to_gray332(u8 *dst, void *vaddr,
 
 	iosys_map_set_vaddr(&dst_map, buf);
 	iosys_map_set_vaddr(&vmap, vaddr);
-	drm_fb_xrgb8888_to_gray8(&dst_map, NULL, &vmap, fb, clip);
+	drm_fb_xrgb8888_to_gray8(&dst_map, NULL, &vmap, fb, clip, fmtcnv_state);
 	src = buf;
 
 	for (y = clip->y1; y < clip->y2; y++) {
@@ -93,7 +94,7 @@ static void st7586_xrgb8888_to_gray332(u8 *dst, void *vaddr,
 }
 
 static int st7586_buf_copy(void *dst, struct iosys_map *src, struct drm_framebuffer *fb,
-			   struct drm_rect *clip)
+			   struct drm_rect *clip, struct drm_format_conv_state *fmtcnv_state)
 {
 	int ret;
 
@@ -101,7 +102,7 @@ static int st7586_buf_copy(void *dst, struct iosys_map *src, struct drm_framebuf
 	if (ret)
 		return ret;
 
-	st7586_xrgb8888_to_gray332(dst, src->vaddr, fb, clip);
+	st7586_xrgb8888_to_gray332(dst, src->vaddr, fb, clip, fmtcnv_state);
 
 	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
 
@@ -109,7 +110,7 @@ static int st7586_buf_copy(void *dst, struct iosys_map *src, struct drm_framebuf
 }
 
 static void st7586_fb_dirty(struct iosys_map *src, struct drm_framebuffer *fb,
-			    struct drm_rect *rect)
+			    struct drm_rect *rect, struct drm_format_conv_state *fmtcnv_state)
 {
 	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(fb->dev);
 	struct mipi_dbi *dbi = &dbidev->dbi;
@@ -121,7 +122,7 @@ static void st7586_fb_dirty(struct iosys_map *src, struct drm_framebuffer *fb,
 
 	DRM_DEBUG_KMS("Flushing [FB:%d] " DRM_RECT_FMT "\n", fb->base.id, DRM_RECT_ARG(rect));
 
-	ret = st7586_buf_copy(dbidev->tx_buf, src, fb, rect);
+	ret = st7586_buf_copy(dbidev->tx_buf, src, fb, rect, fmtcnv_state);
 	if (ret)
 		goto err_msg;
 
@@ -160,7 +161,8 @@ static void st7586_pipe_update(struct drm_simple_display_pipe *pipe,
 		return;
 
 	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
-		st7586_fb_dirty(&shadow_plane_state->data[0], fb, &rect);
+		st7586_fb_dirty(&shadow_plane_state->data[0], fb, &rect,
+				&shadow_plane_state->fmtcnv_state);
 
 	drm_dev_exit(idx);
 }
@@ -238,7 +240,8 @@ static void st7586_pipe_enable(struct drm_simple_display_pipe *pipe,
 
 	msleep(100);
 
-	st7586_fb_dirty(&shadow_plane_state->data[0], fb, &rect);
+	st7586_fb_dirty(&shadow_plane_state->data[0], fb, &rect,
+			&shadow_plane_state->fmtcnv_state);
 
 	mipi_dbi_command(dbi, MIPI_DCS_SET_DISPLAY_ON);
 out_exit:
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index 724a9baf7315d..f13b34e0b752b 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -74,45 +74,49 @@ void drm_fb_memcpy(struct iosys_map *dst, const unsigned int *dst_pitch,
 		   const struct drm_rect *clip);
 void drm_fb_swab(struct iosys_map *dst, const unsigned int *dst_pitch,
 		 const struct iosys_map *src, const struct drm_framebuffer *fb,
-		 const struct drm_rect *clip, bool cached);
+		 const struct drm_rect *clip, bool cached,
+		 struct drm_format_conv_state *state);
 void drm_fb_xrgb8888_to_rgb332(struct iosys_map *dst, const unsigned int *dst_pitch,
 			       const struct iosys_map *src, const struct drm_framebuffer *fb,
-			       const struct drm_rect *clip);
+			       const struct drm_rect *clip, struct drm_format_conv_state *state);
 void drm_fb_xrgb8888_to_rgb565(struct iosys_map *dst, const unsigned int *dst_pitch,
 			       const struct iosys_map *src, const struct drm_framebuffer *fb,
-			       const struct drm_rect *clip, bool swab);
+			       const struct drm_rect *clip, struct drm_format_conv_state *state,
+			       bool swab);
 void drm_fb_xrgb8888_to_xrgb1555(struct iosys_map *dst, const unsigned int *dst_pitch,
 				 const struct iosys_map *src, const struct drm_framebuffer *fb,
-				 const struct drm_rect *clip);
+				 const struct drm_rect *clip, struct drm_format_conv_state *state);
 void drm_fb_xrgb8888_to_argb1555(struct iosys_map *dst, const unsigned int *dst_pitch,
 				 const struct iosys_map *src, const struct drm_framebuffer *fb,
-				 const struct drm_rect *clip);
+				 const struct drm_rect *clip, struct drm_format_conv_state *state);
 void drm_fb_xrgb8888_to_rgba5551(struct iosys_map *dst, const unsigned int *dst_pitch,
 				 const struct iosys_map *src, const struct drm_framebuffer *fb,
-				 const struct drm_rect *clip);
+				 const struct drm_rect *clip, struct drm_format_conv_state *state);
 void drm_fb_xrgb8888_to_rgb888(struct iosys_map *dst, const unsigned int *dst_pitch,
 			       const struct iosys_map *src, const struct drm_framebuffer *fb,
-			       const struct drm_rect *clip);
+			       const struct drm_rect *clip, struct drm_format_conv_state *state);
 void drm_fb_xrgb8888_to_argb8888(struct iosys_map *dst, const unsigned int *dst_pitch,
 				 const struct iosys_map *src, const struct drm_framebuffer *fb,
-				 const struct drm_rect *clip);
+				 const struct drm_rect *clip, struct drm_format_conv_state *state);
 void drm_fb_xrgb8888_to_xrgb2101010(struct iosys_map *dst, const unsigned int *dst_pitch,
 				    const struct iosys_map *src, const struct drm_framebuffer *fb,
-				    const struct drm_rect *clip);
+				    const struct drm_rect *clip,
+				    struct drm_format_conv_state *state);
 void drm_fb_xrgb8888_to_argb2101010(struct iosys_map *dst, const unsigned int *dst_pitch,
 				    const struct iosys_map *src, const struct drm_framebuffer *fb,
-				    const struct drm_rect *clip);
+				    const struct drm_rect *clip,
+				    struct drm_format_conv_state *state);
 void drm_fb_xrgb8888_to_gray8(struct iosys_map *dst, const unsigned int *dst_pitch,
 			      const struct iosys_map *src, const struct drm_framebuffer *fb,
-			      const struct drm_rect *clip);
+			      const struct drm_rect *clip, struct drm_format_conv_state *state);
 
 int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t dst_format,
 		const struct iosys_map *src, const struct drm_framebuffer *fb,
-		const struct drm_rect *rect);
+		const struct drm_rect *clip, struct drm_format_conv_state *state);
 
 void drm_fb_xrgb8888_to_mono(struct iosys_map *dst, const unsigned int *dst_pitch,
 			     const struct iosys_map *src, const struct drm_framebuffer *fb,
-			     const struct drm_rect *clip);
+			     const struct drm_rect *clip, struct drm_format_conv_state *state);
 
 size_t drm_fb_build_fourcc_list(struct drm_device *dev,
 				const u32 *native_fourccs, size_t native_nfourccs,
diff --git a/include/drm/drm_mipi_dbi.h b/include/drm/drm_mipi_dbi.h
index 816f196b3d4c5..e8e0f8d39f3a6 100644
--- a/include/drm/drm_mipi_dbi.h
+++ b/include/drm/drm_mipi_dbi.h
@@ -12,6 +12,7 @@
 #include <drm/drm_device.h>
 #include <drm/drm_simple_kms_helper.h>
 
+struct drm_format_conv_state;
 struct drm_rect;
 struct gpio_desc;
 struct iosys_map;
@@ -192,7 +193,8 @@ int mipi_dbi_command_buf(struct mipi_dbi *dbi, u8 cmd, u8 *data, size_t len);
 int mipi_dbi_command_stackbuf(struct mipi_dbi *dbi, u8 cmd, const u8 *data,
 			      size_t len);
 int mipi_dbi_buf_copy(void *dst, struct iosys_map *src, struct drm_framebuffer *fb,
-		      struct drm_rect *clip, bool swap);
+		      struct drm_rect *clip, bool swap,
+		      struct drm_format_conv_state *fmtcnv_state);
 
 /**
  * mipi_dbi_command - MIPI DCS command with optional parameter(s)
-- 
2.42.0

