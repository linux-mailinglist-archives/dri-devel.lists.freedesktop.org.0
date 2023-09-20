Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F537A7A5C
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 13:25:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8044D10E488;
	Wed, 20 Sep 2023 11:25:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66DEA10E484
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 11:25:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EBBB221CBE;
 Wed, 20 Sep 2023 11:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695209110; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DPpdpQi3bkmIqczGWTiUKFXei/oW49xYH3aF/fDcv+0=;
 b=dg1N5evUzG4EpOrOIsQ7/8abG03fp3dBaoS/Vd9mtevv+RaKG3oWzLAJMGITDoDgI/C19z
 JamrArdM6FXxOhfQ8lEGWRZFydh9MIu+ILhlgtz0nI2vVQF1RHdknwgZrtuS5oCOPssIhF
 X4CgT34JUPROhXfPSiJcMFr4EIoPVro=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695209110;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DPpdpQi3bkmIqczGWTiUKFXei/oW49xYH3aF/fDcv+0=;
 b=jXW/fdaaDLqwaLFecF2H71UsbcPdLGLExzF/c24PHrIgtkce1+CwtVTTWAqhu605xaFpSK
 IGz3GG4vpNjPavCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8FC821333E;
 Wed, 20 Sep 2023 11:25:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AJQ/IpbWCmX3NwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 20 Sep 2023 11:25:10 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jfalempe@redhat.com, jose.exposito89@gmail.com,
 arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
Subject: [PATCH 2/8] drm/format-helper: Pass xfrm buffer to format-conversion
 helpers
Date: Wed, 20 Sep 2023 13:10:14 +0200
Message-ID: <20230920112508.11770-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230920112508.11770-1-tzimmermann@suse.de>
References: <20230920112508.11770-1-tzimmermann@suse.de>
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

Pass an instance of struct drm_xfrm_buf to DRM's format conversion
helpers. Update all callers. Drivers will later be able to keep this
cache across display updates.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Noralf Trønnes <noralf@tronnes.org>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: David Lechner <david@lechnology.com>
---
 drivers/gpu/drm/drm_format_helper.c           | 119 ++++++++++--------
 drivers/gpu/drm/drm_mipi_dbi.c                |   7 +-
 drivers/gpu/drm/gud/gud_pipe.c                |  21 ++--
 drivers/gpu/drm/solomon/ssd130x.c             |   5 +-
 .../gpu/drm/tests/drm_format_helper_test.c    |  33 ++---
 drivers/gpu/drm/tiny/cirrus.c                 |   5 +-
 drivers/gpu/drm/tiny/ofdrm.c                  |   4 +-
 drivers/gpu/drm/tiny/repaper.c                |   5 +-
 drivers/gpu/drm/tiny/simpledrm.c              |   4 +-
 drivers/gpu/drm/tiny/st7586.c                 |   5 +-
 include/drm/drm_format_helper.h               |  28 +++--
 11 files changed, 139 insertions(+), 97 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 029ca7893260a..70a717ee79d03 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -216,29 +216,25 @@ static int drm_fb_xfrm(struct iosys_map *dst,
 		       const unsigned int *dst_pitch, const u8 *dst_pixsize,
 		       const struct iosys_map *src, const struct drm_framebuffer *fb,
 		       const struct drm_rect *clip, bool vaddr_cached_hint,
+		       struct drm_xfrm_buf *xfrm,
 		       void (*xfrm_line)(void *dbuf, const void *sbuf, unsigned int npixels))
 {
 	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
 		0, 0, 0, 0
 	};
-	struct drm_xfrm_buf tmp = DRM_XFRM_BUF_INIT;
-	int ret;
 
 	if (!dst_pitch)
 		dst_pitch = default_dst_pitch;
 
 	/* TODO: handle src in I/O memory here */
 	if (dst[0].is_iomem)
-		ret = __drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], dst_pixsize[0],
-					 src[0].vaddr, fb, clip, vaddr_cached_hint, &tmp,
-					 xfrm_line);
+		return __drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], dst_pixsize[0],
+					  src[0].vaddr, fb, clip, vaddr_cached_hint, xfrm,
+					  xfrm_line);
 	else
-		ret = __drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], dst_pixsize[0],
-				    src[0].vaddr, fb, clip, vaddr_cached_hint, &tmp,
-				    xfrm_line);
-	drm_xfrm_buf_release(&tmp);
-
-	return ret;
+		return __drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], dst_pixsize[0],
+				     src[0].vaddr, fb, clip, vaddr_cached_hint, xfrm,
+				     xfrm_line);
 }
 
 /**
@@ -324,6 +320,7 @@ static void drm_fb_swab32_line(void *dbuf, const void *sbuf, unsigned int pixels
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
  * @cached: Source buffer is mapped cached (eg. not write-combined)
+ * @xfrm: Transform and conversion state
  *
  * This function copies parts of a framebuffer to display memory and swaps per-pixel
  * bytes during the process. Destination and framebuffer formats must match. The
@@ -338,7 +335,8 @@ static void drm_fb_swab32_line(void *dbuf, const void *sbuf, unsigned int pixels
  */
 void drm_fb_swab(struct iosys_map *dst, const unsigned int *dst_pitch,
 		 const struct iosys_map *src, const struct drm_framebuffer *fb,
-		 const struct drm_rect *clip, bool cached)
+		 const struct drm_rect *clip, bool cached,
+		 struct drm_xfrm_buf *xfrm)
 {
 	const struct drm_format_info *format = fb->format;
 	u8 cpp = DIV_ROUND_UP(drm_format_info_bpp(format, 0), 8);
@@ -357,7 +355,7 @@ void drm_fb_swab(struct iosys_map *dst, const unsigned int *dst_pitch,
 		return;
 	}
 
-	drm_fb_xfrm(dst, dst_pitch, &cpp, src, fb, clip, cached, swab_line);
+	drm_fb_xfrm(dst, dst_pitch, &cpp, src, fb, clip, cached, xfrm, swab_line);
 }
 EXPORT_SYMBOL(drm_fb_swab);
 
@@ -384,6 +382,7 @@ static void drm_fb_xrgb8888_to_rgb332_line(void *dbuf, const void *sbuf, unsigne
  * @src: Array of XRGB8888 source buffers
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
+ * @xfrm: Transform and conversion state
  *
  * This function copies parts of a framebuffer to display memory and converts the
  * color format during the process. Destination and framebuffer formats must match. The
@@ -398,13 +397,13 @@ static void drm_fb_xrgb8888_to_rgb332_line(void *dbuf, const void *sbuf, unsigne
  */
 void drm_fb_xrgb8888_to_rgb332(struct iosys_map *dst, const unsigned int *dst_pitch,
 			       const struct iosys_map *src, const struct drm_framebuffer *fb,
-			       const struct drm_rect *clip)
+			       const struct drm_rect *clip, struct drm_xfrm_buf *xfrm)
 {
 	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
 		1,
 	};
 
-	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false,
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, xfrm,
 		    drm_fb_xrgb8888_to_rgb332_line);
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb332);
@@ -453,6 +452,7 @@ static void drm_fb_xrgb8888_to_rgb565_swab_line(void *dbuf, const void *sbuf,
  * @src: Array of XRGB8888 source buffer
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
+ * @xfrm: Transform and conversion state
  * @swab: Swap bytes
  *
  * This function copies parts of a framebuffer to display memory and converts the
@@ -468,7 +468,8 @@ static void drm_fb_xrgb8888_to_rgb565_swab_line(void *dbuf, const void *sbuf,
  */
 void drm_fb_xrgb8888_to_rgb565(struct iosys_map *dst, const unsigned int *dst_pitch,
 			       const struct iosys_map *src, const struct drm_framebuffer *fb,
-			       const struct drm_rect *clip, bool swab)
+			       const struct drm_rect *clip, struct drm_xfrm_buf *xfrm,
+			       bool swab)
 {
 	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
 		2,
@@ -481,7 +482,7 @@ void drm_fb_xrgb8888_to_rgb565(struct iosys_map *dst, const unsigned int *dst_pi
 	else
 		xfrm_line = drm_fb_xrgb8888_to_rgb565_line;
 
-	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, xfrm_line);
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, xfrm, xfrm_line);
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb565);
 
@@ -510,6 +511,7 @@ static void drm_fb_xrgb8888_to_xrgb1555_line(void *dbuf, const void *sbuf, unsig
  * @src: Array of XRGB8888 source buffer
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
+ * @xfrm: Transform and conversion state
  *
  * This function copies parts of a framebuffer to display memory and converts
  * the color format during the process. The parameters @dst, @dst_pitch and
@@ -525,13 +527,13 @@ static void drm_fb_xrgb8888_to_xrgb1555_line(void *dbuf, const void *sbuf, unsig
  */
 void drm_fb_xrgb8888_to_xrgb1555(struct iosys_map *dst, const unsigned int *dst_pitch,
 				 const struct iosys_map *src, const struct drm_framebuffer *fb,
-				 const struct drm_rect *clip)
+				 const struct drm_rect *clip, struct drm_xfrm_buf *xfrm)
 {
 	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
 		2,
 	};
 
-	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false,
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, xfrm,
 		    drm_fb_xrgb8888_to_xrgb1555_line);
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_xrgb1555);
@@ -562,6 +564,7 @@ static void drm_fb_xrgb8888_to_argb1555_line(void *dbuf, const void *sbuf, unsig
  * @src: Array of XRGB8888 source buffer
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
+ * @xfrm: Transform and conversion state
  *
  * This function copies parts of a framebuffer to display memory and converts
  * the color format during the process. The parameters @dst, @dst_pitch and
@@ -577,13 +580,13 @@ static void drm_fb_xrgb8888_to_argb1555_line(void *dbuf, const void *sbuf, unsig
  */
 void drm_fb_xrgb8888_to_argb1555(struct iosys_map *dst, const unsigned int *dst_pitch,
 				 const struct iosys_map *src, const struct drm_framebuffer *fb,
-				 const struct drm_rect *clip)
+				 const struct drm_rect *clip, struct drm_xfrm_buf *xfrm)
 {
 	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
 		2,
 	};
 
-	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false,
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, xfrm,
 		    drm_fb_xrgb8888_to_argb1555_line);
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_argb1555);
@@ -614,6 +617,7 @@ static void drm_fb_xrgb8888_to_rgba5551_line(void *dbuf, const void *sbuf, unsig
  * @src: Array of XRGB8888 source buffer
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
+ * @xfrm: Transform and conversion state
  *
  * This function copies parts of a framebuffer to display memory and converts
  * the color format during the process. The parameters @dst, @dst_pitch and
@@ -629,13 +633,13 @@ static void drm_fb_xrgb8888_to_rgba5551_line(void *dbuf, const void *sbuf, unsig
  */
 void drm_fb_xrgb8888_to_rgba5551(struct iosys_map *dst, const unsigned int *dst_pitch,
 				 const struct iosys_map *src, const struct drm_framebuffer *fb,
-				 const struct drm_rect *clip)
+				 const struct drm_rect *clip, struct drm_xfrm_buf *xfrm)
 {
 	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
 		2,
 	};
 
-	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false,
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, xfrm,
 		    drm_fb_xrgb8888_to_rgba5551_line);
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgba5551);
@@ -664,6 +668,7 @@ static void drm_fb_xrgb8888_to_rgb888_line(void *dbuf, const void *sbuf, unsigne
  * @src: Array of XRGB8888 source buffers
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
+ * @xfrm: Transform and conversion state
  *
  * This function copies parts of a framebuffer to display memory and converts the
  * color format during the process. Destination and framebuffer formats must match. The
@@ -679,13 +684,13 @@ static void drm_fb_xrgb8888_to_rgb888_line(void *dbuf, const void *sbuf, unsigne
  */
 void drm_fb_xrgb8888_to_rgb888(struct iosys_map *dst, const unsigned int *dst_pitch,
 			       const struct iosys_map *src, const struct drm_framebuffer *fb,
-			       const struct drm_rect *clip)
+			       const struct drm_rect *clip, struct drm_xfrm_buf *xfrm)
 {
 	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
 		3,
 	};
 
-	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false,
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, xfrm,
 		    drm_fb_xrgb8888_to_rgb888_line);
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb888);
@@ -712,6 +717,7 @@ static void drm_fb_xrgb8888_to_argb8888_line(void *dbuf, const void *sbuf, unsig
  * @src: Array of XRGB8888 source buffer
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
+ * @xfrm: Transform and conversion state
  *
  * This function copies parts of a framebuffer to display memory and converts the
  * color format during the process. The parameters @dst, @dst_pitch and @src refer
@@ -727,13 +733,13 @@ static void drm_fb_xrgb8888_to_argb8888_line(void *dbuf, const void *sbuf, unsig
  */
 void drm_fb_xrgb8888_to_argb8888(struct iosys_map *dst, const unsigned int *dst_pitch,
 				 const struct iosys_map *src, const struct drm_framebuffer *fb,
-				 const struct drm_rect *clip)
+				 const struct drm_rect *clip, struct drm_xfrm_buf *xfrm)
 {
 	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
 		4,
 	};
 
-	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false,
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, xfrm,
 		    drm_fb_xrgb8888_to_argb8888_line);
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_argb8888);
@@ -758,13 +764,13 @@ static void drm_fb_xrgb8888_to_abgr8888_line(void *dbuf, const void *sbuf, unsig
 static void drm_fb_xrgb8888_to_abgr8888(struct iosys_map *dst, const unsigned int *dst_pitch,
 					const struct iosys_map *src,
 					const struct drm_framebuffer *fb,
-					const struct drm_rect *clip)
+					const struct drm_rect *clip, struct drm_xfrm_buf *xfrm)
 {
 	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
 		4,
 	};
 
-	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false,
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, xfrm,
 		    drm_fb_xrgb8888_to_abgr8888_line);
 }
 
@@ -788,13 +794,13 @@ static void drm_fb_xrgb8888_to_xbgr8888_line(void *dbuf, const void *sbuf, unsig
 static void drm_fb_xrgb8888_to_xbgr8888(struct iosys_map *dst, const unsigned int *dst_pitch,
 					const struct iosys_map *src,
 					const struct drm_framebuffer *fb,
-					const struct drm_rect *clip)
+					const struct drm_rect *clip, struct drm_xfrm_buf *xfrm)
 {
 	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
 		4,
 	};
 
-	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false,
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, xfrm,
 		    drm_fb_xrgb8888_to_xbgr8888_line);
 }
 
@@ -824,6 +830,7 @@ static void drm_fb_xrgb8888_to_xrgb2101010_line(void *dbuf, const void *sbuf, un
  * @src: Array of XRGB8888 source buffers
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
+ * @xfrm: Transform and conversion state
  *
  * This function copies parts of a framebuffer to display memory and converts the
  * color format during the process. Destination and framebuffer formats must match. The
@@ -839,13 +846,13 @@ static void drm_fb_xrgb8888_to_xrgb2101010_line(void *dbuf, const void *sbuf, un
  */
 void drm_fb_xrgb8888_to_xrgb2101010(struct iosys_map *dst, const unsigned int *dst_pitch,
 				    const struct iosys_map *src, const struct drm_framebuffer *fb,
-				    const struct drm_rect *clip)
+				    const struct drm_rect *clip, struct drm_xfrm_buf *xfrm)
 {
 	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
 		4,
 	};
 
-	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false,
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, xfrm,
 		    drm_fb_xrgb8888_to_xrgb2101010_line);
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_xrgb2101010);
@@ -877,6 +884,7 @@ static void drm_fb_xrgb8888_to_argb2101010_line(void *dbuf, const void *sbuf, un
  * @src: Array of XRGB8888 source buffers
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
+ * @xfrm: Transform and conversion state
  *
  * This function copies parts of a framebuffer to display memory and converts
  * the color format during the process. The parameters @dst, @dst_pitch and
@@ -892,13 +900,13 @@ static void drm_fb_xrgb8888_to_argb2101010_line(void *dbuf, const void *sbuf, un
  */
 void drm_fb_xrgb8888_to_argb2101010(struct iosys_map *dst, const unsigned int *dst_pitch,
 				    const struct iosys_map *src, const struct drm_framebuffer *fb,
-				    const struct drm_rect *clip)
+				    const struct drm_rect *clip, struct drm_xfrm_buf *xfrm)
 {
 	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
 		4,
 	};
 
-	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false,
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, xfrm,
 		    drm_fb_xrgb8888_to_argb2101010_line);
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_argb2101010);
@@ -928,6 +936,7 @@ static void drm_fb_xrgb8888_to_gray8_line(void *dbuf, const void *sbuf, unsigned
  * @src: Array of XRGB8888 source buffers
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
+ * @xfrm: Transform and conversion state
  *
  * This function copies parts of a framebuffer to display memory and converts the
  * color format during the process. Destination and framebuffer formats must match. The
@@ -947,13 +956,13 @@ static void drm_fb_xrgb8888_to_gray8_line(void *dbuf, const void *sbuf, unsigned
  */
 void drm_fb_xrgb8888_to_gray8(struct iosys_map *dst, const unsigned int *dst_pitch,
 			      const struct iosys_map *src, const struct drm_framebuffer *fb,
-			      const struct drm_rect *clip)
+			      const struct drm_rect *clip, struct drm_xfrm_buf *xfrm)
 {
 	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
 		1,
 	};
 
-	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false,
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false, xfrm,
 		    drm_fb_xrgb8888_to_gray8_line);
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_gray8);
@@ -967,6 +976,7 @@ EXPORT_SYMBOL(drm_fb_xrgb8888_to_gray8);
  * @src:	The framebuffer memory to copy from
  * @fb:		The framebuffer to copy from
  * @clip:	Clip rectangle area to copy
+ * @xfrm: Transform and conversion state
  *
  * This function copies parts of a framebuffer to display memory. If the
  * formats of the display and the framebuffer mismatch, the blit function
@@ -985,7 +995,7 @@ EXPORT_SYMBOL(drm_fb_xrgb8888_to_gray8);
  */
 int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t dst_format,
 		const struct iosys_map *src, const struct drm_framebuffer *fb,
-		const struct drm_rect *clip)
+		const struct drm_rect *clip, struct drm_xfrm_buf *xfrm)
 {
 	uint32_t fb_format = fb->format->format;
 
@@ -993,44 +1003,44 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
 		drm_fb_memcpy(dst, dst_pitch, src, fb, clip);
 		return 0;
 	} else if (fb_format == (dst_format | DRM_FORMAT_BIG_ENDIAN)) {
-		drm_fb_swab(dst, dst_pitch, src, fb, clip, false);
+		drm_fb_swab(dst, dst_pitch, src, fb, clip, false, xfrm);
 		return 0;
 	} else if (fb_format == (dst_format & ~DRM_FORMAT_BIG_ENDIAN)) {
-		drm_fb_swab(dst, dst_pitch, src, fb, clip, false);
+		drm_fb_swab(dst, dst_pitch, src, fb, clip, false, xfrm);
 		return 0;
 	} else if (fb_format == DRM_FORMAT_XRGB8888) {
 		if (dst_format == DRM_FORMAT_RGB565) {
-			drm_fb_xrgb8888_to_rgb565(dst, dst_pitch, src, fb, clip, false);
+			drm_fb_xrgb8888_to_rgb565(dst, dst_pitch, src, fb, clip, xfrm, false);
 			return 0;
 		} else if (dst_format == DRM_FORMAT_XRGB1555) {
-			drm_fb_xrgb8888_to_xrgb1555(dst, dst_pitch, src, fb, clip);
+			drm_fb_xrgb8888_to_xrgb1555(dst, dst_pitch, src, fb, clip, xfrm);
 			return 0;
 		} else if (dst_format == DRM_FORMAT_ARGB1555) {
-			drm_fb_xrgb8888_to_argb1555(dst, dst_pitch, src, fb, clip);
+			drm_fb_xrgb8888_to_argb1555(dst, dst_pitch, src, fb, clip, xfrm);
 			return 0;
 		} else if (dst_format == DRM_FORMAT_RGBA5551) {
-			drm_fb_xrgb8888_to_rgba5551(dst, dst_pitch, src, fb, clip);
+			drm_fb_xrgb8888_to_rgba5551(dst, dst_pitch, src, fb, clip, xfrm);
 			return 0;
 		} else if (dst_format == DRM_FORMAT_RGB888) {
-			drm_fb_xrgb8888_to_rgb888(dst, dst_pitch, src, fb, clip);
+			drm_fb_xrgb8888_to_rgb888(dst, dst_pitch, src, fb, clip, xfrm);
 			return 0;
 		} else if (dst_format == DRM_FORMAT_ARGB8888) {
-			drm_fb_xrgb8888_to_argb8888(dst, dst_pitch, src, fb, clip);
+			drm_fb_xrgb8888_to_argb8888(dst, dst_pitch, src, fb, clip, xfrm);
 			return 0;
 		} else if (dst_format == DRM_FORMAT_XBGR8888) {
-			drm_fb_xrgb8888_to_xbgr8888(dst, dst_pitch, src, fb, clip);
+			drm_fb_xrgb8888_to_xbgr8888(dst, dst_pitch, src, fb, clip, xfrm);
 			return 0;
 		} else if (dst_format == DRM_FORMAT_ABGR8888) {
-			drm_fb_xrgb8888_to_abgr8888(dst, dst_pitch, src, fb, clip);
+			drm_fb_xrgb8888_to_abgr8888(dst, dst_pitch, src, fb, clip, xfrm);
 			return 0;
 		} else if (dst_format == DRM_FORMAT_XRGB2101010) {
-			drm_fb_xrgb8888_to_xrgb2101010(dst, dst_pitch, src, fb, clip);
+			drm_fb_xrgb8888_to_xrgb2101010(dst, dst_pitch, src, fb, clip, xfrm);
 			return 0;
 		} else if (dst_format == DRM_FORMAT_ARGB2101010) {
-			drm_fb_xrgb8888_to_argb2101010(dst, dst_pitch, src, fb, clip);
+			drm_fb_xrgb8888_to_argb2101010(dst, dst_pitch, src, fb, clip, xfrm);
 			return 0;
 		} else if (dst_format == DRM_FORMAT_BGRX8888) {
-			drm_fb_swab(dst, dst_pitch, src, fb, clip, false);
+			drm_fb_swab(dst, dst_pitch, src, fb, clip, false, xfrm);
 			return 0;
 		}
 	}
@@ -1067,6 +1077,7 @@ static void drm_fb_gray8_to_mono_line(void *dbuf, const void *sbuf, unsigned int
  * @src: Array of XRGB8888 source buffers
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
+ * @xfrm: Transform and conversion state
  *
  * This function copies parts of a framebuffer to display memory and converts the
  * color format during the process. Destination and framebuffer formats must match. The
@@ -1091,7 +1102,7 @@ static void drm_fb_gray8_to_mono_line(void *dbuf, const void *sbuf, unsigned int
  */
 void drm_fb_xrgb8888_to_mono(struct iosys_map *dst, const unsigned int *dst_pitch,
 			     const struct iosys_map *src, const struct drm_framebuffer *fb,
-			     const struct drm_rect *clip)
+			     const struct drm_rect *clip, struct drm_xfrm_buf *xfrm)
 {
 	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
 		0, 0, 0, 0
@@ -1131,7 +1142,7 @@ void drm_fb_xrgb8888_to_mono(struct iosys_map *dst, const unsigned int *dst_pitc
 	 * Allocate a buffer to be used for both copying from the cma
 	 * memory and to store the intermediate grayscale line pixels.
 	 */
-	src32 = kmalloc(len_src32 + linepixels, GFP_KERNEL);
+	src32 = drm_xfrm_buf_reserve(xfrm, len_src32 + linepixels, GFP_KERNEL);
 	if (!src32)
 		return;
 
@@ -1145,8 +1156,6 @@ void drm_fb_xrgb8888_to_mono(struct iosys_map *dst, const unsigned int *dst_pitc
 		vaddr += fb->pitches[0];
 		mono += dst_pitch_0;
 	}
-
-	kfree(src32);
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_mono);
 
diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index e90f0bf895b33..b5f9ab9de1d08 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -206,6 +206,7 @@ int mipi_dbi_buf_copy(void *dst, struct iosys_map *src, struct drm_framebuffer *
 {
 	struct drm_gem_object *gem = drm_gem_fb_get_obj(fb, 0);
 	struct iosys_map dst_map = IOSYS_MAP_INIT_VADDR(dst);
+	struct drm_xfrm_buf xfrm = DRM_XFRM_BUF_INIT;
 	int ret;
 
 	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
@@ -215,12 +216,12 @@ int mipi_dbi_buf_copy(void *dst, struct iosys_map *src, struct drm_framebuffer *
 	switch (fb->format->format) {
 	case DRM_FORMAT_RGB565:
 		if (swap)
-			drm_fb_swab(&dst_map, NULL, src, fb, clip, !gem->import_attach);
+			drm_fb_swab(&dst_map, NULL, src, fb, clip, !gem->import_attach, &xfrm);
 		else
 			drm_fb_memcpy(&dst_map, NULL, src, fb, clip);
 		break;
 	case DRM_FORMAT_XRGB8888:
-		drm_fb_xrgb8888_to_rgb565(&dst_map, NULL, src, fb, clip, swap);
+		drm_fb_xrgb8888_to_rgb565(&dst_map, NULL, src, fb, clip, &xfrm, swap);
 		break;
 	default:
 		drm_err_once(fb->dev, "Format is not supported: %p4cc\n",
@@ -230,6 +231,8 @@ int mipi_dbi_buf_copy(void *dst, struct iosys_map *src, struct drm_framebuffer *
 
 	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
 
+	drm_xfrm_buf_release(&xfrm);
+
 	return ret;
 }
 EXPORT_SYMBOL(mipi_dbi_buf_copy);
diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index d2f199ea3c111..38d4a65c0204c 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -57,6 +57,7 @@ static size_t gud_xrgb8888_to_r124(u8 *dst, const struct drm_format_info *format
 	unsigned int bits_per_pixel = 8 / block_width;
 	unsigned int x, y, width, height;
 	u8 pix, *pix8, *block = dst; /* Assign to silence compiler warning */
+	struct drm_xfrm_buf xfrm = DRM_XFRM_BUF_INIT;
 	struct iosys_map dst_map, vmap;
 	size_t len;
 	void *buf;
@@ -75,7 +76,7 @@ static size_t gud_xrgb8888_to_r124(u8 *dst, const struct drm_format_info *format
 
 	iosys_map_set_vaddr(&dst_map, buf);
 	iosys_map_set_vaddr(&vmap, src);
-	drm_fb_xrgb8888_to_gray8(&dst_map, NULL, &vmap, fb, rect);
+	drm_fb_xrgb8888_to_gray8(&dst_map, NULL, &vmap, fb, rect, &xfrm);
 	pix8 = buf;
 
 	for (y = 0; y < height; y++) {
@@ -94,6 +95,7 @@ static size_t gud_xrgb8888_to_r124(u8 *dst, const struct drm_format_info *format
 	}
 
 	kfree(buf);
+	drm_xfrm_buf_release(&xfrm);
 
 	return len;
 }
@@ -154,6 +156,7 @@ static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
 			  const struct drm_format_info *format, struct drm_rect *rect,
 			  struct gud_set_buffer_req *req)
 {
+	struct drm_xfrm_buf xfrm = DRM_XFRM_BUF_INIT;
 	u8 compression = gdrm->compression;
 	struct iosys_map dst;
 	void *vaddr, *buf;
@@ -179,22 +182,24 @@ static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
 	if (format != fb->format) {
 		if (format->format == GUD_DRM_FORMAT_R1) {
 			len = gud_xrgb8888_to_r124(buf, format, vaddr, fb, rect);
-			if (!len)
+			if (!len) {
+				drm_xfrm_buf_release(&xfrm);
 				return -ENOMEM;
+			}
 		} else if (format->format == DRM_FORMAT_R8) {
-			drm_fb_xrgb8888_to_gray8(&dst, NULL, src, fb, rect);
+			drm_fb_xrgb8888_to_gray8(&dst, NULL, src, fb, rect, &xfrm);
 		} else if (format->format == DRM_FORMAT_RGB332) {
-			drm_fb_xrgb8888_to_rgb332(&dst, NULL, src, fb, rect);
+			drm_fb_xrgb8888_to_rgb332(&dst, NULL, src, fb, rect, &xfrm);
 		} else if (format->format == DRM_FORMAT_RGB565) {
-			drm_fb_xrgb8888_to_rgb565(&dst, NULL, src, fb, rect,
+			drm_fb_xrgb8888_to_rgb565(&dst, NULL, src, fb, rect, &xfrm,
 						  gud_is_big_endian());
 		} else if (format->format == DRM_FORMAT_RGB888) {
-			drm_fb_xrgb8888_to_rgb888(&dst, NULL, src, fb, rect);
+			drm_fb_xrgb8888_to_rgb888(&dst, NULL, src, fb, rect, &xfrm);
 		} else {
 			len = gud_xrgb8888_to_color(buf, format, vaddr, fb, rect);
 		}
 	} else if (gud_is_big_endian() && format->cpp[0] > 1) {
-		drm_fb_swab(&dst, NULL, src, fb, rect, cached_reads);
+		drm_fb_swab(&dst, NULL, src, fb, rect, cached_reads, &xfrm);
 	} else if (compression && cached_reads && pitch == fb->pitches[0]) {
 		/* can compress directly from the framebuffer */
 		buf = vaddr + rect->y1 * pitch;
@@ -222,6 +227,8 @@ static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
 		req->compressed_length = cpu_to_le32(complen);
 	}
 
+	drm_xfrm_buf_release(&xfrm);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 5a80b228d18ca..d11079733bc0e 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -571,6 +571,7 @@ static int ssd130x_fb_blit_rect(struct drm_plane_state *state,
 	struct ssd130x_device *ssd130x = drm_to_ssd130x(fb->dev);
 	unsigned int page_height = ssd130x->device_info->page_height;
 	struct ssd130x_plane_state *ssd130x_state = to_ssd130x_plane_state(state);
+	struct drm_xfrm_buf xfrm = DRM_XFRM_BUF_INIT;
 	u8 *buf = ssd130x_state->buffer;
 	struct iosys_map dst;
 	unsigned int dst_pitch;
@@ -587,12 +588,14 @@ static int ssd130x_fb_blit_rect(struct drm_plane_state *state,
 		return ret;
 
 	iosys_map_set_vaddr(&dst, buf);
-	drm_fb_xrgb8888_to_mono(&dst, &dst_pitch, vmap, fb, rect);
+	drm_fb_xrgb8888_to_mono(&dst, &dst_pitch, vmap, fb, rect, &xfrm);
 
 	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
 
 	ssd130x_update_rect(ssd130x, ssd130x_state, rect);
 
+	drm_xfrm_buf_release(&xfrm);
+
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index 1a6bd291345de..c6deabb6c64e5 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -20,6 +20,10 @@
 
 #define TEST_USE_DEFAULT_PITCH 0
 
+static unsigned char conversion_buf_mem[PAGE_SIZE];
+static struct drm_xfrm_buf xfrm =
+	DRM_XFRM_BUF_INIT_PREALLOCATED(conversion_buf_mem, ARRAY_SIZE(conversion_buf_mem));
+
 struct convert_to_gray8_result {
 	unsigned int dst_pitch;
 	const u8 expected[TEST_BUF_SIZE];
@@ -568,8 +572,7 @@ static void drm_test_fb_xrgb8888_to_gray8(struct kunit *test)
 	const unsigned int *dst_pitch = (result->dst_pitch == TEST_USE_DEFAULT_PITCH) ?
 		NULL : &result->dst_pitch;
 
-	drm_fb_xrgb8888_to_gray8(&dst, dst_pitch, &src, &fb, &params->clip);
-
+	drm_fb_xrgb8888_to_gray8(&dst, dst_pitch, &src, &fb, &params->clip, &xfrm);
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
 
@@ -602,7 +605,7 @@ static void drm_test_fb_xrgb8888_to_rgb332(struct kunit *test)
 	const unsigned int *dst_pitch = (result->dst_pitch == TEST_USE_DEFAULT_PITCH) ?
 		NULL : &result->dst_pitch;
 
-	drm_fb_xrgb8888_to_rgb332(&dst, dst_pitch, &src, &fb, &params->clip);
+	drm_fb_xrgb8888_to_rgb332(&dst, dst_pitch, &src, &fb, &params->clip, &xfrm);
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
 
@@ -635,12 +638,14 @@ static void drm_test_fb_xrgb8888_to_rgb565(struct kunit *test)
 	const unsigned int *dst_pitch = (result->dst_pitch == TEST_USE_DEFAULT_PITCH) ?
 		NULL : &result->dst_pitch;
 
-	drm_fb_xrgb8888_to_rgb565(&dst, dst_pitch, &src, &fb, &params->clip, false);
+	drm_fb_xrgb8888_to_rgb565(&dst, dst_pitch, &src, &fb, &params->clip,
+				  &xfrm, false);
 	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 
 	buf = dst.vaddr; /* restore original value of buf */
-	drm_fb_xrgb8888_to_rgb565(&dst, &result->dst_pitch, &src, &fb, &params->clip, true);
+	drm_fb_xrgb8888_to_rgb565(&dst, &result->dst_pitch, &src, &fb, &params->clip,
+				  &xfrm, true);
 	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected_swab, dst_size);
 }
@@ -674,7 +679,7 @@ static void drm_test_fb_xrgb8888_to_xrgb1555(struct kunit *test)
 	const unsigned int *dst_pitch = (result->dst_pitch == TEST_USE_DEFAULT_PITCH) ?
 		NULL : &result->dst_pitch;
 
-	drm_fb_xrgb8888_to_xrgb1555(&dst, dst_pitch, &src, &fb, &params->clip);
+	drm_fb_xrgb8888_to_xrgb1555(&dst, dst_pitch, &src, &fb, &params->clip, &xfrm);
 	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
@@ -708,7 +713,7 @@ static void drm_test_fb_xrgb8888_to_argb1555(struct kunit *test)
 	const unsigned int *dst_pitch = (result->dst_pitch == TEST_USE_DEFAULT_PITCH) ?
 		NULL : &result->dst_pitch;
 
-	drm_fb_xrgb8888_to_argb1555(&dst, dst_pitch, &src, &fb, &params->clip);
+	drm_fb_xrgb8888_to_argb1555(&dst, dst_pitch, &src, &fb, &params->clip, &xfrm);
 	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
@@ -742,7 +747,7 @@ static void drm_test_fb_xrgb8888_to_rgba5551(struct kunit *test)
 	const unsigned int *dst_pitch = (result->dst_pitch == TEST_USE_DEFAULT_PITCH) ?
 		NULL : &result->dst_pitch;
 
-	drm_fb_xrgb8888_to_rgba5551(&dst, dst_pitch, &src, &fb, &params->clip);
+	drm_fb_xrgb8888_to_rgba5551(&dst, dst_pitch, &src, &fb, &params->clip, &xfrm);
 	buf = le16buf_to_cpu(test, (__force const __le16 *)buf, dst_size / sizeof(__le16));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
@@ -780,7 +785,7 @@ static void drm_test_fb_xrgb8888_to_rgb888(struct kunit *test)
 	const unsigned int *dst_pitch = (result->dst_pitch == TEST_USE_DEFAULT_PITCH) ?
 		NULL : &result->dst_pitch;
 
-	drm_fb_xrgb8888_to_rgb888(&dst, dst_pitch, &src, &fb, &params->clip);
+	drm_fb_xrgb8888_to_rgb888(&dst, dst_pitch, &src, &fb, &params->clip, &xfrm);
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
 
@@ -813,7 +818,7 @@ static void drm_test_fb_xrgb8888_to_argb8888(struct kunit *test)
 	const unsigned int *dst_pitch = (result->dst_pitch == TEST_USE_DEFAULT_PITCH) ?
 		NULL : &result->dst_pitch;
 
-	drm_fb_xrgb8888_to_argb8888(&dst, dst_pitch, &src, &fb, &params->clip);
+	drm_fb_xrgb8888_to_argb8888(&dst, dst_pitch, &src, &fb, &params->clip, &xfrm);
 	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
@@ -847,7 +852,7 @@ static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
 	const unsigned int *dst_pitch = (result->dst_pitch == TEST_USE_DEFAULT_PITCH) ?
 		NULL : &result->dst_pitch;
 
-	drm_fb_xrgb8888_to_xrgb2101010(&dst, dst_pitch, &src, &fb, &params->clip);
+	drm_fb_xrgb8888_to_xrgb2101010(&dst, dst_pitch, &src, &fb, &params->clip, &xfrm);
 	buf = le32buf_to_cpu(test, buf, dst_size / sizeof(u32));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
@@ -881,7 +886,7 @@ static void drm_test_fb_xrgb8888_to_argb2101010(struct kunit *test)
 	const unsigned int *dst_pitch = (result->dst_pitch == TEST_USE_DEFAULT_PITCH) ?
 		NULL : &result->dst_pitch;
 
-	drm_fb_xrgb8888_to_argb2101010(&dst, dst_pitch, &src, &fb, &params->clip);
+	drm_fb_xrgb8888_to_argb2101010(&dst, dst_pitch, &src, &fb, &params->clip, &xfrm);
 	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
@@ -915,7 +920,7 @@ static void drm_test_fb_xrgb8888_to_mono(struct kunit *test)
 	const unsigned int *dst_pitch = (result->dst_pitch == TEST_USE_DEFAULT_PITCH) ?
 		NULL : &result->dst_pitch;
 
-	drm_fb_xrgb8888_to_mono(&dst, dst_pitch, &src, &fb, &params->clip);
+	drm_fb_xrgb8888_to_mono(&dst, dst_pitch, &src, &fb, &params->clip, &xfrm);
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
 
@@ -948,7 +953,7 @@ static void drm_test_fb_swab(struct kunit *test)
 	const unsigned int *dst_pitch = (result->dst_pitch == TEST_USE_DEFAULT_PITCH) ?
 		NULL : &result->dst_pitch;
 
-	drm_fb_swab(&dst, dst_pitch, &src, &fb, &params->clip, false);
+	drm_fb_swab(&dst, dst_pitch, &src, &fb, &params->clip, false, &xfrm);
 	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index 594bc472862fe..74821d688daf5 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -391,6 +391,7 @@ static void cirrus_primary_plane_helper_atomic_update(struct drm_plane *plane,
 	struct cirrus_primary_plane_state *old_primary_plane_state =
 		to_cirrus_primary_plane_state(old_plane_state);
 	struct iosys_map vaddr = IOSYS_MAP_INIT_VADDR_IOMEM(cirrus->vram);
+	struct drm_xfrm_buf xfrm = DRM_XFRM_BUF_INIT;
 	struct drm_atomic_helper_damage_iter iter;
 	struct drm_rect damage;
 	int idx;
@@ -411,10 +412,12 @@ static void cirrus_primary_plane_helper_atomic_update(struct drm_plane *plane,
 		unsigned int offset = drm_fb_clip_offset(pitch, format, &damage);
 		struct iosys_map dst = IOSYS_MAP_INIT_OFFSET(&vaddr, offset);
 
-		drm_fb_blit(&dst, &pitch, format->format, shadow_plane_state->data, fb, &damage);
+		drm_fb_blit(&dst, &pitch, format->format, shadow_plane_state->data, fb,
+			    &damage, &xfrm);
 	}
 
 	drm_dev_exit(idx);
+	drm_xfrm_buf_release(&xfrm);
 }
 
 static const struct drm_plane_helper_funcs cirrus_primary_plane_helper_funcs = {
diff --git a/drivers/gpu/drm/tiny/ofdrm.c b/drivers/gpu/drm/tiny/ofdrm.c
index 2d999a0facdee..1add55c872670 100644
--- a/drivers/gpu/drm/tiny/ofdrm.c
+++ b/drivers/gpu/drm/tiny/ofdrm.c
@@ -796,6 +796,7 @@ static void ofdrm_primary_plane_helper_atomic_update(struct drm_plane *plane,
 	struct drm_framebuffer *fb = plane_state->fb;
 	unsigned int dst_pitch = odev->pitch;
 	const struct drm_format_info *dst_format = odev->format;
+	struct drm_xfrm_buf xfrm = DRM_XFRM_BUF_INIT;
 	struct drm_atomic_helper_damage_iter iter;
 	struct drm_rect damage;
 	int ret, idx;
@@ -817,12 +818,13 @@ static void ofdrm_primary_plane_helper_atomic_update(struct drm_plane *plane,
 
 		iosys_map_incr(&dst, drm_fb_clip_offset(dst_pitch, dst_format, &dst_clip));
 		drm_fb_blit(&dst, &dst_pitch, dst_format->format, shadow_plane_state->data, fb,
-			    &damage);
+			    &damage, &xfrm);
 	}
 
 	drm_dev_exit(idx);
 out_drm_gem_fb_end_cpu_access:
 	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
+	drm_xfrm_buf_release(&xfrm);
 }
 
 static void ofdrm_primary_plane_helper_atomic_disable(struct drm_plane *plane,
diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
index 73dd4f4289c20..fddcaab78b92c 100644
--- a/drivers/gpu/drm/tiny/repaper.c
+++ b/drivers/gpu/drm/tiny/repaper.c
@@ -514,6 +514,7 @@ static int repaper_fb_dirty(struct drm_framebuffer *fb)
 	struct drm_gem_dma_object *dma_obj = drm_fb_dma_get_gem_obj(fb, 0);
 	struct repaper_epd *epd = drm_to_epd(fb->dev);
 	unsigned int dst_pitch = 0;
+	struct drm_xfrm_buf xfrm = DRM_XFRM_BUF_INIT;
 	struct iosys_map dst, vmap;
 	struct drm_rect clip;
 	int idx, ret = 0;
@@ -545,7 +546,7 @@ static int repaper_fb_dirty(struct drm_framebuffer *fb)
 
 	iosys_map_set_vaddr(&dst, buf);
 	iosys_map_set_vaddr(&vmap, dma_obj->vaddr);
-	drm_fb_xrgb8888_to_mono(&dst, &dst_pitch, &vmap, fb, &clip);
+	drm_fb_xrgb8888_to_mono(&dst, &dst_pitch, &vmap, fb, &clip, &xfrm);
 
 	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
 
@@ -601,6 +602,8 @@ static int repaper_fb_dirty(struct drm_framebuffer *fb)
 out_exit:
 	drm_dev_exit(idx);
 
+	drm_xfrm_buf_release(&xfrm);
+
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index ff86ba1ae1b8b..8aceb7d378dea 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -486,6 +486,7 @@ static void simpledrm_primary_plane_helper_atomic_update(struct drm_plane *plane
 	struct drm_framebuffer *fb = plane_state->fb;
 	struct drm_device *dev = plane->dev;
 	struct simpledrm_device *sdev = simpledrm_device_of_dev(dev);
+	struct drm_xfrm_buf xfrm = DRM_XFRM_BUF_INIT;
 	struct drm_atomic_helper_damage_iter iter;
 	struct drm_rect damage;
 	int ret, idx;
@@ -507,12 +508,13 @@ static void simpledrm_primary_plane_helper_atomic_update(struct drm_plane *plane
 
 		iosys_map_incr(&dst, drm_fb_clip_offset(sdev->pitch, sdev->format, &dst_clip));
 		drm_fb_blit(&dst, &sdev->pitch, sdev->format->format, shadow_plane_state->data,
-			    fb, &damage);
+			    fb, &damage, &xfrm);
 	}
 
 	drm_dev_exit(idx);
 out_drm_gem_fb_end_cpu_access:
 	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
+	drm_xfrm_buf_release(&xfrm);
 }
 
 static void simpledrm_primary_plane_helper_atomic_disable(struct drm_plane *plane,
diff --git a/drivers/gpu/drm/tiny/st7586.c b/drivers/gpu/drm/tiny/st7586.c
index 3cf4eec16a813..e4d1e071aae56 100644
--- a/drivers/gpu/drm/tiny/st7586.c
+++ b/drivers/gpu/drm/tiny/st7586.c
@@ -67,6 +67,7 @@ static void st7586_xrgb8888_to_gray332(u8 *dst, void *vaddr,
 				       struct drm_rect *clip)
 {
 	size_t len = (clip->x2 - clip->x1) * (clip->y2 - clip->y1);
+	struct drm_xfrm_buf xfrm = DRM_XFRM_BUF_INIT;
 	unsigned int x, y;
 	u8 *src, *buf, val;
 	struct iosys_map dst_map, vmap;
@@ -77,7 +78,7 @@ static void st7586_xrgb8888_to_gray332(u8 *dst, void *vaddr,
 
 	iosys_map_set_vaddr(&dst_map, buf);
 	iosys_map_set_vaddr(&vmap, vaddr);
-	drm_fb_xrgb8888_to_gray8(&dst_map, NULL, &vmap, fb, clip);
+	drm_fb_xrgb8888_to_gray8(&dst_map, NULL, &vmap, fb, clip, &xfrm);
 	src = buf;
 
 	for (y = clip->y1; y < clip->y2; y++) {
@@ -90,6 +91,8 @@ static void st7586_xrgb8888_to_gray332(u8 *dst, void *vaddr,
 	}
 
 	kfree(buf);
+
+	drm_xfrm_buf_release(&xfrm);
 }
 
 static int st7586_buf_copy(void *dst, struct iosys_map *src, struct drm_framebuffer *fb,
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index 245a5edc4735a..11bab88114e2d 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -69,45 +69,47 @@ void drm_fb_memcpy(struct iosys_map *dst, const unsigned int *dst_pitch,
 		   const struct drm_rect *clip);
 void drm_fb_swab(struct iosys_map *dst, const unsigned int *dst_pitch,
 		 const struct iosys_map *src, const struct drm_framebuffer *fb,
-		 const struct drm_rect *clip, bool cached);
+		 const struct drm_rect *clip, bool cached,
+		 struct drm_xfrm_buf *xfrm);
 void drm_fb_xrgb8888_to_rgb332(struct iosys_map *dst, const unsigned int *dst_pitch,
 			       const struct iosys_map *src, const struct drm_framebuffer *fb,
-			       const struct drm_rect *clip);
+			       const struct drm_rect *clip, struct drm_xfrm_buf *xfrm);
 void drm_fb_xrgb8888_to_rgb565(struct iosys_map *dst, const unsigned int *dst_pitch,
 			       const struct iosys_map *src, const struct drm_framebuffer *fb,
-			       const struct drm_rect *clip, bool swab);
+			       const struct drm_rect *clip, struct drm_xfrm_buf *xfrm,
+			       bool swab);
 void drm_fb_xrgb8888_to_xrgb1555(struct iosys_map *dst, const unsigned int *dst_pitch,
 				 const struct iosys_map *src, const struct drm_framebuffer *fb,
-				 const struct drm_rect *clip);
+				 const struct drm_rect *clip, struct drm_xfrm_buf *xfrm);
 void drm_fb_xrgb8888_to_argb1555(struct iosys_map *dst, const unsigned int *dst_pitch,
 				 const struct iosys_map *src, const struct drm_framebuffer *fb,
-				 const struct drm_rect *clip);
+				 const struct drm_rect *clip, struct drm_xfrm_buf *xfrm);
 void drm_fb_xrgb8888_to_rgba5551(struct iosys_map *dst, const unsigned int *dst_pitch,
 				 const struct iosys_map *src, const struct drm_framebuffer *fb,
-				 const struct drm_rect *clip);
+				 const struct drm_rect *clip, struct drm_xfrm_buf *xfrm);
 void drm_fb_xrgb8888_to_rgb888(struct iosys_map *dst, const unsigned int *dst_pitch,
 			       const struct iosys_map *src, const struct drm_framebuffer *fb,
-			       const struct drm_rect *clip);
+			       const struct drm_rect *clip, struct drm_xfrm_buf *xfrm);
 void drm_fb_xrgb8888_to_argb8888(struct iosys_map *dst, const unsigned int *dst_pitch,
 				 const struct iosys_map *src, const struct drm_framebuffer *fb,
-				 const struct drm_rect *clip);
+				 const struct drm_rect *clip, struct drm_xfrm_buf *xfrm);
 void drm_fb_xrgb8888_to_xrgb2101010(struct iosys_map *dst, const unsigned int *dst_pitch,
 				    const struct iosys_map *src, const struct drm_framebuffer *fb,
-				    const struct drm_rect *clip);
+				    const struct drm_rect *clip, struct drm_xfrm_buf *xfrm);
 void drm_fb_xrgb8888_to_argb2101010(struct iosys_map *dst, const unsigned int *dst_pitch,
 				    const struct iosys_map *src, const struct drm_framebuffer *fb,
-				    const struct drm_rect *clip);
+				    const struct drm_rect *clip, struct drm_xfrm_buf *xfrm);
 void drm_fb_xrgb8888_to_gray8(struct iosys_map *dst, const unsigned int *dst_pitch,
 			      const struct iosys_map *src, const struct drm_framebuffer *fb,
-			      const struct drm_rect *clip);
+			      const struct drm_rect *clip, struct drm_xfrm_buf *xfrm);
 
 int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t dst_format,
 		const struct iosys_map *src, const struct drm_framebuffer *fb,
-		const struct drm_rect *rect);
+		const struct drm_rect *clip, struct drm_xfrm_buf *xfrm);
 
 void drm_fb_xrgb8888_to_mono(struct iosys_map *dst, const unsigned int *dst_pitch,
 			     const struct iosys_map *src, const struct drm_framebuffer *fb,
-			     const struct drm_rect *clip);
+			     const struct drm_rect *clip, struct drm_xfrm_buf *xfrm);
 
 size_t drm_fb_build_fourcc_list(struct drm_device *dev,
 				const u32 *native_fourccs, size_t native_nfourccs,
-- 
2.42.0

