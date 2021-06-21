Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3263AE9D7
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 15:14:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14CA36E027;
	Mon, 21 Jun 2021 13:14:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2499E6E027
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 13:14:56 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 l7-20020a05600c1d07b02901b0e2ebd6deso10695815wms.1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 06:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=bIFIByuOrJ9vre3Db7oecRl4g6yZz3JjWn/NEk86LVk=;
 b=L6rKETQ/FC0rGnqhBC+AaPaop6zXJZOOOmgXYqW3JzpUYutXLX60uK3w1rkcve9a8+
 XImT6PYUn6YemSA/SOzKqR/xm/Y0a6651knKdwoB9zQ8jAJ0+O3Trmed+fSXUPjMaRIy
 F29FOdbcXP783F9eKwiJ677m6uDv6vem/2FJZgSafAs75pqeXoRuRCjO6ycTKdWF2rWR
 UeFPjgowfOC3lASkS2fUOiaZZ0W6bjPt600/z6AoXi2MBmTWD9KRBHo9a6SYjASaHvHE
 ORUt0PeQt++YhFApJnTG1JeQhAkuHtL+IGYB77k44tiRhTHVRmd/QzMpz++JVxrXZIQN
 +QFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=bIFIByuOrJ9vre3Db7oecRl4g6yZz3JjWn/NEk86LVk=;
 b=RkYGM2Uh6B/xjwVv9dVZSJQBZqhUwv69osFkx+FURAFb8Fa8bHsEQoHwOPvhs8hGxB
 qMCoLEydJF+ZKfIL2S8z54GLDhHuvneHhFxcHZTu4QtFEDcHqWAS0jOYYw0fC4ajevaE
 0krb3z2VD8qbaUTCeiqd9Q3+cpvEwxhksV8eV6uvQpOXtphQKAmboLBHaT0/qWtso21s
 uWEEEr5OR1cYAVC0fSSmDFLLt6e+P1i+NJ3wxJLS91jToh64wCsll8iMxT0ooCBLzlY6
 NJSzBaiW1kfWKzhirgWbF7IhItM42vDT2n8wVNjdooDaqLLctmsaeXvaNovjgzLhL5cy
 MNjQ==
X-Gm-Message-State: AOAM531skcmEqDLZB8Uro6Qhlx72xtdOvVbm1ZM2/vEjH9TZWMiH6MR+
 7HgvVo7AE5hL0///poAY3xa/Qw==
X-Google-Smtp-Source: ABdhPJxLuM1+DlTVV9Pnzaa2naBu4a/JLd+3YiN0tkm5XCvojjWTrWmGs0aJSGZixHc6wga5u2JsAw==
X-Received: by 2002:a7b:c013:: with SMTP id c19mr26860484wmb.158.1624281294848; 
 Mon, 21 Jun 2021 06:14:54 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id v22sm9532508wmh.40.2021.06.21.06.14.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 06:14:54 -0700 (PDT)
Date: Mon, 21 Jun 2021 14:14:52 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v3 2/2] backlight: lm3630a: convert to atomic PWM API and
 check for errors
Message-ID: <20210621131452.udhm2qbz47s3yafc@maple.lan>
References: <20210621122148.116863-1-u.kleine-koenig@pengutronix.de>
 <20210621122148.116863-3-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210621122148.116863-3-u.kleine-koenig@pengutronix.de>
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
Cc: linux-fbdev@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 kernel@pengutronix.de, Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 21, 2021 at 02:21:48PM +0200, Uwe Kleine-König wrote:
> The practical upside here is that this only needs a single API call to
> program the hardware which (depending on the underlaying hardware) can
> be more effective and prevents glitches.
> 
> Up to now the return value of the pwm functions was ignored. Fix this
> and propagate the error to the caller.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.


> ---
>  drivers/video/backlight/lm3630a_bl.c | 42 +++++++++++++---------------
>  1 file changed, 19 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/video/backlight/lm3630a_bl.c b/drivers/video/backlight/lm3630a_bl.c
> index 7140b0d98082..f377dfdd9868 100644
> --- a/drivers/video/backlight/lm3630a_bl.c
> +++ b/drivers/video/backlight/lm3630a_bl.c
> @@ -52,6 +52,7 @@ struct lm3630a_chip {
>  	struct gpio_desc *enable_gpio;
>  	struct regmap *regmap;
>  	struct pwm_device *pwmd;
> +	struct pwm_state pwmd_state;
>  };
>  
>  /* i2c access */
> @@ -167,16 +168,19 @@ static int lm3630a_intr_config(struct lm3630a_chip *pchip)
>  	return rval;
>  }
>  
> -static void lm3630a_pwm_ctrl(struct lm3630a_chip *pchip, int br, int br_max)
> +static int lm3630a_pwm_ctrl(struct lm3630a_chip *pchip, int br, int br_max)
>  {
> -	unsigned int period = pchip->pdata->pwm_period;
> -	unsigned int duty = br * period / br_max;
> +	int err;
>  
> -	pwm_config(pchip->pwmd, duty, period);
> -	if (duty)
> -		pwm_enable(pchip->pwmd);
> -	else
> -		pwm_disable(pchip->pwmd);
> +	pchip->pwmd_state.period = pchip->pdata->pwm_period;
> +
> +	err = pwm_set_relative_duty_cycle(&pchip->pwmd_state, br, br_max);
> +	if (err)
> +		return err;
> +
> +	pchip->pwmd_state.enabled = pchip->pwmd_state.duty_cycle ? true : false;
> +
> +	return pwm_apply_state(pchip->pwmd, &pchip->pwmd_state);
>  }
>  
>  /* update and get brightness */
> @@ -187,11 +191,9 @@ static int lm3630a_bank_a_update_status(struct backlight_device *bl)
>  	enum lm3630a_pwm_ctrl pwm_ctrl = pchip->pdata->pwm_ctrl;
>  
>  	/* pwm control */
> -	if ((pwm_ctrl & LM3630A_PWM_BANK_A) != 0) {
> -		lm3630a_pwm_ctrl(pchip, bl->props.brightness,
> -				 bl->props.max_brightness);
> -		return 0;
> -	}
> +	if ((pwm_ctrl & LM3630A_PWM_BANK_A) != 0)
> +		return lm3630a_pwm_ctrl(pchip, bl->props.brightness,
> +					bl->props.max_brightness);
>  
>  	/* disable sleep */
>  	ret = lm3630a_update(pchip, REG_CTRL, 0x80, 0x00);
> @@ -264,11 +266,9 @@ static int lm3630a_bank_b_update_status(struct backlight_device *bl)
>  	enum lm3630a_pwm_ctrl pwm_ctrl = pchip->pdata->pwm_ctrl;
>  
>  	/* pwm control */
> -	if ((pwm_ctrl & LM3630A_PWM_BANK_B) != 0) {
> -		lm3630a_pwm_ctrl(pchip, bl->props.brightness,
> -				 bl->props.max_brightness);
> -		return 0;
> -	}
> +	if ((pwm_ctrl & LM3630A_PWM_BANK_B) != 0)
> +		return lm3630a_pwm_ctrl(pchip, bl->props.brightness,
> +					bl->props.max_brightness);
>  
>  	/* disable sleep */
>  	ret = lm3630a_update(pchip, REG_CTRL, 0x80, 0x00);
> @@ -563,11 +563,7 @@ static int lm3630a_probe(struct i2c_client *client,
>  			return PTR_ERR(pchip->pwmd);
>  		}
>  
> -		/*
> -		 * FIXME: pwm_apply_args() should be removed when switching to
> -		 * the atomic PWM API.
> -		 */
> -		pwm_apply_args(pchip->pwmd);
> +		pwm_init_state(pchip->pwmd, &pchip->pwmd_state);
>  	}
>  
>  	/* interrupt enable  : irq 0 is not allowed */
> -- 
> 2.30.2
> 
