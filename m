Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6483039B2B2
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 08:34:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 305056F58B;
	Fri,  4 Jun 2021 06:34:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B026F58B
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 06:34:06 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id bn21so10224359ljb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jun 2021 23:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8udvDYa/VlOyXu8AOKeyxWM52T9U/Gm+winUljDDruo=;
 b=G6Gs5mqEjmwDKHqEtakIJ/oZE7Z+6WRxdijPA0SISqYy4TCaXrTSRiXtDEw5xGvl1t
 vca2RgTe4Owk3fYDHeZ0Et7TD1g3WjzwlDAFuh2aGLFvk6FHv/x+wlPumyMNpjdE4fyn
 EfK3x+yWK50IijenVK+A2BjluQyG30TkKn4SJU6sNdtlIBmdBn4U0uW8acGEXdv0FchH
 sepecKpQqnPqyr11n/wMB9hY0UUp7ynR0hDgHPYZoiM2sLUlxEEgfB9y0bHSRqZOUDgC
 RTaZ3rJyM3gpP1j6apcOWZJ6HLK5tGqEFVSHD6YYoezpEo5L7CFpYCnbeCUOIiPQbtfE
 Knyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8udvDYa/VlOyXu8AOKeyxWM52T9U/Gm+winUljDDruo=;
 b=aXCva4tlOLTNu8QMgxa5qauzwtkHLbYnAQpHMqZm5m8j6QC1fy153TVQvxldh8eicb
 /r7MYEFv8HLv7ly7oIZnZEVRHje2FzL/3voEiyrUO3i0GUmAuGaSRDuggPdwDr42XcAP
 V0F/EQwlkrbr3Q5G/bdZbtWwDWdos/oYMRJnlSSi5uES3m2cB7tXmeedJnLbeJswI1qq
 yyWFMbe4DR9Gbh6fJbrrN10uqwvoZ0aT38BxZ1tOTvQlp5WOgKhuttOJBv9H4CNPmnuf
 onecfxwagc+/eehycLRQrE30hjyTf8rbXluLm6PJuD2Ux2zLGuN1DbseEf+3DbAXBPH0
 WuwA==
X-Gm-Message-State: AOAM533e1skwvSOvafL4PMFNgl3XENV0m/n9P52labpdujCm2uP0vTLR
 ZZ6Cdcvy++Ecdn4+jFwtCcjElg==
X-Google-Smtp-Source: ABdhPJxMkJ8LzOjMLLg3G/4AsGv8NXkD3BofpLHtg3T5tmCJnGmSi66C/vNeyy9rAeFX6NR6y/8kIw==
X-Received: by 2002:a2e:9182:: with SMTP id f2mr2306536ljg.223.1622788444922; 
 Thu, 03 Jun 2021 23:34:04 -0700 (PDT)
Received: from localhost.localdomain
 (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
 by smtp.gmail.com with ESMTPSA id v19sm283578ljc.78.2021.06.03.23.34.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 23:34:04 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH v3] backlight: ktd253: Stabilize backlight
Date: Fri,  4 Jun 2021 08:32:01 +0200
Message-Id: <20210604063201.3235245-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
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
Cc: newbyte@disroot.org, Stephan Gerhold <stephan@gerhold.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove interrupt disablement during backlight setting. It is
way to dangerous and makes platforms instable by having it
miss vblank IRQs leading to the graphics derailing.

The code is using ndelay() which is not available on
platforms such as ARM and will result in 32 * udelay(1)
which is substantial.

Add some code to detect if an interrupt occurs during the
tight loop and in that case just redo it from the top.

Fixes: 5317f37e48b9 ("backlight: Add Kinetic KTD253 backlight driver")
Cc: Stephan Gerhold <stephan@gerhold.net>
Reported-by: newbyte@disroot.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- Read my own patch and realized a bug: when we get a timeout
  we bounce back to max period, but still count down the pwm
  with one leading to an off-by-one error. Fix it by extending
  some else clauses.
ChangeLog v1->v2:
- Alter the dimming code to check for how many ns the pulse
  is low, and if it gets to ~100 us then redo from start.
  This is to account for the advent that an IRQ arrives while
  setting backlight and hits the low pulse making it way
  too long.
---
 drivers/video/backlight/ktd253-backlight.c | 75 ++++++++++++++++------
 1 file changed, 55 insertions(+), 20 deletions(-)

diff --git a/drivers/video/backlight/ktd253-backlight.c b/drivers/video/backlight/ktd253-backlight.c
index a7df5bcca9da..37aa5a669530 100644
--- a/drivers/video/backlight/ktd253-backlight.c
+++ b/drivers/video/backlight/ktd253-backlight.c
@@ -25,6 +25,7 @@
 
 #define KTD253_T_LOW_NS (200 + 10) /* Additional 10ns as safety factor */
 #define KTD253_T_HIGH_NS (200 + 10) /* Additional 10ns as safety factor */
+#define KTD253_T_OFF_CRIT_NS 100000 /* 100 us, now it doesn't look good */
 #define KTD253_T_OFF_MS 3
 
 struct ktd253_backlight {
@@ -34,13 +35,50 @@ struct ktd253_backlight {
 	u16 ratio;
 };
 
+static void ktd253_backlight_set_max_ratio(struct ktd253_backlight *ktd253)
+{
+	gpiod_set_value_cansleep(ktd253->gpiod, 1);
+	ndelay(KTD253_T_HIGH_NS);
+	/* We always fall back to this when we power on */
+}
+
+static int ktd253_backlight_stepdown(struct ktd253_backlight *ktd253)
+{
+	/*
+	 * These GPIO operations absolutely can NOT sleep so no _cansleep
+	 * suffixes, and no using GPIO expanders on slow buses for this!
+	 *
+	 * The maximum number of cycles of the loop is 32  so the time taken
+	 * should nominally be:
+	 * (T_LOW_NS + T_HIGH_NS + loop_time) * 32
+	 *
+	 * Architectures do not always support ndelay() and we will get a few us
+	 * instead. If we get to a critical time limit an interrupt has likely
+	 * occured in the low part of the loop and we need to restart from the
+	 * top so we have the backlight in a known state.
+	 */
+	u64 ns;
+
+	ns = ktime_get_ns();
+	gpiod_set_value(ktd253->gpiod, 0);
+	ndelay(KTD253_T_LOW_NS);
+	gpiod_set_value(ktd253->gpiod, 1);
+	ns = ktime_get_ns() - ns;
+	if (ns >= KTD253_T_OFF_CRIT_NS) {
+		dev_err(ktd253->dev, "PCM on backlight took too long (%llu ns)\n", ns);
+		return -EAGAIN;
+	}
+	ndelay(KTD253_T_HIGH_NS);
+	return 0;
+}
+
 static int ktd253_backlight_update_status(struct backlight_device *bl)
 {
 	struct ktd253_backlight *ktd253 = bl_get_data(bl);
 	int brightness = backlight_get_brightness(bl);
 	u16 target_ratio;
 	u16 current_ratio = ktd253->ratio;
-	unsigned long flags;
+	int ret;
 
 	dev_dbg(ktd253->dev, "new brightness/ratio: %d/32\n", brightness);
 
@@ -62,37 +100,34 @@ static int ktd253_backlight_update_status(struct backlight_device *bl)
 	}
 
 	if (current_ratio == 0) {
-		gpiod_set_value_cansleep(ktd253->gpiod, 1);
-		ndelay(KTD253_T_HIGH_NS);
-		/* We always fall back to this when we power on */
+		ktd253_backlight_set_max_ratio(ktd253);
 		current_ratio = KTD253_MAX_RATIO;
 	}
 
-	/*
-	 * WARNING:
-	 * The loop to set the correct current level is performed
-	 * with interrupts disabled as it is timing critical.
-	 * The maximum number of cycles of the loop is 32
-	 * so the time taken will be (T_LOW_NS + T_HIGH_NS + loop_time) * 32,
-	 */
-	local_irq_save(flags);
 	while (current_ratio != target_ratio) {
 		/*
 		 * These GPIO operations absolutely can NOT sleep so no
 		 * _cansleep suffixes, and no using GPIO expanders on
 		 * slow buses for this!
 		 */
-		gpiod_set_value(ktd253->gpiod, 0);
-		ndelay(KTD253_T_LOW_NS);
-		gpiod_set_value(ktd253->gpiod, 1);
-		ndelay(KTD253_T_HIGH_NS);
-		/* After 1/32 we loop back to 32/32 */
-		if (current_ratio == KTD253_MIN_RATIO)
+		ret = ktd253_backlight_stepdown(ktd253);
+		if (ret == -EAGAIN) {
+			/*
+			 * Something disturbed the backlight setting code when
+			 * running so we need to bring the PWM back to a known
+			 * state. This shouldn't happen too much.
+			 */
+			gpiod_set_value_cansleep(ktd253->gpiod, 0);
+			msleep(KTD253_T_OFF_MS);
+			ktd253_backlight_set_max_ratio(ktd253);
+			current_ratio = KTD253_MAX_RATIO;
+		} else if (current_ratio == KTD253_MIN_RATIO) {
+			/* After 1/32 we loop back to 32/32 */
 			current_ratio = KTD253_MAX_RATIO;
-		else
+		} else {
 			current_ratio--;
+		}
 	}
-	local_irq_restore(flags);
 	ktd253->ratio = current_ratio;
 
 	dev_dbg(ktd253->dev, "new ratio set to %d/32\n", target_ratio);
-- 
2.31.1

