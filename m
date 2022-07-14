Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CF45757A9
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jul 2022 00:30:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A246D10E0A8;
	Thu, 14 Jul 2022 22:30:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9102D10E0A8
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 22:30:14 +0000 (UTC)
Received: from mx0.riseup.net (mx0-pn.riseup.net [10.0.1.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mx0.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4LkStK0cDQzDrff
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 21:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1657835625; bh=Ex8sIbN7b3m/ryXhpiacHfviSvoH7OHIsjjT3wLtN/o=;
 h=From:To:Cc:Subject:Date:From;
 b=oR7vvOz7jLJOl1v9DVgEzyVj1trqCsMaNpRoUnFxce/NzPzGLxNi/xu4c6dCd9Fb/
 RBrths/1uTQiS9D91GEd4cKLa9bMQvXwlTPTFkByks9Pj+apPrwQkpeOpgJrkQjKjH
 3LjL+pVODd4amcH8ABYXIq+btTM2p8asbkPzk9PI=
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4LkStJ34j8z9tCY;
 Thu, 14 Jul 2022 21:53:44 +0000 (UTC)
X-Riseup-User-ID: B2AE8FB5CD960AF3F6CB82DB39E7CC9A82DE79F371A66BF223551A361A6589AF
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4LkStD4pQTz5vW1;
 Thu, 14 Jul 2022 21:53:40 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>
To: daniel.thompson@linaro.org, lee.jones@linaro.org, jingoohan1@gmail.com,
 thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de
Subject: [PATCH RESEND v6] backlight: lp855x: Switch to atomic PWM API
Date: Thu, 14 Jul 2022 18:53:34 -0300
Message-Id: <20220714215334.78226-1-mairacanal@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove legacy PWM interface (pwm_config, pwm_enable, pwm_disable) and
replace it for the atomic PWM API.

Reviewed-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Maíra Canal <mairacanal@riseup.net>
---
V1 -> V2: Initialize variable and simplify conditional loop
V2 -> V3: Fix assignment of NULL variable
V3 -> V4: Replace division for pwm_set_relative_duty_cycle
V4 -> V5: Fix overwrite of state.period
V5 -> V6: Fix duty cycle rounding and set period outside conditional loop
---
 drivers/video/backlight/lp855x_bl.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/video/backlight/lp855x_bl.c b/drivers/video/backlight/lp855x_bl.c
index 2b9e2bbbb03e..fc02c5c16055 100644
--- a/drivers/video/backlight/lp855x_bl.c
+++ b/drivers/video/backlight/lp855x_bl.c
@@ -218,9 +218,8 @@ static int lp855x_configure(struct lp855x *lp)
 
 static void lp855x_pwm_ctrl(struct lp855x *lp, int br, int max_br)
 {
-	unsigned int period = lp->pdata->period_ns;
-	unsigned int duty = br * period / max_br;
 	struct pwm_device *pwm;
+	struct pwm_state state;
 
 	/* request pwm device with the consumer name */
 	if (!lp->pwm) {
@@ -230,18 +229,16 @@ static void lp855x_pwm_ctrl(struct lp855x *lp, int br, int max_br)
 
 		lp->pwm = pwm;
 
-		/*
-		 * FIXME: pwm_apply_args() should be removed when switching to
-		 * the atomic PWM API.
-		 */
-		pwm_apply_args(pwm);
+		pwm_init_state(lp->pwm, &state);
+	} else {
+		pwm_get_state(lp->pwm, &state);
 	}
 
-	pwm_config(lp->pwm, duty, period);
-	if (duty)
-		pwm_enable(lp->pwm);
-	else
-		pwm_disable(lp->pwm);
+	state.period = lp->pdata->period_ns;
+	state.duty_cycle = div_u64(br * state.period, max_br);
+	state.enabled = state.duty_cycle;
+
+	pwm_apply_state(lp->pwm, &state);
 }
 
 static int lp855x_bl_update_status(struct backlight_device *bl)
-- 
2.36.1

