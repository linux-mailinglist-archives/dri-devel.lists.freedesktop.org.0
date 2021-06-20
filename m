Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAAB3AE00F
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jun 2021 21:40:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0244D89D89;
	Sun, 20 Jun 2021 19:40:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB6A889D89
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jun 2021 19:40:38 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1lv3J5-0001PU-GS; Sun, 20 Jun 2021 21:40:35 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1lv3J4-0002I9-Dt; Sun, 20 Jun 2021 21:40:34 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>
Subject: [PATCH v2 2/2] backlight: lm3630a: convert to atomic PWM API and
 check for errors
Date: Sun, 20 Jun 2021 21:39:28 +0200
Message-Id: <20210620193928.14467-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210620193928.14467-1-u.kleine-koenig@pengutronix.de>
References: <20210620193928.14467-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: linux-fbdev@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The practical upside here is that this only needs a single API call to
program the hardware which (depending on the underlaying hardware) can
be more effective and prevents glitches.

Up to now the return value of the pwm functions was ignored. Fix this
and propagate the error to the caller.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/video/backlight/lm3630a_bl.c | 34 +++++++++++++---------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/video/backlight/lm3630a_bl.c b/drivers/video/backlight/lm3630a_bl.c
index 16a2658a72e1..99eb8277149b 100644
--- a/drivers/video/backlight/lm3630a_bl.c
+++ b/drivers/video/backlight/lm3630a_bl.c
@@ -52,6 +52,7 @@ struct lm3630a_chip {
 	struct gpio_desc *enable_gpio;
 	struct regmap *regmap;
 	struct pwm_device *pwmd;
+	struct pwm_state pwmd_state;
 };
 
 /* i2c access */
@@ -167,16 +168,19 @@ static int lm3630a_intr_config(struct lm3630a_chip *pchip)
 	return rval;
 }
 
-static void lm3630a_pwm_ctrl(struct lm3630a_chip *pchip, int br, int br_max)
+static int lm3630a_pwm_ctrl(struct lm3630a_chip *pchip, int br, int br_max)
 {
-	unsigned int period = pchip->pdata->pwm_period;
-	unsigned int duty = br * period / br_max;
+	int err;
 
-	pwm_config(pchip->pwmd, duty, period);
-	if (duty)
-		pwm_enable(pchip->pwmd);
-	else
-		pwm_disable(pchip->pwmd);
+	pchip->pwmd_state.period = pchip->pdata->pwm_period;
+
+	err = pwm_set_relative_duty_cycle(&pchip->pwmd_state, br, br_max);
+	if (err)
+		return err;
+
+	pchip->pwmd_state.enabled = pchip->pwmd_state.duty_cycle ? true : false;
+
+	return pwm_apply_state(pchip->pwmd, &pchip->pwmd_state);
 }
 
 /* update and get brightness */
@@ -187,11 +191,9 @@ static int lm3630a_bank_a_update_status(struct backlight_device *bl)
 	enum lm3630a_pwm_ctrl pwm_ctrl = pchip->pdata->pwm_ctrl;
 
 	/* pwm control */
-	if ((pwm_ctrl & LM3630A_PWM_BANK_A) != 0) {
-		lm3630a_pwm_ctrl(pchip, bl->props.brightness,
-				 bl->props.max_brightness);
-		return 0;
-	}
+	if ((pwm_ctrl & LM3630A_PWM_BANK_A) != 0)
+		return lm3630a_pwm_ctrl(pchip, bl->props.brightness,
+					bl->props.max_brightness);
 
 	/* disable sleep */
 	ret = lm3630a_update(pchip, REG_CTRL, 0x80, 0x00);
@@ -563,11 +565,7 @@ static int lm3630a_probe(struct i2c_client *client,
 			return PTR_ERR(pchip->pwmd);
 		}
 
-		/*
-		 * FIXME: pwm_apply_args() should be removed when switching to
-		 * the atomic PWM API.
-		 */
-		pwm_apply_args(pchip->pwmd);
+		pwm_init_state(pchip->pwmd, &pchip->pwmd_state);
 	}
 
 	/* interrupt enable  : irq 0 is not allowed */
-- 
2.30.2

