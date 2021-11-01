Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB1A441C6A
	for <lists+dri-devel@lfdr.de>; Mon,  1 Nov 2021 15:15:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B3646E867;
	Mon,  1 Nov 2021 14:15:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C896E867
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Nov 2021 14:15:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 56EE51FD6F;
 Mon,  1 Nov 2021 14:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1635776135; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m9IsAhUPp4YEufnjjVcnaYqYgvCaKcbK5WsfVABAW7A=;
 b=WH3ZdXsaazwqQnHdCcdI2il0vrlGLYuSILiur+6R/iRH6rssi83dWDw9nPVbYJS4LpiGnV
 RSDYhh3YQ2BnmaPybxV+EJgfmIkYekrnk2saS2TMbxyCQFkQiq8R9kPqQn/4/IXVAXeqcT
 DfdWH/CRWKS3d7buN4hoccwWEZ5WVSU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1635776135;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m9IsAhUPp4YEufnjjVcnaYqYgvCaKcbK5WsfVABAW7A=;
 b=R0FyTvhE11opFsx17ogFpMoMlqAUMXHMTmEOwu3LRN/979ML+exFIo6mFHjDMdh91j0k8z
 PxT+B3QqPgieOqAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D98A1139FD;
 Mon,  1 Nov 2021 14:15:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UE//M4b2f2GlHwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 01 Nov 2021 14:15:34 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, noralf@tronnes.org,
 drawat.floss@gmail.com, airlied@redhat.com, kraxel@redhat.com,
 david@lechnology.com, sam@ravnborg.org, javierm@redhat.com,
 kernel@amanoeldawod.com, dirty.ice.hu@gmail.com,
 michael+lkml@stapelberg.ch, aros@gmx.com, joshua@stroblindustries.com,
 arnd@arndb.de
Subject: [PATCH v2 3/9] drm/format-helper: Add destination-buffer pitch to
 drm_fb_swab()
Date: Mon,  1 Nov 2021 15:15:26 +0100
Message-Id: <20211101141532.26655-4-tzimmermann@suse.de>
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

Add destination-buffer pitch as argument to drm_fb_swab(). Done for
consistency with the rest of the interface.

v2:
	* update documentation (Noralf)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: Noralf Trønnes <noralf@tronnes.org>
Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
---
 drivers/gpu/drm/drm_format_helper.c | 21 ++++++++++++++++-----
 drivers/gpu/drm/drm_mipi_dbi.c      |  2 +-
 drivers/gpu/drm/gud/gud_pipe.c      |  2 +-
 include/drm/drm_format_helper.h     |  5 +++--
 4 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index fac37c697d8b..dac355320287 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -101,6 +101,7 @@ EXPORT_SYMBOL(drm_fb_memcpy_toio);
 /**
  * drm_fb_swab - Swap bytes into clip buffer
  * @dst: Destination buffer
+ * @dst_pitch: Number of bytes between two consecutive scanlines within dst
  * @src: Source buffer
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
@@ -110,21 +111,27 @@ EXPORT_SYMBOL(drm_fb_memcpy_toio);
  * time to speed up slow uncached reads.
  *
  * This function does not apply clipping on dst, i.e. the destination
- * is a small buffer containing the clip rect only.
+ * is at the top-left corner.
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
 
@@ -140,6 +147,9 @@ void drm_fb_swab(void *dst, void *src, struct drm_framebuffer *fb,
 			src32 = src;
 		}
 
+		dst16 = dst;
+		dst32 = dst;
+
 		for (x = clip->x1; x < clip->x2; x++) {
 			if (cpp == 4)
 				*dst32++ = swab32(*src32++);
@@ -148,6 +158,7 @@ void drm_fb_swab(void *dst, void *src, struct drm_framebuffer *fb,
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
index 1fc3ba7b6060..ddcba5abe306 100644
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
2.33.1

