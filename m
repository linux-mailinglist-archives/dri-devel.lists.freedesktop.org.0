Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D099F129F
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 17:47:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8019C10F097;
	Fri, 13 Dec 2024 16:47:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="JuVa947E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9556910F097;
 Fri, 13 Dec 2024 16:47:40 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDBTqTM001422;
 Fri, 13 Dec 2024 16:47:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 s++5KrLxPqE+X/wmzxzbgKcrqnNn9ijB5o3bh4xPGfI=; b=JuVa947EKajCPOfT
 Rd951/yc3fNKGK6dCE0mIUB4v7v3fLGKU7zIwpLqMhnFMtqVDeJAO5Rs6g1fgibI
 YF7nutjK141sNccEOt4KeTggPsbc/zjlRRwTYtChweAfdLlEHJ1wdRw6ErncOe/k
 ZqHnLcXFqy/Pmc92pa3FfPzXX7JduQreg2Q/LJAqtU10xsRW27oBceBDo6Ku3IX8
 w2/6C9hD0fy6Ug/zv7l0EtkjPMUq1Y9i+iksC8Lq/zg7lE/3dRADAA+zvmdWfqBh
 3nwBfZ//UjBAeTtLWrYUoZCJwVfRFDEd0ywEsF+trLmZWEaJJvYCRtp+XnFw/77d
 dTgO2g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43gm3s0tef-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Dec 2024 16:47:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BDGlWeh012315
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Dec 2024 16:47:32 GMT
Received: from [10.204.101.130] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 13 Dec
 2024 08:47:26 -0800
Message-ID: <7293c3f6-d1d8-4397-8f31-a456cd06c7cb@quicinc.com>
Date: Fri, 13 Dec 2024 22:17:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] drm/msm: Add UABI to request perfcntr usage
To: Rob Clark <robdclark@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, Antonino Maniscalco
 <antomani103@gmail.com>, Rob Clark <robdclark@chromium.org>, Sean Paul
 <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, open list
 <linux-kernel@vger.kernel.org>
References: <20241205165419.54080-1-robdclark@gmail.com>
 <eca60b8e-8a8a-41c4-816a-d084822646f1@quicinc.com>
 <CAF6AEGtqSW1mpN14S8ffyV=tUG=0GTmNWq_oVEXo+0RYDJfOnA@mail.gmail.com>
 <CAF6AEGssTcO=qhXPVTd54=jQv8dke=JY0Qm3C96JMKDsgT3==g@mail.gmail.com>
Content-Language: en-US
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <CAF6AEGssTcO=qhXPVTd54=jQv8dke=JY0Qm3C96JMKDsgT3==g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: pNVUr9P3PQJGKE5LlK0F0BkSoEIXayj-
X-Proofpoint-GUID: pNVUr9P3PQJGKE5LlK0F0BkSoEIXayj-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 impostorscore=0 phishscore=0 mlxscore=0 bulkscore=0
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130118
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

On 12/12/2024 10:42 PM, Rob Clark wrote:
> On Thu, Dec 12, 2024 at 9:08 AM Rob Clark <robdclark@gmail.com> wrote:
>>
>> On Thu, Dec 12, 2024 at 7:59 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>
>>> On 12/5/2024 10:24 PM, Rob Clark wrote:
>>>> From: Rob Clark <robdclark@chromium.org>
>>>>
>>>> Performance counter usage falls into two categories:
>>>>
>>>> 1. Local usage, where the counter configuration, start, and end read
>>>>    happen within (locally to) a single SUBMIT.  In this case, there is
>>>>    no dependency on counter configuration or values between submits, and
>>>>    in fact counters are normally cleared on context switches, making it
>>>>    impossible to rely on cross-submit state.
>>>>
>>>> 2. Global usage, where a single privilaged daemon/process is sampling
>>>>    counter values across all processes for profiling.
>>>>
>>>> The two categories are mutually exclusive.  While you can have many
>>>> processes making local counter usage, you cannot combine global and
>>>> local usage without the two stepping on each others feet (by changing
>>>> counter configuration).

As such the HW doesn't have any limitation, unless you run out of
counters in a group. We just need an arbitration between processes (UMD
or KMD based).

Also, KGSL exposes an ioctl to directly read the counter with a fixed
minimal latency. Because inline reads via submission may have huge
latency spikes based on workload especially when compute shaders are
involved. Isn't a low latency counter reads desirable in a fullfledged
system profiler?

>>>>
>>>> For global counter usage, there is already a SYSPROF param (since global
>>>> counter usage requires disabling counter clearing on context switch).
>>>> This patch adds a REQ_CNTRS param to request local counter usage.  If
>>>> one or more processes has requested counter usage, then a SYSPROF
>>>> request will fail with -EBUSY.  And if SYSPROF is active, then REQ_CNTRS
>>>> will fail with -EBUSY, maintaining the mutual exclusivity.
>>>>
>>>> This is purely an advisory interface to help coordinate userspace.
>>>> There is no real means of enforcement, but the worst that can happen if
>>>> userspace ignores a REQ_CNTRS failure is that you'll get nonsense
>>>> profiling data.
>>>>
>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>>> ---
>>>> kgsl takes a different approach, which involves a lot more UABI for
>>>> assigning counters to different processes.  But I think by taking
>>>> advantage of the fact that mesa (freedreno+turnip) reconfigure the
>>>> counters they need in each SUBMIT, for their respective gl/vk perf-
>>>> counter extensions, we can take this simpler approach.
>>>
>>> KGSL's approach is preemption and ifpc safe (also whatever HW changes
>>> that will come up in future generations). How will we ensure that here?
>>>
>>> I have plans to bring up IFPC support in near future. Also, I brought up
>>> this point during preemption series. But from the responses, I felt that
>>> profiling was not considered a serious usecase. Still I wonder how the
>>> perfcounter extensions work accurately with preemption.
>>
>> Re: IFPC, I think initially we have to inhibit IFPC when SYSPROF is active
>>
>> Longer term, I think we want to just save and restore all of the SEL
>> regs as well as the counters themselves on preemption.  AFAIU
>> currently only the counters themselves are saved/restored.  But there
>> is only one 32b SEL reg for each 64b counter, so I'm not sure that you
>> save that many cycles by not just saving/restoring the SEL regs as
>> well.  (And of course with REQ_CNTRS the kernel knows which processes
>> need counter save/restore and which do not, so you are only taking the
>> extra context switch overhead if a process is actually using the
>> perfcntrs.)
> 
> Actually I'm maybe blending two different, but similar cases.
> PREAMBLE/POSTAMBLE, I think, cover us for preemption
> 
> For IFPC, we'd need a way to tell GMU that SYSPROF is active, so it
> could save/restore all the counters and selectors  (IFPC shouldn't
> matter for local profiling / REQ_CNTRS case, since you wouldn't go
> into IFPC mid-submit.)
> 
> BR,
> -R
> 
>> Alternatively, I think we could just declare this as a userspace
>> problem, and solve it with CP_SET_AMBLE PREAMBLE/POSTAMBLE?
>>
>> Just for background, rendernode UABI is exposed to all processes that
>> can use the GPU, ie. basically everything.  Which makes it an
>> attractive attack surface.  This is why I prefer minimalism when it
>> comes to UABI, and not adding new ioctls and complexity in the kernel
>> when it is not essential ;-)

I fully agree with you about maintaining minimalism in KMD. Here all we
need is a way for UMD to ask "give me a counter offset with 'x'
countable from 'y' group". And let KMD do the arbitration of counters
between userspace processes and also within KMD. And we can cut down on
some of the related things present in kgsl which are unnecessary at the
moment.

More importantly, I am not sure if we should really fight hard against
something that is basically an architectur spec. Future HW evolution
happens based on this architecture. So is it really wise to build things
in the opposite direction. FYI, all other GPU KMD drivers which Qcom
uses are aligned on this.

-Akhil

>>
>> BR,
>> -R
>>
>>> -Akhil
>>>
>>>>
>>>>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  2 +
>>>>  drivers/gpu/drm/msm/msm_drv.c           |  5 ++-
>>>>  drivers/gpu/drm/msm/msm_gpu.c           |  1 +
>>>>  drivers/gpu/drm/msm/msm_gpu.h           | 29 +++++++++++++-
>>>>  drivers/gpu/drm/msm/msm_submitqueue.c   | 52 ++++++++++++++++++++++++-
>>>>  include/uapi/drm/msm_drm.h              |  1 +
>>>>  6 files changed, 85 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>>> index 31bbf2c83de4..f688e37059b8 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>>> @@ -441,6 +441,8 @@ int adreno_set_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
>>>>               if (!capable(CAP_SYS_ADMIN))
>>>>                       return UERR(EPERM, drm, "invalid permissions");
>>>>               return msm_file_private_set_sysprof(ctx, gpu, value);
>>>> +     case MSM_PARAM_REQ_CNTRS:
>>>> +             return msm_file_private_request_counters(ctx, gpu, value);
>>>>       default:
>>>>               return UERR(EINVAL, drm, "%s: invalid param: %u", gpu->name, param);
>>>>       }
>>>> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
>>>> index 6416d2cb4efc..bf8314ff4a25 100644
>>>> --- a/drivers/gpu/drm/msm/msm_drv.c
>>>> +++ b/drivers/gpu/drm/msm/msm_drv.c
>>>> @@ -377,9 +377,12 @@ static void msm_postclose(struct drm_device *dev, struct drm_file *file)
>>>>        * It is not possible to set sysprof param to non-zero if gpu
>>>>        * is not initialized:
>>>>        */
>>>> -     if (priv->gpu)
>>>> +     if (ctx->sysprof)
>>>>               msm_file_private_set_sysprof(ctx, priv->gpu, 0);
>>>>
>>>> +     if (ctx->counters_requested)
>>>> +             msm_file_private_request_counters(ctx, priv->gpu, 0);
>>>> +
>>>>       context_close(ctx);
>>>>  }
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
>>>> index 82f204f3bb8f..013b59ca3bb1 100644
>>>> --- a/drivers/gpu/drm/msm/msm_gpu.c
>>>> +++ b/drivers/gpu/drm/msm/msm_gpu.c
>>>> @@ -991,6 +991,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>>>>       gpu->nr_rings = nr_rings;
>>>>
>>>>       refcount_set(&gpu->sysprof_active, 1);
>>>> +     refcount_set(&gpu->local_counters_active, 1);
>>>>
>>>>       return 0;
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
>>>> index e25009150579..83c61e523b1b 100644
>>>> --- a/drivers/gpu/drm/msm/msm_gpu.h
>>>> +++ b/drivers/gpu/drm/msm/msm_gpu.h
>>>> @@ -195,12 +195,28 @@ struct msm_gpu {
>>>>       int nr_rings;
>>>>
>>>>       /**
>>>> -      * sysprof_active:
>>>> +      * @sysprof_active:
>>>>        *
>>>> -      * The count of contexts that have enabled system profiling.
>>>> +      * The count of contexts that have enabled system profiling plus one.
>>>> +      *
>>>> +      * Note: refcount_t does not like 0->1 transitions.. we want to keep
>>>> +      * the under/overflow checks that refcount_t provides, but allow
>>>> +      * multiple on/off transitions so we track the logical value plus one.)
>>>>        */
>>>>       refcount_t sysprof_active;
>>>>
>>>> +     /**
>>>> +      * @local_counters_active:
>>>> +      *
>>>> +      * The count of contexts that have requested local (intra-submit)
>>>> +      * performance counter usage plus one.
>>>> +      *
>>>> +      * Note: refcount_t does not like 0->1 transitions.. we want to keep
>>>> +      * the under/overflow checks that refcount_t provides, but allow
>>>> +      * multiple on/off transitions so we track the logical value plus one.)
>>>> +      */
>>>> +     refcount_t local_counters_active;
>>>> +
>>>>       /**
>>>>        * lock:
>>>>        *
>>>> @@ -383,6 +399,13 @@ struct msm_file_private {
>>>>        */
>>>>       int sysprof;
>>>>
>>>> +     /**
>>>> +      * @counters_requested:
>>>> +      *
>>>> +      * Has the context requested local perfcntr usage.
>>>> +      */
>>>> +     bool counters_requested;
>>>> +
>>>>       /**
>>>>        * comm: Overridden task comm, see MSM_PARAM_COMM
>>>>        *
>>>> @@ -626,6 +649,8 @@ void msm_submitqueue_destroy(struct kref *kref);
>>>>
>>>>  int msm_file_private_set_sysprof(struct msm_file_private *ctx,
>>>>                                struct msm_gpu *gpu, int sysprof);
>>>> +int msm_file_private_request_counters(struct msm_file_private *ctx,
>>>> +                                   struct msm_gpu *gpu, int reqcntrs);
>>>>  void __msm_file_private_destroy(struct kref *kref);
>>>>
>>>>  static inline void msm_file_private_put(struct msm_file_private *ctx)
>>>> diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
>>>> index 7fed1de63b5d..1e1e21e6f7ae 100644
>>>> --- a/drivers/gpu/drm/msm/msm_submitqueue.c
>>>> +++ b/drivers/gpu/drm/msm/msm_submitqueue.c
>>>> @@ -10,6 +10,15 @@
>>>>  int msm_file_private_set_sysprof(struct msm_file_private *ctx,
>>>>                                struct msm_gpu *gpu, int sysprof)
>>>>  {
>>>> +     int ret = 0;
>>>> +
>>>> +     mutex_lock(&gpu->lock);
>>>> +
>>>> +     if (sysprof && (refcount_read(&gpu->local_counters_active) > 1)) {
>>>> +             ret = UERR(EBUSY, gpu->dev, "Local counter usage active");
>>>> +             goto out_unlock;
>>>> +     }
>>>> +
>>>>       /*
>>>>        * Since pm_runtime and sysprof_active are both refcounts, we
>>>>        * call apply the new value first, and then unwind the previous
>>>> @@ -18,7 +27,8 @@ int msm_file_private_set_sysprof(struct msm_file_private *ctx,
>>>>
>>>>       switch (sysprof) {
>>>>       default:
>>>> -             return UERR(EINVAL, gpu->dev, "Invalid sysprof: %d", sysprof);
>>>> +             ret = UERR(EINVAL, gpu->dev, "Invalid sysprof: %d", sysprof);
>>>> +             goto out_unlock;
>>>>       case 2:
>>>>               pm_runtime_get_sync(&gpu->pdev->dev);
>>>>               fallthrough;
>>>> @@ -43,7 +53,45 @@ int msm_file_private_set_sysprof(struct msm_file_private *ctx,
>>>>
>>>>       ctx->sysprof = sysprof;
>>>>
>>>> -     return 0;
>>>> +out_unlock:
>>>> +     mutex_unlock(&gpu->lock);
>>>> +
>>>> +     return ret;
>>>> +}
>>>> +
>>>> +int msm_file_private_request_counters(struct msm_file_private *ctx,
>>>> +                                   struct msm_gpu *gpu, int reqctrs)
>>>> +{
>>>> +     int ret = 0;
>>>> +
>>>> +     mutex_lock(&gpu->lock);
>>>> +
>>>> +     if (reqctrs && (refcount_read(&gpu->sysprof_active) > 1)) {
>>>> +             ret = UERR(EBUSY, gpu->dev, "System profiling active");
>>>> +             goto out_unlock;
>>>> +     }
>>>> +
>>>> +     if (reqctrs) {
>>>> +             if (ctx->counters_requested) {
>>>> +                     ret = UERR(EINVAL, gpu->dev, "Already requested");
>>>> +                     goto out_unlock;
>>>> +             }
>>>> +
>>>> +             ctx->counters_requested = true;
>>>> +             refcount_inc(&gpu->local_counters_active);
>>>> +     } else {
>>>> +             if (!ctx->counters_requested) {
>>>> +                     ret = UERR(EINVAL, gpu->dev, "Not requested");
>>>> +                     goto out_unlock;
>>>> +             }
>>>> +             refcount_dec(&gpu->local_counters_active);
>>>> +             ctx->counters_requested = false;
>>>> +     }
>>>> +
>>>> +out_unlock:
>>>> +     mutex_unlock(&gpu->lock);
>>>> +
>>>> +     return ret;
>>>>  }
>>>>
>>>>  void __msm_file_private_destroy(struct kref *kref)
>>>> diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
>>>> index 2342cb90857e..ae7fb355e4a1 100644
>>>> --- a/include/uapi/drm/msm_drm.h
>>>> +++ b/include/uapi/drm/msm_drm.h
>>>> @@ -91,6 +91,7 @@ struct drm_msm_timespec {
>>>>  #define MSM_PARAM_UBWC_SWIZZLE 0x12 /* RO */
>>>>  #define MSM_PARAM_MACROTILE_MODE 0x13 /* RO */
>>>>  #define MSM_PARAM_UCHE_TRAP_BASE 0x14 /* RO */
>>>> +#define MSM_PARAM_REQ_CNTRS  0x15 /* WO: request "local" (intra-submit) perfcntr usage  */
>>>>
>>>>  /* For backwards compat.  The original support for preemption was based on
>>>>   * a single ring per priority level so # of priority levels equals the #
>>>

