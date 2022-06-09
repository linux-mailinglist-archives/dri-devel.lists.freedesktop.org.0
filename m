Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A01545424
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 20:29:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25CAA12B6D6;
	Thu,  9 Jun 2022 18:29:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B6C712B6D6;
 Thu,  9 Jun 2022 18:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1654799356; x=1686335356;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=VEv/d5YIxiPaJMScZm3HoS8v7DwuXuOyJo2yQ5lgprg=;
 b=nfRNud8kap1g3nglQNBVECJwmne+qrjY5iGB5wzxW98OICBtN5K8Leii
 tJpC3BlfCG+Pz3iFVdOB9ZKglmqE/EBZ+RitxqIIFkpaHCX7R2EMBkMgf
 l4SpX4CzTVHeboeNINSVu86+w0kq4kbee2Y5OnD3S1PMJ9mpSdnY8WpLN E=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 09 Jun 2022 11:29:15 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 11:29:15 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 9 Jun 2022 11:29:14 -0700
Received: from [10.216.42.89] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 9 Jun 2022
 11:29:07 -0700
Message-ID: <f5fe4aed-6d7d-5a09-ad0e-b666268b643c@quicinc.com>
Date: Thu, 9 Jun 2022 23:59:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [Freedreno] [PATCH v2] drm/msm: Grab the GPU runtime in a6xx
 routines, not the GMU one
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20220609094716.v2.1.Ie846c5352bc307ee4248d7cab998ab3016b85d06@changeid>
 <a4abf2dd-7bb9-2638-9684-8c140a22491e@quicinc.com>
 <CAF6AEGs3aLoAiiA1hMFu_k6oBAs1bA6Htu3BRFjkg0eU72-1Zw@mail.gmail.com>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <CAF6AEGs3aLoAiiA1hMFu_k6oBAs1bA6Htu3BRFjkg0eU72-1Zw@mail.gmail.com>
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
Cc: Sean Paul <sean@poorly.run>, Douglas Anderson <dianders@chromium.org>,
 Jonathan Marek <jonathan@marek.ca>, Eric Anholt <eric@anholt.net>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Wang Qing <wangqing@vivo.com>,
 Yangtao Li <tiny.windzz@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/9/2022 11:42 PM, Rob Clark wrote:
> On Thu, Jun 9, 2022 at 11:04 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>> On 6/9/2022 10:17 PM, Douglas Anderson wrote:
>>> >From testing on sc7180-trogdor devices, reading the GMU registers
>>> needs the GMU clocks to be enabled. Those clocks get turned on in
>>> a6xx_gmu_resume(). Confusingly enough, that function is called as a
>>> result of the runtime_pm of the GPU "struct device", not the GMU
>>> "struct device".
>>>
>>> Let's grab a reference to the correct device. Incidentally, this makes
>>> us match the a5xx routine more closely.
>>>
>>> This is easily shown to fix crashes that happen if we change the GPU's
>>> pm_runtime usage to not use autosuspend. It's also believed to fix
>>> some long tail GPU crashes even with autosuspend.
>>>
>>> NOTE: the crashes I've seen were fixed by _only_ fixing
>>> a6xx_gpu_busy(). However, I believe that the same arguments should be
>>> made to a6xx_gmu_set_freq() so I've fixed that case too. To make that
>>> fix clean, we've moved the pm runtime grabbing into the GPU file.
>>>
>>> As a bonus fix with this change, we change the pm_runtime get
>>> functions to check for <= 0 instead of ==. This handles the case where
>>> pm_runtime is disabled.
>>>
>>> Fixes: eadf79286a4b ("drm/msm: Check for powered down HW in the devfreq callbacks")
>>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>>> ---
>>>
>>> Changes in v2:
>>> - Move the set_freq runtime pm grab to the GPU file.
>>> - Use <= for the pm_runtime test, not ==.
>>>
>>>    drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  9 ---------
>>>    drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 13 +++++++++++--
>>>    2 files changed, 11 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>> index 9f76f5b15759..2410815e77b4 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>> @@ -125,17 +125,9 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
>>>
>>>        trace_msm_gmu_freq_change(gmu->freq, perf_index);
>>>
>>> -     /*
>>> -      * This can get called from devfreq while the hardware is idle. Don't
>>> -      * bring up the power if it isn't already active
>>> -      */
>>> -     if (pm_runtime_get_if_in_use(gmu->dev) == 0)
>>> -             return;
>>> -
>>>        if (!gmu->legacy) {
>>>                a6xx_hfi_set_freq(gmu, perf_index);
>>>                dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
>>> -             pm_runtime_put(gmu->dev);
>>>                return;
>>>        }
>>>
>>> @@ -159,7 +151,6 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
>>>                dev_err(gmu->dev, "GMU set GPU frequency error: %d\n", ret);
>>>
>>>        dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
>>> -     pm_runtime_put(gmu->dev);
>>>    }
>>>
>>>    unsigned long a6xx_gmu_get_freq(struct msm_gpu *gpu)
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> index 42ed9a3c4905..54efd9b76ea6 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> @@ -1659,7 +1659,7 @@ static u64 a6xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate)
>>>        *out_sample_rate = 19200000;
>>>
>>>        /* Only read the gpu busy if the hardware is already active */
>>> -     if (pm_runtime_get_if_in_use(a6xx_gpu->gmu.dev) == 0)
>>> +     if (pm_runtime_get_if_in_use(&gpu->pdev->dev) <= 0)
>> You are changing the behavior here when CONFIG_PM is not enabled.
> I'd guess the odds of anything working with PM=n are low
fwiw, https://patchwork.freedesktop.org/patch/364077/#comment_672059

Akhil
>
> BR,
> -R
>
>> -Akhil.
>>>                return 0;
>>>
>>>        busy_cycles = gmu_read64(&a6xx_gpu->gmu,
>>> @@ -1667,7 +1667,7 @@ static u64 a6xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate)
>>>                        REG_A6XX_GMU_CX_GMU_POWER_COUNTER_XOCLK_0_H);
>>>
>>>
>>> -     pm_runtime_put(a6xx_gpu->gmu.dev);
>>> +     pm_runtime_put(&gpu->pdev->dev);
>>>
>>>        return busy_cycles;
>>>    }
>>> @@ -1677,9 +1677,18 @@ static void a6xx_gpu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
>>>        struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>>>        struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>>>
>>> +     /*
>>> +      * This can get called from devfreq while the hardware is idle. Don't
>>> +      * bring up the power if it isn't already active
>>> +      */
>>> +     if (pm_runtime_get_if_in_use(&gpu->pdev->dev) <= 0)
>>> +             return;
>>> +
>>>        mutex_lock(&a6xx_gpu->gmu.lock);
>>>        a6xx_gmu_set_freq(gpu, opp);
>>>        mutex_unlock(&a6xx_gpu->gmu.lock);
>>> +
>>> +     pm_runtime_put(&gpu->pdev->dev);
>>>    }
>>>
>>>    static struct msm_gem_address_space *

