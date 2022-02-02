Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9543F4A6E32
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 10:55:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4A9210E3B8;
	Wed,  2 Feb 2022 09:55:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 366 seconds by postgrey-1.36 at gabe;
 Wed, 02 Feb 2022 09:55:03 UTC
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BDFB10E3B8
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 09:55:03 +0000 (UTC)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl
 [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id A34393F7D3;
 Wed,  2 Feb 2022 10:48:51 +0100 (CET)
Date: Wed, 2 Feb 2022 10:48:50 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm/msm/dpu: Bind pingpong block to intf on active ctls
 in cmd encoder
Message-ID: <20220202094850.2asbry44vyh5xw2p@SoMainline.org>
Mail-Followup-To: Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Pavel Dubrova <pashadubrova@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Zhen Lei <thunder.leizhen@huawei.com>, Bernard <bernard@vivo.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20211222105513.44860-1-marijn.suijten@somainline.org>
 <84bd598c-b1b7-984e-9fa1-94ad28087ef0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84bd598c-b1b7-984e-9fa1-94ad28087ef0@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Pavel Dubrova <pashadubrova@gmail.com>,
 Jami Kettunen <jami.kettunen@somainline.org>, Bernard <bernard@vivo.com>,
 linux-arm-msm@vger.kernel.org, Zhen Lei <thunder.leizhen@huawei.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, linux-kernel@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>, David Airlie <airlied@linux.ie>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-01-20 02:12:51, Dmitry Baryshkov wrote:
> On 22/12/2021 13:55, Marijn Suijten wrote:
> > As per the specification of DPU_CTL_ACTIVE_CFG the configuration of
> > active blocks should be proactively specified, and the pingpong block is
> > no different.
> > 
> > The downstream display driver [1] confirms this by also calling
> > bind_pingpong_blk on CTL_ACTIVE_CFG.  Note that this else-if is always
> > entered, as setup_intf_cfg - unlike this mainline dpu driver that
> > combines both behind the same function pointer - is left NULL in favour
> > of using setup_intf_cfg_v1 when CTL_ACTIVE_CFG is set.
> > 
> > This solves continuous timeouts on at least the Qualcomm sm6125 SoC:
> > 
> >      [drm:dpu_encoder_frame_done_timeout:2091] [dpu error]enc31 frame done timeout
> >      [drm:_dpu_encoder_phys_cmd_handle_ppdone_timeout.isra.0] *ERROR* id:31 pp:0 kickoff timeout 0 cnt 1 koff_cnt 1
> >      [drm:dpu_encoder_phys_cmd_prepare_for_kickoff] *ERROR* failed wait_for_idle: id:31 ret:-110 pp:0
> > 
> > In the same way this pingpong block should also be unbound followed by
> > an interface flush when the encoder is disabled, according to the
> > downstream display driver [2].
> > 
> > [1]: https://source.codeaurora.org/quic/la/platform/vendor/opensource/display-drivers/tree/msm/sde/sde_encoder_phys_cmd.c?h=LA.UM.9.16.r1-08500-MANNAR.0#n167
> > [2]: https://source.codeaurora.org/quic/la/platform/vendor/opensource/display-drivers/tree/msm/sde/sde_encoder.c?h=LA.UM.9.16.r1-08500-MANNAR.0#n2986
> > 
> > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> > ---
> >   .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 21 +++++++++++++++++++
> >   1 file changed, 21 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > index 8e433af7aea4..e0e08a874f07 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > @@ -71,6 +71,13 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
> >   	intf_cfg.stream_sel = cmd_enc->stream_sel;
> >   	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
> >   	ctl->ops.setup_intf_cfg(ctl, &intf_cfg);
> > +
> > +	/* setup which pp blk will connect to this intf */
> > +	if (test_bit(DPU_CTL_ACTIVE_CFG, &ctl->caps->features) && phys_enc->hw_intf->ops.bind_pingpong_blk)
> 
> Nit: here we bind all interfaces, but later we unbind only master. Is 
> this correct?

Not sure: it seems downstream only calls
_sde/dpu_encoder_phys_cmd_update_intf_cfg when it is _not_ a ppsplit
slave, which appears to be very similar to being the master (both check
for ENC_ROLE_SLAVE but ppsplit also checks RM topology support for
ppsplit).  Should we do this too before calling
_dpu_encoder_phys_cmd_update_intf_cfg?

- Marijn

> > +		phys_enc->hw_intf->ops.bind_pingpong_blk(
> > +				phys_enc->hw_intf,
> > +				true,
> > +				phys_enc->hw_pp->idx);
> >   }
> >   
> >   static void dpu_encoder_phys_cmd_pp_tx_done_irq(void *arg, int irq_idx)
> > @@ -507,6 +514,7 @@ static void dpu_encoder_phys_cmd_disable(struct dpu_encoder_phys *phys_enc)
> >   {
> >   	struct dpu_encoder_phys_cmd *cmd_enc =
> >   		to_dpu_encoder_phys_cmd(phys_enc);
> > +	struct dpu_hw_ctl *ctl;
> >   
> >   	if (!phys_enc->hw_pp) {
> >   		DPU_ERROR("invalid encoder\n");
> > @@ -523,6 +531,19 @@ static void dpu_encoder_phys_cmd_disable(struct dpu_encoder_phys *phys_enc)
> >   
> >   	if (phys_enc->hw_pp->ops.enable_tearcheck)
> >   		phys_enc->hw_pp->ops.enable_tearcheck(phys_enc->hw_pp, false);
> > +
> > +	if (dpu_encoder_phys_cmd_is_master(phys_enc)) {
> > +		if (phys_enc->hw_intf->ops.bind_pingpong_blk) {
> > +			phys_enc->hw_intf->ops.bind_pingpong_blk(
> > +					phys_enc->hw_intf,
> > +					false,
> > +					phys_enc->hw_pp->idx);
> > +
> > +			ctl = phys_enc->hw_ctl;
> > +			ctl->ops.update_pending_flush_intf(ctl, phys_enc->intf_idx);
> > +		}
> > +	}
> > +
> >   	phys_enc->enable_state = DPU_ENC_DISABLED;
> >   }
> >   
> 
> 
> -- 
> With best wishes
> Dmitry
