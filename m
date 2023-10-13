Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 318B47C8803
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 16:43:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E503110E16B;
	Fri, 13 Oct 2023 14:43:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F4F10E184
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 14:43:22 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:f151:5551:1af6:b316])
 by michel.telenet-ops.be with bizsmtp
 id xSjN2A00X56FAx306SjNxt; Fri, 13 Oct 2023 16:43:22 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qrJNi-006Gwx-Gv;
 Fri, 13 Oct 2023 16:43:18 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qrJNl-002VpY-V0;
 Fri, 13 Oct 2023 16:43:17 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm v4 6/9] util: add SMPTE pattern support for C1 format
Date: Fri, 13 Oct 2023 16:43:08 +0200
Message-Id: <e117603caae4218beb54634242e3c4b758af3d17.1697207862.git.geert@linux-m68k.org>
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

Add support for drawing the SMPTE pattern in a buffer using the C1
indexed format.

As only two colors are available, the pattern is drawn in black and
white, using Floyd-Steinberg dithering[1].

[1] https://en.wikipedia.org/wiki/Floyd%E2%80%93Steinberg_dithering

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
Dithering example at https://drive.google.com/file/d/1waJczErrIaEKRhBCCU1ynxRG8agpo0Xx/view

v4:
  - Replace FILL_COLOR() use by bw_color_lut[],

v3:
  - Add Acked-by,
  - Add Wikipedia link,

v2:
  New.
---
 tests/util/pattern.c | 174 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 171 insertions(+), 3 deletions(-)

diff --git a/tests/util/pattern.c b/tests/util/pattern.c
index 17074265dc60033c..2362555356e0dd71 100644
--- a/tests/util/pattern.c
+++ b/tests/util/pattern.c
@@ -654,6 +654,11 @@ static unsigned int smpte_bottom[8] = {
 
 #define EXPAND_COLOR(r, g, b)	{ (r) * 0x101, (g) * 0x101, (b) * 0x101 }
 
+static const struct drm_color_lut bw_color_lut[] = {
+	EXPAND_COLOR(  0,   0,   0),	/* black */
+	EXPAND_COLOR(255, 255, 255),	/* white */
+};
+
 static const struct drm_color_lut smpte_color_lut[] = {
 	[SMPTE_COLOR_GREY] =        EXPAND_COLOR(192, 192, 192),
 	[SMPTE_COLOR_YELLOW] =      EXPAND_COLOR(192, 192,   0),
@@ -672,6 +677,164 @@ static const struct drm_color_lut smpte_color_lut[] = {
 
 #undef EXPAND_COLOR
 
+/*
+ * Floyd-Steinberg dithering
+ */
+
+struct fsd {
+	unsigned int width;
+	unsigned int x;
+	unsigned int i;
+	int red;
+	int green;
+	int blue;
+	int error[];
+};
+
+static struct fsd *fsd_alloc(unsigned int width)
+{
+	unsigned int n = 3 * (width + 1);
+	struct fsd *fsd = malloc(sizeof(*fsd) + n * sizeof(fsd->error[0]));
+
+	fsd->width = width;
+	fsd->x = 0;
+	fsd->i = 0;
+	memset(fsd->error, 0, n * sizeof(fsd->error[0]));
+
+	return fsd;
+}
+
+static inline int clamp(int val, int min, int max)
+{
+	if (val < min)
+		return min;
+	if (val > max)
+		return max;
+	return val;
+}
+
+static void fsd_dither(struct fsd *fsd, struct drm_color_lut *color)
+{
+	unsigned int i = fsd->i;
+
+	fsd->red = (int)color->red + (fsd->error[3 * i] + 8) / 16;
+	fsd->green = (int)color->green + (fsd->error[3 * i + 1] + 8) / 16;
+	fsd->blue = (int)color->blue + (fsd->error[3 * i + 2] + 8) / 16;
+
+	color->red = clamp(fsd->red, 0, 65535);
+	color->green = clamp(fsd->green, 0, 65535);
+	color->blue = clamp(fsd->blue, 0, 65535);
+}
+
+static void fsd_update(struct fsd *fsd, const struct drm_color_lut *actual)
+{
+	int error_red = fsd->red - (int)actual->red;
+	int error_green = fsd->green - (int)actual->green;
+	int error_blue = fsd->blue - (int)actual->blue;
+	unsigned int width = fsd->width;
+	unsigned int i = fsd->i, j;
+	unsigned int n = width + 1;
+
+	/* Distribute errors over neighboring pixels */
+	if (fsd->x == width - 1) {
+		/* Last pixel on this scanline */
+		/* South East: initialize to zero */
+		fsd->error[3 * i] = 0;
+		fsd->error[3 * i + 1] = 0;
+		fsd->error[3 * i + 2] = 0;
+	} else {
+		/* East: accumulate error */
+		j = (i + 1) % n;
+		fsd->error[3 * j] += 7 * error_red;
+		fsd->error[3 * j + 1] += 7 * error_green;
+		fsd->error[3 * j + 2] += 7 * error_blue;
+
+		/* South East: initial error */
+		fsd->error[3 * i] = error_red;
+		fsd->error[3 * i + 1] = error_green;
+		fsd->error[3 * i + 2] = error_blue;
+	}
+	/* South West: accumulate error */
+	j = (i + width - 1) % n;
+	fsd->error[3 * j] += 3 * error_red;
+	fsd->error[3 * j + 1] += 3 * error_green;
+	fsd->error[3 * j + 2] += 3 * error_blue;
+
+	/* South: accumulate error */
+	j = (i + width) % n;
+	fsd->error[3 * j] += 5 * error_red;
+	fsd->error[3 * j + 1] += 5 * error_green;
+	fsd->error[3 * j + 2] += 5 * error_blue;
+
+	fsd->x = (fsd->x + 1) % width;
+	fsd->i = (fsd->i + 1) % n;
+}
+
+static void write_pixel_1(uint8_t *mem, unsigned int x, unsigned int pixel)
+{
+	unsigned int shift = 7 - (x & 7);
+	unsigned int mask = 1U << shift;
+
+	mem[x / 8] = (mem[x / 8] & ~mask) | ((pixel << shift) & mask);
+}
+
+static void write_color_1(struct fsd *fsd, uint8_t *mem, unsigned int x,
+			  unsigned int index)
+{
+	struct drm_color_lut color = smpte_color_lut[index];
+	unsigned int pixel;
+
+	fsd_dither(fsd, &color);
+
+	/* ITU BT.601: Y = 0.299 R + 0.587 G + 0.114 B */
+	if (3 * color.red + 6 * color.green + color.blue >= 10 * 32768) {
+		pixel = 1;
+		color.red = color.green = color.blue = 65535;
+	} else {
+		pixel = 0;
+		color.red = color.green = color.blue = 0;
+	}
+
+	fsd_update(fsd, &color);
+
+	write_pixel_1(mem, x, pixel);
+}
+
+static void fill_smpte_c1(void *mem, unsigned int width, unsigned int height,
+			  unsigned int stride)
+{
+	struct fsd *fsd = fsd_alloc(width);
+	unsigned int x;
+	unsigned int y;
+
+	for (y = 0; y < height * 6 / 9; ++y) {
+		for (x = 0; x < width; ++x)
+			write_color_1(fsd, mem, x, smpte_top[x * 7 / width]);
+		mem += stride;
+	}
+
+	for (; y < height * 7 / 9; ++y) {
+		for (x = 0; x < width; ++x)
+			write_color_1(fsd, mem, x, smpte_middle[x * 7 / width]);
+		mem += stride;
+	}
+
+	for (; y < height; ++y) {
+		for (x = 0; x < width * 5 / 7; ++x)
+			write_color_1(fsd, mem, x,
+				      smpte_bottom[x * 4 / (width * 5 / 7)]);
+		for (; x < width * 6 / 7; ++x)
+			write_color_1(fsd, mem, x,
+				      smpte_bottom[(x - width * 5 / 7) * 3 /
+						   (width / 7) + 4]);
+		for (; x < width; ++x)
+			write_color_1(fsd, mem, x, smpte_bottom[7]);
+		mem += stride;
+	}
+
+	free(fsd);
+}
+
 static void write_pixel_4(uint8_t *mem, unsigned int x, unsigned int pixel)
 {
 	if (x & 1)
@@ -746,14 +909,17 @@ static void fill_smpte_c8(void *mem, unsigned int width, unsigned int height,
 
 void util_smpte_fill_lut(unsigned int ncolors, struct drm_color_lut *lut)
 {
-	if (ncolors < ARRAY_SIZE(smpte_color_lut)) {
+	if (ncolors < ARRAY_SIZE(bw_color_lut)) {
 		printf("Error: lut too small: %u < %zu\n", ncolors,
-		       ARRAY_SIZE(smpte_color_lut));
+		       ARRAY_SIZE(bw_color_lut));
 		return;
 	}
 	memset(lut, 0, ncolors * sizeof(struct drm_color_lut));
 
-	memcpy(lut, smpte_color_lut, sizeof(smpte_color_lut));
+	if (ncolors < ARRAY_SIZE(smpte_color_lut))
+		memcpy(lut, bw_color_lut, sizeof(bw_color_lut));
+	else
+		memcpy(lut, smpte_color_lut, sizeof(smpte_color_lut));
 }
 
 static void fill_smpte(const struct util_format_info *info, void *planes[3],
@@ -763,6 +929,8 @@ static void fill_smpte(const struct util_format_info *info, void *planes[3],
 	unsigned char *u, *v;
 
 	switch (info->format) {
+	case DRM_FORMAT_C1:
+		return fill_smpte_c1(planes[0], width, height, stride);
 	case DRM_FORMAT_C4:
 		return fill_smpte_c4(planes[0], width, height, stride);
 	case DRM_FORMAT_C8:
-- 
2.34.1

