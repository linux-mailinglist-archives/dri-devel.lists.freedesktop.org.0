Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF904D08DC
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 21:53:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20DAD10E24D;
	Mon,  7 Mar 2022 20:53:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0BDC10E23A
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 20:53:32 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6100:2d37:4115:c358])
 by michel.telenet-ops.be with bizsmtp
 id 3YtX270031Yj8bA06YtXjY; Mon, 07 Mar 2022 21:53:31 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nRKM9-0036ST-Fd; Mon, 07 Mar 2022 21:53:25 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nRKM8-0034mW-Lo; Mon, 07 Mar 2022 21:53:24 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm 3/3] util: Add SMPTE pattern support for C4 format
Date: Mon,  7 Mar 2022 21:53:18 +0100
Message-Id: <cc84f1fcd0901ba58a2e4fd34c43846c622fd157.1646683737.git.geert@linux-m68k.org>
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

Add support for drawing the SMPTE pattern in a buffer using the C4
indexed format.

Note that this still uses 256 instead of 16 as the CLUT size, as
DRM_IOCTL_MODE_SETGAMMA enforces that the size matches against the
(fixed) gamma size, while the CLUT size depends on the format.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
The linuxdoc comments say userspace can query the gamma size:

 * drm_mode_gamma_set_ioctl - set the gamma table
 *
 * Set the gamma table of a CRTC to the one passed in by the user. Userspace can
 * inquire the required gamma table size through drm_mode_gamma_get_ioctl.

 * drm_mode_gamma_get_ioctl - get the gamma table
 *
 * Copy the current gamma table into the storage provided. This also provides
 * the gamma table size the driver expects, which can be used to size the
 * allocated storage.

but the code doesn't seem to support that in an easy way (like setting
red/green/blue to NULL on input, retrieving gamma_size on output), only
by providing big enough buffers for red/green/blue, and looping over
gamma_size until -EINVAL is no longer returned.
---
 tests/modetest/modetest.c | 11 +++++++---
 tests/util/pattern.c      | 42 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+), 3 deletions(-)

diff --git a/tests/modetest/modetest.c b/tests/modetest/modetest.c
index e369044fb7a484c1..205b7093b0045e01 100644
--- a/tests/modetest/modetest.c
+++ b/tests/modetest/modetest.c
@@ -1122,16 +1122,21 @@ static void set_gamma(struct device *dev, unsigned crtc_id, unsigned fourcc)
 	struct drm_color_lut gamma_lut[256];
 	int i, ret;
 
-	if (fourcc == DRM_FORMAT_C8) {
-		/* TODO: Add C8 support for more patterns */
+	switch (fourcc) {
+	case DRM_FORMAT_C4:
+	case DRM_FORMAT_C8:
+		/* TODO: Add index support for more patterns */
 		util_smpte_index_gamma(256, gamma_lut);
 		drmModeCreatePropertyBlob(dev->fd, gamma_lut, sizeof(gamma_lut), &blob_id);
-	} else {
+		break;
+
+	default:
 		for (i = 0; i < 256; i++) {
 			gamma_lut[i].red =
 			gamma_lut[i].green =
 			gamma_lut[i].blue = i << 8;
 		}
+		break;
 	}
 
 	add_property_optional(dev, crtc_id, "DEGAMMA_LUT", 0);
diff --git a/tests/util/pattern.c b/tests/util/pattern.c
index 953bf95492ee150c..42d75d700700dc3d 100644
--- a/tests/util/pattern.c
+++ b/tests/util/pattern.c
@@ -608,6 +608,46 @@ static void fill_smpte_rgb16fp(const struct util_rgb_info *rgb, void *mem,
 static unsigned int smpte_middle[7] = { 6, 7, 4, 7, 2, 7, 0 };
 static unsigned int smpte_bottom[8] = { 8, 9, 10, 7, 11, 7, 12, 7 };
 
+static void write_pixel_4(uint8_t *mem, unsigned int x, unsigned int pixel)
+{
+	if (x & 1)
+		mem[x / 2] = (mem[x / 2] & 0xf0) | (pixel & 0x0f);
+	else
+		mem[x / 2] = (mem[x / 2] & 0x0f) | (pixel << 4);
+}
+
+static void fill_smpte_c4(void *mem, unsigned int width, unsigned int height,
+			  unsigned int stride)
+{
+	unsigned int x;
+	unsigned int y;
+
+	for (y = 0; y < height * 6 / 9; ++y) {
+		for (x = 0; x < width; ++x)
+			write_pixel_4(mem, x, x * 7 / width);
+		mem += stride;
+	}
+
+	for (; y < height * 7 / 9; ++y) {
+		for (x = 0; x < width; ++x)
+			write_pixel_4(mem, x, smpte_middle[x * 7 / width]);
+		mem += stride;
+	}
+
+	for (; y < height; ++y) {
+		for (x = 0; x < width * 5 / 7; ++x)
+			write_pixel_4(mem, x,
+				      smpte_bottom[x * 4 / (width * 5 / 7)]);
+		for (; x < width * 6 / 7; ++x)
+			write_pixel_4(mem, x,
+				      smpte_bottom[(x - width * 5 / 7) * 3 /
+						   (width / 7) + 4]);
+		for (; x < width; ++x)
+			write_pixel_4(mem, x, smpte_bottom[7]);
+		mem += stride;
+	}
+}
+
 static void fill_smpte_c8(void *mem, unsigned int width, unsigned int height,
 			  unsigned int stride)
 {
@@ -688,6 +728,8 @@ static void fill_smpte(const struct util_format_info *info, void *planes[3],
 	unsigned char *u, *v;
 
 	switch (info->format) {
+	case DRM_FORMAT_C4:
+		return fill_smpte_c4(planes[0], width, height, stride);
 	case DRM_FORMAT_C8:
 		return fill_smpte_c8(planes[0], width, height, stride);
 	case DRM_FORMAT_UYVY:
-- 
2.25.1

