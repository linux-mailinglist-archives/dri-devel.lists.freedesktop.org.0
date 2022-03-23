Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 126ED4E516A
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 12:39:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EA8710E6AB;
	Wed, 23 Mar 2022 11:39:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C8CD10E6A5;
 Wed, 23 Mar 2022 11:39:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 149F761419;
 Wed, 23 Mar 2022 11:39:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E174BC340E8;
 Wed, 23 Mar 2022 11:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648035553;
 bh=UDCzleIC4xOZOO2WFtLxo96UlvhoU0EICO6OpjUHPUY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bd00Ph0sG5jxSCHtFN3wfyo7D7eOW7UKIg+ObY8tpcfafFg6dkimyLrxH00+1NAwJ
 FtdYY75mcDriYSZbbWBbpYpUz8MZAWRWnviq74ZH2LlzOCyvy/YOdENHoCFcCMdmBE
 hdNEJVXnHz+9XQBSyZR4gVdSxsZ7zH3VFwAfGjwroWuC5uNexfjsyfjmkJlPgcm++z
 Kda/mWNOPdNNtwQnhC7e1u2P0cdhvRe99cNVTB7NA2kqZLtIdrt9T1VxxaesomaBkp
 O6fOm7QuWHGxZ99hywJEfZ3J6GBk1vPdGG9OkXTX0tbIs7pQuTEsCfbpRTMOmdKstl
 vKjguYNIx+m8Q==
Date: Wed, 23 Mar 2022 17:09:09 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [REPOST PATCH v4 10/13] drm/msm/disp/dpu1: Add support for DSC
 in topology
Message-ID: <YjsG3epKhFpvdLxw@matsya>
References: <20220210103423.271016-1-vkoul@kernel.org>
 <20220210103423.271016-11-vkoul@kernel.org>
 <20220217223707.zsqdzu5uqplg33p2@SoMainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220217223707.zsqdzu5uqplg33p2@SoMainline.org>
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

On 17-02-22, 23:37, Marijn Suijten wrote:
> On 2022-02-10 16:04:20, Vinod Koul wrote:
> > For DSC to work we typically need a 2,2,1 configuration. This should
> > suffice for resolutions up to 4k. For more resolutions like 8k this won't
> > work.
> > 
> > Also, it is better to use 2 LMs and DSC instances as half width results
> > in lesser power consumption as compared to single LM, DSC at full width.
> > 
> > The panel has been tested only with 2,2,1 configuration, so for
> > now we blindly create 2,2,1 topology when DSC is enabled
> > 
> > Co-developed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> > Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 13 +++++++++++++
> >  drivers/gpu/drm/msm/msm_drv.h               |  2 ++
> >  2 files changed, 15 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > index 95a7bf362e81..13ccb7b3cce5 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -574,8 +574,21 @@ static struct msm_display_topology dpu_encoder_get_topology(
> >  	topology.num_enc = 0;
> >  	topology.num_intf = intf_count;
> >  
> > +	if (dpu_enc->dsc) {
> > +		/* In case of Display Stream Compression DSC, we would use
> 
> Just like elsewhere, since you wrote out Display Stream Compression,
> write the "DSC" abbreviation between parentheses ()?

Updated

-- 
~Vinod
