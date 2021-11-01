Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22260441B9B
	for <lists+dri-devel@lfdr.de>; Mon,  1 Nov 2021 14:19:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A446E158;
	Mon,  1 Nov 2021 13:19:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B146E151
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Nov 2021 13:19:28 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id n15so2935938qkp.12
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Nov 2021 06:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=usp.br; s=usp-google;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :content-transfer-encoding;
 bh=TtX9VhCBKuhF3Ol7gnPYFLRhj5nFsqp3SrQe6dqQFXM=;
 b=ZnSQtUuzlxpPJR1GQQpbQSUoHtb09P8H7VrR18O2ahTTXRWmIDnxQOQgnULadzL610
 JTN6lYue33HVu7p8L3y+810xNbHrJ19Tbeg/nOHqdYm3ftynFUO/NzeHUfMkEmSBM0as
 ixAQxM3YbNoJXyv6pSbwPGcTlgAAOJXCqc13eV7HVkg/mau8AHrgfsWxgHABcrz2rwRh
 UeEIEFLjysCIxUATqgwwbyaCpZHBJytSLFFgeo2NtXcSey60XzPh+fJHD56twsIX7o+/
 PaI3j9470t9hHKW9dYvhUboq8DOEMMJw2ouHi3SnG6XPpzRVJ/ugKM+EZj1UusPbJosC
 Qq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding;
 bh=TtX9VhCBKuhF3Ol7gnPYFLRhj5nFsqp3SrQe6dqQFXM=;
 b=8MnlVX3q2ADYjxKZCpiPpSlEiHT2+Ye0yBS6/mwaN07TsSjAZf/XPgKUutcCrS7gQX
 gld6WA6+MXr7orUxa9rmQ6TOtFAThn3fao93YUV1Cs0sVkmkZ2dDkGccc9EXBlZBiRNT
 +L8pylD9ZE4EjW1y0Ff/owJDVV9rRW1CqHuzNGuGAK5ce6s6BH1cSlV/AW3tHA4zINJT
 3PUCrrQjwt155GU6LCSLUA5oSrWZyf1FGo1csuWGwLv5RFrbeEHvGE9c41AhPeaULRQc
 MW9B/ILWpPExcvU2sJAWSnykMXDerfeJFHw1vZJ8WjYugkHesuSTFTLU33z/lwenhTXl
 +mXw==
X-Gm-Message-State: AOAM530g15B47FoPjZU3yAMbkOSyCxZ7MU+Lwiw6oNwjLEWOeKPYJxic
 EmhAs/j4DMbWYchwBbasPX5u6g==
X-Google-Smtp-Source: ABdhPJwRu8kRDMOftlvRTysjNpt3BbtoelDYP69+cdAc8RNpfvYVVPhdMVgDl11Rbi0bEU43xN5/Tg==
X-Received: by 2002:a05:620a:1999:: with SMTP id
 bm25mr23030512qkb.40.1635772767335; 
 Mon, 01 Nov 2021 06:19:27 -0700 (PDT)
Received: from fedora ([187.64.134.142])
 by smtp.gmail.com with ESMTPSA id h17sm4185790qtx.64.2021.11.01.06.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 06:19:27 -0700 (PDT)
Date: Mon, 1 Nov 2021 10:19:21 -0300
From: =?iso-8859-1?Q?Ma=EDra?= Canal <maira.canal@usp.br>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de
Subject: [PATCH v4] backlight: lp855x: Switch to atomic PWM API
Message-ID: <YX/pWeXPv1bykg2g@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove legacy PWM interface (pwm_config, pwm_enable, pwm_disable) and
replace it for the atomic PWM API.

Signed-off-by: Maíra Canal <maira.canal@usp.br>
---
V1 -> V2: Initialize variable and simply conditional loop
V2 -> V3: Fix assignment of NULL variable
V3 -> V4: Replace division for pwm_set_relative_duty_cycle
---
 drivers/video/backlight/lp855x_bl.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/video/backlight/lp855x_bl.c b/drivers/video/backlight/lp855x_bl.c
index e94932c69f54..bbf24564082a 100644
--- a/drivers/video/backlight/lp855x_bl.c
+++ b/drivers/video/backlight/lp855x_bl.c
@@ -233,9 +233,8 @@ static int lp855x_configure(struct lp855x *lp)
 
 static void lp855x_pwm_ctrl(struct lp855x *lp, int br, int max_br)
 {
-	unsigned int period = lp->pdata->period_ns;
-	unsigned int duty = br * period / max_br;
 	struct pwm_device *pwm;
+	struct pwm_state state;
 
 	/* request pwm device with the consumer name */
 	if (!lp->pwm) {
@@ -245,18 +244,15 @@ static void lp855x_pwm_ctrl(struct lp855x *lp, int br, int max_br)
 
 		lp->pwm = pwm;
 
-		/*
-		 * FIXME: pwm_apply_args() should be removed when switching to
-		 * the atomic PWM API.
-		 */
-		pwm_apply_args(pwm);
+		pwm_init_state(lp->pwm, &state);
+		state.period = lp->pdata->period_ns;
 	}
 
-	pwm_config(lp->pwm, duty, period);
-	if (duty)
-		pwm_enable(lp->pwm);
-	else
-		pwm_disable(lp->pwm);
+	pwm_get_state(lp->pwm, &state);
+	pwm_set_relative_duty_cycle(&state, br, max_br);
+	state.enabled = state.duty_cycle;
+
+	pwm_apply_state(lp->pwm, &state);
 }
 
 static int lp855x_bl_update_status(struct backlight_device *bl)
-- 
2.31.1

