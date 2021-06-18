Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A04653AC8D7
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 12:31:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B466E9DE;
	Fri, 18 Jun 2021 10:31:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE0236E9CF
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 10:31:13 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 n35-20020a05600c3ba3b02901cdecb6bda8so8336032wms.5
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 03:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=cihbsgEtYnVxdrkS4r7XcqbH/OKFs8p0aoMVL84XjSk=;
 b=jn08rWVlCC2tifool8RXg8H6TcK5rnvs/9i83KpXjBn/V7wKSTRt4d4gCC15ZrPA1R
 zqTASJnHddIaKZkpsQfHkisMg98pX2HXut6r57aLiy71KLFB7WE7ULWyX2Hk3kEetIfI
 +xLNDKadSPQwD0t2uq4j+EQVYr0634cw7MdOUYBUIXF7mrGozxmqaF7o8unMspfK364j
 ibooPS2lQ+pmsvm/LdNrXzgrhPkO1t7wcigCR5lWzMmQ922nBIiCIk1zIv7kdtPAbooi
 l54z7VS1EfnnXhuMyXaXiSmD4qhFDH9v/VXrIT5xUUPw2n+Dhm6apcQwmVkS1o2LnnU/
 1FUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=cihbsgEtYnVxdrkS4r7XcqbH/OKFs8p0aoMVL84XjSk=;
 b=UsMKhIpRXObgwJRu17mUlzSOdzW5MqQKddobp+4hKKCIaRnmqExAcmVQqVRyKD8pBh
 4BmPVm+QYpldi2X7UCKznFZiAvwDZI2gwYwfBO+Yv9xBMPMvQWTZlWTXH/vgxqlzwc/O
 C51x9DluXvZxgt/NqGNvLYgL8dfjyPRAeu6meumOJPOjckPG//TJTECKABDgVBL4lZE9
 GR19qzpDpidsT/RxNDislFXm4yL1CwGu8Qv7nRpPdz7JCrZ7d9D19ID2ZQL5FYTNQZqT
 8ulpJk5sch89KsyZW0EXTr4LLrj7dp00MPgYiD0lpoU5vOlCVWpvhJAiFGy5My05xLrD
 +fHg==
X-Gm-Message-State: AOAM5315QhP/4NvVSQQMECq3Y9rEsvY8/LRhUL1vsrjBgGyzadyxD/mk
 i17UXNAnI9m70drb2GXaMbI9dA==
X-Google-Smtp-Source: ABdhPJzmVu5eCTgvyPXfWQXhvmtJhz9s0bWfQcET358VEtoRVshPN7UoGYzxW89DWg4X0ZJY398X7Q==
X-Received: by 2002:a1c:9a8b:: with SMTP id c133mr2457196wme.65.1624012272480; 
 Fri, 18 Jun 2021 03:31:12 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id v5sm962817wml.26.2021.06.18.03.31.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 03:31:11 -0700 (PDT)
Date: Fri, 18 Jun 2021 11:31:09 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] backlight: lm3630a: convert to atomic PWM API and check
 for errors
Message-ID: <20210618103109.j7vtuif4taldtt5d@maple.lan>
References: <20210618085844.231751-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210618085844.231751-1-u.kleine-koenig@pengutronix.de>
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

On Fri, Jun 18, 2021 at 10:58:44AM +0200, Uwe Kleine-König wrote:
> The practical upside here is that this only needs a single API call to
> program the hardware which (depending on the underlaying hardware) can
> be more effective and prevents glitches.
> 
> Up to now the return value of the pwm functions was ignored. Fix this
> and propagate the error to the caller.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

New code looks OK but these changes reveal just how crazy the return codes
from this driver's update_status() methods are since now the new (PWM) error path is
structured completely differently to the existing (I2C) error path.

update_status() should return 0 on success and a -ve errno otherwise.

Thus the new code to return -errno is correct and so is the I2C success
code path. However the PWM success path and the I2C error path are both
broken.

Are you OK to add a patch *before* this one to fix the existing code
paths before making the PWM changes?


Daniel.

> ---
>  drivers/video/backlight/lm3630a_bl.c | 33 +++++++++++++++-------------
>  1 file changed, 18 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/video/backlight/lm3630a_bl.c b/drivers/video/backlight/lm3630a_bl.c
> index e88a2b0e5904..24fa7e6938fa 100644
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
> @@ -188,8 +192,11 @@ static int lm3630a_bank_a_update_status(struct backlight_device *bl)
>  
>  	/* pwm control */
>  	if ((pwm_ctrl & LM3630A_PWM_BANK_A) != 0) {
> -		lm3630a_pwm_ctrl(pchip, bl->props.brightness,
> -				 bl->props.max_brightness);
> +		ret = lm3630a_pwm_ctrl(pchip, bl->props.brightness,
> +				       bl->props.max_brightness);
> +		if (ret)
> +			return ret;
> +
>  		return bl->props.brightness;
>  	}
>  
> @@ -563,11 +570,7 @@ static int lm3630a_probe(struct i2c_client *client,
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
