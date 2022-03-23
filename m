Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D93484E5165
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 12:38:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CBDD10E6AA;
	Wed, 23 Mar 2022 11:38:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B12810E6A8;
 Wed, 23 Mar 2022 11:38:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E85E9B81E83;
 Wed, 23 Mar 2022 11:38:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A8D6C340E8;
 Wed, 23 Mar 2022 11:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648035528;
 bh=M/Dh2h9fc1xC5xqNZECVZBb5OmuJe1BOnjZx6fepzEY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=htDlw4iENMaAEL5aR/wecoIGkgxFP+l8XV4GuLqREX+XYISEk8wE9XC0qKAfXTN6K
 avth8lzeYN9rucJXT9euLumKhxrY3jB5vnZKdugdSmzZFoMwy82o1jkENKnFfGASxu
 qpkJfXlEHsfGDMEburHVKMyrS6r0XLt+eSJc1oqd/EurmaOUp/+l6SNXgMlQAsMPo7
 +SksKC8lsS8UEmaI4l4gdtXOeOCt66Dm7uHoQ4LlQdHTl2Cpzcm9DLHaYjofZL8qKO
 YiWOwfrS/Ehe9i87PBkksapIayNnXXbzGwWiUp7r3Xgp5LLr1lbLVdbifi0RXvw7Ip
 cyyM/L9oY2IkQ==
Date: Wed, 23 Mar 2022 17:08:44 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [Freedreno] [REPOST PATCH v4 10/13] drm/msm/disp/dpu1: Add
 support for DSC in topology
Message-ID: <YjsGxLt3ixy1nHxf@matsya>
References: <20220210103423.271016-1-vkoul@kernel.org>
 <20220210103423.271016-11-vkoul@kernel.org>
 <20220217214417.hb6sdx53cs36us6j@SoMainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220217214417.hb6sdx53cs36us6j@SoMainline.org>
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

On 17-02-22, 22:44, Marijn Suijten wrote:
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
> > +		 * 2 encoders, 2 line mixers and 1 interface
> 
> LM is a layer mixer, not a line mixer, right?

Right, thanks for spotting

-- 
~Vinod
