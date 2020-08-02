Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C93235A54
	for <lists+dri-devel@lfdr.de>; Sun,  2 Aug 2020 22:01:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EACD89E98;
	Sun,  2 Aug 2020 20:01:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B670489E98
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Aug 2020 20:01:49 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id AA5C520021;
 Sun,  2 Aug 2020 22:01:46 +0200 (CEST)
Date: Sun, 2 Aug 2020 22:01:45 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: daniel@ffwll.ch
Subject: Re: [PATCH 2/5] fbdev/core: Export framebuffer read and write code
 as cfb_ function
Message-ID: <20200802200145.GA12507@ravnborg.org>
References: <20200729134148.6855-1-tzimmermann@suse.de>
 <20200729134148.6855-3-tzimmermann@suse.de>
 <20200729135328.GP6419@phenom.ffwll.local>
 <20200729163603.GA1369638@ravnborg.org>
 <20200731092033.GV6419@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200731092033.GV6419@phenom.ffwll.local>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=p1g2r8j9AAAA:8
 a=YRs29l1yfvK6HhcXmWgA:9 a=eMjWwi6qkDe7RbnX:21 a=wbXMSMhRZcUk2yKq:21
 a=CnZuAXxiv7sOzcGW:21 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=GEd6vGEn79KL1p3bDQhq:22
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
Cc: linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com,
 jani.nikula@intel.com, dri-devel@lists.freedesktop.org, kraxel@redhat.com,
 airlied@redhat.com, natechancellor@gmail.com, peda@axentia.se,
 dan.carpenter@oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 31, 2020 at 11:20:33AM +0200, daniel@ffwll.ch wrote:
> On Wed, Jul 29, 2020 at 06:36:03PM +0200, Sam Ravnborg wrote:
> > Hi Daniel.
> > 
> > On Wed, Jul 29, 2020 at 03:53:28PM +0200, daniel@ffwll.ch wrote:
> > > On Wed, Jul 29, 2020 at 03:41:45PM +0200, Thomas Zimmermann wrote:
> > > > DRM fb helpers require read and write functions for framebuffer
> > > > memory. Export the existing code from fbdev.
> > > > 
> > > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > 
> > > Hm I'm not super sure whether we want to actually reuse this stuff ... We
> > > kinda don't care about the sparc special case, and just having an fbdev
> > > implementation witch has the switch between memcpy and memcpy_to/from_io
> > > in one single place sounds a lot simpler ...
> > > 
> > > This way we can have a clean split between the old horrors of real fbdev
> > > drivers, and a much cleaner world in drm. It would mean a bit of
> > > copypasting, but I think that's actually a good thing.
> > > 
> > > In general my idea for drm fbdev emulation is that for any area we have a
> > > problem we just ignore the entire fbmem.c code and write our own: mmap,
> > > backlight handling (still unsolved, and horrible), cfb vs sys here. This
> > > entire fbmem.c stuff is pretty bad midlayer, trying to avoid code
> > > duplication here doesn't seem worth it imo.
> > > 
> > > Thoughts?
> > 
> > 
> > I can see that fbmem is a mix of ioctl support and other stuff.
> > We could factor out all the ioctl parts of fbmem.c to a new file
> > named fbioctl.c.
> > 
> > And then let the ioctl parts call down into drm stuff and avoid reusing
> > the fbdev code when we first reach drm code.
> > This would require local copies of:
> > sys_read, sys_write, sys_fillrect, sys_copyarea, sys_imageblit
> > and more I think which I missed.
> > 
> > With local copies we could avoid some of the special cases and trim the
> > unctions to what is required by drm only.
> > And then no more fbmem dependencies and no dependencies to several of
> > the small helper functions. So less entanglement with fbdev core.
> > 
> > This all sounds simple so I am surely missing a lot a ugly details here.
> > 
> > And should we touch this anyway we need a test suite to verify not too
> > much breaks. To the best of my knowledge there is not yet such a test
> > suite :-( Maybe because people caring about fbdev are limited.
> 
> Well my idea was to not refactor anything, but just have drm copies of the
> various fb_ops callbacks. Definitely not even more refactoring :-)

$ wc -l drivers/gpu/drm/drm_fb_fbdev_helper.c
1212 drivers/gpu/drm/drm_fb_fbdev_helper.c

This is a straight copy of:
$ grep EXPORT drivers/gpu/drm/drm_fb_fbdev_helper.c
EXPORT_SYMBOL(drm_copyarea);
EXPORT_SYMBOL(drm_fillrect);
EXPORT_SYMBOL(drm_imageblit);
EXPORT_SYMBOL_GPL(drm_fb_read);
EXPORT_SYMBOL_GPL(drm_fb_write);

copyarea, fillrect and imageblit are a copy of the sys variants.
read and write are from fb_sys_fops.c

Patch builds but I am not a big fan yet - right now it gains us very
little. What would the next step be?

I looked briefly at the few drivers that have not migrated to
the generic fbdev emulation (yet?).
  msm
  omapdrm
  gma500

all uses sys_ variants - they already uses the migrated variants as
they call the drm_fb helper.


  exynos
  gma500
  i915
  nouveau
  radeon
  rockchip
  vmwgfx

all uses the cfb variants and cannot use the migrated variants as-is.

	Sam

From c554e8b9ec96e06a5933ed5bd834a928c977bcdf Mon Sep 17 00:00:00 2001
From: Sam Ravnborg <sam@ravnborg.org>
Date: Fri, 31 Jul 2020 23:36:01 +0200
Subject: [PATCH 1/3] drm: drm_fb_helper: copy fb_ops functions to drm

Copy the fbdev functions used by fb_ops to drm.
Having local copies enable the possibility
to adjust the functions so then are tailored to the need of DRM.
At the same time there is one less dependency between DRM and fbdev.

The files were copied verbatim and only minimal changes was made.

As some drivers uses the fbdev functions they continue to be build but
the generic fbdev emulation no longer uses the fbdev functions.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/Kconfig               |    1 -
 drivers/gpu/drm/Makefile              |    1 +
 drivers/gpu/drm/drm_fb_fbdev_helper.c | 1212 +++++++++++++++++++++++++
 drivers/gpu/drm/drm_fb_helper.c       |   30 +-
 include/drm/drm_fb_helper.h           |    6 +
 5 files changed, 1234 insertions(+), 16 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_fb_fbdev_helper.c

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index c4fd57d8b717..11f41bc31f05 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -83,7 +83,6 @@ config DRM_KMS_FB_HELPER
 	select FB
 	select FRAMEBUFFER_CONSOLE if !EXPERT
 	select FRAMEBUFFER_CONSOLE_DETECT_PRIMARY if FRAMEBUFFER_CONSOLE
-	select FB_SYS_FOPS
 	select FB_SYS_FILLRECT
 	select FB_SYS_COPYAREA
 	select FB_SYS_IMAGEBLIT
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 02ee5faf1a92..398cb4746762 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -50,6 +50,7 @@ drm_kms_helper-y := drm_bridge_connector.o drm_crtc_helper.o drm_dp_helper.o \
 
 drm_kms_helper-$(CONFIG_DRM_PANEL_BRIDGE) += bridge/panel.o
 drm_kms_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fb_helper.o
+drm_kms_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fb_fbdev_helper.o
 drm_kms_helper-$(CONFIG_DRM_KMS_CMA_HELPER) += drm_fb_cma_helper.o
 drm_kms_helper-$(CONFIG_DRM_DP_AUX_CHARDEV) += drm_dp_aux_dev.o
 drm_kms_helper-$(CONFIG_DRM_DP_CEC) += drm_dp_cec.o
diff --git a/drivers/gpu/drm/drm_fb_fbdev_helper.c b/drivers/gpu/drm/drm_fb_fbdev_helper.c
new file mode 100644
index 000000000000..dda60f85b9d5
--- /dev/null
+++ b/drivers/gpu/drm/drm_fb_fbdev_helper.c
@@ -0,0 +1,1212 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * This file is subject to the terms and conditions of the GNU General Public
+ * License.  See the file COPYING in the main directory of this archive for
+ * more details.
+ *
+ * Copyright (C)  2007 Antonino Daplas <adaplas@pol.net>
+ *
+ * drm_copyarea:
+ *   Based almost entirely from cfbcopyarea.c (which is based almost entirely
+ *   on Geert Uytterhoeven's copyarea routine)
+ *
+ *  drm_fillrect:
+ *    Based almost entirely from cfbfillrect.c (which is based almost entirely
+ *    on Geert Uytterhoeven's fillrect routine)
+ *
+ *  drm_imageblit:
+ *    Based almost entirely on cfbimgblt.c
+ *
+ */
+
+#include <linux/export.h>
+#include <linux/fb.h>
+#include <linux/io.h>
+
+
+/*
+*  Compose two values, using a bitmask as decision value
+*  This is equivalent to (a & mask) | (b & ~mask)
+*/
+static inline unsigned long
+comp(unsigned long a, unsigned long b, unsigned long mask)
+{
+    return ((a ^ b) & mask) ^ b;
+}
+
+/*
+ *  Create a pattern with the given pixel's color
+ */
+#if BITS_PER_LONG == 64
+static inline unsigned long
+pixel_to_pat( u32 bpp, u32 pixel)
+{
+	switch (bpp) {
+	case 1:
+		return 0xfffffffffffffffful*pixel;
+	case 2:
+		return 0x5555555555555555ul*pixel;
+	case 4:
+		return 0x1111111111111111ul*pixel;
+	case 8:
+		return 0x0101010101010101ul*pixel;
+	case 12:
+		return 0x1001001001001001ul*pixel;
+	case 16:
+		return 0x0001000100010001ul*pixel;
+	case 24:
+		return 0x0001000001000001ul*pixel;
+	case 32:
+		return 0x0000000100000001ul*pixel;
+	default:
+		WARN(1, "pixel_to_pat(): unsupported pixelformat %d\n", bpp);
+		return 0;
+    }
+}
+#else
+static inline unsigned long
+pixel_to_pat( u32 bpp, u32 pixel)
+{
+	switch (bpp) {
+	case 1:
+		return 0xfffffffful*pixel;
+	case 2:
+		return 0x55555555ul*pixel;
+	case 4:
+		return 0x11111111ul*pixel;
+	case 8:
+		return 0x01010101ul*pixel;
+	case 12:
+		return 0x01001001ul*pixel;
+	case 16:
+		return 0x00010001ul*pixel;
+	case 24:
+		return 0x01000001ul*pixel;
+	case 32:
+		return 0x00000001ul*pixel;
+	default:
+		WARN(1, "pixel_to_pat(): unsupported pixelformat %d\n", bpp);
+		return 0;
+    }
+}
+#endif
+
+#ifdef CONFIG_FB_CFB_REV_PIXELS_IN_BYTE
+#if BITS_PER_LONG == 64
+#define REV_PIXELS_MASK1 0x5555555555555555ul
+#define REV_PIXELS_MASK2 0x3333333333333333ul
+#define REV_PIXELS_MASK4 0x0f0f0f0f0f0f0f0ful
+#else
+#define REV_PIXELS_MASK1 0x55555555ul
+#define REV_PIXELS_MASK2 0x33333333ul
+#define REV_PIXELS_MASK4 0x0f0f0f0ful
+#endif
+
+static inline unsigned long fb_rev_pixels_in_long(unsigned long val,
+						  u32 bswapmask)
+{
+	if (bswapmask & 1)
+		val = comp(val >> 1, val << 1, REV_PIXELS_MASK1);
+	if (bswapmask & 2)
+		val = comp(val >> 2, val << 2, REV_PIXELS_MASK2);
+	if (bswapmask & 3)
+		val = comp(val >> 4, val << 4, REV_PIXELS_MASK4);
+	return val;
+}
+
+static inline u32 fb_shifted_pixels_mask_u32(struct fb_info *p, u32 index,
+					     u32 bswapmask)
+{
+	u32 mask;
+
+	if (!bswapmask) {
+		mask = FB_SHIFT_HIGH(p, ~(u32)0, index);
+	} else {
+		mask = 0xff << FB_LEFT_POS(p, 8);
+		mask = FB_SHIFT_LOW(p, mask, index & (bswapmask)) & mask;
+		mask = FB_SHIFT_HIGH(p, mask, index & ~(bswapmask));
+#if defined(__i386__) || defined(__x86_64__)
+		/* Shift argument is limited to 0 - 31 on x86 based CPU's */
+		if(index + bswapmask < 32)
+#endif
+			mask |= FB_SHIFT_HIGH(p, ~(u32)0,
+					(index + bswapmask) & ~(bswapmask));
+	}
+	return mask;
+}
+
+static inline unsigned long fb_shifted_pixels_mask_long(struct fb_info *p,
+							u32 index,
+							u32 bswapmask)
+{
+	unsigned long mask;
+
+	if (!bswapmask) {
+		mask = FB_SHIFT_HIGH(p, ~0UL, index);
+	} else {
+		mask = 0xff << FB_LEFT_POS(p, 8);
+		mask = FB_SHIFT_LOW(p, mask, index & (bswapmask)) & mask;
+		mask = FB_SHIFT_HIGH(p, mask, index & ~(bswapmask));
+#if defined(__i386__) || defined(__x86_64__)
+		/* Shift argument is limited to 0 - 31 on x86 based CPU's */
+		if(index + bswapmask < BITS_PER_LONG)
+#endif
+			mask |= FB_SHIFT_HIGH(p, ~0UL,
+					(index + bswapmask) & ~(bswapmask));
+	}
+	return mask;
+}
+
+
+static inline u32 fb_compute_bswapmask(struct fb_info *info)
+{
+	u32 bswapmask = 0;
+	unsigned bpp = info->var.bits_per_pixel;
+
+	if ((bpp < 8) && (info->var.nonstd & FB_NONSTD_REV_PIX_IN_B)) {
+		/*
+		 * Reversed order of pixel layout in bytes
+		 * works only for 1, 2 and 4 bpp
+		 */
+		bswapmask = 7 - bpp + 1;
+	}
+	return bswapmask;
+}
+
+#else /* CONFIG_FB_CFB_REV_PIXELS_IN_BYTE */
+
+static inline unsigned long fb_rev_pixels_in_long(unsigned long val,
+						  u32 bswapmask)
+{
+	return val;
+}
+
+#define fb_shifted_pixels_mask_u32(p, i, b) FB_SHIFT_HIGH((p), ~(u32)0, (i))
+#define fb_shifted_pixels_mask_long(p, i, b) FB_SHIFT_HIGH((p), ~0UL, (i))
+#define fb_compute_bswapmask(...) 0
+
+#endif  /* CONFIG_FB_CFB_REV_PIXELS_IN_BYTE */
+
+#define cpu_to_le_long _cpu_to_le_long(BITS_PER_LONG)
+#define _cpu_to_le_long(x) __cpu_to_le_long(x)
+#define __cpu_to_le_long(x) cpu_to_le##x
+
+#define le_long_to_cpu _le_long_to_cpu(BITS_PER_LONG)
+#define _le_long_to_cpu(x) __le_long_to_cpu(x)
+#define __le_long_to_cpu(x) le##x##_to_cpu
+
+static inline unsigned long rolx(unsigned long word, unsigned int shift, unsigned int x)
+{
+	return (word << shift) | (word >> (x - shift));
+}
+
+
+/*
+ *  Generic bitwise copy algorithm
+ */
+static void
+bitcpy(struct fb_info *p, unsigned long *dst, unsigned dst_idx,
+	const unsigned long *src, unsigned src_idx, int bits, unsigned n)
+{
+	unsigned long first, last;
+	int const shift = dst_idx-src_idx;
+	int left, right;
+
+	first = FB_SHIFT_HIGH(p, ~0UL, dst_idx);
+	last = ~(FB_SHIFT_HIGH(p, ~0UL, (dst_idx+n) % bits));
+
+	if (!shift) {
+		/* Same alignment for source and dest */
+		if (dst_idx+n <= bits) {
+			/* Single word */
+			if (last)
+				first &= last;
+			*dst = comp(*src, *dst, first);
+		} else {
+			/* Multiple destination words */
+			/* Leading bits */
+ 			if (first != ~0UL) {
+				*dst = comp(*src, *dst, first);
+				dst++;
+				src++;
+				n -= bits - dst_idx;
+			}
+
+			/* Main chunk */
+			n /= bits;
+			while (n >= 8) {
+				*dst++ = *src++;
+				*dst++ = *src++;
+				*dst++ = *src++;
+				*dst++ = *src++;
+				*dst++ = *src++;
+				*dst++ = *src++;
+				*dst++ = *src++;
+				*dst++ = *src++;
+				n -= 8;
+			}
+			while (n--)
+				*dst++ = *src++;
+
+			/* Trailing bits */
+			if (last)
+				*dst = comp(*src, *dst, last);
+		}
+	} else {
+		unsigned long d0, d1;
+		int m;
+
+		/* Different alignment for source and dest */
+		right = shift & (bits - 1);
+		left = -shift & (bits - 1);
+
+		if (dst_idx+n <= bits) {
+			/* Single destination word */
+			if (last)
+				first &= last;
+			if (shift > 0) {
+				/* Single source word */
+				*dst = comp(*src << left, *dst, first);
+			} else if (src_idx+n <= bits) {
+				/* Single source word */
+				*dst = comp(*src >> right, *dst, first);
+			} else {
+				/* 2 source words */
+				d0 = *src++;
+				d1 = *src;
+				*dst = comp(d0 >> right | d1 << left, *dst,
+					    first);
+			}
+		} else {
+			/* Multiple destination words */
+			/** We must always remember the last value read,
+			    because in case SRC and DST overlap bitwise (e.g.
+			    when moving just one pixel in 1bpp), we always
+			    collect one full long for DST and that might
+			    overlap with the current long from SRC. We store
+			    this value in 'd0'. */
+			d0 = *src++;
+			/* Leading bits */
+			if (shift > 0) {
+				/* Single source word */
+				*dst = comp(d0 << left, *dst, first);
+				dst++;
+				n -= bits - dst_idx;
+			} else {
+				/* 2 source words */
+				d1 = *src++;
+				*dst = comp(d0 >> right | d1 << left, *dst,
+					    first);
+				d0 = d1;
+				dst++;
+				n -= bits - dst_idx;
+			}
+
+			/* Main chunk */
+			m = n % bits;
+			n /= bits;
+			while (n >= 4) {
+				d1 = *src++;
+				*dst++ = d0 >> right | d1 << left;
+				d0 = d1;
+				d1 = *src++;
+				*dst++ = d0 >> right | d1 << left;
+				d0 = d1;
+				d1 = *src++;
+				*dst++ = d0 >> right | d1 << left;
+				d0 = d1;
+				d1 = *src++;
+				*dst++ = d0 >> right | d1 << left;
+				d0 = d1;
+				n -= 4;
+			}
+			while (n--) {
+				d1 = *src++;
+				*dst++ = d0 >> right | d1 << left;
+				d0 = d1;
+			}
+
+			/* Trailing bits */
+			if (m) {
+				if (m <= bits - right) {
+					/* Single source word */
+					d0 >>= right;
+				} else {
+					/* 2 source words */
+ 					d1 = *src;
+					d0 = d0 >> right | d1 << left;
+				}
+				*dst = comp(d0, *dst, last);
+			}
+		}
+	}
+}
+
+/*
+ *  Generic bitwise copy algorithm, operating backward
+ */
+static void
+bitcpy_rev(struct fb_info *p, unsigned long *dst, unsigned dst_idx,
+	   const unsigned long *src, unsigned src_idx, unsigned bits,
+	   unsigned n)
+{
+	unsigned long first, last;
+	int shift;
+
+	dst += (dst_idx + n - 1) / bits;
+	src += (src_idx + n - 1) / bits;
+	dst_idx = (dst_idx + n - 1) % bits;
+	src_idx = (src_idx + n - 1) % bits;
+
+	shift = dst_idx-src_idx;
+
+	first = ~FB_SHIFT_HIGH(p, ~0UL, (dst_idx + 1) % bits);
+	last = FB_SHIFT_HIGH(p, ~0UL, (bits + dst_idx + 1 - n) % bits);
+
+	if (!shift) {
+		/* Same alignment for source and dest */
+		if ((unsigned long)dst_idx+1 >= n) {
+			/* Single word */
+			if (first)
+				last &= first;
+			*dst = comp(*src, *dst, last);
+		} else {
+			/* Multiple destination words */
+
+			/* Leading bits */
+			if (first) {
+				*dst = comp(*src, *dst, first);
+				dst--;
+				src--;
+				n -= dst_idx+1;
+			}
+
+			/* Main chunk */
+			n /= bits;
+			while (n >= 8) {
+				*dst-- = *src--;
+				*dst-- = *src--;
+				*dst-- = *src--;
+				*dst-- = *src--;
+				*dst-- = *src--;
+				*dst-- = *src--;
+				*dst-- = *src--;
+				*dst-- = *src--;
+				n -= 8;
+			}
+			while (n--)
+				*dst-- = *src--;
+			/* Trailing bits */
+			if (last != -1UL)
+				*dst = comp(*src, *dst, last);
+		}
+	} else {
+		/* Different alignment for source and dest */
+
+		int const left = shift & (bits-1);
+		int const right = -shift & (bits-1);
+
+		if ((unsigned long)dst_idx+1 >= n) {
+			/* Single destination word */
+			if (first)
+				last &= first;
+			if (shift < 0) {
+				/* Single source word */
+				*dst = comp(*src >> right, *dst, last);
+			} else if (1+(unsigned long)src_idx >= n) {
+				/* Single source word */
+				*dst = comp(*src << left, *dst, last);
+			} else {
+				/* 2 source words */
+				*dst = comp(*src << left | *(src-1) >> right,
+					    *dst, last);
+			}
+		} else {
+			/* Multiple destination words */
+			/** We must always remember the last value read,
+			    because in case SRC and DST overlap bitwise (e.g.
+			    when moving just one pixel in 1bpp), we always
+			    collect one full long for DST and that might
+			    overlap with the current long from SRC. We store
+			    this value in 'd0'. */
+			unsigned long d0, d1;
+			int m;
+
+			d0 = *src--;
+			/* Leading bits */
+			if (shift < 0) {
+				/* Single source word */
+				d1 = d0;
+				d0 >>= right;
+			} else {
+				/* 2 source words */
+				d1 = *src--;
+				d0 = d0 << left | d1 >> right;
+			}
+			if (!first)
+				*dst = d0;
+			else
+				*dst = comp(d0, *dst, first);
+			d0 = d1;
+			dst--;
+			n -= dst_idx+1;
+
+			/* Main chunk */
+			m = n % bits;
+			n /= bits;
+			while (n >= 4) {
+				d1 = *src--;
+				*dst-- = d0 << left | d1 >> right;
+				d0 = d1;
+				d1 = *src--;
+				*dst-- = d0 << left | d1 >> right;
+				d0 = d1;
+				d1 = *src--;
+				*dst-- = d0 << left | d1 >> right;
+				d0 = d1;
+				d1 = *src--;
+				*dst-- = d0 << left | d1 >> right;
+				d0 = d1;
+				n -= 4;
+			}
+			while (n--) {
+				d1 = *src--;
+				*dst-- = d0 << left | d1 >> right;
+				d0 = d1;
+			}
+
+			/* Trailing bits */
+			if (m) {
+				if (m <= bits - left) {
+					/* Single source word */
+					d0 <<= left;
+				} else {
+					/* 2 source words */
+					d1 = *src;
+					d0 = d0 << left | d1 >> right;
+				}
+				*dst = comp(d0, *dst, last);
+			}
+		}
+	}
+}
+
+/*
+ * Generic Bit Block Transfer for frame buffers located in system RAM with
+ * packed pixels of any depth.
+ */
+void drm_copyarea(struct fb_info *p, const struct fb_copyarea *area)
+{
+	u32 dx = area->dx, dy = area->dy, sx = area->sx, sy = area->sy;
+	u32 height = area->height, width = area->width;
+	unsigned long const bits_per_line = p->fix.line_length*8u;
+	unsigned long *base = NULL;
+	int bits = BITS_PER_LONG, bytes = bits >> 3;
+	unsigned dst_idx = 0, src_idx = 0, rev_copy = 0;
+
+	if (p->state != FBINFO_STATE_RUNNING)
+		return;
+
+	/* if the beginning of the target area might overlap with the end of
+	the source area, be have to copy the area reverse. */
+	if ((dy == sy && dx > sx) || (dy > sy)) {
+		dy += height;
+		sy += height;
+		rev_copy = 1;
+	}
+
+	/* split the base of the framebuffer into a long-aligned address and
+	   the index of the first bit */
+	base = (unsigned long *)((unsigned long)p->screen_base & ~(bytes-1));
+	dst_idx = src_idx = 8*((unsigned long)p->screen_base & (bytes-1));
+	/* add offset of source and target area */
+	dst_idx += dy*bits_per_line + dx*p->var.bits_per_pixel;
+	src_idx += sy*bits_per_line + sx*p->var.bits_per_pixel;
+
+	if (p->fbops->fb_sync)
+		p->fbops->fb_sync(p);
+
+	if (rev_copy) {
+		while (height--) {
+			dst_idx -= bits_per_line;
+			src_idx -= bits_per_line;
+			bitcpy_rev(p, base + (dst_idx / bits), dst_idx % bits,
+				base + (src_idx / bits), src_idx % bits, bits,
+				width*p->var.bits_per_pixel);
+		}
+	} else {
+		while (height--) {
+			bitcpy(p, base + (dst_idx / bits), dst_idx % bits,
+				base + (src_idx / bits), src_idx % bits, bits,
+				width*p->var.bits_per_pixel);
+			dst_idx += bits_per_line;
+			src_idx += bits_per_line;
+		}
+	}
+}
+EXPORT_SYMBOL(drm_copyarea);
+
+/*
+ *  Aligned pattern fill using 32/64-bit memory accesses
+ */
+static void
+bitfill_aligned(struct fb_info *p, unsigned long *dst, int dst_idx,
+		unsigned long pat, unsigned n, int bits)
+{
+	unsigned long first, last;
+
+	if (!n)
+		return;
+
+	first = FB_SHIFT_HIGH(p, ~0UL, dst_idx);
+	last = ~(FB_SHIFT_HIGH(p, ~0UL, (dst_idx+n) % bits));
+
+	if (dst_idx+n <= bits) {
+		/* Single word */
+		if (last)
+			first &= last;
+		*dst = comp(pat, *dst, first);
+	} else {
+		/* Multiple destination words */
+
+		/* Leading bits */
+ 		if (first!= ~0UL) {
+			*dst = comp(pat, *dst, first);
+			dst++;
+			n -= bits - dst_idx;
+		}
+
+		/* Main chunk */
+		n /= bits;
+		while (n >= 8) {
+			*dst++ = pat;
+			*dst++ = pat;
+			*dst++ = pat;
+			*dst++ = pat;
+			*dst++ = pat;
+			*dst++ = pat;
+			*dst++ = pat;
+			*dst++ = pat;
+			n -= 8;
+		}
+		while (n--)
+			*dst++ = pat;
+		/* Trailing bits */
+		if (last)
+			*dst = comp(pat, *dst, last);
+	}
+}
+
+
+/*
+ *  Unaligned generic pattern fill using 32/64-bit memory accesses
+ *  The pattern must have been expanded to a full 32/64-bit value
+ *  Left/right are the appropriate shifts to convert to the pattern to be
+ *  used for the next 32/64-bit word
+ */
+static void
+bitfill_unaligned(struct fb_info *p, unsigned long *dst, int dst_idx,
+		  unsigned long pat, int left, int right, unsigned n, int bits)
+{
+	unsigned long first, last;
+
+	if (!n)
+		return;
+
+	first = FB_SHIFT_HIGH(p, ~0UL, dst_idx);
+	last = ~(FB_SHIFT_HIGH(p, ~0UL, (dst_idx+n) % bits));
+
+	if (dst_idx+n <= bits) {
+		/* Single word */
+		if (last)
+			first &= last;
+		*dst = comp(pat, *dst, first);
+	} else {
+		/* Multiple destination words */
+		/* Leading bits */
+		if (first) {
+			*dst = comp(pat, *dst, first);
+			dst++;
+			pat = pat << left | pat >> right;
+			n -= bits - dst_idx;
+		}
+
+		/* Main chunk */
+		n /= bits;
+		while (n >= 4) {
+			*dst++ = pat;
+			pat = pat << left | pat >> right;
+			*dst++ = pat;
+			pat = pat << left | pat >> right;
+			*dst++ = pat;
+			pat = pat << left | pat >> right;
+			*dst++ = pat;
+			pat = pat << left | pat >> right;
+			n -= 4;
+		}
+		while (n--) {
+			*dst++ = pat;
+			pat = pat << left | pat >> right;
+		}
+
+		/* Trailing bits */
+		if (last)
+			*dst = comp(pat, *dst, last);
+	}
+}
+
+/*
+ *  Aligned pattern invert using 32/64-bit memory accesses
+ */
+static void
+bitfill_aligned_rev(struct fb_info *p, unsigned long *dst, int dst_idx,
+		    unsigned long pat, unsigned n, int bits)
+{
+	unsigned long val = pat;
+	unsigned long first, last;
+
+	if (!n)
+		return;
+
+	first = FB_SHIFT_HIGH(p, ~0UL, dst_idx);
+	last = ~(FB_SHIFT_HIGH(p, ~0UL, (dst_idx+n) % bits));
+
+	if (dst_idx+n <= bits) {
+		/* Single word */
+		if (last)
+			first &= last;
+		*dst = comp(*dst ^ val, *dst, first);
+	} else {
+		/* Multiple destination words */
+		/* Leading bits */
+		if (first!=0UL) {
+			*dst = comp(*dst ^ val, *dst, first);
+			dst++;
+			n -= bits - dst_idx;
+		}
+
+		/* Main chunk */
+		n /= bits;
+		while (n >= 8) {
+			*dst++ ^= val;
+			*dst++ ^= val;
+			*dst++ ^= val;
+			*dst++ ^= val;
+			*dst++ ^= val;
+			*dst++ ^= val;
+			*dst++ ^= val;
+			*dst++ ^= val;
+			n -= 8;
+		}
+		while (n--)
+			*dst++ ^= val;
+		/* Trailing bits */
+		if (last)
+			*dst = comp(*dst ^ val, *dst, last);
+	}
+}
+
+
+/*
+ *  Unaligned generic pattern invert using 32/64-bit memory accesses
+ *  The pattern must have been expanded to a full 32/64-bit value
+ *  Left/right are the appropriate shifts to convert to the pattern to be
+ *  used for the next 32/64-bit word
+ */
+static void
+bitfill_unaligned_rev(struct fb_info *p, unsigned long *dst, int dst_idx,
+		      unsigned long pat, int left, int right, unsigned n,
+		      int bits)
+{
+	unsigned long first, last;
+
+	if (!n)
+		return;
+
+	first = FB_SHIFT_HIGH(p, ~0UL, dst_idx);
+	last = ~(FB_SHIFT_HIGH(p, ~0UL, (dst_idx+n) % bits));
+
+	if (dst_idx+n <= bits) {
+		/* Single word */
+		if (last)
+			first &= last;
+		*dst = comp(*dst ^ pat, *dst, first);
+	} else {
+		/* Multiple destination words */
+
+		/* Leading bits */
+		if (first != 0UL) {
+			*dst = comp(*dst ^ pat, *dst, first);
+			dst++;
+			pat = pat << left | pat >> right;
+			n -= bits - dst_idx;
+		}
+
+		/* Main chunk */
+		n /= bits;
+		while (n >= 4) {
+			*dst++ ^= pat;
+			pat = pat << left | pat >> right;
+			*dst++ ^= pat;
+			pat = pat << left | pat >> right;
+			*dst++ ^= pat;
+			pat = pat << left | pat >> right;
+			*dst++ ^= pat;
+			pat = pat << left | pat >> right;
+			n -= 4;
+		}
+		while (n--) {
+			*dst ^= pat;
+			pat = pat << left | pat >> right;
+		}
+
+		/* Trailing bits */
+		if (last)
+			*dst = comp(*dst ^ pat, *dst, last);
+	}
+}
+
+/*
+ * Generic fillrect for frame buffers in system RAM with packed pixels of
+ * any depth.
+ */
+void drm_fillrect(struct fb_info *p, const struct fb_fillrect *rect)
+{
+	unsigned long pat, pat2, fg;
+	unsigned long width = rect->width, height = rect->height;
+	int bits = BITS_PER_LONG, bytes = bits >> 3;
+	u32 bpp = p->var.bits_per_pixel;
+	unsigned long *dst;
+	int dst_idx, left;
+
+	if (p->state != FBINFO_STATE_RUNNING)
+		return;
+
+	if (p->fix.visual == FB_VISUAL_TRUECOLOR ||
+	    p->fix.visual == FB_VISUAL_DIRECTCOLOR )
+		fg = ((u32 *) (p->pseudo_palette))[rect->color];
+	else
+		fg = rect->color;
+
+	pat = pixel_to_pat( bpp, fg);
+
+	dst = (unsigned long *)((unsigned long)p->screen_base & ~(bytes-1));
+	dst_idx = ((unsigned long)p->screen_base & (bytes - 1))*8;
+	dst_idx += rect->dy*p->fix.line_length*8+rect->dx*bpp;
+	/* FIXME For now we support 1-32 bpp only */
+	left = bits % bpp;
+	if (p->fbops->fb_sync)
+		p->fbops->fb_sync(p);
+	if (!left) {
+		void (*fill_op32)(struct fb_info *p, unsigned long *dst,
+				  int dst_idx, unsigned long pat, unsigned n,
+				  int bits) = NULL;
+
+		switch (rect->rop) {
+		case ROP_XOR:
+			fill_op32 = bitfill_aligned_rev;
+			break;
+		case ROP_COPY:
+			fill_op32 = bitfill_aligned;
+			break;
+		default:
+			printk( KERN_ERR "cfb_fillrect(): unknown rop, "
+				"defaulting to ROP_COPY\n");
+			fill_op32 = bitfill_aligned;
+			break;
+		}
+		while (height--) {
+			dst += dst_idx >> (ffs(bits) - 1);
+			dst_idx &= (bits - 1);
+			fill_op32(p, dst, dst_idx, pat, width*bpp, bits);
+			dst_idx += p->fix.line_length*8;
+		}
+	} else {
+		int right, r;
+		void (*fill_op)(struct fb_info *p, unsigned long *dst,
+				int dst_idx, unsigned long pat, int left,
+				int right, unsigned n, int bits) = NULL;
+#ifdef __LITTLE_ENDIAN
+		right = left;
+		left = bpp - right;
+#else
+		right = bpp - left;
+#endif
+		switch (rect->rop) {
+		case ROP_XOR:
+			fill_op = bitfill_unaligned_rev;
+			break;
+		case ROP_COPY:
+			fill_op = bitfill_unaligned;
+			break;
+		default:
+			printk(KERN_ERR "sys_fillrect(): unknown rop, "
+				"defaulting to ROP_COPY\n");
+			fill_op = bitfill_unaligned;
+			break;
+		}
+		while (height--) {
+			dst += dst_idx / bits;
+			dst_idx &= (bits - 1);
+			r = dst_idx % bpp;
+			/* rotate pattern to the correct start position */
+			pat2 = le_long_to_cpu(rolx(cpu_to_le_long(pat), r, bpp));
+			fill_op(p, dst, dst_idx, pat2, left, right,
+				width*bpp, bits);
+			dst_idx += p->fix.line_length*8;
+		}
+	}
+}
+EXPORT_SYMBOL(drm_fillrect);
+
+static const u32 cfb_tab8_be[] = {
+    0x00000000,0x000000ff,0x0000ff00,0x0000ffff,
+    0x00ff0000,0x00ff00ff,0x00ffff00,0x00ffffff,
+    0xff000000,0xff0000ff,0xff00ff00,0xff00ffff,
+    0xffff0000,0xffff00ff,0xffffff00,0xffffffff
+};
+
+static const u32 cfb_tab8_le[] = {
+    0x00000000,0xff000000,0x00ff0000,0xffff0000,
+    0x0000ff00,0xff00ff00,0x00ffff00,0xffffff00,
+    0x000000ff,0xff0000ff,0x00ff00ff,0xffff00ff,
+    0x0000ffff,0xff00ffff,0x00ffffff,0xffffffff
+};
+
+static const u32 cfb_tab16_be[] = {
+    0x00000000, 0x0000ffff, 0xffff0000, 0xffffffff
+};
+
+static const u32 cfb_tab16_le[] = {
+    0x00000000, 0xffff0000, 0x0000ffff, 0xffffffff
+};
+
+static const u32 cfb_tab32[] = {
+	0x00000000, 0xffffffff
+};
+
+static void color_imageblit(const struct fb_image *image, struct fb_info *p,
+			    void *dst1, u32 start_index, u32 pitch_index)
+{
+	/* Draw the penguin */
+	u32 *dst, *dst2;
+	u32 color = 0, val, shift;
+	int i, n, bpp = p->var.bits_per_pixel;
+	u32 null_bits = 32 - bpp;
+	u32 *palette = (u32 *) p->pseudo_palette;
+	const u8 *src = image->data;
+
+	dst2 = dst1;
+	for (i = image->height; i--; ) {
+		n = image->width;
+		dst = dst1;
+		shift = 0;
+		val = 0;
+
+		if (start_index) {
+			u32 start_mask = ~(FB_SHIFT_HIGH(p, ~(u32)0,
+							 start_index));
+			val = *dst & start_mask;
+			shift = start_index;
+		}
+		while (n--) {
+			if (p->fix.visual == FB_VISUAL_TRUECOLOR ||
+			    p->fix.visual == FB_VISUAL_DIRECTCOLOR )
+				color = palette[*src];
+			else
+				color = *src;
+			color <<= FB_LEFT_POS(p, bpp);
+			val |= FB_SHIFT_HIGH(p, color, shift);
+			if (shift >= null_bits) {
+				*dst++ = val;
+
+				val = (shift == null_bits) ? 0 :
+					FB_SHIFT_LOW(p, color, 32 - shift);
+			}
+			shift += bpp;
+			shift &= (32 - 1);
+			src++;
+		}
+		if (shift) {
+			u32 end_mask = FB_SHIFT_HIGH(p, ~(u32)0, shift);
+
+			*dst &= end_mask;
+			*dst |= val;
+		}
+		dst1 += p->fix.line_length;
+		if (pitch_index) {
+			dst2 += p->fix.line_length;
+			dst1 = (u8 *)((long)dst2 & ~(sizeof(u32) - 1));
+
+			start_index += pitch_index;
+			start_index &= 32 - 1;
+		}
+	}
+}
+
+static void slow_imageblit(const struct fb_image *image, struct fb_info *p,
+				  void *dst1, u32 fgcolor, u32 bgcolor,
+				  u32 start_index, u32 pitch_index)
+{
+	u32 shift, color = 0, bpp = p->var.bits_per_pixel;
+	u32 *dst, *dst2;
+	u32 val, pitch = p->fix.line_length;
+	u32 null_bits = 32 - bpp;
+	u32 spitch = (image->width+7)/8;
+	const u8 *src = image->data, *s;
+	u32 i, j, l;
+
+	dst2 = dst1;
+	fgcolor <<= FB_LEFT_POS(p, bpp);
+	bgcolor <<= FB_LEFT_POS(p, bpp);
+
+	for (i = image->height; i--; ) {
+		shift = val = 0;
+		l = 8;
+		j = image->width;
+		dst = dst1;
+		s = src;
+
+		/* write leading bits */
+		if (start_index) {
+			u32 start_mask = ~(FB_SHIFT_HIGH(p, ~(u32)0,
+							 start_index));
+			val = *dst & start_mask;
+			shift = start_index;
+		}
+
+		while (j--) {
+			l--;
+			color = (*s & (1 << l)) ? fgcolor : bgcolor;
+			val |= FB_SHIFT_HIGH(p, color, shift);
+
+			/* Did the bitshift spill bits to the next long? */
+			if (shift >= null_bits) {
+				*dst++ = val;
+				val = (shift == null_bits) ? 0 :
+					FB_SHIFT_LOW(p, color, 32 - shift);
+			}
+			shift += bpp;
+			shift &= (32 - 1);
+			if (!l) { l = 8; s++; }
+		}
+
+		/* write trailing bits */
+ 		if (shift) {
+			u32 end_mask = FB_SHIFT_HIGH(p, ~(u32)0, shift);
+
+			*dst &= end_mask;
+			*dst |= val;
+		}
+
+		dst1 += pitch;
+		src += spitch;
+		if (pitch_index) {
+			dst2 += pitch;
+			dst1 = (u8 *)((long)dst2 & ~(sizeof(u32) - 1));
+			start_index += pitch_index;
+			start_index &= 32 - 1;
+		}
+
+	}
+}
+
+/*
+ * fast_imageblit - optimized monochrome color expansion
+ *
+ * Only if:  bits_per_pixel == 8, 16, or 32
+ *           image->width is divisible by pixel/dword (ppw);
+ *           fix->line_legth is divisible by 4;
+ *           beginning and end of a scanline is dword aligned
+ */
+static void fast_imageblit(const struct fb_image *image, struct fb_info *p,
+				  void *dst1, u32 fgcolor, u32 bgcolor)
+{
+	u32 fgx = fgcolor, bgx = bgcolor, bpp = p->var.bits_per_pixel;
+	u32 ppw = 32/bpp, spitch = (image->width + 7)/8;
+	u32 bit_mask, end_mask, eorx, shift;
+	const char *s = image->data, *src;
+	u32 *dst;
+	const u32 *tab = NULL;
+	int i, j, k;
+
+	switch (bpp) {
+	case 8:
+		tab = fb_be_math(p) ? cfb_tab8_be : cfb_tab8_le;
+		break;
+	case 16:
+		tab = fb_be_math(p) ? cfb_tab16_be : cfb_tab16_le;
+		break;
+	case 32:
+	default:
+		tab = cfb_tab32;
+		break;
+	}
+
+	for (i = ppw-1; i--; ) {
+		fgx <<= bpp;
+		bgx <<= bpp;
+		fgx |= fgcolor;
+		bgx |= bgcolor;
+	}
+
+	bit_mask = (1 << ppw) - 1;
+	eorx = fgx ^ bgx;
+	k = image->width/ppw;
+
+	for (i = image->height; i--; ) {
+		dst = dst1;
+		shift = 8;
+		src = s;
+
+		for (j = k; j--; ) {
+			shift -= ppw;
+			end_mask = tab[(*src >> shift) & bit_mask];
+			*dst++ = (end_mask & eorx) ^ bgx;
+			if (!shift) {
+				shift = 8;
+				src++;
+			}
+		}
+		dst1 += p->fix.line_length;
+		s += spitch;
+	}
+}
+
+/*
+ * Generic 1-bit or 8-bit source to 1-32 bit destination expansion
+ * for frame buffer located in system RAM with packed pixels of any depth.
+ */
+void drm_imageblit(struct fb_info *p, const struct fb_image *image)
+{
+	u32 fgcolor, bgcolor, start_index, bitstart, pitch_index = 0;
+	u32 bpl = sizeof(u32), bpp = p->var.bits_per_pixel;
+	u32 width = image->width;
+	u32 dx = image->dx, dy = image->dy;
+	void *dst1;
+
+	if (p->state != FBINFO_STATE_RUNNING)
+		return;
+
+	bitstart = (dy * p->fix.line_length * 8) + (dx * bpp);
+	start_index = bitstart & (32 - 1);
+	pitch_index = (p->fix.line_length & (bpl - 1)) * 8;
+
+	bitstart /= 8;
+	bitstart &= ~(bpl - 1);
+	dst1 = (void __force *)p->screen_base + bitstart;
+
+	if (p->fbops->fb_sync)
+		p->fbops->fb_sync(p);
+
+	if (image->depth == 1) {
+		if (p->fix.visual == FB_VISUAL_TRUECOLOR ||
+		    p->fix.visual == FB_VISUAL_DIRECTCOLOR) {
+			fgcolor = ((u32*)(p->pseudo_palette))[image->fg_color];
+			bgcolor = ((u32*)(p->pseudo_palette))[image->bg_color];
+		} else {
+			fgcolor = image->fg_color;
+			bgcolor = image->bg_color;
+		}
+
+		if (32 % bpp == 0 && !start_index && !pitch_index &&
+		    ((width & (32/bpp-1)) == 0) &&
+		    bpp >= 8 && bpp <= 32)
+			fast_imageblit(image, p, dst1, fgcolor, bgcolor);
+		else
+			slow_imageblit(image, p, dst1, fgcolor, bgcolor,
+					start_index, pitch_index);
+	} else
+		color_imageblit(image, p, dst1, start_index, pitch_index);
+}
+EXPORT_SYMBOL(drm_imageblit);
+
+/*
+ * Generic file operations where framebuffer is in system RAM
+ */
+ssize_t drm_fb_read(struct fb_info *info, char __user *buf, size_t count, loff_t *ppos)
+{
+	unsigned long p = *ppos;
+	void *src;
+	int err = 0;
+	unsigned long total_size;
+
+	if (info->state != FBINFO_STATE_RUNNING)
+		return -EPERM;
+
+	total_size = info->screen_size;
+
+	if (total_size == 0)
+		total_size = info->fix.smem_len;
+
+	if (p >= total_size)
+		return 0;
+
+	if (count >= total_size)
+		count = total_size;
+
+	if (count + p > total_size)
+		count = total_size - p;
+
+	src = (void __force *)(info->screen_base + p);
+
+	if (info->fbops->fb_sync)
+		info->fbops->fb_sync(info);
+
+	if (copy_to_user(buf, src, count))
+		err = -EFAULT;
+
+	if  (!err)
+		*ppos += count;
+
+	return (err) ? err : count;
+}
+EXPORT_SYMBOL_GPL(drm_fb_read);
+
+/*
+ * Generic file operations where framebuffer is in system RAM
+ */
+ssize_t drm_fb_write(struct fb_info *info, const char __user *buf, size_t count, loff_t *ppos)
+{
+	unsigned long p = *ppos;
+	void *dst;
+	int err = 0;
+	unsigned long total_size;
+
+	if (info->state != FBINFO_STATE_RUNNING)
+		return -EPERM;
+
+	total_size = info->screen_size;
+
+	if (total_size == 0)
+		total_size = info->fix.smem_len;
+
+	if (p > total_size)
+		return -EFBIG;
+
+	if (count > total_size) {
+		err = -EFBIG;
+		count = total_size;
+	}
+
+	if (count + p > total_size) {
+		if (!err)
+			err = -ENOSPC;
+
+		count = total_size - p;
+	}
+
+	dst = (void __force *) (info->screen_base + p);
+
+	if (info->fbops->fb_sync)
+		info->fbops->fb_sync(info);
+
+	if (copy_from_user(dst, buf, count))
+		err = -EFAULT;
+
+	if  (!err)
+		*ppos += count;
+
+	return (err) ? err : count;
+}
+EXPORT_SYMBOL_GPL(drm_fb_write);
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index da0d96a69570..18fba9818635 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -664,36 +664,36 @@ void drm_fb_helper_deferred_io(struct fb_info *info,
 EXPORT_SYMBOL(drm_fb_helper_deferred_io);
 
 /**
- * drm_fb_helper_sys_read - wrapper around fb_sys_read
+ * drm_fb_helper_sys_read - wrapper around drm_fb_read
  * @info: fb_info struct pointer
  * @buf: userspace buffer to read from framebuffer memory
  * @count: number of bytes to read from framebuffer memory
  * @ppos: read offset within framebuffer memory
  *
- * A wrapper around fb_sys_read implemented by fbdev core
+ * A wrapper around drm_fb_read
  */
 ssize_t drm_fb_helper_sys_read(struct fb_info *info, char __user *buf,
 			       size_t count, loff_t *ppos)
 {
-	return fb_sys_read(info, buf, count, ppos);
+	return drm_fb_read(info, buf, count, ppos);
 }
 EXPORT_SYMBOL(drm_fb_helper_sys_read);
 
 /**
- * drm_fb_helper_sys_write - wrapper around fb_sys_write
+ * drm_fb_helper_sys_write - wrapper around drm_fb_write
  * @info: fb_info struct pointer
  * @buf: userspace buffer to write to framebuffer memory
  * @count: number of bytes to write to framebuffer memory
  * @ppos: write offset within framebuffer memory
  *
- * A wrapper around fb_sys_write implemented by fbdev core
+ * A wrapper around drm_fb_write
  */
 ssize_t drm_fb_helper_sys_write(struct fb_info *info, const char __user *buf,
 				size_t count, loff_t *ppos)
 {
 	ssize_t ret;
 
-	ret = fb_sys_write(info, buf, count, ppos);
+	ret = drm_fb_write(info, buf, count, ppos);
 	if (ret > 0)
 		drm_fb_helper_dirty(info, 0, 0, info->var.xres,
 				    info->var.yres);
@@ -703,48 +703,48 @@ ssize_t drm_fb_helper_sys_write(struct fb_info *info, const char __user *buf,
 EXPORT_SYMBOL(drm_fb_helper_sys_write);
 
 /**
- * drm_fb_helper_sys_fillrect - wrapper around sys_fillrect
+ * drm_fb_helper_sys_fillrect - wrapper around drm_fillrect
  * @info: fbdev registered by the helper
  * @rect: info about rectangle to fill
  *
- * A wrapper around sys_fillrect implemented by fbdev core
+ * A wrapper around drm_fillrect
  */
 void drm_fb_helper_sys_fillrect(struct fb_info *info,
 				const struct fb_fillrect *rect)
 {
-	sys_fillrect(info, rect);
+	drm_fillrect(info, rect);
 	drm_fb_helper_dirty(info, rect->dx, rect->dy,
 			    rect->width, rect->height);
 }
 EXPORT_SYMBOL(drm_fb_helper_sys_fillrect);
 
 /**
- * drm_fb_helper_sys_copyarea - wrapper around sys_copyarea
+ * drm_fb_helper_sys_copyarea - wrapper around drm_copyarea
  * @info: fbdev registered by the helper
  * @area: info about area to copy
  *
- * A wrapper around sys_copyarea implemented by fbdev core
+ * A wrapper around drm_copyarea
  */
 void drm_fb_helper_sys_copyarea(struct fb_info *info,
 				const struct fb_copyarea *area)
 {
-	sys_copyarea(info, area);
+	drm_copyarea(info, area);
 	drm_fb_helper_dirty(info, area->dx, area->dy,
 			    area->width, area->height);
 }
 EXPORT_SYMBOL(drm_fb_helper_sys_copyarea);
 
 /**
- * drm_fb_helper_sys_imageblit - wrapper around sys_imageblit
+ * drm_fb_helper_sys_imageblit - wrapper around drm_imageblit
  * @info: fbdev registered by the helper
  * @image: info about image to blit
  *
- * A wrapper around sys_imageblit implemented by fbdev core
+ * A wrapper around drm_imageblit
  */
 void drm_fb_helper_sys_imageblit(struct fb_info *info,
 				 const struct fb_image *image)
 {
-	sys_imageblit(info, image);
+	drm_imageblit(info, image);
 	drm_fb_helper_dirty(info, image->dx, image->dy,
 			    image->width, image->height);
 }
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index 306aa3a60be9..d38005f6128a 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -271,6 +271,12 @@ void drm_fb_helper_output_poll_changed(struct drm_device *dev);
 
 void drm_fbdev_generic_setup(struct drm_device *dev,
 			     unsigned int preferred_bpp);
+
+void drm_copyarea(struct fb_info *p, const struct fb_copyarea *area);
+void drm_fillrect(struct fb_info *p, const struct fb_fillrect *rect);
+void drm_imageblit(struct fb_info *p, const struct fb_image *image);
+ssize_t drm_fb_read(struct fb_info *info, char __user *buf, size_t count, loff_t *ppos);
+ssize_t drm_fb_write(struct fb_info *info, const char __user *buf, size_t count, loff_t *ppos);
 #else
 static inline void drm_fb_helper_prepare(struct drm_device *dev,
 					struct drm_fb_helper *helper,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
