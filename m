Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56522D080A3
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 10:01:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BC3B10E85F;
	Fri,  9 Jan 2026 09:01:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hUPh0+3F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB2510E85F
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 09:01:41 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-432755545fcso2297963f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 01:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767949300; x=1768554100; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=8WuHkPQ/ZNVs7iHn7tautZKmtUifIMbxbjS7ZdvUw2Q=;
 b=hUPh0+3F9NJmX6328DZP93AYiLL3mxgGLingimx3QFMHgV7bxQTE3CmzW60pQTqUuw
 L5Qmu9HtrxDNyNTnpCGzlCc0vu4dvmasJ1kD53m8W9F0tTeuNtjF3eyQfBrr+c/XJjfb
 RRydzqz4IhJPtnIXvu3Mu2eZrWF+/0VbQ21LCV2uEEO0NbvFMaMNZ17Jd1NOgH5EYgGk
 0HTPuisbPUB6X8wRv7lDI3L0VJHaP0rIHv4mGZQY2HkpabsRVmT28Zovr7PEdCsKlAn5
 w6hHXy2AgkqG4mweBYeaZbTg3nuE67v6o7NK+bnHCK8RJ2aS/0/mpQ3dAOyd60Bcslzj
 FUSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767949300; x=1768554100;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8WuHkPQ/ZNVs7iHn7tautZKmtUifIMbxbjS7ZdvUw2Q=;
 b=kEmNgcm5MhXvQ4QWaUofUH/SKp5j1v3/qXt/pJ9Fv9s80ucd2HA0Fzhg5x8c+cv8Mg
 y2sD5u9tPb+MzipOsVrZCucp7nLsdyO6tVC+wkGzt37gBWZyk7SdVv+IbjSvGxjDKunP
 At7K6pKjMvY7XaQROqv+Fc49B3NKS9i5un35eesi5bBVy8ORHkSz1ySFKVI9aJmwlmhu
 NTxmlppGPmCXmeO/+AdBeCzfwrjablCfOrmGFMOCGMEB0gy3Bkk6M8kkJt6K5UclBnop
 6UvYWJEue1PZE0DR4xjSsZl1IG/aj/XxW3xp76ZAqmsTTot3iQdo8LYDfEDycOF8A3qe
 JcXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUswe5sxekkI9BUneG9P33BbOtSjibyeuBWyT4h8U3z44PWYxoBXLzGXkpwOpZM1vCh2nUV6Q3wRJY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxC4ldGpMaLuqJpThJ+eDEnl483VKT92cpqni0xnD+79CbCHHIu
 C7VrRHAxxn5B0DZ9dN86cIWIK65Iw3+YftVUeSLL3iH+QQxRHFRfSBlw3mmWdZ8sf6U=
X-Gm-Gg: AY/fxX4ygJTeWzLGhd4j1Z7GiQfbTGMifJwrqq2V1IelQmOsYgYmemrW4uMuTpWMYrX
 IhhuWrbThrNfh9zyhlpHo1MpPJ++IekKUr2vxAOxuljgEcQWIwMCH1s3lP59z1p7FtFKZZU5jA9
 sOvSl3sJd22IHyZ6IqMa66Tgg+nCLfwiOl4VT/4gCt4CpwuYKPCfLkjhh9TsgeXUPPr/9l/k8l3
 GDnyrvJuiYQ9tPMd0g6pwTIl0L5u3Y4bnJsO4mohv4CWyJoClO7s0rHcOJ7MhuKN1NpY9+sTZJB
 u79C8NCFT/jZXS06taSlBhtkxrbzXpfWKeIzzgVGob7ZOCweVFN7aPHt/xa4zXJ/Ntvc+c1qQUd
 FSVIr1rivPnceghgqZT676Lg3pRB3iPU0k4VGWCcL/PFSFMzNvAvPK0yvKhPuUcx/pY4aFVEUQq
 Jqh3Kgxowmo7FU+9iL0lT2K4GEvfsHd3USjSaIkWaKORuC5OeRObAgHQ2zy363htQ=
X-Google-Smtp-Source: AGHT+IHT3TCC3ewyu37FnLOfQJ7XfLEgeGVgnRbO6LFhJKcWda9WZf9GNwjNZPy+4Ykv+R5VHpR2wQ==
X-Received: by 2002:a05:6000:25c6:b0:431:9b2:61dd with SMTP id
 ffacd0b85a97d-432c374f48dmr11673586f8f.38.1767949299976; 
 Fri, 09 Jan 2026 01:01:39 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d283:7a7e:4c57:678d?
 ([2a01:e0a:3d9:2080:d283:7a7e:4c57:678d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0e16d2sm22088869f8f.13.2026.01.09.01.01.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jan 2026 01:01:39 -0800 (PST)
Message-ID: <cfa5724f-6cb6-4458-be20-9b4d518dd693@linaro.org>
Date: Fri, 9 Jan 2026 10:01:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/3] drm/panel: ilitek-ili9806e: prepare for multiple bus
 support
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com, David Airlie <airlied@gmail.com>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
References: <20260106154446.2735701-1-dario.binacchi@amarulasolutions.com>
 <20260106154446.2735701-2-dario.binacchi@amarulasolutions.com>
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
In-Reply-To: <20260106154446.2735701-2-dario.binacchi@amarulasolutions.com>
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

On 1/6/26 16:43, Dario Binacchi wrote:
> This change clarifies that the current implementation is specific to the
> MIPI-DSI interface. By separating the core config from the DSI-specific
> one, we prepare the driver for future support of other buses (like
> SPI) while maintaining backward compatibility through the default
> assignment in Kconfig.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
>   MAINTAINERS                                            |  2 +-
>   drivers/gpu/drm/panel/Kconfig                          | 10 +++++++++-
>   drivers/gpu/drm/panel/Makefile                         |  2 +-
>   ...l-ilitek-ili9806e.c => panel-ilitek-ili9806e-dsi.c} |  2 +-
>   4 files changed, 12 insertions(+), 4 deletions(-)
>   rename drivers/gpu/drm/panel/{panel-ilitek-ili9806e.c => panel-ilitek-ili9806e-dsi.c} (99%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a0dd762f5648..40a77e5fd2fd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7909,7 +7909,7 @@ F:	drivers/gpu/drm/panel/panel-ilitek-ili9805.c
>   DRM DRIVER FOR ILITEK ILI9806E PANELS
>   M:	Michael Walle <mwalle@kernel.org>
>   S:	Maintained
> -F:	drivers/gpu/drm/panel/panel-ilitek-ili9806e.c
> +F:	drivers/gpu/drm/panel/panel-ilitek-ili9806e-dsi.c
>   
>   DRM DRIVER FOR JADARD JD9365DA-H3 MIPI-DSI LCD PANELS
>   M:	Jagan Teki <jagan@edgeble.ai>
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 7a83804fedca..9ab72f3ab32e 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -260,12 +260,20 @@ config DRM_PANEL_ILITEK_ILI9805
>   config DRM_PANEL_ILITEK_ILI9806E
>   	tristate "Ilitek ILI9806E-based panels"
>   	depends on OF
> -	depends on DRM_MIPI_DSI

You may need to check if this symbol is used in a kernel config and rename it,
and I think this one should be renamed as _CORE, with the tristate and help
text removed, the DSI and SPI should simply select it.

But first in this patch, just remove this entry and re-introduce an hidden
code config on the next patch.

>   	depends on BACKLIGHT_CLASS_DEVICE
>   	help
>   	  Say Y if you want to enable support for panels based on the
>   	  Ilitek ILI9806E controller.
>   
> +config DRM_PANEL_ILITEK_ILI9806E_DSI
> +	tristate "Ilitek ILI9806E DSI panel"
> +	depends on DRM_MIPI_DSI
> +	depends on DRM_PANEL_ILITEK_ILI9806E
> +	default DRM_PANEL_ILITEK_ILI9806E
> +	help
> +	  Say Y here if you want to be able to access the Ilitek
> +	  ILI9806E panel using DSI.
> +
>   config DRM_PANEL_ILITEK_ILI9881C
>   	tristate "Ilitek ILI9881C-based panels"
>   	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index b9562a6fdcb3..00071a983242 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -26,7 +26,7 @@ obj-$(CONFIG_DRM_PANEL_HYDIS_HV101HD1) += panel-hydis-hv101hd1.o
>   obj-$(CONFIG_DRM_PANEL_ILITEK_IL9322) += panel-ilitek-ili9322.o
>   obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9341) += panel-ilitek-ili9341.o
>   obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9805) += panel-ilitek-ili9805.o
> -obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9806E) += panel-ilitek-ili9806e.o
> +obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9806E_DSI) += panel-ilitek-ili9806e-dsi.o
>   obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9881C) += panel-ilitek-ili9881c.o
>   obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9882T) += panel-ilitek-ili9882t.o
>   obj-$(CONFIG_DRM_PANEL_INNOLUX_EJ030NA) += panel-innolux-ej030na.o
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9806e.c b/drivers/gpu/drm/panel/panel-ilitek-ili9806e-dsi.c
> similarity index 99%
> rename from drivers/gpu/drm/panel/panel-ilitek-ili9806e.c
> rename to drivers/gpu/drm/panel/panel-ilitek-ili9806e-dsi.c
> index 18aa6222b0c5..e02e28b67e29 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9806e.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9806e-dsi.c
> @@ -561,5 +561,5 @@ module_mipi_dsi_driver(ili9806e_dsi_driver);
>   
>   MODULE_AUTHOR("Gunnar Dibbern <gunnar.dibbern@lht.dlh.de>");
>   MODULE_AUTHOR("Michael Walle <mwalle@kernel.org>");
> -MODULE_DESCRIPTION("Ilitek ILI9806E Controller Driver");
> +MODULE_DESCRIPTION("Ilitek ILI9806E LCD DSI Controller Driver");
>   MODULE_LICENSE("GPL");

