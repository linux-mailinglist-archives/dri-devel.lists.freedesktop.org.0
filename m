Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE164377FB
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 15:29:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9145F6ED9A;
	Fri, 22 Oct 2021 13:29:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D11FC6ED8A
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 13:28:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 39F3A21982;
 Fri, 22 Oct 2021 13:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1634909312; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=54UuCEyIozo+qptfH2cq+hpA85QQ7QvF2nVzUEltC6c=;
 b=wMVK1J3PEGIqEHbYNT7e3eT3IqLUbZDqXFE2B9uwzFzMLB05fml7qvlybnykVlii2CfpKr
 mOel5RaZ7zDPEYLslEd0e4oYN9XMuwuDYvt7VVHhaaMEGO2r4Nc4k+mKEE9ZUNUkFJyNLb
 D0PhZvT8MEiIExKrt2sUGJ3tOUqvuu4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1634909312;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=54UuCEyIozo+qptfH2cq+hpA85QQ7QvF2nVzUEltC6c=;
 b=N8cDxRDIgNRUU2W+WQrI3nEPT6H1byRuvjB5qVYDTA4OeW8//gxpfVYN+Gn30G8lvTv4De
 0ieswMFDQox09BBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CB1E713E7E;
 Fri, 22 Oct 2021 13:28:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +PGeMH+8cmEwXgAAMHmgww
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
Subject: [PATCH 3/9] drm/format-helper: Add destination-buffer pitch to
 drm_fb_swab()
Date: Fri, 22 Oct 2021 15:28:23 +0200
Message-Id: <20211022132829.7697-4-tzimmermann@suse.de>
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

Add destination-buffer pitch as argument to drm_fb_swab(). Done for
consistency with the rest of the interface.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_format_helper.c | 19 +++++++++++++++----
 drivers/gpu/drm/drm_mipi_dbi.c      |  2 +-
 drivers/gpu/drm/gud/gud_pipe.c      |  2 +-
 include/drm/drm_format_helper.h     |  5 +++--
 4 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 38c8055f6fa8..79869ed553d9 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -92,6 +92,7 @@ EXPORT_SYMBOL(drm_fb_memcpy_toio);
 /**
  * drm_fb_swab - Swap bytes into clip buffer
  * @dst: Destination buffer
+ * @dst_pitch: Number of bytes between two consecutive scanlines within dst
  * @src: Source buffer
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
@@ -103,19 +104,25 @@ EXPORT_SYMBOL(drm_fb_memcpy_toio);
  * This function does not apply clipping on dst, i.e. the destination
  * is a small buffer containing the clip rect only.
  */
-void drm_fb_swab(void *dst, void *src, struct drm_framebuffer *fb,
-		 struct drm_rect *clip, bool cached)
+void drm_fb_swab(void *dst, unsigned int dst_pitch, const void *src,
+		 const struct drm_framebuffer *fb, const struct drm_rect *clip,
+		 bool cached)
 {
 	u8 cpp = fb->format->cpp[0];
 	size_t len = drm_rect_width(clip) * cpp;
-	u16 *src16, *dst16 = dst;
-	u32 *src32, *dst32 = dst;
+	const u16 *src16;
+	const u32 *src32;
+	u16 *dst16;
+	u32 *dst32;
 	unsigned int x, y;
 	void *buf = NULL;
 
 	if (WARN_ON_ONCE(cpp != 2 && cpp != 4))
 		return;
 
+	if (!dst_pitch)
+		dst_pitch = len;
+
 	if (!cached)
 		buf = kmalloc(len, GFP_KERNEL);
 
@@ -131,6 +138,9 @@ void drm_fb_swab(void *dst, void *src, struct drm_framebuffer *fb,
 			src32 = src;
 		}
 
+		dst16 = dst;
+		dst32 = dst;
+
 		for (x = clip->x1; x < clip->x2; x++) {
 			if (cpp == 4)
 				*dst32++ = swab32(*src32++);
@@ -139,6 +149,7 @@ void drm_fb_swab(void *dst, void *src, struct drm_framebuffer *fb,
 		}
 
 		src += fb->pitches[0];
+		dst += dst_pitch;
 	}
 
 	kfree(buf);
diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index c09df8b06c7a..7ce89917d761 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -211,7 +211,7 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
 	switch (fb->format->format) {
 	case DRM_FORMAT_RGB565:
 		if (swap)
-			drm_fb_swab(dst, src, fb, clip, !gem->import_attach);
+			drm_fb_swab(dst, 0, src, fb, clip, !gem->import_attach);
 		else
 			drm_fb_memcpy(dst, 0, src, fb, clip);
 		break;
diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index a92112ffd37a..e0b117b2559f 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -201,7 +201,7 @@ static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
 			len = gud_xrgb8888_to_color(buf, format, vaddr, fb, rect);
 		}
 	} else if (gud_is_big_endian() && format->cpp[0] > 1) {
-		drm_fb_swab(buf, vaddr, fb, rect, !import_attach);
+		drm_fb_swab(buf, 0, vaddr, fb, rect, !import_attach);
 	} else if (compression && !import_attach && pitch == fb->pitches[0]) {
 		/* can compress directly from the framebuffer */
 		buf = vaddr + rect->y1 * pitch;
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index 8d72f6fd27e9..c4c3c845e119 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -17,8 +17,9 @@ void drm_fb_memcpy(void *dst, unsigned int dst_pitch, const void *vaddr,
 		   const struct drm_framebuffer *fb, const struct drm_rect *clip);
 void drm_fb_memcpy_toio(void __iomem *dst, unsigned int dst_pitch, const void *vaddr,
 			const struct drm_framebuffer *fb, const struct drm_rect *clip);
-void drm_fb_swab(void *dst, void *src, struct drm_framebuffer *fb,
-		 struct drm_rect *clip, bool cached);
+void drm_fb_swab(void *dst, unsigned int dst_pitch, const void *src,
+		 const struct drm_framebuffer *fb, const struct drm_rect *clip,
+		 bool cached);
 void drm_fb_xrgb8888_to_rgb332(void *dst, void *vaddr, struct drm_framebuffer *fb,
 			       struct drm_rect *clip);
 void drm_fb_xrgb8888_to_rgb565(void *dst, void *vaddr,
-- 
2.33.0

