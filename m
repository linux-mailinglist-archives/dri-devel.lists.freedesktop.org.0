Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A50AEC50E
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jun 2025 06:59:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C722210E149;
	Sat, 28 Jun 2025 04:59:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ILei3jy1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2304210E133
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 04:59:45 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-311ef4fb43dso173012a91.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 21:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751086784; x=1751691584; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W6KFydMvKM3jMgYcZFX5+YrAej6q1x9tbL+4kgM9zm0=;
 b=ILei3jy1i3cysdtLz4Zsh/SGoVvujPW29OuyyvKwifHaCq9D254sNHE39wEylIFJaJ
 CbEz8eNWFMfuD/ymn1sHj0JEHj73W5Ohqk5bSpS73EWsa4uFmITv4j/cYbkGZWu+uzc6
 dqXaSEZ2bvnukNG8WQsqtD7nAL2MsntbxmZ+kPsS9Csj3qSXq1WbJZJYtLURBhcZirRO
 NjmdTKXbXIFpW57F6t6RMIYFx0vY/uj2LRlf076g41xSoXBxvE/FWucgMJy1i3Be1Bsd
 Hk2frAC8cGc/EuXRGj2FYS91lOLMXsaFSGWZQVyFfvoj/QS9JOuKIRGaIQZu/TwsGuQ4
 974g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751086784; x=1751691584;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W6KFydMvKM3jMgYcZFX5+YrAej6q1x9tbL+4kgM9zm0=;
 b=d3yZY8IT9ki4PVdUNmPdOLB0zJ/iB4Jz9e4nxd8r9zPI0CSN/p4bYrZceKMjqK7wpv
 QxDgrrIqdqOAsqT9oVmjcmNHLEX7l2PFtRxJ3OIj5nAnNsl7gPV7mRu+a8ZsHSPZNHv7
 3fZqj1USNymP2bEbL6cQEXsk3J2pp2fiEcicJEvUzv3WN+dmW524KZ+aB67+OpubKTnm
 HJ+wyzSmzH8JyYKYp/2cOjjFuKXrEuvlcjiM9KQF8nAG+/hrA3xGhWuPcW4S8wLmp8f7
 RPN8IFnMaHxpUJaknChTYunwzD9TqhZn8Ibf4KO2M1OEssmuBVshJIgBpE0G5v4aWXGc
 7rzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8vfseNahYfi6XQxBqWwJcMh5oTX+uHraUUkIQbHsJsmZmbQlhO/CdOv5mszYG24OzvfLOmFjh1ZQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7ScAhcEf7Lm6SUCh6T98lj6+GZt08KxbmF4MAvojq5sWFavZ7
 8d7teFasPH/GzAzVxV+fV21YWhw9qqQ/dZQQ4FRr2w50pMFKDv5Maf+O
X-Gm-Gg: ASbGncuPTGARhtr0Y8zZYyMOHg66vPtFEt9Eour64pzKef+QPX87z/6NOSH6ODQis39
 1gp5W23EllVrlfJADoI7H8bjztl7jRvwzEu9Iv173TKWPXiWSUcuy8XxfPpzIgm9atu5hNRIStt
 yLhkyNgE5qIGf7PLD0MPffAQP8vxaxharSReAa5SPnacjPY+FZTfp1wYNP2bddv+E0rmTNrmTnY
 GkKvGM+L2du2SMTiqXUEBRZqIttYPhOFz0HexrgMdCcKOiHvM+6vYQ5na6fYLWZqkBoOQjTnUlg
 OnOLa6P5OU7izjHyVbuvFsPLBJK6GEK+7Nud3OZHNueWb6mjTJd6e6Txf9SD1U5FbQT+8drfFJC
 gI72Nrz6IGMFc
X-Google-Smtp-Source: AGHT+IHa+w+z2zouG9On8VvcTYwX0uju2SQmEjN08Q4IjPHgE02aAZdf8HosYP7aHwVRvq+HXQ+62g==
X-Received: by 2002:a17:90b:582d:b0:312:f650:c795 with SMTP id
 98e67ed59e1d1-318c923b91bmr6942314a91.21.1751086784526; 
 Fri, 27 Jun 2025 21:59:44 -0700 (PDT)
Received: from localhost.localdomain ([49.37.221.186])
 by smtp.googlemail.com with ESMTPSA id
 98e67ed59e1d1-318c13a271asm3659713a91.17.2025.06.27.21.59.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 21:59:44 -0700 (PDT)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: andy@kernel.org
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>, dan.carpenter@linaro.org,
 gregkh@linuxfoundation.org, lorenzo.stoakes@oracle.com,
 tzimmermann@suse.de, riyandhiman14@gmail.com, willy@infradead.org,
 notro@tronnes.org, thomas.petazzoni@free-electrons.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v2 2/2] staging: fbtft: cleanup error handling in
 fbtft_framebuffer_alloc()
Date: Sat, 28 Jun 2025 10:29:07 +0530
Message-ID: <62320323049c72b6e3fda6fa7a55e080b29491e8.1751086324.git.abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751086324.git.abdun.nihaal@gmail.com>
References: <cover.1751086324.git.abdun.nihaal@gmail.com>
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

The error handling in fbtft_framebuffer_alloc() mixes managed allocation
and plain allocation, and performs error handling in an order different
from the order in fbtft_framebuffer_release().

Fix them by moving vmem allocation closer to where it is used, and using
plain kzalloc() for txbuf allocation.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
Newly added in v2

 drivers/staging/fbtft/fbtft-core.c | 32 ++++++++++++++++--------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 8538b6bab6a5..f6a147cf0717 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -568,18 +568,13 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 		height = display->height;
 	}
 
-	vmem_size = display->width * display->height * bpp / 8;
-	vmem = vzalloc(vmem_size);
-	if (!vmem)
-		goto alloc_fail;
-
 	fbdefio = devm_kzalloc(dev, sizeof(struct fb_deferred_io), GFP_KERNEL);
 	if (!fbdefio)
-		goto alloc_fail;
+		return NULL;
 
 	buf = devm_kzalloc(dev, 128, GFP_KERNEL);
 	if (!buf)
-		goto alloc_fail;
+		return NULL;
 
 	if (display->gamma_num && display->gamma_len) {
 		gamma_curves = devm_kcalloc(dev,
@@ -588,12 +583,17 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 					    sizeof(gamma_curves[0]),
 					    GFP_KERNEL);
 		if (!gamma_curves)
-			goto alloc_fail;
+			return NULL;
 	}
 
 	info = framebuffer_alloc(sizeof(struct fbtft_par), dev);
 	if (!info)
-		goto alloc_fail;
+		return NULL;
+
+	vmem_size = display->width * display->height * bpp / 8;
+	vmem = vzalloc(vmem_size);
+	if (!vmem)
+		goto release_framebuf;
 
 	info->screen_buffer = vmem;
 	info->fbops = &fbtft_ops;
@@ -613,7 +613,7 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 	info->fix.accel =          FB_ACCEL_NONE;
 	info->fix.smem_len =       vmem_size;
 	if (fb_deferred_io_init(info))
-		goto release_framebuf;
+		goto release_screen_buffer;
 
 	info->var.rotate =         pdata->rotate;
 	info->var.xres =           width;
@@ -668,7 +668,7 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 #endif
 
 	if (txbuflen > 0) {
-		txbuf = devm_kzalloc(par->info->device, txbuflen, GFP_KERNEL);
+		txbuf = kzalloc(txbuflen, GFP_KERNEL);
 		if (!txbuf)
 			goto cleanup_deferred;
 		par->txbuf.buf = txbuf;
@@ -694,12 +694,10 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 
 cleanup_deferred:
 	fb_deferred_io_cleanup(info);
+release_screen_buffer:
+	vfree(info->screen_buffer);
 release_framebuf:
 	framebuffer_release(info);
-
-alloc_fail:
-	vfree(vmem);
-
 	return NULL;
 }
 EXPORT_SYMBOL(fbtft_framebuffer_alloc);
@@ -712,6 +710,10 @@ EXPORT_SYMBOL(fbtft_framebuffer_alloc);
  */
 void fbtft_framebuffer_release(struct fb_info *info)
 {
+	struct fbtft_par *par = info->par;
+
+	if (par->txbuf.len > 0)
+		kfree(par->txbuf.buf);
 	fb_deferred_io_cleanup(info);
 	vfree(info->screen_buffer);
 	framebuffer_release(info);
-- 
2.43.0

