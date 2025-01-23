Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A77A1A2CB
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 12:20:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 033088924F;
	Thu, 23 Jan 2025 11:20:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UPb0jG2h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1AA38924F
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 11:19:59 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-53f22fd6887so898016e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 03:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737631198; x=1738235998; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1bsSCY5UtFIH4J3YGmp49wNWDSra2kfjxxhdqkpeB0c=;
 b=UPb0jG2h7qj1D2YUIlg3KOz5AoDmkdU0Z1+LmSLsiba+SG+gcx/JormrAjl6slDC5E
 eR2djNK2WWlIgJo73GxWcAMUIKVChRDIcK2i/sszJOB1sXL8wWw+G2Jdc+uXZr3P4Qn+
 t4xex8N1HuI3iXXUXug+MZyIQhQQnjk2Dxwi4JXE8BBYRT/8cLPcNatC1Aq30fVYbaEb
 C1vTomP4g9hEA/eo4NLJuzwfs9JD2azdX70WOCppRCzZhMA68ZKOFWRMB0LZGBimECwH
 QeLqEDOpAH1F8Yr/trkse8AQ2IHN9NbKrkpcXdKcJks6/jaUA8Lrh63jkDqlbn34Yj02
 UJxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737631198; x=1738235998;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1bsSCY5UtFIH4J3YGmp49wNWDSra2kfjxxhdqkpeB0c=;
 b=wNGLqPaq5cTYPiaYUnMZYvCniZlGIgwXPiJusK6N44Kdxh0cQe8AS5lmtFjuKn/3vl
 ILxplZ9aaf306PJaYK2fK4hLhiIObJTdxgtYL4eiLZcR6/zT7vwUaXMyaGoHkVRwTeDD
 JgmEQOisJvSdtDnHsnXwHJkocmlbOkfvN7mkUq8jHfsfo2X+MVsDqUPqJZ5PXBlIPtEm
 ujFddNj8daJzlezXKeccKSW2F42iFuFt/dOhC4jnglK4K0RVSApC+KN4zQ+bzTZud+Ed
 eGuVl2vutEA8xUJdOGu5nbk3OmK8mPZdLAT6PwF9KEX4SzwQ2umC2ohdem+h2PDYZ/xV
 oavw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqosTvamYgw7jg/oqMvyk1e4clADTisSuHQgLAhbyVS6NNNBcyfTXC7iMOrl7e3ItjMYM7uW7NNtQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxwdCB9h5QlhkhOCjUeicWQr4wQPxuH3q9QiqQMrXXxTMI8XHb2
 A+/C1g1MO49ZuZ7EJaJnr6sgH3YIRrYqR1PYq0rcTprR1oj82v+VK6QlfJLlLFU=
X-Gm-Gg: ASbGncuyJx4zHe/Uvju8v97E4BZd0Xx51RIDmGZQtWuSjJByDNMV/8xlYnhXHk4MUkP
 6IQsxD2vYJVWsYPQgWx0+ghRBxmS3/yv081z7CrO5hWUiglU4qoqjh2eipaeZMrU/Ae4mYX6IId
 NVeovyWCRt3nDwLhX/1LGuxuR+ZWOXVmZCYkYJ+5gylQ0fyItZp5AKFzu9FzuWGVVs3sntUkzno
 SMCZTxtp7QcoSJeMAxnaQGKmTUWRoxtAd8eSb3jfxShc+DRpsp+mVwjYasvXWVH+Qz2jWKXLrCm
 VfNJuW05JdlzowHd5p5g0TrJTmqmwJkBJrT54UWNQhedHc/xd+wruuXGWPjb
X-Google-Smtp-Source: AGHT+IFJoD1ZpSDXSEK4+7GESjrAS6LXVt6ZkzdoNAPzcbKpEHkPVqYdSxIGbzeDq/Vi6d+KuKKiiA==
X-Received: by 2002:a05:6512:10c8:b0:540:353a:df8e with SMTP id
 2adb3069b0e04-5439c282caemr9883136e87.39.1737631197914; 
 Thu, 23 Jan 2025 03:19:57 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af60a20sm2652478e87.137.2025.01.23.03.19.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2025 03:19:56 -0800 (PST)
Date: Thu, 23 Jan 2025 13:19:55 +0200
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
Subject: Re: [PATCH v6 06/14] drm/bridge: analogix_dp: support to get
 &analogix_dp_device.plat_data and &analogix_dp_device.aux
Message-ID: <y4yzgkvcmvmphviuoroijaaotd2zdworbs5tfhdxh74kchirk6@dgoqwoksckiz>
References: <20250123100747.1841357-1-damon.ding@rock-chips.com>
 <20250123100747.1841357-7-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250123100747.1841357-7-damon.ding@rock-chips.com>
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

On Thu, Jan 23, 2025 at 06:07:39PM +0800, Damon Ding wrote:
> Add two new functions: one to find &analogix_dp_device.plat_data via
> &drm_dp_aux, and the other to get &analogix_dp_device.aux. Both of them
> serve for the function of getting panel from DP AUX bus, which is why
> they are included in a single commit.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

Nit: it should be enough to just forward-declare struct drm_dp_aux
instead.

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
