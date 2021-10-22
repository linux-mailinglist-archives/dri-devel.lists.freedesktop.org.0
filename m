Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D275D4377F6
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 15:28:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AA156ED93;
	Fri, 22 Oct 2021 13:28:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF2456ED91
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 13:28:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 343061FD5F;
 Fri, 22 Oct 2021 13:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1634909313; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NrcN+MSGaF4Y3vznXKu4uZijpwYZeU6WrbI2EgF4jLo=;
 b=Bq/Ggq18o1IkIy8Ab+IbPA3GITMJRK1tKXayr9uxaFxJr15drA4v2SD4FmTFSv0e70SjLv
 ZuOlguxENy2pRvC3RfJHC52uaK13oh+/1cze74Gt5Gu4bhOWL2p3uNL4uYvf6X7v4DeiOw
 QnDAIiBaNtFmk2RnC45dDU4HLfw8vy4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1634909313;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NrcN+MSGaF4Y3vznXKu4uZijpwYZeU6WrbI2EgF4jLo=;
 b=JvfqdzMgoDLiAmD4DZ+YC7PhfHLyztoglX7kliTbwofhs85Zr04iZe13iCLO4Z9G11Vb4m
 jRx72ABdZlgzTZBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B6CBB13E7E;
 Fri, 22 Oct 2021 13:28:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iM+pK4C8cmEwXgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 22 Oct 2021 13:28:32 +0000
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
Subject: [PATCH 5/9] drm/format-helper: Streamline blit-helper interface
Date: Fri, 22 Oct 2021 15:28:25 +0200
Message-Id: <20211022132829.7697-6-tzimmermann@suse.de>
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

Move destination-buffer clipping from format-helper blit function into
caller. Rename drm_fb_blit_rect_dstclip() to drm_fb_blit_toio(). Done for
consistency with the rest of the interface. Remove drm_fb_blit_dstclip(),
which isn't required.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_format_helper.c | 51 ++++-------------------------
 drivers/gpu/drm/tiny/simpledrm.c    | 14 +++++---
 include/drm/drm_format_helper.h     | 10 ++----
 3 files changed, 19 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 260dc587c1d7..5ca9abc65510 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -463,7 +463,7 @@ void drm_fb_xrgb8888_to_gray8(void *dst, unsigned int dst_pitch, const void *vad
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_gray8);
 
 /**
- * drm_fb_blit_rect_dstclip - Copy parts of a framebuffer to display memory
+ * drm_fb_blit_toio - Copy parts of a framebuffer to display memory
  * @dst:	The display memory to copy to
  * @dst_pitch:	Number of bytes between two consecutive scanlines within dst
  * @dst_format:	FOURCC code of the display's color format
@@ -475,17 +475,14 @@ EXPORT_SYMBOL(drm_fb_xrgb8888_to_gray8);
  * formats of the display and the framebuffer mismatch, the blit function
  * will attempt to convert between them.
  *
- * Use drm_fb_blit_dstclip() to copy the full framebuffer.
- *
  * Returns:
  * 0 on success, or
  * -EINVAL if the color-format conversion failed, or
  * a negative error code otherwise.
  */
-int drm_fb_blit_rect_dstclip(void __iomem *dst, unsigned int dst_pitch,
-			     uint32_t dst_format, void *vmap,
-			     struct drm_framebuffer *fb,
-			     struct drm_rect *clip)
+int drm_fb_blit_toio(void __iomem *dst, unsigned int dst_pitch, uint32_t dst_format,
+		     const void *vmap, const struct drm_framebuffer *fb,
+		     const struct drm_rect *clip)
 {
 	uint32_t fb_format = fb->format->format;
 
@@ -496,20 +493,16 @@ int drm_fb_blit_rect_dstclip(void __iomem *dst, unsigned int dst_pitch,
 		dst_format = DRM_FORMAT_XRGB8888;
 
 	if (dst_format == fb_format) {
-		dst += clip_offset(clip, dst_pitch, fb->format->cpp[0]);
 		drm_fb_memcpy_toio(dst, dst_pitch, vmap, fb, clip);
 		return 0;
 
 	} else if (dst_format == DRM_FORMAT_RGB565) {
 		if (fb_format == DRM_FORMAT_XRGB8888) {
-			dst += clip_offset(clip, dst_pitch, fb->format->cpp[0]);
-			drm_fb_xrgb8888_to_rgb565_toio(dst, dst_pitch, vmap, fb, clip,
-						       false);
+			drm_fb_xrgb8888_to_rgb565_toio(dst, dst_pitch, vmap, fb, clip, false);
 			return 0;
 		}
 	} else if (dst_format == DRM_FORMAT_RGB888) {
 		if (fb_format == DRM_FORMAT_XRGB8888) {
-			dst += clip_offset(clip, dst_pitch, fb->format->cpp[0]);
 			drm_fb_xrgb8888_to_rgb888_toio(dst, dst_pitch, vmap, fb, clip);
 			return 0;
 		}
@@ -517,36 +510,4 @@ int drm_fb_blit_rect_dstclip(void __iomem *dst, unsigned int dst_pitch,
 
 	return -EINVAL;
 }
-EXPORT_SYMBOL(drm_fb_blit_rect_dstclip);
-
-/**
- * drm_fb_blit_dstclip - Copy framebuffer to display memory
- * @dst:	The display memory to copy to
- * @dst_pitch:	Number of bytes between two consecutive scanlines within dst
- * @dst_format:	FOURCC code of the display's color format
- * @vmap:	The framebuffer memory to copy from
- * @fb:		The framebuffer to copy from
- *
- * This function copies a full framebuffer to display memory. If the formats
- * of the display and the framebuffer mismatch, the copy function will
- * attempt to convert between them.
- *
- * See drm_fb_blit_rect_dstclip() for more information.
- *
- * Returns:
- * 0 on success, or a negative error code otherwise.
- */
-int drm_fb_blit_dstclip(void __iomem *dst, unsigned int dst_pitch,
-			uint32_t dst_format, void *vmap,
-			struct drm_framebuffer *fb)
-{
-	struct drm_rect fullscreen = {
-		.x1 = 0,
-		.x2 = fb->width,
-		.y1 = 0,
-		.y2 = fb->height,
-	};
-	return drm_fb_blit_rect_dstclip(dst, dst_pitch, dst_format, vmap, fb,
-					&fullscreen);
-}
-EXPORT_SYMBOL(drm_fb_blit_dstclip);
+EXPORT_SYMBOL(drm_fb_blit_toio);
diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 481b48bde047..571f716ff427 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -641,6 +641,8 @@ simpledrm_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
 	struct drm_framebuffer *fb = plane_state->fb;
 	void *vmap = shadow_plane_state->data[0].vaddr; /* TODO: Use mapping abstraction */
 	struct drm_device *dev = &sdev->dev;
+	void __iomem *dst = sdev->screen_base;
+	struct drm_rect clip;
 	int idx;
 
 	if (!fb)
@@ -649,8 +651,11 @@ simpledrm_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
 	if (!drm_dev_enter(dev, &idx))
 		return;
 
-	drm_fb_blit_dstclip(sdev->screen_base, sdev->pitch,
-			    sdev->format->format, vmap, fb);
+	drm_rect_init(&clip, 0, 0, fb->width, fb->height);
+
+	dst += drm_fb_clip_offset(sdev->pitch, sdev->format, &clip);
+	drm_fb_blit_toio(dst, sdev->pitch, sdev->format->format, vmap, fb, &clip);
+
 	drm_dev_exit(idx);
 }
 
@@ -680,6 +685,7 @@ simpledrm_simple_display_pipe_update(struct drm_simple_display_pipe *pipe,
 	void *vmap = shadow_plane_state->data[0].vaddr; /* TODO: Use mapping abstraction */
 	struct drm_framebuffer *fb = plane_state->fb;
 	struct drm_device *dev = &sdev->dev;
+	void __iomem *dst = sdev->screen_base;
 	struct drm_rect clip;
 	int idx;
 
@@ -692,8 +698,8 @@ simpledrm_simple_display_pipe_update(struct drm_simple_display_pipe *pipe,
 	if (!drm_dev_enter(dev, &idx))
 		return;
 
-	drm_fb_blit_rect_dstclip(sdev->screen_base, sdev->pitch,
-				 sdev->format->format, vmap, fb, &clip);
+	dst += drm_fb_clip_offset(sdev->pitch, sdev->format, &clip);
+	drm_fb_blit_toio(dst, sdev->pitch, sdev->format->format, vmap, fb, &clip);
 
 	drm_dev_exit(idx);
 }
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index 8af9b8f35dd6..c91b7c553878 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -36,12 +36,8 @@ void drm_fb_xrgb8888_to_rgb888_toio(void __iomem *dst, unsigned int dst_pitch,
 void drm_fb_xrgb8888_to_gray8(void *dst, unsigned int dst_pitch, const void *vaddr,
 			      const struct drm_framebuffer *fb, const struct drm_rect *clip);
 
-int drm_fb_blit_rect_dstclip(void __iomem *dst, unsigned int dst_pitch,
-			     uint32_t dst_format, void *vmap,
-			     struct drm_framebuffer *fb,
-			     struct drm_rect *rect);
-int drm_fb_blit_dstclip(void __iomem *dst, unsigned int dst_pitch,
-			uint32_t dst_format, void *vmap,
-			struct drm_framebuffer *fb);
+int drm_fb_blit_toio(void __iomem *dst, unsigned int dst_pitch, uint32_t dst_format,
+		     const void *vmap, const struct drm_framebuffer *fb,
+		     const struct drm_rect *rect);
 
 #endif /* __LINUX_DRM_FORMAT_HELPER_H */
-- 
2.33.0

