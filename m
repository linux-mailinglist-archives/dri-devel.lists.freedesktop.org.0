Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF22728265
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 16:11:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5380810E21C;
	Thu,  8 Jun 2023 14:11:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D679D10E21C
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 14:11:33 +0000 (UTC)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1q7GME-00084b-Ja; Thu, 08 Jun 2023 16:11:22 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Thu, 08 Jun 2023 16:11:14 +0200
Subject: [PATCH] backlight: pwm_bl: Avoid backlight flicker applying initial
 PWM state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230608-backlight-pwm-avoid-flicker-v1-1-afd380d50174@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAILhgWQC/x2NQQrDIBAAvxL23AWzhSD9SulB3TUusSZomxZC/
 l7pceYwc0CTqtLgNhxQZdema+kwXgYIyZVZULkzkKGrmYxF78KSdU4v3D5PdPuqjDFrWKQiE7Pl
 kaKlCXrBuyboqysh9UZ559zlViXq97+8P87zBwr6KW2CAAAA
To: Thierry Reding <thierry.reding@gmail.com>,
 Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
X-Mailer: b4 0.12-dev-aab37
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The initial PWM state returned by pwm_init_state() has a duty cycle
of 0 ns. To avoid backlight flicker when taking over an enabled
display from the bootloader, skip the initial pwm_apply_state()
and leave the PWM be until backlight_update_state() will apply the
state with the desired brightness.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
With a PWM driver that allows to inherit PWM state from the bootloader,
postponing the initial pwm_apply_state() with 0 ns duty cycle allows to
set the desired duty cycle before the PWM is set, avoiding a short flicker
if the backlight was previously enabled and will be enabled again.
---
 drivers/video/backlight/pwm_bl.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
index fce412234d10..47a917038f58 100644
--- a/drivers/video/backlight/pwm_bl.c
+++ b/drivers/video/backlight/pwm_bl.c
@@ -531,12 +531,10 @@ static int pwm_backlight_probe(struct platform_device *pdev)
 	if (!state.period && (data->pwm_period_ns > 0))
 		state.period = data->pwm_period_ns;
 
-	ret = pwm_apply_state(pb->pwm, &state);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to apply initial PWM state: %d\n",
-			ret);
-		goto err_alloc;
-	}
+	/*
+	 * No need to apply initial state, except in the error path.
+	 * State will be applied by backlight_update_status() on success.
+	 */
 
 	memset(&props, 0, sizeof(struct backlight_properties));
 
@@ -573,7 +571,7 @@ static int pwm_backlight_probe(struct platform_device *pdev)
 		if (ret < 0) {
 			dev_err(&pdev->dev,
 				"failed to setup default brightness table\n");
-			goto err_alloc;
+			goto err_apply;
 		}
 
 		for (i = 0; i <= data->max_brightness; i++) {
@@ -602,7 +600,7 @@ static int pwm_backlight_probe(struct platform_device *pdev)
 	if (IS_ERR(bl)) {
 		dev_err(&pdev->dev, "failed to register backlight\n");
 		ret = PTR_ERR(bl);
-		goto err_alloc;
+		goto err_apply;
 	}
 
 	if (data->dft_brightness > data->max_brightness) {
@@ -619,6 +617,8 @@ static int pwm_backlight_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, bl);
 	return 0;
 
+err_apply:
+	pwm_apply_state(pb->pwm, &state);
 err_alloc:
 	if (data->exit)
 		data->exit(&pdev->dev);

---
base-commit: ac9a78681b921877518763ba0e89202254349d1b
change-id: 20230608-backlight-pwm-avoid-flicker-d2dd8d12f826

Best regards,
-- 
Philipp Zabel <p.zabel@pengutronix.de>
