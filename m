Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E987CF4525
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 16:12:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF56E10E42E;
	Mon,  5 Jan 2026 15:11:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Zz0kop2A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A92710E42E
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 15:11:58 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4775e891b5eso53995e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jan 2026 07:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767625917; x=1768230717; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=ZICbs1ZKFUXAVw8Uv53chEaSv1izJm54XChd7BXTSFI=;
 b=Zz0kop2A8PMGsmawRq3pV1v8KL0RJtCiow5Aaeh5FkNJP02BTsDgPpMNBaD0r/1H6v
 wC71604BN80XZVSMg1CNv4w3VuOggbT7gYMhB2TJoFV70/nMXhlDUrLxLBGH5DEZFDzy
 EaAa4RrlD7RGVXR5GkM+xgD53TKpI90VDF+SGq0M9jsU5RHWSNh8DrQeIZ3E5ZC14jGB
 6zJiegBXzJFkAQtHvGZDDp3rAUnrfG6r1UJmMMsKG6dlsr1ugWQxF49iqQ0u3NDE0pHN
 c4bgbPuA71Zdz2fgis7ozplR6gXKVMHAwSSg5zwMg5X4/VFhxjO6kPmz40ryJcg3xvZS
 r1fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767625917; x=1768230717;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZICbs1ZKFUXAVw8Uv53chEaSv1izJm54XChd7BXTSFI=;
 b=IeBFRhZSctAYXzgSwBJnrgKx78zp7tHtj4tHT6HFCXfO4C4nmuO0JhhT71d/Ik8nkZ
 q1WsoZzZ/5Dzh9Y6HaZ0MbgO65n4YCw7tpM8MDMwQXRHvualjKwlN4Vu3ZhJ3svWJ9iv
 XMmqMdvVRfNKrQTyz4SngkqSQhFGF6rqSMPGnViExuBXoXeTniGie4mMYoeiLd+NyNb4
 Kr1nR5JkfdaR5od1st3hf5D/YdNn2kraqCttk5OSnJn+KBYrgGmO54ATC+AB3zp6oQCc
 sYv7D5Q4JHubdp7inOkwDtr1e1YU4oE5Ph91blWOJETIdIOjkspisWm+ynKa8y1vbeJa
 CWaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZ7f97qhXc+ZLCpTbiOr/jjTBiOn8gxFhNVwYKLo67cL4XMZeNOU4wsCk2MVVuqhMgy/5Om2XY8PI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyepVIMApyUHUS+jBVpG4O6U7iQ5NNDEqPQWqMChszNYHt8oIPf
 7mVsKDB+cHU6HYyLB0XdigaQfXuGrhXPfMyVHz1aHqQAL2C9DLjHtE+PLN5Y4n/2C14=
X-Gm-Gg: AY/fxX6IBOmAI4dLo4LUCwsAhbkcr9rBKF9FlyBAywxWnFckKBY1n46aWWH0dDMMGuo
 JCar0ajRnYNpJAE1QOD/ndphZ0ixFrEGHiy3WJ2FUkQBp0Q94aTgm0+Eyqo+CSOa/A1dka9ZPj8
 eiYk7nrphBz+7kvXdYYCZSPtjmZ03AM4wvOX1re62BiVt7dwVZiXXQAgOX4BQKsNGiJnClDvaHZ
 6Z0KANdXBl74euRed3ILmQws7LZX6IicF95h9JFXWkfIZGw8jhWjVWu6VymiDMUWZp7UI6OH096
 h88qh+h4hDf5lKGe6VEEME/PUcTVc/E6AWRRk0HaQmEKa+dHmakUe38WS10okAMwYqfH0HFWqAr
 FPezX0dL+A8ZKrtss6E8VM8uElseu36y0CSdewD1HRHpzQBDNxsRSUBSDQClC/prHi8xaU4qWfD
 7rrkcKlO8suYwEcuJT5wo2fdqpI6NEohexx7y4z/25kvXdMZBIPpE5aryA3JD57y0=
X-Google-Smtp-Source: AGHT+IHRLvC8RFN1wxpNMmjmLXPXlAzEc9S+ADXuomF/jWk/3+qxIvBtpEcUlQn4VBvzYM2OCRH1ZA==
X-Received: by 2002:a05:600c:154b:b0:477:55c9:c3ea with SMTP id
 5b1f17b1804b1-47d1958e7b9mr656916475e9.35.1767625916649; 
 Mon, 05 Jan 2026 07:11:56 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d4c1:5589:eadb:1033?
 ([2a01:e0a:3d9:2080:d4c1:5589:eadb:1033])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d6d13e2e0sm197844145e9.1.2026.01.05.07.11.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jan 2026 07:11:56 -0800 (PST)
Message-ID: <9fbeb95f-8f79-4983-857c-659566206835@linaro.org>
Date: Mon, 5 Jan 2026 16:11:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/4] drm/panel-edp: Move FriendlyELEC HD702E
To: Robin Murphy <robin.murphy@arm.com>, heiko@sntech.de,
 dianders@chromium.org, thierry.reding@gmail.com, sam@ravnborg.org
Cc: jesszhan0024@gmail.com, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <cover.1767111804.git.robin.murphy@arm.com>
 <027763b36fbad2005d09eeb289b7716c57f65e76.1767111809.git.robin.murphy@arm.com>
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
In-Reply-To: <027763b36fbad2005d09eeb289b7716c57f65e76.1767111809.git.robin.murphy@arm.com>
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

On 12/30/25 18:20, Robin Murphy wrote:
> FriendlyELEC's HD702E module is an eDP panel (in as much as it's some
> LVDS LCD behind a Chrontel CH7511B eDP bridge), so move its data over
> to the eDP driver, also resolving the warning about the missing bpc
> value in the process.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>   drivers/gpu/drm/panel/panel-edp.c    | 26 ++++++++++++++++++++++++++
>   drivers/gpu/drm/panel/panel-simple.c | 25 -------------------------
>   2 files changed, 26 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> index 415b894890ad..dd53ccc209ce 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1256,6 +1256,29 @@ static const struct panel_desc boe_nv140fhmn49 = {
>   	},
>   };
>   
> +static const struct drm_display_mode friendlyarm_hd702e_mode = {
> +	.clock		= 67185,
> +	.hdisplay	= 800,
> +	.hsync_start	= 800 + 20,
> +	.hsync_end	= 800 + 20 + 24,
> +	.htotal		= 800 + 20 + 24 + 20,
> +	.vdisplay	= 1280,
> +	.vsync_start	= 1280 + 4,
> +	.vsync_end	= 1280 + 4 + 8,
> +	.vtotal		= 1280 + 4 + 8 + 4,
> +	.flags		= DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> +};
> +
> +static const struct panel_desc friendlyarm_hd702e = {
> +	.modes = &friendlyarm_hd702e_mode,
> +	.num_modes = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width	= 94,
> +		.height	= 151,
> +	},
> +};
> +
>   static const struct drm_display_mode innolux_n116bca_ea1_mode = {
>   	.clock = 76420,
>   	.hdisplay = 1366,
> @@ -1663,6 +1686,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "boe,nv140fhmn49",
>   		.data = &boe_nv140fhmn49,
> +	}, {
> +		.compatible = "friendlyarm,hd702e",
> +		.data = &friendlyarm_hd702e,
>   	}, {
>   		.compatible = "innolux,n116bca-ea1",
>   		.data = &innolux_n116bca_ea1,
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index b26b682826bc..3ea52667b858 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2359,28 +2359,6 @@ static const struct panel_desc frida_frd350h54004 = {
>   	.connector_type = DRM_MODE_CONNECTOR_DPI,
>   };
>   
> -static const struct drm_display_mode friendlyarm_hd702e_mode = {
> -	.clock		= 67185,
> -	.hdisplay	= 800,
> -	.hsync_start	= 800 + 20,
> -	.hsync_end	= 800 + 20 + 24,
> -	.htotal		= 800 + 20 + 24 + 20,
> -	.vdisplay	= 1280,
> -	.vsync_start	= 1280 + 4,
> -	.vsync_end	= 1280 + 4 + 8,
> -	.vtotal		= 1280 + 4 + 8 + 4,
> -	.flags		= DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> -};
> -
> -static const struct panel_desc friendlyarm_hd702e = {
> -	.modes = &friendlyarm_hd702e_mode,
> -	.num_modes = 1,
> -	.size = {
> -		.width	= 94,
> -		.height	= 151,
> -	},
> -};
> -
>   static const struct drm_display_mode giantplus_gpg482739qs5_mode = {
>   	.clock = 9000,
>   	.hdisplay = 480,
> @@ -5235,9 +5213,6 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "frida,frd350h54004",
>   		.data = &frida_frd350h54004,
> -	}, {
> -		.compatible = "friendlyarm,hd702e",
> -		.data = &friendlyarm_hd702e,
>   	}, {
>   		.compatible = "giantplus,gpg482739qs5",
>   		.data = &giantplus_gpg482739qs5

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
