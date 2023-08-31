Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EDE78E3C9
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 02:13:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 872A610E633;
	Thu, 31 Aug 2023 00:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690EC10E16D
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 00:12:56 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-59234aaca15so3963607b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 17:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693440775; x=1694045575; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uB42wgi5zKPoz4tsvVLFs6mrIWVkie3x4g1c83D83TQ=;
 b=uc8gmx/NCaiX547b2d0f+CcxgqimS2ldLCaG/SNwEhDn2vKS78fJCBG7FZNZdC7pJt
 VB/GtBrr8e71cRbdZNrHMpN+8HO1wW/t8VLdq7OtkUgdMZnqko3smIstW31T0QvRcbgz
 ojx/nzdwGNUJAgI8UGmOZs8zDArIJ/DXEgqpC0TW1SoodKIgnKA0AE4opJ5DmzMJn8jX
 Vtsem0qEV0civif/OJvSs1xJXahquZZYokFPH0Xre3hV8azMyZoXYLQplap5Rwg7AMso
 OboMW9rP8p52pRME8jPyADGY8NNTdQXT8qwBSEzLB+XKGGDlj52a/durUKdt/RNlp9BS
 auWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693440775; x=1694045575;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uB42wgi5zKPoz4tsvVLFs6mrIWVkie3x4g1c83D83TQ=;
 b=JSaBkF6Z3DY+mqueBc/ovCNV0Hfg6MTprywc+HEAY0InDjIBngueBPu7pr2jsHgbWv
 Qg1TwojBYQPWXs5lJeUTCTwdCdhqBdYL8EYqdSL/23nYAe+lg+5NcjOVexkyz3zri4KB
 iMbJVsKXHrOEw+fPLtWAvHH8FDmS5sJxTK8EwqThNqd/Y4j/yvdkU48VMI5UUW2egR5z
 uDSCwmqJmA8oDC2XbhzJcQxkuGmIAHOyHtLRfVci2VxN1VV2qNk6lrzc/xAESV92PbsL
 e3C1H14uZu8NMRObg18Z1Ec2edsjmkdC4xMlYvWFT2PhFa6xf862X6Z+xWKt2O8C8T4a
 ZIQw==
X-Gm-Message-State: AOJu0YxIH4Xetmu23X9XIzzt4Uuk9ckXU9fz7/ycvHTMRfQNQJ0Sa2nM
 GGKyoHrMKtkzUNjA4RflOfZv5oZ6WojSk7PN4Z/ozg==
X-Google-Smtp-Source: AGHT+IHJPWD4082q32XupzA2SUKM8QzoZgDEaLCudCtV29/rVov8BhGYCk6L60hz3xHb/d3yhmfAs4wNRQklM7PvsqE=
X-Received: by 2002:a0d:cc96:0:b0:58d:5df8:f61e with SMTP id
 o144-20020a0dcc96000000b0058d5df8f61emr3803790ywd.2.1693440775525; Wed, 30
 Aug 2023 17:12:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230830224910.8091-1-quic_abhinavk@quicinc.com>
 <20230830224910.8091-10-quic_abhinavk@quicinc.com>
In-Reply-To: <20230830224910.8091-10-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 31 Aug 2023 03:12:44 +0300
Message-ID: <CAA8EJpqEDmXRLHK73pHrCHOXRZPUKeA6OqEwvhoqPBrN+rbAaQ@mail.gmail.com>
Subject: Re: [PATCH 09/16] drm/msm/dpu: add CDM related logic to dpu_hw_ctl
 layer
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_khsieh@quicinc.com, quic_parellan@quicinc.com, quic_jesszhan@quicinc.com,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 31 Aug 2023 at 01:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> CDM block will need its own logic to program the flush and active
> bits in the dpu_hw_ctl layer.
>
> Make necessary changes in dpu_hw_ctl to support CDM programming.
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 34 ++++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h | 11 +++++++
>  2 files changed, 45 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index c278fb9d2b5b..beced9f19740 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -29,11 +29,13 @@
>  #define   CTL_DSC_ACTIVE                0x0E8
>  #define   CTL_WB_ACTIVE                 0x0EC
>  #define   CTL_INTF_ACTIVE               0x0F4
> +#define   CTL_CDM_ACTIVE                0x0F8
>  #define   CTL_FETCH_PIPE_ACTIVE         0x0FC
>  #define   CTL_MERGE_3D_FLUSH            0x100
>  #define   CTL_DSC_FLUSH                0x104
>  #define   CTL_WB_FLUSH                  0x108
>  #define   CTL_INTF_FLUSH                0x110
> +#define   CTL_CDM_FLUSH                0x114
>  #define   CTL_INTF_MASTER               0x134
>  #define   CTL_DSPP_n_FLUSH(n)           ((0x13C) + ((n) * 4))
>
> @@ -43,6 +45,7 @@
>  #define DPU_REG_RESET_TIMEOUT_US        2000
>  #define  MERGE_3D_IDX   23
>  #define  DSC_IDX        22
> +#define CDM_IDX         26
>  #define  INTF_IDX       31
>  #define WB_IDX          16
>  #define  DSPP_IDX       29  /* From DPU hw rev 7.x.x */
> @@ -104,6 +107,7 @@ static inline void dpu_hw_ctl_clear_pending_flush(struct dpu_hw_ctl *ctx)
>         ctx->pending_wb_flush_mask = 0;
>         ctx->pending_merge_3d_flush_mask = 0;
>         ctx->pending_dsc_flush_mask = 0;
> +       ctx->pending_cdm_flush_mask = 0;
>
>         memset(ctx->pending_dspp_flush_mask, 0,
>                 sizeof(ctx->pending_dspp_flush_mask));
> @@ -148,6 +152,10 @@ static inline void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
>                 DPU_REG_WRITE(&ctx->hw, CTL_DSC_FLUSH,
>                               ctx->pending_dsc_flush_mask);
>
> +       if (ctx->pending_flush_mask & BIT(CDM_IDX))
> +               DPU_REG_WRITE(&ctx->hw, CTL_CDM_FLUSH,
> +                             ctx->pending_cdm_flush_mask);
> +
>         DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, ctx->pending_flush_mask);
>  }
>
> @@ -273,6 +281,12 @@ static void dpu_hw_ctl_update_pending_flush_wb(struct dpu_hw_ctl *ctx,
>         }
>  }
>
> +static void dpu_hw_ctl_update_pending_flush_cdm(struct dpu_hw_ctl *ctx)
> +{
> +       ctx->pending_flush_mask |= BIT(CDM_IDX);
> +

unused empty line.

> +}
> +
>  static void dpu_hw_ctl_update_pending_flush_wb_v1(struct dpu_hw_ctl *ctx,
>                 enum dpu_wb wb)
>  {
> @@ -301,6 +315,12 @@ static void dpu_hw_ctl_update_pending_flush_dsc_v1(struct dpu_hw_ctl *ctx,
>         ctx->pending_flush_mask |= BIT(DSC_IDX);
>  }
>
> +static void dpu_hw_ctl_update_pending_flush_cdm_v1(struct dpu_hw_ctl *ctx)
> +{
> +       ctx->pending_cdm_flush_mask |= BIT(0);

I'd assume this is because there is just CDM_0? Then it still might be
better to write BIT(cdm->idx - CDM_0).

> +       ctx->pending_flush_mask |= BIT(CDM_IDX);
> +}
> +
>  static void dpu_hw_ctl_update_pending_flush_dspp(struct dpu_hw_ctl *ctx,
>         enum dpu_dspp dspp, u32 dspp_sub_blk)
>  {
> @@ -504,6 +524,7 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>         u32 intf_active = 0;
>         u32 wb_active = 0;
>         u32 mode_sel = 0;
> +       u32 cdm_active = 0;
>
>         /* CTL_TOP[31:28] carries group_id to collate CTL paths
>          * per VM. Explicitly disable it until VM support is
> @@ -517,6 +538,7 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>
>         intf_active = DPU_REG_READ(c, CTL_INTF_ACTIVE);
>         wb_active = DPU_REG_READ(c, CTL_WB_ACTIVE);
> +       cdm_active = DPU_REG_READ(c, CTL_CDM_ACTIVE);
>
>         if (cfg->intf)
>                 intf_active |= BIT(cfg->intf - INTF_0);
> @@ -534,6 +556,9 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>
>         if (cfg->dsc)
>                 DPU_REG_WRITE(c, CTL_DSC_ACTIVE, cfg->dsc);
> +
> +       if (cfg->cdm)
> +               DPU_REG_WRITE(c, CTL_CDM_ACTIVE, cfg->cdm);
>  }
>
>  static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
> @@ -577,6 +602,7 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>         u32 wb_active = 0;
>         u32 merge3d_active = 0;
>         u32 dsc_active;
> +       u32 cdm_active;
>
>         /*
>          * This API resets each portion of the CTL path namely,
> @@ -612,6 +638,12 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>                 dsc_active &= ~cfg->dsc;
>                 DPU_REG_WRITE(c, CTL_DSC_ACTIVE, dsc_active);
>         }
> +
> +       if (cfg->cdm) {
> +               cdm_active = DPU_REG_READ(c, CTL_CDM_ACTIVE);
> +               cdm_active &= ~cfg->cdm;
> +               DPU_REG_WRITE(c, CTL_CDM_ACTIVE, cdm_active);
> +       }
>  }
>
>  static void dpu_hw_ctl_set_fetch_pipe_active(struct dpu_hw_ctl *ctx,
> @@ -645,12 +677,14 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
>                 ops->update_pending_flush_wb = dpu_hw_ctl_update_pending_flush_wb_v1;
>                 ops->update_pending_flush_dsc =
>                         dpu_hw_ctl_update_pending_flush_dsc_v1;
> +               ops->update_pending_flush_cdm = dpu_hw_ctl_update_pending_flush_cdm_v1;
>         } else {
>                 ops->trigger_flush = dpu_hw_ctl_trigger_flush;
>                 ops->setup_intf_cfg = dpu_hw_ctl_intf_cfg;
>                 ops->update_pending_flush_intf =
>                         dpu_hw_ctl_update_pending_flush_intf;
>                 ops->update_pending_flush_wb = dpu_hw_ctl_update_pending_flush_wb;
> +               ops->update_pending_flush_cdm = dpu_hw_ctl_update_pending_flush_cdm;
>         }
>         ops->clear_pending_flush = dpu_hw_ctl_clear_pending_flush;
>         ops->update_pending_flush = dpu_hw_ctl_update_pending_flush;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> index 1c242298ff2e..6dd44dfdfb61 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> @@ -39,6 +39,7 @@ struct dpu_hw_stage_cfg {
>   * @mode_3d:               3d mux configuration
>   * @merge_3d:              3d merge block used
>   * @intf_mode_sel:         Interface mode, cmd / vid
> + * @cdm:                   CDM block used
>   * @stream_sel:            Stream selection for multi-stream interfaces
>   * @dsc:                   DSC BIT masks used
>   */
> @@ -48,6 +49,7 @@ struct dpu_hw_intf_cfg {
>         enum dpu_3d_blend_mode mode_3d;
>         enum dpu_merge_3d merge_3d;
>         enum dpu_ctl_mode_sel intf_mode_sel;
> +       enum dpu_cdm cdm;
>         int stream_sel;
>         unsigned int dsc;
>  };
> @@ -166,6 +168,13 @@ struct dpu_hw_ctl_ops {
>         void (*update_pending_flush_dsc)(struct dpu_hw_ctl *ctx,
>                                          enum dpu_dsc blk);
>
> +       /**
> +        * OR in the given flushbits to the cached pending_(cdm_)flush_mask
> +        * No effect on hardware
> +        * @ctx: ctl path ctx pointer
> +        */
> +       void (*update_pending_flush_cdm)(struct dpu_hw_ctl *ctx);
> +
>         /**
>          * Write the value of the pending_flush_mask to hardware
>          * @ctx       : ctl path ctx pointer
> @@ -239,6 +248,7 @@ struct dpu_hw_ctl_ops {
>   * @pending_intf_flush_mask: pending INTF flush
>   * @pending_wb_flush_mask: pending WB flush
>   * @pending_dsc_flush_mask: pending DSC flush
> + * @pending_cdm_flush_mask: pending CDM flush
>   * @ops: operation list
>   */
>  struct dpu_hw_ctl {
> @@ -256,6 +266,7 @@ struct dpu_hw_ctl {
>         u32 pending_merge_3d_flush_mask;
>         u32 pending_dspp_flush_mask[DSPP_MAX - DSPP_0];
>         u32 pending_dsc_flush_mask;
> +       u32 pending_cdm_flush_mask;
>
>         /* ops */
>         struct dpu_hw_ctl_ops ops;
> --
> 2.40.1
>


-- 
With best wishes
Dmitry
