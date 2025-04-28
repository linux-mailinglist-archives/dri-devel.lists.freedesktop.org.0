Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F83A9E87B
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 08:45:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF8BC10E1E3;
	Mon, 28 Apr 2025 06:45:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fb2+r0uY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFE6710E399
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 06:45:49 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-317f68d0dffso46209221fa.2
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Apr 2025 23:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745822747; x=1746427547; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UvJuk4BZmmxEKWyZyDPqEsq9L6oKvjH94wTjuS2k+ng=;
 b=fb2+r0uYp6hN4pYuEIv+hUxpdNMDMK7/oMBUMMaA+wrZ4eUU8gayboUNVn8x57wwQJ
 rCr+m9UpO0yyrWzUFz+KiCsFqOxwPCoGQi0YpJ+NBUKSQq7wN18hMC6EuR7/4IGa+11k
 9GjLUVpv21eAAwc+4bDZ5PRzk0h54BS0oegojwRW1YNVGxHw6Q73B2G7Im3f1uLQr0d5
 cIsGzn4ssfQGQHQJ5ffLQ07WXjOusACrAB2mfBMPisYvxEHwvr9hNtbvHySeWitrLblZ
 vBuf6wJ4GoxqlCp9+s2Oy4HkKYQoASaPmg7i4WWt5WJKXTeJxtzlhREALG4PBEJWK44D
 0Gcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745822747; x=1746427547;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UvJuk4BZmmxEKWyZyDPqEsq9L6oKvjH94wTjuS2k+ng=;
 b=bejDMRdRZOY9jXKOezdEyFvuhAmW6e65a/5lyKx+BVmXNrS2CELWx1f1NvvEmGMt3w
 piGVEI5NnT0E64R2txaXGT8/EJmUZCix4Qv5BRTzLrakpLt4E1exJ3Yiml5QIQL7AmLk
 8nah+Y39OWEpzk894TrTv6OwhbkQ27T2O7WYr02oEU81oxKYyrdPBSdkoLNJz6FAUa9m
 Q4m+5R3KEzWt2E8N4+zTekNjwBqSO7AmgpQLbZHx1zkqxO6o+67pDw7jeRBcYDr+CIWM
 Yr8qsSqEzWLeSFuZlMb+HrtuzrEsBAGYOc8iiZv5Z76YgASGybfFJhpziWdMGNymplk3
 N5Pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwhR1dgd68Zc1bIYLvcKUq2jrXbjlTwsBSEM3NSdSew2lI0efoCiakSwGlr5mCTo4Ugtb16vTnKIM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0mpK2p3lLbxiSoCJ+y8+nwxuetxD0he8SnPMIPKdqBwxrWOpP
 HMsdVoQiMPtKEL725mP2zmUMyQ7OvpkL4S8qfeVRELtcWL1JAM3h
X-Gm-Gg: ASbGncs5EzpOZfxpVIKvmaUAyZvyNDK4eMK7LBOGi/Mpe3tuJfmcEerjpvABG7lNyAe
 zBRr9z4oNbBA/uyAiA5iBdYjpxtnny6H23TgIYDkz0F6tXN4/RCV1x3QZ+hvj+QJWNcNZycfBEC
 dNkEQ0ycXjt+m2o79KyRzNC0E91AY9TLeOb9hSd9bR+Vz6gMCSR/fqjjrPro4KmtprDXuSfseUG
 C10qb5QVXxqGdE6PpHUuYymlB48Mu3n91OmOJfm3DrwuQ7vtlslGx+UnVZdV/wzxunoGcIsTIZV
 syYDH/1twuODEbTE+lS48IMEL3Lnrkfy2tlrQkc19FIMTjBXeCmBrO6jEEYMaDrtsQGARYhfr90
 wdwWl6HYNcXBqVlubjRM=
X-Google-Smtp-Source: AGHT+IGYWJCzb7KLaPmkOKmB1Zd09utIb9ZyHI5CpHBL5TA65DDBl8lF1AMdN3x0deJK3vhckX78kg==
X-Received: by 2002:a2e:bc15:0:b0:30b:c328:3c9a with SMTP id
 38308e7fff4ca-319081d9f33mr36354851fa.29.1745822746887; 
 Sun, 27 Apr 2025 23:45:46 -0700 (PDT)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-317d1b95f4csm21336731fa.88.2025.04.27.23.45.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Apr 2025 23:45:46 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 28 Apr 2025 08:45:33 +0200
Subject: [PATCH] drm/sitronix: move tiny Sitronix drivers to their own subdir
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-sitronix-v1-1-4e7cc0a8195a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAwkD2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEyMT3eLMkqL8vMwKXaNkwzQziyQTMwszMyWg8oKi1LTMCrBR0bG1tQC
 ACDjrWgAAAA==
X-Change-ID: 20250424-sitronix-2c1f68b46866
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 David Lechner <david@lechnology.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8199;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=NZnot282Sw73fA4nRHstVLTjCUKuzrasAbA9WCCVI6E=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBoDyQTh/vxVa3v6mq1flqMwWIqmxEIBAm725I4b
 6g/Y0ThW96JAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaA8kEwAKCRCIgE5vWV1S
 MhQxD/9ogj75NL+4cg3UdMabuF60YVeCpNTsbrnedMW8bH9L51sz5CrYrsQHGmd84ABQ4sS2Y4F
 /ddqrWMYiUWAS2FkKVQvDdeAYkYOW+oESsr/nU+WrlwqPT50ZOr2foJEQx1UKV/f5RMda8eAnSY
 RMZlUclUxFjjUUohIfAamGJTd/ivHsaeTOL9vzXSlK0CT+BZNktrvuMpFKTbiFKWIyjfqaik8c5
 IjmRg6t23s9iGpoFjLO558oD+CHw9pjfR/+vQ9tsxZI2MidU5Udc2B1suJbytq8TLfPox/61EXQ
 rWaRFYzbrVO6CXJiILi3jl2dXgoPHL0zW+6Lr96P5NAzbFFSUOpCArcLGWjTiGXRxQpuACRDbEV
 i7DkSq2obnsR+hj7Lx8xoZoZlJfgYFjBmAciG5OCtuO94j7k2vKfz6enpJRhvXdd5k4iglkgztM
 zGGkeeetbmWDKEaD/nOHq8qlQUPJR0IRmvHZukbePq0Cj4CQOfRkVcgqWLkbfLB9tcbf/38oQvo
 HDZItcGIbfka4pMy9BiiqJBWbBe+9ODZEEl8eVix3Th/6MSRW0jskNPK9Jy+QICp+wtxx7fXpu/
 fiASLdBtsf0ZcdSBEeLynGNUrDR6CTfOxFYY2r7XTsh653vuouNB51DTtq/gKEdEgJds3t9pHxI
 E8Gdo+ZhvXb88tA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
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

We start to have support many Sitronix displays in the tiny directory,
and we expect more to come.

Move them to their own subdirectory.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 MAINTAINERS                                     |  6 ++--
 drivers/gpu/drm/Kconfig                         |  2 ++
 drivers/gpu/drm/Makefile                        |  1 +
 drivers/gpu/drm/sitronix/Kconfig                | 40 +++++++++++++++++++++++++
 drivers/gpu/drm/sitronix/Makefile               |  3 ++
 drivers/gpu/drm/{tiny => sitronix}/st7571-i2c.c |  0
 drivers/gpu/drm/{tiny => sitronix}/st7586.c     |  0
 drivers/gpu/drm/{tiny => sitronix}/st7735r.c    |  0
 drivers/gpu/drm/tiny/Kconfig                    | 40 -------------------------
 drivers/gpu/drm/tiny/Makefile                   |  3 --
 10 files changed, 49 insertions(+), 46 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 81b81cc68ca2482f2965b801693ff8a43bbf2053..6b2d3d4c467b8b360317437027e20c4014c97a21 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7680,13 +7680,13 @@ M:	David Lechner <david@lechnology.com>
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/sitronix,st7586.txt
-F:	drivers/gpu/drm/tiny/st7586.c
+F:	drivers/gpu/drm/sitronix/st7586.c
 
 DRM DRIVER FOR SITRONIX ST7571 PANELS
 M:	Marcus Folkesson <marcus.folkesson@gmail.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/display/sitronix,st7571.yaml
-F:	drivers/gpu/drm/tiny/st7571-i2c.c
+F:	drivers/gpu/drm/sitronix/st7571-i2c.c
 
 DRM DRIVER FOR SITRONIX ST7701 PANELS
 M:	Jagan Teki <jagan@amarulasolutions.com>
@@ -7707,7 +7707,7 @@ M:	David Lechner <david@lechnology.com>
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
-F:	drivers/gpu/drm/tiny/st7735r.c
+F:	drivers/gpu/drm/sitronix/st7735r.c
 
 DRM DRIVER FOR SOLOMON SSD130X OLED DISPLAYS
 M:	Javier Martinez Canillas <javierm@redhat.com>
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 3921772ae61214e6ac0337edc147a46af0010070..cc7385c334eb6ad484688d9eb483c2c6a9c39e11 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -385,6 +385,8 @@ source "drivers/gpu/drm/xlnx/Kconfig"
 
 source "drivers/gpu/drm/gud/Kconfig"
 
+source "drivers/gpu/drm/sitronix/Kconfig"
+
 source "drivers/gpu/drm/solomon/Kconfig"
 
 source "drivers/gpu/drm/sprd/Kconfig"
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index b5d5561bbe5fd72f3915e6a52f325fdb79c7981e..70510620f29c874e376c795fb05d426a0faae05c 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -221,6 +221,7 @@ obj-$(CONFIG_DRM_TIDSS) += tidss/
 obj-y			+= xlnx/
 obj-y			+= gud/
 obj-$(CONFIG_DRM_HYPERV) += hyperv/
+obj-y			+= sitronix/
 obj-y			+= solomon/
 obj-$(CONFIG_DRM_SPRD) += sprd/
 obj-$(CONFIG_DRM_LOONGSON) += loongson/
diff --git a/drivers/gpu/drm/sitronix/Kconfig b/drivers/gpu/drm/sitronix/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..97d9504e1e90c6eb40e8865ca3cfd17613567274
--- /dev/null
+++ b/drivers/gpu/drm/sitronix/Kconfig
@@ -0,0 +1,40 @@
+config DRM_ST7571_I2C
+	tristate "DRM support for Sitronix ST7571 display panels (I2C)"
+	depends on DRM && I2C && MMU
+	select DRM_GEM_SHMEM_HELPER
+	select DRM_KMS_HELPER
+	select REGMAP_I2C
+	help
+	  DRM driver for Sitronix ST7571 panels controlled over I2C.
+
+	  if M is selected the module will be called st7571-i2c.
+
+config DRM_ST7586
+	tristate "DRM support for Sitronix ST7586 display panels"
+	depends on DRM && SPI
+	select DRM_CLIENT_SELECTION
+	select DRM_KMS_HELPER
+	select DRM_GEM_DMA_HELPER
+	select DRM_MIPI_DBI
+	help
+	  DRM driver for the following Sitronix ST7586 panels:
+	  * LEGO MINDSTORMS EV3
+
+	  If M is selected the module will be called st7586.
+
+config DRM_ST7735R
+	tristate "DRM support for Sitronix ST7715R/ST7735R display panels"
+	depends on DRM && SPI
+	select DRM_CLIENT_SELECTION
+	select DRM_KMS_HELPER
+	select DRM_GEM_DMA_HELPER
+	select DRM_MIPI_DBI
+	select BACKLIGHT_CLASS_DEVICE
+	help
+	  DRM driver for Sitronix ST7715R/ST7735R with one of the following
+	  LCDs:
+	  * Jianda JD-T18003-T01 1.8" 128x160 TFT
+	  * Okaya RH128128T 1.44" 128x128 TFT
+
+	  If M is selected the module will be called st7735r.
+
diff --git a/drivers/gpu/drm/sitronix/Makefile b/drivers/gpu/drm/sitronix/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..bd139e5a6995fa026cc635b3c29782473d1efad7
--- /dev/null
+++ b/drivers/gpu/drm/sitronix/Makefile
@@ -0,0 +1,3 @@
+obj-$(CONFIG_DRM_ST7571_I2C)		+= st7571-i2c.o
+obj-$(CONFIG_DRM_ST7586)		+= st7586.o
+obj-$(CONFIG_DRM_ST7735R)		+= st7735r.o
diff --git a/drivers/gpu/drm/tiny/st7571-i2c.c b/drivers/gpu/drm/sitronix/st7571-i2c.c
similarity index 100%
rename from drivers/gpu/drm/tiny/st7571-i2c.c
rename to drivers/gpu/drm/sitronix/st7571-i2c.c
diff --git a/drivers/gpu/drm/tiny/st7586.c b/drivers/gpu/drm/sitronix/st7586.c
similarity index 100%
rename from drivers/gpu/drm/tiny/st7586.c
rename to drivers/gpu/drm/sitronix/st7586.c
diff --git a/drivers/gpu/drm/tiny/st7735r.c b/drivers/gpu/drm/sitronix/st7735r.c
similarity index 100%
rename from drivers/gpu/drm/tiny/st7735r.c
rename to drivers/gpu/drm/sitronix/st7735r.c
diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index 9fa333709828f78f5fe5639f7ce40117455ff046..7b97411b0c477823da8fb28fc210e580c8bee186 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -198,43 +198,3 @@ config TINYDRM_SHARP_MEMORY
 	  * 4.40" Sharp Memory LCD (LS044Q7DH01)
 
 	  If M is selected the module will be called sharp_memory.
-
-config TINYDRM_ST7586
-	tristate "DRM support for Sitronix ST7586 display panels"
-	depends on DRM && SPI
-	select DRM_CLIENT_SELECTION
-	select DRM_KMS_HELPER
-	select DRM_GEM_DMA_HELPER
-	select DRM_MIPI_DBI
-	help
-	  DRM driver for the following Sitronix ST7586 panels:
-	  * LEGO MINDSTORMS EV3
-
-	  If M is selected the module will be called st7586.
-
-config DRM_ST7571_I2C
-	tristate "DRM support for Sitronix ST7571 display panels (I2C)"
-	depends on DRM && I2C && MMU
-	select DRM_GEM_SHMEM_HELPER
-	select DRM_KMS_HELPER
-	select REGMAP_I2C
-	help
-	  DRM driver for Sitronix ST7571 panels controlled over I2C.
-
-	  if M is selected the module will be called st7571-i2c.
-
-config TINYDRM_ST7735R
-	tristate "DRM support for Sitronix ST7715R/ST7735R display panels"
-	depends on DRM && SPI
-	select DRM_CLIENT_SELECTION
-	select DRM_KMS_HELPER
-	select DRM_GEM_DMA_HELPER
-	select DRM_MIPI_DBI
-	select BACKLIGHT_CLASS_DEVICE
-	help
-	  DRM driver for Sitronix ST7715R/ST7735R with one of the following
-	  LCDs:
-	  * Jianda JD-T18003-T01 1.8" 128x160 TFT
-	  * Okaya RH128128T 1.44" 128x128 TFT
-
-	  If M is selected the module will be called st7735r.
diff --git a/drivers/gpu/drm/tiny/Makefile b/drivers/gpu/drm/tiny/Makefile
index 0151590db5cbd80aebde0629afd03f47b83c3045..4a9ff61ec25420e2c0a648c04eaab7ca25dd5407 100644
--- a/drivers/gpu/drm/tiny/Makefile
+++ b/drivers/gpu/drm/tiny/Makefile
@@ -6,7 +6,6 @@ obj-$(CONFIG_DRM_BOCHS)			+= bochs.o
 obj-$(CONFIG_DRM_CIRRUS_QEMU)		+= cirrus-qemu.o
 obj-$(CONFIG_DRM_GM12U320)		+= gm12u320.o
 obj-$(CONFIG_DRM_PANEL_MIPI_DBI)	+= panel-mipi-dbi.o
-obj-$(CONFIG_DRM_ST7571_I2C)		+= st7571-i2c.o
 obj-$(CONFIG_TINYDRM_HX8357D)		+= hx8357d.o
 obj-$(CONFIG_TINYDRM_ILI9163)		+= ili9163.o
 obj-$(CONFIG_TINYDRM_ILI9225)		+= ili9225.o
@@ -15,5 +14,3 @@ obj-$(CONFIG_TINYDRM_ILI9486)		+= ili9486.o
 obj-$(CONFIG_TINYDRM_MI0283QT)		+= mi0283qt.o
 obj-$(CONFIG_TINYDRM_REPAPER)		+= repaper.o
 obj-$(CONFIG_TINYDRM_SHARP_MEMORY)	+= sharp-memory.o
-obj-$(CONFIG_TINYDRM_ST7586)		+= st7586.o
-obj-$(CONFIG_TINYDRM_ST7735R)		+= st7735r.o

---
base-commit: ef6517ac5cf971cfeaccea4238d9da7e2425b8b1
change-id: 20250424-sitronix-2c1f68b46866

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>

