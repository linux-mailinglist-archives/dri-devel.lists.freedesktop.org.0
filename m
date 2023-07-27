Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F94765D2F
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 22:24:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C4F410E5FF;
	Thu, 27 Jul 2023 20:24:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [5.144.164.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4072310E5FC;
 Thu, 27 Jul 2023 20:24:14 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 0C2EB204BA;
 Thu, 27 Jul 2023 22:24:12 +0200 (CEST)
Date: Thu, 27 Jul 2023 22:24:10 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 5/7] drm/msm/dpu: drop DPU_INTF_TE feature flag
Message-ID: <xqzczgacnl76m5wsvhfbczpc54svf452azirw24dtqkrtw4ndi@gdvmmrt3u56x>
References: <20230727162104.1497483-1-dmitry.baryshkov@linaro.org>
 <20230727162104.1497483-6-dmitry.baryshkov@linaro.org>
 <bndyttm2ytf7bz2cdok4ewnd7vpv75ud4eqialpleihjs6ahr2@6ehcv3zjpkky>
 <2a38d144-3a2d-ee61-1554-ae94766b1d36@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a38d144-3a2d-ee61-1554-ae94766b1d36@linaro.org>
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

On 2023-07-27 23:16:22, Dmitry Baryshkov wrote:
> On 27/07/2023 23:14, Marijn Suijten wrote:
> > On 2023-07-27 19:21:02, Dmitry Baryshkov wrote:
> >> Replace the only user of the DPU_INTF_TE feature flag with the direct
> >> DPU version comparison.
> >>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> > 
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 4 ++--
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c       | 1 -
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h       | 2 --
> >>   3 files changed, 2 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> >> index 9589fe719452..60d4dd88725e 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> >> @@ -776,8 +776,8 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
> >>   	phys_enc->intf_mode = INTF_MODE_CMD;
> >>   	cmd_enc->stream_sel = 0;
> >>   
> >> -	phys_enc->has_intf_te = test_bit(DPU_INTF_TE,
> >> -					 &phys_enc->hw_intf->cap->features);
> >> +	if (phys_enc->dpu_kms->catalog->mdss_ver->core_major_ver >= 5)
> >> +		phys_enc->has_intf_te = true;
> > 
> > We could also check if the INTF block has the callbacks (which it based
> > on the presence of the interrupt line in the catalog instead), but then
> > I think we might loose some extra validation which you tidied up in a
> > later patch in this series?
> 
> Almost. The logic was the following: we should be using INTF for DPU >= 
> 5.0. And if we have DPU >= 5.0 and no callbacks, it's an error.

Indeed.  Let's keep that validation just in case.

- Marijn
