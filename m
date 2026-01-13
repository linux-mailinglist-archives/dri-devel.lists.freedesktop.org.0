Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 660BDD1B586
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 22:06:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6529A10E32E;
	Tue, 13 Jan 2026 21:06:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Dzne/tG9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02EB010E32E
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 21:06:07 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-47ee4338e01so99085e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 13:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768338365; x=1768943165; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZX/Q3gJa9nyuedmUpH99IiHZs/+kDUZjSFi8hfs5S/8=;
 b=Dzne/tG9LLAvn6H4hYRfKKp6PPTKENjOFYwZIXQUDzdSDY6RtpUhIP9zTP287OHNL8
 s3YPPKrDTSZUh3SsOh+nVIJE8UfNSAu7nnFXEod0mvtCn3ly5HnrVX2GXbZD3R4n6P+F
 YQDoozLjo7G9YsakBUJsd/Jl4LKKm5jI7FVzQ4bU+ktaKqxoGdGEeEGPH/WKfpZC9nDD
 82HMk47FqbnrDjUfgkblgAYfnQHZj+Dpgb6Gu25AoDhWPu/7P3IdjqpHVrI8cWfCYrWU
 EarHEg1yJp4AGpbDs2cTohZai9cdCYtI5SQUK/mtKdpqjKL2sJOJ05k1VRWa/QF1XwtV
 WaCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768338365; x=1768943165;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZX/Q3gJa9nyuedmUpH99IiHZs/+kDUZjSFi8hfs5S/8=;
 b=nDXnbCbZBpYj8TDYtYH/klliwigWjJZWf0j9fBJT9CIDp4JMfwT27RsCj+O6trhJ88
 P5uAEJalLJWDRp1Piz0F41TNwh2EXO7bHLDaYn/Dy4EkWVG/ZQxg7TD3ZrlRbAm/mSly
 VkD39WgMk4jARbNJWRZIFu7Xy9zDk8w6f1j5CeGrTU6IPKP9qFESbIpNJcViksrFajl9
 nWwx48WuVQqm1bXv4UZvxE0CB6qJdsiZaz2vPv2+yGhG0qo6IkkVBIl1IdHe1Rw3gvPR
 P0oQYJARoWkagfb4eJzVh7OmbFYrj8kQRq7JhSn4onUa08rlcu78xYuvNLVJqyQcUn4Y
 s2tQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXm/v0gX1v5oeWGVYzPS1nxe7wtQuaBLFVYPanMSjt4rvHVBFaEAbx7oSQis1QDX0LZEJ8Z+cPNwdo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6DaC81RbQhh4mpoVVEjZidtsor7JjUtsIESEyVyUK4N+tDpGm
 KNQEo+XcB/HwDrDBqJofzCcmsag5MYdsncuaQmvEQ1ZsGYxJIFJqpvQX
X-Gm-Gg: AY/fxX663VRhBIcaT6GuZUMTzl4XzkKJeL6nFo3CQwNWWk96dHfgjFyv5fSlmxd+ulN
 LXyQvt4RP3CdqmUxt22El+oNj1xpTPxD3APC2FbKkfm1a6iQRjMRX1zIuseD0fZVVz25+xb4on2
 KWVzm8gE910FkQ2eEcUswbh/xajIznlgLKXLUqiC8HndlQgwGMDoq+D+IIAY2v6tKqRXDwPc6b2
 oTzhqi9I06DpHTaXk9pRAfTUfXhh6lyOvUOZRUqTNunuftkSMgRLEUyNPJNG0XAkIN/1dlh45iz
 1paqZJK4jkOnop18G2VsztHMj80EnB3ZEfvr2EEWbiUrQVJMLY0QiSsT7F3CBOe03DUF3QOcizl
 qU3mWPkQlFQQ9Tbb2lowz6JQUmPdcMvdTWUojpeTcBLG+q5n/VLXK5KQBDnp10uN7AkD0ysJgcK
 5Hoz6ufYqHwlDaQisKYlX6MeQrBoXZawLcopcdJy9hoMYVIA==
X-Received: by 2002:a05:600c:528e:b0:47e:e20e:bbb0 with SMTP id
 5b1f17b1804b1-47ee32e011amr5733565e9.6.1768338365266; 
 Tue, 13 Jan 2026 13:06:05 -0800 (PST)
Received: from ubuntu.localdomain ([154.161.44.196])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47ed98abad1sm59042205e9.10.2026.01.13.13.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 13:06:04 -0800 (PST)
From: Gideon Adjei <gideonadjei.dev@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Jianglei Nie <niejianglei2021@163.com>,
 Matthew Wilcox <willy@infradead.org>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Gideon Adjei <gideonadjei.dev@gmail.com>
Subject: [PATCH v2] staging: fbtft: Change udelay() to usleep_range()
Date: Tue, 13 Jan 2026 13:05:59 -0800
Message-Id: <20260113210559.3020-1-gideonadjei.dev@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Replace udelay() calls >= 100us with usleep_range() to avoid busy-waiting.

The delays are used in init_display() callbacks. These callbacks are
invoked by fbtft_probe_common() during the driver's probe path. the
probe path runs in process context which already uses sleeping APIs.
This makes usleep_range() safe to use in these situations.

Signed-off-by: Gideon Adjei <gideonadjei.dev@gmail.com>
---
 drivers/staging/fbtft/fb_tinylcd.c   | 2 +-
 drivers/staging/fbtft/fb_upd161704.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/fbtft/fb_tinylcd.c b/drivers/staging/fbtft/fb_tinylcd.c
index 9469248f2c50..ee8d6b10374a 100644
--- a/drivers/staging/fbtft/fb_tinylcd.c
+++ b/drivers/staging/fbtft/fb_tinylcd.c
@@ -41,7 +41,7 @@ static int init_display(struct fbtft_par *par)
 		       0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
 	write_reg(par, MIPI_DCS_SET_PIXEL_FORMAT, 0x55);
 	write_reg(par, MIPI_DCS_EXIT_SLEEP_MODE);
-	udelay(250);
+	usleep_range(250, 400);
 	write_reg(par, MIPI_DCS_SET_DISPLAY_ON);
 
 	return 0;
diff --git a/drivers/staging/fbtft/fb_upd161704.c b/drivers/staging/fbtft/fb_upd161704.c
index c680160d6380..aed5cc7cabde 100644
--- a/drivers/staging/fbtft/fb_upd161704.c
+++ b/drivers/staging/fbtft/fb_upd161704.c
@@ -32,7 +32,7 @@ static int init_display(struct fbtft_par *par)
 
 	/* oscillator start */
 	write_reg(par, 0x003A, 0x0001);	/*Oscillator 0: stop, 1: operation */
-	udelay(100);
+	usleep_range(100, 200);
 
 	/* y-setting */
 	write_reg(par, 0x0024, 0x007B);	/* amplitude setting */
@@ -60,7 +60,7 @@ static int init_display(struct fbtft_par *par)
 
 	/* Power supply setting */
 	write_reg(par, 0x0019, 0x0000);	/* DC/DC output setting */
-	udelay(200);
+	usleep_range(200, 400);
 	write_reg(par, 0x001A, 0x1000);	/* DC/DC frequency setting */
 	write_reg(par, 0x001B, 0x0023);	/* DC/DC rising setting */
 	write_reg(par, 0x001C, 0x0C01);	/* Regulator voltage setting */
-- 
2.34.1

