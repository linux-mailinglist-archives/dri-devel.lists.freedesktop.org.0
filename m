Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D529A60BE
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 11:55:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 229E710E46D;
	Mon, 21 Oct 2024 09:55:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RtQ35A3b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D02D410E2D3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 09:54:58 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43152b79d25so40931325e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 02:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729504497; x=1730109297; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=sAPgS81fU8WqlF/LuQRpx0NWQV7ciXlZDMNUwqEFwws=;
 b=RtQ35A3bF1TjXtfe58bZIQWYfAlFn/mpyZnzwyrBv/0zAE1qi7lNFNPWH0UHjC6TMO
 kk5YpwlQqNU2zkrx72yuRavKfO55ZOp8x1Lj7vgDcVpThDkv7i7ypVHMjfvfI4AY8mUb
 Esdkr17edhu82SpLLovSW/j+1DBwHrWOOqACD0BpY+kHdM8jzb0vhJRt+yXnV3hhwRND
 cWcZoOsoPP8It6fXue/Lq3VQ7zeTcQr1435aeBfEZ4Obe6WlhbFb/JWoiXkT8xq6IUAy
 Q6YiiinxcbvY0qB3hdYlGTZCzQy56kgOUo3YE386WGegpdrAjg8kAQCIjO4Ors7ONSTS
 sGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729504497; x=1730109297;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=sAPgS81fU8WqlF/LuQRpx0NWQV7ciXlZDMNUwqEFwws=;
 b=fOnk081W9EolXD0mKqtw3fVttgGP95uone4DE9pchkXEc7/6rOb1gIiZV4tszlWL2l
 my7FnMYon2D9M1qb39q60zfHKmbuu1qxW/B+rvuUmak8FKyKI3MdWlZkRQPvtG0g2CCP
 hiG5tDiazdBlouxg+HYuzICxwOmkyFtjJMFaEDUEDsVbIQ1/vLsIP3HFRmYlFoYDBsrH
 t3MTyirKEskMg7PDEECC0rcxn3QVT9p5e0K9wXM8pCew2JULAS2JfJu+Kz1UKJ6N3ZD/
 BqH9BO2kRl3lhfYTAgL8HnWeLrHKg6jVJRcamBe8yoAwN8UhgDQvgJaYeY/7hl+2B5kl
 WO7Q==
X-Gm-Message-State: AOJu0YwdZ0tZYjiJaFGjENjjGrKNtywRe2fuYTCEvmXSrEa5p7FrkVoK
 RHE0UntCtBvwgUSiUfet9OkrPzLBR4QgBzW3jg99ifpovybGjNbmdQgXaNOHhrQ=
X-Google-Smtp-Source: AGHT+IELxYkWLSigx/VF6jV9gkVikRzLwmcqDdsuj1mv4meEXk5esFNW/w5twSNROrhMuWotuOZ7TA==
X-Received: by 2002:a05:600c:35cd:b0:431:5d4c:5eff with SMTP id
 5b1f17b1804b1-43161636f5cmr76546685e9.2.1729504497213; 
 Mon, 21 Oct 2024 02:54:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:3908:dea6:2ddd:be97?
 ([2a01:e0a:982:cbb0:3908:dea6:2ddd:be97])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4316f57112esm52517435e9.6.2024.10.21.02.54.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Oct 2024 02:54:56 -0700 (PDT)
Message-ID: <7d2c6c91-9218-4e13-81dd-d1f3ffa4801e@linaro.org>
Date: Mon, 21 Oct 2024 11:54:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 4/6] drm/bridge: aux: allow interlaced and YCbCr 420 output
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20241019-bridge-yuv420-v1-0-d74efac9e4e6@linaro.org>
 <20241019-bridge-yuv420-v1-4-d74efac9e4e6@linaro.org>
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
In-Reply-To: <20241019-bridge-yuv420-v1-4-d74efac9e4e6@linaro.org>
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

On 18/10/2024 23:49, Dmitry Baryshkov wrote:
> As both aux bridges are merely passthrough bridges, mark them as
> supporting interlaced and YCbCr 420 data. Other bridges in the chain
> still might limit interlaced and YCbCr 420 data support on the
> corresponding connector.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/bridge/aux-bridge.c     | 4 ++++
>   drivers/gpu/drm/bridge/aux-hpd-bridge.c | 4 ++++
>   2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/aux-bridge.c b/drivers/gpu/drm/bridge/aux-bridge.c
> index b29980f95379..e3e95ccec1ae 100644
> --- a/drivers/gpu/drm/bridge/aux-bridge.c
> +++ b/drivers/gpu/drm/bridge/aux-bridge.c
> @@ -120,6 +120,10 @@ static int drm_aux_bridge_probe(struct auxiliary_device *auxdev,
>   	data->bridge.funcs = &drm_aux_bridge_funcs;
>   	data->bridge.of_node = data->dev->of_node;
>   
> +	/* passthrough data, allow everything */
> +	data->bridge.interlace_allowed = true;
> +	data->bridge.ycbcr_420_allowed = true;
> +
>   	return devm_drm_bridge_add(data->dev, &data->bridge);
>   }
>   
> diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
> index 6886db2d9e00..48f297c78ee6 100644
> --- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
> +++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
> @@ -180,6 +180,10 @@ static int drm_aux_hpd_bridge_probe(struct auxiliary_device *auxdev,
>   	data->bridge.ops = DRM_BRIDGE_OP_HPD;
>   	data->bridge.type = id->driver_data;
>   
> +	/* passthrough data, allow everything */
> +	data->bridge.interlace_allowed = true;
> +	data->bridge.ycbcr_420_allowed = true;
> +
>   	auxiliary_set_drvdata(auxdev, data);
>   
>   	return devm_drm_bridge_add(data->dev, &data->bridge);
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
