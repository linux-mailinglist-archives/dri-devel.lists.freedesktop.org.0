Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE93D7A867C
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 16:25:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C4910E4C4;
	Wed, 20 Sep 2023 14:25:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F5910E4DA
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 14:25:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2BE6521DB3;
 Wed, 20 Sep 2023 14:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695219938; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lDc5+cPlz+GgDJV/evtolcijezS4RWpEFOd2TZ+yEA0=;
 b=lO+SXQLI7NJGC7VN78NCTaQ73bavwZ6sbkK4BAyrucNVl/qRrEIkXW6zZlcEPjLx1ssgnj
 Dd1hvHLE+7AlsqHLvAblMR6njVeswVRKEgcv8lxFw27SiBvmrdR9baW62zI7zutuNL0yYF
 bZm/d90B/hYjsJSqO3VbuBOtCb1HBVo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695219938;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lDc5+cPlz+GgDJV/evtolcijezS4RWpEFOd2TZ+yEA0=;
 b=gk38kdsdSkbMKNrnrThaAF4SfIyzdUsRd5go3xTmoR+AouX0OO9CUFvFmqLNAQOv9Cnp69
 7kGGeRWCQpMeVVDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DF48F13A64;
 Wed, 20 Sep 2023 14:25:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mCSQNeEAC2W+IQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 20 Sep 2023 14:25:37 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jfalempe@redhat.com, jose.exposito89@gmail.com,
 arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
Subject: [PATCH v2 1/5] drm/format-helper: Add struct drm_xfrm_buf to cache
 format conversion
Date: Wed, 20 Sep 2023 16:24:27 +0200
Message-ID: <20230920142535.19321-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230920142535.19321-1-tzimmermann@suse.de>
References: <20230920142535.19321-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hold temporary memory for format conversion in an instance of struct
drm_xfrm_buf. Update internal helpers of DRM's format-conversion code
accordingly. Drivers will later be able to keep this cache across
display updates.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_format_helper.c | 111 +++++++++++++++++++++++++---
 include/drm/drm_format_helper.h     |  46 ++++++++++++
 2 files changed, 146 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index f93a4efcee909..029ca7893260a 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -17,9 +17,93 @@
 #include <drm/drm_format_helper.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_print.h>
 #include <drm/drm_rect.h>
 
+static void drm_xfrm_buf_init_release(struct drm_device *dev, void *res)
+{
+	struct drm_xfrm_buf *buf = res;
+
+	drm_xfrm_buf_release(buf);
+}
+
+/**
+ * drmm_xfrm_buf_init - Initialize xfrm buffer with managed cleanup
+ * @dev: The DRM device
+ * @buf: The xfrm buffer to initialize
+ *
+ * Clears all fields in struct drm_xfrm_buf and installs a DRM release
+ * action for the buffer. The buffer will be empty with no preallocated
+ * resources.
+ *
+ * Returns:
+ * 0 on success, or a negative errno code otherwise.
+ */
+int drmm_xfrm_buf_init(struct drm_device *dev, struct drm_xfrm_buf *buf)
+{
+	buf->mem = NULL;
+	buf->size = 0;
+	buf->preallocated = false;
+
+	return drmm_add_action_or_reset(dev, drm_xfrm_buf_init_release, buf);
+}
+EXPORT_SYMBOL(drmm_xfrm_buf_init);
+
+/**
+ * drm_xfrm_buf_reserve - Allocates storage in an xfrm buffer
+ * @buf: The xfrm buffer
+ * @new_size: The minimum allocation size
+ * @flags: Flags for kmalloc()
+ *
+ * Allocates at least @new_size bytes and returns a pointer to the memory
+ * range. After calling this function, previously returned memory blocks
+ * are invalid. It's best to collect all memory requirements of a format
+ * conversion and call this function once to allocate the range.
+ *
+ * Returns:
+ * A pointer to the allocated memory range, or a pointer-encoded errno code otherwise.
+ */
+void *drm_xfrm_buf_reserve(struct drm_xfrm_buf *buf, size_t new_size, gfp_t flags)
+{
+	void *mem;
+
+	if (new_size <= buf->size)
+		goto out;
+	else if (buf->preallocated)
+		return NULL;
+
+	mem = krealloc(buf->mem, new_size, flags);
+	if (!mem)
+		return NULL;
+
+	buf->mem = mem;
+	buf->size = new_size;
+
+out:
+	return buf->mem;
+}
+EXPORT_SYMBOL(drm_xfrm_buf_reserve);
+
+/**
+ * drm_xfrm_buf_release - Releases an xfrm buffer's storage
+ * @buf: The xfrm buffer
+ *
+ * Releases the memory range references by the xfrm buffer. After
+ * this call, all pointers to the memory are invalid. Prefer
+ * drmm_xfrm_buffer_init() for cleaning up and unloading a driver.
+ */
+void drm_xfrm_buf_release(struct drm_xfrm_buf *buf)
+{
+	if (buf->preallocated)
+		return;
+
+	kfree(buf->mem);
+	buf->mem = NULL;
+	buf->size = 0;
+}
+EXPORT_SYMBOL(drm_xfrm_buf_release);
+
 static unsigned int clip_offset(const struct drm_rect *clip, unsigned int pitch, unsigned int cpp)
 {
 	return clip->y1 * pitch + clip->x1 * cpp;
@@ -45,6 +129,7 @@ EXPORT_SYMBOL(drm_fb_clip_offset);
 static int __drm_fb_xfrm(void *dst, unsigned long dst_pitch, unsigned long dst_pixsize,
 			 const void *vaddr, const struct drm_framebuffer *fb,
 			 const struct drm_rect *clip, bool vaddr_cached_hint,
+			 struct drm_xfrm_buf *xfrm,
 			 void (*xfrm_line)(void *dbuf, const void *sbuf, unsigned int npixels))
 {
 	unsigned long linepixels = drm_rect_width(clip);
@@ -60,7 +145,7 @@ static int __drm_fb_xfrm(void *dst, unsigned long dst_pitch, unsigned long dst_p
 	 * one line at a time.
 	 */
 	if (!vaddr_cached_hint) {
-		stmp = kmalloc(sbuf_len, GFP_KERNEL);
+		stmp = drm_xfrm_buf_reserve(xfrm, sbuf_len, GFP_KERNEL);
 		if (!stmp)
 			return -ENOMEM;
 	}
@@ -79,8 +164,6 @@ static int __drm_fb_xfrm(void *dst, unsigned long dst_pitch, unsigned long dst_p
 		dst += dst_pitch;
 	}
 
-	kfree(stmp);
-
 	return 0;
 }
 
@@ -88,6 +171,7 @@ static int __drm_fb_xfrm(void *dst, unsigned long dst_pitch, unsigned long dst_p
 static int __drm_fb_xfrm_toio(void __iomem *dst, unsigned long dst_pitch, unsigned long dst_pixsize,
 			      const void *vaddr, const struct drm_framebuffer *fb,
 			      const struct drm_rect *clip, bool vaddr_cached_hint,
+			      struct drm_xfrm_buf *xfrm,
 			      void (*xfrm_line)(void *dbuf, const void *sbuf, unsigned int npixels))
 {
 	unsigned long linepixels = drm_rect_width(clip);
@@ -101,9 +185,9 @@ static int __drm_fb_xfrm_toio(void __iomem *dst, unsigned long dst_pitch, unsign
 	void *dbuf;
 
 	if (vaddr_cached_hint) {
-		dbuf = kmalloc(dbuf_len, GFP_KERNEL);
+		dbuf = drm_xfrm_buf_reserve(xfrm, dbuf_len, GFP_KERNEL);
 	} else {
-		dbuf = kmalloc(stmp_off + sbuf_len, GFP_KERNEL);
+		dbuf = drm_xfrm_buf_reserve(xfrm, stmp_off + sbuf_len, GFP_KERNEL);
 		stmp = dbuf + stmp_off;
 	}
 	if (!dbuf)
@@ -124,8 +208,6 @@ static int __drm_fb_xfrm_toio(void __iomem *dst, unsigned long dst_pitch, unsign
 		dst += dst_pitch;
 	}
 
-	kfree(dbuf);
-
 	return 0;
 }
 
@@ -139,17 +221,24 @@ static int drm_fb_xfrm(struct iosys_map *dst,
 	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
 		0, 0, 0, 0
 	};
+	struct drm_xfrm_buf tmp = DRM_XFRM_BUF_INIT;
+	int ret;
 
 	if (!dst_pitch)
 		dst_pitch = default_dst_pitch;
 
 	/* TODO: handle src in I/O memory here */
 	if (dst[0].is_iomem)
-		return __drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], dst_pixsize[0],
-					  src[0].vaddr, fb, clip, vaddr_cached_hint, xfrm_line);
+		ret = __drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], dst_pixsize[0],
+					 src[0].vaddr, fb, clip, vaddr_cached_hint, &tmp,
+					 xfrm_line);
 	else
-		return __drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], dst_pixsize[0],
-				     src[0].vaddr, fb, clip, vaddr_cached_hint, xfrm_line);
+		ret = __drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], dst_pixsize[0],
+				    src[0].vaddr, fb, clip, vaddr_cached_hint, &tmp,
+				    xfrm_line);
+	drm_xfrm_buf_release(&tmp);
+
+	return ret;
 }
 
 /**
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index 291deb09475bb..245a5edc4735a 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -15,6 +15,52 @@ struct drm_rect;
 
 struct iosys_map;
 
+/**
+ * struct drm_xfrm_buf - Stores transformation and conversion state
+ *
+ * DRM helpers for format conversion store temporary state in
+ * struct drm_xfrm_buf. The buffer's resources can be reused
+ * among multiple conversion operations.
+ *
+ * All fields are considered private.
+ */
+struct drm_xfrm_buf {
+	void *mem;
+	size_t size;
+	bool preallocated;
+};
+
+/**
+ * DRM_XFRM_BUF_INIT - Initializer for struct drm_xfrm_buf
+ *
+ * Initializes an instance of struct drm_xfrm_buf to default
+ * values.
+ */
+#define DRM_XFRM_BUF_INIT { \
+		.mem = NULL, \
+		.size = 0, \
+		.preallocated = false, \
+	}
+
+/**
+ * DRM_XFRM_BUF_INIT_PREALLOCATED - Initializer for struct drm_xfrm_buf
+ * @_mem: The preallocated memory area
+ * @_size: The number of bytes in _mem
+ *
+ * Initializes an instance of struct drm_xfrm_buf to preallocated
+ * storage. The caller is responsible for a releases the provided
+ * memory range.
+ */
+#define DRM_XFRM_BUF_INIT_PREALLOCATED(_mem, _size) { \
+		.mem = (_mem), \
+		.size = (_size), \
+		.preallocated = true, \
+	}
+
+int drmm_xfrm_buf_init(struct drm_device *dev, struct drm_xfrm_buf *buf);
+void *drm_xfrm_buf_reserve(struct drm_xfrm_buf *buf, size_t new_size, gfp_t flags);
+void drm_xfrm_buf_release(struct drm_xfrm_buf *buf);
+
 unsigned int drm_fb_clip_offset(unsigned int pitch, const struct drm_format_info *format,
 				const struct drm_rect *clip);
 
-- 
2.42.0

