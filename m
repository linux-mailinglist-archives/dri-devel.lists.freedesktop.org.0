Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7CF43847F
	for <lists+dri-devel@lfdr.de>; Sat, 23 Oct 2021 19:36:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08D246E0CF;
	Sat, 23 Oct 2021 17:35:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com
 [IPv6:2607:f8b0:4864:20::92b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B936E82A
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Oct 2021 13:48:44 +0000 (UTC)
Received: by mail-ua1-x92b.google.com with SMTP id b4so861302uaq.9
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Oct 2021 06:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=usp.br; s=usp-google;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :content-transfer-encoding;
 bh=iX6cmvyeDuJOkrf+xUpE4t3ouX8J2Wth4BJQBEZvdC0=;
 b=PJeoeHi87FNVFRvOrlMgjLSB19zOHxvaqVaQoUrbBe4NYsqIzVz13D19jqP7YYPmwm
 bfOeMMKrEDvAySkNkHtCod8Valdbum9uQXv6b4ehR91WNPb5RyQHcNY21EqgWoAeml9C
 1bFNYL6FXCBfcemkgqOhOGE3NdntABHsUYg3NTdi36gfFBk/ORKUVxzJnwhDISNtuEcg
 sK0Y0LIgTc+8oLv4H5GSpEnV67xHMeZV3OCAKSYuxVsQ2MO5QxQozKNP77ObQ8gJ1wAO
 ZO2LNyw8+Bex+C7bDFkZ4CqHqYmpMNq5XBOD0utmjYZigVejjziwpqx5ocw9i4Fzx+0X
 gKEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding;
 bh=iX6cmvyeDuJOkrf+xUpE4t3ouX8J2Wth4BJQBEZvdC0=;
 b=KYXA8+05azJExykDUJsclu8fVAj6HHUrYk4tqBs3rYbNqsP5+MWEmwaVnw445h2gP8
 cdOrTGsEbNZcleh9JGcqIlIbEWpceDU6ij/NPbO9i6mGK9ojWi4NgQ3yfZ14m6dLl8FG
 1xL5YxD4hxN9sSlzUP/2Nt72P6Z8F3dydLDEEtAP7Ldu9kLWqU5KZ7QuLAIYhG/JNZeV
 RLrFbM/vgWB23sE5v4j/mRdx/I6rmZxyXqxzrVhGkJywMEK/Qfj/QNracgflopiDXNZT
 9/uWULyCrsYItoRHNYcvL0D+qBD4OPhX9aZLVwa1WeCfAeTIIttpRHXASchU8at27Q+i
 7ObA==
X-Gm-Message-State: AOAM531eDX3Vm3DTjyxWF9EEic7pPFOMJfZXMIiRycByjxJN34Q2ibJ1
 +NQ4RYS5SQyf2vnSndTpSlwJ5w==
X-Google-Smtp-Source: ABdhPJwxdDl4z01c9F66VI9AyRP7pXIo6Ntzy4KZdke4zr3ikYJXWWXs5oUwbePIExZg4WIuUSkp0A==
X-Received: by 2002:a67:ea0b:: with SMTP id g11mr6728954vso.2.1634996923166;
 Sat, 23 Oct 2021 06:48:43 -0700 (PDT)
Received: from fedora ([187.64.134.142])
 by smtp.gmail.com with ESMTPSA id m184sm6687249vsc.6.2021.10.23.06.48.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Oct 2021 06:48:42 -0700 (PDT)
Date: Sat, 23 Oct 2021 10:48:38 -0300
From: =?iso-8859-1?Q?Ma=EDra?= Canal <maira.canal@usp.br>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 thierry.reding@gmail.com
Cc: u.kleine-koenig@pengutronix.de, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: [PATCH] backlight: lp855x: Switch to atomic PWM API
Message-ID: <YXQStu5yv4bwj2Tn@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 23 Oct 2021 17:35:54 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove legacy PWM interface (pwm_config, pwm_enable, pwm_disable) and
replace it for the atomic PWM API.

Signed-off-by: Maíra Canal <maira.canal@usp.br>
---
 drivers/video/backlight/lp855x_bl.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/video/backlight/lp855x_bl.c b/drivers/video/backlight/lp855x_bl.c
index e94932c69f54..dd63141a0d26 100644
--- a/drivers/video/backlight/lp855x_bl.c
+++ b/drivers/video/backlight/lp855x_bl.c
@@ -236,6 +236,7 @@ static void lp855x_pwm_ctrl(struct lp855x *lp, int br, int max_br)
 	unsigned int period = lp->pdata->period_ns;
 	unsigned int duty = br * period / max_br;
 	struct pwm_device *pwm;
+	struct pwm_state state;
 
 	/* request pwm device with the consumer name */
 	if (!lp->pwm) {
@@ -244,19 +245,19 @@ static void lp855x_pwm_ctrl(struct lp855x *lp, int br, int max_br)
 			return;
 
 		lp->pwm = pwm;
-
-		/*
-		 * FIXME: pwm_apply_args() should be removed when switching to
-		 * the atomic PWM API.
-		 */
-		pwm_apply_args(pwm);
 	}
 
-	pwm_config(lp->pwm, duty, period);
+	pwm_init_state(pwm, &state);
+
+	state.duty_cycle = duty;
+	state.period = period;
+
 	if (duty)
-		pwm_enable(lp->pwm);
+		state.enabled = true;
 	else
-		pwm_disable(lp->pwm);
+		state.enabled = false;
+
+	pwm_apply_state(pwm, &state);
 }
 
 static int lp855x_bl_update_status(struct backlight_device *bl)
-- 
2.31.1

