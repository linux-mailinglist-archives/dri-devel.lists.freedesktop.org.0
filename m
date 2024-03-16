Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2370D87D789
	for <lists+dri-devel@lfdr.de>; Sat, 16 Mar 2024 01:16:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C5FC112748;
	Sat, 16 Mar 2024 00:16:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 323 seconds by postgrey-1.36 at gabe;
 Sat, 16 Mar 2024 00:15:59 UTC
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98E1B112748
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Mar 2024 00:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 91965A02A7;
 Sat, 16 Mar 2024 01:10:34 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aE3BA_vSyRyl; Sat, 16 Mar 2024 01:10:34 +0100 (CET)
Received: from begin.home (aamiens-653-1-111-57.w83-192.abo.wanadoo.fr
 [83.192.234.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 54A51A029A;
 Sat, 16 Mar 2024 01:10:34 +0100 (CET)
Received: from samy by begin.home with local (Exim 4.97)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1rlHdB-0000000CQpc-3eDj; Sat, 16 Mar 2024 01:10:33 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Helge Deller <deller@gmx.de>, Alexey Gladkov <legion@kernel.org>,
 Jiry Slaby <jirislaby@kernel.org>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCHv2] fbcon: Increase maximum font width x height to 64 x 128
Date: Sat, 16 Mar 2024 01:10:21 +0100
Message-ID: <20240316001022.2963072-1-samuel.thibault@ens-lyon.org>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

By using bitmaps we actually support whatever size we would want, but the
console currently limits fonts to 64x128 (which gives 60x16 text on 4k
screens), so we don't need more for now, and we can easily increase later.

Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

---
Difference from v1:
- use a bitmap rather than just extending the integer size
- add missing updates in drivers
---
 drivers/firmware/efi/earlycon.c    |  2 +-
 drivers/video/fbdev/arkfb.c        | 15 +++++++++++----
 drivers/video/fbdev/core/fbcon.c   | 16 +++++++++-------
 drivers/video/fbdev/core/fbmem.c   | 12 ++++++------
 drivers/video/fbdev/core/svgalib.c | 15 +++++++++++----
 drivers/video/fbdev/s3fb.c         | 15 +++++++++++----
 drivers/video/fbdev/vga16fb.c      |  6 +++++-
 drivers/video/fbdev/vt8623fb.c     | 15 +++++++++++----
 include/linux/fb.h                 | 18 ++++++++++++------
 include/linux/font.h               |  3 ++-
 lib/fonts/fonts.c                  | 15 +++++++++------
 11 files changed, 88 insertions(+), 44 deletions(-)

diff --git a/drivers/firmware/efi/earlycon.c b/drivers/firmware/efi/earlycon.c
index f80a9af3d16e..d18a1a5de144 100644
--- a/drivers/firmware/efi/earlycon.c
+++ b/drivers/firmware/efi/earlycon.c
@@ -252,7 +252,7 @@ static int __init efi_earlycon_setup(struct earlycon_device *device,
 	if (si->lfb_depth != 32)
 		return -ENODEV;
 
-	font = get_default_font(xres, yres, -1, -1);
+	font = get_default_font(xres, yres, NULL, NULL);
 	if (!font)
 		return -ENODEV;
 
diff --git a/drivers/video/fbdev/arkfb.c b/drivers/video/fbdev/arkfb.c
index dca9c0325b3f..082501feceb9 100644
--- a/drivers/video/fbdev/arkfb.c
+++ b/drivers/video/fbdev/arkfb.c
@@ -622,8 +622,13 @@ static int arkfb_set_par(struct fb_info *info)
 		info->tileops = NULL;
 
 		/* in 4bpp supports 8p wide tiles only, any tiles otherwise */
-		info->pixmap.blit_x = (bpp == 4) ? (1 << (8 - 1)) : (~(u32)0);
-		info->pixmap.blit_y = ~(u32)0;
+		if (bpp == 4) {
+			bitmap_zero(info->pixmap.blit_x, FB_MAX_BLIT_WIDTH);
+			set_bit(8 - 1, info->pixmap.blit_x);
+		} else {
+			bitmap_fill(info->pixmap.blit_x, FB_MAX_BLIT_WIDTH);
+		}
+		bitmap_fill(info->pixmap.blit_y, FB_MAX_BLIT_HEIGHT);
 
 		offset_value = (info->var.xres_virtual * bpp) / 64;
 		screen_size = info->var.yres_virtual * info->fix.line_length;
@@ -635,8 +640,10 @@ static int arkfb_set_par(struct fb_info *info)
 		info->tileops = &arkfb_tile_ops;
 
 		/* supports 8x16 tiles only */
-		info->pixmap.blit_x = 1 << (8 - 1);
-		info->pixmap.blit_y = 1 << (16 - 1);
+		bitmap_zero(info->pixmap.blit_x, FB_MAX_BLIT_WIDTH);
+		set_bit(8 - 1, info->pixmap.blit_x);
+		bitmap_zero(info->pixmap.blit_y, FB_MAX_BLIT_HEIGHT);
+		set_bit(16 - 1, info->pixmap.blit_y);
 
 		offset_value = info->var.xres_virtual / 16;
 		screen_size = (info->var.xres_virtual * info->var.yres_virtual) / 64;
diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 46823c2e2ba1..72ff3147a3bf 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2483,12 +2483,12 @@ static int fbcon_set_font(struct vc_data *vc, struct console_font *font,
 	    h > FBCON_SWAP(info->var.rotate, info->var.yres, info->var.xres))
 		return -EINVAL;
 
-	if (font->width > 32 || font->height > 32)
+	if (font->width > FB_MAX_BLIT_WIDTH || font->height > FB_MAX_BLIT_HEIGHT)
 		return -EINVAL;
 
 	/* Make sure drawing engine can handle the font */
-	if (!(info->pixmap.blit_x & BIT(font->width - 1)) ||
-	    !(info->pixmap.blit_y & BIT(font->height - 1)))
+	if (!test_bit(font->width - 1, info->pixmap.blit_x) ||
+	    !test_bit(font->height - 1, info->pixmap.blit_y))
 		return -EINVAL;
 
 	/* Make sure driver can handle the font length */
@@ -3082,8 +3082,8 @@ void fbcon_get_requirement(struct fb_info *info,
 			vc = vc_cons[i].d;
 			if (vc && vc->vc_mode == KD_TEXT &&
 			    info->node == con2fb_map[i]) {
-				caps->x |= 1 << (vc->vc_font.width - 1);
-				caps->y |= 1 << (vc->vc_font.height - 1);
+				set_bit(vc->vc_font.width - 1, caps->x);
+				set_bit(vc->vc_font.height - 1, caps->y);
 				charcnt = vc->vc_font.charcount;
 				if (caps->len < charcnt)
 					caps->len = charcnt;
@@ -3094,8 +3094,10 @@ void fbcon_get_requirement(struct fb_info *info,
 
 		if (vc && vc->vc_mode == KD_TEXT &&
 		    info->node == con2fb_map[fg_console]) {
-			caps->x = 1 << (vc->vc_font.width - 1);
-			caps->y = 1 << (vc->vc_font.height - 1);
+			bitmap_zero(caps->x, FB_MAX_BLIT_WIDTH);
+			set_bit(vc->vc_font.width - 1, caps->x);
+			bitmap_zero(caps->y, FB_MAX_BLIT_HEIGHT);
+			set_bit(vc->vc_font.height - 1, caps->y);
 			caps->len = vc->vc_font.charcount;
 		}
 	}
diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index fc206755f5f6..5ca18bfe11f6 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -212,8 +212,8 @@ static int fb_check_caps(struct fb_info *info, struct fb_var_screeninfo *var,
 	fbcon_get_requirement(info, &caps);
 	info->fbops->fb_get_caps(info, &fbcaps, var);
 
-	if (((fbcaps.x ^ caps.x) & caps.x) ||
-	    ((fbcaps.y ^ caps.y) & caps.y) ||
+	if (!bitmap_subset(caps.x, fbcaps.x, FB_MAX_BLIT_WIDTH) ||
+	    !bitmap_subset(caps.y, fbcaps.y, FB_MAX_BLIT_HEIGHT) ||
 	    (fbcaps.len < caps.len))
 		err = -EINVAL;
 
@@ -420,11 +420,11 @@ static int do_register_framebuffer(struct fb_info *fb_info)
 	}
 	fb_info->pixmap.offset = 0;
 
-	if (!fb_info->pixmap.blit_x)
-		fb_info->pixmap.blit_x = ~(u32)0;
+	if (bitmap_empty(fb_info->pixmap.blit_x, FB_MAX_BLIT_WIDTH))
+		bitmap_fill(fb_info->pixmap.blit_x, FB_MAX_BLIT_WIDTH);
 
-	if (!fb_info->pixmap.blit_y)
-		fb_info->pixmap.blit_y = ~(u32)0;
+	if (bitmap_empty(fb_info->pixmap.blit_y, FB_MAX_BLIT_HEIGHT))
+		bitmap_fill(fb_info->pixmap.blit_y, FB_MAX_BLIT_HEIGHT);
 
 	if (!fb_info->modelist.prev || !fb_info->modelist.next)
 		INIT_LIST_HEAD(&fb_info->modelist);
diff --git a/drivers/video/fbdev/core/svgalib.c b/drivers/video/fbdev/core/svgalib.c
index 2cba158888ea..821b89a0a645 100644
--- a/drivers/video/fbdev/core/svgalib.c
+++ b/drivers/video/fbdev/core/svgalib.c
@@ -354,12 +354,19 @@ void svga_get_caps(struct fb_info *info, struct fb_blit_caps *caps,
 {
 	if (var->bits_per_pixel == 0) {
 		/* can only support 256 8x16 bitmap */
-		caps->x = 1 << (8 - 1);
-		caps->y = 1 << (16 - 1);
+		bitmap_zero(caps->x, FB_MAX_BLIT_WIDTH);
+		set_bit(8 - 1, caps->x);
+		bitmap_zero(caps->y, FB_MAX_BLIT_HEIGHT);
+		set_bit(16 - 1, caps->y);
 		caps->len = 256;
 	} else {
-		caps->x = (var->bits_per_pixel == 4) ? 1 << (8 - 1) : ~(u32)0;
-		caps->y = ~(u32)0;
+		if (var->bits_per_pixel == 4) {
+			bitmap_zero(caps->x, FB_MAX_BLIT_WIDTH);
+			set_bit(8 - 1, caps->x);
+		} else {
+			bitmap_fill(caps->x, FB_MAX_BLIT_WIDTH);
+		}
+		bitmap_fill(caps->y, FB_MAX_BLIT_HEIGHT);
 		caps->len = ~(u32)0;
 	}
 }
diff --git a/drivers/video/fbdev/s3fb.c b/drivers/video/fbdev/s3fb.c
index 07722a5ea8ef..ff84106ecf1c 100644
--- a/drivers/video/fbdev/s3fb.c
+++ b/drivers/video/fbdev/s3fb.c
@@ -617,8 +617,13 @@ static int s3fb_set_par(struct fb_info *info)
 		info->tileops = NULL;
 
 		/* in 4bpp supports 8p wide tiles only, any tiles otherwise */
-		info->pixmap.blit_x = (bpp == 4) ? (1 << (8 - 1)) : (~(u32)0);
-		info->pixmap.blit_y = ~(u32)0;
+		if (bpp == 4) {
+			bitmap_zero(info->pixmap.blit_x, FB_MAX_BLIT_WIDTH);
+			set_bit(8 - 1, info->pixmap.blit_x);
+		} else {
+			bitmap_fill(info->pixmap.blit_x, FB_MAX_BLIT_WIDTH);
+		}
+		bitmap_fill(info->pixmap.blit_y, FB_MAX_BLIT_HEIGHT);
 
 		offset_value = (info->var.xres_virtual * bpp) / 64;
 		screen_size = info->var.yres_virtual * info->fix.line_length;
@@ -630,8 +635,10 @@ static int s3fb_set_par(struct fb_info *info)
 		info->tileops = fasttext ? &s3fb_fast_tile_ops : &s3fb_tile_ops;
 
 		/* supports 8x16 tiles only */
-		info->pixmap.blit_x = 1 << (8 - 1);
-		info->pixmap.blit_y = 1 << (16 - 1);
+		bitmap_zero(info->pixmap.blit_x, FB_MAX_BLIT_WIDTH);
+		set_bit(8 - 1, info->pixmap.blit_x);
+		bitmap_zero(info->pixmap.blit_y, FB_MAX_BLIT_HEIGHT);
+		set_bit(16 - 1, info->pixmap.blit_y);
 
 		offset_value = info->var.xres_virtual / 16;
 		screen_size = (info->var.xres_virtual * info->var.yres_virtual) / 64;
diff --git a/drivers/video/fbdev/vga16fb.c b/drivers/video/fbdev/vga16fb.c
index b485e9198201..a87bafbb119c 100644
--- a/drivers/video/fbdev/vga16fb.c
+++ b/drivers/video/fbdev/vga16fb.c
@@ -1353,7 +1353,11 @@ static int vga16fb_probe(struct platform_device *dev)
 	info->var = vga16fb_defined;
 	info->fix = vga16fb_fix;
 	/* supports rectangles with widths of multiples of 8 */
-	info->pixmap.blit_x = 1 << 7 | 1 << 15 | 1 << 23 | 1 << 31;
+	bitmap_zero(info->pixmap.blit_x, FB_MAX_BLIT_WIDTH);
+	set_bit(8 - 1, info->pixmap.blit_x);
+	set_bit(16 - 1, info->pixmap.blit_x);
+	set_bit(24 - 1, info->pixmap.blit_x);
+	set_bit(32 - 1, info->pixmap.blit_x);
 	info->flags = FBINFO_HWACCEL_YPAN;
 
 	i = (info->var.bits_per_pixel == 8) ? 256 : 16;
diff --git a/drivers/video/fbdev/vt8623fb.c b/drivers/video/fbdev/vt8623fb.c
index f8d022cb61e8..df984f3a7ff6 100644
--- a/drivers/video/fbdev/vt8623fb.c
+++ b/drivers/video/fbdev/vt8623fb.c
@@ -390,8 +390,13 @@ static int vt8623fb_set_par(struct fb_info *info)
 		info->tileops = NULL;
 
 		/* in 4bpp supports 8p wide tiles only, any tiles otherwise */
-		info->pixmap.blit_x = (bpp == 4) ? (1 << (8 - 1)) : (~(u32)0);
-		info->pixmap.blit_y = ~(u32)0;
+		if (bpp == 4) {
+			bitmap_zero(info->pixmap.blit_x, FB_MAX_BLIT_WIDTH);
+			set_bit(8 - 1, info->pixmap.blit_x);
+		} else {
+			bitmap_fill(info->pixmap.blit_x, FB_MAX_BLIT_WIDTH);
+		}
+		bitmap_fill(info->pixmap.blit_y, FB_MAX_BLIT_HEIGHT);
 
 		offset_value = (info->var.xres_virtual * bpp) / 64;
 		fetch_value  = ((info->var.xres * bpp) / 128) + 4;
@@ -408,8 +413,10 @@ static int vt8623fb_set_par(struct fb_info *info)
 		info->tileops = &vt8623fb_tile_ops;
 
 		/* supports 8x16 tiles only */
-		info->pixmap.blit_x = 1 << (8 - 1);
-		info->pixmap.blit_y = 1 << (16 - 1);
+		bitmap_zero(info->pixmap.blit_x, FB_MAX_BLIT_WIDTH);
+		set_bit(8 - 1, info->pixmap.blit_x);
+		bitmap_zero(info->pixmap.blit_y, FB_MAX_BLIT_HEIGHT);
+		set_bit(16 - 1, info->pixmap.blit_y);
 
 		offset_value = info->var.xres_virtual / 16;
 		fetch_value  = (info->var.xres / 8) + 8;
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 05dc9624897d..3003436d1e3b 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -143,9 +143,13 @@ struct fb_event {
 	void *data;
 };
 
+/*	Enough for the VT console needs, see its max_font_width/height */
+#define FB_MAX_BLIT_WIDTH	64
+#define FB_MAX_BLIT_HEIGHT	128
+
 struct fb_blit_caps {
-	u32 x;
-	u32 y;
+	DECLARE_BITMAP(x, FB_MAX_BLIT_WIDTH);
+	DECLARE_BITMAP(y, FB_MAX_BLIT_HEIGHT);
 	u32 len;
 	u32 flags;
 };
@@ -192,10 +196,12 @@ struct fb_pixmap {
 	u32 scan_align;		/* alignment per scanline		*/
 	u32 access_align;	/* alignment per read/write (bits)	*/
 	u32 flags;		/* see FB_PIXMAP_*			*/
-	u32 blit_x;             /* supported bit block dimensions (1-32)*/
-	u32 blit_y;             /* Format: blit_x = 1 << (width - 1)    */
-	                        /*         blit_y = 1 << (height - 1)   */
-	                        /* if 0, will be set to 0xffffffff (all)*/
+	                        /* supported bit block dimensions       */
+	                        /* Format: test_bit(width - 1, blit_x)  */
+	                        /*         test_bit(height - 1, blit_y) */
+	                        /* if zero, will be set to full (all)   */
+	DECLARE_BITMAP(blit_x, FB_MAX_BLIT_WIDTH);
+	DECLARE_BITMAP(blit_y, FB_MAX_BLIT_HEIGHT);
 	/* access methods */
 	void (*writeio)(struct fb_info *info, void __iomem *dst, void *src, unsigned int size);
 	void (*readio) (struct fb_info *info, void *dst, void __iomem *src, unsigned int size);
diff --git a/include/linux/font.h b/include/linux/font.h
index abf1442ce719..81caffd51bb4 100644
--- a/include/linux/font.h
+++ b/include/linux/font.h
@@ -57,7 +57,8 @@ extern const struct font_desc *find_font(const char *name);
 /* Get the default font for a specific screen size */
 
 extern const struct font_desc *get_default_font(int xres, int yres,
-						u32 font_w, u32 font_h);
+						unsigned long *font_w,
+						unsigned long *font_h);
 
 /* Max. length for the name of a predefined font */
 #define MAX_FONT_NAME	32
diff --git a/lib/fonts/fonts.c b/lib/fonts/fonts.c
index 973866438608..409f3e4103a2 100644
--- a/lib/fonts/fonts.c
+++ b/lib/fonts/fonts.c
@@ -96,18 +96,21 @@ EXPORT_SYMBOL(find_font);
  *	get_default_font - get default font
  *	@xres: screen size of X
  *	@yres: screen size of Y
- *      @font_w: bit array of supported widths (1 - 32)
- *      @font_h: bit array of supported heights (1 - 32)
+ *	@font_w: bit array of supported widths (1 - FB_MAX_BLIT_WIDTH)
+ *	@font_h: bit array of supported heights (1 - FB_MAX_BLIT_HEIGHT)
  *
  *	Get the default font for a specified screen size.
  *	Dimensions are in pixels.
  *
+ *	font_w or font_h being NULL means all values are supported.
+ *
  *	Returns %NULL if no font is found, or a pointer to the
  *	chosen font.
  *
  */
-const struct font_desc *get_default_font(int xres, int yres, u32 font_w,
-					 u32 font_h)
+const struct font_desc *get_default_font(int xres, int yres,
+                                         unsigned long *font_w,
+                                         unsigned long *font_h)
 {
 	int i, c, cc, res;
 	const struct font_desc *f, *g;
@@ -135,8 +138,8 @@ const struct font_desc *get_default_font(int xres, int yres, u32 font_w,
 		if (res > 20)
 			c += 20 - res;
 
-		if ((font_w & (1U << (f->width - 1))) &&
-		    (font_h & (1U << (f->height - 1))))
+		if ((!font_w || test_bit(f->width - 1, font_w)) &&
+		    (!font_h || test_bit(f->height - 1, font_h)))
 			c += 1000;
 
 		if (c > cc) {
-- 
2.39.2

