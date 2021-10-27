Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B624D43D108
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 20:45:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 961136E81D;
	Wed, 27 Oct 2021 18:45:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C1896E81D
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 18:45:47 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id v2so2399202qve.11
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 11:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=usp.br; s=usp-google;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :content-transfer-encoding;
 bh=A8jRX0QKAYjn4xUH+e8/6epT1HZFBjy/zHPwJDB1y2I=;
 b=K7U4qb/VrSu9y/l5QSpg4GLpjpE4DHWO65bczNlJoB1bhg0hrBqn3A2T9fiY4T9G1g
 seete8LDVmbo2J1tkmUUXb9HYEP8271eMBDURzJpf5RxcTnfL7vxJJPZS7FPEvONUtud
 nRu15MNY7Qnclb5uhqiaNzLfSszJN3m+M5eaNSngck+D+4grh5sOhleX8EODccBJs2FN
 e/05bu5jx8ovF5sjSKKVwJB0UFhySD55QjgCEYrHriMh+olhHW3nyVUzF5iRdD5bNI5n
 rZ/O0E7ucfpdN4GUAqb5oTr6AHd8AkSJRCpU8Ls4lDq5Gg2fr7xWHHZJZ2oPH8I4Qil4
 zvEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding;
 bh=A8jRX0QKAYjn4xUH+e8/6epT1HZFBjy/zHPwJDB1y2I=;
 b=r194mzNESoHenb6471ZPIZyEoSv15QGaHrOKRaKV1Jgwvz+hyoKMmmnxPi0HyIlnU0
 MLboGyOlWqvBTc2TfS9irqrKyGRotAkDP2xx9b/rxqc2QukgRBMkSd/tr93Hv0XDB0zg
 zc+xF/Mj3Omz1yGJfD+trZxfSGqEdIgGEg3WKFZS5RrHJcQvHBElyYeTamT5H7QuGHP/
 p91qamsoX8GwBqs/qrKBW4PZxtMFKXLLVB5J9qKk5LGQRUXEeGvYZM85b7mAG3ykVfnv
 fevIliOL8uZQ4CvKVdWq27vBQ11u5azGIMD5DKjLq7TCCBS8Zuh+ytt0FjN1CKpTdNNx
 PpNQ==
X-Gm-Message-State: AOAM530K+ebicdUdHSHi9VK8i6JzYDyFwAcOuFuCgFyuBCHu/25Ubssw
 yIe3um9LdrG4gFig8q3maNrJFA==
X-Google-Smtp-Source: ABdhPJxctVR5Fb0BHbs0MVwHi/Q9mP9WYyhqidbxuJ/DJ9RSpTJk1zR1ZuujvluUZFWvXr0TH+VRow==
X-Received: by 2002:a05:6214:cce:: with SMTP id
 14mr31764551qvx.49.1635360346759; 
 Wed, 27 Oct 2021 11:45:46 -0700 (PDT)
Received: from fedora ([187.64.134.142])
 by smtp.gmail.com with ESMTPSA id i67sm461196qkd.90.2021.10.27.11.45.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 11:45:46 -0700 (PDT)
Date: Wed, 27 Oct 2021 15:45:40 -0300
From: =?iso-8859-1?Q?Ma=EDra?= Canal <maira.canal@usp.br>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de
Cc: lkp@intel.com, llvm@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: [PATCH v2] backlight: lp855x: Switch to atomic PWM API
Message-ID: <YXmeVPIroq96BXfm@fedora>
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
Reported-by: kernel test robot <lkp@intel.com>
---
V1 -> V2: Initializing variable and simplyfing conditional loop
---
 drivers/video/backlight/lp855x_bl.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/video/backlight/lp855x_bl.c b/drivers/video/backlight/lp855x_bl.c
index e94932c69f54..a895a8ca6d26 100644
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
@@ -244,19 +243,15 @@ static void lp855x_pwm_ctrl(struct lp855x *lp, int br, int max_br)
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
-	if (duty)
-		pwm_enable(lp->pwm);
-	else
-		pwm_disable(lp->pwm);
+	pwm_init_state(pwm, &state);
+
+	state.period = lp->pdata->period_ns;
+	state.duty_cycle = br * state.period / max_br;
+	state.enabled = state.duty_cycle;
+
+	pwm_apply_state(pwm, &state);
 }
 
 static int lp855x_bl_update_status(struct backlight_device *bl)
-- 
2.31.1

