Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0A35898BA
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 09:53:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7BAD904C3;
	Thu,  4 Aug 2022 07:53:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10503904C1;
 Thu,  4 Aug 2022 07:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1659599589; x=1691135589;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=I7OayC0sFap2AlYvZdR6JVxb0RZ2MlfjjD1PjQxCMdY=;
 b=IlNM20nntBzySBejjmxaBl8Ev7k11HrM76eEzqfpD4PA8ToyZFne91x6
 5+KA6ORldALDRwU13SwR7P3YW5eA8foPIKCsPawi44Ij2fBHwK9YOgb0P
 HMsViFbCKtNCe8Ty0m0PK3CKt28/VNqF0sVpR3fxQfu1+cIlumNcsRUkO U=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 04 Aug 2022 00:53:08 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2022 00:53:07 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 4 Aug 2022 00:53:07 -0700
Received: from [10.216.4.234] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 4 Aug 2022
 00:53:03 -0700
Message-ID: <7f7bd85a-2444-1939-4ac8-dbf2685eaf24@quicinc.com>
Date: Thu, 4 Aug 2022 13:23:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 1/2] drm/msm: Move hangcheck timer restart
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20220803172302.1976981-1-robdclark@gmail.com>
 <c80d70b6-a7ad-5900-ea7a-f0f2157e4a40@quicinc.com>
 <CAF6AEGuDajmv=bnQ9hNgCbkB8ubpFhhoFZVL4881O=2B9xh+_Q@mail.gmail.com>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <CAF6AEGuDajmv=bnQ9hNgCbkB8ubpFhhoFZVL4881O=2B9xh+_Q@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/4/2022 1:59 AM, Rob Clark wrote:
> On Wed, Aug 3, 2022 at 12:52 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>> On 8/3/2022 10:53 PM, Rob Clark wrote:
>>> From: Rob Clark <robdclark@chromium.org>
>>>
>>> Don't directly restart the hangcheck timer from the timer handler, but
>>> instead start it after the recover_worker replays remaining jobs.
>>>
>>> If the kthread is blocked for other reasons, there is no point to
>>> immediately restart the timer.  Fixes a random symptom of the problem
>>> fixed in the next patch.
>>>
>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>> ---
>>>    drivers/gpu/drm/msm/msm_gpu.c | 14 +++++++++-----
>>>    1 file changed, 9 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
>>> index fba85f894314..8f9c48eabf7d 100644
>>> --- a/drivers/gpu/drm/msm/msm_gpu.c
>>> +++ b/drivers/gpu/drm/msm/msm_gpu.c
>>> @@ -328,6 +328,7 @@ find_submit(struct msm_ringbuffer *ring, uint32_t fence)
>>>    }
>>>
>>>    static void retire_submits(struct msm_gpu *gpu);
>>> +static void hangcheck_timer_reset(struct msm_gpu *gpu);
>>>
>>>    static void get_comm_cmdline(struct msm_gem_submit *submit, char **comm, char **cmd)
>>>    {
>>> @@ -420,6 +421,8 @@ static void recover_worker(struct kthread_work *work)
>>>        }
>>>
>>>        if (msm_gpu_active(gpu)) {
>>> +             bool restart_hangcheck = false;
>>> +
>>>                /* retire completed submits, plus the one that hung: */
>>>                retire_submits(gpu);
>>>
>>> @@ -436,10 +439,15 @@ static void recover_worker(struct kthread_work *work)
>>>                        unsigned long flags;
>>>
>>>                        spin_lock_irqsave(&ring->submit_lock, flags);
>>> -                     list_for_each_entry(submit, &ring->submits, node)
>>> +                     list_for_each_entry(submit, &ring->submits, node) {
>>>                                gpu->funcs->submit(gpu, submit);
>>> +                             restart_hangcheck = true;
>>> +                     }
>>>                        spin_unlock_irqrestore(&ring->submit_lock, flags);
>>>                }
>>> +
>>> +             if (restart_hangcheck)
>>> +                     hangcheck_timer_reset(gpu);
>>>        }
>>>
>>>        mutex_unlock(&gpu->lock);
>>> @@ -515,10 +523,6 @@ static void hangcheck_handler(struct timer_list *t)
>>>                kthread_queue_work(gpu->worker, &gpu->recover_work);
>>>        }
>>>
>>> -     /* if still more pending work, reset the hangcheck timer: */
>> In the scenario mentioned here, shouldn't we restart the timer?
> yeah, actually the case where we don't want to restart the timer is
> *only* when we schedule recover_work..
>
> BR,
> -R
Not sure if your codebase is different but based on msm-next branch, 
when "if (fence != ring->hangcheck_fence)" is true, we now skip 
rescheduling the timer. I don't think that is what we want. There should 
be a hangcheck timer running as long as there is an active submit, 
unless we have scheduled a recover_work here.

-Akhil.
>
>> -Akhil.
>>> -     if (fence_after(ring->fctx->last_fence, ring->hangcheck_fence))
>>> -             hangcheck_timer_reset(gpu);
>>> -
>>>        /* workaround for missing irq: */
>>>        msm_gpu_retire(gpu);
>>>    }
>>>

