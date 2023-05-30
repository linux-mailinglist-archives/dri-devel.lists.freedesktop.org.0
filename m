Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BFF71592F
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 10:57:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C08F810E3B6;
	Tue, 30 May 2023 08:57:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A760610E330
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 08:57:04 +0000 (UTC)
Received: from SoMainline.org (82-72-63-87.cable.dynamic.v4.ziggo.nl
 [82.72.63.87])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id AE829203BD;
 Tue, 30 May 2023 10:57:01 +0200 (CEST)
Date: Tue, 30 May 2023 10:57:00 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm/msm/dpu: use PINGPONG_NONE to unbind INTF from PP
Message-ID: <hgfttvf6wz33yuntks6qjy3wd7dccoep42a6awid7kaufswfjz@rxp23xsbq3wa>
References: <20230526090945.439639-1-dmitry.baryshkov@linaro.org>
 <h33hhvvlwq67uooelhm5wot7hx5utzegxtq3wu25rfrcrjx45n@dznkc26cxz23>
 <CAA8EJpq6cse-cxDSv+a1A0Pn4p0o-a1NO9+3vCDROnkc6gJT2A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpq6cse-cxDSv+a1A0Pn4p0o-a1NO9+3vCDROnkc6gJT2A@mail.gmail.com>
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

On 2023-05-30 01:13:12, Dmitry Baryshkov wrote:
> On Tue, 30 May 2023 at 00:46, Marijn Suijten
> <marijn.suijten@somainline.org> wrote:
> >
> > On 2023-05-26 12:09:45, Dmitry Baryshkov wrote:
> > > Currently the driver passes the PINGPONG index to
> > > dpu_hw_intf_ops::bind_pingpong_blk() callback and uses separate boolean
> > > flag to tell whether INTF should be bound or unbound. Simplify this by
> > > passing PINGPONG_NONE in case of unbinding and drop the flag completely.
> >
> > Perhaps worth mentioning that this flag was only recently introduced
> > (and link to it as a dependency under the cut),
> 
> The patch is already a part of linux-next. This is the usual boundary
> of skipping the dependencies.

Excuse me, I forgot about the confusion even after reviewing your patch
[1] which introduces PINGPONG_NONE, while DSC v14 (sent 3 days after
your patch was applied) also still introduces the same [2].  This patch
should likely be rebased and retitled.

[1]: https://lore.kernel.org/dri-devel/20230519234025.2864377-4-dmitry.baryshkov@linaro.org/
[2]: https://lore.kernel.org/linux-arm-msm/1685036458-22683-6-git-send-email-quic_khsieh@quicinc.com/

> >  as well as explain that
> > the passed `enum dpu_pingpong` value is bogus when enable=false because
> > it is not part of the value written to the register for the
> > "unbind/disable" case?
> 
> Good suggestion.
> 
> >  See for example the wording I suggested on the
> > patch that introduces and uses PINGPONG_NONE.
> >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c          | 4 ++--
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 4 +---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 1 -
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 3 +--
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h          | 1 -
> >
> > How about appending/sending another patch that drops this from
> > dpu_hw_wb.c as well?
> 
> Ack, nice catch.
> 
> >
> > >  5 files changed, 4 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > index ebe34eda6e50..7fd3a13ac226 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > @@ -2102,8 +2102,8 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
> > >               for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> > >                       if (dpu_enc->phys_encs[i] && phys_enc->hw_intf->ops.bind_pingpong_blk)
> > >                               phys_enc->hw_intf->ops.bind_pingpong_blk(
> > > -                                             dpu_enc->phys_encs[i]->hw_intf, false,
> > > -                                             dpu_enc->phys_encs[i]->hw_pp->idx);
> > > +                                             dpu_enc->phys_encs[i]->hw_intf,
> > > +                                             PINGPONG_NONE);
> > >
> > >                       /* mark INTF flush as pending */
> > >                       if (phys_enc->hw_ctl->ops.update_pending_flush_intf)
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > > index 1a4c20f02312..3130c86a32cc 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > > @@ -66,7 +66,6 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
> > >       if (test_bit(DPU_CTL_ACTIVE_CFG, &ctl->caps->features) && phys_enc->hw_intf->ops.bind_pingpong_blk)
> > >               phys_enc->hw_intf->ops.bind_pingpong_blk(
> > >                               phys_enc->hw_intf,
> > > -                             true,
> > >                               phys_enc->hw_pp->idx);
> > >
> > >       if (phys_enc->hw_intf->ops.enable_compression)
> > > @@ -556,8 +555,7 @@ static void dpu_encoder_phys_cmd_disable(struct dpu_encoder_phys *phys_enc)
> > >       if (phys_enc->hw_intf->ops.bind_pingpong_blk) {
> > >               phys_enc->hw_intf->ops.bind_pingpong_blk(
> > >                               phys_enc->hw_intf,
> > > -                             false,
> > > -                             phys_enc->hw_pp->idx);
> > > +                             PINGPONG_NONE);
> >
> > Is there also a cleanup state where hw_pp is assigned back to NULL?
> 
> No. None of the encoder resources are reassigned to NULL. I will tend
> this topic during vN of resource allocation rework.
> 
> >
> > >               ctl = phys_enc->hw_ctl;
> > >               ctl->ops.update_pending_flush_intf(ctl, phys_enc->intf_idx);
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > > index 3a374292f311..220020273304 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > > @@ -287,7 +287,6 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
> > >       if (phys_enc->hw_intf->ops.bind_pingpong_blk)
> > >               phys_enc->hw_intf->ops.bind_pingpong_blk(
> > >                               phys_enc->hw_intf,
> > > -                             true,
> > >                               phys_enc->hw_pp->idx);
> > >
> > >       if (phys_enc->hw_pp->merge_3d)
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> > > index a2486f99d3c2..918d154848b9 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> > > @@ -268,7 +268,6 @@ static void dpu_hw_intf_setup_prg_fetch(
> > >
> > >  static void dpu_hw_intf_bind_pingpong_blk(
> > >               struct dpu_hw_intf *intf,
> > > -             bool enable,
> > >               const enum dpu_pingpong pp)
> > >  {
> > >       struct dpu_hw_blk_reg_map *c = &intf->hw;
> > > @@ -277,7 +276,7 @@ static void dpu_hw_intf_bind_pingpong_blk(
> > >       mux_cfg = DPU_REG_READ(c, INTF_MUX);
> > >       mux_cfg &= ~0xf;
> > >
> > > -     if (enable)
> > > +     if (pp != PINGPONG_NONE)
> >
> > Kuogee just used `if (pp)`, I think we should stay consistent.
> 
> Sure. The rest of the driver usually compares to foo_NONE.

If that is the common way to do it, that DSC patch [2] should also use a
an explicit comparison instead of assuming PINGPONG_NONE = 0?

- Marijn
