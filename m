Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C45977A48
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 09:49:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0527510ECA8;
	Fri, 13 Sep 2024 07:49:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="S+s7kVVZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED9410ECA8
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 07:49:32 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-374c6187b6eso1448695f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 00:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726213771; x=1726818571; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=glKjeKpPYkA+QefI4153Rdu4fvfcTn2N2QZ7KEVaEi4=;
 b=S+s7kVVZQXZ2742cA52+BjO69wKxq/wInwUBrwVYo7ldEt87EaIhnKWTv7gU60yQ6l
 8gq3SHVZ3hQ7q/Ox+wLd7+AidbQz9ui24X0UBCTeGjPRxVED73zrFbzBZbG7UoAYXE1x
 lw1Uyi8zRynlNpHUlDlIxhoFC5Fg+jl73DgWHGfLmy60YjSzkh9PNv6+QY5ufaWusVva
 2XaKiN1BTd8i1FYM+ONCS1Gz8hLLvENzHzeB60QLthUIc4IvQmMpXiqBEiK9OtCABcE6
 UipWRDWkbZcSEea2TC/2Oot1JLIKCE5uJ0JSyjFtmyFagSE8Xu0WAePhqPDUmLc1DbC+
 TMrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726213771; x=1726818571;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=glKjeKpPYkA+QefI4153Rdu4fvfcTn2N2QZ7KEVaEi4=;
 b=jdgUsvO40qkAlbj27KR6w+6MoAzIDA2mjENAMNp/ztOjE9hqhUZ2wWN7oMj3rrKvha
 8BOYIx+8DZF5Jv1fo5GIVdso4unMJbJp6AypXAZQIM1RHmTKVc/xPecuIUcuZtVx68vD
 vZKo8f8lTiplOIm6KRNqh4ngqWUA0pHOSFWKb9krGJ78heq0qkd4s2ckbkdH1jpZ+nDB
 YxKSIRZ6YCEBs3ZEOm761wonspMdczPk3a+tal62DMIIGRKlzhmuDLDEt0NH7RiNQlu4
 h/XTDd20xqSG+DFgTFuUISTXumdpJ8jyWS9ydqNYwLfO6R6UwjwLFY4CZTXFVH5kJf8g
 6iMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLxbQttIvFaNTWSQls3E59VwAf9rScPeAMO6+//LdD/cQ+HajMKb2jJw1pOhqJ3vNZ5nr+qKPtx+4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9QaNJ0NAI+w9inRP1tc6RcBAS2/yzvdx2/TTcrqeiQXSMGoK/
 ubihPizWKiTZZiz7q0ZLQ4QefBa/GKXKk9SZ8d179mdApTF0k3+ulIDyLTDM3Hw=
X-Google-Smtp-Source: AGHT+IFKcj0oztv++M60jxtRSVuFxPELsSK+Hxsi48OLJ8KO6IFj6U2HbWpyGwEVbdacM1MLp3NIfg==
X-Received: by 2002:a5d:6551:0:b0:374:c977:7453 with SMTP id
 ffacd0b85a97d-378c2d114bemr3212215f8f.25.1726213770538; 
 Fri, 13 Sep 2024 00:49:30 -0700 (PDT)
Received: from [192.168.7.202] ([212.114.21.58])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42d9b05da47sm14717215e9.17.2024.09.13.00.49.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Sep 2024 00:49:30 -0700 (PDT)
Message-ID: <b83d7023-5a0c-4fff-9c0c-c9f9d3eae75b@linaro.org>
Date: Fri, 13 Sep 2024 09:49:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 4/6] drm/bridge: samsung-dsim: Switch to RUNTIME_PM_OPS()
To: Fabio Estevam <festevam@gmail.com>, rfoss@kernel.org
Cc: victor.liu@nxp.com, dri-devel@lists.freedesktop.org,
 Fabio Estevam <festevam@denx.de>
References: <20240626230704.708234-1-festevam@gmail.com>
 <20240626230704.708234-4-festevam@gmail.com>
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
In-Reply-To: <20240626230704.708234-4-festevam@gmail.com>
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

On 27/06/2024 01:07, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Replace SET_RUNTIME_PM_OPS with its modern RUNTIME_PM_OPS() alternative.
> 
> The combined usage of pm_ptr() and RUNTIME_PM_OPS()
> allows the compiler to evaluate if the runtime suspend/resume() functions
> are used at build time or are simply dead code.
> 
> This allows removing the __maybe_unused notation from the runtime
> suspend/resume() functions.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>   drivers/gpu/drm/bridge/samsung-dsim.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index e7e53a9e42af..73ccf21ae446 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -2043,7 +2043,7 @@ void samsung_dsim_remove(struct platform_device *pdev)
>   }
>   EXPORT_SYMBOL_GPL(samsung_dsim_remove);
>   
> -static int __maybe_unused samsung_dsim_suspend(struct device *dev)
> +static int samsung_dsim_suspend(struct device *dev)
>   {
>   	struct samsung_dsim *dsi = dev_get_drvdata(dev);
>   	const struct samsung_dsim_driver_data *driver_data = dsi->driver_data;
> @@ -2073,7 +2073,7 @@ static int __maybe_unused samsung_dsim_suspend(struct device *dev)
>   	return 0;
>   }
>   
> -static int __maybe_unused samsung_dsim_resume(struct device *dev)
> +static int samsung_dsim_resume(struct device *dev)
>   {
>   	struct samsung_dsim *dsi = dev_get_drvdata(dev);
>   	const struct samsung_dsim_driver_data *driver_data = dsi->driver_data;
> @@ -2108,7 +2108,7 @@ static int __maybe_unused samsung_dsim_resume(struct device *dev)
>   }
>   
>   const struct dev_pm_ops samsung_dsim_pm_ops = {
> -	SET_RUNTIME_PM_OPS(samsung_dsim_suspend, samsung_dsim_resume, NULL)
> +	RUNTIME_PM_OPS(samsung_dsim_suspend, samsung_dsim_resume, NULL)
>   	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>   				pm_runtime_force_resume)
>   };
> @@ -2142,7 +2142,7 @@ static struct platform_driver samsung_dsim_driver = {
>   	.remove_new = samsung_dsim_remove,
>   	.driver = {
>   		   .name = "samsung-dsim",
> -		   .pm = &samsung_dsim_pm_ops,
> +		   .pm = pm_ptr(&samsung_dsim_pm_ops),
>   		   .of_match_table = samsung_dsim_of_match,
>   	},
>   };

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
