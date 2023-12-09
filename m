Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 379FA80B52C
	for <lists+dri-devel@lfdr.de>; Sat,  9 Dec 2023 17:08:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA6A310E1D1;
	Sat,  9 Dec 2023 16:08:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from box.trvn.ru (box.trvn.ru [194.87.146.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63D5710E0AD
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Dec 2023 16:08:00 +0000 (UTC)
Received: from authenticated-user (box.trvn.ru [194.87.146.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by box.trvn.ru (Postfix) with ESMTPSA id 90EE3404EA;
 Sat,  9 Dec 2023 21:07:53 +0500 (+05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
 t=1702138073; bh=QdkltvtvWEHkDzQGFDKHKNzq6NYrMl6/MViODfRKuZU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tNKu/FMlxvOZ5qKhRY453EyvswW+BAWAs8fQIyMg7NELhd5ZbbTCG9G6zB700vJ0/
 3nTKLSsY9UddpFpBnKamhtf7kriT0uOPQ34d/Ll3mD2ZPFYJKdHe7IQySjVsqCpz2n
 gcKFNslLiuGuTAdaoAfgNBi73NP5rYvh+q/uzPhqlStKFrVq1q3KN4oD5AF2zREZZd
 EaAVS5GxF/OqmInZFGFw2oRcFkSJyhBzM+YaWTTrPiR9LkbDPXvcvMFgVG1d6lNLgp
 +lm77WTCZJx0sR7pwYR/93GPoM4FvkitK4Yx0PZbG05wnqD9ZIZCrfgpsg3Mh9xt9g
 gkNcXGw4s5llw==
MIME-Version: 1.0
Date: Sat, 09 Dec 2023 21:07:52 +0500
From: Nikita Travkin <nikita@trvn.ru>
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v3] drm/bridge: ti-sn65dsi86: Associate PWM device to
 auxiliary device
In-Reply-To: <20231209153108.1988551-2-u.kleine-koenig@pengutronix.de>
References: <20231209153108.1988551-2-u.kleine-koenig@pengutronix.de>
Message-ID: <917272a44509545e81cd055a1fa133e2@trvn.ru>
X-Sender: nikita@trvn.ru
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, kernel@pengutronix.de,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Uwe Kleine-König писал(а) 09.12.2023 20:31:
> It's the ti_sn65dsi86.pwm auxiliary driver that creates the pwmchip, so
> let the auxiliary device be the parent of the pwm device.
> 
> Note that getting a reference to the ti-sn65dsi86's pwm using pwm_get()
> isn't affected by this change as ti_sn65dsi86_add_aux_device() sets the
> auxiliary device's of_node to that of the main device.
> 
> Also change PM runtime tracking and diagnostic messages to use that one.
> After enabling runtime PM operation for the auxiliary device, all works
> as expected as parent devices are handled just fine.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

This works well now, thanks!

Tested-by: Nikita Travkin <nikita@trvn.ru> # Acer Aspire 1

Nikita

> ---
> Changes since v2
> (https://lore.kernel.org/dri-devel/20231209152520.1987483-2-u.kleine-koenig@pengutronix.de):
> 
>  - Make use of devm_pm_runtime_enable as suggested by Douglas Anderson
>    in reply to v1 already. (Sorry, missed that while preparing v2 :-\)
> 
> Changes since (implicit) v1
> (https://lore.kernel.org/dri-devel/20231127101547.734061-2-u.kleine-koenig@pengutronix.de):
> 
>  - Add a call to pm_runtime_enable() for the aux device
>    (tested and diagnosed by Nikita Travkin).
>  - Rebased to yesterday's next, which required some (easy) conflict
>    resolution for commit c9d99c73940e ("drm/bridge: ti-sn65dsi86:
>    Simplify using pm_runtime_resume_and_get()").
> 
> Best regards
> Uwe
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 5b8e1dfc458d..9095d1453710 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -1413,7 +1413,7 @@ static int ti_sn_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
>  	int ret;
>  
>  	if (!pdata->pwm_enabled) {
> -		ret = pm_runtime_resume_and_get(pdata->dev);
> +		ret = pm_runtime_resume_and_get(chip->dev);
>  		if (ret < 0)
>  			return ret;
>  	}
> @@ -1429,7 +1429,7 @@ static int ti_sn_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
>  						 SN_GPIO_MUX_MASK << (2 * SN_PWM_GPIO_IDX),
>  						 SN_GPIO_MUX_SPECIAL << (2 * SN_PWM_GPIO_IDX));
>  			if (ret) {
> -				dev_err(pdata->dev, "failed to mux in PWM function\n");
> +				dev_err(chip->dev, "failed to mux in PWM function\n");
>  				goto out;
>  			}
>  		}
> @@ -1505,7 +1505,7 @@ static int ti_sn_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
>  
>  		ret = regmap_write(pdata->regmap, SN_PWM_PRE_DIV_REG, pre_div);
>  		if (ret) {
> -			dev_err(pdata->dev, "failed to update PWM_PRE_DIV\n");
> +			dev_err(chip->dev, "failed to update PWM_PRE_DIV\n");
>  			goto out;
>  		}
>  
> @@ -1517,7 +1517,7 @@ static int ti_sn_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
>  		     FIELD_PREP(SN_PWM_INV_MASK, state->polarity == PWM_POLARITY_INVERSED);
>  	ret = regmap_write(pdata->regmap, SN_PWM_EN_INV_REG, pwm_en_inv);
>  	if (ret) {
> -		dev_err(pdata->dev, "failed to update PWM_EN/PWM_INV\n");
> +		dev_err(chip->dev, "failed to update PWM_EN/PWM_INV\n");
>  		goto out;
>  	}
>  
> @@ -1525,7 +1525,7 @@ static int ti_sn_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
>  out:
>  
>  	if (!pdata->pwm_enabled)
> -		pm_runtime_put_sync(pdata->dev);
> +		pm_runtime_put_sync(chip->dev);
>  
>  	return ret;
>  }
> @@ -1585,12 +1585,14 @@ static int ti_sn_pwm_probe(struct auxiliary_device *adev,
>  {
>  	struct ti_sn65dsi86 *pdata = dev_get_drvdata(adev->dev.parent);
>  
> -	pdata->pchip.dev = pdata->dev;
> +	pdata->pchip.dev = &adev->dev;
>  	pdata->pchip.ops = &ti_sn_pwm_ops;
>  	pdata->pchip.npwm = 1;
>  	pdata->pchip.of_xlate = of_pwm_single_xlate;
>  	pdata->pchip.of_pwm_n_cells = 1;
>  
> +	devm_pm_runtime_enable(&adev->dev);
> +
>  	return pwmchip_add(&pdata->pchip);
>  }
>  
> @@ -1601,7 +1603,7 @@ static void ti_sn_pwm_remove(struct auxiliary_device *adev)
>  	pwmchip_remove(&pdata->pchip);
>  
>  	if (pdata->pwm_enabled)
> -		pm_runtime_put_sync(pdata->dev);
> +		pm_runtime_put_sync(&adev->dev);
>  }
>  
>  static const struct auxiliary_device_id ti_sn_pwm_id_table[] = {
> 
> base-commit: bc63de6e6ba0b16652c5fb4b9c9916b9e7ca1f23
