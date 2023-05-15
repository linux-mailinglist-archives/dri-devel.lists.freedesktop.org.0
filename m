Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE2870414A
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 01:08:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1752088867;
	Mon, 15 May 2023 23:07:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F4688867
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 23:07:36 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 8D3793F7AF;
 Tue, 16 May 2023 01:07:33 +0200 (CEST)
Date: Tue, 16 May 2023 01:07:32 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: Re: [PATCH v9 8/8] drm/msm/dpu: tear down DSC data path when DSC
 disabled
Message-ID: <2kdnvgatumhjzycr574ilbounzus7z2chviemoai3ps7yip6s6@gg3mq7apxqna>
References: <1684185928-24195-1-git-send-email-quic_khsieh@quicinc.com>
 <1684185928-24195-9-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1684185928-24195-9-git-send-email-quic_khsieh@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 quic_abhinavk@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 quic_jesszhan@quicinc.com, swboyd@chromium.org, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tear down DSC datapath* on encoder cleanup*

On 2023-05-15 14:25:28, Kuogee Hsieh wrote:
> 
> Unset DSC_ACTIVE bit at dpu_hw_ctl_reset_intf_cfg_v1(),
> dpu_encoder_unprep_dsc() and dpu_encoder_dsc_pipe_clr() functions
> to tear down DSC data path if DSC data path was setup previous.
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 43 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c  |  7 +++++
>  2 files changed, 50 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 5cae70e..ee999ce 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1214,6 +1214,44 @@ static void dpu_encoder_virt_atomic_enable(struct drm_encoder *drm_enc,
>  	mutex_unlock(&dpu_enc->enc_lock);
>  }
>  
> +static void dpu_encoder_dsc_pipe_clr(struct dpu_encoder_virt *dpu_enc,

I'd have passed hw_ctl directly.

> +				     struct dpu_hw_dsc *hw_dsc,
> +				     struct dpu_hw_pingpong *hw_pp)
> +{
> +	struct dpu_encoder_phys *cur_master = dpu_enc->cur_master;
> +	struct dpu_hw_ctl *ctl;
> +
> +	ctl = cur_master->hw_ctl;
> +
> +	if (hw_dsc->ops.dsc_disable)
> +		hw_dsc->ops.dsc_disable(hw_dsc);
> +
> +	if (hw_pp->ops.disable_dsc)
> +		hw_pp->ops.disable_dsc(hw_pp);
> +
> +	if (hw_dsc->ops.dsc_bind_pingpong_blk)
> +		hw_dsc->ops.dsc_bind_pingpong_blk(hw_dsc, PINGPONG_NONE);
> +
> +	if (ctl->ops.update_pending_flush_dsc)
> +		ctl->ops.update_pending_flush_dsc(ctl, hw_dsc->idx);
> +}
> +
> +static void dpu_encoder_unprep_dsc(struct dpu_encoder_virt *dpu_enc)
> +{
> +	/* coding only for 2LM, 2enc, 1 dsc config */
> +	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
> +	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
> +	int i;
> +
> +	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
> +		hw_pp[i] = dpu_enc->hw_pp[i];
> +		hw_dsc[i] = dpu_enc->hw_dsc[i];
> +
> +		if (hw_pp[i] && hw_dsc[i])
> +			dpu_encoder_dsc_pipe_clr(dpu_enc, hw_dsc[i], hw_pp[i]);
> +	}
> +}

Define these two functions right above
dpu_encoder_helper_phys_cleanup(), or right next to
dpu_encoder_prep_dsc() and dpu_encoder_dsc_pipe_cfg(), intead of
splitting dpu_encoder_virt_atomic_{en,dis}able() at a random point in
this file.

> +
>  static void dpu_encoder_virt_atomic_disable(struct drm_encoder *drm_enc,
>  					struct drm_atomic_state *state)
>  {
> @@ -2090,6 +2128,9 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
>  					phys_enc->hw_pp->merge_3d->idx);
>  	}
>  
> +	if (dpu_enc->dsc)
> +		dpu_encoder_unprep_dsc(dpu_enc);
> +
>  	intf_cfg.stream_sel = 0; /* Don't care value for video mode */
>  	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);

Here.

>  
> @@ -2101,6 +2142,8 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
>  	if (phys_enc->hw_pp->merge_3d)
>  		intf_cfg.merge_3d = phys_enc->hw_pp->merge_3d->idx;
>  
> +	intf_cfg.dsc = dpu_encoder_helper_get_dsc(phys_enc);

Since this is assigned unconditionally, can you assign this right below
where intf_cfg.mode_3d is assigned so that we have a static and a
conditional part?

> +
>  	if (ctl->ops.reset_intf_cfg)
>  		ctl->ops.reset_intf_cfg(ctl, &intf_cfg);
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index f3a50cc..aec3b08 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -577,6 +577,7 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>  	u32 intf_active = 0;
>  	u32 wb_active = 0;
>  	u32 merge3d_active = 0;
> +	u32 dsc_active;

Any idea why the others are zero-assigned above for no reason (no need
to clean that up in this patch)?

>  
>  	/*
>  	 * This API resets each portion of the CTL path namely,
> @@ -606,6 +607,12 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>  		wb_active &= ~BIT(cfg->wb - WB_0);
>  		DPU_REG_WRITE(c, CTL_WB_ACTIVE, wb_active);
>  	}
> +
> +	if (cfg->dsc) {
> +		dsc_active = DPU_REG_READ(c, CTL_DSC_ACTIVE);

Do we really need to read it back?  dpu_hw_ctl_intf_cfg_v1() doesn't
read it back either and plainly writes cfg->dsc.  If we always have a
complete overview of what DSC's are enabled/active for this CTL (which
we have), this could just be written to 0.

But let's leave that now and discuss this separately, as the above does
the same for merge_3d, intf and wb.

- Marijn

> +		dsc_active &= ~cfg->dsc;
> +		DPU_REG_WRITE(c, CTL_DSC_ACTIVE, dsc_active);
> +	}
>  }
>  
>  static void dpu_hw_ctl_set_fetch_pipe_active(struct dpu_hw_ctl *ctx,
> -- 
> 2.7.4
> 
