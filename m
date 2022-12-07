Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFC8645C13
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 15:08:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62ED910E3B7;
	Wed,  7 Dec 2022 14:08:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8073310E3B5
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 14:08:37 +0000 (UTC)
Received: from SoMainline.org (94-209-172-39.cable.dynamic.v4.ziggo.nl
 [94.209.172.39])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 0E1893F291;
 Wed,  7 Dec 2022 15:08:34 +0100 (CET)
Date: Wed, 7 Dec 2022 15:08:32 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Kalyan Thota <quic_kalyant@quicinc.com>
Subject: Re: [v10] drm/msm/disp/dpu1: add support for dspp sub block flush in
 sc7280
Message-ID: <20221207140832.6r2kznoulfek7yye@SoMainline.org>
References: <1670417963-19426-1-git-send-email-quic_kalyant@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1670417963-19426-1-git-send-email-quic_kalyant@quicinc.com>
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
Cc: robdclark@chromium.org, devicetree@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, dmitry.baryshkov@linaro.org, swboyd@chromium.org,
 freedreno@lists.freedesktop.org, quic_vpolimer@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-12-07 04:59:23, Kalyan Thota wrote:
> Flush mechanism for DSPP blocks has changed in sc7280 family, it
> allows individual sub blocks to be flushed in coordination with
> master flush control.
> 
> Representation: master_flush && (PCC_flush | IGC_flush .. etc )
> 
> This change adds necessary support for the above design.
> 
> Changes in v1:
> - Few nits (Doug, Dmitry)
> - Restrict sub-block flush programming to dpu_hw_ctl file (Dmitry)
> 
> Changes in v2:
> - Move the address offset to flush macro (Dmitry)
> - Seperate ops for the sub block flush (Dmitry)
> 
> Changes in v3:
> - Reuse the DPU_DSPP_xx enum instead of a new one (Dmitry)
> 
> Changes in v4:
> - Use shorter version for unsigned int (Stephen)
> 
> Changes in v5:
> - Spurious patch please ignore.
> 
> Changes in v6:
> - Add SOB tag (Doug, Dmitry)
> 
> Changes in v7:
> - Cache flush mask per dspp (Dmitry)
> - Few nits (Marijn)
> 
> Changes in v8:
> - Few nits (Marijn)
> 
> Changes in v9:
> - use DSPP enum while accessing flush mask to make it readable (Dmitry)
> - Few nits (Dmitry)
> 
> Changes in v10:
> - fix white spaces in a seperate patch (Dmitry)
> 
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c       |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  5 ++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  4 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     | 44 ++++++++++++++++++++++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h     |  5 ++-
>  5 files changed, 55 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 601d687..4170fbe 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -766,7 +766,7 @@ static void _dpu_crtc_setup_cp_blocks(struct drm_crtc *crtc)
>  
>  		/* stage config flush mask */
>  		ctl->ops.update_pending_flush_dspp(ctl,
> -			mixer[i].hw_dspp->idx);
> +			mixer[i].hw_dspp->idx, DPU_DSPP_PCC);
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 27f029f..0eecb2f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -65,7 +65,10 @@
>  	(PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE2))
>  
>  #define CTL_SC7280_MASK \
> -	(BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE) | BIT(DPU_CTL_VM_CFG))
> +	(BIT(DPU_CTL_ACTIVE_CFG) | \
> +	 BIT(DPU_CTL_FETCH_ACTIVE) | \
> +	 BIT(DPU_CTL_VM_CFG) | \
> +	 BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
>  
>  #define MERGE_3D_SM8150_MASK (0)
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 38aa38a..126ee37 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -161,10 +161,12 @@ enum {
>   * DSPP sub-blocks
>   * @DPU_DSPP_PCC             Panel color correction block
>   * @DPU_DSPP_GC              Gamma correction block
> + * @DPU_DSPP_IGC             Inverse gamma correction block
>   */
>  enum {
>  	DPU_DSPP_PCC = 0x1,
>  	DPU_DSPP_GC,
> +	DPU_DSPP_IGC,
>  	DPU_DSPP_MAX
>  };
>  
> @@ -191,6 +193,7 @@ enum {
>   * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
>   * @DPU_CTL_FETCH_ACTIVE:	Active CTL for fetch HW (SSPPs)
>   * @DPU_CTL_VM_CFG:		CTL config to support multiple VMs
> + * @DPU_CTL_DSPP_BLOCK_FLUSH  CTL config to support dspp sub-block flush

The above uses tabs, why does this use spaces?

>   * @DPU_CTL_MAX
>   */
>  enum {
> @@ -198,6 +201,7 @@ enum {
>  	DPU_CTL_ACTIVE_CFG,
>  	DPU_CTL_FETCH_ACTIVE,
>  	DPU_CTL_VM_CFG,
> +	DPU_CTL_DSPP_SUB_BLOCK_FLUSH,
>  	DPU_CTL_MAX
>  };
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index a35ecb6..e801be1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -33,6 +33,7 @@
>  #define   CTL_INTF_FLUSH                0x110
>  #define   CTL_INTF_MASTER               0x134
>  #define   CTL_FETCH_PIPE_ACTIVE         0x0FC
> +#define   CTL_DSPP_n_FLUSH(n)           ((0x13C) + ((n) * 4))
>  
>  #define CTL_MIXER_BORDER_OUT            BIT(24)
>  #define CTL_FLUSH_MASK_CTL              BIT(17)
> @@ -113,6 +114,9 @@ static inline void dpu_hw_ctl_clear_pending_flush(struct dpu_hw_ctl *ctx)
>  	trace_dpu_hw_ctl_clear_pending_flush(ctx->pending_flush_mask,
>  				     dpu_hw_ctl_get_flush_register(ctx));
>  	ctx->pending_flush_mask = 0x0;
> +
> +	memset(ctx->pending_dspp_flush_mask, 0,
> +		sizeof(ctx->pending_dspp_flush_mask));
>  }
>  
>  static inline void dpu_hw_ctl_update_pending_flush(struct dpu_hw_ctl *ctx,
> @@ -130,6 +134,8 @@ static u32 dpu_hw_ctl_get_pending_flush(struct dpu_hw_ctl *ctx)
>  
>  static inline void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
>  {
> +	int dspp;
> +
>  	if (ctx->pending_flush_mask & BIT(MERGE_3D_IDX))
>  		DPU_REG_WRITE(&ctx->hw, CTL_MERGE_3D_FLUSH,
>  				ctx->pending_merge_3d_flush_mask);
> @@ -140,6 +146,11 @@ static inline void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
>  		DPU_REG_WRITE(&ctx->hw, CTL_WB_FLUSH,
>  				ctx->pending_wb_flush_mask);
>  
> +	for(dspp = DSPP_0; dspp < DSPP_MAX; dspp++)

Space between for and (?

> +		if (ctx->pending_dspp_flush_mask[dspp - DSPP_0])
> +			DPU_REG_WRITE(&ctx->hw, CTL_DSPP_n_FLUSH(dspp - DSPP_0),
> +				ctx->pending_dspp_flush_mask[dspp - DSPP_0]);

Shouldn't this loop as a whole check if _any_ DSPP flush is requested
via `pending_flush_mask & BIT(29)`?  The other flushes don't check the
per-block mask value either (and could write zero that way) but only
base this check on the presence of a global flush mask for that block.

> +
>  	DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, ctx->pending_flush_mask);
>  }
>  
> @@ -287,8 +298,9 @@ static void dpu_hw_ctl_update_pending_flush_merge_3d_v1(struct dpu_hw_ctl *ctx,
>  }
>  
>  static void dpu_hw_ctl_update_pending_flush_dspp(struct dpu_hw_ctl *ctx,
> -	enum dpu_dspp dspp)
> +	enum dpu_dspp dspp, u32 dspp_sub_blk)
>  {
> +

Empty line needed for?

>  	switch (dspp) {
>  	case DSPP_0:
>  		ctx->pending_flush_mask |= BIT(13);
> @@ -307,6 +319,30 @@ static void dpu_hw_ctl_update_pending_flush_dspp(struct dpu_hw_ctl *ctx,
>  	}
>  }
>  
> +static void dpu_hw_ctl_update_pending_flush_dspp_subblocks(
> +	struct dpu_hw_ctl *ctx,	enum dpu_dspp dspp, u32 dspp_sub_blk)
> +{
> +

And here?

> +	if (dspp >= DSPP_MAX)
> +		return;
> +
> +	switch (dspp_sub_blk) {
> +	case DPU_DSPP_IGC:
> +		ctx->pending_dspp_flush_mask[dspp - DSPP_0] |= BIT(2);
> +		break;
> +	case DPU_DSPP_PCC:
> +		ctx->pending_dspp_flush_mask[dspp - DSPP_0] |= BIT(4);
> +		break;
> +	case DPU_DSPP_GC:
> +		ctx->pending_dspp_flush_mask[dspp - DSPP_0] |= BIT(5);
> +		break;
> +	default:
> +		return;
> +	}
> +
> +	ctx->pending_flush_mask |= BIT(29);

Can/should we define an _IDX for this, like is done with MERGE_3D_IDX,
DSC_IDX, INTF_IDX and WB_IDX?

> +}
> +
>  static u32 dpu_hw_ctl_poll_reset_status(struct dpu_hw_ctl *ctx, u32 timeout_us)
>  {
>  	struct dpu_hw_blk_reg_map *c = &ctx->hw;
> @@ -675,7 +711,11 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
>  	ops->setup_blendstage = dpu_hw_ctl_setup_blendstage;
>  	ops->update_pending_flush_sspp = dpu_hw_ctl_update_pending_flush_sspp;
>  	ops->update_pending_flush_mixer = dpu_hw_ctl_update_pending_flush_mixer;
> -	ops->update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;
> +	if (cap & BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
> +		ops->update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp_subblocks;
> +	else
> +		ops->update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;
> +
>  	if (cap & BIT(DPU_CTL_FETCH_ACTIVE))
>  		ops->set_active_pipes = dpu_hw_ctl_set_fetch_pipe_active;
>  };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> index 96c012e..78611a8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> @@ -152,9 +152,11 @@ struct dpu_hw_ctl_ops {
>  	 * No effect on hardware
>  	 * @ctx       : ctl path ctx pointer
>  	 * @blk       : DSPP block index
> +	 * @dspp_sub_blk : DSPP sub-block index
>  	 */
>  	void (*update_pending_flush_dspp)(struct dpu_hw_ctl *ctx,
> -		enum dpu_dspp blk);
> +		enum dpu_dspp blk, u32 dspp_sub_blk);
> +
>  	/**
>  	 * Write the value of the pending_flush_mask to hardware
>  	 * @ctx       : ctl path ctx pointer
> @@ -242,6 +244,7 @@ struct dpu_hw_ctl {
>  	u32 pending_intf_flush_mask;
>  	u32 pending_wb_flush_mask;
>  	u32 pending_merge_3d_flush_mask;
> +	u32 pending_dspp_flush_mask[DSPP_MAX - DSPP_0];
>  
>  	/* ops */
>  	struct dpu_hw_ctl_ops ops;
> -- 
> 2.7.4
> 
