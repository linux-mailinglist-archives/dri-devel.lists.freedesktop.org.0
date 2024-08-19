Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 366E3956EEC
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 17:37:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB39610E2D6;
	Mon, 19 Aug 2024 15:37:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ioebQjgJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7875E10E2D6
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 15:37:43 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-42803bbf842so49313815e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 08:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724081862; x=1724686662; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=gk/aI2kxKmkDRsiAKaWtwtbGzvvh1/Raj/5lOKvnf68=;
 b=ioebQjgJUTtWuVn7dHXzE5hDKPRfOwKko2GGZYoxeZBRDMuC87Gv28y78J5LpkFjhU
 NIsUGz4LwMZ/uRi0eEirQsAQwYHmVIhtcwMZqNZfm4D8UZqy+mSk7xessLT2Vfb3XAl6
 DIlSBsNBKhI36ajyEDDqKxF3Yo9WlMiiod0HG/MhxAiP5zppnVgGlHFOWE7eerrii6sN
 isyxuIVIb7yuXi8xHYzuEeBGwWmvinbzuEVHBJsncah/Lm3D4bkniVSNAFLtmlj82Apq
 sjxDtpP1jSS6qRtEVbGkfU0ClCw+/TEaVXQYiEB73iLLzWVOSkts/9hQwdqhNbhwLlH5
 mTyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724081862; x=1724686662;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=gk/aI2kxKmkDRsiAKaWtwtbGzvvh1/Raj/5lOKvnf68=;
 b=q75JyOc9p9xpIYknltvNBonWrDroHtZivsL0o5r0NObVqU2wtaqVVao7FZtsfnsoDk
 THE3p4EaJoEpJS24Aom2avfIheBHHjzzQd2m4nwyji1K9LRXrJwboxvtgpjcWgZObpY4
 Z9QFPJsqpZZ7nCvND5vBXJYLunRbe66Pc7Hf8qdaqYXDoJ+mHVEBbrNrV7bl9RwzlYxt
 bFTtIkzotWuzlaT0zee+N0dp7p2PgXLqpOzr4ooTpFVczbOd4F0Cf+4QfDDoRaxB+ZFH
 QPrn1w6GZJrsUo3pDlvYuDQAeHIe+EfVkItRjZDYTfL/fAC/FKLfdWcan1l3WLvbMF77
 ms8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWebKjNWgsYA+Byu4U9LSFYlonVk3tDtjZibn4TjZ8KjgkXPhWp9q2fGf+uzgjKBkDOvl0Tj8v7BvgvV/yMJhlY3LcwvG+70DSvvQtVyW/6
X-Gm-Message-State: AOJu0Yy06nRIzLNOCBz6qz7kRKq8uZI+O1m6yTQ4NhaczMB3F+V96xPx
 dpsNYONg+IVf24n30kCyV0gWCE2x3P3N6cIY8Y27s+btqGPVCWARYilDTsghb2Y=
X-Google-Smtp-Source: AGHT+IEtBMpFzGovTSbnyr1xNX0cNQOcqOR29mxr34rfwLVAio2zTzxR5KH9Pf51ZSP8cxK3YtubPw==
X-Received: by 2002:a5d:4fd1:0:b0:368:420c:74ab with SMTP id
 ffacd0b85a97d-3719464c2eemr9937656f8f.28.1724081861387; 
 Mon, 19 Aug 2024 08:37:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f54e:4b0a:5175:5727?
 ([2a01:e0a:982:cbb0:f54e:4b0a:5175:5727])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3718985a7d3sm10803548f8f.61.2024.08.19.08.37.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 08:37:41 -0700 (PDT)
Message-ID: <556b7957-802b-4792-a04b-427409807902@linaro.org>
Date: Mon, 19 Aug 2024 17:37:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/2] drm/panel: simple: Add ON Tat Industrial Company
 KD50G21-40NT-A1 panel
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 thierry.reding@gmail.com, sam@ravnborg.org
References: <20240816085004.491494-1-victor.liu@nxp.com>
 <20240816085004.491494-3-victor.liu@nxp.com>
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
In-Reply-To: <20240816085004.491494-3-victor.liu@nxp.com>
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

On 16/08/2024 10:50, Liu Ying wrote:
> ON Tat Industrial Company KD50G21-40NT-A1 is a 5" WVGA LCD panel with DPI
> interface.
> 
> The LCD module specification can be found at:
> https://cdn-shop.adafruit.com/datasheets/KD50G21-40NT-A1.pdf
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 36 ++++++++++++++++++++++++++++
>   1 file changed, 36 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index bf40057c5cf3..89963df80917 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -3478,6 +3478,39 @@ static const struct panel_desc olimex_lcd_olinuxino_43ts = {
>   	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
>   };
>   
> +static const struct display_timing ontat_kd50g21_40nt_a1_timing = {
> +	.pixelclock = { 30000000, 30000000, 50000000 },
> +	.hactive = { 800, 800, 800 },
> +	.hfront_porch = { 1, 40, 255 },
> +	.hback_porch = { 1, 40, 87 },
> +	.hsync_len = { 1, 48, 87 },
> +	.vactive = { 480, 480, 480 },
> +	.vfront_porch = { 1, 13, 255 },
> +	.vback_porch = { 1, 29, 29 },
> +	.vsync_len = { 3, 3, 31 },
> +	.flags = DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW |
> +		 DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_PIXDATA_POSEDGE,
> +};
> +
> +static const struct panel_desc ontat_kd50g21_40nt_a1 = {
> +	.timings = &ontat_kd50g21_40nt_a1_timing,
> +	.num_timings = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 108,
> +		.height = 65,
> +	},
> +	.delay = {
> +		.prepare = 147,		/* 5 VSDs */
> +		.enable = 147,		/* 5 VSDs */
> +		.disable = 88,		/* 3 VSDs */
> +		.unprepare = 117,	/* 4 VSDs */
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
> +	.connector_type = DRM_MODE_CONNECTOR_DPI,
> +};
> +
>   /*
>    * 800x480 CVT. The panel appears to be quite accepting, at least as far as
>    * pixel clocks, but this is the timing that was being used in the Adafruit
> @@ -4837,6 +4870,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "olimex,lcd-olinuxino-43-ts",
>   		.data = &olimex_lcd_olinuxino_43ts,
> +	}, {
> +		.compatible = "ontat,kd50g21-40nt-a1",
> +		.data = &ontat_kd50g21_40nt_a1,
>   	}, {
>   		.compatible = "ontat,yx700wv03",
>   		.data = &ontat_yx700wv03,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
