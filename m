Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MN36C95Xkmm9tAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 00:33:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B48140184
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 00:33:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7DB510E0B4;
	Sun, 15 Feb 2026 23:33:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="QBI0GI1M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CF4F10E0B4
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 23:33:45 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-437711e9195so1776987f8f.1
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 15:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771198424; x=1771803224;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pELAZvBYJ7zPaLRs/K/s8XgiLo8Mv18z9SfAbA1/CD0=;
 b=QBI0GI1MHOIsxTB9EQftn3SZP2NXUh3eRTMMfyEx+n47LQGykjzj/V+t1ChTJMqSfv
 3f9/xglEKo1BdoirnLvb35hsCrygaCrhFW7F/3L81pr89euUY6TtrBij/KY8si6p9gf2
 AC+FyEgkhmvQD+FHKaO29i6nltP3kz1/9lPqCUcmlTUeF8/KzcbWSkp0ufc3vQ4xl8IB
 xJ3ZygrTLbbWHk20InBQIV1KFcWkMKFt4vpjfi43Eke5RA7OU7RizvjFwuWzF2RpmO7s
 OQyNMs8+dDl5rRa7Ec/RVc6ZetClNMzucqW9HOXvau5fEaUSgDhLDhuBMHIb8EeWuyLC
 ih0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771198424; x=1771803224;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pELAZvBYJ7zPaLRs/K/s8XgiLo8Mv18z9SfAbA1/CD0=;
 b=l2wrJg/iEQx5ye352/PU+zXqbYRrHJmLpHaK+j7dGNs/e0KJjZBHBO76gPrY2ukfbv
 /xajGBpu40d7o1E8s9iPN7f7xj8hTyWnz+PVHAGR6gkHjw24PZZYTtI0mjI1EdcJUSUp
 IL0423cM3bouLHUQhXYqA6mHhpGXc/veMtaYuz9EDVOaWc18PJyU91Pb9dIbLz0aFRKc
 eFegGtxi72QLJwJvxFrrOurCpXovywZhGM7RFX53qbcZvMmt+O+WghKxN/3LqtHxt0Wz
 xMX/D2lQc0G8RLhhuDMhdZHp1StrNIcJHDjiB7xkaBT+hY3EM7CmZotQ06maCPxfz35o
 5NYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkEeU4PblbpDuyZY3SviUtmZRzBXCB0ZwLiOU2vc/xL/jyYGGl2eL5HqhvwISDHYSNpIx9iR521r4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxt8oSsazR6gYr60Ond1PCNreZUDZdc32TsYN7Iu75EyY8y/ebH
 sAhGTezPDbSqtR5b8dvfYwevgwj732fQeuOKX81Gn281GO/8y5PNCltFG1diTZW8jvM=
X-Gm-Gg: AZuq6aL0DSJH8Q4ucZCzl5m98VK4vp7Y0v3AAq16ZaNdzIMY/9ckVlPDVpKExuSjdYN
 wWWfi8EYaYw8TyXK/0Z7eBLI2+IVOOEyqnoBwYDPLutneGepcxC1Tfu0nVKzoVOh9s1Kd6tPIMs
 UrjaHsy5V3jY3HmXFTM0KGaX8SV6j39HOsbJ1TaX+FHrdLb5tpKGXTJ7djwSIazOahHmZjU9kaD
 8j9ZBp0KLXmUEayE8VPcZNlCNzVaSeWCKsQjxkIw+LWJ/nvAuy7EK9smUIxfMoQL2ChUe95/2Se
 FmsqluuUg4W57kK8AFxx0goEJkz0EVoY/AaVeMxy+QbnUpnJNXOb0bAjrDO4cRPbVKqvaj65dh9
 L66xVCls4ChlxyOuF+DUNDc8Yjt56oPFC8wwkSStDnUfShclun4XJRH9yI9/SIXtJVCi1aaZ5nX
 3no79RTWNeEA2C7kpFJEdC9DQ5ISyG
X-Received: by 2002:a5d:588d:0:b0:437:7710:5204 with SMTP id
 ffacd0b85a97d-43796afa1eemr18656547f8f.53.1771198423572; 
 Sun, 15 Feb 2026 15:33:43 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-43796ac7d91sm22790478f8f.26.2026.02.15.15.33.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Feb 2026 15:33:43 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Helge Deller <deller@gmx.de>
Cc: Chen Ni <nichen@iscas.ac.cn>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v5 1/7] fbdev: au1100fb: Don't store device specific data in
 global variables
Date: Mon, 16 Feb 2026 00:33:17 +0100
Message-ID: <e8529f101d5bf5d4cfa5ae7db4e6de1f9ff87803.1771198101.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771198101.git.u.kleine-koenig@baylibre.com>
References: <cover.1771198101.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=6477;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=hhm4j8GECKHBQ6/lpgUgfJqXCG0ZunFIpiac9ZrFSRY=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpkle/AQNIpdvKpv37jW/13IcI6MSCxDyJMn5lW
 hfOYRAJhPWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaZJXvwAKCRCPgPtYfRL+
 TrETCACgzJXL0Hjx/HkKXgCTpU74REA8e+SVjmltXMMA7png7bK0JIIthASlxo9mIh2ecjkholt
 bv9RtPeiU2UJBPM0139mRKIJEgjgVql2E6k+Az9FUiolo2fo02w/K4z8GuZFpvd5LpsaKGG4EXW
 VoEBj8ooCSi1v9Lk4k2LyfO5djxLqJHOnY5aNs5BVc+FDd1d6vg8j6WkJ48lHNesjVZnMZYk5IN
 dWJb8BlRRFww36eaFxD5Xw4dfjeHoyULCmmK/roU4eGu8KJBXDP9KYjH3bIRC952XnMWDDoQnEi
 RQ7D2lcFbDDOx2cl2yAYQ3duTyTZM7bd2Vj0/xR7jBfkN7fm
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
X-Rspamd-Queue-Id: D3B48140184
X-Rspamd-Action: no action

Using global data to store device specific data is a bad pattern that
breaks if there is more than one device. So expand driver data and drop
the global variables.

While there is probably no machine that has two or more au1100fb
devices, this makes the driver a better template for new drivers and
saves some memory if there is no such bound device.

bloat-o-meter reports (for ARCH=arm allmodconfig + CONFIG_FB_AU1100=y
and ignoring the rename of the init function):

	add/remove: 1/4 grow/shrink: 2/2 up/down: 1360/-4800 (-3440)
	Function                                     old     new   delta
	au1100fb_drv_probe                          2648    3328    +680
	$a                                         12808   13484    +676
	au1100fb_drv_resume                          404     400      -4
	au1100fb_fix                                  68       -     -68
	au1100fb_var                                 160       -    -160
	fbregs                                      2048       -   -2048
	$d                                          9525    7009   -2516
	Total: Before=38664, After=35224, chg -8.90%

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
I think this doesn't need a Fixes line, but if you want, it would be:

	Fixes: 3b495f2bb749 ("Au1100 FB driver uplift for 2.6.")
	Fixes: f77f50ca1a23 ("[PATCH] au1100fb: add power management support")
---
 drivers/video/fbdev/au1100fb.c | 65 +++++++++++++++-------------------
 drivers/video/fbdev/au1100fb.h |  5 +++
 2 files changed, 34 insertions(+), 36 deletions(-)

diff --git a/drivers/video/fbdev/au1100fb.c b/drivers/video/fbdev/au1100fb.c
index feaa1061c436..7bc224a8455c 100644
--- a/drivers/video/fbdev/au1100fb.c
+++ b/drivers/video/fbdev/au1100fb.c
@@ -84,21 +84,6 @@ struct fb_bitfield rgb_bitfields[][4] =
 	{ { 8, 4, 0 },  { 4, 4, 0 }, { 0, 4, 0 }, { 0, 0, 0 } },
 };
 
-static struct fb_fix_screeninfo au1100fb_fix = {
-	.id		= "AU1100 FB",
-	.xpanstep 	= 1,
-	.ypanstep 	= 1,
-	.type		= FB_TYPE_PACKED_PIXELS,
-	.accel		= FB_ACCEL_NONE,
-};
-
-static struct fb_var_screeninfo au1100fb_var = {
-	.activate	= FB_ACTIVATE_NOW,
-	.height		= -1,
-	.width		= -1,
-	.vmode		= FB_VMODE_NONINTERLACED,
-};
-
 /* fb_blank
  * Blank the screen. Depending on the mode, the screen will be
  * activated with the backlight color, or desactivated
@@ -432,19 +417,26 @@ static int au1100fb_drv_probe(struct platform_device *dev)
 		return -EFAULT;
 	}
 
-	au1100fb_fix.mmio_start = regs_res->start;
-	au1100fb_fix.mmio_len = resource_size(regs_res);
+	fbdev->info.fix = (struct fb_fix_screeninfo) {
+		.mmio_start = regs_res->start,
+		.mmio_len = resource_size(regs_res),
+		.id = "AU1100 FB",
+		.xpanstep = 1,
+		.ypanstep = 1,
+		.type = FB_TYPE_PACKED_PIXELS,
+		.accel = FB_ACCEL_NONE,
+	};
 
 	if (!devm_request_mem_region(&dev->dev,
-				     au1100fb_fix.mmio_start,
-				     au1100fb_fix.mmio_len,
+				     fbdev->info.fix.mmio_start,
+				     fbdev->info.fix.mmio_len,
 				     DRIVER_NAME)) {
 		print_err("fail to lock memory region at 0x%08lx",
-				au1100fb_fix.mmio_start);
+			  fbdev->info.fix.mmio_start);
 		return -EBUSY;
 	}
 
-	fbdev->regs = (struct au1100fb_regs*)KSEG1ADDR(au1100fb_fix.mmio_start);
+	fbdev->regs = (struct au1100fb_regs*)KSEG1ADDR(fbdev->info.fix.mmio_start);
 
 	print_dbg("Register memory map at %p", fbdev->regs);
 	print_dbg("phys=0x%08x, size=%d", fbdev->regs_phys, fbdev->regs_len);
@@ -469,22 +461,27 @@ static int au1100fb_drv_probe(struct platform_device *dev)
 		return -ENOMEM;
 	}
 
-	au1100fb_fix.smem_start = fbdev->fb_phys;
-	au1100fb_fix.smem_len = fbdev->fb_len;
+	fbdev->info.fix.smem_start = fbdev->fb_phys;
+	fbdev->info.fix.smem_len = fbdev->fb_len;
 
 	print_dbg("Framebuffer memory map at %p", fbdev->fb_mem);
 	print_dbg("phys=0x%08x, size=%dK", fbdev->fb_phys, fbdev->fb_len / 1024);
 
 	/* load the panel info into the var struct */
-	au1100fb_var.bits_per_pixel = fbdev->panel->bpp;
-	au1100fb_var.xres = fbdev->panel->xres;
-	au1100fb_var.xres_virtual = au1100fb_var.xres;
-	au1100fb_var.yres = fbdev->panel->yres;
-	au1100fb_var.yres_virtual = au1100fb_var.yres;
+	fbdev->info.var = (struct fb_var_screeninfo) {
+		.activate = FB_ACTIVATE_NOW,
+		.height = -1,
+		.width = -1,
+		.vmode = FB_VMODE_NONINTERLACED,
+		.bits_per_pixel = fbdev->panel->bpp,
+		.xres = fbdev->panel->xres,
+		.xres_virtual = fbdev->panel->xres,
+		.yres = fbdev->panel->yres,
+		.yres_virtual = fbdev->panel->yres,
+	};
 
 	fbdev->info.screen_base = fbdev->fb_mem;
 	fbdev->info.fbops = &au1100fb_ops;
-	fbdev->info.fix = au1100fb_fix;
 
 	fbdev->info.pseudo_palette =
 		devm_kcalloc(&dev->dev, 16, sizeof(u32), GFP_KERNEL);
@@ -497,8 +494,6 @@ static int au1100fb_drv_probe(struct platform_device *dev)
 		return -EFAULT;
 	}
 
-	fbdev->info.var = au1100fb_var;
-
 	/* Set h/w registers */
 	au1100fb_setmode(fbdev);
 
@@ -545,9 +540,7 @@ void au1100fb_drv_remove(struct platform_device *dev)
 }
 
 #ifdef CONFIG_PM
-static struct au1100fb_regs fbregs;
-
-int au1100fb_drv_suspend(struct platform_device *dev, pm_message_t state)
+static int au1100fb_drv_suspend(struct platform_device *dev, pm_message_t state)
 {
 	struct au1100fb_device *fbdev = platform_get_drvdata(dev);
 
@@ -559,7 +552,7 @@ int au1100fb_drv_suspend(struct platform_device *dev, pm_message_t state)
 
 	clk_disable(fbdev->lcdclk);
 
-	memcpy(&fbregs, fbdev->regs, sizeof(struct au1100fb_regs));
+	memcpy(&fbdev->pm_regs, fbdev->regs, sizeof(struct au1100fb_regs));
 
 	return 0;
 }
@@ -572,7 +565,7 @@ int au1100fb_drv_resume(struct platform_device *dev)
 	if (!fbdev)
 		return 0;
 
-	memcpy(fbdev->regs, &fbregs, sizeof(struct au1100fb_regs));
+	memcpy(fbdev->regs, &fbdev->pm_regs, sizeof(struct au1100fb_regs));
 
 	ret = clk_enable(fbdev->lcdclk);
 	if (ret)
diff --git a/drivers/video/fbdev/au1100fb.h b/drivers/video/fbdev/au1100fb.h
index 79f4048726f1..b7bf6e005572 100644
--- a/drivers/video/fbdev/au1100fb.h
+++ b/drivers/video/fbdev/au1100fb.h
@@ -105,6 +105,11 @@ struct au1100fb_device {
 	size_t       		regs_len;
 	unsigned int 		regs_phys;
 
+#ifdef CONFIG_PM
+	/* stores the register values during suspend */
+	struct au1100fb_regs	pm_regs;
+#endif
+
 	unsigned char* 		fb_mem;		/* FrameBuffer memory map */
 	size_t	      		fb_len;
 	dma_addr_t    		fb_phys;
-- 
2.47.3

