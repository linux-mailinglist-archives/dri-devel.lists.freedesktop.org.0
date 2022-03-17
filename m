Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B29DF4DC0CB
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 09:18:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5F6610F002;
	Thu, 17 Mar 2022 08:18:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A3AD10F000
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 08:18:38 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:f500:58f9:d953:424b])
 by michel.telenet-ops.be with bizsmtp
 id 7LJa2700R0M4NNo06LJaKT; Thu, 17 Mar 2022 09:18:36 +0100
Received: from rox.of.borg ([192.168.97.57] helo=rox)
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nUlL8-004vC9-4S; Thu, 17 Mar 2022 09:18:34 +0100
Received: from geert by rox with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nUlL7-00559q-8c; Thu, 17 Mar 2022 09:18:33 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [PATCH v2 3/5] drm/ssd130x: Fix rectangle updates
Date: Thu, 17 Mar 2022 09:18:28 +0100
Message-Id: <20220317081830.1211400-4-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317081830.1211400-1-geert@linux-m68k.org>
References: <20220317081830.1211400-1-geert@linux-m68k.org>
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The rectangle update functions ssd130x_fb_blit_rect() and
ssd130x_update_rect() do not behave correctly when x1 != 0 or y1 !=
0, or when y1 or y2 are not aligned to display page boundaries.
E.g. when used as a text console, only the first line of text is shown
on the display.

  1. The buffer passed by ssd130x_fb_blit_rect() points to the first
     byte of monochrome bitmap data, and thus has its origin at (x1,
     y1), while ssd130x_update_rect() assumes it is at (0, 0).
     Fix ssd130x_update_rect() by changing the vertical and horizontal
     loop ranges, and adding the offsets only when needed.

  2. In ssd130x_fb_blit_rect(), align y1 and y2 to the display page
     boundaries before doing the color conversion, so the full page
     is converted and updated.
     Remove the correction for an unaligned y1 from
     ssd130x_update_rect(), and add a check to make sure y1 is aligned.

Fixes: a61732e808672cfa ("drm: Add driver for Solomon SSD130x OLED displays")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Javier Martinez Canillas <javierm@redhat.com>
---
v2:
  - Add Acked-by.

Note that instead of calling drm_fb_xrgb8888_to_mono() and transposing
the bitmap, the image data could be converted to the transposed format
directly.  However, that would preclude exposing a monochrome format to
userspace when a fourcc for such a monochrome format is introduced.
---
 drivers/gpu/drm/solomon/ssd130x.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index caee851efd5726e7..7c99af4ce9dd4e5c 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -355,11 +355,14 @@ static int ssd130x_update_rect(struct ssd130x_device *ssd130x, u8 *buf,
 	unsigned int width = drm_rect_width(rect);
 	unsigned int height = drm_rect_height(rect);
 	unsigned int line_length = DIV_ROUND_UP(width, 8);
-	unsigned int pages = DIV_ROUND_UP(y % 8 + height, 8);
+	unsigned int pages = DIV_ROUND_UP(height, 8);
+	struct drm_device *drm = &ssd130x->drm;
 	u32 array_idx = 0;
 	int ret, i, j, k;
 	u8 *data_array = NULL;
 
+	drm_WARN_ONCE(drm, y % 8 != 0, "y must be aligned to screen page\n");
+
 	data_array = kcalloc(width, pages, GFP_KERNEL);
 	if (!data_array)
 		return -ENOMEM;
@@ -401,13 +404,13 @@ static int ssd130x_update_rect(struct ssd130x_device *ssd130x, u8 *buf,
 	if (ret < 0)
 		goto out_free;
 
-	for (i = y / 8; i < y / 8 + pages; i++) {
+	for (i = 0; i < pages; i++) {
 		int m = 8;
 
 		/* Last page may be partial */
-		if (8 * (i + 1) > ssd130x->height)
+		if (8 * (y / 8 + i + 1) > ssd130x->height)
 			m = ssd130x->height % 8;
-		for (j = x; j < x + width; j++) {
+		for (j = 0; j < width; j++) {
 			u8 data = 0;
 
 			for (k = 0; k < m; k++) {
@@ -454,6 +457,10 @@ static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct iosys_m
 	int ret = 0;
 	u8 *buf = NULL;
 
+	/* Align y to display page boundaries */
+	rect->y1 = round_down(rect->y1, 8);
+	rect->y2 = min_t(unsigned int, round_up(rect->y2, 8), ssd130x->height);
+
 	buf = kcalloc(fb->width, fb->height, GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
-- 
2.25.1

