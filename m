Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CAD8A836A
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 14:50:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 128A1113495;
	Wed, 17 Apr 2024 12:50:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [5.144.164.164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7321113495
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 12:50:08 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 2AB341F68B;
 Wed, 17 Apr 2024 14:50:05 +0200 (CEST)
Date: Wed, 17 Apr 2024 14:50:03 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Archit Taneja <architt@codeaurora.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, Vinod Koul <vkoul@kernel.org>, 
 Sravanthi Kollukuduru <skolluku@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jordan Crouse <jordan@cosmicpenguin.net>, Rajesh Yadav <ryadav@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>
Subject: Re: [PATCH 6/7] drm/msm/dsi: Set PHY usescase before registering DSI
 host
Message-ID: <dwda6pf5e5k2ohxexxxrqdzvcgaxp3p7g3erqoqha4ouhtvzez@dmuxgqlvyp6x>
References: <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-0-78ae3ee9a697@somainline.org>
 <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-6-78ae3ee9a697@somainline.org>
 <CAA8EJpry5Gct7Q2sAwFBVYV163X9BOcuKu9So47FEJaeXcdSaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpry5Gct7Q2sAwFBVYV163X9BOcuKu9So47FEJaeXcdSaQ@mail.gmail.com>
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

On 2024-04-17 11:18:58, Dmitry Baryshkov wrote:
> On Wed, 17 Apr 2024 at 02:57, Marijn Suijten
> <marijn.suijten@somainline.org> wrote:
> >
> > Ordering issues here cause an uninitalized (default STANDALONE)
> > usecase to be programmed (which appears to be a MUX) in some cases
> > when msm_dsi_host_register() is called, leading to the slave PLL in
> > bonded-DSI mode to source from a clock parent (dsi1vco) that is off.
> >
> > This should seemingly not be a problem as the actual dispcc clocks from
> > DSI1 that are muxed in the clock tree of DSI0 are way further down, this
> > bit still seems to have an effect on them somehow and causes the right
> > side of the panel controlled by DSI1 to not function.
> >
> > In an ideal world this code is refactored to no longer have such
> > error-prone calls "across subsystems", and instead model the "PLL src"
> > register field as a regular mux so that changing the clock parents
> > programmatically or in DTS via `assigned-clock-parents` has the
> > desired effect.
> > But for the avid reader, the clocks that we *are* muxing into DSI0's
> > tree are way further down, so if this bit turns out to be a simple mux
> > between dsiXvco and out_div, that shouldn't have any effect as this
> > whole tree is off anyway.
> >
> > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > ---
> >  drivers/gpu/drm/msm/dsi/dsi_manager.c | 15 +++++++++++----
> >  1 file changed, 11 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > index af2a287cb3bd..17f43b3c0494 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > @@ -85,6 +85,17 @@ static int dsi_mgr_setup_components(int id)
> >                                                         msm_dsi : other_dsi;
> >                 struct msm_dsi *slave_link_dsi = IS_MASTER_DSI_LINK(id) ?
> >                                                         other_dsi : msm_dsi;
> > +
> > +               /* PLL0 is to drive both 2 DSI link clocks in bonded DSI mode.
> > +                *
> > +                * Set the usecase before calling msm_dsi_host_register() to prevent it from
> > +                * enabling and configuring the usecase (which is just a mux bit) first.
> > +                */
> > +               msm_dsi_phy_set_usecase(clk_master_dsi->phy,
> > +                                       MSM_DSI_PHY_MASTER);
> > +               msm_dsi_phy_set_usecase(clk_slave_dsi->phy,
> > +                                       MSM_DSI_PHY_SLAVE);
> > +
> >                 /* Register slave host first, so that slave DSI device
> >                  * has a chance to probe, and do not block the master
> >                  * DSI device's probe.
> > @@ -100,10 +111,6 @@ static int dsi_mgr_setup_components(int id)
> >                         return ret;
> >
> >                 /* PLL0 is to drive both 2 DSI link clocks in bonded DSI mode. */
> > -               msm_dsi_phy_set_usecase(clk_master_dsi->phy,
> > -                                       MSM_DSI_PHY_MASTER);
> > -               msm_dsi_phy_set_usecase(clk_slave_dsi->phy,
> > -                                       MSM_DSI_PHY_SLAVE);
> >                 msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
> >                 msm_dsi_host_set_phy_mode(other_dsi->host, other_dsi->phy);
> 
> Please move msm_dsi_host_set_phy_mode() calls too.

Ack.  Yeah, given that msm_dsi_host_register() causes a modeset and finally the
PLL turning on, these should be set up as well.

For anyone else following along, I have pasted the stacktrace that showcases
the execution flow in the drm/msm tracker:

https://gitlab.freedesktop.org/drm/msm/-/issues/41#note_2376115

Abhinav also pointed out that this PLL source was correctly set in earlier
devcoredump reports, so it might have been a recent development/regression?
This seems to be the only issue originating from it, but folks were adamant that
dsi_mgr_setup_components() (ultimately) would never turn the PLL on, which is
"debunked" by said stacktrace.  Maybe other assumptions are affected by this
change?

> Also please update the non-bonded case.

Definitely, as suggested in the cover letter.  A similar stacktrace to the above
is acquired on a non-bonded setup, which is also relying on the variable to be
initialized to 0 to select the "local PLL source", rather than being correctly
set via this msm_dsi_phy_set_usecase() configuration.

- Marijn

> >         }
> >
> > --
> > 2.44.0
> >
> 
> 
> -- 
> With best wishes
> Dmitry
