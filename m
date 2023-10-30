Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DA77DB7EA
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 11:23:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67C1210E283;
	Mon, 30 Oct 2023 10:23:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46F9810E283
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 10:23:45 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:7082:5ab3:115b:c8d0])
 by michel.telenet-ops.be with bizsmtp
 id 4APi2B00P1qcjVs06APiVZ; Mon, 30 Oct 2023 11:23:42 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qxPQq-007p3F-T2;
 Mon, 30 Oct 2023 11:23:42 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qxPQs-006o5S-HH;
 Mon, 30 Oct 2023 11:23:42 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm v5 6/9] util: add test pattern support for big-endian
 XRGB1555/RGB565
Date: Mon, 30 Oct 2023 11:23:33 +0100
Message-Id: <b7425a64daeee0deb0d2e6a4318e939c982f5fec.1698661177.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698661177.git.geert@linux-m68k.org>
References: <cover.1698661177.git.geert@linux-m68k.org>
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
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for drawing the SMPTE and tiles test patterns in buffers
using big-endian formats.

For now this is limited to XRGB1555 and RGB565, which are the most
common big-endian formats.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
v5:
  - Add Reviewed-by,

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

