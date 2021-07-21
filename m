Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 844763D0C8C
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 12:49:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77E3E6EB6D;
	Wed, 21 Jul 2021 10:49:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B79DF6E8A3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 10:49:18 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id m2so1690357wrq.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 03:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=PhuhEZQu6xfi2SdFUEihPZE1dx8y/3uy2iMDI/n/pwY=;
 b=ZV6dj0NP4qcm1IioqkriQAySrfoVfqZFd55LSc+ZWqFwyGul7x3Ouqd8PcdZ9SGfGx
 s7phb3Yi/ZYeVb7pEZy1yY4IPbKc7x1fa4Oo4xLQgQVFUBWxWyFTv0tV9mSarr8GANUZ
 gTFX0arSeyhq8oSaMk8snyzk2/LOewmogwoXQICvFkc481JMHrQzt087WLtE9TChbwCa
 MCbKwuNYQo5H0xXaC92VfAl7QAJzPMnym02+k4jtuJ4/w1U0dqWw3ic64RNtkVDreolN
 zkyLUQU1xAB09HgmbznC3knWDbZqSola16nwcZ1gfgofT+Nzfk7WU3Gq0l2pdX0LmHH+
 pKVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PhuhEZQu6xfi2SdFUEihPZE1dx8y/3uy2iMDI/n/pwY=;
 b=GU3V8Dtg4KfOoxKBx8rs79GI+NaZpPeKA90Btk7Boze/85l6BRXMqE986jKkUYoDJ4
 1BlG94YLgXIwO7AsvonsdqpTJSMRXeysQER3OwL+PT8otCwCOCL5NyWRp68iO3R7hoHQ
 adr5WvFv0eoHhGdHrD2ttIg8kGK1BD4dcVAWIhUflmYJ51mvbk0TkvSjjlGieGmc371Y
 hkxYWpLhG6RqioBuuUuL1SO0wsei6P+04TQrABQK/kjMoPb1oG9U2dJ11oklFGAo0MMJ
 CB5bui4c0BcUHws+w4y2IRAzOVl02iAWxgBH/fwrvcCIHhDWZOxmFCGf8ieKpYd+rz6i
 henQ==
X-Gm-Message-State: AOAM530F/S4fbODtYGZHrhZIZ2Ow++oXs+iE7FUkiWJNI40s9pnXqLmQ
 ClE+CDhIbKtgk9dWAA19YM6tvQ==
X-Google-Smtp-Source: ABdhPJziH3qaBI0faHBOvKO0ex4OvlqFW2mJSs79EkBsg3Y523+YYoDsva2zIDcDaHPhU7QuUOoT1A==
X-Received: by 2002:a5d:5550:: with SMTP id g16mr9742327wrw.342.1626864557074; 
 Wed, 21 Jul 2021 03:49:17 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id k13sm27188857wrp.34.2021.07.21.03.49.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 03:49:16 -0700 (PDT)
Date: Wed, 21 Jul 2021 11:49:14 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] backlight: pwm_bl: Avoid backlight flicker if backlight
 control GPIO is input
Message-ID: <20210721104914.4difos6w3ysjelnv@maple.lan>
References: <20210718211415.143709-1-marex@denx.de>
 <20210719112202.4fvmn57ibgy3yesa@maple.lan>
 <bbaad78e-91c7-0787-fa72-b5cfabcc6dbd@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bbaad78e-91c7-0787-fa72-b5cfabcc6dbd@denx.de>
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
 dri-devel@lists.freedesktop.org, Thierry Reding <treding@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 20, 2021 at 10:28:32PM +0200, Marek Vasut wrote:
> On 7/19/21 1:22 PM, Daniel Thompson wrote:
> > On Sun, Jul 18, 2021 at 11:14:15PM +0200, Marek Vasut wrote:
> > > If the backlight enable GPIO is configured as input, the driver currently
> > > unconditionally forces the GPIO to output-enable. This can cause backlight
> > > flicker on boot e.g. in case the GPIO should not be enabled before the PWM
> > > is configured and is correctly pulled low by external resistor.
> > > 
> > > Fix this by extending the current check to differentiate between backlight
> > > GPIO enable set as input and set as direction unknown. In case of input,
> > > read the GPIO value to determine the pull resistor placement, set the GPIO
> > > as output, and drive that exact value it was pulled to. In case of unknown
> > > direction, retain previous behavior, that is set the GPIO as output-enable.
> > > 
> > > Fixes: 3698d7e7d221 ("backlight: pwm_bl: Avoid backlight flicker when probed from DT")
> > > Signed-off-by: Marek Vasut <marex@denx.de>
> > > Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> > > Cc: Daniel Thompson <daniel.thompson@linaro.org>
> > > Cc: Heiko Stuebner <heiko@sntech.de>
> > > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > > Cc: Thierry Reding <treding@nvidia.com>
> > > Cc: linux-pwm@vger.kernel.org
> > > Cc: linux-fbdev@vger.kernel.org
> > > To: dri-devel@lists.freedesktop.org
> > > ---
> > > NOTE: I think this whole auto-detection scheme should just be replaced by a
> > >        DT prop, because it is very fragile.
> > 
> > I have some sympathy for this view... although I think the boat has
> > already set sail.
> 
> I'm not sure that's correct, we can simply say that any new uses of the
> pwm-backlight should specify the initial GPIO configuration, and for the
> legacy ones, use whatever is in the code now.

I'm not 100% against the idea... however if we still have to get the
code to read state from the hardware right for legacy cases that means
we have to do the same work but with fewer people testing it.


> > However, on the basis of making things less fragile, I think the
> > underlying problem here is the assumption that it is safe to modify
> > enable_gpio before the driver has imposed state upon the PWM (this
> > assumption has always been made and, in addition to systems where the BL
> > has a phandle will also risks flicker problems on systems where
> > power_pwm_on_delay is not zero).
> 
> It is safe to modify the GPIO into defined state, but that defined state is
> not always out/enabled, that defined state depends on the hardware.

It is only safe to do this once we know what the initial value should be
and I'm not sure that value can comes exclusively from reading the pin.


> > This patch does not change the assumption that we can configure the
> > GPIO before we modify the PWM state. This means it won't fix the problem
> > for cases there the pin is HiZ by default but whose GPIOD_ASIS state is
> > neither input nor output.
> 
> That is correct, for pin that is floating, we lost. But then I would argue
> that if your backlight-enable GPIO is floating, the hardware is buggy, I
> would expect some pull resistor to keep the backlight off on power on on
> that GPIO.

I didn't say that the pin was floating. I said that the pin was in a HiZ
state meaning it could still be subject to pull up/down.

However there are cases, such as when the regulator is off, where I
think it is entirely legitimate for the enable pin to be floating. The
current driver does the wrong thing here if the pin is set as input
since if the regulator is off the initial enable_gpio value should be 0.


> > I wonder if it might be better to move the code to configure the
> > direction of enable_gpio out of the probe function and into
> > pwm_backlight_power_on():
> 
> No, I tried that already.
> 
> The first thing that is called on boot is pwm_backlight_power_off() to set
> the backlight to 0 (and thus set pwm to 0), but since pb->enabled is false,
> that is where the function exits with configuring PWM and without
> configuring the GPIO state.
>
> I also experimented with some "first time only" flag in those functions, but
> that looked ugly and complicated the runtime code.

I followed that idea and came to a similar conclusion w.r.t. to the
first time flag.

I think a reasonably elegant approach can be reached by making
pwm_backlight_initial_power_state() responsible for ensuring enable_gpio
matches the observed hardware state (taking into account both the pin
state and the regulator). I think this will fix both your flicker
concerns whilst permitting the legitimate cases for a floating pin.

Something like:

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
