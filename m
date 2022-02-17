Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 552FF4BAC9A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 23:32:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0239E10E88D;
	Thu, 17 Feb 2022 22:32:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [5.144.164.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7B4C10E88B
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 22:32:42 +0000 (UTC)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl
 [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id EB6B93F680;
 Thu, 17 Feb 2022 23:32:40 +0100 (CET)
Date: Thu, 17 Feb 2022 23:32:39 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Vinod Koul <vkoul@kernel.org>
Subject: Re: [REPOST PATCH v4 07/13] drm/msm/disp/dpu1: Add support for DSC
 in encoder
Message-ID: <20220217223239.2i256klkbjkogovz@SoMainline.org>
References: <20220210103423.271016-1-vkoul@kernel.org>
 <20220210103423.271016-8-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220210103423.271016-8-vkoul@kernel.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-02-10 16:04:17, Vinod Koul wrote:
> We need to configure the encoder for DSC configuration and calculate DSC
> parameters for the given timing so this patch adds that support by
> adding dpu_encoder_prep_dsc() which is invoked when DSC is enabled.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 164 +++++++++++++++++-
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |   8 +
>  2 files changed, 171 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 1e648db439f9..95a7bf362e81 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -21,6 +21,7 @@
>  #include "dpu_hw_intf.h"
>  #include "dpu_hw_ctl.h"
>  #include "dpu_hw_dspp.h"
> +#include "dpu_hw_dsc.h"
>  #include "dpu_formats.h"
>  #include "dpu_encoder_phys.h"
>  #include "dpu_crtc.h"
> @@ -136,6 +137,8 @@ enum dpu_enc_rc_states {
>   * @cur_slave:		As above but for the slave encoder.
>   * @hw_pp:		Handle to the pingpong blocks used for the display. No.
>   *			pingpong blocks can be different than num_phys_encs.
> + * @hw_dsc:		Handle to the DSC blocks used for the display.
> + * @dsc_mask:		The bitmask of used DSC blocks.

No need for "^The" prefix here.

>   * @intfs_swapped:	Whether or not the phys_enc interfaces have been swapped
>   *			for partial update right-only cases, such as pingpong
>   *			split where virtual pingpong does not generate IRQs
> @@ -169,6 +172,7 @@ enum dpu_enc_rc_states {
>   * @topology:                   topology of the display
>   * @idle_timeout:		idle timeout duration in milliseconds
>   * @dp:				msm_dp pointer, for DP encoders
> + * @dsc:			msm_display_dsc_config pointer, for DSC-enabled encoders
>   */
>  struct dpu_encoder_virt {
>  	struct drm_encoder base;
> @@ -182,6 +186,9 @@ struct dpu_encoder_virt {
>  	struct dpu_encoder_phys *cur_master;
>  	struct dpu_encoder_phys *cur_slave;
>  	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
> +	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
> +
> +	unsigned int dsc_mask;
>  
>  	bool intfs_swapped;
>  
> @@ -209,6 +216,9 @@ struct dpu_encoder_virt {
>  	u32 idle_timeout;
>  
>  	struct msm_dp *dp;
> +
> +	/* DSC configuration */
> +	struct msm_display_dsc_config *dsc;
>  };
>  
>  #define to_dpu_encoder_virt(x) container_of(x, struct dpu_encoder_virt, base)
> @@ -972,7 +982,8 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
>  	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
>  	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
>  	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC] = { NULL };
> -	int num_lm, num_ctl, num_pp;
> +	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
> +	int num_lm, num_ctl, num_pp, num_dsc;
>  	int i, j;
>  
>  	if (!drm_enc) {
> @@ -1027,6 +1038,23 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
>  		dpu_enc->hw_pp[i] = i < num_pp ? to_dpu_hw_pingpong(hw_pp[i])
>  						: NULL;
>  
> +	dpu_enc->dsc_mask = 0;
> +
> +	if (dpu_enc->dsc) {
> +		unsigned int dsc_mask = 0;

Perhaps move this definition outside the if, and unconditionally
perform:

	dpu_enc->dsc_mask = dsc_mask;

Below the if, instead of having to write it twice when ->dsc is truthy?

> +
> +		num_dsc = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> +							drm_enc->base.id, DPU_HW_BLK_DSC,
> +							hw_dsc, ARRAY_SIZE(hw_dsc));
> +		for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
> +			dpu_enc->hw_dsc[i] = i < num_dsc ? to_dpu_hw_dsc(hw_dsc[i]) : NULL;
> +
> +		for (i = 0; i < num_dsc; i++)
> +			dsc_mask |= BIT(dpu_enc->hw_dsc[i]->idx - DSC_0);

Perhaps you can merge these loops?  Assuming hw_dsc is already
NULL-initialized, you only need to iterate to `i<num_dsc` once without
extra conditional anyway?

> +
> +		dpu_enc->dsc_mask = dsc_mask;
> +	}
> +
>  	cstate = to_dpu_crtc_state(drm_crtc->state);
>  
>  	for (i = 0; i < num_lm; i++) {
> @@ -1739,6 +1767,127 @@ static void dpu_encoder_vsync_event_work_handler(struct kthread_work *work)
>  			nsecs_to_jiffies(ktime_to_ns(wakeup_time)));
>  }
>  
> +static void
> +dpu_encoder_dsc_pclk_param_calc(struct msm_display_dsc_config *dsc, u32 width)
> +{
> +	int slice_count, slice_per_intf;
> +	int bytes_in_slice, total_bytes_per_intf;
> +
> +	if (!dsc || !dsc->drm->slice_width || !dsc->drm->slice_count) {
> +		DPU_ERROR("Invalid DSC/slices\n");

What's the forward slash for?

> +		return;
> +	}
> +
> +	slice_count = dsc->drm->slice_count;
> +	slice_per_intf = DIV_ROUND_UP(width, dsc->drm->slice_width);
> +
> +	/*
> +	 * If slice_count is greater than slice_per_intf then default to 1.
> +	 * This can happen during partial update.
> +	 */
> +	if (slice_count > slice_per_intf)
> +		slice_count = 1;
> +
> +	bytes_in_slice = DIV_ROUND_UP(dsc->drm->slice_width *
> +				      dsc->drm->bits_per_pixel, 8);
> +	total_bytes_per_intf = bytes_in_slice * slice_per_intf;
> +
> +	dsc->eol_byte_num = total_bytes_per_intf % 3;
> +	dsc->pclk_per_line =  DIV_ROUND_UP(total_bytes_per_intf, 3);
> +	dsc->bytes_in_slice = bytes_in_slice;
> +	dsc->bytes_per_pkt = bytes_in_slice * slice_count;
> +	dsc->pkt_per_line = slice_per_intf / slice_count;
> +}

I've seen the same calculations duplicated twice in dsi code.  Since the
msm_display_dsc_config struct is available in a header, perhaps a single
- easily reviewable and maintainable - calculation function should be
available there too?

- Marijn

> +
> +static void
> +dpu_encoder_dsc_initial_line_calc(struct msm_display_dsc_config *dsc,
> +				  u32 enc_ip_width)
> +{
> +	int ssm_delay, total_pixels, soft_slice_per_enc;
> +
> +	soft_slice_per_enc = enc_ip_width / dsc->drm->slice_width;
> +
> +	/*
> +	 * minimum number of initial line pixels is a sum of:
> +	 * 1. sub-stream multiplexer delay (83 groups for 8bpc,
> +	 *    91 for 10 bpc) * 3
> +	 * 2. for two soft slice cases, add extra sub-stream multiplexer * 3
> +	 * 3. the initial xmit delay
> +	 * 4. total pipeline delay through the "lock step" of encoder (47)
> +	 * 5. 6 additional pixels as the output of the rate buffer is
> +	 *    48 bits wide
> +	 */
> +	ssm_delay = ((dsc->drm->bits_per_component < 10) ? 84 : 92);
> +	total_pixels = ssm_delay * 3 + dsc->drm->initial_xmit_delay + 47;
> +	if (soft_slice_per_enc > 1)
> +		total_pixels += (ssm_delay * 3);
> +	dsc->initial_lines = DIV_ROUND_UP(total_pixels, dsc->drm->slice_width);
> +}
> +
> +static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_dsc *hw_dsc,
> +				     struct dpu_hw_pingpong *hw_pp,
> +				     struct msm_display_dsc_config *dsc,
> +				     u32 common_mode)
> +{
> +	if (hw_dsc->ops.dsc_config)
> +		hw_dsc->ops.dsc_config(hw_dsc, dsc, common_mode);
> +
> +	if (hw_dsc->ops.dsc_config_thresh)
> +		hw_dsc->ops.dsc_config_thresh(hw_dsc, dsc);
> +
> +	if (hw_pp->ops.setup_dsc)
> +		hw_pp->ops.setup_dsc(hw_pp);
> +
> +	if (hw_pp->ops.enable_dsc)
> +		hw_pp->ops.enable_dsc(hw_pp);
> +}
> +
> +static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
> +				 struct msm_display_dsc_config *dsc)
> +{
> +	/* coding only for 2LM, 2enc, 1 dsc config */
> +	struct dpu_encoder_phys *enc_master = dpu_enc->cur_master;
> +	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
> +	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
> +	int this_frame_slices;
> +	int intf_ip_w, enc_ip_w;
> +	int dsc_common_mode;
> +	int pic_width;
> +	int i;
> +
> +	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
> +		hw_pp[i] = dpu_enc->hw_pp[i];
> +		hw_dsc[i] = dpu_enc->hw_dsc[i];
> +
> +		if (!hw_pp[i] || !hw_dsc[i]) {
> +			DPU_ERROR_ENC(dpu_enc, "invalid params for DSC\n");
> +			return;
> +		}
> +	}
> +
> +	dsc_common_mode = 0;
> +	pic_width = dsc->drm->pic_width;
> +
> +	dsc_common_mode = DSC_MODE_MULTIPLEX | DSC_MODE_SPLIT_PANEL;
> +	if (enc_master->intf_mode == INTF_MODE_VIDEO)
> +		dsc_common_mode |= DSC_MODE_VIDEO;
> +
> +	this_frame_slices = pic_width / dsc->drm->slice_width;
> +	intf_ip_w = this_frame_slices * dsc->drm->slice_width;
> +
> +	dpu_encoder_dsc_pclk_param_calc(dsc, intf_ip_w);
> +
> +	/*
> +	 * dsc merge case: when using 2 encoders for the same stream,
> +	 * no. of slices need to be same on both the encoders.
> +	 */
> +	enc_ip_w = intf_ip_w / 2;
> +	dpu_encoder_dsc_initial_line_calc(dsc, enc_ip_w);
> +
> +	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
> +		dpu_encoder_dsc_pipe_cfg(hw_dsc[i], hw_pp[i], dsc, dsc_common_mode);
> +}
> +
>  void dpu_encoder_prepare_for_kickoff(struct drm_encoder *drm_enc)
>  {
>  	struct dpu_encoder_virt *dpu_enc;
> @@ -1770,6 +1919,9 @@ void dpu_encoder_prepare_for_kickoff(struct drm_encoder *drm_enc)
>  			dpu_encoder_helper_hw_reset(dpu_enc->phys_encs[i]);
>  		}
>  	}
> +
> +	if (dpu_enc->dsc)
> +		dpu_encoder_prep_dsc(dpu_enc, dpu_enc->dsc);
>  }
>  
>  void dpu_encoder_kickoff(struct drm_encoder *drm_enc)
> @@ -2015,6 +2167,8 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
>  		dpu_enc->idle_pc_supported =
>  				dpu_kms->catalog->caps->has_idle_pc;
>  
> +	dpu_enc->dsc = disp_info->dsc;
> +
>  	mutex_lock(&dpu_enc->enc_lock);
>  	for (i = 0; i < disp_info->num_of_h_tiles && !ret; i++) {
>  		/*
> @@ -2244,3 +2398,11 @@ enum dpu_intf_mode dpu_encoder_get_intf_mode(struct drm_encoder *encoder)
>  
>  	return INTF_MODE_NONE;
>  }
> +
> +unsigned int dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc)
> +{
> +	struct drm_encoder *encoder = phys_enc->parent;
> +	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(encoder);
> +
> +	return dpu_enc->dsc_mask;
> +}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index e7270eb6b84b..7b90d644a41b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -332,6 +332,14 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
>  	return BLEND_3D_NONE;
>  }
>  
> +/**
> + * dpu_encoder_helper_get_dsc - get DSC blocks mask for the DPU encoder
> + *   This helper function is used by physical encoder to get DSC blocks mask
> + *   used for this encoder.
> + * @phys_enc: Pointer to physical encoder structure
> + */
> +unsigned int dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc);
> +
>  /**
>   * dpu_encoder_helper_split_config - split display configuration helper function
>   *	This helper function may be used by physical encoders to configure
> -- 
> 2.31.1
> 
