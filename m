Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CCA24ECD0
	for <lists+dri-devel@lfdr.de>; Sun, 23 Aug 2020 12:46:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19C966E4A7;
	Sun, 23 Aug 2020 10:46:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AC816E4A1
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Aug 2020 10:46:00 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id y2so6467371ljc.1
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Aug 2020 03:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oLlg5LeIyeQAEOLJXQkYpM/gY0D0nMLOnXxKrUQwpng=;
 b=WTITcuYD8EdulY2jlrnlC7Ol5J+wOKasvpSZQRdFQxcVGFEE9Ws7fETgZGWFqaiyLd
 YfHEkkArtaulupywIhzURxEg7XyE7EefTLJcCaOxDinSiE2ZyWF1twXiinvigq1Sa56A
 hlHhV4Epsx9RghYPsZ6QgkDy29q9om7FwoMKhWxgsUaEH85vsNEIVAp0cyOA5xl+HT1S
 cGqVt2x7IQdL1ClqX15Yq9d8JEltTK8825o2B3yHOC2rp78lX2R/doUidzKS3fW/hWkP
 ZDxZl4F1yN2Bfh+Tlq+6RcAEvstCF3OOfWXkRG9DLDWqitW8mSWqMzajp+ljXBrsCBWu
 Y4og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=oLlg5LeIyeQAEOLJXQkYpM/gY0D0nMLOnXxKrUQwpng=;
 b=PyV2M6ES4BqyhTqKidUniCi2evEyoJdrndaZD5NPGPcme5/cbtxdciOls7P5NLIu03
 2QLGiFGghF2pSsVyUZ/qRPBRZsasQvb/8GxzpRKAcTGnCPFW0SybaHRUDeeGg/BEhCBF
 ZwGbPIN01gjhYoGUMw6DRDK7DMqdmEVfUKutKaw+9IzjPlxLm9nmrtz+RUuE4zwqSjYL
 UzC5fkUKGdSjgfjFhcldGWrGq1HgERv6AtU0jc0H9UIU1jbVJdV1ZxSIN0A16B5kokrh
 p3yUB+siaX9yHeJ3rMzP1FxKgry+pEjIVCt1kIIvyMYT1SIktUqqvH01ROqx3acBM3TA
 xo2w==
X-Gm-Message-State: AOAM5307kpeleNkOdd3xQnjdYADMJ8NvBmYddCJbxsnKrkzJjD9oD93J
 Bb1cl/5R1lGPM+3NSQD5ZtnLEIT2WXMnyA==
X-Google-Smtp-Source: ABdhPJzND27Igeji8vu73kZOGt8r/VbE1NaFKPfYJz2aLSoGxel19JEow2PU3kUmbcg7GXSo5A3udw==
X-Received: by 2002:a2e:9003:: with SMTP id h3mr460407ljg.185.1598179558614;
 Sun, 23 Aug 2020 03:45:58 -0700 (PDT)
Received: from saturn.localdomain ([2a00:fd00:805f:db00:2509:20d7:e461:9c16])
 by smtp.gmail.com with ESMTPSA id
 h13sm1516301lji.134.2020.08.23.03.45.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Aug 2020 03:45:58 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v2 05/24] backlight: gpio: Use dev_err_probe()
Date: Sun, 23 Aug 2020 12:45:13 +0200
Message-Id: <20200823104532.1024798-6-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200823104532.1024798-1-sam@ravnborg.org>
References: <20200823104532.1024798-1-sam@ravnborg.org>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use dev_err_probe() to make some of the error handling
simpler in the probe function.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
---
 drivers/video/backlight/gpio_backlight.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
index dc9354dc5e6a..1d509b626b12 100644
--- a/drivers/video/backlight/gpio_backlight.c
+++ b/drivers/video/backlight/gpio_backlight.c
@@ -65,13 +65,9 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 	def_value = device_property_read_bool(dev, "default-on");
 
 	gbl->gpiod = devm_gpiod_get(dev, NULL, GPIOD_ASIS);
-	if (IS_ERR(gbl->gpiod)) {
-		ret = PTR_ERR(gbl->gpiod);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev,
-				"Error: The gpios parameter is missing or invalid.\n");
-		return ret;
-	}
+	if (IS_ERR(gbl->gpiod))
+		return dev_err_probe(dev, PTR_ERR(gbl->gpiod),
+				     "The gpios parameter is missing or invalid.\n");
 
 	memset(&props, 0, sizeof(props));
 	props.type = BACKLIGHT_RAW;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
