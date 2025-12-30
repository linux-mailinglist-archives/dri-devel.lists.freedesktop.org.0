Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A9DCE8B6E
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 06:29:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2279110E807;
	Tue, 30 Dec 2025 05:29:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iGDNCIXP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 691CD10E807
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 05:29:07 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2a0c09bb78cso70209045ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 21:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767072547; x=1767677347; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i2hI5Lo88RYKXzSxQDxQgMKWvWfPHcve4QtdDyVBhKg=;
 b=iGDNCIXPPEo2q5VKxZczTCUh4WGv1qchly42vNlItgYYs/oFsBUgTULLU9tSjUkwUi
 KBAINg8ZsTdOJaBco/SeVhN0iSr6pmkl9F3RpDzv2dRSkF3InBr8lOXM2ehA7RXxtx8e
 Py2UJ9kKWuiI6516VsxICMseaqOie9OLuGHGiaHba9Rd4C5exFlWrTpYfcsjm6ewmHYw
 d8LHvwmA7IMXq6jTh8H5aLVVG0nYqp560M5cFalX7ngzcR9ZNtaKT8s44kHiGr29OmZM
 HB0C83Uv5Dg4Rkyyzt2ei7EKjpdr0BqVvdLaIyFOoDhnP0yZkGKNLiSeN9LyGStX6oim
 qofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767072547; x=1767677347;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=i2hI5Lo88RYKXzSxQDxQgMKWvWfPHcve4QtdDyVBhKg=;
 b=h3HzQ9uNCtN7Acw6h5TQ2cQyX5f+jCGmwSXWQWYCXN8Ksvp/2DMOcdJJo9uJFM+dkp
 YrGWpI8iw/vz5ScFW+xXnBXSDZDgw2olHBYQFzltG6bSFXVu1ST5Fwwtxx9yWmo1gCtg
 BW1sibpfO22eeVQ0Ajnw/7+DkK3VSGyobKNiD6eD4Nml3QHqw9F5cQJFerCiuVXs8v5d
 WSoIFQU09X9cKCd4+rtya7tM2MqkBIfBPNoB5J5OXYZ3r0X4GqXM6TgrWUJC8uSdN5RI
 wFYMoWt1bZ43+Q/Mw/afBdSMB0tT7YFvyJS0j44U1oBiF6mRxlQusLbb2Mtgo3xYzIW5
 LZ+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXH8w/fA5OjmArzFBKqWg49xj5H3Y5P9KpvJBsRHt8kH3mD0Lb+2j08gxjc8oXhwDkapZDai5gXDBw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHVT6+wcplH3zPx3wrjikwslnSTQlzzKZgQhUAJU++9HYMhXQi
 en/8SCOEIq+05xGLWGSgTJvdgazWDv8hdjEbOhAPMRsLkX+Dd4Tb9uNW
X-Gm-Gg: AY/fxX7k9X+VW0GE3rVWDq7t94unBl0wGh4ihTu+lZkgOju455Wp9wf8Rzujh8kUSXT
 xN4HEW6SQFYtHTUTO25OKn4jIXeOV5v7X7vHPPkneoK2MheeFa0j+bqEDRftKP1YQ8697Wx8gud
 YWA9U00FCl2sP/u6M2ypsM8qjxPwHMpiLjwMQhH6rOtfwI+hE4RSuOYQ6Pfq19P9RY7Alh90VUR
 gAYUjBFOjVaIFAUC307BG9NsvIMq9wKLVDv31BuHE4Gj695c+Y6/6DvI1/68VZRhlBi2A3uFq8H
 zQH8c35vOM+5c6ISbsTbOC4dKolH6Zg5eoNIyCPqfRL1PGTAr4H8OhFPbQCLnukHhpcUbDTPbvj
 yONcAKg+INTo4gAltTEsMHtWL6XnVjDwcX2quHbltXbymFwJaR4cdMHiMrrA7M25uKaNSQOGDQr
 NDJ1FbBbRjMAg2irDG6pZi1Y1XYTRyPTPdDHyWs3Vvxg==
X-Google-Smtp-Source: AGHT+IEzK1mfCzTYTBVF1B1JeAS/8wWfCanHdXYXITuiOcE0jrd5VC2Uc+2+6l74lzCrDnJw2EHo+g==
X-Received: by 2002:a17:902:f68e:b0:295:55fc:67a0 with SMTP id
 d9443c01a7336-2a2caa9be93mr359745255ad.2.1767072546800; 
 Mon, 29 Dec 2025 21:29:06 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net
 ([2601:1c0:5780:9200:f7a0:c2f:d915:faf0])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a2f3c8286esm289290375ad.33.2025.12.29.21.29.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 21:29:06 -0800 (PST)
From: Chintan Patel <chintanlike@gmail.com>
To: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, andy@kernel.org, deller@gmx.de,
 gregkh@linuxfoundation.org, Chintan Patel <chintanlike@gmail.com>
Subject: [PATCH v3 2/4] staging: fbtft: Make FB_DEVICE dependency optional
Date: Mon, 29 Dec 2025 21:28:20 -0800
Message-ID: <20251230052827.4676-3-chintanlike@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251230052827.4676-1-chintanlike@gmail.com>
References: <20251230052827.4676-1-chintanlike@gmail.com>
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

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Suggested-by: Helge Deller <deller@gmx.de>
Signed-off-by: Chintan Patel <chintanlike@gmail.com>
---
 drivers/staging/fbtft/Kconfig       |  5 ++++-
 drivers/staging/fbtft/fbtft-sysfs.c | 20 ++++++++++++++++----
 2 files changed, 20 insertions(+), 5 deletions(-)

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
index e45c90a03a90..d05599d80011 100644
--- a/drivers/staging/fbtft/fbtft-sysfs.c
+++ b/drivers/staging/fbtft/fbtft-sysfs.c
@@ -203,14 +203,26 @@ static struct device_attribute debug_device_attr =
 
 void fbtft_sysfs_init(struct fbtft_par *par)
 {
-	device_create_file(par->info->dev, &debug_device_attr);
+	struct device *dev;
+
+	dev = dev_of_fbinfo(par->info);
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
+	struct device *dev;
+
+	dev = dev_of_fbinfo(par->info);
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

