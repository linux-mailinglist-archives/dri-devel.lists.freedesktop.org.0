Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEDF531E24
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 23:44:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C59710EC8D;
	Mon, 23 May 2022 21:44:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [5.144.164.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3531110EA67;
 Mon, 23 May 2022 21:44:53 +0000 (UTC)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl
 [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 8E0EE1F644;
 Mon, 23 May 2022 23:44:51 +0200 (CEST)
Date: Mon, 23 May 2022 23:44:42 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm/msm/dsi: pll_7nm: remove unsupported dividers for
 DSI pixel clock
Message-ID: <20220523214442.3tc5injctsqjwc5e@SoMainline.org>
References: <20220501195620.4135080-1-dmitry.baryshkov@linaro.org>
 <CAE-0n51uV-BpuPSrTFiN2wvzh3+==WMU85j8kdi-td0X4xs8kg@mail.gmail.com>
 <20220502214235.s5plebunh4ttjhge@SoMainline.org>
 <f01f5ace-4ae9-2b65-2ce8-fb2cdc0a5af1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f01f5ace-4ae9-2b65-2ce8-fb2cdc0a5af1@linaro.org>
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-05-03 01:02:42, Dmitry Baryshkov wrote:
> On 03/05/2022 00:42, Marijn Suijten wrote:
> > On 2022-05-02 13:47:51, Stephen Boyd wrote:
> >> Quoting Dmitry Baryshkov (2022-05-01 12:56:20)
> >>> Remove dividers that are not recommended for DSI DPHY mode when setting
> >>
> >> Is "DPHY" intentional or just "PHY" should be here?
> >>
> >>> up the clock tree for the DSI pixel clock.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>
> >> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> >>
> >>>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 10 ++++------
> >>>   1 file changed, 4 insertions(+), 6 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >>> index 6e506feb111f..66ed1919a1db 100644
> >>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >>> @@ -687,15 +687,13 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
> >>>                  snprintf(clk_name, 32, "dsi%d_pclk_mux", pll_7nm->phy->id);
> >>>                  snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_7nm->phy->id);
> >>>                  snprintf(parent2, 32, "dsi%d_pll_by_2_bit_clk", pll_7nm->phy->id);
> >>> -               snprintf(parent3, 32, "dsi%d_pll_out_div_clk", pll_7nm->phy->id);
> >>> -               snprintf(parent4, 32, "dsi%d_pll_post_out_div_clk", pll_7nm->phy->id);
> >>>
> >>>                  hw = devm_clk_hw_register_mux(dev, clk_name,
> >>>                                          ((const char *[]){
> >>> -                                       parent, parent2, parent3, parent4
> >>> -                                       }), 4, 0, pll_7nm->phy->base +
> >>> +                                       parent, parent2,
> >>> +                                       }), 2, 0, pll_7nm->phy->base +
> >>>                                          REG_DSI_7nm_PHY_CMN_CLK_CFG1,
> >>> -                                       0, 2, 0, NULL);
> >>> +                                       0, 1, 0, NULL);
> >>
> >> Can you followup with a patch to move to clk_parent_data instead of
> >> strings?
> > 
> > Dmitry and I discussed this a while ago, and I actually have patches in
> > progress converting this.  Dmitry, if you haven't started on the
> > conversion yet, perhaps it's efficient if I respin my efforts and submit
> > them soon?
> 
> Yes, please. I'm under the pile of other things. Your patches will be 
> appreciated. You don't have to convert all PHYs at once.

Holding to my promise, the patches are now available on the lists:

https://lore.kernel.org/linux-arm-msm/20220523213837.1016542-1-marijn.suijten@somainline.org/T/#t

It was more convenient to convert the remaining PHYs on top of the
14/28nm I had already done, it's mostly trivial work anyway.

- Marijn
