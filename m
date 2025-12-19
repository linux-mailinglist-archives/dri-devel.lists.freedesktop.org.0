Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28384CCE909
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 06:43:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C8AA10EB25;
	Fri, 19 Dec 2025 05:43:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hVa2sl2q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4DC310EB25
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 05:43:44 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2a0f3f74587so19560165ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 21:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766123024; x=1766727824; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wLowgtUxpf7Ylc32b4gcev+kc2iAvzLFrJvCpgPdl8s=;
 b=hVa2sl2qzf0CiQo1UxJeaiZ2uMqujnxn2Sdi3ZxsQr9mu2N96OcY1kRz5rdEpom29I
 v2rdJIvVw+v5gWdyQXAJutLz5OM9FU+dAHcY/4K6/kbwtq406lF74LBU8nyUt3/OFUOZ
 Mg0nrVQErHZBRxIKh9rRiGTmWeCLW1nEYSGkoj3Qiz1eZcJE/zJNrvztzGecfdQ5PXrs
 VLwgR+AD+vNXaCk/qxIHFXTv2Xg1Ih1ZhIVRetQHOZBS+j0osltDajH6aYmqF51KplNo
 XBSK7T2ppPtzC4EztNog4Wwjfa7m9bAAG5hhe0I/994NGoNcQ5/9I7hWGABt8yO3pfbS
 BS9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766123024; x=1766727824;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wLowgtUxpf7Ylc32b4gcev+kc2iAvzLFrJvCpgPdl8s=;
 b=ulr0WVE8uIu0+U+PvOf5f6ngAQUGQycpap4ScqAlyQrqrPz0uxo7rb/P5lP+xokqWA
 9vY6NeKO+dhkcK7ViwiChWnSsW2PlycSVIvpoxaeo+q9TlAjRyK/NB24A8p2YPywMRSG
 6/jIB8jyWYxUs4pLVMRWf1u7aSTmB74vmU0nvytZwTdi0cyDcSHpcG4tF5AttxQWAyK5
 cR0M/ewoBV82fIpcLkmzPXY5wF6Vip6aQOzRmGqqGGGMTG4vgyWTgD6sn9qzg/z+E8sE
 togWyaelPQSHDKpVqrjbNoeADexILj42rjwR+0CRPl3CXSKJJg+xWNqoZci4rTP5zkHz
 1anQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyAPdVe9F7A6Y4rjRclcPomkXDIPdLpPejKUA9fGwioaxnVdhIGjsWClHAXIc85eNVgwd7NhVNJnM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVnBh1mrvpZxpFV3bD9I6R/oDdFlTJxKy87i2w+EXKocYToETk
 3/eS4QSprABX0R7wQdxfSP/tib3nVedC88kIyQUIouQSH/rnDNGfpLZHsQCIG2Yb
X-Gm-Gg: AY/fxX79p0bSYj/mo59Ng2ecRhkiTMrsoyVniyqvR4Ib9TxrIoCHwg9JK/VLqeuWCEl
 ylnm+vXjRd3dlDcSNYL0HjofELvjN4R7n4/tsQOX1rKLA39NSrxKieaI9wfhfDktGMwHPytt5rE
 b8VwUswR9+dTRUPvPOWMNQcEA+y0K3NRCMAyXBK+X14MJhBS5/NKVtoI0+iBFJ4tVrYIe7pBzjc
 3fc3OwBINTYDKBQs1C2Pgrwky6/lQXQO9VdmoqmpUzhaWkRa/kL8xczD2VYvytYEdCxsalvwmSQ
 WvTLvMGoDdE+BWjnJHIgfFWSlyVLTCiwLjiaQeFIKp2SGrnAUXAEx9wiwOg9HoUK5t6eFlsN0Sg
 AoSLgcj2SKSfAQRCx/wrlg9J1WHXjp5iokd0NQb257kp2yWovdRl4ugGQR48HBx9WpTWvSfqr8L
 FGytVAhmgfQq81djqHoG0ADP3gMrAVdETe0ZyhMw5Rv0o=
X-Google-Smtp-Source: AGHT+IHapH6OsO1AHtO1AIXlBe8ewsFWc/T53IxGs44x5WRWKW2jyFjQP7saYVlxU5+BW4fZO8YydA==
X-Received: by 2002:a17:902:e809:b0:297:cf96:45bd with SMTP id
 d9443c01a7336-2a2f2231b01mr17507025ad.19.1766123024262; 
 Thu, 18 Dec 2025 21:43:44 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net
 ([2601:1c0:5780:9200:5160:2cad:cf88:afa5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a2f3da7dabsm9878955ad.25.2025.12.18.21.43.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Dec 2025 21:43:44 -0800 (PST)
From: Chintan Patel <chintanlike@gmail.com>
To: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, andy@kernel.org, deller@gmx.de,
 gregkh@linuxfoundation.org, Chintan Patel <chintanlike@gmail.com>
Subject: [PATCH v2 2/4] staging: fbtft: Make FB_DEVICE dependency optional
Date: Thu, 18 Dec 2025 21:43:17 -0800
Message-ID: <20251219054320.447281-3-chintanlike@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219054320.447281-1-chintanlike@gmail.com>
References: <20251219054320.447281-1-chintanlike@gmail.com>
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

fbtft provides sysfs interfaces for debugging and gamma configuration,
but these are not required for the core driver.

Drop the hard dependency on CONFIG_FB_DEVICE and make sysfs support
optional by using dev_of_fbinfo() at runtime. When FB_DEVICE is disabled,
sysfs operations are skipped while the code remains buildable and
type-checked.

v2:
- Replace CONFIG_FB_DEVICE ifdefs with runtime checks
- Use dev_of_fbinfo() to guard sysfs creation and removal

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Suggested-by: Helge Deller <deller@gmx.de>
Signed-off-by: Chintan Patel <chintanlike@gmail.com>
---
 drivers/staging/fbtft/Kconfig       |  5 ++++-
 drivers/staging/fbtft/fbtft-sysfs.c | 18 ++++++++++++++----
 2 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/fbtft/Kconfig b/drivers/staging/fbtft/Kconfig
index c2655768209a..578412a2f379 100644
--- a/drivers/staging/fbtft/Kconfig
+++ b/drivers/staging/fbtft/Kconfig
@@ -2,11 +2,14 @@
 menuconfig FB_TFT
 	tristate "Support for small TFT LCD display modules"
 	depends on FB && SPI
-	depends on FB_DEVICE
 	depends on BACKLIGHT_CLASS_DEVICE
 	depends on GPIOLIB || COMPILE_TEST
 	select FB_BACKLIGHT
 	select FB_SYSMEM_HELPERS_DEFERRED
+	help
+	  Support for small TFT LCD display modules over SPI bus. FB_DEVICE
+	  is not required, but if enabled, provides sysfs interface for debugging
+	  and gamma curve configuration.
 
 if FB_TFT
 
diff --git a/drivers/staging/fbtft/fbtft-sysfs.c b/drivers/staging/fbtft/fbtft-sysfs.c
index e45c90a03a90..848702fc871a 100644
--- a/drivers/staging/fbtft/fbtft-sysfs.c
+++ b/drivers/staging/fbtft/fbtft-sysfs.c
@@ -203,14 +203,24 @@ static struct device_attribute debug_device_attr =
 
 void fbtft_sysfs_init(struct fbtft_par *par)
 {
-	device_create_file(par->info->dev, &debug_device_attr);
+	struct device *dev = dev_of_fbinfo(par->info);
+
+	if (!dev)
+		return;
+
+	device_create_file(dev, &debug_device_attr);
 	if (par->gamma.curves && par->fbtftops.set_gamma)
-		device_create_file(par->info->dev, &gamma_device_attrs[0]);
+		device_create_file(dev, &gamma_device_attrs[0]);
 }
 
 void fbtft_sysfs_exit(struct fbtft_par *par)
 {
-	device_remove_file(par->info->dev, &debug_device_attr);
+	struct device *dev = dev_of_fbinfo(par->info);
+
+	if (!dev)
+		return;
+
+	device_remove_file(dev, &debug_device_attr);
 	if (par->gamma.curves && par->fbtftops.set_gamma)
-		device_remove_file(par->info->dev, &gamma_device_attrs[0]);
+		device_remove_file(dev, &gamma_device_attrs[0]);
 }
-- 
2.43.0

