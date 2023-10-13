Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4CE7C8804
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 16:43:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6718410E192;
	Fri, 13 Oct 2023 14:43:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55CDD10E184
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 14:43:24 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:f151:5551:1af6:b316])
 by albert.telenet-ops.be with bizsmtp
 id xSjN2A00N56FAx306SjN9s; Fri, 13 Oct 2023 16:43:22 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qrJNi-006Gwg-Dl;
 Fri, 13 Oct 2023 16:43:17 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qrJNl-002VpG-Rh;
 Fri, 13 Oct 2023 16:43:17 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm v4 2/9] util: factor out and optimize C8 SMPTE color LUT
Date: Fri, 13 Oct 2023 16:43:04 +0200
Message-Id: <94ea20a1864a6d122eda27066d774e6d353db1e9.1697207862.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697207862.git.geert@linux-m68k.org>
References: <cover.1697207862.git.geert@linux-m68k.org>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The color LUT for the SMPTE pattern in indexed mode contains 22 entries,
although only 13 are non-unique.

Reduce the size of the color LUT by dropping duplicate entries, so it
can be reused for formats supporting e.g. 16 colors.  Rename the
function util_smpte_c8_gamma() to util_smpte_fill_lut(), and its first
parameter size to ncolors, to match their actual use.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
v4:
  - Rename util_smpte_index_gamma() to util_smpte_fill_lut(), and its
    first parameter from size to ncolors,
  - Move smpte_color_lut[] down,
  - Kill FILL_COLOR() macro,
  - Add and use EXPAND_COLOR() macro,

v3:
  - Add Acked-by,

v2:
  - Factor out smpte color LUT.
---
 tests/modetest/modetest.c |   2 +-
 tests/util/pattern.c      | 122 +++++++++++++++++++++++++-------------
 tests/util/pattern.h      |   2 +-
 3 files changed, 82 insertions(+), 44 deletions(-)

diff --git a/tests/modetest/modetest.c b/tests/modetest/modetest.c
index 861a06ebb27bd170..9504fbd8af59ff21 100644
--- a/tests/modetest/modetest.c
+++ b/tests/modetest/modetest.c
@@ -1155,7 +1155,7 @@ static void set_gamma(struct device *dev, unsigned crtc_id, unsigned fourcc)
 
 	if (fourcc == DRM_FORMAT_C8) {
 		/* TODO: Add C8 support for more patterns */
-		util_smpte_c8_gamma(256, gamma_lut);
+		util_smpte_fill_lut(256, gamma_lut);
 		drmModeCreatePropertyBlob(dev->fd, gamma_lut, sizeof(gamma_lut), &blob_id);
 	} else {
 		/*
diff --git a/tests/util/pattern.c b/tests/util/pattern.c
index 7d4f6610015e7464..fc457c4ac61e404a 100644
--- a/tests/util/pattern.c
+++ b/tests/util/pattern.c
@@ -605,6 +605,73 @@ static void fill_smpte_rgb16fp(const struct util_rgb_info *rgb, void *mem,
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
+#define EXPAND_COLOR(r, g, b)	{ (r) * 0x101, (g) * 0x101, (b) * 0x101 }
+
+static const struct drm_color_lut smpte_color_lut[] = {
+	[SMPTE_COLOR_GREY] =        EXPAND_COLOR(192, 192, 192),
+	[SMPTE_COLOR_YELLOW] =      EXPAND_COLOR(192, 192,   0),
+	[SMPTE_COLOR_CYAN] =        EXPAND_COLOR(  0, 192, 192),
+	[SMPTE_COLOR_GREEN] =       EXPAND_COLOR(  0, 192,   0),
+	[SMPTE_COLOR_MAGENTA] =     EXPAND_COLOR(192,   0, 192),
+	[SMPTE_COLOR_RED] =         EXPAND_COLOR(192,   0,   0),
+	[SMPTE_COLOR_BLUE] =        EXPAND_COLOR(  0,   0, 192),
+	[SMPTE_COLOR_BLACK] =       EXPAND_COLOR( 19,  19,  19),
+	[SMPTE_COLOR_IN_PHASE] =    EXPAND_COLOR(  0,  33,  76),
+	[SMPTE_COLOR_SUPER_WHITE] = EXPAND_COLOR(255, 255, 255),
+	[SMPTE_COLOR_QUADRATURE] =  EXPAND_COLOR( 50,   0, 106),
+	[SMPTE_COLOR_3PC5] =        EXPAND_COLOR(  9,   9,   9),
+	[SMPTE_COLOR_11PC5] =       EXPAND_COLOR( 29,  29,  29),
+};
+
+#undef EXPAND_COLOR
+
 static void fill_smpte_c8(void *mem, unsigned int width, unsigned int height,
 			  unsigned int stride)
 {
@@ -613,69 +680,40 @@ static void fill_smpte_c8(void *mem, unsigned int width, unsigned int height,
 
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
+void util_smpte_fill_lut(unsigned int ncolors, struct drm_color_lut *lut)
 {
-	if (size < 7 + 7 + 8) {
-		printf("Error: gamma too small: %d < %d\n", size, 7 + 7 + 8);
+	if (ncolors < ARRAY_SIZE(smpte_color_lut)) {
+		printf("Error: lut too small: %u < %zu\n", ncolors,
+		       ARRAY_SIZE(smpte_color_lut));
 		return;
 	}
-	memset(lut, 0, size * sizeof(struct drm_color_lut));
-
-#define FILL_COLOR(idx, r, g, b) \
-	lut[idx].red = (r) * 0x101; \
-	lut[idx].green = (g) * 0x101; \
-	lut[idx].blue = (b) * 0x101
-
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
-
-#undef FILL_COLOR
+	memset(lut, 0, ncolors * sizeof(struct drm_color_lut));
+
+	memcpy(lut, smpte_color_lut, sizeof(smpte_color_lut));
 }
 
 static void fill_smpte(const struct util_format_info *info, void *planes[3],
diff --git a/tests/util/pattern.h b/tests/util/pattern.h
index ea38cafdcf27d811..e500aba3b4686c47 100644
--- a/tests/util/pattern.h
+++ b/tests/util/pattern.h
@@ -39,7 +39,7 @@ void util_fill_pattern(uint32_t format, enum util_fill_pattern pattern,
 		       void *planes[3], unsigned int width,
 		       unsigned int height, unsigned int stride);
 
-void util_smpte_c8_gamma(unsigned size, struct drm_color_lut *lut);
+void util_smpte_fill_lut(unsigned int ncolors, struct drm_color_lut *lut);
 
 enum util_fill_pattern util_pattern_enum(const char *name);
 
-- 
2.34.1

