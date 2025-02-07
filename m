Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7B8A2BE02
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 09:32:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20D0A10EA5E;
	Fri,  7 Feb 2025 08:32:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from c64.rulez.org (c64.rulez.org [79.139.58.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C35B10EA1B
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 04:20:26 +0000 (UTC)
Received: by c64.rulez.org (Postfix, from userid 1000)
 id 4CD13105D3; Fri,  7 Feb 2025 05:19:52 +0100 (CET)
From: Zsolt Kajtar <soci@c64.rulez.org>
To: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: Zsolt Kajtar <soci@c64.rulez.org>
Subject: [PATCH RESEND 12/13] fbdev: core: Use generic imageblit for as
 sys_imageblit
Date: Fri,  7 Feb 2025 05:18:17 +0100
Message-Id: <20250207041818.4031-13-soci@c64.rulez.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250207041818.4031-1-soci@c64.rulez.org>
References: <20250207041818.4031-1-soci@c64.rulez.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 07 Feb 2025 08:32:02 +0000
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

Signed-off-by: Zsolt Kajtar <soci@c64.rulez.org>
---
 drivers/video/fbdev/core/sysimgblt.c | 325 +--------------------------
 1 file changed, 8 insertions(+), 317 deletions(-)

diff --git a/drivers/video/fbdev/core/sysimgblt.c b/drivers/video/fbdev/core/sysimgblt.c
index 6949bbd51..6e60e3486 100644
--- a/drivers/video/fbdev/core/sysimgblt.c
+++ b/drivers/video/fbdev/core/sysimgblt.c
@@ -11,329 +11,20 @@
  *  more details.
  */
 #include <linux/module.h>
-#include <linux/string.h>
 #include <linux/fb.h>
 #include <asm/types.h>
 
-#define DEBUG
-
-#ifdef DEBUG
-#define DPRINTK(fmt, args...) printk(KERN_DEBUG "%s: " fmt,__func__,## args)
-#else
-#define DPRINTK(fmt, args...)
-#endif
-
-static const u32 cfb_tab8_be[] = {
-    0x00000000,0x000000ff,0x0000ff00,0x0000ffff,
-    0x00ff0000,0x00ff00ff,0x00ffff00,0x00ffffff,
-    0xff000000,0xff0000ff,0xff00ff00,0xff00ffff,
-    0xffff0000,0xffff00ff,0xffffff00,0xffffffff
-};
-
-static const u32 cfb_tab8_le[] = {
-    0x00000000,0xff000000,0x00ff0000,0xffff0000,
-    0x0000ff00,0xff00ff00,0x00ffff00,0xffffff00,
-    0x000000ff,0xff0000ff,0x00ff00ff,0xffff00ff,
-    0x0000ffff,0xff00ffff,0x00ffffff,0xffffffff
-};
-
-static const u32 cfb_tab16_be[] = {
-    0x00000000, 0x0000ffff, 0xffff0000, 0xffffffff
-};
-
-static const u32 cfb_tab16_le[] = {
-    0x00000000, 0xffff0000, 0x0000ffff, 0xffffffff
-};
-
-static const u32 cfb_tab32[] = {
-	0x00000000, 0xffffffff
-};
-
-static void color_imageblit(const struct fb_image *image, struct fb_info *p,
-			    void *dst1, u32 start_index, u32 pitch_index)
-{
-	/* Draw the penguin */
-	u32 *dst, *dst2;
-	u32 color = 0, val, shift;
-	int i, n, bpp = p->var.bits_per_pixel;
-	u32 null_bits = 32 - bpp;
-	u32 *palette = (u32 *) p->pseudo_palette;
-	const u8 *src = image->data;
-
-	dst2 = dst1;
-	for (i = image->height; i--; ) {
-		n = image->width;
-		dst = dst1;
-		shift = 0;
-		val = 0;
-
-		if (start_index) {
-			u32 start_mask = ~(FB_SHIFT_HIGH(p, ~(u32)0,
-							 start_index));
-			val = *dst & start_mask;
-			shift = start_index;
-		}
-		while (n--) {
-			if (p->fix.visual == FB_VISUAL_TRUECOLOR ||
-			    p->fix.visual == FB_VISUAL_DIRECTCOLOR )
-				color = palette[*src];
-			else
-				color = *src;
-			color <<= FB_LEFT_POS(p, bpp);
-			val |= FB_SHIFT_HIGH(p, color, shift);
-			if (shift >= null_bits) {
-				*dst++ = val;
-
-				val = (shift == null_bits) ? 0 :
-					FB_SHIFT_LOW(p, color, 32 - shift);
-			}
-			shift += bpp;
-			shift &= (32 - 1);
-			src++;
-		}
-		if (shift) {
-			u32 end_mask = FB_SHIFT_HIGH(p, ~(u32)0, shift);
-
-			*dst &= end_mask;
-			*dst |= val;
-		}
-		dst1 += p->fix.line_length;
-		if (pitch_index) {
-			dst2 += p->fix.line_length;
-			dst1 = (u8 *)((long)dst2 & ~(sizeof(u32) - 1));
-
-			start_index += pitch_index;
-			start_index &= 32 - 1;
-		}
-	}
-}
-
-static void slow_imageblit(const struct fb_image *image, struct fb_info *p,
-				  void *dst1, u32 fgcolor, u32 bgcolor,
-				  u32 start_index, u32 pitch_index)
-{
-	u32 shift, color = 0, bpp = p->var.bits_per_pixel;
-	u32 *dst, *dst2;
-	u32 val, pitch = p->fix.line_length;
-	u32 null_bits = 32 - bpp;
-	u32 spitch = (image->width+7)/8;
-	const u8 *src = image->data, *s;
-	u32 i, j, l;
-
-	dst2 = dst1;
-	fgcolor <<= FB_LEFT_POS(p, bpp);
-	bgcolor <<= FB_LEFT_POS(p, bpp);
-
-	for (i = image->height; i--; ) {
-		shift = val = 0;
-		l = 8;
-		j = image->width;
-		dst = dst1;
-		s = src;
-
-		/* write leading bits */
-		if (start_index) {
-			u32 start_mask = ~(FB_SHIFT_HIGH(p, ~(u32)0,
-							 start_index));
-			val = *dst & start_mask;
-			shift = start_index;
-		}
-
-		while (j--) {
-			l--;
-			color = (*s & (1 << l)) ? fgcolor : bgcolor;
-			val |= FB_SHIFT_HIGH(p, color, shift);
-
-			/* Did the bitshift spill bits to the next long? */
-			if (shift >= null_bits) {
-				*dst++ = val;
-				val = (shift == null_bits) ? 0 :
-					FB_SHIFT_LOW(p, color, 32 - shift);
-			}
-			shift += bpp;
-			shift &= (32 - 1);
-			if (!l) { l = 8; s++; }
-		}
-
-		/* write trailing bits */
- 		if (shift) {
-			u32 end_mask = FB_SHIFT_HIGH(p, ~(u32)0, shift);
-
-			*dst &= end_mask;
-			*dst |= val;
-		}
-
-		dst1 += pitch;
-		src += spitch;
-		if (pitch_index) {
-			dst2 += pitch;
-			dst1 = (u8 *)((long)dst2 & ~(sizeof(u32) - 1));
-			start_index += pitch_index;
-			start_index &= 32 - 1;
-		}
-
-	}
-}
-
-/*
- * fast_imageblit - optimized monochrome color expansion
- *
- * Only if:  bits_per_pixel == 8, 16, or 32
- *           image->width is divisible by pixel/dword (ppw);
- *           fix->line_legth is divisible by 4;
- *           beginning and end of a scanline is dword aligned
- */
-static void fast_imageblit(const struct fb_image *image, struct fb_info *p,
-				  void *dst1, u32 fgcolor, u32 bgcolor)
-{
-	u32 fgx = fgcolor, bgx = bgcolor, bpp = p->var.bits_per_pixel;
-	u32 ppw = 32/bpp, spitch = (image->width + 7)/8;
-	u32 bit_mask, eorx, shift;
-	const u8 *s = image->data, *src;
-	u32 *dst;
-	const u32 *tab;
-	size_t tablen;
-	u32 colortab[16];
-	int i, j, k;
-
-	switch (bpp) {
-	case 8:
-		tab = fb_be_math(p) ? cfb_tab8_be : cfb_tab8_le;
-		tablen = 16;
-		break;
-	case 16:
-		tab = fb_be_math(p) ? cfb_tab16_be : cfb_tab16_le;
-		tablen = 4;
-		break;
-	case 32:
-		tab = cfb_tab32;
-		tablen = 2;
-		break;
-	default:
-		return;
-	}
-
-	for (i = ppw-1; i--; ) {
-		fgx <<= bpp;
-		bgx <<= bpp;
-		fgx |= fgcolor;
-		bgx |= bgcolor;
-	}
-
-	bit_mask = (1 << ppw) - 1;
-	eorx = fgx ^ bgx;
-	k = image->width/ppw;
-
-	for (i = 0; i < tablen; ++i)
-		colortab[i] = (tab[i] & eorx) ^ bgx;
-
-	for (i = image->height; i--; ) {
-		dst = dst1;
-		shift = 8;
-		src = s;
-
-		/*
-		 * Manually unroll the per-line copying loop for better
-		 * performance. This works until we processed the last
-		 * completely filled source byte (inclusive).
-		 */
-		switch (ppw) {
-		case 4: /* 8 bpp */
-			for (j = k; j >= 2; j -= 2, ++src) {
-				*dst++ = colortab[(*src >> 4) & bit_mask];
-				*dst++ = colortab[(*src >> 0) & bit_mask];
-			}
-			break;
-		case 2: /* 16 bpp */
-			for (j = k; j >= 4; j -= 4, ++src) {
-				*dst++ = colortab[(*src >> 6) & bit_mask];
-				*dst++ = colortab[(*src >> 4) & bit_mask];
-				*dst++ = colortab[(*src >> 2) & bit_mask];
-				*dst++ = colortab[(*src >> 0) & bit_mask];
-			}
-			break;
-		case 1: /* 32 bpp */
-			for (j = k; j >= 8; j -= 8, ++src) {
-				*dst++ = colortab[(*src >> 7) & bit_mask];
-				*dst++ = colortab[(*src >> 6) & bit_mask];
-				*dst++ = colortab[(*src >> 5) & bit_mask];
-				*dst++ = colortab[(*src >> 4) & bit_mask];
-				*dst++ = colortab[(*src >> 3) & bit_mask];
-				*dst++ = colortab[(*src >> 2) & bit_mask];
-				*dst++ = colortab[(*src >> 1) & bit_mask];
-				*dst++ = colortab[(*src >> 0) & bit_mask];
-			}
-			break;
-		}
-
-		/*
-		 * For image widths that are not a multiple of 8, there
-		 * are trailing pixels left on the current line. Print
-		 * them as well.
-		 */
-		for (; j--; ) {
-			shift -= ppw;
-			*dst++ = colortab[(*src >> shift) & bit_mask];
-			if (!shift) {
-				shift = 8;
-				++src;
-			}
-		}
-
-		dst1 += p->fix.line_length;
-		s += spitch;
-	}
-}
-
-void sys_imageblit(struct fb_info *p, const struct fb_image *image)
-{
-	u32 fgcolor, bgcolor, start_index, bitstart, pitch_index = 0;
-	u32 bpl = sizeof(u32), bpp = p->var.bits_per_pixel;
-	u32 width = image->width;
-	u32 dx = image->dx, dy = image->dy;
-	void *dst1;
-
-	if (p->state != FBINFO_STATE_RUNNING)
-		return;
-
-	if (!(p->flags & FBINFO_VIRTFB))
-		fb_warn_once(p, "Framebuffer is not in virtual address space.");
-
-	bitstart = (dy * p->fix.line_length * 8) + (dx * bpp);
-	start_index = bitstart & (32 - 1);
-	pitch_index = (p->fix.line_length & (bpl - 1)) * 8;
-
-	bitstart /= 8;
-	bitstart &= ~(bpl - 1);
-	dst1 = (void __force *)p->screen_base + bitstart;
-
-	if (p->fbops->fb_sync)
-		p->fbops->fb_sync(p);
-
-	if (image->depth == 1) {
-		if (p->fix.visual == FB_VISUAL_TRUECOLOR ||
-		    p->fix.visual == FB_VISUAL_DIRECTCOLOR) {
-			fgcolor = ((u32*)(p->pseudo_palette))[image->fg_color];
-			bgcolor = ((u32*)(p->pseudo_palette))[image->bg_color];
-		} else {
-			fgcolor = image->fg_color;
-			bgcolor = image->bg_color;
-		}
-
-		if (32 % bpp == 0 && !start_index && !pitch_index &&
-		    ((width & (32/bpp-1)) == 0) &&
-		    bpp >= 8 && bpp <= 32)
-			fast_imageblit(image, p, dst1, fgcolor, bgcolor);
-		else
-			slow_imageblit(image, p, dst1, fgcolor, bgcolor,
-					start_index, pitch_index);
-	} else
-		color_imageblit(image, p, dst1, start_index, pitch_index);
-}
+#define FB_READL(a)       (*a)
+#define FB_WRITEL(a,b)    do { *(b) = (a); } while (false)
+#define FB_MEM            /* nothing */
+#define FB_IMAGEBLIT      sys_imageblit
+#define FB_SPACE          FBINFO_VIRTFB
+#define FB_SPACE_NAME     "virtual"
+#define FB_SCREEN_BASE(a) ((a)->screen_buffer)
+#include "fb_imageblit.h"
 
 EXPORT_SYMBOL(sys_imageblit);
 
 MODULE_AUTHOR("Antonino Daplas <adaplas@pol.net>");
 MODULE_DESCRIPTION("1-bit/8-bit to 1-32 bit color expansion (sys-to-sys)");
 MODULE_LICENSE("GPL");
-
-- 
2.30.2

