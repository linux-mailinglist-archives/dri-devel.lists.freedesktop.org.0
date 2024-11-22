Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D23AD9D5841
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 03:21:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 973B010EAAB;
	Fri, 22 Nov 2024 02:21:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="diStAIeC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5962010EAAB
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 02:21:39 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-53dd2fdcebcso468819e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 18:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732242097; x=1732846897; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZZuZAUTXWUhfecAqQ9mrx5GiCXr4CTmpOjOFqvF1P6Q=;
 b=diStAIeC04kmZZB+KFHS5x+gzi3fR77fKusR04o5kbwwnvHPOf8Xb0ImpJgmt0oOEa
 S8t7XcnwSfXck3GDeUAv0eHv9rTKD9Mf9WblM3oLFD+ftHUVwqwxbS4Uki70yC0B8Sjc
 H+fn9lIy90aF6lvu1nsbA5ETEut4GBCiM8WqrUFq6Tunm1GG6KP+eiJ4Ei8NCzp7fQ+9
 Y9PsBbHv+XKLPHm7lHkAexjpkQMDlE92s7VWsFtcf6ogADccZBBM+kEcWNkIuCeyCiOL
 4GPVn/VgFsRJ0AErhaEjyPOqG4d3Mn2f7quTo3xBaidvz3q3WSTa8z9BP9NmkGU9DV2K
 Hp5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732242097; x=1732846897;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZZuZAUTXWUhfecAqQ9mrx5GiCXr4CTmpOjOFqvF1P6Q=;
 b=WIZhlQyGveh6jGtto+trEdIYyiFWly58zWBcLlSR9x8iK33QExmN4mbTcH9+93QvgI
 T89gLEhHkWlQJUjIhyyAJrA4Hj1ffAh7vl8/42bsbazAzzJqbV1Lutd/2TrVoc3bGa3W
 8yfpDMQr3rfvFra6IR44l+Et4byI3pUZwzaZiTXtah3TIXNGnBjF2DWs97dQ9yW/yi5i
 BieapHGkujXzPEhyNu2GMB9k+rvfI69z9aVip3S0MxNI9Cm5fjfGs00sqKFcv3OicMSD
 Xni7HXkNDQLnsSWS4kDTMjC/jSZ6FPsXJfNzBcftY5b/G0X/U/js8d66hj10cGC+JAkp
 WEtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWd0VGKXATjn5j/Gxf3D46wOBrbTZd8Xnbq/0ZRXVj7XzqHhvEGdVunYWwJ9z6Suq85rdzSYRX0unc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEjHm2ODMxE0p7TbqhdLkWDCCebaZw48zXARW6/wT+DHwSJt2B
 UC/27Fzx4k7qhW1e5HyYGqLNtICq90Og3rCN4JpE+IvYPJ+zldIaAds9nVeRhBY=
X-Gm-Gg: ASbGncuDqFf5VFcOLQd50MN1mbGGafO2TsPaBEqW6F1UpB9nh3hITlBNRaG4rRnPHVc
 2BNAOPJYHndvtBRR3iFOsFEz+AO1n7g0wg0CJWsc2H1o33DxtLdLWkisHsR8oMf/puo4x2wL0tl
 4wfvTzlwo4cnLfGQFtfKUeTe54g2fbLySjhMO9mCNaPVbmpzAzqgqZaHuxZGYkH7WSYdrA3XnFw
 PiTOKvHK7PZuCLlSARbJzpLr1ln3iHhZlABfGV1fAcC6YIGoPojhot643hybWQ8GMU2YiuNQN54
 du7nRnB9ICmaWjGi8FHo86HJLwVnWQ==
X-Google-Smtp-Source: AGHT+IFNd2YzLTQpbV3Q61XUgusZ89fOWerYp2aFl2Xogi7WXwMBqvj+iOFt9Sh8aplJfX2ZgvTVdQ==
X-Received: by 2002:a05:6512:1111:b0:53d:d576:da05 with SMTP id
 2adb3069b0e04-53dd576db55mr51458e87.34.1732242097440; 
 Thu, 21 Nov 2024 18:21:37 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd2da7589sm136062e87.58.2024.11.21.18.21.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 18:21:36 -0800 (PST)
Date: Fri, 22 Nov 2024 04:21:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, kong.kongxinwei@hisilicon.com, liangjian010@huawei.com, 
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com, 
 shenjian15@huawei.com, shaojijie@huawei.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 drm-dp 5/5] drm/hisilicon/hibmc: add dp module in hibmc
Message-ID: <mdz2qe2lksowfzwxd5wfdynrsdsyzwjyism6qb5zozk2yb5tx5@zqghgeogothb>
References: <20241118142805.3326443-1-shiyongbang@huawei.com>
 <20241118142805.3326443-6-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118142805.3326443-6-shiyongbang@huawei.com>
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

On Mon, Nov 18, 2024 at 10:28:05PM +0800, Yongbang Shi wrote:
> From: baihan li <libaihan@huawei.com>
> 
> To support DP interface displaying in hibmc driver. Add
> a encoder and connector for DP modual.
> 
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
> ChangeLog:
> v3 -> v4:
>   - static inline hibmc_dp_prepare(), suggested by Dmitry Baryshkov.
> ---
>  drivers/gpu/drm/hisilicon/hibmc/Makefile      |   2 +-
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 118 ++++++++++++++++++
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  12 ++
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   |   5 +
>  4 files changed, 136 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/Makefile b/drivers/gpu/drm/hisilicon/hibmc/Makefile
> index 214228052ccf..95a4ed599d98 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/Makefile
> +++ b/drivers/gpu/drm/hisilicon/hibmc/Makefile
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  hibmc-drm-y := hibmc_drm_drv.o hibmc_drm_de.o hibmc_drm_vdac.o hibmc_drm_i2c.o \
> -	       dp/dp_aux.o dp/dp_link.o dp/dp_hw.o
> +	       dp/dp_aux.o dp/dp_link.o dp/dp_hw.o hibmc_drm_dp.o
>  
>  obj-$(CONFIG_DRM_HISI_HIBMC) += hibmc-drm.o
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> new file mode 100644
> index 000000000000..603d6b198a54
> --- /dev/null
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> @@ -0,0 +1,118 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright (c) 2024 Hisilicon Limited.
> +
> +#include <linux/io.h>
> +
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_simple_kms_helper.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_edid.h>
> +
> +#include "hibmc_drm_drv.h"
> +#include "dp/dp_hw.h"
> +
> +static int hibmc_dp_connector_get_modes(struct drm_connector *connector)
> +{
> +	int count;
> +
> +	count = drm_add_modes_noedid(connector, connector->dev->mode_config.max_width,
> +				     connector->dev->mode_config.max_height);
> +	drm_set_preferred_mode(connector, 1024, 768); // temporary implementation

Ideally this should be mentioned in the commit message.

> +
> +	return count;
> +}
> +
> +static const struct drm_connector_helper_funcs hibmc_dp_conn_helper_funcs = {
> +	.get_modes = hibmc_dp_connector_get_modes,
> +};
> +
> +static const struct drm_connector_funcs hibmc_dp_conn_funcs = {
> +	.reset = drm_atomic_helper_connector_reset,
> +	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.destroy = drm_connector_cleanup,
> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,

No .detect / .detect_ctx ? No HPD support? Is it being targeted the DP
or eDP cases?

> +};
> +
> +static inline int hibmc_dp_prepare(struct hibmc_dp *dp, struct drm_display_mode *mode)
> +{
> +	int ret;
> +
> +	hibmc_dp_display_en(dp, false);
> +
> +	ret = hibmc_dp_mode_set(dp, mode);
> +	if (ret)
> +		drm_err(dp->drm_dev, "hibmc dp mode set failed: %d\n", ret);
> +
> +	return ret;
> +}
> +
> +static void hibmc_dp_encoder_enable(struct drm_encoder *drm_encoder,
> +				    struct drm_atomic_state *state)
> +{
> +	struct hibmc_dp *dp = container_of(drm_encoder, struct hibmc_dp, encoder);
> +	struct drm_display_mode *mode = &drm_encoder->crtc->state->mode;
> +
> +	if (hibmc_dp_prepare(dp, mode))
> +		return;
> +
> +	hibmc_dp_display_en(dp, true);
> +}
> +
> +static void hibmc_dp_encoder_disable(struct drm_encoder *drm_encoder,
> +				     struct drm_atomic_state *state)
> +{
> +	struct hibmc_dp *dp = container_of(drm_encoder, struct hibmc_dp, encoder);
> +
> +	hibmc_dp_display_en(dp, false);
> +}
> +
> +static const struct drm_encoder_helper_funcs hibmc_dp_encoder_helper_funcs = {
> +	.atomic_enable = hibmc_dp_encoder_enable,
> +	.atomic_disable = hibmc_dp_encoder_disable,
> +};
> +
> +int hibmc_dp_init(struct hibmc_drm_private *priv)
> +{
> +	struct drm_device *dev = &priv->dev;
> +	struct drm_crtc *crtc = &priv->crtc;
> +	struct hibmc_dp *dp = &priv->dp;
> +	struct drm_connector *connector = &dp->connector;
> +	struct drm_encoder *encoder = &dp->encoder;
> +	int ret;
> +
> +	dp->mmio = priv->mmio;
> +	dp->drm_dev = dev;
> +
> +	ret = hibmc_dp_hw_init(&priv->dp);
> +	if (ret) {
> +		drm_err(dev, "hibmc dp hw init failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	hibmc_dp_display_en(&priv->dp, false);
> +
> +	encoder->possible_crtcs = drm_crtc_mask(crtc);
> +	ret = drmm_encoder_init(dev, encoder, NULL, DRM_MODE_ENCODER_TMDS, NULL);
> +	if (ret) {
> +		drm_err(dev, "init dp encoder failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	drm_encoder_helper_add(encoder, &hibmc_dp_encoder_helper_funcs);
> +
> +	ret = drm_connector_init(dev, connector, &hibmc_dp_conn_funcs,
> +				 DRM_MODE_CONNECTOR_DisplayPort);
> +	if (ret) {
> +		drm_err(dev, "init dp connector failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	drm_connector_helper_add(connector, &hibmc_dp_conn_helper_funcs);
> +
> +	drm_connector_attach_encoder(connector, encoder);
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> index 9f9b19ea0587..39fd8c5c8227 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> @@ -27,6 +27,10 @@
>  #include "hibmc_drm_drv.h"
>  #include "hibmc_drm_regs.h"
>  
> +#define HIBMC_DP_HOST_SERDES_CTRL		0x1f001c
> +#define HIBMC_DP_HOST_SERDES_CTRL_VAL		0x8A00
> +#define HIBMC_DP_HOST_SERDES_CTRL_MASK		0x7FFFF
> +
>  DEFINE_DRM_GEM_FOPS(hibmc_fops);
>  
>  static irqreturn_t hibmc_interrupt(int irq, void *arg)
> @@ -116,6 +120,14 @@ static int hibmc_kms_init(struct hibmc_drm_private *priv)
>  		return ret;
>  	}
>  
> +	/* if DP existed, init DP */
> +	if ((readl(priv->mmio + HIBMC_DP_HOST_SERDES_CTRL) &
> +	     HIBMC_DP_HOST_SERDES_CTRL_MASK) == HIBMC_DP_HOST_SERDES_CTRL_VAL) {
> +		ret = hibmc_dp_init(priv);
> +		if (ret)
> +			drm_err(dev, "failed to init dp: %d\n", ret);
> +	}
> +
>  	ret = hibmc_vdac_init(priv);
>  	if (ret) {
>  		drm_err(dev, "failed to init vdac: %d\n", ret);
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
> index 42f0ab8f9b5a..d982f1e4b958 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
> @@ -20,6 +20,8 @@
>  
>  #include <drm/drm_framebuffer.h>
>  
> +#include "dp/dp_hw.h"
> +
>  struct hibmc_vdac {
>  	struct drm_device *dev;
>  	struct drm_encoder encoder;
> @@ -37,6 +39,7 @@ struct hibmc_drm_private {
>  	struct drm_plane primary_plane;
>  	struct drm_crtc crtc;
>  	struct hibmc_vdac vdac;
> +	struct hibmc_dp dp;
>  };
>  
>  static inline struct hibmc_vdac *to_hibmc_vdac(struct drm_connector *connector)
> @@ -59,4 +62,6 @@ int hibmc_vdac_init(struct hibmc_drm_private *priv);
>  
>  int hibmc_ddc_create(struct drm_device *drm_dev, struct hibmc_vdac *connector);
>  
> +int hibmc_dp_init(struct hibmc_drm_private *priv);
> +
>  #endif
> -- 
> 2.33.0
> 

-- 
With best wishes
Dmitry
