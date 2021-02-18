Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BED331E514
	for <lists+dri-devel@lfdr.de>; Thu, 18 Feb 2021 05:14:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2808E6E9F6;
	Thu, 18 Feb 2021 04:14:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 811A96E9F5;
 Thu, 18 Feb 2021 04:14:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1600160C40;
 Thu, 18 Feb 2021 04:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613621659;
 bh=KZqCNysaKUxYDBTFhnyoUzBwd6wRpQem0qnWTk5rvC4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mrO6b+qe960a1bhW86+pSm8oCnN6gXl8AKSeqKXOFSjqF9FwuJGcy3/LL4L/iAhZD
 7VRbaD/kDq7R5mmCZxLuVy21jIGsamaZwKrjueom/WCTpZyL/Pr0Jo1UyztkZw+x/q
 S3BzoY2CgvaCn3e8ikg17iTVmi4ojWKBSQq1VaVGPUJ8eoCrlgOtdfSD/oTZzavD25
 aj5qIyBhvGKyExXeWzN2OfRC52ogyerDOmmIsAXpxaNqmCjoos0oiZrf7mvJvFK+p7
 nweGSFBdSMjjTsw2oNd8CzkKAxRHmzkOIGuKsZ1YOinwdvKy0GLlT92i6/qvVp1pWq
 zJ9+fCeD4oXDg==
Date: Thu, 18 Feb 2021 09:44:14 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH] drm/msm/dp: add support of HBR3 link rate
Message-ID: <20210218041414.GT2774@vkoul-mobl.Dlink>
References: <1613581122-8473-1-git-send-email-khsieh@codeaurora.org>
 <161358337887.1254594.12898848287081049541@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <161358337887.1254594.12898848287081049541@swboyd.mtv.corp.google.com>
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org,
 Kuogee Hsieh <khsieh@codeaurora.org>, tanmay@codeaurora.org,
 aravindh@codeaurora.org, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17-02-21, 09:36, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2021-02-17 08:58:42)
> > Add hbr3_hbr2 voltage and pre-emphasis swing table to support
> > HBR3 link rate
> > 
> > Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> > ---
> >  drivers/gpu/drm/msm/dp/dp_panel.c   |  4 ----
> >  drivers/phy/qualcomm/phy-qcom-qmp.c | 24 ++++++++++++++++++++++--
> 
> This spans to subsystems so at least you should run get_maintainers and
> include phy maintainers. Maybe it should be split into two patches too
> so it can go via different trees.

different patches for different subsytem unless we risk breaking bisect
should be general approach...

> 
> >  2 files changed, 22 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> > index 9cc8166..63112fa 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> > @@ -76,10 +76,6 @@ static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
> >         if (link_info->num_lanes > dp_panel->max_dp_lanes)
> >                 link_info->num_lanes = dp_panel->max_dp_lanes;
> >  
> > -       /* Limit support upto HBR2 until HBR3 support is added */
> > -       if (link_info->rate >= (drm_dp_bw_code_to_link_rate(DP_LINK_BW_5_4)))
> > -               link_info->rate = drm_dp_bw_code_to_link_rate(DP_LINK_BW_5_4);
> > -
> >         DRM_DEBUG_DP("version: %d.%d\n", major, minor);
> >         DRM_DEBUG_DP("link_rate=%d\n", link_info->rate);
> >         DRM_DEBUG_DP("lane_count=%d\n", link_info->num_lanes);
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> > index 0939a9e..cc5ef59 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> > @@ -2965,6 +2965,21 @@ static void qcom_qmp_phy_dp_aux_init(struct qmp_phy *qphy)
> >                qphy->pcs + QSERDES_V3_DP_PHY_AUX_INTERRUPT_MASK);
> >  }
> >  
> > +
> > +static u8 const qmp_dp_v3_pre_emphasis_hbr3_hbr2[4][4] = {
> 
> Should be static const u8 qmp_dp...
> 
> > +        {0x00, 0x0C, 0x15, 0x1A},
> > +        {0x02, 0x0E, 0x16, 0xFF},
> > +        {0x02, 0x11, 0xFF, 0xFF},
> > +        {0x04, 0xFF, 0xFF, 0xFF}
> > +};
> > +
> > +static u8 const qmp_dp_v3_voltage_swing_hbr3_hbr2[4][4] = {
> 
> Same.
> 
> > +        {0x02, 0x12, 0x16, 0x1A},
> 
> Please add a space after { and before } and use lowercase hex to match
> the qmp_dp_v3_pre_emphasis_hbr_rbr design.
> 
> > +        {0x09, 0x19, 0x1F, 0xFF},
> > +        {0x10, 0x1F, 0xFF, 0xFF},
> > +        {0x1F, 0xFF, 0xFF, 0xFF}
> > +};
> > +
> >  static const u8 qmp_dp_v3_pre_emphasis_hbr_rbr[4][4] = {
> >         { 0x00, 0x0c, 0x14, 0x19 },
> >         { 0x00, 0x0b, 0x12, 0xff },
> > @@ -3000,8 +3015,13 @@ static void qcom_qmp_phy_configure_dp_tx(struct qmp_phy *qphy)
> >                 drvr_en = 0x10;
> >         }
> >  
> > -       voltage_swing_cfg = qmp_dp_v3_voltage_swing_hbr_rbr[v_level][p_level];
> > -       pre_emphasis_cfg = qmp_dp_v3_pre_emphasis_hbr_rbr[v_level][p_level];
> > +       if (dp_opts->link_rate <= 2700) {
> > +               voltage_swing_cfg = qmp_dp_v3_voltage_swing_hbr_rbr[v_level][p_level];
> > +               pre_emphasis_cfg = qmp_dp_v3_pre_emphasis_hbr_rbr[v_level][p_level];
> > +       } else {
> > +               voltage_swing_cfg = qmp_dp_v3_voltage_swing_hbr3_hbr2[v_level][p_level];
> > +               pre_emphasis_cfg = qmp_dp_v3_pre_emphasis_hbr3_hbr2[v_level][p_level];
> > +       }

-- 
~Vinod
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
