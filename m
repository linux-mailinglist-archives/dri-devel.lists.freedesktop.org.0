Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A517D9D52
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 17:48:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FDE110E9EF;
	Fri, 27 Oct 2023 15:48:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D94C10E9EF
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 15:48:16 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:a11d:fe3:b715:706f])
 by michel.telenet-ops.be with bizsmtp
 id 33oE2B00G2Q454m063oEfW; Fri, 27 Oct 2023 17:48:14 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qwP4A-007cgk-Bv;
 Fri, 27 Oct 2023 17:48:14 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qwP4I-00HHn9-9w;
 Fri, 27 Oct 2023 17:48:14 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm v4 6/9] util: add test pattern support for big-endian
 XRGB1555/RGB565
Date: Fri, 27 Oct 2023 17:48:09 +0200
Message-Id: <d11d9beba3dff3fcbfa6eaf70e94e6028d721d6e.1698416179.git.geert@linux-m68k.org>
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

Add support for drawing the SMPTE and tiles test patterns in buffers
using big-endian formats.

For now this is limited to XRGB1555 and RGB565, which are the most
common big-endian formats.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
v4:
  - No changes,

v3:
  - Increase indentation after definition of cpu_to_be16(),

v2:
  - New.
---
 tests/util/pattern.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/tests/util/pattern.c b/tests/util/pattern.c
index 1927377d0027c6fd..ef589124f278e837 100644
--- a/tests/util/pattern.c
+++ b/tests/util/pattern.c
@@ -23,6 +23,7 @@
  * IN THE SOFTWARE.
  */
 
+#include <stdbool.h>
 #include <stdint.h>
 #include <stdio.h>
 #include <stdlib.h>
@@ -75,13 +76,17 @@ static inline uint32_t swap32(uint32_t x)
 }
 
 #ifdef HAVE_BIG_ENDIAN
+#define cpu_to_be16(x)			(x)
 #define cpu_to_le16(x)			swap16(x)
 #define cpu_to_le32(x)			swap32(x)
 #else
+#define cpu_to_be16(x)			swap16(x)
 #define cpu_to_le16(x)			(x)
 #define cpu_to_le32(x)			(x)
 #endif
 
+#define cpu_to_fb16(x)	(fb_be ? cpu_to_be16(x) : cpu_to_le16(x))
+
 /* This function takes 8-bit color values */
 static inline uint32_t shiftcolor8(const struct util_color_component *comp,
 				  uint32_t value)
@@ -382,7 +387,7 @@ static void fill_smpte_yuv_packed(const struct util_yuv_info *yuv, void *mem,
 
 static void fill_smpte_rgb16(const struct util_rgb_info *rgb, void *mem,
 			     unsigned int width, unsigned int height,
-			     unsigned int stride)
+			     unsigned int stride, bool fb_be)
 {
 	const uint16_t colors_top[] = {
 		MAKE_RGBA(rgb, 192, 192, 192, 255),	/* grey */
@@ -417,26 +422,26 @@ static void fill_smpte_rgb16(const struct util_rgb_info *rgb, void *mem,
 
 	for (y = 0; y < height * 6 / 9; ++y) {
 		for (x = 0; x < width; ++x)
-			((uint16_t *)mem)[x] = cpu_to_le16(colors_top[x * 7 / width]);
+			((uint16_t *)mem)[x] = cpu_to_fb16(colors_top[x * 7 / width]);
 		mem += stride;
 	}
 
 	for (; y < height * 7 / 9; ++y) {
 		for (x = 0; x < width; ++x)
-			((uint16_t *)mem)[x] = cpu_to_le16(colors_middle[x * 7 / width]);
+			((uint16_t *)mem)[x] = cpu_to_fb16(colors_middle[x * 7 / width]);
 		mem += stride;
 	}
 
 	for (; y < height; ++y) {
 		for (x = 0; x < width * 5 / 7; ++x)
 			((uint16_t *)mem)[x] =
-				cpu_to_le16(colors_bottom[x * 4 / (width * 5 / 7)]);
+				cpu_to_fb16(colors_bottom[x * 4 / (width * 5 / 7)]);
 		for (; x < width * 6 / 7; ++x)
 			((uint16_t *)mem)[x] =
-				cpu_to_le16(colors_bottom[(x - width * 5 / 7) * 3
+				cpu_to_fb16(colors_bottom[(x - width * 5 / 7) * 3
 							  / (width / 7) + 4]);
 		for (; x < width; ++x)
-			((uint16_t *)mem)[x] = cpu_to_le16(colors_bottom[7]);
+			((uint16_t *)mem)[x] = cpu_to_fb16(colors_bottom[7]);
 		mem += stride;
 	}
 }
@@ -1089,9 +1094,11 @@ static void fill_smpte(const struct util_format_info *info, void *planes[3],
 	case DRM_FORMAT_BGRA4444:
 	case DRM_FORMAT_BGRX4444:
 	case DRM_FORMAT_RGB565:
+	case DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN:
 	case DRM_FORMAT_BGR565:
 	case DRM_FORMAT_ARGB1555:
 	case DRM_FORMAT_XRGB1555:
+	case DRM_FORMAT_XRGB1555 | DRM_FORMAT_BIG_ENDIAN:
 	case DRM_FORMAT_ABGR1555:
 	case DRM_FORMAT_XBGR1555:
 	case DRM_FORMAT_RGBA5551:
@@ -1099,7 +1106,8 @@ static void fill_smpte(const struct util_format_info *info, void *planes[3],
 	case DRM_FORMAT_BGRA5551:
 	case DRM_FORMAT_BGRX5551:
 		return fill_smpte_rgb16(&info->rgb, planes[0],
-					width, height, stride);
+					width, height, stride,
+					info->format & DRM_FORMAT_BIG_ENDIAN);
 
 	case DRM_FORMAT_BGR888:
 	case DRM_FORMAT_RGB888:
@@ -1271,7 +1279,7 @@ static void fill_tiles_yuv_packed(const struct util_format_info *info,
 
 static void fill_tiles_rgb16(const struct util_format_info *info, void *mem,
 			     unsigned int width, unsigned int height,
-			     unsigned int stride)
+			     unsigned int stride, bool fb_be)
 {
 	const struct util_rgb_info *rgb = &info->rgb;
 	void *mem_base = mem;
@@ -1287,7 +1295,7 @@ static void fill_tiles_rgb16(const struct util_format_info *info, void *mem,
 					  (rgb32 >> 8) & 0xff, rgb32 & 0xff,
 					  255);
 
-			((uint16_t *)mem)[x] = cpu_to_le16(color);
+			((uint16_t *)mem)[x] = cpu_to_fb16(color);
 		}
 		mem += stride;
 	}
@@ -1411,9 +1419,11 @@ static void fill_tiles(const struct util_format_info *info, void *planes[3],
 	case DRM_FORMAT_BGRA4444:
 	case DRM_FORMAT_BGRX4444:
 	case DRM_FORMAT_RGB565:
+	case DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN:
 	case DRM_FORMAT_BGR565:
 	case DRM_FORMAT_ARGB1555:
 	case DRM_FORMAT_XRGB1555:
+	case DRM_FORMAT_XRGB1555 | DRM_FORMAT_BIG_ENDIAN:
 	case DRM_FORMAT_ABGR1555:
 	case DRM_FORMAT_XBGR1555:
 	case DRM_FORMAT_RGBA5551:
@@ -1421,7 +1431,8 @@ static void fill_tiles(const struct util_format_info *info, void *planes[3],
 	case DRM_FORMAT_BGRA5551:
 	case DRM_FORMAT_BGRX5551:
 		return fill_tiles_rgb16(info, planes[0],
-					width, height, stride);
+					width, height, stride,
+					info->format & DRM_FORMAT_BIG_ENDIAN);
 
 	case DRM_FORMAT_BGR888:
 	case DRM_FORMAT_RGB888:
-- 
2.34.1

