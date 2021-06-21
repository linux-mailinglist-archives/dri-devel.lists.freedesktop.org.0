Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCEB3AE789
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 12:47:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C97B892BD;
	Mon, 21 Jun 2021 10:47:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A089892BD
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 10:47:44 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id h11so1611966wrx.5
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 03:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=OdEudXtXjGQN/dt1vAk/VP3YNSIfD82T+dahjF+Eqfk=;
 b=dLH6co5FAw2vpQG4gb1SLS9vY8cXkvZM2/FHjc14+l3BsqIbMQ8TQqtpqg++4ZC/Lp
 IQrIkpM29jW9E9jmmIwpJ9diuVUXRBbn36PiKfo8DZ6FoZsZRPx/uOdmNUHiQv/aFJF6
 IEq1GxQG/OW0OPQoW6DrRB8f2ptle/M14sABxuKrF3oOVsv6FBncAeCp2qoJlIfyIaor
 3IylGme4SMO5nn7bNf3PhXi7YThu6vEXL6jtmfYHuubD7j6uqsT+3eYrYfhIyNvZY3jC
 XMro+fy6BGj/T7mzI+fFaJGGJJxIElWwqDWGgvtb1fAYL+Cf6RxtqHU0Sp/lRYtJCsZq
 j+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=OdEudXtXjGQN/dt1vAk/VP3YNSIfD82T+dahjF+Eqfk=;
 b=Uwzfs8ergUyVQGDXCToLCWDGGrAZUmob+9ngA2xYbHATb2GnZsLiEihxHxng2nELR3
 L+j8tnilcsxjPy3hJ6WaQXOrYfC+y1mcKVjYUVRHpY1bcD2YufLe3sl791fQt3m7PxWB
 NmCiULBNHwlg76hVCXpTaF5VuECu/URjxOP5G8+RtstZS8OfKPrKNRbY10sI1ZlMCtXN
 4a51ZFw8QYpN3ywZcBTI4GSor/RrwlPMQDdFzlFGq6bGqdGX3Sdm/EwwLisAFACmj1IQ
 QFGfj1wvNPHhRfeHa10oRwZcnZf2XmKIR0eouJmJVFMxfZpP088o2Im4/Gmij1n4hEvB
 KStQ==
X-Gm-Message-State: AOAM531GhxEIpBS32P+zKJI4JX1laJqhQ6lyn4jlXALpGCfUKyF8Cj18
 RfWJMRbOp6WNRA5tK/GV70BhYQ==
X-Google-Smtp-Source: ABdhPJyX5FTE5HVxXFwri17oTsxzpaBpm2xBpLIoni8Bfe8SclKa8ghQphJNAgUVIbnoFs/iX1Wv9g==
X-Received: by 2002:adf:e110:: with SMTP id t16mr27890314wrz.359.1624272462653; 
 Mon, 21 Jun 2021 03:47:42 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id t128sm4241264wma.41.2021.06.21.03.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 03:47:42 -0700 (PDT)
Date: Mon, 21 Jun 2021 11:47:40 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2 2/2] backlight: lm3630a: convert to atomic PWM API and
 check for errors
Message-ID: <20210621104740.cenlzw2wfy2vacoi@maple.lan>
References: <20210620193928.14467-1-u.kleine-koenig@pengutronix.de>
 <20210620193928.14467-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210620193928.14467-2-u.kleine-koenig@pengutronix.de>
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

On Sun, Jun 20, 2021 at 09:39:28PM +0200, Uwe Kleine-König wrote:
> The practical upside here is that this only needs a single API call to
> program the hardware which (depending on the underlaying hardware) can
> be more effective and prevents glitches.
> 
> Up to now the return value of the pwm functions was ignored. Fix this
> and propagate the error to the caller.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/video/backlight/lm3630a_bl.c | 34 +++++++++++++---------------
>  1 file changed, 16 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/video/backlight/lm3630a_bl.c b/drivers/video/backlight/lm3630a_bl.c
> index 16a2658a72e1..99eb8277149b 100644
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

My apologies for overlooking this at v1 (and even when reviewing the first of
the v2 patchs) but...  this fixes the code for bank A. Bank B also requires exactly
the same set of fixes!


Daniel.
