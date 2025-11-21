Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E648C7A534
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 15:54:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAF4A10E069;
	Fri, 21 Nov 2025 14:54:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xE+lyu1l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 835DB10E0B0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 14:54:21 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-477b5e0323bso17372305e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 06:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763736860; x=1764341660; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=ETN4gl1iZbhJeLn6OCDI+9u79qwxOMAaoq4ImqB9HJI=;
 b=xE+lyu1lrrHHY2uQDFl7QFF5IDmMlzFGHa0BJ88f1oinUJ/wUpAcx5e8ev9qffOV26
 jmNq34jC6PX+3Mv2wqbtlrCG+p6Bpc9oQY+zd49clKBfdtYsYVUj/HHMJglnAKfIgmdk
 A0gUUpC4TNJiX8ZQ7yTZkvRXrENze7dPU89uNj/qHy6gWJzyevbioajfgDuSlpgqG82E
 jjrlbC/ddg3TYAWw877us3ykkcV34NNOh465wk5vQpIw79hWSwyOcrN1JuwC+x9M+ML5
 pvdp11XR0fvGXUFxsHFaKmSfUVe+16zZndjoyMh0U01mYtVGNCgXdrc2/PNz/H2NLsjT
 YGgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763736860; x=1764341660;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ETN4gl1iZbhJeLn6OCDI+9u79qwxOMAaoq4ImqB9HJI=;
 b=xFePNth5ToNTdkykY4KAqWlxQypgpXxt7cI2K09PcHR5JNLnJMe0QdzfdxMBmiSG6Q
 vV1m62vFA5TwuZC2oLQ5+fB2jsSL91aauXWO09uIt0fP0pau4pkD1xmVV+fCbAE+YaFA
 TffOUz0ShwGHrPWFtlzgNAsjn0BUYr2fEP71BPKj/YHQu+Ad/4G2AQWB1pT/fgZ6sALl
 EM+e7ScTmuQNN5wM06S7Jra5V9wUO5tNeVJq330ibuYYZTZxIvM4s/O1MZ66ZOHdSitQ
 SRgN/dxiPfPpPjhT01Ij4fSLeQ56mdWCIkO5AF9/rS1vl6gUrQAK3Bc6hxd3mBdpnzYK
 ihhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2KeZ7wgP5lgZHlqLpI5Iy3qdSFaU+mdwYYpmBK8G5gEJbc0cGq7vZurhLwXYqoA4Jx3zOgxsnqVI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwcfoSYqmyRFTnZ4Qrvc5mCkecjNyVxG1bnzvhyCESGO8xMDeeP
 ZGBsYYrF6fJd8/qRuI+WmeHK/ohx8N3XyK3F/JGBEuVXNNO42TkiQW8XXCE0c9YvuNU=
X-Gm-Gg: ASbGncsbOmDzyQG3MDb93VB2hHnkv532rNSNWg9OD9xmuXocObo2GWp7YcUW4cXwNwF
 D4HU5L5J3qqQHkUxbnJshCqFtM0BD3LNYh7freuyaWTeJkZ595A4qhHWM5xIrMnPpyhRGOTr2j8
 HOe2+J5t1LA9xIzWzHVdvDGtT04RySCpTUicIADWQQLvIXvMviWUoF2PQ2jdOFcsWGVZAo0JeHy
 WdX+pcTu0eo59jLilm9p7KYTXs2SGZ1cDFfM7JtcvADFpqFP+4KoiXi7LZbAwZk9tnNCG4Mmdkh
 7vBt+Xr+0HgN0zgkmvz/v/M8UFH2Yu3LNXt+4PPq5H0G/JrUOdo2e5ak04sK7Et35/idtt6KORD
 x9dy4LE7ViCxF3w2g78s0RbzBCtj7FO+WqYx9fCeXtfyn5InEIutdacgzIbYJ3LsfR7Ph5W5mG/
 9j/gEPsMWWHRY+dm2+omHsrqpi1o5cVOP3sm36e550F9G2+PNo4J6Vnf3BTVx7Jt8=
X-Google-Smtp-Source: AGHT+IEGzoj+G1XJyD7HRZUpDf/Nmo3R0LQETO+OA2bCF/axjJi8k5L8RSAIauSreqKt4GiwYJQXaA==
X-Received: by 2002:a05:600c:1d14:b0:477:9d88:2da6 with SMTP id
 5b1f17b1804b1-477c026ed62mr28503395e9.0.1763736859683; 
 Fri, 21 Nov 2025 06:54:19 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:159f:1839:bb92:1eca?
 ([2a01:e0a:3d9:2080:159f:1839:bb92:1eca])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7f3635bsm11604067f8f.17.2025.11.21.06.54.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Nov 2025 06:54:19 -0800 (PST)
Message-ID: <cd200f33-dd6f-4eb3-b2d9-8f41d0dde992@linaro.org>
Date: Fri, 21 Nov 2025 15:54:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v10 04/11] drm/bridge: aux: Add
 drm_aux_bridge_register_from_node()
To: Chaoyi Chen <kernel@airkyi.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Peter Chen <hzpeterchen@gmail.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, Dragan Simic <dsimic@manjaro.org>,
 Johan Jonker <jbx6244@gmail.com>, Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org
References: <20251120022343.250-1-kernel@airkyi.com>
 <20251120022343.250-5-kernel@airkyi.com>
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
In-Reply-To: <20251120022343.250-5-kernel@airkyi.com>
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

On 11/20/25 03:23, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> The drm_aux_bridge_register() uses the device->of_node as the
> bridge->of_node.
> 
> This patch adds drm_aux_bridge_register_from_node() to allow
> specifying the of_node corresponding to the bridge.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
>   drivers/gpu/drm/bridge/aux-bridge.c | 24 ++++++++++++++++++++++--
>   include/drm/bridge/aux-bridge.h     |  6 ++++++
>   2 files changed, 28 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/aux-bridge.c b/drivers/gpu/drm/bridge/aux-bridge.c
> index b3e4cdff61d6..52dff4601c2d 100644
> --- a/drivers/gpu/drm/bridge/aux-bridge.c
> +++ b/drivers/gpu/drm/bridge/aux-bridge.c
> @@ -35,6 +35,7 @@ static void drm_aux_bridge_unregister_adev(void *_adev)
>   /**
>    * drm_aux_bridge_register - Create a simple bridge device to link the chain
>    * @parent: device instance providing this bridge
> + * @np: device node pointer corresponding to this bridge instance
>    *
>    * Creates a simple DRM bridge that doesn't implement any drm_bridge
>    * operations. Such bridges merely fill a place in the bridge chain linking
> @@ -42,7 +43,7 @@ static void drm_aux_bridge_unregister_adev(void *_adev)
>    *
>    * Return: zero on success, negative error code on failure
>    */
> -int drm_aux_bridge_register(struct device *parent)
> +int drm_aux_bridge_register_from_node(struct device *parent, struct device_node *np)
>   {
>   	struct auxiliary_device *adev;
>   	int ret;
> @@ -62,7 +63,10 @@ int drm_aux_bridge_register(struct device *parent)
>   	adev->dev.parent = parent;
>   	adev->dev.release = drm_aux_bridge_release;
>   
> -	device_set_of_node_from_dev(&adev->dev, parent);
> +	if (np)
> +		device_set_node(&adev->dev, of_fwnode_handle(np));
> +	else
> +		device_set_of_node_from_dev(&adev->dev, parent);
>   
>   	ret = auxiliary_device_init(adev);
>   	if (ret) {
> @@ -80,6 +84,22 @@ int drm_aux_bridge_register(struct device *parent)
>   
>   	return devm_add_action_or_reset(parent, drm_aux_bridge_unregister_adev, adev);
>   }
> +EXPORT_SYMBOL_GPL(drm_aux_bridge_register_from_node);
> +
> +/**
> + * drm_aux_bridge_register - Create a simple bridge device to link the chain
> + * @parent: device instance providing this bridge
> + *
> + * Creates a simple DRM bridge that doesn't implement any drm_bridge
> + * operations. Such bridges merely fill a place in the bridge chain linking
> + * surrounding DRM bridges.
> + *
> + * Return: zero on success, negative error code on failure
> + */
> +int drm_aux_bridge_register(struct device *parent)
> +{
> +	return drm_aux_bridge_register_from_node(parent, NULL);
> +}
>   EXPORT_SYMBOL_GPL(drm_aux_bridge_register);
>   
>   struct drm_aux_bridge_data {
> diff --git a/include/drm/bridge/aux-bridge.h b/include/drm/bridge/aux-bridge.h
> index c2f5a855512f..7dd1f17a1354 100644
> --- a/include/drm/bridge/aux-bridge.h
> +++ b/include/drm/bridge/aux-bridge.h
> @@ -13,11 +13,17 @@ struct auxiliary_device;
>   
>   #if IS_ENABLED(CONFIG_DRM_AUX_BRIDGE)
>   int drm_aux_bridge_register(struct device *parent);
> +int drm_aux_bridge_register_from_node(struct device *parent, struct device_node *np);
>   #else
>   static inline int drm_aux_bridge_register(struct device *parent)
>   {
>   	return 0;
>   }
> +
> +static inline int drm_aux_bridge_register_from_node(struct device *parent, struct device_node *np)
> +{
> +	return 0;
> +}
>   #endif
>   
>   #if IS_ENABLED(CONFIG_DRM_AUX_HPD_BRIDGE)

Looks fine:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
