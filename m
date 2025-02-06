Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 680C1A2BE10
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 09:32:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 039F510EA4E;
	Fri,  7 Feb 2025 08:32:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from c64.rulez.org (c64.rulez.org [79.139.58.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D58E910E30C
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 19:53:58 +0000 (UTC)
Received: by c64.rulez.org (Postfix, from userid 1000)
 id A8E5E100FA; Thu,  6 Feb 2025 20:53:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by c64.rulez.org (Postfix) with ESMTP id A823E100F6;
 Thu,  6 Feb 2025 20:53:57 +0100 (CET)
Date: Thu, 6 Feb 2025 20:53:57 +0100 (CET)
From: Zsolt Kajtar <soci@c64.rulez.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 10/13] fbdev: core: Make fb_imageblit generic
Message-ID: <f2b4bc52-20b5-6ac0-d283-d7961f7eabf6@c64.rulez.org>
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

fbdev: core: Make fb_imageblit generic

Signed-off-by: Zsolt Kajtar <soci@c64.rulez.org>
---
  drivers/video/fbdev/core/fb_imageblit.h | 52 ++++++++++---------------
  1 file changed, 20 insertions(+), 32 deletions(-)

diff --git a/drivers/video/fbdev/core/fb_imageblit.h b/drivers/video/fbdev/core/fb_imageblit.h
index 129822b6f..b8cd5eb83 100644
--- a/drivers/video/fbdev/core/fb_imageblit.h
+++ b/drivers/video/fbdev/core/fb_imageblit.h
@@ -29,10 +29,6 @@
   *  Also need to add code to deal with cards endians that are different than
   *  the native cpu endians. I also need to deal with MSB position in the word.
   */
-#include <linux/module.h>
-#include <linux/string.h>
-#include <linux/fb.h>
-#include <asm/types.h>
  #include "fb_draw.h"

  #define DEBUG
@@ -69,16 +65,13 @@ static const u32 cfb_tab32[] = {
          0x00000000, 0xffffffff
  };

-#define FB_WRITEL fb_writel
-#define FB_READL  fb_readl
-
  static inline void color_imageblit(const struct fb_image *image,
-                                   struct fb_info *p, u8 __iomem *dst1,
+                                   struct fb_info *p, u8 FB_MEM *dst1,
                                     u32 start_index,
                                     u32 pitch_index)
  {
          /* Draw the penguin */
-        u32 __iomem *dst, *dst2;
+        u32 FB_MEM *dst, *dst2;
          u32 color = 0, val, shift;
          int i, n, bpp = p->var.bits_per_pixel;
          u32 null_bits = 32 - bpp;
@@ -86,10 +79,10 @@ static inline void color_imageblit(const struct fb_image *image,
          const u8 *src = image->data;
          u32 bswapmask = fb_compute_bswapmask(p);

-        dst2 = (u32 __iomem *) dst1;
+        dst2 = (u32 FB_MEM *) dst1;
          for (i = image->height; i--; ) {
                  n = image->width;
-                dst = (u32 __iomem *) dst1;
+                dst = (u32 FB_MEM *) dst1;
                  shift = 0;
                  val = 0;

@@ -126,7 +119,7 @@ static inline void color_imageblit(const struct fb_image *image,
                  dst1 += p->fix.line_length;
                  if (pitch_index) {
                          dst2 += p->fix.line_length;
-                        dst1 = (u8 __iomem *)((long __force)dst2 & ~(sizeof(u32) - 1));
+                        dst1 = (u8 FB_MEM *)((long __force)dst2 & ~(sizeof(u32) - 1));

                          start_index += pitch_index;
                          start_index &= 32 - 1;
@@ -135,13 +128,13 @@ static inline void color_imageblit(const struct fb_image *image,
  }

  static inline void slow_imageblit(const struct fb_image *image, struct fb_info *p,
-                                  u8 __iomem *dst1, u32 fgcolor,
+                                  u8 FB_MEM *dst1, u32 fgcolor,
                                    u32 bgcolor,
                                    u32 start_index,
                                    u32 pitch_index)
  {
          u32 shift, color = 0, bpp = p->var.bits_per_pixel;
-        u32 __iomem *dst, *dst2;
+        u32 FB_MEM *dst, *dst2;
          u32 val, pitch = p->fix.line_length;
          u32 null_bits = 32 - bpp;
          u32 spitch = (image->width+7)/8;
@@ -149,7 +142,7 @@ static inline void slow_imageblit(const struct fb_image *image, struct fb_info *
          u32 i, j, l;
          u32 bswapmask = fb_compute_bswapmask(p);

-        dst2 = (u32 __iomem *) dst1;
+        dst2 = (u32 FB_MEM *) dst1;
          fgcolor <<= FB_LEFT_POS(p, bpp);
          bgcolor <<= FB_LEFT_POS(p, bpp);

@@ -157,7 +150,7 @@ static inline void slow_imageblit(const struct fb_image *image, struct fb_info *
                  shift = val = 0;
                  l = 8;
                  j = image->width;
-                dst = (u32 __iomem *) dst1;
+                dst = (u32 FB_MEM *) dst1;
                  s = src;

                  /* write leading bits */
@@ -196,7 +189,7 @@ static inline void slow_imageblit(const struct fb_image *image, struct fb_info *
                  src += spitch;
                  if (pitch_index) {
                          dst2 += pitch;
-                        dst1 = (u8 __iomem *)((long __force)dst2 & ~(sizeof(u32) - 1));
+                        dst1 = (u8 FB_MEM *)((long __force)dst2 & ~(sizeof(u32) - 1));
                          start_index += pitch_index;
                          start_index &= 32 - 1;
                  }
@@ -213,14 +206,14 @@ static inline void slow_imageblit(const struct fb_image *image, struct fb_info *
   *           beginning and end of a scanline is dword aligned
   */
  static inline void fast_imageblit(const struct fb_image *image, struct fb_info *p,
-                                  u8 __iomem *dst1, u32 fgcolor,
+                                  u8 FB_MEM *dst1, u32 fgcolor,
                                    u32 bgcolor)
  {
          u32 fgx = fgcolor, bgx = bgcolor, bpp = p->var.bits_per_pixel;
          u32 ppw = 32/bpp, spitch = (image->width + 7)/8;
          u32 bit_mask, eorx, shift;
-        const char *s = image->data, *src;
-        u32 __iomem *dst;
+        const u8 *s = image->data, *src;
+        u32 FB_MEM *dst;
          const u32 *tab = NULL;
          size_t tablen;
          u32 colortab[16];
@@ -258,7 +251,7 @@ static inline void fast_imageblit(const struct fb_image *image, struct fb_info *
                  colortab[i] = (tab[i] & eorx) ^ bgx;

          for (i = image->height; i--; ) {
-                dst = (u32 __iomem *)dst1;
+                dst = (u32 FB_MEM *)dst1;
                  shift = 8;
                  src = s;

@@ -315,19 +308,20 @@ static inline void fast_imageblit(const struct fb_image *image, struct fb_info *
          }
  }

-void cfb_imageblit(struct fb_info *p, const struct fb_image *image)
+void FB_IMAGEBLIT (struct fb_info *p, const struct fb_image *image)
  {
          u32 fgcolor, bgcolor, start_index, bitstart, pitch_index = 0;
          u32 bpl = sizeof(u32), bpp = p->var.bits_per_pixel;
          u32 width = image->width;
          u32 dx = image->dx, dy = image->dy;
-        u8 __iomem *dst1;
+        u8 FB_MEM *dst1;

          if (p->state != FBINFO_STATE_RUNNING)
                  return;

-        if (p->flags & FBINFO_VIRTFB)
-                fb_warn_once(p, "Framebuffer is not in I/O address space.");
+        if ((p->flags & FBINFO_VIRTFB) != FB_SPACE)
+                fb_warn_once(p, "Framebuffer is not in " FB_SPACE_NAME
+                             " address space.");

          bitstart = (dy * p->fix.line_length * 8) + (dx * bpp);
          start_index = bitstart & (32 - 1);
@@ -335,7 +329,7 @@ void cfb_imageblit(struct fb_info *p, const struct fb_image *image)

          bitstart /= 8;
          bitstart &= ~(bpl - 1);
-        dst1 = p->screen_base + bitstart;
+        dst1 = (void __force *)FB_SCREEN_BASE(p) + bitstart;

          if (p->fbops->fb_sync)
                  p->fbops->fb_sync(p);
@@ -360,9 +354,3 @@ void cfb_imageblit(struct fb_info *p, const struct fb_image *image)
          } else
                  color_imageblit(image, p, dst1, start_index, pitch_index);
  }
-
-EXPORT_SYMBOL(cfb_imageblit);
-
-MODULE_AUTHOR("James Simmons <jsimmons@users.sf.net>");
-MODULE_DESCRIPTION("Generic software accelerated imaging drawing");
-MODULE_LICENSE("GPL");
-- 
2.30.2

