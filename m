Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACAE99335B
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 18:35:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12A9010E0FF;
	Mon,  7 Oct 2024 16:35:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ewiWkBYH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7061910E0FF
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 16:35:39 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a993f6916daso293648066b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2024 09:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1728318938; x=1728923738;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KzpZm86bDDov2AukpZRx/jolHUxvzBKnmBOMATrPh8U=;
 b=ewiWkBYHQpTwpzfKU9Fwdg0KikJZZebehEw7lYM9bFE4xKN5LIaDz8bvcWPJUTHgRR
 CVMdG39JhCiTxouzQO/rtES+DDtWGD7g0iUZesH3NtfteOWcxgD7Rbo8wXrzQMHwQR7F
 4kiptk7AO1qbrHh3U60fbnadk3P/Oatyfu9rHqvCeeZISDkyrqdNmUvy8Rr9uB6oD5M6
 ID/Rgsc3JBeMrYP2/kfnkIX2dJeiv020GemQtxO5e6Y8qdKm8AsUdOzPoyViUEPzt1Sz
 h6M2zhB3jh8gLS73GTirFMzS9uGphF0VZHmXDj/ytma6OgFYVNC/7q3W6u6e6gJsWFeh
 ExxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728318938; x=1728923738;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KzpZm86bDDov2AukpZRx/jolHUxvzBKnmBOMATrPh8U=;
 b=su6JnWv81l4w2AHvGlT571pVhfQrJj5dytm4ZaGGn05eEoBJxafAZpSXtHxSnvXg5r
 RAtb8Dylk6qPLJgGDvcpHCDID7/+020zWkJO5UVln2yTs3H0lj9/IBYRqzTaZf0yBcMv
 guUX1NHfK07RpwC90BfaEaET7ddCyVXVFyExjHR7rbet/BFXUwbqpavC+MugOqdUD7GV
 E4pKlxPilvSWEeYp0I3YRmreeLx6jEqyUAAt1Ylf4NVRj7nQoOvLKsJDcxjwFouePKw1
 9ngP0pqTJRuCvIxbEPXmmWdSSHXh/FVy87o7nbbeX1Efj/e4+SL4M5oHrTHV4ulwFS7G
 ocIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWw6eSBSX0yZylF516SrHNdw6eJKOkbfNRW9V1iREd4SybIcqNYkv1Abmkb6/xJxkOteklGukDUJgg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6q6/yMGWQvDybCz/CdWAUW8Yi9JNZtGGNFWRiKN2Df6qmYxBY
 1yxeixl7D9PHqxwxJBfCP4WzDk/KLeUwFbp60g20xYFG+DsRH7Xz3aN4R04SdFJwffx1iVJxFtw
 g
X-Google-Smtp-Source: AGHT+IFH2cnpVo4B0OwRAd3/BM91YrW/NjksfbUP7VX1XpWiwCqZCYrrSzx/+g4pXlt9f6buKdxVoQ==
X-Received: by 2002:a17:907:7faa:b0:a99:529d:81ae with SMTP id
 a640c23a62f3a-a99529d841cmr475596066b.55.1728318937353; 
 Mon, 07 Oct 2024 09:35:37 -0700 (PDT)
Received: from localhost (p5dc68d3d.dip0.t-ipconnect.de. [93.198.141.61])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99359e64f3sm371646566b.132.2024.10.07.09.35.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2024 09:35:36 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] fbdev: Switch back to struct platform_driver::remove()
Date: Mon,  7 Oct 2024 18:35:17 +0200
Message-ID: <20241007163516.433885-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=41585;
 i=u.kleine-koenig@baylibre.com; h=from:subject;
 bh=xutqJTJcsLvM3cQouVfvQlf5/urVg3oGKP2jAOxXxys=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnBA3F+9iskpTpCZcRUpKltJmkiZsTB0JC8zxmA
 It6YRkPbjSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZwQNxQAKCRCPgPtYfRL+
 TseFB/9hGyuWWemaL6gy8JlqFdjijTlJq1En3fzxae4ZQuP9W/Pi3do2/lCiGiJWuWqhpjpuAHD
 VXhxKhzvGDhZ4wqXxjsggciAIEFWcfDfxI+3To9JNQodZesFp6gF+nUu02hfRt++/Gd7FFNDVCM
 yK5W8VMKpNinWEM8tqdCL4nLA9PxUyrJIYKS0q4ssT7qXfjv2OstXTYtwvyW4OaQnFjuJU5Mnbh
 IVN+66Lsk3b1ByNECEuTgaA/1Dv14Ni1CeHpni8PjvETDoZdLp/JjwWioBbkutBOWhj7aOhElXk
 vD5JrcW/+JcJpPKdqRd2U9KXFQHDrWaivfjdPouB2B57Sx86
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
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

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers.

Convert all platform drivers below drivers/dma after the previous
conversion commits apart from the wireless drivers to use .remove(),
with the eventual goal to drop struct platform_driver::remove_new(). As
.remove() and .remove_new() have the same prototypes, conversion is done
by just changing the structure member name in the driver initializer.

While touching these files, make indention of the struct initializer
consistent in several files.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

given the simplicity of the individual changes I do this all in a single
patch. I you don't agree, please tell and I will happily split it.

It's based on Friday's next, feel free to drop changes that result in a
conflict when you come around to apply this. I'll care for the fallout
at a later time then. (Having said that, if you use b4 am -3 and git am
-3, there should be hardly any conflict.)

Note I didn't Cc: all the individual driver maintainers to not trigger
sending limits and spam filters.

Best regards
Uwe

 drivers/video/fbdev/amifb.c                               | 4 ++--
 drivers/video/fbdev/arcfb.c                               | 2 +-
 drivers/video/fbdev/atmel_lcdfb.c                         | 2 +-
 drivers/video/fbdev/au1100fb.c                            | 2 +-
 drivers/video/fbdev/au1200fb.c                            | 2 +-
 drivers/video/fbdev/broadsheetfb.c                        | 2 +-
 drivers/video/fbdev/bw2.c                                 | 2 +-
 drivers/video/fbdev/cg14.c                                | 2 +-
 drivers/video/fbdev/cg3.c                                 | 2 +-
 drivers/video/fbdev/cg6.c                                 | 2 +-
 drivers/video/fbdev/clps711x-fb.c                         | 2 +-
 drivers/video/fbdev/cobalt_lcdfb.c                        | 2 +-
 drivers/video/fbdev/da8xx-fb.c                            | 2 +-
 drivers/video/fbdev/ep93xx-fb.c                           | 2 +-
 drivers/video/fbdev/ffb.c                                 | 2 +-
 drivers/video/fbdev/fsl-diu-fb.c                          | 6 +++---
 drivers/video/fbdev/gbefb.c                               | 6 +++---
 drivers/video/fbdev/goldfishfb.c                          | 2 +-
 drivers/video/fbdev/grvga.c                               | 2 +-
 drivers/video/fbdev/hecubafb.c                            | 2 +-
 drivers/video/fbdev/hgafb.c                               | 2 +-
 drivers/video/fbdev/hitfb.c                               | 2 +-
 drivers/video/fbdev/imxfb.c                               | 2 +-
 drivers/video/fbdev/leo.c                                 | 2 +-
 drivers/video/fbdev/mb862xx/mb862xxfbdrv.c                | 2 +-
 drivers/video/fbdev/metronomefb.c                         | 2 +-
 drivers/video/fbdev/ocfb.c                                | 2 +-
 drivers/video/fbdev/offb.c                                | 4 ++--
 drivers/video/fbdev/omap/omapfb_main.c                    | 2 +-
 .../fbdev/omap2/omapfb/displays/connector-analog-tv.c     | 2 +-
 drivers/video/fbdev/omap2/omapfb/displays/connector-dvi.c | 2 +-
 .../video/fbdev/omap2/omapfb/displays/connector-hdmi.c    | 2 +-
 .../video/fbdev/omap2/omapfb/displays/encoder-opa362.c    | 2 +-
 .../video/fbdev/omap2/omapfb/displays/encoder-tfp410.c    | 2 +-
 .../video/fbdev/omap2/omapfb/displays/encoder-tpd12s015.c | 2 +-
 drivers/video/fbdev/omap2/omapfb/displays/panel-dpi.c     | 2 +-
 drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c  | 2 +-
 .../fbdev/omap2/omapfb/displays/panel-sharp-ls037v7dw01.c | 2 +-
 drivers/video/fbdev/omap2/omapfb/dss/core.c               | 6 +++---
 drivers/video/fbdev/omap2/omapfb/dss/dispc.c              | 2 +-
 drivers/video/fbdev/omap2/omapfb/dss/dpi.c                | 4 ++--
 drivers/video/fbdev/omap2/omapfb/dss/dsi.c                | 2 +-
 drivers/video/fbdev/omap2/omapfb/dss/dss.c                | 2 +-
 drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c              | 6 +++---
 drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c              | 2 +-
 drivers/video/fbdev/omap2/omapfb/dss/sdi.c                | 6 +++---
 drivers/video/fbdev/omap2/omapfb/dss/venc.c               | 6 +++---
 drivers/video/fbdev/omap2/omapfb/omapfb-main.c            | 2 +-
 drivers/video/fbdev/p9100.c                               | 2 +-
 drivers/video/fbdev/platinumfb.c                          | 2 +-
 drivers/video/fbdev/pxa168fb.c                            | 2 +-
 drivers/video/fbdev/pxa3xx-gcu.c                          | 8 ++++----
 drivers/video/fbdev/pxafb.c                               | 2 +-
 drivers/video/fbdev/s1d13xxxfb.c                          | 2 +-
 drivers/video/fbdev/s3c-fb.c                              | 2 +-
 drivers/video/fbdev/sh7760fb.c                            | 2 +-
 drivers/video/fbdev/sh_mobile_lcdcfb.c                    | 2 +-
 drivers/video/fbdev/simplefb.c                            | 2 +-
 drivers/video/fbdev/sm501fb.c                             | 2 +-
 drivers/video/fbdev/tcx.c                                 | 2 +-
 drivers/video/fbdev/uvesafb.c                             | 2 +-
 drivers/video/fbdev/vesafb.c                              | 2 +-
 drivers/video/fbdev/vfb.c                                 | 2 +-
 drivers/video/fbdev/vga16fb.c                             | 2 +-
 drivers/video/fbdev/via/via-gpio.c                        | 2 +-
 drivers/video/fbdev/via/via_i2c.c                         | 2 +-
 drivers/video/fbdev/vt8500lcdfb.c                         | 2 +-
 drivers/video/fbdev/wm8505fb.c                            | 2 +-
 drivers/video/fbdev/wmt_ge_rops.c                         | 2 +-
 drivers/video/fbdev/xilinxfb.c                            | 2 +-
 70 files changed, 88 insertions(+), 88 deletions(-)

diff --git a/drivers/video/fbdev/amifb.c b/drivers/video/fbdev/amifb.c
index 132638240521..1116a0789ca4 100644
--- a/drivers/video/fbdev/amifb.c
+++ b/drivers/video/fbdev/amifb.c
@@ -3774,8 +3774,8 @@ static void __exit amifb_remove(struct platform_device *pdev)
  * triggers a section mismatch warning.
  */
 static struct platform_driver amifb_driver __refdata = {
-	.remove_new = __exit_p(amifb_remove),
-	.driver   = {
+	.remove = __exit_p(amifb_remove),
+	.driver = {
 		.name	= "amiga-video",
 	},
 };
diff --git a/drivers/video/fbdev/arcfb.c b/drivers/video/fbdev/arcfb.c
index b2408543277c..b807cf07522d 100644
--- a/drivers/video/fbdev/arcfb.c
+++ b/drivers/video/fbdev/arcfb.c
@@ -548,7 +548,7 @@ static void arcfb_remove(struct platform_device *dev)
 
 static struct platform_driver arcfb_driver = {
 	.probe	= arcfb_probe,
-	.remove_new = arcfb_remove,
+	.remove	= arcfb_remove,
 	.driver	= {
 		.name	= "arcfb",
 	},
diff --git a/drivers/video/fbdev/atmel_lcdfb.c b/drivers/video/fbdev/atmel_lcdfb.c
index 4da233fb02a8..9dfbc5310210 100644
--- a/drivers/video/fbdev/atmel_lcdfb.c
+++ b/drivers/video/fbdev/atmel_lcdfb.c
@@ -1299,7 +1299,7 @@ static int atmel_lcdfb_resume(struct platform_device *pdev)
 
 static struct platform_driver atmel_lcdfb_driver = {
 	.probe		= atmel_lcdfb_probe,
-	.remove_new	= atmel_lcdfb_remove,
+	.remove		= atmel_lcdfb_remove,
 	.suspend	= atmel_lcdfb_suspend,
 	.resume		= atmel_lcdfb_resume,
 	.driver		= {
diff --git a/drivers/video/fbdev/au1100fb.c b/drivers/video/fbdev/au1100fb.c
index 08109ce535cd..840f22160763 100644
--- a/drivers/video/fbdev/au1100fb.c
+++ b/drivers/video/fbdev/au1100fb.c
@@ -588,7 +588,7 @@ static struct platform_driver au1100fb_driver = {
 		.name		= "au1100-lcd",
 	},
 	.probe		= au1100fb_drv_probe,
-	.remove_new	= au1100fb_drv_remove,
+	.remove		= au1100fb_drv_remove,
 	.suspend	= au1100fb_drv_suspend,
 	.resume		= au1100fb_drv_resume,
 };
diff --git a/drivers/video/fbdev/au1200fb.c b/drivers/video/fbdev/au1200fb.c
index e718fea63662..ed770222660b 100644
--- a/drivers/video/fbdev/au1200fb.c
+++ b/drivers/video/fbdev/au1200fb.c
@@ -1833,7 +1833,7 @@ static struct platform_driver au1200fb_driver = {
 		.pm	= AU1200FB_PMOPS,
 	},
 	.probe		= au1200fb_drv_probe,
-	.remove_new	= au1200fb_drv_remove,
+	.remove		= au1200fb_drv_remove,
 };
 module_platform_driver(au1200fb_driver);
 
diff --git a/drivers/video/fbdev/broadsheetfb.c b/drivers/video/fbdev/broadsheetfb.c
index e857b15e9f5d..c8ba098a8c42 100644
--- a/drivers/video/fbdev/broadsheetfb.c
+++ b/drivers/video/fbdev/broadsheetfb.c
@@ -1151,7 +1151,7 @@ static void broadsheetfb_remove(struct platform_device *dev)
 
 static struct platform_driver broadsheetfb_driver = {
 	.probe	= broadsheetfb_probe,
-	.remove_new = broadsheetfb_remove,
+	.remove	= broadsheetfb_remove,
 	.driver	= {
 		.name	= "broadsheetfb",
 	},
diff --git a/drivers/video/fbdev/bw2.c b/drivers/video/fbdev/bw2.c
index eaab51be74f8..4a64940e0c00 100644
--- a/drivers/video/fbdev/bw2.c
+++ b/drivers/video/fbdev/bw2.c
@@ -372,7 +372,7 @@ static struct platform_driver bw2_driver = {
 		.of_match_table = bw2_match,
 	},
 	.probe		= bw2_probe,
-	.remove_new	= bw2_remove,
+	.remove		= bw2_remove,
 };
 
 static int __init bw2_init(void)
diff --git a/drivers/video/fbdev/cg14.c b/drivers/video/fbdev/cg14.c
index c161b2af8933..430e1a7b352b 100644
--- a/drivers/video/fbdev/cg14.c
+++ b/drivers/video/fbdev/cg14.c
@@ -590,7 +590,7 @@ static struct platform_driver cg14_driver = {
 		.of_match_table = cg14_match,
 	},
 	.probe		= cg14_probe,
-	.remove_new	= cg14_remove,
+	.remove		= cg14_remove,
 };
 
 static int __init cg14_init(void)
diff --git a/drivers/video/fbdev/cg3.c b/drivers/video/fbdev/cg3.c
index 5e1f1b9a81b6..e4c53c6632ba 100644
--- a/drivers/video/fbdev/cg3.c
+++ b/drivers/video/fbdev/cg3.c
@@ -458,7 +458,7 @@ static struct platform_driver cg3_driver = {
 		.of_match_table = cg3_match,
 	},
 	.probe		= cg3_probe,
-	.remove_new	= cg3_remove,
+	.remove		= cg3_remove,
 };
 
 static int __init cg3_init(void)
diff --git a/drivers/video/fbdev/cg6.c b/drivers/video/fbdev/cg6.c
index 69d3ce50948d..0b60df51e7bc 100644
--- a/drivers/video/fbdev/cg6.c
+++ b/drivers/video/fbdev/cg6.c
@@ -858,7 +858,7 @@ static struct platform_driver cg6_driver = {
 		.of_match_table = cg6_match,
 	},
 	.probe		= cg6_probe,
-	.remove_new	= cg6_remove,
+	.remove		= cg6_remove,
 };
 
 static int __init cg6_init(void)
diff --git a/drivers/video/fbdev/clps711x-fb.c b/drivers/video/fbdev/clps711x-fb.c
index 9e3df1df5ac4..5e61a349a4ab 100644
--- a/drivers/video/fbdev/clps711x-fb.c
+++ b/drivers/video/fbdev/clps711x-fb.c
@@ -368,7 +368,7 @@ static struct platform_driver clps711x_fb_driver = {
 		.of_match_table	= clps711x_fb_dt_ids,
 	},
 	.probe	= clps711x_fb_probe,
-	.remove_new = clps711x_fb_remove,
+	.remove	= clps711x_fb_remove,
 };
 module_platform_driver(clps711x_fb_driver);
 
diff --git a/drivers/video/fbdev/cobalt_lcdfb.c b/drivers/video/fbdev/cobalt_lcdfb.c
index c2b8f894799c..308967b5096a 100644
--- a/drivers/video/fbdev/cobalt_lcdfb.c
+++ b/drivers/video/fbdev/cobalt_lcdfb.c
@@ -344,7 +344,7 @@ static void cobalt_lcdfb_remove(struct platform_device *dev)
 
 static struct platform_driver cobalt_lcdfb_driver = {
 	.probe	= cobalt_lcdfb_probe,
-	.remove_new = cobalt_lcdfb_remove,
+	.remove	= cobalt_lcdfb_remove,
 	.driver	= {
 		.name	= "cobalt-lcd",
 	},
diff --git a/drivers/video/fbdev/da8xx-fb.c b/drivers/video/fbdev/da8xx-fb.c
index 4ca70a1bdd3b..fad1e13c6332 100644
--- a/drivers/video/fbdev/da8xx-fb.c
+++ b/drivers/video/fbdev/da8xx-fb.c
@@ -1652,7 +1652,7 @@ static SIMPLE_DEV_PM_OPS(fb_pm_ops, fb_suspend, fb_resume);
 
 static struct platform_driver da8xx_fb_driver = {
 	.probe = fb_probe,
-	.remove_new = fb_remove,
+	.remove = fb_remove,
 	.driver = {
 		   .name = DRIVER_NAME,
 		   .pm	= &fb_pm_ops,
diff --git a/drivers/video/fbdev/ep93xx-fb.c b/drivers/video/fbdev/ep93xx-fb.c
index 3e378874ccc7..801ef427f1ba 100644
--- a/drivers/video/fbdev/ep93xx-fb.c
+++ b/drivers/video/fbdev/ep93xx-fb.c
@@ -592,7 +592,7 @@ static void ep93xxfb_remove(struct platform_device *pdev)
 
 static struct platform_driver ep93xxfb_driver = {
 	.probe		= ep93xxfb_probe,
-	.remove_new	= ep93xxfb_remove,
+	.remove		= ep93xxfb_remove,
 	.driver = {
 		.name	= "ep93xx-fb",
 	},
diff --git a/drivers/video/fbdev/ffb.c b/drivers/video/fbdev/ffb.c
index 2a0f5337e091..0b7e7b38c05a 100644
--- a/drivers/video/fbdev/ffb.c
+++ b/drivers/video/fbdev/ffb.c
@@ -1053,7 +1053,7 @@ static struct platform_driver ffb_driver = {
 		.of_match_table = ffb_match,
 	},
 	.probe		= ffb_probe,
-	.remove_new	= ffb_remove,
+	.remove		= ffb_remove,
 };
 
 static int __init ffb_init(void)
diff --git a/drivers/video/fbdev/fsl-diu-fb.c b/drivers/video/fbdev/fsl-diu-fb.c
index ea37a60da10c..5ac8201c3533 100644
--- a/drivers/video/fbdev/fsl-diu-fb.c
+++ b/drivers/video/fbdev/fsl-diu-fb.c
@@ -1876,12 +1876,12 @@ static const struct of_device_id fsl_diu_match[] = {
 MODULE_DEVICE_TABLE(of, fsl_diu_match);
 
 static struct platform_driver fsl_diu_driver = {
-	.driver = {
+	.driver		= {
 		.name = "fsl-diu-fb",
 		.of_match_table = fsl_diu_match,
 	},
-	.probe  	= fsl_diu_probe,
-	.remove_new 	= fsl_diu_remove,
+	.probe		= fsl_diu_probe,
+	.remove		= fsl_diu_remove,
 	.suspend	= fsl_diu_suspend,
 	.resume		= fsl_diu_resume,
 };
diff --git a/drivers/video/fbdev/gbefb.c b/drivers/video/fbdev/gbefb.c
index 8463de833d1e..4c36a3e409be 100644
--- a/drivers/video/fbdev/gbefb.c
+++ b/drivers/video/fbdev/gbefb.c
@@ -1247,10 +1247,10 @@ static void gbefb_remove(struct platform_device* p_dev)
 
 static struct platform_driver gbefb_driver = {
 	.probe = gbefb_probe,
-	.remove_new = gbefb_remove,
-	.driver	= {
+	.remove = gbefb_remove,
+	.driver = {
 		.name = "gbefb",
-		.dev_groups	= gbefb_groups,
+		.dev_groups = gbefb_groups,
 	},
 };
 
diff --git a/drivers/video/fbdev/goldfishfb.c b/drivers/video/fbdev/goldfishfb.c
index 5f8de1ec23c3..7704f2ab18c0 100644
--- a/drivers/video/fbdev/goldfishfb.c
+++ b/drivers/video/fbdev/goldfishfb.c
@@ -311,7 +311,7 @@ MODULE_DEVICE_TABLE(acpi, goldfish_fb_acpi_match);
 
 static struct platform_driver goldfish_fb_driver = {
 	.probe		= goldfish_fb_probe,
-	.remove_new	= goldfish_fb_remove,
+	.remove		= goldfish_fb_remove,
 	.driver = {
 		.name = "goldfish_fb",
 		.of_match_table = goldfish_fb_of_match,
diff --git a/drivers/video/fbdev/grvga.c b/drivers/video/fbdev/grvga.c
index 6d917e06e5f3..de8ab817d406 100644
--- a/drivers/video/fbdev/grvga.c
+++ b/drivers/video/fbdev/grvga.c
@@ -540,7 +540,7 @@ static struct platform_driver grvga_driver = {
 		.of_match_table = svgactrl_of_match,
 	},
 	.probe		= grvga_probe,
-	.remove_new	= grvga_remove,
+	.remove		= grvga_remove,
 };
 
 module_platform_driver(grvga_driver);
diff --git a/drivers/video/fbdev/hecubafb.c b/drivers/video/fbdev/hecubafb.c
index ef526ed4a2d9..3547d58a29cf 100644
--- a/drivers/video/fbdev/hecubafb.c
+++ b/drivers/video/fbdev/hecubafb.c
@@ -235,7 +235,7 @@ static void hecubafb_remove(struct platform_device *dev)
 
 static struct platform_driver hecubafb_driver = {
 	.probe	= hecubafb_probe,
-	.remove_new = hecubafb_remove,
+	.remove	= hecubafb_remove,
 	.driver	= {
 		.name	= "hecubafb",
 	},
diff --git a/drivers/video/fbdev/hgafb.c b/drivers/video/fbdev/hgafb.c
index c3bc5b78b749..14418aa3791a 100644
--- a/drivers/video/fbdev/hgafb.c
+++ b/drivers/video/fbdev/hgafb.c
@@ -629,7 +629,7 @@ static void hgafb_remove(struct platform_device *pdev)
 
 static struct platform_driver hgafb_driver = {
 	.probe = hgafb_probe,
-	.remove_new = hgafb_remove,
+	.remove = hgafb_remove,
 	.driver = {
 		.name = "hgafb",
 	},
diff --git a/drivers/video/fbdev/hitfb.c b/drivers/video/fbdev/hitfb.c
index b64b74b76c71..97db325df2b4 100644
--- a/drivers/video/fbdev/hitfb.c
+++ b/drivers/video/fbdev/hitfb.c
@@ -476,7 +476,7 @@ static const struct dev_pm_ops hitfb_dev_pm_ops = {
 
 static struct platform_driver hitfb_driver = {
 	.probe		= hitfb_probe,
-	.remove_new	= hitfb_remove,
+	.remove		= hitfb_remove,
 	.driver		= {
 		.name	= "hitfb",
 		.pm	= &hitfb_dev_pm_ops,
diff --git a/drivers/video/fbdev/imxfb.c b/drivers/video/fbdev/imxfb.c
index 97466e0c5877..f30da32cdaed 100644
--- a/drivers/video/fbdev/imxfb.c
+++ b/drivers/video/fbdev/imxfb.c
@@ -1095,7 +1095,7 @@ static struct platform_driver imxfb_driver = {
 		.pm	= pm_sleep_ptr(&imxfb_pm_ops),
 	},
 	.probe		= imxfb_probe,
-	.remove_new	= imxfb_remove,
+	.remove		= imxfb_remove,
 	.id_table	= imxfb_devtype,
 };
 module_platform_driver(imxfb_driver);
diff --git a/drivers/video/fbdev/leo.c b/drivers/video/fbdev/leo.c
index 7cf525c76079..271e2e8c6a84 100644
--- a/drivers/video/fbdev/leo.c
+++ b/drivers/video/fbdev/leo.c
@@ -657,7 +657,7 @@ static struct platform_driver leo_driver = {
 		.of_match_table = leo_match,
 	},
 	.probe		= leo_probe,
-	.remove_new	= leo_remove,
+	.remove		= leo_remove,
 };
 
 static int __init leo_init(void)
diff --git a/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c b/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
index baec312d7b33..ade88e7bc760 100644
--- a/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
+++ b/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
@@ -834,7 +834,7 @@ static struct platform_driver of_platform_mb862xxfb_driver = {
 		.of_match_table = of_platform_mb862xx_tbl,
 	},
 	.probe		= of_platform_mb862xx_probe,
-	.remove_new	= of_platform_mb862xx_remove,
+	.remove		= of_platform_mb862xx_remove,
 };
 #endif
 
diff --git a/drivers/video/fbdev/metronomefb.c b/drivers/video/fbdev/metronomefb.c
index c15353a356b6..6f0942c6e5f1 100644
--- a/drivers/video/fbdev/metronomefb.c
+++ b/drivers/video/fbdev/metronomefb.c
@@ -707,7 +707,7 @@ static void metronomefb_remove(struct platform_device *dev)
 
 static struct platform_driver metronomefb_driver = {
 	.probe	= metronomefb_probe,
-	.remove_new = metronomefb_remove,
+	.remove	= metronomefb_remove,
 	.driver	= {
 		.name	= "metronomefb",
 	},
diff --git a/drivers/video/fbdev/ocfb.c b/drivers/video/fbdev/ocfb.c
index 7dc305c67af8..893888260c21 100644
--- a/drivers/video/fbdev/ocfb.c
+++ b/drivers/video/fbdev/ocfb.c
@@ -391,7 +391,7 @@ MODULE_DEVICE_TABLE(of, ocfb_match);
 
 static struct platform_driver ocfb_driver = {
 	.probe  = ocfb_probe,
-	.remove_new = ocfb_remove,
+	.remove = ocfb_remove,
 	.driver = {
 		.name = "ocfb_fb",
 		.of_match_table = ocfb_match,
diff --git a/drivers/video/fbdev/offb.c b/drivers/video/fbdev/offb.c
index e8ff33894603..f85428e13996 100644
--- a/drivers/video/fbdev/offb.c
+++ b/drivers/video/fbdev/offb.c
@@ -673,7 +673,7 @@ static struct platform_driver offb_driver_bootx_noscreen = {
 		.name = "bootx-noscreen",
 	},
 	.probe = offb_probe_bootx_noscreen,
-	.remove_new = offb_remove,
+	.remove = offb_remove,
 };
 
 static int offb_probe_display(struct platform_device *pdev)
@@ -695,7 +695,7 @@ static struct platform_driver offb_driver_display = {
 		.of_match_table = offb_of_match_display,
 	},
 	.probe = offb_probe_display,
-	.remove_new = offb_remove,
+	.remove = offb_remove,
 };
 
 static int __init offb_init(void)
diff --git a/drivers/video/fbdev/omap/omapfb_main.c b/drivers/video/fbdev/omap/omapfb_main.c
index e12c6019a4d6..2682b20d184a 100644
--- a/drivers/video/fbdev/omap/omapfb_main.c
+++ b/drivers/video/fbdev/omap/omapfb_main.c
@@ -1825,7 +1825,7 @@ static int omapfb_resume(struct platform_device *pdev)
 
 static struct platform_driver omapfb_driver = {
 	.probe		= omapfb_probe,
-	.remove_new	= omapfb_remove,
+	.remove		= omapfb_remove,
 	.suspend	= omapfb_suspend,
 	.resume		= omapfb_resume,
 	.driver		= {
diff --git a/drivers/video/fbdev/omap2/omapfb/displays/connector-analog-tv.c b/drivers/video/fbdev/omap2/omapfb/displays/connector-analog-tv.c
index c6786726a1af..cef1603b7530 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/connector-analog-tv.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/connector-analog-tv.c
@@ -245,7 +245,7 @@ MODULE_DEVICE_TABLE(of, tvc_of_match);
 
 static struct platform_driver tvc_connector_driver = {
 	.probe	= tvc_probe,
-	.remove_new = tvc_remove,
+	.remove	= tvc_remove,
 	.driver	= {
 		.name	= "connector-analog-tv",
 		.of_match_table = tvc_of_match,
diff --git a/drivers/video/fbdev/omap2/omapfb/displays/connector-dvi.c b/drivers/video/fbdev/omap2/omapfb/displays/connector-dvi.c
index 0cc9294f89b4..3f129ce9ff01 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/connector-dvi.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/connector-dvi.c
@@ -328,7 +328,7 @@ MODULE_DEVICE_TABLE(of, dvic_of_match);
 
 static struct platform_driver dvi_connector_driver = {
 	.probe	= dvic_probe,
-	.remove_new = dvic_remove,
+	.remove	= dvic_remove,
 	.driver	= {
 		.name	= "connector-dvi",
 		.of_match_table = dvic_of_match,
diff --git a/drivers/video/fbdev/omap2/omapfb/displays/connector-hdmi.c b/drivers/video/fbdev/omap2/omapfb/displays/connector-hdmi.c
index b862a32670ae..e3df731172e8 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/connector-hdmi.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/connector-hdmi.c
@@ -272,7 +272,7 @@ MODULE_DEVICE_TABLE(of, hdmic_of_match);
 
 static struct platform_driver hdmi_connector_driver = {
 	.probe	= hdmic_probe,
-	.remove_new = hdmic_remove,
+	.remove	= hdmic_remove,
 	.driver	= {
 		.name	= "connector-hdmi",
 		.of_match_table = hdmic_of_match,
diff --git a/drivers/video/fbdev/omap2/omapfb/displays/encoder-opa362.c b/drivers/video/fbdev/omap2/omapfb/displays/encoder-opa362.c
index f0d3eb581166..f4e7ed943b8a 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/encoder-opa362.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/encoder-opa362.c
@@ -258,7 +258,7 @@ MODULE_DEVICE_TABLE(of, opa362_of_match);
 
 static struct platform_driver opa362_driver = {
 	.probe	= opa362_probe,
-	.remove_new = opa362_remove,
+	.remove	= opa362_remove,
 	.driver	= {
 		.name	= "amplifier-opa362",
 		.of_match_table = opa362_of_match,
diff --git a/drivers/video/fbdev/omap2/omapfb/displays/encoder-tfp410.c b/drivers/video/fbdev/omap2/omapfb/displays/encoder-tfp410.c
index c8aca4592949..458e65771cbb 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/encoder-tfp410.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/encoder-tfp410.c
@@ -245,7 +245,7 @@ MODULE_DEVICE_TABLE(of, tfp410_of_match);
 
 static struct platform_driver tfp410_driver = {
 	.probe	= tfp410_probe,
-	.remove_new = tfp410_remove,
+	.remove	= tfp410_remove,
 	.driver	= {
 		.name	= "tfp410",
 		.of_match_table = tfp410_of_match,
diff --git a/drivers/video/fbdev/omap2/omapfb/displays/encoder-tpd12s015.c b/drivers/video/fbdev/omap2/omapfb/displays/encoder-tpd12s015.c
index eb3926d0361b..8cf0cb922f3c 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/encoder-tpd12s015.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/encoder-tpd12s015.c
@@ -311,7 +311,7 @@ MODULE_DEVICE_TABLE(of, tpd_of_match);
 
 static struct platform_driver tpd_driver = {
 	.probe	= tpd_probe,
-	.remove_new = tpd_remove,
+	.remove	= tpd_remove,
 	.driver	= {
 		.name	= "tpd12s015",
 		.of_match_table = tpd_of_match,
diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-dpi.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-dpi.c
index 937f9091274f..22f4262b2432 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/panel-dpi.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-dpi.c
@@ -234,7 +234,7 @@ MODULE_DEVICE_TABLE(of, panel_dpi_of_match);
 
 static struct platform_driver panel_dpi_driver = {
 	.probe = panel_dpi_probe,
-	.remove_new = panel_dpi_remove,
+	.remove = panel_dpi_remove,
 	.driver = {
 		.name = "panel-dpi",
 		.of_match_table = panel_dpi_of_match,
diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c
index 35ed1b2db993..1d75f27c6b80 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c
@@ -1275,7 +1275,7 @@ MODULE_DEVICE_TABLE(of, dsicm_of_match);
 
 static struct platform_driver dsicm_driver = {
 	.probe = dsicm_probe,
-	.remove_new = dsicm_remove,
+	.remove = dsicm_remove,
 	.driver = {
 		.name = "panel-dsi-cm",
 		.of_match_table = dsicm_of_match,
diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-sharp-ls037v7dw01.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-sharp-ls037v7dw01.c
index e37268cf8dca..888d94ea8e7d 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/panel-sharp-ls037v7dw01.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-sharp-ls037v7dw01.c
@@ -315,7 +315,7 @@ MODULE_DEVICE_TABLE(of, sharp_ls_of_match);
 
 static struct platform_driver sharp_ls_driver = {
 	.probe = sharp_ls_probe,
-	.remove_new = sharp_ls_remove,
+	.remove = sharp_ls_remove,
 	.driver = {
 		.name = "panel-sharp-ls037v7dw01",
 		.of_match_table = sharp_ls_of_match,
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/core.c b/drivers/video/fbdev/omap2/omapfb/dss/core.c
index 5fbd8885bad8..55b640f2f245 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/core.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/core.c
@@ -185,10 +185,10 @@ static void omap_dss_shutdown(struct platform_device *pdev)
 }
 
 static struct platform_driver omap_dss_driver = {
-	.remove_new     = omap_dss_remove,
+	.remove		= omap_dss_remove,
 	.shutdown	= omap_dss_shutdown,
-	.driver         = {
-		.name   = "omapdss",
+	.driver		= {
+		.name	= "omapdss",
 	},
 };
 
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dispc.c b/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
index 21fef9db90d2..5832485ab998 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
@@ -4072,7 +4072,7 @@ static const struct of_device_id dispc_of_match[] = {
 
 static struct platform_driver omap_dispchw_driver = {
 	.probe		= dispc_probe,
-	.remove_new     = dispc_remove,
+	.remove         = dispc_remove,
 	.driver         = {
 		.name   = "omapdss_dispc",
 		.pm	= &dispc_pm_ops,
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dpi.c b/drivers/video/fbdev/omap2/omapfb/dss/dpi.c
index 7c1b7d89389a..c40b87ffe8fc 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dpi.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dpi.c
@@ -817,8 +817,8 @@ static void dpi_remove(struct platform_device *pdev)
 
 static struct platform_driver omap_dpi_driver = {
 	.probe		= dpi_probe,
-	.remove_new	= dpi_remove,
-	.driver         = {
+	.remove		= dpi_remove,
+	.driver		= {
 		.name   = "omapdss_dpi",
 		.suppress_bind_attrs = true,
 	},
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c b/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
index 1f13bcf73da5..1f3434c040c1 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
@@ -5565,7 +5565,7 @@ static const struct of_device_id dsi_of_match[] = {
 
 static struct platform_driver omap_dsihw_driver = {
 	.probe		= dsi_probe,
-	.remove_new	= dsi_remove,
+	.remove		= dsi_remove,
 	.driver         = {
 		.name   = "omapdss_dsi",
 		.pm	= &dsi_pm_ops,
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss.c b/drivers/video/fbdev/omap2/omapfb/dss/dss.c
index d814e4baa4b3..f06debee02c5 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dss.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dss.c
@@ -1278,7 +1278,7 @@ MODULE_DEVICE_TABLE(of, dss_of_match);
 
 static struct platform_driver omap_dsshw_driver = {
 	.probe		= dss_probe,
-	.remove_new	= dss_remove,
+	.remove		= dss_remove,
 	.driver         = {
 		.name   = "omapdss_dss",
 		.pm	= &dss_pm_ops,
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c b/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
index 8f407ec134dc..428001fd4ac9 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
@@ -792,9 +792,9 @@ static const struct of_device_id hdmi_of_match[] = {
 
 static struct platform_driver omapdss_hdmihw_driver = {
 	.probe		= hdmi4_probe,
-	.remove_new	= hdmi4_remove,
-	.driver         = {
-		.name   = "omapdss_hdmi",
+	.remove		= hdmi4_remove,
+	.driver		= {
+		.name	= "omapdss_hdmi",
 		.pm	= &hdmi_pm_ops,
 		.of_match_table = hdmi_of_match,
 		.suppress_bind_attrs = true,
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c b/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c
index 4ad219f522b9..aa052805050e 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c
@@ -834,7 +834,7 @@ static const struct of_device_id hdmi_of_match[] = {
 
 static struct platform_driver omapdss_hdmihw_driver = {
 	.probe		= hdmi5_probe,
-	.remove_new	= hdmi5_remove,
+	.remove		= hdmi5_remove,
 	.driver         = {
 		.name   = "omapdss_hdmi5",
 		.pm	= &hdmi_pm_ops,
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/sdi.c b/drivers/video/fbdev/omap2/omapfb/dss/sdi.c
index d527931b2b16..2a45f019ef45 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/sdi.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/sdi.c
@@ -382,9 +382,9 @@ static void sdi_remove(struct platform_device *pdev)
 
 static struct platform_driver omap_sdi_driver = {
 	.probe		= sdi_probe,
-	.remove_new     = sdi_remove,
-	.driver         = {
-		.name   = "omapdss_sdi",
+	.remove		= sdi_remove,
+	.driver		= {
+		.name	= "omapdss_sdi",
 		.suppress_bind_attrs = true,
 	},
 };
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/venc.c b/drivers/video/fbdev/omap2/omapfb/dss/venc.c
index d13ad00d353b..f99dda9e55a5 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/venc.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/venc.c
@@ -920,9 +920,9 @@ static const struct of_device_id venc_of_match[] = {
 
 static struct platform_driver omap_venchw_driver = {
 	.probe		= venc_probe,
-	.remove_new	= venc_remove,
-	.driver         = {
-		.name   = "omapdss_venc",
+	.remove		= venc_remove,
+	.driver		= {
+		.name	= "omapdss_venc",
 		.pm	= &venc_pm_ops,
 		.of_match_table = venc_of_match,
 		.suppress_bind_attrs = true,
diff --git a/drivers/video/fbdev/omap2/omapfb/omapfb-main.c b/drivers/video/fbdev/omap2/omapfb/omapfb-main.c
index 0db9c55fce5a..211f23648686 100644
--- a/drivers/video/fbdev/omap2/omapfb/omapfb-main.c
+++ b/drivers/video/fbdev/omap2/omapfb/omapfb-main.c
@@ -2614,7 +2614,7 @@ static void omapfb_remove(struct platform_device *pdev)
 
 static struct platform_driver omapfb_driver = {
 	.probe		= omapfb_probe,
-	.remove_new     = omapfb_remove,
+	.remove         = omapfb_remove,
 	.driver         = {
 		.name   = "omapfb",
 	},
diff --git a/drivers/video/fbdev/p9100.c b/drivers/video/fbdev/p9100.c
index e1356f8a866e..124468f0e9ef 100644
--- a/drivers/video/fbdev/p9100.c
+++ b/drivers/video/fbdev/p9100.c
@@ -347,7 +347,7 @@ static struct platform_driver p9100_driver = {
 		.of_match_table = p9100_match,
 	},
 	.probe		= p9100_probe,
-	.remove_new	= p9100_remove,
+	.remove		= p9100_remove,
 };
 
 static int __init p9100_init(void)
diff --git a/drivers/video/fbdev/platinumfb.c b/drivers/video/fbdev/platinumfb.c
index cb6fcc64c8e2..a08d955d9b43 100644
--- a/drivers/video/fbdev/platinumfb.c
+++ b/drivers/video/fbdev/platinumfb.c
@@ -668,7 +668,7 @@ static struct platform_driver platinum_driver =
 		.of_match_table = platinumfb_match,
 	},
 	.probe		= platinumfb_probe,
-	.remove_new	= platinumfb_remove,
+	.remove		= platinumfb_remove,
 };
 
 static int __init platinumfb_init(void)
diff --git a/drivers/video/fbdev/pxa168fb.c b/drivers/video/fbdev/pxa168fb.c
index adee34386580..ec602f7776eb 100644
--- a/drivers/video/fbdev/pxa168fb.c
+++ b/drivers/video/fbdev/pxa168fb.c
@@ -799,7 +799,7 @@ static struct platform_driver pxa168fb_driver = {
 		.name	= "pxa168-fb",
 	},
 	.probe		= pxa168fb_probe,
-	.remove_new	= pxa168fb_remove,
+	.remove		= pxa168fb_remove,
 };
 
 module_platform_driver(pxa168fb_driver);
diff --git a/drivers/video/fbdev/pxa3xx-gcu.c b/drivers/video/fbdev/pxa3xx-gcu.c
index 489088b4e467..4a78b387b343 100644
--- a/drivers/video/fbdev/pxa3xx-gcu.c
+++ b/drivers/video/fbdev/pxa3xx-gcu.c
@@ -696,10 +696,10 @@ MODULE_DEVICE_TABLE(of, pxa3xx_gcu_of_match);
 #endif
 
 static struct platform_driver pxa3xx_gcu_driver = {
-	.probe	  = pxa3xx_gcu_probe,
-	.remove_new	 = pxa3xx_gcu_remove,
-	.driver	 = {
-		.name   = DRV_NAME,
+	.probe = pxa3xx_gcu_probe,
+	.remove = pxa3xx_gcu_remove,
+	.driver = {
+		.name = DRV_NAME,
 		.of_match_table = of_match_ptr(pxa3xx_gcu_of_match),
 	},
 };
diff --git a/drivers/video/fbdev/pxafb.c b/drivers/video/fbdev/pxafb.c
index 5ce02495cda6..4aa84853e31a 100644
--- a/drivers/video/fbdev/pxafb.c
+++ b/drivers/video/fbdev/pxafb.c
@@ -2427,7 +2427,7 @@ MODULE_DEVICE_TABLE(of, pxafb_of_dev_id);
 
 static struct platform_driver pxafb_driver = {
 	.probe		= pxafb_probe,
-	.remove_new 	= pxafb_remove,
+	.remove		= pxafb_remove,
 	.driver		= {
 		.name	= "pxa2xx-fb",
 		.of_match_table = pxafb_of_dev_id,
diff --git a/drivers/video/fbdev/s1d13xxxfb.c b/drivers/video/fbdev/s1d13xxxfb.c
index 0e871197c6de..e80c806ef520 100644
--- a/drivers/video/fbdev/s1d13xxxfb.c
+++ b/drivers/video/fbdev/s1d13xxxfb.c
@@ -1001,7 +1001,7 @@ static int s1d13xxxfb_resume(struct platform_device *dev)
 
 static struct platform_driver s1d13xxxfb_driver = {
 	.probe		= s1d13xxxfb_probe,
-	.remove_new	= s1d13xxxfb_remove,
+	.remove		= s1d13xxxfb_remove,
 #ifdef CONFIG_PM
 	.suspend	= s1d13xxxfb_suspend,
 	.resume		= s1d13xxxfb_resume,
diff --git a/drivers/video/fbdev/s3c-fb.c b/drivers/video/fbdev/s3c-fb.c
index 2b85aad6a304..2f4d707e2e09 100644
--- a/drivers/video/fbdev/s3c-fb.c
+++ b/drivers/video/fbdev/s3c-fb.c
@@ -1789,7 +1789,7 @@ static const struct dev_pm_ops s3cfb_pm_ops = {
 
 static struct platform_driver s3c_fb_driver = {
 	.probe		= s3c_fb_probe,
-	.remove_new	= s3c_fb_remove,
+	.remove		= s3c_fb_remove,
 	.id_table	= s3c_fb_driver_ids,
 	.driver		= {
 		.name	= "s3c-fb",
diff --git a/drivers/video/fbdev/sh7760fb.c b/drivers/video/fbdev/sh7760fb.c
index 08a4943dc541..3d2a27fefc87 100644
--- a/drivers/video/fbdev/sh7760fb.c
+++ b/drivers/video/fbdev/sh7760fb.c
@@ -575,7 +575,7 @@ static struct platform_driver sh7760_lcdc_driver = {
 		   .name = "sh7760-lcdc",
 		   },
 	.probe = sh7760fb_probe,
-	.remove_new = sh7760fb_remove,
+	.remove = sh7760fb_remove,
 };
 
 module_platform_driver(sh7760_lcdc_driver);
diff --git a/drivers/video/fbdev/sh_mobile_lcdcfb.c b/drivers/video/fbdev/sh_mobile_lcdcfb.c
index fcc1446ae746..935cd8413ed5 100644
--- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
+++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
@@ -2648,7 +2648,7 @@ static struct platform_driver sh_mobile_lcdc_driver = {
 		.pm		= &sh_mobile_lcdc_dev_pm_ops,
 	},
 	.probe		= sh_mobile_lcdc_probe,
-	.remove_new	= sh_mobile_lcdc_remove,
+	.remove		= sh_mobile_lcdc_remove,
 };
 
 module_platform_driver(sh_mobile_lcdc_driver);
diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
index 028a56525047..be95fcddce4c 100644
--- a/drivers/video/fbdev/simplefb.c
+++ b/drivers/video/fbdev/simplefb.c
@@ -677,7 +677,7 @@ static struct platform_driver simplefb_driver = {
 		.of_match_table = simplefb_of_match,
 	},
 	.probe = simplefb_probe,
-	.remove_new = simplefb_remove,
+	.remove = simplefb_remove,
 };
 
 module_platform_driver(simplefb_driver);
diff --git a/drivers/video/fbdev/sm501fb.c b/drivers/video/fbdev/sm501fb.c
index d6fdc1737cd2..86ecbb2d86db 100644
--- a/drivers/video/fbdev/sm501fb.c
+++ b/drivers/video/fbdev/sm501fb.c
@@ -2211,7 +2211,7 @@ static int sm501fb_resume(struct platform_device *pdev)
 
 static struct platform_driver sm501fb_driver = {
 	.probe		= sm501fb_probe,
-	.remove_new	= sm501fb_remove,
+	.remove		= sm501fb_remove,
 	.suspend	= sm501fb_suspend,
 	.resume		= sm501fb_resume,
 	.driver		= {
diff --git a/drivers/video/fbdev/tcx.c b/drivers/video/fbdev/tcx.c
index fe7b7bc77eda..6eb8bb2e3501 100644
--- a/drivers/video/fbdev/tcx.c
+++ b/drivers/video/fbdev/tcx.c
@@ -505,7 +505,7 @@ static struct platform_driver tcx_driver = {
 		.of_match_table = tcx_match,
 	},
 	.probe		= tcx_probe,
-	.remove_new	= tcx_remove,
+	.remove		= tcx_remove,
 };
 
 static int __init tcx_init(void)
diff --git a/drivers/video/fbdev/uvesafb.c b/drivers/video/fbdev/uvesafb.c
index 2a88f0d4a84c..5d52fd00806e 100644
--- a/drivers/video/fbdev/uvesafb.c
+++ b/drivers/video/fbdev/uvesafb.c
@@ -1794,7 +1794,7 @@ static void uvesafb_remove(struct platform_device *dev)
 
 static struct platform_driver uvesafb_driver = {
 	.probe  = uvesafb_probe,
-	.remove_new = uvesafb_remove,
+	.remove = uvesafb_remove,
 	.driver = {
 		.name = "uvesafb",
 	},
diff --git a/drivers/video/fbdev/vesafb.c b/drivers/video/fbdev/vesafb.c
index 5a161750a3ae..a81df8865143 100644
--- a/drivers/video/fbdev/vesafb.c
+++ b/drivers/video/fbdev/vesafb.c
@@ -515,7 +515,7 @@ static struct platform_driver vesafb_driver = {
 		.name = "vesa-framebuffer",
 	},
 	.probe = vesafb_probe,
-	.remove_new = vesafb_remove,
+	.remove = vesafb_remove,
 };
 
 module_platform_driver(vesafb_driver);
diff --git a/drivers/video/fbdev/vfb.c b/drivers/video/fbdev/vfb.c
index 158e48385c24..5b7965f36c5e 100644
--- a/drivers/video/fbdev/vfb.c
+++ b/drivers/video/fbdev/vfb.c
@@ -493,7 +493,7 @@ static void vfb_remove(struct platform_device *dev)
 
 static struct platform_driver vfb_driver = {
 	.probe	= vfb_probe,
-	.remove_new = vfb_remove,
+	.remove = vfb_remove,
 	.driver = {
 		.name	= "vfb",
 	},
diff --git a/drivers/video/fbdev/vga16fb.c b/drivers/video/fbdev/vga16fb.c
index a87bafbb119c..fce0f5db7ba3 100644
--- a/drivers/video/fbdev/vga16fb.c
+++ b/drivers/video/fbdev/vga16fb.c
@@ -1417,7 +1417,7 @@ MODULE_DEVICE_TABLE(platform, vga16fb_driver_id_table);
 
 static struct platform_driver vga16fb_driver = {
 	.probe = vga16fb_probe,
-	.remove_new = vga16fb_remove,
+	.remove = vga16fb_remove,
 	.driver = {
 		.name = "vga16fb",
 	},
diff --git a/drivers/video/fbdev/via/via-gpio.c b/drivers/video/fbdev/via/via-gpio.c
index 2719943c06f4..9577c2cd52c7 100644
--- a/drivers/video/fbdev/via/via-gpio.c
+++ b/drivers/video/fbdev/via/via-gpio.c
@@ -292,7 +292,7 @@ static struct platform_driver via_gpio_driver = {
 		.name = "viafb-gpio",
 	},
 	.probe = viafb_gpio_probe,
-	.remove_new = viafb_gpio_remove,
+	.remove = viafb_gpio_remove,
 };
 
 int viafb_gpio_init(void)
diff --git a/drivers/video/fbdev/via/via_i2c.c b/drivers/video/fbdev/via/via_i2c.c
index 5edd3827ca27..cdbd7a9b8817 100644
--- a/drivers/video/fbdev/via/via_i2c.c
+++ b/drivers/video/fbdev/via/via_i2c.c
@@ -265,7 +265,7 @@ static struct platform_driver via_i2c_driver = {
 		.name = "viafb-i2c",
 	},
 	.probe = viafb_i2c_probe,
-	.remove_new = viafb_i2c_remove,
+	.remove = viafb_i2c_remove,
 };
 
 int viafb_i2c_init(void)
diff --git a/drivers/video/fbdev/vt8500lcdfb.c b/drivers/video/fbdev/vt8500lcdfb.c
index ac73937073a7..b08a6fdc53fd 100644
--- a/drivers/video/fbdev/vt8500lcdfb.c
+++ b/drivers/video/fbdev/vt8500lcdfb.c
@@ -471,7 +471,7 @@ static const struct of_device_id via_dt_ids[] = {
 
 static struct platform_driver vt8500lcd_driver = {
 	.probe		= vt8500lcd_probe,
-	.remove_new	= vt8500lcd_remove,
+	.remove		= vt8500lcd_remove,
 	.driver		= {
 		.name	= "vt8500-lcd",
 		.of_match_table = of_match_ptr(via_dt_ids),
diff --git a/drivers/video/fbdev/wm8505fb.c b/drivers/video/fbdev/wm8505fb.c
index 00952e9c8802..5caf74ca92fb 100644
--- a/drivers/video/fbdev/wm8505fb.c
+++ b/drivers/video/fbdev/wm8505fb.c
@@ -392,7 +392,7 @@ static const struct of_device_id wmt_dt_ids[] = {
 
 static struct platform_driver wm8505fb_driver = {
 	.probe		= wm8505fb_probe,
-	.remove_new	= wm8505fb_remove,
+	.remove		= wm8505fb_remove,
 	.driver		= {
 		.name	= DRIVER_NAME,
 		.of_match_table = wmt_dt_ids,
diff --git a/drivers/video/fbdev/wmt_ge_rops.c b/drivers/video/fbdev/wmt_ge_rops.c
index b70961901683..69106299ab47 100644
--- a/drivers/video/fbdev/wmt_ge_rops.c
+++ b/drivers/video/fbdev/wmt_ge_rops.c
@@ -159,7 +159,7 @@ static const struct of_device_id wmt_dt_ids[] = {
 
 static struct platform_driver wmt_ge_rops_driver = {
 	.probe		= wmt_ge_rops_probe,
-	.remove_new	= wmt_ge_rops_remove,
+	.remove		= wmt_ge_rops_remove,
 	.driver		= {
 		.name	= "wmt_ge_rops",
 		.of_match_table = wmt_dt_ids,
diff --git a/drivers/video/fbdev/xilinxfb.c b/drivers/video/fbdev/xilinxfb.c
index 33d20910cb41..0a6e05cd155a 100644
--- a/drivers/video/fbdev/xilinxfb.c
+++ b/drivers/video/fbdev/xilinxfb.c
@@ -488,7 +488,7 @@ MODULE_DEVICE_TABLE(of, xilinxfb_of_match);
 
 static struct platform_driver xilinxfb_of_driver = {
 	.probe = xilinxfb_of_probe,
-	.remove_new = xilinxfb_of_remove,
+	.remove = xilinxfb_of_remove,
 	.driver = {
 		.name = DRIVER_NAME,
 		.of_match_table = xilinxfb_of_match,

base-commit: 58ca61c1a866bfdaa5e19fb19a2416764f847d75
-- 
2.45.2

