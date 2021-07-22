Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A8A3D263E
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 16:52:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 386F26E9AE;
	Thu, 22 Jul 2021 14:52:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92BC46E9AE
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 14:52:40 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 l11-20020a7bc34b0000b029021f84fcaf75so1740874wmj.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 07:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NP0Nk6TpvGXmi3EQspzqhmeGXtJTWbb2t8lR/ui8TD4=;
 b=izUC5Qvf/tubSNdCEliUDdjaUor/iX8CATtMD/ErOTgRdDxMAKIFt3zG53ZHHOZogA
 xpLQ++qh4wvdPwv+BS2h+ZSz2nvLI+dJLauYxNCgRHa7dzFSLC7Du1yuHucHCt5Gnb4V
 ddRFrp71Lnb7AUlyWZ7QxMsJhrQTgPQGQO7NTG1h7M79yfis3wwcP2Hy0SraUA9F83lP
 M1Qv6MG5/oCL863uBERgRSzRsBaUPn2sqYNF7gw6CWT7f3uSr/sUOBtNU0H7REb5PqQT
 wtEbXtVjfTjbPDyvDi5uYllGTU1HAYEryx1rrTECSAXWMj0+0BWTbgPD6JvmCWqBEh7A
 UXJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NP0Nk6TpvGXmi3EQspzqhmeGXtJTWbb2t8lR/ui8TD4=;
 b=JW9V1o6/ZDcP4IlsT+NREZ+wWbjoJljrgLr344xyzF4NksV+cJ2jNooypYfUm3mwp6
 kmV+2+Xqi0weFFCy2DxRDb7/QqQi6/3aP6KkHUoAH25kHaZHmlILfyaoKPdTKY9mMOhm
 aiKlHsHUi9KalJO7Z6bzCb6ICvih9CovMBJCtTYPfiVCsvnq8NLiLtb97saHH4IWlKd7
 aCJUiQe+ViI22Dp6pBlzeEDEv5fypHZvuw1DvfbTEWRnxEd+NMl0QtgRQ0F9XjE18Nri
 eZdazoL6eBmrq8QugCDlfXjrENQFNs3K3QcW0zLT+9iKJ0sDjcY+eHETxRVI3Z3w29xn
 XZjA==
X-Gm-Message-State: AOAM533+WGHO8Yf3y7yov4g3TdtWzezKHy9YCrNaOlc9DlWQ1fUGGbmE
 4e9dLiVf0rsijdSroa4LdKTciQ==
X-Google-Smtp-Source: ABdhPJy+uWxaydk70jwEcneHyghwzuOPld3QjaXdRC3fwtuprHx9eqlp5Y1QL6QB6ktCf4+LdElMcA==
X-Received: by 2002:a05:600c:1c86:: with SMTP id
 k6mr43890478wms.147.1626965559165; 
 Thu, 22 Jul 2021 07:52:39 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id t6sm30527687wru.75.2021.07.22.07.52.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 07:52:38 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Lee Jones <lee.jones@linaro.org>,
	Jingoo Han <jingoohan1@gmail.com>
Subject: [PATCH v2] backlight: pwm_bl: Improve bootloader/kernel device
 handover
Date: Thu, 22 Jul 2021 15:52:27 +0100
Message-Id: <20210722145227.1573115-1-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210722144623.1572816-1-daniel.thompson@linaro.org>
References: <20210722144623.1572816-1-daniel.thompson@linaro.org>
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
Cc: Marek Vasut <marex@denx.de>, linux-pwm@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, stable@vger.kernel.org,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently there are (at least) two problems in the way pwm_bl starts
managing the enable_gpio pin. Both occur when the backlight is initially
off and the driver finds the pin not already in output mode and, as a
result, unconditionally switches it to output-mode and asserts the signal.

Problem 1: This could cause the backlight to flicker since, at this stage
in driver initialisation, we have no idea what the PWM and regulator are
doing (an unconfigured PWM could easily "rest" at 100% duty cycle).

Problem 2: This will cause us not to correctly honour the
post_pwm_on_delay (which also risks flickers).

Fix this by moving the code to configure the GPIO output mode until after
we have examines the handover state. That allows us to initialize
enable_gpio to off if the backlight is currently off and on if the
backlight is on.

Reported-by: Marek Vasut <marex@denx.de>
Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
Cc: stable@vger.kernel.org
Fixes: 3698d7e7d221 ("backlight: pwm_bl: Avoid backlight flicker when probed from DT")
Acked-by: Marek Vasut <marex@denx.de>
Tested-by: Marek Vasut <marex@denx.de>
---

Notes:
    v2: Added Fixes: tag (sorry for the noise)

 drivers/video/backlight/pwm_bl.c | 54 +++++++++++++++++---------------
 1 file changed, 28 insertions(+), 26 deletions(-)

diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
index e48fded3e414..8d8959a70e44 100644
--- a/drivers/video/backlight/pwm_bl.c
+++ b/drivers/video/backlight/pwm_bl.c
@@ -409,6 +409,33 @@ static bool pwm_backlight_is_linear(struct platform_pwm_backlight_data *data)
 static int pwm_backlight_initial_power_state(const struct pwm_bl_data *pb)
 {
 	struct device_node *node = pb->dev->of_node;
+	bool active = true;
+
+	/*
+	 * If the enable GPIO is present, observable (either as input
+	 * or output) and off then the backlight is not currently active.
+	 * */
+	if (pb->enable_gpio && gpiod_get_value_cansleep(pb->enable_gpio) == 0)
+		active = false;
+
+	if (!regulator_is_enabled(pb->power_supply))
+		active = false;
+
+	if (!pwm_is_enabled(pb->pwm))
+		active = false;
+
+	/*
+	 * Synchronize the enable_gpio with the observed state of the
+	 * hardware.
+	 */
+	if (pb->enable_gpio)
+		gpiod_direction_output(pb->enable_gpio, active);
+
+	/*
+	 * Do not change pb->enabled here! pb->enabled essentially
+	 * tells us if we own one of the regulator's use counts and
+	 * right now we do not.
+	 */

 	/* Not booted with device tree or no phandle link to the node */
 	if (!node || !node->phandle)
@@ -420,20 +447,7 @@ static int pwm_backlight_initial_power_state(const struct pwm_bl_data *pb)
 	 * assume that another driver will enable the backlight at the
 	 * appropriate time. Therefore, if it is disabled, keep it so.
 	 */
-
-	/* if the enable GPIO is disabled, do not enable the backlight */
-	if (pb->enable_gpio && gpiod_get_value_cansleep(pb->enable_gpio) == 0)
-		return FB_BLANK_POWERDOWN;
-
-	/* The regulator is disabled, do not enable the backlight */
-	if (!regulator_is_enabled(pb->power_supply))
-		return FB_BLANK_POWERDOWN;
-
-	/* The PWM is disabled, keep it like this */
-	if (!pwm_is_enabled(pb->pwm))
-		return FB_BLANK_POWERDOWN;
-
-	return FB_BLANK_UNBLANK;
+	return active ? FB_BLANK_UNBLANK: FB_BLANK_POWERDOWN;
 }

 static int pwm_backlight_probe(struct platform_device *pdev)
@@ -486,18 +500,6 @@ static int pwm_backlight_probe(struct platform_device *pdev)
 		goto err_alloc;
 	}

-	/*
-	 * If the GPIO is not known to be already configured as output, that
-	 * is, if gpiod_get_direction returns either 1 or -EINVAL, change the
-	 * direction to output and set the GPIO as active.
-	 * Do not force the GPIO to active when it was already output as it
-	 * could cause backlight flickering or we would enable the backlight too
-	 * early. Leave the decision of the initial backlight state for later.
-	 */
-	if (pb->enable_gpio &&
-	    gpiod_get_direction(pb->enable_gpio) != 0)
-		gpiod_direction_output(pb->enable_gpio, 1);
-
 	pb->power_supply = devm_regulator_get(&pdev->dev, "power");
 	if (IS_ERR(pb->power_supply)) {
 		ret = PTR_ERR(pb->power_supply);

base-commit: 2734d6c1b1a089fb593ef6a23d4b70903526fe0c
--
2.30.2

