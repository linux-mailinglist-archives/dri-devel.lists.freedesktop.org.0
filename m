Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C936CC1E19
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 10:57:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F96D10E0FE;
	Tue, 16 Dec 2025 09:57:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FkJKGGrP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B50010E0FE
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 09:57:06 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4779a637712so29348075e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 01:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765879025; x=1766483825; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=NFYaFpKlCe3rxlgalcml8hPx/Y+kjDAMwf63+7Oo6zY=;
 b=FkJKGGrPB+dO9CyjKW0BBUw5kJMIIVCslqh+A87sveD9x0p1f0NPqNd0D+mHt3/A8T
 YHPQBmTDcd9WPu6ntIxzLHjBj93Nt3Csu2xnbiDb9kL+MO+/Kl4QqhQNYKOBhhhMttRq
 jYmZFgnlydMGhcXuZabMWtZ3JEfWTZwundAL8zINAhhDRXvhwjS4FZ1nKh4IAKVdtUL9
 VNQ+gpsAAtexAaMjOter2PBsMyrWMOZupIXodheTDX+6Y3N6+UtG0nUhJb6HsivYM00y
 DhhCZpE9BXl4lPdSYQeyiZHPsKv7LomC4oG1nZlVd+U+16nz25qgJzsDqLs65JcNFlE7
 cnQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765879025; x=1766483825;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NFYaFpKlCe3rxlgalcml8hPx/Y+kjDAMwf63+7Oo6zY=;
 b=kgLS3S07n5mkb3Aeaipd819CmjZlhGLN00a9YBjMgrplz0FM772hfsr/UQ7Ihu6aVB
 kZN+6h34U3wLBQ+y+OVD1ocTXJ397vRoZH4AzgkAw1vd96WmRQf+eQJrxnYzt+C/Ch0K
 m8YF/4EhzvGVO543zXTG5xZAdsxUzMeDqm5TOEEEZwuWPuNUdZhohsaD90UNyrWJMDiS
 VaCiAcDC1A5QvJMbO7QTVh3hY0SVflCr8mLfwc/ZZWnZ3xuH9x7lTft4rGfkPA2Jl0n5
 /9VJ9zH/USEU5KxlUXLqQKK4RbzgR6WJyVrVVCQgDJWmNF4yjzy5hfu7Sjco69Y3eH2m
 r0Hw==
X-Gm-Message-State: AOJu0YwTiHNZMCCzyguq8MjxWt/nhI8yBwLXK71FR2th03KczGMBXlRT
 tXJlNJo/RARg0yHPFwn8imTxVuRwvHk6EqcM3+PhjnyS9IG1ihK7temxugq9if+de44=
X-Gm-Gg: AY/fxX5aF72yqgysWd9U2jpCTwqIsEQ6wCjZshpuhtsEJC3CEcwyVuEnrE+6n4cjzKU
 ci94yKePKL8FgwkyWq4x70x/hoA4RQt718dX2fUvNCcsQhTxI6Rbu4mlWKtV4lyHw+A5EEnUuoy
 3koovo4U7tS7XnY1GIwWbaLizR7DJr58XGKw6wXcbWp8vYQuxK8qS1uI1ELz9bSlexpZ+7pcqjV
 x9ipghZC7cip17x9MBoEsK29gzTLGECDxvTPFf1zzt8/9Q90uD4ek3IquUx0sXVHyZbqRpjsuFp
 /R8ofnv4EbIgn7B0PWDc+UVt/1xrP3tvuhdlx5k8SaQtrpMDknqP+fzNR+5t+yowJ+YLUhFbcMW
 4xIhP9VESyCDUjI6klXjNB2ve8lVIgoh2emP5vKgz3yRDnjPmRSQf2hNSLBKUihXSnrb9ufen3s
 V7BcXvSkGDasyDkm6Q3/1F+yFx+TlIF0v2aBGflVuI4x8vZQsrgkVALic7rlqQ9yw=
X-Google-Smtp-Source: AGHT+IHp/4B919bF0goX8Ptb8Fx0rtJVasiby8l518/I3xdaS9lsIP+maX/ZU6zxMKZ0IGUTBQUjIw==
X-Received: by 2002:a05:600c:3104:b0:477:af07:dd17 with SMTP id
 5b1f17b1804b1-47a8f90634fmr135837985e9.24.1765879024755; 
 Tue, 16 Dec 2025 01:57:04 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:2913:9c11:b7b9:c6d2?
 ([2a01:e0a:3d9:2080:2913:9c11:b7b9:c6d2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-430f9339d86sm15060676f8f.29.2025.12.16.01.57.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Dec 2025 01:57:03 -0800 (PST)
Message-ID: <68b5d663-de9e-4232-9dfb-6773ad552c36@linaro.org>
Date: Tue, 16 Dec 2025 10:57:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH RESEND 2/2] drm/panel: simple: Add HannStar HSD156JUW2
To: Renjun Wang <renjunw0@foxmail.com>, jessica.zhang@oss.qualcomm.com,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, thierry.reding@gmail.com,
 sam@ravnborg.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <tencent_D449AE627267BDD68BA41AD80EB3DFB5D407@qq.com>
 <tencent_FE5819B397B5ECC989623C67A7D68D246907@qq.com>
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
In-Reply-To: <tencent_FE5819B397B5ECC989623C67A7D68D246907@qq.com>
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/1/25 15:22, Renjun Wang wrote:
> Add Hannstar HSD156JUW2 15.6" FHD (1920x1080) TFT LCD panel support.
> 
> Signed-off-by: Renjun Wang <renjunw0@foxmail.com>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 0019de93be1b..057ae6735806 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2509,6 +2509,31 @@ static const struct panel_desc hannstar_hsd101pww2 = {
>   	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>   };
>   
> +static const struct display_timing hannstar_hsd156juw2_timing = {
> +	.pixelclock = { 66000000, 72800000, 80500000 },
> +	.hactive = { 1920, 1920, 1920 },
> +	.hfront_porch = { 20, 30, 30 },
> +	.hback_porch = { 20, 30, 30 },
> +	.hsync_len = { 50, 60, 90 },
> +	.vactive = { 1080, 1080, 1080 },
> +	.vfront_porch = { 1, 2, 4 },
> +	.vback_porch = { 1, 2, 4 },
> +	.vsync_len = { 3, 40, 80 },
> +	.flags = DISPLAY_FLAGS_DE_HIGH,
> +};
> +
> +static const struct panel_desc hannstar_hsd156juw2 = {
> +	.timings = &hannstar_hsd156juw2_timing,
> +	.num_timings = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 344,
> +		.height = 194,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> +};
> +
>   static const struct drm_display_mode hitachi_tx23d38vm0caa_mode = {
>   	.clock = 33333,
>   	.hdisplay = 800,
> @@ -5166,6 +5191,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "hannstar,hsd101pww2",
>   		.data = &hannstar_hsd101pww2,
> +	}, {
> +		.compatible = "hannstar,hsd156juw2",
> +		.data = &hannstar_hsd156juw2,
>   	}, {
>   		.compatible = "hit,tx23d38vm0caa",
>   		.data = &hitachi_tx23d38vm0caa

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
