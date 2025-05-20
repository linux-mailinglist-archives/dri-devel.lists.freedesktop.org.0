Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE04ABD278
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 10:57:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A808F10E440;
	Tue, 20 May 2025 08:57:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VDX78YsA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C44C310E440
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 08:57:07 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-441d1ed82dbso53784375e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 01:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747731426; x=1748336226; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=pA6QLGwRrJdjtu/QYKul6KHwTkpIcoSd75MMlyAB2zA=;
 b=VDX78YsA2aig/I8HGCh1iMehv2iCc06kmv0kbybkoRduCIg5sUDkzGvGTtLNL/4QNV
 k9YY5JsqGmkOf5x1Ubb27WMtFqQ6obWHjeG+R1kJqVxH44wI1oCGy36Jz8TDxvqYBctA
 u432OCUnWCw0falXy/Qk+tJXaMljkR+C/1qWypUgCaU9ajHse+WdfTkqkVd/LwzENKtn
 9nrbmgDCPxHSl32Jo/VT6P45IX0Gv6u3gaHx8EvYSyQ3zOl/VDvsD2Nk8xjcoZ2mlaAW
 jbv0MSlLS08FVneyVbN/Aj9Htv/6IGUt4I8Zr2Wwxbe6YjGCm51WadmTIAhq/2Yc6e4z
 V7qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747731426; x=1748336226;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=pA6QLGwRrJdjtu/QYKul6KHwTkpIcoSd75MMlyAB2zA=;
 b=pYYHeHWeIQO21qE1On6eCEEpUmyKvUo4FXHI4vJ9rBKv3urH6Q448Fx9bDM/W7Vhcu
 4MkZxoy9EYTWinQlHdorR9rR65rUT6+bBte98zJKIOfpcIeyZVAB3I7mhwrnXPjqAA4o
 F2uUkg4WyBdGynHw8/Vrrcp3pX+0zMTAnJBb72eBfq/wsgOXNH/ylMTWkxXvbrjKrZro
 4EwlRdhwayELKPAMpqOAo0T+fRExax5E+sXu/V0j6DQWTJJMlFDtkzD0mDeqeBjRSfiJ
 gkGXca4I64uRXcb5w4wJtJTYI9ltOFZvUhJ07z/cOX+fwOvGnvWMO3YDyIg7CPvoXGBE
 borg==
X-Gm-Message-State: AOJu0YyZiOWYrRlBJ6fCIGbq4X+yh1mUXsQD1mi70VPHGX3rtxVh6Px8
 +bcx8crqC+LBPcJW4EF+S1maLzkdkOcoKuBQ+CFRtvBcc1Ow9a7V7XVYiKsQnfeG0yc=
X-Gm-Gg: ASbGncvnsl//tfTpAPB/c0NhdY4HN3rzlv6FDDsUGfjsvcLGY3kFb2JSntZuQo/SUGu
 sOTKv1ZFwHNtJQBO/wrktGYgVWNOL9Tw8E9YGhCFB3ReHF0wWBbr+IVew68RDyn2c9pkQm4zq2d
 qjZolwJkISwQ7JwszmC5FcmBZzH+F5ex45Ctb0b1crkKA6KcoiNeUNH2E5G43HgfmIKMEHGG0B9
 pL9t5FumA2G60ND+wU0f5y+28p3dRyRiktZ7kmisOb6rixiUOJOmxzot4w4kkpLzEeSrtlMbJ51
 VrU4AvUQRegl42CJBUi8aWXOZ3UKcT5C4h85puENkEfhdRJ0Q6s2fe748P/4LQry74Oj1rWq3an
 kh6Cu3E4gRZ21ETB/OX2r8HlA+inT
X-Google-Smtp-Source: AGHT+IFbtVVMSZ+fpznQMGHkKUKbSTe4C1qJjVDbXUGkHv0z1uMwtIjTYIadxx/YhwGJBwF3TwZwOw==
X-Received: by 2002:a05:600c:8288:b0:43c:efed:733e with SMTP id
 5b1f17b1804b1-442fd6102cdmr142540875e9.14.1747731426327; 
 Tue, 20 May 2025 01:57:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68?
 ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442ebd6fe86sm184664845e9.0.2025.05.20.01.57.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 01:57:06 -0700 (PDT)
Message-ID: <405accea-0b4c-4891-9022-425ddc886902@linaro.org>
Date: Tue, 20 May 2025 10:57:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] drm/panel-simple: add AUO P238HAN01 panel entry
To: Michael Walle <mwalle@kernel.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250520074439.655749-1-mwalle@kernel.org>
 <20250520074439.655749-2-mwalle@kernel.org>
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
In-Reply-To: <20250520074439.655749-2-mwalle@kernel.org>
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

On 20/05/2025 09:44, Michael Walle wrote:
> Timings taken from the datasheet and the display is working in DE mode,
> thus the datasheet only specifies the blanking period. sync, back porch
> and front porch are arbitrarily chosen.
> 
> The datasheet can be found at [1] but for reference these are the
> relevant timings:
> 
>   sym  |              | min  | typ  | max  | unit |
> ------|--------------+------+------+------+------+
>     Tv | V period     | 1094 | 1130 | 1836 | Th   |
>        | V active     | 1080 | 1080 | 1080 | Th   |
>        | V blanking   |   14 |   50 |  756 | Th   |
>     Fv | V frequency  |   49 |   60 |   76 | Hz   |
>     Th | H period     | 1000 | 1050 | 1678 | Tclk |
>        | H active     |  960 |  960 |  960 | Tclk |
>        | H blanking   |   40 |   90 |  718 | Tclk |
>     Fh | H frequency  | 53.7 | 67.8 | 90.0 | kHz  |
>   Tclk | LVDS clock   | 53.7 | 71.2 | 90.0 | MHz  |
> 
> Keep in mind that this is a dual link LVDS panel and the horizontal
> timings are only for one half of the panel.
> 
> [1] https://www.fortec-integrated.de/fileadmin/pdf/produkte/TFT-Displays/AUO/P238HAN01.0_Datasheet.pdf
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 27 +++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 0a3b26bb4d73..47222d2d8129 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1268,6 +1268,30 @@ static const struct panel_desc auo_g190ean01 = {
>   	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>   };
>   
> +static const struct display_timing auo_p238han01_timings = {
> +	.pixelclock = { 107400000, 142400000, 180000000 },
> +	.hactive = { 1920, 1920, 1920 },
> +	.hfront_porch = { 30, 70, 650 },
> +	.hback_porch = { 30, 70, 650 },
> +	.hsync_len = { 20, 40, 136 },
> +	.vactive = { 1080, 1080, 1080 },
> +	.vfront_porch = { 5, 19, 318 },
> +	.vback_porch = { 5, 19, 318 },
> +	.vsync_len = { 4, 12, 120 },
> +};
> +
> +static const struct panel_desc auo_p238han01 = {
> +	.timings = &auo_p238han01_timings,
> +	.num_timings = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 527,
> +		.height = 296,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> +};
> +
>   static const struct display_timing auo_p320hvn03_timings = {
>   	.pixelclock = { 106000000, 148500000, 164000000 },
>   	.hactive = { 1920, 1920, 1920 },
> @@ -4938,6 +4962,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "auo,g190ean01",
>   		.data = &auo_g190ean01,
> +	}, {
> +		.compatible = "auo,p238han01",
> +		.data = &auo_p238han01,
>   	}, {
>   		.compatible = "auo,p320hvn03",
>   		.data = &auo_p320hvn03,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
