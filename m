Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFA9A447BA
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 18:18:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC0ED10E779;
	Tue, 25 Feb 2025 17:18:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hOFewchI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A2110E775
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 17:18:15 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-546237cd3cbso5896029e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 09:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740503894; x=1741108694; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UBMGUOCl55gdKoV7vW8XIwXzlyBYkDGukZo5cGFH5CU=;
 b=hOFewchISCMUH4Jy7ycR9fuHX14UTtOJmphl6Nr/nwcSM0TC+v8p7YlH4U95CuJB6q
 wnYPBEDunb8fODpwDjk2z7ehgukapDeLT6VEWeZUhstU9NAH0Vogtm8hWuHvll9V5xpA
 EEr4AcKCLRTk9f4x5yv8M3UpGV11KC3mpmzishqQacK3YM+zG1eWWhFVLqcMyUtBZOE0
 GEJOmPCUWebY0araCn2BtOMzgOea/M1NmHfHoCe/sjVt4U9Tan3pO867RJL4vUM+lYSR
 iC+SS25aVqmWW8y8T8uFeY2Okkq3wU1pe2Ofa0tD2OBjeSD45L0AOjccRbgV46LBtJ16
 LPoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740503894; x=1741108694;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UBMGUOCl55gdKoV7vW8XIwXzlyBYkDGukZo5cGFH5CU=;
 b=m7wkZnpav9sjVXmSkev4epVpE+ssX0hIXO0ZGm8zfo43sgnqzDLvLI6voEdpM72Qi/
 /DZTFhv66HSvarrxqaDVKvWTxj1s9twJs7LkgQ6BudFCaycrs5zcs1TuTnbMvhtYEYXU
 Iy5uVK7NTxtx5H42BR7/tcbhwxj65+LR1OdMml4vxs86dO8lDJDrHi5GicKWU37OIhVi
 uxxxFZbmAIOBm2cnlM5ETkE9avUX2PRA7JEoq2o0KZmeLniBVa8aKkyQG1LDclBt0iN8
 zcS5v1Kr7G0sMjm/kO95FRQfETpIlEdKabruq87udTigf063Aak8kYUJW0SaqGu+Qfe5
 cMeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyULDudhR6vGBpSxPgW8sbrhWVGu7LBsECMAsoQaGJ6v27795C2nEEZ+szahYYZQbFmu2mHjyraGs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yygd/22QnUKB2uHvq58oylH/x/VTvMv1+M4Zmrg+ECqq64QnufC
 eXP0j/K02GgfKTuVqIZTyU6dqPTz7SuAKSV5lAeogWDQXxjNNhG0SwBY87bxXxc=
X-Gm-Gg: ASbGnct5sOJSdOUngSiV8Hg8wRM4OJ37NErjqXyhQbXI0aS1DSfvHAPWYrqT8tphPm1
 xsZIpGdLoCVLwbWVmKFrzLOFrRlR4M4iGzMejV9UiGG8n8vT2XE5Z9Zu9uOcIOK6lK4kREg05w0
 R8TsN1OPcGOmz5OH3BFEzNDXlFzt1HqO+cS1WsRzAYGfBDtAbMQ+p0Cdq5EViUt6+uLNqOS9Ktx
 /yiFBhOISO8OpLyqYaABk3oxzOl5NCbwl7LpeGCvEFbfu8onqz/1qggYyVcUkXx3tQauKKiAGxA
 qRncJT4eWELCSXK4e2lSYdINpkRJgSjpQWtDEumpGSJQUeHYLw5FBTwHyL7tVYVh5zVRgX1jrMt
 I32xwYA==
X-Google-Smtp-Source: AGHT+IHP/HVI8920DHkWUudbL09CGIMVh2mmFw18ADlkjqgydR5LKcjUPGttxXMqHgdd2UEVYmuwRQ==
X-Received: by 2002:a05:6512:3f28:b0:545:b49:f96d with SMTP id
 2adb3069b0e04-548510712admr2315191e87.0.1740503893983; 
 Tue, 25 Feb 2025 09:18:13 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-548514b261esm229975e87.24.2025.02.25.09.18.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 09:18:13 -0800 (PST)
Date: Tue, 25 Feb 2025 19:18:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 robdclark@gmail.com, sean@poorly.run, marijn.suijten@somainline.org, 
 andersson@kernel.org, robh@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org, 
 konradybcio@kernel.org, conor+dt@kernel.org, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com, 
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com, quic_jesszhan@quicinc.com
Subject: Re: [PATCH 05/11] drm/msm/dsi: add DSI support for SA8775P
Message-ID: <hl352hhpv6imtilpw554njkpod4nycjlls4gg75barlugc2e42@okw2snj2bqm3>
References: <20250225121824.3869719-1-quic_amakhija@quicinc.com>
 <20250225121824.3869719-6-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225121824.3869719-6-quic_amakhija@quicinc.com>
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

On Tue, Feb 25, 2025 at 05:48:18PM +0530, Ayushi Makhija wrote:
> Add DSI Controller v2.5.1 support for SA8775P SoC.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c | 18 ++++++++++++++++++
>  drivers/gpu/drm/msm/dsi/dsi_cfg.h |  1 +
>  2 files changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> index 7754dcec33d0..71881d9370af 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> @@ -221,6 +221,22 @@ static const struct msm_dsi_config sc7280_dsi_cfg = {
>  	},
>  };
>  
> +static const struct regulator_bulk_data sa8775p_dsi_regulators[] = {
> +	{ .supply = "vdda", .init_load_uA = 30100 },    /* 1.2 V */
> +	{ .supply = "refgen" },
> +};

sc7280 has 8350 uA here. I'd say, having those two next to each other is
suspicious. Could you please doublecheck it?

LGTM otherwise

> +
> +static const struct msm_dsi_config sa8775p_dsi_cfg = {
> +	.io_offset = DSI_6G_REG_SHIFT,
> +	.regulator_data = sa8775p_dsi_regulators,
> +	.num_regulators = ARRAY_SIZE(sa8775p_dsi_regulators),
> +	.bus_clk_names = dsi_v2_4_clk_names,
> +	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
> +	.io_start = {
> +		{ 0xae94000, 0xae96000 },
> +	},
> +};
> +
>  static const struct msm_dsi_host_cfg_ops msm_dsi_v2_host_ops = {
>  	.link_clk_set_rate = dsi_link_clk_set_rate_v2,
>  	.link_clk_enable = dsi_link_clk_enable_v2,
> @@ -294,6 +310,8 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
>  		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
>  	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_5_0,
>  		&sc7280_dsi_cfg, &msm_dsi_6g_v2_host_ops},
> +	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_5_1,
> +		&sa8775p_dsi_cfg, &msm_dsi_6g_v2_host_ops},
>  	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_6_0,
>  		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
>  	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_7_0,
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> index 120cb65164c1..65b0705fac0e 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> @@ -27,6 +27,7 @@
>  #define MSM_DSI_6G_VER_MINOR_V2_4_0	0x20040000
>  #define MSM_DSI_6G_VER_MINOR_V2_4_1	0x20040001
>  #define MSM_DSI_6G_VER_MINOR_V2_5_0	0x20050000
> +#define MSM_DSI_6G_VER_MINOR_V2_5_1	0x20050001
>  #define MSM_DSI_6G_VER_MINOR_V2_6_0	0x20060000
>  #define MSM_DSI_6G_VER_MINOR_V2_7_0	0x20070000
>  #define MSM_DSI_6G_VER_MINOR_V2_8_0	0x20080000
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
