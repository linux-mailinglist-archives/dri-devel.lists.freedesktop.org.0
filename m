Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B562370CBF6
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 23:08:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08E1810E394;
	Mon, 22 May 2023 21:08:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6757710E053
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 21:08:04 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id B42D83F289;
 Mon, 22 May 2023 23:07:56 +0200 (CEST)
Date: Mon, 22 May 2023 23:07:54 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v12 01/10] drm/msm/dpu: set DSC flush bit correctly at
 MDP CTL flush register
Message-ID: <hkuonozf7gll3dd3bp6otdu6dspyrn633yokfx7sckqjs6tx2k@7nu77thwfaxs>
References: <1684783853-22193-1-git-send-email-quic_khsieh@quicinc.com>
 <1684783853-22193-2-git-send-email-quic_khsieh@quicinc.com>
 <d5e232d6-b789-a8c3-4ec5-7af0b9d8b9ae@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5e232d6-b789-a8c3-4ec5-7af0b9d8b9ae@linaro.org>
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
Cc: vkoul@kernel.org, quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com,
 andersson@kernel.org, freedreno@lists.freedesktop.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, quic_jesszhan@quicinc.com,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-22 23:18:02, Dmitry Baryshkov wrote:
> On 22/05/2023 22:30, Kuogee Hsieh wrote:
> > DSC flush bit is the bit 22 of CTL flush register. BIT(22) is expected
> > to be written to CTL flush register to indicates that DSC is ready for
> > flush. However 0x22 (BIT(1) and BIT(5)) was written mistakenly at current
> 
> DSC_IDX is 22, not 0x22.
> 
> > implementation. Fix this problem by writing BIT(22) to CTL flush register
> > for DSC to work properly.

Perhaps this whole comment needs a rewrite anyway, instead of pointing
out grammar errors and confusion:

    The DSC CTL_FLUSH register should be programmed with the 22th bit
    (DSC_IDX) to flush the DSC hardware blocks, not the literal value of
    22 (which corresponds to flushing VIG1, VIG2 and RGB1 instead).

Patch contents are good though, thanks!

- Marijn

> > Changes in V12:
> > -- split this patch out of "separate DSC flush update out of interface"
> > 
> > Fixes: 77f6da90487c ("drm/msm/disp/dpu1: Add DSC support in hw_ctl")
> > Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> > index 4f7cfa9..69d0ea2 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> > @@ -525,7 +525,7 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
> >   		DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
> >   			      BIT(cfg->merge_3d - MERGE_3D_0));
> >   	if (cfg->dsc) {
> > -		DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, DSC_IDX);
> > +		DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, BIT(DSC_IDX));
> >   		DPU_REG_WRITE(c, CTL_DSC_ACTIVE, cfg->dsc);
> >   	}
> >   }
> 
> -- 
> With best wishes
> Dmitry
> 
