Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8D392A2F6
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 14:39:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A29E10E325;
	Mon,  8 Jul 2024 12:39:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qf57uFW9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D6E10E325
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 12:39:30 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2ee9505cd37so30078711fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2024 05:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720442368; x=1721047168; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=W7DP3B5JCp9g16byzw5sfW+lU3wXnm8lYUI0ZjUS3To=;
 b=qf57uFW9MFSZmOPF2qx2/iQIkmQRlx+9wFaREGJuYs+dwa85BxMlEIy6nxQaMo1r5a
 3MWHLjmTpKkYJFoRxADKgV8/7VgpgSU1DLBrO+Dgt21eNf3DAN6PrZfrrzzHTIavNBqQ
 C1DIQYzDqqeNqPEf8RpF+yKVv6MXmWdOpcoRjY1Ndkry9EQ0NQdNFeJnDaauvjBifVMe
 rIjhU3OYmoZaIXNAVyq2Mk6U4FhawyYyF0huYcx/kmIv4Hld2IgU0MsjRe1xeJxvfGwM
 N/mMI28wBZYc02JRvRDahk4/1Ov6djjt+Vgi9BSDwYmVvhbAUABMVCaZX/zQVfsmfvgr
 NHaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720442368; x=1721047168;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=W7DP3B5JCp9g16byzw5sfW+lU3wXnm8lYUI0ZjUS3To=;
 b=Vc/F6dd5DRqOxHqGF0ty+C5QA+UgUD/TwAkjQppf/nAuSddVW0cnCfvYuD3CsIVprr
 2Yqk7sBP6jKvTGFwAJhkUJ6Ny4P857ScaZeDS9AHBDrvWFeRsDrpiGgTZULHmd0LuRRU
 ZoyIy5rVA5yrsfcU52g1WGIrjrE1MPNq7A4rmUFesyE+qdd2jMFM16daAxwVWkSFSZvG
 wk/lL3UG5e3mfMwVfiNEEUUHi6bZtJqFlbaUDHTZVDHOvS07xqxwF4kxp2O81oEQ2CYO
 MEu93ejBuzZJn8z+LyKmkBc5T6msUVBkRCtl8brmtCDpln/0Q/VPZZquVyycwq5wDa86
 IJdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBDv0FPHATtnuosQg1wCAgdR8/d17dRXfnVFhKTjhn31MP/ba1R2KzHI4geTG2RuW9IaCXy/wz1eyo4OwVRE0NTruElRN3j9bNpFDbQFDg
X-Gm-Message-State: AOJu0YzYqxGhyomwtTbsq/h2Op9PFfOAboD8vm7SFT7gYWEYcKotgwEO
 tbiPWVzggJJegQ9C6hgHBeQemETlLZWwtLXjcgwvfKtM/BwmO8wKUIvVyuFmiF4=
X-Google-Smtp-Source: AGHT+IEdrW9FoC/1zN+vWWOe7JF/qxC3DrqGqoBp1+DhNKzcWT6wtDi055Adp5bcaUJWtZI9liT4dw==
X-Received: by 2002:a05:651c:30b:b0:2ec:165a:2254 with SMTP id
 38308e7fff4ca-2ee8edd7859mr75969161fa.44.1720442368231; 
 Mon, 08 Jul 2024 05:39:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:f482:8fc6:e8d0:6d7c?
 ([2a01:e0a:cad:2140:f482:8fc6:e8d0:6d7c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a1d6d22sm163122115e9.20.2024.07.08.05.39.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jul 2024 05:39:27 -0700 (PDT)
Message-ID: <41d3bf66-620d-4a6a-9cd2-0358fffae2ca@linaro.org>
Date: Mon, 8 Jul 2024 14:39:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 2/3] drm/panel: himax-hx8394: switch to
 devm_gpiod_get_optional() for reset_gpio
To: Manikandan Muralidharan <manikandan.m@microchip.com>, megi@xff.cz,
 javierm@redhat.com, quic_jesszhan@quicinc.com, sam@ravnborg.org,
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240701085837.50855-1-manikandan.m@microchip.com>
 <20240701085837.50855-3-manikandan.m@microchip.com>
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
In-Reply-To: <20240701085837.50855-3-manikandan.m@microchip.com>
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

On 01/07/2024 10:58, Manikandan Muralidharan wrote:
> Switch the driver to use devm_gpiod_get_optional() on reset_gpio to avoid
> driver probe issues when reset line is not specified.
> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
>   drivers/gpu/drm/panel/panel-himax-hx8394.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-himax-hx8394.c b/drivers/gpu/drm/panel/panel-himax-hx8394.c
> index ff0dc08b9829..d0e44f1f85d9 100644
> --- a/drivers/gpu/drm/panel/panel-himax-hx8394.c
> +++ b/drivers/gpu/drm/panel/panel-himax-hx8394.c
> @@ -487,7 +487,7 @@ static int hx8394_probe(struct mipi_dsi_device *dsi)
>   	if (!ctx)
>   		return -ENOMEM;
>   
> -	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	ctx->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
>   	if (IS_ERR(ctx->reset_gpio))
>   		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
>   				     "Failed to get reset gpio\n");

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
