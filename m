Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1C0423DA4
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 14:21:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 628B26E0B9;
	Wed,  6 Oct 2021 12:21:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A05FC6E0B9;
 Wed,  6 Oct 2021 12:21:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 91B4D610A2;
 Wed,  6 Oct 2021 12:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633522881;
 bh=GlThTDzBAd5thEStBftgifgtznEXIW3TSZCzgZWRZTI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KaKKiACjqlqzEvj9oeeX+pYahECM+10wBZS5riS3oZe6nm4gbOUIQXRnPVxcVmWmd
 JzuysCiH+Atm+DnnlsDHx8M/Si+ZngFoXxEG0zUzBH4HLB75AoGz+DDoJ39ZUQXHK/
 bZZh3Yrfxj4dy0aN+M9ZdQetLiaCEgW1axodVQg8M2sVVunbu3BASYvuoZwNIGOTm9
 V18+17ezDPeWQyz7Rebb28aXY01hq4x1DJj0E/nyrIC5Un11svUGgP2zoM6h+lsLQx
 5C6I4yvWnQtgo0/qC9SLdQqXgQwYjg6n8f+HRPNQFlwzBpB0xQJPmate4ojKjQ5gcA
 delg3LsdSPZag==
Date: Wed, 6 Oct 2021 17:51:17 +0530
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
Subject: Re: [PATCH 06/11] drm/msm/disp/dpu1: Add DSC support in hw_ctl
Message-ID: <YV2Uvb0VAAxNO1f0@matsya>
References: <20210715065203.709914-1-vkoul@kernel.org>
 <20210715065203.709914-7-vkoul@kernel.org>
 <79e693c8-ff9c-d4a8-d4a8-8a1f075f77c7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79e693c8-ff9c-d4a8-d4a8-8a1f075f77c7@linaro.org>
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

On 30-07-21, 01:15, Dmitry Baryshkov wrote:
> On 15/07/2021 09:51, Vinod Koul wrote:
> > Later gens of hardware have DSC bits moved to hw_ctl, so configure these
> > bits so that DSC would work there as well
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 7 ++++++-
> >   1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> > index 2d4645e01ebf..aeea6add61ee 100644
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
> > @@ -120,6 +123,7 @@ static u32 dpu_hw_ctl_get_pending_flush(struct dpu_hw_ctl *ctx)
> >   static inline void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
> >   {
> > +	DPU_REG_WRITE(&ctx->hw, CTL_DSC_FLUSH, BIT(0) | BIT(1) | BIT(2) | BIT(3));
> 
> Please pass DSC indices using intf cfg and use them to configure register
> writes.

Yes I have modified the intf cfg dsc from bool to pass actual indices.
So this patch goes next (as a dependency reorder) and we use this only
when DSC is enabled and use the indices set. Thanks for the suggestion

-- 
~Vinod
