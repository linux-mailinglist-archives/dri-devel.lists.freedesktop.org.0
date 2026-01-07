Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4625CCFBFF9
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 05:43:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 987C110E182;
	Wed,  7 Jan 2026 04:43:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="L3W2ImAs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6804410E07E
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 04:43:19 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-b553412a19bso1010552a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jan 2026 20:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767760999; x=1768365799; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CmNZiMiLRz7C+tpqpi8aiFEIQgPCT214fV1yD6bvzyk=;
 b=L3W2ImAs2h0ZSBgYBr34x+2z0v8rsqpzL4nFO1u4cC0atxbhsPDnHnsso7n9OY+JVV
 xMlvPEA/9m4O8uXp7d6tX9b3SPiemvPOETIS6ENylQYeKD/B9NReKxMRsKilimbQ7vLr
 zOD6zVPvayEoxPN+mnAX5QPPMj+uEbCLDW9NbdnX0WXVzyyjYrdOkpN/jP0k7PezK6qA
 fy7kWCtMGCaEvn3EFesaMB/dMC9Rhyknm4OBfEIpjGgR/NWk2B9fewwXmEXnLpxTwPL+
 0I2UaPLxpgS30AaIRFDN2HIVClZnLLOxFobhre8XO+Vnluf+pbXzi/AvVDMlDCVtrTdw
 u/qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767760999; x=1768365799;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CmNZiMiLRz7C+tpqpi8aiFEIQgPCT214fV1yD6bvzyk=;
 b=B+wMhy38ouE2ZNMBLnYfbARW5qjN2Ofn39mT9n7rWcD06lrxfs3QeVmveOF3um8J1I
 aHgL8OU5vjkfG9d2lyvz+4fLALlHF7LiWHIFHIcPL/gCt9RFQVKKkI5W+m5Q9W630S2t
 V4VtxUc3aXDk4maPfl5SIcvSRYAylfH/mE54FaZW8oFlyKb4cCVlWp0cpA1UusM9ur7j
 I6M1n3HvRjDZRVZMn6T2varzRsxaOf9VyRLYR37JM9svVsus9I7zuatlChZffsiKcRY9
 fbaBG8ZaXpj8zPLuijKh9811pTUS1EV7ss9Fk3bk0v5W5uXjGQXf+cHo28lW5G4+1UE0
 SxfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJGhEaV7Cck85ef/nBy8QjblPIySinjbe5sgE2T7gqfTHU+MWqGVqSdlM6h4Pk7GmbNoCeYWR3Fmc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLMz94CQFEIXFs+vL215erg4kLmzdC79Ftznh+tkxnQPq/qxo4
 s5O2nyXyRCIEKyrTwXzn0Yh0SShizkcexQUJr8Pd5mTL4hdgTKiEuVKw
X-Gm-Gg: AY/fxX6+QbPeY81cnP3BuCehfJfbpPvQnaiPVJXORY25E36xahN9GKH4JafrqsIicrv
 +is7bTNdZ5cK6eRlJnOYyc9GkUW5+/nNt4EjaJaS7Wk4qaqciwVja2JBeYjArlwqC9P4l9iCGPo
 VL6RdtdC4Jeh+sMfWZiJ58gy6+zfxZ4tqnRyvKEoHke6mpoUMe4PtrB35vvAQGUXvkyK8/8SwF3
 KbcA3OqSAlEkZw0fhxy40EoKNGxzwQRv9f5M1kQUfv04ISm8sWJmv0hGzi/CwyYxO7evOJUKFJB
 AdZy9ztXKNIfED6QrxNc8sYIpi3VkF2qBzv5kweoukJp11u+BB1Cu8nEL6gRU9P5VZY92W1mXXv
 ABTVUwEYNgBNyEP9xfIMIyz0OdB3IUnUnQ36VmxfXCfrkOTnJ2xBxgO92y1nw0yd/zbNZMOzs1J
 UShNXJgwXJbOoWRv0HbNfmDOF+RGvNis0nDQy/+HrCy5o/XOuxQ1BCOQ==
X-Google-Smtp-Source: AGHT+IGyLXpHnLdUccdHLbJKV2U55q9FpnJ0qEZouF7Rk2ZDPQCEjkM51aika9hOgCehETQQWJIYhQ==
X-Received: by 2002:a05:6a20:918e:b0:34f:b660:770d with SMTP id
 adf61e73a8af0-3898f9dd14cmr1103698637.55.1767760998777; 
 Tue, 06 Jan 2026 20:43:18 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net
 ([2601:1c0:5780:9200:d1c8:9d76:637a:6957])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a3e3c39ef2sm36866225ad.14.2026.01.06.20.43.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jan 2026 20:43:18 -0800 (PST)
From: Chintan Patel <chintanlike@gmail.com>
To: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, andy@kernel.org, deller@gmx.de,
 gregkh@linuxfoundation.org, Chintan Patel <chintanlike@gmail.com>
Subject: [PATCH v4 3/4] fbdev: omapfb: Make FB_DEVICE dependency optional
Date: Tue,  6 Jan 2026 20:42:56 -0800
Message-ID: <20260107044258.528624-4-chintanlike@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107044258.528624-1-chintanlike@gmail.com>
References: <20260107044258.528624-1-chintanlike@gmail.com>
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

omapfb provides several sysfs interfaces for framebuffer configuration
and debugging, but these are not required for the core driver.

Remove the hard dependency on CONFIG_FB_DEVICE and make sysfs support
optional by using dev_of_fbinfo() to obtain the backing device at runtime.
When FB_DEVICE is disabled, sysfs operations are skipped while the code
still builds and is type-checked.

Suggested-by: Helge Deller <deller@gmx.de>
Signed-off-by: Chintan Patel <chintanlike@gmail.com>
---
 drivers/video/fbdev/omap2/omapfb/Kconfig       |  3 ++-
 .../video/fbdev/omap2/omapfb/omapfb-sysfs.c    | 18 ++++++++++++++----
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/Kconfig b/drivers/video/fbdev/omap2/omapfb/Kconfig
index f4cdf999a080..2d20e79adefc 100644
--- a/drivers/video/fbdev/omap2/omapfb/Kconfig
+++ b/drivers/video/fbdev/omap2/omapfb/Kconfig
@@ -5,7 +5,6 @@ config OMAP2_VRFB
 menuconfig FB_OMAP2
 	tristate "OMAP2+ frame buffer support"
 	depends on FB
-	depends on FB_DEVICE
 	depends on DRM_OMAP = n
 	depends on GPIOLIB
 	select FB_OMAP2_DSS
@@ -13,6 +12,8 @@ menuconfig FB_OMAP2
 	select FB_IOMEM_HELPERS
 	help
 	  Frame buffer driver for OMAP2+ based boards.
+	  FB_DEVICE is not required, but if enabled, provides sysfs interface
+	  for framebuffer configuration and debugging.
 
 if FB_OMAP2
 
diff --git a/drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c b/drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c
index 831b2c2fbdf9..38a635d38d58 100644
--- a/drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c
+++ b/drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c
@@ -558,10 +558,15 @@ int omapfb_create_sysfs(struct omapfb2_device *fbdev)
 
 	DBG("create sysfs for fbs\n");
 	for (i = 0; i < fbdev->num_fbs; i++) {
+		struct device *dev;
 		int t;
+
+		dev = dev_of_fbinfo(fbdev->fbs[i]);
+		if (!dev)
+			continue;
+
 		for (t = 0; t < ARRAY_SIZE(omapfb_attrs); t++) {
-			r = device_create_file(fbdev->fbs[i]->dev,
-					&omapfb_attrs[t]);
+			r = device_create_file(dev, &omapfb_attrs[t]);
 
 			if (r) {
 				dev_err(fbdev->dev, "failed to create sysfs "
@@ -580,9 +585,14 @@ void omapfb_remove_sysfs(struct omapfb2_device *fbdev)
 
 	DBG("remove sysfs for fbs\n");
 	for (i = 0; i < fbdev->num_fbs; i++) {
+		struct device *dev;
+
+		dev = dev_of_fbinfo(fbdev->fbs[i]);
+		if (!dev)
+			continue;
+
 		for (t = 0; t < ARRAY_SIZE(omapfb_attrs); t++)
-			device_remove_file(fbdev->fbs[i]->dev,
-					&omapfb_attrs[t]);
+			device_remove_file(dev, &omapfb_attrs[t]);
 	}
 }
 
-- 
2.43.0

