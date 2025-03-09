Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C35A5875F
	for <lists+dri-devel@lfdr.de>; Sun,  9 Mar 2025 19:54:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6224710E2C0;
	Sun,  9 Mar 2025 18:54:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from c64.rulez.org (c64.rulez.org [79.139.58.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCAFD10E2C0
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Mar 2025 18:54:22 +0000 (UTC)
Received: by c64.rulez.org (Postfix, from userid 1000)
 id 515821003B; Sun,  9 Mar 2025 19:54:09 +0100 (CET)
From: Zsolt Kajtar <soci@c64.rulez.org>
To: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: Zsolt Kajtar <soci@c64.rulez.org>
Subject: [PATCH RESEND 1/2] Refactoring the fbcon packed pixel drawing routines
Date: Sun,  9 Mar 2025 19:47:15 +0100
Message-Id: <20250309184716.13732-2-soci@c64.rulez.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250309184716.13732-1-soci@c64.rulez.org>
References: <20250309184716.13732-1-soci@c64.rulez.org>
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

The original version duplicated more or less the same algorithms for
both system and i/o memory.

In this version the drawing algorithms (copy/fill/blit) are separate
from the memory access (system and i/o). The two parts are getting
combined in the loadable module sources. This also makes it more robust
against wrong memory access type or alignment mistakes as there's no
direct pointer access or arithmetic in the algorithm sources anymore.

Due to liberal use of inlining the compiled result is a single function
in all 6 cases, without unnecessary function calls. Unlike earlier the
use of macros could be minimized as apparently both gcc and clang is
capable now to do the same with inline functions just as well.

What wasn't quite the same in the two variants is the support for pixel
order reversing. This version is capable to do that for both system and
I/O memory, and not only for the latter. As demand for low bits per
pixel modes isn't high there's a configuration option to enable this
separately for the CFB and SYS modules.

The pixel reversing algorithm is different than earlier and was designed
so that it can take advantage of bit order reversing instructions on
architectures which have them. And even for higher bits per pixel modes
like four bpp.

One of the shortcomings of the earlier version was the incomplete
support for foreign endian framebuffers. Now all three drawing
algorithms produce correct output on both endians with native and
foreign framebuffers. This is one of the important differences even if
otherwise the algorithms don't look too different than before.

All three routines work now with aligned native word accesses. As a
consequence blitting isn't limited to 32 bits on 64 bit architectures as
it was before.

The old routines silently assumed that rows are a multiple of the word
size. Due to how the new routines function this isn't a requirement any
more and access will be done aligned regardless. However if the
framebuffer is configured like that then some of the fast paths won't be
available.

As this code is supposed to be running on all supported architectures it
wasn't optimized for a particular one. That doesn't mean I haven't
looked at the disassembly. That's where I noticed that it isn't a good
idea to use the fallback bitreversing code for example.

The low bits per pixel modes should be faster than before as the new
routines can blit 4 pixels at a time.

On the higher bits per pixel modes I retained the specialized aligned
routines so it should be more or less the same, except on 64 bit
architectures. There the blitting word size is double now which means 32
BPP isn't done a single pixel a time now.

The code was tested on x86, amd64, mips32 and mips64. The latter two in
big endian configuration. Originally thought I can get away with the
first two, but with such bit twisting code byte ordering is tricky and
not really possible to get right without actually verifying it.

While writing such routines isn't rocket science a lot of time was spent
on making sure that pixel ordering, foreign byte order, various bits per
pixels, cpu endianness and word size will give the expected result in
all sorts of combinations without making it overly complicated or full
with special cases.

Signed-off-by: Zsolt Kajtar <soci@c64.rulez.org>
---
 drivers/video/fbdev/core/Kconfig        |  10 +-
 drivers/video/fbdev/core/cfbcopyarea.c  | 428 +-------------------
 drivers/video/fbdev/core/cfbfillrect.c  | 362 +----------------
 drivers/video/fbdev/core/cfbimgblt.c    | 357 +----------------
 drivers/video/fbdev/core/cfbmem.h       |  43 ++
 drivers/video/fbdev/core/fb_copyarea.h  | 405 +++++++++++++++++++
 drivers/video/fbdev/core/fb_draw.h      | 274 ++++++-------
 drivers/video/fbdev/core/fb_fillrect.h  | 280 ++++++++++++++
 drivers/video/fbdev/core/fb_imageblit.h | 495 ++++++++++++++++++++++++
 drivers/video/fbdev/core/syscopyarea.c  | 369 +-----------------
 drivers/video/fbdev/core/sysfillrect.c  | 324 +---------------
 drivers/video/fbdev/core/sysimgblt.c    | 333 +---------------
 drivers/video/fbdev/core/sysmem.h       |  39 ++
 13 files changed, 1464 insertions(+), 2255 deletions(-)
 create mode 100644 drivers/video/fbdev/core/cfbmem.h
 create mode 100644 drivers/video/fbdev/core/fb_copyarea.h
 create mode 100644 drivers/video/fbdev/core/fb_fillrect.h
 create mode 100644 drivers/video/fbdev/core/fb_imageblit.h
 create mode 100644 drivers/video/fbdev/core/sysmem.h

diff --git a/drivers/video/fbdev/core/Kconfig b/drivers/video/fbdev/core/Kconfig
index d554d8c54..4abe12db7 100644
--- a/drivers/video/fbdev/core/Kconfig
+++ b/drivers/video/fbdev/core/Kconfig
@@ -69,7 +69,7 @@ config FB_CFB_REV_PIXELS_IN_BYTE
 	bool
 	depends on FB_CORE
 	help
-	  Allow generic frame-buffer functions to work on displays with 1, 2
+	  Allow I/O memory frame-buffer functions to work on displays with 1, 2
 	  and 4 bits per pixel depths which has opposite order of pixels in
 	  byte order to bytes in long order.
 
@@ -97,6 +97,14 @@ config FB_SYS_IMAGEBLIT
 	  blitting. This is used by drivers that don't provide their own
 	  (accelerated) version and the framebuffer is in system RAM.
 
+config FB_SYS_REV_PIXELS_IN_BYTE
+	bool
+	depends on FB_CORE
+	help
+	  Allow virtual memory frame-buffer functions to work on displays with 1, 2
+	  and 4 bits per pixel depths which has opposite order of pixels in
+	  byte order to bytes in long order.
+
 config FB_PROVIDE_GET_FB_UNMAPPED_AREA
 	bool
 	depends on FB
diff --git a/drivers/video/fbdev/core/cfbcopyarea.c b/drivers/video/fbdev/core/cfbcopyarea.c
index a271f57d9..23fbf3a8d 100644
--- a/drivers/video/fbdev/core/cfbcopyarea.c
+++ b/drivers/video/fbdev/core/cfbcopyarea.c
@@ -1,440 +1,34 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
- *  Generic function for frame buffer with packed pixels of any depth.
- *
- *      Copyright (C)  1999-2005 James Simmons <jsimmons@www.infradead.org>
- *
- *  This file is subject to the terms and conditions of the GNU General Public
- *  License.  See the file COPYING in the main directory of this archive for
- *  more details.
- *
- * NOTES:
- *
- *  This is for cfb packed pixels. Iplan and such are incorporated in the
- *  drivers that need them.
- *
- *  FIXME
- *
- *  Also need to add code to deal with cards endians that are different than
- *  the native cpu endians. I also need to deal with MSB position in the word.
- *
- *  The two functions or copying forward and backward could be split up like
- *  the ones for filling, i.e. in aligned and unaligned versions. This would
- *  help moving some redundant computations and branches out of the loop, too.
+ *	Copyright (C)  2025 Zsolt Kajtar (soci@c64.rulez.org)
  */
-
 #include <linux/module.h>
-#include <linux/kernel.h>
-#include <linux/string.h>
 #include <linux/fb.h>
+#include <linux/bitrev.h>
 #include <asm/types.h>
-#include <asm/io.h>
-#include "fb_draw.h"
-
-#if BITS_PER_LONG == 32
-#  define FB_WRITEL fb_writel
-#  define FB_READL  fb_readl
-#else
-#  define FB_WRITEL fb_writeq
-#  define FB_READL  fb_readq
-#endif
-
-    /*
-     *  Generic bitwise copy algorithm
-     */
-
-static void
-bitcpy(struct fb_info *p, unsigned long __iomem *dst, unsigned dst_idx,
-		const unsigned long __iomem *src, unsigned src_idx, int bits,
-		unsigned n, u32 bswapmask)
-{
-	unsigned long first, last;
-	int const shift = dst_idx-src_idx;
 
-#if 0
-	/*
-	 * If you suspect bug in this function, compare it with this simple
-	 * memmove implementation.
-	 */
-	memmove((char *)dst + ((dst_idx & (bits - 1))) / 8,
-		(char *)src + ((src_idx & (bits - 1))) / 8, n / 8);
-	return;
+#ifdef CONFIG_FB_CFB_REV_PIXELS_IN_BYTE
+#define FB_REV_PIXELS_IN_BYTE
 #endif
 
-	first = fb_shifted_pixels_mask_long(p, dst_idx, bswapmask);
-	last = ~fb_shifted_pixels_mask_long(p, (dst_idx+n) % bits, bswapmask);
-
-	if (!shift) {
-		// Same alignment for source and dest
-
-		if (dst_idx+n <= bits) {
-			// Single word
-			if (last)
-				first &= last;
-			FB_WRITEL( comp( FB_READL(src), FB_READL(dst), first), dst);
-		} else {
-			// Multiple destination words
-
-			// Leading bits
-			if (first != ~0UL) {
-				FB_WRITEL( comp( FB_READL(src), FB_READL(dst), first), dst);
-				dst++;
-				src++;
-				n -= bits - dst_idx;
-			}
-
-			// Main chunk
-			n /= bits;
-			while (n >= 8) {
-				FB_WRITEL(FB_READL(src++), dst++);
-				FB_WRITEL(FB_READL(src++), dst++);
-				FB_WRITEL(FB_READL(src++), dst++);
-				FB_WRITEL(FB_READL(src++), dst++);
-				FB_WRITEL(FB_READL(src++), dst++);
-				FB_WRITEL(FB_READL(src++), dst++);
-				FB_WRITEL(FB_READL(src++), dst++);
-				FB_WRITEL(FB_READL(src++), dst++);
-				n -= 8;
-			}
-			while (n--)
-				FB_WRITEL(FB_READL(src++), dst++);
-
-			// Trailing bits
-			if (last)
-				FB_WRITEL( comp( FB_READL(src), FB_READL(dst), last), dst);
-		}
-	} else {
-		/* Different alignment for source and dest */
-		unsigned long d0, d1;
-		int m;
-
-		int const left = shift & (bits - 1);
-		int const right = -shift & (bits - 1);
-
-		if (dst_idx+n <= bits) {
-			// Single destination word
-			if (last)
-				first &= last;
-			d0 = FB_READL(src);
-			d0 = fb_rev_pixels_in_long(d0, bswapmask);
-			if (shift > 0) {
-				// Single source word
-				d0 <<= left;
-			} else if (src_idx+n <= bits) {
-				// Single source word
-				d0 >>= right;
-			} else {
-				// 2 source words
-				d1 = FB_READL(src + 1);
-				d1 = fb_rev_pixels_in_long(d1, bswapmask);
-				d0 = d0 >> right | d1 << left;
-			}
-			d0 = fb_rev_pixels_in_long(d0, bswapmask);
-			FB_WRITEL(comp(d0, FB_READL(dst), first), dst);
-		} else {
-			// Multiple destination words
-			/** We must always remember the last value read, because in case
-			SRC and DST overlap bitwise (e.g. when moving just one pixel in
-			1bpp), we always collect one full long for DST and that might
-			overlap with the current long from SRC. We store this value in
-			'd0'. */
-			d0 = FB_READL(src++);
-			d0 = fb_rev_pixels_in_long(d0, bswapmask);
-			// Leading bits
-			if (shift > 0) {
-				// Single source word
-				d1 = d0;
-				d0 <<= left;
-				n -= bits - dst_idx;
-			} else {
-				// 2 source words
-				d1 = FB_READL(src++);
-				d1 = fb_rev_pixels_in_long(d1, bswapmask);
-
-				d0 = d0 >> right | d1 << left;
-				n -= bits - dst_idx;
-			}
-			d0 = fb_rev_pixels_in_long(d0, bswapmask);
-			FB_WRITEL(comp(d0, FB_READL(dst), first), dst);
-			d0 = d1;
-			dst++;
-
-			// Main chunk
-			m = n % bits;
-			n /= bits;
-			while ((n >= 4) && !bswapmask) {
-				d1 = FB_READL(src++);
-				FB_WRITEL(d0 >> right | d1 << left, dst++);
-				d0 = d1;
-				d1 = FB_READL(src++);
-				FB_WRITEL(d0 >> right | d1 << left, dst++);
-				d0 = d1;
-				d1 = FB_READL(src++);
-				FB_WRITEL(d0 >> right | d1 << left, dst++);
-				d0 = d1;
-				d1 = FB_READL(src++);
-				FB_WRITEL(d0 >> right | d1 << left, dst++);
-				d0 = d1;
-				n -= 4;
-			}
-			while (n--) {
-				d1 = FB_READL(src++);
-				d1 = fb_rev_pixels_in_long(d1, bswapmask);
-				d0 = d0 >> right | d1 << left;
-				d0 = fb_rev_pixels_in_long(d0, bswapmask);
-				FB_WRITEL(d0, dst++);
-				d0 = d1;
-			}
-
-			// Trailing bits
-			if (m) {
-				if (m <= bits - right) {
-					// Single source word
-					d0 >>= right;
-				} else {
-					// 2 source words
-					d1 = FB_READL(src);
-					d1 = fb_rev_pixels_in_long(d1,
-								bswapmask);
-					d0 = d0 >> right | d1 << left;
-				}
-				d0 = fb_rev_pixels_in_long(d0, bswapmask);
-				FB_WRITEL(comp(d0, FB_READL(dst), last), dst);
-			}
-		}
-	}
-}
-
-    /*
-     *  Generic bitwise copy algorithm, operating backward
-     */
-
-static void
-bitcpy_rev(struct fb_info *p, unsigned long __iomem *dst, unsigned dst_idx,
-		const unsigned long __iomem *src, unsigned src_idx, int bits,
-		unsigned n, u32 bswapmask)
-{
-	unsigned long first, last;
-	int shift;
-
-#if 0
-	/*
-	 * If you suspect bug in this function, compare it with this simple
-	 * memmove implementation.
-	 */
-	memmove((char *)dst + ((dst_idx & (bits - 1))) / 8,
-		(char *)src + ((src_idx & (bits - 1))) / 8, n / 8);
-	return;
-#endif
-
-	dst += (dst_idx + n - 1) / bits;
-	src += (src_idx + n - 1) / bits;
-	dst_idx = (dst_idx + n - 1) % bits;
-	src_idx = (src_idx + n - 1) % bits;
-
-	shift = dst_idx-src_idx;
-
-	first = ~fb_shifted_pixels_mask_long(p, (dst_idx + 1) % bits, bswapmask);
-	last = fb_shifted_pixels_mask_long(p, (bits + dst_idx + 1 - n) % bits, bswapmask);
-
-	if (!shift) {
-		// Same alignment for source and dest
-
-		if ((unsigned long)dst_idx+1 >= n) {
-			// Single word
-			if (first)
-				last &= first;
-			FB_WRITEL( comp( FB_READL(src), FB_READL(dst), last), dst);
-		} else {
-			// Multiple destination words
-
-			// Leading bits
-			if (first) {
-				FB_WRITEL( comp( FB_READL(src), FB_READL(dst), first), dst);
-				dst--;
-				src--;
-				n -= dst_idx+1;
-			}
-
-			// Main chunk
-			n /= bits;
-			while (n >= 8) {
-				FB_WRITEL(FB_READL(src--), dst--);
-				FB_WRITEL(FB_READL(src--), dst--);
-				FB_WRITEL(FB_READL(src--), dst--);
-				FB_WRITEL(FB_READL(src--), dst--);
-				FB_WRITEL(FB_READL(src--), dst--);
-				FB_WRITEL(FB_READL(src--), dst--);
-				FB_WRITEL(FB_READL(src--), dst--);
-				FB_WRITEL(FB_READL(src--), dst--);
-				n -= 8;
-			}
-			while (n--)
-				FB_WRITEL(FB_READL(src--), dst--);
-
-			// Trailing bits
-			if (last != -1UL)
-				FB_WRITEL( comp( FB_READL(src), FB_READL(dst), last), dst);
-		}
-	} else {
-		// Different alignment for source and dest
-		unsigned long d0, d1;
-		int m;
-
-		int const left = shift & (bits-1);
-		int const right = -shift & (bits-1);
-
-		if ((unsigned long)dst_idx+1 >= n) {
-			// Single destination word
-			if (first)
-				last &= first;
-			d0 = FB_READL(src);
-			if (shift < 0) {
-				// Single source word
-				d0 >>= right;
-			} else if (1+(unsigned long)src_idx >= n) {
-				// Single source word
-				d0 <<= left;
-			} else {
-				// 2 source words
-				d1 = FB_READL(src - 1);
-				d1 = fb_rev_pixels_in_long(d1, bswapmask);
-				d0 = d0 << left | d1 >> right;
-			}
-			d0 = fb_rev_pixels_in_long(d0, bswapmask);
-			FB_WRITEL(comp(d0, FB_READL(dst), last), dst);
-		} else {
-			// Multiple destination words
-			/** We must always remember the last value read, because in case
-			SRC and DST overlap bitwise (e.g. when moving just one pixel in
-			1bpp), we always collect one full long for DST and that might
-			overlap with the current long from SRC. We store this value in
-			'd0'. */
-
-			d0 = FB_READL(src--);
-			d0 = fb_rev_pixels_in_long(d0, bswapmask);
-			// Leading bits
-			if (shift < 0) {
-				// Single source word
-				d1 = d0;
-				d0 >>= right;
-			} else {
-				// 2 source words
-				d1 = FB_READL(src--);
-				d1 = fb_rev_pixels_in_long(d1, bswapmask);
-				d0 = d0 << left | d1 >> right;
-			}
-			d0 = fb_rev_pixels_in_long(d0, bswapmask);
-			if (!first)
-				FB_WRITEL(d0, dst);
-			else
-				FB_WRITEL(comp(d0, FB_READL(dst), first), dst);
-			d0 = d1;
-			dst--;
-			n -= dst_idx+1;
-
-			// Main chunk
-			m = n % bits;
-			n /= bits;
-			while ((n >= 4) && !bswapmask) {
-				d1 = FB_READL(src--);
-				FB_WRITEL(d0 << left | d1 >> right, dst--);
-				d0 = d1;
-				d1 = FB_READL(src--);
-				FB_WRITEL(d0 << left | d1 >> right, dst--);
-				d0 = d1;
-				d1 = FB_READL(src--);
-				FB_WRITEL(d0 << left | d1 >> right, dst--);
-				d0 = d1;
-				d1 = FB_READL(src--);
-				FB_WRITEL(d0 << left | d1 >> right, dst--);
-				d0 = d1;
-				n -= 4;
-			}
-			while (n--) {
-				d1 = FB_READL(src--);
-				d1 = fb_rev_pixels_in_long(d1, bswapmask);
-				d0 = d0 << left | d1 >> right;
-				d0 = fb_rev_pixels_in_long(d0, bswapmask);
-				FB_WRITEL(d0, dst--);
-				d0 = d1;
-			}
-
-			// Trailing bits
-			if (m) {
-				if (m <= bits - left) {
-					// Single source word
-					d0 <<= left;
-				} else {
-					// 2 source words
-					d1 = FB_READL(src);
-					d1 = fb_rev_pixels_in_long(d1,
-								bswapmask);
-					d0 = d0 << left | d1 >> right;
-				}
-				d0 = fb_rev_pixels_in_long(d0, bswapmask);
-				FB_WRITEL(comp(d0, FB_READL(dst), last), dst);
-			}
-		}
-	}
-}
+#include "cfbmem.h"
+#include "fb_copyarea.h"
 
 void cfb_copyarea(struct fb_info *p, const struct fb_copyarea *area)
 {
-	u32 dx = area->dx, dy = area->dy, sx = area->sx, sy = area->sy;
-	u32 height = area->height, width = area->width;
-	unsigned int const bits_per_line = p->fix.line_length * 8u;
-	unsigned long __iomem *base = NULL;
-	int bits = BITS_PER_LONG, bytes = bits >> 3;
-	unsigned dst_idx = 0, src_idx = 0, rev_copy = 0;
-	u32 bswapmask = fb_compute_bswapmask(p);
-
 	if (p->state != FBINFO_STATE_RUNNING)
 		return;
 
 	if (p->flags & FBINFO_VIRTFB)
-		fb_warn_once(p, "Framebuffer is not in I/O address space.");
-
-	/* if the beginning of the target area might overlap with the end of
-	the source area, be have to copy the area reverse. */
-	if ((dy == sy && dx > sx) || (dy > sy)) {
-		dy += height;
-		sy += height;
-		rev_copy = 1;
-	}
-
-	// split the base of the framebuffer into a long-aligned address and the
-	// index of the first bit
-	base = (unsigned long __iomem *)((unsigned long)p->screen_base & ~(bytes-1));
-	dst_idx = src_idx = 8*((unsigned long)p->screen_base & (bytes-1));
-	// add offset of source and target area
-	dst_idx += dy*bits_per_line + dx*p->var.bits_per_pixel;
-	src_idx += sy*bits_per_line + sx*p->var.bits_per_pixel;
+		fb_warn_once(p, "%s: framebuffer is not in I/O address space.\n", __func__);
 
 	if (p->fbops->fb_sync)
 		p->fbops->fb_sync(p);
 
-	if (rev_copy) {
-		while (height--) {
-			dst_idx -= bits_per_line;
-			src_idx -= bits_per_line;
-			bitcpy_rev(p, base + (dst_idx / bits), dst_idx % bits,
-				base + (src_idx / bits), src_idx % bits, bits,
-				width*p->var.bits_per_pixel, bswapmask);
-		}
-	} else {
-		while (height--) {
-			bitcpy(p, base + (dst_idx / bits), dst_idx % bits,
-				base + (src_idx / bits), src_idx % bits, bits,
-				width*p->var.bits_per_pixel, bswapmask);
-			dst_idx += bits_per_line;
-			src_idx += bits_per_line;
-		}
-	}
+	fb_copyarea(p, area);
 }
-
 EXPORT_SYMBOL(cfb_copyarea);
 
-MODULE_AUTHOR("James Simmons <jsimmons@users.sf.net>");
-MODULE_DESCRIPTION("Generic software accelerated copyarea");
+MODULE_AUTHOR("Zsolt Kajtar <soci@c64.rulez.org>");
+MODULE_DESCRIPTION("I/O memory packed pixel framebuffer area copy");
 MODULE_LICENSE("GPL");
-
diff --git a/drivers/video/fbdev/core/cfbfillrect.c b/drivers/video/fbdev/core/cfbfillrect.c
index cbaa4c9e2..615de8925 100644
--- a/drivers/video/fbdev/core/cfbfillrect.c
+++ b/drivers/video/fbdev/core/cfbfillrect.c
@@ -1,374 +1,34 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
- *  Generic fillrect for frame buffers with packed pixels of any depth.
- *
- *      Copyright (C)  2000 James Simmons (jsimmons@linux-fbdev.org)
- *
- *  This file is subject to the terms and conditions of the GNU General Public
- *  License.  See the file COPYING in the main directory of this archive for
- *  more details.
- *
- * NOTES:
- *
- *  Also need to add code to deal with cards endians that are different than
- *  the native cpu endians. I also need to deal with MSB position in the word.
- *
+ *	Copyright (C)  2025 Zsolt Kajtar (soci@c64.rulez.org)
  */
 #include <linux/module.h>
-#include <linux/string.h>
 #include <linux/fb.h>
+#include <linux/bitrev.h>
 #include <asm/types.h>
-#include "fb_draw.h"
 
-#if BITS_PER_LONG == 32
-#  define FB_WRITEL fb_writel
-#  define FB_READL  fb_readl
-#else
-#  define FB_WRITEL fb_writeq
-#  define FB_READL  fb_readq
+#ifdef CONFIG_FB_CFB_REV_PIXELS_IN_BYTE
+#define FB_REV_PIXELS_IN_BYTE
 #endif
 
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
+#include "cfbmem.h"
+#include "fb_fillrect.h"
 
 void cfb_fillrect(struct fb_info *p, const struct fb_fillrect *rect)
 {
-	unsigned long pat, pat2, fg;
-	unsigned long width = rect->width, height = rect->height;
-	int bits = BITS_PER_LONG, bytes = bits >> 3;
-	u32 bpp = p->var.bits_per_pixel;
-	unsigned long __iomem *dst;
-	int dst_idx, left;
-
 	if (p->state != FBINFO_STATE_RUNNING)
 		return;
 
 	if (p->flags & FBINFO_VIRTFB)
-		fb_warn_once(p, "Framebuffer is not in I/O address space.");
-
-	if (p->fix.visual == FB_VISUAL_TRUECOLOR ||
-	    p->fix.visual == FB_VISUAL_DIRECTCOLOR )
-		fg = ((u32 *) (p->pseudo_palette))[rect->color];
-	else
-		fg = rect->color;
-
-	pat = pixel_to_pat(bpp, fg);
+		fb_warn_once(p, "%s: framebuffer is not in I/O address space.\n", __func__);
 
-	dst = (unsigned long __iomem *)((unsigned long)p->screen_base & ~(bytes-1));
-	dst_idx = ((unsigned long)p->screen_base & (bytes - 1))*8;
-	dst_idx += rect->dy*p->fix.line_length*8+rect->dx*bpp;
-	/* FIXME For now we support 1-32 bpp only */
-	left = bits % bpp;
 	if (p->fbops->fb_sync)
 		p->fbops->fb_sync(p);
-	if (!left) {
-		u32 bswapmask = fb_compute_bswapmask(p);
-		void (*fill_op32)(struct fb_info *p,
-				  unsigned long __iomem *dst, int dst_idx,
-		                  unsigned long pat, unsigned n, int bits,
-				  u32 bswapmask) = NULL;
 
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
+	fb_fillrect(p, rect);
 }
-
 EXPORT_SYMBOL(cfb_fillrect);
 
-MODULE_AUTHOR("James Simmons <jsimmons@users.sf.net>");
-MODULE_DESCRIPTION("Generic software accelerated fill rectangle");
+MODULE_AUTHOR("Zsolt Kajtar <soci@c64.rulez.org>");
+MODULE_DESCRIPTION("I/O memory packed pixel framebuffer area fill");
 MODULE_LICENSE("GPL");
diff --git a/drivers/video/fbdev/core/cfbimgblt.c b/drivers/video/fbdev/core/cfbimgblt.c
index 7d1d2f1a6..bcec4e32c 100644
--- a/drivers/video/fbdev/core/cfbimgblt.c
+++ b/drivers/video/fbdev/core/cfbimgblt.c
@@ -1,369 +1,34 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
- *  Generic BitBLT function for frame buffer with packed pixels of any depth.
- *
- *      Copyright (C)  June 1999 James Simmons
- *
- *  This file is subject to the terms and conditions of the GNU General Public
- *  License.  See the file COPYING in the main directory of this archive for
- *  more details.
- *
- * NOTES:
- *
- *    This function copys a image from system memory to video memory. The
- *  image can be a bitmap where each 0 represents the background color and
- *  each 1 represents the foreground color. Great for font handling. It can
- *  also be a color image. This is determined by image_depth. The color image
- *  must be laid out exactly in the same format as the framebuffer. Yes I know
- *  their are cards with hardware that coverts images of various depths to the
- *  framebuffer depth. But not every card has this. All images must be rounded
- *  up to the nearest byte. For example a bitmap 12 bits wide must be two
- *  bytes width.
- *
- *  Tony:
- *  Incorporate mask tables similar to fbcon-cfb*.c in 2.4 API.  This speeds
- *  up the code significantly.
- *
- *  Code for depths not multiples of BITS_PER_LONG is still kludgy, which is
- *  still processed a bit at a time.
- *
- *  Also need to add code to deal with cards endians that are different than
- *  the native cpu endians. I also need to deal with MSB position in the word.
+ *	Copyright (C)  2025 Zsolt Kajtar (soci@c64.rulez.org)
  */
 #include <linux/module.h>
-#include <linux/string.h>
 #include <linux/fb.h>
+#include <linux/bitrev.h>
 #include <asm/types.h>
-#include "fb_draw.h"
 
-#define DEBUG
-
-#ifdef DEBUG
-#define DPRINTK(fmt, args...) printk(KERN_DEBUG "%s: " fmt,__func__,## args)
-#else
-#define DPRINTK(fmt, args...)
+#ifdef CONFIG_FB_CFB_REV_PIXELS_IN_BYTE
+#define FB_REV_PIXELS_IN_BYTE
 #endif
 
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
-#define FB_WRITEL fb_writel
-#define FB_READL  fb_readl
-
-static inline void color_imageblit(const struct fb_image *image,
-				   struct fb_info *p, u8 __iomem *dst1,
-				   u32 start_index,
-				   u32 pitch_index)
-{
-	/* Draw the penguin */
-	u32 __iomem *dst, *dst2;
-	u32 color = 0, val, shift;
-	int i, n, bpp = p->var.bits_per_pixel;
-	u32 null_bits = 32 - bpp;
-	u32 *palette = (u32 *) p->pseudo_palette;
-	const u8 *src = image->data;
-	u32 bswapmask = fb_compute_bswapmask(p);
-
-	dst2 = (u32 __iomem *) dst1;
-	for (i = image->height; i--; ) {
-		n = image->width;
-		dst = (u32 __iomem *) dst1;
-		shift = 0;
-		val = 0;
-
-		if (start_index) {
-			u32 start_mask = ~fb_shifted_pixels_mask_u32(p,
-						start_index, bswapmask);
-			val = FB_READL(dst) & start_mask;
-			shift = start_index;
-		}
-		while (n--) {
-			if (p->fix.visual == FB_VISUAL_TRUECOLOR ||
-			    p->fix.visual == FB_VISUAL_DIRECTCOLOR )
-				color = palette[*src];
-			else
-				color = *src;
-			color <<= FB_LEFT_POS(p, bpp);
-			val |= FB_SHIFT_HIGH(p, color, shift ^ bswapmask);
-			if (shift >= null_bits) {
-				FB_WRITEL(val, dst++);
-
-				val = (shift == null_bits) ? 0 :
-					FB_SHIFT_LOW(p, color, 32 - shift);
-			}
-			shift += bpp;
-			shift &= (32 - 1);
-			src++;
-		}
-		if (shift) {
-			u32 end_mask = fb_shifted_pixels_mask_u32(p, shift,
-						bswapmask);
-
-			FB_WRITEL((FB_READL(dst) & end_mask) | val, dst);
-		}
-		dst1 += p->fix.line_length;
-		if (pitch_index) {
-			dst2 += p->fix.line_length;
-			dst1 = (u8 __iomem *)((long __force)dst2 & ~(sizeof(u32) - 1));
-
-			start_index += pitch_index;
-			start_index &= 32 - 1;
-		}
-	}
-}
-
-static inline void slow_imageblit(const struct fb_image *image, struct fb_info *p,
-				  u8 __iomem *dst1, u32 fgcolor,
-				  u32 bgcolor,
-				  u32 start_index,
-				  u32 pitch_index)
-{
-	u32 shift, color = 0, bpp = p->var.bits_per_pixel;
-	u32 __iomem *dst, *dst2;
-	u32 val, pitch = p->fix.line_length;
-	u32 null_bits = 32 - bpp;
-	u32 spitch = (image->width+7)/8;
-	const u8 *src = image->data, *s;
-	u32 i, j, l;
-	u32 bswapmask = fb_compute_bswapmask(p);
-
-	dst2 = (u32 __iomem *) dst1;
-	fgcolor <<= FB_LEFT_POS(p, bpp);
-	bgcolor <<= FB_LEFT_POS(p, bpp);
-
-	for (i = image->height; i--; ) {
-		shift = val = 0;
-		l = 8;
-		j = image->width;
-		dst = (u32 __iomem *) dst1;
-		s = src;
-
-		/* write leading bits */
-		if (start_index) {
-			u32 start_mask = ~fb_shifted_pixels_mask_u32(p,
-						start_index, bswapmask);
-			val = FB_READL(dst) & start_mask;
-			shift = start_index;
-		}
-
-		while (j--) {
-			l--;
-			color = (*s & (1 << l)) ? fgcolor : bgcolor;
-			val |= FB_SHIFT_HIGH(p, color, shift ^ bswapmask);
-
-			/* Did the bitshift spill bits to the next long? */
-			if (shift >= null_bits) {
-				FB_WRITEL(val, dst++);
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
-			u32 end_mask = fb_shifted_pixels_mask_u32(p, shift,
-						bswapmask);
-
-			FB_WRITEL((FB_READL(dst) & end_mask) | val, dst);
-		}
-
-		dst1 += pitch;
-		src += spitch;
-		if (pitch_index) {
-			dst2 += pitch;
-			dst1 = (u8 __iomem *)((long __force)dst2 & ~(sizeof(u32) - 1));
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
-static inline void fast_imageblit(const struct fb_image *image, struct fb_info *p,
-				  u8 __iomem *dst1, u32 fgcolor,
-				  u32 bgcolor)
-{
-	u32 fgx = fgcolor, bgx = bgcolor, bpp = p->var.bits_per_pixel;
-	u32 ppw = 32/bpp, spitch = (image->width + 7)/8;
-	u32 bit_mask, eorx, shift;
-	const char *s = image->data, *src;
-	u32 __iomem *dst;
-	const u32 *tab = NULL;
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
-		dst = (u32 __iomem *)dst1;
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
-				FB_WRITEL(colortab[(*src >> 4) & bit_mask], dst++);
-				FB_WRITEL(colortab[(*src >> 0) & bit_mask], dst++);
-			}
-			break;
-		case 2: /* 16 bpp */
-			for (j = k; j >= 4; j -= 4, ++src) {
-				FB_WRITEL(colortab[(*src >> 6) & bit_mask], dst++);
-				FB_WRITEL(colortab[(*src >> 4) & bit_mask], dst++);
-				FB_WRITEL(colortab[(*src >> 2) & bit_mask], dst++);
-				FB_WRITEL(colortab[(*src >> 0) & bit_mask], dst++);
-			}
-			break;
-		case 1: /* 32 bpp */
-			for (j = k; j >= 8; j -= 8, ++src) {
-				FB_WRITEL(colortab[(*src >> 7) & bit_mask], dst++);
-				FB_WRITEL(colortab[(*src >> 6) & bit_mask], dst++);
-				FB_WRITEL(colortab[(*src >> 5) & bit_mask], dst++);
-				FB_WRITEL(colortab[(*src >> 4) & bit_mask], dst++);
-				FB_WRITEL(colortab[(*src >> 3) & bit_mask], dst++);
-				FB_WRITEL(colortab[(*src >> 2) & bit_mask], dst++);
-				FB_WRITEL(colortab[(*src >> 1) & bit_mask], dst++);
-				FB_WRITEL(colortab[(*src >> 0) & bit_mask], dst++);
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
-			FB_WRITEL(colortab[(*src >> shift) & bit_mask], dst++);
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
+#include "cfbmem.h"
+#include "fb_imageblit.h"
 
 void cfb_imageblit(struct fb_info *p, const struct fb_image *image)
 {
-	u32 fgcolor, bgcolor, start_index, bitstart, pitch_index = 0;
-	u32 bpl = sizeof(u32), bpp = p->var.bits_per_pixel;
-	u32 width = image->width;
-	u32 dx = image->dx, dy = image->dy;
-	u8 __iomem *dst1;
-
 	if (p->state != FBINFO_STATE_RUNNING)
 		return;
 
 	if (p->flags & FBINFO_VIRTFB)
-		fb_warn_once(p, "Framebuffer is not in I/O address space.");
-
-	bitstart = (dy * p->fix.line_length * 8) + (dx * bpp);
-	start_index = bitstart & (32 - 1);
-	pitch_index = (p->fix.line_length & (bpl - 1)) * 8;
-
-	bitstart /= 8;
-	bitstart &= ~(bpl - 1);
-	dst1 = p->screen_base + bitstart;
+		fb_warn_once(p, "%s: framebuffer is not in I/O address space.\n", __func__);
 
 	if (p->fbops->fb_sync)
 		p->fbops->fb_sync(p);
 
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
+	fb_imageblit(p, image);
 }
-
 EXPORT_SYMBOL(cfb_imageblit);
 
-MODULE_AUTHOR("James Simmons <jsimmons@users.sf.net>");
-MODULE_DESCRIPTION("Generic software accelerated imaging drawing");
+MODULE_AUTHOR("Zsolt Kajtar <soci@c64.rulez.org>");
+MODULE_DESCRIPTION("I/O memory packed pixel framebuffer image draw");
 MODULE_LICENSE("GPL");
-
diff --git a/drivers/video/fbdev/core/cfbmem.h b/drivers/video/fbdev/core/cfbmem.h
new file mode 100644
index 000000000..ce2f5f751
--- /dev/null
+++ b/drivers/video/fbdev/core/cfbmem.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ *
+ *	I/O memory framebuffer access for drawing routines
+ *
+ *	Copyright (C) 2025 Zsolt Kajtar (soci@c64.rulez.org)
+ */
+
+/* keeps track of a bit address in framebuffer memory */
+struct fb_address {
+	void __iomem *address;
+	int bits;
+};
+
+/* initialize the bit address pointer to the beginning of the frame buffer */
+static inline struct fb_address fb_address_init(struct fb_info *p)
+{
+	void __iomem *base = p->screen_base;
+	struct fb_address ptr;
+
+	ptr.address = PTR_ALIGN_DOWN(base, BITS_PER_LONG / BITS_PER_BYTE);
+	ptr.bits = (base - ptr.address) * BITS_PER_BYTE;
+	return ptr;
+}
+
+/* framebuffer write access */
+static inline void fb_write_offset(unsigned long val, int offset, const struct fb_address *dst)
+{
+#if BITS_PER_LONG == 32
+	fb_writel(val, dst->address + offset * (BITS_PER_LONG / BITS_PER_BYTE));
+#else
+	fb_writeq(val, dst->address + offset * (BITS_PER_LONG / BITS_PER_BYTE));
+#endif
+}
+
+/* framebuffer read access */
+static inline unsigned long fb_read_offset(int offset, const struct fb_address *src)
+{
+#if BITS_PER_LONG == 32
+	return fb_readl(src->address + offset * (BITS_PER_LONG / BITS_PER_BYTE));
+#else
+	return fb_readq(src->address + offset * (BITS_PER_LONG / BITS_PER_BYTE));
+#endif
+}
diff --git a/drivers/video/fbdev/core/fb_copyarea.h b/drivers/video/fbdev/core/fb_copyarea.h
new file mode 100644
index 000000000..53f1d5385
--- /dev/null
+++ b/drivers/video/fbdev/core/fb_copyarea.h
@@ -0,0 +1,405 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ *
+ *  Generic bit area copy and twister engine for packed pixel framebuffers
+ *
+ *      Rewritten by:
+ *	Copyright (C)  2025 Zsolt Kajtar (soci@c64.rulez.org)
+ *
+ *	Based on previous work of:
+ *	Copyright (C)  1999-2005 James Simmons <jsimmons@www.infradead.org>
+ *	Anton Vorontsov <avorontsov@ru.mvista.com>
+ *	Pavel Pisa <pisa@cmp.felk.cvut.cz>
+ *	Antonino Daplas <adaplas@hotpop.com>
+ *	Geert Uytterhoeven
+ *	and others
+ *
+ * NOTES:
+ *
+ * Handles native and foreign byte order on both endians, standard and
+ * reverse pixel order in a byte (<8 BPP), word length of 32/64 bits,
+ * bits per pixel from 1 to the word length. Handles line lengths at byte
+ * granularity while maintaining aligned accesses.
+ *
+ * Optimized routines for word aligned copying and byte aligned copying
+ * on reverse pixel framebuffers.
+ */
+#include "fb_draw.h"
+
+/* used when no reversing is necessary */
+static inline unsigned long fb_no_reverse(unsigned long val, struct fb_reverse reverse)
+{
+	return val;
+}
+
+/* modifies the masked area in a word */
+static inline void fb_copy_offset_masked(unsigned long mask, int offset,
+					 const struct fb_address *dst,
+					 const struct fb_address *src)
+{
+	fb_modify_offset(fb_read_offset(offset, src), mask, offset, dst);
+}
+
+/* copies the whole word */
+static inline void fb_copy_offset(int offset, const struct fb_address *dst,
+				  const struct fb_address *src)
+{
+	fb_write_offset(fb_read_offset(offset, src), offset, dst);
+}
+
+/* forward aligned copy */
+static inline void fb_copy_aligned_fwd(const struct fb_address *dst,
+				       const struct fb_address *src,
+				       int end, struct fb_reverse reverse)
+{
+	unsigned long first, last;
+
+	first = fb_pixel_mask(dst->bits, reverse);
+	last = ~fb_pixel_mask(end & (BITS_PER_LONG-1), reverse);
+
+	/* Same alignment for source and dest */
+	if (end <= BITS_PER_LONG) {
+		/* Single word */
+		last = last ? (last & first) : first;
+
+		/* Trailing bits */
+		if (last == ~0UL)
+			fb_copy_offset(0, dst, src);
+		else
+			fb_copy_offset_masked(last, 0, dst, src);
+	} else {
+		/* Multiple destination words */
+		int offset = first != ~0UL;
+
+		/* Leading bits */
+		if (offset)
+			fb_copy_offset_masked(first, 0, dst, src);
+
+		/* Main chunk */
+		end /= BITS_PER_LONG;
+		while (offset + 4 <= end) {
+			fb_copy_offset(offset + 0, dst, src);
+			fb_copy_offset(offset + 1, dst, src);
+			fb_copy_offset(offset + 2, dst, src);
+			fb_copy_offset(offset + 3, dst, src);
+			offset += 4;
+		}
+		while (offset < end)
+			fb_copy_offset(offset++, dst, src);
+
+		/* Trailing bits */
+		if (last)
+			fb_copy_offset_masked(last, offset, dst, src);
+	}
+}
+
+/* reverse aligned copy */
+static inline void fb_copy_aligned_rev(const struct fb_address *dst,
+				       const struct fb_address *src,
+				       int end, struct fb_reverse reverse)
+{
+	unsigned long first, last;
+
+	first = fb_pixel_mask(dst->bits, reverse);
+	last = ~fb_pixel_mask(end & (BITS_PER_LONG-1), reverse);
+
+	if (end <= BITS_PER_LONG) {
+		/* Single word */
+		if (last)
+			first &= last;
+		if (first == ~0UL)
+			fb_copy_offset(0, dst, src);
+		else
+			fb_copy_offset_masked(first, 0, dst, src);
+	} else {
+		/* Multiple destination words */
+		int offset = first != ~0UL;
+
+		/* Trailing bits */
+		end /= BITS_PER_LONG;
+
+		if (last)
+			fb_copy_offset_masked(last, end, dst, src);
+
+		/* Main chunk */
+		while (end >= offset + 4) {
+			fb_copy_offset(end - 1, dst, src);
+			fb_copy_offset(end - 2, dst, src);
+			fb_copy_offset(end - 3, dst, src);
+			fb_copy_offset(end - 4, dst, src);
+			end -= 4;
+		}
+		while (end > offset)
+			fb_copy_offset(--end, dst, src);
+
+		/* Leading bits */
+		if (offset)
+			fb_copy_offset_masked(first, 0, dst, src);
+	}
+}
+
+static inline void fb_copy_aligned(struct fb_address *dst, struct fb_address *src,
+				   int width, u32 height, unsigned int bits_per_line,
+				   struct fb_reverse reverse, bool rev_copy)
+{
+	if (rev_copy)
+		while (height--) {
+			fb_copy_aligned_rev(dst, src, width + dst->bits, reverse);
+			fb_address_backward(dst, bits_per_line);
+			fb_address_backward(src, bits_per_line);
+		}
+	else
+		while (height--) {
+			fb_copy_aligned_fwd(dst, src, width + dst->bits, reverse);
+			fb_address_forward(dst, bits_per_line);
+			fb_address_forward(src, bits_per_line);
+		}
+}
+
+static __always_inline void fb_copy_fwd(const struct fb_address *dst,
+					const struct fb_address *src, int width,
+					unsigned long (*reorder)(unsigned long val,
+								 struct fb_reverse reverse),
+					struct fb_reverse reverse)
+{
+	unsigned long first, last;
+	unsigned long d0, d1;
+	int end = dst->bits + width;
+	int shift, left, right;
+
+	first = fb_pixel_mask(dst->bits, reverse);
+	last = ~fb_pixel_mask(end & (BITS_PER_LONG-1), reverse);
+
+	shift = dst->bits - src->bits;
+	right = shift & (BITS_PER_LONG - 1);
+	left = -shift & (BITS_PER_LONG - 1);
+
+	if (end <= BITS_PER_LONG) {
+		/* Single destination word */
+		last = last ? (last & first) : first;
+		if (shift < 0) {
+			d0 = fb_left(reorder(fb_read_offset(-1, src), reverse), left);
+			if (src->bits + width > BITS_PER_LONG)
+				d0 |= fb_right(reorder(fb_read_offset(0, src), reverse), right);
+
+			if (last == ~0UL)
+				fb_write_offset(reorder(d0, reverse), 0, dst);
+			else
+				fb_modify_offset(reorder(d0, reverse), last, 0, dst);
+		} else {
+			d0 = fb_right(reorder(fb_read_offset(0, src), reverse), right);
+			fb_modify_offset(reorder(d0, reverse), last, 0, dst);
+		}
+	} else {
+		/* Multiple destination words */
+		int offset = first != ~0UL;
+
+		/* Leading bits */
+		if (shift < 0)
+			d0 = reorder(fb_read_offset(-1, src), reverse);
+		else
+			d0 = 0;
+
+		/* 2 source words */
+		if (offset) {
+			d1 = reorder(fb_read_offset(0, src), reverse);
+			d0 = fb_left(d0, left) | fb_right(d1, right);
+			fb_modify_offset(reorder(d0, reverse), first, 0, dst);
+			d0 = d1;
+		}
+
+		/* Main chunk */
+		end /= BITS_PER_LONG;
+		if (reorder == fb_no_reverse)
+			while (offset + 4 <= end) {
+				d1 = fb_read_offset(offset + 0, src);
+				d0 = fb_left(d0, left) | fb_right(d1, right);
+				fb_write_offset(d0, offset + 0, dst);
+				d0 = d1;
+				d1 = fb_read_offset(offset + 1, src);
+				d0 = fb_left(d0, left) | fb_right(d1, right);
+				fb_write_offset(d0, offset + 1, dst);
+				d0 = d1;
+				d1 = fb_read_offset(offset + 2, src);
+				d0 = fb_left(d0, left) | fb_right(d1, right);
+				fb_write_offset(d0, offset + 2, dst);
+				d0 = d1;
+				d1 = fb_read_offset(offset + 3, src);
+				d0 = fb_left(d0, left) | fb_right(d1, right);
+				fb_write_offset(d0, offset + 3, dst);
+				d0 = d1;
+				offset += 4;
+			}
+
+		while (offset < end) {
+			d1 = reorder(fb_read_offset(offset, src), reverse);
+			d0 = fb_left(d0, left) | fb_right(d1, right);
+			fb_write_offset(reorder(d0, reverse), offset, dst);
+			d0 = d1;
+			offset++;
+		}
+
+		/* Trailing bits */
+		if (last) {
+			d0 = fb_left(d0, left);
+			if (src->bits + width
+			    > offset * BITS_PER_LONG + ((shift < 0) ? BITS_PER_LONG : 0))
+				d0 |= fb_right(reorder(fb_read_offset(offset, src), reverse),
+					       right);
+			fb_modify_offset(reorder(d0, reverse), last, offset, dst);
+		}
+	}
+}
+
+static __always_inline void fb_copy_rev(const struct fb_address *dst,
+					const struct fb_address *src, int end,
+					unsigned long (*reorder)(unsigned long val,
+								 struct fb_reverse reverse),
+					struct fb_reverse reverse)
+{
+	unsigned long first, last;
+	unsigned long d0, d1;
+	int shift, left, right;
+
+	first = fb_pixel_mask(dst->bits, reverse);
+	last = ~fb_pixel_mask(end & (BITS_PER_LONG-1), reverse);
+
+	shift = dst->bits - src->bits;
+	right = shift & (BITS_PER_LONG-1);
+	left = -shift & (BITS_PER_LONG-1);
+
+	if (end <= BITS_PER_LONG) {
+		/* Single destination word */
+		if (last)
+			first &= last;
+
+		if (shift > 0) {
+			d0 = fb_right(reorder(fb_read_offset(1, src), reverse), right);
+			if (src->bits > left)
+				d0 |= fb_left(reorder(fb_read_offset(0, src), reverse), left);
+			fb_modify_offset(reorder(d0, reverse), first, 0, dst);
+		} else {
+			d0 = fb_left(reorder(fb_read_offset(0, src), reverse), left);
+			if (src->bits + end - dst->bits > BITS_PER_LONG)
+				d0 |= fb_right(reorder(fb_read_offset(1, src), reverse), right);
+			if (first == ~0UL)
+				fb_write_offset(reorder(d0, reverse), 0, dst);
+			else
+				fb_modify_offset(reorder(d0, reverse), first, 0, dst);
+		}
+	} else {
+		/* Multiple destination words */
+		int offset = first != ~0UL;
+
+		end /= BITS_PER_LONG;
+
+		/* 2 source words */
+		if (fb_right(~0UL, right) & last)
+			d0 = fb_right(reorder(fb_read_offset(end + 1, src), reverse), right);
+		else
+			d0 = 0;
+
+		/* Trailing bits */
+		d1 = reorder(fb_read_offset(end, src), reverse);
+		if (last)
+			fb_modify_offset(reorder(fb_left(d1, left) | d0, reverse),
+					 last, end, dst);
+		d0 = d1;
+
+		/* Main chunk */
+		if (reorder == fb_no_reverse)
+			while (end >= offset + 4) {
+				d1 = fb_read_offset(end - 1, src);
+				d0 = fb_left(d1, left) | fb_right(d0, right);
+				fb_write_offset(d0, end - 1, dst);
+				d0 = d1;
+				d1 = fb_read_offset(end - 2, src);
+				d0 = fb_left(d1, left) | fb_right(d0, right);
+				fb_write_offset(d0, end - 2, dst);
+				d0 = d1;
+				d1 = fb_read_offset(end - 3, src);
+				d0 = fb_left(d1, left) | fb_right(d0, right);
+				fb_write_offset(d0, end - 3, dst);
+				d0 = d1;
+				d1 = fb_read_offset(end - 4, src);
+				d0 = fb_left(d1, left) | fb_right(d0, right);
+				fb_write_offset(d0, end - 4, dst);
+				d0 = d1;
+				end -= 4;
+			}
+
+		while (end > offset) {
+			end--;
+			d1 = reorder(fb_read_offset(end, src), reverse);
+			d0 = fb_left(d1, left) | fb_right(d0, right);
+			fb_write_offset(reorder(d0, reverse), end, dst);
+			d0 = d1;
+		}
+
+		/* Leading bits */
+		if (offset) {
+			d0 = fb_right(d0, right);
+			if (src->bits > left)
+				d0 |= fb_left(reorder(fb_read_offset(0, src), reverse), left);
+			fb_modify_offset(reorder(d0, reverse), first, 0, dst);
+		}
+	}
+}
+
+static __always_inline void fb_copy(struct fb_address *dst, struct fb_address *src,
+				    int width, u32 height, unsigned int bits_per_line,
+				    unsigned long (*reorder)(unsigned long val,
+							     struct fb_reverse reverse),
+				    struct fb_reverse reverse, bool rev_copy)
+{
+	if (rev_copy)
+		while (height--) {
+			int move = src->bits < dst->bits ? -1 : 0;
+
+			fb_address_move_long(src, move);
+			fb_copy_rev(dst, src, width + dst->bits, reorder, reverse);
+			fb_address_backward(dst, bits_per_line);
+			fb_address_backward(src, bits_per_line);
+			fb_address_move_long(src, -move);
+		}
+	else
+		while (height--) {
+			int move = src->bits > dst->bits ? 1 : 0;
+
+			fb_address_move_long(src, move);
+			fb_copy_fwd(dst, src, width, reorder, reverse);
+			fb_address_forward(dst, bits_per_line);
+			fb_address_forward(src, bits_per_line);
+			fb_address_move_long(src, -move);
+		}
+}
+
+static inline void fb_copyarea(struct fb_info *p, const struct fb_copyarea *area)
+{
+	int bpp = p->var.bits_per_pixel;
+	u32 dy = area->dy;
+	u32 sy = area->sy;
+	u32 height = area->height;
+	int width = area->width * bpp;
+	unsigned int bits_per_line = BYTES_TO_BITS(p->fix.line_length);
+	struct fb_reverse reverse = fb_reverse_init(p);
+	struct fb_address dst = fb_address_init(p);
+	struct fb_address src = dst;
+	bool rev_copy = (dy > sy) || (dy == sy && area->dx > area->sx);
+
+	if (rev_copy) {
+		dy += height - 1;
+		sy += height - 1;
+	}
+	fb_address_forward(&dst, dy*bits_per_line + area->dx*bpp);
+	fb_address_forward(&src, sy*bits_per_line + area->sx*bpp);
+
+	if (src.bits == dst.bits)
+		fb_copy_aligned(&dst, &src, width, height, bits_per_line, reverse, rev_copy);
+	else if (!reverse.byte && (!reverse.pixel ||
+				     !((src.bits ^ dst.bits) & (BITS_PER_BYTE-1)))) {
+		fb_copy(&dst, &src, width, height, bits_per_line,
+			fb_no_reverse, reverse, rev_copy);
+	} else
+		fb_copy(&dst, &src, width, height, bits_per_line,
+			fb_reverse_long, reverse, rev_copy);
+}
diff --git a/drivers/video/fbdev/core/fb_draw.h b/drivers/video/fbdev/core/fb_draw.h
index e0d829873..8eb13f7b3 100644
--- a/drivers/video/fbdev/core/fb_draw.h
+++ b/drivers/video/fbdev/core/fb_draw.h
@@ -1,187 +1,163 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ *  Various common functions used by the framebuffer drawing code
+ *
+ *	Copyright (C)  2025 Zsolt Kajtar (soci@c64.rulez.org)
+ */
 #ifndef _FB_DRAW_H
 #define _FB_DRAW_H
 
-#include <asm/types.h>
-#include <linux/fb.h>
-#include <linux/bug.h>
+/* swap bytes in a long, independent of word size */
+#define swab_long _swab_long(BITS_PER_LONG)
+#define _swab_long(x) __swab_long(x)
+#define __swab_long(x) swab##x
 
-    /*
-     *  Compose two values, using a bitmask as decision value
-     *  This is equivalent to (a & mask) | (b & ~mask)
-     */
-
-static inline unsigned long
-comp(unsigned long a, unsigned long b, unsigned long mask)
+/* move the address pointer by the number of words */
+static inline void fb_address_move_long(struct fb_address *adr, int offset)
 {
-    return ((a ^ b) & mask) ^ b;
+	adr->address += offset * (BITS_PER_LONG / BITS_PER_BYTE);
 }
 
-    /*
-     *  Create a pattern with the given pixel's color
-     */
+/* move the address pointer forward with the number of bits */
+static inline void fb_address_forward(struct fb_address *adr, unsigned int offset)
+{
+	unsigned int bits = (unsigned int)adr->bits + offset;
+
+	adr->bits = bits & (BITS_PER_LONG - 1u);
+	adr->address += (bits & ~(BITS_PER_LONG - 1u)) / BITS_PER_BYTE;
+}
 
-#if BITS_PER_LONG == 64
-static inline unsigned long
-pixel_to_pat( u32 bpp, u32 pixel)
+/* move the address pointer backwards with the number of bits */
+static inline void fb_address_backward(struct fb_address *adr, unsigned int offset)
 {
-	switch (bpp) {
-	case 1:
-		return 0xfffffffffffffffful*pixel;
-	case 2:
-		return 0x5555555555555555ul*pixel;
-	case 4:
-		return 0x1111111111111111ul*pixel;
-	case 8:
-		return 0x0101010101010101ul*pixel;
-	case 12:
-		return 0x1001001001001001ul*pixel;
-	case 16:
-		return 0x0001000100010001ul*pixel;
-	case 24:
-		return 0x0001000001000001ul*pixel;
-	case 32:
-		return 0x0000000100000001ul*pixel;
-	default:
-		WARN(1, "pixel_to_pat(): unsupported pixelformat %d\n", bpp);
-		return 0;
-    }
+	int bits = adr->bits - (int)offset;
+
+	adr->bits = bits & (BITS_PER_LONG - 1);
+	if (bits < 0)
+		adr->address -= (adr->bits - bits) / BITS_PER_BYTE;
+	else
+		adr->address += (bits - adr->bits) / BITS_PER_BYTE;
 }
-#else
-static inline unsigned long
-pixel_to_pat( u32 bpp, u32 pixel)
+
+/* compose pixels based on mask */
+static inline unsigned long fb_comp(unsigned long set, unsigned long unset, unsigned long mask)
 {
-	switch (bpp) {
-	case 1:
-		return 0xfffffffful*pixel;
-	case 2:
-		return 0x55555555ul*pixel;
-	case 4:
-		return 0x11111111ul*pixel;
-	case 8:
-		return 0x01010101ul*pixel;
-	case 12:
-		return 0x01001001ul*pixel;
-	case 16:
-		return 0x00010001ul*pixel;
-	case 24:
-		return 0x01000001ul*pixel;
-	case 32:
-		return 0x00000001ul*pixel;
-	default:
-		WARN(1, "pixel_to_pat(): unsupported pixelformat %d\n", bpp);
-		return 0;
-    }
+	return ((set ^ unset) & mask) ^ unset;
 }
-#endif
 
-#ifdef CONFIG_FB_CFB_REV_PIXELS_IN_BYTE
-#if BITS_PER_LONG == 64
-#define REV_PIXELS_MASK1 0x5555555555555555ul
-#define REV_PIXELS_MASK2 0x3333333333333333ul
-#define REV_PIXELS_MASK4 0x0f0f0f0f0f0f0f0ful
-#else
-#define REV_PIXELS_MASK1 0x55555555ul
-#define REV_PIXELS_MASK2 0x33333333ul
-#define REV_PIXELS_MASK4 0x0f0f0f0ful
-#endif
+/* framebuffer read-modify-write access for replacing bits in the mask */
+static inline void fb_modify_offset(unsigned long val, unsigned long mask,
+				    int offset, const struct fb_address *dst)
+{
+	fb_write_offset(fb_comp(val, fb_read_offset(offset, dst), mask), offset, dst);
+}
 
-static inline unsigned long fb_rev_pixels_in_long(unsigned long val,
-						  u32 bswapmask)
+/*
+ * get current palette, if applicable for visual
+ *
+ * The pseudo color table entries (and colors) are right justified and in the
+ * same byte order as it's expected to be placed into a native ordered
+ * framebuffer memory. What that means:
+ *
+ * Expected bytes in framebuffer memory (in native order):
+ * RR GG BB RR GG BB RR GG BB ...
+ *
+ * Pseudo palette entry on little endian arch:
+ * RR | GG << 8 | BB << 16
+ *
+ * Pseudo palette entry on a big endian arch:
+ * RR << 16 | GG << 8 | BB
+ */
+static inline const u32 *fb_palette(struct fb_info *info)
 {
-	if (bswapmask & 1)
-		val = comp(val >> 1, val << 1, REV_PIXELS_MASK1);
-	if (bswapmask & 2)
-		val = comp(val >> 2, val << 2, REV_PIXELS_MASK2);
-	if (bswapmask & 3)
-		val = comp(val >> 4, val << 4, REV_PIXELS_MASK4);
-	return val;
+	return (info->fix.visual == FB_VISUAL_TRUECOLOR ||
+		info->fix.visual == FB_VISUAL_DIRECTCOLOR) ? info->pseudo_palette : NULL;
 }
 
-static inline u32 fb_shifted_pixels_mask_u32(struct fb_info *p, u32 index,
-					     u32 bswapmask)
+/* move pixels right on screen when framebuffer is in native order */
+static inline unsigned long fb_right(unsigned long value, int index)
 {
-	u32 mask;
-
-	if (!bswapmask) {
-		mask = FB_SHIFT_HIGH(p, ~(u32)0, index);
-	} else {
-		mask = 0xff << FB_LEFT_POS(p, 8);
-		mask = FB_SHIFT_LOW(p, mask, index & (bswapmask)) & mask;
-		mask = FB_SHIFT_HIGH(p, mask, index & ~(bswapmask));
-#if defined(__i386__) || defined(__x86_64__)
-		/* Shift argument is limited to 0 - 31 on x86 based CPU's */
-		if(index + bswapmask < 32)
+#ifdef __LITTLE_ENDIAN
+	return value << index;
+#else
+	return value >> index;
 #endif
-			mask |= FB_SHIFT_HIGH(p, ~(u32)0,
-					(index + bswapmask) & ~(bswapmask));
-	}
-	return mask;
 }
 
-static inline unsigned long fb_shifted_pixels_mask_long(struct fb_info *p,
-							u32 index,
-							u32 bswapmask)
+/* move pixels left on screen when framebuffer is in native order */
+static inline unsigned long fb_left(unsigned long value, int index)
 {
-	unsigned long mask;
-
-	if (!bswapmask) {
-		mask = FB_SHIFT_HIGH(p, ~0UL, index);
-	} else {
-		mask = 0xff << FB_LEFT_POS(p, 8);
-		mask = FB_SHIFT_LOW(p, mask, index & (bswapmask)) & mask;
-		mask = FB_SHIFT_HIGH(p, mask, index & ~(bswapmask));
-#if defined(__i386__) || defined(__x86_64__)
-		/* Shift argument is limited to 0 - 31 on x86 based CPU's */
-		if(index + bswapmask < BITS_PER_LONG)
+#ifdef __LITTLE_ENDIAN
+	return value >> index;
+#else
+	return value << index;
 #endif
-			mask |= FB_SHIFT_HIGH(p, ~0UL,
-					(index + bswapmask) & ~(bswapmask));
-	}
-	return mask;
 }
 
+/* reversal options */
+struct fb_reverse {
+	bool byte, pixel;
+};
 
-static inline u32 fb_compute_bswapmask(struct fb_info *info)
+/* reverse bits of each byte in a long */
+static inline unsigned long fb_reverse_bits_long(unsigned long val)
 {
-	u32 bswapmask = 0;
-	unsigned bpp = info->var.bits_per_pixel;
-
-	if ((bpp < 8) && (info->var.nonstd & FB_NONSTD_REV_PIX_IN_B)) {
-		/*
-		 * Reversed order of pixel layout in bytes
-		 * works only for 1, 2 and 4 bpp
-		 */
-		bswapmask = 7 - bpp + 1;
-	}
-	return bswapmask;
+#if defined(CONFIG_HAVE_ARCH_BITREVERSE) && BITS_PER_LONG == 32
+	return bitrev8x4(val);
+#else
+	val = fb_comp(val >> 1, val << 1, ~0UL / 3);
+	val = fb_comp(val >> 2, val << 2, ~0UL / 5);
+	return fb_comp(val >> 4, val << 4, ~0UL / 17);
+#endif
 }
 
-#else /* CONFIG_FB_CFB_REV_PIXELS_IN_BYTE */
-
-static inline unsigned long fb_rev_pixels_in_long(unsigned long val,
-						  u32 bswapmask)
+/* apply byte and bit reversals as necessary */
+static inline unsigned long fb_reverse_long(unsigned long val,
+					    struct fb_reverse reverse)
 {
-	return val;
+	if (reverse.pixel)
+		val = fb_reverse_bits_long(val);
+	return reverse.byte ? swab_long(val) : val;
 }
 
-#define fb_shifted_pixels_mask_u32(p, i, b) FB_SHIFT_HIGH((p), ~(u32)0, (i))
-#define fb_shifted_pixels_mask_long(p, i, b) FB_SHIFT_HIGH((p), ~0UL, (i))
-#define fb_compute_bswapmask(...) 0
-
-#endif  /* CONFIG_FB_CFB_REV_PIXELS_IN_BYTE */
-
-#define cpu_to_le_long _cpu_to_le_long(BITS_PER_LONG)
-#define _cpu_to_le_long(x) __cpu_to_le_long(x)
-#define __cpu_to_le_long(x) cpu_to_le##x
+/* calculate a pixel mask for the given reversal */
+static inline unsigned long fb_pixel_mask(int index, struct fb_reverse reverse)
+{
+#ifdef FB_REV_PIXELS_IN_BYTE
+	if (reverse.byte)
+		return reverse.pixel ? fb_left(~0UL, index) : swab_long(fb_right(~0UL, index));
+	else
+		return reverse.pixel ? swab_long(fb_left(~0UL, index)) : fb_right(~0UL, index);
+#else
+	return reverse.byte ? swab_long(fb_right(~0UL, index)) : fb_right(~0UL, index);
+#endif
+}
 
-#define le_long_to_cpu _le_long_to_cpu(BITS_PER_LONG)
-#define _le_long_to_cpu(x) __le_long_to_cpu(x)
-#define __le_long_to_cpu(x) le##x##_to_cpu
 
-static inline unsigned long rolx(unsigned long word, unsigned int shift, unsigned int x)
+/*
+ * initialise reversals based on info
+ *
+ * Normally the first byte is the low byte on little endian and in the high
+ * on big endian. If it's the other way around then that's reverse byte order.
+ *
+ * Normally the first pixel is the LSB on little endian and the MSB on big
+ * endian. If that's not the case that's reverse pixel order.
+ */
+static inline struct fb_reverse fb_reverse_init(struct fb_info *info)
 {
-	return (word << shift) | (word >> (x - shift));
+	struct fb_reverse reverse;
+#ifdef __LITTLE_ENDIAN
+	reverse.byte = fb_be_math(info) != 0;
+#else
+	reverse.byte = fb_be_math(info) == 0;
+#endif
+#ifdef FB_REV_PIXELS_IN_BYTE
+	reverse.pixel = info->var.bits_per_pixel < BITS_PER_BYTE
+		&& (info->var.nonstd & FB_NONSTD_REV_PIX_IN_B);
+#else
+	reverse.pixel = false;
+#endif
+	return reverse;
 }
 
 #endif /* FB_DRAW_H */
diff --git a/drivers/video/fbdev/core/fb_fillrect.h b/drivers/video/fbdev/core/fb_fillrect.h
new file mode 100644
index 000000000..66042e534
--- /dev/null
+++ b/drivers/video/fbdev/core/fb_fillrect.h
@@ -0,0 +1,280 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ *
+ *  Generic bit area filler and twister engine for packed pixel framebuffers
+ *
+ *	Rewritten by:
+ *	Copyright (C)  2025 Zsolt Kajtar (soci@c64.rulez.org)
+ *
+ *	Based on earlier work of:
+ *	Copyright (C)  2000 James Simmons (jsimmons@linux-fbdev.org)
+ *	Michal Januszewski <spock@gentoo.org>
+ *	Anton Vorontsov <avorontsov@ru.mvista.com>
+ *	Pavel Pisa <pisa@cmp.felk.cvut.cz>
+ *	Antonino A. Daplas <adaplas@gmail.com>
+ *	Geert Uytterhoeven
+ *	and others
+ *
+ * NOTES:
+ *
+ * Handles native and foreign byte order on both endians, standard and
+ * reverse pixel order in a byte (<8 BPP), word length of 32/64 bits,
+ * bits per pixel from 1 to the word length. Handles line lengths at byte
+ * granularity while maintaining aligned accesses.
+ *
+ * Optimized path for power of two bits per pixel modes.
+ */
+#include "fb_draw.h"
+
+/* inverts bits at a given offset */
+static inline void fb_invert_offset(unsigned long pat, int offset, const struct fb_address *dst)
+{
+	fb_write_offset(fb_read_offset(offset, dst) ^ pat, offset, dst);
+}
+
+/* state for pattern generator and whether swapping is necessary */
+struct fb_pattern {
+	unsigned long pixels;
+	int left, right;
+	struct fb_reverse reverse;
+};
+
+/* used to get the pattern in native order */
+static unsigned long fb_pattern_get(struct fb_pattern *pattern)
+{
+	return pattern->pixels;
+}
+
+/* used to get the pattern in reverse order */
+static unsigned long fb_pattern_get_reverse(struct fb_pattern *pattern)
+{
+	return swab_long(pattern->pixels);
+}
+
+/* next static pattern */
+static void fb_pattern_static(struct fb_pattern *pattern)
+{
+	/* nothing to do */
+}
+
+/* next rotating pattern */
+static void fb_pattern_rotate(struct fb_pattern *pattern)
+{
+	pattern->pixels = fb_left(pattern->pixels, pattern->left)
+		| fb_right(pattern->pixels, pattern->right);
+}
+
+#define FB_PAT(i) (((1UL<<(BITS_PER_LONG-1)/(i)*(i))/((1<<(i))-1)<<(i))|1)
+
+/* create the filling pattern from a given color */
+static unsigned long pixel_to_pat(int bpp, u32 color)
+{
+	static const unsigned long mulconst[BITS_PER_LONG/4] = {
+		0, ~0UL, FB_PAT(2), FB_PAT(3),
+		FB_PAT(4), FB_PAT(5), FB_PAT(6), FB_PAT(7),
+#if BITS_PER_LONG == 64
+		FB_PAT(8), FB_PAT(9), FB_PAT(10), FB_PAT(11),
+		FB_PAT(12), FB_PAT(13), FB_PAT(14), FB_PAT(15),
+#endif
+	};
+	unsigned long pattern;
+
+	switch (bpp) {
+	case 0 ... BITS_PER_LONG/4-1:
+		pattern = mulconst[bpp] * color;
+		break;
+	case BITS_PER_LONG/4 ... BITS_PER_LONG/2-1:
+		pattern = color;
+		pattern = pattern | pattern << bpp;
+		pattern = pattern | pattern << bpp*2;
+		break;
+	case BITS_PER_LONG/2 ... BITS_PER_LONG-1:
+		pattern = color;
+		pattern = pattern | pattern << bpp;
+		break;
+	default:
+		pattern = color;
+		break;
+	}
+#ifndef __LITTLE_ENDIAN
+	pattern <<= (BITS_PER_LONG % bpp);
+	pattern |= pattern >> bpp;
+#endif
+	return pattern;
+}
+
+/* overwrite bits according to a pattern in a line */
+static __always_inline void bitfill(const struct fb_address *dst,
+				    struct fb_pattern *pattern,
+				    unsigned long (*get)(struct fb_pattern *pattern),
+				    void (*rotate)(struct fb_pattern *pattern),
+				    int end)
+{
+	unsigned long first, last;
+
+	end += dst->bits;
+	first = fb_pixel_mask(dst->bits, pattern->reverse);
+	last = ~fb_pixel_mask(end & (BITS_PER_LONG-1), pattern->reverse);
+
+	if (end <= BITS_PER_LONG) {
+		last = last ? (last & first) : first;
+		first = get(pattern);
+		if (last == ~0UL)
+			fb_write_offset(first, 0, dst);
+		else if (last)
+			fb_modify_offset(first, last, 0, dst);
+	} else {
+		int offset = first != ~0UL;
+
+		if (offset) {
+			fb_modify_offset(get(pattern), first, 0, dst);
+			rotate(pattern);
+		}
+		end /= BITS_PER_LONG;
+		for (; offset + 4 <= end; offset += 4) {
+			fb_write_offset(get(pattern), offset + 0, dst);
+			rotate(pattern);
+			fb_write_offset(get(pattern), offset + 1, dst);
+			rotate(pattern);
+			fb_write_offset(get(pattern), offset + 2, dst);
+			rotate(pattern);
+			fb_write_offset(get(pattern), offset + 3, dst);
+			rotate(pattern);
+		}
+		while (offset < end) {
+			fb_write_offset(get(pattern), offset++, dst);
+			rotate(pattern);
+		}
+
+		if (last)
+			fb_modify_offset(get(pattern), last, offset, dst);
+	}
+}
+
+/* inverts bits according to a pattern in a line */
+static __always_inline void bitinvert(const struct fb_address *dst,
+				      struct fb_pattern *pattern,
+				      unsigned long (*get)(struct fb_pattern *pattern),
+				      void (*rotate)(struct fb_pattern *pattern),
+				      int end)
+{
+	unsigned long first, last;
+	int offset;
+
+	end += dst->bits;
+	first = fb_pixel_mask(dst->bits, pattern->reverse);
+	last = ~fb_pixel_mask(end & (BITS_PER_LONG-1), pattern->reverse);
+
+	if (end <= BITS_PER_LONG) {
+		offset = 0;
+		last = last ? (last & first) : first;
+	} else {
+		offset = first != ~0UL;
+
+		if (offset) {
+			first &= get(pattern);
+			if (first)
+				fb_invert_offset(first, 0, dst);
+			rotate(pattern);
+		}
+
+		end /= BITS_PER_LONG;
+		for (; offset + 4 <= end; offset += 4) {
+			fb_invert_offset(get(pattern), offset + 0, dst);
+			rotate(pattern);
+			fb_invert_offset(get(pattern), offset + 1, dst);
+			rotate(pattern);
+			fb_invert_offset(get(pattern), offset + 2, dst);
+			rotate(pattern);
+			fb_invert_offset(get(pattern), offset + 3, dst);
+			rotate(pattern);
+		}
+		while (offset < end) {
+			fb_invert_offset(get(pattern), offset++, dst);
+			rotate(pattern);
+		}
+	}
+
+	last &= get(pattern);
+	if (last)
+		fb_invert_offset(last, offset, dst);
+}
+
+/* pattern doesn't change. 1, 2, 4, 8, 16, 32, 64 bpp */
+static inline void fb_fillrect_static(const struct fb_fillrect *rect, int bpp,
+				      struct fb_address *dst, struct fb_pattern *pattern,
+				      unsigned int bits_per_line)
+{
+	u32 height = rect->height;
+	int width = rect->width * bpp;
+
+	if (bpp > 8 && pattern->reverse.byte)
+		pattern->pixels = swab_long(pattern->pixels);
+
+	if (rect->rop == ROP_XOR)
+		while (height--) {
+			bitinvert(dst, pattern, fb_pattern_get, fb_pattern_static, width);
+			fb_address_forward(dst, bits_per_line);
+		}
+	else
+		while (height--) {
+			bitfill(dst, pattern, fb_pattern_get, fb_pattern_static, width);
+			fb_address_forward(dst, bits_per_line);
+		}
+}
+
+/* rotate pattern to the correct position */
+static inline unsigned long fb_rotate(unsigned long pattern, int shift, int bpp)
+{
+	shift %= bpp;
+	return fb_right(pattern, shift) | fb_left(pattern, bpp - shift);
+}
+
+/* rotating pattern, for example 24 bpp */
+static __always_inline void fb_fillrect_rotating(const struct fb_fillrect *rect,
+						 int bpp, struct fb_address *dst,
+						 struct fb_pattern *pattern,
+						 unsigned long (*get)(struct fb_pattern *pattern),
+						 unsigned int bits_per_line)
+{
+	unsigned long pat = pattern->pixels;
+	u32 height = rect->height;
+	int width = rect->width * bpp;
+
+	if (rect->rop == ROP_XOR)
+		while (height--) {
+			pattern->pixels = fb_rotate(pat, dst->bits, bpp);
+			bitinvert(dst, pattern, get, fb_pattern_rotate, width);
+			fb_address_forward(dst, bits_per_line);
+		}
+	else
+		while (height--) {
+			pattern->pixels = fb_rotate(pat, dst->bits, bpp);
+			bitfill(dst, pattern, get, fb_pattern_rotate, width);
+			fb_address_forward(dst, bits_per_line);
+		}
+}
+
+static inline void fb_fillrect(struct fb_info *p, const struct fb_fillrect *rect)
+{
+	int bpp = p->var.bits_per_pixel;
+	unsigned int bits_per_line = BYTES_TO_BITS(p->fix.line_length);
+	const u32 *palette = fb_palette(p);
+	struct fb_address dst = fb_address_init(p);
+	struct fb_pattern pattern;
+
+	fb_address_forward(&dst, rect->dy * bits_per_line + rect->dx * bpp);
+
+	pattern.pixels = pixel_to_pat(bpp, palette ? palette[rect->color] : rect->color);
+	pattern.reverse = fb_reverse_init(p);
+	pattern.left = BITS_PER_LONG % bpp;
+	if (pattern.left) {
+		pattern.right = bpp - pattern.left;
+		if (pattern.reverse.byte)
+			fb_fillrect_rotating(rect, bpp, &dst, &pattern,
+					     fb_pattern_get_reverse, bits_per_line);
+		else
+			fb_fillrect_rotating(rect, bpp, &dst, &pattern,
+					     fb_pattern_get, bits_per_line);
+	} else
+		fb_fillrect_static(rect, bpp, &dst, &pattern, bits_per_line);
+}
diff --git a/drivers/video/fbdev/core/fb_imageblit.h b/drivers/video/fbdev/core/fb_imageblit.h
new file mode 100644
index 000000000..3b2bb4946
--- /dev/null
+++ b/drivers/video/fbdev/core/fb_imageblit.h
@@ -0,0 +1,495 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ *
+ *  Generic bitmap / 8 bpp image bitstreamer for packed pixel framebuffers
+ *
+ *	Rewritten by:
+ *	Copyright (C)  2025 Zsolt Kajtar (soci@c64.rulez.org)
+ *
+ *	Based on previous work of:
+ *	Copyright (C)  June 1999 James Simmons
+ *	Anton Vorontsov <avorontsov@ru.mvista.com>
+ *	Pavel Pisa <pisa@cmp.felk.cvut.cz>
+ *	Antonino A. Daplas <adaplas@gmail.com>
+ *	and others
+ *
+ * NOTES:
+ *
+ * Handles native and foreign byte order on both endians, standard and
+ * reverse pixel order in a byte (<8 BPP), word length of 32/64 bits,
+ * bits per pixel from 1 to the word length. Handles line lengths at byte
+ * granularity while maintaining aligned accesses.
+ *
+ * Optimized routines for word aligned 1, 2, 4 pixel per word for high
+ * bpp modes and 4 pixel at a time operation for low bpp.
+ *
+ * The color image is expected to be one byte per pixel, and values should
+ * not exceed the bitdepth or the pseudo palette (if used).
+ */
+#include "fb_draw.h"
+
+/* bitmap image iterator, one pixel at a time */
+struct fb_bitmap_iter {
+	const u8 *data;
+	unsigned long colors[2];
+	int width, i;
+};
+
+static bool fb_bitmap_image(void *iterator, unsigned long *pixels, int *bits)
+{
+	struct fb_bitmap_iter *iter = iterator;
+
+	if (iter->i < iter->width) {
+		int bit = ~iter->i & (BITS_PER_BYTE-1);
+		int byte = iter->i++ / BITS_PER_BYTE;
+
+		*pixels = iter->colors[(iter->data[byte] >> bit) & 1];
+		return true;
+	}
+	iter->data += BITS_TO_BYTES(iter->width);
+	iter->i = 0;
+	return false;
+}
+
+/* color image iterator, one pixel at a time */
+struct fb_color_iter {
+	const u8 *data;
+	const u32 *palette;
+	struct fb_reverse reverse;
+	int shift;
+	int width, i;
+};
+
+static bool fb_color_image(void *iterator, unsigned long *pixels, int *bits)
+{
+	struct fb_color_iter *iter = iterator;
+
+	if (iter->i < iter->width) {
+		unsigned long color = iter->data[iter->i++];
+
+		if (iter->palette)
+			color = iter->palette[color];
+		*pixels = color << iter->shift;
+		if (iter->reverse.pixel)
+			*pixels = fb_reverse_bits_long(*pixels);
+		return true;
+	}
+	iter->data += iter->width;
+	iter->i = 0;
+	return false;
+}
+
+/* bitmap image iterator, 4 pixels at a time */
+struct fb_bitmap4x_iter {
+	const u8 *data;
+	u32 fgxcolor, bgcolor;
+	int width, i;
+	const u32 *expand;
+	int bpp;
+	bool top;
+};
+
+static bool fb_bitmap4x_image(void *iterator, unsigned long *pixels, int *bits)
+{
+	struct fb_bitmap4x_iter *iter = iterator;
+	u8 data;
+
+	if (iter->i >= BITS_PER_BYTE/2) {
+		iter->i -= BITS_PER_BYTE/2;
+		iter->top = !iter->top;
+		if (iter->top)
+			data = *iter->data++ >> BITS_PER_BYTE/2;
+		else
+			data = iter->data[-1] & ((1 << BITS_PER_BYTE/2)-1);
+	} else if (iter->i != 0) {
+		*bits = iter->bpp * iter->i;
+		if (iter->top)
+			data = iter->data[-1] & ((1 << BITS_PER_BYTE/2)-1);
+		else
+			data = *iter->data++ >> BITS_PER_BYTE/2;
+#ifndef __LITTLE_ENDIAN
+		data >>= BITS_PER_BYTE/2 - iter->i;
+#endif
+		iter->i = 0;
+	} else {
+		*bits = iter->bpp * BITS_PER_BYTE/2;
+		iter->i = iter->width;
+		iter->top = false;
+		return false;
+	}
+	*pixels = (iter->fgxcolor & iter->expand[data]) ^ iter->bgcolor;
+#ifndef __LITTLE_ENDIAN
+	*pixels <<= BITS_PER_LONG - *bits;
+#endif
+	return true;
+}
+
+/* draw a line a group of pixels at a time */
+static __always_inline void fb_bitblit(bool (*get)(void *iter, unsigned long *pixels,
+						   int *bits),
+				       void *iter, int bits, struct fb_address *dst,
+				       struct fb_reverse reverse)
+{
+	unsigned long pixels, val, mask, old;
+	int offset = 0;
+	int shift = dst->bits;
+
+	if (shift) {
+		old = fb_read_offset(0, dst);
+		val = fb_reverse_long(old, reverse);
+		val &= ~fb_right(~0UL, shift);
+	} else {
+		old = 0;
+		val = 0;
+	}
+
+	while (get(iter, &pixels, &bits)) {
+		val |= fb_right(pixels, shift);
+		shift += bits;
+
+		if (shift < BITS_PER_LONG)
+			continue;
+
+		val = fb_reverse_long(val, reverse);
+		fb_write_offset(val, offset++, dst);
+		shift &= BITS_PER_LONG - 1;
+		val = !shift ? 0 : fb_left(pixels, bits - shift);
+	}
+
+	if (shift) {
+		mask = ~fb_pixel_mask(shift, reverse);
+		val = fb_reverse_long(val, reverse);
+		if (offset || !dst->bits)
+			old = fb_read_offset(offset, dst);
+		fb_write_offset(fb_comp(val, old, mask), offset, dst);
+	}
+}
+
+/* draw a color image a pixel at a time */
+static inline void fb_color_imageblit(const struct fb_image *image, struct fb_address *dst,
+				      unsigned int bits_per_line, const u32 *palette, int bpp,
+				      struct fb_reverse reverse)
+{
+	struct fb_color_iter iter;
+	u32 height;
+
+	iter.data = (const u8 *)image->data;
+	iter.palette = palette;
+	iter.reverse = reverse;
+#ifdef __LITTLE_ENDIAN
+	if (reverse.pixel)
+		iter.shift = BITS_PER_BYTE - bpp;
+	else
+		iter.shift = 0;
+#else
+	if (reverse.pixel)
+		iter.shift = BITS_PER_LONG - BITS_PER_BYTE;
+	else
+		iter.shift = BITS_PER_LONG - bpp;
+#endif
+	iter.width = image->width;
+	iter.i = 0;
+
+	height = image->height;
+	while (height--) {
+		fb_bitblit(fb_color_image, &iter, bpp, dst, reverse);
+		fb_address_forward(dst, bits_per_line);
+	}
+}
+
+#ifdef __LITTLE_ENDIAN
+#define FB_GEN(a, b) (((a)/8+(((a)&4)<<((b)-2)) \
+		       +(((a)&2)<<((b)*2-1))+(((a)&1u)<<((b)*3)))*((1<<(b))-1))
+#define FB_GEN1(a) ((a)/8+((a)&4)/2+((a)&2)*2+((a)&1)*8)
+#else
+#define FB_GEN(a, b) (((((a)/8)<<((b)*3))+(((a)&4)<<((b)*2-2)) \
+		       +(((a)&2)<<(b-1))+((a)&1u))*((1<<(b))-1))
+#define FB_GEN1(a) (a)
+#endif
+
+#define FB_GENx(a) { FB_GEN(0, (a)), FB_GEN(1, (a)), FB_GEN(2, (a)), FB_GEN(3, (a)),	\
+	FB_GEN(4, (a)), FB_GEN(5, (a)), FB_GEN(6, (a)), FB_GEN(7, (a)),			\
+	FB_GEN(8, (a)), FB_GEN(9, (a)), FB_GEN(10, (a)), FB_GEN(11, (a)),		\
+	FB_GEN(12, (a)), FB_GEN(13, (a)), FB_GEN(14, (a)), FB_GEN(15, (a)) }
+
+/* draw a 2 color image four pixels at a time (for 1-8 bpp only) */
+static inline void fb_bitmap4x_imageblit(const struct fb_image *image, struct fb_address *dst,
+					 unsigned long fgcolor, unsigned long bgcolor, int bpp,
+					 unsigned int bits_per_line, struct fb_reverse reverse)
+{
+	static const u32 mul[BITS_PER_BYTE] = {
+		0xf, 0x55, 0x249, 0x1111, 0x8421, 0x41041, 0x204081, 0x01010101
+	};
+	static const u32 expand[BITS_PER_BYTE][1 << 4] = {
+		{
+			FB_GEN1(0), FB_GEN1(1), FB_GEN1(2), FB_GEN1(3),
+			FB_GEN1(4), FB_GEN1(5), FB_GEN1(6), FB_GEN1(7),
+			FB_GEN1(8), FB_GEN1(9), FB_GEN1(10), FB_GEN1(11),
+			FB_GEN1(12), FB_GEN1(13), FB_GEN1(14), FB_GEN1(15)
+		},
+		FB_GENx(2), FB_GENx(3), FB_GENx(4),
+		FB_GENx(5), FB_GENx(6), FB_GENx(7), FB_GENx(8),
+	};
+	struct fb_bitmap4x_iter iter;
+	u32 height;
+
+	iter.data = (const u8 *)image->data;
+	if (reverse.pixel) {
+		fgcolor = fb_reverse_bits_long(fgcolor << (BITS_PER_BYTE - bpp));
+		bgcolor = fb_reverse_bits_long(bgcolor << (BITS_PER_BYTE - bpp));
+	}
+	iter.fgxcolor = (fgcolor ^ bgcolor) * mul[bpp-1];
+	iter.bgcolor = bgcolor * mul[bpp-1];
+	iter.width = image->width;
+	iter.i = image->width;
+	iter.expand = expand[bpp-1];
+	iter.bpp = bpp;
+	iter.top = false;
+
+	height = image->height;
+	while (height--) {
+		fb_bitblit(fb_bitmap4x_image, &iter, bpp * BITS_PER_BYTE/2, dst, reverse);
+		fb_address_forward(dst, bits_per_line);
+	}
+}
+
+/* draw a bitmap image 1 pixel at a time (for >8 bpp) */
+static inline void fb_bitmap1x_imageblit(const struct fb_image *image, struct fb_address *dst,
+					 unsigned long fgcolor, unsigned long bgcolor, int bpp,
+					 unsigned int bits_per_line, struct fb_reverse reverse)
+{
+	struct fb_bitmap_iter iter;
+	u32 height;
+
+	iter.colors[0] = bgcolor;
+	iter.colors[1] = fgcolor;
+#ifndef __LITTLE_ENDIAN
+	iter.colors[0] <<= BITS_PER_LONG - bpp;
+	iter.colors[1] <<= BITS_PER_LONG - bpp;
+#endif
+	iter.data = (const u8 *)image->data;
+	iter.width = image->width;
+	iter.i = 0;
+
+	height = image->height;
+	while (height--) {
+		fb_bitblit(fb_bitmap_image, &iter, bpp, dst, reverse);
+		fb_address_forward(dst, bits_per_line);
+	}
+}
+
+/* one pixel per word, 64/32 bpp blitting */
+static inline void fb_bitmap_1ppw(const struct fb_image *image, struct fb_address *dst,
+				  unsigned long fgcolor, unsigned long bgcolor,
+				  int words_per_line, struct fb_reverse reverse)
+{
+	unsigned long tab[2];
+	const u8 *src = (u8 *)image->data;
+	int width = image->width;
+	int offset;
+	u32 height;
+
+	if (reverse.byte) {
+		tab[0] = swab_long(bgcolor);
+		tab[1] = swab_long(fgcolor);
+	} else {
+		tab[0] = bgcolor;
+		tab[1] = fgcolor;
+	}
+
+	height = image->height;
+	while (height--) {
+		for (offset = 0; offset + 8 <= width; offset += 8) {
+			unsigned int srcbyte = *src++;
+
+			fb_write_offset(tab[(srcbyte >> 7) & 1], offset + 0, dst);
+			fb_write_offset(tab[(srcbyte >> 6) & 1], offset + 1, dst);
+			fb_write_offset(tab[(srcbyte >> 5) & 1], offset + 2, dst);
+			fb_write_offset(tab[(srcbyte >> 4) & 1], offset + 3, dst);
+			fb_write_offset(tab[(srcbyte >> 3) & 1], offset + 4, dst);
+			fb_write_offset(tab[(srcbyte >> 2) & 1], offset + 5, dst);
+			fb_write_offset(tab[(srcbyte >> 1) & 1], offset + 6, dst);
+			fb_write_offset(tab[(srcbyte >> 0) & 1], offset + 7, dst);
+		}
+
+		if (offset < width) {
+			unsigned int srcbyte = *src++;
+
+			while (offset < width) {
+				fb_write_offset(tab[(srcbyte >> 7) & 1], offset, dst);
+				srcbyte <<= 1;
+				offset++;
+			}
+		}
+		fb_address_move_long(dst, words_per_line);
+	}
+}
+
+static inline unsigned long fb_pack(unsigned long left, unsigned long right, int bits)
+{
+#ifdef __LITTLE_ENDIAN
+	return left | right << bits;
+#else
+	return right | left << bits;
+#endif
+}
+
+/* aligned 32/16 bpp blitting */
+static inline void fb_bitmap_2ppw(const struct fb_image *image, struct fb_address *dst,
+				  unsigned long fgcolor, unsigned long bgcolor,
+				  int words_per_line, struct fb_reverse reverse)
+{
+	unsigned long tab[4];
+	const u8 *src = (u8 *)image->data;
+	int width = image->width / 2;
+	int offset;
+	u32 height;
+
+	tab[0] = fb_pack(bgcolor, bgcolor, BITS_PER_LONG/2);
+	tab[1] = fb_pack(bgcolor, fgcolor, BITS_PER_LONG/2);
+	tab[2] = fb_pack(fgcolor, bgcolor, BITS_PER_LONG/2);
+	tab[3] = fb_pack(fgcolor, fgcolor, BITS_PER_LONG/2);
+
+	if (reverse.byte) {
+		tab[0] = swab_long(tab[0]);
+		tab[1] = swab_long(tab[1]);
+		tab[2] = swab_long(tab[2]);
+		tab[3] = swab_long(tab[3]);
+	}
+
+	height = image->height;
+	while (height--) {
+		for (offset = 0; offset + 4 <= width; offset += 4) {
+			unsigned int srcbyte = *src++;
+
+			fb_write_offset(tab[(srcbyte >> 6) & 3], offset + 0, dst);
+			fb_write_offset(tab[(srcbyte >> 4) & 3], offset + 1, dst);
+			fb_write_offset(tab[(srcbyte >> 2) & 3], offset + 2, dst);
+			fb_write_offset(tab[(srcbyte >> 0) & 3], offset + 3, dst);
+		}
+
+		if (offset < width) {
+			unsigned int srcbyte = *src++;
+
+			while (offset < width) {
+				fb_write_offset(tab[(srcbyte >> 6) & 3], offset, dst);
+				srcbyte <<= 2;
+				offset++;
+			}
+		}
+		fb_address_move_long(dst, words_per_line);
+	}
+}
+
+#define FB_PATP(a, b) (((a)<<((b)*BITS_PER_LONG/4))*((1UL<<BITS_PER_LONG/4)-1UL))
+#define FB_PAT4(a) (FB_PATP((a)&1, 0)|FB_PATP(((a)&2)/2, 1)| \
+	FB_PATP(((a)&4)/4, 2)|FB_PATP(((a)&8)/8, 3))
+
+/* aligned 16/8 bpp blitting */
+static inline void fb_bitmap_4ppw(const struct fb_image *image, struct fb_address *dst,
+				  unsigned long fgcolor, unsigned long bgcolor,
+				  int words_per_line, struct fb_reverse reverse)
+{
+	static const unsigned long tab16_be[] = {
+		0, FB_PAT4(1UL), FB_PAT4(2UL), FB_PAT4(3UL),
+		FB_PAT4(4UL), FB_PAT4(5UL), FB_PAT4(6UL), FB_PAT4(7UL),
+		FB_PAT4(8UL), FB_PAT4(9UL), FB_PAT4(10UL), FB_PAT4(11UL),
+		FB_PAT4(12UL), FB_PAT4(13UL), FB_PAT4(14UL), ~0UL
+	};
+	static const unsigned long tab16_le[] = {
+		0, FB_PAT4(8UL), FB_PAT4(4UL), FB_PAT4(12UL),
+		FB_PAT4(2UL), FB_PAT4(10UL), FB_PAT4(6UL), FB_PAT4(14UL),
+		FB_PAT4(1UL), FB_PAT4(9UL), FB_PAT4(5UL), FB_PAT4(13UL),
+		FB_PAT4(3UL), FB_PAT4(11UL), FB_PAT4(7UL), ~0UL
+	};
+	const unsigned long *tab;
+	const u8 *src = (u8 *)image->data;
+	int width = image->width / 4;
+	int offset;
+	u32 height;
+
+	fgcolor = fgcolor | fgcolor << BITS_PER_LONG/4;
+	bgcolor = bgcolor | bgcolor << BITS_PER_LONG/4;
+	fgcolor = fgcolor | fgcolor << BITS_PER_LONG/2;
+	bgcolor = bgcolor | bgcolor << BITS_PER_LONG/2;
+	fgcolor ^= bgcolor;
+
+	if (BITS_PER_LONG/4 > BITS_PER_BYTE && reverse.byte) {
+		fgcolor = swab_long(fgcolor);
+		bgcolor = swab_long(bgcolor);
+	}
+
+#ifdef __LITTLE_ENDIAN
+	tab = reverse.byte ? tab16_be : tab16_le;
+#else
+	tab = reverse.byte ? tab16_le : tab16_be;
+#endif
+
+	height = image->height;
+	while (height--) {
+		for (offset = 0; offset + 2 <= width; offset += 2, src++) {
+			fb_write_offset((fgcolor & tab[*src >> 4]) ^ bgcolor, offset + 0, dst);
+			fb_write_offset((fgcolor & tab[*src & 0xf]) ^ bgcolor, offset + 1, dst);
+		}
+
+		if (offset < width)
+			fb_write_offset((fgcolor & tab[*src++ >> 4]) ^ bgcolor, offset, dst);
+
+		fb_address_move_long(dst, words_per_line);
+	}
+}
+
+static inline void fb_bitmap_imageblit(const struct fb_image *image, struct fb_address *dst,
+				       unsigned int bits_per_line, const u32 *palette, int bpp,
+				       struct fb_reverse reverse)
+{
+	unsigned long fgcolor, bgcolor;
+
+	if (palette) {
+		fgcolor = palette[image->fg_color];
+		bgcolor = palette[image->bg_color];
+	} else {
+		fgcolor = image->fg_color;
+		bgcolor = image->bg_color;
+	}
+
+	if (!dst->bits && !(bits_per_line & (BITS_PER_LONG-1))) {
+		if (bpp == BITS_PER_LONG && BITS_PER_LONG == 32) {
+			fb_bitmap_1ppw(image, dst, fgcolor, bgcolor,
+				       bits_per_line / BITS_PER_LONG, reverse);
+			return;
+		}
+		if (bpp == BITS_PER_LONG/2 && !(image->width & 1)) {
+			fb_bitmap_2ppw(image, dst, fgcolor, bgcolor,
+				       bits_per_line / BITS_PER_LONG, reverse);
+			return;
+		}
+		if (bpp == BITS_PER_LONG/4 && !(image->width & 3)) {
+			fb_bitmap_4ppw(image, dst, fgcolor, bgcolor,
+				       bits_per_line / BITS_PER_LONG, reverse);
+			return;
+		}
+	}
+
+	if (bpp > 0 && bpp <= BITS_PER_BYTE)
+		fb_bitmap4x_imageblit(image, dst, fgcolor, bgcolor, bpp,
+				     bits_per_line, reverse);
+	else if (bpp > BITS_PER_BYTE && bpp <= BITS_PER_LONG)
+		fb_bitmap1x_imageblit(image, dst, fgcolor, bgcolor, bpp,
+				     bits_per_line, reverse);
+}
+
+static inline void fb_imageblit(struct fb_info *p, const struct fb_image *image)
+{
+	int bpp = p->var.bits_per_pixel;
+	unsigned int bits_per_line = BYTES_TO_BITS(p->fix.line_length);
+	struct fb_address dst = fb_address_init(p);
+	struct fb_reverse reverse = fb_reverse_init(p);
+	const u32 *palette = fb_palette(p);
+
+	fb_address_forward(&dst, image->dy * bits_per_line + image->dx * bpp);
+
+	if (image->depth == 1)
+		fb_bitmap_imageblit(image, &dst, bits_per_line, palette, bpp, reverse);
+	else
+		fb_color_imageblit(image, &dst, bits_per_line, palette, bpp, reverse);
+}
diff --git a/drivers/video/fbdev/core/syscopyarea.c b/drivers/video/fbdev/core/syscopyarea.c
index 75e7001e8..b634e2d21 100644
--- a/drivers/video/fbdev/core/syscopyarea.c
+++ b/drivers/video/fbdev/core/syscopyarea.c
@@ -1,373 +1,28 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
- *  Generic Bit Block Transfer for frame buffers located in system RAM with
- *  packed pixels of any depth.
- *
- *  Based almost entirely from cfbcopyarea.c (which is based almost entirely
- *  on Geert Uytterhoeven's copyarea routine)
- *
- *      Copyright (C)  2007 Antonino Daplas <adaplas@pol.net>
- *
- *  This file is subject to the terms and conditions of the GNU General Public
- *  License.  See the file COPYING in the main directory of this archive for
- *  more details.
- *
+ *	Copyright (C)  2025 Zsolt Kajtar (soci@c64.rulez.org)
  */
 #include <linux/module.h>
-#include <linux/kernel.h>
-#include <linux/string.h>
 #include <linux/fb.h>
+#include <linux/bitrev.h>
 #include <asm/types.h>
-#include <asm/io.h>
-#include "fb_draw.h"
 
-    /*
-     *  Generic bitwise copy algorithm
-     */
+#ifdef CONFIG_FB_SYS_REV_PIXELS_IN_BYTE
+#define FB_REV_PIXELS_IN_BYTE
+#endif
 
-static void
-bitcpy(struct fb_info *p, unsigned long *dst, unsigned dst_idx,
-	const unsigned long *src, unsigned src_idx, int bits, unsigned n)
-{
-	unsigned long first, last;
-	int const shift = dst_idx-src_idx;
-	int left, right;
-
-	first = FB_SHIFT_HIGH(p, ~0UL, dst_idx);
-	last = ~(FB_SHIFT_HIGH(p, ~0UL, (dst_idx+n) % bits));
-
-	if (!shift) {
-		/* Same alignment for source and dest */
-		if (dst_idx+n <= bits) {
-			/* Single word */
-			if (last)
-				first &= last;
-			*dst = comp(*src, *dst, first);
-		} else {
-			/* Multiple destination words */
-			/* Leading bits */
- 			if (first != ~0UL) {
-				*dst = comp(*src, *dst, first);
-				dst++;
-				src++;
-				n -= bits - dst_idx;
-			}
-
-			/* Main chunk */
-			n /= bits;
-			while (n >= 8) {
-				*dst++ = *src++;
-				*dst++ = *src++;
-				*dst++ = *src++;
-				*dst++ = *src++;
-				*dst++ = *src++;
-				*dst++ = *src++;
-				*dst++ = *src++;
-				*dst++ = *src++;
-				n -= 8;
-			}
-			while (n--)
-				*dst++ = *src++;
-
-			/* Trailing bits */
-			if (last)
-				*dst = comp(*src, *dst, last);
-		}
-	} else {
-		unsigned long d0, d1;
-		int m;
-
-		/* Different alignment for source and dest */
-		right = shift & (bits - 1);
-		left = -shift & (bits - 1);
-
-		if (dst_idx+n <= bits) {
-			/* Single destination word */
-			if (last)
-				first &= last;
-			if (shift > 0) {
-				/* Single source word */
-				*dst = comp(*src << left, *dst, first);
-			} else if (src_idx+n <= bits) {
-				/* Single source word */
-				*dst = comp(*src >> right, *dst, first);
-			} else {
-				/* 2 source words */
-				d0 = *src++;
-				d1 = *src;
-				*dst = comp(d0 >> right | d1 << left, *dst,
-					    first);
-			}
-		} else {
-			/* Multiple destination words */
-			/** We must always remember the last value read,
-			    because in case SRC and DST overlap bitwise (e.g.
-			    when moving just one pixel in 1bpp), we always
-			    collect one full long for DST and that might
-			    overlap with the current long from SRC. We store
-			    this value in 'd0'. */
-			d0 = *src++;
-			/* Leading bits */
-			if (shift > 0) {
-				/* Single source word */
-				*dst = comp(d0 << left, *dst, first);
-				dst++;
-				n -= bits - dst_idx;
-			} else {
-				/* 2 source words */
-				d1 = *src++;
-				*dst = comp(d0 >> right | d1 << left, *dst,
-					    first);
-				d0 = d1;
-				dst++;
-				n -= bits - dst_idx;
-			}
-
-			/* Main chunk */
-			m = n % bits;
-			n /= bits;
-			while (n >= 4) {
-				d1 = *src++;
-				*dst++ = d0 >> right | d1 << left;
-				d0 = d1;
-				d1 = *src++;
-				*dst++ = d0 >> right | d1 << left;
-				d0 = d1;
-				d1 = *src++;
-				*dst++ = d0 >> right | d1 << left;
-				d0 = d1;
-				d1 = *src++;
-				*dst++ = d0 >> right | d1 << left;
-				d0 = d1;
-				n -= 4;
-			}
-			while (n--) {
-				d1 = *src++;
-				*dst++ = d0 >> right | d1 << left;
-				d0 = d1;
-			}
-
-			/* Trailing bits */
-			if (m) {
-				if (m <= bits - right) {
-					/* Single source word */
-					d0 >>= right;
-				} else {
-					/* 2 source words */
- 					d1 = *src;
-					d0 = d0 >> right | d1 << left;
-				}
-				*dst = comp(d0, *dst, last);
-			}
-		}
-	}
-}
-
-    /*
-     *  Generic bitwise copy algorithm, operating backward
-     */
-
-static void
-bitcpy_rev(struct fb_info *p, unsigned long *dst, unsigned dst_idx,
-	   const unsigned long *src, unsigned src_idx, unsigned bits,
-	   unsigned n)
-{
-	unsigned long first, last;
-	int shift;
-
-	dst += (dst_idx + n - 1) / bits;
-	src += (src_idx + n - 1) / bits;
-	dst_idx = (dst_idx + n - 1) % bits;
-	src_idx = (src_idx + n - 1) % bits;
-
-	shift = dst_idx-src_idx;
-
-	first = ~FB_SHIFT_HIGH(p, ~0UL, (dst_idx + 1) % bits);
-	last = FB_SHIFT_HIGH(p, ~0UL, (bits + dst_idx + 1 - n) % bits);
-
-	if (!shift) {
-		/* Same alignment for source and dest */
-		if ((unsigned long)dst_idx+1 >= n) {
-			/* Single word */
-			if (first)
-				last &= first;
-			*dst = comp(*src, *dst, last);
-		} else {
-			/* Multiple destination words */
-
-			/* Leading bits */
-			if (first) {
-				*dst = comp(*src, *dst, first);
-				dst--;
-				src--;
-				n -= dst_idx+1;
-			}
-
-			/* Main chunk */
-			n /= bits;
-			while (n >= 8) {
-				*dst-- = *src--;
-				*dst-- = *src--;
-				*dst-- = *src--;
-				*dst-- = *src--;
-				*dst-- = *src--;
-				*dst-- = *src--;
-				*dst-- = *src--;
-				*dst-- = *src--;
-				n -= 8;
-			}
-			while (n--)
-				*dst-- = *src--;
-			/* Trailing bits */
-			if (last != -1UL)
-				*dst = comp(*src, *dst, last);
-		}
-	} else {
-		/* Different alignment for source and dest */
-
-		int const left = shift & (bits-1);
-		int const right = -shift & (bits-1);
-
-		if ((unsigned long)dst_idx+1 >= n) {
-			/* Single destination word */
-			if (first)
-				last &= first;
-			if (shift < 0) {
-				/* Single source word */
-				*dst = comp(*src >> right, *dst, last);
-			} else if (1+(unsigned long)src_idx >= n) {
-				/* Single source word */
-				*dst = comp(*src << left, *dst, last);
-			} else {
-				/* 2 source words */
-				*dst = comp(*src << left | *(src-1) >> right,
-					    *dst, last);
-			}
-		} else {
-			/* Multiple destination words */
-			/** We must always remember the last value read,
-			    because in case SRC and DST overlap bitwise (e.g.
-			    when moving just one pixel in 1bpp), we always
-			    collect one full long for DST and that might
-			    overlap with the current long from SRC. We store
-			    this value in 'd0'. */
-			unsigned long d0, d1;
-			int m;
-
-			d0 = *src--;
-			/* Leading bits */
-			if (shift < 0) {
-				/* Single source word */
-				d1 = d0;
-				d0 >>= right;
-			} else {
-				/* 2 source words */
-				d1 = *src--;
-				d0 = d0 << left | d1 >> right;
-			}
-			if (!first)
-				*dst = d0;
-			else
-				*dst = comp(d0, *dst, first);
-			d0 = d1;
-			dst--;
-			n -= dst_idx+1;
-
-			/* Main chunk */
-			m = n % bits;
-			n /= bits;
-			while (n >= 4) {
-				d1 = *src--;
-				*dst-- = d0 << left | d1 >> right;
-				d0 = d1;
-				d1 = *src--;
-				*dst-- = d0 << left | d1 >> right;
-				d0 = d1;
-				d1 = *src--;
-				*dst-- = d0 << left | d1 >> right;
-				d0 = d1;
-				d1 = *src--;
-				*dst-- = d0 << left | d1 >> right;
-				d0 = d1;
-				n -= 4;
-			}
-			while (n--) {
-				d1 = *src--;
-				*dst-- = d0 << left | d1 >> right;
-				d0 = d1;
-			}
-
-			/* Trailing bits */
-			if (m) {
-				if (m <= bits - left) {
-					/* Single source word */
-					d0 <<= left;
-				} else {
-					/* 2 source words */
-					d1 = *src;
-					d0 = d0 << left | d1 >> right;
-				}
-				*dst = comp(d0, *dst, last);
-			}
-		}
-	}
-}
+#include "sysmem.h"
+#include "fb_copyarea.h"
 
 void sys_copyarea(struct fb_info *p, const struct fb_copyarea *area)
 {
-	u32 dx = area->dx, dy = area->dy, sx = area->sx, sy = area->sy;
-	u32 height = area->height, width = area->width;
-	unsigned int const bits_per_line = p->fix.line_length * 8u;
-	unsigned long *base = NULL;
-	int bits = BITS_PER_LONG, bytes = bits >> 3;
-	unsigned dst_idx = 0, src_idx = 0, rev_copy = 0;
-
-	if (p->state != FBINFO_STATE_RUNNING)
-		return;
-
 	if (!(p->flags & FBINFO_VIRTFB))
-		fb_warn_once(p, "Framebuffer is not in virtual address space.");
-
-	/* if the beginning of the target area might overlap with the end of
-	the source area, be have to copy the area reverse. */
-	if ((dy == sy && dx > sx) || (dy > sy)) {
-		dy += height;
-		sy += height;
-		rev_copy = 1;
-	}
+		fb_warn_once(p, "%s: framebuffer is not in virtual address space.\n", __func__);
 
-	/* split the base of the framebuffer into a long-aligned address and
-	   the index of the first bit */
-	base = (unsigned long *)((unsigned long)p->screen_base & ~(bytes-1));
-	dst_idx = src_idx = 8*((unsigned long)p->screen_base & (bytes-1));
-	/* add offset of source and target area */
-	dst_idx += dy*bits_per_line + dx*p->var.bits_per_pixel;
-	src_idx += sy*bits_per_line + sx*p->var.bits_per_pixel;
-
-	if (p->fbops->fb_sync)
-		p->fbops->fb_sync(p);
-
-	if (rev_copy) {
-		while (height--) {
-			dst_idx -= bits_per_line;
-			src_idx -= bits_per_line;
-			bitcpy_rev(p, base + (dst_idx / bits), dst_idx % bits,
-				base + (src_idx / bits), src_idx % bits, bits,
-				width*p->var.bits_per_pixel);
-		}
-	} else {
-		while (height--) {
-			bitcpy(p, base + (dst_idx / bits), dst_idx % bits,
-				base + (src_idx / bits), src_idx % bits, bits,
-				width*p->var.bits_per_pixel);
-			dst_idx += bits_per_line;
-			src_idx += bits_per_line;
-		}
-	}
+	fb_copyarea(p, area);
 }
-
 EXPORT_SYMBOL(sys_copyarea);
 
-MODULE_AUTHOR("Antonino Daplas <adaplas@pol.net>");
-MODULE_DESCRIPTION("Generic copyarea (sys-to-sys)");
+MODULE_AUTHOR("Zsolt Kajtar <soci@c64.rulez.org>");
+MODULE_DESCRIPTION("Virtual memory packed pixel framebuffer area copy");
 MODULE_LICENSE("GPL");
-
diff --git a/drivers/video/fbdev/core/sysfillrect.c b/drivers/video/fbdev/core/sysfillrect.c
index e49221a88..372ca6a32 100644
--- a/drivers/video/fbdev/core/sysfillrect.c
+++ b/drivers/video/fbdev/core/sysfillrect.c
@@ -1,328 +1,28 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
- *  Generic fillrect for frame buffers in system RAM with packed pixels of
- *  any depth.
- *
- *  Based almost entirely from cfbfillrect.c (which is based almost entirely
- *  on Geert Uytterhoeven's fillrect routine)
- *
- *      Copyright (C)  2007 Antonino Daplas <adaplas@pol.net>
- *
- *  This file is subject to the terms and conditions of the GNU General Public
- *  License.  See the file COPYING in the main directory of this archive for
- *  more details.
+ *	Copyright (C)  2025 Zsolt Kajtar (soci@c64.rulez.org)
  */
 #include <linux/module.h>
-#include <linux/string.h>
 #include <linux/fb.h>
+#include <linux/bitrev.h>
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
+#ifdef CONFIG_FB_SYS_REV_PIXELS_IN_BYTE
+#define FB_REV_PIXELS_IN_BYTE
+#endif
 
-		/* Trailing bits */
-		if (last)
-			*dst = comp(*dst ^ pat, *dst, last);
-	}
-}
+#include "sysmem.h"
+#include "fb_fillrect.h"
 
 void sys_fillrect(struct fb_info *p, const struct fb_fillrect *rect)
 {
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
 	if (!(p->flags & FBINFO_VIRTFB))
-		fb_warn_once(p, "Framebuffer is not in virtual address space.");
+		fb_warn_once(p, "%s: framebuffer is not in virtual address space.\n", __func__);
 
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
+	fb_fillrect(p, rect);
 }
-
 EXPORT_SYMBOL(sys_fillrect);
 
-MODULE_AUTHOR("Antonino Daplas <adaplas@pol.net>");
-MODULE_DESCRIPTION("Generic fill rectangle (sys-to-sys)");
+MODULE_AUTHOR("Zsolt Kajtar <soci@c64.rulez.org>");
+MODULE_DESCRIPTION("Virtual memory packed pixel framebuffer area fill");
 MODULE_LICENSE("GPL");
diff --git a/drivers/video/fbdev/core/sysimgblt.c b/drivers/video/fbdev/core/sysimgblt.c
index 6949bbd51..c756cc658 100644
--- a/drivers/video/fbdev/core/sysimgblt.c
+++ b/drivers/video/fbdev/core/sysimgblt.c
@@ -1,339 +1,28 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
- *  Generic 1-bit or 8-bit source to 1-32 bit destination expansion
- *  for frame buffer located in system RAM with packed pixels of any depth.
- *
- *  Based almost entirely on cfbimgblt.c
- *
- *      Copyright (C)  April 2007 Antonino Daplas <adaplas@pol.net>
- *
- *  This file is subject to the terms and conditions of the GNU General Public
- *  License.  See the file COPYING in the main directory of this archive for
- *  more details.
+ *	Copyright (C)  2025 Zsolt Kajtar (soci@c64.rulez.org)
  */
 #include <linux/module.h>
-#include <linux/string.h>
 #include <linux/fb.h>
+#include <linux/bitrev.h>
 #include <asm/types.h>
 
-#define DEBUG
-
-#ifdef DEBUG
-#define DPRINTK(fmt, args...) printk(KERN_DEBUG "%s: " fmt,__func__,## args)
-#else
-#define DPRINTK(fmt, args...)
+#ifdef CONFIG_FB_SYS_REV_PIXELS_IN_BYTE
+#define FB_REV_PIXELS_IN_BYTE
 #endif
 
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
+#include "sysmem.h"
+#include "fb_imageblit.h"
 
 void sys_imageblit(struct fb_info *p, const struct fb_image *image)
 {
-	u32 fgcolor, bgcolor, start_index, bitstart, pitch_index = 0;
-	u32 bpl = sizeof(u32), bpp = p->var.bits_per_pixel;
-	u32 width = image->width;
-	u32 dx = image->dx, dy = image->dy;
-	void *dst1;
-
-	if (p->state != FBINFO_STATE_RUNNING)
-		return;
-
 	if (!(p->flags & FBINFO_VIRTFB))
-		fb_warn_once(p, "Framebuffer is not in virtual address space.");
-
-	bitstart = (dy * p->fix.line_length * 8) + (dx * bpp);
-	start_index = bitstart & (32 - 1);
-	pitch_index = (p->fix.line_length & (bpl - 1)) * 8;
+		fb_warn_once(p, "%s: framebuffer is not in virtual address space.\n", __func__);
 
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
+	fb_imageblit(p, image);
 }
-
 EXPORT_SYMBOL(sys_imageblit);
 
-MODULE_AUTHOR("Antonino Daplas <adaplas@pol.net>");
-MODULE_DESCRIPTION("1-bit/8-bit to 1-32 bit color expansion (sys-to-sys)");
+MODULE_AUTHOR("Zsolt Kajtar <soci@c64.rulez.org>");
+MODULE_DESCRIPTION("Virtual memory packed pixel framebuffer image draw");
 MODULE_LICENSE("GPL");
-
diff --git a/drivers/video/fbdev/core/sysmem.h b/drivers/video/fbdev/core/sysmem.h
new file mode 100644
index 000000000..033c31a96
--- /dev/null
+++ b/drivers/video/fbdev/core/sysmem.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ *
+ *	Virtual memory framebuffer access for drawing routines
+ *
+ *	Copyright (C) 2025 Zsolt Kajtar (soci@c64.rulez.org)
+ */
+
+/* keeps track of a bit address in framebuffer memory */
+struct fb_address {
+	void *address;
+	int bits;
+};
+
+/* initialize the bit address pointer to the beginning of the frame buffer */
+static inline struct fb_address fb_address_init(struct fb_info *p)
+{
+	void *base = p->screen_buffer;
+	struct fb_address ptr;
+
+	ptr.address = PTR_ALIGN_DOWN(base, BITS_PER_LONG / BITS_PER_BYTE);
+	ptr.bits = (base - ptr.address) * BITS_PER_BYTE;
+	return ptr;
+}
+
+/* framebuffer write access */
+static inline void fb_write_offset(unsigned long val, int offset, const struct fb_address *dst)
+{
+	unsigned long *mem = dst->address;
+
+	mem[offset] = val;
+}
+
+/* framebuffer read access */
+static inline unsigned long fb_read_offset(int offset, const struct fb_address *src)
+{
+	unsigned long *mem = src->address;
+
+	return mem[offset];
+}
-- 
2.30.2

