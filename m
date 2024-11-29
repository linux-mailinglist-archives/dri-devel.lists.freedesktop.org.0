Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 725629DE823
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 14:54:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E697F10E34A;
	Fri, 29 Nov 2024 13:54:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vHoh5TZL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 493AD10E340
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 13:54:40 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-434a14d6bf4so17333255e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 05:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732888478; x=1733493278; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=HB5qvtsPd7f9i7gdKT/XuYTYZDECuYTYPRyyqxwrKxQ=;
 b=vHoh5TZLMWUAgjUk0GA9Y/0YL/O6cUl/X5z9KwCp4+Rn8vwEafO2zUxa+LSnyVoZn6
 aW7OKn1c30t3lq5xlE6hL+2/Crml3+IZZNtni7pamOuAg8jKLVvL7e8ZOTZ1XIBU5/bJ
 bqrVhEVNXLQXbrzU4yCQnDlixnMRpSm/M7pm+fLRL+PCWgKyF+8/ZZNcsAl/VCzG3HR0
 wRNEQgrIL/FX2kIv/TPGanwB3YTVKAQscHk+fcYex/DRavu/nAyM9yIM1KlyURWyUsUZ
 b9uVLF6N20UDbkty7Nn30WHle2a65pwBYx+8lQMpAoWCICwbEeB0OyWSSm2qYr22cdGm
 Us1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732888478; x=1733493278;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=HB5qvtsPd7f9i7gdKT/XuYTYZDECuYTYPRyyqxwrKxQ=;
 b=IWTi392l8KdmDVWOuHQdni8vXP0xUCorMAn1vO3rsWRCZxXKWfwUcV53AJvvU0yFZl
 JVS6bGb3EvQounzY6v4Xj6doLlNxcPiywtq/8JU0Jcc0uK9aJvb0y2ePpC/hqvI0mL1s
 xROZawlvv1aVHYG9HpFzwlExVYga3mkW4hwy9ImXyCr4azZxXaHJQVJE6WBJpf8j0gxb
 DBgGab1S1xiuowUfyyH/fM92Q6FwHBddyMzDnBhXssqSIFWjpOu/pFdYo2JTtu64eIkV
 sUm+Nq4DWT3YtqWc4kAnmdminbpWMlaS2AESpDzQ8kFqIobNMuuWnq9h3PPmEJLuc6Nl
 4ggw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLzAxGeml++OKupvo9+eP7585ginA/xGdP2RZOiDxPrA3JZA1sLGm1qXVYcSCvOlU75yeDIK5vQSA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfO83ZlkeEIlBBRQFfiiC1ssT2lnw5nUiQqcWcggHk4wBGpArt
 IEpkjpsPWGJwonY/0qYE1Qqu5ZcHHNtCSP8+08C2pIpFkKyIANkaXwRwBaTl1Eo=
X-Gm-Gg: ASbGncuxQJFYSgpTw4nL8HhdcuAejhSw9zmT3ZjlxC0XzSfuYytILEALkk4IDqs758j
 tpGS4HOraywlzqIjXXGLLZjvaN3R6kNSf6q/8PVYVQqUZA1HAwC8i/FcSrSjYGyMMcVmH5+d4j/
 RBO3sgTvaEFvfJyRzPK5irgExgK1y15/Ejw11f40pJfS+jgVSyotG/vB/549q0NKJjwni+egvL+
 JtqwqhdpShKWh/5UPbX67l8sxdowLZTybRsL4akNRfAQxAWm5MSGd7yvgyB5aVnDkJld2NwDZAu
 ISAQ9k9gc7MCnx47Gmt+m+gw
X-Google-Smtp-Source: AGHT+IFEgiv/oMH6zMYYtqaT1kchAaDlXi2IcfQveaywoKQGG/30eJYlHrTESus/gJsTsqI8VPCUpw==
X-Received: by 2002:a05:600c:83c5:b0:431:44f6:566f with SMTP id
 5b1f17b1804b1-434a9dc14c7mr112122265e9.13.1732888478419; 
 Fri, 29 Nov 2024 05:54:38 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:f573:30fa:4c5:27df?
 ([2a01:e0a:982:cbb0:f573:30fa:4c5:27df])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434aa74f18bsm87508445e9.4.2024.11.29.05.54.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Nov 2024 05:54:37 -0800 (PST)
Message-ID: <2c1ffbc6-0d67-4787-9fbe-03255b377c76@linaro.org>
Date: Fri, 29 Nov 2024 14:54:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 8/8] drm/msm/dp: Support external GPIO HPD with 3rd
 pinctrl chip
To: Xiangxu Yin <quic_xiangxuy@quicinc.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, quic_lliu6@quicinc.com, quic_fangez@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-gpio@vger.kernel.org
References: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
 <20241129-add-displayport-support-for-qcs615-platform-v1-8-09a4338d93ef@quicinc.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20241129-add-displayport-support-for-qcs615-platform-v1-8-09a4338d93ef@quicinc.com>
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
Reply-To: neil.armstrong@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/11/2024 08:57, Xiangxu Yin wrote:
> Add support for handling HPD (Hot Plug Detect) signals via external
> GPIOs connected through pinctrl chips (e.g., Semtech SX1509Q). This
> involves reinitializing the relevant GPIO and binding an interrupt
> handler to process hot plug events. Since external GPIOs only support
> edge interrupts (rising or falling) rather than state interrupts, the
> GPIO state must be read during the first DP bridge HPD enablement. This
> ensures the current connection state is determined and a hot plug event
> is reported accordingly.
> 
> Signed-off-by: Xiangxu Yin <quic_xiangxuy@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 83 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 83 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index eb6fb76c68e505fafbec563440e9784f51e1894b..22c288ca61b9b444a7b8d4a574c614bfef9d88be 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -13,6 +13,8 @@
>   #include <linux/delay.h>
>   #include <drm/display/drm_dp_aux_bus.h>
>   #include <drm/drm_edid.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/of_gpio.h>
>   
>   #include "msm_drv.h"
>   #include "msm_kms.h"
> @@ -78,6 +80,10 @@ struct msm_dp_display_private {
>   
>   	unsigned int id;
>   
> +	bool ext_gpio;
> +	int gpio_num;
> +	struct work_struct  gpio_work;
> +
>   	/* state variables */
>   	bool core_initialized;
>   	bool phy_initialized;
> @@ -1182,6 +1188,42 @@ static irqreturn_t msm_dp_display_irq_handler(int irq, void *dev_id)
>   	return ret;
>   }
>   
> +
> +static void msm_dp_gpio_work_handler(struct work_struct *work)
> +{
> +	struct msm_dp_display_private *dp = container_of(work,
> +			struct msm_dp_display_private, gpio_work);
> +	struct gpio_desc *desc;
> +	bool hpd;
> +
> +	if (dp->ext_gpio) {
> +		desc = gpio_to_desc(dp->gpio_num);
> +		if (!desc) {
> +			pr_err("Failed to get gpio_desc for GPIO %d\n", dp->gpio_num);
> +			return;
> +		}
> +
> +		hpd = gpiod_get_value_cansleep(desc);
> +		if (hpd)
> +			msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
> +		else
> +			msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
> +	}
> +}
> +
> +static irqreturn_t msm_dp_gpio_isr(int unused, void *data)
> +{
> +	struct msm_dp_display_private *dp = data;
> +
> +	if (!dp) {
> +		DRM_ERROR("NULL data\n");
> +		return IRQ_NONE;
> +	}
> +
> +	schedule_work(&dp->gpio_work);

this msm_dp_gpio_isr is already threaded, would would you also schedule a work ?

> +	return IRQ_HANDLED;
> +}
> +
>   static int msm_dp_display_request_irq(struct msm_dp_display_private *dp)
>   {
>   	int rc = 0;
> @@ -1193,6 +1235,21 @@ static int msm_dp_display_request_irq(struct msm_dp_display_private *dp)
>   		return dp->irq;
>   	}
>   
> +	if (dp->ext_gpio) {
> +		int edge, gpio_irq;
> +
> +		gpio_irq = gpio_to_irq(dp->gpio_num);

But as Dmitry reported, the system should use a dp-connected as a next bridge
instead which already supports all this much better:
drivers/gpu/drm/bridge/display-connector.c
Documentation/devicetree/bindings/display/connector/dp-connector.yaml

> +		edge = IRQF_TRIGGER_FALLING | IRQF_TRIGGER_RISING;
> +
> +		rc = devm_request_threaded_irq(&pdev->dev, gpio_irq, NULL,
> +		msm_dp_gpio_isr, edge, "dp_gpio_isr", dp);
> +		if (rc < 0) {
> +			DRM_ERROR("failed to request ext-gpio IRQ%u: %d\n",
> +					gpio_irq, rc);
> +			return rc;
> +		}
> +	}
> +
>   	rc = devm_request_irq(&pdev->dev, dp->irq, msm_dp_display_irq_handler,
>   			      IRQF_TRIGGER_HIGH|IRQF_NO_AUTOEN,
>   			      "dp_display_isr", dp);
> @@ -1308,10 +1365,32 @@ static int msm_dp_display_probe(struct platform_device *pdev)
>   		return -EPROBE_DEFER;
>   	}
>   
> +	if (of_find_property(pdev->dev.of_node, "dp-hpd-gpio", NULL)) {
> +		dp->ext_gpio = true;
> +		dp->gpio_num = of_get_named_gpio(pdev->dev.of_node, "dp-hpd-gpio", 0);
> +		if (dp->gpio_num < 0) {
> +			dev_err(&pdev->dev, "Failed to get gpio:%d\n", dp->gpio_num);
> +			return dp->gpio_num;
> +		}
> +
> +		if (!gpio_is_valid(dp->gpio_num)) {
> +			DRM_ERROR("gpio(%d) invalid\n", dp->gpio_num);
> +			return -EINVAL;
> +		}
> +
> +		rc = gpio_request(dp->gpio_num, "dp-hpd-gpio");
> +		if (rc) {
> +			dev_err(&pdev->dev, "Failed to request gpio:%d\n", dp->gpio_num);
> +			return rc;
> +		}
> +		gpio_direction_input(dp->gpio_num);
> +	}
> +
>   	/* setup event q */
>   	mutex_init(&dp->event_mutex);
>   	init_waitqueue_head(&dp->event_q);
>   	spin_lock_init(&dp->event_lock);
> +	INIT_WORK(&dp->gpio_work, msm_dp_gpio_work_handler);
>   
>   	/* Store DP audio handle inside DP display */
>   	dp->msm_dp_display.msm_dp_audio = dp->audio;
> @@ -1678,6 +1757,10 @@ void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge)
>   	msm_dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_INT_MASK, true);
>   
>   	msm_dp_display->internal_hpd = true;
> +
> +	if (dp->ext_gpio)
> +		schedule_work(&dp->gpio_work);
> +
>   	mutex_unlock(&dp->event_mutex);
>   }
>   
> 

