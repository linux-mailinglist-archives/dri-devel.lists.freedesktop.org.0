Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDD053BB2D
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 16:49:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25C1B112B31;
	Thu,  2 Jun 2022 14:49:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95DE9112B31
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 14:49:31 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id 1so5505240ljp.8
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 07:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ZaPpgfqig6aJt/76Qvkh8gpn5J3aYUO2TBWS+LCVcNw=;
 b=xAcxwRdCAT2Ihy85KZYPLWUGzOhRKeYUehrzVv/X14hZzJlHka5bNQC5UUmh5gq6Vj
 hg+i+DuOkXq1VrAFws/tCb6aQ8FlTaqFbFJot04Cb9Uedm8FurUWAyQOyCUWGJJk6e2V
 srDWmpSLcCRvUingZXHEocdrEoShSUbYZv5PEWz1X6niyD+/0rbJQUS+1tVGNnXtf4CK
 fJdiW/qOp3V4hwJ6vy3fQPY5ikQ9DzJndDWDy2kixTNNLhAYtsGCJtCcGzd7IulE0lBK
 UNV1P19+/LtnanzgBDMffJ/AulOguG82pVBZ2rjiyLFKjbxzYXGPzjNsEWAppxm+ob4m
 sdaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZaPpgfqig6aJt/76Qvkh8gpn5J3aYUO2TBWS+LCVcNw=;
 b=rXhZzbISQbub37RW+Z6q0O/RcKBoCES6iKPYJQe6U+HwyYdpRVeON4V0VaVQX+zAGb
 Qagqf8g8iNqqQYcZe8i4oi9vLKJ+z72v6n6riR7CTzNYDrTNOcU01Cjh3Vqu0EU00K5U
 I0cNIbqG3Hl3qqMH2rqcjWbet1m0kYI0/zcKB9bvvp41+s5TSLdYHLdqBM4TgN1vg3V4
 VEMaDVroLPbb2/aNaxm8RkvYjBgXu9Azo/+hinAKx+2XVqY5NMEcXn5fM4vBFU6uj+B1
 MfD1ofk739Ho7II18mUXCYVpg0fQ7oro7y2oO+aJfL/vf9xiZb386NPsVF5K18780Rxg
 vHhw==
X-Gm-Message-State: AOAM532NddhUR7TEyqigwTNpvWzx1qqAJSk/JaMjcRj1aGAia1kBtJWi
 9Ub7VyTB59s2VZ+qrdVYYzMBLg==
X-Google-Smtp-Source: ABdhPJxa6bzjIbiUOXzR2Vxnn9DSaTHbIZqB8ySqfk0u9alnBGU14jD8FiQdKMKCPAQDttMidXJtgA==
X-Received: by 2002:a2e:5c7:0:b0:255:61b2:6ca with SMTP id
 190-20020a2e05c7000000b0025561b206camr7651856ljf.313.1654181369614; 
 Thu, 02 Jun 2022 07:49:29 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 p17-20020a2ea4d1000000b0025530fa4edesm885074ljm.49.2022.06.02.07.49.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jun 2022 07:49:29 -0700 (PDT)
Message-ID: <5f3cf3a6-1cc2-63e4-f76b-4ee686764705@linaro.org>
Date: Thu, 2 Jun 2022 17:49:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 3/4] drm/panel: atna33xc20: Take advantage of
 wait_hpd_asserted() in struct drm_dp_aux
Content-Language: en-GB
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org
References: <20220418171757.2282651-1-dianders@chromium.org>
 <20220418101725.v3.3.I9ee239f6b95b944c8fa030f300ad222a7af9899d@changeid>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220418101725.v3.3.I9ee239f6b95b944c8fa030f300ad222a7af9899d@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Philip Chen <philipchen@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/04/2022 20:17, Douglas Anderson wrote:
> Let's add support for being able to read the HPD pin even if it's
> hooked directly to the controller. This will let us take away the
> waiting in the AUX transfer functions of the eDP controller drivers.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> Changes in v3:
> - Don't check "hpd_asserted" boolean when unset.
> - Handle errors from gpiod_get_value_cansleep() properly.
> 
> Changes in v2:
> - Change is_hpd_asserted() to wait_hpd_asserted()
> 
>   .../gpu/drm/panel/panel-samsung-atna33xc20.c  | 41 +++++++++++++------
>   1 file changed, 28 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
> index 20666b6217e7..5ef1b4032c56 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
> @@ -19,6 +19,10 @@
>   #include <drm/drm_edid.h>
>   #include <drm/drm_panel.h>
>   
> +/* T3 VCC to HPD high is max 200 ms */
> +#define HPD_MAX_MS	200
> +#define HPD_MAX_US	(HPD_MAX_MS * 1000)
> +
>   struct atana33xc20_panel {
>   	struct drm_panel base;
>   	bool prepared;
> @@ -30,6 +34,7 @@ struct atana33xc20_panel {
>   
>   	struct regulator *supply;
>   	struct gpio_desc *el_on3_gpio;
> +	struct drm_dp_aux *aux;
>   
>   	struct edid *edid;
>   
> @@ -79,7 +84,7 @@ static int atana33xc20_suspend(struct device *dev)
>   static int atana33xc20_resume(struct device *dev)
>   {
>   	struct atana33xc20_panel *p = dev_get_drvdata(dev);
> -	bool hpd_asserted = false;
> +	int hpd_asserted;
>   	int ret;
>   
>   	/* T12 (Power off time) is min 500 ms */
> @@ -91,20 +96,28 @@ static int atana33xc20_resume(struct device *dev)
>   	p->powered_on_time = ktime_get();
>   
>   	/*
> -	 * Handle HPD. Note: if HPD is hooked up to a dedicated pin on the
> -	 * eDP controller then "no_hpd" will be false _and_ "hpd_gpio" will be
> -	 * NULL. It's up to the controller driver to wait for HPD after
> -	 * preparing the panel in that case.
> +	 * Note that it's possible that no_hpd is false, hpd_gpio is
> +	 * NULL, and wait_hpd_asserted is NULL. This is because
> +	 * wait_hpd_asserted() is optional even if HPD is hooked up to
> +	 * a dedicated pin on the eDP controller. In this case we just
> +	 * assume that the controller driver will wait for HPD at the
> +	 * right times.
>   	 */
>   	if (p->no_hpd) {
> -		/* T3 VCC to HPD high is max 200 ms */
> -		msleep(200);
> -	} else if (p->hpd_gpio) {
> -		ret = readx_poll_timeout(gpiod_get_value_cansleep, p->hpd_gpio,
> -					 hpd_asserted, hpd_asserted,
> -					 1000, 200000);
> -		if (!hpd_asserted)
> -			dev_warn(dev, "Timeout waiting for HPD\n");
> +		msleep(HPD_MAX_MS);
> +	} else {
> +		if (p->hpd_gpio) {
> +			ret = readx_poll_timeout(gpiod_get_value_cansleep,
> +						 p->hpd_gpio, hpd_asserted,
> +						 hpd_asserted, 1000, HPD_MAX_US);
> +			if (hpd_asserted < 0)
> +				ret = hpd_asserted;
> +		} else if (p->aux->wait_hpd_asserted) {
> +			ret = p->aux->wait_hpd_asserted(p->aux, HPD_MAX_US);
> +		}
> +
> +		if (ret)
> +			dev_warn(dev, "Error waiting for HPD: %d\n", ret);

I'd suggest reworking this to:

if (p->no_hpd) {
   msleep();
   return 0;
}

if (p->hpd_gpio) {
  ret = readx_poll_timeout(...)

  if (ret)
    dev_warn()
  return ret;
}

if (p->aux->wait_hpd_asserted) {
   ret = p->aux->wait....
   if (ret)
     dev_warn(...)
   return ret;
}

return 0;


>   	}
>   
>   	return 0;
> @@ -263,6 +276,8 @@ static int atana33xc20_probe(struct dp_aux_ep_device *aux_ep)
>   		return -ENOMEM;
>   	dev_set_drvdata(dev, panel);
>   
> +	panel->aux = aux_ep->aux;
> +
>   	panel->supply = devm_regulator_get(dev, "power");
>   	if (IS_ERR(panel->supply))
>   		return dev_err_probe(dev, PTR_ERR(panel->supply),


-- 
With best wishes
Dmitry
