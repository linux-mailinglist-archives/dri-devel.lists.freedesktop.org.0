Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 930ED58C960
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 15:26:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B852D92693;
	Mon,  8 Aug 2022 12:54:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDFAB91065
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 12:54:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6353537ADD;
 Mon,  8 Aug 2022 12:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659963252; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6WikFDhAqeKXaHThBblzddGqdNEDOonODN63dWMP+fg=;
 b=Gs0Vn1JilW1EMpNwU/oT1pyQdq+bb4WjMHnxkuyAM9C3ZIV9ADPXJwP+2bSgySmiL3Quw1
 uo8lf4YFxkx0YXpBDH430zo+F3PYTa0mh/4A7DTKLAsX3vHL6HEXLPiiZquWdDPN7n2b15
 J6NkC+DRaTRmlCY0vsNhscm3Jssg+LU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659963252;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6WikFDhAqeKXaHThBblzddGqdNEDOonODN63dWMP+fg=;
 b=itU14hIeDHeQF29ioKuNn67VT/4oo7vnpX4f2U/lACFjWvE3BVlhBebSskc8m7J6YJR3Lt
 enz2I9grsmcxypCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F116B13ADE;
 Mon,  8 Aug 2022 12:54:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mFTtOXMH8WLHUgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 08 Aug 2022 12:54:11 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: sam@ravnborg.org, jose.exposito89@gmail.com, javierm@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, noralf@tronnes.org, drawat.floss@gmail.com,
 lucas.demarchi@intel.com, david@lechnology.com, kraxel@redhat.com
Subject: [PATCH v2 10/14] drm/format-helper: Rework XRGB8888-to-XRGB2101010
 conversion
Date: Mon,  8 Aug 2022 14:54:02 +0200
Message-Id: <20220808125406.20752-11-tzimmermann@suse.de>
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

Update XRGB8888-to-XRGB2101010 conversion to support struct iosys_map
and convert all users. Although these are single-plane color formats,
the new interface supports multi-plane formats for consistency with
drm_fb_blit().

v2:
	* update documentation (Sam)
	* add TODO on vaddr location (Sam)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/drm_format_helper.c | 50 ++++++++++++++++++++---------
 include/drm/drm_format_helper.h     |  6 ++--
 2 files changed, 37 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 8083f5b85b3a..795d845c7e53 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -554,26 +554,45 @@ static void drm_fb_xrgb8888_to_xrgb2101010_line(void *dbuf, const void *sbuf, un
 }
 
 /**
- * drm_fb_xrgb8888_to_xrgb2101010_toio - Convert XRGB8888 to XRGB2101010 clip
- * buffer
- * @dst: XRGB2101010 destination buffer (iomem)
- * @dst_pitch: Number of bytes between two consecutive scanlines within dst
- * @vaddr: XRGB8888 source buffer
+ * drm_fb_xrgb8888_to_xrgb2101010 - Convert XRGB8888 to XRGB2101010 clip buffer
+ * @dst: Array of XRGB2101010 destination buffers
+ * @dst_pitch: Array of numbers of bytes between the start of two consecutive scanlines
+ *             within @dst; can be NULL if scanlines are stored next to each other.
+ * @vmap: Array of XRGB8888 source buffers
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
  *
- * Drivers can use this function for XRGB2101010 devices that don't natively
- * support XRGB8888.
+ * This function copies parts of a framebuffer to display memory and converts the
+ * color format during the process. Destination and framebuffer formats must match. The
+ * parameters @dst, @dst_pitch and @vmap refer to arrays. Each array must have at
+ * least as many entries as there are planes in @fb's format. Each entry stores the
+ * value for the format's respective color plane at the same index.
+ *
+ * This function does not apply clipping on @dst (i.e. the destination is at the
+ * top-left corner).
+ *
+ * Drivers can use this function for XRGB2101010 devices that don't support XRGB8888
+ * natively.
  */
-void drm_fb_xrgb8888_to_xrgb2101010_toio(void __iomem *dst,
-					 unsigned int dst_pitch, const void *vaddr,
-					 const struct drm_framebuffer *fb,
-					 const struct drm_rect *clip)
+void drm_fb_xrgb8888_to_xrgb2101010(struct iosys_map *dst, const unsigned int *dst_pitch,
+				    const struct iosys_map *vmap, const struct drm_framebuffer *fb,
+				    const struct drm_rect *clip)
 {
-	drm_fb_xfrm_toio(dst, dst_pitch, 4, vaddr, fb, clip, false,
-			 drm_fb_xrgb8888_to_xrgb2101010_line);
+	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
+		0, 0, 0, 0
+	};
+
+	if (!dst_pitch)
+		dst_pitch = default_dst_pitch;
+
+	/* TODO: handle vmap in I/O memory here */
+	if (dst[0].is_iomem)
+		drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], 4, vmap[0].vaddr, fb,
+				 clip, false, drm_fb_xrgb8888_to_xrgb2101010_line);
+	else
+		drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], 4, vmap[0].vaddr, fb,
+			    clip, false, drm_fb_xrgb8888_to_xrgb2101010_line);
 }
-EXPORT_SYMBOL(drm_fb_xrgb8888_to_xrgb2101010_toio);
 
 static void drm_fb_xrgb8888_to_gray8_line(void *dbuf, const void *sbuf, unsigned int pixels)
 {
@@ -681,8 +700,7 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
 		}
 	} else if (dst_format == DRM_FORMAT_XRGB2101010) {
 		if (fb_format == DRM_FORMAT_XRGB8888) {
-			drm_fb_xrgb8888_to_xrgb2101010_toio(dst[0].vaddr_iomem, dst_pitch[0],
-							    vmap[0].vaddr, fb, clip);
+			drm_fb_xrgb8888_to_xrgb2101010(dst, dst_pitch, vmap, fb, clip);
 			return 0;
 		}
 	}
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index 8c633dbab5d6..6807440ce29c 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -29,9 +29,9 @@ void drm_fb_xrgb8888_to_rgb565(struct iosys_map *dst, const unsigned int *dst_pi
 void drm_fb_xrgb8888_to_rgb888(struct iosys_map *dst, const unsigned int *dst_pitch,
 			       const struct iosys_map *vmap, const struct drm_framebuffer *fb,
 			       const struct drm_rect *clip);
-void drm_fb_xrgb8888_to_xrgb2101010_toio(void __iomem *dst, unsigned int dst_pitch,
-					 const void *vaddr, const struct drm_framebuffer *fb,
-					 const struct drm_rect *clip);
+void drm_fb_xrgb8888_to_xrgb2101010(struct iosys_map *dst, const unsigned int *dst_pitch,
+				    const struct iosys_map *vmap, const struct drm_framebuffer *fb,
+				    const struct drm_rect *clip);
 void drm_fb_xrgb8888_to_gray8(void *dst, unsigned int dst_pitch, const void *vaddr,
 			      const struct drm_framebuffer *fb, const struct drm_rect *clip);
 
-- 
2.37.1

