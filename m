Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5F4570798
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 17:50:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A86E18F456;
	Mon, 11 Jul 2022 15:50:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A38D8F455
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 15:50:40 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.186.194])
 by baptiste.telenet-ops.be with bizsmtp
 id trqe2700s4C55Sk01rqeem; Mon, 11 Jul 2022 17:50:38 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1oAvgE-0036xE-7d; Mon, 11 Jul 2022 17:50:38 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1oAvgD-006si5-4H; Mon, 11 Jul 2022 17:50:37 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Helge Deller <deller@gmx.de>
Subject: [PATCH 09/10] video: fbdev: atari: Remove unused definitions and
 variables
Date: Mon, 11 Jul 2022 17:50:33 +0200
Message-Id: <e4f96d86a35480e65ac8840cbed52ebcc89c028e.1657554353.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657554353.git.geert@linux-m68k.org>
References: <cover.1657554353.git.geert@linux-m68k.org>
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
Cc: Michael Schmitz <schmitzmic@gmail.com>, linux-fbdev@vger.kernel.org,
 linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-m68k@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Several definitions and variables are unused.
Some variables are set but further unused.

Remove them.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/video/fbdev/atafb.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/video/fbdev/atafb.c b/drivers/video/fbdev/atafb.c
index 46a00e0ad5e785ac..e8b178e732e2c785 100644
--- a/drivers/video/fbdev/atafb.c
+++ b/drivers/video/fbdev/atafb.c
@@ -1070,8 +1070,6 @@ static int falcon_decode_var(struct fb_var_screeninfo *var,
 			xstretch = 2;	/* Double pixel width only for hicolor */
 		/* Default values are used for vert./hor. timing if no pixelclock given. */
 		if (var->pixclock == 0) {
-			int linesize;
-
 			/* Choose master pixelclock depending on hor. timing */
 			plen = 1 * xstretch;
 			if ((plen * xres + f25.right + f25.hsync + f25.left) *
@@ -1090,7 +1088,6 @@ static int falcon_decode_var(struct fb_var_screeninfo *var,
 			left_margin = pclock->left / plen;
 			right_margin = pclock->right / plen;
 			hsync_len = pclock->hsync / plen;
-			linesize = left_margin + xres + right_margin + hsync_len;
 			upper_margin = 31;
 			lower_margin = 11;
 			vsync_len = 3;
@@ -2419,17 +2416,6 @@ atafb_pan_display(struct fb_var_screeninfo *var, struct fb_info *info)
  * generic drawing routines; imageblit needs updating for image depth > 1
  */
 
-#if BITS_PER_LONG == 32
-#define BYTES_PER_LONG	4
-#define SHIFT_PER_LONG	5
-#elif BITS_PER_LONG == 64
-#define BYTES_PER_LONG	8
-#define SHIFT_PER_LONG	6
-#else
-#define Please update me
-#endif
-
-
 static void atafb_fillrect(struct fb_info *info, const struct fb_fillrect *rect)
 {
 	struct atafb_par *par = info->par;
@@ -2531,8 +2517,6 @@ static void atafb_imageblit(struct fb_info *info, const struct fb_image *image)
 {
 	struct atafb_par *par = info->par;
 	int x2, y2;
-	unsigned long *dst;
-	int dst_idx;
 	const char *src;
 	u32 dx, dy, width, height, pitch;
 
@@ -2559,10 +2543,6 @@ static void atafb_imageblit(struct fb_info *info, const struct fb_image *image)
 
 	if (image->depth == 1) {
 		// used for font data
-		dst = (unsigned long *)
-			((unsigned long)info->screen_base & ~(BYTES_PER_LONG - 1));
-		dst_idx = ((unsigned long)info->screen_base & (BYTES_PER_LONG - 1)) * 8;
-		dst_idx += dy * par->next_line * 8 + dx;
 		src = image->data;
 		pitch = (image->width + 7) / 8;
 		while (height--) {
-- 
2.25.1

