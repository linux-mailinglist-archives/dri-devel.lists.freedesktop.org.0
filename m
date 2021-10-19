Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF12D43380A
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 16:08:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE716E882;
	Tue, 19 Oct 2021 14:07:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 170FD6E882;
 Tue, 19 Oct 2021 14:07:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 244E6610A1;
 Tue, 19 Oct 2021 14:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634652475;
 bh=SLWuDyENjrttrY/yKGmL/fqA3+noRXUboMcPH0sIE94=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oM0gZvjxdIWCCSyTgbkEwXNW+yBmqzUXnDXgyeJJjaOCCn/R6Q6eA3foe5S6et5NX
 UJszBzdPoyg/4NYkWZDhqmzKmFrr57nTVwL8CIFDxL8YXFOK+IXn13c90B2wsmknki
 uKXjWuUnoHzxUgT7P0Edeenpbdr296O1YL8rNJCwxm8MOfDMN/rXkZUnOF86ycdREN
 kDbI91dUD3k30j9iSl+bsl7djiew/9IHBYXi5Xd3yH8zWOI+R0QsLn4C266WrqR5Qz
 ks7DrZZCqMb4tVV9yP1Rr8/aq1avdYa4/U73x2nLPGuY91uswYtISAwAyp4QX+mSMq
 w7Uak4Sgc0S0A==
Date: Tue, 19 Oct 2021 19:37:51 +0530
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
Subject: Re: [PATCH v2 02/11] drm/msm/disp/dpu1: Add support for DSC
Message-ID: <YW7RNz/9vd/XS0+O@matsya>
References: <20211007070900.456044-1-vkoul@kernel.org>
 <20211007070900.456044-3-vkoul@kernel.org>
 <c9c77691-f6e8-576c-7e2d-a87295b13ba7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c9c77691-f6e8-576c-7e2d-a87295b13ba7@linaro.org>
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

On 14-10-21, 17:40, Dmitry Baryshkov wrote:
> On 07/10/2021 10:08, Vinod Koul wrote:

> > +static void dpu_hw_dsc_config(struct dpu_hw_dsc *hw_dsc,
> > +			      struct msm_display_dsc_config *dsc, u32 mode)
> > +{
> > +	struct dpu_hw_blk_reg_map *c = &hw_dsc->hw;
> > +	u32 data, lsb, bpp;
> > +	u32 initial_lines = dsc->initial_lines;
> > +	bool is_cmd_mode = !(mode & BIT(2));
> 
> DSC_MODE_VIDEO

Updated

> > +static void dpu_hw_dsc_config_thresh(struct dpu_hw_dsc *hw_dsc,
> > +				     struct msm_display_dsc_config *dsc)
> 
> I thought that it might make sense to pass just drm_dsc_rc_range_parameters
> here, but it's a matter of personal preference. I won't insist on doing
> that.

This is called from encoder, so prefer not to have encoder invoke
dsc->drm->rc_range_params

So will keep this.

-- 
~Vinod
