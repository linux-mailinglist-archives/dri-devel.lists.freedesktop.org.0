Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D24AB39E6
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 16:00:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C45710E423;
	Mon, 12 May 2025 14:00:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="cyWCEN/F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4CF610E42C;
 Mon, 12 May 2025 14:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CT/INSm43oaHzi76xEBP3/56/mExLc1uyM0zE8TBYCA=; b=cyWCEN/FDjFE5kwntL1OA6XmuV
 L8NpGd8lyBQ/3jU5OjVAxtx1VYH9dQS1laThP+jSQ0q9hGgEHl8veSw+y1n5mU/+d5QMOs6nfeFhX
 DjK6qL3JQFV6gKFtv3EQPnMlTRbjIxqnoSCbv6ljfxWke6N5mINra43ovzJQvkzezqjYff9uo9wsO
 y+P0tXC86Z/HcQjsou0J/oHrYAtN2mG6V/iOZdQpRuRMOyai+ojudFFtVO9Bb49X8rhdbN49So6re
 Dq5xWUdCVQxh0cz+D6qCmKi9n1kaXHTX0EOplTMDRyxsToWGP024t4gshWMHY4TN2jocNfwuHjdUv
 ssLuC6UA==;
Received: from [189.7.87.163] (helo=[192.168.0.7])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uETbo-0076rD-At; Mon, 12 May 2025 15:59:41 +0200
Message-ID: <ee449d95-27c8-4f0c-919e-2939cbe5b2cc@igalia.com>
Date: Mon, 12 May 2025 10:59:33 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] drm/sched: Allow drivers to skip the reset and keep
 on running
To: phasta@kernel.org, Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <mwen@igalia.com>, Lucas Stach <l.stach@pengutronix.de>,
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
 <82495d71bf97fbf6970ba6b016b3a121fc4b84f2.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <82495d71bf97fbf6970ba6b016b3a121fc4b84f2.camel@mailbox.org>
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

On 12/05/25 08:04, Philipp Stanner wrote:
> On Sat, 2025-05-03 at 17:59 -0300, Maíra Canal wrote:
>> When the DRM scheduler times out, it's possible that the GPU isn't
>> hung;
>> instead, a job may still be running, and there may be no valid reason
>> to
>> reset the hardware. This can occur in two situations:
>>
>>    1. The GPU exposes some mechanism that ensures the GPU is still
>> making
>>       progress. By checking this mechanism, we can safely skip the
>> reset,
>>       rearm the timeout, and allow the job to continue running until
>>       completion. This is the case for v3d and Etnaviv.
> 
> Who is "we" and where is the reset skipped? In the timedout_job()
> callback?

"we" is just a generic way to say "we, the driver developers". The reset
is skipped in the `timedout_job()` callback.

> 
>>    2. TDR has fired before the IRQ that signals the fence.
> 
> Any concern about saying "Timeout" instead of "TDR"? I think most of us
> aren't familiar with that acronym.

I'll use "Timeout" in v2.

> 
>> Consequently,
>>       the job actually finishes, but it triggers a timeout before
>> signaling
>>       the completion fence.
> 
> That formulation doesn't seem correct. Once the timeout fired, the job,
> as far as the GPU is concerned, is already finished, isn't it?

Yes, but there is a race-condition between the IRQ handler (which will
indeed signal the fence) and timeout handler.

> 
> What is the "completion fence"? In the scheduler, we call the fence
> returned by backend_ops.run_job() the "hardware fence".
 > > And who is the "it" in "it triggers a timeout"? I assume you want to
> say "the job has actually finished, but the scheduler triggers a
> timeout anyways".
> 

I'll address it in v2.

> 
> Also the purpose of that list is a bit unclear to me. It seems to be a
> list of problems, but point 1 seems valid?
> 

Point 2 is also valid, otherwise Xe, Panfrost, Lima, and Etnaviv
wouldn't have to handle this situation. TDR can "win" the race-condition
and although the hardware fence will be signaled in the IRQ handler, the
job won't be freed.

> 
>>
>> These two scenarios are problematic because we remove the job from
>> the
>> `sched->pending_list` before calling `sched->ops->timedout_job()`.
> 
> Who is "we"? :)

Ditto.

> 
> 
>> This
>> means that when the job finally signals completion (e.g. in the IRQ
>> handler),
> 
> A job doesn't signal completion.
> 
> The hardware / driver signals job completion by signaling the hardware
> fence.

I'll address it in v2.

> 
>>   the scheduler won't call `sched->ops->free_job()`. As a result,
>> the job and its resources won't be freed, leading to a memory leak.
> 
> OK, I think I get it. But isn't another explanation of the issue that
> the driver callback doesn't take care of cleaning up the job that has
> timed out (from the scheduler's perspective)?
> 
> It's not clear to me that the scheduler actually contains a bug here,
> but rather is designed in a way that doesn't consider that some GPUs
> have special timeout requirements or, rather, can have bursts of
> slowness that don't actually indicate a timeout.
> 
> I think the commit message should be very clear about whether this is
> an improvement of a design weakness or an actual bug fix.
> 
>>
>> To resolve this issue, we create a new `drm_gpu_sched_stat` that
>> allows a
>> driver to skip the reset. This new status will indicate that the job
>> should be reinserted into the pending list, and the driver will still
>> signal its completion.
> 
> Hmm, yes, I think that this is the right way to address that problem.
> +1
> 
> 
>>
>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>> ---
>>   drivers/gpu/drm/scheduler/sched_main.c | 14 ++++++++++++++
>>   include/drm/gpu_scheduler.h            |  2 ++
>>   2 files changed, 16 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>> b/drivers/gpu/drm/scheduler/sched_main.c
>> index
>> 829579c41c6b5d8b2abce5ad373c7017469b7680..68ca827d77e32187a034309f881
>> 135dbc639a9b4 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -568,6 +568,17 @@ static void drm_sched_job_timedout(struct
>> work_struct *work)
>>   			job->sched->ops->free_job(job);
>>   			sched->free_guilty = false;
>>   		}
>> +
>> +		/*
>> +		 * If the driver indicated that the GPU is still
>> running and wants to skip
>> +		 * the reset, reinsert the job back into the pending
>> list and realarm the
>> +		 * timeout.
>> +		 */
>> +		if (status == DRM_GPU_SCHED_STAT_RUNNING) {
>> +			spin_lock(&sched->job_list_lock);
>> +			list_add(&job->list, &sched->pending_list);
>> +			spin_unlock(&sched->job_list_lock);
>> +		}
>>   	} else {
>>   		spin_unlock(&sched->job_list_lock);
>>   	}
>> @@ -590,6 +601,9 @@ static void drm_sched_job_timedout(struct
>> work_struct *work)
>>    * This function is typically used for reset recovery (see the docu
>> of
>>    * drm_sched_backend_ops.timedout_job() for details). Do not call it
>> for
>>    * scheduler teardown, i.e., before calling drm_sched_fini().
>> + *
>> + * As it's used for reset recovery, drm_sched_stop() shouldn't be
>> called
>> + * if the scheduler skipped the timeout (DRM_SCHED_STAT_RUNNING).
> 
> The same comment then applies to the counterpart, drm_sched_start().
> 

Thanks for your review! I'll address all your comments in v2.

Best Regards,
- Maíra

> We might also want to look into who uses drm_sched_wqueue_{start,stop}
> and consider if they need a comment. Though I don't expect you to do
> that. Those functions are hacky legacy anyways.
> 
> 
> P.
> 
>>    */
>>   void drm_sched_stop(struct drm_gpu_scheduler *sched, struct
>> drm_sched_job *bad)
>>   {
>> diff --git a/include/drm/gpu_scheduler.h
>> b/include/drm/gpu_scheduler.h
>> index
>> 1a7e377d4cbb4fc12ed93c548b236970217945e8..fe9043b6d43141bee831b5fc16b
>> 927202a507d51 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -389,11 +389,13 @@ struct drm_sched_job {
>>    * @DRM_GPU_SCHED_STAT_NONE: Reserved. Do not use.
>>    * @DRM_GPU_SCHED_STAT_NOMINAL: Operation succeeded.
>>    * @DRM_GPU_SCHED_STAT_ENODEV: Error: Device is not available
>> anymore.
>> + * @DRM_GPU_SCHED_STAT_RUNNING: GPU is still running, so skip the
>> reset.
>>    */
>>   enum drm_gpu_sched_stat {
>>   	DRM_GPU_SCHED_STAT_NONE,
>>   	DRM_GPU_SCHED_STAT_NOMINAL,
>>   	DRM_GPU_SCHED_STAT_ENODEV,
>> +	DRM_GPU_SCHED_STAT_RUNNING,
>>   };
>>   
>>   /**
>>
> 

