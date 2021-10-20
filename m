Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5464347CA
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 11:19:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81CAA89FEC;
	Wed, 20 Oct 2021 09:19:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 663F789FEC;
 Wed, 20 Oct 2021 09:19:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5CDDF61074;
 Wed, 20 Oct 2021 09:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634721571;
 bh=lyuguw0XyKC7pblfSP/PKjf0tJ9Omz7vG2CSkCF9b/Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GpfTbXlxvTLq3xEnQP+Mt5K79oLCsTz8gWGIsl0Bs3jXM1H0sbH/VBxXQmTdapqZJ
 ss4z/dkeFrhUx+tpjQmDQvkkDQfYy0AbS/gYWN8knXneehPld6hyAW+uL5GH5gAYPR
 ieVjo2Dz2AIa7UUy38tZOb0p8e/pLyFQ7TPcaHpkGL1NQQ2e2EHqWwZtrJNMDYZGvH
 sabCabEJDrySLq7HUGodzbr6Mq64EC9kxPYSKTDHZp5q47eMp3pgE4IbFfuY1bkMkd
 YuGbvZZJ9cuLbmC3ZvAHqTtddR4TDz97+VI2JqPx5+SLI4/w+jbW+fMtLRgoHrnp8B
 pM42Dau48lQ2w==
Date: Wed, 20 Oct 2021 14:49:26 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 07/11] drm/msm/disp/dpu1: Add DSC support in hw_ctl
Message-ID: <YW/fHkaTcCbezKMT@matsya>
References: <20211007070900.456044-1-vkoul@kernel.org>
 <20211007070900.456044-8-vkoul@kernel.org>
 <f5f6162c-7ed0-2964-7cf9-0bb894c8b4f5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5f6162c-7ed0-2964-7cf9-0bb894c8b4f5@linaro.org>
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

On 14-10-21, 17:06, Dmitry Baryshkov wrote:
> On 07/10/2021 10:08, Vinod Koul wrote:
> > Later gens of hardware have DSC bits moved to hw_ctl, so configure these
> > bits so that DSC would work there as well
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> > Changes since
> > v1:
> >   - Move this patch from 6 to 7 due to dependency on 6th one
> >   - Use DSC indices for programming DSC registers and program only on non
> >     null indices
> > 
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 12 ++++++++++--
> >   1 file changed, 10 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> > index 3c79bd9c2fe5..8ea9d8dce3f7 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> > @@ -25,6 +25,8 @@
> >   #define   CTL_MERGE_3D_ACTIVE           0x0E4
> >   #define   CTL_INTF_ACTIVE               0x0F4
> >   #define   CTL_MERGE_3D_FLUSH            0x100
> > +#define   CTL_DSC_ACTIVE                0x0E8
> > +#define   CTL_DSC_FLUSH                0x104
> >   #define   CTL_INTF_FLUSH                0x110
> >   #define   CTL_INTF_MASTER               0x134
> >   #define   CTL_FETCH_PIPE_ACTIVE         0x0FC
> > @@ -34,6 +36,7 @@
> >   #define DPU_REG_RESET_TIMEOUT_US        2000
> >   #define  MERGE_3D_IDX   23
> > +#define  DSC_IDX        22
> >   #define  INTF_IDX       31
> >   #define CTL_INVALID_BIT                 0xffff
> > @@ -120,7 +123,6 @@ static u32 dpu_hw_ctl_get_pending_flush(struct dpu_hw_ctl *ctx)
> >   static void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
> >   {
> > -
> >   	if (ctx->pending_flush_mask & BIT(MERGE_3D_IDX))
> >   		DPU_REG_WRITE(&ctx->hw, CTL_MERGE_3D_FLUSH,
> >   				ctx->pending_merge_3d_flush_mask);
> > @@ -128,7 +130,6 @@ static void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
> >   		DPU_REG_WRITE(&ctx->hw, CTL_INTF_FLUSH,
> >   				ctx->pending_intf_flush_mask);
> > -	DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, ctx->pending_flush_mask);
> 
> This would break non-DSC case.

This is a mistake, I have fixed it up now..

> >   }
> >   static inline void dpu_hw_ctl_trigger_flush(struct dpu_hw_ctl *ctx)
> > @@ -498,6 +499,9 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
> >   	u32 intf_active = 0;
> >   	u32 mode_sel = 0;
> > +	if (cfg->dsc)
> > +		DPU_REG_WRITE(&ctx->hw, CTL_DSC_FLUSH, cfg->dsc);
> > +
> >   	if (cfg->intf_mode_sel == DPU_CTL_MODE_SEL_CMD)
> >   		mode_sel |= BIT(17);
> > @@ -509,6 +513,10 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
> >   	if (cfg->merge_3d)
> >   		DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
> >   			      BIT(cfg->merge_3d - MERGE_3D_0));
> > +	if (cfg->dsc) {
> > +		DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, ctx->pending_flush_mask |  BIT(DSC_IDX));
> 
> Why?

I have fixed it up to write only DSC_IDX

-- 
~Vinod
