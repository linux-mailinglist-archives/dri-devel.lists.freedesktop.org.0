Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5393E7B6B65
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 16:25:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A67210E127;
	Tue,  3 Oct 2023 14:25:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EA3110E18A
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Oct 2023 14:25:28 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-132-7BGOqvgxP96Xy2qaAkx2lQ-1; Tue, 03 Oct 2023 10:25:23 -0400
X-MC-Unique: 7BGOqvgxP96Xy2qaAkx2lQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC8B2858F19;
 Tue,  3 Oct 2023 14:25:22 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4063D2156701;
 Tue,  3 Oct 2023 14:25:21 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, bluescreen_avenger@verizon.net
Subject: [PATCH v4 1/4] drm/format-helper: Export line conversion helper for
 drm_panic
Date: Tue,  3 Oct 2023 16:22:44 +0200
Message-ID: <20231003142508.190246-2-jfalempe@redhat.com>
In-Reply-To: <20231003142508.190246-1-jfalempe@redhat.com>
References: <20231003142508.190246-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: gpiccoli@igalia.com, Jocelyn Falempe <jfalempe@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_panic will need the low-level drm_fb_xxxx_line functions.
Also add drm_fb_r1_to_xrgb8888 to render the fonts.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_format_helper.c | 88 ++++++++++++++++++++++++++---
 include/drm/drm_format_helper.h     |  9 +++
 2 files changed, 89 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index f93a4efcee90..c238e5d84f1f 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -270,7 +270,30 @@ void drm_fb_swab(struct iosys_map *dst, const unsigned int *dst_pitch,
 
 	drm_fb_xfrm(dst, dst_pitch, &cpp, src, fb, clip, cached, swab_line);
 }
-EXPORT_SYMBOL(drm_fb_swab);
+
+/**
+ * drm_fb_r1_to_32bit_line - Convert one line from monochrome to any 32bit pixel format
+ * @dbuf: Pointer to the destination line (in any 32bit format)
+ * @sbuf: Pointer to the source line (in monochrome)
+ * @pixels: Number of pixels to convert.
+ * @fg_color: Foreground color, applied when R1 is 1
+ * @bg_color: Background color, applied when R1 is 0
+ *
+ * Convert monochrome to any format with 32bit pixel.
+ * There is a limitation, as sbuf is a pointer, it can only points to a multiple
+ * of 8 pixels in the source buffer.
+ */
+void drm_fb_r1_to_32bit_line(void *dbuf, const void *sbuf, unsigned int pixels,
+				u32 fg_color, u32 bg_color)
+{
+	unsigned int x;
+	const u8 *sbuf8 = sbuf;
+	u32 *dubf32 = dbuf;
+
+	for (x = 0; x < pixels; x++)
+		dubf32[x] = (sbuf8[x / 8] & (0x80 >> (x % 8))) ? fg_color : bg_color;
+}
+EXPORT_SYMBOL(drm_fb_r1_to_32bit_line);
 
 static void drm_fb_xrgb8888_to_rgb332_line(void *dbuf, const void *sbuf, unsigned int pixels)
 {
@@ -320,7 +343,13 @@ void drm_fb_xrgb8888_to_rgb332(struct iosys_map *dst, const unsigned int *dst_pi
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb332);
 
-static void drm_fb_xrgb8888_to_rgb565_line(void *dbuf, const void *sbuf, unsigned int pixels)
+/**
+ * drm_fb_xrgb8888_to_rgb565_line - Convert one line from XRGB8888 to RGB565
+ * @dbuf: Pointer to the destination line (in RGB565)
+ * @sbuf: Pointer to the source line (in XRGB8888)
+ * @pixels: Number of pixels to convert.
+ */
+void drm_fb_xrgb8888_to_rgb565_line(void *dbuf, const void *sbuf, unsigned int pixels)
 {
 	__le16 *dbuf16 = dbuf;
 	const __le32 *sbuf32 = sbuf;
@@ -336,6 +365,7 @@ static void drm_fb_xrgb8888_to_rgb565_line(void *dbuf, const void *sbuf, unsigne
 		dbuf16[x] = cpu_to_le16(val16);
 	}
 }
+EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb565_line);
 
 /* TODO: implement this helper as conversion to RGB565|BIG_ENDIAN */
 static void drm_fb_xrgb8888_to_rgb565_swab_line(void *dbuf, const void *sbuf,
@@ -396,7 +426,13 @@ void drm_fb_xrgb8888_to_rgb565(struct iosys_map *dst, const unsigned int *dst_pi
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb565);
 
-static void drm_fb_xrgb8888_to_xrgb1555_line(void *dbuf, const void *sbuf, unsigned int pixels)
+/**
+ * drm_fb_xrgb8888_to_rgb565_line - Convert one line from XRGB8888 to XRGB1555
+ * @dbuf: Pointer to the destination line (in XRGB1555)
+ * @sbuf: Pointer to the source line (in XRGB8888)
+ * @pixels: Number of pixels to convert.
+ */
+void drm_fb_xrgb8888_to_xrgb1555_line(void *dbuf, const void *sbuf, unsigned int pixels)
 {
 	__le16 *dbuf16 = dbuf;
 	const __le32 *sbuf32 = sbuf;
@@ -412,6 +448,7 @@ static void drm_fb_xrgb8888_to_xrgb1555_line(void *dbuf, const void *sbuf, unsig
 		dbuf16[x] = cpu_to_le16(val16);
 	}
 }
+EXPORT_SYMBOL(drm_fb_xrgb8888_to_xrgb1555_line);
 
 /**
  * drm_fb_xrgb8888_to_xrgb1555 - Convert XRGB8888 to XRGB1555 clip buffer
@@ -447,7 +484,13 @@ void drm_fb_xrgb8888_to_xrgb1555(struct iosys_map *dst, const unsigned int *dst_
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_xrgb1555);
 
-static void drm_fb_xrgb8888_to_argb1555_line(void *dbuf, const void *sbuf, unsigned int pixels)
+/**
+ * drm_fb_xrgb8888_to_rgb565_line - Convert one line from XRGB8888 to ARGB1555
+ * @dbuf: Pointer to the destination line (in ARGB1555)
+ * @sbuf: Pointer to the source line (in XRGB8888)
+ * @pixels: Number of pixels to convert.
+ */
+void drm_fb_xrgb8888_to_argb1555_line(void *dbuf, const void *sbuf, unsigned int pixels)
 {
 	__le16 *dbuf16 = dbuf;
 	const __le32 *sbuf32 = sbuf;
@@ -464,6 +507,7 @@ static void drm_fb_xrgb8888_to_argb1555_line(void *dbuf, const void *sbuf, unsig
 		dbuf16[x] = cpu_to_le16(val16);
 	}
 }
+EXPORT_SYMBOL(drm_fb_xrgb8888_to_argb1555_line);
 
 /**
  * drm_fb_xrgb8888_to_argb1555 - Convert XRGB8888 to ARGB1555 clip buffer
@@ -499,7 +543,13 @@ void drm_fb_xrgb8888_to_argb1555(struct iosys_map *dst, const unsigned int *dst_
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_argb1555);
 
-static void drm_fb_xrgb8888_to_rgba5551_line(void *dbuf, const void *sbuf, unsigned int pixels)
+/**
+ * drm_fb_xrgb8888_to_rgba5551_line - Convert one line from XRGB8888 to ARGB5551
+ * @dbuf: Pointer to the destination line (in ARGB5551)
+ * @sbuf: Pointer to the source line (in XRGB8888)
+ * @pixels: Number of pixels to convert.
+ */
+void drm_fb_xrgb8888_to_rgba5551_line(void *dbuf, const void *sbuf, unsigned int pixels)
 {
 	__le16 *dbuf16 = dbuf;
 	const __le32 *sbuf32 = sbuf;
@@ -516,6 +566,7 @@ static void drm_fb_xrgb8888_to_rgba5551_line(void *dbuf, const void *sbuf, unsig
 		dbuf16[x] = cpu_to_le16(val16);
 	}
 }
+EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgba5551_line);
 
 /**
  * drm_fb_xrgb8888_to_rgba5551 - Convert XRGB8888 to RGBA5551 clip buffer
@@ -551,7 +602,13 @@ void drm_fb_xrgb8888_to_rgba5551(struct iosys_map *dst, const unsigned int *dst_
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgba5551);
 
-static void drm_fb_xrgb8888_to_rgb888_line(void *dbuf, const void *sbuf, unsigned int pixels)
+/**
+ * drm_fb_xrgb8888_to_rgb888_line - Convert one line from XRGB8888 to RGB888
+ * @dbuf: Pointer to the destination line (in RGB888)
+ * @sbuf: Pointer to the source line (in XRGB8888)
+ * @pixels: Number of pixels to convert.
+ */
+void drm_fb_xrgb8888_to_rgb888_line(void *dbuf, const void *sbuf, unsigned int pixels)
 {
 	u8 *dbuf8 = dbuf;
 	const __le32 *sbuf32 = sbuf;
@@ -566,6 +623,7 @@ static void drm_fb_xrgb8888_to_rgb888_line(void *dbuf, const void *sbuf, unsigne
 		*dbuf8++ = (pix & 0x00FF0000) >> 16;
 	}
 }
+EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb888_line);
 
 /**
  * drm_fb_xrgb8888_to_rgb888 - Convert XRGB8888 to RGB888 clip buffer
@@ -709,7 +767,13 @@ static void drm_fb_xrgb8888_to_xbgr8888(struct iosys_map *dst, const unsigned in
 		    drm_fb_xrgb8888_to_xbgr8888_line);
 }
 
-static void drm_fb_xrgb8888_to_xrgb2101010_line(void *dbuf, const void *sbuf, unsigned int pixels)
+/**
+ * drm_fb_xrgb8888_to_rgb888_line - Convert one line from XRGB8888 to XRGB2101010
+ * @dbuf: Pointer to the destination line (in XRGB2101010)
+ * @sbuf: Pointer to the source line (in XRGB8888)
+ * @pixels: Number of pixels to convert.
+ */
+void drm_fb_xrgb8888_to_xrgb2101010_line(void *dbuf, const void *sbuf, unsigned int pixels)
 {
 	__le32 *dbuf32 = dbuf;
 	const __le32 *sbuf32 = sbuf;
@@ -726,6 +790,7 @@ static void drm_fb_xrgb8888_to_xrgb2101010_line(void *dbuf, const void *sbuf, un
 		*dbuf32++ = cpu_to_le32(pix);
 	}
 }
+EXPORT_SYMBOL(drm_fb_xrgb8888_to_xrgb2101010_line);
 
 /**
  * drm_fb_xrgb8888_to_xrgb2101010 - Convert XRGB8888 to XRGB2101010 clip buffer
@@ -761,7 +826,13 @@ void drm_fb_xrgb8888_to_xrgb2101010(struct iosys_map *dst, const unsigned int *d
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_xrgb2101010);
 
-static void drm_fb_xrgb8888_to_argb2101010_line(void *dbuf, const void *sbuf, unsigned int pixels)
+/**
+ * drm_fb_xrgb8888_to_rgb888_line - Convert one line from XRGB8888 to ARGB2101010
+ * @dbuf: Pointer to the destination line (in ARGB2101010)
+ * @sbuf: Pointer to the source line (in XRGB8888)
+ * @pixels: Number of pixels to convert.
+ */
+void drm_fb_xrgb8888_to_argb2101010_line(void *dbuf, const void *sbuf, unsigned int pixels)
 {
 	__le32 *dbuf32 = dbuf;
 	const __le32 *sbuf32 = sbuf;
@@ -779,6 +850,7 @@ static void drm_fb_xrgb8888_to_argb2101010_line(void *dbuf, const void *sbuf, un
 		*dbuf32++ = cpu_to_le32(pix);
 	}
 }
+EXPORT_SYMBOL(drm_fb_xrgb8888_to_argb2101010_line);
 
 /**
  * drm_fb_xrgb8888_to_argb2101010 - Convert XRGB8888 to ARGB2101010 clip buffer
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index 291deb09475b..31ab699128d5 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -24,30 +24,39 @@ void drm_fb_memcpy(struct iosys_map *dst, const unsigned int *dst_pitch,
 void drm_fb_swab(struct iosys_map *dst, const unsigned int *dst_pitch,
 		 const struct iosys_map *src, const struct drm_framebuffer *fb,
 		 const struct drm_rect *clip, bool cached);
+void drm_fb_r1_to_32bit_line(void *dbuf, const void *sbuf, unsigned int pixels,
+			     u32 fg_color, u32 bg_color);
 void drm_fb_xrgb8888_to_rgb332(struct iosys_map *dst, const unsigned int *dst_pitch,
 			       const struct iosys_map *src, const struct drm_framebuffer *fb,
 			       const struct drm_rect *clip);
+void drm_fb_xrgb8888_to_rgb565_line(void *dbuf, const void *sbuf, unsigned int pixels);
 void drm_fb_xrgb8888_to_rgb565(struct iosys_map *dst, const unsigned int *dst_pitch,
 			       const struct iosys_map *src, const struct drm_framebuffer *fb,
 			       const struct drm_rect *clip, bool swab);
+void drm_fb_xrgb8888_to_xrgb1555_line(void *dbuf, const void *sbuf, unsigned int pixels);
 void drm_fb_xrgb8888_to_xrgb1555(struct iosys_map *dst, const unsigned int *dst_pitch,
 				 const struct iosys_map *src, const struct drm_framebuffer *fb,
 				 const struct drm_rect *clip);
+void drm_fb_xrgb8888_to_argb1555_line(void *dbuf, const void *sbuf, unsigned int pixels);
 void drm_fb_xrgb8888_to_argb1555(struct iosys_map *dst, const unsigned int *dst_pitch,
 				 const struct iosys_map *src, const struct drm_framebuffer *fb,
 				 const struct drm_rect *clip);
+void drm_fb_xrgb8888_to_rgba5551_line(void *dbuf, const void *sbuf, unsigned int pixels);
 void drm_fb_xrgb8888_to_rgba5551(struct iosys_map *dst, const unsigned int *dst_pitch,
 				 const struct iosys_map *src, const struct drm_framebuffer *fb,
 				 const struct drm_rect *clip);
+void drm_fb_xrgb8888_to_rgb888_line(void *dbuf, const void *sbuf, unsigned int pixels);
 void drm_fb_xrgb8888_to_rgb888(struct iosys_map *dst, const unsigned int *dst_pitch,
 			       const struct iosys_map *src, const struct drm_framebuffer *fb,
 			       const struct drm_rect *clip);
 void drm_fb_xrgb8888_to_argb8888(struct iosys_map *dst, const unsigned int *dst_pitch,
 				 const struct iosys_map *src, const struct drm_framebuffer *fb,
 				 const struct drm_rect *clip);
+void drm_fb_xrgb8888_to_xrgb2101010_line(void *dbuf, const void *sbuf, unsigned int pixels);
 void drm_fb_xrgb8888_to_xrgb2101010(struct iosys_map *dst, const unsigned int *dst_pitch,
 				    const struct iosys_map *src, const struct drm_framebuffer *fb,
 				    const struct drm_rect *clip);
+void drm_fb_xrgb8888_to_argb2101010_line(void *dbuf, const void *sbuf, unsigned int pixels);
 void drm_fb_xrgb8888_to_argb2101010(struct iosys_map *dst, const unsigned int *dst_pitch,
 				    const struct iosys_map *src, const struct drm_framebuffer *fb,
 				    const struct drm_rect *clip);
-- 
2.41.0

