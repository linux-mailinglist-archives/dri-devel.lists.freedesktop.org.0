Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5724D08E7
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 21:53:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A58BC10E284;
	Mon,  7 Mar 2022 20:53:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C16D310E287
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 20:53:46 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6100:2d37:4115:c358])
 by laurent.telenet-ops.be with bizsmtp
 id 3Ytm270041Yj8bA01Ytm36; Mon, 07 Mar 2022 21:53:46 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nRKMU-0036UY-1h; Mon, 07 Mar 2022 21:53:46 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nRKMT-0034o8-Gx; Mon, 07 Mar 2022 21:53:45 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH RFC libdrm 2/2] util: Fix 32 bpp patterns on big-endian
Date: Mon,  7 Mar 2022 21:53:42 +0100
Message-Id: <1be5820fe86d6940aab8acd52a522d39a35995c3.1646684158.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1646684158.git.geert@linux-m68k.org>
References: <cover.1646684158.git.geert@linux-m68k.org>
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

Introduce a cpu_to_le32() helper to convert 32-bit values from
CPU-endian to little-endian, and use them in the various pattern fill
functions for 32-bit formats.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
Works now with Linux' drm_fb_xrgb8888_to_rgb332_line(), which uses
le32_to_cpu() to read pixel values from memory.

---
 tests/util/pattern.c | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/tests/util/pattern.c b/tests/util/pattern.c
index 42d75d700700dc3d..48677ea6d25b2676 100644
--- a/tests/util/pattern.c
+++ b/tests/util/pattern.c
@@ -61,6 +61,18 @@ struct color_yuv {
 	  .u = MAKE_YUV_601_U(r, g, b), \
 	  .v = MAKE_YUV_601_V(r, g, b) }
 
+#if defined(__BIG_ENDIAN__) || defined(__sparc__) || defined(__mc68000__) || defined(__MIPSEB__)
+static inline uint32_t cpu_to_le32(uint32_t x)
+{
+	return ((x & 0x000000ffU) << 24) |
+	       ((x & 0x0000ff00U) <<  8) |
+	       ((x & 0x00ff0000U) >>  8) |
+	       ((x & 0xff000000U) >> 24);
+}
+#else
+#define cpu_to_le32(x)	(x)
+#endif
+
 /* This function takes 8-bit color values */
 static inline uint32_t shiftcolor8(const struct util_color_component *comp,
 				  uint32_t value)
@@ -520,26 +532,26 @@ static void fill_smpte_rgb32(const struct util_rgb_info *rgb, void *mem,
 
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
@@ -1017,7 +1029,7 @@ static void fill_tiles_rgb32(const struct util_format_info *info, void *mem,
 					  (rgb32 >> 8) & 0xff, rgb32 & 0xff,
 					  alpha);
 
-			((uint32_t *)mem)[x] = color;
+			((uint32_t *)mem)[x] = cpu_to_le32(color);
 		}
 		mem += stride;
 	}
@@ -1164,7 +1176,7 @@ static void fill_gradient_rgb32(const struct util_rgb_info *rgb,
 
 		for (j = 0; j < width / 2; j++) {
 			uint32_t value = MAKE_RGBA10(rgb, j & 0x3ff, j & 0x3ff, j & 0x3ff, 0);
-			row[2*j] = row[2*j+1] = value;
+			row[2*j] = row[2*j+1] = cpu_to_le32(value);
 		}
 		mem += stride;
 	}
@@ -1174,7 +1186,7 @@ static void fill_gradient_rgb32(const struct util_rgb_info *rgb,
 
 		for (j = 0; j < width / 2; j++) {
 			uint32_t value = MAKE_RGBA10(rgb, j & 0x3fc, j & 0x3fc, j & 0x3fc, 0);
-			row[2*j] = row[2*j+1] = value;
+			row[2*j] = row[2*j+1] = cpu_to_le32(value);
 		}
 		mem += stride;
 	}
-- 
2.25.1

