Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E50794D0243
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 16:01:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 088A610E19D;
	Mon,  7 Mar 2022 15:01:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0EB110E19D;
 Mon,  7 Mar 2022 15:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1646665302; x=1678201302;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=5/H2nOzuxnHUOKdR0G7jrfrih/Ks6nIpoE4X+AIwIwo=;
 b=BP4fvsvMXT6YyknCuTvwVES66gDZq7lNeKx12vBgMslT8TT0qwkifNbu
 4uqFb0PH8sobqfy7ZQKGmB4euym5q9ufLL02Bt0qKzBNHuRq2EC9/imtB
 e/gjCQkZD3O+tXP0hpuWfi6M9I4EcjEZ1asMWbWTSRIge5xAng8lnOzQu I=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 07 Mar 2022 07:01:41 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 07:01:41 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Mon, 7 Mar 2022 07:01:40 -0800
Received: from [10.216.32.253] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Mon, 7 Mar 2022
 07:01:34 -0800
Message-ID: <bd66239d-d5df-79c0-c3c8-be90816373db@quicinc.com>
Date: Mon, 7 Mar 2022 20:31:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [Freedreno] [PATCH] drm/msm/adreno: fix cast in adreno_get_param()
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>, Rob Clark <robdclark@gmail.com>
References: <20220307133105.GA17534@kili>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <20220307133105.GA17534@kili>
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
Cc: Sean Paul <sean@poorly.run>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Jordan Crouse <jordan@cosmicpenguin.net>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/7/2022 7:01 PM, Dan Carpenter wrote:
> These casts need to happen before the shift.  The only time it would
> matter would be if "rev.core" is >= 128.  In that case the sign bit
> would be extended and we do not want that.
>
> Fixes: afab9d91d872 ("drm/msm/adreno: Expose speedbin to userspace")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/gpu/drm/msm/adreno/adreno_gpu.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 15c8997b7251..f7b3f6d266a9 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -244,10 +244,10 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
>   		*value = !adreno_is_a650_family(adreno_gpu) ? 0x100000 : 0;
>   		return 0;
>   	case MSM_PARAM_CHIP_ID:
> -		*value = (uint64_t) adreno_gpu->rev.patchid |
> -				(uint64_t) (adreno_gpu->rev.minor << 8) |
> -				(uint64_t) (adreno_gpu->rev.major << 16) |
> -				(uint64_t) (adreno_gpu->rev.core << 24);
> +		*value =  (uint64_t)adreno_gpu->rev.patchid |
> +			 ((uint64_t)adreno_gpu->rev.minor << 8) |
> +			 ((uint64_t)adreno_gpu->rev.major << 16) |
> +			 ((uint64_t)adreno_gpu->rev.core  << 24);
>   		if (!adreno_gpu->info->revn)
>   			*value |= ((uint64_t) adreno_gpu->speedbin) << 32;
>   		return 0;
Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

-Akhil
