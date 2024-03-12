Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C62F879DB2
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 22:46:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C88C010E970;
	Tue, 12 Mar 2024 21:46:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 414 seconds by postgrey-1.36 at gabe;
 Tue, 12 Mar 2024 21:45:59 UTC
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AD4310E970
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 21:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 70816A034B;
 Tue, 12 Mar 2024 22:39:03 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lKQgqEeYEGbq; Tue, 12 Mar 2024 22:39:03 +0100 (CET)
Received: from begin.home (aamiens-653-1-111-57.w83-192.abo.wanadoo.fr
 [83.192.234.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 1ECC4A02D1;
 Tue, 12 Mar 2024 22:39:03 +0100 (CET)
Received: from samy by begin.home with local (Exim 4.97)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1rk9pu-000000076so-2s5z; Tue, 12 Mar 2024 22:39:02 +0100
Date: Tue, 12 Mar 2024 22:39:02 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Alexey Gladkov <legion@kernel.org>, Jiry Slaby <jirislaby@kernel.org>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] fbcon: Increase maximum font width x height to 64 x 64
Message-ID: <20240312213902.3zvqaghlopjusv6m@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Alexey Gladkov <legion@kernel.org>,
 Jiry Slaby <jirislaby@kernel.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20170609 (1.8.3)
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

This remains relatively simple by just enlarging integers.

It wouldn't be that simple to get to the console's 64x128 maximum, as it would
require 128b integers.

Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

Index: linux-6.4/drivers/video/fbdev/core/fbcon.c
===================================================================
--- linux-6.4.orig/drivers/video/fbdev/core/fbcon.c
+++ linux-6.4/drivers/video/fbdev/core/fbcon.c
@@ -101,6 +101,9 @@ enum {
 	FBCON_LOGO_DONTSHOW	= -3	/* do not show the logo */
 };
 
+#define FBCON_MAX_FONT_WIDTH	(sizeof(((struct fb_pixmap *) 0)->blit_x) * 8)
+#define FBCON_MAX_FONT_HEIGHT	(sizeof(((struct fb_pixmap *) 0)->blit_y) * 8)
+
 static struct fbcon_display fb_display[MAX_NR_CONSOLES];
 
 struct fb_info *fbcon_registered_fb[FB_MAX];
@@ -2485,12 +2488,12 @@ static int fbcon_set_font(struct vc_data
 	    h > FBCON_SWAP(info->var.rotate, info->var.yres, info->var.xres))
 		return -EINVAL;
 
-	if (font->width > 32 || font->height > 32)
+	if (font->width > FBCON_MAX_FONT_WIDTH || font->height > FBCON_MAX_FONT_HEIGHT)
 		return -EINVAL;
 
 	/* Make sure drawing engine can handle the font */
-	if (!(info->pixmap.blit_x & BIT(font->width - 1)) ||
-	    !(info->pixmap.blit_y & BIT(font->height - 1)))
+	if (!(info->pixmap.blit_x & BIT_ULL(font->width - 1)) ||
+	    !(info->pixmap.blit_y & BIT_ULL(font->height - 1)))
 		return -EINVAL;
 
 	/* Make sure driver can handle the font length */
@@ -3084,8 +3087,8 @@ void fbcon_get_requirement(struct fb_inf
 			vc = vc_cons[i].d;
 			if (vc && vc->vc_mode == KD_TEXT &&
 			    info->node == con2fb_map[i]) {
-				caps->x |= 1 << (vc->vc_font.width - 1);
-				caps->y |= 1 << (vc->vc_font.height - 1);
+				caps->x |= 1ULL << (vc->vc_font.width - 1);
+				caps->y |= 1ULL << (vc->vc_font.height - 1);
 				charcnt = vc->vc_font.charcount;
 				if (caps->len < charcnt)
 					caps->len = charcnt;
@@ -3096,8 +3099,8 @@ void fbcon_get_requirement(struct fb_inf
 
 		if (vc && vc->vc_mode == KD_TEXT &&
 		    info->node == con2fb_map[fg_console]) {
-			caps->x = 1 << (vc->vc_font.width - 1);
-			caps->y = 1 << (vc->vc_font.height - 1);
+			caps->x = 1ULL << (vc->vc_font.width - 1);
+			caps->y = 1ULL << (vc->vc_font.height - 1);
 			caps->len = vc->vc_font.charcount;
 		}
 	}
Index: linux-6.4/include/linux/fb.h
===================================================================
--- linux-6.4.orig/include/linux/fb.h
+++ linux-6.4/include/linux/fb.h
@@ -143,8 +143,8 @@ struct fb_event {
 };
 
 struct fb_blit_caps {
-	u32 x;
-	u32 y;
+	u64 x;
+	u64 y;
 	u32 len;
 	u32 flags;
 };
@@ -191,10 +191,10 @@ struct fb_pixmap {
 	u32 scan_align;		/* alignment per scanline		*/
 	u32 access_align;	/* alignment per read/write (bits)	*/
 	u32 flags;		/* see FB_PIXMAP_*			*/
-	u32 blit_x;             /* supported bit block dimensions (1-32)*/
-	u32 blit_y;             /* Format: blit_x = 1 << (width - 1)    */
+	u64 blit_x;             /* supported bit block dimensions (1-64)*/
+	u64 blit_y;             /* Format: blit_x = 1 << (width - 1)    */
 	                        /*         blit_y = 1 << (height - 1)   */
-	                        /* if 0, will be set to 0xffffffff (all)*/
+	                        /* if 0, will be set to ~0ull (all)     */
 	/* access methods */
 	void (*writeio)(struct fb_info *info, void __iomem *dst, void *src, unsigned int size);
 	void (*readio) (struct fb_info *info, void *dst, void __iomem *src, unsigned int size);
