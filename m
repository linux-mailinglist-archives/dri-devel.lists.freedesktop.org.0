Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9556B9F07CA
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 10:24:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80DF210EF79;
	Fri, 13 Dec 2024 09:24:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uBxsvPvV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2179F10EF79
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 09:24:24 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-435004228c0so18180545e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 01:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734081862; x=1734686662; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=FVIBsh6H75ToUJ73kg1JpoXbdNPaR6D/0c0Kg16Vrrw=;
 b=uBxsvPvVCaG0LiDdYaWjH9Y++Abj5evvUdjkR1VZ+IYHZgdklmMPJSDrVUsLchNwxN
 yfNxx0+aKmupIUMmCJVZwV9+m/ksj2oPtceOamkuSwAso/Ul3pqh5/fhov0ilvcpEoUC
 nASJr55Ilzkq37+JA58/vLYdXtqr3G7YLwhrn/Cy1Q77U3st97ne4K/va5TMQHenuAM5
 kwvA4d44xNv8l8NaKICyrr8+fJPh6M1pr/udxsoecSmJZlkIHXet8cEBRA8pNftfVpfp
 LokyctVd2u10jykIMWloMpEM4d5MjAaTKmMDr1103mUsQx+5v8r2w0iOdDw6MLDSlBIR
 WVsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734081862; x=1734686662;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=FVIBsh6H75ToUJ73kg1JpoXbdNPaR6D/0c0Kg16Vrrw=;
 b=pJfINauy6zecD8LLKQSge/MguMb8L/ALT1pPQCue24amfeS2RntglPx+uzK4/GhkOQ
 6jnrCu6r17KXN7ziO9WGH+gShCA3bLG29F41wEAWhrxsZoPnQ4t0ble9LbKCxeO/yJ3v
 dCF2HB12Ckf3dAD0A1wDDlXmh9BMJ2JQCj0QLQ5LQ85zNdK9s+PERaYnmDcIsQcgwMNV
 o2F35A2wGRymAIitUiK2G3/ZFuGjh/549qDivvLFckQErDCGEHrCteHABhuIPwAim5S+
 0A+NrSHGdwCWHVdrkBAKPeOVFgd5Zmltwhzoo7EJtsnMuQQlWD0qWCEpxqZQGh6Ct3Vz
 3/Yg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiaIndKIJPd9QgE5lIdyF1nE1RbdfjePuJu+UYmrSBs6l/0oZjZvXYi7RB2ZGVApiZrzLDOd8pq1E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYy7pt9DwEnN3Nh/3OUOwQkONl+cmA0sRVH58DGaa5CcTyzZAk
 djIHnCROg+CaRjRxBjFuX38YHvCtyZf/cq6Blk3OreWVEj043jbzOgR84cnivzw=
X-Gm-Gg: ASbGnct8MRL3a1HCUzTS9N6e3d0k5HwswwewhBXFNghi9XXubosuFK2xhUM9MNBHQ7m
 8TPZ7C1cNpsei66RAdTYgj76FewLzAwWZNb9+amyrXO28eznQpAdE1y0f6HS8yWif2DT3hsUC1y
 3RsZw3Jh91vmcdWmasGz6MfRcC2+ye2KyK6IhiM9Gc9R+9njCveigCSPX5gV4Wn+A6bNGFPQ0+U
 UfiozsONZ+BSubLIyM6DzTCO65Zkvvqzsl2rv3ZEAnjEf052WViXt+14BwbqHmGGYcA9ZMpz5ih
 pTIlQTSe/n/QRkI+ELxcE9d/W4xhmeTKDw==
X-Google-Smtp-Source: AGHT+IGtHG7SvnWfkT/G7TBxknquXkATTnM0UDhdExdrI8MydS7jmmNVB5tziogoHHcYzT4JAyeTEg==
X-Received: by 2002:a05:600c:6549:b0:434:f0df:9fd with SMTP id
 5b1f17b1804b1-4362aa1b061mr16155975e9.2.1734081862604; 
 Fri, 13 Dec 2024 01:24:22 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4795:2d16:2587:ed70?
 ([2a01:e0a:982:cbb0:4795:2d16:2587:ed70])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4362557c357sm42712765e9.10.2024.12.13.01.24.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Dec 2024 01:24:21 -0800 (PST)
Message-ID: <8d17e493-df49-4c9e-9093-b49b227851bb@linaro.org>
Date: Fri, 13 Dec 2024 10:24:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] drm/panel: simple: add Multi-Inno Technology
 MI0700A2T-30
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Cc: Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Simona Vetter <simona@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org
References: <20241125013413.160725-1-marex@denx.de>
 <20241125013413.160725-2-marex@denx.de>
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
In-Reply-To: <20241125013413.160725-2-marex@denx.de>
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

On 25/11/2024 02:33, Marek Vasut wrote:
> Add Multi-Inno Technology MI0700A2T-30 7" 800x480 LVDS panel support.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 30 ++++++++++++++++++++++++++++
>   1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 06381c6282097..4e2582e1a2bd1 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -3222,6 +3222,33 @@ static const struct panel_desc mitsubishi_aa084xe01 = {
>   	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
>   };
>   
> +static const struct display_timing multi_inno_mi0700a2t_30_timing = {
> +	.pixelclock = { 26400000, 33000000, 46800000 },
> +	.hactive = { 800, 800, 800 },
> +	.hfront_porch = { 16, 204, 354 },
> +	.hback_porch = { 46, 46, 46 },
> +	.hsync_len = { 1, 6, 40 },
> +	.vactive = { 480, 480, 480 },
> +	.vfront_porch = { 7, 22, 147 },
> +	.vback_porch = { 23, 23, 23 },
> +	.vsync_len = { 1, 3, 20 },
> +	.flags = DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW |
> +		 DISPLAY_FLAGS_DE_HIGH,
> +};
> +
> +static const struct panel_desc multi_inno_mi0700a2t_30 = {
> +	.timings = &multi_inno_mi0700a2t_30_timing,
> +	.num_timings = 1,
> +	.bpc = 6,
> +	.size = {
> +		.width = 153,
> +		.height = 92,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> +};
> +
>   static const struct display_timing multi_inno_mi0700s4t_6_timing = {
>   	.pixelclock = { 29000000, 33000000, 38000000 },
>   	.hactive = { 800, 800, 800 },
> @@ -4905,6 +4932,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "mitsubishi,aa084xe01",
>   		.data = &mitsubishi_aa084xe01,
> +	}, {
> +		.compatible = "multi-inno,mi0700a2t-30",
> +		.data = &multi_inno_mi0700a2t_30,
>   	}, {
>   		.compatible = "multi-inno,mi0700s4t-6",
>   		.data = &multi_inno_mi0700s4t_6,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
