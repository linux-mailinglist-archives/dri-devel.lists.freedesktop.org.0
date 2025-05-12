Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55336AB3A00
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 16:05:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC48988C4C;
	Mon, 12 May 2025 14:05:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Mf4mHCh3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38FB488C4C;
 Mon, 12 May 2025 14:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bdAJIZj8EkyTSHzJtlofMzEYSEZPj3UWU/VWBf2U6A0=; b=Mf4mHCh3JUXt1T+gK/KSjIVMTd
 dW/O3PzmTlRbjXU3XKnC1gSxwTM0dcOxwk1/n6BKz4QzqJLtg25X43RUOSbx045+RjR4lDua/V93b
 iuFjjpUv5GpZ7EsVIbsZtGlCpRYFAz1Y5K57uTKBg/7C5n5IArpPIAFakhR0f0qeA40w3Xyqy4p1x
 qEGERlwUhA70ki6rBaK26vnwRG2uLeJKdAPPF0HPRN9ClTPe1n/HO7dbwpsbKpRew9IQzvzbkfTlz
 +fYopjKQy5oilzVQE/0qnJ19nv+9x9GT2L5FOgW6a0YL63CTA6pIo7eHMgzxo4s0SBDKZjthxPVMk
 T3dK53cA==;
Received: from [189.7.87.163] (helo=[192.168.0.7])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uETgv-0076zW-8g; Mon, 12 May 2025 16:04:58 +0200
Message-ID: <22fdf8aa-437a-4d28-886a-fe10e957edfa@igalia.com>
Date: Mon, 12 May 2025 11:04:50 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] drm/sched: Allow drivers to skip the reset and keep
 on running
To: phasta@kernel.org, Matthew Brost <matthew.brost@intel.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <mwen@igalia.com>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 kernel-dev@igalia.com, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20250503-sched-skip-reset-v1-0-ed0d6701a3fe@igalia.com>
 <20250503-sched-skip-reset-v1-1-ed0d6701a3fe@igalia.com>
 <aBl2xaVBlYYyBt2o@lstrano-desk.jf.intel.com>
 <aBodbVPeVtAWK6OX@lstrano-desk.jf.intel.com>
 <c0ce8bc07bf5547af5084cfcb2c7572d786fdc0e.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <c0ce8bc07bf5547af5084cfcb2c7572d786fdc0e.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Philipp,

On 12/05/25 08:13, Philipp Stanner wrote:
> On Tue, 2025-05-06 at 07:32 -0700, Matthew Brost wrote:
>> On Mon, May 05, 2025 at 07:41:09PM -0700, Matthew Brost wrote:
>>> On Sat, May 03, 2025 at 05:59:52PM -0300, Maíra Canal wrote:
>>>> When the DRM scheduler times out, it's possible that the GPU
>>>> isn't hung;
>>>> instead, a job may still be running, and there may be no valid
>>>> reason to
>>>> reset the hardware. This can occur in two situations:
>>>>
>>>>    1. The GPU exposes some mechanism that ensures the GPU is still
>>>> making
>>>>       progress. By checking this mechanism, we can safely skip the
>>>> reset,
>>>>       rearm the timeout, and allow the job to continue running
>>>> until
>>>>       completion. This is the case for v3d and Etnaviv.
>>>>    2. TDR has fired before the IRQ that signals the fence.
>>>> Consequently,
>>>>       the job actually finishes, but it triggers a timeout before
>>>> signaling
>>>>       the completion fence.
>>>>
>>>
>>> We have both of these cases in Xe too. We implement the requeuing
>>> in Xe
>>> via driver side function - xe_sched_add_pending_job but this looks
>>> better and will make use of this.
>>>
>>>> These two scenarios are problematic because we remove the job
>>>> from the
>>>> `sched->pending_list` before calling `sched->ops-
>>>>> timedout_job()`. This
>>>> means that when the job finally signals completion (e.g. in the
>>>> IRQ
>>>> handler), the scheduler won't call `sched->ops->free_job()`. As a
>>>> result,
>>>> the job and its resources won't be freed, leading to a memory
>>>> leak.
>>>>
>>>> To resolve this issue, we create a new `drm_gpu_sched_stat` that
>>>> allows a
>>>> driver to skip the reset. This new status will indicate that the
>>>> job
>>>> should be reinserted into the pending list, and the driver will
>>>> still
>>>> signal its completion.
>>>>
>>>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>>>
>>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>>>
>>
>> Wait - nevermind I think one issue is below.
>>
>>>> ---
>>>>   drivers/gpu/drm/scheduler/sched_main.c | 14 ++++++++++++++
>>>>   include/drm/gpu_scheduler.h            |  2 ++
>>>>   2 files changed, 16 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>>> index
>>>> 829579c41c6b5d8b2abce5ad373c7017469b7680..68ca827d77e32187a034309
>>>> f881135dbc639a9b4 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>> @@ -568,6 +568,17 @@ static void drm_sched_job_timedout(struct
>>>> work_struct *work)
>>>>   			job->sched->ops->free_job(job);
>>>>   			sched->free_guilty = false;
>>>>   		}
>>>> +
>>>> +		/*
>>>> +		 * If the driver indicated that the GPU is still
>>>> running and wants to skip
>>>> +		 * the reset, reinsert the job back into the
>>>> pending list and realarm the
>>>> +		 * timeout.
>>>> +		 */
>>>> +		if (status == DRM_GPU_SCHED_STAT_RUNNING) {
>>>> +			spin_lock(&sched->job_list_lock);
>>>> +			list_add(&job->list, &sched-
>>>>> pending_list);
>>>> +			spin_unlock(&sched->job_list_lock);
>>>> +		}
>>
>> I think you need to requeue free_job wq here. It is possible the
>> free_job wq ran, didn't find a job, goes to sleep, then we add a
>> signaled job here which will never get freed.
> 
> I wonder if that could be solved by holding job_list_lock a bit longer.
> free_job_work will try to check the list for the next signaled job, but
> will wait for the lock.
> 
> If that works, we could completely rely on the standard mechanism
> without requeuing, which would be neat.

I believe it works. However, the tradeoff would be holding the lock for
the entire reset of the GPU (in the cases the GPU actually hanged),
which looks like a lot of time.

Do you think it's reasonable to do so?

Best Regards,
- Maíra

> 
> P.
> 
>>
>> Matt
>>


