Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GdPKjDRkWmJnAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 14:59:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B3F13ECA1
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 14:59:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DA4810E363;
	Sun, 15 Feb 2026 13:59:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="XZgaTIPI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B83210E363
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 13:59:03 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-48329eb96a7so12739245e9.3
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 05:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771163942; x=1771768742;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ScnBj3oP04p3y5F7vVbJFUDlhPXEJXdunkul8Q3TBN4=;
 b=XZgaTIPIHNKcuUCL56r2J2QXLxUU9UoRAwPE0UyOMtbcghUhCIs4po3OhYad7GcRzo
 M1+BEFWqorD5hHGjVZMKedAdHr87LghLvIBTsSynrGoElEurcncfWUQgBNbzjsnnK4vh
 hrlFktz8J7/RGUwc/z+gxwrBKaBLW3m8AqxsEzwTGlU8R0Z1sRUdk4Od611Fx/eAN0Wk
 MY1nXvHx2k/GbvQBROa0gHZW7l2V8A7Cf1GctYzrZc5ceq7mLsFMrOz29j04mJhTMsiR
 1XvSljurikTRW75h0GMHAD9nVYDvdyZKtJCZ7FT/6Vu7T1JPuhZ7kot7LKK7zIh1pdxO
 SqxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771163942; x=1771768742;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ScnBj3oP04p3y5F7vVbJFUDlhPXEJXdunkul8Q3TBN4=;
 b=tL4mqWv4d73y4t0rvhRvOaMWQopeN0/8DCHVSBomFp+H7ZJOzEZ7mpNqfx6cVrhKCg
 DrIgUerbhW3CYYSLCNjPsXxYvUH2KDEIJxmmxaM4ARyeDt0a7y8DFl6UUXQv7wLXT38P
 CsCgAoJm1KV5TcHEbjcEzjHpBklMU5vkSYtKGqSdZciSqgHlFP3RtWJDN5onNenyRuF0
 kLsZWRklCVEvGMmOuV1KGesUajUYOGPUnSY53ClIzSNHGRblPbKjUOXQyeZn8KnmPnQh
 W9hMlBypJ+hElgl/y0FwyZkx3bjQKMjXEJeUBBGP0XoUPwySULjFtffwoWRKmxDnnphH
 IVog==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAzZsMNQrNJK0rNARieCPc1qQTaGLL69KK2iDz8NCbnSZP8m4tiUC3/4IIHvegJPc1oo1wEUj5DR4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzce+sAeXEWmrul/eaL1/qvR18nxmoQAqS35t8bC3EjbWPbx4L3
 k/Uh81+9P/UWBBlaJd1d+itx3/ak9J20jonhmbkIyfjrlxfO/bvjXa58scVlVjzPnV8=
X-Gm-Gg: AZuq6aIqB0P4EB3ut7sqBbQ+0zx0g4a0Sp26hnVuIKFS6ay+ZZyWtOT1huDlc0tDdVT
 1oo/WWNnIRCUGpy+esPXpP2F+bHzL6KqHIv6xuqNQq1FmGNArrgKtYRJe81CGEO+b9L07bocuzw
 KCeToP1KkNpIh21IBKRP/s4pYo2BKAmQxtQcSw+d1gj9Rg3k91ixMjARSn6+cQnOQiicjWnDPdv
 Afrfipe4JiSdO8ND56081pN6dQrWWHoi3/ZoWrdXyjUFczXL/j2kRGwyc9qOH6UhhVqQuyVF2n6
 ldHbHINZGxKas0G0V+zmlxL8GSB4n6B9q/LlyoeclNI+D9X9MZ1rBog7/ETjz+cLrveMew89ZSM
 dBfnYhWBixzcTZUOjYsqdsojMvoLUK4bbtSEE4JOVrZyV/LD/PB/wqzh30whfhBggCUD1JKzyfS
 WS64XFhy4WLotEIwcIO9it+Neleefe
X-Received: by 2002:a05:600c:450d:b0:483:a21:774c with SMTP id
 5b1f17b1804b1-48373a44430mr124838965e9.25.1771163941215; 
 Sun, 15 Feb 2026 05:59:01 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-483709f6935sm91936255e9.0.2026.02.15.05.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Feb 2026 05:59:00 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Helge Deller <deller@gmx.de>
Cc: Chen Ni <nichen@iscas.ac.cn>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v4 5/7] fbdev: au1100fb: Replace custom printk wrappers by pr_*
Date: Sun, 15 Feb 2026 14:58:32 +0100
Message-ID: <6c72b8bcd1b608d1ec7227b8d1aa6c7a73148a05.1771163316.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771163316.git.u.kleine-koenig@baylibre.com>
References: <cover.1771163316.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=6894;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=knkEjt6E6SqfheIipY0HTc6BP4rRXr7oklWLe8fknuU=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpkdEQBWydOy4yift6xDFkTdTLt0mB5wRzzbHWS
 gkG4pJLKZ2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaZHREAAKCRCPgPtYfRL+
 Tk+NCAC34rTeEDbwOc39WAvDUIaEFLFy739AZCqUK5LPsTtrkD0cVNrLQFYm4pS1l5X7lY++FNi
 zB6HiKY3oq4aNeETf1WuZJ6nT9JooXnnhKEJIgWXf7+IJag4hHcOOGq3M+Vp2QXgU5Hm1lu06UC
 2T5tdyAxwSGgcA14XuPJiY/pKKrw+42Oja64ovL5bc3evK+N/jAFzlVgY68kAEhDBLeN5dSAygp
 7TmSrhhOPwnY4vJSZ2GLCS8VSmERSleugzSMi5NR23BxWv1gTCD5fH6wXfWk/eLnHrn1vE87ydQ
 d689p2YkSKbmJjjj5F6ZyyhDgx2BVztLKQNWCU/BEmPWfMMS
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
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[baylibre.com];
	FREEMAIL_TO(0.00)[gmx.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:deller@gmx.de,m:nichen@iscas.ac.cn,m:linux-fbdev@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre-com.20230601.gappssmtp.com:dkim,baylibre.com:mid,baylibre.com:email]
X-Rspamd-Queue-Id: 30B3F13ECA1
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
index 782f70c3a98f..86aafa4f0966 100644
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
 
@@ -290,7 +291,7 @@ static int au1100fb_fb_pan_display(struct fb_var_screeninfo *var, struct fb_info
 
 	fbdev = to_au1100fb_device(fbi);
 
-	print_dbg("fb_pan_display %p %p", var, fbi);
+	pr_devel("fb_pan_display %p %p", var, fbi);
 
 	if (!var || !fbdev) {
 		return -EINVAL;
@@ -301,13 +302,13 @@ static int au1100fb_fb_pan_display(struct fb_var_screeninfo *var, struct fb_info
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
@@ -321,7 +322,7 @@ static int au1100fb_fb_pan_display(struct fb_var_screeninfo *var, struct fb_info
 			fbdev->regs->lcd_dmaaddr0 = LCD_DMA_SA_N(dmaaddr);
 	}
 	}
-	print_dbg("fb_pan_display 3 %p %p", var, fbi);
+	pr_devel("fb_pan_display 3 %p %p", var, fbi);
 
 	return 0;
 }
@@ -364,7 +365,7 @@ static int au1100fb_setup(struct au1100fb_device *fbdev)
 	int num_panels = ARRAY_SIZE(known_lcd_panels);
 
 	if (num_panels <= 0) {
-		print_err("No LCD panels supported by driver!");
+		pr_err("No LCD panels supported by driver!");
 		return -ENODEV;
 	}
 
@@ -387,16 +388,16 @@ static int au1100fb_setup(struct au1100fb_device *fbdev)
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
@@ -421,7 +422,7 @@ static int au1100fb_drv_probe(struct platform_device *dev)
 	/* Allocate region for our registers and map them */
 	regs_res = platform_get_resource(dev, IORESOURCE_MEM, 0);
 	if (!regs_res) {
-		print_err("fail to retrieve registers resource");
+		pr_err("fail to retrieve registers resource");
 		return -EFAULT;
 	}
 
@@ -439,15 +440,15 @@ static int au1100fb_drv_probe(struct platform_device *dev)
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
@@ -464,7 +465,7 @@ static int au1100fb_drv_probe(struct platform_device *dev)
 					    PAGE_ALIGN(fbdev->fb_len),
 					    &fbdev->fb_phys, GFP_KERNEL);
 	if (!fbdev->fb_mem) {
-		print_err("fail to allocate framebuffer (size: %zuK))",
+		pr_err("fail to allocate framebuffer (size: %zuK))",
 			  fbdev->fb_len / 1024);
 		return -ENOMEM;
 	}
@@ -472,8 +473,8 @@ static int au1100fb_drv_probe(struct platform_device *dev)
 	fbdev->info.fix.smem_start = fbdev->fb_phys;
 	fbdev->info.fix.smem_len = fbdev->fb_len;
 
-	print_dbg("Framebuffer memory map at %p", fbdev->fb_mem);
-	print_dbg("phys=0x%pad, size=%zuK", &fbdev->fb_phys, fbdev->fb_len / 1024);
+	pr_devel("Framebuffer memory map at %p", fbdev->fb_mem);
+	pr_devel("phys=0x%pad, size=%zuK", &fbdev->fb_phys, fbdev->fb_len / 1024);
 
 	/* load the panel info into the var struct */
 	fbdev->info.var = (struct fb_var_screeninfo) {
@@ -497,7 +498,7 @@ static int au1100fb_drv_probe(struct platform_device *dev)
 		return -ENOMEM;
 
 	if (fb_alloc_cmap(&fbdev->info.cmap, AU1100_LCD_NBR_PALETTE_ENTRIES, 0) < 0) {
-		print_err("Fail to allocate colormap (%d entries)",
+		pr_err("Fail to allocate colormap (%d entries)",
 			   AU1100_LCD_NBR_PALETTE_ENTRIES);
 		return -EFAULT;
 	}
@@ -507,7 +508,7 @@ static int au1100fb_drv_probe(struct platform_device *dev)
 
 	/* Register new framebuffer */
 	if (register_framebuffer(&fbdev->info) < 0) {
-		print_err("cannot register new framebuffer");
+		pr_err("cannot register new framebuffer");
 		goto failed;
 	}
 
diff --git a/drivers/video/fbdev/au1100fb.h b/drivers/video/fbdev/au1100fb.h
index 998328cd16a2..9b70208128a8 100644
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

