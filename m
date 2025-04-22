Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6748A96D32
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 15:42:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B49210E5AC;
	Tue, 22 Apr 2025 13:42:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="d2oEYvMi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6207510E5AE
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 13:42:30 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-39c266c1389so3859905f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 06:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745329345; x=1745934145; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=ezS+UKTt7FTkEKz3yncsIXnl8e/3huKHv0TQIvewvRs=;
 b=d2oEYvMiOqjXk785hvLvKonALMUugMmXU0mb8Wqb2bEUiv16SoXkO8CDBIJ/mDetGT
 LCN9Sm2XgQdCcOQsqw2zsrM4zsV+Gz09tkNp/ogTRXliXBD2BOVGX3rNPI0Q5MpyEOf4
 IAEkHMEY+HQQg31PcQm+V1OSmRqLgIDM5zQY3mkr8GYNoR5wCR2VdkgTnLq0CIG5Gldj
 9vqgYFcRS+glxV9P2ypg1kW7oXb4iWmJdgyFpEtdeNOzTgGw7uYNFqXMWgz4eTa2std2
 5X9sQkLCdOehnwmx2CYyZUlbKzR3VBpfP4KMLwvjt4L+OiNzurl0pSh/ojFWKJrnT/7e
 JFlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745329345; x=1745934145;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ezS+UKTt7FTkEKz3yncsIXnl8e/3huKHv0TQIvewvRs=;
 b=cQIqT4uHC42udGM1WRew3SpxqAv5a3+YVJdQ73V7a8ZiVffGQfoOgfz4ZSJdVHu7fj
 udi+n/uVhbVZGI/Ef5DrFbrUrn42KF8pykhJPFtjXNv0ZjDxx3mYpdxSyNvXj0a2Va3L
 E1MmSio39SZjvE01b+pWqg7NOBAk97LiBTK7EKrVCzy6CsVYPGbgSdOhl6brWQvYcLXm
 +60n0NsQbzz7O6rXxJOgVR8I5XVsCxq8+tthHUHtSr1nWCRaxAop1uhDAHrWSGh4TuQi
 htqy0lr957r3Epp9Yo3fvyreBpxrsk7Cmyy0Rv/ht1cXDZpWxzms3xsE4ncTLaFiGZXE
 FMcw==
X-Gm-Message-State: AOJu0Yyn0zm83SDd03A589BnUHjqRxpS4TcAUsm9Q8gqHwjnFBLB0qZe
 5TnnEVeu897J9O9WheQVbccHS4wLROEIWzyfURfd4mXFbtHhlH7IzIO6Lopv73g=
X-Gm-Gg: ASbGncvYg8niTncAnpWIXq/Y9ndw5TlzBorm+np5toz+hxPKaKIyQF7zfTWhNnVqltJ
 afGwK/zeiuDt6CFGzhEVibML6rmJu4Au/nshgRN+XLVnK5+eJV7K4Ryg9JAh9ESa1kOoGDZVlx/
 dL4Vm+VCBb37UDbGdkOZYhDJcESZSHfqQrE7BL9Ekb2lQ8AyjxzpwR0D6A0+TYStVmn+szE8CbP
 92BrF2gcQTTe/DwyudRTlYZEJwPpMwvQHGK4rYSQkYk3qIJUO0MOSBwk2cOKkHiBU9yE+n1+1DU
 Cf3RXnOvgWPYGaol8+4qOW5QwZptVItrD5tdrrlE0KIuYGdd4j6TZr1vhrlCndKdEBMgaZxG8xC
 TYJDsUQILAi2pUMQGWh3RvVf2KsTB
X-Google-Smtp-Source: AGHT+IGMN+4BR6nL0mLP35BbAdCor169ALVsN+fLM5/TOgtQG6DoOCuPZ5euVFxSFq1TllouoAEn+g==
X-Received: by 2002:a05:6000:186e:b0:39e:f9ca:4359 with SMTP id
 ffacd0b85a97d-39efba5c0e0mr11633936f8f.30.1745329345611; 
 Tue, 22 Apr 2025 06:42:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b137:7670:8eb9:746f?
 ([2a01:e0a:3d9:2080:b137:7670:8eb9:746f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa5a2300sm15093185f8f.101.2025.04.22.06.42.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 06:42:25 -0700 (PDT)
Message-ID: <feb106ef-b735-4b79-999e-0de033d82e3f@linaro.org>
Date: Tue, 22 Apr 2025 15:42:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/7] drm/bridge: analogic_dp: drop panel_is_modeset
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250401-panel-return-void-v1-0-93e1be33dc8d@oss.qualcomm.com>
 <20250401-panel-return-void-v1-3-93e1be33dc8d@oss.qualcomm.com>
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
In-Reply-To: <20250401-panel-return-void-v1-3-93e1be33dc8d@oss.qualcomm.com>
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

On 01/04/2025 07:11, Dmitry Baryshkov wrote:
> The dp->panel_is_modeset is now a write-only field. Drop it completely.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 11 +----------
>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |  1 -
>   2 files changed, 1 insertion(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 82dc4b01806f9728dc882b0128171838e81f21b0..704c6169116eb2601d2ad02dc7294455ceff5460 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -964,9 +964,7 @@ static int analogix_dp_disable_psr(struct analogix_dp_device *dp)
>    * is false, the panel will be unprepared.
>    *
>    * The function will disregard the current state
> - * of the panel and either prepare/unprepare the panel based on @prepare. Once
> - * it finishes, it will update dp->panel_is_modeset to reflect the current state
> - * of the panel.
> + * of the panel and either prepare/unprepare the panel based on @prepare.
>    */
>   static int analogix_dp_prepare_panel(struct analogix_dp_device *dp,
>   				     bool prepare)
> @@ -983,12 +981,6 @@ static int analogix_dp_prepare_panel(struct analogix_dp_device *dp,
>   	else
>   		ret = drm_panel_unprepare(dp->plat_data->panel);
>   
> -	if (ret)
> -		goto out;
> -
> -	dp->panel_is_modeset = prepare;
> -
> -out:
>   	mutex_unlock(&dp->panel_lock);
>   	return ret;
>   }
> @@ -1532,7 +1524,6 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
>   	dp->dpms_mode = DRM_MODE_DPMS_OFF;
>   
>   	mutex_init(&dp->panel_lock);
> -	dp->panel_is_modeset = false;
>   
>   	/*
>   	 * platform dp driver need containor_of the plat_data to get
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
> index 774d11574b095b093ddf2818ad5b84be6605c9bf..b679d5b71d276f458d905c936160f107225bc6c5 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
> @@ -170,7 +170,6 @@ struct analogix_dp_device {
>   	bool			psr_supported;
>   
>   	struct mutex		panel_lock;
> -	bool			panel_is_modeset;
>   
>   	struct analogix_dp_plat_data *plat_data;
>   };
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
