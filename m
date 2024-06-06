Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA038FE0E5
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 10:26:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D9010E03D;
	Thu,  6 Jun 2024 08:26:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QQgodmtk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C2610E03D
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 08:26:02 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-42148c0cb1aso8378345e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2024 01:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717662360; x=1718267160; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=bIK7ZRurCp3VUMKrCmmBFEo7JzuHyJlxiXupFh9itNg=;
 b=QQgodmtknd8Ml5tUwy5K2sEkmTcayh5Pub0AlMsJ5EWiHlz9RVKxT67YLohhFuMbCa
 /DtO9Z3bKVeJ7V0vgFNtkaONAlri4vDDGTvMv2DxjqHuiymAE12Q259c4PfQBUxvGv7F
 bfTNrOASpBGYwyRvvDemfAy+J3V4T7AiwDqF9vez5yJ0O9Mi4KHRCF8lvLIrRM+tO9Em
 v2Gmf++R0omCn8Pd0l2sNzpB33Fz6inRw8jrBDXdxZ5gcL/iQdFlx5METk2D4gY0SZNh
 DL24ldJIPfo/UiHejVPnGnDczDnl1vvcYgXlPCrSqKysmXP6JbpduQQi5c9zWN45jBTT
 xK1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717662360; x=1718267160;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=bIK7ZRurCp3VUMKrCmmBFEo7JzuHyJlxiXupFh9itNg=;
 b=JtMCa/PWGw+NhTHvITh6iTvFXR2Le6UTTc0dNvwRA35jphr/C/x3qRopNSHjMxF2/d
 9vURaPQkOMmr5HribGT6/Q6KfIrZFxMDknj8kSs+XLt0JdZkK6/CgfjxJA3woiccsDrp
 lpaYUF4Mql6ZgUxoh7WreSI7puIYoh2o1wfjODuNw6svdak0LlD7951+21yIIst5mZqB
 kpMgM3jL4cjS53fzk0nkDib4rUahqnj9g+ygsa/QVB1NOX+xUM3tAJRxsPTxWg6+dQ1O
 EdwNASIef1DRkCB5z968BOfvULXYiKNJrL9i/LpJKNVoKwOAMUtZSdrNo9S5yULqLoaS
 DcoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqu2T00ZwfBEfniasE34fFG1cV0Ybkea1b3/p7ciWNpMBIPsMzr4PQr6pPY2rRrwJTtU6jJjSKY9VFKyQIEaCTyH12sYy5HGx0yIu0mbAJ
X-Gm-Message-State: AOJu0YzBdarlx9VX5hUebWr3HYK5eJLBwpWuKdgK9E6jJxVV7Px60l3Y
 V2Ktxrezr2wx13IY//qm2UtFgfutnl80eoE9tMFs3PPNrq6DfvllvQtQ4Wjjx88=
X-Google-Smtp-Source: AGHT+IGD8CDRoGr7gLwFeA2KRHdkZI2ybG//UzckD4ZVgnplhUKkVBRsXPMX3dKrY8nsGsU9Tl8Vag==
X-Received: by 2002:a05:600c:4592:b0:41f:e10f:889a with SMTP id
 5b1f17b1804b1-421562c6d2amr42212735e9.7.1717662360385; 
 Thu, 06 Jun 2024 01:26:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:22fd:4ae6:287f:17f2?
 ([2a01:e0a:982:cbb0:22fd:4ae6:287f:17f2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4215814f64fsm47751845e9.47.2024.06.06.01.25.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jun 2024 01:25:59 -0700 (PDT)
Message-ID: <52d8af51-1af1-400e-9793-2337bd1ff4ea@linaro.org>
Date: Thu, 6 Jun 2024 10:25:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2] [drm/meson] meson_plane: Add error handling
 v2(re-aligned)
To: Haoran Liu <liuhaoran14@163.com>, maarten.lankhorst@linux.intel.com
Cc: mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20231129113405.33057-1-liuhaoran14@163.com>
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
In-Reply-To: <20231129113405.33057-1-liuhaoran14@163.com>
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

On 29/11/2023 12:34, Haoran Liu wrote:
> This patch adds robust error handling to the meson_plane_create
> function in drivers/gpu/drm/meson/meson_plane.c. The function
> previously lacked proper handling for potential failure scenarios
> of the drm_universal_plane_init call.
> 
> Signed-off-by: Haoran Liu <liuhaoran14@163.com>
> ---
>   drivers/gpu/drm/meson/meson_plane.c | 17 +++++++++++------
>   1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
> index 815dfe30492b..b43ac61201f3 100644
> --- a/drivers/gpu/drm/meson/meson_plane.c
> +++ b/drivers/gpu/drm/meson/meson_plane.c
> @@ -534,6 +534,7 @@ int meson_plane_create(struct meson_drm *priv)
>   	struct meson_plane *meson_plane;
>   	struct drm_plane *plane;
>   	const uint64_t *format_modifiers = format_modifiers_default;
> +	int ret;
>   
>   	meson_plane = devm_kzalloc(priv->drm->dev, sizeof(*meson_plane),
>   				   GFP_KERNEL);
> @@ -548,12 +549,16 @@ int meson_plane_create(struct meson_drm *priv)
>   	else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A))
>   		format_modifiers = format_modifiers_afbc_g12a;
>   
> -	drm_universal_plane_init(priv->drm, plane, 0xFF,
> -				 &meson_plane_funcs,
> -				 supported_drm_formats,
> -				 ARRAY_SIZE(supported_drm_formats),
> -				 format_modifiers,
> -				 DRM_PLANE_TYPE_PRIMARY, "meson_primary_plane");
> +	ret = drm_universal_plane_init(priv->drm, plane, 0xFF,
> +					&meson_plane_funcs,
> +					supported_drm_formats,
> +					ARRAY_SIZE(supported_drm_formats),
> +					format_modifiers,
> +					DRM_PLANE_TYPE_PRIMARY, "meson_primary_plane");
> +	if (ret) {
> +		devm_kfree(priv->drm->dev, meson_plane);
> +		return ret;
> +	}
>   
>   	drm_plane_helper_add(plane, &meson_plane_helper_funcs);
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
