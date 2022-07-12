Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC74A572532
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 21:15:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6215996172;
	Tue, 12 Jul 2022 19:15:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B3279616D;
 Tue, 12 Jul 2022 19:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1657653348; x=1689189348;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+b+lgaK3YASEo+tcVLtUlg/6iXgxr/IhFSh7iGYLsSs=;
 b=t+ZnR/KdesiWFwT1n6nWoRctGCuG1X1AfgB6+7lVdsx3hhPX3y0XvHPl
 MzFPRMBCaHD32q/SZIdd3DNjVH7q3geD4yTMu39rW7xV3gAKy61CH/E1m
 QpSOBW9rXJCrVDVsf89AMkVKtgs5KU3mf7CsomuZ2lFAHPW3v4z/8/y2t o=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 12 Jul 2022 12:15:46 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 12:15:45 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 12 Jul 2022 12:15:45 -0700
Received: from [10.216.25.243] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 12 Jul
 2022 12:15:38 -0700
Message-ID: <3c150bc9-68a0-7a35-6511-f80a42e8945b@quicinc.com>
Date: Wed, 13 Jul 2022 00:45:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [Freedreno] [PATCH v2 3/7] drm/msm: Fix cx collapse issue during
 recovery
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <1657346375-1461-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220709112837.v2.3.I4ac27a0b34ea796ce0f938bb509e257516bc6f57@changeid>
 <CAD=FV=U=J+yf6Qu0VgJ8A5Lhs_s8Fszw=Oa0XUny5XT-5z56xQ@mail.gmail.com>
 <1299312f-e614-e4e2-72cb-fd7fb99922ce@quicinc.com>
 <CAF6AEGvjD3LRm40mPr4n+jzx71WmwYpVWizUDLct9cgafjFRyw@mail.gmail.com>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <CAF6AEGvjD3LRm40mPr4n+jzx71WmwYpVWizUDLct9cgafjFRyw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Jonathan Marek <jonathan@marek.ca>, Jordan Crouse <jordan@cosmicpenguin.net>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Doug Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Matthias Kaehlcke <mka@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/12/2022 10:14 PM, Rob Clark wrote:
> On Mon, Jul 11, 2022 at 10:05 PM Akhil P Oommen
> <quic_akhilpo@quicinc.com> wrote:
>> On 7/12/2022 4:52 AM, Doug Anderson wrote:
>>> Hi,
>>>
>>> On Fri, Jul 8, 2022 at 11:00 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>> There are some hardware logic under CX domain. For a successful
>>>> recovery, we should ensure cx headswitch collapses to ensure all the
>>>> stale states are cleard out. This is especially true to for a6xx family
>>>> where we can GMU co-processor.
>>>>
>>>> Currently, cx doesn't collapse due to a devlink between gpu and its
>>>> smmu. So the *struct gpu device* needs to be runtime suspended to ensure
>>>> that the iommu driver removes its vote on cx gdsc.
>>>>
>>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>>> ---
>>>>
>>>> (no changes since v1)
>>>>
>>>>    drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 16 ++++++++++++++--
>>>>    drivers/gpu/drm/msm/msm_gpu.c         |  2 --
>>>>    2 files changed, 14 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> index 4d50110..7ed347c 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> @@ -1278,8 +1278,20 @@ static void a6xx_recover(struct msm_gpu *gpu)
>>>>            */
>>>>           gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 0);
>>>>
>>>> -       gpu->funcs->pm_suspend(gpu);
>>>> -       gpu->funcs->pm_resume(gpu);
>>>> +       /*
>>>> +        * Now drop all the pm_runtime usage count to allow cx gdsc to collapse.
>>>> +        * First drop the usage count from all active submits
>>>> +        */
>>>> +       for (i = gpu->active_submits; i > 0; i--)
>>>> +               pm_runtime_put(&gpu->pdev->dev);
>>>> +
>>>> +       /* And the final one from recover worker */
>>>> +       pm_runtime_put_sync(&gpu->pdev->dev);
>>>> +
>>>> +       for (i = gpu->active_submits; i > 0; i--)
>>>> +               pm_runtime_get(&gpu->pdev->dev);
>>>> +
>>>> +       pm_runtime_get_sync(&gpu->pdev->dev);
>>> In response to v1, Rob suggested pm_runtime_force_suspend/resume().
>>> Those seem like they would work to me, too. Why not use them?
>> Quoting my previous response which I seem to have sent only to Freedreno
>> list:
>>
>> "I believe it is supposed to be used only during system sleep state
>> transitions. Btw, we don't want pm_runtime_get() calls from elsewhere to
>> fail by disabling RPM here."
> The comment about not wanting other runpm calls to fail is valid.. but
> that is also solveable, ie. by holding a lock around runpm calls.
> Which I think we need to do anyways, otherwise looping over
> gpu->active_submits is racey..
>
> I think pm_runtime_force_suspend/resume() is the least-bad option.. or
> at least I'm not seeing any obvious alternative that is better
>
> BR,
> -R
We are holding gpu->lock here which will block further submissions from 
scheduler. Will active_submits still race?

It is possible that there is another thread which successfully completed 
pm_runtime_get() and while it access the hardware, we pulled the plug on 
regulator/clock here. That will result in obvious device crash. So I can 
think of 2 solutions:

1. wrap *every* pm_runtime_get/put with a mutex. Something like:
             mutex_lock();
             pm_runtime_get();
             < ... access hardware here >>
             pm_runtime_put();
             mutex_unlock();

2. Drop runtime votes from every submit in recover worker and wait/poll 
for regulator to collapse in case there are transient votes on 
regulator  from other threads/subsystems.

Option (2) seems simpler to me.  What do you think?

-Akhil.

