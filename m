Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD759E0760
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 16:45:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54EC410E7AF;
	Mon,  2 Dec 2024 15:45:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iqrwOj2O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AB6E10E7AF
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 15:45:23 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-385ef8b64b3so1177427f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2024 07:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733154321; x=1733759121; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=PsAlaAuDi0Tk+rbL8JjCncmrpcl4/d9qDg5WbOHlB9w=;
 b=iqrwOj2OL4Rx2LDtw337HtgOrNxwNLCFC/V2nV3JQneoDmU2dqpcrocZ5LcJk92z1u
 AQQKqduOQSvvEY9jIzHBTMp0daSXLdUXoLLYE+BmdUNDiXZK3vugK4V3WQmfSZqdz8t1
 0mL1I7KkwEnUPkRAT1t5pVQWLEFf5THKK6aX6mXVU9eUNElo4mm7BEGYSkjB2FOz8QKp
 9H1P/XVzEI+AEt/dDgQH6CUZs5hcQ6BtdCVwWbNzWx+oeySiizLD5tTKMaUhxPvFRnzd
 PH3pvWTVF+G90BTHawRiOPtLp3WaVOcLjXOMYXYvuOTAK9w91EOt8slhfSM40DKS8Zl6
 Olfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733154321; x=1733759121;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=PsAlaAuDi0Tk+rbL8JjCncmrpcl4/d9qDg5WbOHlB9w=;
 b=TE40wBsGnGydac4B4E4rGGnP7+Mvp/QzIB98AVhTMvmGkvpOQfk9RLn/XOVPPeDKMO
 0gNVVAa9zb59Y5haxs5r5WlAS+uudzN6hY+mjrEpw+Mf8cNuNSW383Nrp0cdfkyZ5cZA
 u66ggwyqEH6xcAj1CCNPWUtW4qnYkOle6Zr0QZPTqT55fs5gLqPmBP4LSrgRXgZ61V24
 f8LltHLdcc/Mi/o1PD24rkXb5YAwBMKvc0/rSHI4HhZSA4QVu3WSHClDwqe2vYLI5RuR
 jWzAbB/60WJmCRz/NWbWX+15emnUl4qUsLAzmUqcT5PM7OOADolWfn+L6Rw0Mzvo56Zs
 Rd+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbH21QVr/Kxb66AlPzhGOSaZPgsshAqAFFmtez0i226eHWXXBfFt/3InM0b2W9Pmq7IqzX1aqaLKY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzF2zC7oOanaw8UAZG+fix+FtgVRYtyjkAxrwR0CHXABUx0//KE
 so1b+8a9yGDwNURMNooIIxKQDccwPD+Tc0Xwvnq2p8zhvFT0XZt3uFHoEJdl2LY=
X-Gm-Gg: ASbGnct/mQP4Q25HtkkgIWRCOH4OqiMS/ScApSg3EGD2QSvk+hKQntyy1sdy0Mpk+dP
 rh3fxMXlP1vju/JuTWfKi4Dj22KQR+IfeizV3BEfz6Lt6D21raU9EmLf7BCboRCB6PUwpFO9X0b
 +z1tGqtRx5DlMZKyfrMfDxti0UZSZNuvmRLKnlQHgjc79xBA4s6JsGLeBqWPn3fkLLJktkAnJXG
 RJepLGmbtQE6yCJpdNItMNtZMo8ic2YWjZAY0yVFYrRQspVRhsT+nA1ZYCEoniXQ1OUskwHRVJN
 1l/wS5bjv+jKqp2LkjFCL205WRM=
X-Google-Smtp-Source: AGHT+IHY/ZJesNDq8WcklgakuUkeQQ8aCpaHvI3UaYQnhebJTHXO8tn+nJwIo6alJ7oxVdeVNOzNMA==
X-Received: by 2002:a05:6000:18a5:b0:385:df87:28de with SMTP id
 ffacd0b85a97d-385df8729admr12349605f8f.56.1733154321520; 
 Mon, 02 Dec 2024 07:45:21 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:1485:2a78:787c:c669?
 ([2a01:e0a:982:cbb0:1485:2a78:787c:c669])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434aa74edb1sm191473505e9.3.2024.12.02.07.45.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2024 07:45:20 -0800 (PST)
Message-ID: <5bbd44dc-cbe8-4906-afa2-6866f5d39341@linaro.org>
Date: Mon, 2 Dec 2024 16:45:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/bridge: dw-hdmi: Sync comments with actual bus
 formats order
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20241130-dw-hdmi-bus-fmt-order-v1-1-510b5fb6b990@collabora.com>
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
In-Reply-To: <20241130-dw-hdmi-bus-fmt-order-v1-1-510b5fb6b990@collabora.com>
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

Hi,

On 30/11/2024 00:04, Cristian Ciocaltea wrote:
> Commit d3d6b1bf85ae ("drm: bridge: dw_hdmi: fix preference of RGB modes
> over YUV420") changed the order of the output bus formats, but missed to
> update accordingly the affected comment blocks related to
> dw_hdmi_bridge_atomic_get_output_bus_fmts().
> 
> Fix the misleading comments and a context related typo.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 996733ed2c004c83a989cb8da54d8b630d9f2c02..d76aede757175d7ad5873c5d7623abf2d12da73c 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2621,6 +2621,7 @@ static int dw_hdmi_connector_create(struct dw_hdmi *hdmi)
>    * - MEDIA_BUS_FMT_UYYVYY12_0_5X36,
>    * - MEDIA_BUS_FMT_UYYVYY10_0_5X30,
>    * - MEDIA_BUS_FMT_UYYVYY8_0_5X24,
> + * - MEDIA_BUS_FMT_RGB888_1X24,
>    * - MEDIA_BUS_FMT_YUV16_1X48,
>    * - MEDIA_BUS_FMT_RGB161616_1X48,
>    * - MEDIA_BUS_FMT_UYVY12_1X24,
> @@ -2631,7 +2632,6 @@ static int dw_hdmi_connector_create(struct dw_hdmi *hdmi)
>    * - MEDIA_BUS_FMT_RGB101010_1X30,
>    * - MEDIA_BUS_FMT_UYVY8_1X16,
>    * - MEDIA_BUS_FMT_YUV8_1X24,
> - * - MEDIA_BUS_FMT_RGB888_1X24,
>    */
>   
>   /* Can return a maximum of 11 possible output formats for a mode/connector */
> @@ -2669,7 +2669,7 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
>   	}
>   
>   	/*
> -	 * If the current mode enforces 4:2:0, force the output but format
> +	 * If the current mode enforces 4:2:0, force the output bus format
>   	 * to 4:2:0 and do not add the YUV422/444/RGB formats
>   	 */
>   	if (conn->ycbcr_420_allowed &&
> @@ -2698,14 +2698,14 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
>   		}
>   	}
>   
> +	/* Default 8bit RGB fallback */
> +	output_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;

Why did you move this ? the following comment mentions it

> +
>   	/*
>   	 * Order bus formats from 16bit to 8bit and from YUV422 to RGB
> -	 * if supported. In any case the default RGB888 format is added
> +	 * if supported.
>   	 */
>   
> -	/* Default 8bit RGB fallback */
> -	output_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
> -
>   	if (max_bpc >= 16 && info->bpc == 16) {
>   		if (info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
>   			output_fmts[i++] = MEDIA_BUS_FMT_YUV16_1X48;
> 
> ---
> base-commit: f486c8aa16b8172f63bddc70116a0c897a7f3f02
> change-id: 20241130-dw-hdmi-bus-fmt-order-7f6db5db2f0a
> 

