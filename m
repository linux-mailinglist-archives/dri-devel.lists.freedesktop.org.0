Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E127DAADF40
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 14:34:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 309A210E7A2;
	Wed,  7 May 2025 12:34:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="skuRotTM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3728C10E79F;
 Wed,  7 May 2025 12:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Vxm9OpDLFXAaknT13AU4WZpNG64LBN+vhB12lfO44sU=; b=skuRotTMaZskRqgD0xxhUU4lEz
 q5x6GV1Z2uqd+3vZYTNZv6uT5dDMAVLancmvarYVasVuH1og7IYvkdcrnQLja99V2ZLMrx5oUF4MT
 xPDaMao/QlIXGoH99mOgbfBKmP5oNTnzMXPinLxvE3/rNDf44FwoUyU9IRorac4bw67naRAGvSmH9
 n10NAoMQB+LFv4M813dZCSROraAb9BQQf71qPh057uwFt2TbkM8pHXqv6RXkAzqHwqfcBLTYQSmKD
 mz+y/7PkXre33RxtYUM+JhhNqqqijTiQcQNgKv9V9IfQMt/rPnv7ayXs2Yw+B+vFzf+DUionKkRGF
 vBWYfviA==;
Received: from [189.7.87.163] (helo=[192.168.0.7])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uCduE-004hi1-IW; Wed, 07 May 2025 14:33:42 +0200
Message-ID: <4020cf8b-3524-46c9-a082-adaf4c1797c2@igalia.com>
Date: Wed, 7 May 2025 09:33:31 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] drm/sched: Allow drivers to skip the reset and keep
 on running
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <mwen@igalia.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20250503-sched-skip-reset-v1-0-ed0d6701a3fe@igalia.com>
 <20250503-sched-skip-reset-v1-1-ed0d6701a3fe@igalia.com>
 <f48aa17a-3135-4480-b396-2e2077a7d2aa@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <f48aa17a-3135-4480-b396-2e2077a7d2aa@igalia.com>
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

Hi Tvrtko,

Thanks for the review!

On 06/05/25 08:32, Tvrtko Ursulin wrote:
> 
> On 03/05/2025 21:59, Maíra Canal wrote:
>> When the DRM scheduler times out, it's possible that the GPU isn't hung;
>> instead, a job may still be running, and there may be no valid reason to
>> reset the hardware. This can occur in two situations:
>>
>>    1. The GPU exposes some mechanism that ensures the GPU is still making
>>       progress. By checking this mechanism, we can safely skip the reset,
>>       rearm the timeout, and allow the job to continue running until
>>       completion. This is the case for v3d and Etnaviv.
>>    2. TDR has fired before the IRQ that signals the fence. Consequently,
>>       the job actually finishes, but it triggers a timeout before 
>> signaling
>>       the completion fence.
>>
>> These two scenarios are problematic because we remove the job from the
>> `sched->pending_list` before calling `sched->ops->timedout_job()`. This
>> means that when the job finally signals completion (e.g. in the IRQ
>> handler), the scheduler won't call `sched->ops->free_job()`. As a result,
>> the job and its resources won't be freed, leading to a memory leak.
>>
>> To resolve this issue, we create a new `drm_gpu_sched_stat` that allows a
>> driver to skip the reset. This new status will indicate that the job
>> should be reinserted into the pending list, and the driver will still
>> signal its completion.
> 

[...]

>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>> index 
>> 1a7e377d4cbb4fc12ed93c548b236970217945e8..fe9043b6d43141bee831b5fc16b927202a507d51 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -389,11 +389,13 @@ struct drm_sched_job {
>>    * @DRM_GPU_SCHED_STAT_NONE: Reserved. Do not use.
>>    * @DRM_GPU_SCHED_STAT_NOMINAL: Operation succeeded.
>>    * @DRM_GPU_SCHED_STAT_ENODEV: Error: Device is not available anymore.
>> + * @DRM_GPU_SCHED_STAT_RUNNING: GPU is still running, so skip the reset.
> 
> s/GPU/job/ ?
> 
>>    */
>>   enum drm_gpu_sched_stat {
>>       DRM_GPU_SCHED_STAT_NONE,
>>       DRM_GPU_SCHED_STAT_NOMINAL,
>>       DRM_GPU_SCHED_STAT_ENODEV,
>> +    DRM_GPU_SCHED_STAT_RUNNING,
> 
> I am wondering if we could make it more obvious what is the difference 
> between "nominal" and "running" and from whose point of view should 
> those statuses be considered.
 > > So far we have "nominal" which means scheduler/hardware is working 
fine
> but the job may or may have not been cancelled. With "running" we kind 
> of split it into two sub-statuses and it would be nice for that to be 
> intuitively visible from the naming. But I struggle to suggest an 
> elegant name while preserving nominal as is.

I was thinking: how about changing DRM_GPU_SCHED_STAT_NOMINAL to
DRM_GPU_SCHED_STAT_RESET (the hardware is fine, but we reset it)?

Then, when we skip the reset, we would have DRM_GPU_SCHED_STAT_NOMINAL
(which means the hardware is fine and we didn't reset it).

I'm open to other suggestions.

> 
> Thinking out loud here - perhaps that is pointing towards an alternative 
> that instead of a new status, a new helper to re-insert the single job 
> (like drm_sched_resubmit_job(sched, job)) would fit better? Although it 
> would be more churn.
> 

Although your solution might be more elegant, I'm worried that such a
function could be used improperly by new users (e.g. being called in
contexts other than `timedout_job()`).

I'd prefer to have a new status as it'll be use solely for
`timedout_job()` (making it harder for users to use it inappropriately).
With the addition of Matthew's feedback (calling
`drm_sched_run_free_queue()` after adding the job to the pending list),
I think it makes even more sense to keep it inside the timeout function.

I hope others can chime in and give their opinions about your idea.

Best Regards,
- Maíra

> Regards,
> 
> Tvrtko
> 
>>   };
>>   /**
>>
> 

