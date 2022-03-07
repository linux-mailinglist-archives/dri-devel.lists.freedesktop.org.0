Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E4A4D08D9
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 21:53:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC74A10E237;
	Mon,  7 Mar 2022 20:53:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C5F10E240
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 20:53:32 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6100:2d37:4115:c358])
 by laurent.telenet-ops.be with bizsmtp
 id 3YtX270031Yj8bA01YtX0a; Mon, 07 Mar 2022 21:53:31 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nRKM9-0036SR-LU; Mon, 07 Mar 2022 21:53:25 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nRKM8-0034mI-KM; Mon, 07 Mar 2022 21:53:24 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm 1/3] util: Optimize C8 SMPTE color LUT
Date: Mon,  7 Mar 2022 21:53:16 +0100
Message-Id: <cb7d400c8fcdc5b78f549ca58be3c8fd9d5bf9af.1646683737.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1646683737.git.geert@linux-m68k.org>
References: <cover.1646683737.git.geert@linux-m68k.org>
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

The color LUT for the SMPTE pattern in indexed mode contains 22 entries,
although only 13 are non-unique.

Reduce the size of the color LUT by dropping duplicate entries, so it
can be reused for formats supporting e.g. 16 colors.  Rename
util_smpte_c8_gamma() to util_smpte_index_gamma() accordingly.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 tests/modetest/modetest.c |  2 +-
 tests/util/pattern.c      | 51 +++++++++++++++++++++------------------
 tests/util/pattern.h      |  2 +-
 3 files changed, 29 insertions(+), 26 deletions(-)

diff --git a/tests/modetest/modetest.c b/tests/modetest/modetest.c
index 5fd22f79d71332cc..e369044fb7a484c1 100644
--- a/tests/modetest/modetest.c
+++ b/tests/modetest/modetest.c
@@ -1124,7 +1124,7 @@ static void set_gamma(struct device *dev, unsigned crtc_id, unsigned fourcc)
 
 	if (fourcc == DRM_FORMAT_C8) {
 		/* TODO: Add C8 support for more patterns */
-		util_smpte_c8_gamma(256, gamma_lut);
+		util_smpte_index_gamma(256, gamma_lut);
 		drmModeCreatePropertyBlob(dev->fd, gamma_lut, sizeof(gamma_lut), &blob_id);
 	} else {
 		for (i = 0; i < 256; i++) {
diff --git a/tests/util/pattern.c b/tests/util/pattern.c
index 158c0b160a2ee870..953bf95492ee150c 100644
--- a/tests/util/pattern.c
+++ b/tests/util/pattern.c
@@ -605,6 +605,9 @@ static void fill_smpte_rgb16fp(const struct util_rgb_info *rgb, void *mem,
 	}
 }
 
+static unsigned int smpte_middle[7] = { 6, 7, 4, 7, 2, 7, 0 };
+static unsigned int smpte_bottom[8] = { 8, 9, 10, 7, 11, 7, 12, 7 };
+
 static void fill_smpte_c8(void *mem, unsigned int width, unsigned int height,
 			  unsigned int stride)
 {
@@ -619,28 +622,28 @@ static void fill_smpte_c8(void *mem, unsigned int width, unsigned int height,
 
 	for (; y < height * 7 / 9; ++y) {
 		for (x = 0; x < width; ++x)
-			((uint8_t *)mem)[x] = 7 + (x * 7 / width);
+			((uint8_t *)mem)[x] = smpte_middle[x * 7 / width];
 		mem += stride;
 	}
 
 	for (; y < height; ++y) {
 		for (x = 0; x < width * 5 / 7; ++x)
 			((uint8_t *)mem)[x] =
-				14 + (x * 4 / (width * 5 / 7));
+				smpte_bottom[x * 4 / (width * 5 / 7)];
 		for (; x < width * 6 / 7; ++x)
 			((uint8_t *)mem)[x] =
-				14 + ((x - width * 5 / 7) * 3
-					      / (width / 7) + 4);
+				smpte_bottom[(x - width * 5 / 7) * 3
+					     / (width / 7) + 4];
 		for (; x < width; ++x)
-			((uint8_t *)mem)[x] = 14 + 7;
+			((uint8_t *)mem)[x] = smpte_bottom[7];
 		mem += stride;
 	}
 }
 
-void util_smpte_c8_gamma(unsigned size, struct drm_color_lut *lut)
+void util_smpte_index_gamma(unsigned size, struct drm_color_lut *lut)
 {
-	if (size < 7 + 7 + 8) {
-		printf("Error: gamma too small: %d < %d\n", size, 7 + 7 + 8);
+	if (size < 13) {
+		printf("Error: gamma too small: %d < %d\n", size, 13);
 		return;
 	}
 	memset(lut, 0, size * sizeof(struct drm_color_lut));
@@ -658,22 +661,22 @@ void util_smpte_c8_gamma(unsigned size, struct drm_color_lut *lut)
 	FILL_COLOR( 5, 192, 0,   0  );	/* red */
 	FILL_COLOR( 6, 0,   0,   192);	/* blue */
 
-	FILL_COLOR( 7, 0,   0,   192);	/* blue */
-	FILL_COLOR( 8, 19,  19,  19 );	/* black */
-	FILL_COLOR( 9, 192, 0,   192);	/* magenta */
-	FILL_COLOR(10, 19,  19,  19 );	/* black */
-	FILL_COLOR(11, 0,   192, 192);	/* cyan */
-	FILL_COLOR(12, 19,  19,  19 );	/* black */
-	FILL_COLOR(13, 192, 192, 192);	/* grey */
-
-	FILL_COLOR(14, 0,   33,  76);	/* in-phase */
-	FILL_COLOR(15, 255, 255, 255);	/* super white */
-	FILL_COLOR(16, 50,  0,   106);	/* quadrature */
-	FILL_COLOR(17, 19,  19,  19);	/* black */
-	FILL_COLOR(18, 9,   9,   9);	/* 3.5% */
-	FILL_COLOR(19, 19,  19,  19);	/* 7.5% */
-	FILL_COLOR(20, 29,  29,  29);	/* 11.5% */
-	FILL_COLOR(21, 19,  19,  19);	/* black */
+	/* duplicate of 6 */		/* blue */
+	FILL_COLOR( 7, 19,  19,  19 );	/* black */
+	/* duplicate of 4 */		/* magenta */
+	/* duplicate of 7 */		/* black */
+	/* duplicate of 2 */		/* cyan */
+	/* duplicate of 7 */		/* black */
+	/* duplicate of 0 */		/* grey */
+
+	FILL_COLOR( 8, 0,   33,  76);	/* in-phase */
+	FILL_COLOR( 9, 255, 255, 255);	/* super white */
+	FILL_COLOR(10, 50,  0,   106);	/* quadrature */
+	/* duplicate of 7 */		/* black */
+	FILL_COLOR(11, 9,   9,   9);	/* 3.5% */
+	/* duplicate of 7 */		/* 7.5% */
+	FILL_COLOR(12, 29,  29,  29);	/* 11.5% */
+	/* duplicate of 7 */		/* black */
 
 #undef FILL_COLOR
 }
diff --git a/tests/util/pattern.h b/tests/util/pattern.h
index ea38cafdcf27d811..d178bca69b227751 100644
--- a/tests/util/pattern.h
+++ b/tests/util/pattern.h
@@ -39,7 +39,7 @@ void util_fill_pattern(uint32_t format, enum util_fill_pattern pattern,
 		       void *planes[3], unsigned int width,
 		       unsigned int height, unsigned int stride);
 
-void util_smpte_c8_gamma(unsigned size, struct drm_color_lut *lut);
+void util_smpte_index_gamma(unsigned size, struct drm_color_lut *lut);
 
 enum util_fill_pattern util_pattern_enum(const char *name);
 
-- 
2.25.1

