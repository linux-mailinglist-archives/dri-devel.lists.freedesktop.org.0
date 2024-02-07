Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B66E484C6FF
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 10:13:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F025E10EBF9;
	Wed,  7 Feb 2024 09:13:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uRprtrsY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 456FF11317F
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 09:13:32 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5114b2b3b73so421872e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Feb 2024 01:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707297211; x=1707902011; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=N4boiLkEy1/DFsAyyQnQqltI77jo7vrHFr3VsLB2XPg=;
 b=uRprtrsY6q7IWpn7skyGytSirL/vRYXX+3HtqquN+ug5X5v3U0/rLPax2le6iyQhaZ
 Ia0k8ErAeOXvFBzUTuVIx99F/QgTJ79R/QVlvTt571+wRR3vx0EEApUFYLiTPFj5cN2n
 YA5BBDW4PwB9ELWJSB9YRPiQ2kaXDK6HZrmhTfwZwm0KRreQ6AybQ3ErfebRzABndNZC
 5pgGbm7Bi/IcACseIieJFgifDjSGpRynhaTtabVwrC8SJYHp0WO3CLyPFseN+38iPhOz
 bZui+vku9YtbuO9BO0HX9LXuY03w3qkXjfT8aMFby3NeKW0acJb9LEYWeeIrrLfqk+jU
 BXxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707297211; x=1707902011;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=N4boiLkEy1/DFsAyyQnQqltI77jo7vrHFr3VsLB2XPg=;
 b=FvGozcb5pbEH6yjBPrCHeICURqiyryg7zZ3ifoc/2e3i3rZPhV6idNCsD1oYkp5eQx
 CzF9YNaF2FFWjBJmsnc81h0q4YtsRnYjd+OWD0Om83HR1kGKliLYMCUPsd6YXqA+tZdO
 a85f6ojrMk0TUtz7kXiXBhQ3RSQNoE76MfowqFFeZC93RXprXhwxj5ZalmsBBCTDpdo+
 UYOhrdDGX/t0r0zugeuNhI/Z4GtjGsKIw0ymkwqsUMVJ1/+9QYnSvdI4+6e6nrzeAnzs
 HegHbY9Rj3K4HH1bUanHNU5Onx3um6NhdbEHk3JTP6+mVo9f7Xek4S0Qtn4XidaVM3Q1
 c79g==
X-Gm-Message-State: AOJu0Ywu0D7zm+bWl0/h5YmIPooGCDDj7RcuJNd5mdA6iAdnBn8KiPjD
 vlaqW+nbGyz7FFwBmCfueIAW1luB9ZnFKLaWkM6z1sJLQfIPKPUoapVGHBZeQN0=
X-Google-Smtp-Source: AGHT+IEuKbF7eBlriHKPLcwyu5r6eScSFaoKyMjxw2EWKwCxQk1uz0UMi4uXx8ofme0Ll3/2mFimkQ==
X-Received: by 2002:a05:6512:31ce:b0:511:619b:7257 with SMTP id
 j14-20020a05651231ce00b00511619b7257mr3066369lfe.53.1707297210825; 
 Wed, 07 Feb 2024 01:13:30 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV1h55aFk4ssgTouARzpzOg8iRxKm8VcexMbk+pLi1qK7rx1tOgj4fNft8e5da46EZzV1Uvf5kXOTYY9B4XRhnM9Esc4NYJ/uJjaTcXpgrLQTiNGtwKq/oJAC/H4qqwPYNShN4fRv4Nmsqszbm+Ny+el+oX75fmR4oFqYvhQSJkxZ5BEpYGS07GnJPvBDtsEtXlVxH7Yqg8txxQ8A1NMWkyZ8XClfrk1La+R1bMUCLPN9hlbAKvsqiTNL/GnUPwOwEcKAs8kGXaFpp2e9u2r7YZImnZ0To9MMhFUcIuWVhFFF465lm014+Hd2/P+IzVNBL13cqrw1oHAvfK4U2VdbDOSYLQQBqiItVB5oSoAmL9HevxT8yu/FMhK5AAt/vrhDvnqtUpwYAfVyiZuJvAAfYG4MI/lqgSllmXOGNwIIg6EMqcYBQQgL7KUJ5hrmtUdwkAR/y3rzsuBPids6LyUqKYqHQOT7tUH6WVd2er09ol7sZLsHkbfj/a0GUtYCE2aMl/PCC7DZqLmzrC/G2BicoeNKJSFoR1z9IIIjKgzJxuTdFA+CvBNIOvdLCHNjvQQU9A5w+82UeLMDkyOu8KPS6UR+HGWTsEkDHzq+1kynIlBJTvrR/t0tRwHq54R3jXDuvxjGOzQec/w9YkxtfPOhLPARonyiBgD31uhNQXymwh/bSH5oXP6eoz6JWVh6Lvb6pyKSMgK4cHtER3yMiqdtV7uLIXs93iJEclefaJ2VJe0p+qSjZpwjtcl9nR7y0=
Received: from ?IPV6:2a01:e0a:982:cbb0:5ae7:7fdb:32ad:f6d7?
 ([2a01:e0a:982:cbb0:5ae7:7fdb:32ad:f6d7])
 by smtp.gmail.com with ESMTPSA id
 fc16-20020a05600c525000b0040feb8c71a0sm3809215wmb.13.2024.02.07.01.13.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 01:13:30 -0800 (PST)
Message-ID: <b56d11ce-869f-4183-bb26-f0261af356a6@linaro.org>
Date: Wed, 7 Feb 2024 10:13:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/bridge: imx8mp-hdmi-pvi: Fix build warnings
Content-Language: en-US, fr
To: Adam Ford <aford173@gmail.com>, dri-devel@lists.freedesktop.org
Cc: nathan@kernel.org, kernel test robot <lkp@intel.com>,
 Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Lucas Stach <l.stach@pengutronix.de>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240207002305.618499-1-aford173@gmail.com>
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
Organization: Linaro Developer Services
In-Reply-To: <20240207002305.618499-1-aford173@gmail.com>
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

On 07/02/2024 01:23, Adam Ford wrote:
> Two separate build warnings were reported.  One from an
> uninitialized variable, and the other from returning 0
> instead of NULL from a pointer.
> 
> Fixes: 059c53e877ca ("drm/bridge: imx: add driver for HDMI TX Parallel Video Interface")
> Reported-by: nathan@kernel.org
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202402062134.a6CqAt3s-lkp@intel.com/
> Signed-off-by: Adam Ford <aford173@gmail.com>
> 
> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
> index a76b7669fe8a..f2a09c879e3d 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
> @@ -57,7 +57,7 @@ static void imx8mp_hdmi_pvi_bridge_enable(struct drm_bridge *bridge,
>   	const struct drm_display_mode *mode;
>   	struct drm_crtc_state *crtc_state;
>   	struct drm_connector *connector;
> -	u32 bus_flags, val;
> +	u32 bus_flags = 0, val;
>   
>   	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
>   	conn_state = drm_atomic_get_new_connector_state(state, connector);
> @@ -110,7 +110,7 @@ imx8mp_hdmi_pvi_bridge_get_input_bus_fmts(struct drm_bridge *bridge,
>   	struct drm_bridge_state *next_state;
>   
>   	if (!next_bridge->funcs->atomic_get_input_bus_fmts)
> -		return 0;
> +		return NULL;
>   
>   	next_state = drm_atomic_get_new_bridge_state(crtc_state->state,
>   						     next_bridge);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
