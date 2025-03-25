Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EB9A6EA93
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 08:35:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75B9410E02E;
	Tue, 25 Mar 2025 07:35:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cHPQU1oi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9722C10E02E
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 07:35:05 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3914a5def6bso3115447f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 00:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742888101; x=1743492901; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=nsBuAVY5kbLtGjR0cZnVpfbHFHF4MARurAEfy4F4g/0=;
 b=cHPQU1oiYpumiZy5FOWni3A/dEmRFxLOKKDdsb05HHDJ+xNgil3WJ/LHmyMwjrACmU
 g20QXVRGZ8F0JzbyYp0RX/XMgmFfUlvUtWrAo8Yyo4eXJTB4FdsZFX8zB7WF5hgLSwZD
 CIuKwDEDssOSna0g2otRri3ZdMxDtAlqqOjRQ6sjZydQ72YKxV/lyQSCK49dkGp3yHTj
 BsiG9IVkzUDic2FIkkAF9qvmejfXBdsnAe0z8xkBMBA3Ik7cFj58MELUcjdJSf+vLsEq
 Ae88GjKn/TQ+PFR5ukxn3CYvFMd0CVs5CoQVlCuBImhrYAqVi1LP89Hi8DVk20eruVGc
 tC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742888101; x=1743492901;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=nsBuAVY5kbLtGjR0cZnVpfbHFHF4MARurAEfy4F4g/0=;
 b=q3v1DnnaxQuiTLYFcaeJGRNWVZ2ZvR0tpZJVRBvY602zBn7Hv3znlbUbMs2hQbKFph
 blYhspMGbq5mR/Mv08W7YfWwxbdqSKc0wdrVM7tGphnr9YTYpNlMX/P1Z3ErvZ9vPodm
 ZUEUu88pKi2/RXD8SZyQKACddh3hsffoqHOEGoK8V75CleVUl+HhKVu/YYppt9KNGAng
 5qHrLakB2zHLynahMPjtknpZNyKKf+dJ021/Lm2CoMdMgElKi3C9B+FA5oIwANc0h415
 NaHTvVKBj5/+9+xtKNGVOFMvLJ76Sn0Yc7wh/oGelpwdjgOmwCpJ4LOsNJ5gheQyKnwl
 9KvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUazo2gPTgy6hvwDkPFFkw0U0EcHEDSZ7+bRqF5U2r9rBRsIkL2ZPMimPMTFDIqACa0YsEvftT/Fts=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwP3ntP/vKrfYflzCFQEKVKskONJiIM66+WyxqqeZLN+E7FddyI
 HDKp+oorQmKnZ3EbTeOSMgVlfNwO+5KXIBDkx27HfZF3NB/if5VMAviV1inUrwo=
X-Gm-Gg: ASbGnctZU5bXgfU1LiRskaItYL7G2uuC9kjb0xahXjSqdcfWiPWMShdfRDWJGVZwwOT
 Dp0UlmAd/pG1N9n+KxuyW2tTn6rajdnCB+wZLvEf4GTEYnxSJxxP4mwQRPB+EG2l0iPhk7Vk1E/
 0VnBigCgNCN6nCpHIxnvkBzRGPiFFMtp4X++miHdLqVkhZurd0CK+GXqAV+PmOCc+6Au0h6ZyNW
 rljYvawK7I+kGRrbk7B4rlvsaWllf1CsaGpMIQ+vcWcZo8ZELeVhu0CjzQeDE6XergdPbzZOg9V
 GvRMqZMnVrFR390z8P6zmsaXYB8n+jbhcsCm/WJCefyjt/9DsClyQKGiOGzE6/GtLCbx001bRir
 9mK1QiZ5KoCR7IeqI
X-Google-Smtp-Source: AGHT+IHF2PL5nlHRaAy+vlhbkBYtTF0T7s6ZOWU4rgBP6VnqeSKDJmq+WAiMwII0SgzDwtXmOQ9xNg==
X-Received: by 2002:a05:6000:2808:b0:39a:ca0c:fb0c with SMTP id
 ffacd0b85a97d-39aca0cfb21mr350868f8f.28.1742888100838; 
 Tue, 25 Mar 2025 00:35:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:7a:6952:5850:1802?
 ([2a01:e0a:3d9:2080:7a:6952:5850:1802])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d4fd18365sm142411785e9.13.2025.03.25.00.35.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 00:35:00 -0700 (PDT)
Message-ID: <0ca61f1e-ec51-4335-a74e-7337aad5219c@linaro.org>
Date: Tue, 25 Mar 2025 08:35:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/i2c: tda998x: select CONFIG_DRM_KMS_HELPER
To: Arnd Bergmann <arnd@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Liviu Dudau <liviu.dudau@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Liu Ying <victor.liu@nxp.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250324210824.3094660-1-arnd@kernel.org>
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
In-Reply-To: <20250324210824.3094660-1-arnd@kernel.org>
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

On 24/03/2025 22:08, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This fails to build without the KMS helper functions:
> 
> x86_64-linux-ld: drivers/gpu/drm/bridge/tda998x_drv.o: in function `tda998x_detect_work':
> tda998x_drv.c:(.text+0x4e6): undefined reference to `drm_kms_helper_hotplug_event'
> x86_64-linux-ld: drivers/gpu/drm/bridge/tda998x_drv.o: in function `tda998x_bind':
> tda998x_drv.c:(.text.unlikely+0x33): undefined reference to `drm_simple_encoder_init'
> x86_64-linux-ld: drivers/gpu/drm/bridge/tda998x_drv.o:(.rodata+0x584): undefined reference to `drm_atomic_helper_connector_reset'
> x86_64-linux-ld: drivers/gpu/drm/bridge/tda998x_drv.o:(.rodata+0x590): undefined reference to `drm_helper_probe_single_connector_modes'
> x86_64-linux-ld: drivers/gpu/drm/bridge/tda998x_drv.o:(.rodata+0x5a4): undefined reference to `drm_atomic_helper_connector_duplicate_state'
> x86_64-linux-ld: drivers/gpu/drm/bridge/tda998x_drv.o:(.rodata+0x5a8): undefined reference to `drm_atomic_helper_connector_destroy_state'
> 
> Select the missing symbol and fix up the broken whitespace.
> 
> Fixes: 325ba852d148 ("drm/i2c: move TDA998x driver under drivers/gpu/drm/bridge")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/gpu/drm/bridge/Kconfig | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index d20f1646dac2..09a1be234f71 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -91,12 +91,13 @@ config DRM_FSL_LDB
>   	  Support for i.MX8MP DPI-to-LVDS on-SoC encoder.
>   
>   config DRM_I2C_NXP_TDA998X
> -       tristate "NXP Semiconductors TDA998X HDMI encoder"
> -       default m if DRM_TILCDC
> -       select CEC_CORE if CEC_NOTIFIER
> -       select SND_SOC_HDMI_CODEC if SND_SOC
> -       help
> -         Support for NXP Semiconductors TDA998X HDMI encoders.
> +	tristate "NXP Semiconductors TDA998X HDMI encoder"
> +	default m if DRM_TILCDC
> +	select CEC_CORE if CEC_NOTIFIER
> +	select DRM_KMS_HELPER
> +	select SND_SOC_HDMI_CODEC if SND_SOC
> +	help
> +	  Support for NXP Semiconductors TDA998X HDMI encoders.
>   
>   config DRM_ITE_IT6263
>   	tristate "ITE IT6263 LVDS/HDMI bridge"

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
