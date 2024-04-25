Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CCA8B25DD
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 18:01:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA5E611A5A7;
	Thu, 25 Apr 2024 16:01:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cZs+W7Nv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06D8C11A5A5
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 16:00:58 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-34b1e35155aso1315020f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 09:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714060857; x=1714665657; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=u6Neky7t0BvIw+GAPumIRo6iZtSUrkY2VArNrVlw8a8=;
 b=cZs+W7Nv26QUVdvVhfzLx+Kcr9e2BAYBCbiRSfOIG3CQjRRgjonkR4s74/RdwlK7c9
 9noDpXVNFDwQcV+kfPVICpOD0yMdCr7qxBbP+ufhWEzf1Z7AqU73yzRWRxRp4bkQmXqA
 Ngbpb6pnjykY8LeptRbeT/ADJXdoaH4rX0qg2kMPpMjdRSwe/+kgHFyt0/ktJABrV5th
 BC/g9CjIsIll6BiS/Mn0wQ65bHvndthkTUEtKcoKMr3MfhrG6utzXL1RmljYY9iMxLi1
 bFKLjkv5AiwlD48X5Ja10IxgsLNcaC1I1QP4clAqYBg74TAzZ8xk6bvrL5cGw/JbjTVn
 3uCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714060857; x=1714665657;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=u6Neky7t0BvIw+GAPumIRo6iZtSUrkY2VArNrVlw8a8=;
 b=Y+iLFeBpSKZLiuaHFNR5TD8YK+go1Sqsc60hY5pLAtDM0pOy7Sb76E1fl2oSt/f8ce
 eysTGqyfeFFlutQnCZR/+QB4PrUDkO1GYKr+7PMnIFOetKZC4ZUwYIq6MtB1EgISnvbB
 Z68BxFHA6NNj+zrGeEyuN11yHCnMCcKjV8+f+q8Sy7Azx9FTXy2U11+6FgWTlpx0ohb+
 kMlfdLFMdMJu3gOd2XxupBomrCf84BH8lMlCJ/Q/Y+mxHMbcQ9YeMcrfU0rQcARMoTyZ
 NEIUWwAGw7+K+6ib66yogDlmhMjhux1VhtbLB09mMlZ8WjuQJJW9FO7NO50DbH+KWzBZ
 2csg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGZiRRlcnweAcEhw8PlEOEm2Y/s5Ag7+MxrL8T7bLdASUUr1UaziLEiZryuLxEinGPK4I2MeGJjk+M2WQKSoCiun06u0xH09Prgd7d6R9m
X-Gm-Message-State: AOJu0YybyigcrEnKvypsQ7Va94IpIBcE8zWhcG+ohJrogjuu/oi4siJs
 fHfd9HxT2Ivp1bg1Oy2FpCi+LOS5mgw9520FahA6NKckw6x+pinyLfhZmY8h3WI=
X-Google-Smtp-Source: AGHT+IE9fVCCuEgVpNEE4pSSim5AaGzpLIdcLo7sJYC9xgdsbHFWPKB8Ek86XQoABul+Os7HULPq/w==
X-Received: by 2002:adf:ce87:0:b0:34a:e798:29fc with SMTP id
 r7-20020adfce87000000b0034ae79829fcmr5793315wrn.52.1714060856843; 
 Thu, 25 Apr 2024 09:00:56 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:15c7:bd9c:c500:ed62?
 ([2a01:e0a:982:cbb0:15c7:bd9c:c500:ed62])
 by smtp.gmail.com with ESMTPSA id
 v4-20020adfa1c4000000b0034c32e9e2fdsm624252wrv.13.2024.04.25.09.00.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Apr 2024 09:00:56 -0700 (PDT)
Message-ID: <d435b6f6-2c67-4ec3-b346-08c6dd02ee38@linaro.org>
Date: Thu, 25 Apr 2024 18:00:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v1 3/3] drm/panel: ili9341: Use predefined error codes
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg
 <sam@ravnborg.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20240425142706.2440113-1-andriy.shevchenko@linux.intel.com>
 <20240425142706.2440113-4-andriy.shevchenko@linux.intel.com>
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
In-Reply-To: <20240425142706.2440113-4-andriy.shevchenko@linux.intel.com>
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

On 25/04/2024 16:26, Andy Shevchenko wrote:
> In one case the -1 is returned which is quite confusing code for
> the wrong device ID, in another the ret is returning instead of
> plain 0 that also confusing as readed may ask the possible meaning
> of positive codes, which are never the case there. Convert both
> to use explicit predefined error codes to make it clear what's going
> on there.
> 
> Fixes: 5a04227326b0 ("drm/panel: Add ilitek ili9341 panel driver")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/gpu/drm/panel/panel-ilitek-ili9341.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> index 24c74c56e564..b933380b7eb7 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> @@ -422,7 +422,7 @@ static int ili9341_dpi_prepare(struct drm_panel *panel)
>   
>   	ili9341_dpi_init(ili);
>   
> -	return ret;
> +	return 0;
>   }
>   
>   static int ili9341_dpi_enable(struct drm_panel *panel)
> @@ -726,7 +726,7 @@ static int ili9341_probe(struct spi_device *spi)
>   	else if (!strcmp(id->name, "yx240qv29"))
>   		return ili9341_dbi_probe(spi, dc, reset);
>   
> -	return -1;
> +	return -ENODEV;
>   }
>   
>   static void ili9341_remove(struct spi_device *spi)

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
