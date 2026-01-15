Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83754D2364E
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 10:17:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD86A10E70B;
	Thu, 15 Jan 2026 09:17:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AfOsZSvu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0FC710E701
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 08:40:27 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-2a0d06ffa2aso4774265ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 00:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768466427; x=1769071227; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ipcJNOqF/EGIzTmaYen1uoPiKEHplQV3qlrZeOj+LXI=;
 b=AfOsZSvu+m57mMav8XfeuLz0PfIIXqLpVTV3d5LiX7e1G4+22dm86TlTBgRYiyMse8
 Hx5zwo2vOTYmjqsErZbkIwk4ky10Xuz6qEpIv50Yh2nuISguFPU1wcavsGGwLj93iJwA
 veXIIMYQkWek0wX2KZSX58y6E8wzjBRJdRs0UF+uetFZt9MlsPFNBfrHF71eSvh/ddYp
 91/eLd3iYMNwtBdITFwMyoNjWJHlYpJsmjOIoyMIxPFoIL2PLWeSqwtpNIx2za8CHslS
 WnOKNlIMBsetNC/fDxpLQLM1DH8+pD3alcR+VhEWTw1dbwaNnhfvIWJkGOSSW0gM+Mw2
 9mOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768466427; x=1769071227;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ipcJNOqF/EGIzTmaYen1uoPiKEHplQV3qlrZeOj+LXI=;
 b=Ib/lmDQPhPUZlUBm77i8QwvHw31CNBoRb/xUqQUiGOUF5FsUe72SCNh/PYM7gy9KsS
 5K/5O0gKv3glz0qyJhnsDRlvzCJ4aBOYbYVJ0D0YX6qaZzN9XL7sRyvZqlGtXmgcSyEh
 VkNZ6UIdcZpGPDvKpaRkxwo1ZKINWY4q3Pe5hOsTMEtqnIz2Skjmj6E4CqUbm7qfcPkp
 sS7faKvMr0loHtcT+QRtAflZ4QCkn89o/p3KLZp2nPpPMg4Jt52Ty7tYqsu+j5Nafy8+
 47m1Pz6jSznt4Ec7HVjuglxgzVwsfPnwGBApXwB1wJ2Fqk4y4vpEM4BGBFX4OS4npPcn
 7c5Q==
X-Gm-Message-State: AOJu0YyuebL34SDoEvwU06afg2PC29uwAgt9MPvP17kHGjtI3/TKF8tC
 FhOKvfRVSgcvhnmr90MteBPIDKDq0JGTUDL4u4kAzFOQOxYyd52f9BHI
X-Gm-Gg: AY/fxX4mAxHLZrHy8cX8Ke9jdvs5i56zGFE2M/eS2AInvfoe6ksURYxFACGFoA4WRZD
 rdfYb2mZK9eqaZdXZ8wxNlqEMrBQ2T4RGz66+5kj+VeXYunq+x+EHpZz4dZ9HlyScR6m6990x/s
 ocy2TMV93bJf8/3CUVskFvWImiHEzCF1MYoAX5oRQv+TFY38DbzmrYTzFeJ1kfrkR1wFXvcJVsG
 YXhPu7fMl5QGcCvD38r5R/9fKphpIwFdfvP4bQC9wSNAVsD37f7V5jiUbKZMQpGaVMIAtUcwfYI
 pwiRJJ2zdj6sOQE/ywtkQW0Uwrnrh0+6WVTyMK2AykSkp9gi6ZRm0Xw7J12fSZN61KBjHC+koiP
 Vw0FUydusgsDoOSLLQiHxLKTvutGENwBrhoTxoX8OcQVN6j1vHCvUQRZuNu6oH4flXBKCFJSnw6
 B2HoETE3R8PulnPgfNZU6VGTeDpdfwKPREH5vpqLcwo8BHlmjKcg==
X-Received: by 2002:a17:902:ef44:b0:2a0:9ecc:694a with SMTP id
 d9443c01a7336-2a599e34930mr57586385ad.37.1768466426977; 
 Thu, 15 Jan 2026 00:40:26 -0800 (PST)
Received: from jeonwooyoung-HP-Laptop-15-fc0xxx.. ([121.125.189.206])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a3e3c48be5sm248390095ad.30.2026.01.15.00.40.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 00:40:26 -0800 (PST)
From: WooYoung Jeon <chococookieman1@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 WooYoung Jeon <chococookieman1@gmail.com>
Subject: [PATCH] staging: fbtft: replace udelay with usleep_range
Date: Thu, 15 Jan 2026 17:40:19 +0900
Message-ID: <20260115084019.28574-1-chococookieman1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 15 Jan 2026 09:17:51 +0000
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

In the fb_ra8875 driver, udelay(100) is used for delay which
causes busy-waiting. Replacing it with usleep_range(100, 120)
allows the CPU to sleep during the delay, improving system
resource efficiency.

This change was suggested by checkpatch.pl.

Signed-off-by: WooYoung Jeon <chococookieman1@gmail.com>
---
 drivers/staging/fbtft/fb_ra8875.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fb_ra8875.c b/drivers/staging/fbtft/fb_ra8875.c
index 0ab1de664..92c9e4e03 100644
--- a/drivers/staging/fbtft/fb_ra8875.c
+++ b/drivers/staging/fbtft/fb_ra8875.c
@@ -210,7 +210,7 @@ static void write_reg8_bus8(struct fbtft_par *par, int len, ...)
 	}
 	len--;
 
-	udelay(100);
+	usleep_range(100, 120);
 
 	if (len) {
 		buf = (u8 *)par->buf;
-- 
2.43.0

