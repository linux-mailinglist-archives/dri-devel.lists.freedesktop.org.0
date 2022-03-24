Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBFB4E66F5
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 17:25:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54B1B10E8A7;
	Thu, 24 Mar 2022 16:24:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D6810E217;
 Thu, 24 Mar 2022 16:24:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B072DB821FA;
 Thu, 24 Mar 2022 16:24:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5D80C340EC;
 Thu, 24 Mar 2022 16:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648139094;
 bh=z0SKDKFfLXgUlaEweN3w20sozNkj9PoC13UdkCxFdwo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R5CiytF7K28XTl+QYrKnUKx8xPaqAdeKr/pOrLvZqjXaSfUjSlummA2mDlVLb/1kU
 ss9g+9wYHpT9GUXhMkgQ93Y9oGdUXn117X5AXWlBgzDECVEV0MbezFnVT/4OvQ+LrZ
 vuYGAvlJrvxvVlABtIeQn09HUWGeR4H4xeIRoLnWul2hpCUUva5FvYxzeF76LTJwSP
 MdS+LK1B3kGU/L39H8wHcfTTEO82bYO3syshdHL/HiJr/ouOVtSxFvUUJ5D8wf+fp1
 /RCe4jxepKwgrD8nQpkodRwmxOzzRqyLnGAonmL2VRB+Dkj2hkCfhEJ5uOImEH30Kl
 WP97O+iKdXFKw==
Date: Thu, 24 Mar 2022 21:54:47 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [REPOST PATCH v4 06/13] drm/msm/disp/dpu1: Add DSC support in
 hw_ctl
Message-ID: <YjybTx1b978ecVcF@matsya>
References: <20220210103423.271016-1-vkoul@kernel.org>
 <20220210103423.271016-7-vkoul@kernel.org>
 <20220217222024.mf4cmgtpvvg3bftm@SoMainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220217222024.mf4cmgtpvvg3bftm@SoMainline.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17-02-22, 23:20, Marijn Suijten wrote:
> On 2022-02-10 16:04:16, Vinod Koul wrote:
> > Later gens of hardware have DSC bits moved to hw_ctl, so configure these
> > bits so that DSC would work there as well
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 11 ++++++++++-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h |  2 ++
> >  2 files changed, 12 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> > index 02da9ecf71f1..49659165cea8 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> > @@ -25,6 +25,8 @@
> >  #define   CTL_MERGE_3D_ACTIVE           0x0E4
> >  #define   CTL_INTF_ACTIVE               0x0F4
> >  #define   CTL_MERGE_3D_FLUSH            0x100
> > +#define   CTL_DSC_ACTIVE                0x0E8
> > +#define   CTL_DSC_FLUSH                0x104
> >  #define   CTL_INTF_FLUSH                0x110
> >  #define   CTL_INTF_MASTER               0x134
> >  #define   CTL_FETCH_PIPE_ACTIVE         0x0FC
> > @@ -34,6 +36,7 @@
> >  
> >  #define DPU_REG_RESET_TIMEOUT_US        2000
> >  #define  MERGE_3D_IDX   23
> > +#define  DSC_IDX        22
> 
> This define does not seem used in any of these patches.  Is that
> intended?

This should used in the below case you pointed, updated now

> >  static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> > index 806c171e5df2..9847c9c46d6f 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> > @@ -40,6 +40,7 @@ struct dpu_hw_stage_cfg {
> >   * @merge_3d:              3d merge block used
> >   * @intf_mode_sel:         Interface mode, cmd / vid
> >   * @stream_sel:            Stream selection for multi-stream interfaces
> > + * @dsc:                   DSC BIT masks
> 
> Bit masks of what?  Enabled DSCs?  A more verbose doc-comment is desired
> here, matching the rest of the fields :) - something like "DSC block(s)
> used" similar to merge_3d?  Or copy the docs from `dsc_mask`, which is
> the value that is written into this field.

Updated

-- 
~Vinod
