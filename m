Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A42D16A59
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 05:59:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA73110E44F;
	Tue, 13 Jan 2026 04:59:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dcwKZyiK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1619710E44F
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 04:59:42 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-350fe1f8ea3so189049a91.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 20:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768280381; x=1768885181; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jTvxo6KbWMtGy6RGpj72F7tdPe/SFWx8IlZmuHDEiGo=;
 b=dcwKZyiK6+CB2fkLuCZ0uOIXczerA/6/HJHQvUsk2RPIXUz/tHUXOKotmeCjXTonsJ
 hqKTHLgPFlAq4u/wVOVie42X+iI9bmaRgiMsYb2CvdIZXmRASWPMpncgb2WuoHAZap4/
 oHO1Diu19PO6a/mayhti9HqLcFJpx+N14/XHC+OptP2YwqSjb5kmaP1PzOTw0ruMsly1
 7lwCx2+I4D7xO27eT3gWirUM7KmIY+hztqORJUwcFvhidFqP2niDi6h/xM1LbuxMAR5t
 hhJwgHxW2h8DGTUD69XOnwmSrTpBsEMC5jhY4oAphNQWHTHdMteLYEFfr4yhD/JkvHqc
 2EjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768280381; x=1768885181;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jTvxo6KbWMtGy6RGpj72F7tdPe/SFWx8IlZmuHDEiGo=;
 b=Dm+KEfTBarvXxDqfq7bXRBjxGfxIuOCab43nSVDmy3Yt0GarZnSQYXcdLAnpWXtKM4
 3Cq9CnEe1weYtCuupCCi44J5AhRJI8MMkAl0IAXa4V9A5p87Rf6uAagieO2MEE4EkSv5
 QWvI2m3VgbPin9G7iMqptpa5nrBmNrJbKhohCWZ27jQehWjSz4HhnCTY3CsEj6du8cSD
 uXQX8Zws2ywOoy/eiDXQtuHxXoRNJtYuPokHKYVXQ25JSSiR1OFpVAkw6kxZ1GF0Ha9W
 tV5KdqX9i2EYC64vhfNL3ZZLw0NL5vunCk5Hcj0WyD17gY8m/wU/4G02guZUJizt4ECH
 0Nwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZDlskFKb/hiUAPF+5XDo8R+9Z4p2D1xshZ6l7mUy6NlYfSB61t/HuGhWe+QL/Kc7vDxEfIUiyQMc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbprvkBfM9ms+tgcNi7du2mSl2NbASP6K7LH2VOViBPHFBqw+P
 O8yZ55Twm5sUmieGR8hwaSlZTF4btylKXoxQMukUk5R6Nz4DAZNrXkMq
X-Gm-Gg: AY/fxX4y6w63eGybLHrnc68ps3QsRRl9udbQJw8rrMfpIzNs0E52MDARrh+sbLeXy8+
 dZh7B53QUYebgFGSX8THdW5YN9/gyHUCaLibwZ4+8YtH9pvkMGiY2YN1/ou4g8pGmUEM5sr4qwm
 KeW0XuunKKGpGsTLbYOLOQ9f3adRz87m0jwO6oCI8REmf8I6ofSk26HWOAWI6EDk0kbvqygTMw3
 SFO8RXuONlJnGEnO9IoYSWOaP2wXY+wv/HGDeERQu8+IQM5po/HsoTeZe1OUwwtCt0PHqluIUEs
 C/lfNADtdBxN6ucJk+Hx97h/BxkV9sn3yW0C1eL9UFku6EElwaJ8+1fGqVyRafEryTngbjXIDBo
 ExDVyj6a4gXYEUYkgKxyoMmhZSqQOSqbde8edYhLJps1IF0hohX9jFfeLbw1YjhlzBcPdOtXArn
 1+a70zaCZayPzliOfBvdxi2DlN2okEzz5CLKfIAkWTeVk=
X-Google-Smtp-Source: AGHT+IF5y3wMzzLD9O647B9Fwv+OhX6pLmVT/zSElB3m1p3Mv2vCh9yICG/2VmelPoTP3BFPVF2CNg==
X-Received: by 2002:a17:90a:d40c:b0:34a:b8e0:dd64 with SMTP id
 98e67ed59e1d1-34f68c023eamr17396933a91.1.1768280381428; 
 Mon, 12 Jan 2026 20:59:41 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net
 ([2601:1c0:5780:9200:6652:1d71:eee0:e3bb])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34f5fb74436sm1341597a91.14.2026.01.12.20.59.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 20:59:40 -0800 (PST)
From: Chintan Patel <chintanlike@gmail.com>
To: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, andy@kernel.org, deller@gmx.de,
 gregkh@linuxfoundation.org, Chintan Patel <chintanlike@gmail.com>,
 kernel test robot <lkp@intel.com>
Subject: [PATCH v6] staging: fbtft: Use fbdev logging helpers when FB_DEVICE
 is disabled
Date: Mon, 12 Jan 2026 20:59:09 -0800
Message-ID: <20260113045909.336931-1-chintanlike@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Replace direct accesses to info->dev with fb_dbg() and fb_info()
helpers to avoid build failures when CONFIG_FB_DEVICE=n.

Fixes: a06d03f9f238 ("staging: fbtft: Make FB_DEVICE dependency optional")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202601110740.Y9XK5HtN-lkp@intel.com
Signed-off-by: Chintan Patel <chintanlike@gmail.com>

Changes in v6:
- Switch debug/info logging to fb_dbg() and fb_info()(suggested by Thomas Zimmermann)
- Drop dev_of_fbinfo() usage in favor of framebuffer helpers that implicitly
  handle the debug/info context.
- Drop __func__ usage per review feedback(suggested by greg k-h)
- Add Fixes tag for a06d03f9f238 ("staging: fbtft: Make FB_DEVICE dependency optional")
  (suggested by Andy Shevchenko)

Changes in v5:
- Initial attempt to replace info->dev accesses using
  dev_of_fbinfo() helper
---
 drivers/staging/fbtft/fbtft-core.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 8a5ccc8ae0a1..1b3b62950205 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -365,9 +365,9 @@ static int fbtft_fb_setcolreg(unsigned int regno, unsigned int red,
 	unsigned int val;
 	int ret = 1;
 
-	dev_dbg(info->dev,
-		"%s(regno=%u, red=0x%X, green=0x%X, blue=0x%X, trans=0x%X)\n",
-		__func__, regno, red, green, blue, transp);
+	fb_dbg(info,
+	       "regno=%u, red=0x%X, green=0x%X, blue=0x%X, trans=0x%X\n",
+	       regno, red, green, blue, transp);
 
 	switch (info->fix.visual) {
 	case FB_VISUAL_TRUECOLOR:
@@ -391,8 +391,7 @@ static int fbtft_fb_blank(int blank, struct fb_info *info)
 	struct fbtft_par *par = info->par;
 	int ret = -EINVAL;
 
-	dev_dbg(info->dev, "%s(blank=%d)\n",
-		__func__, blank);
+	fb_dbg(info, "blank=%d\n", blank);
 
 	if (!par->fbtftops.blank)
 		return ret;
@@ -793,11 +792,11 @@ int fbtft_register_framebuffer(struct fb_info *fb_info)
 	if (spi)
 		sprintf(text2, ", spi%d.%d at %d MHz", spi->controller->bus_num,
 			spi_get_chipselect(spi, 0), spi->max_speed_hz / 1000000);
-	dev_info(fb_info->dev,
-		 "%s frame buffer, %dx%d, %d KiB video memory%s, fps=%lu%s\n",
-		 fb_info->fix.id, fb_info->var.xres, fb_info->var.yres,
-		 fb_info->fix.smem_len >> 10, text1,
-		 HZ / fb_info->fbdefio->delay, text2);
+	fb_info(fb_info,
+		"%s frame buffer, %dx%d, %d KiB video memory%s, fps=%lu%s\n",
+		fb_info->fix.id, fb_info->var.xres, fb_info->var.yres,
+		fb_info->fix.smem_len >> 10, text1,
+		HZ / fb_info->fbdefio->delay, text2);
 
 	/* Turn on backlight if available */
 	if (fb_info->bl_dev) {
-- 
2.43.0

