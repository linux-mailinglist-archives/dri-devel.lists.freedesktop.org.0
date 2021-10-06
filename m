Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E667423785
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 07:36:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8DE56ECF2;
	Wed,  6 Oct 2021 05:36:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 621FF6ECF2;
 Wed,  6 Oct 2021 05:36:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EDC7961278;
 Wed,  6 Oct 2021 05:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633498594;
 bh=sMJKXKcZBwMZFPoqxcBjET+uKPX3j11+XEXlIQwwWo4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N4QKI5G3pndI10cH6UeCwPz9T23LrBsohRzcdsWJuJWNLzWDqo8Pj1AY/OrMtt/9n
 GLihDsl3IJZzZC+6WfVCYUjxnqclbs/fbozGX1+wdL0b1hnDElRnthh6Znh9e5RWWt
 F0Ez9LiJ4xOkSNE/yEVRXjg6DLJEe8dREnl3pPAb6E47xjCHdePzXcyTCc7DQ+A5bf
 s2rGVmXEwa2LqN5MopRPayACAZ9XfstM4+Tqhez49Uj6JX82haU9zCxNZ7PA/tqMQW
 xNo1kR6PNJIGofDX1GO/KYQtN9DRDciKI4FwcpjQLnFthY/18cgyr5ve/Nk0/qDNqc
 TgNHzsChG7+0A==
Date: Wed, 6 Oct 2021 11:06:29 +0530
From: Vinod Koul <vkoul@kernel.org>
To: abhinavk@codeaurora.org
Cc: Rob Clark <robdclark@gmail.com>, Jonathan Marek <jonathan@marek.ca>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: [Freedreno] [PATCH 02/11] drm/msm/disp/dpu1: Add support for DSC
Message-ID: <YV013cGaq/QmBAup@matsya>
References: <20210715065203.709914-1-vkoul@kernel.org>
 <20210715065203.709914-3-vkoul@kernel.org>
 <e476e7b2e50ee3cb5f5c4e6c5d7e5ff0@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e476e7b2e50ee3cb5f5c4e6c5d7e5ff0@codeaurora.org>
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

On 02-08-21, 16:03, abhinavk@codeaurora.org wrote:
> On 2021-07-14 23:51, Vinod Koul wrote:
> > Display Stream Compression (DSC) is one of the hw blocks in dpu, so add
> > support by adding hw blocks for DSC
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> > Changes since RFC:
> >  - Drop unused enums
> > 
> >  drivers/gpu/drm/msm/Makefile                  |   1 +
> >  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  13 ++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c    | 221 ++++++++++++++++++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h    |  77 ++++++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |  13 ++
> >  5 files changed, 325 insertions(+)
> >  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> >  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
> > 
> > diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> > index 610d630326bb..fd8fc57f1f58 100644
> > --- a/drivers/gpu/drm/msm/Makefile
> > +++ b/drivers/gpu/drm/msm/Makefile
> > @@ -61,6 +61,7 @@ msm-y := \
> >  	disp/dpu1/dpu_hw_blk.o \
> >  	disp/dpu1/dpu_hw_catalog.o \
> >  	disp/dpu1/dpu_hw_ctl.o \
> > +	disp/dpu1/dpu_hw_dsc.o \
> >  	disp/dpu1/dpu_hw_interrupts.o \
> >  	disp/dpu1/dpu_hw_intf.o \
> >  	disp/dpu1/dpu_hw_lm.o \
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > index 4dfd8a20ad5c..b8b4dc36880c 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > @@ -547,6 +547,16 @@ struct dpu_merge_3d_cfg  {
> >  	const struct dpu_merge_3d_sub_blks *sblk;
> >  };
> > 
> > +/**
> > + * struct dpu_dsc_cfg - information of DSC blocks
> > + * @id                 enum identifying this block
> > + * @base               register offset of this block
> > + * @features           bit mask identifying sub-blocks/features
> > + */
> > +struct dpu_dsc_cfg {
> > +	DPU_HW_BLK_INFO;
> > +};
> > +
> >  /**
> >   * struct dpu_intf_cfg - information of timing engine blocks
> >   * @id                 enum identifying this block
> > @@ -748,6 +758,9 @@ struct dpu_mdss_cfg {
> >  	u32 merge_3d_count;
> >  	const struct dpu_merge_3d_cfg *merge_3d;
> > 
> > +	u32 dsc_count;
> > +	struct dpu_dsc_cfg *dsc;
> > +
> >  	u32 intf_count;
> >  	const struct dpu_intf_cfg *intf;
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> > b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> > new file mode 100644
> > index 000000000000..e27e67bd42e8
> > --- /dev/null
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> > @@ -0,0 +1,221 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2020, Linaro Limited
> Copyright year needs an update : 2020-2021?

Thanks for spotting, fixed up

-- 
~Vinod
