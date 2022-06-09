Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3DB5453A1
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 20:04:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED6012B4D6;
	Thu,  9 Jun 2022 18:04:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 858B112B4D6;
 Thu,  9 Jun 2022 18:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1654797870; x=1686333870;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=imxqF1e2K/eKhdUX63RGFoYGL7+Dg+LTZPFNAdvF00Y=;
 b=nXtqod5HHNIsUD/dAjwO1Hm5ybMBvx5fupmrnEob2w07NRHkpM0lhwf3
 pFOJJP6CG04lyRDoY7YMZXmp5gJf9+BYlU1ITQ57nsIueLLmeLvaDTGJR
 bR6iFBwKkRulrFU7PzLAcLRRKx987A9vjrVFIU8pnQaf0ZDBtPP6fLTPe Y=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 09 Jun 2022 11:04:29 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 11:04:28 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 9 Jun 2022 11:04:28 -0700
Received: from [10.216.42.89] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 9 Jun 2022
 11:04:21 -0700
Message-ID: <a4abf2dd-7bb9-2638-9684-8c140a22491e@quicinc.com>
Date: Thu, 9 Jun 2022 23:34:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2] drm/msm: Grab the GPU runtime in a6xx routines, not
 the GMU one
Content-Language: en-US
To: Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>, 
 Jordan Crouse <jordan@cosmicpenguin.net>
References: <20220609094716.v2.1.Ie846c5352bc307ee4248d7cab998ab3016b85d06@changeid>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <20220609094716.v2.1.Ie846c5352bc307ee4248d7cab998ab3016b85d06@changeid>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
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

On 6/9/2022 10:17 PM, Douglas Anderson wrote:
> >From testing on sc7180-trogdor devices, reading the GMU registers
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
> made to a6xx_gmu_set_freq() so I've fixed that case too. To make that
> fix clean, we've moved the pm runtime grabbing into the GPU file.
>
> As a bonus fix with this change, we change the pm_runtime get
> functions to check for <= 0 instead of ==. This handles the case where
> pm_runtime is disabled.
>
> Fixes: eadf79286a4b ("drm/msm: Check for powered down HW in the devfreq callbacks")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v2:
> - Move the set_freq runtime pm grab to the GPU file.
> - Use <= for the pm_runtime test, not ==.
>
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  9 ---------
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 13 +++++++++++--
>   2 files changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 9f76f5b15759..2410815e77b4 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -125,17 +125,9 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
>   
>   	trace_msm_gmu_freq_change(gmu->freq, perf_index);
>   
> -	/*
> -	 * This can get called from devfreq while the hardware is idle. Don't
> -	 * bring up the power if it isn't already active
> -	 */
> -	if (pm_runtime_get_if_in_use(gmu->dev) == 0)
> -		return;
> -
>   	if (!gmu->legacy) {
>   		a6xx_hfi_set_freq(gmu, perf_index);
>   		dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
> -		pm_runtime_put(gmu->dev);
>   		return;
>   	}
>   
> @@ -159,7 +151,6 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
>   		dev_err(gmu->dev, "GMU set GPU frequency error: %d\n", ret);
>   
>   	dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
> -	pm_runtime_put(gmu->dev);
>   }
>   
>   unsigned long a6xx_gmu_get_freq(struct msm_gpu *gpu)
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 42ed9a3c4905..54efd9b76ea6 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1659,7 +1659,7 @@ static u64 a6xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate)
>   	*out_sample_rate = 19200000;
>   
>   	/* Only read the gpu busy if the hardware is already active */
> -	if (pm_runtime_get_if_in_use(a6xx_gpu->gmu.dev) == 0)
> +	if (pm_runtime_get_if_in_use(&gpu->pdev->dev) <= 0)
You are changing the behavior here when CONFIG_PM is not enabled.

-Akhil.
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
> @@ -1677,9 +1677,18 @@ static void a6xx_gpu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
>   	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>   	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>   
> +	/*
> +	 * This can get called from devfreq while the hardware is idle. Don't
> +	 * bring up the power if it isn't already active
> +	 */
> +	if (pm_runtime_get_if_in_use(&gpu->pdev->dev) <= 0)
> +		return;
> +
>   	mutex_lock(&a6xx_gpu->gmu.lock);
>   	a6xx_gmu_set_freq(gpu, opp);
>   	mutex_unlock(&a6xx_gpu->gmu.lock);
> +
> +	pm_runtime_put(&gpu->pdev->dev);
>   }
>   
>   static struct msm_gem_address_space *

