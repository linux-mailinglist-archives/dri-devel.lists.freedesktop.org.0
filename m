Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE30A2BE0E
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 09:32:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BD0210EA50;
	Fri,  7 Feb 2025 08:32:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from c64.rulez.org (c64.rulez.org [79.139.58.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47A6710E930
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 19:46:23 +0000 (UTC)
Received: by c64.rulez.org (Postfix, from userid 1000)
 id DE250100FA; Thu,  6 Feb 2025 20:46:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by c64.rulez.org (Postfix) with ESMTP id DD533100F6;
 Thu,  6 Feb 2025 20:46:21 +0100 (CET)
Date: Thu, 6 Feb 2025 20:46:21 +0100 (CET)
From: Zsolt Kajtar <soci@c64.rulez.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 01/13] fbdev: core: Copy cfbcopyarea to fb_copyarea
Message-ID: <c241f1e9-f94e-5013-2d1b-bbf3c379193e@c64.rulez.org>
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

fbdev: core: Copy cfbcopyarea to fb_copyarea

Signed-off-by: Zsolt Kajtar <soci@c64.rulez.org>
---
  drivers/video/fbdev/core/fb_copyarea.h | 439 +++++++++++++++++++++++++
  1 file changed, 439 insertions(+)
  create mode 100644 drivers/video/fbdev/core/fb_copyarea.h

diff --git a/drivers/video/fbdev/core/fb_copyarea.h b/drivers/video/fbdev/core/fb_copyarea.h
new file mode 100644
index 000000000..f266de119
--- /dev/null
+++ b/drivers/video/fbdev/core/fb_copyarea.h
@@ -0,0 +1,439 @@
+/*
+ *  Generic function for frame buffer with packed pixels of any depth.
+ *
+ *      Copyright (C)  1999-2005 James Simmons <jsimmons@www.infradead.org>
+ *
+ *  This file is subject to the terms and conditions of the GNU General Public
+ *  License.  See the file COPYING in the main directory of this archive for
+ *  more details.
+ *
+ * NOTES:
+ *
+ *  This is for cfb packed pixels. Iplan and such are incorporated in the
+ *  drivers that need them.
+ *
+ *  FIXME
+ *
+ *  Also need to add code to deal with cards endians that are different than
+ *  the native cpu endians. I also need to deal with MSB position in the word.
+ *
+ *  The two functions or copying forward and backward could be split up like
+ *  the ones for filling, i.e. in aligned and unaligned versions. This would
+ *  help moving some redundant computations and branches out of the loop, too.
+ */
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/string.h>
+#include <linux/fb.h>
+#include <asm/types.h>
+#include <asm/io.h>
+#include "fb_draw.h"
+
+#if BITS_PER_LONG == 32
+#  define FB_WRITEL fb_writel
+#  define FB_READL  fb_readl
+#else
+#  define FB_WRITEL fb_writeq
+#  define FB_READL  fb_readq
+#endif
+
+    /*
+     *  Generic bitwise copy algorithm
+     */
+
+static void
+bitcpy(struct fb_info *p, unsigned long __iomem *dst, unsigned dst_idx,
+                const unsigned long __iomem *src, unsigned src_idx, int bits,
+                unsigned n, u32 bswapmask)
+{
+        unsigned long first, last;
+        int const shift = dst_idx-src_idx;
+
+#if 0
+        /*
+         * If you suspect bug in this function, compare it with this simple
+         * memmove implementation.
+         */
+        memmove((char *)dst + ((dst_idx & (bits - 1))) / 8,
+                (char *)src + ((src_idx & (bits - 1))) / 8, n / 8);
+        return;
+#endif
+
+        first = fb_shifted_pixels_mask_long(p, dst_idx, bswapmask);
+        last = ~fb_shifted_pixels_mask_long(p, (dst_idx+n) % bits, bswapmask);
+
+        if (!shift) {
+                // Same alignment for source and dest
+
+                if (dst_idx+n <= bits) {
+                        // Single word
+                        if (last)
+                                first &= last;
+                        FB_WRITEL( comp( FB_READL(src), FB_READL(dst), first), dst);
+                } else {
+                        // Multiple destination words
+
+                        // Leading bits
+                        if (first != ~0UL) {
+                                FB_WRITEL( comp( FB_READL(src), FB_READL(dst), first), dst);
+                                dst++;
+                                src++;
+                                n -= bits - dst_idx;
+                        }
+
+                        // Main chunk
+                        n /= bits;
+                        while (n >= 8) {
+                                FB_WRITEL(FB_READL(src++), dst++);
+                                FB_WRITEL(FB_READL(src++), dst++);
+                                FB_WRITEL(FB_READL(src++), dst++);
+                                FB_WRITEL(FB_READL(src++), dst++);
+                                FB_WRITEL(FB_READL(src++), dst++);
+                                FB_WRITEL(FB_READL(src++), dst++);
+                                FB_WRITEL(FB_READL(src++), dst++);
+                                FB_WRITEL(FB_READL(src++), dst++);
+                                n -= 8;
+                        }
+                        while (n--)
+                                FB_WRITEL(FB_READL(src++), dst++);
+
+                        // Trailing bits
+                        if (last)
+                                FB_WRITEL( comp( FB_READL(src), FB_READL(dst), last), dst);
+                }
+        } else {
+                /* Different alignment for source and dest */
+                unsigned long d0, d1;
+                int m;
+
+                int const left = shift & (bits - 1);
+                int const right = -shift & (bits - 1);
+
+                if (dst_idx+n <= bits) {
+                        // Single destination word
+                        if (last)
+                                first &= last;
+                        d0 = FB_READL(src);
+                        d0 = fb_rev_pixels_in_long(d0, bswapmask);
+                        if (shift > 0) {
+                                // Single source word
+                                d0 <<= left;
+                        } else if (src_idx+n <= bits) {
+                                // Single source word
+                                d0 >>= right;
+                        } else {
+                                // 2 source words
+                                d1 = FB_READL(src + 1);
+                                d1 = fb_rev_pixels_in_long(d1, bswapmask);
+                                d0 = d0 >> right | d1 << left;
+                        }
+                        d0 = fb_rev_pixels_in_long(d0, bswapmask);
+                        FB_WRITEL(comp(d0, FB_READL(dst), first), dst);
+                } else {
+                        // Multiple destination words
+                        /** We must always remember the last value read, because in case
+                        SRC and DST overlap bitwise (e.g. when moving just one pixel in
+                        1bpp), we always collect one full long for DST and that might
+                        overlap with the current long from SRC. We store this value in
+                        'd0'. */
+                        d0 = FB_READL(src++);
+                        d0 = fb_rev_pixels_in_long(d0, bswapmask);
+                        // Leading bits
+                        if (shift > 0) {
+                                // Single source word
+                                d1 = d0;
+                                d0 <<= left;
+                                n -= bits - dst_idx;
+                        } else {
+                                // 2 source words
+                                d1 = FB_READL(src++);
+                                d1 = fb_rev_pixels_in_long(d1, bswapmask);
+
+                                d0 = d0 >> right | d1 << left;
+                                n -= bits - dst_idx;
+                        }
+                        d0 = fb_rev_pixels_in_long(d0, bswapmask);
+                        FB_WRITEL(comp(d0, FB_READL(dst), first), dst);
+                        d0 = d1;
+                        dst++;
+
+                        // Main chunk
+                        m = n % bits;
+                        n /= bits;
+                        while ((n >= 4) && !bswapmask) {
+                                d1 = FB_READL(src++);
+                                FB_WRITEL(d0 >> right | d1 << left, dst++);
+                                d0 = d1;
+                                d1 = FB_READL(src++);
+                                FB_WRITEL(d0 >> right | d1 << left, dst++);
+                                d0 = d1;
+                                d1 = FB_READL(src++);
+                                FB_WRITEL(d0 >> right | d1 << left, dst++);
+                                d0 = d1;
+                                d1 = FB_READL(src++);
+                                FB_WRITEL(d0 >> right | d1 << left, dst++);
+                                d0 = d1;
+                                n -= 4;
+                        }
+                        while (n--) {
+                                d1 = FB_READL(src++);
+                                d1 = fb_rev_pixels_in_long(d1, bswapmask);
+                                d0 = d0 >> right | d1 << left;
+                                d0 = fb_rev_pixels_in_long(d0, bswapmask);
+                                FB_WRITEL(d0, dst++);
+                                d0 = d1;
+                        }
+
+                        // Trailing bits
+                        if (m) {
+                                if (m <= bits - right) {
+                                        // Single source word
+                                        d0 >>= right;
+                                } else {
+                                        // 2 source words
+                                        d1 = FB_READL(src);
+                                        d1 = fb_rev_pixels_in_long(d1,
+                                                                bswapmask);
+                                        d0 = d0 >> right | d1 << left;
+                                }
+                                d0 = fb_rev_pixels_in_long(d0, bswapmask);
+                                FB_WRITEL(comp(d0, FB_READL(dst), last), dst);
+                        }
+                }
+        }
+}
+
+    /*
+     *  Generic bitwise copy algorithm, operating backward
+     */
+
+static void
+bitcpy_rev(struct fb_info *p, unsigned long __iomem *dst, unsigned dst_idx,
+                const unsigned long __iomem *src, unsigned src_idx, int bits,
+                unsigned n, u32 bswapmask)
+{
+        unsigned long first, last;
+        int shift;
+
+#if 0
+        /*
+         * If you suspect bug in this function, compare it with this simple
+         * memmove implementation.
+         */
+        memmove((char *)dst + ((dst_idx & (bits - 1))) / 8,
+                (char *)src + ((src_idx & (bits - 1))) / 8, n / 8);
+        return;
+#endif
+
+        dst += (dst_idx + n - 1) / bits;
+        src += (src_idx + n - 1) / bits;
+        dst_idx = (dst_idx + n - 1) % bits;
+        src_idx = (src_idx + n - 1) % bits;
+
+        shift = dst_idx-src_idx;
+
+        first = ~fb_shifted_pixels_mask_long(p, (dst_idx + 1) % bits, bswapmask);
+        last = fb_shifted_pixels_mask_long(p, (bits + dst_idx + 1 - n) % bits, bswapmask);
+
+        if (!shift) {
+                // Same alignment for source and dest
+
+                if ((unsigned long)dst_idx+1 >= n) {
+                        // Single word
+                        if (first)
+                                last &= first;
+                        FB_WRITEL( comp( FB_READL(src), FB_READL(dst), last), dst);
+                } else {
+                        // Multiple destination words
+
+                        // Leading bits
+                        if (first) {
+                                FB_WRITEL( comp( FB_READL(src), FB_READL(dst), first), dst);
+                                dst--;
+                                src--;
+                                n -= dst_idx+1;
+                        }
+
+                        // Main chunk
+                        n /= bits;
+                        while (n >= 8) {
+                                FB_WRITEL(FB_READL(src--), dst--);
+                                FB_WRITEL(FB_READL(src--), dst--);
+                                FB_WRITEL(FB_READL(src--), dst--);
+                                FB_WRITEL(FB_READL(src--), dst--);
+                                FB_WRITEL(FB_READL(src--), dst--);
+                                FB_WRITEL(FB_READL(src--), dst--);
+                                FB_WRITEL(FB_READL(src--), dst--);
+                                FB_WRITEL(FB_READL(src--), dst--);
+                                n -= 8;
+                        }
+                        while (n--)
+                                FB_WRITEL(FB_READL(src--), dst--);
+
+                        // Trailing bits
+                        if (last != -1UL)
+                                FB_WRITEL( comp( FB_READL(src), FB_READL(dst), last), dst);
+                }
+        } else {
+                // Different alignment for source and dest
+                unsigned long d0, d1;
+                int m;
+
+                int const left = shift & (bits-1);
+                int const right = -shift & (bits-1);
+
+                if ((unsigned long)dst_idx+1 >= n) {
+                        // Single destination word
+                        if (first)
+                                last &= first;
+                        d0 = FB_READL(src);
+                        if (shift < 0) {
+                                // Single source word
+                                d0 >>= right;
+                        } else if (1+(unsigned long)src_idx >= n) {
+                                // Single source word
+                                d0 <<= left;
+                        } else {
+                                // 2 source words
+                                d1 = FB_READL(src - 1);
+                                d1 = fb_rev_pixels_in_long(d1, bswapmask);
+                                d0 = d0 << left | d1 >> right;
+                        }
+                        d0 = fb_rev_pixels_in_long(d0, bswapmask);
+                        FB_WRITEL(comp(d0, FB_READL(dst), last), dst);
+                } else {
+                        // Multiple destination words
+                        /** We must always remember the last value read, because in case
+                        SRC and DST overlap bitwise (e.g. when moving just one pixel in
+                        1bpp), we always collect one full long for DST and that might
+                        overlap with the current long from SRC. We store this value in
+                        'd0'. */
+
+                        d0 = FB_READL(src--);
+                        d0 = fb_rev_pixels_in_long(d0, bswapmask);
+                        // Leading bits
+                        if (shift < 0) {
+                                // Single source word
+                                d1 = d0;
+                                d0 >>= right;
+                        } else {
+                                // 2 source words
+                                d1 = FB_READL(src--);
+                                d1 = fb_rev_pixels_in_long(d1, bswapmask);
+                                d0 = d0 << left | d1 >> right;
+                        }
+                        d0 = fb_rev_pixels_in_long(d0, bswapmask);
+                        if (!first)
+                                FB_WRITEL(d0, dst);
+                        else
+                                FB_WRITEL(comp(d0, FB_READL(dst), first), dst);
+                        d0 = d1;
+                        dst--;
+                        n -= dst_idx+1;
+
+                        // Main chunk
+                        m = n % bits;
+                        n /= bits;
+                        while ((n >= 4) && !bswapmask) {
+                                d1 = FB_READL(src--);
+                                FB_WRITEL(d0 << left | d1 >> right, dst--);
+                                d0 = d1;
+                                d1 = FB_READL(src--);
+                                FB_WRITEL(d0 << left | d1 >> right, dst--);
+                                d0 = d1;
+                                d1 = FB_READL(src--);
+                                FB_WRITEL(d0 << left | d1 >> right, dst--);
+                                d0 = d1;
+                                d1 = FB_READL(src--);
+                                FB_WRITEL(d0 << left | d1 >> right, dst--);
+                                d0 = d1;
+                                n -= 4;
+                        }
+                        while (n--) {
+                                d1 = FB_READL(src--);
+                                d1 = fb_rev_pixels_in_long(d1, bswapmask);
+                                d0 = d0 << left | d1 >> right;
+                                d0 = fb_rev_pixels_in_long(d0, bswapmask);
+                                FB_WRITEL(d0, dst--);
+                                d0 = d1;
+                        }
+
+                        // Trailing bits
+                        if (m) {
+                                if (m <= bits - left) {
+                                        // Single source word
+                                        d0 <<= left;
+                                } else {
+                                        // 2 source words
+                                        d1 = FB_READL(src);
+                                        d1 = fb_rev_pixels_in_long(d1,
+                                                                bswapmask);
+                                        d0 = d0 << left | d1 >> right;
+                                }
+                                d0 = fb_rev_pixels_in_long(d0, bswapmask);
+                                FB_WRITEL(comp(d0, FB_READL(dst), last), dst);
+                        }
+                }
+        }
+}
+
+void cfb_copyarea(struct fb_info *p, const struct fb_copyarea *area)
+{
+        u32 dx = area->dx, dy = area->dy, sx = area->sx, sy = area->sy;
+        u32 height = area->height, width = area->width;
+        unsigned int const bits_per_line = p->fix.line_length * 8u;
+        unsigned long __iomem *base = NULL;
+        int bits = BITS_PER_LONG, bytes = bits >> 3;
+        unsigned dst_idx = 0, src_idx = 0, rev_copy = 0;
+        u32 bswapmask = fb_compute_bswapmask(p);
+
+        if (p->state != FBINFO_STATE_RUNNING)
+                return;
+
+        if (p->flags & FBINFO_VIRTFB)
+                fb_warn_once(p, "Framebuffer is not in I/O address space.");
+
+        /* if the beginning of the target area might overlap with the end of
+        the source area, be have to copy the area reverse. */
+        if ((dy == sy && dx > sx) || (dy > sy)) {
+                dy += height;
+                sy += height;
+                rev_copy = 1;
+        }
+
+        // split the base of the framebuffer into a long-aligned address and the
+        // index of the first bit
+        base = (unsigned long __iomem *)((unsigned long)p->screen_base & ~(bytes-1));
+        dst_idx = src_idx = 8*((unsigned long)p->screen_base & (bytes-1));
+        // add offset of source and target area
+        dst_idx += dy*bits_per_line + dx*p->var.bits_per_pixel;
+        src_idx += sy*bits_per_line + sx*p->var.bits_per_pixel;
+
+        if (p->fbops->fb_sync)
+                p->fbops->fb_sync(p);
+
+        if (rev_copy) {
+                while (height--) {
+                        dst_idx -= bits_per_line;
+                        src_idx -= bits_per_line;
+                        bitcpy_rev(p, base + (dst_idx / bits), dst_idx % bits,
+                                base + (src_idx / bits), src_idx % bits, bits,
+                                width*p->var.bits_per_pixel, bswapmask);
+                }
+        } else {
+                while (height--) {
+                        bitcpy(p, base + (dst_idx / bits), dst_idx % bits,
+                                base + (src_idx / bits), src_idx % bits, bits,
+                                width*p->var.bits_per_pixel, bswapmask);
+                        dst_idx += bits_per_line;
+                        src_idx += bits_per_line;
+                }
+        }
+}
+
+EXPORT_SYMBOL(cfb_copyarea);
+
+MODULE_AUTHOR("James Simmons <jsimmons@users.sf.net>");
+MODULE_DESCRIPTION("Generic software accelerated copyarea");
+MODULE_LICENSE("GPL");
-- 
2.30.2

