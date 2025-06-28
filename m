Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFE0AEC50D
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jun 2025 06:59:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B17A110E0DE;
	Sat, 28 Jun 2025 04:59:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HjJ2YjVU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B810410E0DE
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 04:59:36 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-3134c67a173so209324a91.1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 21:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751086776; x=1751691576; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WmKo+C8fi9hzazphKwRBopOBdxfENaddm6XbHcVbzUg=;
 b=HjJ2YjVUI0l47ooTM13FmNucjwQZqpMK9HyqAHFx0xgRV6sQ/RcbCVVjg1ab7IIBxL
 P9TBS7pqUInW+tYpWgmH5RpFyOjEfpD9mTnsSpJXeEmiLjOGEtgf+w9q6Qi7DNgYI+V0
 dNUwiMXXkmwFGeZNv+lmevmervVJNUgsz9oSA5OyNq8ArsNwomyiUkL0D93QzMAFSKEQ
 j57tiGsmxv8nA8FnOxaZCTjRCZAJMycTrb57QsC3OH/LTw4RckqVK/8CYpzc3l2w/j4J
 H2ePgg+HYNkFJeMjxiJTqjrWFOSocb19b3WA0vwMItLnCcVrH2Cn7LMY4RSPH5k349US
 65zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751086776; x=1751691576;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WmKo+C8fi9hzazphKwRBopOBdxfENaddm6XbHcVbzUg=;
 b=jgKasgiw1cSPsaCaqmlCvtobK8ouqDtM8mOJ+BY0S2KV3Df4Yl5FEC8KeB0lQ/Lecw
 epOvbLKrGp6NqgK4C+7u9AmDLsPjM3vH4iQB8X54YQH1grrSZU68thd1qZUIBHamNvqp
 aW8p9BLmOyC86P5dMfFKFf/xCILT+z2n6jRdhFCzooa6ORpefXmKoUEc3w2XN9l+hMpX
 qdRnM+CmuOGbHHDzpfaVo8YpQT79rvClAK8unL0o9ZhmjuLOE4tCNxdDlKOnlt3QP+fZ
 EEr6oL0N8ZtrswkqhpfV3MSdiSdSHYjcqrDk2IkXfRnm+zju2UQbXuEdB2HMYaXhI3j9
 KzDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVk+wsT99EE6cOCvTB9MgCO9gtSooa4QNe1gi7yzdpck9Ha2REem03kpvU6nAT12fQLA/wiVG35mKI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjMBuzRY11gss9FvIhxuD6sV+Op4cNmT+kikuWBR/cJ3Htwb33
 552+q62m4TzcL2bR86ATKW7XvZXfP8GxVgYFWJi0LAzd8SqfgchiSn8Z
X-Gm-Gg: ASbGncuHz5r64xm3rvQO085wNele/CY4DAk5FCl9PyYG40ZOKC33pYwiuR2GIk6NZhj
 RamXu5L9CqSNmSo6Z7KKGFZ9QSPV33Mag+1qVpYxN1/5vI8cTBn1tV7MGpkzSQc7g78VbGigtGz
 ybFHXFgllrnoMOB+dexdhAwRpi4/s5GfPP1acBGFDRiz5xstlu0XJkTnlDlQMqHTkR7Q7ml3mk9
 xmRe6Tk5R5lOKJSmpo9C+AA9delCsc6Z+issSDnm/NujTFN7QU64scHB6hOjs5yj0NbL2rNBNKS
 cFZVZ3oiI50EPb3DyJLb3CpA7HkSQ2g/TIhsrNlWqevOPCzYnxtUw2/++3/Uisk77q95MNyiwrH
 qMac5aFoRfBoO
X-Google-Smtp-Source: AGHT+IFhOudGHogRsEtI4KMV9dAd077PePKmHUXJX1znH/HZKoXbfKEqYzFx9OoEKg8xq+/T0eEo0w==
X-Received: by 2002:a17:90b:2c86:b0:311:ff18:b84b with SMTP id
 98e67ed59e1d1-318c9264989mr7921897a91.25.1751086776032; 
 Fri, 27 Jun 2025 21:59:36 -0700 (PDT)
Received: from localhost.localdomain ([49.37.221.186])
 by smtp.googlemail.com with ESMTPSA id
 98e67ed59e1d1-318c13a271asm3659713a91.17.2025.06.27.21.59.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 21:59:35 -0700 (PDT)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: andy@kernel.org
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>, dan.carpenter@linaro.org,
 gregkh@linuxfoundation.org, lorenzo.stoakes@oracle.com,
 tzimmermann@suse.de, riyandhiman14@gmail.com, willy@infradead.org,
 notro@tronnes.org, thomas.petazzoni@free-electrons.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] staging: fbtft: fix potential memory leak in
 fbtft_framebuffer_alloc()
Date: Sat, 28 Jun 2025 10:29:06 +0530
Message-ID: <fd2be49cfef72799f17a96d01a4c6b92770cda7d.1751086324.git.abdun.nihaal@gmail.com>
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

After commit 56c134f7f1b5 ("fbdev: Track deferred-I/O pages in pageref
struct"), fb_deferred_io_init() allocates memory for info->pagerefs as
well as return an error code on failure. However the error code is
ignored here and the memory allocated could leak because of not calling
fb_deferred_io_cleanup() on the error path.

Fix them by adding the cleanup function on the error path, and handling
the error code returned by fb_deferred_io_init().

Fixes: 56c134f7f1b5 ("fbdev: Track deferred-I/O pages in pageref struct")
Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
v1->v2:
- Handle the error code returned by fb_deferred_io_init correctly
- Update Fixes tag to point to the commit that introduced the memory
  allocation which leads to the leak.

 drivers/staging/fbtft/fbtft-core.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index da9c64152a60..8538b6bab6a5 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -612,7 +612,8 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 	info->fix.line_length =    width * bpp / 8;
 	info->fix.accel =          FB_ACCEL_NONE;
 	info->fix.smem_len =       vmem_size;
-	fb_deferred_io_init(info);
+	if (fb_deferred_io_init(info))
+		goto release_framebuf;
 
 	info->var.rotate =         pdata->rotate;
 	info->var.xres =           width;
@@ -652,7 +653,7 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 	if (par->gamma.curves && gamma) {
 		if (fbtft_gamma_parse_str(par, par->gamma.curves, gamma,
 					  strlen(gamma)))
-			goto release_framebuf;
+			goto cleanup_deferred;
 	}
 
 	/* Transmit buffer */
@@ -669,7 +670,7 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 	if (txbuflen > 0) {
 		txbuf = devm_kzalloc(par->info->device, txbuflen, GFP_KERNEL);
 		if (!txbuf)
-			goto release_framebuf;
+			goto cleanup_deferred;
 		par->txbuf.buf = txbuf;
 		par->txbuf.len = txbuflen;
 	}
@@ -691,6 +692,8 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 
 	return info;
 
+cleanup_deferred:
+	fb_deferred_io_cleanup(info);
 release_framebuf:
 	framebuffer_release(info);
 
-- 
2.43.0

