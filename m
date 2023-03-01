Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 130CB6A6AA5
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 11:14:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BDE910E226;
	Wed,  1 Mar 2023 10:14:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [5.144.164.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E801010E20F
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Mar 2023 10:14:00 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 41A0F3F8C3;
 Wed,  1 Mar 2023 11:13:59 +0100 (CET)
Date: Wed, 1 Mar 2023 11:13:58 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v4 3/4] drm/msm/dpu: Remove empty prepare_commit() function
Message-ID: <20230301101358.twxrzmonr4qvv5rd@SoMainline.org>
References: <20230221184256.1436-1-quic_jesszhan@quicinc.com>
 <20230221184256.1436-4-quic_jesszhan@quicinc.com>
 <20230301100815.2mwzickezovsg2oe@SoMainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230301100815.2mwzickezovsg2oe@SoMainline.org>
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 dmitry.baryshkov@linaro.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-03-01 11:08:16, Marijn Suijten wrote:
> On 2023-02-21 10:42:55, Jessica Zhang wrote:
> > Now that the TE setup has been moved to prepare_for_kickoff(),  we have
> > not prepare_commit() callbacks left. This makes dpu_encoder_prepare_commit()
> 
> s/not/no
> 
> > do nothing. Remove prepare_commit() from DPU driver.
> 
> And again, this:
> 
> > Changes in V3:
> > - Reworded commit message to be more clear
> > - Corrected spelling mistake in commit message
> > 
> > Changes in V4:
> > - Reworded commit message for clarity
> 
> ... should go below the cut.
> 
> > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> 
> With the above two issues fixed:
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 19 -------------------
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  7 -------
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 21 ---------------------
> >  3 files changed, 47 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > index dcceed91aed8..35e120b5ef53 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -2090,25 +2090,6 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
> >  	ctl->ops.clear_pending_flush(ctl);
> >  }
> >  
> > -void dpu_encoder_prepare_commit(struct drm_encoder *drm_enc)
> > -{
> > -	struct dpu_encoder_virt *dpu_enc;
> > -	struct dpu_encoder_phys *phys;
> > -	int i;
> > -
> > -	if (!drm_enc) {
> > -		DPU_ERROR("invalid encoder\n");
> > -		return;
> > -	}
> > -	dpu_enc = to_dpu_encoder_virt(drm_enc);
> > -
> > -	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> > -		phys = dpu_enc->phys_encs[i];
> > -		if (phys->ops.prepare_commit)
> > -			phys->ops.prepare_commit(phys);

In hindsight, Dmitry asked in v2 to remove prepare_commit from
dpu_encoder_phys_ops (and its documentation comment) in
dpu_encoder_phys.h, but that has not happened yet.  Can we do that in a
v5?

- Marijn

> > -	}
> > -}
> > -
> >  #ifdef CONFIG_DEBUG_FS
> >  static int _dpu_encoder_status_show(struct seq_file *s, void *data)
> >  {
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> > index 9e7236ef34e6..2c9ef8d1b877 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> > @@ -146,13 +146,6 @@ struct drm_encoder *dpu_encoder_init(
> >  int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
> >  		struct msm_display_info *disp_info);
> >  
> > -/**
> > - * dpu_encoder_prepare_commit - prepare encoder at the very beginning of an
> > - *	atomic commit, before any registers are written
> > - * @drm_enc:    Pointer to previously created drm encoder structure
> > - */
> > -void dpu_encoder_prepare_commit(struct drm_encoder *drm_enc);
> > -
> >  /**
> >   * dpu_encoder_set_idle_timeout - set the idle timeout for video
> >   *                    and command mode encoders.
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > index 165958d47ec6..6f7ddbf0d9b7 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > @@ -425,26 +425,6 @@ static ktime_t dpu_kms_vsync_time(struct msm_kms *kms, struct drm_crtc *crtc)
> >  	return ktime_get();
> >  }
> >  
> > -static void dpu_kms_prepare_commit(struct msm_kms *kms,
> > -		struct drm_atomic_state *state)
> > -{
> > -	struct drm_crtc *crtc;
> > -	struct drm_crtc_state *crtc_state;
> > -	struct drm_encoder *encoder;
> > -	int i;
> > -
> > -	if (!kms)
> > -		return;
> > -
> > -	/* Call prepare_commit for all affected encoders */
> > -	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
> > -		drm_for_each_encoder_mask(encoder, crtc->dev,
> > -					  crtc_state->encoder_mask) {
> > -			dpu_encoder_prepare_commit(encoder);
> > -		}
> > -	}
> > -}
> > -
> >  static void dpu_kms_flush_commit(struct msm_kms *kms, unsigned crtc_mask)
> >  {
> >  	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
> > @@ -949,7 +929,6 @@ static const struct msm_kms_funcs kms_funcs = {
> >  	.enable_commit   = dpu_kms_enable_commit,
> >  	.disable_commit  = dpu_kms_disable_commit,
> >  	.vsync_time      = dpu_kms_vsync_time,
> > -	.prepare_commit  = dpu_kms_prepare_commit,
> >  	.flush_commit    = dpu_kms_flush_commit,
> >  	.wait_flush      = dpu_kms_wait_flush,
> >  	.complete_commit = dpu_kms_complete_commit,
> > -- 
> > 2.39.2
> > 
