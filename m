Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B3815024B
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2020 09:11:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A35496EB3F;
	Mon,  3 Feb 2020 08:10:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 399 seconds by postgrey-1.36 at gabe;
 Sun, 02 Feb 2020 02:44:56 UTC
Received: from kvm5.telegraphics.com.au (kvm5.telegraphics.com.au
 [98.124.60.144])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9F6DC8985A
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Feb 2020 02:44:56 +0000 (UTC)
Received: by kvm5.telegraphics.com.au (Postfix, from userid 502)
 id DBC8229AEF; Sat,  1 Feb 2020 21:38:15 -0500 (EST)
To: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paulburton@kernel.org>,
 James Hogan <jhogan@kernel.org>
Message-Id: <d8f19ebc00a7688da739d41d584d081d1559f0d2.1580610812.git.fthain@telegraphics.com.au>
In-Reply-To: <cover.1580610812.git.fthain@telegraphics.com.au>
References: <cover.1580610812.git.fthain@telegraphics.com.au>
From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 1/3] fbdev/g364fb: Fix build failure
Date: Sun, 02 Feb 2020 13:33:32 +1100
X-Mailman-Approved-At: Mon, 03 Feb 2020 08:10:41 +0000
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
Cc: linux-fbdev@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch resolves these compiler errors and warnings --

  CC      drivers/video/fbdev/g364fb.o
drivers/video/fbdev/g364fb.c: In function 'g364fb_cursor':
drivers/video/fbdev/g364fb.c:137:9: error: 'x' undeclared (first use in this function)
drivers/video/fbdev/g364fb.c:137:9: note: each undeclared identifier is reported only once for each function it appears in
drivers/video/fbdev/g364fb.c:137:7: error: implicit declaration of function 'fontwidth' [-Werror=implicit-function-declaration]
drivers/video/fbdev/g364fb.c:137:23: error: 'p' undeclared (first use in this function)
drivers/video/fbdev/g364fb.c:137:38: error: 'y' undeclared (first use in this function)
drivers/video/fbdev/g364fb.c:137:7: error: implicit declaration of function 'fontheight' [-Werror=implicit-function-declaration]
drivers/video/fbdev/g364fb.c: In function 'g364fb_init':
drivers/video/fbdev/g364fb.c:233:24: error: 'fbvar' undeclared (first use in this function)
drivers/video/fbdev/g364fb.c:234:24: error: 'xres' undeclared (first use in this function)
drivers/video/fbdev/g364fb.c:201:14: warning: unused variable 'j' [-Wunused-variable]
drivers/video/fbdev/g364fb.c:197:25: warning: unused variable 'pal_ptr' [-Wunused-variable]

The MIPS Magnum framebuffer console now works when tested in QEMU.

Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 drivers/video/fbdev/g364fb.c | 29 +++--------------------------
 1 file changed, 3 insertions(+), 26 deletions(-)

diff --git a/drivers/video/fbdev/g364fb.c b/drivers/video/fbdev/g364fb.c
index 223896cc5f7d..fb26230a3c7b 100644
--- a/drivers/video/fbdev/g364fb.c
+++ b/drivers/video/fbdev/g364fb.c
@@ -108,7 +108,6 @@ static int g364fb_pan_display(struct fb_var_screeninfo *var,
 static int g364fb_setcolreg(u_int regno, u_int red, u_int green,
 			    u_int blue, u_int transp,
 			    struct fb_info *info);
-static int g364fb_cursor(struct fb_info *info, struct fb_cursor *cursor);
 static int g364fb_blank(int blank, struct fb_info *info);
 
 static struct fb_ops g364fb_ops = {
@@ -119,28 +118,8 @@ static struct fb_ops g364fb_ops = {
 	.fb_fillrect	= cfb_fillrect,
 	.fb_copyarea	= cfb_copyarea,
 	.fb_imageblit	= cfb_imageblit,
-	.fb_cursor	= g364fb_cursor,
 };
 
-int g364fb_cursor(struct fb_info *info, struct fb_cursor *cursor)
-{
-	
-	switch (cursor->enable) {
-	case CM_ERASE:
-		*(unsigned int *) CTLA_REG |= CURS_TOGGLE;
-		break;
-
-	case CM_MOVE:
-	case CM_DRAW:
-		*(unsigned int *) CTLA_REG &= ~CURS_TOGGLE;
-		*(unsigned int *) CURS_POS_REG =
-		    ((x * fontwidth(p)) << 12) | ((y * fontheight(p)) -
-						  info->var.yoffset);
-		break;
-	}
-	return 0;
-}
-
 /*
  *  Pan or Wrap the Display
  *
@@ -194,11 +173,9 @@ static int g364fb_setcolreg(u_int regno, u_int red, u_int green,
  */
 int __init g364fb_init(void)
 {
-	volatile unsigned int *pal_ptr =
-	    (volatile unsigned int *) CLR_PAL_REG;
 	volatile unsigned int *curs_pal_ptr =
 	    (volatile unsigned int *) CURS_PAL_REG;
-	int mem, i, j;
+	int mem, i;
 
 	if (fb_get_options("g364fb", NULL))
 		return -ENODEV;
@@ -230,8 +207,8 @@ int __init g364fb_init(void)
 	 */
 	*(unsigned short *) (CURS_PAT_REG + 14 * 64) = 0xffff;
 	*(unsigned short *) (CURS_PAT_REG + 15 * 64) = 0xffff;
-	fb_var.xres_virtual = fbvar.xres;
-	fb_fix.line_length = (xres / 8) * fb_var.bits_per_pixel;
+	fb_var.xres_virtual = fb_var.xres;
+	fb_fix.line_length = fb_var.xres_virtual * fb_var.bits_per_pixel / 8;
 	fb_fix.smem_start = 0x40000000;	/* physical address */
 	/* get size of video memory; this is special for the JAZZ hardware */
 	mem = (r4030_read_reg32(JAZZ_R4030_CONFIG) >> 8) & 3;
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
