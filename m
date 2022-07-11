Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B85A56BEAF
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 20:22:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA21410EBED;
	Fri,  8 Jul 2022 18:22:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E9B410EBDA
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 18:21:47 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.186.194])
 by michel.telenet-ops.be with bizsmtp
 id siMn270024C55Sk06iMnl1; Fri, 08 Jul 2022 20:21:47 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o9sbq-002fMN-Lo; Fri, 08 Jul 2022 20:21:46 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o9sbq-00BtSQ-1f; Fri, 08 Jul 2022 20:21:46 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm v2 02/10] util: Factor out and optimize C8 SMPTE color
 LUT
Date: Fri,  8 Jul 2022 20:21:32 +0200
Message-Id: <befb24eba86ca0e8622c594330feee67f8421bcf.1657302034.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657302034.git.geert@linux-m68k.org>
References: <cover.1657302034.git.geert@linux-m68k.org>
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
v2:
  - Factor out smpte color LUT.
---
 tests/modetest/modetest.c |   2 +-
 tests/util/pattern.c      | 107 ++++++++++++++++++++++++++------------
 tests/util/pattern.h      |   2 +-
 3 files changed, 76 insertions(+), 35 deletions(-)

diff --git a/tests/modetest/modetest.c b/tests/modetest/modetest.c
index 9ceb5688f7683ffc..11a39ada80579293 100644
--- a/tests/modetest/modetest.c
+++ b/tests/modetest/modetest.c
@@ -1135,7 +1135,7 @@ static void set_gamma(struct device *dev, unsigned crtc_id, unsigned fourcc)
 
 	if (fourcc == DRM_FORMAT_C8) {
 		/* TODO: Add C8 support for more patterns */
-		util_smpte_c8_gamma(256, gamma_lut);
+		util_smpte_index_gamma(256, gamma_lut);
 		drmModeCreatePropertyBlob(dev->fd, gamma_lut, sizeof(gamma_lut), &blob_id);
 	} else {
 		for (i = 0; i < 256; i++) {
diff --git a/tests/util/pattern.c b/tests/util/pattern.c
index 3753ebc1eeae6c9a..5a648b468e524fbb 100644
--- a/tests/util/pattern.c
+++ b/tests/util/pattern.c
@@ -605,6 +605,69 @@ static void fill_smpte_rgb16fp(const struct util_rgb_info *rgb, void *mem,
 	}
 }
 
+enum smpte_colors {
+	SMPTE_COLOR_GREY,
+	SMPTE_COLOR_YELLOW,
+	SMPTE_COLOR_CYAN,
+	SMPTE_COLOR_GREEN,
+	SMPTE_COLOR_MAGENTA,
+	SMPTE_COLOR_RED,
+	SMPTE_COLOR_BLUE,
+	SMPTE_COLOR_BLACK,
+	SMPTE_COLOR_IN_PHASE,
+	SMPTE_COLOR_SUPER_WHITE,
+	SMPTE_COLOR_QUADRATURE,
+	SMPTE_COLOR_3PC5,
+	SMPTE_COLOR_11PC5,
+};
+
+static const struct drm_color_lut smpte_color_lut[] = {
+	[SMPTE_COLOR_GREY] =        { 192 * 0x101, 192 * 0x101, 192 * 0x101 },
+	[SMPTE_COLOR_YELLOW] =      { 192 * 0x101, 192 * 0x101, 0   * 0x101 },
+	[SMPTE_COLOR_CYAN] =        { 0   * 0x101, 192 * 0x101, 192 * 0x101 },
+	[SMPTE_COLOR_GREEN] =       { 0   * 0x101, 192 * 0x101, 0   * 0x101 },
+	[SMPTE_COLOR_MAGENTA] =     { 192 * 0x101, 0   * 0x101, 192 * 0x101 },
+	[SMPTE_COLOR_RED] =         { 192 * 0x101, 0   * 0x101, 0   * 0x101 },
+	[SMPTE_COLOR_BLUE] =        { 0   * 0x101, 0   * 0x101, 192 * 0x101 },
+	[SMPTE_COLOR_BLACK] =       { 19  * 0x101, 19  * 0x101, 19  * 0x101 },
+	[SMPTE_COLOR_IN_PHASE] =    { 0   * 0x101, 33  * 0x101, 76  * 0x101 },
+	[SMPTE_COLOR_SUPER_WHITE] = { 255 * 0x101, 255 * 0x101, 255 * 0x101 },
+	[SMPTE_COLOR_QUADRATURE] =  { 50  * 0x101, 0   * 0x101, 106 * 0x101 },
+	[SMPTE_COLOR_3PC5] =        { 9   * 0x101, 9   * 0x101, 9   * 0x101 },
+	[SMPTE_COLOR_11PC5] =       { 29  * 0x101, 29  * 0x101, 29  * 0x101 },
+};
+
+static unsigned int smpte_top[7] = {
+	SMPTE_COLOR_GREY,
+	SMPTE_COLOR_YELLOW,
+	SMPTE_COLOR_CYAN,
+	SMPTE_COLOR_GREEN,
+	SMPTE_COLOR_MAGENTA,
+	SMPTE_COLOR_RED,
+	SMPTE_COLOR_BLUE,
+};
+
+static unsigned int smpte_middle[7] = {
+	SMPTE_COLOR_BLUE,
+	SMPTE_COLOR_BLACK,
+	SMPTE_COLOR_MAGENTA,
+	SMPTE_COLOR_BLACK,
+	SMPTE_COLOR_CYAN,
+	SMPTE_COLOR_BLACK,
+	SMPTE_COLOR_GREY,
+};
+
+static unsigned int smpte_bottom[8] = {
+	SMPTE_COLOR_IN_PHASE,
+	SMPTE_COLOR_SUPER_WHITE,
+	SMPTE_COLOR_QUADRATURE,
+	SMPTE_COLOR_BLACK,
+	SMPTE_COLOR_3PC5,
+	SMPTE_COLOR_BLACK,
+	SMPTE_COLOR_11PC5,
+	SMPTE_COLOR_BLACK,
+};
+
 static void fill_smpte_c8(void *mem, unsigned int width, unsigned int height,
 			  unsigned int stride)
 {
@@ -613,34 +676,35 @@ static void fill_smpte_c8(void *mem, unsigned int width, unsigned int height,
 
 	for (y = 0; y < height * 6 / 9; ++y) {
 		for (x = 0; x < width; ++x)
-			((uint8_t *)mem)[x] = x * 7 / width;
+			((uint8_t *)mem)[x] = smpte_top[x * 7 / width];
 		mem += stride;
 	}
 
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
+	if (size < ARRAY_SIZE(smpte_color_lut)) {
+		printf("Error: gamma too small: %u < %zu\n", size,
+		       ARRAY_SIZE(smpte_color_lut));
 		return;
 	}
 	memset(lut, 0, size * sizeof(struct drm_color_lut));
@@ -650,30 +714,7 @@ void util_smpte_c8_gamma(unsigned size, struct drm_color_lut *lut)
 	lut[idx].green = (g) * 0x101; \
 	lut[idx].blue = (b) * 0x101
 
-	FILL_COLOR( 0, 192, 192, 192);	/* grey */
-	FILL_COLOR( 1, 192, 192, 0  );	/* yellow */
-	FILL_COLOR( 2, 0,   192, 192);	/* cyan */
-	FILL_COLOR( 3, 0,   192, 0  );	/* green */
-	FILL_COLOR( 4, 192, 0,   192);	/* magenta */
-	FILL_COLOR( 5, 192, 0,   0  );	/* red */
-	FILL_COLOR( 6, 0,   0,   192);	/* blue */
-
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
+	memcpy(lut, smpte_color_lut, sizeof(smpte_color_lut));
 
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

