Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B98AECE01
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 16:41:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E7910E359;
	Sun, 29 Jun 2025 14:41:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FRcCx5bu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC1F110E359
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:41:25 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-747c2cc3419so3604713b3a.2
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 07:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751208085; x=1751812885; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AkH6WZ47tB33hOq1ktfgw4nXcDuqU5IvVV0uN0/lGcY=;
 b=FRcCx5bu/Uq4G84hCvf+dv5DK5ejZwLwmFeC9xr+hG3p3jh6YrUPm7/9sG6a3Ef8z/
 nK2U6Ksqa2j8rwqKlNo/UDqiDyfE0j87zXJVxbIIDETXOhDcRhXg9Nh0JEkY2f8ttRQo
 csDW8lfEposRqmTiSZMCFO29sb/EMKouiIE74k3TUUL5QbDoS9rmTdx2M8Zp/NdLgsK3
 bjPommAnE+Js9RhY8QUayFXyuMLFXccG1uBFlsBnZDom0T/oUXONeG/vjDxHptpogeJP
 oKX6N3LjBKllLs2q6KpPJjuSbG3Rnq+TT87i34ytDq0MDgzU8Z3ttWFuqaC4TthVbUB1
 s+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751208085; x=1751812885;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AkH6WZ47tB33hOq1ktfgw4nXcDuqU5IvVV0uN0/lGcY=;
 b=radr+my2E3+nQjieQoRmWSi52Us5KcPgspaqCjSaGStBvZkd5u2qX3840x7d4DZO04
 qdl1mLvIHfXsze1F14NcPNjReiCUGDvy2SPy4DaM55fQtDTHxo/W1xHd//kc/h7tGsdu
 nR9KrjO+5jW4iPdzgFdOkpABBQLrXGJZ5itWIF+P+oJCr3lQs6bh8bPvMbE0Ez5ZFAFQ
 dvLDziXVof5Sk6nTWNLJ7wvfrHD8KSL8KJaopZjTEPim/u+5bEzD9/6JAsMriD1QIwi3
 h5IIBgSJnKWbkW5pUNQ72PksIi1Y4psoTvr7MfApl71OzRp59r7pzGf/sVncFMVcj+C6
 XAZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3whWmazx39JwJ19K2orsRe3+gJiru3mOh8eVfShgaBQrexJIYeaSXM77xnZPM0SH8z2c+Zuch5IY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVT2Ys3Gzq1e7T8LrV8+AAHgJG7xBaxZn2qiiFuJfGktHdvcJQ
 RJRhXBGqNxkls0SM9ewVZpljXkYWd60B7qPDKT6JRtplpgZ3vHRnWaoT
X-Gm-Gg: ASbGncv/fLR6qIHBwmJcHcevfbKra6U76KtH7UMC0bMJ0847U8mYD+s5uf9OuANl3MH
 keFWrvy1EnPqTUyS12mV70d/+xN54D0simdITdgpsbi7DZaofoAu8g2wMEkf0GE2DbzxFSvJJrR
 9wKOSt1Xcy0T/fTSpob8KMrNL3nShDd+qnQanDIh5N7trU57fnDYirJRPVrs59pcnmJAddjZCYI
 RbasjznzfDrLVV4NZ6ztbbejKJtoxA/f5OFhZ4sMDYYmsLH3DrwJ5XXG/r9GHgLkNTlK7YADvZQ
 mWZ6yv9FUHmy3SfnvqZh7paKQ4/j0RmkBqDvYCZN+spWAid9qsjqEF2eG0pNxjh2F8n5SGLl0pp
 mmQ==
X-Google-Smtp-Source: AGHT+IFBiKmBx9yH5kYGSYjeMY9rQSEBpTMve8iNeUO9mG9D8vqHt/VBUqvbXcqaLSd2ovKMv+M48A==
X-Received: by 2002:a05:6a00:2d07:b0:736:8c0f:7758 with SMTP id
 d2e1a72fcca58-74af6e6659bmr12804699b3a.10.1751208085209; 
 Sun, 29 Jun 2025 07:41:25 -0700 (PDT)
Received: from localhost.localdomain ([49.37.221.186])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-74af55c7e89sm7039127b3a.109.2025.06.29.07.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 07:41:24 -0700 (PDT)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: andy@kernel.org
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>, dan.carpenter@linaro.org,
 gregkh@linuxfoundation.org, lorenzo.stoakes@oracle.com,
 tzimmermann@suse.de, riyandhiman14@gmail.com, willy@infradead.org,
 notro@tronnes.org, thomas.petazzoni@free-electrons.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v3 2/2] staging: fbtft: cleanup error handling in
 fbtft_framebuffer_alloc()
Date: Sun, 29 Jun 2025 20:10:11 +0530
Message-ID: <4e062d040806dc29d6124ac0309e741c63f13ac0.1751207100.git.abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751207100.git.abdun.nihaal@gmail.com>
References: <cover.1751207100.git.abdun.nihaal@gmail.com>
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

