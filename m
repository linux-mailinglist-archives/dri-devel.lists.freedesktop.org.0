Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 946C4441C65
	for <lists+dri-devel@lfdr.de>; Mon,  1 Nov 2021 15:15:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCCA96E86B;
	Mon,  1 Nov 2021 14:15:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE036E865
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Nov 2021 14:15:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D26B42196F;
 Mon,  1 Nov 2021 14:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1635776134; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Uox26hfGAxUir8Z3x3Gg+71akV/5SDwhx20aAdBcJo=;
 b=MyULyEutF08kSmqnRyibofoOEyS6LYLRc4tOauh1Pq9+DiIGAMMVDJEdZivu7yghHN6e0J
 1uSm6ZsliCafLZQtGq44ug29ulOBNwv6wLv1ANdH6o3WkPyGn4MK0uHpzOLSc3Py8AEoJb
 fjhddHWx5c3lLfAAM7mJi6bJWlRt05E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1635776134;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Uox26hfGAxUir8Z3x3Gg+71akV/5SDwhx20aAdBcJo=;
 b=Vp+JuNvnHdpQnb1ZI7Z2CheX2KmXOPejU1/fis/yWwFXln0AAR4iMas7eKIwU0VK2LLBZh
 oRqTl8xq3BbfKvCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6AF931342A;
 Mon,  1 Nov 2021 14:15:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +PIZGYb2f2GlHwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 01 Nov 2021 14:15:34 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, noralf@tronnes.org,
 drawat.floss@gmail.com, airlied@redhat.com, kraxel@redhat.com,
 david@lechnology.com, sam@ravnborg.org, javierm@redhat.com,
 kernel@amanoeldawod.com, dirty.ice.hu@gmail.com,
 michael+lkml@stapelberg.ch, aros@gmx.com, joshua@stroblindustries.com,
 arnd@arndb.de
Subject: [PATCH v2 2/9] drm/format-helper: Rework format-helper memcpy
 functions
Date: Mon,  1 Nov 2021 15:15:25 +0100
Message-Id: <20211101141532.26655-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211101141532.26655-1-tzimmermann@suse.de>
References: <20211101141532.26655-1-tzimmermann@suse.de>
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
Cc: linux-hyperv@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move destination-buffer clipping from all format-helper memcpy
function into callers. Support destination-buffer pitch. Only
distinguish between system and I/O memory, but use same logic
everywhere.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: Noralf Trønnes <noralf@tronnes.org>
Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
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
index 677e62e39f72..fac37c697d8b 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -41,58 +41,62 @@ EXPORT_SYMBOL(drm_fb_clip_offset);
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
@@ -481,7 +485,8 @@ int drm_fb_blit_rect_dstclip(void __iomem *dst, unsigned int dst_pitch,
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
index f5a8b334b18d..1fc3ba7b6060 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -13,11 +13,10 @@ struct drm_rect;
 unsigned int drm_fb_clip_offset(unsigned int pitch, const struct drm_format_info *format,
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
2.33.1

