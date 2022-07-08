Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6782B56BE9B
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 20:21:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 929CE10EBC9;
	Fri,  8 Jul 2022 18:21:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E8410EBBB
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 18:21:31 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.186.194])
 by xavier.telenet-ops.be with bizsmtp
 id siMU270034C55Sk01iMU6D; Fri, 08 Jul 2022 20:21:30 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o9sbX-002fJi-GN; Fri, 08 Jul 2022 20:21:27 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o9sbW-00BtNk-QD; Fri, 08 Jul 2022 20:21:26 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 3/3] drm/gud: Fix endianness in gud_xrgb8888_to_color() helper
Date: Fri,  8 Jul 2022 20:21:09 +0200
Message-Id: <b47589ed5d8ca44e0956684412e3f16f3227f887.1657300532.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657300532.git.geert@linux-m68k.org>
References: <cover.1657300532.git.geert@linux-m68k.org>
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
Cc: linux-fbdev@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DRM formats are defined to be little-endian, unless the
DRM_FORMAT_BIG_ENDIAN flag is set.  Hence when converting from one
format to another, multi-byte pixel values loaded from memory must be
converted from little-endian to host-endian.  Conversely, multi-byte
pixel values written to memory must be converted from host-endian to
little-endian.  Currently only drm_fb_xrgb8888_to_rgb332_line() includes
endianness handling.

Fix gud_xrgb8888_to_color() on big-endian platforms by adding the
missing endianness handling.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
Compile-tested only.

Interestingly, drm_fb_xrgb8888_to_rgb332() was introduced for GUD,
and always had correct endiannes handling...
---
 drivers/gpu/drm/gud/gud_pipe.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index 4873f9799f412e04..d42592f6daab8b2a 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -105,7 +105,8 @@ static size_t gud_xrgb8888_to_color(u8 *dst, const struct drm_format_info *forma
 	unsigned int bits_per_pixel = 8 / block_width;
 	u8 r, g, b, pix, *block = dst; /* Assign to silence compiler warning */
 	unsigned int x, y, width;
-	u32 *pix32;
+	__le32 *sbuf32;
+	u32 pix32;
 	size_t len;
 
 	/* Start on a byte boundary */
@@ -114,8 +115,8 @@ static size_t gud_xrgb8888_to_color(u8 *dst, const struct drm_format_info *forma
 	len = drm_format_info_min_pitch(format, 0, width) * drm_rect_height(rect);
 
 	for (y = rect->y1; y < rect->y2; y++) {
-		pix32 = src + (y * fb->pitches[0]);
-		pix32 += rect->x1;
+		sbuf32 = src + (y * fb->pitches[0]);
+		sbuf32 += rect->x1;
 
 		for (x = 0; x < width; x++) {
 			unsigned int pixpos = x % block_width; /* within byte from the left */
@@ -126,9 +127,10 @@ static size_t gud_xrgb8888_to_color(u8 *dst, const struct drm_format_info *forma
 				*block = 0;
 			}
 
-			r = *pix32 >> 16;
-			g = *pix32 >> 8;
-			b = *pix32++;
+			pix32 = le32_to_cpu(*sbuf32++);
+			r = pix32 >> 16;
+			g = pix32 >> 8;
+			b = pix32;
 
 			switch (format->format) {
 			case GUD_DRM_FORMAT_XRGB1111:
-- 
2.25.1

