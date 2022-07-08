Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AA056BEAB
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 20:22:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F35810EBE1;
	Fri,  8 Jul 2022 18:22:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C49FD10EBD2
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 18:21:47 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.186.194])
 by albert.telenet-ops.be with bizsmtp
 id siMn2700B4C55Sk06iMnbz; Fri, 08 Jul 2022 20:21:47 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o9sbr-002fMX-1A; Fri, 08 Jul 2022 20:21:47 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o9sbq-00BtT6-8y; Fri, 08 Jul 2022 20:21:46 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm v2 08/10] util: Add SMPTE pattern support for C2 format
Date: Fri,  8 Jul 2022 20:21:38 +0200
Message-Id: <ebf0a228fc81d95a447690297b645c970192f21d.1657302034.git.geert@linux-m68k.org>
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

Add support for drawing the SMPTE pattern in a buffer using the C2
indexed format.

As only four colors are available, resolution is halved, and the pattern
is drawn in a PenTile RG-GB matrix, using Floyd-Steinberg dithering.
The magnitude of the green subpixels is reduced, as there are twice as
many green subpixels as red or blue subpixels.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
v2:
  - New.
---
 tests/util/pattern.c | 97 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 96 insertions(+), 1 deletion(-)

diff --git a/tests/util/pattern.c b/tests/util/pattern.c
index 5ec7d66495209df4..a5c4e31ad856709e 100644
--- a/tests/util/pattern.c
+++ b/tests/util/pattern.c
@@ -825,6 +825,93 @@ static void fill_smpte_c1(void *mem, unsigned int width, unsigned int height,
 
 	free(fsd);
 }
+
+static void write_pixel_2(uint8_t *mem, unsigned int x, unsigned int pixel)
+{
+	unsigned int shift = 6 - 2 * (x & 3);
+	unsigned int mask = 3U << shift;
+
+	mem[x / 4] = (mem[x / 4] & ~mask) | ((pixel << shift) & mask);
+}
+
+static void write_color_2(struct fsd *fsd, uint8_t *mem, unsigned int stride,
+			  unsigned int x, unsigned int index)
+{
+	struct drm_color_lut color = smpte_color_lut[index];
+	unsigned int r, g, b;
+
+	fsd_dither(fsd, &color);
+
+	if (color.red >= 32768) {
+		r = 1;
+		color.red = 65535;
+	} else {
+		r = 0;
+		color.red = 0;
+	}
+	if (color.green >= 32768) {
+		g = 2;
+		color.green = 65535;
+	} else {
+		g = 0;
+		color.green = 0;
+	}
+	if (color.blue >= 32768) {
+		b = 3;
+		color.blue = 65535;
+	} else {
+		b = 0;
+		color.blue = 0;
+	}
+
+	fsd_update(fsd, &color);
+
+	/* Use PenTile RG-GB */
+	write_pixel_2(mem, 2 * x, r);
+	write_pixel_2(mem, 2 * x + 1, g);
+	write_pixel_2(mem + stride, 2 * x, g);
+	write_pixel_2(mem + stride, 2 * x + 1, b);
+}
+
+static void fill_smpte_c2(void *mem, unsigned int width, unsigned int height,
+			  unsigned int stride)
+{
+	struct fsd *fsd = fsd_alloc(width);
+	unsigned int x;
+	unsigned int y;
+
+	/* Half resolution for PenTile RG-GB */
+	width /= 2;
+	height /= 2;
+
+	for (y = 0; y < height * 6 / 9; ++y) {
+		for (x = 0; x < width; ++x)
+			write_color_2(fsd, mem, stride, x, smpte_top[x * 7 / width]);
+		mem += 2 * stride;
+	}
+
+	for (; y < height * 7 / 9; ++y) {
+		for (x = 0; x < width; ++x)
+			write_color_2(fsd, mem, stride, x, smpte_middle[x * 7 / width]);
+		mem += 2 * stride;
+	}
+
+	for (; y < height; ++y) {
+		for (x = 0; x < width * 5 / 7; ++x)
+			write_color_2(fsd, mem, stride, x,
+				      smpte_bottom[x * 4 / (width * 5 / 7)]);
+		for (; x < width * 6 / 7; ++x)
+			write_color_2(fsd, mem, stride, x,
+				      smpte_bottom[(x - width * 5 / 7) * 3 /
+						   (width / 7) + 4]);
+		for (; x < width; ++x)
+			write_color_2(fsd, mem, stride, x, smpte_bottom[7]);
+		mem += 2 * stride;
+	}
+
+	free(fsd);
+}
+
 static void write_pixel_4(uint8_t *mem, unsigned int x, unsigned int pixel)
 {
 	if (x & 1)
@@ -910,9 +997,15 @@ void util_smpte_index_gamma(unsigned size, struct drm_color_lut *lut)
 	lut[idx].green = (g) * 0x101; \
 	lut[idx].blue = (b) * 0x101
 
-	if (size < ARRAY_SIZE(smpte_color_lut)) {
+	if (size < 4) {
 		FILL_COLOR(0, 0,   0,   0  );	/* black */
 		FILL_COLOR(1, 255, 255, 255);	/* white */
+	} else if (size < ARRAY_SIZE(smpte_color_lut)) {
+		/* PenTile RG-GB */
+		FILL_COLOR(0, 0,   0,   0  );	/* black */
+		FILL_COLOR(1, 255, 0,   0  );	/* red */
+		FILL_COLOR(2, 0,   207, 0  );	/* green */
+		FILL_COLOR(3, 0,   0,   255);	/* blue */
 	} else {
 		memcpy(lut, smpte_color_lut, sizeof(smpte_color_lut));
 	}
@@ -929,6 +1022,8 @@ static void fill_smpte(const struct util_format_info *info, void *planes[3],
 	switch (info->format) {
 	case DRM_FORMAT_C1:
 		return fill_smpte_c1(planes[0], width, height, stride);
+	case DRM_FORMAT_C2:
+		return fill_smpte_c2(planes[0], width, height, stride);
 	case DRM_FORMAT_C4:
 		return fill_smpte_c4(planes[0], width, height, stride);
 	case DRM_FORMAT_C8:
-- 
2.25.1

