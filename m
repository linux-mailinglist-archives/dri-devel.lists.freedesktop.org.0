Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E81BEA2BE01
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 09:32:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CAE610EA63;
	Fri,  7 Feb 2025 08:32:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from c64.rulez.org (c64.rulez.org [79.139.58.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11CA610E938
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 19:52:30 +0000 (UTC)
Received: by c64.rulez.org (Postfix, from userid 1000)
 id CFE17100FA; Thu,  6 Feb 2025 20:52:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by c64.rulez.org (Postfix) with ESMTP id CE8C0100F6;
 Thu,  6 Feb 2025 20:52:28 +0100 (CET)
Date: Thu, 6 Feb 2025 20:52:28 +0100 (CET)
From: Zsolt Kajtar <soci@c64.rulez.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 08/13] fbdev: core: Use generic fillrect for as
 sys_fillrect
Message-ID: <8dacc89-9b2b-28e7-1e51-6d66d09b5f6c@c64.rulez.org>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
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

fbdev: core: Use generic fillrect for as sys_fillrect

Signed-off-by: Zsolt Kajtar <soci@c64.rulez.org>
---
  drivers/video/fbdev/core/sysfillrect.c | 314 +------------------------
  1 file changed, 9 insertions(+), 305 deletions(-)

diff --git a/drivers/video/fbdev/core/sysfillrect.c b/drivers/video/fbdev/core/sysfillrect.c
index e49221a88..48d0f0efb 100644
--- a/drivers/video/fbdev/core/sysfillrect.c
+++ b/drivers/video/fbdev/core/sysfillrect.c
@@ -12,314 +12,18 @@
   *  more details.
   */
  #include <linux/module.h>
-#include <linux/string.h>
  #include <linux/fb.h>
  #include <asm/types.h>
-#include "fb_draw.h"

-    /*
-     *  Aligned pattern fill using 32/64-bit memory accesses
-     */
-
-static void
-bitfill_aligned(struct fb_info *p, unsigned long *dst, int dst_idx,
-		unsigned long pat, unsigned n, int bits)
-{
-	unsigned long first, last;
-
-	if (!n)
-		return;
-
-	first = FB_SHIFT_HIGH(p, ~0UL, dst_idx);
-	last = ~(FB_SHIFT_HIGH(p, ~0UL, (dst_idx+n) % bits));
-
-	if (dst_idx+n <= bits) {
-		/* Single word */
-		if (last)
-			first &= last;
-		*dst = comp(pat, *dst, first);
-	} else {
-		/* Multiple destination words */
-
-		/* Leading bits */
- 		if (first!= ~0UL) {
-			*dst = comp(pat, *dst, first);
-			dst++;
-			n -= bits - dst_idx;
-		}
-
-		/* Main chunk */
-		n /= bits;
-		memset_l(dst, pat, n);
-		dst += n;
-
-		/* Trailing bits */
-		if (last)
-			*dst = comp(pat, *dst, last);
-	}
-}
-
-
-    /*
-     *  Unaligned generic pattern fill using 32/64-bit memory accesses
-     *  The pattern must have been expanded to a full 32/64-bit value
-     *  Left/right are the appropriate shifts to convert to the pattern to be
-     *  used for the next 32/64-bit word
-     */
-
-static void
-bitfill_unaligned(struct fb_info *p, unsigned long *dst, int dst_idx,
-		  unsigned long pat, int left, int right, unsigned n, int bits)
-{
-	unsigned long first, last;
-
-	if (!n)
-		return;
-
-	first = FB_SHIFT_HIGH(p, ~0UL, dst_idx);
-	last = ~(FB_SHIFT_HIGH(p, ~0UL, (dst_idx+n) % bits));
-
-	if (dst_idx+n <= bits) {
-		/* Single word */
-		if (last)
-			first &= last;
-		*dst = comp(pat, *dst, first);
-	} else {
-		/* Multiple destination words */
-		/* Leading bits */
-		if (first) {
-			*dst = comp(pat, *dst, first);
-			dst++;
-			pat = pat << left | pat >> right;
-			n -= bits - dst_idx;
-		}
-
-		/* Main chunk */
-		n /= bits;
-		while (n >= 4) {
-			*dst++ = pat;
-			pat = pat << left | pat >> right;
-			*dst++ = pat;
-			pat = pat << left | pat >> right;
-			*dst++ = pat;
-			pat = pat << left | pat >> right;
-			*dst++ = pat;
-			pat = pat << left | pat >> right;
-			n -= 4;
-		}
-		while (n--) {
-			*dst++ = pat;
-			pat = pat << left | pat >> right;
-		}
-
-		/* Trailing bits */
-		if (last)
-			*dst = comp(pat, *dst, last);
-	}
-}
-
-    /*
-     *  Aligned pattern invert using 32/64-bit memory accesses
-     */
-static void
-bitfill_aligned_rev(struct fb_info *p, unsigned long *dst, int dst_idx,
-		    unsigned long pat, unsigned n, int bits)
-{
-	unsigned long val = pat;
-	unsigned long first, last;
-
-	if (!n)
-		return;
-
-	first = FB_SHIFT_HIGH(p, ~0UL, dst_idx);
-	last = ~(FB_SHIFT_HIGH(p, ~0UL, (dst_idx+n) % bits));
-
-	if (dst_idx+n <= bits) {
-		/* Single word */
-		if (last)
-			first &= last;
-		*dst = comp(*dst ^ val, *dst, first);
-	} else {
-		/* Multiple destination words */
-		/* Leading bits */
-		if (first!=0UL) {
-			*dst = comp(*dst ^ val, *dst, first);
-			dst++;
-			n -= bits - dst_idx;
-		}
-
-		/* Main chunk */
-		n /= bits;
-		while (n >= 8) {
-			*dst++ ^= val;
-			*dst++ ^= val;
-			*dst++ ^= val;
-			*dst++ ^= val;
-			*dst++ ^= val;
-			*dst++ ^= val;
-			*dst++ ^= val;
-			*dst++ ^= val;
-			n -= 8;
-		}
-		while (n--)
-			*dst++ ^= val;
-		/* Trailing bits */
-		if (last)
-			*dst = comp(*dst ^ val, *dst, last);
-	}
-}
-
-
-    /*
-     *  Unaligned generic pattern invert using 32/64-bit memory accesses
-     *  The pattern must have been expanded to a full 32/64-bit value
-     *  Left/right are the appropriate shifts to convert to the pattern to be
-     *  used for the next 32/64-bit word
-     */
-
-static void
-bitfill_unaligned_rev(struct fb_info *p, unsigned long *dst, int dst_idx,
-		      unsigned long pat, int left, int right, unsigned n,
-		      int bits)
-{
-	unsigned long first, last;
-
-	if (!n)
-		return;
-
-	first = FB_SHIFT_HIGH(p, ~0UL, dst_idx);
-	last = ~(FB_SHIFT_HIGH(p, ~0UL, (dst_idx+n) % bits));
-
-	if (dst_idx+n <= bits) {
-		/* Single word */
-		if (last)
-			first &= last;
-		*dst = comp(*dst ^ pat, *dst, first);
-	} else {
-		/* Multiple destination words */
-
-		/* Leading bits */
-		if (first != 0UL) {
-			*dst = comp(*dst ^ pat, *dst, first);
-			dst++;
-			pat = pat << left | pat >> right;
-			n -= bits - dst_idx;
-		}
-
-		/* Main chunk */
-		n /= bits;
-		while (n >= 4) {
-			*dst++ ^= pat;
-			pat = pat << left | pat >> right;
-			*dst++ ^= pat;
-			pat = pat << left | pat >> right;
-			*dst++ ^= pat;
-			pat = pat << left | pat >> right;
-			*dst++ ^= pat;
-			pat = pat << left | pat >> right;
-			n -= 4;
-		}
-		while (n--) {
-			*dst ^= pat;
-			pat = pat << left | pat >> right;
-		}
-
-		/* Trailing bits */
-		if (last)
-			*dst = comp(*dst ^ pat, *dst, last);
-	}
-}
-
-void sys_fillrect(struct fb_info *p, const struct fb_fillrect *rect)
-{
-	unsigned long pat, pat2, fg;
-	unsigned long width = rect->width, height = rect->height;
-	int bits = BITS_PER_LONG, bytes = bits >> 3;
-	u32 bpp = p->var.bits_per_pixel;
-	unsigned long *dst;
-	int dst_idx, left;
-
-	if (p->state != FBINFO_STATE_RUNNING)
-		return;
-
-	if (!(p->flags & FBINFO_VIRTFB))
-		fb_warn_once(p, "Framebuffer is not in virtual address space.");
-
-	if (p->fix.visual == FB_VISUAL_TRUECOLOR ||
-	    p->fix.visual == FB_VISUAL_DIRECTCOLOR )
-		fg = ((u32 *) (p->pseudo_palette))[rect->color];
-	else
-		fg = rect->color;
-
-	pat = pixel_to_pat( bpp, fg);
-
-	dst = (unsigned long *)((unsigned long)p->screen_base & ~(bytes-1));
-	dst_idx = ((unsigned long)p->screen_base & (bytes - 1))*8;
-	dst_idx += rect->dy*p->fix.line_length*8+rect->dx*bpp;
-	/* FIXME For now we support 1-32 bpp only */
-	left = bits % bpp;
-	if (p->fbops->fb_sync)
-		p->fbops->fb_sync(p);
-	if (!left) {
-		void (*fill_op32)(struct fb_info *p, unsigned long *dst,
-				  int dst_idx, unsigned long pat, unsigned n,
-				  int bits) = NULL;
-
-		switch (rect->rop) {
-		case ROP_XOR:
-			fill_op32 = bitfill_aligned_rev;
-			break;
-		case ROP_COPY:
-			fill_op32 = bitfill_aligned;
-			break;
-		default:
-			printk( KERN_ERR "cfb_fillrect(): unknown rop, "
-				"defaulting to ROP_COPY\n");
-			fill_op32 = bitfill_aligned;
-			break;
-		}
-		while (height--) {
-			dst += dst_idx >> (ffs(bits) - 1);
-			dst_idx &= (bits - 1);
-			fill_op32(p, dst, dst_idx, pat, width*bpp, bits);
-			dst_idx += p->fix.line_length*8;
-		}
-	} else {
-		int right, r;
-		void (*fill_op)(struct fb_info *p, unsigned long *dst,
-				int dst_idx, unsigned long pat, int left,
-				int right, unsigned n, int bits) = NULL;
-#ifdef __LITTLE_ENDIAN
-		right = left;
-		left = bpp - right;
-#else
-		right = bpp - left;
-#endif
-		switch (rect->rop) {
-		case ROP_XOR:
-			fill_op = bitfill_unaligned_rev;
-			break;
-		case ROP_COPY:
-			fill_op = bitfill_unaligned;
-			break;
-		default:
-			printk(KERN_ERR "sys_fillrect(): unknown rop, "
-				"defaulting to ROP_COPY\n");
-			fill_op = bitfill_unaligned;
-			break;
-		}
-		while (height--) {
-			dst += dst_idx / bits;
-			dst_idx &= (bits - 1);
-			r = dst_idx % bpp;
-			/* rotate pattern to the correct start position */
-			pat2 = le_long_to_cpu(rolx(cpu_to_le_long(pat), r, bpp));
-			fill_op(p, dst, dst_idx, pat2, left, right,
-				width*bpp, bits);
-			dst_idx += p->fix.line_length*8;
-		}
-	}
-}
+#define FB_READL(a)       (*a)
+#define FB_WRITEL(a,b)    do { *(b) = (a); } while (false)
+#define FB_MEM            /* nothing */
+#define FB_FILLRECT       sys_fillrect
+#define FB_FILLRECT_NAME  "sys_fillrect"
+#define FB_SPACE          FBINFO_VIRTFB
+#define FB_SPACE_NAME     "virtual"
+#define FB_SCREEN_BASE(a) ((a)->screen_buffer)
+#include "fb_fillrect.h"

  EXPORT_SYMBOL(sys_fillrect);

-- 
2.30.2

