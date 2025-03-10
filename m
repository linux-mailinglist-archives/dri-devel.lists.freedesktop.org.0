Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF67A58C6D
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 08:04:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A38A610E179;
	Mon, 10 Mar 2025 07:03:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from c64.rulez.org (c64.rulez.org [79.139.58.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB82A10E179
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 07:03:55 +0000 (UTC)
Received: by c64.rulez.org (Postfix, from userid 1000)
 id 242EC100CF; Mon, 10 Mar 2025 08:03:51 +0100 (CET)
From: Zsolt Kajtar <soci@c64.rulez.org>
To: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: deller@gmx.de,
	Zsolt Kajtar <soci@c64.rulez.org>
Subject: [PATCH] Remove fb_draw.h includes
Date: Mon, 10 Mar 2025 07:57:45 +0100
Message-Id: <20250310065745.17623-1-soci@c64.rulez.org>
X-Mailer: git-send-email 2.30.2
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

This is related to the fbcon packed pixel drawing refactoring. There I
missed that fb_draw.h was included from two unexpected places. That
shouldn't be like that. This patch removes the dependency.

Signed-off-by: Zsolt Kajtar <soci@c64.rulez.org>
---
 drivers/video/fbdev/aty/mach64_cursor.c |  7 +++++-
 drivers/video/fbdev/wmt_ge_rops.c       | 30 +++++++++++++++++++++++--
 2 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/aty/mach64_cursor.c b/drivers/video/fbdev/aty/mach64_cursor.c
index 971355c2c..e826cb7dd 100644
--- a/drivers/video/fbdev/aty/mach64_cursor.c
+++ b/drivers/video/fbdev/aty/mach64_cursor.c
@@ -6,7 +6,6 @@
 #include <linux/fb.h>
 #include <linux/init.h>
 #include <linux/string.h>
-#include "../core/fb_draw.h"
 
 #include <asm/io.h>
 
@@ -57,6 +56,12 @@
  * definitation and CUR_VERT_POSN must be saturated to zero.
  */
 
+/* compose pixels based on mask */
+static inline unsigned long comp(unsigned long set, unsigned long unset, unsigned long mask)
+{
+	return ((set ^ unset) & mask) ^ unset;
+}
+
     /*
      *  Hardware Cursor support.
      */
diff --git a/drivers/video/fbdev/wmt_ge_rops.c b/drivers/video/fbdev/wmt_ge_rops.c
index 69106299a..92fbb3f3a 100644
--- a/drivers/video/fbdev/wmt_ge_rops.c
+++ b/drivers/video/fbdev/wmt_ge_rops.c
@@ -12,7 +12,6 @@
 #include <linux/io.h>
 #include <linux/platform_device.h>
 
-#include "core/fb_draw.h"
 #include "wmt_ge_rops.h"
 
 #define GE_COMMAND_OFF		0x00
@@ -41,6 +40,33 @@
 
 static void __iomem *regbase;
 
+/* from the spec it seems more like depth than bits per pixel */
+static inline unsigned long pixel_to_pat(u32 depth, u32 pixel, struct fb_info *p)
+{
+	switch (depth) {
+	case 1:
+		return ~0ul*pixel;
+	case 2:
+		return ~0ul/3*pixel;
+	case 4:
+		return ~0ul/15*pixel;
+	case 8:
+		return ~0ul/255*pixel;
+	case 12:
+	case 15:
+	case 16:
+		return ~0ul/0xffff*pixel;
+	case 18:
+	case 24:
+		return 0x1000001ul*pixel;
+	case 32:
+		return pixel;
+	default:
+		fb_warn_once(p, "%s: unsupported pixelformat %d\n", __func__, depth);
+		return 0;
+	}
+}
+
 void wmt_ge_fillrect(struct fb_info *p, const struct fb_fillrect *rect)
 {
 	unsigned long fg, pat;
@@ -54,7 +80,7 @@ void wmt_ge_fillrect(struct fb_info *p, const struct fb_fillrect *rect)
 	else
 		fg = rect->color;
 
-	pat = pixel_to_pat(p->var.bits_per_pixel, fg);
+	pat = pixel_to_pat(p->var.bits_per_pixel, fg, p);
 
 	if (p->fbops->fb_sync)
 		p->fbops->fb_sync(p);
-- 
2.30.2

