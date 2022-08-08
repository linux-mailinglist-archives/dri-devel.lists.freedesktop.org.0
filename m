Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B5A58C8F3
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 15:04:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C7E291093;
	Mon,  8 Aug 2022 12:54:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42CCB90E6E
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 12:54:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B21DC37AD8;
 Mon,  8 Aug 2022 12:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659963249; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KAS9yhThpc4hI3qsMPzA1bQpQ2ChV0pmCL6gM2OzXug=;
 b=RQy67gDbtTGbf2d7fkVmJgGDJ8VuAr5Px+9XN4D73XyJVOtJl3MrQBLijzq2JSfmN/q5/3
 8tzbVnzkgWIrTfBJDoYJnGH5nDXggMEZ/gsRpcnPZR6XHQiNPnof7MkFIbezKBvnnuZ7mG
 p/ZVR0C99h8537oHffUT3+MmVojwE+8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659963249;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KAS9yhThpc4hI3qsMPzA1bQpQ2ChV0pmCL6gM2OzXug=;
 b=Cb+mvJ7YkMCGh3iwGtI95x23hjPvzHTxjj6ERO1uMEe9VpRhniEbECHkhaOzzQlsJDIt6U
 UJ/VAGxbxmweSRAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5627913A7C;
 Mon,  8 Aug 2022 12:54:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ACT/E3EH8WLHUgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 08 Aug 2022 12:54:09 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: sam@ravnborg.org, jose.exposito89@gmail.com, javierm@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, noralf@tronnes.org, drawat.floss@gmail.com,
 lucas.demarchi@intel.com, david@lechnology.com, kraxel@redhat.com
Subject: [PATCH v2 03/14] drm/format-helper: Merge drm_fb_memcpy() and
 drm_fb_memcpy_toio()
Date: Mon,  8 Aug 2022 14:53:55 +0200
Message-Id: <20220808125406.20752-4-tzimmermann@suse.de>
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

Merge drm_fb_memcpy() and drm_fb_memcpy_toio() into a drm_fb_memcpy()
that uses struct iosys_map for buffers. The new function also supports
multi-plane color formats. Convert all users of the original helpers.

v2:
	* rebase onto refactored mgag200
	* use drm_formap_info_bpp() (Sam)
	* do static init in hyperv and mgag200 (Sam)
	* update documentation (Sam)
	* add TODO on vaddr location (Sam)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_format_helper.c         | 90 ++++++++++-----------
 drivers/gpu/drm/drm_mipi_dbi.c              |  3 +-
 drivers/gpu/drm/gud/gud_pipe.c              |  4 +-
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c |  9 +--
 drivers/gpu/drm/mgag200/mgag200_mode.c      |  9 +--
 drivers/gpu/drm/tiny/cirrus.c               | 21 ++---
 include/drm/drm_format_helper.h             |  7 +-
 7 files changed, 70 insertions(+), 73 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 07f329f607a3..7489c665a47c 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -131,63 +131,57 @@ static int drm_fb_xfrm_toio(void __iomem *dst, unsigned long dst_pitch, unsigned
 
 /**
  * drm_fb_memcpy - Copy clip buffer
- * @dst: Destination buffer
- * @dst_pitch: Number of bytes between two consecutive scanlines within dst
- * @vaddr: Source buffer
+ * @dst: Array of destination buffers
+ * @dst_pitch: Array of numbers of bytes between the start of two consecutive scanlines
+ *             within @dst; can be NULL if scanlines are stored next to each other.
+ * @vmap: Array of source buffers
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
  *
- * This function does not apply clipping on dst, i.e. the destination
- * is at the top-left corner.
- */
-void drm_fb_memcpy(void *dst, unsigned int dst_pitch, const void *vaddr,
-		   const struct drm_framebuffer *fb, const struct drm_rect *clip)
-{
-	unsigned int cpp = fb->format->cpp[0];
-	size_t len = (clip->x2 - clip->x1) * cpp;
-	unsigned int y, lines = clip->y2 - clip->y1;
-
-	if (!dst_pitch)
-		dst_pitch = len;
-
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
+ * This function copies parts of a framebuffer to display memory. Destination and
+ * framebuffer formats must match. No conversion takes place. The parameters @dst,
+ * @dst_pitch and @vmap refer to arrays. Each array must have at least as many entries
+ * as there are planes in @fb's format. Each entry stores the value for the format's
+ * respective color plane at the same index.
  *
- * This function does not apply clipping on dst, i.e. the destination
- * is at the top-left corner.
+ * This function does not apply clipping on @dst (i.e. the destination is at the
+ * top-left corner).
  */
-void drm_fb_memcpy_toio(void __iomem *dst, unsigned int dst_pitch, const void *vaddr,
-			const struct drm_framebuffer *fb, const struct drm_rect *clip)
+void drm_fb_memcpy(struct iosys_map *dst, const unsigned int *dst_pitch,
+		   const struct iosys_map *vmap, const struct drm_framebuffer *fb,
+		   const struct drm_rect *clip)
 {
-	unsigned int cpp = fb->format->cpp[0];
-	size_t len = (clip->x2 - clip->x1) * cpp;
-	unsigned int y, lines = clip->y2 - clip->y1;
+	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
+		0, 0, 0, 0
+	};
 
-	if (!dst_pitch)
-		dst_pitch = len;
+	const struct drm_format_info *format = fb->format;
+	unsigned int i, y, lines = drm_rect_height(clip);
 
-	vaddr += clip_offset(clip, fb->pitches[0], cpp);
-	for (y = 0; y < lines; y++) {
-		memcpy_toio(dst, vaddr, len);
-		vaddr += fb->pitches[0];
-		dst += dst_pitch;
+	if (!dst_pitch)
+		dst_pitch = default_dst_pitch;
+
+	for (i = 0; i < format->num_planes; ++i) {
+		unsigned int bpp_i = drm_format_info_bpp(format, i);
+		unsigned int cpp_i = DIV_ROUND_UP(bpp_i, 8);
+		size_t len_i = DIV_ROUND_UP(drm_rect_width(clip) * bpp_i, 8);
+		unsigned int dst_pitch_i = dst_pitch[i];
+		struct iosys_map dst_i = dst[i];
+		struct iosys_map vmap_i = vmap[i];
+
+		if (!dst_pitch_i)
+			dst_pitch_i = len_i;
+
+		iosys_map_incr(&vmap_i, clip_offset(clip, fb->pitches[i], cpp_i));
+		for (y = 0; y < lines; y++) {
+			/* TODO: handle vmap_i in I/O memory here */
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
@@ -587,7 +581,7 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
 		dst_format = DRM_FORMAT_XRGB2101010;
 
 	if (dst_format == fb_format) {
-		drm_fb_memcpy_toio(dst[0].vaddr_iomem, dst_pitch[0], vmap[0].vaddr, fb, clip);
+		drm_fb_memcpy(dst, dst_pitch, vmap, fb, clip);
 		return 0;
 
 	} else if (dst_format == DRM_FORMAT_RGB565) {
diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 2ecaf3cb7afb..1ba506ca83e1 100644
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
index b8e64dd8d3a6..28e732f94bf2 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
@@ -21,19 +21,18 @@
 #include "hyperv_drm.h"
 
 static int hyperv_blit_to_vram_rect(struct drm_framebuffer *fb,
-				    const struct iosys_map *map,
+				    const struct iosys_map *vmap,
 				    struct drm_rect *rect)
 {
 	struct hyperv_drm_device *hv = to_hv(fb->dev);
-	void __iomem *dst = hv->vram;
-	void *vmap = map->vaddr; /* TODO: Use mapping abstraction properly */
+	struct iosys_map dst = IOSYS_MAP_INIT_VADDR_IOMEM(hv->vram);
 	int idx;
 
 	if (!drm_dev_enter(&hv->dev, &idx))
 		return -ENODEV;
 
-	dst += drm_fb_clip_offset(fb->pitches[0], fb->format, rect);
-	drm_fb_memcpy_toio(dst, fb->pitches[0], vmap, fb, rect);
+	iosys_map_incr(&dst, drm_fb_clip_offset(fb->pitches[0], fb->format, rect));
+	drm_fb_memcpy(&dst, fb->pitches, vmap, fb, rect);
 
 	drm_dev_exit(idx);
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 1f26d4716679..bbab2549243a 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -430,13 +430,12 @@ static void mgag200_disable_display(struct mga_device *mdev)
 }
 
 static void mgag200_handle_damage(struct mga_device *mdev, const struct iosys_map *vmap,
-				  struct drm_framebuffer *fb, const struct drm_rect *clip)
+				  struct drm_framebuffer *fb, struct drm_rect *clip)
 {
-	void __iomem *dst = mdev->vram;
-	void *vaddr = vmap[0].vaddr; /* TODO: Use mapping abstraction properly */
+	struct iosys_map dst = IOSYS_MAP_INIT_VADDR_IOMEM(mdev->vram);
 
-	dst += drm_fb_clip_offset(fb->pitches[0], fb->format, clip);
-	drm_fb_memcpy_toio(dst, fb->pitches[0], vaddr, fb, clip);
+	iosys_map_incr(&dst, drm_fb_clip_offset(fb->pitches[0], fb->format, clip));
+	drm_fb_memcpy(&dst, fb->pitches, vmap, fb, clip);
 }
 
 /*
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

