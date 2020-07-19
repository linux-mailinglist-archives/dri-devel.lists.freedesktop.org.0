Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B862250B8
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jul 2020 10:08:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA13E6E4F4;
	Sun, 19 Jul 2020 08:08:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D2446E4F3
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jul 2020 08:08:26 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id b25so17025630ljp.6
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jul 2020 01:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aaf0m4BLcrTG4bMWWq/JZ557CUtwpSzBtZ2OTxRtuus=;
 b=GpOG2BPM6f5ErHn2xTcOlwxzr5xwmH1d1aGpPaEJPXsgMC4QDyfeZkFgghp4piUO8y
 +5C+T+Kzr12eQ4+Bk2Hqer/2yy12yeqTyT7HNh7UzFPgTdfMsOBXc7STcsT1pvDYNcM9
 ZbRlkNGMg34d9eYoXgR11qZ/5w14LeYcXhahnHNYTDFo9kIK7P0n2A0XEz9aYqw2hOaQ
 xMFk/+HZXNv9fG0MC8hrMKlb9tqBjTmh4OIe0tJEmjg3AzIwtDTQQnp6Owj+nlPrOHSn
 bh7VsAmWwEnU/mdJVN69dukCa6B0wytKhRD7zJ+SK/emst/IpfnyLSRkJo7DImz0sgfI
 AjjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=aaf0m4BLcrTG4bMWWq/JZ557CUtwpSzBtZ2OTxRtuus=;
 b=fTQvydKGO2xFJ0zztNtkvTkaLEeuRsRQbxMtyq9nfCUaqJuCzEiFuSbvLEqSWPFKW+
 hICNL4ELpnf7zy9SeXFYH+kilvpXsVA+N+nZYuJk1S1Nz6X2p6W4+EBE2PcynkMWh3XX
 bA+MRAZItPS2GbW6FLd/K7UAM+TZvlLi140Yxp3uWFLZF7URZ65KmvCDCPKQxXA7W4OC
 ruf9H/9dK3j0W/8iEXWUoWvE90Dhv+/S/OKDCsGsz3RjfvWbVsqJ4fvWxC4SvxVCT5lL
 1dzviG5rCMG3PEkEb5nB00Sjwml4BxHhpIFpTybcY8OON8YlcAoyNpYCAJfBRUSUeyBS
 vFWw==
X-Gm-Message-State: AOAM5303yghW7sxdfvDaBztlQH2NfL0C7BxypyY+tpOTOWfVJ/CqBy0v
 gV1JM639+C5nsa2ep0YxAyCg7Uj8fDU=
X-Google-Smtp-Source: ABdhPJybMbA1pMekauiLuL0JlrMRVGGlU0yp7hTxsmGJsZ92Yg3niEUhn+aR9X1ycKIdPJ3lX4crwQ==
X-Received: by 2002:a2e:5806:: with SMTP id m6mr7129681ljb.23.1595146104801;
 Sun, 19 Jul 2020 01:08:24 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:d5fe:fe9c:fc06:b74c])
 by smtp.gmail.com with ESMTPSA id 72sm732407lfh.97.2020.07.19.01.08.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jul 2020 01:08:24 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v5 15/19] backlight: gpio_backlight: simplify update_status()
Date: Sun, 19 Jul 2020 10:07:39 +0200
Message-Id: <20200719080743.8560-16-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200719080743.8560-1-sam@ravnborg.org>
References: <20200719080743.8560-1-sam@ravnborg.org>
MIME-Version: 1.0
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
Cc: linux-pwm@vger.kernel.org,
 Support Opensource <support.opensource@diasemi.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Jonathan Corbet <corbet@lwn.net>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Andy Gross <agross@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, patches@opensource.cirrus.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce the use of backlight_get_brightness() to simplify
the update_status() operation.
With the simpler implementation drop the gpio_backlight_get_next_brightness()
helper as it was now a one-liner.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
---
 drivers/video/backlight/gpio_backlight.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
index 75409ddfba3e..6f78d928f054 100644
--- a/drivers/video/backlight/gpio_backlight.c
+++ b/drivers/video/backlight/gpio_backlight.c
@@ -21,24 +21,11 @@ struct gpio_backlight {
 	struct gpio_desc *gpiod;
 };
 
-static int gpio_backlight_get_next_brightness(struct backlight_device *bl)
-{
-	int brightness = bl->props.brightness;
-
-	if (bl->props.power != FB_BLANK_UNBLANK ||
-	    bl->props.fb_blank != FB_BLANK_UNBLANK ||
-	    bl->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK))
-		brightness = 0;
-
-	return brightness;
-}
-
 static int gpio_backlight_update_status(struct backlight_device *bl)
 {
 	struct gpio_backlight *gbl = bl_get_data(bl);
-	int brightness = gpio_backlight_get_next_brightness(bl);
 
-	gpiod_set_value_cansleep(gbl->gpiod, brightness);
+	gpiod_set_value_cansleep(gbl->gpiod, backlight_get_brightness(bl));
 
 	return 0;
 }
@@ -108,7 +95,7 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 
 	bl->props.brightness = 1;
 
-	init_brightness = gpio_backlight_get_next_brightness(bl);
+	init_brightness = backlight_get_brightness(bl);
 	ret = gpiod_direction_output(gbl->gpiod, init_brightness);
 	if (ret) {
 		dev_err(dev, "failed to set initial brightness\n");
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
