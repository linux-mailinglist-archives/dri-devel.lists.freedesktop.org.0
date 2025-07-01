Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A594DAEF390
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 11:41:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAC1B10E570;
	Tue,  1 Jul 2025 09:41:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GRIUIbAP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88C0B10E570
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 09:41:21 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-747fc77bb2aso2851281b3a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jul 2025 02:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751362881; x=1751967681; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3PnEDkQYSGlej4tjD/bQ1dPRo4xaWxnAEWg0UHJoseU=;
 b=GRIUIbAPNqyN6D+vmahGudCCwVi0YW94PmsVsXD7fKXIJntDtw8g2cDYuFlTGMphsF
 vGMzbhcVrctVSuNl3oiyo4otyrI8Jxf1/zCh5lt0n/3gDlDgXh5PHnbZ5mQnLvbxCXGJ
 Pf4fNYFL1sBCiPo0amtFS9xuDETe2Q4kRoChi12qYESDXFTL7NvmobOT0lK9JDQnEdSF
 H42tSZbuJ8VQMU+Tf3uR3IApJX5+EubwIV+NLHZH3gTobxVa1eJy2Q3e1aKr1cZIQvMw
 Djk21zJHtG8wWkW3RW070cK6lytJC2tvGDvyFy3Z/ww488OwbhB64iJb8vRgsNvbHvnZ
 wpHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751362881; x=1751967681;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3PnEDkQYSGlej4tjD/bQ1dPRo4xaWxnAEWg0UHJoseU=;
 b=qLf92QwBRiI6poYlXJoI1kI+aX7I2z3ltj8LNguixU8fE2SqSUyQrt4v9r0B21a3gE
 L3Ki7GBoRn93+qVYZ46pxTQQvpt6TNTrFsFoqyHYWG17NzQgEVV5KOPu/ZvRfELL4nK5
 ELfNHZ48B0QiFouDEH/NpBMMWWIMPsm3IERF/QCvpY7WxJDIFIf9mZKXd1Jdocq3eC4U
 O+P7aA9sJx+U2FvpZfBr2+5L3iE8T24rU4OBhIkM+F8viduz+ByxLLtVSkR8Sy/r29ja
 1fGlNZvTe7wclt8U8cJIocbJlWBtrvNCEP5bH8XVxL3ABqTiWO35Wb9KlZQEo3bi5FeI
 4U2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4oA+IHqSHv2Ec5l57Nix3RNl1XGdt2gpqhOrH8Vybo/NY2vmvd7AcAY6CfTv1vTnaq59SE/d5XIU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwdloD/zISG4CvcrECTzs5s+Z0xGOHxgbB+GloZwde/LVO00dt4
 69a8uqhI01ynv0LOjuzs2WB0iuOKUcMk50XA+80x4JI1R7BJUKGVmDLg
X-Gm-Gg: ASbGncv7lcZPXGv/mmsP0+1JYxSKbWoZEw5YC0Dc+2ATFBPJMavRTbnShF5HVN12uPa
 OPKVjkzfhOmsV+JwgWMukCC/Za6HpW4TCVCFAwnKQ0MPJIb2bWrTlMD3ClZCTHvtuXXDUF/ZTUU
 isQKRpi37/FyxUJIUodooezxUnP0JkVKVUZwzFA0ItyXC3Mz52tC87RMET399kP1KsP1CHhbh20
 ccHeuJtkOj21wSvKkVgcpN29Y4KJ3MOpfF5xWXT7pEwL1DNrRr/se1CTYwREy/xxrQWQjHPQt9n
 kPxtNYGUtizu0wplQC9XlOufyHYKoMDNT0PGcQftTkw1WANDwQcTxeI5Rj+0AqV7BxkjJizYjgX
 leQ==
X-Google-Smtp-Source: AGHT+IEbeQc69MS0gQNp4/0czRTMPM7cTE3egdA7+5pA0TfD6EU6FUYVk5lBMVTPZAs3gk2+USbR3A==
X-Received: by 2002:a05:6a00:2302:b0:748:1bac:ad5f with SMTP id
 d2e1a72fcca58-74af6f22722mr22370210b3a.12.1751362880881; 
 Tue, 01 Jul 2025 02:41:20 -0700 (PDT)
Received: from localhost.localdomain ([49.37.221.186])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-74af57e7279sm10945766b3a.150.2025.07.01.02.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 02:41:20 -0700 (PDT)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: andy@kernel.org
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>, dan.carpenter@linaro.org,
 gregkh@linuxfoundation.org, lorenzo.stoakes@oracle.com,
 tzimmermann@suse.de, riyandhiman14@gmail.com, willy@infradead.org,
 notro@tronnes.org, thomas.petazzoni@free-electrons.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v4 2/2] staging: fbtft: cleanup error handling in
 fbtft_framebuffer_alloc()
Date: Tue,  1 Jul 2025 15:10:23 +0530
Message-ID: <b0b55510097245e4f96663123130f197c01dca4d.1751361715.git.abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751361715.git.abdun.nihaal@gmail.com>
References: <cover.1751361715.git.abdun.nihaal@gmail.com>
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v3->v4:
- Added Reviewed-by tags

v2->v3: 
- Remove the if check before kfree of txbuf.buf, because it is zero
  initialized on allocation, and kfree is NULL aware.

Newly added in v2

 drivers/staging/fbtft/fbtft-core.c | 31 +++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 8538b6bab6a5..9e7b84071174 100644
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
@@ -712,6 +710,9 @@ EXPORT_SYMBOL(fbtft_framebuffer_alloc);
  */
 void fbtft_framebuffer_release(struct fb_info *info)
 {
+	struct fbtft_par *par = info->par;
+
+	kfree(par->txbuf.buf);
 	fb_deferred_io_cleanup(info);
 	vfree(info->screen_buffer);
 	framebuffer_release(info);
-- 
2.43.0

