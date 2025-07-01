Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0BEAEF324
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 11:22:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2C7A10E576;
	Tue,  1 Jul 2025 09:22:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="O9MuBhJh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF76910E56A
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 09:22:50 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-6097b404f58so9041223a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jul 2025 02:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751361769; x=1751966569;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zo/TsBTSnhnhtOzaR0L2fwad79M6B39oGRvluo5f4Vo=;
 b=O9MuBhJhl24hn3e42pviX3mp7f/UaqtUJ3QVQ2tVI2sqyDxhdHVCoHemONMr3ODcw+
 CXp9//YGTKA21Smc1Dn3qwp2eZsmJ+ShjSP39DuYtUyq/C0itJ2Ipo1QZaMb4j54ikrM
 N6IhNR4fN3MpRdhbLPKS+t3aHWbVaRGlJAXA0c/zgZrkua5/qOG9E3ubxdoLFGRbh0Sq
 aSTce3xyyn3MaP31xZjtuyDYVxFVyNCSNDFb2JDZqDat6pNJScQ/WZhUzrN+wJa3cvAS
 5Uc0Gd0O20P2Fl2IwENoAWeAjt15k93A2gzMOfDhnbxPmqRz+Jmns5GzhwN1waYn7ARU
 m0lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751361769; x=1751966569;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zo/TsBTSnhnhtOzaR0L2fwad79M6B39oGRvluo5f4Vo=;
 b=JIry5PK0KXd+uVY4afGmUNVPs9IF1qgJ+DFLC9O9CGBWAP6sTo7TKYwq8KG6xn+Zjf
 5/koQiDoC58kLJjEAEhNe5E2AjWrGKNJux5kNUHUs7oSXzDUeWOp9lP5+ko12dzyK+xu
 GtS8P4UVvGCOuDv4EE383EmpWnZIa9cgNrl2T9nPYieIqGfNlLjEblxnnrOpwkVX136K
 K1zRosXer2Mnsoj9O3GmsDGIB4oGCkivJzlFXGEw+z4U0XwrmAu+2PvTa4Nrc6Ejd5m6
 5uWx9cqPp7eEdsahms4XoLFlDP+Tpmgw2iAhYZEPhS1iNXiDW75EBz/UkVR4zLlWIXK8
 bU5w==
X-Gm-Message-State: AOJu0Yyqq0GTC6IHVgSuGuFN0PouLFw9U6k0F9M2kHaxHvCWYD7BtaHC
 E9JdPeT0h5pHlxhsChWAZ7V87ut59R2feNJiyqOaFIyNJOUCeVvTswf2FPOCOzbCkVY=
X-Gm-Gg: ASbGncvwHQWA0r/7LjdfmFrzLRsQYONrkvHcUQyIDe05QqsuGvREJh9mZIYCrPaOs+S
 o8qBFOpgXwvvRkiCzTm87dJ4qq0ePQFGBWc9RFKbwpXpEP5LT+SHytJiQVzUfjWrutLhsh3I76D
 vMjgVygKe0QQD5i4rctFtKFXw4mV3w7jf2ZrNAfhTFynFv6ED2TVbbT/YjvLLyI+tp3BkAptWQ6
 2US110BKPei+Z/6sEqHWZoRgYhsJyOrNTjJEOLyn9L/1w5yW2MXLw5KyPTADGg7qxoIwdFKYB2f
 emd//gedkxSGQ4k8arNjcmotDj0MQEu4fMFZr0JP3iqjbeJWuHspJhK1SJwi4JHfnrJMrTV8utZ
 gSCgDyOitxLPWqOyvAyyUXXrRzGMz
X-Google-Smtp-Source: AGHT+IEP2MB6PmcecA+vSBxvN/masCQ3N4UCTqJS/cDNcu9bjsD9JeRomQ0HDPukLAFStOZO3Om4Tw==
X-Received: by 2002:a05:6402:4412:b0:60b:fb2c:b789 with SMTP id
 4fb4d7f45d1cf-60c88ddd1fcmr12936963a12.21.1751361769148; 
 Tue, 01 Jul 2025 02:22:49 -0700 (PDT)
Received: from localhost
 (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de.
 [2003:f6:5f06:ab04::1b9]) by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-60c8320b592sm7195568a12.75.2025.07.01.02.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 02:22:48 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Flavio Suligoi <f.suligoi@asem.it>, Lee Jones <lee@kernel.org>,
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-pwm@vger.kernel.org
Subject: [PATCH 2/2] backlight: mp3309c: Initialize backlight properties
 without memset
Date: Tue,  1 Jul 2025 11:22:37 +0200
Message-ID: <14514a1b0d3df6438aa10bb74f1c4fc2367d9987.1751361465.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1751361465.git.u.kleine-koenig@baylibre.com>
References: <cover.1751361465.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1573;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=5agSzbXLvANUjeYbgj9vz6RxkJOxk8CMj/v7lHFWdt8=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoY6jgBvBEU9XlWZGFkK/ttXFd/DcPA1cEI1DbW
 3sCHBUZ4buJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaGOo4AAKCRCPgPtYfRL+
 Tvq7B/0TX3Aaz+14n37ZHEmP5rNiPkBkauLgV6PlfScVDkZtCJOzdS073lgqm54H6V/oTMtQEID
 zpgPjaUcTO+NJ8nkulWdGhIhhVG16ApKKJEMuNr5NWKqg5fyv/Y/jsp20kgk9pBMhXe6S9kahPd
 HWTN18Yp8cH3IsB21UXjApAvwcMIUcyqtbrzkXvQhJLZT87Mv09DxpXSYRpuYHc6gf3J1KvcOfS
 e9BJvTwcb8ooxa79xZlNsSV5tJFRA874qsjdA+jzTgZA20FnclMw9gNmNR8Wo6HJqHRJfxE/VKW
 C9jsBd+RSW7yBLqJmbTr3WNOQWrjLpkzJMRdydd6aOt8I/t7
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

Assigning values to a struct using a compound literal (since C99) also
guarantees that all unspecified struct members are empty-initialized, so
it properly replaces the memset to zero.

The code looks a bit nicer and more idiomatic (though that might be
subjective?). The resulting binary is a bit smaller. On ARCH=arm with
an allnoconfig + minimal changes to enable the mp3309c driver the
difference is 12 bytes.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/video/backlight/mp3309c.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/video/backlight/mp3309c.c b/drivers/video/backlight/mp3309c.c
index bb4e85531cea..9337110ce6e5 100644
--- a/drivers/video/backlight/mp3309c.c
+++ b/drivers/video/backlight/mp3309c.c
@@ -352,12 +352,13 @@ static int mp3309c_probe(struct i2c_client *client)
 	chip->pdata = pdata;
 
 	/* Backlight properties */
-	memset(&props, 0, sizeof(struct backlight_properties));
-	props.brightness = pdata->default_brightness;
-	props.max_brightness = pdata->max_brightness;
-	props.scale = BACKLIGHT_SCALE_LINEAR;
-	props.type = BACKLIGHT_RAW;
-	props.power = BACKLIGHT_POWER_ON;
+	props = (typeof(props)){
+		.brightness = pdata->default_brightness,
+		.max_brightness = pdata->max_brightness,
+		.scale = BACKLIGHT_SCALE_LINEAR,
+		.type = BACKLIGHT_RAW,
+		.power = BACKLIGHT_POWER_ON,
+	};
 	chip->bl = devm_backlight_device_register(dev, "mp3309c", dev, chip,
 						  &mp3309c_bl_ops, &props);
 	if (IS_ERR(chip->bl))
-- 
2.49.0

