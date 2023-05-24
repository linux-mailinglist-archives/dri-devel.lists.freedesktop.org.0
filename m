Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 868E27100E1
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 00:24:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD18410E615;
	Wed, 24 May 2023 22:24:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B519B10E610
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 22:24:31 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 26E873F77C;
 Thu, 25 May 2023 00:24:29 +0200 (CEST)
Date: Thu, 25 May 2023 00:24:27 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: Re: [PATCH v13 08/10] drm/msm/dpu: separate DSC flush update out of
 interface
Message-ID: <33vzeewjmmykropjubgdiuibwdycagxfggjrjrof4kchsoojn7@j4zt4wefqz3b>
References: <1684800039-18231-1-git-send-email-quic_khsieh@quicinc.com>
 <1684800039-18231-9-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1684800039-18231-9-git-send-email-quic_khsieh@quicinc.com>
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

On 2023-05-22 17:00:37, Kuogee Hsieh wrote:
> Currently DSC flushing happens during interface configuration at
> dpu_hw_ctl_intf_cfg_v1(). Separate DSC flush away from
> dpu_hw_ctl_intf_cfg_v1() by adding dpu_hw_ctl_update_pending_flush_dsc_v1()
> to handle both per-DSC engine and DSC flush bits at same time to make it
> consistent with the location of flush programming of other DPU sub-blocks.
> 
> Changes in v10:
> -- rewording commit text
> -- pass ctl directly instead of dpu_enc to dsc_pipe_cfg()
> -- ctx->pending_dsc_flush_mask = 0;
> 
> Changes in v11:
> -- add Fixes tag
> -- capitalize MERGE_3D, DSPP and DSC at struct dpu_hw_ctl_ops{}

But MERGE_3D and DSPP documentation entries were removed some time
later, though this is not reflected anywhere in the changelog.

> 
> Changes in v12:
> -- move dsc parameter to next line at dpu_encoder_dsc_pipe_cfg()
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 ++++++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c  | 23 +++++++++++++++++------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h  | 11 +++++++++++
>  3 files changed, 36 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index ffa6f04..7fca09e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1834,7 +1834,8 @@ dpu_encoder_dsc_initial_line_calc(struct drm_dsc_config *dsc,
>  	return DIV_ROUND_UP(total_pixels, dsc->slice_width);
>  }
>  
> -static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_dsc *hw_dsc,
> +static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_ctl *ctl,
> +				     struct dpu_hw_dsc *hw_dsc,
>  				     struct dpu_hw_pingpong *hw_pp,
>  				     struct drm_dsc_config *dsc,
>  				     u32 common_mode,
> @@ -1854,6 +1855,9 @@ static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_dsc *hw_dsc,
>  
>  	if (hw_pp->ops.enable_dsc)
>  		hw_pp->ops.enable_dsc(hw_pp);
> +
> +	if (ctl->ops.update_pending_flush_dsc)
> +		ctl->ops.update_pending_flush_dsc(ctl, hw_dsc->idx);
>  }
>  
>  static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
> @@ -1861,6 +1865,7 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
>  {
>  	/* coding only for 2LM, 2enc, 1 dsc config */
>  	struct dpu_encoder_phys *enc_master = dpu_enc->cur_master;
> +	struct dpu_hw_ctl *ctl = enc_master->hw_ctl;
>  	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
>  	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
>  	int this_frame_slices;
> @@ -1898,7 +1903,8 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
>  	initial_lines = dpu_encoder_dsc_initial_line_calc(dsc, enc_ip_w);
>  
>  	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
> -		dpu_encoder_dsc_pipe_cfg(hw_dsc[i], hw_pp[i], dsc, dsc_common_mode, initial_lines);
> +		dpu_encoder_dsc_pipe_cfg(ctl, hw_dsc[i], hw_pp[i],
> +					 dsc, dsc_common_mode, initial_lines);
>  }
>  
>  void dpu_encoder_prepare_for_kickoff(struct drm_encoder *drm_enc)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 64c21e0..ad6983e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -103,6 +103,7 @@ static inline void dpu_hw_ctl_clear_pending_flush(struct dpu_hw_ctl *ctx)
>  	ctx->pending_intf_flush_mask = 0;
>  	ctx->pending_wb_flush_mask = 0;
>  	ctx->pending_merge_3d_flush_mask = 0;
> +	ctx->pending_dsc_flush_mask = 0;
>  
>  	memset(ctx->pending_dspp_flush_mask, 0,
>  		sizeof(ctx->pending_dspp_flush_mask));
> @@ -142,6 +143,11 @@ static inline void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
>  				CTL_DSPP_n_FLUSH(dspp - DSPP_0),
>  				ctx->pending_dspp_flush_mask[dspp - DSPP_0]);
>  		}
> +
> +	if (ctx->pending_flush_mask & BIT(DSC_IDX))
> +		DPU_REG_WRITE(&ctx->hw, CTL_DSC_FLUSH,
> +			      ctx->pending_dsc_flush_mask);
> +
>  	DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, ctx->pending_flush_mask);
>  }
>  
> @@ -288,6 +294,13 @@ static void dpu_hw_ctl_update_pending_flush_merge_3d_v1(struct dpu_hw_ctl *ctx,
>  	ctx->pending_flush_mask |= BIT(MERGE_3D_IDX);
>  }
>  
> +static void dpu_hw_ctl_update_pending_flush_dsc_v1(struct dpu_hw_ctl *ctx,
> +						   enum dpu_dsc dsc_num)
> +{
> +	ctx->pending_dsc_flush_mask |= BIT(dsc_num - DSC_0);
> +	ctx->pending_flush_mask |= BIT(DSC_IDX);
> +}
> +
>  static void dpu_hw_ctl_update_pending_flush_dspp(struct dpu_hw_ctl *ctx,
>  	enum dpu_dspp dspp, u32 dspp_sub_blk)
>  {
> @@ -505,9 +518,6 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>  	if ((test_bit(DPU_CTL_VM_CFG, &ctx->caps->features)))
>  		mode_sel = CTL_DEFAULT_GROUP_ID  << 28;
>  
> -	if (cfg->dsc)
> -		DPU_REG_WRITE(&ctx->hw, CTL_DSC_FLUSH, cfg->dsc);
> -
>  	if (cfg->intf_mode_sel == DPU_CTL_MODE_SEL_CMD)
>  		mode_sel |= BIT(17);
>  
> @@ -527,10 +537,9 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>  	if (cfg->merge_3d)
>  		DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
>  			      BIT(cfg->merge_3d - MERGE_3D_0));
> -	if (cfg->dsc) {
> -		DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, BIT(DSC_IDX));
> +
> +	if (cfg->dsc)
>  		DPU_REG_WRITE(c, CTL_DSC_ACTIVE, cfg->dsc);
> -	}
>  }
>  
>  static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
> @@ -633,6 +642,8 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
>  		ops->update_pending_flush_merge_3d =
>  			dpu_hw_ctl_update_pending_flush_merge_3d_v1;
>  		ops->update_pending_flush_wb = dpu_hw_ctl_update_pending_flush_wb_v1;
> +		ops->update_pending_flush_dsc =
> +			dpu_hw_ctl_update_pending_flush_dsc_v1;
>  	} else {
>  		ops->trigger_flush = dpu_hw_ctl_trigger_flush;
>  		ops->setup_intf_cfg = dpu_hw_ctl_intf_cfg;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> index 6292002..1c24229 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> @@ -158,6 +158,15 @@ struct dpu_hw_ctl_ops {
>  		enum dpu_dspp blk, u32 dspp_sub_blk);
>  
>  	/**
> +	 * OR in the given flushbits to the cached pending_(dsc_)flush_mask
> +	 * No effect on hardware
> +	 * @ctx: ctl path ctx pointer
> +	 * @blk: interface block index
> +	 */
> +	void (*update_pending_flush_dsc)(struct dpu_hw_ctl *ctx,
> +					 enum dpu_dsc blk);
> +
> +	/**
>  	 * Write the value of the pending_flush_mask to hardware
>  	 * @ctx       : ctl path ctx pointer
>  	 */
> @@ -229,6 +238,7 @@ struct dpu_hw_ctl_ops {
>   * @pending_flush_mask: storage for pending ctl_flush managed via ops
>   * @pending_intf_flush_mask: pending INTF flush
>   * @pending_wb_flush_mask: pending WB flush
> + * @pending_dsc_flush_mask: pending DSC flush
>   * @ops: operation list
>   */
>  struct dpu_hw_ctl {
> @@ -245,6 +255,7 @@ struct dpu_hw_ctl {
>  	u32 pending_wb_flush_mask;
>  	u32 pending_merge_3d_flush_mask;
>  	u32 pending_dspp_flush_mask[DSPP_MAX - DSPP_0];
> +	u32 pending_dsc_flush_mask;
>  
>  	/* ops */
>  	struct dpu_hw_ctl_ops ops;
> -- 
> 2.7.4
> 
