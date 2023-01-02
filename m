Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E621565B043
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 12:06:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14B5610E307;
	Mon,  2 Jan 2023 11:06:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 163CF10E307
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 11:06:15 +0000 (UTC)
Received: from SoMainline.org (D57D4C6E.static.ziggozakelijk.nl
 [213.125.76.110])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 5CEAF1F54F;
 Mon,  2 Jan 2023 12:06:12 +0100 (CET)
Date: Mon, 2 Jan 2023 12:06:11 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [RFC PATCH 6/7] drm/msm/dpu: Implement tearcheck support on INTF
 block
Message-ID: <20230102110611.e3k36evk23ai35gg@SoMainline.org>
References: <20221231215006.211860-1-marijn.suijten@somainline.org>
 <20221231215006.211860-7-marijn.suijten@somainline.org>
 <593cae1c-ade3-c68a-25d3-84ba1b968175@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <593cae1c-ade3-c68a-25d3-84ba1b968175@linaro.org>
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
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 dri-devel@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Adam Skladowski <a39.skl@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 freedreno@lists.freedesktop.org, Vinod Polimera <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-01-01 15:32:11, Dmitry Baryshkov wrote:
> On 31/12/2022 23:50, Marijn Suijten wrote:
> > Since DPU 5.0.0 the TEARCHECK registers and interrupts moved out of the
> > PINGPONG block and into the INTF.  Implement the necessary callbacks in
> > the INTF block, and use these callbacks together with the INTF_TEAR
> > interrupts
> > 
> > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
> Generally I have the same question as for the patch 2. Can we have some 
> higher level functions in the hw_pp and hw_intf files?

That is mostly because patch 2 only cleaned up non-optional handling of
hw_pp callbacks in dpu_encoder_phys_cmd_prepare_commit, which utilizes
hw_intf's autorefresh callbacks since this patch.  I don't think there's
any logic in the encoder currently that is unique to either PP or INTF?

There are quite a few functions that check for NULL hw_pp only, while -
especially after this patch - should also check hw_intf to raise
"invalid encoder".  Should I extend those checks as well?

> Moreover, as I
> review your patch I have the feeling that it would make sense to have to 
> two sets of encoder callbacks, one for the hw_pp tearing handling and 
> another set for hw_intf-based one.

Do you mean to duplicate most phy_cmd functions and switch them based on
has_intf_te in dpu_encoder_phys_cmd_init_ops?  Or introduce an entirely
new set of callbacks that simply hide / abstract away the check on
has_intf_te?  The former would duplicate a bunch of code unless that is
abstracted away into other functions, mainly in
dpu_encoder_phys_cmd_tearcheck_config and
dpu_encoder_phys_cmd_prepare_commit.

Alternatively, could we find a way where these PP and INTF ops share the
same struct and function signature?  That might be tricky for passing in
the hw_pp or hw_intf struct without leaking those details to the
callback and/or have the switching logic in there.

> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  11 +
> >   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  10 +-
> >   .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 113 +++++++---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   | 206 ++++++++++++++++++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h   |  29 +++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |   2 +
> >   6 files changed, 340 insertions(+), 31 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > index 9c6817b5a194..8b9070220ab2 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -673,6 +673,7 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
> >   	struct dpu_kms *dpu_kms;
> >   	struct dpu_hw_mdp *hw_mdptop;
> >   	struct drm_encoder *drm_enc;
> > +	struct dpu_encoder_phys *phys_enc;
> >   	int i;
> >   
> >   	if (!dpu_enc || !disp_info) {
> > @@ -703,12 +704,22 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
> >   			vsync_cfg.ppnumber[i] = dpu_enc->hw_pp[i]->idx;
> >   
> >   		vsync_cfg.pp_count = dpu_enc->num_phys_encs;
> > +		vsync_cfg.frame_rate = drm_mode_vrefresh(&dpu_enc->base.crtc->state->adjusted_mode);
> > +
> >   		if (disp_info->is_te_using_watchdog_timer)
> >   			vsync_cfg.vsync_source = DPU_VSYNC_SOURCE_WD_TIMER_0;
> >   		else
> >   			vsync_cfg.vsync_source = DPU_VSYNC0_SOURCE_GPIO;
> >   
> >   		hw_mdptop->ops.setup_vsync_source(hw_mdptop, &vsync_cfg);
> > +
> > +		for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> > +			phys_enc = dpu_enc->phys_encs[i];
> > +
> > +			if (phys_enc->has_intf_te && phys_enc->hw_intf->ops.vsync_sel)
> > +				phys_enc->hw_intf->ops.vsync_sel(phys_enc->hw_intf,
> > +						vsync_cfg.vsync_source);
> > +		}
> >   	}
> >   }
> >   
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > index f2af07d87f56..47e79401032c 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > @@ -148,10 +148,10 @@ struct dpu_encoder_phys_ops {
> >   /**
> >    * enum dpu_intr_idx - dpu encoder interrupt index
> >    * @INTR_IDX_VSYNC:    Vsync interrupt for video mode panel
> > - * @INTR_IDX_PINGPONG: Pingpong done unterrupt for cmd mode panel
> > - * @INTR_IDX_UNDERRUN: Underrun unterrupt for video and cmd mode panel
> > - * @INTR_IDX_RDPTR:    Readpointer done unterrupt for cmd mode panel
> > - * @INTR_IDX_WB_DONE:  Writeback fone interrupt for virtual connector
> > + * @INTR_IDX_PINGPONG: Pingpong done interrupt for cmd mode panel
> > + * @INTR_IDX_UNDERRUN: Underrun interrupt for video and cmd mode panel
> > + * @INTR_IDX_RDPTR:    Readpointer done interrupt for cmd mode panel
> > + * @INTR_IDX_WB_DONE:  Writeback done interrupt for virtual connector
> >    */
> >   enum dpu_intr_idx {
> >   	INTR_IDX_VSYNC,
> > @@ -195,6 +195,7 @@ enum dpu_intr_idx {
> >    *                              pending.
> >    * @pending_kickoff_wq:		Wait queue for blocking until kickoff completes
> >    * @irq:			IRQ indices
> > + * @has_intf_te:		Interface TE configuration support
> >    */
> >   struct dpu_encoder_phys {
> >   	struct drm_encoder *parent;
> > @@ -220,6 +221,7 @@ struct dpu_encoder_phys {
> >   	atomic_t pending_kickoff_cnt;
> >   	wait_queue_head_t pending_kickoff_wq;
> >   	int irq[INTR_IDX_MAX];
> > +	bool has_intf_te;
> >   };
> >   
> >   static inline int dpu_encoder_phys_inc_pending(struct dpu_encoder_phys *phys)
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > index 7e5ba52197cd..ca44a8087f01 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > @@ -100,12 +100,12 @@ static void dpu_encoder_phys_cmd_pp_tx_done_irq(void *arg, int irq_idx)
> >   	DPU_ATRACE_END("pp_done_irq");
> >   }
> >   
> > -static void dpu_encoder_phys_cmd_pp_rd_ptr_irq(void *arg, int irq_idx)
> > +static void dpu_encoder_phys_cmd_te_rd_ptr_irq(void *arg, int irq_idx)
> >   {
> >   	struct dpu_encoder_phys *phys_enc = arg;
> >   	struct dpu_encoder_phys_cmd *cmd_enc;
> >   
> > -	if (!phys_enc->hw_pp)
> > +	if (!phys_enc->hw_pp || !phys_enc->hw_intf)
> >   		return;
> >   
> >   	DPU_ATRACE_BEGIN("rd_ptr_irq");
> > @@ -147,11 +147,19 @@ static void dpu_encoder_phys_cmd_atomic_mode_set(
> >   		struct drm_crtc_state *crtc_state,
> >   		struct drm_connector_state *conn_state)
> >   {
> > +	if (phys_enc->has_intf_te && !phys_enc->hw_intf) {
> > +		DPU_ERROR("invalid intf configuration\n");
> > +		return;
> > +	}
> > +
> >   	phys_enc->irq[INTR_IDX_CTL_START] = phys_enc->hw_ctl->caps->intr_start;
> >   
> >   	phys_enc->irq[INTR_IDX_PINGPONG] = phys_enc->hw_pp->caps->intr_done;
> >   
> > -	phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_pp->caps->intr_rdptr;
> > +	if (phys_enc->has_intf_te)
> > +		phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_intf->cap->intr_tear_rd_ptr;
> > +	else
> > +		phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_pp->caps->intr_rdptr;
> >   
> >   	phys_enc->irq[INTR_IDX_UNDERRUN] = phys_enc->hw_intf->cap->intr_underrun;
> >   }
> > @@ -264,7 +272,7 @@ static int dpu_encoder_phys_cmd_control_vblank_irq(
> >   	if (enable && atomic_inc_return(&phys_enc->vblank_refcount) == 1)
> >   		ret = dpu_core_irq_register_callback(phys_enc->dpu_kms,
> >   				phys_enc->irq[INTR_IDX_RDPTR],
> > -				dpu_encoder_phys_cmd_pp_rd_ptr_irq,
> > +				dpu_encoder_phys_cmd_te_rd_ptr_irq,
> >   				phys_enc);
> >   	else if (!enable && atomic_dec_return(&phys_enc->vblank_refcount) == 0)
> >   		ret = dpu_core_irq_unregister_callback(phys_enc->dpu_kms,

Fwiw looks like this function is a prime candidate to get updated with
hw_intf information (in error checking and logging), as this callback is
now shared between PP and INTF.

> > @@ -336,10 +344,18 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
> >   
> >   	DPU_DEBUG_CMDENC(cmd_enc, "pp %d\n", phys_enc->hw_pp->idx - PINGPONG_0);
> >   
> > -	if (!phys_enc->hw_pp->ops.setup_tearcheck ||
> > -		!phys_enc->hw_pp->ops.enable_tearcheck) {
> > -		DPU_DEBUG_CMDENC(cmd_enc, "tearcheck not supported\n");
> > -		return;
> > +	if (phys_enc->has_intf_te) {
> > +		if (!phys_enc->hw_intf->ops.setup_tearcheck ||
> > +			!phys_enc->hw_intf->ops.enable_tearcheck) {
> > +			DPU_DEBUG_CMDENC(cmd_enc, "tearcheck not supported\n");
> > +			return;
> > +		}
> > +	} else {
> > +		if (!phys_enc->hw_pp->ops.setup_tearcheck ||
> > +			!phys_enc->hw_pp->ops.enable_tearcheck) {
> > +			DPU_DEBUG_CMDENC(cmd_enc, "tearcheck not supported\n");
> > +			return;
> > +		}
> >   	}
> >   
> >   	dpu_kms = phys_enc->dpu_kms;
> > @@ -392,8 +408,13 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
> >   		phys_enc->hw_pp->idx - PINGPONG_0, tc_cfg.sync_cfg_height,
> >   		tc_cfg.sync_threshold_start, tc_cfg.sync_threshold_continue);
> >   
> > -	phys_enc->hw_pp->ops.setup_tearcheck(phys_enc->hw_pp, &tc_cfg);
> > -	phys_enc->hw_pp->ops.enable_tearcheck(phys_enc->hw_pp, tc_enable);
> 
> A simple random example: setup_tearcheck is always followed with the 
> enable_tearcheck. If we merge them, the code would be simpler.

setup_tearcheck could include this functionality, but note that
dpu_encoder_phys_cmd_disable currently calls enable_tearcheck(false)
without setup_tearcheck.

- Marijn

> > <snip>
