Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E6B6DE730
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 00:24:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9799B10E19E;
	Tue, 11 Apr 2023 22:24:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C32E410E05A
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 22:24:09 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id E34883FFB3;
 Wed, 12 Apr 2023 00:24:07 +0200 (CEST)
Date: Wed, 12 Apr 2023 00:24:06 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: Re: [PATCH] drm/msm/dpu: add DSC range checking during resource
 reservation
Message-ID: <qvgbm3wimai3jytnikbcixipvwqn2uywqpg4mn6mjh5atergfx@wa4edsrp7y22>
References: <1681247380-1607-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1681247380-1607-1-git-send-email-quic_khsieh@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 quic_abhinavk@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 swboyd@chromium.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Again, don't forget to include previous reviewers in cc, please :)

On 2023-04-11 14:09:40, Kuogee Hsieh wrote:
> Perform DSC range checking to make sure correct DSC is requested before
> reserve resource for it.

This isn't performing any range checking for resource reservations /
requests: this is only validating the constants written in our catalog
and seems rather useless.  It isn't fixing any real bug either, so the
Fixes: tag below seems extraneous.

Given prior comments from Abhinav that "the kernel should be trusted",
we should remove this validation for all the other blocks instead.

> Fixes: c985d7bb64ff ("drm/msm/disp/dpu1: Add DSC support in RM")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index f4dda88..95e58f1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
>   * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
>  #define pr_fmt(fmt)	"[drm:%s] " fmt, __func__
> @@ -250,6 +251,11 @@ int dpu_rm_init(struct dpu_rm *rm,
>  		struct dpu_hw_dsc *hw;
>  		const struct dpu_dsc_cfg *dsc = &cat->dsc[i];
>  
> +		if (dsc->id < DSC_0 || dsc->id >= DSC_MAX) {
> +			DPU_ERROR("skip dsc %d with invalid id\n", dsc->id);
> +			continue;
> +		}
> +
>  		hw = dpu_hw_dsc_init(dsc->id, mmio, cat);
>  		if (IS_ERR_OR_NULL(hw)) {
>  			rc = PTR_ERR(hw);
> @@ -557,8 +563,10 @@ static int _dpu_rm_make_reservation(
>  	}
>  
>  	ret  = _dpu_rm_reserve_dsc(rm, global_state, enc, &reqs->topology);
> -	if (ret)
> +	if (ret) {
> +		DPU_ERROR("unable to find appropriate DSC\n");

This, while a nice addition, should go in a different patch.

Thanks!

- Marijn

>  		return ret;
> +	}
>  
>  	return ret;
>  }
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
