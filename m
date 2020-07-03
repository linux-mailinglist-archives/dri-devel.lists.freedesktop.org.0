Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCC8213F93
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 20:46:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E7E86EBA6;
	Fri,  3 Jul 2020 18:46:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7947B6EBA6
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 18:46:35 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id b25so34488270ljp.6
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jul 2020 11:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yEjF7pEN/xrGxy0935aYNV70k+jmMYiQOI/9QnjZUaY=;
 b=kGXo9YiHByb/ZdboHuQZf8/EXqVwrUOLV9K0C5ghuKRYxJjlsf1mC0LWPcUal83U3e
 T0NSF9MKhwJ9kEvgnNnnDN1t2KVI47sT0lxaLwGz7KhVbKvICydANUR8r0UECtRAnNo4
 sp11uPYqiDOWsw90j4YKvQ8YGCI6nEzY+3hajSV2DjnNctILaLi29pooDiv/3JlfcmFN
 CudZEwUe0wsT7+YCX4E3CkwvdzbZe0bltiUrqFPzZBgpg0G3VCnFsLxJRWsA+uLAtyKC
 S0SkhTxqUhvYc3BjntJLaG8/zLUt4V//9sY3veBe0vSrzuLckbEkE3RCOWUoVb6A++2U
 55rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yEjF7pEN/xrGxy0935aYNV70k+jmMYiQOI/9QnjZUaY=;
 b=WBFFgsNf3fVhlzgrL07UNiIDrRQ2ZfFsJVs0FLLULKyH0760OXx1cRmwKRo1kxMpGg
 LqohksBX2i9JXV09rK6ADPcU9wb7qAxUslD8f6orNj2NbluEjsU1dBwIqUjP9Xq+7d8S
 b9lVKiDAuQLhSEo01ELSiFbVQRmcSlS0vuPcB53Knc09IObMjY4DSXlGhlDxpqbLK4p2
 6cCp7O3QwBXKvECBxH+lE1rgggZ/No+VrAwsizUIxsYEa0J7QVIe88Uj8EdCikhLQ3H9
 9q5XewyKh96btmzjMve/CGViGGjeofeyVOLL1gSvc9RFoU/57cuhnosiMoeUoP22Hr3i
 CR8g==
X-Gm-Message-State: AOAM531rBnk8082fedKO/PFYPLv4ZTBHivqmHOL8guU+xWzKaIZQ5ZKm
 3gx4fL2k75m/v3dCaDpOviFb8A4+ibE=
X-Google-Smtp-Source: ABdhPJzXfRgTjlP6hr/OlcHKewcVR9hdREuWmRp2p6dKhsVeuObmf+HrkvtKNrQTf3gBMQArzdojCQ==
X-Received: by 2002:a05:651c:3c2:: with SMTP id
 f2mr20912755ljp.37.1593801993807; 
 Fri, 03 Jul 2020 11:46:33 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:4025:a614:1d5c:b7bc])
 by smtp.gmail.com with ESMTPSA id h22sm4404224ljg.1.2020.07.03.11.46.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 11:46:33 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v4 15/20] backlight: gpio_backlight: simplify update_status()
Date: Fri,  3 Jul 2020 20:45:41 +0200
Message-Id: <20200703184546.144664-16-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200703184546.144664-1-sam@ravnborg.org>
References: <20200703184546.144664-1-sam@ravnborg.org>
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
