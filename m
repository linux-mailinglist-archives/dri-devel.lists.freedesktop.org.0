Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3583FA2BE06
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 09:32:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E91510EA5A;
	Fri,  7 Feb 2025 08:32:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from c64.rulez.org (c64.rulez.org [79.139.58.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92A3E10EA1B
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 04:20:13 +0000 (UTC)
Received: by c64.rulez.org (Postfix, from userid 1000)
 id 31967105CB; Fri,  7 Feb 2025 05:19:52 +0100 (CET)
From: Zsolt Kajtar <soci@c64.rulez.org>
To: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: Zsolt Kajtar <soci@c64.rulez.org>
Subject: [PATCH RESEND 07/13] fbdev: core: Use generic fillrect for as
 cfb_fillrect
Date: Fri,  7 Feb 2025 05:18:12 +0100
Message-Id: <20250207041818.4031-8-soci@c64.rulez.org>
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
 drivers/video/fbdev/core/cfbfillrect.c | 362 +------------------------
 1 file changed, 11 insertions(+), 351 deletions(-)

diff --git a/drivers/video/fbdev/core/cfbfillrect.c b/drivers/video/fbdev/core/cfbfillrect.c
index cbaa4c9e2..116d56de2 100644
--- a/drivers/video/fbdev/core/cfbfillrect.c
+++ b/drivers/video/fbdev/core/cfbfillrect.c
@@ -7,365 +7,25 @@
  *  License.  See the file COPYING in the main directory of this archive for
  *  more details.
  *
- * NOTES:
- *
- *  Also need to add code to deal with cards endians that are different than
- *  the native cpu endians. I also need to deal with MSB position in the word.
- *
  */
 #include <linux/module.h>
-#include <linux/string.h>
 #include <linux/fb.h>
 #include <asm/types.h>
-#include "fb_draw.h"
 
 #if BITS_PER_LONG == 32
-#  define FB_WRITEL fb_writel
-#  define FB_READL  fb_readl
-#else
-#  define FB_WRITEL fb_writeq
-#  define FB_READL  fb_readq
-#endif
-
-    /*
-     *  Aligned pattern fill using 32/64-bit memory accesses
-     */
-
-static void
-bitfill_aligned(struct fb_info *p, unsigned long __iomem *dst, int dst_idx,
-		unsigned long pat, unsigned n, int bits, u32 bswapmask)
-{
-	unsigned long first, last;
-
-	if (!n)
-		return;
-
-	first = fb_shifted_pixels_mask_long(p, dst_idx, bswapmask);
-	last = ~fb_shifted_pixels_mask_long(p, (dst_idx+n) % bits, bswapmask);
-
-	if (dst_idx+n <= bits) {
-		// Single word
-		if (last)
-			first &= last;
-		FB_WRITEL(comp(pat, FB_READL(dst), first), dst);
-	} else {
-		// Multiple destination words
-
-		// Leading bits
-		if (first!= ~0UL) {
-			FB_WRITEL(comp(pat, FB_READL(dst), first), dst);
-			dst++;
-			n -= bits - dst_idx;
-		}
-
-		// Main chunk
-		n /= bits;
-		while (n >= 8) {
-			FB_WRITEL(pat, dst++);
-			FB_WRITEL(pat, dst++);
-			FB_WRITEL(pat, dst++);
-			FB_WRITEL(pat, dst++);
-			FB_WRITEL(pat, dst++);
-			FB_WRITEL(pat, dst++);
-			FB_WRITEL(pat, dst++);
-			FB_WRITEL(pat, dst++);
-			n -= 8;
-		}
-		while (n--)
-			FB_WRITEL(pat, dst++);
-
-		// Trailing bits
-		if (last)
-			FB_WRITEL(comp(pat, FB_READL(dst), last), dst);
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
-bitfill_unaligned(struct fb_info *p, unsigned long __iomem *dst, int dst_idx,
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
-		// Single word
-		if (last)
-			first &= last;
-		FB_WRITEL(comp(pat, FB_READL(dst), first), dst);
-	} else {
-		// Multiple destination words
-		// Leading bits
-		if (first) {
-			FB_WRITEL(comp(pat, FB_READL(dst), first), dst);
-			dst++;
-			pat = pat << left | pat >> right;
-			n -= bits - dst_idx;
-		}
-
-		// Main chunk
-		n /= bits;
-		while (n >= 4) {
-			FB_WRITEL(pat, dst++);
-			pat = pat << left | pat >> right;
-			FB_WRITEL(pat, dst++);
-			pat = pat << left | pat >> right;
-			FB_WRITEL(pat, dst++);
-			pat = pat << left | pat >> right;
-			FB_WRITEL(pat, dst++);
-			pat = pat << left | pat >> right;
-			n -= 4;
-		}
-		while (n--) {
-			FB_WRITEL(pat, dst++);
-			pat = pat << left | pat >> right;
-		}
-
-		// Trailing bits
-		if (last)
-			FB_WRITEL(comp(pat, FB_READL(dst), last), dst);
-	}
-}
-
-    /*
-     *  Aligned pattern invert using 32/64-bit memory accesses
-     */
-static void
-bitfill_aligned_rev(struct fb_info *p, unsigned long __iomem *dst,
-		    int dst_idx, unsigned long pat, unsigned n, int bits,
-		    u32 bswapmask)
-{
-	unsigned long val = pat, dat;
-	unsigned long first, last;
-
-	if (!n)
-		return;
-
-	first = fb_shifted_pixels_mask_long(p, dst_idx, bswapmask);
-	last = ~fb_shifted_pixels_mask_long(p, (dst_idx+n) % bits, bswapmask);
-
-	if (dst_idx+n <= bits) {
-		// Single word
-		if (last)
-			first &= last;
-		dat = FB_READL(dst);
-		FB_WRITEL(comp(dat ^ val, dat, first), dst);
-	} else {
-		// Multiple destination words
-		// Leading bits
-		if (first!=0UL) {
-			dat = FB_READL(dst);
-			FB_WRITEL(comp(dat ^ val, dat, first), dst);
-			dst++;
-			n -= bits - dst_idx;
-		}
-
-		// Main chunk
-		n /= bits;
-		while (n >= 8) {
-			FB_WRITEL(FB_READL(dst) ^ val, dst);
-			dst++;
-			FB_WRITEL(FB_READL(dst) ^ val, dst);
-			dst++;
-			FB_WRITEL(FB_READL(dst) ^ val, dst);
-			dst++;
-			FB_WRITEL(FB_READL(dst) ^ val, dst);
-			dst++;
-			FB_WRITEL(FB_READL(dst) ^ val, dst);
-			dst++;
-			FB_WRITEL(FB_READL(dst) ^ val, dst);
-			dst++;
-			FB_WRITEL(FB_READL(dst) ^ val, dst);
-			dst++;
-			FB_WRITEL(FB_READL(dst) ^ val, dst);
-			dst++;
-			n -= 8;
-		}
-		while (n--) {
-			FB_WRITEL(FB_READL(dst) ^ val, dst);
-			dst++;
-		}
-		// Trailing bits
-		if (last) {
-			dat = FB_READL(dst);
-			FB_WRITEL(comp(dat ^ val, dat, last), dst);
-		}
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
-bitfill_unaligned_rev(struct fb_info *p, unsigned long __iomem *dst,
-		      int dst_idx, unsigned long pat, int left, int right,
-		      unsigned n, int bits)
-{
-	unsigned long first, last, dat;
-
-	if (!n)
-		return;
-
-	first = FB_SHIFT_HIGH(p, ~0UL, dst_idx);
-	last = ~(FB_SHIFT_HIGH(p, ~0UL, (dst_idx+n) % bits));
-
-	if (dst_idx+n <= bits) {
-		// Single word
-		if (last)
-			first &= last;
-		dat = FB_READL(dst);
-		FB_WRITEL(comp(dat ^ pat, dat, first), dst);
-	} else {
-		// Multiple destination words
-
-		// Leading bits
-		if (first != 0UL) {
-			dat = FB_READL(dst);
-			FB_WRITEL(comp(dat ^ pat, dat, first), dst);
-			dst++;
-			pat = pat << left | pat >> right;
-			n -= bits - dst_idx;
-		}
-
-		// Main chunk
-		n /= bits;
-		while (n >= 4) {
-			FB_WRITEL(FB_READL(dst) ^ pat, dst);
-			dst++;
-			pat = pat << left | pat >> right;
-			FB_WRITEL(FB_READL(dst) ^ pat, dst);
-			dst++;
-			pat = pat << left | pat >> right;
-			FB_WRITEL(FB_READL(dst) ^ pat, dst);
-			dst++;
-			pat = pat << left | pat >> right;
-			FB_WRITEL(FB_READL(dst) ^ pat, dst);
-			dst++;
-			pat = pat << left | pat >> right;
-			n -= 4;
-		}
-		while (n--) {
-			FB_WRITEL(FB_READL(dst) ^ pat, dst);
-			dst++;
-			pat = pat << left | pat >> right;
-		}
-
-		// Trailing bits
-		if (last) {
-			dat = FB_READL(dst);
-			FB_WRITEL(comp(dat ^ pat, dat, last), dst);
-		}
-	}
-}
-
-void cfb_fillrect(struct fb_info *p, const struct fb_fillrect *rect)
-{
-	unsigned long pat, pat2, fg;
-	unsigned long width = rect->width, height = rect->height;
-	int bits = BITS_PER_LONG, bytes = bits >> 3;
-	u32 bpp = p->var.bits_per_pixel;
-	unsigned long __iomem *dst;
-	int dst_idx, left;
-
-	if (p->state != FBINFO_STATE_RUNNING)
-		return;
-
-	if (p->flags & FBINFO_VIRTFB)
-		fb_warn_once(p, "Framebuffer is not in I/O address space.");
-
-	if (p->fix.visual == FB_VISUAL_TRUECOLOR ||
-	    p->fix.visual == FB_VISUAL_DIRECTCOLOR )
-		fg = ((u32 *) (p->pseudo_palette))[rect->color];
-	else
-		fg = rect->color;
-
-	pat = pixel_to_pat(bpp, fg);
-
-	dst = (unsigned long __iomem *)((unsigned long)p->screen_base & ~(bytes-1));
-	dst_idx = ((unsigned long)p->screen_base & (bytes - 1))*8;
-	dst_idx += rect->dy*p->fix.line_length*8+rect->dx*bpp;
-	/* FIXME For now we support 1-32 bpp only */
-	left = bits % bpp;
-	if (p->fbops->fb_sync)
-		p->fbops->fb_sync(p);
-	if (!left) {
-		u32 bswapmask = fb_compute_bswapmask(p);
-		void (*fill_op32)(struct fb_info *p,
-				  unsigned long __iomem *dst, int dst_idx,
-		                  unsigned long pat, unsigned n, int bits,
-				  u32 bswapmask) = NULL;
-
-		switch (rect->rop) {
-		case ROP_XOR:
-			fill_op32 = bitfill_aligned_rev;
-			break;
-		case ROP_COPY:
-			fill_op32 = bitfill_aligned;
-			break;
-		default:
-			printk( KERN_ERR "cfb_fillrect(): unknown rop, defaulting to ROP_COPY\n");
-			fill_op32 = bitfill_aligned;
-			break;
-		}
-		while (height--) {
-			dst += dst_idx >> (ffs(bits) - 1);
-			dst_idx &= (bits - 1);
-			fill_op32(p, dst, dst_idx, pat, width*bpp, bits,
-				  bswapmask);
-			dst_idx += p->fix.line_length*8;
-		}
-	} else {
-		int right, r;
-		void (*fill_op)(struct fb_info *p, unsigned long __iomem *dst,
-				int dst_idx, unsigned long pat, int left,
-				int right, unsigned n, int bits) = NULL;
-#ifdef __LITTLE_ENDIAN
-		right = left;
-		left = bpp - right;
+#  define FB_WRITEL       fb_writel
+#  define FB_READL        fb_readl
 #else
-		right = bpp - left;
+#  define FB_WRITEL       fb_writeq
+#  define FB_READL        fb_readq
 #endif
-		switch (rect->rop) {
-		case ROP_XOR:
-			fill_op = bitfill_unaligned_rev;
-			break;
-		case ROP_COPY:
-			fill_op = bitfill_unaligned;
-			break;
-		default:
-			printk(KERN_ERR "cfb_fillrect(): unknown rop, defaulting to ROP_COPY\n");
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
+#define FB_MEM            __iomem
+#define FB_FILLRECT       cfb_fillrect
+#define FB_FILLRECT_NAME  "cfb_fillrect"
+#define FB_SPACE          0
+#define FB_SPACE_NAME     "I/O"
+#define FB_SCREEN_BASE(a) ((a)->screen_base)
+#include "fb_fillrect.h"
 
 EXPORT_SYMBOL(cfb_fillrect);
 
-- 
2.30.2

