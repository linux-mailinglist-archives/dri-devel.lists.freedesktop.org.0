Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2045A545183
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 18:05:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DBF012AF7F;
	Thu,  9 Jun 2022 16:05:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF30F12AF76;
 Thu,  9 Jun 2022 16:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1654790712; x=1686326712;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+nFru49Yr8USAFST+MwqNWmvaf5w+X9H/lG9vMkBwl8=;
 b=zBvXmb6cgJxM/b7OqAZmcPTDHG6fpSrtUtg0N3ii8utDX7azJJNbLwuy
 oG2u/eA55aeX3/BWRYYRYlmbXV4TesCnA2Ym3E8WVtqneL2OU+tC4BY0a
 DCFOffNJBqmHTyfU0bc/mDfHHeJFzY2N0FBwhIwLWXYEHFYvpKdyV/z/D k=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 09 Jun 2022 09:05:11 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 09:05:10 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 9 Jun 2022 09:05:10 -0700
Received: from [10.216.42.89] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 9 Jun 2022
 09:05:02 -0700
Message-ID: <c8a59607-ce28-1022-70ab-491b67918324@quicinc.com>
Date: Thu, 9 Jun 2022 21:34:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] drm/msm: Grab the GPU runtime in a6xx routines, not the
 GMU one
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, Douglas Anderson <dianders@chromium.org>
References: <20220609073317.1.Ie846c5352bc307ee4248d7cab998ab3016b85d06@changeid>
 <CAF6AEGvAJqWK7peyTBDjQH_XCT3=XfqKrxsdkYD4s=DxbR4r7Q@mail.gmail.com>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <CAF6AEGvAJqWK7peyTBDjQH_XCT3=XfqKrxsdkYD4s=DxbR4r7Q@mail.gmail.com>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 freedreno <freedreno@lists.freedesktop.org>,
 Yangtao Li <tiny.windzz@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Wang Qing <wangqing@vivo.com>,
 Eric Anholt <eric@anholt.net>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/9/2022 9:24 PM, Rob Clark wrote:
> On Thu, Jun 9, 2022 at 7:34 AM Douglas Anderson <dianders@chromium.org> wrote:
>>  From testing on sc7180-trogdor devices, reading the GMU registers
>> needs the GMU clocks to be enabled. Those clocks get turned on in
>> a6xx_gmu_resume(). Confusingly enough, that function is called as a
>> result of the runtime_pm of the GPU "struct device", not the GMU
>> "struct device".
>>
>> Let's grab a reference to the correct device. Incidentally, this makes
>> us match the a5xx routine more closely.
>>
>> This is easily shown to fix crashes that happen if we change the GPU's
>> pm_runtime usage to not use autosuspend. It's also believed to fix
>> some long tail GPU crashes even with autosuspend.
>>
>> NOTE: the crashes I've seen were fixed by _only_ fixing
>> a6xx_gpu_busy(). However, I believe that the same arguments should be
>> made to a6xx_gmu_set_freq() so I've changed that function too.
>>
>> Fixes: eadf79286a4b ("drm/msm: Check for powered down HW in the devfreq callbacks")
>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>> ---
>>
>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 6 +++---
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 ++--
>>   2 files changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> index 9f76f5b15759..b79ad2e0649c 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> @@ -129,13 +129,13 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
>>           * This can get called from devfreq while the hardware is idle. Don't
>>           * bring up the power if it isn't already active
>>           */
>> -       if (pm_runtime_get_if_in_use(gmu->dev) == 0)
>> +       if (pm_runtime_get_if_in_use(&gpu->pdev->dev) == 0)
> IMHO, if we do end up using the GPU's runpm instead of the GMU's, we
> should probably just move this _get_if_in_use() into msm_gpu_devfreq,
+ 1 this.
> etc.  (And probably also this should be "<= 0".. I have that change
> locally but haven't sent a patch yet
.. and skip return here when CONFIG_PM is disabled.

-Akhil.
>
> BR,
> -R
>
>>                  return;
>>
>>          if (!gmu->legacy) {
>>                  a6xx_hfi_set_freq(gmu, perf_index);
>>                  dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
>> -               pm_runtime_put(gmu->dev);
>> +               pm_runtime_put(&gpu->pdev->dev);
>>                  return;
>>          }
>>
>> @@ -159,7 +159,7 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
>>                  dev_err(gmu->dev, "GMU set GPU frequency error: %d\n", ret);
>>
>>          dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
>> -       pm_runtime_put(gmu->dev);
>> +       pm_runtime_put(&gpu->pdev->dev);
>>   }
>>
>>   unsigned long a6xx_gmu_get_freq(struct msm_gpu *gpu)
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 841e47a0b06b..87568d0b6ef8 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -1659,7 +1659,7 @@ static u64 a6xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate)
>>          *out_sample_rate = 19200000;
>>
>>          /* Only read the gpu busy if the hardware is already active */
>> -       if (pm_runtime_get_if_in_use(a6xx_gpu->gmu.dev) == 0)
>> +       if (pm_runtime_get_if_in_use(&gpu->pdev->dev) == 0)
>>                  return 0;
>>
>>          busy_cycles = gmu_read64(&a6xx_gpu->gmu,
>> @@ -1667,7 +1667,7 @@ static u64 a6xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate)
>>                          REG_A6XX_GMU_CX_GMU_POWER_COUNTER_XOCLK_0_H);
>>
>>
>> -       pm_runtime_put(a6xx_gpu->gmu.dev);
>> +       pm_runtime_put(&gpu->pdev->dev);
>>
>>          return busy_cycles;
>>   }
>> --
>> 2.36.1.255.ge46751e96f-goog
>>

