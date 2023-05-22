Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDE570CDBA
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 00:20:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8F5F10E39D;
	Mon, 22 May 2023 22:20:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84A6010E3A0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 22:20:26 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id D6CA93EEEC;
 Tue, 23 May 2023 00:20:24 +0200 (CEST)
Date: Tue, 23 May 2023 00:20:23 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 4/6] drm/msm/dpu: autodetect supported interrupts
Message-ID: <xlbo42dxaavbowu2luhkxwai2sflrzxuefw4ry354ye5t4ml6g@wjgvvg77sjv7>
References: <20230522214527.190054-1-dmitry.baryshkov@linaro.org>
 <20230522214527.190054-5-dmitry.baryshkov@linaro.org>
 <j4sprk5c7wiafq5w5246xab2qgrevyz26bcwukgdk7zcac4ylk@pyt4s2ms5fyk>
 <CAA8EJpr7caQsbUACsETQG6KTU=rzrXadBv-RHVTQD_zeY8x1Jg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpr7caQsbUACsETQG6KTU=rzrXadBv-RHVTQD_zeY8x1Jg@mail.gmail.com>
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

On 2023-05-23 01:17:50, Dmitry Baryshkov wrote:
> On Tue, 23 May 2023 at 01:12, Marijn Suijten
> <marijn.suijten@somainline.org> wrote:
> >
> > On 2023-05-23 00:45:25, Dmitry Baryshkov wrote:
> > > Declaring the mask of supported interrupts proved to be error-prone. It
> > > is very easy to add a bit with no corresponding backing block or to miss
> > > the INTF TE bit. Replace this with looping over the enabled INTF blocks
> > > to setup the irq mask.
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> >
> > > ---
> > >  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 20 ++++++++++++++++++-
> > >  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  6 ++++++
> > >  2 files changed, 25 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> > > index a03d826bb9ad..01f2660a2354 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> > > @@ -463,6 +463,7 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
> > >  {
> > >       struct dpu_hw_intr *intr;
> > >       int nirq = MDP_INTR_MAX * 32;
> > > +     unsigned int i;
> > >
> > >       if (!addr || !m)
> > >               return ERR_PTR(-EINVAL);
> > > @@ -480,7 +481,24 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
> > >
> > >       intr->total_irqs = nirq;
> > >
> > > -     intr->irq_mask = m->mdss_irqs;
> > > +     intr->irq_mask = BIT(MDP_SSPP_TOP0_INTR) |
> > > +                      BIT(MDP_SSPP_TOP0_INTR2) |
> > > +                      BIT(MDP_SSPP_TOP0_HIST_INTR);
> > > +     for (i = 0; i < m->intf_count; i++) {
> > > +             const struct dpu_intf_cfg *intf = &m->intf[i];
> > > +
> > > +             if (intf->type == INTF_NONE)
> > > +                     continue;
> > > +
> > > +             intr->irq_mask |= BIT(MDP_INTFn_INTR(intf->id));
> > > +
> > > +             if (test_bit(DPU_INTF_TE, &intf->features)) {
> > > +                     unsigned idx = MDP_INTFn_TEAR_INTR(intf->id);
> > > +
> > > +                     if (!WARN_ON(idx == -1))
> >
> > We don't need to validate the catalog?  But warning users about this
> > (and accidentally turning on all interrupt bits hiding the issue anyway)
> > is a nice side effect though, as you showed it was already going wrong
> > in patch 1/6.
> >
> > OTOH you might have inlined the macro and provided a more useful warning
> > message (DPU_INTF_TE can only be present on INTF1/2)... and then one
> > could assert on INTF_DSI etc etc etc...
> 
> I'd prefer to keep it, as a safeguard for submission being in
> progress, newer generations gaining TE blocks on other interfaces,
> etc.
> I was selecting between having explicit intf->id == INTF_1 || ==
> INTF_2 condition and this kind of macro.

Being explicit in-line here has my preference.  Maybe the same for the
above bit, not sure about that one yet (e.g. have an upper bound on
INTF_8).

- Marijn

> 
> >
> > - Marijn
> >
> > > +                             intr->irq_mask |= BIT(idx);
> > > +             }
> > > +     }
> > >
> > >       spin_lock_init(&intr->irq_lock);
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> > > index f329d6d7f646..f0b92c9e3b09 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> > > @@ -17,6 +17,7 @@ enum dpu_hw_intr_reg {
> > >       MDP_SSPP_TOP0_INTR,
> > >       MDP_SSPP_TOP0_INTR2,
> > >       MDP_SSPP_TOP0_HIST_INTR,
> > > +     /* All MDP_INTFn_INTR should come sequentially */
> > >       MDP_INTF0_INTR,
> > >       MDP_INTF1_INTR,
> > >       MDP_INTF2_INTR,
> > > @@ -33,6 +34,11 @@ enum dpu_hw_intr_reg {
> > >       MDP_INTR_MAX,
> > >  };
> > >
> > > +#define MDP_INTFn_INTR(intf) (MDP_INTF0_INTR + (intf - INTF_0))
> > > +#define MDP_INTFn_TEAR_INTR(intf) (intf == INTF_1 ? MDP_INTF1_TEAR_INTR : \
> > > +                                intf == INTF_2 ? MDP_INTF2_TEAR_INTR : \
> > > +                                -1)
> > > +
> > >  /* compatibility */
> > >  #define MDP_INTF0_7xxx_INTR MDP_INTF0_INTR
> > >  #define MDP_INTF1_7xxx_INTR MDP_INTF1_INTR
> > > --
> > > 2.39.2
> > >
> 
> 
> 
> -- 
> With best wishes
> Dmitry
