Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2EB51795C
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 23:42:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F7C510F435;
	Mon,  2 May 2022 21:42:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B29CC10F435;
 Mon,  2 May 2022 21:42:39 +0000 (UTC)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl
 [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 766C23F353;
 Mon,  2 May 2022 23:42:36 +0200 (CEST)
Date: Mon, 2 May 2022 23:42:35 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH] drm/msm/dsi: pll_7nm: remove unsupported dividers for
 DSI pixel clock
Message-ID: <20220502214235.s5plebunh4ttjhge@SoMainline.org>
References: <20220501195620.4135080-1-dmitry.baryshkov@linaro.org>
 <CAE-0n51uV-BpuPSrTFiN2wvzh3+==WMU85j8kdi-td0X4xs8kg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n51uV-BpuPSrTFiN2wvzh3+==WMU85j8kdi-td0X4xs8kg@mail.gmail.com>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-05-02 13:47:51, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2022-05-01 12:56:20)
> > Remove dividers that are not recommended for DSI DPHY mode when setting
> 
> Is "DPHY" intentional or just "PHY" should be here?
> 
> > up the clock tree for the DSI pixel clock.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> 
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 10 ++++------
> >  1 file changed, 4 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> > index 6e506feb111f..66ed1919a1db 100644
> > --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> > +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> > @@ -687,15 +687,13 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
> >                 snprintf(clk_name, 32, "dsi%d_pclk_mux", pll_7nm->phy->id);
> >                 snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_7nm->phy->id);
> >                 snprintf(parent2, 32, "dsi%d_pll_by_2_bit_clk", pll_7nm->phy->id);
> > -               snprintf(parent3, 32, "dsi%d_pll_out_div_clk", pll_7nm->phy->id);
> > -               snprintf(parent4, 32, "dsi%d_pll_post_out_div_clk", pll_7nm->phy->id);
> >
> >                 hw = devm_clk_hw_register_mux(dev, clk_name,
> >                                         ((const char *[]){
> > -                                       parent, parent2, parent3, parent4
> > -                                       }), 4, 0, pll_7nm->phy->base +
> > +                                       parent, parent2,
> > +                                       }), 2, 0, pll_7nm->phy->base +
> >                                         REG_DSI_7nm_PHY_CMN_CLK_CFG1,
> > -                                       0, 2, 0, NULL);
> > +                                       0, 1, 0, NULL);
> 
> Can you followup with a patch to move to clk_parent_data instead of
> strings?

Dmitry and I discussed this a while ago, and I actually have patches in
progress converting this.  Dmitry, if you haven't started on the
conversion yet, perhaps it's efficient if I respin my efforts and submit
them soon?

- Marijn
