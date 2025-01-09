Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED8AA0764E
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 13:58:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D95A10E230;
	Thu,  9 Jan 2025 12:58:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="F6FANwwg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFBBB10E230
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 12:58:06 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-54026562221so881101e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 04:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736427485; x=1737032285; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PluEJNm6A4jMqOqyB0FTg4D45gj8yEkPQ1baSXUmCTM=;
 b=F6FANwwg/MOhKrWBOQHFfEpX6R8IzaMHUwxoWcD/22+wIuMA2c6DfvGfigCE6pimXS
 Sjb5J1rH5F60E85Rw6Egwh/wzC6/On5VZZXVzCZiZQ961T3GCyUzbGHUu7anPBqtbqTa
 jzO5n4IdOWt06RCAlA8Q7jGvWsMqGe8pPUyIDAjhHEMZvQuRH6bHbQFV5MlwCR0FmUNo
 nLXSle1dyyh3wHrEFqA0BvZgkfCYJtPNT0ZBakPuJAptpNPGF5f/upmvWdEtrRXIMeGp
 QlK+e1GJtFtNncpNe3eON5Vfoju4CXu2isUR3KlDGO5tY02a+2vhUAEs2RChrAfFPXX3
 r/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736427485; x=1737032285;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PluEJNm6A4jMqOqyB0FTg4D45gj8yEkPQ1baSXUmCTM=;
 b=hKAFUk2qy0DgO87iFYNSD+DAeRbFOvfy3MJv9AKLvxXWAnGoTDxhP3YNc/6CT5vEn/
 MOy8pjtFpzVaPLm++OQ4PBuiBtNQtjOfBKGQLJYHbj21qZHZiUaPeF1Pek25asRQRc41
 ddA9pfRORPDjYFcLiG6KdgFtxGhvooB9eT8ORTiOgp8q+V2gIIWhK5raxyGu2STe8NcY
 7O0IKB1X/u0Ti8ANNY52RPOl4/HsgIWQdEJId3Bi/r8bOdzbuIQWHs1GkccVE6FhGnDq
 QY7+s1DEmM/d03zM9VRNqemmm4rdEfwNkVDiRgmhGjGRb2BXyFQDAI3oM9cwMS9udGHV
 k7Wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuNh8Ve/sHfcDReao7VI1aHd0B69TvtgozhT2gHZu0Q5/Yk/W3bMNNpVlIa20wxOJRwiMtJQsbKnw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUzEvEQX1uwS7oBNzgyR5S4FU7WT1JmD0ax/+ZjYsvEHsmE6K/
 thVOzmDl2ct2Vlal2V0jhCJ67cZ5KT6UxfPauVMJdTYGebb5zIF5jzNSflTPj6w=
X-Gm-Gg: ASbGncv+uXCOWZZJ/ZKfyOEWP3X5/Dl36tffvgU8LXILVxLAkDzP2pdQOLnDBpc/saC
 iKvAyU7hiS/H2rWhuqk830zF5G+/L+c7W2eHv7C5UA+NWtXKuxhIWHde3isJ/+wl920bKLIFmcc
 H6oeUBJNmthEw52CHAt7VObmRlOWwDMFGUqg3ENdRE9cHnIq16jc4PmpryDyfnx5dlOXWD93tb/
 1IYCh0r6oXT815ykjVJf3Rpmv5h+0DudmMWIZ41dU/0aXxFGSos1oMiex1LdZQvOosRUwM0TTRy
 9w1NwELBcZIF689JY5kW0vFvNtSrZ78bPM+q
X-Google-Smtp-Source: AGHT+IEvGTGt6x25ztvT/50kVctTk1CY/fLXQXxYXUd2ctSdHixShfg0M2M1+bWWr8+u7Ko3bFZHyg==
X-Received: by 2002:a05:6512:3082:b0:540:1b2d:8ee1 with SMTP id
 2adb3069b0e04-54284507047mr1803562e87.11.1736427485004; 
 Thu, 09 Jan 2025 04:58:05 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428bde9633sm197114e87.0.2025.01.09.04.58.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 04:58:04 -0800 (PST)
Date: Thu, 9 Jan 2025 14:58:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 l.stach@pengutronix.de, 
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v5 10/20] drm/bridge: analogix_dp: support to get
 &analogix_dp_device.plat_data and &analogix_dp_device.aux
Message-ID: <uqsmsoumny6ovf7n56tbcjmdzbzikk2iijk62bvefh5tjtgrvu@a7ogvep5e4yt>
References: <20250109032725.1102465-1-damon.ding@rock-chips.com>
 <20250109032725.1102465-11-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109032725.1102465-11-damon.ding@rock-chips.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 09, 2025 at 11:27:15AM +0800, Damon Ding wrote:
> Add two new functions: one to find &analogix_dp_device.plat_data via
> &drm_dp_aux, and the other to get &analogix_dp_device.aux. Both of them
> serve for the function of getting panel from DP AUX bus, which is why
> they are included in a single commit.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 14 ++++++++++++++
>  include/drm/bridge/analogix_dp.h                   |  4 ++++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index b05f5b9f5258..8251adfce2f9 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1794,6 +1794,20 @@ int analogix_dp_stop_crc(struct drm_connector *connector)
>  }
>  EXPORT_SYMBOL_GPL(analogix_dp_stop_crc);
>  
> +struct analogix_dp_plat_data *analogix_dp_aux_to_plat_data(struct drm_dp_aux *aux)
> +{
> +	struct analogix_dp_device *dp = to_dp(aux);
> +
> +	return dp->plat_data;
> +}
> +EXPORT_SYMBOL_GPL(analogix_dp_aux_to_plat_data);
> +
> +struct drm_dp_aux *analogix_dp_get_aux(struct analogix_dp_device *dp)
> +{
> +	return &dp->aux;
> +}
> +EXPORT_SYMBOL_GPL(analogix_dp_get_aux);
> +
>  MODULE_AUTHOR("Jingoo Han <jg1.han@samsung.com>");
>  MODULE_DESCRIPTION("Analogix DP Core Driver");
>  MODULE_LICENSE("GPL v2");
> diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
> index 6002c5666031..1b119b547988 100644
> --- a/include/drm/bridge/analogix_dp.h
> +++ b/include/drm/bridge/analogix_dp.h
> @@ -7,6 +7,7 @@
>  #ifndef _ANALOGIX_DP_H_
>  #define _ANALOGIX_DP_H_
>  
> +#include <drm/display/drm_dp_aux_bus.h>

Nit: it should be enough to fordward-declare struct drm_dp_aux here.

Nevertheless:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


>  #include <drm/drm_crtc.h>
>  
>  struct analogix_dp_device;
> @@ -48,4 +49,7 @@ void analogix_dp_unbind(struct analogix_dp_device *dp);
>  int analogix_dp_start_crc(struct drm_connector *connector);
>  int analogix_dp_stop_crc(struct drm_connector *connector);
>  
> +struct analogix_dp_plat_data *analogix_dp_aux_to_plat_data(struct drm_dp_aux *aux);
> +struct drm_dp_aux *analogix_dp_get_aux(struct analogix_dp_device *dp);
> +
>  #endif /* _ANALOGIX_DP_H_ */
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
