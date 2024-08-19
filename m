Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A68D8956F2D
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 17:47:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0913A10E2E6;
	Mon, 19 Aug 2024 15:47:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ubgEhUsk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2424C10E2E6
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 15:47:54 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-429d2d7be1eso23471515e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 08:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724082472; x=1724687272; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=kIt2br96mdLhWBp6JP0ipSVmrTaKgcGBYASdKyRKabE=;
 b=ubgEhUskhhwb9alSd2jTzjhtO5ZPZaUvJV5N4YE4L5ALVWYj57tnn4eVj4BX2Oy7Wu
 zouu5M8a8QEDgbsTVU/npxvrnJFxaPTS+45bFz4IQcqCrmgzbbnMLEvoKQIOxGuFdlw4
 NfAxCTj50d5BFP5OJlJxKWkpZbwMf1q6KH34aDvHvTNF3TJ82NTaNQCk+eE1foLaQ/MT
 0HgpeMd0seuo3SQWTbgc+8b6BGkZilxtijzbjXc6Dz8OOWfI/cEUYp5M2BTHkHmsH8/W
 SqSu1QcZj6tfueGzm6xMJpbqnJqYU7GzBQFR+p9nGbdADuBzpZwfjlu7wZ+5LV6mBVU4
 AyxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724082472; x=1724687272;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=kIt2br96mdLhWBp6JP0ipSVmrTaKgcGBYASdKyRKabE=;
 b=A9lxsGL10mj0PmZ2Lnv3WRo4Gpxi5X+KRnQQ2/RqreK6wFWp3u0THeP/n0binF7nEG
 zHUT2aime8E2h5YjhSVymt8IHDepO3F44kenSs+ZAoqaX/4PfhDsP1dOoP7tM8+hVtNb
 u3JjHigCsrRbD3pdqJvAZYXrUtX2bgJIZiVM83orgiX66gUBgp99gWL1cQfHQuhl2B5w
 lhQuBm8fR9KJ4oVhKjEv1rhu6OOwdIeeToJLNaXhoJRjDvdCoO+2LJPj3r1y++dR/bFt
 BQNU8mihxhYQio2qQLjijBHI+z4DKgUjYEMl771QbpPF3X8RkdVZAL6yIkDal47zewMH
 MVIw==
X-Gm-Message-State: AOJu0Yw1apxqxBiPW1EUgfAKOK7HPO1XJcc429+7pwn/FpnzD7w5fY7I
 PQ9CDtwiTmEBL+SxO9lXL+q1V+rWfKAsyvC6X7c4QrXVsafOzwepSXBlRLRLJ/4=
X-Google-Smtp-Source: AGHT+IHpqK5ydGJiaG8Tsb6JQ3a0Hg0XUq0yQbn0YLAqxKvXRrWxX6h8gI/Czs5mZegJOJge3Dlqnw==
X-Received: by 2002:a05:600c:3b8c:b0:428:9a1:f226 with SMTP id
 5b1f17b1804b1-42ab54ca592mr370515e9.1.1724082472005; 
 Mon, 19 Aug 2024 08:47:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f54e:4b0a:5175:5727?
 ([2a01:e0a:982:cbb0:f54e:4b0a:5175:5727])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ed650903sm114237705e9.18.2024.08.19.08.47.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 08:47:51 -0700 (PDT)
Message-ID: <e1b8756c-7b0a-4042-b1ba-24d3bcf1dad3@linaro.org>
Date: Mon, 19 Aug 2024 17:47:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/2] drm/panel: simple: add Innolux G070ACE-LH3 LVDS
 display support
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de
References: <20240729-b4-v6-10-topic-innolux-v2-0-27d32c766ce5@pengutronix.de>
 <20240729-b4-v6-10-topic-innolux-v2-2-27d32c766ce5@pengutronix.de>
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
In-Reply-To: <20240729-b4-v6-10-topic-innolux-v2-2-27d32c766ce5@pengutronix.de>
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

On 29/07/2024 09:02, Steffen Trumtrar wrote:
> The G070ACE-LH3 is a 7" TFT Color LCD module with WLED backlight.
> 
> https://www.data-modul.com/sites/default/files/products/G070ACE-LH3-specification-12058417.pdf
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 35 +++++++++++++++++++++++++++++++++++
>   1 file changed, 35 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index dcb6d0b6ced06..d3200dd035662 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2509,6 +2509,38 @@ static const struct panel_desc innolux_g070y2_l01 = {
>   	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>   };
>   
> +static const struct display_timing innolux_g070ace_lh3_timing = {
> +	.pixelclock = { 25200000, 25400000, 35700000 },
> +	.hactive = { 800, 800, 800 },
> +	.hfront_porch = { 30, 32, 87 },
> +	.hback_porch = { 29, 31, 86 },
> +	.hsync_len = { 1, 1, 1 },
> +	.vactive = { 480, 480, 480 },
> +	.vfront_porch = { 4, 5, 65 },
> +	.vback_porch = { 3, 4, 65 },
> +	.vsync_len = { 1, 1, 1 },
> +	.flags = DISPLAY_FLAGS_DE_HIGH,
> +};
> +
> +static const struct panel_desc innolux_g070ace_lh3 = {
> +	.timings = &innolux_g070ace_lh3_timing,
> +	.num_timings = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 152,
> +		.height = 91,
> +	},
> +	.delay = {
> +		.prepare = 10,
> +		.enable = 450,
> +		.disable = 200,
> +		.unprepare = 510,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> +};
> +
>   static const struct drm_display_mode innolux_g070y2_t02_mode = {
>   	.clock = 33333,
>   	.hdisplay = 800,
> @@ -4599,6 +4631,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "innolux,g070ace-l01",
>   		.data = &innolux_g070ace_l01,
> +	}, {
> +		.compatible = "innolux,g070ace-lh3",
> +		.data = &innolux_g070ace_lh3,
>   	}, {
>   		.compatible = "innolux,g070y2-l01",
>   		.data = &innolux_g070y2_l01,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
