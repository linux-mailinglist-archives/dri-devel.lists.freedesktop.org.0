Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8528CB4EB
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 22:53:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C50B410E27A;
	Tue, 21 May 2024 20:53:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vi53KBo+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31A6110E27A
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 20:52:53 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-51f40b5e059so6142239e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 13:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716324771; x=1716929571; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=msxyCLm+NoD8gt9t5sc/sqtgLcdGE0LrYHv1PtdYhxE=;
 b=vi53KBo+IW1i8GWYRSYWFayaYixxEhsCUDAkYqrYajCzZRbeZR+ZGDDzNUPKdUMGQ0
 718fU431tIYVHUq0dsXNdsGNuX8PINRxHN7yvwG8YMUm70B9hOpTVDm5SK+fr1n70DjL
 ZxsmSE+OocAefbJclPmLX8hIsLluRjULaECsqtDNb1pB01toV3sHBURD3zHLXMk2YVXk
 ZF7LtKTzMCM3rbSwL/ZHvdsWnhc13Lo+88dmGKXsEaqXNcWhT+wG3c9F6wbFvGEn1JM0
 UZSflDU1w6gYJT+sn3crecShpgSZ9lZD0dgnJnbahlD5BXBoWvKEc/HK96HW2cSnPqib
 Jo4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716324771; x=1716929571;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=msxyCLm+NoD8gt9t5sc/sqtgLcdGE0LrYHv1PtdYhxE=;
 b=vGzzqq2Tu8Ghw0vPD/zarsoL1K3vZBIUlEiWE+QBUBlPpE4WsOTNRMUr0HK8Pgf9zr
 xP0WyyN0V4twKtobwNZl2zHQkjbxfkCzva4v+HHAyr+P3Sapy9Z8zpgZ2uM4L9nbS+hl
 Lpki7ScD/ZVe/huaxYOgftUEby3vZJ2HBSSTJJ8/vwzg3WvRXsavL1lMsJKQZHW4NFYL
 pOuQZQQQnsrE96VhGL0Dli9jbsa/eJPn80hQ+Fz5fcgUfigxzazjz55ziWRtHei2Lux+
 cyXMV8NZ/OAgUeyiMf56MdAftZVWwyOFM0/sb79eLV35tV+NP11VpsFMFyYd/p8FNKUZ
 JJ5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9fWCLHmPkqeVJCkE8XGxfRtpW9Q71rp0mPt2tjBEwVzLMlb2pBwsitQXHjblgkQpj1uUvflaSCbianSUohaJbARHSzoo6bsg57nHtx7ta
X-Gm-Message-State: AOJu0YyvKdZf/tMUBOiEGPWqUOQ6PdGq8wDQ5swiZZicC1JeufXzBJuZ
 RgVIgJ/gC6ErxMylFDijVkleRH1YOLqNr4GdLV2O1nD7AF+eQKHXPPa2BVYFBkk=
X-Google-Smtp-Source: AGHT+IH9JnZ8CnZBbmaZFoXCSh2S7w8ZfIIRcaRrDzVz1afxLKCUvUcZ9fni8BZiKaLEuV2o297Qfw==
X-Received: by 2002:a05:6512:3147:b0:523:9747:4920 with SMTP id
 2adb3069b0e04-52397475405mr10938328e87.36.1716324771258; 
 Tue, 21 May 2024 13:52:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f38d87a5sm4800254e87.202.2024.05.21.13.52.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 May 2024 13:52:50 -0700 (PDT)
Date: Tue, 21 May 2024 23:52:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: keith <keith.zhao@starfivetech.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com, 
 xingyu.wu@starfivetech.com, p.zabel@pengutronix.de, jack.zhu@starfivetech.com, 
 shengyang.chen@starfivetech.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 05/10] drm/vs: add vs mode config init
Message-ID: <ttjuehs6ui4dsnexhhodfd22okujx55mof5svxuk47gizhkv52@kdbdvwsamz6i>
References: <20240521105817.3301-1-keith.zhao@starfivetech.com>
 <20240521105817.3301-6-keith.zhao@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521105817.3301-6-keith.zhao@starfivetech.com>
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

On Tue, May 21, 2024 at 06:58:12PM +0800, keith wrote:
> add vs mode config base api

Commit message? Please describe e.g. why are you using
drm_atomic_helper_commit_tail_rpm() instead of
drm_atomic_helper_commit_tail().

> 
> Signed-off-by: keith <keith.zhao@starfivetech.com>

Name

> ---
>  drivers/gpu/drm/verisilicon/Makefile     |  3 +-
>  drivers/gpu/drm/verisilicon/vs_modeset.c | 36 ++++++++++++++++++++++++
>  drivers/gpu/drm/verisilicon/vs_modeset.h | 10 +++++++
>  3 files changed, 48 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_modeset.c
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_modeset.h
> 
> diff --git a/drivers/gpu/drm/verisilicon/Makefile b/drivers/gpu/drm/verisilicon/Makefile
> index 7da54b259940..536091f37378 100644
> --- a/drivers/gpu/drm/verisilicon/Makefile
> +++ b/drivers/gpu/drm/verisilicon/Makefile
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
> -vs_drm-objs := vs_dc_hw.o
> +vs_drm-objs := vs_dc_hw.o \
> +		vs_modeset.o
>  
>  obj-$(CONFIG_DRM_VERISILICON_DC8200) += vs_drm.o
> diff --git a/drivers/gpu/drm/verisilicon/vs_modeset.c b/drivers/gpu/drm/verisilicon/vs_modeset.c
> new file mode 100644
> index 000000000000..c71fe0d32504
> --- /dev/null
> +++ b/drivers/gpu/drm/verisilicon/vs_modeset.c
> @@ -0,0 +1,36 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
> + */
> +#include <drm/drm_damage_helper.h>

I don't see anything concerning damage helpers being used here.

> +#include <drm/drm_fb_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +
> +#include "vs_modeset.h"
> +
> +static const struct drm_mode_config_funcs vs_mode_config_funcs = {
> +	.fb_create			 = drm_gem_fb_create,
> +	.atomic_check		 = drm_atomic_helper_check,
> +	.atomic_commit		 = drm_atomic_helper_commit,
> +};
> +
> +static struct drm_mode_config_helper_funcs vs_mode_config_helpers = {
> +	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
> +};
> +
> +void vs_mode_config_init(struct drm_device *dev)
> +{
> +	int ret;
> +
> +	ret = drmm_mode_config_init(dev);
> +	if (ret)
> +		return;
> +
> +	dev->mode_config.min_width  = 0;
> +	dev->mode_config.min_height = 0;
> +	dev->mode_config.max_width  = 4096;
> +	dev->mode_config.max_height = 4096;
> +
> +	dev->mode_config.funcs = &vs_mode_config_funcs;
> +	dev->mode_config.helper_private = &vs_mode_config_helpers;
> +}
> diff --git a/drivers/gpu/drm/verisilicon/vs_modeset.h b/drivers/gpu/drm/verisilicon/vs_modeset.h
> new file mode 100644
> index 000000000000..bd04f81d2ad2
> --- /dev/null
> +++ b/drivers/gpu/drm/verisilicon/vs_modeset.h
> @@ -0,0 +1,10 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2020 VeriSilicon Holdings Co., Ltd.
> + */
> +
> +#ifndef __VS_MODESET_H__
> +#define __VS_MODESET_H__
> +
> +void vs_mode_config_init(struct drm_device *dev);
> +#endif /* __VS_FB_H__ */
> -- 
> 2.27.0
> 

-- 
With best wishes
Dmitry
