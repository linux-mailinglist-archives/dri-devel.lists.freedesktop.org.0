Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FC94377F8
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 15:28:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC5156ED91;
	Fri, 22 Oct 2021 13:28:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B77F6ED8A
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 13:28:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C71671FD3D;
 Fri, 22 Oct 2021 13:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1634909311; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZKFuL4ZSTLTGZvrsOyX4iqbkLnzInmAxvaaQTh/jDwg=;
 b=Hj8F7hZYTKBtsqEZrPVeWaWlF4LbNvvsEoeyBKnEVaCCnQqv0OAvC8PJhYC5BJJDNv7txe
 dLyOYlMbOtT5WHqKSoM6Qk3D1HA/3yYybwD8RVh6AL/V76VfSlwy+L1lr+UW0/xJtJd2HF
 k8Az2P9Cv1RsGCcsgvV5T2HmyYFjvk4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1634909311;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZKFuL4ZSTLTGZvrsOyX4iqbkLnzInmAxvaaQTh/jDwg=;
 b=Zg48bkIHlKrR9NRyNZ6LOtG3+6wT7AQaqkpxRKEMjTXi7hrTsbg1P6+PspwkR25bJ1K+Jz
 A+2saZNXgTXWu6AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 617E213CDA;
 Fri, 22 Oct 2021 13:28:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gNrZFn+8cmEwXgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 22 Oct 2021 13:28:31 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, noralf@tronnes.org,
 drawat.floss@gmail.com, airlied@redhat.com, kraxel@redhat.com,
 david@lechnology.com, sam@ravnborg.org, javierm@redhat.com,
 kernel@amanoeldawod.com, dirty.ice.hu@gmail.com,
 michael+lkml@stapelberg.ch, aros@gmx.com, joshua@stroblindustries.com,
 arnd@arndb.de
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/9] drm/format-helper: Rework format-helper memcpy functions
Date: Fri, 22 Oct 2021 15:28:22 +0200
Message-Id: <20211022132829.7697-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211022132829.7697-1-tzimmermann@suse.de>
References: <20211022132829.7697-1-tzimmermann@suse.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move destination-buffer clipping from all format-helper memcpy
function into callers. Support destination-buffer pitch. Only
distinguish between system and I/O memory, but use same logic
everywhere.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_format_helper.c         | 35 ++++++++++++---------
 drivers/gpu/drm/drm_mipi_dbi.c              |  2 +-
 drivers/gpu/drm/gud/gud_pipe.c              |  2 +-
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c |  5 ++-
 drivers/gpu/drm/mgag200/mgag200_mode.c      |  4 ++-
 drivers/gpu/drm/tiny/cirrus.c               | 14 +++++----
 include/drm/drm_format_helper.h             |  9 +++---
 7 files changed, 41 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 28e9d0d89270..38c8055f6fa8 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -32,58 +32,62 @@ EXPORT_SYMBOL(drm_fb_clip_offset);
 /**
  * drm_fb_memcpy - Copy clip buffer
  * @dst: Destination buffer
+ * @dst_pitch: Number of bytes between two consecutive scanlines within dst
  * @vaddr: Source buffer
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
  *
  * This function does not apply clipping on dst, i.e. the destination
- * is a small buffer containing the clip rect only.
+ * is at the top-left corner.
  */
-void drm_fb_memcpy(void *dst, void *vaddr, struct drm_framebuffer *fb,
-		   struct drm_rect *clip)
+void drm_fb_memcpy(void *dst, unsigned int dst_pitch, const void *vaddr,
+		   const struct drm_framebuffer *fb, const struct drm_rect *clip)
 {
 	unsigned int cpp = fb->format->cpp[0];
 	size_t len = (clip->x2 - clip->x1) * cpp;
 	unsigned int y, lines = clip->y2 - clip->y1;
 
+	if (!dst_pitch)
+		dst_pitch = len;
+
 	vaddr += clip_offset(clip, fb->pitches[0], cpp);
 	for (y = 0; y < lines; y++) {
 		memcpy(dst, vaddr, len);
 		vaddr += fb->pitches[0];
-		dst += len;
+		dst += dst_pitch;
 	}
 }
 EXPORT_SYMBOL(drm_fb_memcpy);
 
 /**
- * drm_fb_memcpy_dstclip - Copy clip buffer
+ * drm_fb_memcpy_toio - Copy clip buffer
  * @dst: Destination buffer (iomem)
  * @dst_pitch: Number of bytes between two consecutive scanlines within dst
  * @vaddr: Source buffer
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
  *
- * This function applies clipping on dst, i.e. the destination is a
- * full (iomem) framebuffer but only the clip rect content is copied over.
+ * This function does not apply clipping on dst, i.e. the destination
+ * is at the top-left corner.
  */
-void drm_fb_memcpy_dstclip(void __iomem *dst, unsigned int dst_pitch,
-			   void *vaddr, struct drm_framebuffer *fb,
-			   struct drm_rect *clip)
+void drm_fb_memcpy_toio(void __iomem *dst, unsigned int dst_pitch, const void *vaddr,
+			const struct drm_framebuffer *fb, const struct drm_rect *clip)
 {
 	unsigned int cpp = fb->format->cpp[0];
-	unsigned int offset = clip_offset(clip, dst_pitch, cpp);
 	size_t len = (clip->x2 - clip->x1) * cpp;
 	unsigned int y, lines = clip->y2 - clip->y1;
 
-	vaddr += offset;
-	dst += offset;
+	if (!dst_pitch)
+		dst_pitch = len;
+
+	vaddr += clip_offset(clip, fb->pitches[0], cpp);
 	for (y = 0; y < lines; y++) {
 		memcpy_toio(dst, vaddr, len);
 		vaddr += fb->pitches[0];
 		dst += dst_pitch;
 	}
 }
-EXPORT_SYMBOL(drm_fb_memcpy_dstclip);
+EXPORT_SYMBOL(drm_fb_memcpy_toio);
 
 /**
  * drm_fb_swab - Swap bytes into clip buffer
@@ -472,7 +476,8 @@ int drm_fb_blit_rect_dstclip(void __iomem *dst, unsigned int dst_pitch,
 		dst_format = DRM_FORMAT_XRGB8888;
 
 	if (dst_format == fb_format) {
-		drm_fb_memcpy_dstclip(dst, dst_pitch, vmap, fb, clip);
+		dst += clip_offset(clip, dst_pitch, fb->format->cpp[0]);
+		drm_fb_memcpy_toio(dst, dst_pitch, vmap, fb, clip);
 		return 0;
 
 	} else if (dst_format == DRM_FORMAT_RGB565) {
diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 71b646c4131f..c09df8b06c7a 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -213,7 +213,7 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
 		if (swap)
 			drm_fb_swab(dst, src, fb, clip, !gem->import_attach);
 		else
-			drm_fb_memcpy(dst, src, fb, clip);
+			drm_fb_memcpy(dst, 0, src, fb, clip);
 		break;
 	case DRM_FORMAT_XRGB8888:
 		drm_fb_xrgb8888_to_rgb565(dst, src, fb, clip, swap);
diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index daf75c178c2b..a92112ffd37a 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -206,7 +206,7 @@ static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
 		/* can compress directly from the framebuffer */
 		buf = vaddr + rect->y1 * pitch;
 	} else {
-		drm_fb_memcpy(buf, vaddr, fb, rect);
+		drm_fb_memcpy(buf, 0, vaddr, fb, rect);
 	}
 
 	memset(req, 0, sizeof(*req));
diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
index 8c97a20dfe23..93f51e70a951 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
@@ -23,13 +23,16 @@ static int hyperv_blit_to_vram_rect(struct drm_framebuffer *fb,
 				    struct drm_rect *rect)
 {
 	struct hyperv_drm_device *hv = to_hv(fb->dev);
+	void __iomem *dst = hv->vram;
 	void *vmap = map->vaddr; /* TODO: Use mapping abstraction properly */
 	int idx;
 
 	if (!drm_dev_enter(&hv->dev, &idx))
 		return -ENODEV;
 
-	drm_fb_memcpy_dstclip(hv->vram, fb->pitches[0], vmap, fb, rect);
+	dst += drm_fb_clip_offset(fb->pitches[0], fb->format, rect);
+	drm_fb_memcpy_toio(dst, fb->pitches[0], vmap, fb, rect);
+
 	drm_dev_exit(idx);
 
 	return 0;
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index fd98e8bbc550..b983541a4c53 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -847,9 +847,11 @@ static void
 mgag200_handle_damage(struct mga_device *mdev, struct drm_framebuffer *fb,
 		      struct drm_rect *clip, const struct dma_buf_map *map)
 {
+	void __iomem *dst = mdev->vram;
 	void *vmap = map->vaddr; /* TODO: Use mapping abstraction properly */
 
-	drm_fb_memcpy_dstclip(mdev->vram, fb->pitches[0], vmap, fb, clip);
+	dst += drm_fb_clip_offset(fb->pitches[0], fb->format, clip);
+	drm_fb_memcpy_toio(dst, fb->pitches[0], vmap, fb, clip);
 
 	/* Always scanout image at VRAM offset 0 */
 	mgag200_set_startadd(mdev, (u32)0);
diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index 4611ec408506..5344e506e8a9 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -317,28 +317,30 @@ static int cirrus_fb_blit_rect(struct drm_framebuffer *fb, const struct dma_buf_
 			       struct drm_rect *rect)
 {
 	struct cirrus_device *cirrus = to_cirrus(fb->dev);
+	void __iomem *dst = cirrus->vram;
 	void *vmap = map->vaddr; /* TODO: Use mapping abstraction properly */
 	int idx;
 
 	if (!drm_dev_enter(&cirrus->dev, &idx))
 		return -ENODEV;
 
-	if (cirrus->cpp == fb->format->cpp[0])
-		drm_fb_memcpy_dstclip(cirrus->vram, fb->pitches[0],
-				      vmap, fb, rect);
+	if (cirrus->cpp == fb->format->cpp[0]) {
+		dst += drm_fb_clip_offset(fb->pitches[0], fb->format, rect);
+		drm_fb_memcpy_toio(dst, fb->pitches[0], vmap, fb, rect);
 
-	else if (fb->format->cpp[0] == 4 && cirrus->cpp == 2)
+	} else if (fb->format->cpp[0] == 4 && cirrus->cpp == 2) {
 		drm_fb_xrgb8888_to_rgb565_dstclip(cirrus->vram,
 						  cirrus->pitch,
 						  vmap, fb, rect, false);
 
-	else if (fb->format->cpp[0] == 4 && cirrus->cpp == 3)
+	} else if (fb->format->cpp[0] == 4 && cirrus->cpp == 3) {
 		drm_fb_xrgb8888_to_rgb888_dstclip(cirrus->vram,
 						  cirrus->pitch,
 						  vmap, fb, rect);
 
-	else
+	} else {
 		WARN_ON_ONCE("cpp mismatch");
+	}
 
 	drm_dev_exit(idx);
 
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index 90b9bd9ecb83..8d72f6fd27e9 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -13,11 +13,10 @@ struct drm_rect;
 unsigned long drm_fb_clip_offset(unsigned int pitch, const struct drm_format_info *format,
 				 const struct drm_rect *clip);
 
-void drm_fb_memcpy(void *dst, void *vaddr, struct drm_framebuffer *fb,
-		   struct drm_rect *clip);
-void drm_fb_memcpy_dstclip(void __iomem *dst, unsigned int dst_pitch, void *vaddr,
-			   struct drm_framebuffer *fb,
-			   struct drm_rect *clip);
+void drm_fb_memcpy(void *dst, unsigned int dst_pitch, const void *vaddr,
+		   const struct drm_framebuffer *fb, const struct drm_rect *clip);
+void drm_fb_memcpy_toio(void __iomem *dst, unsigned int dst_pitch, const void *vaddr,
+			const struct drm_framebuffer *fb, const struct drm_rect *clip);
 void drm_fb_swab(void *dst, void *src, struct drm_framebuffer *fb,
 		 struct drm_rect *clip, bool cached);
 void drm_fb_xrgb8888_to_rgb332(void *dst, void *vaddr, struct drm_framebuffer *fb,
-- 
2.33.0

