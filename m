Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D979298A760
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 16:38:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A4FB10E523;
	Mon, 30 Sep 2024 14:38:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MGMy8VuM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3470710E51E
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 14:38:18 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-37cd1ccaf71so2120481f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 07:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727707096; x=1728311896; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=H3mI5dB75SO68Jn6asF4H/I2WXinZvmksU+fwa/IMDg=;
 b=MGMy8VuMFTVZfkY2WXM+sul04/VRi/2AGfF6yO8Q6u3YbE8zMehoyaAbeEcnwCeHjY
 Z++28iJ4bRoPbEr8pfnsyDbM6TdleaOrBX8wJ1Dr4sjeOJq6yve6FXETra5b4V1+UCgr
 JyiI9wd6hXj2uaBzM5QfyByh45ZuybiKrz3jjHRSi+3UsMLGSu/C/ngSSRQNE3hVUj7J
 WrmDsbCyHaJyDPYhlOhLIDj1eKeZH7EJzftByxqUwtWIIb7l8COmgjZ6NaEp9s1vDcSZ
 eIj13FyerN7vSpE5yk+sUfeAFOEE0jBaw6cItvWCtLz1S5Z9Da5cMCm+d+d3xCR/VIme
 AX9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727707096; x=1728311896;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=H3mI5dB75SO68Jn6asF4H/I2WXinZvmksU+fwa/IMDg=;
 b=lHV5Oa9swJ4CQlc+O6AICg1Q8F9+PZoMGhJdSSxihwcxC3k0R5ltZYnlJtqGW382UQ
 JCWQT/Lb9XPpowgssDCpPahAOmWKDSgxHG5V3FkW1uzvslqxRdiuJ45n5JuuyaLLgLSM
 5rrh5Tb0OO1TEel4bTbmjHZFR6yA2dTtPK4obh9pK9q2Cn9+6gAmm7txp2Id5Xi9XnJu
 4shM+2dCDwABtZPd2jfZS0Tc9fg163ZVMWI7Zvxp7Bh2rscB8CMUJ6Y7Bbb9HYuRFZ1f
 M4t4k8sZB5fv/y2k/t5PaT5GvlWlwaAHW7WXp7IkgP2xhdaZmEV0hB6w9+UmE3CnYHd5
 Qjbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHxamcrC2eIBm2jZCV6WTgHm4lEOrTm9t/IIdiJwRxPGX+tOP4UGDtZgnGVZLfBLjJO8ZKEmrsQr8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCRBOPhFrquPKDcXFVmEEg+DZvn9Vz49AfSAZ4r8PANqfMTBIv
 zREbT7VDnsHrFHQ8KfUg67Nk+PIXNEXCRhHJAO1oXqEC5D9QUSN+WFUEOY6nbrc=
X-Google-Smtp-Source: AGHT+IEQejxm2lOjD94nZqskrcmlhUy/oMikZQ2iiyMaR7X17z5UywH9YLDg3WoiRnHVVWTlE/aKiA==
X-Received: by 2002:a5d:5b91:0:b0:374:c7cd:8818 with SMTP id
 ffacd0b85a97d-37ccdb576e8mr8822405f8f.22.1727707096496; 
 Mon, 30 Sep 2024 07:38:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:bdc6:abc9:5047:7828?
 ([2a01:e0a:982:cbb0:bdc6:abc9:5047:7828])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e969a48fasm152590745e9.0.2024.09.30.07.38.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Sep 2024 07:38:16 -0700 (PDT)
Message-ID: <f9b0cc53-00ae-4390-9ff9-1dac0c0804ba@linaro.org>
Date: Mon, 30 Sep 2024 16:38:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm: panel: jd9365da-h3: fix reset signal polarity
To: Hugo Villeneuve <hugo@hugovil.com>, Jagan Teki <jagan@edgeble.ai>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: Hugo Villeneuve <hvilleneuve@dimonoff.com>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240927135306.857617-1-hugo@hugovil.com>
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
In-Reply-To: <20240927135306.857617-1-hugo@hugovil.com>
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

Hi,

On 27/09/2024 15:53, Hugo Villeneuve wrote:
> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> 
> In jadard_prepare() a reset pulse is generated with the following
> statements (delays ommited for clarity):
> 
>      gpiod_set_value(jadard->reset, 1); --> Deassert reset
>      gpiod_set_value(jadard->reset, 0); --> Assert reset for 10ms
>      gpiod_set_value(jadard->reset, 1); --> Deassert reset
> 
> However, specifying second argument of "0" to gpiod_set_value() means to
> deassert the GPIO, and "1" means to assert it. If the reset signal is
> defined as GPIO_ACTIVE_LOW in the DTS, the above statements will
> incorrectly generate the reset pulse (inverted) and leave it asserted
> (LOW) at the end of jadard_prepare().

Did you check the polarity in DTS of _all_ users of this driver ?

Neil

> 
> Fix reset behavior by inverting gpiod_set_value() second argument
> in jadard_prepare(). Also modify second argument to devm_gpiod_get()
> in jadard_dsi_probe() to assert the reset when probing.
> 
> Do not modify it in jadard_unprepare() as it is already properly
> asserted with "1", which seems to be the intended behavior.
> 
> Fixes: 6b818c533dd8 ("drm: panel: Add Jadard JD9365DA-H3 DSI panel")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> ---
>   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> index 44897e5218a69..6fec99cf4d935 100644
> --- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> +++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> @@ -110,13 +110,13 @@ static int jadard_prepare(struct drm_panel *panel)
>   	if (jadard->desc->lp11_to_reset_delay_ms)
>   		msleep(jadard->desc->lp11_to_reset_delay_ms);
>   
> -	gpiod_set_value(jadard->reset, 1);
> +	gpiod_set_value(jadard->reset, 0);
>   	msleep(5);
>   
> -	gpiod_set_value(jadard->reset, 0);
> +	gpiod_set_value(jadard->reset, 1);
>   	msleep(10);
>   
> -	gpiod_set_value(jadard->reset, 1);
> +	gpiod_set_value(jadard->reset, 0);
>   	msleep(130);
>   
>   	ret = jadard->desc->init(jadard);
> @@ -1131,7 +1131,7 @@ static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
>   	dsi->format = desc->format;
>   	dsi->lanes = desc->lanes;
>   
> -	jadard->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +	jadard->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
>   	if (IS_ERR(jadard->reset)) {
>   		DRM_DEV_ERROR(&dsi->dev, "failed to get our reset GPIO\n");
>   		return PTR_ERR(jadard->reset);
> 
> base-commit: 18ba6034468e7949a9e2c2cf28e2e123b4fe7a50

