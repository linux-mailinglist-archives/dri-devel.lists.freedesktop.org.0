Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4246A2E90C
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 11:19:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3634910E163;
	Mon, 10 Feb 2025 10:19:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JjF+itWA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3EA310E163
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 10:19:21 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-38de17a5fc9so204596f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 02:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739182760; x=1739787560; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=lygczXscBdds42kuOhfdK3HCmBHDiuJxGTpAWzujpgg=;
 b=JjF+itWAqkKccsMXdXIcuTSlV/6CUcG4ldKZYVzgxzqX6uA4EtyGodIzE92DLUYieh
 ZhZrQzBEGNnqWUSzDgk0HQnLQb02BBXzVfNg2TJVrIerGfUmXPG/9rz7Y/Rf5Vgcz/ps
 2pFSMUC2B7yr110Zuu2+4Eak51E/BLPf/nG3umCGVcyN+0mq7fOQMSTZ7o3xlUBsOEHQ
 LjcIxunak0iQ6Z7qRCDPegrlATd5Ps18UAT8sT56+ceYvqLLO5iFd/3NqQBisuYZy5PX
 K4p3p0nTCFRwAuOpnsfZ4YrOLPnqLg7eUGxMwFUjJmXWjJgKYx2rKH5PxZJdEJh05vW8
 S+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739182760; x=1739787560;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=lygczXscBdds42kuOhfdK3HCmBHDiuJxGTpAWzujpgg=;
 b=vdmuCXLbnSVQeXpvhZagzaFyNMX8xyPrmA2tLIsz361sASF/+WbY2S7P+vLCOKOT1L
 li/TWIotiBJBCLP5R2TzLhj+JD7ty9+ZsJYXW+vt7FBHRQr9et5DBV6iRVRU2DE76T+G
 maM2ZaZAlmCkRg6jCta11CPJsjEW7mwMJqtEj2HnfCTkDzY7ta0/6bw7HDK0RGBevqoE
 6cYk63fNI9wogRg4W3av2VQPH6xwE/WiA0Mx0+MdMg47XylXXjEnE9ofcY2RoGMdmcTV
 m9Lq7+SNSIOpEeRjciA/zRuRrzN37odXVgMHoUyzEuevwruQG93nbIM4+rEjKgIpC21L
 OIpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8mYC1Hp7uHY1HjdT1jYXopsz9zIy2WDko+5pqN3OUADs7asU6B/s4391JmsNMv1pTplhBGAlqsHk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCoGFge5m9nG+xh2egyMHERgjsirCyjqPzaqgzT/JBdfDpKIDB
 v63qtLw0Vhdb2cPQle8R6LujgYF9cpgi2yO1UR84vDb6sL2ZWT5kQtjtL/e+SIY=
X-Gm-Gg: ASbGncvfgBCEiZ2Sws3nCzAw5H9acd0BXpfESGVuJ9i/33a3NuFah5bni0FmhS4qm0L
 rrCSLdON2NxLiokHRNj1dxtoKlQiv8Tl6AZY33o3VnDTIzsUrk576qzwM3kMZdzLaqdWl7iXL+t
 Q2IgMnZCyaEnmZ0mi9aFAifOIpEDubwSo9+/fBAee9A5/ThHvpaDgDLI2SXepA0df4K77Z3GNXW
 7+8+06QJOFOJR+o0A+kZtJg/a3qvH/oyZli1CqT9QTC2kM1pvV5nCB0vomRY8V1DyT9Zul8rxNM
 YS/8O21IUnwsIcW7hYt2C7O1Kwc65SqFjYTq4BtWknKSb7plLUFy3bhnUnVgHYOBIlyd
X-Google-Smtp-Source: AGHT+IEnVpgRQ2LjHlyiujStrpj1rxjCcw3y2pd31XsyUAtYtKo1EF3DT0hhoHct5fksdXd4XHBb6w==
X-Received: by 2002:a5d:64a1:0:b0:38d:e092:3ced with SMTP id
 ffacd0b85a97d-38de0923ea3mr1498901f8f.7.1739182760083; 
 Mon, 10 Feb 2025 02:19:20 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:8235:1ea0:1a75:c4d5?
 ([2a01:e0a:982:cbb0:8235:1ea0:1a75:c4d5])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dcb55b7a5sm9112015f8f.14.2025.02.10.02.19.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 02:19:19 -0800 (PST)
Message-ID: <e3402108-54a5-4dd5-970b-e3b416f87979@linaro.org>
Date: Mon, 10 Feb 2025 11:19:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] drm/bridge: dw-hdmi: Sync comment block with actual
 bus formats order
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250204-dw-hdmi-bus-fmt-order-v2-1-d0aaeb7a697a@collabora.com>
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
In-Reply-To: <20250204-dw-hdmi-bus-fmt-order-v2-1-d0aaeb7a697a@collabora.com>
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

On 04/02/2025 18:44, Cristian Ciocaltea wrote:
> Commit d3d6b1bf85ae ("drm: bridge: dw_hdmi: fix preference of RGB modes
> over YUV420") changed the order of the output bus formats, but missed to
> update accordingly the "Possible output formats" comment section above
> dw_hdmi_bridge_atomic_get_output_bus_fmts().
> 
> Fix the misleading comment block and a context related typo.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
> Changes in v2:
> - Reverted the changes related to "Default 8bit RGB fallback" (Neil)
> - Updated slightly the commit subject and description
> - Link to v1: https://lore.kernel.org/r/20241130-dw-hdmi-bus-fmt-order-v1-1-510b5fb6b990@collabora.com
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 996733ed2c004c83a989cb8da54d8b630d9f2c02..d1256c82de96a43211af64ad70848cd18d5044e5 100644
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
> 
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20241130-dw-hdmi-bus-fmt-order-7f6db5db2f0a
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
