Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7C53C867A
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 16:58:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2DF96E3DA;
	Wed, 14 Jul 2021 14:58:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2A646E3DB
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 14:58:12 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:bcf3:b2b1:dff6:480b])
 by andre.telenet-ops.be with bizsmtp
 id V2yA2500K4sai0K012yA17; Wed, 14 Jul 2021 16:58:11 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1m3gKw-001AEl-GR; Wed, 14 Jul 2021 16:58:10 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1m3gKv-00AcNQ-V6; Wed, 14 Jul 2021 16:58:09 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH resend 4/5] video: fbdev: ssd1307fb: Optimize screen updates
Date: Wed, 14 Jul 2021 16:58:03 +0200
Message-Id: <20210714145804.2530727-5-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210714145804.2530727-1-geert@linux-m68k.org>
References: <20210714145804.2530727-1-geert@linux-m68k.org>
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
Cc: linux-fbdev@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, each screen update triggers an I2C transfer of all screen
data, up to 1 KiB of data for a 128x64 display, which takes at least 20
ms in Fast mode.

Reduce the amount of transferred data by only updating the rectangle
that changed.  Remove the call to ssd1307fb_set_address_range() during
initialization, as ssd1307fb_update_rect() now takes care of that.

Note that for now the optimized operation is only used for fillrect,
copyarea, and imageblit, which are used by fbcon.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/video/fbdev/ssd1307fb.c | 43 ++++++++++++++++++++-------------
 1 file changed, 26 insertions(+), 17 deletions(-)

diff --git a/drivers/video/fbdev/ssd1307fb.c b/drivers/video/fbdev/ssd1307fb.c
index cfa27ea0feab4f01..8e3d4be74723b9bf 100644
--- a/drivers/video/fbdev/ssd1307fb.c
+++ b/drivers/video/fbdev/ssd1307fb.c
@@ -184,16 +184,18 @@ static int ssd1307fb_set_address_range(struct ssd1307fb_par *par, u8 col_start,
 	return ssd1307fb_write_cmd(par->client, page_end);
 }
 
-static int ssd1307fb_update_display(struct ssd1307fb_par *par)
+static int ssd1307fb_update_rect(struct ssd1307fb_par *par, unsigned int x,
+				 unsigned int y, unsigned int width,
+				 unsigned int height)
 {
 	struct ssd1307fb_array *array;
 	u8 *vmem = par->info->screen_buffer;
 	unsigned int line_length = par->info->fix.line_length;
-	unsigned int pages = DIV_ROUND_UP(par->height, 8);
+	unsigned int pages = DIV_ROUND_UP(height + y % 8, 8);
 	u32 array_idx = 0;
 	int ret, i, j, k;
 
-	array = ssd1307fb_alloc_array(par->width * pages, SSD1307FB_DATA);
+	array = ssd1307fb_alloc_array(width * pages, SSD1307FB_DATA);
 	if (!array)
 		return -ENOMEM;
 
@@ -226,13 +228,18 @@ static int ssd1307fb_update_display(struct ssd1307fb_par *par)
 	 *  (5) A4 B4 C4 D4 E4 F4 G4 H4
 	 */
 
-	for (i = 0; i < pages; i++) {
+	ret = ssd1307fb_set_address_range(par, par->col_offset + x, width,
+					  par->page_offset + y / 8, pages);
+	if (ret < 0)
+		goto out_free;
+
+	for (i = y / 8; i < y / 8 + pages; i++) {
 		int m = 8;
 
 		/* Last page may be partial */
-		if (i + 1 == pages && par->height % 8)
+		if (8 * (i + 1) > par->height)
 			m = par->height % 8;
-		for (j = 0; j < par->width; j++) {
+		for (j = x; j < x + width; j++) {
 			u8 data = 0;
 
 			for (k = 0; k < m; k++) {
@@ -245,11 +252,17 @@ static int ssd1307fb_update_display(struct ssd1307fb_par *par)
 		}
 	}
 
-	ret = ssd1307fb_write_array(par->client, array, par->width * pages);
+	ret = ssd1307fb_write_array(par->client, array, width * pages);
+
+out_free:
 	kfree(array);
 	return ret;
 }
 
+static int ssd1307fb_update_display(struct ssd1307fb_par *par)
+{
+	return ssd1307fb_update_rect(par, 0, 0, par->width, par->height);
+}
 
 static ssize_t ssd1307fb_write(struct fb_info *info, const char __user *buf,
 		size_t count, loff_t *ppos)
@@ -299,21 +312,24 @@ static void ssd1307fb_fillrect(struct fb_info *info, const struct fb_fillrect *r
 {
 	struct ssd1307fb_par *par = info->par;
 	sys_fillrect(info, rect);
-	ssd1307fb_update_display(par);
+	ssd1307fb_update_rect(par, rect->dx, rect->dy, rect->width,
+			      rect->height);
 }
 
 static void ssd1307fb_copyarea(struct fb_info *info, const struct fb_copyarea *area)
 {
 	struct ssd1307fb_par *par = info->par;
 	sys_copyarea(info, area);
-	ssd1307fb_update_display(par);
+	ssd1307fb_update_rect(par, area->dx, area->dy, area->width,
+			      area->height);
 }
 
 static void ssd1307fb_imageblit(struct fb_info *info, const struct fb_image *image)
 {
 	struct ssd1307fb_par *par = info->par;
 	sys_imageblit(info, image);
-	ssd1307fb_update_display(par);
+	ssd1307fb_update_rect(par, image->dx, image->dy, image->width,
+			      image->height);
 }
 
 static const struct fb_ops ssd1307fb_ops = {
@@ -493,13 +509,6 @@ static int ssd1307fb_init(struct ssd1307fb_par *par)
 	if (ret < 0)
 		return ret;
 
-	/* Set column and page range */
-	ret = ssd1307fb_set_address_range(par, par->col_offset, par->width,
-					  par->page_offset,
-					  DIV_ROUND_UP(par->height, 8));
-	if (ret < 0)
-		return ret;
-
 	/* Clear the screen */
 	ret = ssd1307fb_update_display(par);
 	if (ret < 0)
-- 
2.25.1

