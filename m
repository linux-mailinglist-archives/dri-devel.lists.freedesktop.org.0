Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D6DC683E4
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 09:42:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFD4E10E435;
	Tue, 18 Nov 2025 08:42:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Srl8pJ4a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A7FF10E435
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 08:42:22 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-b73b06c5024so175405766b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 00:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763455341; x=1764060141; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=WH5kfDA8Its3YM03fhXy4ZKpO/6JPKnHsTZ2/L3NhrE=;
 b=Srl8pJ4aRYcWCNoYoyuf7GCQNVeL1XIClP0tOaIKntysZAYlk9sHjSjrUOc4Ww2KaS
 fufLShLv7yHFJIY/5FuCThPJ83KVy/dwU8Gw6ct5Yer+lAeaFaLO42FjX5S0Ebs+qCrJ
 aUE6rIYiE3nBDPe6Q9JhMUD1oJJHrKRNijgvf2rt/Bsilx7RvxBy9UD4uBrfeY34PkZj
 CP0Op3fjRqKmO7gTp2RD2idohouQajvBi0W2J2yLRpVuUhPhsUWREeogxgrYiKcKb+bO
 b57Q8tNA7DxaOGq7HmNyJNjKbUsLkf4yeY6VO+3tBJi+VVeSgHEdLM0Ehh4BhevMycJD
 l01g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763455341; x=1764060141;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WH5kfDA8Its3YM03fhXy4ZKpO/6JPKnHsTZ2/L3NhrE=;
 b=aUJ2Fwt82QyFhzhY4HVxwbTbNf227RsR+vJYxCgwq5nN5NBOVH6klB+Q6p2jHi+1BI
 WSJTuFLWHaAg1/U8PaAAu+VHVSQI6A1l4qOIFy/dQQKACMIOkHcsznbb/VzUNuETtx3V
 0lzbFOVExpmPLv+QZH0t88TXA5BAmJzpFA0fbg7aucFijoGp40V1DilERbyV4cA1tfej
 xcKhyU/bqJfTAZLm9YVJEwm4LK0gK7GtmRneO7G1UdrCM4CVx2auTYe8c1PxWIZHzvS0
 BpFCuweZhVxeans1WytkG5uYnCBScYjYcYeXc6tngs8jZbKntC0NRTtrjXTY8KLYmUKx
 +1cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVd61OlTEnJrYoyXxtxd60yFl1GJsDtKQbSQa6eS5F0UIkwhqckP6/T1h3WTGq6Nq0y1ptTHSmYNM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+xDA/veB/cc4At3/FDLMgFN/ATdPVUmQzYsXALzKZN821ceUe
 W5+rFRymnV9feDNMWHlwIBylBAHt4TFGwNMvsd+tDiKhEzpNS3a7GdCfzUx3N7lgpbM=
X-Gm-Gg: ASbGncv/69UTBn0Qayxoj+tnRJY2GNDQbU3d8VFXbs5rIOHyxlsqJzft56cuifGrPAH
 0OwF6CVcowGRucImq0YtrCMHDmHG+g0F5MRuGAE42CAqh+kjcLzG9zU3aogtVAfgXuMBsRi+G2N
 6FXPDIFK4q6CaQIfOEVE6srKotlCwQW0akdqoZ8bylW3tUVf6RL1kcPj2K/pldXYJvlD5fq1d87
 4Dd0Ty3plbbJTT4Lmuqjo0GOI23kEh+f/QDBj4+RyBxGzrPrT7Zvf/+1nmLfipTgGXKi84dhEnx
 NdZLO5iBpI59UruhNK2N7ZPQa8kY0sWcptmNu9lASrW7qNYk4QoHdAHT1D4/Yf4vNqhjxPMRfLs
 Gaf0ZvXzRB1RJbQS7uWV/IGy9OIJpNexOSCy2+kblLwu0koylvD95SaGekQFAizVgttFGIjRrZu
 o0re7Pqgvi/LdY2z+p9jkK3trWdQkXkd5EHfpFqdf0zhWj0J4l/SBORern4SY51SPlRnjToS/e/
 Q==
X-Google-Smtp-Source: AGHT+IEhaFrOYu4Py+Us8ArflJOXu7G/hF9hQlr+6Ey8vBfY4KTWkqm9lk8u57P3nPnHffpUYL34jw==
X-Received: by 2002:a17:907:1c96:b0:b73:39c3:b4f with SMTP id
 a640c23a62f3a-b7367be02a8mr1542271266b.50.1763455340651; 
 Tue, 18 Nov 2025 00:42:20 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:366e:5264:fffe:1c49?
 ([2a01:e0a:3d9:2080:366e:5264:fffe:1c49])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fad4487sm1331425866b.22.2025.11.18.00.42.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 00:42:20 -0800 (PST)
Message-ID: <4bca0397-df09-49b4-aced-3046e09a6861@linaro.org>
Date: Tue, 18 Nov 2025 09:42:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 3/3] drm/panel: simple: Add Raystar RFF500F-AWH-DNN panel
 entry
To: Fabio Estevam <festevam@gmail.com>
Cc: jesszhan0024@gmail.com, dri-devel@lists.freedesktop.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20251115025827.3113790-1-festevam@gmail.com>
 <20251115025827.3113790-3-festevam@gmail.com>
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
In-Reply-To: <20251115025827.3113790-3-festevam@gmail.com>
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

On 11/15/25 03:58, Fabio Estevam wrote:
> Add support for the Raystar RFF500F-AWH-DNN 5.0" TFT 840x480 LVDS panel.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 27 +++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index da6b71b70a46..57c44b016957 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -4106,6 +4106,30 @@ static const struct panel_desc qishenglong_gopher2b_lcd = {
>   	.connector_type = DRM_MODE_CONNECTOR_DPI,
>   };
>   
> +static const struct display_timing raystar_rff500f_awh_dnn_timing = {
> +	.pixelclock = { 23000000, 25000000, 27000000 },
> +	.hactive = { 800, 800, 800 },
> +	.hback_porch = { 4, 8, 48 },
> +	.hfront_porch = { 4, 8, 48 },
> +	.hsync_len = { 2, 4, 8 },
> +	.vactive = { 480, 480, 480 },
> +	.vback_porch = { 4, 8, 12 },
> +	.vfront_porch = { 4, 8, 12 },
> +	.vsync_len = { 2, 4, 8 },
> +};
> +
> +static const struct panel_desc raystar_rff500f_awh_dnn = {
> +	.timings = &raystar_rff500f_awh_dnn_timing,
> +	.num_timings = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 108,
> +		.height = 65,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> +};
> +
>   static const struct display_timing rocktech_rk043fn48h_timing = {
>   	.pixelclock = { 6000000, 9000000, 12000000 },
>   	.hactive = { 480, 480, 480 },
> @@ -5378,6 +5402,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "qishenglong,gopher2b-lcd",
>   		.data = &qishenglong_gopher2b_lcd,
> +	}, {
> +		.compatible = "raystar,rff500f-awh-dnn",
> +		.data = &raystar_rff500f_awh_dnn,
>   	}, {
>   		.compatible = "rocktech,rk043fn48h",
>   		.data = &rocktech_rk043fn48h,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
