Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FBAAE404A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 14:31:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F84B10E381;
	Mon, 23 Jun 2025 12:31:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tGcVvDmM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDCDD10E381
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 12:31:21 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-3a50fc7ac4dso2242052f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 05:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750681880; x=1751286680; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=qoE9tAaWc9b9sN9LvIzsMZa1+Hj5pdYfOB30Om4GhJw=;
 b=tGcVvDmMFNiyVX2Z4UBAKkxPrg7FVMR2bROdW5qztx9SJrOXq2l0gWf8WZh8jwOeRA
 5VoyTv7MBrflg64qeqBLnkzJxw4Z/U1ywBpY+EB9fGY/DRgEhzdgHLh6TKtD571+mQTG
 RjobUFPwHed94yWzuWxo6rGBT83cTjC+FC3+UyC0t+3FcGZy0muRzp62r/5IUG1WArM0
 l5ebvFsjxvU94PMBE4BzOSan+RS5NIQskCZg/hTj4ampGk3o02bhWaTcvkTznUEvoGPl
 2U2KQp0TMUlMcVRSXc/mJZjuTadxhF18mSvH93oHRyd2DjMoiOciCLIc95VSAdrjeac5
 SgYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750681880; x=1751286680;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=qoE9tAaWc9b9sN9LvIzsMZa1+Hj5pdYfOB30Om4GhJw=;
 b=WuYLMZ8xkQWfc1jaDnFbwB6LKdX67OVEbCHJ/rKcs8SxeMlTgW13ottXbH1RTQqm+z
 nQLr1plIawWXwzFrjaT7AtRN9KnX4y5Ir9CmbZ2Z2fuRQBE73VqnJyXmWDpndTc2o6i0
 GsKp+aGTdgJPsd/uUbnLVG6J0R+OThxFJ929LZkTOxQ1KsfStPhXxs5YJIWJMbl7UGU9
 GVk7jXXfrK79K/ri9ofQJky+kEIoacnMO58YOkJTNcz+vt/H+sjWSIGd6T9CqY3qc/Ym
 G5zw3pgqazSzhxX3i8e9WqX2nz1b6NijzseH45a0L6EDnOOz/Bc9VTgFKk6pHsFgVJ/5
 R1Cg==
X-Gm-Message-State: AOJu0Yynv1ppwI+ngNflBuvlHAt8XPep+hrK3QWacWkCoPihBXiplZk0
 8rznX4hLSMMAjbU3E/U5uYvpMDXg9YD2t9VvCVZjBBwoZ9aDebmoH+uuUivSGAoHpo8=
X-Gm-Gg: ASbGncuI8ZL9Ij5tc2KxW03pyNuqku4+R2TkJ90GA/qnuCfbOqCHbZITCxHEeQYih3t
 FADI6FI4d893Z+1Z/x7QIPNzaYYow90WY+y8oWUPwwKVQvQZ5TI5WhtmcPt636PAs4tkuuQ5jRF
 ZCnA6LThTQQktIHb7sOJhFxGWsK2bwBTfFwDk4DLCdjmDUlUwN6wec5vtUClBRJ2AainQCWVgWz
 5LU/LF+BtuNz4xziuZLn7RrBTmw4YzaL0RXdzIP3ys94uZ3lOHIOOWi6AUdpvG3tm2jfNXr+St6
 1mAI8GHXpN8BUUDq9zxcjWLAPOIHVU570UGDaDFVfMmQDHrB7nyFZBrVekvEoayKGE1ZvDcvPko
 gAFa8LCtvM5YVU9419SFHh9OKzrnLhO0PWcZY9xs=
X-Google-Smtp-Source: AGHT+IGrnHR5HjuNNGYN2h4NQHfR9oLkgLDNygJjRDuk6P9puAV/nK1lNVJbr/+wKFuw9QwtD+0/Zg==
X-Received: by 2002:a05:6000:3ca:b0:3a4:fa6a:9189 with SMTP id
 ffacd0b85a97d-3a6d1322bb1mr10321158f8f.31.1750681880283; 
 Mon, 23 Jun 2025 05:31:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:8c08:7c51:bbb1:5a2d?
 ([2a01:e0a:3d9:2080:8c08:7c51:bbb1:5a2d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a6d0f18207sm9432462f8f.30.2025.06.23.05.31.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jun 2025 05:31:19 -0700 (PDT)
Message-ID: <0c99fe5c-f908-4d78-acb3-d6bc128c9f26@linaro.org>
Date: Mon, 23 Jun 2025 14:31:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/bridge: aux-hpd-bridge: fix assignment of the of_node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250608-fix-aud-hpd-bridge-v1-1-4641a6f8e381@oss.qualcomm.com>
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
In-Reply-To: <20250608-fix-aud-hpd-bridge-v1-1-4641a6f8e381@oss.qualcomm.com>
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

On 08/06/2025 17:52, Dmitry Baryshkov wrote:
> Perform fix similar to the one in the commit 85e444a68126 ("drm/bridge:
> Fix assignment of the of_node of the parent to aux bridge").
> 
> The assignment of the of_node to the aux HPD bridge needs to mark the
> of_node as reused, otherwise driver core will attempt to bind resources
> like pinctrl, which is going to fail as corresponding pins are already
> marked as used by the parent device.
> Fix that by using the device_set_of_node_from_dev() helper instead of
> assigning it directly.
> 
> Fixes: e560518a6c2e ("drm/bridge: implement generic DP HPD bridge")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/bridge/aux-hpd-bridge.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
> index b3f588b71a7d7ad5c2ee7b07c39079bc5ba34cee..af6f79793407f400b57f945fc958d613155417ea 100644
> --- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
> +++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
> @@ -64,10 +64,11 @@ struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent, str
>   	adev->id = ret;
>   	adev->name = "dp_hpd_bridge";
>   	adev->dev.parent = parent;
> -	adev->dev.of_node = of_node_get(parent->of_node);
>   	adev->dev.release = drm_aux_hpd_bridge_release;
>   	adev->dev.platform_data = of_node_get(np);
>   
> +	device_set_of_node_from_dev(&adev->dev, parent);
> +
>   	ret = auxiliary_device_init(adev);
>   	if (ret) {
>   		of_node_put(adev->dev.platform_data);
> 
> ---
> base-commit: 4f27f06ec12190c7c62c722e99ab6243dea81a94
> change-id: 20250608-fix-aud-hpd-bridge-97ec55341c4c
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
