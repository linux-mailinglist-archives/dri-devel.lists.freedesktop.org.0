Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FE09A60C5
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 11:56:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A64B910E46F;
	Mon, 21 Oct 2024 09:55:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="piORkM6t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D8F410E46F
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 09:55:58 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4315df7b43fso41616205e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 02:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729504557; x=1730109357; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Ly9QzvkDQwHbhqCl2zYl2fNRI7r46h78qQTGBELbePs=;
 b=piORkM6tibGAfQQDJId62+W8Di4q9iciIMuin6yCVpUtstD7pFedMgDNTl+qKJvMc/
 M0Z7aRPyK+6+2U/zeI2bvgQLaMS4fiYklfptpUuObYPc8Ace1jCq9Vflch7gfpUwpk+Y
 YRDFzupaAlAJyilkoCID16dg+Gc+FGZzCDDURBRZw94h74z1GPEQQ8OGLpGvscqtea2E
 BzwdQBzZJr89DS8+Z5TwOikNqJp12FFkfIpEZk3UYzEGW9Xe4Up1sKlpl6EyB5z/YHHx
 PpHwZ0hO7gZRirVqtZtO8JIARi8ua31u1BBaxtRcXaBr9qFvKtlgXRI3VlxDkgoS4qM6
 Zb8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729504557; x=1730109357;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ly9QzvkDQwHbhqCl2zYl2fNRI7r46h78qQTGBELbePs=;
 b=UhhiI4Sf1H78aVxbXUR5sdPSLC6TjRgGqtJ6RcCmfOx1CFnIaNgRsMFmjZC2qHUHy6
 O2YuuBaAGiPs4l636Mh80i3UdunQa7+bX1P5pf90arJwTnOati8DniuAfpSGLZzZuhZS
 lc0l/a7L+mM1jsReDpQjbS+p/7eaSe14H/VQ59zDcFd0bqDDat0tLlS7u1JQJRMviw58
 j0b9IebGS1zIJD8OdH6achmWIfHCP31f2TUrCV+Z/RuPXxUV801YssKtHds7mAkwPWab
 RFm8d23i7glgCiKuzxQJhs1f6twUm1deCKZwL/nTMWDP0tkfMVLgVQNq6p0VLbGcyTR1
 Cyfw==
X-Gm-Message-State: AOJu0YyQmIMCgZTkt38MGeTJUPFKUt/ZZBXr1hFgJ679ZJe4zkVP4wSZ
 KSnDMYqhRG86PMDbFMDek2qlk9bTQUc9QX/Hlyzpl5E68gNv/6jj2Ab2Kh6YhUw=
X-Google-Smtp-Source: AGHT+IGObxU10ZGfZ87Oq/bHgK2wd5Q6KMGknCnnY1ElFcpU0HfA1xR2NwKT5e6iZbBblacYId1lVw==
X-Received: by 2002:a05:600c:1e28:b0:42c:b750:1a1e with SMTP id
 5b1f17b1804b1-431615991f4mr85416045e9.0.1729504556750; 
 Mon, 21 Oct 2024 02:55:56 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:3908:dea6:2ddd:be97?
 ([2a01:e0a:982:cbb0:3908:dea6:2ddd:be97])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4316f57ba0bsm51558885e9.15.2024.10.21.02.55.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Oct 2024 02:55:56 -0700 (PDT)
Message-ID: <a19cae79-b50b-4faf-a81d-39e00d563053@linaro.org>
Date: Mon, 21 Oct 2024 11:55:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/6] drm/display: bridge_connector: handle
 ycbcr_420_allowed
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20241019-bridge-yuv420-v1-0-d74efac9e4e6@linaro.org>
 <20241019-bridge-yuv420-v1-1-d74efac9e4e6@linaro.org>
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
In-Reply-To: <20241019-bridge-yuv420-v1-1-d74efac9e4e6@linaro.org>
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

On 18/10/2024 23:49, Dmitry Baryshkov wrote:
> Follow the interlace_allowed example and calculate drm_connector's
> ycbcr_420_allowed flag as AND of all drm_bridge's ycbcr_420_allowed
> flags in a chain. This is one of the gaps between several
> bridge-specific connector implementations and drm_bridge_connector.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/display/drm_bridge_connector.c | 6 ++++--
>   include/drm/drm_bridge.h                       | 5 +++++
>   2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> index 3da5b8bf8259..320c297008aa 100644
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> @@ -397,11 +397,11 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>   	bridge_connector->encoder = encoder;
>   
>   	/*
> -	 * TODO: Handle doublescan_allowed, stereo_allowed and
> -	 * ycbcr_420_allowed.
> +	 * TODO: Handle doublescan_allowed and stereo_allowed.
>   	 */
>   	connector = &bridge_connector->base;
>   	connector->interlace_allowed = true;
> +	connector->ycbcr_420_allowed = true;
>   
>   	/*
>   	 * Initialise connector status handling. First locate the furthest
> @@ -414,6 +414,8 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>   	drm_for_each_bridge_in_chain(encoder, bridge) {
>   		if (!bridge->interlace_allowed)
>   			connector->interlace_allowed = false;
> +		if (!bridge->ycbcr_420_allowed)
> +			connector->ycbcr_420_allowed = false;
>   
>   		if (bridge->ops & DRM_BRIDGE_OP_EDID)
>   			bridge_connector->bridge_edid = bridge;
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 75019d16be64..e8d735b7f6a4 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -802,6 +802,11 @@ struct drm_bridge {
>   	 * modes.
>   	 */
>   	bool interlace_allowed;
> +	/**
> +	 * @ycbcr_420_allowed: Indicate that the bridge can handle YCbCr 420
> +	 * output.
> +	 */
> +	bool ycbcr_420_allowed;
>   	/**
>   	 * @pre_enable_prev_first: The bridge requires that the prev
>   	 * bridge @pre_enable function is called before its @pre_enable,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
