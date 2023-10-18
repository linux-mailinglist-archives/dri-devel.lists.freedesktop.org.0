Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D8C7CDE12
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 15:58:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E410A10E3F7;
	Wed, 18 Oct 2023 13:57:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D187510E3F7
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 13:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697637475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=isuz98/JAz0u/mEAHLn6kE4xhSX9/DpJkE4+UfVWd9M=;
 b=OHOlK81qxW73b4c2ApUlPbGZ1hf6tcO01SK4P643M0uV1XVOSAVi5uolPvBVarT6HSV5lH
 7qJdEzbyLjJ/DRMGI9MhEEWNeF+LLcU76gxqU0M1sqSm044683xa9VKTeFhz8VyVcKarwp
 E3rad7ABxS5ECYlyX0V0SStAwJPul1s=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-146-avZL8LyJOnuwxFvvmSMstg-1; Wed, 18 Oct 2023 09:57:53 -0400
X-MC-Unique: avZL8LyJOnuwxFvvmSMstg-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-9ae0bf9c0b4so520474766b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 06:57:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697637472; x=1698242272;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=isuz98/JAz0u/mEAHLn6kE4xhSX9/DpJkE4+UfVWd9M=;
 b=xMNpcGWKyrZqMryvdU4z7hOVwPxlgdwp4ExDe3xTormWVhrjuL2flgIhsDpdwk6rv4
 te2D6OcwwLzfq0F5DQ14madgOr9xI4+ktPaqWrSJ1GIE4rGF9+zu2Y7Y46i5m9Ki21S5
 xo3D7aQLFT5ySVdp2aW/uISnRz1ZOESmTKN1Wz1dwMnPPp+gJbnPuDxr0SdRsthxk10J
 wjHNLU8JkaTaSoHOew9SYbmfeYXwQ1W02PvhsQ1cNQLTpgnR0e6UINw1AD+kEhLsOts0
 jmFYER97YbaUPmyp8PNcEIxLPxA4QaxRtwWULykGcc9IQGIR397PXnEia5aqi/1Ex29n
 cxvA==
X-Gm-Message-State: AOJu0Yxr78NHXPEvrxWVvR173xtcgrivQH+mJVfBHRkvpO/eonVmClUN
 pN8zsYS0xsiSuQ+ULVaYTNUXD6YaZDBAVbgBj84vBc2YF1EHKqFIJpftCRm2/3ZDxQy4uAm/vJ9
 54rVGxYaXVAZNrr9eydPjhoK6U9eX
X-Received: by 2002:a17:907:3fa0:b0:9bf:60f9:9b7c with SMTP id
 hr32-20020a1709073fa000b009bf60f99b7cmr4284273ejc.62.1697637472192; 
 Wed, 18 Oct 2023 06:57:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEdb7/QYlJReEJUWnEivoUhvF0N/eYHLq7wVCtf4KIHDopWLXG9GgBJRWiFB9fuKzYOdcJmA==
X-Received: by 2002:a17:907:3fa0:b0:9bf:60f9:9b7c with SMTP id
 hr32-20020a1709073fa000b009bf60f99b7cmr4284247ejc.62.1697637471565; 
 Wed, 18 Oct 2023 06:57:51 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 mc8-20020a170906eb4800b0098d2d219649sm1748399ejb.174.2023.10.18.06.57.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Oct 2023 06:57:50 -0700 (PDT)
Message-ID: <90728c06-4c6c-b3d2-4723-c24711be2fa5@redhat.com>
Date: Wed, 18 Oct 2023 15:57:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/3] pwm: make it possible to apply pwm changes in
 atomic context
To: Sean Young <sean@mess.org>, linux-media@vger.kernel.org,
 linux-pwm@vger.kernel.org, Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Jonathan Corbet <corbet@lwn.net>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Support Opensource <support.opensource@diasemi.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Mark Gross <markgross@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Daniel Thompson
 <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>
References: <cover.1697534024.git.sean@mess.org>
 <a7fcd19938d5422abc59c968ff7b3d5c275577ed.1697534024.git.sean@mess.org>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <a7fcd19938d5422abc59c968ff7b3d5c275577ed.1697534024.git.sean@mess.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-hwmon@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-doc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sean,

On 10/17/23 11:17, Sean Young wrote:
> Some drivers require sleeping, for example if the pwm device is connected
> over i2c. The pwm-ir-tx requires precise timing, and sleeping causes havoc
> with the generated IR signal when sleeping occurs.
> 
> This patch makes it possible to use pwm when the driver does not sleep,
> by introducing the pwm_can_sleep() function.
> 
> Signed-off-by: Sean Young <sean@mess.org>

I have no objection to this patch by itself, but it seems a bit
of unnecessary churn to change all current callers of pwm_apply_state()
to a new API.

Why not just keep pwm_apply_state() as is and introduce a new
pwm_apply_state_atomic() for callers which want to apply state
in a case where sleeping is not allowed ?

Regards,

Hans



> ---
>  Documentation/driver-api/pwm.rst              | 16 +++-
>  .../gpu/drm/i915/display/intel_backlight.c    |  6 +-
>  drivers/gpu/drm/solomon/ssd130x.c             |  2 +-
>  drivers/hwmon/pwm-fan.c                       |  8 +-
>  drivers/input/misc/da7280.c                   |  4 +-
>  drivers/input/misc/pwm-beeper.c               |  4 +-
>  drivers/input/misc/pwm-vibra.c                |  8 +-
>  drivers/leds/leds-pwm.c                       |  2 +-
>  drivers/leds/rgb/leds-pwm-multicolor.c        |  4 +-
>  drivers/media/rc/pwm-ir-tx.c                  |  4 +-
>  drivers/platform/x86/lenovo-yogabook.c        |  2 +-
>  drivers/pwm/core.c                            | 75 ++++++++++++++-----
>  drivers/pwm/pwm-renesas-tpu.c                 |  1 -
>  drivers/pwm/pwm-twl-led.c                     |  2 +-
>  drivers/pwm/pwm-vt8500.c                      |  2 +-
>  drivers/pwm/sysfs.c                           | 10 +--
>  drivers/regulator/pwm-regulator.c             |  4 +-
>  drivers/video/backlight/lm3630a_bl.c          |  2 +-
>  drivers/video/backlight/lp855x_bl.c           |  2 +-
>  drivers/video/backlight/pwm_bl.c              |  6 +-
>  drivers/video/fbdev/ssd1307fb.c               |  2 +-
>  include/linux/pwm.h                           | 57 ++++++++++----
>  22 files changed, 147 insertions(+), 76 deletions(-)
> 
> diff --git a/Documentation/driver-api/pwm.rst b/Documentation/driver-api/pwm.rst
> index 3fdc95f7a1d15..a2fb5f8f6e1f8 100644
> --- a/Documentation/driver-api/pwm.rst
> +++ b/Documentation/driver-api/pwm.rst
> @@ -41,7 +41,15 @@ the getter, devm_pwm_get() and devm_fwnode_pwm_get(), also exist.
>  
>  After being requested, a PWM has to be configured using::
>  
> -	int pwm_apply_state(struct pwm_device *pwm, struct pwm_state *state);
> +	int pwm_apply_cansleep(struct pwm_device *pwm, struct pwm_state *state);
> +
> +If the PWM support atomic mode, which can be determined with::
> +
> +        bool pwm_is_atomic(struct pwm_device *pwm);
> +
> +Then the PWM can be configured with::
> +
> +	int pwm_apply(struct pwm_device *pwm, struct pwm_state *state);
>  
>  This API controls both the PWM period/duty_cycle config and the
>  enable/disable state.
> @@ -57,13 +65,13 @@ If supported by the driver, the signal can be optimized, for example to improve
>  EMI by phase shifting the individual channels of a chip.
>  
>  The pwm_config(), pwm_enable() and pwm_disable() functions are just wrappers
> -around pwm_apply_state() and should not be used if the user wants to change
> +around pwm_apply_cansleep() and should not be used if the user wants to change
>  several parameter at once. For example, if you see pwm_config() and
>  pwm_{enable,disable}() calls in the same function, this probably means you
> -should switch to pwm_apply_state().
> +should switch to pwm_apply_cansleep().
>  
>  The PWM user API also allows one to query the PWM state that was passed to the
> -last invocation of pwm_apply_state() using pwm_get_state(). Note this is
> +last invocation of pwm_apply_cansleep() using pwm_get_state(). Note this is
>  different to what the driver has actually implemented if the request cannot be
>  satisfied exactly with the hardware in use. There is currently no way for
>  consumers to get the actually implemented settings.
> diff --git a/drivers/gpu/drm/i915/display/intel_backlight.c b/drivers/gpu/drm/i915/display/intel_backlight.c
> index 2e8f17c045222..cf516190cde8f 100644
> --- a/drivers/gpu/drm/i915/display/intel_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_backlight.c
> @@ -274,7 +274,7 @@ static void ext_pwm_set_backlight(const struct drm_connector_state *conn_state,
>  	struct intel_panel *panel = &to_intel_connector(conn_state->connector)->panel;
>  
>  	pwm_set_relative_duty_cycle(&panel->backlight.pwm_state, level, 100);
> -	pwm_apply_state(panel->backlight.pwm, &panel->backlight.pwm_state);
> +	pwm_apply_cansleep(panel->backlight.pwm, &panel->backlight.pwm_state);
>  }
>  
>  static void
> @@ -427,7 +427,7 @@ static void ext_pwm_disable_backlight(const struct drm_connector_state *old_conn
>  	intel_backlight_set_pwm_level(old_conn_state, level);
>  
>  	panel->backlight.pwm_state.enabled = false;
> -	pwm_apply_state(panel->backlight.pwm, &panel->backlight.pwm_state);
> +	pwm_apply_cansleep(panel->backlight.pwm, &panel->backlight.pwm_state);
>  }
>  
>  void intel_backlight_disable(const struct drm_connector_state *old_conn_state)
> @@ -749,7 +749,7 @@ static void ext_pwm_enable_backlight(const struct intel_crtc_state *crtc_state,
>  
>  	pwm_set_relative_duty_cycle(&panel->backlight.pwm_state, level, 100);
>  	panel->backlight.pwm_state.enabled = true;
> -	pwm_apply_state(panel->backlight.pwm, &panel->backlight.pwm_state);
> +	pwm_apply_cansleep(panel->backlight.pwm, &panel->backlight.pwm_state);
>  }
>  
>  static void __intel_backlight_enable(const struct intel_crtc_state *crtc_state,
> diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
> index 5a80b228d18ca..5045966d43039 100644
> --- a/drivers/gpu/drm/solomon/ssd130x.c
> +++ b/drivers/gpu/drm/solomon/ssd130x.c
> @@ -267,7 +267,7 @@ static int ssd130x_pwm_enable(struct ssd130x_device *ssd130x)
>  
>  	pwm_init_state(ssd130x->pwm, &pwmstate);
>  	pwm_set_relative_duty_cycle(&pwmstate, 50, 100);
> -	pwm_apply_state(ssd130x->pwm, &pwmstate);
> +	pwm_apply_cansleep(ssd130x->pwm, &pwmstate);
>  
>  	/* Enable the PWM */
>  	pwm_enable(ssd130x->pwm);
> diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
> index 6e4516c2ab894..f68deb1f236b7 100644
> --- a/drivers/hwmon/pwm-fan.c
> +++ b/drivers/hwmon/pwm-fan.c
> @@ -151,7 +151,7 @@ static int pwm_fan_power_on(struct pwm_fan_ctx *ctx)
>  	}
>  
>  	state->enabled = true;
> -	ret = pwm_apply_state(ctx->pwm, state);
> +	ret = pwm_apply_cansleep(ctx->pwm, state);
>  	if (ret) {
>  		dev_err(ctx->dev, "failed to enable PWM\n");
>  		goto disable_regulator;
> @@ -181,7 +181,7 @@ static int pwm_fan_power_off(struct pwm_fan_ctx *ctx)
>  
>  	state->enabled = false;
>  	state->duty_cycle = 0;
> -	ret = pwm_apply_state(ctx->pwm, state);
> +	ret = pwm_apply_cansleep(ctx->pwm, state);
>  	if (ret) {
>  		dev_err(ctx->dev, "failed to disable PWM\n");
>  		return ret;
> @@ -207,7 +207,7 @@ static int  __set_pwm(struct pwm_fan_ctx *ctx, unsigned long pwm)
>  
>  		period = state->period;
>  		state->duty_cycle = DIV_ROUND_UP(pwm * (period - 1), MAX_PWM);
> -		ret = pwm_apply_state(ctx->pwm, state);
> +		ret = pwm_apply_cansleep(ctx->pwm, state);
>  		if (ret)
>  			return ret;
>  		ret = pwm_fan_power_on(ctx);
> @@ -278,7 +278,7 @@ static int pwm_fan_update_enable(struct pwm_fan_ctx *ctx, long val)
>  						    state,
>  						    &enable_regulator);
>  
> -			pwm_apply_state(ctx->pwm, state);
> +			pwm_apply_cansleep(ctx->pwm, state);
>  			pwm_fan_switch_power(ctx, enable_regulator);
>  			pwm_fan_update_state(ctx, 0);
>  		}
> diff --git a/drivers/input/misc/da7280.c b/drivers/input/misc/da7280.c
> index ce82548916bbc..f10be2cdba803 100644
> --- a/drivers/input/misc/da7280.c
> +++ b/drivers/input/misc/da7280.c
> @@ -352,7 +352,7 @@ static int da7280_haptic_set_pwm(struct da7280_haptic *haptics, bool enabled)
>  		state.duty_cycle = period_mag_multi;
>  	}
>  
> -	error = pwm_apply_state(haptics->pwm_dev, &state);
> +	error = pwm_apply_cansleep(haptics->pwm_dev, &state);
>  	if (error)
>  		dev_err(haptics->dev, "Failed to apply pwm state: %d\n", error);
>  
> @@ -1175,7 +1175,7 @@ static int da7280_probe(struct i2c_client *client)
>  		/* Sync up PWM state and ensure it is off. */
>  		pwm_init_state(haptics->pwm_dev, &state);
>  		state.enabled = false;
> -		error = pwm_apply_state(haptics->pwm_dev, &state);
> +		error = pwm_apply_cansleep(haptics->pwm_dev, &state);
>  		if (error) {
>  			dev_err(dev, "Failed to apply PWM state: %d\n", error);
>  			return error;
> diff --git a/drivers/input/misc/pwm-beeper.c b/drivers/input/misc/pwm-beeper.c
> index 1e731d8397c6f..1d6c4fb5f0caf 100644
> --- a/drivers/input/misc/pwm-beeper.c
> +++ b/drivers/input/misc/pwm-beeper.c
> @@ -39,7 +39,7 @@ static int pwm_beeper_on(struct pwm_beeper *beeper, unsigned long period)
>  	state.period = period;
>  	pwm_set_relative_duty_cycle(&state, 50, 100);
>  
> -	error = pwm_apply_state(beeper->pwm, &state);
> +	error = pwm_apply_cansleep(beeper->pwm, &state);
>  	if (error)
>  		return error;
>  
> @@ -138,7 +138,7 @@ static int pwm_beeper_probe(struct platform_device *pdev)
>  	/* Sync up PWM state and ensure it is off. */
>  	pwm_init_state(beeper->pwm, &state);
>  	state.enabled = false;
> -	error = pwm_apply_state(beeper->pwm, &state);
> +	error = pwm_apply_cansleep(beeper->pwm, &state);
>  	if (error) {
>  		dev_err(dev, "failed to apply initial PWM state: %d\n",
>  			error);
> diff --git a/drivers/input/misc/pwm-vibra.c b/drivers/input/misc/pwm-vibra.c
> index acac79c488aa1..6552ce712d8dc 100644
> --- a/drivers/input/misc/pwm-vibra.c
> +++ b/drivers/input/misc/pwm-vibra.c
> @@ -56,7 +56,7 @@ static int pwm_vibrator_start(struct pwm_vibrator *vibrator)
>  	pwm_set_relative_duty_cycle(&state, vibrator->level, 0xffff);
>  	state.enabled = true;
>  
> -	err = pwm_apply_state(vibrator->pwm, &state);
> +	err = pwm_apply_cansleep(vibrator->pwm, &state);
>  	if (err) {
>  		dev_err(pdev, "failed to apply pwm state: %d\n", err);
>  		return err;
> @@ -67,7 +67,7 @@ static int pwm_vibrator_start(struct pwm_vibrator *vibrator)
>  		state.duty_cycle = vibrator->direction_duty_cycle;
>  		state.enabled = true;
>  
> -		err = pwm_apply_state(vibrator->pwm_dir, &state);
> +		err = pwm_apply_cansleep(vibrator->pwm_dir, &state);
>  		if (err) {
>  			dev_err(pdev, "failed to apply dir-pwm state: %d\n", err);
>  			pwm_disable(vibrator->pwm);
> @@ -160,7 +160,7 @@ static int pwm_vibrator_probe(struct platform_device *pdev)
>  	/* Sync up PWM state and ensure it is off. */
>  	pwm_init_state(vibrator->pwm, &state);
>  	state.enabled = false;
> -	err = pwm_apply_state(vibrator->pwm, &state);
> +	err = pwm_apply_cansleep(vibrator->pwm, &state);
>  	if (err) {
>  		dev_err(&pdev->dev, "failed to apply initial PWM state: %d\n",
>  			err);
> @@ -174,7 +174,7 @@ static int pwm_vibrator_probe(struct platform_device *pdev)
>  		/* Sync up PWM state and ensure it is off. */
>  		pwm_init_state(vibrator->pwm_dir, &state);
>  		state.enabled = false;
> -		err = pwm_apply_state(vibrator->pwm_dir, &state);
> +		err = pwm_apply_cansleep(vibrator->pwm_dir, &state);
>  		if (err) {
>  			dev_err(&pdev->dev, "failed to apply initial PWM state: %d\n",
>  				err);
> diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
> index 419b710984ab6..e1fe1fd8f189a 100644
> --- a/drivers/leds/leds-pwm.c
> +++ b/drivers/leds/leds-pwm.c
> @@ -54,7 +54,7 @@ static int led_pwm_set(struct led_classdev *led_cdev,
>  
>  	led_dat->pwmstate.duty_cycle = duty;
>  	led_dat->pwmstate.enabled = duty > 0;
> -	return pwm_apply_state(led_dat->pwm, &led_dat->pwmstate);
> +	return pwm_apply_cansleep(led_dat->pwm, &led_dat->pwmstate);
>  }
>  
>  __attribute__((nonnull))
> diff --git a/drivers/leds/rgb/leds-pwm-multicolor.c b/drivers/leds/rgb/leds-pwm-multicolor.c
> index 46cd062b8b24c..8114adcdad9bb 100644
> --- a/drivers/leds/rgb/leds-pwm-multicolor.c
> +++ b/drivers/leds/rgb/leds-pwm-multicolor.c
> @@ -51,8 +51,8 @@ static int led_pwm_mc_set(struct led_classdev *cdev,
>  
>  		priv->leds[i].state.duty_cycle = duty;
>  		priv->leds[i].state.enabled = duty > 0;
> -		ret = pwm_apply_state(priv->leds[i].pwm,
> -				      &priv->leds[i].state);
> +		ret = pwm_apply_cansleep(priv->leds[i].pwm,
> +					 &priv->leds[i].state);
>  		if (ret)
>  			break;
>  	}
> diff --git a/drivers/media/rc/pwm-ir-tx.c b/drivers/media/rc/pwm-ir-tx.c
> index c5f37c03af9c9..ccb86890adcea 100644
> --- a/drivers/media/rc/pwm-ir-tx.c
> +++ b/drivers/media/rc/pwm-ir-tx.c
> @@ -68,7 +68,7 @@ static int pwm_ir_tx(struct rc_dev *dev, unsigned int *txbuf,
>  
>  	for (i = 0; i < count; i++) {
>  		state.enabled = !(i % 2);
> -		pwm_apply_state(pwm, &state);
> +		pwm_apply_cansleep(pwm, &state);
>  
>  		edge = ktime_add_us(edge, txbuf[i]);
>  		delta = ktime_us_delta(edge, ktime_get());
> @@ -77,7 +77,7 @@ static int pwm_ir_tx(struct rc_dev *dev, unsigned int *txbuf,
>  	}
>  
>  	state.enabled = false;
> -	pwm_apply_state(pwm, &state);
> +	pwm_apply_cansleep(pwm, &state);
>  
>  	return count;
>  }
> diff --git a/drivers/platform/x86/lenovo-yogabook.c b/drivers/platform/x86/lenovo-yogabook.c
> index b8d0239192cbf..cbc285f77c2bd 100644
> --- a/drivers/platform/x86/lenovo-yogabook.c
> +++ b/drivers/platform/x86/lenovo-yogabook.c
> @@ -435,7 +435,7 @@ static int yogabook_pdev_set_kbd_backlight(struct yogabook_data *data, u8 level)
>  		.enabled = level,
>  	};
>  
> -	pwm_apply_state(data->kbd_bl_pwm, &state);
> +	pwm_apply_cansleep(data->kbd_bl_pwm, &state);
>  	gpiod_set_value(data->kbd_bl_led_enable, level ? 1 : 0);
>  	return 0;
>  }
> diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
> index dc66e3405bf50..99896a59a25aa 100644
> --- a/drivers/pwm/core.c
> +++ b/drivers/pwm/core.c
> @@ -382,8 +382,8 @@ struct pwm_device *pwm_request_from_chip(struct pwm_chip *chip,
>  }
>  EXPORT_SYMBOL_GPL(pwm_request_from_chip);
>  
> -static void pwm_apply_state_debug(struct pwm_device *pwm,
> -				  const struct pwm_state *state)
> +static void pwm_apply_cansleep_debug(struct pwm_device *pwm,
> +				     const struct pwm_state *state)
>  {
>  	struct pwm_state *last = &pwm->last;
>  	struct pwm_chip *chip = pwm->chip;
> @@ -489,24 +489,15 @@ static void pwm_apply_state_debug(struct pwm_device *pwm,
>  }
>  
>  /**
> - * pwm_apply_state() - atomically apply a new state to a PWM device
> + * pwm_apply_unchecked() - atomically apply a new state to a PWM device
>   * @pwm: PWM device
>   * @state: new state to apply
>   */
> -int pwm_apply_state(struct pwm_device *pwm, const struct pwm_state *state)
> +static int pwm_apply_unchecked(struct pwm_device *pwm, const struct pwm_state *state)
>  {
>  	struct pwm_chip *chip;
>  	int err;
>  
> -	/*
> -	 * Some lowlevel driver's implementations of .apply() make use of
> -	 * mutexes, also with some drivers only returning when the new
> -	 * configuration is active calling pwm_apply_state() from atomic context
> -	 * is a bad idea. So make it explicit that calling this function might
> -	 * sleep.
> -	 */
> -	might_sleep();
> -
>  	if (!pwm || !state || !state->period ||
>  	    state->duty_cycle > state->period)
>  		return -EINVAL;
> @@ -527,15 +518,63 @@ int pwm_apply_state(struct pwm_device *pwm, const struct pwm_state *state)
>  
>  	pwm->state = *state;
>  
> +	return 0;
> +}
> +
> +/**
> + * pwm_apply_cansleep() - atomically apply a new state to a PWM device
> + * Cannot be used in atomic context.
> + * @pwm: PWM device
> + * @state: new state to apply
> + */
> +int pwm_apply_cansleep(struct pwm_device *pwm, const struct pwm_state *state)
> +{
> +	int err;
> +
> +	/*
> +	 * Some lowlevel driver's implementations of .apply() make use of
> +	 * mutexes, also with some drivers only returning when the new
> +	 * configuration is active calling pwm_apply_cansleep() from atomic context
> +	 * is a bad idea. So make it explicit that calling this function might
> +	 * sleep.
> +	 */
> +	might_sleep();
> +
> +	if (IS_ENABLED(CONFIG_PWM_DEBUG) && pwm->chip->atomic) {
> +		/*
> +		 * Catch any sleeping drivers when atomic is set.
> +		 */
> +		non_block_start();
> +		err = pwm_apply_unchecked(pwm, state);
> +		non_block_end();
> +	} else {
> +		err = pwm_apply_unchecked(pwm, state);
> +	}
> +
>  	/*
>  	 * only do this after pwm->state was applied as some
>  	 * implementations of .get_state depend on this
>  	 */
> -	pwm_apply_state_debug(pwm, state);
> +	pwm_apply_cansleep_debug(pwm, state);
>  
> -	return 0;
> +	return err;
> +}
> +EXPORT_SYMBOL_GPL(pwm_apply_cansleep);
> +
> +/**
> + * pwm_apply() - atomically apply a new state to a PWM device
> + * Can be used from atomic context.
> + * @pwm: PWM device
> + * @state: new state to apply
> + */
> +int pwm_apply(struct pwm_device *pwm, const struct pwm_state *state)
> +{
> +	WARN_ONCE(!pwm->chip->atomic,
> +		  "sleeping pwm driver used in atomic context");
> +
> +	return pwm_apply_unchecked(pwm, state);
>  }
> -EXPORT_SYMBOL_GPL(pwm_apply_state);
> +EXPORT_SYMBOL_GPL(pwm_apply);
>  
>  /**
>   * pwm_capture() - capture and report a PWM signal
> @@ -593,7 +632,7 @@ int pwm_adjust_config(struct pwm_device *pwm)
>  		state.period = pargs.period;
>  		state.polarity = pargs.polarity;
>  
> -		return pwm_apply_state(pwm, &state);
> +		return pwm_apply_cansleep(pwm, &state);
>  	}
>  
>  	/*
> @@ -616,7 +655,7 @@ int pwm_adjust_config(struct pwm_device *pwm)
>  		state.duty_cycle = state.period - state.duty_cycle;
>  	}
>  
> -	return pwm_apply_state(pwm, &state);
> +	return pwm_apply_cansleep(pwm, &state);
>  }
>  EXPORT_SYMBOL_GPL(pwm_adjust_config);
>  
> diff --git a/drivers/pwm/pwm-renesas-tpu.c b/drivers/pwm/pwm-renesas-tpu.c
> index d7311614c846d..96797a33d8c62 100644
> --- a/drivers/pwm/pwm-renesas-tpu.c
> +++ b/drivers/pwm/pwm-renesas-tpu.c
> @@ -11,7 +11,6 @@
>  #include <linux/init.h>
>  #include <linux/ioport.h>
>  #include <linux/module.h>
> -#include <linux/mutex.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> diff --git a/drivers/pwm/pwm-twl-led.c b/drivers/pwm/pwm-twl-led.c
> index 8fb84b4418538..a1fc2fa0d03e0 100644
> --- a/drivers/pwm/pwm-twl-led.c
> +++ b/drivers/pwm/pwm-twl-led.c
> @@ -172,7 +172,7 @@ static int twl4030_pwmled_apply(struct pwm_chip *chip, struct pwm_device *pwm,
>  	 * We cannot skip calling ->config even if state->period ==
>  	 * pwm->state.period && state->duty_cycle == pwm->state.duty_cycle
>  	 * because we might have exited early in the last call to
> -	 * pwm_apply_state because of !state->enabled and so the two values in
> +	 * pwm_apply_cansleep because of !state->enabled and so the two values in
>  	 * pwm->state might not be configured in hardware.
>  	 */
>  	ret = twl4030_pwmled_config(pwm->chip, pwm,
> diff --git a/drivers/pwm/pwm-vt8500.c b/drivers/pwm/pwm-vt8500.c
> index 6d46db51daacc..3a815dfbf31ce 100644
> --- a/drivers/pwm/pwm-vt8500.c
> +++ b/drivers/pwm/pwm-vt8500.c
> @@ -206,7 +206,7 @@ static int vt8500_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
>  	 * We cannot skip calling ->config even if state->period ==
>  	 * pwm->state.period && state->duty_cycle == pwm->state.duty_cycle
>  	 * because we might have exited early in the last call to
> -	 * pwm_apply_state because of !state->enabled and so the two values in
> +	 * pwm_apply_cansleep because of !state->enabled and so the two values in
>  	 * pwm->state might not be configured in hardware.
>  	 */
>  	err = vt8500_pwm_config(pwm->chip, pwm, state->duty_cycle, state->period);
> diff --git a/drivers/pwm/sysfs.c b/drivers/pwm/sysfs.c
> index 8d1254761e4dd..eca9cad3be765 100644
> --- a/drivers/pwm/sysfs.c
> +++ b/drivers/pwm/sysfs.c
> @@ -62,7 +62,7 @@ static ssize_t period_store(struct device *child,
>  	mutex_lock(&export->lock);
>  	pwm_get_state(pwm, &state);
>  	state.period = val;
> -	ret = pwm_apply_state(pwm, &state);
> +	ret = pwm_apply_cansleep(pwm, &state);
>  	mutex_unlock(&export->lock);
>  
>  	return ret ? : size;
> @@ -97,7 +97,7 @@ static ssize_t duty_cycle_store(struct device *child,
>  	mutex_lock(&export->lock);
>  	pwm_get_state(pwm, &state);
>  	state.duty_cycle = val;
> -	ret = pwm_apply_state(pwm, &state);
> +	ret = pwm_apply_cansleep(pwm, &state);
>  	mutex_unlock(&export->lock);
>  
>  	return ret ? : size;
> @@ -144,7 +144,7 @@ static ssize_t enable_store(struct device *child,
>  		goto unlock;
>  	}
>  
> -	ret = pwm_apply_state(pwm, &state);
> +	ret = pwm_apply_cansleep(pwm, &state);
>  
>  unlock:
>  	mutex_unlock(&export->lock);
> @@ -194,7 +194,7 @@ static ssize_t polarity_store(struct device *child,
>  	mutex_lock(&export->lock);
>  	pwm_get_state(pwm, &state);
>  	state.polarity = polarity;
> -	ret = pwm_apply_state(pwm, &state);
> +	ret = pwm_apply_cansleep(pwm, &state);
>  	mutex_unlock(&export->lock);
>  
>  	return ret ? : size;
> @@ -401,7 +401,7 @@ static int pwm_class_apply_state(struct pwm_export *export,
>  				 struct pwm_device *pwm,
>  				 struct pwm_state *state)
>  {
> -	int ret = pwm_apply_state(pwm, state);
> +	int ret = pwm_apply_cansleep(pwm, state);
>  
>  	/* release lock taken in pwm_class_get_state */
>  	mutex_unlock(&export->lock);
> diff --git a/drivers/regulator/pwm-regulator.c b/drivers/regulator/pwm-regulator.c
> index 2aff6db748e2c..c19d37a479d43 100644
> --- a/drivers/regulator/pwm-regulator.c
> +++ b/drivers/regulator/pwm-regulator.c
> @@ -90,7 +90,7 @@ static int pwm_regulator_set_voltage_sel(struct regulator_dev *rdev,
>  	pwm_set_relative_duty_cycle(&pstate,
>  			drvdata->duty_cycle_table[selector].dutycycle, 100);
>  
> -	ret = pwm_apply_state(drvdata->pwm, &pstate);
> +	ret = pwm_apply_cansleep(drvdata->pwm, &pstate);
>  	if (ret) {
>  		dev_err(&rdev->dev, "Failed to configure PWM: %d\n", ret);
>  		return ret;
> @@ -216,7 +216,7 @@ static int pwm_regulator_set_voltage(struct regulator_dev *rdev,
>  
>  	pwm_set_relative_duty_cycle(&pstate, dutycycle, duty_unit);
>  
> -	ret = pwm_apply_state(drvdata->pwm, &pstate);
> +	ret = pwm_apply_cansleep(drvdata->pwm, &pstate);
>  	if (ret) {
>  		dev_err(&rdev->dev, "Failed to configure PWM: %d\n", ret);
>  		return ret;
> diff --git a/drivers/video/backlight/lm3630a_bl.c b/drivers/video/backlight/lm3630a_bl.c
> index 8fcb62be597b8..5cb702989ef61 100644
> --- a/drivers/video/backlight/lm3630a_bl.c
> +++ b/drivers/video/backlight/lm3630a_bl.c
> @@ -180,7 +180,7 @@ static int lm3630a_pwm_ctrl(struct lm3630a_chip *pchip, int br, int br_max)
>  
>  	pchip->pwmd_state.enabled = pchip->pwmd_state.duty_cycle ? true : false;
>  
> -	return pwm_apply_state(pchip->pwmd, &pchip->pwmd_state);
> +	return pwm_apply_cansleep(pchip->pwmd, &pchip->pwmd_state);
>  }
>  
>  /* update and get brightness */
> diff --git a/drivers/video/backlight/lp855x_bl.c b/drivers/video/backlight/lp855x_bl.c
> index da1f124db69c0..b7edbaaa169a4 100644
> --- a/drivers/video/backlight/lp855x_bl.c
> +++ b/drivers/video/backlight/lp855x_bl.c
> @@ -234,7 +234,7 @@ static int lp855x_pwm_ctrl(struct lp855x *lp, int br, int max_br)
>  	state.duty_cycle = div_u64(br * state.period, max_br);
>  	state.enabled = state.duty_cycle;
>  
> -	return pwm_apply_state(lp->pwm, &state);
> +	return pwm_apply_cansleep(lp->pwm, &state);
>  }
>  
>  static int lp855x_bl_update_status(struct backlight_device *bl)
> diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
> index a51fbab963680..f2568aaae4769 100644
> --- a/drivers/video/backlight/pwm_bl.c
> +++ b/drivers/video/backlight/pwm_bl.c
> @@ -103,7 +103,7 @@ static int pwm_backlight_update_status(struct backlight_device *bl)
>  		pwm_get_state(pb->pwm, &state);
>  		state.duty_cycle = compute_duty_cycle(pb, brightness, &state);
>  		state.enabled = true;
> -		pwm_apply_state(pb->pwm, &state);
> +		pwm_apply_cansleep(pb->pwm, &state);
>  
>  		pwm_backlight_power_on(pb);
>  	} else {
> @@ -120,7 +120,7 @@ static int pwm_backlight_update_status(struct backlight_device *bl)
>  		 * inactive output.
>  		 */
>  		state.enabled = !pb->power_supply && !pb->enable_gpio;
> -		pwm_apply_state(pb->pwm, &state);
> +		pwm_apply_cansleep(pb->pwm, &state);
>  	}
>  
>  	if (pb->notify_after)
> @@ -528,7 +528,7 @@ static int pwm_backlight_probe(struct platform_device *pdev)
>  	if (!state.period && (data->pwm_period_ns > 0))
>  		state.period = data->pwm_period_ns;
>  
> -	ret = pwm_apply_state(pb->pwm, &state);
> +	ret = pwm_apply_cansleep(pb->pwm, &state);
>  	if (ret) {
>  		dev_err(&pdev->dev, "failed to apply initial PWM state: %d\n",
>  			ret);
> diff --git a/drivers/video/fbdev/ssd1307fb.c b/drivers/video/fbdev/ssd1307fb.c
> index 5ae48e36fccb4..e5cca01af55f3 100644
> --- a/drivers/video/fbdev/ssd1307fb.c
> +++ b/drivers/video/fbdev/ssd1307fb.c
> @@ -347,7 +347,7 @@ static int ssd1307fb_init(struct ssd1307fb_par *par)
>  
>  		pwm_init_state(par->pwm, &pwmstate);
>  		pwm_set_relative_duty_cycle(&pwmstate, 50, 100);
> -		pwm_apply_state(par->pwm, &pwmstate);
> +		pwm_apply_cansleep(par->pwm, &pwmstate);
>  
>  		/* Enable the PWM */
>  		pwm_enable(par->pwm);
> diff --git a/include/linux/pwm.h b/include/linux/pwm.h
> index d2f9f690a9c14..373b5a4fe27dc 100644
> --- a/include/linux/pwm.h
> +++ b/include/linux/pwm.h
> @@ -95,8 +95,8 @@ struct pwm_device {
>   * @state: state to fill with the current PWM state
>   *
>   * The returned PWM state represents the state that was applied by a previous call to
> - * pwm_apply_state(). Drivers may have to slightly tweak that state before programming it to
> - * hardware. If pwm_apply_state() was never called, this returns either the current hardware
> + * pwm_apply_cansleep(). Drivers may have to slightly tweak that state before programming it to
> + * hardware. If pwm_apply_cansleep() was never called, this returns either the current hardware
>   * state (if supported) or the default settings.
>   */
>  static inline void pwm_get_state(const struct pwm_device *pwm,
> @@ -160,20 +160,20 @@ static inline void pwm_get_args(const struct pwm_device *pwm,
>  }
>  
>  /**
> - * pwm_init_state() - prepare a new state to be applied with pwm_apply_state()
> + * pwm_init_state() - prepare a new state to be applied with pwm_apply_cansleep()
>   * @pwm: PWM device
>   * @state: state to fill with the prepared PWM state
>   *
>   * This functions prepares a state that can later be tweaked and applied
> - * to the PWM device with pwm_apply_state(). This is a convenient function
> + * to the PWM device with pwm_apply_cansleep(). This is a convenient function
>   * that first retrieves the current PWM state and the replaces the period
>   * and polarity fields with the reference values defined in pwm->args.
>   * Once the function returns, you can adjust the ->enabled and ->duty_cycle
> - * fields according to your needs before calling pwm_apply_state().
> + * fields according to your needs before calling pwm_apply_cansleep().
>   *
>   * ->duty_cycle is initially set to zero to avoid cases where the current
>   * ->duty_cycle value exceed the pwm_args->period one, which would trigger
> - * an error if the user calls pwm_apply_state() without adjusting ->duty_cycle
> + * an error if the user calls pwm_apply_cansleep() without adjusting ->duty_cycle
>   * first.
>   */
>  static inline void pwm_init_state(const struct pwm_device *pwm,
> @@ -229,7 +229,7 @@ pwm_get_relative_duty_cycle(const struct pwm_state *state, unsigned int scale)
>   *
>   * pwm_init_state(pwm, &state);
>   * pwm_set_relative_duty_cycle(&state, 50, 100);
> - * pwm_apply_state(pwm, &state);
> + * pwm_apply_cansleep(pwm, &state);
>   *
>   * This functions returns -EINVAL if @duty_cycle and/or @scale are
>   * inconsistent (@scale == 0 or @duty_cycle > @scale).
> @@ -289,6 +289,7 @@ struct pwm_ops {
>   * @npwm: number of PWMs controlled by this chip
>   * @of_xlate: request a PWM device given a device tree PWM specifier
>   * @of_pwm_n_cells: number of cells expected in the device tree PWM specifier
> + * @atomic: can the driver execute pwm_apply_cansleep in atomic context
>   * @list: list node for internal use
>   * @pwms: array of PWM devices allocated by the framework
>   */
> @@ -301,6 +302,7 @@ struct pwm_chip {
>  	struct pwm_device * (*of_xlate)(struct pwm_chip *chip,
>  					const struct of_phandle_args *args);
>  	unsigned int of_pwm_n_cells;
> +	bool atomic;
>  
>  	/* only used internally by the PWM framework */
>  	struct list_head list;
> @@ -309,7 +311,8 @@ struct pwm_chip {
>  
>  #if IS_ENABLED(CONFIG_PWM)
>  /* PWM user APIs */
> -int pwm_apply_state(struct pwm_device *pwm, const struct pwm_state *state);
> +int pwm_apply_cansleep(struct pwm_device *pwm, const struct pwm_state *state);
> +int pwm_apply(struct pwm_device *pwm, const struct pwm_state *state);
>  int pwm_adjust_config(struct pwm_device *pwm);
>  
>  /**
> @@ -337,7 +340,7 @@ static inline int pwm_config(struct pwm_device *pwm, int duty_ns,
>  
>  	state.duty_cycle = duty_ns;
>  	state.period = period_ns;
> -	return pwm_apply_state(pwm, &state);
> +	return pwm_apply_cansleep(pwm, &state);
>  }
>  
>  /**
> @@ -358,7 +361,7 @@ static inline int pwm_enable(struct pwm_device *pwm)
>  		return 0;
>  
>  	state.enabled = true;
> -	return pwm_apply_state(pwm, &state);
> +	return pwm_apply_cansleep(pwm, &state);
>  }
>  
>  /**
> @@ -377,7 +380,18 @@ static inline void pwm_disable(struct pwm_device *pwm)
>  		return;
>  
>  	state.enabled = false;
> -	pwm_apply_state(pwm, &state);
> +	pwm_apply_cansleep(pwm, &state);
> +}
> +
> +/**
> + * pwm_is_atomic() - is pwm_apply() supported?
> + * @pwm: PWM device
> + *
> + * Returns: true pwm_apply() can be called from atomic context.
> + */
> +static inline bool pwm_is_atomic(struct pwm_device *pwm)
> +{
> +	return pwm->chip->atomic;
>  }
>  
>  /* PWM provider APIs */
> @@ -408,16 +422,27 @@ struct pwm_device *devm_fwnode_pwm_get(struct device *dev,
>  				       struct fwnode_handle *fwnode,
>  				       const char *con_id);
>  #else
> -static inline int pwm_apply_state(struct pwm_device *pwm,
> -				  const struct pwm_state *state)
> +static inline bool pwm_is_atomic(struct pwm_device *pwm)
> +{
> +	return false;
> +}
> +
> +static inline int pwm_apply_cansleep(struct pwm_device *pwm,
> +				     const struct pwm_state *state)
>  {
>  	might_sleep();
> -	return -ENOTSUPP;
> +	return -EOPNOTSUPP;
> +}
> +
> +static inline int pwm_apply(struct pwm_device *pwm,
> +			    const struct pwm_state *state)
> +{
> +	return -EOPNOTSUPP;
>  }
>  
>  static inline int pwm_adjust_config(struct pwm_device *pwm)
>  {
> -	return -ENOTSUPP;
> +	return -EOPNOTSUPP;
>  }
>  
>  static inline int pwm_config(struct pwm_device *pwm, int duty_ns,
> @@ -536,7 +561,7 @@ static inline void pwm_apply_args(struct pwm_device *pwm)
>  	state.period = pwm->args.period;
>  	state.usage_power = false;
>  
> -	pwm_apply_state(pwm, &state);
> +	pwm_apply_cansleep(pwm, &state);
>  }
>  
>  struct pwm_lookup {

