Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3490709EEB
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 20:09:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A15ED10E5DC;
	Fri, 19 May 2023 18:09:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F40710E5DC
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 18:09:26 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-510c734fa2dso2339249a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 11:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684519764; x=1687111764;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vE2czkRUGQFVQ3kTZwHE+KiPxSvXioMK05vHyS7BUOM=;
 b=HmKe4ZBvFoFR+AEbrNRMOVUmVCOfY9dOl0ifMdl0i5+dBtYkuP1jcEF4rnFUsNZv07
 zCyywr+WtfKmuv9ls9b7XAlBJn3sgwaoidVwMOJG6H/KpYU5zjW+iRiqqY/wlUDMNh1e
 ZlTy7bdUDq2gbPlVYhxnl4E4IZ8fzGj2JffgpxIVDxCtdddaAzxGiRuI5oebrt7h8Ah/
 wCWGJJBSfrC5bg51AxrCqen5EPFsNMlMGptE2jvU/CGPW748YMxyUDY7ahth7b8AXzuN
 5j/6T1z1usf/Yw3LcBCLjIEAgEGzVozB9OwmYfaWwnntU8dDf+S/ZJp5RxywM56KBjjj
 oWkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684519764; x=1687111764;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vE2czkRUGQFVQ3kTZwHE+KiPxSvXioMK05vHyS7BUOM=;
 b=O/x9Mcd+vjWz6MpSj9863NqOk6E3xHydGNtak07/kJt87cYIQVB70AcAt5OPq5ClQa
 rwHhPNDvwMmnIF9Ytlo/4DcC5xSzISqZ6DnynEDLvFySi6S8pF1Zc0IUTDQDpsFE8yIK
 xlDpWljiFFUmvk2vAzyDc/cnxyrO8nnq2jXYN34E1yJ2XRsn/RHo/twNKUckw4H6Vw6W
 +lmhx6tUmayBpuTb6qmomLSitV+qwaaSMOfE6siBQOj9vbeLcioClHl78iKT9SR5YYaj
 +IQs7AdFoWXZI3W/CTf137q4d+zb69v80wVmyM0Q7dtxLuHawUyJfb8VQYLFsARoaTqV
 Y7yw==
X-Gm-Message-State: AC+VfDyW3cEmSRhOib7T54NtVSW8knoWdgwAbYLPByuLRpkT59x68beo
 y2HyF0zSnP62QaaK/PGbOFM=
X-Google-Smtp-Source: ACHHUZ62zfEHo+Fh34se+ZKL6eKs9Vh2UrEwRcPyiOf+P8tgH5Q/5Ol4xlTzjlmomEvGVyUiwILyRA==
X-Received: by 2002:a05:6402:190c:b0:506:bbf8:5152 with SMTP id
 e12-20020a056402190c00b00506bbf85152mr9819481edz.9.1684519763945; 
 Fri, 19 May 2023 11:09:23 -0700 (PDT)
Received: from localhost.my.domain (83.11.222.198.ipv4.supernova.orange.pl.
 [83.11.222.198]) by smtp.gmail.com with ESMTPSA id
 g26-20020aa7c85a000000b0050690bc07a3sm19824edt.18.2023.05.19.11.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 11:09:23 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 2/4] video: backlight: lp855x: get PWM for PWM mode during
 probe
Date: Fri, 19 May 2023 20:07:26 +0200
Message-Id: <20230519180728.2281-3-aweber.kernel@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519180728.2281-1-aweber.kernel@gmail.com>
References: <20230519180728.2281-1-aweber.kernel@gmail.com>
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
Cc: linux-arm-msm@vger.kernel.org, Luca Weiss <luca@z3ntu.xyz>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Artur Weber <aweber.kernel@gmail.com>, devicetree@vger.kernel.org,
 Jingoo Han <jingoohan1@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-fbdev@vger.kernel.org,
 Andy Gross <agross@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht, Pavel Machek <pavel@ucw.cz>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-tegra@vger.kernel.org, linux-pwm@vger.kernel.org,
 Helge Deller <deller@gmx.de>, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Also deprecate the pwm-period DT property, as it is now redundant
(pwms property already contains period value).

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 drivers/video/backlight/lp855x_bl.c | 48 ++++++++++++++++-------------
 1 file changed, 26 insertions(+), 22 deletions(-)

diff --git a/drivers/video/backlight/lp855x_bl.c b/drivers/video/backlight/lp855x_bl.c
index a57c9ef3b1cc..0ef850dd8e84 100644
--- a/drivers/video/backlight/lp855x_bl.c
+++ b/drivers/video/backlight/lp855x_bl.c
@@ -218,23 +218,10 @@ static int lp855x_configure(struct lp855x *lp)
 
 static void lp855x_pwm_ctrl(struct lp855x *lp, int br, int max_br)
 {
-	struct pwm_device *pwm;
 	struct pwm_state state;
 
-	/* request pwm device with the consumer name */
-	if (!lp->pwm) {
-		pwm = devm_pwm_get(lp->dev, lp->chipname);
-		if (IS_ERR(pwm))
-			return;
-
-		lp->pwm = pwm;
-
-		pwm_init_state(lp->pwm, &state);
-	} else {
-		pwm_get_state(lp->pwm, &state);
-	}
+	pwm_get_state(lp->pwm, &state);
 
-	state.period = lp->pdata->period_ns;
 	state.duty_cycle = div_u64(br * state.period, max_br);
 	state.enabled = state.duty_cycle;
 
@@ -339,6 +326,7 @@ static int lp855x_parse_dt(struct lp855x *lp)
 	of_property_read_string(node, "bl-name", &pdata->name);
 	of_property_read_u8(node, "dev-ctrl", &pdata->device_control);
 	of_property_read_u8(node, "init-brt", &pdata->initial_brightness);
+	/* Deprecated, specify period in pwms property instead */
 	of_property_read_u32(node, "pwm-period", &pdata->period_ns);
 
 	/* Fill ROM platform data if defined */
@@ -399,6 +387,7 @@ static int lp855x_probe(struct i2c_client *cl)
 	const struct i2c_device_id *id = i2c_client_get_device_id(cl);
 	const struct acpi_device_id *acpi_id = NULL;
 	struct device *dev = &cl->dev;
+	struct pwm_state pwmstate;
 	struct lp855x *lp;
 	int ret;
 
@@ -457,11 +446,6 @@ static int lp855x_probe(struct i2c_client *cl)
 		}
 	}
 
-	if (lp->pdata->period_ns > 0)
-		lp->mode = PWM_BASED;
-	else
-		lp->mode = REGISTER_BASED;
-
 	lp->supply = devm_regulator_get(dev, "power");
 	if (IS_ERR(lp->supply)) {
 		if (PTR_ERR(lp->supply) == -EPROBE_DEFER)
@@ -472,11 +456,31 @@ static int lp855x_probe(struct i2c_client *cl)
 	lp->enable = devm_regulator_get_optional(dev, "enable");
 	if (IS_ERR(lp->enable)) {
 		ret = PTR_ERR(lp->enable);
-		if (ret == -ENODEV) {
+		if (ret == -ENODEV)
 			lp->enable = NULL;
-		} else {
+		else
 			return dev_err_probe(dev, ret, "getting enable regulator\n");
-		}
+	}
+
+	lp->pwm = devm_pwm_get(lp->dev, lp->chipname);
+	if (IS_ERR(lp->pwm)) {
+		ret = PTR_ERR(lp->pwm);
+		if (ret == -ENODEV || ret == -EINVAL)
+			lp->pwm = NULL;
+		else
+			return dev_err_probe(dev, ret, "getting PWM\n");
+
+		lp->mode = REGISTER_BASED;
+		dev_dbg(dev, "mode: register based\n");
+	} else {
+		pwm_init_state(lp->pwm, &pwmstate);
+		/* Legacy platform data compatibility */
+		if (lp->pdata->period_ns > 0)
+			pwmstate.period = lp->pdata->period_ns;
+		pwm_apply_state(lp->pwm, &pwmstate);
+
+		lp->mode = PWM_BASED;
+		dev_dbg(dev, "mode: PWM based\n");
 	}
 
 	if (lp->supply) {
-- 
2.40.1

