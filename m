Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A957209E00
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 14:00:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D016F6EBC1;
	Thu, 25 Jun 2020 12:00:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32CC96EBBB
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 12:00:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 733C4ACF0;
 Thu, 25 Jun 2020 12:00:13 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, kraxel@redhat.com, lgirdwood@gmail.com,
 broonie@kernel.org, robh@kernel.org, sam@ravnborg.org,
 emil.l.velikov@gmail.com, noralf@tronnes.org, geert+renesas@glider.be,
 hdegoede@redhat.com
Subject: [PATCH 2/9] drm/format-helper: Add blitter functions
Date: Thu, 25 Jun 2020 14:00:04 +0200
Message-Id: <20200625120011.16168-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200625120011.16168-1-tzimmermann@suse.de>
References: <20200625120011.16168-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The blitter functions copy a framebuffer to I/O memory using one of
the existing conversion functions.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_format_helper.c | 87 +++++++++++++++++++++++++++++
 include/drm/drm_format_helper.h     |  8 +++
 2 files changed, 95 insertions(+)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 8d5a683afea7..0e885cd34107 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -344,3 +344,90 @@ void drm_fb_xrgb8888_to_gray8(u8 *dst, void *vaddr, struct drm_framebuffer *fb,
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_gray8);
 
+/**
+ * drm_fb_blit_rect_dstclip - Copy parts of a framebuffer to display memory
+ * @dst:	The display memory to copy to
+ * @dst_pitch:	Number of bytes between two consecutive scanlines within dst
+ * @dst_format:	FOURCC code of the display's color format
+ * @vmap:	The framebuffer memory to copy from
+ * @fb:		The framebuffer to copy from
+ * @clip:	Clip rectangle area to copy
+ *
+ * This function copies parts of a framebuffer to display memory. If the
+ * formats of the display and the framebuffer mismatch, the blit function
+ * will attempt to convert between them.
+ *
+ * Use drm_fb_blit_dstclip() to copy the full framebuffer.
+ *
+ * Returns:
+ * 0 on success, or
+ * -EINVAL if the color-format conversion failed, or
+ * a negative error code otherwise.
+ */
+int drm_fb_blit_rect_dstclip(void __iomem *dst, unsigned int dst_pitch,
+			     uint32_t dst_format, void *vmap,
+			     struct drm_framebuffer *fb,
+			     struct drm_rect *clip)
+{
+	uint32_t fb_format = fb->format->format;
+
+	/* treat alpha channel like filler bits */
+	if (fb_format == DRM_FORMAT_ARGB8888)
+		fb_format = DRM_FORMAT_XRGB8888;
+	if (dst_format == DRM_FORMAT_ARGB8888)
+		dst_format = DRM_FORMAT_XRGB8888;
+
+	if (dst_format == fb_format) {
+		drm_fb_memcpy_dstclip(dst, dst_pitch, vmap, fb, clip);
+		return 0;
+
+	} else if (dst_format == DRM_FORMAT_RGB565) {
+		if (fb_format == DRM_FORMAT_XRGB8888) {
+			drm_fb_xrgb8888_to_rgb565_dstclip(dst, dst_pitch,
+							  vmap, fb, clip,
+							  false);
+			return 0;
+		}
+	} else if (dst_format == DRM_FORMAT_RGB888) {
+		if (fb_format == DRM_FORMAT_XRGB8888) {
+			drm_fb_xrgb8888_to_rgb888_dstclip(dst, dst_pitch,
+							  vmap, fb, clip);
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL(drm_fb_blit_rect_dstclip);
+
+/**
+ * drm_fb_blit_dstclip - Copy framebuffer to display memory
+ * @dst:	The display memory to copy to
+ * @dst_pitch:	Number of bytes between two consecutive scanlines within dst
+ * @dst_format:	FOURCC code of the display's color format
+ * @vmap:	The framebuffer memory to copy from
+ * @fb:		The framebuffer to copy from
+ *
+ * This function copies a full framebuffer to display memory. If the formats
+ * of the display and the framebuffer mismatch, the copy function will
+ * attempt to convert between them.
+ *
+ * See drm_fb_blit_rect_dstclip() for more inforamtion.
+ *
+ * Returns:
+ * 0 on success, or a negative error code otherwise.
+ */
+int drm_fb_blit_dstclip(void __iomem *dst, unsigned int dst_pitch,
+			uint32_t dst_format, void *vmap,
+			struct drm_framebuffer *fb)
+{
+	struct drm_rect fullscreen = {
+		.x1 = 0,
+		.x2 = fb->width,
+		.y1 = 0,
+		.y2 = fb->height,
+	};
+	return drm_fb_blit_rect_dstclip(dst, dst_pitch, dst_format, vmap, fb,
+					&fullscreen);
+}
+EXPORT_SYMBOL(drm_fb_blit_dstclip);
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index 2b5036a5fbe7..4e0258a61311 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -28,4 +28,12 @@ void drm_fb_xrgb8888_to_rgb888_dstclip(void __iomem *dst, unsigned int dst_pitch
 void drm_fb_xrgb8888_to_gray8(u8 *dst, void *vaddr, struct drm_framebuffer *fb,
 			      struct drm_rect *clip);
 
+int drm_fb_blit_rect_dstclip(void __iomem *dst, unsigned int dst_pitch,
+			     uint32_t dst_format, void *vmap,
+			     struct drm_framebuffer *fb,
+			     struct drm_rect *rect);
+int drm_fb_blit_dstclip(void __iomem *dst, unsigned int dst_pitch,
+			uint32_t dst_format, void *vmap,
+			struct drm_framebuffer *fb);
+
 #endif /* __LINUX_DRM_FORMAT_HELPER_H */
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
