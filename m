Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB97CE8B71
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 06:29:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1248710E809;
	Tue, 30 Dec 2025 05:29:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GQebchyH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B4B10E807
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 05:29:08 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-29f1bc40b35so166209025ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 21:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767072548; x=1767677348; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9ci5hl1fGtHa6SMuwo1VapvWaLUMCAvqlqzaI482cWA=;
 b=GQebchyHZpUcvWnLaVRvDrIUtwSHkKA2RADVsapZtdJz0gXwvEljvOe9b/5uXEWhIS
 U2NnpNJUHcMjgYawy9zz/dJr0De8n5iTPygZVxvSzP5n6Km/F4SDWw5viTgxUu8TtgMU
 q4h2VAnzU1N6hQFv3hWX1ns+mU0p3Re8OysMXVa9jvm6Ym6UT8ZOXqRSCA1HjnN/XzdT
 7f7/rbPuonZtUxkoGNvlzu3EgxYOeQSUIutIb7xduKYqXXq9hjUlLny2I0KfS/5UHcxR
 LD9lQqMvrFJ0oA3ZOmbZzRPtOspPoaWtJD6M8bKUp0T8nWxF1/qCKze1SpKjyO7HQ5+F
 aRyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767072548; x=1767677348;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9ci5hl1fGtHa6SMuwo1VapvWaLUMCAvqlqzaI482cWA=;
 b=xHT9DO0qUOJoXmyr5WOScxv6YP/ZRljYZe5Ieg/i/cVm5l2pePoQnVzlzuTOBy+sx5
 zopnyLcZoF5b3EayHvmh8FGQw2XKeLfyoRXajAKLqpoL5nWO0b3z3NPO/Kv9mgdH1GSp
 a+5Sb0S9prWYRt7dNiI0ZpCJzhRx3g+uRorSs2rIji76cIGNxPn+O/VS/gikDXO+97We
 BVefyAJVYxOhk4LyLibIFBzxmWOjTI990uD5sHTqJPfwXS4+bFZdyAbqaX4GxGRdsrbs
 zIN3oOt/bfZLNsZ9mwVJMyw5yMEjXf7abVubz7V8K1iIgzdyEfHg9PVWeJED7VP26BGI
 y8Fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJBqqV0WmRcTFp7FpADMhrNgIrJlHMBvCawMlMOUi0SdJFXhvwogrjTHGh72iIzXvka+NO2IIjACg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxp/8DcWoQbgVPBGi2CCWREZN5V3qSgCa8FbDg2OHji9QV1fMgb
 6fiOjiru36MHrUpZiCOqg5KOs+R0N1fAm3XGcN9+XPI65AP/zLZRWN1H
X-Gm-Gg: AY/fxX7bdkZqnqN4GtTIhkakssChD76TbSazbR0ARo/M7Xw8oI1yb1I1+Yad1IG6tuI
 D6m9WBcjdHRLfY9679l5PtsAwgozyvJNj7gJYcTIwBCmas3mmKiQsJop6rVCmN64DwS1MHLmqYb
 Dz0fUhTrrtt645QG3QrshtB2Cvre5P3kuD+cAVIx22OCxsD+Z3gQxAOCO746KM7dFNRoIKnVbve
 kAVauRAckiK8xirUcGCca8YuQcJBgf6cErYJHiwettZGOv++K5YP/80kvct8ti+n1iPqHYS0Q/y
 3bGFr1cQD3FvD3bHC2TWalAbWYkdXp/Ay1Qr5uqbEK7sR5yIHesFadwr1q50oUlqSC4W7S83tKB
 ZQ8s6s3NQlGPBNWsMLT5eZ2GYMJQ910pfHSy/YhIshidO+njUeokmLPdfNH4a7PgnoUtk/KTCKn
 EQbERsqisOZMFxFerIU0RYAoXbnUAfSo80VnTvIZFGKA==
X-Google-Smtp-Source: AGHT+IGHZFAx8HgkjBpBEKVqWvo2fMWKQIfWR+KFRWNCjGwdqjZSd66OErzGlHaqwrUbyJ5EQMboOQ==
X-Received: by 2002:a17:903:4405:b0:295:565b:c691 with SMTP id
 d9443c01a7336-2a2f22292e6mr304546365ad.17.1767072548211; 
 Mon, 29 Dec 2025 21:29:08 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net
 ([2601:1c0:5780:9200:f7a0:c2f:d915:faf0])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a2f3c8286esm289290375ad.33.2025.12.29.21.29.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 21:29:07 -0800 (PST)
From: Chintan Patel <chintanlike@gmail.com>
To: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, andy@kernel.org, deller@gmx.de,
 gregkh@linuxfoundation.org, Chintan Patel <chintanlike@gmail.com>
Subject: [PATCH v3 3/4] fbdev: omapfb: Make FB_DEVICE dependency optional
Date: Mon, 29 Dec 2025 21:28:21 -0800
Message-ID: <20251230052827.4676-4-chintanlike@gmail.com>
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

omapfb provides several sysfs interfaces for framebuffer configuration
and debugging, but these are not required for the core driver.

Remove the hard dependency on CONFIG_FB_DEVICE and make sysfs support
optional by using dev_of_fbinfo() to obtain the backing device at runtime.
When FB_DEVICE is disabled, sysfs operations are skipped while the code
still builds and is type-checked.

Suggested-by: Helge Deller <deller@gmx.de>
Signed-off-by: Chintan Patel <chintanlike@gmail.com>
---
 drivers/video/fbdev/omap2/omapfb/Kconfig        |  3 ++-
 drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c | 16 ++++++++++++----
 2 files changed, 14 insertions(+), 5 deletions(-)

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
index 831b2c2fbdf9..ef555dd598aa 100644
--- a/drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c
+++ b/drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c
@@ -558,10 +558,14 @@ int omapfb_create_sysfs(struct omapfb2_device *fbdev)
 
 	DBG("create sysfs for fbs\n");
 	for (i = 0; i < fbdev->num_fbs; i++) {
+		struct device *dev = dev_of_fbinfo(fbdev->fbs[i]);
 		int t;
+
+		if (!dev)
+			continue;
+
 		for (t = 0; t < ARRAY_SIZE(omapfb_attrs); t++) {
-			r = device_create_file(fbdev->fbs[i]->dev,
-					&omapfb_attrs[t]);
+			r = device_create_file(dev, &omapfb_attrs[t]);
 
 			if (r) {
 				dev_err(fbdev->dev, "failed to create sysfs "
@@ -580,9 +584,13 @@ void omapfb_remove_sysfs(struct omapfb2_device *fbdev)
 
 	DBG("remove sysfs for fbs\n");
 	for (i = 0; i < fbdev->num_fbs; i++) {
+		struct device *dev = dev_of_fbinfo(fbdev->fbs[i]);
+
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

