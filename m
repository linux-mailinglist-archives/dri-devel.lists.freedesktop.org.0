Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHvdM+NXkmm9tAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 00:33:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 819A71401B2
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 00:33:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D04C510E0DD;
	Sun, 15 Feb 2026 23:33:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="MET8YzsF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E5710E0DD
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 23:33:52 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-4362197d174so1700192f8f.3
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 15:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771198431; x=1771803231;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TOqo3ZpoHBCEkKQn3Tj+aWTPXLOhLLz8545K4/itoW4=;
 b=MET8YzsFTd2iDGISd/mg7AWtr/miXygcmN7q5fvEJH7+Ten0UrbrE2UnsrA+CIHx3a
 56kIQsZE8UjttqDDN4Cjs8dUWFfHR9LFpKNj+bVFxw0AVIS6twoB7FDHf/lY5j/BOD3z
 KZVePbhNaEXkKEa/w+5tIz9Gck6VEYQXZqcQPfQ2vpR0InoyD2CZGX48a4hlVKuz07rq
 MCLoCPkQxiYfYN+Cyie050IUO9Sw9wZwEu8FALfBe6T6crW6Vs+XHxLLK4eJ33w+n1yl
 05M8vW7xGTyrUVeqT4j4SBAoGvs45hp2PTw44BA+LBvGQiYJdx82YyzhqXh+eVi7LF9U
 6u1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771198431; x=1771803231;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TOqo3ZpoHBCEkKQn3Tj+aWTPXLOhLLz8545K4/itoW4=;
 b=luokysMkfWzODXJAPxVuFA+9U7nTOg7rf4ohN7NodHDv/W8OD0nDBjsSAvY2o4pV26
 t7yRl7L8yk2A1GTkeqlvG8q2tzhaGYQekoBdM6xe3DRUMsBtbCeeHB8Xh/uAE62KJrua
 qx/N2V52FP9mEXivNt027DzYMPYxfOcwflDlnQdQXL2hnccwFyvu7XRsOKVsgw0dNmwq
 XfXNpX/ItdJG5X1UJQkjS/7QI71CwnrOkuYb1gUVHp9LAMuRLiOHBlhyVHj1C8SJaJhL
 FbIkaFOt7hdv62XnBiIMmO2RKe4WArwWgE3oHODPPDLSc3xL3QpTDNKnPdIAbocLN+Tl
 iZ2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXv4E8eDkK44G8bVz94boT7034981ozyhPvWGvOQfsf1TVMlGFp0CzSKC16esweEJmrJNWy9XRMetE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnS9pSsh0iIxE+UZ5IBRPR3Bdy2tqDhL2L56YNI7yOXIYYmeR9
 E+xwwhHcYPMSsrbyiIual6imj0S9Zftqzz4Rc0YJSWVmrDpmzLlnJdygK6zzTdQ0Meo=
X-Gm-Gg: AZuq6aJ+0OtK1uUSDHELJEe70V7rc6T4c4KBe+p6WAWJR9SyvH5ZXp7W86zTmj8eVp2
 Dq/3CtAdCii683p56+TdwrQ3C4kngbUFtgxxP8ZBNeTOoBFUkE0Y0e2L7zJHknjnWGzBCv30ekW
 U2fGh0kLckZy2LWzquXFSUy2MdKRN5etpyp/kr+j+VwkBZwCKl4Z9kh7hM/JcwJI8PbJBZi69qZ
 SvTLeWe/N6GdJf+n71e7/nJzMFE3DLYtDMgQ3wNr1K6se7Zfa0J4kN4aqu5NZlne5m0tDAJnavn
 vYPKJW2kAxHxEQ3Lyu/FHG1afWYYJqCH6LOHd+J+hc+sLcf/qNELBgn5OZ4lOuP0qfFH6EDFRrj
 NtxO0iNRITctxCeFU3rPiqaK/dbdSM0iXsY+P+bA7JjtFPflL+tmdFfxDY71xURxM/Dwpbl0k5k
 0vvRCGcdHHyTj7MGuzJjfnqU3CiK/4
X-Received: by 2002:a05:600c:3594:b0:477:9a28:b0a4 with SMTP id
 5b1f17b1804b1-483737bea7bmr140951365e9.0.1771198430936; 
 Sun, 15 Feb 2026 15:33:50 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-43796ac800esm23829050f8f.27.2026.02.15.15.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Feb 2026 15:33:50 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Helge Deller <deller@gmx.de>
Cc: Chen Ni <nichen@iscas.ac.cn>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v5 5/7] fbdev: au1100fb: Replace custom printk wrappers by pr_*
Date: Mon, 16 Feb 2026 00:33:21 +0100
Message-ID: <6ca08f50fa1a6f9385cb4433db6406c311582bdc.1771198101.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771198101.git.u.kleine-koenig@baylibre.com>
References: <cover.1771198101.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=6894;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=9WHUEaOrVOm+WL4G/FUUC3aXFfCTRn5AFAGSSgL5t64=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpklfJHEK4fUFWoAwE4Jd9RrovUhJQH8Gs64uHL
 h+S3+lepqmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaZJXyQAKCRCPgPtYfRL+
 TiQZCACOSbmduirm/ihLWyQPheMypnxlzY/f7fimpLUVUsadKMt1aODlcZSKHyYJLQMmwB/HyLx
 ncaNX6aGwDrdTlR42825JxVfPtjELct5Bv6YxV7B6HUEj5zwCkcxtaybnw3mxyaOJREsg1JCEtI
 U6Oi/6R/oshayEPwfRO0FSQ6MzHIyj5z1rz5mTiECQkzaVey5tz5+DGPaNNalPRSQ9BTWhshCTo
 JnV1jZ6dez03qo0TLwLrMjm1D46O4VnggMhRT+2PDE2NWwbTeopRfuQE1aE1fVU/tNDGADpxXXn
 iCchRdbw51EIYCOxomk3ILBKduGoR7CApKMLp8l5hMotiQQw
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmx.de];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[baylibre.com];
	FORGED_RECIPIENTS(0.00)[m:deller@gmx.de,m:nichen@iscas.ac.cn,m:linux-fbdev@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 819A71401B2
X-Rspamd-Action: no action

The global wrappers also have the advantage to do stricter format
checking, so the pr_devel formats are also checked if DEBUG is not
defined. The global variants only check for DEBUG being defined and not
its actual value, so the #define to zero is dropped, too.

There is only a slight semantic change as the (by default disabled)
debug output doesn't contain __FILE__ any more.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/video/fbdev/au1100fb.c | 41 +++++++++++++++++-----------------
 drivers/video/fbdev/au1100fb.h | 10 ---------
 2 files changed, 21 insertions(+), 30 deletions(-)

diff --git a/drivers/video/fbdev/au1100fb.c b/drivers/video/fbdev/au1100fb.c
index 7611dad0d68d..f589f90cce2c 100644
--- a/drivers/video/fbdev/au1100fb.c
+++ b/drivers/video/fbdev/au1100fb.c
@@ -41,6 +41,9 @@
  *  with this program; if not, write  to the Free Software Foundation, Inc.,
  *  675 Mass Ave, Cambridge, MA 02139, USA.
  */
+
+#define pr_fmt(fmt) "au1100fb:" fmt "\n"
+
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/io.h>
@@ -57,8 +60,6 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
-#define DEBUG 0
-
 #include "au1100fb.h"
 
 #if defined(CONFIG_COMPILE_TEST) && !defined(CONFIG_MIPS)
@@ -97,7 +98,7 @@ static int au1100fb_fb_blank(int blank_mode, struct fb_info *fbi)
 {
 	struct au1100fb_device *fbdev = to_au1100fb_device(fbi);
 
-	print_dbg("fb_blank %d %p", blank_mode, fbi);
+	pr_devel("fb_blank %d %p", blank_mode, fbi);
 
 	switch (blank_mode) {
 
@@ -291,7 +292,7 @@ static int au1100fb_fb_pan_display(struct fb_var_screeninfo *var, struct fb_info
 
 	fbdev = to_au1100fb_device(fbi);
 
-	print_dbg("fb_pan_display %p %p", var, fbi);
+	pr_devel("fb_pan_display %p %p", var, fbi);
 
 	if (!var || !fbdev) {
 		return -EINVAL;
@@ -302,13 +303,13 @@ static int au1100fb_fb_pan_display(struct fb_var_screeninfo *var, struct fb_info
 		return -EINVAL;
 	}
 
-	print_dbg("fb_pan_display 2 %p %p", var, fbi);
+	pr_devel("fb_pan_display 2 %p %p", var, fbi);
 	dy = var->yoffset - fbi->var.yoffset;
 	if (dy) {
 
 		u32 dmaaddr;
 
-		print_dbg("Panning screen of %d lines", dy);
+		pr_devel("Panning screen of %d lines", dy);
 
 		dmaaddr = fbdev->regs->lcd_dmaaddr0;
 		dmaaddr += (fbi->fix.line_length * dy);
@@ -322,7 +323,7 @@ static int au1100fb_fb_pan_display(struct fb_var_screeninfo *var, struct fb_info
 			fbdev->regs->lcd_dmaaddr0 = LCD_DMA_SA_N(dmaaddr);
 	}
 	}
-	print_dbg("fb_pan_display 3 %p %p", var, fbi);
+	pr_devel("fb_pan_display 3 %p %p", var, fbi);
 
 	return 0;
 }
@@ -365,7 +366,7 @@ static int au1100fb_setup(struct au1100fb_device *fbdev)
 	int num_panels = ARRAY_SIZE(known_lcd_panels);
 
 	if (num_panels <= 0) {
-		print_err("No LCD panels supported by driver!");
+		pr_err("No LCD panels supported by driver!");
 		return -ENODEV;
 	}
 
@@ -388,16 +389,16 @@ static int au1100fb_setup(struct au1100fb_device *fbdev)
 				}
 			}
 			if (i >= num_panels) {
-				print_warn("Panel '%s' not supported!", this_opt);
+				pr_warn("Panel '%s' not supported!", this_opt);
 				return -ENODEV;
 			}
 		}
 		/* Unsupported option */
 		else
-			print_warn("Unsupported option \"%s\"", this_opt);
+			pr_warn("Unsupported option \"%s\"", this_opt);
 	}
 
-	print_info("Panel=%s", fbdev->panel->name);
+	pr_info("Panel=%s", fbdev->panel->name);
 
 	return 0;
 }
@@ -422,7 +423,7 @@ static int au1100fb_drv_probe(struct platform_device *dev)
 	/* Allocate region for our registers and map them */
 	regs_res = platform_get_resource(dev, IORESOURCE_MEM, 0);
 	if (!regs_res) {
-		print_err("fail to retrieve registers resource");
+		pr_err("fail to retrieve registers resource");
 		return -EFAULT;
 	}
 
@@ -440,15 +441,15 @@ static int au1100fb_drv_probe(struct platform_device *dev)
 				     fbdev->info.fix.mmio_start,
 				     fbdev->info.fix.mmio_len,
 				     DRIVER_NAME)) {
-		print_err("fail to lock memory region at 0x%08lx",
+		pr_err("fail to lock memory region at 0x%08lx",
 			  fbdev->info.fix.mmio_start);
 		return -EBUSY;
 	}
 
 	fbdev->regs = (struct au1100fb_regs*)KSEG1ADDR(fbdev->info.fix.mmio_start);
 
-	print_dbg("Register memory map at %p", fbdev->regs);
-	print_dbg("phys=0x%08x, size=%zu", fbdev->regs_phys, fbdev->regs_len);
+	pr_devel("Register memory map at %p", fbdev->regs);
+	pr_devel("phys=0x%08x, size=%zu", fbdev->regs_phys, fbdev->regs_len);
 
 	c = clk_get(NULL, "lcd_intclk");
 	if (!IS_ERR(c)) {
@@ -465,7 +466,7 @@ static int au1100fb_drv_probe(struct platform_device *dev)
 					    PAGE_ALIGN(fbdev->fb_len),
 					    &fbdev->fb_phys, GFP_KERNEL);
 	if (!fbdev->fb_mem) {
-		print_err("fail to allocate framebuffer (size: %zuK))",
+		pr_err("fail to allocate framebuffer (size: %zuK))",
 			  fbdev->fb_len / 1024);
 		return -ENOMEM;
 	}
@@ -473,8 +474,8 @@ static int au1100fb_drv_probe(struct platform_device *dev)
 	fbdev->info.fix.smem_start = fbdev->fb_phys;
 	fbdev->info.fix.smem_len = fbdev->fb_len;
 
-	print_dbg("Framebuffer memory map at %p", fbdev->fb_mem);
-	print_dbg("phys=0x%pad, size=%zuK", &fbdev->fb_phys, fbdev->fb_len / 1024);
+	pr_devel("Framebuffer memory map at %p", fbdev->fb_mem);
+	pr_devel("phys=0x%pad, size=%zuK", &fbdev->fb_phys, fbdev->fb_len / 1024);
 
 	/* load the panel info into the var struct */
 	fbdev->info.var = (struct fb_var_screeninfo) {
@@ -498,7 +499,7 @@ static int au1100fb_drv_probe(struct platform_device *dev)
 		return -ENOMEM;
 
 	if (fb_alloc_cmap(&fbdev->info.cmap, AU1100_LCD_NBR_PALETTE_ENTRIES, 0) < 0) {
-		print_err("Fail to allocate colormap (%d entries)",
+		pr_err("Fail to allocate colormap (%d entries)",
 			   AU1100_LCD_NBR_PALETTE_ENTRIES);
 		return -EFAULT;
 	}
@@ -508,7 +509,7 @@ static int au1100fb_drv_probe(struct platform_device *dev)
 
 	/* Register new framebuffer */
 	if (register_framebuffer(&fbdev->info) < 0) {
-		print_err("cannot register new framebuffer");
+		pr_err("cannot register new framebuffer");
 		goto failed;
 	}
 
diff --git a/drivers/video/fbdev/au1100fb.h b/drivers/video/fbdev/au1100fb.h
index 63aef2f52141..80743b3e2376 100644
--- a/drivers/video/fbdev/au1100fb.h
+++ b/drivers/video/fbdev/au1100fb.h
@@ -30,16 +30,6 @@
 #ifndef _AU1100LCD_H
 #define _AU1100LCD_H
 
-#define print_err(f, arg...) printk(KERN_ERR DRIVER_NAME ": " f "\n", ## arg)
-#define print_warn(f, arg...) printk(KERN_WARNING DRIVER_NAME ": " f "\n", ## arg)
-#define print_info(f, arg...) printk(KERN_INFO DRIVER_NAME ": " f "\n", ## arg)
-
-#if DEBUG
-#define print_dbg(f, arg...) printk(__FILE__ ": " f "\n", ## arg)
-#else
-#define print_dbg(f, arg...) do {} while (0)
-#endif
-
 #if defined(__BIG_ENDIAN)
 #define LCD_CONTROL_DEFAULT_PO LCD_CONTROL_PO_11
 #else
-- 
2.47.3

