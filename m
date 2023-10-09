Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F907BE229
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 16:10:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0676F10E273;
	Mon,  9 Oct 2023 14:10:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D951A10E268
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 14:10:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2AC2B2188A;
 Mon,  9 Oct 2023 14:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1696860621; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jICnDOR2ZN4vwCRMzqVi1cQC0gBuabK5PmccyTXK2ko=;
 b=EY1kquVV+Pd0yljSgYlXYwFK/FiROvK2EMR6BkTnK+lplvzfQugSg9AAINLLL8x+WXMxjx
 oBgMAGw1wLMUCsTRbJ4wqlj2cM3t0AJRNgBRIvE0A7ArtypIB/Nps2nd85JmoIu0eYLNbm
 lCHrEFQV5ZWN5GxMPfKvA9BK5bboViA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1696860621;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jICnDOR2ZN4vwCRMzqVi1cQC0gBuabK5PmccyTXK2ko=;
 b=rJcIEfAvTP76vyRSSOqmy/4N2F1hTGba51Yo2++ttGzUIKalvuxKdGWMVPhgfA7FIwg5hh
 tbw2UDJ1cSLLm9CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D4C6C1390B;
 Mon,  9 Oct 2023 14:10:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2HkWM8wJJGXaBAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 09 Oct 2023 14:10:20 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jfalempe@redhat.com, jose.exposito89@gmail.com,
 arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
Subject: [PATCH v5 1/7] drm/format-helper: Cache buffers with struct
 drm_format_conv_state
Date: Mon,  9 Oct 2023 16:06:30 +0200
Message-ID: <20231009141018.11291-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231009141018.11291-1-tzimmermann@suse.de>
References: <20231009141018.11291-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hold temporary memory for format conversion in an instance of struct
drm_format_conv_state. Update internal helpers of DRM's format-conversion
code accordingly. Drivers will later be able to maintain this cache by
themselves.

Besides caching, struct drm_format_conv_state will be useful to hold
additional information for format conversion, such as palette data or
foreground/background colors. This will enable conversion from indexed
color formats to component-based formats.

v5:
	* improve documentation (Javier, Noralf)
v3:
	* rename struct drm_xfrm_buf to struct drm_format_conv_state
	  (Javier)
	* remove managed cleanup
	* add drm_format_conv_state_copy() for shadow-plane support

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Noralf Trønnes <noralf@tronnes.org>
Tested-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/drm_format_helper.c | 118 +++++++++++++++++++++++++---
 include/drm/drm_format_helper.h     |  51 ++++++++++++
 2 files changed, 158 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index f93a4efcee909..28d013d427788 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -20,6 +20,97 @@
 #include <drm/drm_print.h>
 #include <drm/drm_rect.h>
 
+/**
+ * drm_format_conv_state_init - Initialize format-conversion state
+ * @state: The state to initialize
+ *
+ * Clears all fields in struct drm_format_conv_state. The state will
+ * be empty with no preallocated resources.
+ */
+void drm_format_conv_state_init(struct drm_format_conv_state *state)
+{
+	state->tmp.mem = NULL;
+	state->tmp.size = 0;
+	state->tmp.preallocated = false;
+}
+EXPORT_SYMBOL(drm_format_conv_state_init);
+
+/**
+ * drm_format_conv_state_copy - Copy format-conversion state
+ * @state: Destination state
+ * @old_state: Source state
+ *
+ * Copies format-conversion state from @old_state to @state; except for
+ * temporary storage.
+ */
+void drm_format_conv_state_copy(struct drm_format_conv_state *state,
+				const struct drm_format_conv_state *old_state)
+{
+	/*
+	 * So far, there's only temporary storage here, which we don't
+	 * duplicate. Just clear the fields.
+	 */
+	state->tmp.mem = NULL;
+	state->tmp.size = 0;
+	state->tmp.preallocated = false;
+}
+EXPORT_SYMBOL(drm_format_conv_state_copy);
+
+/**
+ * drm_format_conv_state_reserve - Allocates storage for format conversion
+ * @state: The format-conversion state
+ * @new_size: The minimum allocation size
+ * @flags: Flags for kmalloc()
+ *
+ * Allocates at least @new_size bytes and returns a pointer to the memory
+ * range. After calling this function, previously returned memory blocks
+ * are invalid. It's best to collect all memory requirements of a format
+ * conversion and call this function once to allocate the range.
+ *
+ * Returns:
+ * A pointer to the allocated memory range, or NULL otherwise.
+ */
+void *drm_format_conv_state_reserve(struct drm_format_conv_state *state,
+				    size_t new_size, gfp_t flags)
+{
+	void *mem;
+
+	if (new_size <= state->tmp.size)
+		goto out;
+	else if (state->tmp.preallocated)
+		return NULL;
+
+	mem = krealloc(state->tmp.mem, new_size, flags);
+	if (!mem)
+		return NULL;
+
+	state->tmp.mem = mem;
+	state->tmp.size = new_size;
+
+out:
+	return state->tmp.mem;
+}
+EXPORT_SYMBOL(drm_format_conv_state_reserve);
+
+/**
+ * drm_format_conv_state_release - Releases an format-conversion storage
+ * @state: The format-conversion state
+ *
+ * Releases the memory range references by the format-conversion state.
+ * After this call, all pointers to the memory are invalid. Prefer
+ * drm_format_conv_state_init() for cleaning up and unloading a driver.
+ */
+void drm_format_conv_state_release(struct drm_format_conv_state *state)
+{
+	if (state->tmp.preallocated)
+		return;
+
+	kfree(state->tmp.mem);
+	state->tmp.mem = NULL;
+	state->tmp.size = 0;
+}
+EXPORT_SYMBOL(drm_format_conv_state_release);
+
 static unsigned int clip_offset(const struct drm_rect *clip, unsigned int pitch, unsigned int cpp)
 {
 	return clip->y1 * pitch + clip->x1 * cpp;
@@ -45,6 +136,7 @@ EXPORT_SYMBOL(drm_fb_clip_offset);
 static int __drm_fb_xfrm(void *dst, unsigned long dst_pitch, unsigned long dst_pixsize,
 			 const void *vaddr, const struct drm_framebuffer *fb,
 			 const struct drm_rect *clip, bool vaddr_cached_hint,
+			 struct drm_format_conv_state *state,
 			 void (*xfrm_line)(void *dbuf, const void *sbuf, unsigned int npixels))
 {
 	unsigned long linepixels = drm_rect_width(clip);
@@ -60,7 +152,7 @@ static int __drm_fb_xfrm(void *dst, unsigned long dst_pitch, unsigned long dst_p
 	 * one line at a time.
 	 */
 	if (!vaddr_cached_hint) {
-		stmp = kmalloc(sbuf_len, GFP_KERNEL);
+		stmp = drm_format_conv_state_reserve(state, sbuf_len, GFP_KERNEL);
 		if (!stmp)
 			return -ENOMEM;
 	}
@@ -79,8 +171,6 @@ static int __drm_fb_xfrm(void *dst, unsigned long dst_pitch, unsigned long dst_p
 		dst += dst_pitch;
 	}
 
-	kfree(stmp);
-
 	return 0;
 }
 
@@ -88,6 +178,7 @@ static int __drm_fb_xfrm(void *dst, unsigned long dst_pitch, unsigned long dst_p
 static int __drm_fb_xfrm_toio(void __iomem *dst, unsigned long dst_pitch, unsigned long dst_pixsize,
 			      const void *vaddr, const struct drm_framebuffer *fb,
 			      const struct drm_rect *clip, bool vaddr_cached_hint,
+			      struct drm_format_conv_state *state,
 			      void (*xfrm_line)(void *dbuf, const void *sbuf, unsigned int npixels))
 {
 	unsigned long linepixels = drm_rect_width(clip);
@@ -101,9 +192,9 @@ static int __drm_fb_xfrm_toio(void __iomem *dst, unsigned long dst_pitch, unsign
 	void *dbuf;
 
 	if (vaddr_cached_hint) {
-		dbuf = kmalloc(dbuf_len, GFP_KERNEL);
+		dbuf = drm_format_conv_state_reserve(state, dbuf_len, GFP_KERNEL);
 	} else {
-		dbuf = kmalloc(stmp_off + sbuf_len, GFP_KERNEL);
+		dbuf = drm_format_conv_state_reserve(state, stmp_off + sbuf_len, GFP_KERNEL);
 		stmp = dbuf + stmp_off;
 	}
 	if (!dbuf)
@@ -124,8 +215,6 @@ static int __drm_fb_xfrm_toio(void __iomem *dst, unsigned long dst_pitch, unsign
 		dst += dst_pitch;
 	}
 
-	kfree(dbuf);
-
 	return 0;
 }
 
@@ -139,17 +228,24 @@ static int drm_fb_xfrm(struct iosys_map *dst,
 	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
 		0, 0, 0, 0
 	};
+	struct drm_format_conv_state fmtcnv_state = DRM_FORMAT_CONV_STATE_INIT;
+	int ret;
 
 	if (!dst_pitch)
 		dst_pitch = default_dst_pitch;
 
 	/* TODO: handle src in I/O memory here */
 	if (dst[0].is_iomem)
-		return __drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], dst_pixsize[0],
-					  src[0].vaddr, fb, clip, vaddr_cached_hint, xfrm_line);
+		ret = __drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], dst_pixsize[0],
+					 src[0].vaddr, fb, clip, vaddr_cached_hint, &fmtcnv_state,
+					 xfrm_line);
 	else
-		return __drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], dst_pixsize[0],
-				     src[0].vaddr, fb, clip, vaddr_cached_hint, xfrm_line);
+		ret = __drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], dst_pixsize[0],
+				    src[0].vaddr, fb, clip, vaddr_cached_hint, &fmtcnv_state,
+				    xfrm_line);
+	drm_format_conv_state_release(&fmtcnv_state);
+
+	return ret;
 }
 
 /**
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index 291deb09475bb..724a9baf7315d 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -15,6 +15,57 @@ struct drm_rect;
 
 struct iosys_map;
 
+/**
+ * struct drm_format_conv_state - Stores format-conversion state
+ *
+ * DRM helpers for format conversion store temporary state in
+ * struct drm_xfrm_buf. The buffer's resources can be reused
+ * among multiple conversion operations.
+ *
+ * All fields are considered private.
+ */
+struct drm_format_conv_state {
+	struct {
+		void *mem;
+		size_t size;
+		bool preallocated;
+	} tmp;
+};
+
+#define __DRM_FORMAT_CONV_STATE_INIT(_mem, _size, _preallocated) { \
+		.tmp = { \
+			.mem = (_mem), \
+			.size = (_size), \
+			.preallocated = (_preallocated), \
+		} \
+	}
+
+/**
+ * DRM_FORMAT_CONV_STATE_INIT - Initializer for struct drm_format_conv_state
+ *
+ * Initializes an instance of struct drm_format_conv_state to default values.
+ */
+#define DRM_FORMAT_CONV_STATE_INIT \
+	__DRM_FORMAT_CONV_STATE_INIT(NULL, 0, false)
+
+/**
+ * DRM_FORMAT_CONV_STATE_INIT_PREALLOCATED - Initializer for struct drm_format_conv_state
+ * @_mem: The preallocated memory area
+ * @_size: The number of bytes in _mem
+ *
+ * Initializes an instance of struct drm_format_conv_state to preallocated
+ * storage. The caller is responsible for releasing the provided memory range.
+ */
+#define DRM_FORMAT_CONV_STATE_INIT_PREALLOCATED(_mem, _size) \
+	__DRM_FORMAT_CONV_STATE_INIT(_mem, _size, true)
+
+void drm_format_conv_state_init(struct drm_format_conv_state *state);
+void drm_format_conv_state_copy(struct drm_format_conv_state *state,
+				const struct drm_format_conv_state *old_state);
+void *drm_format_conv_state_reserve(struct drm_format_conv_state *state,
+				    size_t new_size, gfp_t flags);
+void drm_format_conv_state_release(struct drm_format_conv_state *state);
+
 unsigned int drm_fb_clip_offset(unsigned int pitch, const struct drm_format_info *format,
 				const struct drm_rect *clip);
 
-- 
2.42.0

