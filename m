Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9456756BEB4
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 20:22:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63B6810EC23;
	Fri,  8 Jul 2022 18:22:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B454B10EBE5
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 18:21:53 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.186.194])
 by laurent.telenet-ops.be with bizsmtp
 id siMt270094C55Sk01iMtsT; Fri, 08 Jul 2022 20:21:53 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o9sbw-002fNe-Sq; Fri, 08 Jul 2022 20:21:52 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o9sbw-00BtV0-2V; Fri, 08 Jul 2022 20:21:52 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm v2 02/10] util: Fix 32 bpp patterns on big-endian
Date: Fri,  8 Jul 2022 20:21:41 +0200
Message-Id: <03051645f43b463e73c4426b95f8a70008f89793.1657302103.git.geert@linux-m68k.org>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DRM formats are defined to be little-endian, unless the
DRM_FORMAT_BIG_ENDIAN flag is set.  Hence writes of multi-byte pixel
values need to take endianness into account.

Introduce a swap32() helper to byteswap 32-bit values, and a
cpu_to_le32() helper to convert 32-bit values from CPU-endian to
little-endian, and use the latter in the various pattern fill functions
for 32-bit formats.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
---
Works now with Linux' drm_fb_xrgb8888_to_rgb332_line(), which uses
le32_to_cpu() to read pixel values from memory.

v2:
  - Add Acked-by,
  - Add swap32() intermediate helper,
  - Add __ARM_BIG_ENDIAN and __s390__.
---
 tests/util/pattern.c | 32 +++++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/tests/util/pattern.c b/tests/util/pattern.c
index 631114563fa011c2..26e0614bd4faa620 100644
--- a/tests/util/pattern.c
+++ b/tests/util/pattern.c
@@ -61,6 +61,20 @@ struct color_yuv {
 	  .u = MAKE_YUV_601_U(r, g, b), \
 	  .v = MAKE_YUV_601_V(r, g, b) }
 
+static inline uint32_t swap32(uint32_t x)
+{
+	return ((x & 0x000000ffU) << 24) |
+	       ((x & 0x0000ff00U) <<  8) |
+	       ((x & 0x00ff0000U) >>  8) |
+	       ((x & 0xff000000U) >> 24);
+}
+
+#if defined(__BIG_ENDIAN__) || defined(__ARM_BIG_ENDIAN) || defined(__mc68000__) || defined(__MIPSEB__) || defined(__s390__) || defined(__sparc__)
+#define cpu_to_le32(x)	swap32(x)
+#else
+#define cpu_to_le32(x)	(x)
+#endif
+
 /* This function takes 8-bit color values */
 static inline uint32_t shiftcolor8(const struct util_color_component *comp,
 				  uint32_t value)
@@ -520,26 +534,26 @@ static void fill_smpte_rgb32(const struct util_rgb_info *rgb, void *mem,
 
 	for (y = 0; y < height * 6 / 9; ++y) {
 		for (x = 0; x < width; ++x)
-			((uint32_t *)mem)[x] = colors_top[x * 7 / width];
+			((uint32_t *)mem)[x] = cpu_to_le32(colors_top[x * 7 / width]);
 		mem += stride;
 	}
 
 	for (; y < height * 7 / 9; ++y) {
 		for (x = 0; x < width; ++x)
-			((uint32_t *)mem)[x] = colors_middle[x * 7 / width];
+			((uint32_t *)mem)[x] = cpu_to_le32(colors_middle[x * 7 / width]);
 		mem += stride;
 	}
 
 	for (; y < height; ++y) {
 		for (x = 0; x < width * 5 / 7; ++x)
 			((uint32_t *)mem)[x] =
-				colors_bottom[x * 4 / (width * 5 / 7)];
+				cpu_to_le32(colors_bottom[x * 4 / (width * 5 / 7)]);
 		for (; x < width * 6 / 7; ++x)
 			((uint32_t *)mem)[x] =
-				colors_bottom[(x - width * 5 / 7) * 3
-					      / (width / 7) + 4];
+				cpu_to_le32(colors_bottom[(x - width * 5 / 7) * 3
+							  / (width / 7) + 4]);
 		for (; x < width; ++x)
-			((uint32_t *)mem)[x] = colors_bottom[7];
+			((uint32_t *)mem)[x] = cpu_to_le32(colors_bottom[7]);
 		mem += stride;
 	}
 }
@@ -1307,7 +1321,7 @@ static void fill_tiles_rgb32(const struct util_format_info *info, void *mem,
 					  (rgb32 >> 8) & 0xff, rgb32 & 0xff,
 					  alpha);
 
-			((uint32_t *)mem)[x] = color;
+			((uint32_t *)mem)[x] = cpu_to_le32(color);
 		}
 		mem += stride;
 	}
@@ -1454,7 +1468,7 @@ static void fill_gradient_rgb32(const struct util_rgb_info *rgb,
 
 		for (j = 0; j < width / 2; j++) {
 			uint32_t value = MAKE_RGBA10(rgb, j & 0x3ff, j & 0x3ff, j & 0x3ff, 0);
-			row[2*j] = row[2*j+1] = value;
+			row[2*j] = row[2*j+1] = cpu_to_le32(value);
 		}
 		mem += stride;
 	}
@@ -1464,7 +1478,7 @@ static void fill_gradient_rgb32(const struct util_rgb_info *rgb,
 
 		for (j = 0; j < width / 2; j++) {
 			uint32_t value = MAKE_RGBA10(rgb, j & 0x3fc, j & 0x3fc, j & 0x3fc, 0);
-			row[2*j] = row[2*j+1] = value;
+			row[2*j] = row[2*j+1] = cpu_to_le32(value);
 		}
 		mem += stride;
 	}
-- 
2.25.1

