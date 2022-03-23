Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC4B4E5467
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 15:40:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A700B892FE;
	Wed, 23 Mar 2022 14:40:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E5048966B;
 Wed, 23 Mar 2022 14:40:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CE88561719;
 Wed, 23 Mar 2022 14:40:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBC9DC340E8;
 Wed, 23 Mar 2022 14:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648046445;
 bh=6N8bqbEGfH4CpGR4GzKqd3GB0L4Mddif/JC2g3akfH0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WaBGFHz6bWR5IwQpWTzgW21fpy7P7DXu364Vo+5qC+175QQbejAeV+XMKrKYM8UAH
 1bXIMTPCWAtb2xQO61MZAxDaIbSKDmMqmvsMgeUJDjn2oNUMMY+lk+jirsamHN+lBB
 b+7yoZRTlJsfCdz0jp8RaSY25O9GOSylSRe7ndGDQ/BHhoLPemyMltmTT3sNz61Tx6
 Z+syKMqrhB1vFs0csDMUMYFij/zm8F8h8VzThGhQvyDTsQxzJAuCKjr4qQ+mOxpG2V
 i0enlhKhp/7hq8HlqK0C/ALGbIIxzK0WfIh1AcvwTlfkXat12d/qjSeGPKwtA14OxO
 BLs/FCu8onyZg==
Date: Wed, 23 Mar 2022 20:10:40 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [REPOST PATCH v4 07/13] drm/msm/disp/dpu1: Add support for DSC
 in encoder
Message-ID: <YjsxaJrvxgtO5ecC@matsya>
References: <20220210103423.271016-1-vkoul@kernel.org>
 <20220210103423.271016-8-vkoul@kernel.org>
 <20220217223239.2i256klkbjkogovz@SoMainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220217223239.2i256klkbjkogovz@SoMainline.org>
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

On 17-02-22, 23:32, Marijn Suijten wrote:
> On 2022-02-10 16:04:17, Vinod Koul wrote:
> > We need to configure the encoder for DSC configuration and calculate DSC
> > parameters for the given timing so this patch adds that support by
> > adding dpu_encoder_prep_dsc() which is invoked when DSC is enabled.
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 164 +++++++++++++++++-
> >  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |   8 +
> >  2 files changed, 171 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > index 1e648db439f9..95a7bf362e81 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -21,6 +21,7 @@
> >  #include "dpu_hw_intf.h"
> >  #include "dpu_hw_ctl.h"
> >  #include "dpu_hw_dspp.h"
> > +#include "dpu_hw_dsc.h"
> >  #include "dpu_formats.h"
> >  #include "dpu_encoder_phys.h"
> >  #include "dpu_crtc.h"
> > @@ -136,6 +137,8 @@ enum dpu_enc_rc_states {
> >   * @cur_slave:		As above but for the slave encoder.
> >   * @hw_pp:		Handle to the pingpong blocks used for the display. No.
> >   *			pingpong blocks can be different than num_phys_encs.
> > + * @hw_dsc:		Handle to the DSC blocks used for the display.
> > + * @dsc_mask:		The bitmask of used DSC blocks.
> 
> No need for "^The" prefix here.

Removed

> 
> >   * @intfs_swapped:	Whether or not the phys_enc interfaces have been swapped
> >   *			for partial update right-only cases, such as pingpong
> >   *			split where virtual pingpong does not generate IRQs
> > @@ -169,6 +172,7 @@ enum dpu_enc_rc_states {
> >   * @topology:                   topology of the display
> >   * @idle_timeout:		idle timeout duration in milliseconds
> >   * @dp:				msm_dp pointer, for DP encoders
> > + * @dsc:			msm_display_dsc_config pointer, for DSC-enabled encoders
> >   */
> >  struct dpu_encoder_virt {
> >  	struct drm_encoder base;
> > @@ -182,6 +186,9 @@ struct dpu_encoder_virt {
> >  	struct dpu_encoder_phys *cur_master;
> >  	struct dpu_encoder_phys *cur_slave;
> >  	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
> > +	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
> > +
> > +	unsigned int dsc_mask;
> >  
> >  	bool intfs_swapped;
> >  
> > @@ -209,6 +216,9 @@ struct dpu_encoder_virt {
> >  	u32 idle_timeout;
> >  
> >  	struct msm_dp *dp;
> > +
> > +	/* DSC configuration */
> > +	struct msm_display_dsc_config *dsc;
> >  };
> >  
> >  #define to_dpu_encoder_virt(x) container_of(x, struct dpu_encoder_virt, base)
> > @@ -972,7 +982,8 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
> >  	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
> >  	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
> >  	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC] = { NULL };
> > -	int num_lm, num_ctl, num_pp;
> > +	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
> > +	int num_lm, num_ctl, num_pp, num_dsc;
> >  	int i, j;
> >  
> >  	if (!drm_enc) {
> > @@ -1027,6 +1038,23 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
> >  		dpu_enc->hw_pp[i] = i < num_pp ? to_dpu_hw_pingpong(hw_pp[i])
> >  						: NULL;
> >  
> > +	dpu_enc->dsc_mask = 0;
> > +
> > +	if (dpu_enc->dsc) {
> > +		unsigned int dsc_mask = 0;
> 
> Perhaps move this definition outside the if, and unconditionally
> perform:
> 
> 	dpu_enc->dsc_mask = dsc_mask;
> 
> Below the if, instead of having to write it twice when ->dsc is truthy?

That is a good suggestion, updated now

> 
> > +
> > +		num_dsc = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > +							drm_enc->base.id, DPU_HW_BLK_DSC,
> > +							hw_dsc, ARRAY_SIZE(hw_dsc));
> > +		for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
> > +			dpu_enc->hw_dsc[i] = i < num_dsc ? to_dpu_hw_dsc(hw_dsc[i]) : NULL;
> > +
> > +		for (i = 0; i < num_dsc; i++)
> > +			dsc_mask |= BIT(dpu_enc->hw_dsc[i]->idx - DSC_0);
> 
> Perhaps you can merge these loops?  Assuming hw_dsc is already
> NULL-initialized, you only need to iterate to `i<num_dsc` once without
> extra conditional anyway?

Agreed, this does make it look neat

> 
> > +
> > +		dpu_enc->dsc_mask = dsc_mask;
> > +	}
> > +
> >  	cstate = to_dpu_crtc_state(drm_crtc->state);
> >  
> >  	for (i = 0; i < num_lm; i++) {
> > @@ -1739,6 +1767,127 @@ static void dpu_encoder_vsync_event_work_handler(struct kthread_work *work)
> >  			nsecs_to_jiffies(ktime_to_ns(wakeup_time)));
> >  }
> >  
> > +static void
> > +dpu_encoder_dsc_pclk_param_calc(struct msm_display_dsc_config *dsc, u32 width)
> > +{
> > +	int slice_count, slice_per_intf;
> > +	int bytes_in_slice, total_bytes_per_intf;
> > +
> > +	if (!dsc || !dsc->drm->slice_width || !dsc->drm->slice_count) {
> > +		DPU_ERROR("Invalid DSC/slices\n");
> 
> What's the forward slash for?

forward slash denotes an OR case in written, so above would imply
Invalid DSC or slices, I will make it 'or' to be clear

> 
> > +		return;
> > +	}
> > +
> > +	slice_count = dsc->drm->slice_count;
> > +	slice_per_intf = DIV_ROUND_UP(width, dsc->drm->slice_width);
> > +
> > +	/*
> > +	 * If slice_count is greater than slice_per_intf then default to 1.
> > +	 * This can happen during partial update.
> > +	 */
> > +	if (slice_count > slice_per_intf)
> > +		slice_count = 1;
> > +
> > +	bytes_in_slice = DIV_ROUND_UP(dsc->drm->slice_width *
> > +				      dsc->drm->bits_per_pixel, 8);
> > +	total_bytes_per_intf = bytes_in_slice * slice_per_intf;
> > +
> > +	dsc->eol_byte_num = total_bytes_per_intf % 3;
> > +	dsc->pclk_per_line =  DIV_ROUND_UP(total_bytes_per_intf, 3);
> > +	dsc->bytes_in_slice = bytes_in_slice;
> > +	dsc->bytes_per_pkt = bytes_in_slice * slice_count;
> > +	dsc->pkt_per_line = slice_per_intf / slice_count;
> > +}
> 
> I've seen the same calculations duplicated twice in dsi code.  Since the
> msm_display_dsc_config struct is available in a header, perhaps a single
> - easily reviewable and maintainable - calculation function should be
> available there too?

Let me try check if we can make it common..

-- 
~Vinod
