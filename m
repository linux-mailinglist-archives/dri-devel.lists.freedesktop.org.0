Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4283756BEB5
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 20:22:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE4010EC07;
	Fri,  8 Jul 2022 18:22:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E414C10EBD9
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 18:21:53 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.186.194])
 by michel.telenet-ops.be with bizsmtp
 id siMt2700J4C55Sk06iMtm6; Fri, 08 Jul 2022 20:21:53 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o9sbx-002fNk-2D; Fri, 08 Jul 2022 20:21:53 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o9sbw-00BtVg-7b; Fri, 08 Jul 2022 20:21:52 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm v2 08/10] util: Fix pwetty on big-endian
Date: Fri,  8 Jul 2022 20:21:47 +0200
Message-Id: <e8597038478f12e9eda5e86b309b52988f69f2eb.1657302103.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657302103.git.geert@linux-m68k.org>
References: <cover.1657302103.git.geert@linux-m68k.org>
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
This is ugly, but I see no better solution.

v2:
  - RGB30 is untested.
---
 tests/util/pattern.c | 54 +++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 48 insertions(+), 6 deletions(-)

diff --git a/tests/util/pattern.c b/tests/util/pattern.c
index e693892bb3cf93c1..627f402be1d02e1c 100644
--- a/tests/util/pattern.c
+++ b/tests/util/pattern.c
@@ -76,13 +76,15 @@ static inline uint32_t swap32(uint32_t x)
 }
 
 #if defined(__BIG_ENDIAN__) || defined(__ARM_BIG_ENDIAN) || defined(__mc68000__) || defined(__MIPSEB__) || defined(__s390__) || defined(__sparc__)
-#define cpu_to_be16(x)	(x)
-#define cpu_to_le16(x)	swap16(x)
-#define cpu_to_le32(x)	swap32(x)
+#define cpu_to_be16(x)			(x)
+#define cpu_to_le16(x)			swap16(x)
+#define cpu_to_le32(x)			swap32(x)
+#define fb_foreign_endian(format)	(!((format) & DRM_FORMAT_BIG_ENDIAN))
 #else
-#define cpu_to_be16(x)	swap16(x)
-#define cpu_to_le16(x)	(x)
-#define cpu_to_le32(x)	(x)
+#define cpu_to_be16(x)			swap16(x)
+#define cpu_to_le16(x)			(x)
+#define cpu_to_le32(x)			(x)
+#define fb_foreign_endian(format)	((format) & DRM_FORMAT_BIG_ENDIAN)
 #endif
 
 #define cpu_to_fb16(x)	(fb_be ? cpu_to_be16(x) : cpu_to_le16(x))
@@ -1133,6 +1135,30 @@ static void fill_smpte(const struct util_format_info *info, void *planes[3],
 #define GREEN 1
 #define BLUE  0
 
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
+
 static void make_pwetty(void *data, unsigned int width, unsigned int height,
 			unsigned int stride, uint32_t format)
 {
@@ -1140,6 +1166,8 @@ static void make_pwetty(void *data, unsigned int width, unsigned int height,
 	cairo_surface_t *surface;
 	cairo_t *cr;
 	cairo_format_t cairo_format;
+	bool swap16 = false;
+	bool swap32 = false;
 
 	/* we can ignore the order of R,G,B channels */
 	switch (format) {
@@ -1152,6 +1180,7 @@ static void make_pwetty(void *data, unsigned int width, unsigned int height,
 	case DRM_FORMAT_RGB565:
 	case DRM_FORMAT_BGR565:
 		cairo_format = CAIRO_FORMAT_RGB16_565;
+		swap16 = fb_foreign_endian(format);
 		break;
 #if CAIRO_VERSION_MAJOR > 1 || (CAIRO_VERSION_MAJOR == 1 && CAIRO_VERSION_MINOR >= 12)
 	case DRM_FORMAT_ARGB2101010:
@@ -1159,12 +1188,19 @@ static void make_pwetty(void *data, unsigned int width, unsigned int height,
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
@@ -1200,6 +1236,12 @@ static void make_pwetty(void *data, unsigned int width, unsigned int height,
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
2.25.1

