Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E185B1A59A
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 17:15:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8883110E376;
	Mon,  4 Aug 2025 15:15:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="maPXmhEN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A3510E376
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 15:15:44 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4589968e001so29685235e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Aug 2025 08:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754320543; x=1754925343; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=CMYiRXMoedjydkMWi7aq5mntKyVVNxUPoNVSwHHbIuI=;
 b=maPXmhENhMLF2z+MYigGmfwEng8Enc5vVvM5R0N+8Df2sbh9XzVGDpkjAJLPwvCAjM
 ve3LD5+CXTakP1ENWxs1WkpiLbhL9Ci4K1gUtdosYMhMk33nsrSyv3YxL6oUYN8L2+50
 Xl41+MXzmr90phip7qQMHDI44BF9jIRJ0u5dzKIYWk+psGVejgr8dQzWvQDrkP5y37pU
 79Gfg17QYQhGqu3LbVXGUCHpc/of7PrV4or7nOEHSz44U2Gs5S06uTa3+yXukdmACIdc
 QojOL4pCXWAhySHpwa+1YWl4zdznhyU8brNMUddpA049suPQJZ8z2q5XgHej2NLSdMqc
 EdeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754320543; x=1754925343;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=CMYiRXMoedjydkMWi7aq5mntKyVVNxUPoNVSwHHbIuI=;
 b=mKJCEzXQVf1Eg2mZQIk/8Tx3N4UW8o7KVBqZq4zJkOykqSX8nL7mxNgbqVjauL1Rq2
 PfzEneWn4//wVK5gTfOMGmeygp9ojS39aqRfS3kTb9Y0dlZh++S+MsQzybJMI0bzXiTm
 Ke1mIH9ZecK8zfJfjOijAP6vY0y3P7K0w77DuAtSj5kkh/VwmeGwwih4yyLK0sNl+Xw7
 kYw6jemlBXv4qmdXz/JeFRXIedzhzUWzOd5U/Wx5LST0WdLAL+IioxDk3rvv523r9Q1s
 Zw4Bg2cIKITW3dNvc7OqrddBvZHrFk8DapX5rAON+WZmnIsJPSMxe+YdRPtTLBETuh1j
 HqhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbUodv2GiavCX9V2mEs3v7cMK+51DtQQZamplsc8uXLRtwb60cKfQR3CG9wfP/OafaYSZoTFLQWRI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZ3s8LPma4tEOk/B1X1QJa7goT3MQY+mfvJjVwbDNkvzzs+PbW
 pPkX8A0H57PLByvXNr6oCgF3hIltWDyMaIXU7OTxIOvBK6aJCh89MfibpCI55Cn+xug=
X-Gm-Gg: ASbGnctkXHAwUA2wwLaP+0KD0HS8zzKHJYTQkVkQvg5IlRTSTB4Y+PUXik5f4WjRtCo
 5/gI8FR7bLTUzhYn3GEvezxN+F9r6dFQswXXIdHRkf1TDUECXP83xaD88QGpm3nyJPJbMBgIKvn
 fBsFqSzGlgyqnaj/HXcwXeuj2wFfMQ/RTW9f9eBMm4QOcKvt5Hx3t7Z50RerS20uxXoHoTfK869
 tfVOCHnhkDkjCmrv0I8TYGV94wbe/XHC+A8a/MdrcQ2H2Re6cJ/z9ISgs8AEfFHy42MQLD+WQG7
 nto8I58RNX1Cbj5PNNuuPPx6sPIeMz8AgsL2EX29a+lxK7iic8V/VyQgY+jbZiFvLGdv6D7qWqd
 JPuYuBlWV7WEHLq8LWDV3BqfNtIL56lptstfK6LRtUn9V5eImG7f67msIhgTJAoxNjpmR3JcpLb
 GZ/W/w9zL7xhuhYElqbW3Y
X-Google-Smtp-Source: AGHT+IEr6cmOOwDSjxgdpQtx4m7PijiOu0vwQxDdoA1/nkq5lSHu7HpzwGQERaUKnohUCx/+2yzIag==
X-Received: by 2002:a05:600c:4f08:b0:459:dfa8:b854 with SMTP id
 5b1f17b1804b1-459dfa8bb6dmr14866075e9.5.1754320542960; 
 Mon, 04 Aug 2025 08:15:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:3030:f63e:fedd:700f?
 ([2a01:e0a:3d9:2080:3030:f63e:fedd:700f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4589edf5638sm171780825e9.4.2025.08.04.08.15.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 08:15:42 -0700 (PDT)
Message-ID: <16537c3f-824a-4268-a51e-5efc88a671bf@linaro.org>
Date: Mon, 4 Aug 2025 17:15:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 02/13] drm/panel: ilitek-ili9881c: move display_on/_off
 dcs calls to (un-)prepare
To: Heiko Stuebner <heiko@sntech.de>
Cc: quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, hjc@rock-chips.com,
 andy.yan@rock-chips.com, andyshrk@163.com, nicolas.frattaroli@collabora.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20250707164906.1445288-1-heiko@sntech.de>
 <20250707164906.1445288-3-heiko@sntech.de>
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
In-Reply-To: <20250707164906.1445288-3-heiko@sntech.de>
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

On 07/07/2025 18:48, Heiko Stuebner wrote:
> At least for panel-bridges, the atomic_enable call is defined as being
> called right after the preceding element in the display pipe is enabled.
> 
> It is also stated that "The bridge can assume that the display pipe (i.e.
> clocks and timing signals) feeding it is running when this callback is
> called"
> 
> This means the DSI controller driving this display would have already
> switched over to video-mode from command mode and thus dcs functions
> should not be called anymore at this point.
> 
> This caused a non-working display for me, when trying to enable
> the rk3576 dsi controller using a display using this controller.
> 
> Therefore move the display_on/off calls the more appropriate
> prepare/unprepare callbacks.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>   drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 27 +++++--------------
>   1 file changed, 7 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> index d7a17dca2a9c..a20b52181ea0 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> @@ -1315,35 +1315,24 @@ static int ili9881c_prepare(struct drm_panel *panel)
>   	if (ret)
>   		goto disable_power;
>   
> -	return 0;
> -
> -disable_power:
> -	regulator_disable(ctx->power);
> -	return ret;
> -}
> -
> -static int ili9881c_enable(struct drm_panel *panel)
> -{
> -	struct ili9881c *ctx = panel_to_ili9881c(panel);
> -
>   	msleep(120);
>   
> -	mipi_dsi_dcs_set_display_on(ctx->dsi);
> +	ret = mipi_dsi_dcs_set_display_on(ctx->dsi);
> +	if (ret)
> +		goto disable_power;
>   
>   	return 0;
> -}
>   
> -static int ili9881c_disable(struct drm_panel *panel)
> -{
> -	struct ili9881c *ctx = panel_to_ili9881c(panel);
> -
> -	return mipi_dsi_dcs_set_display_off(ctx->dsi);
> +disable_power:
> +	regulator_disable(ctx->power);
> +	return ret;
>   }
>   
>   static int ili9881c_unprepare(struct drm_panel *panel)
>   {
>   	struct ili9881c *ctx = panel_to_ili9881c(panel);
>   
> +	mipi_dsi_dcs_set_display_off(ctx->dsi);
>   	mipi_dsi_dcs_enter_sleep_mode(ctx->dsi);
>   	regulator_disable(ctx->power);
>   	gpiod_set_value_cansleep(ctx->reset, 1);
> @@ -1499,8 +1488,6 @@ static enum drm_panel_orientation ili9881c_get_orientation(struct drm_panel *pan
>   static const struct drm_panel_funcs ili9881c_funcs = {
>   	.prepare	= ili9881c_prepare,
>   	.unprepare	= ili9881c_unprepare,
> -	.enable		= ili9881c_enable,
> -	.disable	= ili9881c_disable,
>   	.get_modes	= ili9881c_get_modes,
>   	.get_orientation = ili9881c_get_orientation,
>   };

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
