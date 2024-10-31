Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 991A49B77AC
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 10:37:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89E1B10E87A;
	Thu, 31 Oct 2024 09:37:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Tqh6Vot8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5256710E88F
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 09:37:26 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4315abed18aso5818715e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 02:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730367444; x=1730972244; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=0XjhUmqCnBnRo39qcs0u0GEZubpW2p+2DITMgRFbzBU=;
 b=Tqh6Vot8UlKih8nu65etqY4BJ9A+lTn8S93b2K4H0bD3IlsqTqKEGOiF2vjURDdUxf
 KvA9PXQUgdSKOpHJayxsgMPIcreXyQ40kjxW4u2XpQlltv32q4qVK3Ar6K9N66O5RQfU
 ijNEMt1dy5ZS/T9Nxk1c67YuXxdTir3OMOABNj8GqTCstVTiWiuNJ2CEl3p2nZzZKTzH
 nJa97WhMxo+i1UYPbqy+8Wzt7jo8vHnYiTvj+BBxTWm8vfQPajjub0ydzs4I32/6Rs7p
 oRImmI50+3xIVc3RsN3+vR7tMVeKuJhfSa/wzg4nIeqzaaZqU/S7DQl8Ee7gvyqJfWGI
 dRMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730367444; x=1730972244;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=0XjhUmqCnBnRo39qcs0u0GEZubpW2p+2DITMgRFbzBU=;
 b=YUxNh/pcUoEFygkRMkh2Xl5LwAWDZtxVxokkp8jaCZ/k/a+P5Mz87WltyIEz0IJc9w
 EYSyS4zKDDqe4ysbA/ktvt2XwogE51XMQldpniL4lw/0rlRBGPz+fjJ/ieLChYyYYaCs
 jbkP0vbN441e3tMEAXiw9/YxxvC7q0rEraWossXocJSK5q3JI+WQTLJZit0t8hHEdnNX
 V94xWU6ZUY3SP5pBs45sOY7HrIDqWy4uzagyRyVPiw27qPIJbQ8xlmyEJNP/+7Ln37tw
 zHteniw69ARK5GY0hotK2abG/m1sqwNTHsI8RxFB09hoXo7+qhZ+wKlr/rof2RfRPCZF
 ZXfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCDUZLUWKUKncSmeIRlsosubmbMskRMMhVekGWg2wTcHaUvq+h5uuXYUhLWRADwgd0VO8G/tjiUSw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpDkTNlhJCfdhKx9rG6/07F1qCDbqnxJ4ouuzLgvK9Z2v7TGs4
 tkIdDC202WSL+PrOxweaWoYd2PY5p1Ak8KaZ7zD3AM2YaeymBG78S86JOtHAl6c=
X-Google-Smtp-Source: AGHT+IGW3P5Ii3ONDVAWW2iSRzrDQCRbWEsJKc+XSxgXeHSBDOW2CkcwJYLN+FXMcj8PvJgQC0mo3A==
X-Received: by 2002:a05:600c:1e05:b0:431:5847:f63f with SMTP id
 5b1f17b1804b1-4319aca78f0mr163896065e9.13.1730367444576; 
 Thu, 31 Oct 2024 02:37:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:de28:ccc7:fdcf:6514?
 ([2a01:e0a:982:cbb0:de28:ccc7:fdcf:6514])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bd9a9fb9sm50411525e9.33.2024.10.31.02.37.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2024 02:37:24 -0700 (PDT)
Message-ID: <376ef9c9-3a4e-43e5-a0fc-ba05f5c0884d@linaro.org>
Date: Thu, 31 Oct 2024 10:37:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/2] drm/panel: himax-hx83102: Add a check to prevent NULL
 pointer dereference
To: Zhang Zekun <zhangzekun11@huawei.com>, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org
Cc: chenjun102@huawei.com
References: <20241025073408.27481-1-zhangzekun11@huawei.com>
 <20241025073408.27481-3-zhangzekun11@huawei.com>
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
In-Reply-To: <20241025073408.27481-3-zhangzekun11@huawei.com>
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

On 25/10/2024 09:34, Zhang Zekun wrote:
> drm_mode_duplicate() could return NULL due to lack of memory,
> which will then call NULL pointer dereference. Add a check to
> prevent it.
> 
> Fixes: 0ef94554dc40 ("drm/panel: himax-hx83102: Break out as separate driver")
> Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
> ---
>   drivers/gpu/drm/panel/panel-himax-hx83102.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-himax-hx83102.c b/drivers/gpu/drm/panel/panel-himax-hx83102.c
> index 8b48bba18131..3644a7544b93 100644
> --- a/drivers/gpu/drm/panel/panel-himax-hx83102.c
> +++ b/drivers/gpu/drm/panel/panel-himax-hx83102.c
> @@ -565,6 +565,8 @@ static int hx83102_get_modes(struct drm_panel *panel,
>   	struct drm_display_mode *mode;
>   
>   	mode = drm_mode_duplicate(connector->dev, m);
> +	if (!mode)
> +		return -ENOMEM;
>   
>   	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
>   	drm_mode_set_name(mode);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
