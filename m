Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 910FA90F852
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 23:13:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26D9510E239;
	Wed, 19 Jun 2024 21:13:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="qlnbKnhX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A68E10EDA5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 19:36:10 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a6f7b785a01so11906966b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 12:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718825768; x=1719430568;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vnLZjzsiZJ7wwEMZFq71NfmdNt4xwTT/ZS6jS7RPwME=;
 b=qlnbKnhXhEYz+gwWhlree5P4PFss49xzA1SB/isIs6guIAzEnGEd3j1jGuxh2vXLT5
 vjFrOlkFG60Z6RZaHbX1L7AIg5loY5SKOy46YXq1AQngIMI3+2LUWJ0V6koIhC5RAXtj
 zN0vREDqez34Bh5vlgRxSaqy75FBvl8Qo6/FXevXLPLlmPtwwyN5BK6Y5kKb8G+W9NZA
 VwyNfV5e8LrRffJ+UN7S6K8BvCfgG3RmYrAjF78ypNLuGL+qlNCJ4mJ3izPGhOfWXh4k
 SjRBbnyjMRe7ytVqaWNV4Lb7iF9ysViGb4lL3H7CtZKSV8zQv5G26t8p1Nz/IzsU4u+Q
 7nWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718825768; x=1719430568;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vnLZjzsiZJ7wwEMZFq71NfmdNt4xwTT/ZS6jS7RPwME=;
 b=b0KJfyty1safZ/CrFwW7J9o+a+Un10birB3JK1GdpKjArSxJ2fVqWLUyuEDy4PmQnW
 a4jRurQlB0QMco65yGiE+OEyLlEzRFNexoeZUH8eLDAPRjXgaG7sPgq5fzKfOwrr0xJX
 mYLq2NZU6+/EJdwuKP8L6vlHOD9AvL9FZfhDbz12qjuTGlTN8zzm2yKTZdTWxeDmad9L
 DGay312p41VFvkGKirrGyu3hzLjHBlXommiyAaJ0YR5eHWSEzUjcHCm2/5YXiyh7MF8i
 qPtjmsjq8iOrGFQjeafWfOXcT9kIijjIml9jAvOU9aWtf+V7SYuBYD/NwO3P1yn70wWI
 aGoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+SOg4YpMbw2ZGFqBhQ/QX+G2lNlc0plB5eHeKX9tFR4BRF6G7HgwCeSv3EzDd3B69MjwGHnXNB8y2bCCA4N/T492E/U+LqerGbUjzsslg
X-Gm-Message-State: AOJu0YySd2LgNQOrLfsx+ce+x+VKFJd7OyxtFG4i9iO2FxxMXrRIV+up
 dNiDoqRM65fXrd2gSItMFIK5357A3pocPmLK7DUm6aDyz6zd7tkJhB7IwPKbGOo=
X-Google-Smtp-Source: AGHT+IGIHtLyHv1BeR7I51HKBBQr1rPaFSrD0CBlXThWh80UhE0jre2aByQrY4pyvX81yH54k+ylqw==
X-Received: by 2002:a17:907:175e:b0:a6f:1166:fb7a with SMTP id
 a640c23a62f3a-a6fab614d2cmr160009166b.32.1718825768582; 
 Wed, 19 Jun 2024 12:36:08 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56ecdd79sm697709866b.132.2024.06.19.12.36.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 12:36:08 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>
Cc: Helge Deller <deller@gmx.de>, Jianhua Lu <lujianhua000@gmail.com>,
 Flavio Suligoi <f.suligoi@asem.it>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
Subject: [PATCH] backlight: Drop explicit initialization of struct
 i2c_device_id::driver_data to 0
Date: Wed, 19 Jun 2024 21:35:57 +0200
Message-ID: <20240619193558.2543645-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4552;
 i=u.kleine-koenig@baylibre.com; h=from:subject;
 bh=b6KdZZ9MVHXlW6Kzlm1yP66Bz8tcUOfRhuVRKx4scF4=;
 b=owGbwMvMwMXY3/A7olbonx/jabUkhrRiYznNlJmzDTYGHym8Y3STZYvRHxGeSCG2q8r2N2TnW
 j6aHfyyk9GYhYGRi0FWTJHFvnFNplWVXGTn2n+XYQaxMoFMYeDiFICJ7PrFwTDJupbj79UPj/V4
 H01h0JPJ8tXuuF/9Nv7Dlusr1Fd+l4oUn6fB96JT2aRduDpkzd43zxe1hVz5qlzzR1kh+X2D0sY
 tNRc+rL85Uaixg1Vdpk/3/6S1M3Umhmd/q26c/ElBtKYn5XStUpZm45V5t56yHS3+H8SucjiZY8
 eCvb6vXfVzeQI9VmX+7Dis5xe1y8TYt8KBIXD1tTsfU5gmni07oa0SJ76tROuDSe6qfvGfdcIzd
 NSlL66fzcO+XInBzTHshED9w9r9Cq/mOYlHR3hxs8w13ntM9vVyEaUn8184bnu3QX6a7fuYY5cW
 q8dcs9vwPMFLT91NMCHgtlGF0SQug6r88J6efuHj+lu8AA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 19 Jun 2024 21:13:26 +0000
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

These drivers don't use the driver_data member of struct i2c_device_id,
so don't explicitly initialize this member.

This prepares putting driver_data in an anonymous union which requires
either no initialization or named designators. But it's also a nice
cleanup on its own.

While add it, also remove commas after the sentinel entries.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/video/backlight/adp8870_bl.c | 2 +-
 drivers/video/backlight/bd6107.c     | 2 +-
 drivers/video/backlight/ktz8866.c    | 4 ++--
 drivers/video/backlight/lm3509_bl.c  | 5 ++++-
 drivers/video/backlight/lm3630a_bl.c | 2 +-
 drivers/video/backlight/lm3639_bl.c  | 2 +-
 drivers/video/backlight/lv5207lp.c   | 2 +-
 drivers/video/backlight/mp3309c.c    | 2 +-
 8 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/video/backlight/adp8870_bl.c b/drivers/video/backlight/adp8870_bl.c
index 6bb18dc970e9..ad4bd4c8f441 100644
--- a/drivers/video/backlight/adp8870_bl.c
+++ b/drivers/video/backlight/adp8870_bl.c
@@ -963,7 +963,7 @@ static SIMPLE_DEV_PM_OPS(adp8870_i2c_pm_ops, adp8870_i2c_suspend,
 			adp8870_i2c_resume);
 
 static const struct i2c_device_id adp8870_id[] = {
-	{ "adp8870", 0 },
+	{ "adp8870" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, adp8870_id);
diff --git a/drivers/video/backlight/bd6107.c b/drivers/video/backlight/bd6107.c
index 6be2c67ba85c..90764f83d2f1 100644
--- a/drivers/video/backlight/bd6107.c
+++ b/drivers/video/backlight/bd6107.c
@@ -180,7 +180,7 @@ static void bd6107_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id bd6107_ids[] = {
-	{ "bd6107", 0 },
+	{ "bd6107" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, bd6107_ids);
diff --git a/drivers/video/backlight/ktz8866.c b/drivers/video/backlight/ktz8866.c
index 014877b5a984..2e508741c0af 100644
--- a/drivers/video/backlight/ktz8866.c
+++ b/drivers/video/backlight/ktz8866.c
@@ -179,8 +179,8 @@ static void ktz8866_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ktz8866_ids[] = {
-	{ "ktz8866", 0 },
-	{},
+	{ "ktz8866" },
+	{}
 };
 MODULE_DEVICE_TABLE(i2c, ktz8866_ids);
 
diff --git a/drivers/video/backlight/lm3509_bl.c b/drivers/video/backlight/lm3509_bl.c
index c93cdedff5ad..11b8e1824e07 100644
--- a/drivers/video/backlight/lm3509_bl.c
+++ b/drivers/video/backlight/lm3509_bl.c
@@ -311,7 +311,10 @@ static void lm3509_remove(struct i2c_client *client)
 	regmap_write(data->regmap, REG_GP, 0x00);
 }
 
-static const struct i2c_device_id lm3509_id[] = { { LM3509_NAME, 0 }, {} };
+static const struct i2c_device_id lm3509_id[] = {
+	{ LM3509_NAME },
+	{}
+};
 
 MODULE_DEVICE_TABLE(i2c, lm3509_id);
 
diff --git a/drivers/video/backlight/lm3630a_bl.c b/drivers/video/backlight/lm3630a_bl.c
index 76d47e2e8242..37651c2b9393 100644
--- a/drivers/video/backlight/lm3630a_bl.c
+++ b/drivers/video/backlight/lm3630a_bl.c
@@ -596,7 +596,7 @@ static void lm3630a_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lm3630a_id[] = {
-	{LM3630A_NAME, 0},
+	{ LM3630A_NAME },
 	{}
 };
 
diff --git a/drivers/video/backlight/lm3639_bl.c b/drivers/video/backlight/lm3639_bl.c
index 564f62acd721..37ccc631c498 100644
--- a/drivers/video/backlight/lm3639_bl.c
+++ b/drivers/video/backlight/lm3639_bl.c
@@ -403,7 +403,7 @@ static void lm3639_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lm3639_id[] = {
-	{LM3639_NAME, 0},
+	{ LM3639_NAME },
 	{}
 };
 
diff --git a/drivers/video/backlight/lv5207lp.c b/drivers/video/backlight/lv5207lp.c
index 0cf00fee0f60..5f60989fa70f 100644
--- a/drivers/video/backlight/lv5207lp.c
+++ b/drivers/video/backlight/lv5207lp.c
@@ -132,7 +132,7 @@ static void lv5207lp_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id lv5207lp_ids[] = {
-	{ "lv5207lp", 0 },
+	{ "lv5207lp" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lv5207lp_ids);
diff --git a/drivers/video/backlight/mp3309c.c b/drivers/video/backlight/mp3309c.c
index a28036c964af..2bdb20129c81 100644
--- a/drivers/video/backlight/mp3309c.c
+++ b/drivers/video/backlight/mp3309c.c
@@ -400,7 +400,7 @@ static const struct of_device_id mp3309c_match_table[] = {
 MODULE_DEVICE_TABLE(of, mp3309c_match_table);
 
 static const struct i2c_device_id mp3309c_id[] = {
-	{ "mp3309c", 0 },
+	{ "mp3309c" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, mp3309c_id);

base-commit: 2102cb0d050d34d50b9642a3a50861787527e922
-- 
2.43.0

