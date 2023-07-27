Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B521765D4B
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 22:25:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A082C10E600;
	Thu, 27 Jul 2023 20:25:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D46C210E603
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 20:25:31 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 1811F204BA;
 Thu, 27 Jul 2023 22:25:30 +0200 (CEST)
Date: Thu, 27 Jul 2023 22:25:28 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 7/7] drm/msm/dpu: move INTF tearing checks to
 dpu_encoder_phys_cmd_init
Message-ID: <b2uzkzfoj4sfg3fx3ufjd7i2x5dbbnsccodrgk7cnfvjf3yak4@tbesdrg2tke4>
References: <20230727162104.1497483-1-dmitry.baryshkov@linaro.org>
 <20230727162104.1497483-8-dmitry.baryshkov@linaro.org>
 <bmmqdo6dyewxrgcfk3vcuff3tgrb6iqgzby3ionl4shaido2vw@cqc2qnvu3fnj>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bmmqdo6dyewxrgcfk3vcuff3tgrb6iqgzby3ionl4shaido2vw@cqc2qnvu3fnj>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-07-27 22:22:20, Marijn Suijten wrote:
> On 2023-07-27 19:21:04, Dmitry Baryshkov wrote:
> > As the INTF is fixed at the encoder creation time, we can move the
> > check whether INTF supports tearchck to dpu_encoder_phys_cmd_init().
> > This function can return an error if INTF doesn't have required feature.
> > Performing this check in dpu_encoder_phys_cmd_tearcheck_config() is less
> > useful, as this function returns void.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 37 +++++++++++--------
> >  1 file changed, 21 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > index 04a1106101a7..e1dd0e1b4793 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > @@ -325,24 +325,17 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
> >  	unsigned long vsync_hz;
> >  	struct dpu_kms *dpu_kms;
> >  
> > -	if (phys_enc->has_intf_te) {
> > -		if (!phys_enc->hw_intf ||
> > -		    !phys_enc->hw_intf->ops.enable_tearcheck) {
> > -			DPU_DEBUG_CMDENC(cmd_enc, "tearcheck not supported\n");
> > -			return;
> > -		}
> > -
> > -		DPU_DEBUG_CMDENC(cmd_enc, "");
> > -	} else {
> > -		if (!phys_enc->hw_pp ||
> > -		    !phys_enc->hw_pp->ops.enable_tearcheck) {
> > -			DPU_DEBUG_CMDENC(cmd_enc, "tearcheck not supported\n");
> > -			return;
> > -		}
> > -
> > -		DPU_DEBUG_CMDENC(cmd_enc, "pp %d\n", phys_enc->hw_pp->idx - PINGPONG_0);
> > +	if (!phys_enc->has_intf_te &&
> > +	    (!phys_enc->hw_pp ||
> > +	     !phys_enc->hw_pp->ops.enable_tearcheck)) {
> 
> when is hw_pp assigned?  Can't we also check that somewhere in an init
> phase?

It would happen right before dpu_encoder_phys_cmd_atomic_mode_set()
where we already happen to check has_intf_te to switch on PP
intr_readptr vs INTF intr_tear_rd_ptr.  Might be the perfect place for
the pingpong callback checks?

- Marijn

> 
> Also, you won't go over 100 chars (not even 80) by having the (!... ||
> !...) on a single line.
> 
> > +		DPU_DEBUG_CMDENC(cmd_enc, "tearcheck not supported\n");
> > +		return;
> >  	}
> >  
> > +	DPU_DEBUG_CMDENC(cmd_enc, "intf %d pp %d\n",
> > +			 phys_enc->hw_intf->idx - INTF_0,
> > +			 phys_enc->hw_pp->idx - PINGPONG_0);
> > +
> >  	mode = &phys_enc->cached_mode;
> >  
> >  	dpu_kms = phys_enc->dpu_kms;
> > @@ -768,9 +761,21 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
> >  	phys_enc->intf_mode = INTF_MODE_CMD;
> >  	cmd_enc->stream_sel = 0;
> >  
> > +	if (!phys_enc->hw_intf) {
> > +		DPU_ERROR_CMDENC(cmd_enc, "no INTF provided\n");
> > +
> > +		return ERR_PTR(-EINVAL);
> > +	}
> > +
> >  	if (phys_enc->dpu_kms->catalog->mdss_ver->core_major_ver >= 5)
> >  		phys_enc->has_intf_te = true;
> >  
> > +	if (phys_enc->has_intf_te && !phys_enc->hw_intf->ops.enable_tearcheck) {
> 
> Any other callbacks we could check here, and remove the checks
> elsewhere?
> 
> As with enable_tearcheck() though, it does make the code less consistent
> with its PP counterpart, which is checked ad-hoc everywhere (but maybe
> that is fixable too).
> 
> - Marijn
> 
> > +		DPU_ERROR_CMDENC(cmd_enc, "tearcheck not supported\n");
> > +
> > +		return ERR_PTR(-EINVAL);
> > +	}
> > +
> >  	atomic_set(&cmd_enc->pending_vblank_cnt, 0);
> >  	init_waitqueue_head(&cmd_enc->pending_vblank_wq);
> >  
> > -- 
> > 2.39.2
> > 
