Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 120767EBEE6
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 09:54:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23D8710E503;
	Wed, 15 Nov 2023 08:54:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C9F310E506
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 08:54:11 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-5a7af52ee31so76007627b3.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 00:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700038450; x=1700643250; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Pbjo3TAguD6KXTLjuIu3/cGWUkxEw1wpK/hlHSFO3xI=;
 b=zgqW59yYYMD/HKqlF8pmN1cYsuI7ReKPkWYx5MoX1ljXq6i0B5sPkIVcYyIxjqh8jE
 cppMbv5gBtBWeluAM+ooze0ioVF+NJA+Y2sjZ1wbXiS2EqJMW6RxgvKIDMKIrX2WmIAq
 y+wq8nJD6Gih+47aIxB78FXdRlVBgMG0pZ5O9qKTQsI6be4dOJrpsEVqpRAvCV7I7kVt
 nKn9OyETB0r97PWdcpA7CR5gagLJfWTaJP6nT9+DA+EV/mve3SnAJuv5N6v3kA3nEgpA
 OPsD8pl3tNq+YZkemsibkciJaWZgnuW5ST/6co8Wa7YD8R8ZQtBHN9Ga+FEFln4BB3R1
 Vt7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700038450; x=1700643250;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Pbjo3TAguD6KXTLjuIu3/cGWUkxEw1wpK/hlHSFO3xI=;
 b=c4TWcNi+63xu5GoR11qPRfZKrxMWVGkLPVE0vWtun/Bm1GWyfLym2VMDDijLlVupxW
 FnuOcttnmmb6j/CDGER8TUHzq1JCcP+8JHNXzvmFI4vebWhF9DO4UCLf9jrgzfaNLkSG
 Mkuxf1WCNJrK6XiD1a7+9uvgwW0CLWhZcMQxZJL/p7buYkWu+ZWyyJfmQkaQTMHPKrnY
 80ZAlYH7lkKL2GdqjdTk03PQp5cmh8zvHgY65fAO6Xp1GYGnjrZW94D4bXXpSmaw59UR
 H2AO01PHebzt98oJxq/93bj/ZINZjOwKWWiTny6XZb0qKmPK/bmMm0ZLQgzetiA+A8VZ
 KIEw==
X-Gm-Message-State: AOJu0YxVBaRXLCzn56pr9MG+u/zqQ3EIcLk1Gk+ssS1udvVejkt/twqO
 Pk6dcDlkrxCPZl0f28E2PVyQozjianBmA6p8e48ijw==
X-Google-Smtp-Source: AGHT+IEDMvHcwrOwIhCANMLXvIPUaFUum2/1YHpZwaESZfy2I2Os/5+HMHREWDFFhrgyeOeFEN55Ab6h3bYKn0zn45o=
X-Received: by 2002:a0d:f9c6:0:b0:5be:9a1e:5864 with SMTP id
 j189-20020a0df9c6000000b005be9a1e5864mr10921663ywf.10.1700038450409; Wed, 15
 Nov 2023 00:54:10 -0800 (PST)
MIME-Version: 1.0
References: <20231114225857.19702-1-jonathan@marek.ca>
 <20231114225857.19702-2-jonathan@marek.ca>
In-Reply-To: <20231114225857.19702-2-jonathan@marek.ca>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 15 Nov 2023 10:53:59 +0200
Message-ID: <CAA8EJpp0OGkgf0P6LcwE-H6BVN9kbtF_eRCsef+7NgDFmJOZfA@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] drm/msm/dpu: fix video mode DSC for DSI
To: Jonathan Marek <jonathan@marek.ca>
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, freedreno@lists.freedesktop.org,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, Sean Paul <sean@poorly.run>,
 Arnaud Vrac <rawoul@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 15 Nov 2023 at 01:00, Jonathan Marek <jonathan@marek.ca> wrote:
>
> Add necessary DPU changes for DSC to work with DSI video mode.
>
> Note this changes the logic to enable HCTL to match downstream, it will
> now be enabled for the no-DSC no-widebus case.
>
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c         |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h    |  2 +-
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c    | 11 +++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c         | 13 ++++++++++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h         |  1 +
>  5 files changed, 26 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 1cf7ff6caff4..d745c8678b9d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2477,7 +2477,7 @@ enum dpu_intf_mode dpu_encoder_get_intf_mode(struct drm_encoder *encoder)
>         return INTF_MODE_NONE;
>  }
>
> -unsigned int dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc)
> +unsigned int dpu_encoder_helper_get_dsc(const struct dpu_encoder_phys *phys_enc)

Why?

>  {
>         struct drm_encoder *encoder = phys_enc->parent;
>         struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(encoder);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index 6f04c3d56e77..7e27a7da0887 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -332,7 +332,7 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
>   *   used for this encoder.
>   * @phys_enc: Pointer to physical encoder structure
>   */
> -unsigned int dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc);
> +unsigned int dpu_encoder_helper_get_dsc(const struct dpu_encoder_phys *phys_enc);
>
>  /**
>   * dpu_encoder_helper_split_config - split display configuration helper function
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index a01fda711883..df10800a9615 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -100,6 +100,8 @@ static void drm_mode_to_intf_timing_params(
>         }
>
>         timing->wide_bus_en = dpu_encoder_is_widebus_enabled(phys_enc->parent);
> +       if (dpu_encoder_helper_get_dsc(phys_enc))
> +               timing->compression_en = true;
>
>         /*
>          * for DP, divide the horizonal parameters by 2 when
> @@ -112,6 +114,15 @@ static void drm_mode_to_intf_timing_params(
>                 timing->h_front_porch = timing->h_front_porch >> 1;
>                 timing->hsync_pulse_width = timing->hsync_pulse_width >> 1;
>         }
> +
> +       /*
> +        * for DSI, if compression is enabled, then divide the horizonal active
> +        * timing parameters by compression ratio.
> +        */
> +       if (phys_enc->hw_intf->cap->type != INTF_DP && timing->compression_en) {
> +               timing->width = timing->width / 3; /* XXX: don't assume 3:1 compression ratio */

Is this /3 from bpp / compressed_bpp?

> +               timing->xres = timing->width;
> +       }
>  }
>
>  static u32 get_horizontal_total(const struct dpu_hw_intf_timing_params *timing)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index e8b8908d3e12..d6fe45a6da2d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -166,10 +166,21 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>          * video timing. It is recommended to enable it for all cases, except
>          * if compression is enabled in 1 pixel per clock mode
>          */
> +       if (!p->compression_en || p->wide_bus_en)
> +               intf_cfg2 |= INTF_CFG2_DATA_HCTL_EN;
> +
>         if (p->wide_bus_en)
> -               intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN | INTF_CFG2_DATA_HCTL_EN;
> +               intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN;
>
>         data_width = p->width;
> +       if (p->wide_bus_en && !dp_intf)
> +               data_width = p->width >> 1;
> +
> +       if (p->compression_en)
> +               intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
> +
> +       if (p->compression_en && dp_intf)
> +               DPU_ERROR("missing adjustments for DSC+DP\n");
>
>         hsync_data_start_x = hsync_start_x;
>         hsync_data_end_x =  hsync_start_x + data_width - 1;

This should go into a separate commit with the proper justification.

> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> index c539025c418b..15a5fdadd0a0 100644
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
> 2.26.1
>


-- 
With best wishes
Dmitry
