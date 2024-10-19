Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAAC9A4E75
	for <lists+dri-devel@lfdr.de>; Sat, 19 Oct 2024 15:59:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 972E810E25D;
	Sat, 19 Oct 2024 13:59:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Dq7aV3SJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9142C10E25D
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2024 13:59:43 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-539fe02c386so4100948e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2024 06:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729346382; x=1729951182; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TYoxzo4bMNOQMkqsgaJWf0NI/6urhbP6naT0GF78T5w=;
 b=Dq7aV3SJVVCm7ynMPioCDdigAczv+oepAw/5GeEK3xPGkvBKRt+ae/YnprqOHgWVsf
 a9G7FMsc7j3Fb2ZsC7BuNq9zYDS/xEhkXGNslQoBLgecZYD6rfCzH+Zlj0HjUoOJLnLa
 bDvrJ8xLTiG6DeZImUmX51lwGiXYUHijTIZz/OxJX9/On+5Xj3E2qoUlk77m8GNTl439
 XxwqZqKYMXXYb7cI6ZRY93ZRr9ePfCNLtL7jfi7muCq8OtDH6KwxP4Ef3KX8pFHzKVAM
 q4pezqmY5pfhYyCjZQmv1+DRq3526m13F9GSoee51Zr8JhJvsbj/d0L9B+57eH5STv/1
 YAqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729346382; x=1729951182;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TYoxzo4bMNOQMkqsgaJWf0NI/6urhbP6naT0GF78T5w=;
 b=N3bt8h3Nk2uUHhDgDjN7lxgi5PKih9Lt2kqUbTog0a9/PTiFO2z122IIhZRwOjIKzE
 7/bZu1xs0htPzDGDJxrIZ9o7ECE3LOqSqV12pbvKy/kzROmcGXnTDvVstANRLCzzb5qN
 dYHTaOtBnFUJuuzAJhKSFDRqR+npSc7gxkzgnrPgGlwniI+5ukyujn4Z8ofHfgRM73+A
 92glWQ0gvBN9JoxLXTgRdjgMjvT6lGc3b5eeu3hyoByMxn2w6Vg5Vq58nFgkEN3EWlJJ
 8FNTV5lZ/0gvjZHx9uMNfq5kc8J9yvxiTYC+LnFenMp4lsdjq44eC342ds5to68lLoLA
 MKmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlPVoeskXa8kmWASMpiUxYqDBgLE8P0LMk8DoehBDmaxPfgxci7OTo0cyo8s43lxQ3WcjoUz03Up8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzh/iO98KjJSRZuFujYiKFeW60AHKGD+P/46Ma/Rwr8/z6VooEm
 S5jhbfTigEtuE4IAjZCI0WTrz9RG1SsD8CKJf4+oRBYxxCrN8F4EturfRBOakG0=
X-Google-Smtp-Source: AGHT+IGqqO8P2mMgLFVo7pHvPNuhv9WgIBf9B8g3YsSTbLEfDdr70Ztg/1Eb/nYyokxqqNXqEbxptA==
X-Received: by 2002:a05:6512:3ca3:b0:539:f1d2:725b with SMTP id
 2adb3069b0e04-53a1583d16dmr1748947e87.4.1729346381509; 
 Sat, 19 Oct 2024 06:59:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a15203f64sm529715e87.188.2024.10.19.06.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Oct 2024 06:59:40 -0700 (PDT)
Date: Sat, 19 Oct 2024 16:59:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: shiyongbang <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, kong.kongxinwei@hisilicon.com, liangjian010@huawei.com, 
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com, 
 shenjian15@huawei.com, shaojijie@huawei.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH drm-dp 3/4] drm/hisilicon/hibmc: add dp kapi moduel in
 hibmc drivers
Message-ID: <eslfc3ejjjpbw5wuf4khcoixeaitpb47iwf6kug7cryplcxcui@sieiyekdpczn>
References: <20240930100610.782363-1-shiyongbang@huawei.com>
 <20240930100610.782363-4-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240930100610.782363-4-shiyongbang@huawei.com>
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

On Mon, Sep 30, 2024 at 06:06:09PM +0800, shiyongbang wrote:
> From: baihan li <libaihan@huawei.com>
> 
> Build a kapi level that hibmc driver can enable dp by
> calling these kapi functions.
> 
> Signed-off-by: baihan li <libaihan@huawei.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/Makefile      |  2 +-
>  .../gpu/drm/hisilicon/hibmc/dp/dp_config.h    | 20 ++++++++
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_kapi.c  | 12 ++---
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_kapi.h  | 48 +++++++++++++++++++
>  4 files changed, 75 insertions(+), 7 deletions(-)
>  create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h
>  create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_kapi.h
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/Makefile b/drivers/gpu/drm/hisilicon/hibmc/Makefile
> index 94d77da88bbf..693036dfab52 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/Makefile
> +++ b/drivers/gpu/drm/hisilicon/hibmc/Makefile
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  hibmc-drm-y := hibmc_drm_drv.o hibmc_drm_de.o hibmc_drm_vdac.o hibmc_drm_i2c.o \
> -	       dp/dp_aux.o dp/dp_link.o
> +	       dp/dp_aux.o dp/dp_link.o dp/dp_kapi.o
>  
>  obj-$(CONFIG_DRM_HISI_HIBMC) += hibmc-drm.o
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h
> new file mode 100644
> index 000000000000..a6353a808cc4
> --- /dev/null
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/* Copyright (c) 2024 Hisilicon Limited. */
> +
> +#ifndef DP_CONFIG_H
> +#define DP_CONFIG_H
> +
> +#define DP_BPP 24
> +#define DP_SYMBOL_PER_FCLK 4
> +#define DP_MIN_PULSE_NUM 0x9
> +#define DP_MSA1 0x20
> +#define DP_MSA2 0x845c00
> +#define DP_OFFSET 0x1e0000
> +#define DP_HDCP 0x2
> +#define DP_INT_RST 0xffff
> +#define DP_DPTX_RST 0x3ff
> +#define DP_CLK_EN 0x7
> +#define DP_SYNC_EN_MASK 0x3
> +#define DP_LINK_RATE_CAL 27

I think some of these defines were used in previous patches. Please make
sure that at each step the code builds without errors.

> +
> +#endif
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_kapi.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_kapi.c
> index 4091723473ad..ca7edc69427c 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_kapi.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_kapi.c
> @@ -64,12 +64,12 @@ static void hibmc_dp_set_tu(struct hibmc_dp_dev *dp, struct dp_mode *mode)
>  	rate_ks = dp->link.cap.link_rate * DP_LINK_RATE_CAL;
>  	value = (pixel_clock * bpp * 5000) / (61 * lane_num * rate_ks);
>  
> -	if (value % 10 == 9) { /* 10: div, 9: carry */
> -		tu_symbol_size = value / 10 + 1; /* 10: div */
> +	if (value % 10 == 9) { /* 9 carry */
> +		tu_symbol_size = value / 10 + 1;
>  		tu_symbol_frac_size = 0;
>  	} else {
> -		tu_symbol_size = value / 10; /* 10: div */
> -		tu_symbol_frac_size = value % 10 + 1; /* 10: div */
> +		tu_symbol_size = value / 10;
> +		tu_symbol_frac_size = value % 10 + 1;
>  	}
>  
>  	drm_info(dp->dev, "tu value: %u.%u value: %u\n",
> @@ -158,7 +158,7 @@ static void hibmc_dp_link_cfg(struct hibmc_dp_dev *dp, struct dp_mode *mode)
>  	dp_write_bits(dp->base + DP_VIDEO_CTRL,
>  		      DP_CFG_STREAM_HSYNC_POLARITY, mode->h_pol);
>  
> -	/* MSA mic 0 and 1*/
> +	/* MSA mic 0 and 1 */
>  	writel(DP_MSA1, dp->base + DP_VIDEO_MSA1);
>  	writel(DP_MSA2, dp->base + DP_VIDEO_MSA2);
>  
> @@ -167,7 +167,7 @@ static void hibmc_dp_link_cfg(struct hibmc_dp_dev *dp, struct dp_mode *mode)
>  	dp_write_bits(dp->base + DP_VIDEO_CTRL, DP_CFG_STREAM_RGB_ENABLE, 0x1);
>  	dp_write_bits(dp->base + DP_VIDEO_CTRL, DP_CFG_STREAM_VIDEO_MAPPING, 0);
>  
> -	/*divide 2: up even */
> +	/* divide 2: up even */
>  	if (timing_delay % 2)
>  		timing_delay++;
>  

This should be squashed into the previous commits.

> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_kapi.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_kapi.h
> new file mode 100644
> index 000000000000..6b07642d55b8
> --- /dev/null
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_kapi.h
> @@ -0,0 +1,48 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/* Copyright (c) 2024 Hisilicon Limited. */
> +
> +#ifndef DP_KAPI_H
> +#define DP_KAPI_H
> +
> +#include <linux/types.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_encoder.h>
> +#include <drm/drm_connector.h>
> +#include <drm/drm_print.h>
> +#include <linux/delay.h>

Sort the headers, please.

> +
> +struct hibmc_dp_dev;
> +
> +struct dp_mode {
> +	u32 h_total;
> +	u32 h_active;
> +	u32 h_blank;
> +	u32 h_front;
> +	u32 h_sync;
> +	u32 h_back;
> +	bool h_pol;
> +	u32 v_total;
> +	u32 v_active;
> +	u32 v_blank;
> +	u32 v_front;
> +	u32 v_sync;
> +	u32 v_back;
> +	bool v_pol;
> +	u32 field_rate;
> +	u32 pixel_clock; // khz

Why do you need a separate struct for this?

> +};
> +
> +struct hibmc_dp {
> +	struct hibmc_dp_dev *dp_dev;
> +	struct drm_device *drm_dev;
> +	struct drm_encoder encoder;
> +	struct drm_connector connector;
> +	void __iomem *mmio;
> +};
> +
> +int hibmc_dp_kapi_init(struct hibmc_dp *dp);
> +void hibmc_dp_kapi_uninit(struct hibmc_dp *dp);
> +int hibmc_dp_mode_set(struct hibmc_dp *dp, struct dp_mode *mode);
> +void hibmc_dp_display_en(struct hibmc_dp *dp, bool enable);

It looks like this should also be defined earlier.

> +
> +#endif
> -- 
> 2.33.0
> 

-- 
With best wishes
Dmitry
