Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLq2HzUOg2k+hAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 10:15:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9830E3ABC
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 10:15:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FFE410E591;
	Wed,  4 Feb 2026 09:15:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="QWzziCPQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C518E10E591
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 09:15:29 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-43284ed32a0so3567921f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Feb 2026 01:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770196528; x=1770801328;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cGOswYvI1OpvSrdECniluvWPsTAO8EOjdql4emfj+68=;
 b=QWzziCPQygobhezfK2j00QpJ9CQSYvcbi98ckiqC3e5/CIxegjgmAKXZJAggzn2KhT
 wcOwY+QehSGGWPG3T/9+lUFNUaiLoXiRTvKImbHRova5hqsWah+l23o22YjpdJLFLNll
 OBd2NL1eSjwVXCjAVQzfqMdUT/RC5qHPsNYo7pi7xmCDyUn90IHF7i7QlL9xEn0hvlNE
 1qC84ycCtYXNEYFeasHQBb8S57PCw4/NmSnIEVljWzVRKInB7OlM/uIf1bw8A+rui6kf
 5iCtdKosRZFF1UwlCEMGzdfQEmWDYgncpz/rdfyvikhadlnG3vQnt8mb435QPKrPJAUR
 XvAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770196528; x=1770801328;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cGOswYvI1OpvSrdECniluvWPsTAO8EOjdql4emfj+68=;
 b=UrstzwPQAQjHclP+4P2wvMaDrf4TNSd+5N6kO93FVlDyqzl0x7fxUBYMiD0BY5ND9d
 2dJv9jzL8qV7wlA6PLqdmsMwq6+6N8c9LP330XCUCat6Cdl0gWdZLLCv+WndGe2veg3G
 BmdCQOBzmSCYr+8VlvY81Cp9DD7B49eN/z9XAMfB2P/z5WoyUs6Z1+QglTE4kfW/mUMt
 jBHq5ziPZd1g5O1W+3DCPO6Vj78KpUvYP9bpkxDKgm65ESQ5+yJqkOehpW225UHsz6Ui
 JmVUFGdnUHYN3pX8caHLr39IDSQKwVgg0lnEW/2LYvYbpb3Fq7F2m6KyQM/foDTkjTvq
 gWaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/Gq5727EM2SBqNo9SXz7mz8dlftWvkIE0ABfmLQ18QWBVfDnAGVg5VSFC5nsypzPoqPf0RgjibsQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx221Q7u/rDghLN934ekrXS5ghUYSWK9PeTQuEpTQJvTTKdnJsH
 UEN0JF81VirkUcmqEWqQ/b+FEs5H/3Y7zFwqysVpRc4ajPkhPfhMJiUndeVq0tICOmo=
X-Gm-Gg: AZuq6aLkQB6FDEZqyG0nCpAuEIZscgG342WbsH72tKV3TPXeIZul97ruqYef6CmDFcy
 +8hsMA394zs/edaMIWdQ8g1xb3sz7FmQongcKc8BGifLBtSWjLvZy0j7seWnVz4eev/sZyR0lX9
 31OlatbHeFEeOecWSfcmfgi3yiUi1/9ZI/Am+P/S42xfGc+ktS4cPK/BdllxJ8l53lm7yhw8GAO
 /X4uhNTsDcRbt7DvLtvvk9FyCnbdXTnoHV3nhx6zFUgEgXYj/H1bBvkSCTfdF/SzFEqnACc9Htu
 Lm3ut+op99scO0FswCD9fy1biVqtGlWp7U5d1USkfcOeZ8Qo4JjuOvjVrLirbNZLmf6oxhw8ZyX
 LX2JyNzAyidoL7Dr6BIETRZJiO1zyuZ2W41WlJxMmjMn3WtsBY4GF8iY6JiSGtySVkgTitIfGI+
 YXWkXH3Wh1uRUvrD8tHLPOdD6Mh+Zo5IYRybhdfD/zLKDpf0v76a8MQyPOecCR0FIflBf5wJkWE
 NA=
X-Received: by 2002:a05:6000:2303:b0:430:fbe1:3822 with SMTP id
 ffacd0b85a97d-4361805bbecmr2976113f8f.54.1770196528127; 
 Wed, 04 Feb 2026 01:15:28 -0800 (PST)
Received: from localhost
 (p200300f65f20eb0470629fa1229c2efb.dip0.t-ipconnect.de.
 [2003:f6:5f20:eb04:7062:9fa1:229c:2efb])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-43617e25683sm4887971f8f.6.2026.02.04.01.15.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Feb 2026 01:15:27 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Helge Deller <deller@gmx.de>
Cc: Chen Ni <nichen@iscas.ac.cn>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v1 3/3] fbdev: au1100fb: Don't store device specific data in
 global variables
Date: Wed,  4 Feb 2026 10:15:13 +0100
Message-ID: <9cbc57e4d65e131f39d702d061d554c1f4ede47c.1770196161.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770196161.git.u.kleine-koenig@baylibre.com>
References: <cover.1770196161.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=6420;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=Fkf/4qCt+9aG00qHgsptGoNdY1IP6HFw4O4Wysl6GGQ=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpgw4ml4IsrFX7ilaP914Wqoy26obnyR6BSe4cu
 n4m8xd3DmqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaYMOJgAKCRCPgPtYfRL+
 Tqd+B/4rGr6ZohD2F/IjB7PpXLBw8sP8Q2tYGQ2nh7dADWlElmZM6XAgZW3H7lwMnmWV72spPxQ
 iHdYZsjYpIS5tKSUwR3bhq30+KjVSQrHP02lA03lE6xQPLmgDI2j/V6ohhru3Vuj8RmQ7SfUX1E
 pKJ6MPZ1GcbnymsW8UxWu4jYb92uYBgtorpkLiuMLJi188VLeb8aovAZx+blYUy2n7LL2llqUBG
 uBW3cQk/Hqw1u62nYewPAeQ0/Ok9mfJ2F4sAlGIdAOnNIM/+1S+c4fovxbNcAHGdr2ZB3LDp9jV
 DdQmQuChQ0Vw+k9mnZot2NBE5zX9pSAkMEaMoaq9LE0vcV1u
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
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:deller@gmx.de,m:nichen@iscas.ac.cn,m:linux-fbdev@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: E9830E3ABC
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
 drivers/video/fbdev/au1100fb.c | 63 +++++++++++++++-------------------
 drivers/video/fbdev/au1100fb.h |  5 +++
 2 files changed, 33 insertions(+), 35 deletions(-)

diff --git a/drivers/video/fbdev/au1100fb.c b/drivers/video/fbdev/au1100fb.c
index 94514625965b..6da532ba1d84 100644
--- a/drivers/video/fbdev/au1100fb.c
+++ b/drivers/video/fbdev/au1100fb.c
@@ -89,21 +89,6 @@ struct fb_bitfield rgb_bitfields[][4] =
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
@@ -437,19 +422,26 @@ static int au1100fb_drv_probe(struct platform_device *dev)
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
@@ -474,22 +466,27 @@ static int au1100fb_drv_probe(struct platform_device *dev)
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
@@ -502,8 +499,6 @@ static int au1100fb_drv_probe(struct platform_device *dev)
 		return -EFAULT;
 	}
 
-	fbdev->info.var = au1100fb_var;
-
 	/* Set h/w registers */
 	au1100fb_setmode(fbdev);
 
@@ -550,8 +545,6 @@ static void au1100fb_drv_remove(struct platform_device *dev)
 }
 
 #ifdef CONFIG_PM
-static struct au1100fb_regs fbregs;
-
 static int au1100fb_drv_suspend(struct platform_device *dev, pm_message_t state)
 {
 	struct au1100fb_device *fbdev = platform_get_drvdata(dev);
@@ -564,7 +557,7 @@ static int au1100fb_drv_suspend(struct platform_device *dev, pm_message_t state)
 
 	clk_disable(fbdev->lcdclk);
 
-	memcpy(&fbregs, fbdev->regs, sizeof(struct au1100fb_regs));
+	memcpy(&fbdev->pm_regs, fbdev->regs, sizeof(struct au1100fb_regs));
 
 	return 0;
 }
@@ -577,7 +570,7 @@ static int au1100fb_drv_resume(struct platform_device *dev)
 	if (!fbdev)
 		return 0;
 
-	memcpy(fbdev->regs, &fbregs, sizeof(struct au1100fb_regs));
+	memcpy(fbdev->regs, &fbdev->pm_regs, sizeof(struct au1100fb_regs));
 
 	ret = clk_enable(fbdev->lcdclk);
 	if (ret)
diff --git a/drivers/video/fbdev/au1100fb.h b/drivers/video/fbdev/au1100fb.h
index 8b29e424d017..998328cd16a2 100644
--- a/drivers/video/fbdev/au1100fb.h
+++ b/drivers/video/fbdev/au1100fb.h
@@ -103,6 +103,11 @@ struct au1100fb_device {
 	size_t       		regs_len;
 	unsigned int 		regs_phys;
 
+#ifdef CONFIG_PM
+	/* stores the register values during suspend */
+	struct au1100fb_regs 	pm_regs;
+#endif
+
 	unsigned char* 		fb_mem;		/* FrameBuffer memory map */
 	size_t	      		fb_len;
 	dma_addr_t    		fb_phys;
-- 
2.47.3

