Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7771C7D9D54
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 17:48:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CF6410E9F5;
	Fri, 27 Oct 2023 15:48:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0214D10E9F1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 15:48:16 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:a11d:fe3:b715:706f])
 by baptiste.telenet-ops.be with bizsmtp
 id 33oE2B00B2Q454m013oEl2; Fri, 27 Oct 2023 17:48:14 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qwP4A-007cgn-Cm;
 Fri, 27 Oct 2023 17:48:14 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qwP4I-00HHnF-BP;
 Fri, 27 Oct 2023 17:48:14 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm v4 7/9] util: fix pwetty on big-endian
Date: Fri, 27 Oct 2023 17:48:10 +0200
Message-Id: <b9d9a342a0f3d33fae392ff698c2bb731eeadd88.1698416179.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698416179.git.geert@linux-m68k.org>
References: <cover.1698416179.git.geert@linux-m68k.org>
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cairo always uses native byte order for rendering.

Hence if the byte order of the frame buffer differs from the byte order
of the CPU, the frame buffer contents need to be byteswapped twice: once
before rendering, to convert to native byte order, and a second time
after rendering, to restore the frame buffer format's byte order.

Note that byte swapping is not done for ARGB32 formats, as for these
formats, byte order only affects the order of the red, green, and blue
channels, which we do not care about here.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
v4:
  - No changes,

v3:
  - Wrap byteswap_buffer{16,32}() implementation inside #if HAVE_CAIRO
    to avoid defined-but-not-used compiler warnings,

v2:
  - RGB30 is untested.
---
 tests/util/pattern.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/tests/util/pattern.c b/tests/util/pattern.c
index ef589124f278e837..769da5814d1f689e 100644
--- a/tests/util/pattern.c
+++ b/tests/util/pattern.c
@@ -79,10 +79,12 @@ static inline uint32_t swap32(uint32_t x)
 #define cpu_to_be16(x)			(x)
 #define cpu_to_le16(x)			swap16(x)
 #define cpu_to_le32(x)			swap32(x)
+#define fb_foreign_endian(format)	(!((format) & DRM_FORMAT_BIG_ENDIAN))
 #else
 #define cpu_to_be16(x)			swap16(x)
 #define cpu_to_le16(x)			(x)
 #define cpu_to_le32(x)			(x)
+#define fb_foreign_endian(format)	((format) & DRM_FORMAT_BIG_ENDIAN)
 #endif
 
 #define cpu_to_fb16(x)	(fb_be ? cpu_to_be16(x) : cpu_to_le16(x))
@@ -1141,6 +1143,32 @@ static void fill_smpte(const struct util_format_info *info, void *planes[3],
 	}
 }
 
+#if HAVE_CAIRO
+static void byteswap_buffer16(void *mem, unsigned int width, unsigned int height,
+			      unsigned int stride)
+{
+	unsigned int x, y;
+
+	for (y = 0; y < height; ++y) {
+		for (x = 0; x < width; ++x)
+			((uint16_t *)mem)[x] = swap16(((uint16_t *)mem)[x]);
+		mem += stride;
+	}
+}
+
+static void byteswap_buffer32(void *mem, unsigned int width, unsigned int height,
+			      unsigned int stride)
+{
+	unsigned int x, y;
+
+	for (y = 0; y < height; ++y) {
+		for (x = 0; x < width; ++x)
+			((uint32_t *)mem)[x] = swap32(((uint32_t *)mem)[x]);
+		mem += stride;
+	}
+}
+#endif
+
 static void make_pwetty(void *data, unsigned int width, unsigned int height,
 			unsigned int stride, uint32_t format)
 {
@@ -1148,6 +1176,8 @@ static void make_pwetty(void *data, unsigned int width, unsigned int height,
 	cairo_surface_t *surface;
 	cairo_t *cr;
 	cairo_format_t cairo_format;
+	bool swap16 = false;
+	bool swap32 = false;
 
 	/* we can ignore the order of R,G,B channels */
 	switch (format) {
@@ -1160,6 +1190,7 @@ static void make_pwetty(void *data, unsigned int width, unsigned int height,
 	case DRM_FORMAT_RGB565:
 	case DRM_FORMAT_BGR565:
 		cairo_format = CAIRO_FORMAT_RGB16_565;
+		swap16 = fb_foreign_endian(format);
 		break;
 #if CAIRO_VERSION_MAJOR > 1 || (CAIRO_VERSION_MAJOR == 1 && CAIRO_VERSION_MINOR >= 12)
 	case DRM_FORMAT_ARGB2101010:
@@ -1167,12 +1198,19 @@ static void make_pwetty(void *data, unsigned int width, unsigned int height,
 	case DRM_FORMAT_ABGR2101010:
 	case DRM_FORMAT_XBGR2101010:
 		cairo_format = CAIRO_FORMAT_RGB30;
+		swap32 = fb_foreign_endian(format);
 		break;
 #endif
 	default:
 		return;
 	}
 
+	/* Cairo uses native byte order, so we may have to byteswap before... */
+	if (swap16)
+		byteswap_buffer16(data, width, height, stride);
+	if (swap32)
+		byteswap_buffer32(data, width, height, stride);
+
 	surface = cairo_image_surface_create_for_data(data,
 						      cairo_format,
 						      width, height,
@@ -1208,6 +1246,12 @@ static void make_pwetty(void *data, unsigned int width, unsigned int height,
 		}
 
 	cairo_destroy(cr);
+
+	/* ... and after */
+	if (swap16)
+		byteswap_buffer16(data, width, height, stride);
+	if (swap32)
+		byteswap_buffer32(data, width, height, stride);
 #endif
 }
 
-- 
2.34.1

