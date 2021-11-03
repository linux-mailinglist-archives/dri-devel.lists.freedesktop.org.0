Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A152444757
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 18:38:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27E4573CF5;
	Wed,  3 Nov 2021 17:38:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A12773CF5
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Nov 2021 17:38:12 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 g25-20020a9d5f99000000b0055af3d227e8so112970oti.11
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Nov 2021 10:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=usp.br; s=usp-google;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :content-transfer-encoding;
 bh=KNIg2kQ3uZauu+dnwK3HwVUo4epk3uh+4Ru2o+wrxl0=;
 b=ILGjE1hgsxqN3af/0WC7REvDKgUS7+6LqX6lOkbSBAzASsdyW8wbRImU0SNUwB48Nc
 UW6KiJ1e0JCzGrLJAm7s6Lcl5AWZoMzgIP6wE38AC4mw+sV/R5PDAcvltRJ6jH/dF3xo
 wRC7HScW0cjAz9xgavhgDhIoNYFnQg4z3q+suYLGj8tfqJdROD1MSSkMM33ig/8XpPjw
 lTlJtkgar8mgjyJdvjTp1i6eRs/WbVekjEg2Qa6VYOpmHyxHvvoeCoGI7JmOKm0N35g7
 CoDS1jynUT7ELatCQK+qEGU0rytOyhZIoxFKbYfvqNlgGEEdiKyr1CCm/mYaXKEHGVXa
 ZZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding;
 bh=KNIg2kQ3uZauu+dnwK3HwVUo4epk3uh+4Ru2o+wrxl0=;
 b=NoEOpFT83u0+mdyX7mx2p+ImCbBAIuT2WZx6R3zdwnJbwd1NWk4wqW0rXdMYUVxHFA
 MYYCxP80QGMw5ACGAnjlfYa6nUfYXFJFP83IoENFtqXjnbp8Um6Bv88WofvQsMIywUzw
 RhqFyCXo1QAK+Obs7k8b717KPI5mqjnx7p8PmVA1eZ8KtsNMkYQvX1fTntZu+7hF6lTj
 TkXtXiQY6Pr242kDl5tbfFVtLaM0WgiYOzGhdV3ZA0xriW3WAwkSIecDZxT+k3heXwSO
 H5EoCdOSIvl+aBnw+hqDpNfTQu8AR8jOCs6DyVivvpRaq4AWZOZiIi0xxGL7jpU0RTH/
 qHjA==
X-Gm-Message-State: AOAM531ona1rCciyfAojs+0PncdhxE/C/e21SH/zR8X4Yn85lAX77ZFE
 COdEL0+zaabAkCNd9cIM3U3qVA==
X-Google-Smtp-Source: ABdhPJwMefisJ6fYt8/aFM7zFKH09aYePVgs7ob6+8bNCxPG+kXZp8UpPBPULcCTaQBjsUg8VtkQsQ==
X-Received: by 2002:a05:6830:1e42:: with SMTP id
 e2mr33459329otj.41.1635961092162; 
 Wed, 03 Nov 2021 10:38:12 -0700 (PDT)
Received: from fedora ([187.64.134.142])
 by smtp.gmail.com with ESMTPSA id d7sm669920otl.19.2021.11.03.10.38.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 10:38:11 -0700 (PDT)
Date: Wed, 3 Nov 2021 14:38:05 -0300
From: =?iso-8859-1?Q?Ma=EDra?= Canal <maira.canal@usp.br>
To: daniel.thompson@linaro.org, lee.jones@linaro.org, jingoohan1@gmail.com,
 thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de
Subject: [PATCH v5] backlight: lp855x: Switch to atomic PWM API
Message-ID: <YYLI/b7KcqM8wcEB@fedora>
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
V1 -> V2: Initialize variable and simplify conditional loop
V2 -> V3: Fix assignment of NULL variable
V3 -> V4: Replace division for pwm_set_relative_duty_cycle
V4 -> V5: Fix overwrite of state.period
---
 drivers/video/backlight/lp855x_bl.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/video/backlight/lp855x_bl.c b/drivers/video/backlight/lp855x_bl.c
index e94932c69f54..e70a7b72dcf3 100644
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
@@ -245,18 +244,16 @@ static void lp855x_pwm_ctrl(struct lp855x *lp, int br, int max_br)
 
 		lp->pwm = pwm;
 
-		/*
-		 * FIXME: pwm_apply_args() should be removed when switching to
-		 * the atomic PWM API.
-		 */
-		pwm_apply_args(pwm);
+		pwm_init_state(lp->pwm, &state);
+		state.period = lp->pdata->period_ns;
+	} else {
+		pwm_get_state(lp->pwm, &state);
 	}
 
-	pwm_config(lp->pwm, duty, period);
-	if (duty)
-		pwm_enable(lp->pwm);
-	else
-		pwm_disable(lp->pwm);
+	pwm_set_relative_duty_cycle(&state, br, max_br);
+	state.enabled = state.duty_cycle;
+
+	pwm_apply_state(lp->pwm, &state);
 }
 
 static int lp855x_bl_update_status(struct backlight_device *bl)
-- 
2.31.1

