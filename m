Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5626A4B5A77
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 20:15:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3058210E2AC;
	Mon, 14 Feb 2022 19:15:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C4D510E2AC;
 Mon, 14 Feb 2022 19:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644866144; x=1676402144;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4iZqoUrkugin9SUai2lkb0dMAEuY8zcppu0qMTnAWZs=;
 b=PLIWaqsw1Smz570/km7MJCVZqwmzfqkWYhbEbWS0yK4CxiU4qqzJwHOr
 DLSNsTCqzSHDJOkZHCQmL4uecDNz54VybPXfP4s4soDQ+SZu6zsJAkMpx
 ZCEW8nHEEJtuBXHdr0wtdhwUZmO65lsYvRlLZY0l+hqozxUJaNA8TLsGz k=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 14 Feb 2022 11:15:43 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 11:15:43 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Mon, 14 Feb 2022 11:15:43 -0800
Received: from [10.111.168.21] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Mon, 14 Feb
 2022 11:15:41 -0800
Message-ID: <5b517150-ae78-98c6-b9a8-d84905f38f56@quicinc.com>
Date: Mon, 14 Feb 2022 11:15:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v5 5/6] drm/msm/dpu: fix error handling in dpu_rm_init
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>
References: <20220121210618.3482550-1-dmitry.baryshkov@linaro.org>
 <20220121210618.3482550-6-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220121210618.3482550-6-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/21/2022 1:06 PM, Dmitry Baryshkov wrote:
> Using IS_ERR_OR_NULL() together with PTR_ERR() is a typical mistake. If
> the value is NULL, then the function will return 0 instead of a proper
> return code. Moreover none of dpu_hw_*_init() functions can return NULL.
> So, replace all dpu_rm_init()'s IS_ERR_OR_NULL() calls with IS_ERR().
> 
Can you please give an example of a case where dpu_hw_*_init() can 
return NULL?

All dpu_hw_*_init() functions are only called if the corresponding
hw*_counts are valid. So I would like to understand this.

Now, if NULL is treated as a non-error case, should we atleast print
a message indicating so?

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 96554e962e38..7497538adae1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -109,7 +109,7 @@ int dpu_rm_init(struct dpu_rm *rm,
>   			continue;
>   		}
>   		hw = dpu_hw_lm_init(lm->id, mmio, cat);
> -		if (IS_ERR_OR_NULL(hw)) {
> +		if (IS_ERR(hw)) {
>   			rc = PTR_ERR(hw);
>   			DPU_ERROR("failed lm object creation: err %d\n", rc);
>   			goto fail;
> @@ -126,7 +126,7 @@ int dpu_rm_init(struct dpu_rm *rm,
>   			continue;
>   		}
>   		hw = dpu_hw_merge_3d_init(merge_3d->id, mmio, cat);
> -		if (IS_ERR_OR_NULL(hw)) {
> +		if (IS_ERR(hw)) {
>   			rc = PTR_ERR(hw);
>   			DPU_ERROR("failed merge_3d object creation: err %d\n",
>   				rc);
> @@ -144,7 +144,7 @@ int dpu_rm_init(struct dpu_rm *rm,
>   			continue;
>   		}
>   		hw = dpu_hw_pingpong_init(pp->id, mmio, cat);
> -		if (IS_ERR_OR_NULL(hw)) {
> +		if (IS_ERR(hw)) {
>   			rc = PTR_ERR(hw);
>   			DPU_ERROR("failed pingpong object creation: err %d\n",
>   				rc);
> @@ -168,7 +168,7 @@ int dpu_rm_init(struct dpu_rm *rm,
>   			continue;
>   		}
>   		hw = dpu_hw_intf_init(intf->id, mmio, cat);
> -		if (IS_ERR_OR_NULL(hw)) {
> +		if (IS_ERR(hw)) {
>   			rc = PTR_ERR(hw);
>   			DPU_ERROR("failed intf object creation: err %d\n", rc);
>   			goto fail;
> @@ -185,7 +185,7 @@ int dpu_rm_init(struct dpu_rm *rm,
>   			continue;
>   		}
>   		hw = dpu_hw_ctl_init(ctl->id, mmio, cat);
> -		if (IS_ERR_OR_NULL(hw)) {
> +		if (IS_ERR(hw)) {
>   			rc = PTR_ERR(hw);
>   			DPU_ERROR("failed ctl object creation: err %d\n", rc);
>   			goto fail;
> @@ -202,7 +202,7 @@ int dpu_rm_init(struct dpu_rm *rm,
>   			continue;
>   		}
>   		hw = dpu_hw_dspp_init(dspp->id, mmio, cat);
> -		if (IS_ERR_OR_NULL(hw)) {
> +		if (IS_ERR(hw)) {
>   			rc = PTR_ERR(hw);
>   			DPU_ERROR("failed dspp object creation: err %d\n", rc);
>   			goto fail;
