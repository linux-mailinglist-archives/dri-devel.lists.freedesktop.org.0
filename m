Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A55B758258E
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 13:34:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4FE7C4A54;
	Wed, 27 Jul 2022 11:33:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C416AC478A
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 11:33:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8069020658;
 Wed, 27 Jul 2022 11:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658921618; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=il58xyjTFj22xszisYP4xuz0HT8IpgZnzPHYYN5O6EY=;
 b=ZH0Cq4uUrOc9J2hvnghrC6ea7XH5pOnly9TvskI43zh7g1xCKMKYQZC3CnKZ9pKvft6wjc
 JeSkKkFLzOxgoNBfF86KD1hdI7dLvElX/YkpwClKtHmy0wRgdYGCT4NIRCqMniu4L4aYhr
 Zjdlmwc963Bnclsp6huP/Esj/rCuOT8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658921618;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=il58xyjTFj22xszisYP4xuz0HT8IpgZnzPHYYN5O6EY=;
 b=QCtM5Kc0UfLEehbHELNGrINmfTpzyZQjC4FQ3y94A5gbfnKdMwowf8iSu+vZnHe8FH1z1c
 BAJxhUcGHOcacABw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 302E513AD7;
 Wed, 27 Jul 2022 11:33:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QLWlCpIi4WJmBAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 27 Jul 2022 11:33:38 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: sam@ravnborg.org, noralf@tronnes.org, daniel@ffwll.ch, airlied@linux.ie,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, airlied@redhat.com,
 javierm@redhat.com, drawat.floss@gmail.com, kraxel@redhat.com,
 david@lechnology.com, jose.exposito89@gmail.com
Subject: [PATCH 05/12] drm/format-helper: Rework XRGB8888-to-RGBG565 conversion
Date: Wed, 27 Jul 2022 13:33:05 +0200
Message-Id: <20220727113312.22407-6-tzimmermann@suse.de>
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

Update XRGB8888-to-RGB565 conversion to support struct iosys_map
and convert all users. Although these are single-plane color formats,
the new interface supports multi-plane formats for consistency with
drm_fb_blit().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_format_helper.c | 59 +++++++++++------------------
 drivers/gpu/drm/drm_mipi_dbi.c      |  4 +-
 drivers/gpu/drm/gud/gud_pipe.c      |  3 +-
 drivers/gpu/drm/tiny/cirrus.c       |  3 +-
 include/drm/drm_format_helper.h     |  9 ++---
 5 files changed, 30 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 2b5c3746ff4a..8bf5655f5ce0 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -330,9 +330,9 @@ static void drm_fb_xrgb8888_to_rgb565_swab_line(void *dbuf, const void *sbuf,
 
 /**
  * drm_fb_xrgb8888_to_rgb565 - Convert XRGB8888 to RGB565 clip buffer
- * @dst: RGB565 destination buffer
- * @dst_pitch: Number of bytes between two consecutive scanlines within dst
- * @vaddr: XRGB8888 source buffer
+ * @dst: Array of RGB565 destination buffers
+ * @dst_pitch: Array of numbers of bytes between two consecutive scanlines within dst
+ * @vmap: Array of XRGB8888 source buffer
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
  * @swab: Swap bytes
@@ -340,43 +340,31 @@ static void drm_fb_xrgb8888_to_rgb565_swab_line(void *dbuf, const void *sbuf,
  * Drivers can use this function for RGB565 devices that don't natively
  * support XRGB8888.
  */
-void drm_fb_xrgb8888_to_rgb565(void *dst, unsigned int dst_pitch, const void *vaddr,
-			       const struct drm_framebuffer *fb, const struct drm_rect *clip,
-			       bool swab)
+void drm_fb_xrgb8888_to_rgb565(struct iosys_map *dst, const unsigned int *dst_pitch,
+			       const struct iosys_map *vmap, const struct drm_framebuffer *fb,
+			       const struct drm_rect *clip, bool swab)
 {
+	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
+		0, 0, 0, 0
+	};
+	void (*xfrm_line)(void *dbuf, const void *sbuf, unsigned int npixels);
+
 	if (swab)
-		drm_fb_xfrm(dst, dst_pitch, 2, vaddr, fb, clip, false,
-			    drm_fb_xrgb8888_to_rgb565_swab_line);
+		xfrm_line = drm_fb_xrgb8888_to_rgb565_swab_line;
 	else
-		drm_fb_xfrm(dst, dst_pitch, 2, vaddr, fb, clip, false,
-			    drm_fb_xrgb8888_to_rgb565_line);
-}
-EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb565);
+		xfrm_line = drm_fb_xrgb8888_to_rgb565_line;
 
-/**
- * drm_fb_xrgb8888_to_rgb565_toio - Convert XRGB8888 to RGB565 clip buffer
- * @dst: RGB565 destination buffer (iomem)
- * @dst_pitch: Number of bytes between two consecutive scanlines within dst
- * @vaddr: XRGB8888 source buffer
- * @fb: DRM framebuffer
- * @clip: Clip rectangle area to copy
- * @swab: Swap bytes
- *
- * Drivers can use this function for RGB565 devices that don't natively
- * support XRGB8888.
- */
-void drm_fb_xrgb8888_to_rgb565_toio(void __iomem *dst, unsigned int dst_pitch,
-				    const void *vaddr, const struct drm_framebuffer *fb,
-				    const struct drm_rect *clip, bool swab)
-{
-	if (swab)
-		drm_fb_xfrm_toio(dst, dst_pitch, 2, vaddr, fb, clip, false,
-				 drm_fb_xrgb8888_to_rgb565_swab_line);
+	if (!dst_pitch)
+		dst_pitch = default_dst_pitch;
+
+	if (dst[0].is_iomem)
+		drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], 2, vmap[0].vaddr, fb, clip,
+				 false, xfrm_line);
 	else
-		drm_fb_xfrm_toio(dst, dst_pitch, 2, vaddr, fb, clip, false,
-				 drm_fb_xrgb8888_to_rgb565_line);
+		drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], 2, vmap[0].vaddr, fb, clip,
+			    false, xfrm_line);
 }
-EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb565_toio);
+EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb565);
 
 static void drm_fb_xrgb8888_to_rgb888_line(void *dbuf, const void *sbuf, unsigned int pixels)
 {
@@ -605,8 +593,7 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
 
 	} else if (dst_format == DRM_FORMAT_RGB565) {
 		if (fb_format == DRM_FORMAT_XRGB8888) {
-			drm_fb_xrgb8888_to_rgb565_toio(dst[0].vaddr_iomem, dst_pitch[0],
-						       vmap[0].vaddr, fb, clip, false);
+			drm_fb_xrgb8888_to_rgb565(dst, dst_pitch, vmap, fb, clip, false);
 			return 0;
 		}
 	} else if (dst_format == DRM_FORMAT_RGB888) {
diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 973a75585cad..d0bdbcb96705 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -206,7 +206,6 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
 	struct iosys_map map[DRM_FORMAT_MAX_PLANES];
 	struct iosys_map data[DRM_FORMAT_MAX_PLANES];
 	struct iosys_map dst_map = IOSYS_MAP_INIT_VADDR(dst);
-	void *src;
 	int ret;
 
 	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
@@ -216,7 +215,6 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
 	ret = drm_gem_fb_vmap(fb, map, data);
 	if (ret)
 		goto out_drm_gem_fb_end_cpu_access;
-	src = data[0].vaddr; /* TODO: Use mapping abstraction properly */
 
 	switch (fb->format->format) {
 	case DRM_FORMAT_RGB565:
@@ -226,7 +224,7 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
 			drm_fb_memcpy(&dst_map, NULL, data, fb, clip);
 		break;
 	case DRM_FORMAT_XRGB8888:
-		drm_fb_xrgb8888_to_rgb565(dst, 0, src, fb, clip, swap);
+		drm_fb_xrgb8888_to_rgb565(&dst_map, NULL, data, fb, clip, swap);
 		break;
 	default:
 		drm_err_once(fb->dev, "Format is not supported: %p4cc\n",
diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index 426a3ae6cc50..a43eb6645352 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -198,7 +198,8 @@ static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
 		} else if (format->format == DRM_FORMAT_RGB332) {
 			drm_fb_xrgb8888_to_rgb332(&dst, NULL, map_data, fb, rect);
 		} else if (format->format == DRM_FORMAT_RGB565) {
-			drm_fb_xrgb8888_to_rgb565(buf, 0, vaddr, fb, rect, gud_is_big_endian());
+			drm_fb_xrgb8888_to_rgb565(&dst, NULL, map_data, fb, rect,
+						  gud_is_big_endian());
 		} else if (format->format == DRM_FORMAT_RGB888) {
 			drm_fb_xrgb8888_to_rgb888(buf, 0, vaddr, fb, rect);
 		} else {
diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index 73fb9f63d227..9cd398e4700b 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -335,8 +335,7 @@ static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
 
 	} else if (fb->format->cpp[0] == 4 && cirrus->cpp == 2) {
 		iosys_map_incr(&dst, drm_fb_clip_offset(cirrus->pitch, fb->format, rect));
-		drm_fb_xrgb8888_to_rgb565_toio(dst.vaddr_iomem, cirrus->pitch, vaddr, fb, rect,
-					       false);
+		drm_fb_xrgb8888_to_rgb565(&dst, &cirrus->pitch, vmap, fb, rect, false);
 
 	} else if (fb->format->cpp[0] == 4 && cirrus->cpp == 3) {
 		iosys_map_incr(&dst, drm_fb_clip_offset(cirrus->pitch, fb->format, rect));
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index 3c28f099e3ed..9f1d45d7ce84 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -23,12 +23,9 @@ void drm_fb_swab(struct iosys_map *dst, const unsigned int *dst_pitch,
 void drm_fb_xrgb8888_to_rgb332(struct iosys_map *dst, const unsigned int *dst_pitch,
 			       const struct iosys_map *vmap, const struct drm_framebuffer *fb,
 			       const struct drm_rect *clip);
-void drm_fb_xrgb8888_to_rgb565(void *dst, unsigned int dst_pitch, const void *vaddr,
-			       const struct drm_framebuffer *fb, const struct drm_rect *clip,
-			       bool swab);
-void drm_fb_xrgb8888_to_rgb565_toio(void __iomem *dst, unsigned int dst_pitch,
-				    const void *vaddr, const struct drm_framebuffer *fb,
-				    const struct drm_rect *clip, bool swab);
+void drm_fb_xrgb8888_to_rgb565(struct iosys_map *dst, const unsigned int *dst_pitch,
+			       const struct iosys_map *vmap, const struct drm_framebuffer *fb,
+			       const struct drm_rect *clip, bool swab);
 void drm_fb_xrgb8888_to_rgb888(void *dst, unsigned int dst_pitch, const void *src,
 			       const struct drm_framebuffer *fb, const struct drm_rect *clip);
 void drm_fb_xrgb8888_to_rgb888_toio(void __iomem *dst, unsigned int dst_pitch,
-- 
2.37.1

