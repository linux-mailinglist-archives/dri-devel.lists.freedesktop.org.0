Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CCE57E587
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 19:26:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C1C310FA8F;
	Fri, 22 Jul 2022 17:26:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 723731124DB;
 Fri, 22 Jul 2022 17:26:05 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26MElcn8028843;
 Fri, 22 Jul 2022 17:26:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=OnxAuiG3QggNw5BLUIHP10X4KADLKZ3VYyT27eA5KmE=;
 b=h47C4VZNl3KXzJeWoxeo3//1RvSmp6DUdgXUcqM9FCotQ7VR9i0WNaJba+YRg7iWL2Hj
 F65Ehbx0pjJQywDV8d/a8Qn6q1Tc2laIqnoglBzje6kRhD9PLLTfLB74GZ+ZmmhcQH80
 2WVLRpO5gZhoWNRwxM96LL3ZNTur442zuY9hKDVEWbB5qtqBoozPh9vjDmg22KQlBNTk
 8GLr9GJYllqKpe9NWEb2GH/Y03/CvcD+AssKEF/aBSBlzM78kfV4yjXHjJju98YwIjSX
 AGBNY5QdffCWD4RBPI42Cn3bT6r0tbD+/XW0VVBohhngW+rmffWn3Q6AQ8Flin4s0Qs6 WA== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3hftv7902w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jul 2022 17:25:59 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.47.97.222])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 26MHPxAR008378
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jul 2022 17:25:59 GMT
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 22 Jul 2022 10:25:58 -0700
Received: from [10.216.44.13] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 22 Jul
 2022 10:25:52 -0700
Message-ID: <d895c33a-beb2-0528-0373-781b71e4c33f@quicinc.com>
Date: Fri, 22 Jul 2022 22:55:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [Freedreno] [PATCH v2 3/7] drm/msm: Fix cx collapse issue during
 recovery
Content-Language: en-US
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Rob Clark <robdclark@gmail.com>
References: <1657346375-1461-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220709112837.v2.3.I4ac27a0b34ea796ce0f938bb509e257516bc6f57@changeid>
 <CAD=FV=U=J+yf6Qu0VgJ8A5Lhs_s8Fszw=Oa0XUny5XT-5z56xQ@mail.gmail.com>
 <1299312f-e614-e4e2-72cb-fd7fb99922ce@quicinc.com>
 <CAF6AEGvjD3LRm40mPr4n+jzx71WmwYpVWizUDLct9cgafjFRyw@mail.gmail.com>
 <3c150bc9-68a0-7a35-6511-f80a42e8945b@quicinc.com>
 <CAF6AEGsQqE+5iE-=ja96wS6EMN1K1PzCa2fRA6DvQWwyqBq3NA@mail.gmail.com>
 <b19c361f-025b-db02-debe-8b4bbe1369dd@quicinc.com>
In-Reply-To: <b19c361f-025b-db02-debe-8b4bbe1369dd@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: wctJzAIXFsvTOGMRlnjIztoXXTNmTZMd
X-Proofpoint-GUID: wctJzAIXFsvTOGMRlnjIztoXXTNmTZMd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-22_06,2022-07-21_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 adultscore=0 mlxlogscore=999 spamscore=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207220073
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

On 7/21/2022 2:08 AM, Akhil P Oommen wrote:
> On 7/20/2022 11:36 PM, Rob Clark wrote:
>> On Tue, Jul 12, 2022 at 12:15 PM Akhil P Oommen
>> <quic_akhilpo@quicinc.com> wrote:
>>> On 7/12/2022 10:14 PM, Rob Clark wrote:
>>>> On Mon, Jul 11, 2022 at 10:05 PM Akhil P Oommen
>>>> <quic_akhilpo@quicinc.com> wrote:
>>>>> On 7/12/2022 4:52 AM, Doug Anderson wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On Fri, Jul 8, 2022 at 11:00 PM Akhil P Oommen 
>>>>>> <quic_akhilpo@quicinc.com> wrote:
>>>>>>> There are some hardware logic under CX domain. For a successful
>>>>>>> recovery, we should ensure cx headswitch collapses to ensure all 
>>>>>>> the
>>>>>>> stale states are cleard out. This is especially true to for a6xx 
>>>>>>> family
>>>>>>> where we can GMU co-processor.
>>>>>>>
>>>>>>> Currently, cx doesn't collapse due to a devlink between gpu and its
>>>>>>> smmu. So the *struct gpu device* needs to be runtime suspended 
>>>>>>> to ensure
>>>>>>> that the iommu driver removes its vote on cx gdsc.
>>>>>>>
>>>>>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>>>>>> ---
>>>>>>>
>>>>>>> (no changes since v1)
>>>>>>>
>>>>>>>     drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 16 ++++++++++++++--
>>>>>>>     drivers/gpu/drm/msm/msm_gpu.c         |  2 --
>>>>>>>     2 files changed, 14 insertions(+), 4 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c 
>>>>>>> b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>> index 4d50110..7ed347c 100644
>>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>> @@ -1278,8 +1278,20 @@ static void a6xx_recover(struct msm_gpu 
>>>>>>> *gpu)
>>>>>>>             */
>>>>>>>            gmu_write(&a6xx_gpu->gmu, 
>>>>>>> REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 0);
>>>>>>>
>>>>>>> -       gpu->funcs->pm_suspend(gpu);
>>>>>>> -       gpu->funcs->pm_resume(gpu);
>>>>>>> +       /*
>>>>>>> +        * Now drop all the pm_runtime usage count to allow cx 
>>>>>>> gdsc to collapse.
>>>>>>> +        * First drop the usage count from all active submits
>>>>>>> +        */
>>>>>>> +       for (i = gpu->active_submits; i > 0; i--)
>>>>>>> + pm_runtime_put(&gpu->pdev->dev);
>>>>>>> +
>>>>>>> +       /* And the final one from recover worker */
>>>>>>> + pm_runtime_put_sync(&gpu->pdev->dev);
>>>>>>> +
>>>>>>> +       for (i = gpu->active_submits; i > 0; i--)
>>>>>>> + pm_runtime_get(&gpu->pdev->dev);
>>>>>>> +
>>>>>>> + pm_runtime_get_sync(&gpu->pdev->dev);
>>>>>> In response to v1, Rob suggested pm_runtime_force_suspend/resume().
>>>>>> Those seem like they would work to me, too. Why not use them?
>>>>> Quoting my previous response which I seem to have sent only to 
>>>>> Freedreno
>>>>> list:
>>>>>
>>>>> "I believe it is supposed to be used only during system sleep state
>>>>> transitions. Btw, we don't want pm_runtime_get() calls from 
>>>>> elsewhere to
>>>>> fail by disabling RPM here."
>>>> The comment about not wanting other runpm calls to fail is valid.. but
>>>> that is also solveable, ie. by holding a lock around runpm calls.
>>>> Which I think we need to do anyways, otherwise looping over
>>>> gpu->active_submits is racey..
>>>>
>>>> I think pm_runtime_force_suspend/resume() is the least-bad option.. or
>>>> at least I'm not seeing any obvious alternative that is better
>>>>
>>>> BR,
>>>> -R
>>> We are holding gpu->lock here which will block further submissions from
>>> scheduler. Will active_submits still race?
>>>
>>> It is possible that there is another thread which successfully 
>>> completed
>>> pm_runtime_get() and while it access the hardware, we pulled the 
>>> plug on
>>> regulator/clock here. That will result in obvious device crash. So I 
>>> can
>>> think of 2 solutions:
>>>
>>> 1. wrap *every* pm_runtime_get/put with a mutex. Something like:
>>>               mutex_lock();
>>>               pm_runtime_get();
>>>               < ... access hardware here >>
>>>               pm_runtime_put();
>>>               mutex_unlock();
>>>
>>> 2. Drop runtime votes from every submit in recover worker and wait/poll
>>> for regulator to collapse in case there are transient votes on
>>> regulator  from other threads/subsystems.
>>>
>>> Option (2) seems simpler to me.  What do you think?
>>>
>> But I think without #1 you could still be racing w/ some other path
>> that touches the hw, like devfreq, right.  They could be holding a
>> runpm ref, so even if you loop over active_submits decrementing the
>> runpm ref, it still doesn't drop to zero
>>
>> BR,
>> -R
> Yes, you are right. There could be some transient votes from other 
> threads/drivers/subsystem. This is the reason we need to poll for cx 
> gdsc collapse in the next patch.Even with #1, it is difficult to 
> coordinate with smmu driver and close to impossible with tz/hyp.
>
> -Akhil.

Rob,

Summarizing my responses:
1. We cannot blindly force turn off cx headswitch because that would 
impact other gpu driver threads/smmu driver/tz/hyp etc which access cx 
domain register at the same time.
2. We need to drop all our rpm votes on 'gpu device' instead of a single 
vote on 'gmu device' because of [1]. Otherwise, smmu driver's vote on cx 
headswitch will block its collapse forever.

This is the high level sequence implemented in the current series' version:
1. Drop all rpm votes on 'gpu device' which will indirectly let smmu 
driver drop its vote on cx HS.
2. To take care of transient votes from other threads/hyp etc, poll for 
cx gdsc hw register to ensure that it has collapsed. (We might be able 
to move this to gpucc driver depending on the consensus on the other patch.)

[1] https://lkml.org/lkml/2018/8/30/590

-Akhil.
