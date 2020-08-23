Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BED2224ECCA
	for <lists+dri-devel@lfdr.de>; Sun, 23 Aug 2020 12:46:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B267A6E49F;
	Sun, 23 Aug 2020 10:46:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35B356E497
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Aug 2020 10:45:59 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id 185so6438877ljj.7
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Aug 2020 03:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yfGezRRrHisCV10uBCobfnKoT+rZyW4xgWzy2WX8Bos=;
 b=TqarjIaK85MMJ5oK1mPTMjKbR+HD8fZQ+5daGMuzOfezkhTFz8ZIQDHUNfoMNFE8UT
 QAWKK0z82CgO2G5iZ2rDdePv+wWGoxoivklLp5y3CRAeg26Wx22yPswYE4FJPLsKTMGl
 YA5Mt/r/ixzODC+6L6pe6vYCCJsoTKyrtINYYp0HPlfCWyjCPDg/gPpbGhSEhTfn9VBt
 jMII9Yg5xksbgIXKrzPt4EMawiy/3jYRPeBD7TbuByMllKVM0EY87mE/J7EgFVTSSWWv
 3jyun0U0tzMsJNwaW15oExOMnbxb2foQFhs42NfCs20mWkQXqi3eGZQ+Ekjz0GaVdchZ
 1+IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yfGezRRrHisCV10uBCobfnKoT+rZyW4xgWzy2WX8Bos=;
 b=oZZA2BObNT9TyW1BzuBj9tcYQ/JYobm1iQYbwTObX5jYymuPV8Imtprmwu8t3b2ZRM
 XfqkECwX06YXpqd5ijO0EJ/67lTxLDKzXMjI2ct/Co/d/T5RafDJDjcDXeI4IIwnqm0/
 UQR2C0Rvjt5ROgOgnDsmCNWrfcbzTyEm3WlXzwQm/un2nBG5UsEjZnSJ1/WYWYvPTK/i
 ccUrYlwVowBm5wnpED2NFavdjNSVM9GN/Vv1w1OMuSfxi/NEYC68XzXbvLhH7UHqVAh7
 X4XO9EwPEle16jf1UWxxI5OULY5Vdtu0/7Qe8NHgAK8P7mUZvOHy2DdyR77cwZ+Lhy7O
 4c9w==
X-Gm-Message-State: AOAM531I9UDVhkQycjwBqOpLi3mFE8WyjWYQFwhctw2B8TEO0v1tqCVC
 IshEwmLN+j09q7bbGU2hFwUxk3LhQfEahw==
X-Google-Smtp-Source: ABdhPJylmsMgNHKjU0jsesDfxUM3lL332nxn2EIC74CtJJ/Ix5cAhotH6hft/lTib8jYJzRjN0Z+zA==
X-Received: by 2002:a2e:b607:: with SMTP id r7mr407712ljn.356.1598179557493;
 Sun, 23 Aug 2020 03:45:57 -0700 (PDT)
Received: from saturn.localdomain ([2a00:fd00:805f:db00:2509:20d7:e461:9c16])
 by smtp.gmail.com with ESMTPSA id
 h13sm1516301lji.134.2020.08.23.03.45.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Aug 2020 03:45:57 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v2 04/24] backlight: gpio: Introduce backlight_{enable,
 disable}
Date: Sun, 23 Aug 2020 12:45:12 +0200
Message-Id: <20200823104532.1024798-5-sam@ravnborg.org>
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

Use backlight_{enable,disable} in the probe function to
avoid hardcoding power handling in the driver.

Move platform_set_drvdata() up as the enable/disable call
will trigger a callback to the driver.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
---
 drivers/video/backlight/gpio_backlight.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
index 6f78d928f054..dc9354dc5e6a 100644
--- a/drivers/video/backlight/gpio_backlight.c
+++ b/drivers/video/backlight/gpio_backlight.c
@@ -53,6 +53,7 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 	struct backlight_device *bl;
 	struct gpio_backlight *gbl;
 	int ret, init_brightness, def_value;
+	bool enable = false;
 
 	gbl = devm_kzalloc(dev, sizeof(*gbl), GFP_KERNEL);
 	if (gbl == NULL)
@@ -82,16 +83,22 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 		return PTR_ERR(bl);
 	}
 
-	/* Set the initial power state */
-	if (!of_node || !of_node->phandle)
+	platform_set_drvdata(pdev, bl);
+
+	/* Set the initial state */
+	if (!of_node || !of_node->phandle) {
 		/* Not booted with device tree or no phandle link to the node */
-		bl->props.power = def_value ? FB_BLANK_UNBLANK
-					    : FB_BLANK_POWERDOWN;
-	else if (gpiod_get_direction(gbl->gpiod) == 0 &&
-		 gpiod_get_value_cansleep(gbl->gpiod) == 0)
-		bl->props.power = FB_BLANK_POWERDOWN;
+		if (def_value)
+			enable = true;
+	} else if (!(gpiod_get_direction(gbl->gpiod) == 0 &&
+		   gpiod_get_value_cansleep(gbl->gpiod) == 0)) {
+		enable = true;
+	}
+
+	if (enable)
+		backlight_enable(bl);
 	else
-		bl->props.power = FB_BLANK_UNBLANK;
+		backlight_disable(bl);
 
 	bl->props.brightness = 1;
 
@@ -102,7 +109,6 @@ static int gpio_backlight_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	platform_set_drvdata(pdev, bl);
 	return 0;
 }
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
