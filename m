Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC487C8802
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 16:43:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C6710E184;
	Fri, 13 Oct 2023 14:43:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10FCA10E16B
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 14:43:22 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:f151:5551:1af6:b316])
 by albert.telenet-ops.be with bizsmtp
 id xSjN2A00L56FAx306SjN9p; Fri, 13 Oct 2023 16:43:22 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qrJNi-006Gwt-GB;
 Fri, 13 Oct 2023 16:43:17 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qrJNl-002VpS-UI;
 Fri, 13 Oct 2023 16:43:17 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm v4 5/9] util: add SMPTE pattern support for C4 format
Date: Fri, 13 Oct 2023 16:43:07 +0200
Message-Id: <0b644e3864c66d90d313a19b15d4ee76c73c3ff3.1697207862.git.geert@linux-m68k.org>
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

Add support for drawing the SMPTE pattern in a buffer using the C4
indexed format.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
v4:
  - No changes,

v3:
  - Add Acked-by,

v2:
  - Use new smpte_top[],
  - Split off changes to tests/util/pattern.c.
---
 tests/util/pattern.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/tests/util/pattern.c b/tests/util/pattern.c
index fc457c4ac61e404a..17074265dc60033c 100644
--- a/tests/util/pattern.c
+++ b/tests/util/pattern.c
@@ -672,6 +672,46 @@ static const struct drm_color_lut smpte_color_lut[] = {
 
 #undef EXPAND_COLOR
 
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
+			write_pixel_4(mem, x, smpte_top[x * 7 / width]);
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
@@ -723,6 +763,8 @@ static void fill_smpte(const struct util_format_info *info, void *planes[3],
 	unsigned char *u, *v;
 
 	switch (info->format) {
+	case DRM_FORMAT_C4:
+		return fill_smpte_c4(planes[0], width, height, stride);
 	case DRM_FORMAT_C8:
 		return fill_smpte_c8(planes[0], width, height, stride);
 	case DRM_FORMAT_UYVY:
-- 
2.34.1

