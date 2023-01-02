Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7031365AF69
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 11:18:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3F2210E2F0;
	Mon,  2 Jan 2023 10:18:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [5.144.164.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9376110E2F0
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 10:18:16 +0000 (UTC)
Received: from SoMainline.org (D57D4C6E.static.ziggozakelijk.nl
 [213.125.76.110])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id B5BC23EE91;
 Mon,  2 Jan 2023 11:18:13 +0100 (CET)
Date: Mon, 2 Jan 2023 11:18:12 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [RFC PATCH 3/7] drm/msm/dpu: Disable MDP vsync source selection
 on DPU 5.0.0 and above
Message-ID: <20230102101812.2zo6z57mdhdjueqb@SoMainline.org>
References: <20221231215006.211860-1-marijn.suijten@somainline.org>
 <20221231215006.211860-4-marijn.suijten@somainline.org>
 <20221231215254.pqaegrmldufi7ugo@SoMainline.org>
 <853cbc6e-ae49-b2be-fb64-43f5171b74e8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <853cbc6e-ae49-b2be-fb64-43f5171b74e8@linaro.org>
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
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 dri-devel@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Adam Skladowski <a39.skl@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Kalyan Thota <quic_kalyant@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Vinod Polimera <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-01-02 10:30:58, Konrad Dybcio wrote:
> 
> 
> On 31.12.2022 22:52, Marijn Suijten wrote:
> > On 2022-12-31 22:50:02, Marijn Suijten wrote:
> >> Since hardware revision 5.0.0 the TE configuration moved out of the
> >> PINGPONG block into the INTF block, including vsync source selection
> >> that was previously part of MDP top.  Writing to the MDP_VSYNC_SEL
> >> register has no effect anymore and is omitted downstream via the
> >> DPU/SDE_MDP_VSYNC_SEL feature flag.  This flag is only added to INTF
> >> blocks used by hardware prior to 5.0.0.
> >>
> >> The code that writes to these registers in the INTF block will follow in
> >> subsequent patches.
> >>
> >> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> >> ---
> >>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 33 ++++++++++--
> >>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  1 +
> >>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c    | 52 +++++++++++++------
> >>  3 files changed, 66 insertions(+), 20 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >> index 39d4b293710c..1cfe94494135 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >> @@ -407,7 +407,7 @@ static const struct dpu_mdp_cfg msm8998_mdp[] = {
> >>  	{
> >>  	.name = "top_0", .id = MDP_TOP,
> >>  	.base = 0x0, .len = 0x458,
> >> -	.features = 0,
> >> +	.features = BIT(DPU_MDP_VSYNC_SEL),
> >>  	.highest_bank_bit = 0x2,
> >>  	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
> >>  			.reg_off = 0x2AC, .bit_off = 0},
> >> @@ -436,7 +436,7 @@ static const struct dpu_mdp_cfg sdm845_mdp[] = {
> >>  	{
> >>  	.name = "top_0", .id = MDP_TOP,
> >>  	.base = 0x0, .len = 0x45C,
> >> -	.features = BIT(DPU_MDP_AUDIO_SELECT),
> >> +	.features = BIT(DPU_MDP_AUDIO_SELECT) | BIT(DPU_MDP_VSYNC_SEL),
> >>  	.highest_bank_bit = 0x2,
> >>  	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
> >>  			.reg_off = 0x2AC, .bit_off = 0},
> >> @@ -512,6 +512,31 @@ static const struct dpu_mdp_cfg sm6115_mdp[] = {
> >>  	},
> >>  };
> >>  
> >> +static const struct dpu_mdp_cfg sdm8150_mdp[] = {
> > 
> > Sometimes it is only possible to spot such things _after_ sending,
> > probably the thing that makes us human :)
> > 
> > sm8150_mdp*, not sdm.
> > 
> > - Marijn
> > 
> >> +	{
> >> +	.name = "top_0", .id = MDP_TOP,
> >> +	.base = 0x0, .len = 0x45C,
> >> +	.features = BIT(DPU_MDP_AUDIO_SELECT),
> >> +	.highest_bank_bit = 0x2,
> >> +	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
> >> +			.reg_off = 0x2AC, .bit_off = 0},
> Keeping the hex values lowercase would be nice.

Ack, this was copied verbatim from sdm845_mdp but will cleanup as we go.
Looks like this file has a mixed approach towards lower and uppercase,
when does the normalization patch land?

- Marijn
