Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D8E72BBF3
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 11:21:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 048E310E1E4;
	Mon, 12 Jun 2023 09:21:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFDCC10E1E5
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 09:21:52 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id AA6033F35C;
 Mon, 12 Jun 2023 11:21:50 +0200 (CEST)
Date: Mon, 12 Jun 2023 11:21:49 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 2/2] drm/msm/dsi: don't allow enabling 7nm VCO with
 unprogrammed rate
Message-ID: <yyjkikzxsggwlnxcexho62zkapw5xrkogvoclsu6af7t5xcp3a@jdssfb3hz7px>
References: <20230612031616.3620134-1-dmitry.baryshkov@linaro.org>
 <20230612031616.3620134-2-dmitry.baryshkov@linaro.org>
 <g4ogg7ecraduqbvcxsost2lm26fr6rswdm4tgba5ae23b5jjvg@6mzv2u7bmw7u>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <g4ogg7ecraduqbvcxsost2lm26fr6rswdm4tgba5ae23b5jjvg@6mzv2u7bmw7u>
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
Cc: freedreno@lists.freedesktop.org, Degdag Mohamed <degdagmohamed@gmail.com>,
 Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-06-12 11:15:53, Marijn Suijten wrote:
> On 2023-06-12 06:16:16, Dmitry Baryshkov wrote:
> > CCF can try enabling VCO before the rate has been programmed. This can
> > cause clock lockups and/or other boot issues. Program the VCO to the
> > minimal PLL rate if the read rate is 0 Hz.
> > 
> > Reported-by: Degdag Mohamed <degdagmohamed@gmail.com>
> > Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> This unfortunately regresses my Xperia 5 (sofef01 panel driver that's
> on the lists) to now run at 30~33Hz instead of 60Hz.  I can provide
> debugging and clk trees later, if needed.

I'll also retest the Xperia 1 with this, which has a 4k DSC panel.

Is this intended to get rid of:

    msm_dsi_phy ae94400.phy: [drm:dsi_pll_7nm_vco_prepare] *ERROR* DSI PLL(0) lock failed, status=0x00000000: -110
    PLL(0) lock failed

... at startup (and relevant rcg2 update_config failures, unbalanced
disables etc)?  It locks after a couple tries but it's still
unnecessarily spammy.

- Marijn

> 
> - Marijn
> 
> > ---
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> > index 3b1ed02f644d..6979d35eb7c3 100644
> > --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> > +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> > @@ -395,11 +395,16 @@ static void dsi_pll_phy_dig_reset(struct dsi_pll_7nm *pll)
> >  	wmb(); /* Ensure that the reset is deasserted */
> >  }
> >  
> > +static unsigned long dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
> > +						  unsigned long parent_rate);
> >  static int dsi_pll_7nm_vco_prepare(struct clk_hw *hw)
> >  {
> >  	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(hw);
> >  	int rc;
> >  
> > +	if (dsi_pll_7nm_vco_recalc_rate(hw, VCO_REF_CLK_RATE) == 0)
> > +		dsi_pll_7nm_vco_set_rate(hw, pll_7nm->phy->cfg->min_pll_rate, VCO_REF_CLK_RATE);
> > +
> >  	dsi_pll_enable_pll_bias(pll_7nm);
> >  	if (pll_7nm->slave)
> >  		dsi_pll_enable_pll_bias(pll_7nm->slave);
> > -- 
> > 2.39.2
> > 
