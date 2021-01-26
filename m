Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C49B304B93
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 22:32:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98EEC89AC6;
	Tue, 26 Jan 2021 21:32:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CB7E89AC6
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 21:32:04 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id h12so167888lfp.9
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 13:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XAd0m+Dwu2tjOBWUVD9gFQrOyI867SzwM1q4z0D5tp4=;
 b=r5wMfY9ddFn9OKUY7QS9rnVaR5bO0e9Czkh+8UL9bA1l6O+N4uTKzujwg06hYUFMpF
 T4SsPBCfuzl5rSzog8gZpR1hjo4a7pIqRlaAqiTZNzO0ChsW88NgV4cvEYdH8N3ysYj7
 pZsCFzlyMexd47fOuYNXhfnYcUYYhkT7t7JSZ/nEXKZo48mVOgy1xeOZPjnT3j/Zmjjj
 ZoMJ0Z2NqJG3UgQVKDlLeODzwkEAXF5Dw176+qeg3/Wf30j0crxZQIbSksPnq8QU8Cin
 ljtqSpF0236ZNDR+FKNXOOYSCuuIzOfg2hKIO661FKDt0vqLvC1rbM7yDmB2lz+gutDO
 5DHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XAd0m+Dwu2tjOBWUVD9gFQrOyI867SzwM1q4z0D5tp4=;
 b=L1E75lPW3OG4s9J6zqQZyTFZLwTqqsRnVAdxYfd+3oAopDbzR8SoVH83CCZlmvcyM2
 uy21/Xet2qlYysrkXN8CbAVNwrXeEvZQyAEDIl71kUwegpqSIVINLPEEYbzmMTYmULj1
 XwzA7pZQ1l7zstNkEIuNyjqvpj2NjMtkGEMDWKYQ1r4qVCxlW0zjC2cvmQeLKZNkFV2u
 bTJr99w+MtFkealQshEVL+9ALNLaCmxncW+wohg2PKZVKSGaxM2dOZ9XbVsK29vnVT6z
 G/naZf+g3Z4mULXe7XSkYCDxZlf9LAZNFhPWQwiZNeS26NpA4cix5B+3wHZWKe/jJGYz
 Qxxg==
X-Gm-Message-State: AOAM5302aMnFiRrxAJM1bU88jCLY+Q7FijhhV5NvjnG5eM7H9YKpEAG1
 /EfomYelWUdwFrPR0dh7m319vNroREO7C+Ag
X-Google-Smtp-Source: ABdhPJwVqWPENIJRXeZ6UeUZPweq+23FbSDU+/L4I42GVMMw+XYt4iWBu6gKKxmjmUJSxa8ji56f5Q==
X-Received: by 2002:a19:6547:: with SMTP id c7mr3571172lfj.14.1611696722725;
 Tue, 26 Jan 2021 13:32:02 -0800 (PST)
Received: from localhost.localdomain
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id q28sm24175lfo.266.2021.01.26.13.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 13:32:02 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH] backlight: ktd253: Bring up in a known state
Date: Tue, 26 Jan 2021 22:32:00 +0100
Message-Id: <20210126213200.14366-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.29.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The KTD253 backlight might already be on when the driver
is probed: then we don't really know what the current
ratio is and all light intensity settings will be off
relative to what it was at boot.

To fix this, bring up the backlight OFF then move it to
the default backlight from there so we know the state.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/video/backlight/ktd253-backlight.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/video/backlight/ktd253-backlight.c b/drivers/video/backlight/ktd253-backlight.c
index e3fee3f1f582..d7b287cffd5c 100644
--- a/drivers/video/backlight/ktd253-backlight.c
+++ b/drivers/video/backlight/ktd253-backlight.c
@@ -137,15 +137,7 @@ static int ktd253_backlight_probe(struct platform_device *pdev)
 		brightness = max_brightness;
 	}
 
-	if (brightness)
-		/* This will be the default ratio when the KTD253 is enabled */
-		ktd253->ratio = KTD253_MAX_RATIO;
-	else
-		ktd253->ratio = 0;
-
-	ktd253->gpiod = devm_gpiod_get(dev, "enable",
-				       brightness ? GPIOD_OUT_HIGH :
-				       GPIOD_OUT_LOW);
+	ktd253->gpiod = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
 	if (IS_ERR(ktd253->gpiod)) {
 		ret = PTR_ERR(ktd253->gpiod);
 		if (ret != -EPROBE_DEFER)
@@ -153,6 +145,8 @@ static int ktd253_backlight_probe(struct platform_device *pdev)
 		return ret;
 	}
 	gpiod_set_consumer_name(ktd253->gpiod, dev_name(dev));
+	/* Bring backlight to a known off state */
+	msleep(KTD253_T_OFF_MS);
 
 	bl = devm_backlight_device_register(dev, dev_name(dev), dev, ktd253,
 					    &ktd253_backlight_ops, NULL);
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
