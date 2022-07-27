Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1D858257F
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 13:33:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD76C4745;
	Wed, 27 Jul 2022 11:33:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2B9EC478A
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 11:33:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7ADC1385B7;
 Wed, 27 Jul 2022 11:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658921617; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1tx4xT9H8VpACCR2MYf2EKEWAn/IBCrTdYUBs4LfPm8=;
 b=Dl6ovlWbMj+PHyx9Hq+uEcPD0FJwMk+kP1dPTaj4MHDU7blShx8EhxfvPSHn/YVBnoBf0b
 srh9i1DrYAp300+8BDL01EKE662uK4vHmiyag1nWCx2Ia6sUklr55DNI572eXjmepbJbm7
 11Blj6v56OJSIZ36lgXbaa8AZwXvdL8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658921617;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1tx4xT9H8VpACCR2MYf2EKEWAn/IBCrTdYUBs4LfPm8=;
 b=Na5sJKMBSgNVgOJSmGrJvbE+o/67nadQ9WPZu2Q5GBKQWF+2MzEbkONcWVXup1PpJwSdl/
 bx+s3c46HaZv3TAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3107013A8E;
 Wed, 27 Jul 2022 11:33:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iKX5CpEi4WJmBAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 27 Jul 2022 11:33:37 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: sam@ravnborg.org, noralf@tronnes.org, daniel@ffwll.ch, airlied@linux.ie,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, airlied@redhat.com,
 javierm@redhat.com, drawat.floss@gmail.com, kraxel@redhat.com,
 david@lechnology.com, jose.exposito89@gmail.com
Subject: [PATCH 02/12] drm/format-helper: Merge drm_fb_memcpy() and
 drm_fb_memcpy_toio()
Date: Wed, 27 Jul 2022 13:33:02 +0200
Message-Id: <20220727113312.22407-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220727113312.22407-1-tzimmermann@suse.de>
References: <20220727113312.22407-1-tzimmermann@suse.de>
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

Merge drm_fb_memcpy() and drm_fb_memcpy() into drm_fb_memcpy() that
uses struct iosys_map for buffers. The new function also supports
multi-plane color formats. Convert all users of the original helpers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_format_helper.c         | 77 +++++++++------------
 drivers/gpu/drm/drm_mipi_dbi.c              |  3 +-
 drivers/gpu/drm/gud/gud_pipe.c              |  4 +-
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c | 11 +--
 drivers/gpu/drm/mgag200/mgag200_mode.c      | 11 +--
 drivers/gpu/drm/tiny/cirrus.c               | 21 +++---
 include/drm/drm_format_helper.h             |  7 +-
 7 files changed, 63 insertions(+), 71 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 4d74d46ab155..49589b442f18 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -131,63 +131,48 @@ static int drm_fb_xfrm_toio(void __iomem *dst, unsigned long dst_pitch, unsigned
 
 /**
  * drm_fb_memcpy - Copy clip buffer
- * @dst: Destination buffer
- * @dst_pitch: Number of bytes between two consecutive scanlines within dst
- * @vaddr: Source buffer
+ * @dst: Array of destination buffers
+ * @dst_pitch: Array of numbers of bytes between two consecutive scanlines within dst
+ * @vmap: Array of source buffers
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
  *
  * This function does not apply clipping on dst, i.e. the destination
  * is at the top-left corner.
  */
-void drm_fb_memcpy(void *dst, unsigned int dst_pitch, const void *vaddr,
-		   const struct drm_framebuffer *fb, const struct drm_rect *clip)
+void drm_fb_memcpy(struct iosys_map *dst, const unsigned int *dst_pitch,
+		   const struct iosys_map *vmap, const struct drm_framebuffer *fb,
+		   const struct drm_rect *clip)
 {
-	unsigned int cpp = fb->format->cpp[0];
-	size_t len = (clip->x2 - clip->x1) * cpp;
-	unsigned int y, lines = clip->y2 - clip->y1;
-
-	if (!dst_pitch)
-		dst_pitch = len;
+	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
+		0, 0, 0, 0
+	};
 
-	vaddr += clip_offset(clip, fb->pitches[0], cpp);
-	for (y = 0; y < lines; y++) {
-		memcpy(dst, vaddr, len);
-		vaddr += fb->pitches[0];
-		dst += dst_pitch;
-	}
-}
-EXPORT_SYMBOL(drm_fb_memcpy);
-
-/**
- * drm_fb_memcpy_toio - Copy clip buffer
- * @dst: Destination buffer (iomem)
- * @dst_pitch: Number of bytes between two consecutive scanlines within dst
- * @vaddr: Source buffer
- * @fb: DRM framebuffer
- * @clip: Clip rectangle area to copy
- *
- * This function does not apply clipping on dst, i.e. the destination
- * is at the top-left corner.
- */
-void drm_fb_memcpy_toio(void __iomem *dst, unsigned int dst_pitch, const void *vaddr,
-			const struct drm_framebuffer *fb, const struct drm_rect *clip)
-{
-	unsigned int cpp = fb->format->cpp[0];
-	size_t len = (clip->x2 - clip->x1) * cpp;
-	unsigned int y, lines = clip->y2 - clip->y1;
+	const struct drm_format_info *format = fb->format;
+	unsigned int i, y, lines = drm_rect_height(clip);
 
 	if (!dst_pitch)
-		dst_pitch = len;
-
-	vaddr += clip_offset(clip, fb->pitches[0], cpp);
-	for (y = 0; y < lines; y++) {
-		memcpy_toio(dst, vaddr, len);
-		vaddr += fb->pitches[0];
-		dst += dst_pitch;
+		dst_pitch = default_dst_pitch;
+
+	for (i = 0; i < format->num_planes; ++i) {
+		unsigned int cpp_i = format->cpp[i];
+		size_t len_i = drm_rect_width(clip) * cpp_i;
+		unsigned int dst_pitch_i = dst_pitch[i];
+		struct iosys_map dst_i = dst[i];
+		struct iosys_map vmap_i = vmap[i];
+
+		if (!dst_pitch_i)
+			dst_pitch_i = len_i;
+
+		iosys_map_incr(&vmap_i, clip_offset(clip, fb->pitches[i], cpp_i));
+		for (y = 0; y < lines; y++) {
+			iosys_map_memcpy_to(&dst_i, 0, vmap_i.vaddr, len_i);
+			iosys_map_incr(&vmap_i, fb->pitches[i]);
+			iosys_map_incr(&dst_i, dst_pitch_i);
+		}
 	}
 }
-EXPORT_SYMBOL(drm_fb_memcpy_toio);
+EXPORT_SYMBOL(drm_fb_memcpy);
 
 static void drm_fb_swab16_line(void *dbuf, const void *sbuf, unsigned int pixels)
 {
@@ -584,7 +569,7 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
 		dst_format = DRM_FORMAT_XRGB2101010;
 
 	if (dst_format == fb_format) {
-		drm_fb_memcpy_toio(dst[0].vaddr_iomem, dst_pitch[0], vmap[0].vaddr, fb, clip);
+		drm_fb_memcpy(dst, dst_pitch, vmap, fb, clip);
 		return 0;
 
 	} else if (dst_format == DRM_FORMAT_RGB565) {
diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 2f61f53d472f..22451806fb5c 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -205,6 +205,7 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
 	struct drm_gem_object *gem = drm_gem_fb_get_obj(fb, 0);
 	struct iosys_map map[DRM_FORMAT_MAX_PLANES];
 	struct iosys_map data[DRM_FORMAT_MAX_PLANES];
+	struct iosys_map dst_map = IOSYS_MAP_INIT_VADDR(dst);
 	void *src;
 	int ret;
 
@@ -222,7 +223,7 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
 		if (swap)
 			drm_fb_swab(dst, 0, src, fb, clip, !gem->import_attach);
 		else
-			drm_fb_memcpy(dst, 0, src, fb, clip);
+			drm_fb_memcpy(&dst_map, NULL, data, fb, clip);
 		break;
 	case DRM_FORMAT_XRGB8888:
 		drm_fb_xrgb8888_to_rgb565(dst, 0, src, fb, clip, swap);
diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index d42592f6daab..449c95a4aee0 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -156,6 +156,7 @@ static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
 	u8 compression = gdrm->compression;
 	struct iosys_map map[DRM_FORMAT_MAX_PLANES];
 	struct iosys_map map_data[DRM_FORMAT_MAX_PLANES];
+	struct iosys_map dst;
 	void *vaddr, *buf;
 	size_t pitch, len;
 	int ret = 0;
@@ -179,6 +180,7 @@ static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
 		buf = gdrm->compress_buf;
 	else
 		buf = gdrm->bulk_buf;
+	iosys_map_set_vaddr(&dst, buf);
 
 	/*
 	 * Imported buffers are assumed to be write-combined and thus uncached
@@ -208,7 +210,7 @@ static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
 		/* can compress directly from the framebuffer */
 		buf = vaddr + rect->y1 * pitch;
 	} else {
-		drm_fb_memcpy(buf, 0, vaddr, fb, rect);
+		drm_fb_memcpy(&dst, NULL, map_data, fb, rect);
 	}
 
 	memset(req, 0, sizeof(*req));
diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
index b8e64dd8d3a6..26e63148e226 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
@@ -21,19 +21,20 @@
 #include "hyperv_drm.h"
 
 static int hyperv_blit_to_vram_rect(struct drm_framebuffer *fb,
-				    const struct iosys_map *map,
+				    const struct iosys_map *vmap,
 				    struct drm_rect *rect)
 {
 	struct hyperv_drm_device *hv = to_hv(fb->dev);
-	void __iomem *dst = hv->vram;
-	void *vmap = map->vaddr; /* TODO: Use mapping abstraction properly */
+	struct iosys_map dst;
 	int idx;
 
 	if (!drm_dev_enter(&hv->dev, &idx))
 		return -ENODEV;
 
-	dst += drm_fb_clip_offset(fb->pitches[0], fb->format, rect);
-	drm_fb_memcpy_toio(dst, fb->pitches[0], vmap, fb, rect);
+	iosys_map_set_vaddr_iomem(&dst, hv->vram);
+	iosys_map_incr(&dst, drm_fb_clip_offset(fb->pitches[0], fb->format, rect));
+
+	drm_fb_memcpy(&dst, fb->pitches, vmap, fb, rect);
 
 	drm_dev_exit(idx);
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index a02f599cb9cf..a79a0ee3a50d 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -755,13 +755,14 @@ mgag200_simple_display_pipe_mode_valid(struct drm_simple_display_pipe *pipe,
 
 static void
 mgag200_handle_damage(struct mga_device *mdev, struct drm_framebuffer *fb,
-		      struct drm_rect *clip, const struct iosys_map *map)
+		      struct drm_rect *clip, const struct iosys_map *vmap)
 {
-	void __iomem *dst = mdev->vram;
-	void *vmap = map->vaddr; /* TODO: Use mapping abstraction properly */
+	struct iosys_map dst;
 
-	dst += drm_fb_clip_offset(fb->pitches[0], fb->format, clip);
-	drm_fb_memcpy_toio(dst, fb->pitches[0], vmap, fb, clip);
+	iosys_map_set_vaddr_iomem(&dst, mdev->vram);
+	iosys_map_incr(&dst, drm_fb_clip_offset(fb->pitches[0], fb->format, clip));
+
+	drm_fb_memcpy(&dst, fb->pitches, vmap, fb, clip);
 }
 
 static void
diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index c4f5beea1f90..73fb9f63d227 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -316,28 +316,31 @@ static int cirrus_mode_set(struct cirrus_device *cirrus,
 }
 
 static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
-			       const struct iosys_map *map,
+			       const struct iosys_map *vmap,
 			       struct drm_rect *rect)
 {
 	struct cirrus_device *cirrus = to_cirrus(fb->dev);
-	void __iomem *dst = cirrus->vram;
-	void *vmap = map->vaddr; /* TODO: Use mapping abstraction properly */
+	struct iosys_map dst;
+	void *vaddr = vmap->vaddr; /* TODO: Use mapping abstraction properly */
 	int idx;
 
 	if (!drm_dev_enter(&cirrus->dev, &idx))
 		return -ENODEV;
 
+	iosys_map_set_vaddr_iomem(&dst, cirrus->vram);
+
 	if (cirrus->cpp == fb->format->cpp[0]) {
-		dst += drm_fb_clip_offset(fb->pitches[0], fb->format, rect);
-		drm_fb_memcpy_toio(dst, fb->pitches[0], vmap, fb, rect);
+		iosys_map_incr(&dst, drm_fb_clip_offset(fb->pitches[0], fb->format, rect));
+		drm_fb_memcpy(&dst, fb->pitches, vmap, fb, rect);
 
 	} else if (fb->format->cpp[0] == 4 && cirrus->cpp == 2) {
-		dst += drm_fb_clip_offset(cirrus->pitch, fb->format, rect);
-		drm_fb_xrgb8888_to_rgb565_toio(dst, cirrus->pitch, vmap, fb, rect, false);
+		iosys_map_incr(&dst, drm_fb_clip_offset(cirrus->pitch, fb->format, rect));
+		drm_fb_xrgb8888_to_rgb565_toio(dst.vaddr_iomem, cirrus->pitch, vaddr, fb, rect,
+					       false);
 
 	} else if (fb->format->cpp[0] == 4 && cirrus->cpp == 3) {
-		dst += drm_fb_clip_offset(cirrus->pitch, fb->format, rect);
-		drm_fb_xrgb8888_to_rgb888_toio(dst, cirrus->pitch, vmap, fb, rect);
+		iosys_map_incr(&dst, drm_fb_clip_offset(cirrus->pitch, fb->format, rect));
+		drm_fb_xrgb8888_to_rgb888_toio(dst.vaddr_iomem, cirrus->pitch, vaddr, fb, rect);
 
 	} else {
 		WARN_ON_ONCE("cpp mismatch");
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index 21daea7fda99..8af6a2717bc9 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -14,10 +14,9 @@ struct drm_rect;
 unsigned int drm_fb_clip_offset(unsigned int pitch, const struct drm_format_info *format,
 				const struct drm_rect *clip);
 
-void drm_fb_memcpy(void *dst, unsigned int dst_pitch, const void *vaddr,
-		   const struct drm_framebuffer *fb, const struct drm_rect *clip);
-void drm_fb_memcpy_toio(void __iomem *dst, unsigned int dst_pitch, const void *vaddr,
-			const struct drm_framebuffer *fb, const struct drm_rect *clip);
+void drm_fb_memcpy(struct iosys_map *dst, const unsigned int *dst_pitch,
+		   const struct iosys_map *vmap, const struct drm_framebuffer *fb,
+		   const struct drm_rect *clip);
 void drm_fb_swab(void *dst, unsigned int dst_pitch, const void *src,
 		 const struct drm_framebuffer *fb, const struct drm_rect *clip,
 		 bool cached);
-- 
2.37.1

