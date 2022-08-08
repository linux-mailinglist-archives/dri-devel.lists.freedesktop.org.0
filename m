Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5293E58C964
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 15:27:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D6F6926A0;
	Mon,  8 Aug 2022 12:54:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDE1B90DA0
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 12:54:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8658F2015A;
 Mon,  8 Aug 2022 12:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659963253; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z9DHbV6EJTPpLM0csnHWObVyeL5l8bf15YDcrzhNDOE=;
 b=umTIGuWVlQ7POPcEIo0FwtmO8YefbAZYA7G+rbZHaIokzxij2iZAUaRmBsgrUjzDSHBoZ0
 pJgSksZN+/EU8EUTlJsaty0GekhOKIeeV4FTmVkhkLndSWaATdWqszsJgyrT+LrN3NUT4b
 H8HbiRnn+D73PUAInfyx8pIFjJvdjC0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659963253;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z9DHbV6EJTPpLM0csnHWObVyeL5l8bf15YDcrzhNDOE=;
 b=xJ27HFMUXnqbd0WjhgyK9NyrHVNy9uGFiAJb5bvWkI7gmCv7w46k4Mw7PgQgl3iOHaJxJ/
 6oN9qMbW+2R2puCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2E7FF13A7C;
 Mon,  8 Aug 2022 12:54:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AO1YCnUH8WLHUgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 08 Aug 2022 12:54:13 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: sam@ravnborg.org, jose.exposito89@gmail.com, javierm@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, noralf@tronnes.org, drawat.floss@gmail.com,
 lucas.demarchi@intel.com, david@lechnology.com, kraxel@redhat.com
Subject: [PATCH v2 13/14] drm/format-helper: Move destination-buffer handling
 into internal helper
Date: Mon,  8 Aug 2022 14:54:05 +0200
Message-Id: <20220808125406.20752-14-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220808125406.20752-1-tzimmermann@suse.de>
References: <20220808125406.20752-1-tzimmermann@suse.de>
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
Cc: linux-hyperv@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The format-convertion helpers handle several cases for different
values of destination buffer and pitch. Move that code into the
internal helper drm_fb_xfrm() and avoid quite a bit of duplication.

v2:
	* remove a duplicated blank line (Jose)
	* use drm_format_info_bpp() (Sam)
 	* fix vaddr_cached_hint bug (Sam)
	* add TODO on vaddr location (Sam)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_format_helper.c | 174 ++++++++++------------------
 1 file changed, 63 insertions(+), 111 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 53a313f83dc2..0fec3b68db95 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -41,11 +41,11 @@ unsigned int drm_fb_clip_offset(unsigned int pitch, const struct drm_format_info
 }
 EXPORT_SYMBOL(drm_fb_clip_offset);
 
-/* TODO: Make this functon work with multi-plane formats. */
-static int drm_fb_xfrm(void *dst, unsigned long dst_pitch, unsigned long dst_pixsize,
-		       const void *vaddr, const struct drm_framebuffer *fb,
-		       const struct drm_rect *clip, bool vaddr_cached_hint,
-		       void (*xfrm_line)(void *dbuf, const void *sbuf, unsigned int npixels))
+/* TODO: Make this function work with multi-plane formats. */
+static int __drm_fb_xfrm(void *dst, unsigned long dst_pitch, unsigned long dst_pixsize,
+			 const void *vaddr, const struct drm_framebuffer *fb,
+			 const struct drm_rect *clip, bool vaddr_cached_hint,
+			 void (*xfrm_line)(void *dbuf, const void *sbuf, unsigned int npixels))
 {
 	unsigned long linepixels = drm_rect_width(clip);
 	unsigned long lines = drm_rect_height(clip);
@@ -84,11 +84,11 @@ static int drm_fb_xfrm(void *dst, unsigned long dst_pitch, unsigned long dst_pix
 	return 0;
 }
 
-/* TODO: Make this functon work with multi-plane formats. */
-static int drm_fb_xfrm_toio(void __iomem *dst, unsigned long dst_pitch, unsigned long dst_pixsize,
-			    const void *vaddr, const struct drm_framebuffer *fb,
-			    const struct drm_rect *clip, bool vaddr_cached_hint,
-			    void (*xfrm_line)(void *dbuf, const void *sbuf, unsigned int npixels))
+/* TODO: Make this function work with multi-plane formats. */
+static int __drm_fb_xfrm_toio(void __iomem *dst, unsigned long dst_pitch, unsigned long dst_pixsize,
+			      const void *vaddr, const struct drm_framebuffer *fb,
+			      const struct drm_rect *clip, bool vaddr_cached_hint,
+			      void (*xfrm_line)(void *dbuf, const void *sbuf, unsigned int npixels))
 {
 	unsigned long linepixels = drm_rect_width(clip);
 	unsigned long lines = drm_rect_height(clip);
@@ -129,6 +129,29 @@ static int drm_fb_xfrm_toio(void __iomem *dst, unsigned long dst_pitch, unsigned
 	return 0;
 }
 
+/* TODO: Make this function work with multi-plane formats. */
+static int drm_fb_xfrm(struct iosys_map *dst,
+		       const unsigned int *dst_pitch, const u8 *dst_pixsize,
+		       const struct iosys_map *vmap, const struct drm_framebuffer *fb,
+		       const struct drm_rect *clip, bool vaddr_cached_hint,
+		       void (*xfrm_line)(void *dbuf, const void *sbuf, unsigned int npixels))
+{
+	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
+		0, 0, 0, 0
+	};
+
+	if (!dst_pitch)
+		dst_pitch = default_dst_pitch;
+
+	/* TODO: handle vmap in I/O memory here */
+	if (dst[0].is_iomem)
+		return __drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], dst_pixsize[0],
+					  vmap[0].vaddr, fb, clip, vaddr_cached_hint, xfrm_line);
+	else
+		return __drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], dst_pixsize[0],
+				     vmap[0].vaddr, fb, clip, vaddr_cached_hint, xfrm_line);
+}
+
 /**
  * drm_fb_memcpy - Copy clip buffer
  * @dst: Array of destination buffers
@@ -228,9 +251,6 @@ void drm_fb_swab(struct iosys_map *dst, const unsigned int *dst_pitch,
 		 const struct iosys_map *vmap, const struct drm_framebuffer *fb,
 		 const struct drm_rect *clip, bool cached)
 {
-	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
-		0, 0, 0, 0
-	};
 	const struct drm_format_info *format = fb->format;
 	u8 cpp = DIV_ROUND_UP(drm_format_info_bpp(format, 0), 8);
 	void (*swab_line)(void *dbuf, const void *sbuf, unsigned int npixels);
@@ -245,22 +265,10 @@ void drm_fb_swab(struct iosys_map *dst, const unsigned int *dst_pitch,
 	default:
 		drm_warn_once(fb->dev, "Format %p4cc has unsupported pixel size.\n",
 			      &format->format);
-		swab_line = NULL;
-		break;
-	}
-	if (!swab_line)
 		return;
+	}
 
-	if (!dst_pitch)
-		dst_pitch = default_dst_pitch;
-
-	/* TODO: handle vmap in I/O memory here */
-	if (dst->is_iomem)
-		drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], cpp,
-				 vmap[0].vaddr, fb, clip, cached, swab_line);
-	else
-		drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], cpp, vmap[0].vaddr, fb,
-			    clip, cached, swab_line);
+	drm_fb_xfrm(dst, dst_pitch, &cpp, vmap, fb, clip, cached, swab_line);
 }
 EXPORT_SYMBOL(drm_fb_swab);
 
@@ -303,20 +311,12 @@ void drm_fb_xrgb8888_to_rgb332(struct iosys_map *dst, const unsigned int *dst_pi
 			       const struct iosys_map *vmap, const struct drm_framebuffer *fb,
 			       const struct drm_rect *clip)
 {
-	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
-		0, 0, 0, 0
+	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
+		1,
 	};
 
-	if (!dst_pitch)
-		dst_pitch = default_dst_pitch;
-
-	/* TODO: handle vmap in I/O memory here */
-	if (dst[0].is_iomem)
-		drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], 1, vmap[0].vaddr, fb, clip,
-				 false, drm_fb_xrgb8888_to_rgb332_line);
-	else
-		drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], 1, vmap[0].vaddr, fb, clip,
-			    false, drm_fb_xrgb8888_to_rgb332_line);
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, vmap, fb, clip, false,
+		    drm_fb_xrgb8888_to_rgb332_line);
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb332);
 
@@ -380,9 +380,10 @@ void drm_fb_xrgb8888_to_rgb565(struct iosys_map *dst, const unsigned int *dst_pi
 			       const struct iosys_map *vmap, const struct drm_framebuffer *fb,
 			       const struct drm_rect *clip, bool swab)
 {
-	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
-		0, 0, 0, 0
+	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
+		2,
 	};
+
 	void (*xfrm_line)(void *dbuf, const void *sbuf, unsigned int npixels);
 
 	if (swab)
@@ -390,16 +391,7 @@ void drm_fb_xrgb8888_to_rgb565(struct iosys_map *dst, const unsigned int *dst_pi
 	else
 		xfrm_line = drm_fb_xrgb8888_to_rgb565_line;
 
-	if (!dst_pitch)
-		dst_pitch = default_dst_pitch;
-
-	/* TODO: handle vmap in I/O memory here */
-	if (dst[0].is_iomem)
-		drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], 2, vmap[0].vaddr, fb, clip,
-				 false, xfrm_line);
-	else
-		drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], 2, vmap[0].vaddr, fb, clip,
-			    false, xfrm_line);
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, vmap, fb, clip, false, xfrm_line);
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb565);
 
@@ -443,20 +435,12 @@ void drm_fb_xrgb8888_to_rgb888(struct iosys_map *dst, const unsigned int *dst_pi
 			       const struct iosys_map *vmap, const struct drm_framebuffer *fb,
 			       const struct drm_rect *clip)
 {
-	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
-		0, 0, 0, 0
+	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
+		3,
 	};
 
-	if (!dst_pitch)
-		dst_pitch = default_dst_pitch;
-
-	/* TODO: handle vmap in I/O memory here */
-	if (dst[0].is_iomem)
-		drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], 3, vmap[0].vaddr, fb,
-				 clip, false, drm_fb_xrgb8888_to_rgb888_line);
-	else
-		drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], 3, vmap[0].vaddr, fb,
-			    clip, false, drm_fb_xrgb8888_to_rgb888_line);
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, vmap, fb, clip, false,
+		    drm_fb_xrgb8888_to_rgb888_line);
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb888);
 
@@ -483,20 +467,12 @@ static void drm_fb_rgb565_to_xrgb8888(struct iosys_map *dst, const unsigned int
 				      const struct drm_framebuffer *fb,
 				      const struct drm_rect *clip)
 {
-	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
-		0, 0, 0, 0
+	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
+		4,
 	};
 
-	if (!dst_pitch)
-		dst_pitch = default_dst_pitch;
-
-	/* TODO: handle vmap in I/O memory here */
-	if (dst[0].is_iomem)
-		drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], 4, vmap[0].vaddr, fb,
-				 clip, false, drm_fb_rgb565_to_xrgb8888_line);
-	else
-		drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], 4, vmap[0].vaddr, fb,
-			    clip, false, drm_fb_rgb565_to_xrgb8888_line);
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, vmap, fb, clip, false,
+		    drm_fb_rgb565_to_xrgb8888_line);
 }
 
 static void drm_fb_rgb888_to_xrgb8888_line(void *dbuf, const void *sbuf, unsigned int pixels)
@@ -519,20 +495,12 @@ static void drm_fb_rgb888_to_xrgb8888(struct iosys_map *dst, const unsigned int
 				      const struct drm_framebuffer *fb,
 				      const struct drm_rect *clip)
 {
-	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
-		0, 0, 0, 0
+	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
+		4,
 	};
 
-	if (!dst_pitch)
-		dst_pitch = default_dst_pitch;
-
-	/* TODO: handle vmap in I/O memory here */
-	if (dst[0].is_iomem)
-		drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], 4, vmap[0].vaddr, fb,
-				 clip, false, drm_fb_rgb888_to_xrgb8888_line);
-	else
-		drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], 4, vmap[0].vaddr, fb,
-			    clip, false, drm_fb_rgb888_to_xrgb8888_line);
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, vmap, fb, clip, false,
+		    drm_fb_rgb888_to_xrgb8888_line);
 }
 
 static void drm_fb_xrgb8888_to_xrgb2101010_line(void *dbuf, const void *sbuf, unsigned int pixels)
@@ -578,20 +546,12 @@ void drm_fb_xrgb8888_to_xrgb2101010(struct iosys_map *dst, const unsigned int *d
 				    const struct iosys_map *vmap, const struct drm_framebuffer *fb,
 				    const struct drm_rect *clip)
 {
-	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
-		0, 0, 0, 0
+	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
+		4,
 	};
 
-	if (!dst_pitch)
-		dst_pitch = default_dst_pitch;
-
-	/* TODO: handle vmap in I/O memory here */
-	if (dst[0].is_iomem)
-		drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], 4, vmap[0].vaddr, fb,
-				 clip, false, drm_fb_xrgb8888_to_xrgb2101010_line);
-	else
-		drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], 4, vmap[0].vaddr, fb,
-			    clip, false, drm_fb_xrgb8888_to_xrgb2101010_line);
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, vmap, fb, clip, false,
+		    drm_fb_xrgb8888_to_xrgb2101010_line);
 }
 
 static void drm_fb_xrgb8888_to_gray8_line(void *dbuf, const void *sbuf, unsigned int pixels)
@@ -640,20 +600,12 @@ void drm_fb_xrgb8888_to_gray8(struct iosys_map *dst, const unsigned int *dst_pit
 			      const struct iosys_map *vmap, const struct drm_framebuffer *fb,
 			      const struct drm_rect *clip)
 {
-	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
-		0, 0, 0, 0
+	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
+		1,
 	};
 
-	if (!dst_pitch)
-		dst_pitch = default_dst_pitch;
-
-	/* TODO: handle vmap in I/O memory here */
-	if (dst[0].is_iomem)
-		drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], 1, vmap[0].vaddr, fb,
-				 clip, false, drm_fb_xrgb8888_to_gray8_line);
-	else
-		drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], 1, vmap[0].vaddr, fb,
-			    clip, false, drm_fb_xrgb8888_to_gray8_line);
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, vmap, fb, clip, false,
+		    drm_fb_xrgb8888_to_gray8_line);
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_gray8);
 
-- 
2.37.1

