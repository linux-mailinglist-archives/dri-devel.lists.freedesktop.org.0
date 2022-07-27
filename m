Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 725D6582595
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 13:34:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 566A5C4CBB;
	Wed, 27 Jul 2022 11:33:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3D25C47D8
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 11:33:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 40F6E385BD;
 Wed, 27 Jul 2022 11:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658921620; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+3qXhEDe+84mrK276xph7ibdsjl/P/JkttyfiLvYuHc=;
 b=z8diJZR0A0EJwvgphVMWy9b1y1z5bt8NRLu4kwPO5D6NxEBoNeXK2FxlhXxjkXBw15W8BE
 bB6b7QFgnvbNT1Xp0pNHmGYM8G9rlJfQED0p8HAuykb0aN+YTcbr57T9J2ey4BcxnT8g3Y
 +4Fi7OGaz/Rl4s1avAMijamL3ZiZkxY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658921620;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+3qXhEDe+84mrK276xph7ibdsjl/P/JkttyfiLvYuHc=;
 b=aHsylzaTTlDQ1R++e6vgxrprPlspVSRMA63ExP4WHUn4mUF2tlsCEUpbORg9z4Ef9AU57T
 pcVft0X3XndpMyDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E97DF13A8E;
 Wed, 27 Jul 2022 11:33:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GEjHN5Mi4WJmBAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 27 Jul 2022 11:33:39 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: sam@ravnborg.org, noralf@tronnes.org, daniel@ffwll.ch, airlied@linux.ie,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, airlied@redhat.com,
 javierm@redhat.com, drawat.floss@gmail.com, kraxel@redhat.com,
 david@lechnology.com, jose.exposito89@gmail.com
Subject: [PATCH 10/12] drm/format-helper: Rework XRGB8888-to-GRAY8 conversion
Date: Wed, 27 Jul 2022 13:33:10 +0200
Message-Id: <20220727113312.22407-11-tzimmermann@suse.de>
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

Update XRGB8888-to-GRAY8 conversion to support struct iosys_map
and convert all users. Although these are single-plane color formats,
the new interface supports multi-plane formats for consistency with
drm_fb_blit().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_format_helper.c | 25 +++++++++++++++++++------
 drivers/gpu/drm/gud/gud_pipe.c      |  7 +++++--
 drivers/gpu/drm/tiny/st7586.c       |  5 ++++-
 include/drm/drm_format_helper.h     |  5 +++--
 4 files changed, 31 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 209f63b66c5f..521932fac491 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -552,9 +552,9 @@ static void drm_fb_xrgb8888_to_gray8_line(void *dbuf, const void *sbuf, unsigned
 
 /**
  * drm_fb_xrgb8888_to_gray8 - Convert XRGB8888 to grayscale
- * @dst: 8-bit grayscale destination buffer
- * @dst_pitch: Number of bytes between two consecutive scanlines within dst
- * @vaddr: XRGB8888 source buffer
+ * @dst: Array of 8-bit grayscale destination buffers
+ * @dst_pitch: Array of number of bytes between two consecutive scanlines within dst
+ * @vmap: Array of XRGB8888 source buffers
  * @fb: DRM framebuffer
  * @clip: Clip rectangle area to copy
  *
@@ -567,10 +567,23 @@ static void drm_fb_xrgb8888_to_gray8_line(void *dbuf, const void *sbuf, unsigned
  *
  * ITU BT.601 is used for the RGB -> luma (brightness) conversion.
  */
-void drm_fb_xrgb8888_to_gray8(void *dst, unsigned int dst_pitch, const void *vaddr,
-			      const struct drm_framebuffer *fb, const struct drm_rect *clip)
+void drm_fb_xrgb8888_to_gray8(struct iosys_map *dst, const unsigned int *dst_pitch,
+			      const struct iosys_map *vmap, const struct drm_framebuffer *fb,
+			      const struct drm_rect *clip)
 {
-	drm_fb_xfrm(dst, dst_pitch, 1, vaddr, fb, clip, false, drm_fb_xrgb8888_to_gray8_line);
+	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
+		0, 0, 0, 0
+	};
+
+	if (!dst_pitch)
+		dst_pitch = default_dst_pitch;
+
+	if (dst[0].is_iomem)
+		drm_fb_xfrm_toio(dst[0].vaddr_iomem, dst_pitch[0], 1, vmap[0].vaddr, fb,
+				 clip, false, drm_fb_xrgb8888_to_gray8_line);
+	else
+		drm_fb_xfrm(dst[0].vaddr, dst_pitch[0], 1, vmap[0].vaddr, fb,
+			    clip, false, drm_fb_xrgb8888_to_gray8_line);
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_gray8);
 
diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index 0caa228f736d..7c6dc2bcd14a 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -59,6 +59,7 @@ static size_t gud_xrgb8888_to_r124(u8 *dst, const struct drm_format_info *format
 	unsigned int bits_per_pixel = 8 / block_width;
 	unsigned int x, y, width, height;
 	u8 pix, *pix8, *block = dst; /* Assign to silence compiler warning */
+	struct iosys_map dst_map, vmap;
 	size_t len;
 	void *buf;
 
@@ -74,7 +75,9 @@ static size_t gud_xrgb8888_to_r124(u8 *dst, const struct drm_format_info *format
 	if (!buf)
 		return 0;
 
-	drm_fb_xrgb8888_to_gray8(buf, 0, src, fb, rect);
+	iosys_map_set_vaddr(&dst_map, buf);
+	iosys_map_set_vaddr(&vmap, src);
+	drm_fb_xrgb8888_to_gray8(&dst_map, NULL, &vmap, fb, rect);
 	pix8 = buf;
 
 	for (y = 0; y < height; y++) {
@@ -194,7 +197,7 @@ static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
 				goto end_cpu_access;
 			}
 		} else if (format->format == DRM_FORMAT_R8) {
-			drm_fb_xrgb8888_to_gray8(buf, 0, vaddr, fb, rect);
+			drm_fb_xrgb8888_to_gray8(&dst, NULL, map_data, fb, rect);
 		} else if (format->format == DRM_FORMAT_RGB332) {
 			drm_fb_xrgb8888_to_rgb332(&dst, NULL, map_data, fb, rect);
 		} else if (format->format == DRM_FORMAT_RGB565) {
diff --git a/drivers/gpu/drm/tiny/st7586.c b/drivers/gpu/drm/tiny/st7586.c
index 8eddb020c43e..702350d0f8bc 100644
--- a/drivers/gpu/drm/tiny/st7586.c
+++ b/drivers/gpu/drm/tiny/st7586.c
@@ -69,12 +69,15 @@ static void st7586_xrgb8888_to_gray332(u8 *dst, void *vaddr,
 	size_t len = (clip->x2 - clip->x1) * (clip->y2 - clip->y1);
 	unsigned int x, y;
 	u8 *src, *buf, val;
+	struct iosys_map dst_map, vmap;
 
 	buf = kmalloc(len, GFP_KERNEL);
 	if (!buf)
 		return;
 
-	drm_fb_xrgb8888_to_gray8(buf, 0, vaddr, fb, clip);
+	iosys_map_set_vaddr(&dst_map, buf);
+	iosys_map_set_vaddr(&vmap, vaddr);
+	drm_fb_xrgb8888_to_gray8(&dst_map, NULL, &vmap, fb, clip);
 	src = buf;
 
 	for (y = clip->y1; y < clip->y2; y++) {
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index 6807440ce29c..68087c982497 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -32,8 +32,9 @@ void drm_fb_xrgb8888_to_rgb888(struct iosys_map *dst, const unsigned int *dst_pi
 void drm_fb_xrgb8888_to_xrgb2101010(struct iosys_map *dst, const unsigned int *dst_pitch,
 				    const struct iosys_map *vmap, const struct drm_framebuffer *fb,
 				    const struct drm_rect *clip);
-void drm_fb_xrgb8888_to_gray8(void *dst, unsigned int dst_pitch, const void *vaddr,
-			      const struct drm_framebuffer *fb, const struct drm_rect *clip);
+void drm_fb_xrgb8888_to_gray8(struct iosys_map *dst, const unsigned int *dst_pitch,
+			      const struct iosys_map *vmap, const struct drm_framebuffer *fb,
+			      const struct drm_rect *clip);
 
 int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t dst_format,
 		const struct iosys_map *vmap, const struct drm_framebuffer *fb,
-- 
2.37.1

