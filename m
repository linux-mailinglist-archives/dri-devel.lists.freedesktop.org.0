Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7132C9F07E2
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 10:28:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 165F610EF83;
	Fri, 13 Dec 2024 09:28:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TIEJttqs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3163B890BE
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 09:28:28 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-436249df846so10543305e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 01:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734082107; x=1734686907; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=yozBsa21RGVFgq006ZI3ZLQ/IbNIf9bvgbwa5F/+dlc=;
 b=TIEJttqsNuhhsFjEMshDWADKlny8RJD34B9KJyK3I6ijCUHUU0u8SM0jjchj4AhwO/
 jgParUw8DfEul6l5ZbWzDGpceGQG8KUzjDSQYsZDztbxk8IQV6QNxFCSCgPIppwx9hWF
 16fiWo2MjUA7klTUSyqG5U8qsI0/4hghcGOgK2loqoCmft+wk14GODXMhrHvs7tuJSP3
 47kB5RZ2sPxA6ghqF5sMrTQs1uIH7H8VMTQ1ELzOKTluRl4RfGs5vQhTQhXSNJMXnoXv
 0aOO+eRoo4lOlacDQ470QZXdNzTAmsfy5F+I009MwPg6cli44Ev/Ubme4k6/JexW1fMU
 PGkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734082107; x=1734686907;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=yozBsa21RGVFgq006ZI3ZLQ/IbNIf9bvgbwa5F/+dlc=;
 b=d+BV8x5bvecPTT2saoBD07SnIlYRzJm6vWgEpayWQ25zLKZnsCITWBhpZvHMROk6Ys
 bPsoSDCBCiYU0oiPMn1ZgbGVPwXt3GiOZbI6KbI5Cg7/52nxen3yTdquxgUJcdFa81oi
 6VvhWIKaZ5kOQYujozngi2vlmpBlnnAnEX1ZKi7q228IKnZMDjJhgM4F84oH1e73hWbh
 rk7HavQ82yU53VMTqD0J9iq20XcMYMV1zW1gUobidB0TaKHQO+eHiI3ub7EJVQQAWA0r
 yBl8ZXGEa+b/yBaqR+vNfzBMgLW+VIO6i/KhFY9qjotAn9KdSLgaCM3Ap/OZ6RCzrQ1z
 jTQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3TR2Khna/G281Co8hteK0n1KmsDoljGIqPlmRrQMFVjV6urXb6srHHG+HQqyw8Gtg/h8AgIdX8WE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQxisHIcCJPfa0iE18mf+AlPw9yrCpVZ+6yL1BjOPvScrewtbq
 dJvoG9qGiCCsYd3zflQ23tWvwB6K3je9gi8hfyaes/o5nmIUWGjFXwIDfWjLJt4=
X-Gm-Gg: ASbGncsolFk936HecOZwxcN6I7oIWCpyHn2aEfCVRhu7CnJeH9XkkP+ci2MkLc+/ATJ
 p5bQ0Y68CqtlojW8Sc+hY/32/oup8Qt6L/Pu1SJQbchHuK6xIgkVxMqoe85pzgEZwLTWtG5DoBo
 pHjxrB/dtxqTtA1d2vWKKkQ2abZ63NWUTFt053ZLT1B742Ipgh4NBKZFlHGLXaVxJ+UpePFskDm
 Fy8f40+zhjQPZ+NwGMom50rJFGwayX+Cux+asIMu3D9x9Yg3TDB6Tk5XnvqYBwlALW1S2XARTKp
 kokEjtdYzpjw/y0iQXnD/C9C59ooQHgLmA==
X-Google-Smtp-Source: AGHT+IHffbVyS3M5lg5YQDgo1g0//z6wj61DdR0u4BcqNisLOiriEv/4ltw0nNOUOkZ1jqI/2dg4Rg==
X-Received: by 2002:a05:600c:4e0b:b0:431:5aea:95f with SMTP id
 5b1f17b1804b1-4362aa593b9mr15131545e9.16.1734082106477; 
 Fri, 13 Dec 2024 01:28:26 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4795:2d16:2587:ed70?
 ([2a01:e0a:982:cbb0:4795:2d16:2587:ed70])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436256b7c62sm42968005e9.34.2024.12.13.01.28.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Dec 2024 01:28:26 -0800 (PST)
Message-ID: <26c44a01-383a-4b1b-aba1-12d3e98ede1c@linaro.org>
Date: Fri, 13 Dec 2024 10:28:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] drm/panel: simple: Add Tianma TM070JDHG34-00 panel
 support
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241210-tianma_tm070jdhg34-v1-0-9fb7fe6b6cf0@bootlin.com>
 <20241210-tianma_tm070jdhg34-v1-2-9fb7fe6b6cf0@bootlin.com>
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
In-Reply-To: <20241210-tianma_tm070jdhg34-v1-2-9fb7fe6b6cf0@bootlin.com>
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

On 10/12/2024 18:28, Luca Ceresoli wrote:
> Add Tianma TM070JDHG34-00 7.0" 1280x800 LVDS RGB TFT LCD panel.
> 
> Panel info and datasheet: https://fortec.us/products/tm070jdhg34-00/
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 42 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 42 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 1562f122724137dec37eb11443eafc896ef2f2e8..b3c931a4e46a2568b3678d664f11b189873fa1e2 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -4286,6 +4286,45 @@ static const struct panel_desc tianma_tm070jvhg33 = {
>   	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
>   };
>   
> +/*
> + * The datasheet computes total blanking as back porch + front porch, not
> + * including sync pulse width. This is for both H and V. To make the total
> + * blanking and period correct, subtract the pulse width from the front
> + * porch.
> + *
> + * This works well for the Min and Typ values, but for Max values the sync
> + * pulse width is higher than back porch + front porch, so work around that
> + * by reducing the Max sync length value to 1 and then treating the Max
> + * porches as in the Min and Typ cases.
> + *
> + * Exact datasheet values are added as a comment where they differ from the
> + * ones implemented for the above reason.
> + */
> +static const struct display_timing tianma_tm070jdhg34_00_timing = {
> +	.pixelclock = { 68400000, 71900000, 78100000 },
> +	.hactive = { 1280, 1280, 1280 },
> +	.hfront_porch = { 130, 138, 158 }, /* 131, 139, 159 */
> +	.hback_porch = { 5, 5, 5 },
> +	.hsync_len = { 1, 1, 1 }, /* 1, 1, 256 */
> +	.vactive = { 800, 800, 800 },
> +	.vfront_porch = { 2, 39, 98 }, /* 3, 40, 99 */
> +	.vback_porch = { 2, 2, 2 },
> +	.vsync_len = { 1, 1, 1 }, /* 1, 1, 128 */
> +	.flags = DISPLAY_FLAGS_DE_HIGH,
> +};
> +
> +static const struct panel_desc tianma_tm070jdhg34_00 = {
> +	.timings = &tianma_tm070jdhg34_00_timing,
> +	.num_timings = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 150, /* 149.76 */
> +		.height = 94, /* 93.60 */
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> +};
> +
>   static const struct display_timing tianma_tm070rvhg71_timing = {
>   	.pixelclock = { 27700000, 29200000, 39600000 },
>   	.hactive = { 800, 800, 800 },
> @@ -5028,6 +5067,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "tianma,tm070jdhg30",
>   		.data = &tianma_tm070jdhg30,
> +	}, {
> +		.compatible = "tianma,tm070jdhg34-00",
> +		.data = &tianma_tm070jdhg34_00,
>   	}, {
>   		.compatible = "tianma,tm070jvhg33",
>   		.data = &tianma_tm070jvhg33,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
