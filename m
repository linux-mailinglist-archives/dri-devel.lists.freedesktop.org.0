Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31439753A7B
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 14:14:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73B8510E880;
	Fri, 14 Jul 2023 12:14:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D51010E87B
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 12:14:49 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4fba86f069bso3117309e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 05:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689336887; x=1691928887;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u06tgDOD7cwIlWOvnR6QjrDtX4w5Uq2Dumh06lblnLk=;
 b=ZizL2KNz/0ekwzdN2fp2PsVPMxigv2//r6fIw5YtSY1gfA26UnViwFAwKYTeWE+ry1
 J1mY/W0BMGlW8T0OqGzdODUNivKMJWVH4xzAVctXIIPNatG5gHyphQ4XsGzOmMM3TQBC
 QdkyetoY5N8aa96YceojRE2LJCSb7gkwLADV5FbwXaqGaO4PX9eqx0B+WLIZVyuJtwIB
 Yc5DwxgsZboK+aMDgrgpR3EWF3o5/yyd5r6Vn8zyPoCWEuZWK+M5R3q1Sw4iDOMZBK+M
 Re87sH+EYylefiUsfAgCRdm3rVXKnp6vmCtPT4dQGA0vDErYl53o1h4V0LTIYq4ymyO4
 SYlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689336887; x=1691928887;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u06tgDOD7cwIlWOvnR6QjrDtX4w5Uq2Dumh06lblnLk=;
 b=MNn2wbiGNlhL6uA1eBR27HNcuSw3OMYw449kexpk7csiUYssKgjvwuG2x8nc4Zd2KQ
 kR2Tlo306WB9PSWmUVsnA9CPWQ5/UsZsXoKdsy7lDUfsncuER/6JuX3QeVUw1xCJCA18
 hwffKnEVBtJv+EEJGaEW7XRsezZLo6n54P3NWNdMPy/s7bnH1oofTAFG3iSvmY2yxfVH
 F8nwAZSJ33zicO3wmsHZ9M7BR6DCtK5C2Nowh5KkYYh8NcMWZaN2Rn9QY8zf5AuaKuVr
 CWOjbhkmMaAYjleegT8870IL/4Z6E+MjoCgpHNM+4pu41ldnMFYfVvkHEk3TDph4a0By
 FXLg==
X-Gm-Message-State: ABy/qLag27grnSK8BNrlwD9p/xKYHTZJy/VDat41BL26Bwke+N813WaV
 FnYuCFdJ8QCxdUc7gEXSWSMfJ+8fJW8=
X-Google-Smtp-Source: APBJJlGNPi8pSZ8rf/rWqB+YjLfzQrM1dD3D5TWqynTfLfRfWzSrKRfBIO1TOT36Zd5dZpJAfkCn3g==
X-Received: by 2002:a19:5003:0:b0:4fc:3756:754e with SMTP id
 e3-20020a195003000000b004fc3756754emr3201988lfb.56.1689336887104; 
 Fri, 14 Jul 2023 05:14:47 -0700 (PDT)
Received: from tablet.my.domain
 (ip-37-248-157-105.multi.internet.cyfrowypolsat.pl. [37.248.157.105])
 by smtp.gmail.com with ESMTPSA id
 r16-20020aa7d150000000b0051e19bf66a4sm5680666edo.83.2023.07.14.05.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 05:14:46 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
To: Lee Jones <lee@kernel.org>
Subject: [PATCH 1/2] backlight: lp855x: Initialize PWM state on first
 brightness change
Date: Fri, 14 Jul 2023 14:14:39 +0200
Message-ID: <20230714121440.7717-2-aweber.kernel@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230714121440.7717-1-aweber.kernel@gmail.com>
References: <20230714121440.7717-1-aweber.kernel@gmail.com>
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
Cc: linux-pwm@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Artur Weber <aweber.kernel@gmail.com>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As pointed out by Uwe Kleine-König[1], the changes introduced in
commit c1ff7da03e16 ("video: backlight: lp855x: Get PWM for PWM mode
during probe") caused the PWM state set up by the bootloader to be
re-set when the driver is probed. This differs from the behavior from
before that patch, where the PWM state would be initialized on the
first brightness change.

Fix this by moving the PWM state initialization into the PWM control
function. Add a new variable, needs_pwm_init, to the device info struct
to allow us to check whether we need the initialization, or whether it
has already been done.

[1] https://lore.kernel.org/lkml/20230614083953.e4kkweddjz7wztby@pengutronix.de/

Fixes: c1ff7da03e16 ("video: backlight: lp855x: Get PWM for PWM mode during probe")
Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 drivers/video/backlight/lp855x_bl.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/video/backlight/lp855x_bl.c b/drivers/video/backlight/lp855x_bl.c
index 1c9e921bca14..349ec324bc1e 100644
--- a/drivers/video/backlight/lp855x_bl.c
+++ b/drivers/video/backlight/lp855x_bl.c
@@ -71,6 +71,7 @@ struct lp855x {
 	struct device *dev;
 	struct lp855x_platform_data *pdata;
 	struct pwm_device *pwm;
+	bool needs_pwm_init;
 	struct regulator *supply;	/* regulator for VDD input */
 	struct regulator *enable;	/* regulator for EN/VDDIO input */
 };
@@ -220,7 +221,15 @@ static void lp855x_pwm_ctrl(struct lp855x *lp, int br, int max_br)
 {
 	struct pwm_state state;
 
-	pwm_get_state(lp->pwm, &state);
+	if (lp->needs_pwm_init) {
+		pwm_init_state(lp->pwm, &state);
+		/* Legacy platform data compatibility */
+		if (lp->pdata->period_ns > 0)
+			state.period = lp->pdata->period_ns;
+		lp->needs_pwm_init = false;
+	} else {
+		pwm_get_state(lp->pwm, &state);
+	}
 
 	state.duty_cycle = div_u64(br * state.period, max_br);
 	state.enabled = state.duty_cycle;
@@ -387,7 +396,6 @@ static int lp855x_probe(struct i2c_client *cl)
 	const struct i2c_device_id *id = i2c_client_get_device_id(cl);
 	const struct acpi_device_id *acpi_id = NULL;
 	struct device *dev = &cl->dev;
-	struct pwm_state pwmstate;
 	struct lp855x *lp;
 	int ret;
 
@@ -470,15 +478,11 @@ static int lp855x_probe(struct i2c_client *cl)
 		else
 			return dev_err_probe(dev, ret, "getting PWM\n");
 
+		lp->needs_pwm_init = false;
 		lp->mode = REGISTER_BASED;
 		dev_dbg(dev, "mode: register based\n");
 	} else {
-		pwm_init_state(lp->pwm, &pwmstate);
-		/* Legacy platform data compatibility */
-		if (lp->pdata->period_ns > 0)
-			pwmstate.period = lp->pdata->period_ns;
-		pwm_apply_state(lp->pwm, &pwmstate);
-
+		lp->needs_pwm_init = true;
 		lp->mode = PWM_BASED;
 		dev_dbg(dev, "mode: PWM based\n");
 	}
-- 
2.41.0

