Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D67F3D3904
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 13:04:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14EA36FAD8;
	Fri, 23 Jul 2021 11:04:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DBD06FAD7
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 11:04:02 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 9-20020a05600c26c9b02901e44e9caa2aso1366076wmv.4
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 04:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zS2GWn48je0bjrRKkqgGo/XGjFxQUky99Wi4nJkA+88=;
 b=G7PfQVwbTct99uIkTWzMyoXTLraDkSlKbm/Xbh7VjFeJGaKm6pqms2ifNfSHPFHUPa
 sx5cJj87jyfUixwhlYOzFnfk7JLUPpTlKiJoggiiQEQ8MYMKe3ueLtY9DY8R0IjoesLc
 ixq4b15VCtZpnoJhN/lkrqlrQjbN4UEt2PXvj/CWEHF9sA9gM7F+pdcEKGQNvYh+SYpF
 AY6nnT4cBdmbYVtTirbReGkptGvI48FYtp8TjFPrQ4dKkZKSMsxVCguOHepAR5jV2bOh
 BZdBuT4YOS4PKlCS9tbC9HZG4PT8saRMG/AbkhI0qn/y352UmjCA9Rj4uRr0288B4Jrl
 sdnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zS2GWn48je0bjrRKkqgGo/XGjFxQUky99Wi4nJkA+88=;
 b=B/E/aziMw0RWHaNM2ZHOQpWROgjY7G11lrzru56i28TbdtVXNiOrTh2NRzuIkQSr4j
 11YYWwVj8/j3kPXjqs3l5gcG10DMCri+MIO6IdZFbpnsQtzcEjpRdYljaSxzvdub1cK2
 MbqE/rOnaH1izEnD+Bb0X/7KMknoI4mES+L9Up15r3bpEMiAh2zni0CUgcWvHCU7x4mX
 ksT/lpNNv542x3X/WoYw+vaD6bCqw9pee5E7Kqo6u2l29NkYuNcLpCquR8+BQxP3MCFC
 AhjO3jBqOU+RL+cqcr9KzQU3ZhDlh3J8bhG67Fmy4yf1OfHQMID1ekfDvZFN568uRxRs
 OQOw==
X-Gm-Message-State: AOAM533CtF8ihuPgzkvv5aBKzkXwsdewNIfeUcuY/zEB+HhX3CT5JuL8
 Lsu4jjZZYYGYQIxWh6VTEigWbA==
X-Google-Smtp-Source: ABdhPJwXjYd/l4dQLMWFtE8wkIOw/4pJFY+8TKTo/OL8hFIe/dm7K2TB2C3x4d1nl4jaIOXOk4Dlaw==
X-Received: by 2002:a1c:9851:: with SMTP id a78mr13505101wme.33.1627038240862; 
 Fri, 23 Jul 2021 04:04:00 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id w18sm35025315wrg.68.2021.07.23.04.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 04:03:59 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Lee Jones <lee.jones@linaro.org>,
	Jingoo Han <jingoohan1@gmail.com>
Subject: [PATCH v3] backlight: pwm_bl: Improve bootloader/kernel device
 handover
Date: Fri, 23 Jul 2021 12:03:45 +0100
Message-Id: <20210723110345.1724410-1-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210722145227.1573115-1-daniel.thompson@linaro.org>
References: <20210722145227.1573115-1-daniel.thompson@linaro.org>
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

There has also been lots of discussion recently about how pwm_bl inherits
the initial state established by the bootloader (or by power-on reset if
the bootloader doesn't do anything to the backlight). Let's take this
chance to document the four handover cases.

Reported-by: Marek Vasut <marex@denx.de>
Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
Cc: stable@vger.kernel.org
Fixes: 3698d7e7d221 ("backlight: pwm_bl: Avoid backlight flicker when probed from DT")
Acked-by: Marek Vasut <marex@denx.de>
Tested-by: Marek Vasut <marex@denx.de>
---

Notes:
    v3: Added better documentation of the different handover cases (thanks
        Marek)
    v2: Added Fixes: tag (sorry for the noise)

 drivers/video/backlight/pwm_bl.c | 110 +++++++++++++++++++++++--------
 1 file changed, 83 insertions(+), 27 deletions(-)

diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
index e48fded3e414..5dda3f11129a 100644
--- a/drivers/video/backlight/pwm_bl.c
+++ b/drivers/video/backlight/pwm_bl.c
@@ -406,9 +406,90 @@ static bool pwm_backlight_is_linear(struct platform_pwm_backlight_data *data)
 	return true;
 }

+/*
+ * Inherit the initial power state from the hardware.
+ *
+ * This function provides the features necessary to achieve a flicker-free boot
+ * sequence regardless of the initial state of the backlight.
+ *
+ * There are two factors that affect the behaviour of this function.
+ *
+ * 1. Whether the backlight was on or off when the kernel was booted.  We
+ *    currently determine the state of the backlight by checking if the PWM is
+ *    enabled, whether the regulator (if there is one) is enabled and whether
+ *    the enable_gpio (if there is one) is asserted.  All must be enabled for
+ *    the backlight to be on.
+ *
+ * 2. Whether the backlight is linked to a display device. This matters because
+ *    when there is a linked display is will automatically handle the
+ *    backlight as part of its own blank/unblanking.
+ *
+ * This gives us four possible cases.
+ *
+ * Backlight initially off, display linked:
+ *
+ *   The backlight must remain off (a.k.a. FB_BLANK_POWERDOWN) during and after
+ *   the backlight probe. This allows a splash screen to be drawn before the
+ *   backlight is enabled by the display driver. This avoids a flicker when the
+ *   backlight comes on (which typically changes the black level slightly)
+ *   before the splash image has been drawn.
+ *
+ * Backlight initially on, display linked:
+ *
+ *   The backlight must remain on (a.k.a. FB_BLANK_UNBLANK) during and after
+ *   the backlight probe.  This allows a bootloader to show a splash screen and
+ *   for the display system (including the backlight) to continue showing the
+ *   splash image until the kernel is ready to take over the display and draw
+ *   something else.
+ *
+ * Backlight initially off, no display:
+ *
+ *   The backlight must transition from off to on (a.k.a. FB_BLANK_UNBLANK)
+ *   during the backlight probe. This is largely a legacy case. We must
+ *   unblank the backlight at boot because some userspaces are not
+ *   capable of changing the power state of a free-standing backlight
+ *   (they only know how to set the brightness level).
+ *
+ * Backlight initially on, no display:
+ *
+ *   Identical to the initially on, display linked case.
+ *
+ * Note: In both cases where backlight is initially off then we must
+ *       explicitly deassert the enable_gpio in order to ensure we
+ *       honour the post_pwm_on_delay when the backlight is eventually
+ *       activated.  This is required regardless of both the initial state of
+ *       the enable pin and whether we intend to activate the backlight during
+ *       the probe.
+ */
 static int pwm_backlight_initial_power_state(const struct pwm_bl_data *pb)
 {
-	struct device_node *node = pb->dev->of_node;
+	struct device_node *node = pb->dev->of_node; bool active = true;
+
+	/*
+	 * If the enable GPIO is present, observable (either as input
+	 * or output) and off then the backlight is not currently active.
+	 */
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
@@ -420,20 +501,7 @@ static int pwm_backlight_initial_power_state(const struct pwm_bl_data *pb)
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
+	return active ? FB_BLANK_UNBLANK : FB_BLANK_POWERDOWN;
 }

 static int pwm_backlight_probe(struct platform_device *pdev)
@@ -486,18 +554,6 @@ static int pwm_backlight_probe(struct platform_device *pdev)
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

