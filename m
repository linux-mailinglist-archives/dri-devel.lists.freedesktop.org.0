Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F69545122
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 17:44:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F44E1130CC;
	Thu,  9 Jun 2022 15:44:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33A4A112053;
 Thu,  9 Jun 2022 15:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1654789469; x=1686325469;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=AyctHdx5ic41iiv6bacgkvRNkNQXHSvvLv/tMJJxBYM=;
 b=iPiD0Q+N2CRlhu/fLxJeIqLTh9fEQblsRkJilRjJHH1nSKpW9aXWiB6/
 YDabF43ChAfG72XjF/tI8IQWdqcnkYin1QHvEQLq6+kO9KyP4kgY6q4nB
 Fnp4b8CSwdfCTxZMbEBKIrXBf10imDxtC5SXhjJFH7rcn4imhdb+P5xTN I=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 09 Jun 2022 08:44:28 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 08:44:28 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 9 Jun 2022 08:44:27 -0700
Received: from [10.216.42.89] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 9 Jun 2022
 08:44:20 -0700
Message-ID: <f3b53f49-6e3f-3a3f-6737-d51a9d6ab78b@quicinc.com>
Date: Thu, 9 Jun 2022 21:14:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] drm/msm: Grab the GPU runtime in a6xx routines, not the
 GMU one
Content-Language: en-US
To: Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>, 
 Jordan Crouse <jordan@cosmicpenguin.net>
References: <20220609073317.1.Ie846c5352bc307ee4248d7cab998ab3016b85d06@changeid>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <20220609073317.1.Ie846c5352bc307ee4248d7cab998ab3016b85d06@changeid>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linux-kernel@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 Yangtao Li <tiny.windzz@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Wang Qing <wangqing@vivo.com>, Eric
 Anholt <eric@anholt.net>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/9/2022 8:03 PM, Douglas Anderson wrote:
> >From testing on sc7180-trogdor devices, reading the GMU registers
">"  ??
> needs the GMU clocks to be enabled. Those clocks get turned on in
> a6xx_gmu_resume(). Confusingly enough, that function is called as a
> result of the runtime_pm of the GPU "struct device", not the GMU
> "struct device".
>
> Let's grab a reference to the correct device. Incidentally, this makes
> us match the a5xx routine more closely.
>
> This is easily shown to fix crashes that happen if we change the GPU's
> pm_runtime usage to not use autosuspend. It's also believed to fix
> some long tail GPU crashes even with autosuspend.
>
> NOTE: the crashes I've seen were fixed by _only_ fixing
> a6xx_gpu_busy(). However, I believe that the same arguments should be
> made to a6xx_gmu_set_freq() so I've changed that function too.
>
> Fixes: eadf79286a4b ("drm/msm: Check for powered down HW in the devfreq callbacks")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 6 +++---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 ++--
>   2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 9f76f5b15759..b79ad2e0649c 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -129,13 +129,13 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
>   	 * This can get called from devfreq while the hardware is idle. Don't
>   	 * bring up the power if it isn't already active
>   	 */
> -	if (pm_runtime_get_if_in_use(gmu->dev) == 0)
> +	if (pm_runtime_get_if_in_use(&gpu->pdev->dev) == 0)

Wouldn't we return early here when this fn is called from a6xx_gmu_set_initial_freq()?

-Akhil.

>   		return;
>   
>   	if (!gmu->legacy) {
>   		a6xx_hfi_set_freq(gmu, perf_index);
>   		dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
> -		pm_runtime_put(gmu->dev);
> +		pm_runtime_put(&gpu->pdev->dev);
>   		return;
>   	}
>   
> @@ -159,7 +159,7 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
>   		dev_err(gmu->dev, "GMU set GPU frequency error: %d\n", ret);
>   
>   	dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
> -	pm_runtime_put(gmu->dev);
> +	pm_runtime_put(&gpu->pdev->dev);
>   }
>   
>   unsigned long a6xx_gmu_get_freq(struct msm_gpu *gpu)
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 841e47a0b06b..87568d0b6ef8 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1659,7 +1659,7 @@ static u64 a6xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate)
>   	*out_sample_rate = 19200000;
>   
>   	/* Only read the gpu busy if the hardware is already active */
> -	if (pm_runtime_get_if_in_use(a6xx_gpu->gmu.dev) == 0)
> +	if (pm_runtime_get_if_in_use(&gpu->pdev->dev) == 0)
>   		return 0;
>   
>   	busy_cycles = gmu_read64(&a6xx_gpu->gmu,
> @@ -1667,7 +1667,7 @@ static u64 a6xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate)
>   			REG_A6XX_GMU_CX_GMU_POWER_COUNTER_XOCLK_0_H);
>   
>   
> -	pm_runtime_put(a6xx_gpu->gmu.dev);
> +	pm_runtime_put(&gpu->pdev->dev);
>   
>   	return busy_cycles;
>   }

