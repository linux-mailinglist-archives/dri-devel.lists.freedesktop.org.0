Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD279F07CF
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 10:24:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E65010EF7A;
	Fri, 13 Dec 2024 09:24:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fID6hSrR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B1410EF7A
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 09:24:49 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-385e2880606so1407650f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 01:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734081888; x=1734686688; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=wutSH20sqxWpg2z4HRMnPTYhGp8Ph9hwGl0McLup9A4=;
 b=fID6hSrRrecyHGAj6F6/DUYoheJaur1a8tAmNdQicnAOAF9LE3dw9WrVeIP859Bybm
 y7NcAN4AGS2Z1ljSGW1mPwUzCz0RGLclwN73+8P2VWhffaJusnAtgX8J+EjWJUuW9tXt
 lRF4YCNxlrgv3l10EB0/VfpL1l9USMKYeYH5brHWM3u/jPpTCiZ5Maq9fQClv9nHc2m4
 ci9jpqnGV5KdR2J7P+c/MdRcJUufH1lQ5pIM/GWt2DHyiXWM/Be0jE2dlD2pjQLeVfTM
 ZrnJgH1Jjf4mPex7OialPgcuibX9BHJlzxR550UIpt9XF544TO+M3BRB+4GdQeAs79kE
 oSnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734081888; x=1734686688;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=wutSH20sqxWpg2z4HRMnPTYhGp8Ph9hwGl0McLup9A4=;
 b=qMc14EzfVcB6efFrBYhsMNybVLSMqCDe9lF2+TS/KQuqUE0TGFov7ROSLdhebp86Zj
 StcAgY+YUnUfMFN0Y0FT9P/qXNe9gGTxW61Xyh6y5/hKP0Yv830A/2Z+WKDoZs2n3esX
 tPyVRhzKKbbkV3+P48rgPMX+IDM2ZFZjznA+h1dOSU8o1f8I3KWCh4BPjXaRmVhDw7zu
 IRSsgxblGRtrBMaRGLIV0b76vHk7YGja1aO/E94WaIs9DzZDQPp3mvXPBeKkOTmsP3gX
 JB6xUv1NbYVQF7a3VZgBnW6vA3Nt718DXmMCMgfXe891BOgpCTEDqvLkG+bDNW5eoG6w
 Z20Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXJEDfAr5WZa2i/Q5gj9c9nMMNQLRbmIWlFl7syTYKmUVf66PsQHoaf5SDEwn9N+7rU2Uijy5ziSo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXqF9leMtzd8TglSAyAXeYZZphmpeVfKw+4YSlZ3K8Bt58BOob
 P5QlyvLGo16xSOyOWlfd58YlPtMHwITqJq3kP31vE1eOM27DGUO2dXUesuuyaXM=
X-Gm-Gg: ASbGnctRB0VFVkHN+mjnOP4YFj2EWPe4UHzyJf2zZ2P3FD3FlGFp1R5JqUFS1xIrV0E
 Mwj8Q28qyFNkoDGRmvX9gFA25oIy4GIlZSYT+qIZXIx+WKdm5xGZPU8HBlMW4l+CS7a3T9r0eU0
 wNkLoeU5q3PaU7ohXHYxhAWeLU1hEVmXWRN8xhfIB9FR0+oIm8uGI3lWdq5Bm9JMsWeGJSqFUaz
 es+fQVo+e7I9sCbHi9CIg8nBKc4X9YRCmdYobeXg9qVwupuZKTGH3F4VdtmVCG7Iry/HqS7l4zq
 KMImo9l1gsCv2M533EzmH4dK3nubEfBuQg==
X-Google-Smtp-Source: AGHT+IFI074Lwn8iG2p3aXLmDgxZRpsAda5g2MDoS7aVwb7sB0VGKt4LBItRaVXvt767TAep4zOBoQ==
X-Received: by 2002:a05:6000:1ac9:b0:385:f23a:2fec with SMTP id
 ffacd0b85a97d-38880ac6078mr1521781f8f.11.1734081887751; 
 Fri, 13 Dec 2024 01:24:47 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4795:2d16:2587:ed70?
 ([2a01:e0a:982:cbb0:4795:2d16:2587:ed70])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3878248e633sm6740011f8f.4.2024.12.13.01.24.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Dec 2024 01:24:47 -0800 (PST)
Message-ID: <08a636e5-5263-47bf-a046-29da9584b673@linaro.org>
Date: Fri, 13 Dec 2024 10:24:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] drm/panel: simple: add Multi-Inno Technology
 MI1010Z1T-1CP11
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Cc: Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Simona Vetter <simona@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org
References: <20241212122701.25305-1-marex@denx.de>
 <20241212122701.25305-2-marex@denx.de>
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
In-Reply-To: <20241212122701.25305-2-marex@denx.de>
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

On 12/12/2024 13:26, Marek Vasut wrote:
> Add Multi-Inno Technology MI1010Z1T-1CP11 10.1" 1024x600 LVDS panel support.
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
> index d5bb850df9d20..d68662b7265ae 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -3340,6 +3340,33 @@ static const struct panel_desc multi_inno_mi1010ait_1cp = {
>   	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>   };
>   
> +static const struct display_timing multi_inno_mi1010z1t_1cp11_timing = {
> +	.pixelclock = { 40800000, 51200000, 67200000 },
> +	.hactive = { 1024, 1024, 1024 },
> +	.hfront_porch = { 30, 110, 130 },
> +	.hback_porch = { 30, 110, 130 },
> +	.hsync_len = { 30, 100, 116 },
> +	.vactive = { 600, 600, 600 },
> +	.vfront_porch = { 4, 13, 80 },
> +	.vback_porch = { 4, 13, 80 },
> +	.vsync_len = { 2, 9, 40 },
> +	.flags = DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW |
> +		 DISPLAY_FLAGS_DE_HIGH,
> +};
> +
> +static const struct panel_desc multi_inno_mi1010z1t_1cp11 = {
> +	.timings = &multi_inno_mi1010z1t_1cp11_timing,
> +	.num_timings = 1,
> +	.bpc = 6,
> +	.size = {
> +		.width = 260,
> +		.height = 162,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> +};
> +
>   static const struct display_timing nec_nl12880bc20_05_timing = {
>   	.pixelclock = { 67000000, 71000000, 75000000 },
>   	.hactive = { 1280, 1280, 1280 },
> @@ -4944,6 +4971,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "multi-inno,mi1010ait-1cp",
>   		.data = &multi_inno_mi1010ait_1cp,
> +	}, {
> +		.compatible = "multi-inno,mi1010z1t-1cp11",
> +		.data = &multi_inno_mi1010z1t_1cp11,
>   	}, {
>   		.compatible = "nec,nl12880bc20-05",
>   		.data = &nec_nl12880bc20_05,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
