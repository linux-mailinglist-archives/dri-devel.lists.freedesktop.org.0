Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CAB9A5C1F
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 09:12:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1413A10E2D4;
	Mon, 21 Oct 2024 07:12:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wRM/3ATL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6342410E2D4
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 07:12:38 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4314c4cb752so43407925e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 00:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729494756; x=1730099556; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=Qcm1v2bTZyXU4vDGpi0B+UhZSQuP815LX7k5XuMY/5U=;
 b=wRM/3ATLyvEGdRpu84jfJ1WSDFtYeo175o2YYZLHgU+Mct0kXBODcCFPK0C/gQWhv1
 C4UiHhVoZAqpWCSjVE1abqZWy7/NcftBDR0AVcc7e4unKcNNtMrJSTg31hr42Zk9rJU/
 Vm8fCU4ffM8AFW4pe4PlmOv3eiWpFvE93wvN0SLunBYanLigBcwQclttW69kZia3LuKv
 6/7wyvKbyEBr+iTrcHQHSLChnEfhP55Fciom9uMrgqBMD1thk1CVrO6t3VRYfUPYwro9
 A3YraMiOe+YiyH0zLDBZfZF/exeRpi2Ycz+BH0S+IW3MgoZasx9Xfr/qRY1sEUz9VE9+
 GikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729494756; x=1730099556;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Qcm1v2bTZyXU4vDGpi0B+UhZSQuP815LX7k5XuMY/5U=;
 b=UP/NEYrT1enWMLChgecDIsxOovkka475l62UbIbwBxkIyamsaQw95CF6wicsw/YOJk
 smd8nm5B+TtYKOBXOppF1INruJ+5zScwb2oMvpW6AsCkY8/9lcfFGOUzX+h+ArGyu5/Z
 v/kji8PEdNP+BNb7FsS3a8ooJgQrSIhHZLalKA78whvht2sTuHptf5YtP3Jor3QfbQBO
 otS0SIWser4LFY3+jLw3x/x6cjGmVPwDm9NHV5TPSL0SbalxV6l/nZKy/wZbA1e/YfX6
 QybQtsTJ9POOHhplI0koxnMV8PSfzD+tA66q+uvmwDXXZFakbfZz2d4Tnv/UUxOGVIAz
 BLhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKOVEvk+AN/6Xyu/yAeBrfMB1+TESXziOgW9BI7tm7jGYVnk+pT0Qo/uTezeGfkM0Tz6D6ieMu8pE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5nlqF2rUSjMw/5pC6o5u6zfDANUs4d3NbRtK9uys2u7upkd9Y
 V8yIcPf9kMLtBBcI9LOo5ualem7Yr8a2drTNlKYNI2Xkb12COSKcw0zsw1rggXQ=
X-Google-Smtp-Source: AGHT+IGpl6JMnMrYtUkza0HWfuTecrkb9l67H3tR/tiZP3auPNJFcRmSnNiCcgftPVWXOFvAlvSm4A==
X-Received: by 2002:a05:600c:3b05:b0:42c:b5f1:44ff with SMTP id
 5b1f17b1804b1-43161686a4cmr87117595e9.24.1729494755999; 
 Mon, 21 Oct 2024 00:12:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:3908:dea6:2ddd:be97?
 ([2a01:e0a:982:cbb0:3908:dea6:2ddd:be97])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4316f5cbe7dsm46527555e9.39.2024.10.21.00.12.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Oct 2024 00:12:35 -0700 (PDT)
Message-ID: <87d7d767-2058-49e6-9f36-5a79d5b0b5b6@linaro.org>
Date: Mon, 21 Oct 2024 09:12:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] drm/bridge: Fix assignment of the of_node of the
 parent to aux bridge
To: Abel Vesa <abel.vesa@linaro.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Johan Hovold <johan@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20241018-drm-aux-bridge-mark-of-node-reused-v2-1-aeed1b445c7d@linaro.org>
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
In-Reply-To: <20241018-drm-aux-bridge-mark-of-node-reused-v2-1-aeed1b445c7d@linaro.org>
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

On 18/10/2024 14:49, Abel Vesa wrote:
> The assignment of the of_node to the aux bridge needs to mark the
> of_node as reused as well, otherwise resource providers like pinctrl will
> report a gpio as already requested by a different device when both pinconf
> and gpios property are present.
> Fix that by using the device_set_of_node_from_dev() helper instead.
> 
> Fixes: 6914968a0b52 ("drm/bridge: properly refcount DT nodes in aux bridge drivers")
> Cc: stable@vger.kernel.org      # 6.8
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
> Changes in v2:
> - Re-worded commit to be more explicit of what it fixes, as Johan suggested
> - Used device_set_of_node_from_dev() helper, as per Johan's suggestion
> - Added Fixes tag and cc'ed stable
> - Link to v1: https://lore.kernel.org/r/20241017-drm-aux-bridge-mark-of-node-reused-v1-1-7cd5702bb4f2@linaro.org
> ---
>   drivers/gpu/drm/bridge/aux-bridge.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/aux-bridge.c b/drivers/gpu/drm/bridge/aux-bridge.c
> index b29980f95379ec7af873ed6e0fb79a9abb663c7b..295e9d031e2dc86cbfd2a7350718fca181c99487 100644
> --- a/drivers/gpu/drm/bridge/aux-bridge.c
> +++ b/drivers/gpu/drm/bridge/aux-bridge.c
> @@ -58,9 +58,10 @@ int drm_aux_bridge_register(struct device *parent)
>   	adev->id = ret;
>   	adev->name = "aux_bridge";
>   	adev->dev.parent = parent;
> -	adev->dev.of_node = of_node_get(parent->of_node);
>   	adev->dev.release = drm_aux_bridge_release;
>   
> +	device_set_of_node_from_dev(&adev->dev, parent);
> +
>   	ret = auxiliary_device_init(adev);
>   	if (ret) {
>   		ida_free(&drm_aux_bridge_ida, adev->id);
> 
> ---
> base-commit: d61a00525464bfc5fe92c6ad713350988e492b88
> change-id: 20241017-drm-aux-bridge-mark-of-node-reused-5c2ee740ff19
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
