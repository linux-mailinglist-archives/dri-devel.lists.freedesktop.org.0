Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C79C056BEAD
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 20:22:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38FA410EBE4;
	Fri,  8 Jul 2022 18:21:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 827BA10EBDF
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 18:21:53 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.186.194])
 by laurent.telenet-ops.be with bizsmtp
 id siMt270054C55Sk01iMtsQ; Fri, 08 Jul 2022 20:21:53 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o9sbw-002fNf-Qx; Fri, 08 Jul 2022 20:21:52 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o9sbw-00BtV7-3W; Fri, 08 Jul 2022 20:21:52 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm v2 03/10] util: Fix 16 bpp patterns on big-endian
Date: Fri,  8 Jul 2022 20:21:42 +0200
Message-Id: <b7db980db9a9ad9e3d4380c2d68478fac8b05a2f.1657302103.git.geert@linux-m68k.org>
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

DRM formats are defined to be little-endian, unless the
DRM_FORMAT_BIG_ENDIAN flag is set.  Hence writes of multi-byte pixel
values need to take endianness into account.

Introduce a swap16() helper to byteswap 16-bit values, and a
cpu_to_le16() helper to convert 16-bit values from CPU-endian to
little-endian, and use the latter in the various pattern fill functions
for 16-bit formats.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
Works now with both Linux' drm_fb_swab() and my own
drm_fb_rgb565_to_rgb332_line() (the latter uses le16_to_cpu() to read
pixel values from memory).

v2:
  - New.
---
 tests/util/pattern.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/tests/util/pattern.c b/tests/util/pattern.c
index 26e0614bd4faa620..c0bd382fbced90fb 100644
--- a/tests/util/pattern.c
+++ b/tests/util/pattern.c
@@ -61,6 +61,11 @@ struct color_yuv {
 	  .u = MAKE_YUV_601_U(r, g, b), \
 	  .v = MAKE_YUV_601_V(r, g, b) }
 
+static inline uint16_t swap16(uint16_t x)
+{
+	return ((x & 0x00ffU) << 8) | ((x & 0xff00U) >> 8);
+}
+
 static inline uint32_t swap32(uint32_t x)
 {
 	return ((x & 0x000000ffU) << 24) |
@@ -70,8 +75,10 @@ static inline uint32_t swap32(uint32_t x)
 }
 
 #if defined(__BIG_ENDIAN__) || defined(__ARM_BIG_ENDIAN) || defined(__mc68000__) || defined(__MIPSEB__) || defined(__s390__) || defined(__sparc__)
+#define cpu_to_le16(x)	swap16(x)
 #define cpu_to_le32(x)	swap32(x)
 #else
+#define cpu_to_le16(x)	(x)
 #define cpu_to_le32(x)	(x)
 #endif
 
@@ -410,26 +417,26 @@ static void fill_smpte_rgb16(const struct util_rgb_info *rgb, void *mem,
 
 	for (y = 0; y < height * 6 / 9; ++y) {
 		for (x = 0; x < width; ++x)
-			((uint16_t *)mem)[x] = colors_top[x * 7 / width];
+			((uint16_t *)mem)[x] = cpu_to_le16(colors_top[x * 7 / width]);
 		mem += stride;
 	}
 
 	for (; y < height * 7 / 9; ++y) {
 		for (x = 0; x < width; ++x)
-			((uint16_t *)mem)[x] = colors_middle[x * 7 / width];
+			((uint16_t *)mem)[x] = cpu_to_le16(colors_middle[x * 7 / width]);
 		mem += stride;
 	}
 
 	for (; y < height; ++y) {
 		for (x = 0; x < width * 5 / 7; ++x)
 			((uint16_t *)mem)[x] =
-				colors_bottom[x * 4 / (width * 5 / 7)];
+				cpu_to_le16(colors_bottom[x * 4 / (width * 5 / 7)]);
 		for (; x < width * 6 / 7; ++x)
 			((uint16_t *)mem)[x] =
-				colors_bottom[(x - width * 5 / 7) * 3
-					      / (width / 7) + 4];
+				cpu_to_le16(colors_bottom[(x - width * 5 / 7) * 3
+							  / (width / 7) + 4]);
 		for (; x < width; ++x)
-			((uint16_t *)mem)[x] = colors_bottom[7];
+			((uint16_t *)mem)[x] = cpu_to_le16(colors_bottom[7]);
 		mem += stride;
 	}
 }
@@ -1272,7 +1279,7 @@ static void fill_tiles_rgb16(const struct util_format_info *info, void *mem,
 					  (rgb32 >> 8) & 0xff, rgb32 & 0xff,
 					  255);
 
-			((uint16_t *)mem)[x] = color;
+			((uint16_t *)mem)[x] = cpu_to_le16(color);
 		}
 		mem += stride;
 	}
-- 
2.25.1

