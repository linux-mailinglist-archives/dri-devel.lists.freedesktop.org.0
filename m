Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B36AECE00
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jun 2025 16:41:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2345110E34B;
	Sun, 29 Jun 2025 14:41:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VJSyTqwC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C1110E34B
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 14:41:17 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-748d982e92cso2958276b3a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 07:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751208077; x=1751812877; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4ZlX6oH8dce3MqKqn1FEplwlovX0z97sZ7lCxjfOmHQ=;
 b=VJSyTqwCd3yV8qenrYFG0jFTXgrq8UJLACm6+vd5DasUfIQRHpK1GnzUWHLyiY6MYm
 Gn/a+O4Tj7kqBIzWpeXX2gCl1xLjNj57V9ntieOLf+j7rUC0/UBDN49P7s6DKZLtmTSt
 1Ipb6IkEbA8UsAGySacMX0lfSuP1KXW3jvFHfRGRHeUhRmgBbViF68zC1s0+k9z8aygv
 fHHcsnIW8E+tC6+2B+TTnPTpIXO+qlyn1fEqMz6fcvj9DrQpaDhHNs2sxpcNbCEmtDjp
 /FAkgBFBuGr3LAMOVz7Ly8n54zp0f9ZNroy10g0LUol14His6pkIN2BvR294utiFFUu5
 Kjyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751208077; x=1751812877;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4ZlX6oH8dce3MqKqn1FEplwlovX0z97sZ7lCxjfOmHQ=;
 b=Mwl4epege6b77HqmvfEiyMSjX+YOpHMSewm9sgi82wZDtoHuapsx0Kiz7qo/rlvpCK
 vwj1cqfi5ffBjHij0HhO4EJGKv6M3ioAMh6z2SStDzogOHO8XgQptgnVot5ghSb9GM/h
 aS/Dj7PxTttVQ+9X0PwEJzuCnQ95HwknjaxJVOOle/XSsq2vzuMLq5SYRH5TTZ2RUAgp
 l/ExB6/8zpZ5UUyRmw21l/uBz5L1AsJOiU7eZW2fyUGJL4Z1mdR/pz5xT6y40q/NtPBE
 8VniNWJfFUyE5bma82W8M63H/eJIcK+E+ymVD87pyBi1SdlzkEbWhg86CpjpYLZaeuUS
 nltQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvjLj3QNlsZd+Gw/DWY7PIR2ZfGGMKEOtoqcyyygnnnsRcOH2qMLO9hKJ1eaItYXBs0zXROceqpyQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQli7iKxjQxaa4QTWEEvfU6YEBQFMJTbFX3TFKJYtKn/OQULgC
 NAKgjvBr1ubfvhsz+YhJqQ3Vo/lxjHHHXzy/kGVnCUxHZr+QdRQYW2ED
X-Gm-Gg: ASbGnct2qhsHhv+HhkCevRX4b80TDZNU0wNewyEA0jclAE+VsIUsYd/S2j9aJT0kDBU
 Y7P6TIh7tHt0gZ95f5aGt3oTN0ujSadxSynSBzUVgRS6iM7DQ5w0D6NVwj1k8VDFPFLtn00tn87
 wElWAfOPH4n9mbG3nkM8LRonKhz4N9UWhqSftXDzWVCcys10Ns+wA6glKuJ/h7WmnWqIGWxtkE1
 2GBrHk4a222t8Nd2xyHgRC6F5qxzNvVb57UWShL9NKMjPHOanSuotV8yb09+nb/9wmHCFUKEv1B
 gUEr7OxhNzFJSuKiovUAlyLY1WaHXJ1mbmU5cB/AxsIUF04nAI18ohlCnncBYpCW4cGPwqzqgk1
 0MuIzN7eySNof
X-Google-Smtp-Source: AGHT+IEdbEmJ+1xilLUoHHztIEeRjjOpIEv3s8aocZ+HWOglf6JfXuWncmoSPjHPoauzqRoD+CjaUA==
X-Received: by 2002:a05:6a00:c90:b0:736:4e67:d631 with SMTP id
 d2e1a72fcca58-74af6fde138mr16238310b3a.23.1751208077090; 
 Sun, 29 Jun 2025 07:41:17 -0700 (PDT)
Received: from localhost.localdomain ([49.37.221.186])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-74af55c7e89sm7039127b3a.109.2025.06.29.07.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 07:41:16 -0700 (PDT)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: andy@kernel.org
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>, dan.carpenter@linaro.org,
 gregkh@linuxfoundation.org, lorenzo.stoakes@oracle.com,
 tzimmermann@suse.de, riyandhiman14@gmail.com, willy@infradead.org,
 notro@tronnes.org, thomas.petazzoni@free-electrons.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] staging: fbtft: fix potential memory leak in
 fbtft_framebuffer_alloc()
Date: Sun, 29 Jun 2025 20:10:10 +0530
Message-ID: <fd2be49cfef72799f17a96d01a4c6b92770cda7d.1751207100.git.abdun.nihaal@gmail.com>
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
v2->v3: No change
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

