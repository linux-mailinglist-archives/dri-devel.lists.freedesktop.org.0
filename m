Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEA2440927
	for <lists+dri-devel@lfdr.de>; Sat, 30 Oct 2021 15:35:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE9876EAC0;
	Sat, 30 Oct 2021 13:35:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 750286EAC0
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Oct 2021 13:35:11 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 a17-20020a4a6851000000b002b59bfbf669so4402331oof.9
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Oct 2021 06:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=usp.br; s=usp-google;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :content-transfer-encoding;
 bh=Nev+29M1Y1dwB8aNLPolRw0Uq6JykoAuwC6Ewa8Lyr0=;
 b=tNFwRZaatxKVz+oal5PP8bXPiWaWArv8l8l//iYUmI1e07rxYIh+AOmCklpCDd359F
 Nyo97MskPgcjPSiR5JYaJjW8B2GRH4Glr2gnWteoASulUpMxyxSV4wViJyG8v4zJ+R/Q
 ulq5j2//v4gpeiRRB3zAUAL/NtgOx+FzNJ7WEuiUVlLdz8IP0X9oW0WKUptbyonTRsXU
 Ey9+p6E7Ju5AoIcPWXtmAZGbFpr4eGGWyT6A98fLVz+ub//9rggqvBLMgjij9sBEQ/Hg
 vhU/u3h53AKVOQJxkjVS9E0TOjNl7sXB8TysTB1sUCb6KOPsaYwvS4MYYquJv1oiMqkC
 3upA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding;
 bh=Nev+29M1Y1dwB8aNLPolRw0Uq6JykoAuwC6Ewa8Lyr0=;
 b=mscNV3VS8xJ4ZksSiCIy5caor2R4pho295MuiPGTtE6YZxd3yIe8B1+Ro9HFzPa2Qx
 yaBjFn7vftw/6+Vem1c8h5phqGyLyHJ3wYuBFMAZYPtvckJFCIGBHmPJ+d9eRR+A7ats
 XIQSxWwGwEb06y02pWVdZYA2/EAdqkO/qodivUMy97Y58MEWPABtUBfJB8Tg1lKagmQ/
 Uutvqi1gjE5uNdjv/2tqqRLHcWBDrfMG8mAYc3b9S5RcSxMlj8ucd0YrTFlobJKUPy+I
 hMMJSAUXOFaOwpPgkh4pMga+yzOEBNkQine8fBwpiEqHcbA73/dYy5Kk9M6OSqNwKL3W
 Jmlg==
X-Gm-Message-State: AOAM532JV/kI1yQc2bHv7ih80Ys1pxBV2R13I2bPxoqpaCbelh9yxxcC
 CeDMoyl0sutCR5hFKOeW8mUMoQ==
X-Google-Smtp-Source: ABdhPJwjjpBHKPmKcM3z74OuzMIlzc4ezhVJZqYnZiGJnG1xoug8fjPSJXFIFEjPjxIBspnt8rzQqQ==
X-Received: by 2002:a4a:d51a:: with SMTP id m26mr11795989oos.84.1635600910990; 
 Sat, 30 Oct 2021 06:35:10 -0700 (PDT)
Received: from fedora ([187.64.134.142])
 by smtp.gmail.com with ESMTPSA id u15sm2792185oon.35.2021.10.30.06.35.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 06:35:10 -0700 (PDT)
Date: Sat, 30 Oct 2021 10:35:05 -0300
From: =?iso-8859-1?Q?Ma=EDra?= Canal <maira.canal@usp.br>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: [PATCH v3] backlight: lp855x: Switch to atomic PWM API
Message-ID: <YX1KCclMB/HTZ22c@fedora>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove legacy PWM interface (pwm_config, pwm_enable, pwm_disable) and
replace it for the atomic PWM API.

Signed-off-by: Maíra Canal <maira.canal@usp.br>
---
V1 -> V2: Initialize variable and simply conditional loop
V2 -> V3: Fix assignment of NULL variable
---
 drivers/video/backlight/lp855x_bl.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/video/backlight/lp855x_bl.c b/drivers/video/backlight/lp855x_bl.c
index e94932c69f54..627a31d05691 100644
--- a/drivers/video/backlight/lp855x_bl.c
+++ b/drivers/video/backlight/lp855x_bl.c
@@ -233,9 +233,8 @@ static int lp855x_configure(struct lp855x *lp)
 
 static void lp855x_pwm_ctrl(struct lp855x *lp, int br, int max_br)
 {
-	unsigned int period = lp->pdata->period_ns;
-	unsigned int duty = br * period / max_br;
-	struct pwm_device *pwm;
+	struct pwm_device *pwm = NULL;
+	struct pwm_state state;
 
 	/* request pwm device with the consumer name */
 	if (!lp->pwm) {
@@ -245,18 +244,16 @@ static void lp855x_pwm_ctrl(struct lp855x *lp, int br, int max_br)
 
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
+
+	state.duty_cycle = br * state.period / max_br;
+	state.enabled = state.duty_cycle;
+
+	pwm_apply_state(lp->pwm, &state);
 }
 
 static int lp855x_bl_update_status(struct backlight_device *bl)
-- 
2.31.1

