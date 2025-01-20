Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10831A16CE4
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 14:06:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10B8B10E3FA;
	Mon, 20 Jan 2025 13:06:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 484 seconds by postgrey-1.36 at gabe;
 Mon, 20 Jan 2025 13:06:18 UTC
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B381F10E3ED;
 Mon, 20 Jan 2025 13:06:18 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id BCBE1200A8;
 Mon, 20 Jan 2025 13:58:11 +0100 (CET)
Date: Mon, 20 Jan 2025 13:58:09 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 16/16] drm/msm/dpu: Enable quad-pipe for DSC and
 dual-DSI case
Message-ID: <6ds6wxlf56kt3lislorxubwbjldpknz74c76smglynzh4jxcpq@dcr2ptutaopa>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-16-74749c6eba33@linaro.org>
 <mw7zc4ljagxs6sjpl2wfjicq56w7ru2dd43u55rrtwyux62bb5@3w4zayfqxlai>
 <CABymUCMnYy-L2Bd6dgYzPTB+qzpFLbU-LyCLDKxCSWy19x_A5g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCMnYy-L2Bd6dgYzPTB+qzpFLbU-LyCLDKxCSWy19x_A5g@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2025-01-17 15:32:44, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> 于2025年1月16日周四 16:32写道：
> >
> > On Thu, Jan 16, 2025 at 03:26:05PM +0800, Jun Nie wrote:
> > > Request 4 mixers and 4 DSC for the case that both dual-DSI and DSC are
> > > enabled.
> >
> > Why? What is the issue that you are solving?
> 
>     To support high-resolution cases that exceed the width limitation of

How high is high?  Some Sony phones use a bonded 2:2:2 setup.

>     a pair of SSPPs, or scenarios that surpass the maximum MDP clock rate,
>     additional pipes are necessary to enable parallel data processing
>     within the SSPP width constraints and MDP clock rate.
> 
>     Request 4 mixers and 4 DSCs for high-resolution cases where both DSC
>     and dual interfaces are enabled. More use cases can be incorporated
>     later if quad-pipe capabilities are required.
> 
> >
> > > 4 pipes are preferred for dual DSI case for it is power optimal
> > > for DSC.
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         |  2 +-
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  6 ++---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 29 ++++++++++++++++++------
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  2 +-
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |  2 +-
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |  2 +-
> > >  6 files changed, 29 insertions(+), 14 deletions(-)
> > >
> >
> > > @@ -664,15 +664,20 @@ static struct msm_display_topology dpu_encoder_get_topology(
> > >
> > >       /* Datapath topology selection
> > >        *
> > > -      * Dual display
> > > +      * Dual display without DSC
> > >        * 2 LM, 2 INTF ( Split display using 2 interfaces)
> > >        *
> > > +      * Dual display with DSC
> > > +      * 2 LM, 2 INTF ( Split display using 2 interfaces)
> > > +      * 4 LM, 2 INTF ( Split display using 2 interfaces)

Are these always bonded (i.e. single display with dual-DSI link), or can it be
two independent panels?

> > > +      *
> > >        * Single display
> > >        * 1 LM, 1 INTF
> > >        * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
> > >        *
> > >        * Add dspps to the reservation requirements if ctm is requested
> > >        */
> > > +
> >
> > irrlevant extra line, please drop.
> >
> > >       if (intf_count == 2)
> > >               topology.num_lm = 2;
> > >       else if (!dpu_kms->catalog->caps->has_3d_merge)
> > > @@ -691,10 +696,20 @@ static struct msm_display_topology dpu_encoder_get_topology(
> > >                * 2 DSC encoders, 2 layer mixers and 1 interface
> > >                * this is power optimal and can drive up to (including) 4k
> > >                * screens
> > > +              * But for dual display case, we prefer 4 layer mixers. Because
> > > +              * the resolution is always high in the case and 4 DSCs are more
> > > +              * power optimal.
> >
> > I think this part is thought about in a wrong way. If it was just about
> > power efficiency, we wouldn't have to add quad pipe support.
> > Please correct me if I'm wrong, but I think it is about the maximum
> > width supported by a particular topology being too low for a requested
> > resolution. So, if there is a DSC and mode width is higher than 5120
> > (8.x+) / 4096 ( <= 7.x), then we have to use quad pipe. Likewise if
> > there is no DSC in play, the limitation should be 2 * max_mixer_width.
> 
> Both width limitation and clock rate contribute to pipe number decision.
> To support high resolution, the MDP clock may be required to overclock
> to a higher rate than the safe rate. Current implementation does not
> support checking clock rate when deciding topology. We can add the
> clock rate check later with a new patch.
> >
> > >                */
> > > -             topology.num_dsc = 2;
> > > -             topology.num_lm = 2;
> > > -             topology.num_intf = 1;
> > > +
> > > +             if (intf_count == 2) {
> > > +                     topology.num_dsc = dpu_kms->catalog->dsc_count >= 4 ? 4 : 2;

What if there are other encoders that have already reserved DSC blocks, reducing
the current available number of DSC blocks?  This patch seems to cover multiple
panels/interfaces on a single virtual encoder, how does one get to such a
scenario?  Bonded display?  If one or more DP panel is connected, do they use
their own virtual encoder, and hence miss out on logic that properly divides
available DSC blocks?

That idea is what's been holding back a quick hack to support 1:1:1
topology for sc7280 / FairPhone 5 to perform a similar workaround:

	if (catalog->dsc_count < 2)
		num_dsc = num_lm = 1;.

> >
> > This assumes that the driver can support 2:2:2. Is it the case?
> 
> The code falls back to 2:2:2 case here. But I guess 2:2:2 does not work yet.
> How about below code for DSC case?

I've been working on 2:2:2 support [1] but have stalled it to see how your
series here pans out.  Doesn't look like it's heading in a compatible direction
though, going for quick wins rather than redesigning how DSC blocks are
allocated (to name one of the many topics).

[1]: https://lore.kernel.org/linux-arm-msm/20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-0-78ae3ee9a697@somainline.org/

- Marijn

> 
>                  if (intf_count == 2 && dpu_kms->catalog->dsc_count >= 4) {
>                          topology.num_dsc = 4;
>                          topology.num_lm = 4;
>                          topology.num_intf = 2;
>                  } else {
>                          topology.num_dsc = 2;
>                          topology.num_lm = 2;
>                          topology.num_intf = 1;
>                  }
> 
> >
> > > +                     topology.num_lm = topology.num_dsc;
> > > +                     topology.num_intf = 2;
> > > +             } else {
> > > +                     topology.num_dsc = 2;
> > > +                     topology.num_lm = 2;
> > > +                     topology.num_intf = 1;
> > > +             }
> > >       }
> > >
> > >       return topology;
> >
> > --
> > With best wishes
> > Dmitry
