Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D222CCE90C
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 06:43:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89D8B10ED43;
	Fri, 19 Dec 2025 05:43:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Uto4MCcH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 902CC10EC52
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 05:43:47 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-2a09d981507so9975945ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 21:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766123027; x=1766727827; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7OguNjtskMuqb5lnf7iu+ciDjHTh+c3vKrdbcOWFfIs=;
 b=Uto4MCcH7bQNQqZMMmtRgrV7OWLIWODBgpyPPpvGoMo+urzimiDRuXwLpen8iVLUkm
 tEFrlWMErAlwTkRZUDFjOv4EST7KIUzJMk2TWR7wHaVCFA7EJVkXUhhBDcUTcFZn1poT
 FcKFzOFh+UKMTLTWHs6VxQYcnbLiVlkVjGgmVMHHespkIkw0NDJhhWG9JRfJ4ltwwM/H
 3c2kjArQ/eVpAKGBwA0UihbyKoHtEpEPZb+zCigmrzArZCVJJ6PS1PECKXWh3QHbu6+c
 WSVOKy+sLP/H4D6B7/cPlAYroYO8teP6aARBszH2e4kXGkMVkAJSFItv/rWunc4uoiXs
 IGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766123027; x=1766727827;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7OguNjtskMuqb5lnf7iu+ciDjHTh+c3vKrdbcOWFfIs=;
 b=qrgB03UJrEr/hRkOciIwQQ61f9810W1OAr/UTvcZF049g5oNS25KHei52M2jWRg2xT
 S8Cvt1sVMN3C3489TDt7j4Zc7OEbmh/cGGFDG1HH2SK7ikztPIdAPucW/oUyeShO3QnG
 VTl8NY4M7Sut1zOzdZ41wCZgfINFZc1DHPmBtI83YSkj58kHcZm78y5wldzVHBarjzbE
 zL7gQUMO25gPf/JsiJApCKHoxiHfg1CaTyGoHFJUU6wNAYIWSxmbc7cxKW0OGmTK4NXu
 /XszwKgBwmSZu8UoN6OHFVYSgxwExXHEKLICFmNXdYQr8aBYRSNGnegmpOmZPhG3DNzC
 xopA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFIqKvvkokjEqEQ5rXwg6oJPdQL2/ku3UOBb1A1CBib9H5O19BgBtRAN4btFgPv9Hla/6svcnnx5A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJIf7ada24WMIKI8LnTQW7y9Ht73HbOUntyrH0alkQIDzUrpwV
 rex/mPJd/Md1RguRLNE10KKGlmdxoFS6ZTsXXrVVuCqQf5/DttinFsEx
X-Gm-Gg: AY/fxX67Z8DpEXnU35bdB3qk2vzg3Ost0XenRpg8x8teaRuekE0j6PCs1W96tIR8qoT
 top9j97H2uFsGoIYh4QQdqE5uSYeL/SZ+1b+voIdXOMHvDyZEo2FRpSyy/v3XWI/Ffc5FKm2gLh
 nuz77X3Hf4qNRQ3yRDnvZyYabOOPx0psQN1m3xe7vqhiiFgrVH8r3HEE4eEI75Yw5rA/LYH/Ug/
 LARvuBGJnwfOJWbafFdkle7KlEoKuXoyr9j+yKYeo9a4h87wQc1AAOJj7QIhvnzSNZ5BuoBXmuQ
 gGmpeKMSv8FVv6/h3jbyLQeAszIHxgZCo5X4ThqqHlWAEOMeE3yLvjkErFEG5DdSyjAL+JU8uoD
 FJ9jtPgG6s+uaX42v2vZJo1VjIpuJnu6TNQuoWummYXxwWl9MG/ej0tIURi2WKERYZr542LSxmY
 DnqoPFjJqMn6tLBAo3pUSZ94nG0hy6l9cZ8Fb2WOwLLqI=
X-Google-Smtp-Source: AGHT+IFIN9O1bSTaoX7Y9Xly+yqtX/VSEkwqhmoGFiL1kW7k2Mixeaj5EcJ8LC8LuF4Nk/249G3y9g==
X-Received: by 2002:a17:902:cec7:b0:295:134:9ae5 with SMTP id
 d9443c01a7336-2a2f0d41127mr17823485ad.24.1766123027055; 
 Thu, 18 Dec 2025 21:43:47 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net
 ([2601:1c0:5780:9200:5160:2cad:cf88:afa5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a2f3da7dabsm9878955ad.25.2025.12.18.21.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Dec 2025 21:43:46 -0800 (PST)
From: Chintan Patel <chintanlike@gmail.com>
To: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, andy@kernel.org, deller@gmx.de,
 gregkh@linuxfoundation.org, Chintan Patel <chintanlike@gmail.com>
Subject: [PATCH v2 3/4] fbdev: omapfb: Make FB_DEVICE dependency optional
Date: Thu, 18 Dec 2025 21:43:18 -0800
Message-ID: <20251219054320.447281-4-chintanlike@gmail.com>
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

omapfb provides several sysfs interfaces for framebuffer configuration
and debugging, but these are not required for the core driver.

Remove the hard dependency on CONFIG_FB_DEVICE and make sysfs support
optional by using dev_of_fbinfo() to obtain the backing device at runtime.
When FB_DEVICE is disabled, sysfs operations are skipped while the code
still builds and is type-checked.

v2:
- Replace CONFIG_FB_DEVICE ifdefs and stubs with runtime checks
- Use dev_of_fbinfo() to skip sysfs when unavailable

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

