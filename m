Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AAD844E49
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 02:07:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74B9010FE14;
	Thu,  1 Feb 2024 01:07:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F4110FE14
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Feb 2024 01:06:59 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-60412f65124so4100897b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 17:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706749558; x=1707354358; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MiJfKuLh0ReoY4qt8Rcgd+MaO8ThKHNzK3ZyVm/U3ws=;
 b=EvArYXdRLNhwGZNhcRRMyoA77wAkit80bkLl4eu37d7iCqXITP3JLgrEN63Qcr/TS9
 b/Or0ksgL75K2F/leo70cmkGjQZTcQr4CXDDOAPWvLlv64XF/sL0mV7qo4xDntdQQRZE
 8Gr3XaI8gUzlBrtU1fU5uK0MaC3F/2cMQXlWLnwUd2jps/pOn5hcHV1PxXqBRfLp9sSY
 cwy7IyO+swiI9G8sO1c7tKHs4NuxyAvDsWxGjsY8pf7rpPiAnFLzTp7Fd8Slveyrlg6M
 +Rq5iP4MT+WOSww68VVb5xyWmPlcMnJByMGHNT29I0pz5tR/FxAkYz33XrOv78AvThkd
 /wCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706749558; x=1707354358;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MiJfKuLh0ReoY4qt8Rcgd+MaO8ThKHNzK3ZyVm/U3ws=;
 b=Imak0QzLZwzY1GSfCnvAfaLI2sZ3SK9tePAPepPiU1dyQqjcGcSgGtNRibHq9HejXI
 zDjsVrkD5p7cQF0BMW2QbF/c6Hwpx2AaB3XDCODP52W5t3IwuBdNT/cUUU5q7VDhC3Dk
 Ww47b2UaJL3An5t6M3NpYgSuIpx3o4zvxxInfEVgT3jer+Ut0JzM0auyXzYe7gRMvI50
 EIn28ufj8KYG7imtoednbbHIgihUjPNdqQPlDSxHwdoUpgtZbHnb4L0L1ghPRzfV68oT
 PYSKeFj/+R5LUX9ZOfedZA/JEZIVRwp0k1ZGVfSDMbCt5CXm3dv0awLgjxYwIHk/6Acm
 CdXg==
X-Gm-Message-State: AOJu0Yyd1IcuGPFq6VjVjGx0ZQHzAf/tkVxmvdAcqcx2mI+zS92iubA0
 ucA7PjR5hrC76AomFro068oilbxztrdVShsRb3WpCg2ZqDZWGFUgiMVp2RVMHlrvFTgWJ0VkP6m
 A79jI6FKJ4uapwe6bcvhp2g+j4YbUAfJcpys1oA==
X-Google-Smtp-Source: AGHT+IESNgSAKisM93yefyhvpq+nkBlr7eYYAtyVS7Xq+pTa0xcg9+3f75rHn9uaV33udWIAlqA0sRA0UBgZm5qqp6U=
X-Received: by 2002:a81:9bd4:0:b0:604:bf4:97df with SMTP id
 s203-20020a819bd4000000b006040bf497dfmr2977198ywg.52.1706749558318; Wed, 31
 Jan 2024 17:05:58 -0800 (PST)
MIME-Version: 1.0
References: <20240201004737.2478-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20240201004737.2478-1-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 1 Feb 2024 03:05:47 +0200
Message-ID: <CAA8EJpqG8C=ydpE_w7mWN-PJoAcOyZjQ5J1e7QoVY=MBUkWMxQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: fix the programming of INTF_CFG2_DATA_HCTL_EN
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 quic_parellan@quicinc.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 seanpaul@chromium.org, Daniel Vetter <daniel@ffwll.ch>,
 quic_jesszhan@quicinc.com, Marijn Suijten <marijn.suijten@somainline.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 1 Feb 2024 at 02:48, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Currently INTF_CFG2_DATA_HCTL_EN is coupled with the enablement
> of widebus but this is incorrect because we should be enabling
> this bit independent of widebus except for cases where compression
> is enabled in one pixel per clock mode.
>
> Fix this by making the condition checks more explicit and enabling
> INTF_CFG2_DATA_HCTL_EN for all other cases when supported by DPU.
>
> Fixes: 3309a7563971 ("drm/msm/dpu: revise timing engine programming to support widebus feature")
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Thank you!

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

For the reference: although it is marked as a fix, I'd prefer if this
patch undergoes a full cycle through msm-next rather than
fast-tracking through msm-fixes. This would allow us to catch possible
issues. WDYT?

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c       |  7 +++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h       |  7 +++++++
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c       | 15 +++++++++------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h       |  1 +
>  5 files changed, 25 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 83380bc92a00..467f874979d5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -230,6 +230,13 @@ bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc)
>         return dpu_enc->wide_bus_en;
>  }
>
> +bool dpu_encoder_is_dsc_enabled(const struct drm_encoder *drm_enc)
> +{
> +       const struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> +
> +       return dpu_enc->dsc ? true : false;
> +}
> +
>  int dpu_encoder_get_crc_values_cnt(const struct drm_encoder *drm_enc)
>  {
>         struct dpu_encoder_virt *dpu_enc;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index 4c05fd5e9ed1..fe6b1d312a74 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -158,6 +158,13 @@ int dpu_encoder_get_vsync_count(struct drm_encoder *drm_enc);
>
>  bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc);
>
> +/**
> + * dpu_encoder_is_dsc_enabled - indicate whether dsc is enabled
> + *                             for the encoder.
> + * @drm_enc:    Pointer to previously created drm encoder structure
> + */
> +bool dpu_encoder_is_dsc_enabled(const struct drm_encoder *drm_enc);
> +
>  /**
>   * dpu_encoder_get_crc_values_cnt - get number of physical encoders contained
>   *     in virtual encoder that can collect CRC values
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index d0f56c5c4cce..f562beb6f797 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -102,6 +102,7 @@ static void drm_mode_to_intf_timing_params(
>         }
>
>         timing->wide_bus_en = dpu_encoder_is_widebus_enabled(phys_enc->parent);
> +       timing->compression_en = dpu_encoder_is_dsc_enabled(phys_enc->parent);
>
>         /*
>          * for DP, divide the horizonal parameters by 2 when
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 6bba531d6dc4..965692ef7892 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -163,13 +163,8 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>         hsync_ctl = (hsync_period << 16) | p->hsync_pulse_width;
>         display_hctl = (hsync_end_x << 16) | hsync_start_x;
>
> -       /*
> -        * DATA_HCTL_EN controls data timing which can be different from
> -        * video timing. It is recommended to enable it for all cases, except
> -        * if compression is enabled in 1 pixel per clock mode
> -        */
>         if (p->wide_bus_en)
> -               intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN | INTF_CFG2_DATA_HCTL_EN;
> +               intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN;
>
>         data_width = p->width;
>
> @@ -229,6 +224,14 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>         DPU_REG_WRITE(c, INTF_CONFIG, intf_cfg);
>         DPU_REG_WRITE(c, INTF_PANEL_FORMAT, panel_format);
>         if (ctx->cap->features & BIT(DPU_DATA_HCTL_EN)) {
> +               /*
> +                * DATA_HCTL_EN controls data timing which can be different from
> +                * video timing. It is recommended to enable it for all cases, except
> +                * if compression is enabled in 1 pixel per clock mode
> +                */
> +               if (!(p->compression_en && !p->wide_bus_en))
> +                       intf_cfg2 |= INTF_CFG2_DATA_HCTL_EN;
> +
>                 DPU_REG_WRITE(c, INTF_CONFIG2, intf_cfg2);
>                 DPU_REG_WRITE(c, INTF_DISPLAY_DATA_HCTL, display_data_hctl);
>                 DPU_REG_WRITE(c, INTF_ACTIVE_DATA_HCTL, active_data_hctl);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> index 0bd57a32144a..6f4c87244f94 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> @@ -33,6 +33,7 @@ struct dpu_hw_intf_timing_params {
>         u32 hsync_skew;
>
>         bool wide_bus_en;
> +       bool compression_en;
>  };
>
>  struct dpu_hw_intf_prog_fetch {
> --
> 2.40.1
>


-- 
With best wishes
Dmitry
