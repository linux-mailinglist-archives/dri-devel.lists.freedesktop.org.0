Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8193E39AE5E
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 00:46:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFB4B6F53F;
	Thu,  3 Jun 2021 22:46:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 432C06F53F
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 22:46:39 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id c11so9122083ljd.6
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jun 2021 15:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DfhY/QNJwoAcR0w/J0pS6U38bj1S77B4Ht7nL6DWsLo=;
 b=E8AGxvpRnNYLKhu04jhQNO2Mt//q2iJkK3GvTiCnPc7lfDRJWS+zxS4YLKRBZb3di3
 hEdguPkdo2wPV112Ng8DWjJOjeybRfUJOmGTP3bqDX920ED+tG4mzVu2wsW6ufWrJElM
 jptsycj3jLvj4BI/RPnSqtU5Sw6HHjAY65nu1eZfphhDoEcpvwzG6L3Ond2HrMdH9mc7
 BdjjxFcG/nSVz402bqmWvRVjp7QQ03dIbP7EmCp0mAybnTKEBdXKhE+kixYh9SvLVl7c
 ob1tag+CDB2LMOD81Ec8K028+ldxTlEtaYToHcMNyDLUlIfPCflemr7WnBjPFx9cYhdc
 9JBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DfhY/QNJwoAcR0w/J0pS6U38bj1S77B4Ht7nL6DWsLo=;
 b=S4PrZMHq9DvdHwAK+XK20sTqLAXowNBsWhjvIaKJuv4LKrnv1skDxqHoyzzJqJsRfJ
 KX3wTdB7Fdy1WxV0nFAifopk0VW2FQWDyxxkM2Q18Ci57o5oNDQT1+unyOVOgegyGdPN
 adfUPoWKgkZVOdW3AaEEeyh9TCpWUZmqH5PPUAwK0AQyMFvkOG76Pllxc0S7h/bZUHpj
 7qCb20nhp7zla8ie2jy6OiHBfw4PW6G3d86uwowi8JaCa8KqrV93RI4lHi75umIkn9bJ
 KXYYaM1RZGg/QqvWNOvA/23oZ293hGF1smrd5i2o2blQsHFS/hSP0Hkerl0HltQo5zTx
 6uMw==
X-Gm-Message-State: AOAM533wmJwiUVTESFA0qsDqnz1Bn8ruKyBBqkGGV0v4Z43b561rQ2+b
 JvABtQmZr+1YCjAXcpkyU6ivmg==
X-Google-Smtp-Source: ABdhPJxRT6gfHdN3xSo/ORYCBDnIQt8hcLXvqYB1XMdoKGpU6Toe6iv9hLBXLy4z28W1+TsqTGKuuQ==
X-Received: by 2002:a2e:9ec4:: with SMTP id h4mr1104318ljk.442.1622760397541; 
 Thu, 03 Jun 2021 15:46:37 -0700 (PDT)
Received: from localhost.localdomain
 (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
 by smtp.gmail.com with ESMTPSA id z13sm502099lji.115.2021.06.03.15.46.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 15:46:37 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH v2] backlight: ktd253: Stabilize backlight
Date: Fri,  4 Jun 2021 00:43:48 +0200
Message-Id: <20210603224348.3165584-1-linus.walleij@linaro.org>
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
ChangeLog v1->v2:
- Alter the dimming code to check for how many ns the pulse
  is low, and if it gets to ~100 us then redo from start.
  This is to account for the advent that an IRQ arrives while
  setting backlight and hits the low pulse making it way
  too long.
---
 drivers/video/backlight/ktd253-backlight.c | 70 ++++++++++++++++------
 1 file changed, 53 insertions(+), 17 deletions(-)

diff --git a/drivers/video/backlight/ktd253-backlight.c b/drivers/video/backlight/ktd253-backlight.c
index a7df5bcca9da..dca19769846e 100644
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
 
@@ -62,37 +100,35 @@ static int ktd253_backlight_update_status(struct backlight_device *bl)
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
+		}
+
 		/* After 1/32 we loop back to 32/32 */
 		if (current_ratio == KTD253_MIN_RATIO)
 			current_ratio = KTD253_MAX_RATIO;
 		else
 			current_ratio--;
 	}
-	local_irq_restore(flags);
 	ktd253->ratio = current_ratio;
 
 	dev_dbg(ktd253->dev, "new ratio set to %d/32\n", target_ratio);
-- 
2.31.1

