Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 111F79C2EE4
	for <lists+dri-devel@lfdr.de>; Sat,  9 Nov 2024 18:47:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00ED110E093;
	Sat,  9 Nov 2024 17:47:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Cyz3bfWU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B572010E2BD
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Nov 2024 17:47:24 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-5ceca7df7f0so3883995a12.1
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Nov 2024 09:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1731174442; x=1731779242;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mS9pz7F1aaDN/ZOdRUw2lCD3EzMHHJ9M85Tk+LBqBLI=;
 b=Cyz3bfWUmbfUFLwMkwtTtO3VzqmAZimKaRS9FLT0XZOGHbgtcpHbCJmJEzNnW+v+Q5
 YKj/3ywooICJs2WfpvUQ0dbTJ2ZKi4E8t3n18EHrRnqMjvNR2Vlz64ggRjjdUSZIAlrd
 v3ghqZoPe9nraFLw4OYEpXYoXWbB2VbtFxvDef0CxB0MMGZUx6T3QdUlcjbFe/q7sybC
 TKAosHKfL+xBlF8TZ3v8c9m3A7mM4TQJynl8oKSqaDvUnCx76OseJUinBhNYu8gtMLNj
 fpAmtwfZCu09OLmDsYsYnJBOT9sYR7ycr+h4GHlmZ2pMlOO8gp7i3STfLp7CVuDZM+2e
 Y14w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731174442; x=1731779242;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mS9pz7F1aaDN/ZOdRUw2lCD3EzMHHJ9M85Tk+LBqBLI=;
 b=tV2u0q4kiJq9O/Cjc/gHn6A2A7jwX8ViAMS8aSQ5KpXYsTJbt2TdSj25Zsu2fuZ10R
 E6h0z1yzlnAJ53CoUyv5S/cv6BzFZIb9bXNqbndxV7fHKZsNCgdpmQgNCfEeV+r72e75
 AueU5OUdtizXltl4tJVPKKUDAwSu0OPYOqSD0j+uooW+G/9ef1Tlng3xpS3/SDdzF8FQ
 MFbgensWVeEAPi2Hk8tFIEn+TGHgKNF8/PIsOs1k7SqdBfoVQ9K7JIoPgDouhYOPZEUT
 2tFji447frb53Vp2RuQDi4GXmLVB52o7GNOkmHdjlupg1t/62n0B7AksRC9E8aPkJ0ZN
 sZ0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXS9WF/w+853I6IsKcWWfxfVC7K+oHzh5kb4CvwRR5MKbMhkN2BEJS2pm80XBkKcHxPvERI2MbEawg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7K0SyJjG2XypVtA3ikg/GLsD/gqq+Z4yrDzgx4/AeYFXeZ781
 giuuEOqtL/MptytwVB5xR9jU7LkjBMnVCnALfI4wMo+ZdcP3dkeK4R3gnxnfET4=
X-Google-Smtp-Source: AGHT+IGJCTMOIjftfGiK2wILQrVE69oNLiwz7mzb5YOsUCHt/S1Cp1slGT50grlnlMbHdWGpyNa4Cg==
X-Received: by 2002:a05:6402:5203:b0:5cb:6ca3:af96 with SMTP id
 4fb4d7f45d1cf-5cf0a3245camr5846634a12.19.1731174442127; 
 Sat, 09 Nov 2024 09:47:22 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf03bb7530sm3155853a12.43.2024.11.09.09.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2024 09:47:20 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Cc: Michael Hennerich <michael.hennerich@analog.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH] backlight: Switch back to struct platform_driver::remove()
Date: Sat,  9 Nov 2024 18:47:10 +0100
Message-ID: <20241109174710.292128-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=8119;
 i=u.kleine-koenig@baylibre.com; h=from:subject;
 bh=E2geTdbXiQmLaAty8/2EMgECF6diNU8eKtMXb4ZB/kM=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnL6Afi/iMzSDb+OigQAp+L7XwwVJGKjDySz/NY
 fOeD6CGpd2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZy+gHwAKCRCPgPtYfRL+
 ThzhB/sGt+oJ4HQwFpd3iQmQbVXTZGNqc/ag8Kv0rc6jUt1eEG9M5LKySpZneqakogzueVU12Aa
 9N0pkYhmrph8F9iskLUhrowJwEHPzvNF4d+iGb9bPMs9eqPDf03T05qiQNDtdviMl8AA8CViwX9
 ksWE4uE5+HNIPq9mW0fMoOhukaYrROQ0dpkv8cEOIp91zyifjxlRL9RVU4qXAQqZ0wLZgDTXeiL
 ePV5Bn6e4r/pjQsX4kwvMKRoIvRrKEEq5+d1+/uVFQktjYLUDsntM8jr2fYt3llq/zxho1zr8vY
 MSJV4DO3Jt/OSOYcuWtM3vsFxpQBOF0yE6jwqCrXNEsStJGm
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

Convert all platform drivers below drivers/backlight to use .remove(),
with the eventual goal to drop struct platform_driver::remove_new(). As
.remove() and .remove_new() have the same prototypes, conversion is done
by just changing the structure member name in the driver initializer.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

I did a single patch for all of drivers/video/backlight. While I usually
prefer to do one logical change per patch, this seems to be
overengineering here as the individual changes are really trivial and
shouldn't be much in the way for stable backports. But I'll happily
split the patch if you prefer it split. Also if you object the
indentation stuff, I can rework that.

This is based on yesterday's next, if conflicts arise when you apply it
at some later time and don't want to resolve them, feel free to just
drop the changes to the conflicting files. I'll notice and followup at a
later time then. Or ask me for a fixed resend. (Having said that, I
recommend b4 am -3 + git am -3 which should resolve most conflicts just
fine.)

Best regards
Uwe

 drivers/video/backlight/aat2870_bl.c         | 2 +-
 drivers/video/backlight/adp5520_bl.c         | 2 +-
 drivers/video/backlight/da9052_bl.c          | 2 +-
 drivers/video/backlight/hp680_bl.c           | 2 +-
 drivers/video/backlight/led_bl.c             | 2 +-
 drivers/video/backlight/lm3533_bl.c          | 2 +-
 drivers/video/backlight/lp8788_bl.c          | 2 +-
 drivers/video/backlight/mt6370-backlight.c   | 2 +-
 drivers/video/backlight/pwm_bl.c             | 2 +-
 drivers/video/backlight/qcom-wled.c          | 2 +-
 drivers/video/backlight/rt4831-backlight.c   | 2 +-
 drivers/video/backlight/sky81452-backlight.c | 2 +-
 12 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/video/backlight/aat2870_bl.c b/drivers/video/backlight/aat2870_bl.c
index 68d327ee4b2e..8b790df1e842 100644
--- a/drivers/video/backlight/aat2870_bl.c
+++ b/drivers/video/backlight/aat2870_bl.c
@@ -186,7 +186,7 @@ static struct platform_driver aat2870_bl_driver = {
 		.name	= "aat2870-backlight",
 	},
 	.probe		= aat2870_bl_probe,
-	.remove_new	= aat2870_bl_remove,
+	.remove		= aat2870_bl_remove,
 };
 
 static int __init aat2870_bl_init(void)
diff --git a/drivers/video/backlight/adp5520_bl.c b/drivers/video/backlight/adp5520_bl.c
index 8e0e9cfe5fe9..aa5c15e8db86 100644
--- a/drivers/video/backlight/adp5520_bl.c
+++ b/drivers/video/backlight/adp5520_bl.c
@@ -375,7 +375,7 @@ static struct platform_driver adp5520_bl_driver = {
 		.pm	= &adp5520_bl_pm_ops,
 	},
 	.probe		= adp5520_bl_probe,
-	.remove_new	= adp5520_bl_remove,
+	.remove		= adp5520_bl_remove,
 };
 
 module_platform_driver(adp5520_bl_driver);
diff --git a/drivers/video/backlight/da9052_bl.c b/drivers/video/backlight/da9052_bl.c
index b8ff7046510e..5e13ef96b717 100644
--- a/drivers/video/backlight/da9052_bl.c
+++ b/drivers/video/backlight/da9052_bl.c
@@ -165,7 +165,7 @@ MODULE_DEVICE_TABLE(platform, da9052_wled_ids);
 
 static struct platform_driver da9052_wled_driver = {
 	.probe		= da9052_backlight_probe,
-	.remove_new	= da9052_backlight_remove,
+	.remove		= da9052_backlight_remove,
 	.id_table	= da9052_wled_ids,
 	.driver	= {
 		.name	= "da9052-wled",
diff --git a/drivers/video/backlight/hp680_bl.c b/drivers/video/backlight/hp680_bl.c
index ddb7ab4df77e..fa9a983533b2 100644
--- a/drivers/video/backlight/hp680_bl.c
+++ b/drivers/video/backlight/hp680_bl.c
@@ -130,7 +130,7 @@ static void hp680bl_remove(struct platform_device *pdev)
 
 static struct platform_driver hp680bl_driver = {
 	.probe		= hp680bl_probe,
-	.remove_new	= hp680bl_remove,
+	.remove		= hp680bl_remove,
 	.driver		= {
 		.name	= "hp680-bl",
 		.pm	= &hp680bl_pm_ops,
diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
index c7aefcd6e4e3..ae34d1ecbfbe 100644
--- a/drivers/video/backlight/led_bl.c
+++ b/drivers/video/backlight/led_bl.c
@@ -246,7 +246,7 @@ static struct platform_driver led_bl_driver = {
 		.of_match_table	= led_bl_of_match,
 	},
 	.probe		= led_bl_probe,
-	.remove_new	= led_bl_remove,
+	.remove		= led_bl_remove,
 };
 
 module_platform_driver(led_bl_driver);
diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backlight/lm3533_bl.c
index 5d06f8ca976c..babfd3ceec86 100644
--- a/drivers/video/backlight/lm3533_bl.c
+++ b/drivers/video/backlight/lm3533_bl.c
@@ -387,7 +387,7 @@ static struct platform_driver lm3533_bl_driver = {
 		.pm	= &lm3533_bl_pm_ops,
 	},
 	.probe		= lm3533_bl_probe,
-	.remove_new	= lm3533_bl_remove,
+	.remove		= lm3533_bl_remove,
 	.shutdown	= lm3533_bl_shutdown,
 };
 module_platform_driver(lm3533_bl_driver);
diff --git a/drivers/video/backlight/lp8788_bl.c b/drivers/video/backlight/lp8788_bl.c
index 0b7663519fa5..f61a64905a02 100644
--- a/drivers/video/backlight/lp8788_bl.c
+++ b/drivers/video/backlight/lp8788_bl.c
@@ -177,7 +177,7 @@ static void lp8788_backlight_remove(struct platform_device *pdev)
 
 static struct platform_driver lp8788_bl_driver = {
 	.probe = lp8788_backlight_probe,
-	.remove_new = lp8788_backlight_remove,
+	.remove = lp8788_backlight_remove,
 	.driver = {
 		.name = LP8788_DEV_BACKLIGHT,
 	},
diff --git a/drivers/video/backlight/mt6370-backlight.c b/drivers/video/backlight/mt6370-backlight.c
index 94422c956453..e55f26888d0f 100644
--- a/drivers/video/backlight/mt6370-backlight.c
+++ b/drivers/video/backlight/mt6370-backlight.c
@@ -340,7 +340,7 @@ static struct platform_driver mt6370_bl_driver = {
 		.of_match_table = mt6370_bl_of_match,
 	},
 	.probe = mt6370_bl_probe,
-	.remove_new = mt6370_bl_remove,
+	.remove = mt6370_bl_remove,
 };
 module_platform_driver(mt6370_bl_driver);
 
diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
index e942908d1275..237d3d3f3bb1 100644
--- a/drivers/video/backlight/pwm_bl.c
+++ b/drivers/video/backlight/pwm_bl.c
@@ -697,7 +697,7 @@ static struct platform_driver pwm_backlight_driver = {
 		.of_match_table	= of_match_ptr(pwm_backlight_of_match),
 	},
 	.probe		= pwm_backlight_probe,
-	.remove_new	= pwm_backlight_remove,
+	.remove		= pwm_backlight_remove,
 	.shutdown	= pwm_backlight_shutdown,
 };
 
diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
index 10129095a4c1..9afe701b2a1b 100644
--- a/drivers/video/backlight/qcom-wled.c
+++ b/drivers/video/backlight/qcom-wled.c
@@ -1741,7 +1741,7 @@ MODULE_DEVICE_TABLE(of, wled_match_table);
 
 static struct platform_driver wled_driver = {
 	.probe = wled_probe,
-	.remove_new = wled_remove,
+	.remove = wled_remove,
 	.driver	= {
 		.name = "qcom,wled",
 		.of_match_table	= wled_match_table,
diff --git a/drivers/video/backlight/rt4831-backlight.c b/drivers/video/backlight/rt4831-backlight.c
index c2f6fb29e1d0..7ead75929a43 100644
--- a/drivers/video/backlight/rt4831-backlight.c
+++ b/drivers/video/backlight/rt4831-backlight.c
@@ -224,7 +224,7 @@ static struct platform_driver rt4831_bl_driver = {
 		.of_match_table = rt4831_bl_of_match,
 	},
 	.probe = rt4831_bl_probe,
-	.remove_new = rt4831_bl_remove,
+	.remove = rt4831_bl_remove,
 };
 module_platform_driver(rt4831_bl_driver);
 
diff --git a/drivers/video/backlight/sky81452-backlight.c b/drivers/video/backlight/sky81452-backlight.c
index 935043b67786..2749231f0385 100644
--- a/drivers/video/backlight/sky81452-backlight.c
+++ b/drivers/video/backlight/sky81452-backlight.c
@@ -337,7 +337,7 @@ static struct platform_driver sky81452_bl_driver = {
 		.of_match_table = of_match_ptr(sky81452_bl_of_match),
 	},
 	.probe = sky81452_bl_probe,
-	.remove_new = sky81452_bl_remove,
+	.remove = sky81452_bl_remove,
 };
 
 module_platform_driver(sky81452_bl_driver);

base-commit: 929beafbe7acce3267c06115e13e03ff6e50548a
-- 
2.45.2

