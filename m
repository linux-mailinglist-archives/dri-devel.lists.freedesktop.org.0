Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4684AAFA83
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 14:52:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DC4C10E39A;
	Thu,  8 May 2025 12:52:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="nS06MZyG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5592B10E39A;
 Thu,  8 May 2025 12:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MFGXgXVhRIMsvtkmQGMYgyfxAd9uaycap/esRlGZ1eo=; b=nS06MZyGHnra3A68B5FRn4AtR1
 Cd3pq19j82mhaAHYfWb0QsWsfLA9NRRKS3BjHEfqE6NPklGG/8BbONBp82ekODxR27Wbc3zztqhAu
 Vwcisfvmsrh2GB7Dr64L08kEOCrej+B+KjhuO/AxlUuNc2xU0KAM/l53MLjBsfAlKgn7nKhONZGtZ
 nXrkWm6ZL/+mk4QbVrci56toprJf9nIRGqhOxtpBWorqI7nWcfBz456kvx68SPDmVL10kwu+UubkW
 +T5kJemrd3fKy3s9dmW293+3cCWuumNY0DU9ExkboR55as797QPcmRUiIdUulx+osy1kmpnwAHsT+
 x1XH1H1A==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uD0eu-005Daq-FW; Thu, 08 May 2025 14:51:44 +0200
Message-ID: <a1c9c680-2927-428c-95e9-2e79d14cec58@igalia.com>
Date: Thu, 8 May 2025 13:51:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] drm/sched: Port unit tests to new cleanup design
To: phasta@kernel.org, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250424095535.26119-2-phasta@kernel.org>
 <20250424095535.26119-8-phasta@kernel.org>
 <894cf4cdb7e14b2a21dcf87bfeac4776cb695395.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <894cf4cdb7e14b2a21dcf87bfeac4776cb695395.camel@mailbox.org>
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

On 08/05/2025 12:03, Philipp Stanner wrote:
> On Thu, 2025-04-24 at 11:55 +0200, Philipp Stanner wrote:
>> The unit tests so far took care manually of avoiding memory leaks
>> that
>> might have occurred when calling drm_sched_fini().
>>
>> The scheduler now takes care by itself of avoiding memory leaks if
>> the
>> driver provides the callback
>> drm_sched_backend_ops.kill_fence_context().
>>
>> Implement that callback for the unit tests. Remove the manual cleanup
>> code.
> 
> @Tvrtko: On a scale from 1-10, how much do you love this patch? :)

Specific patch aside, it is the series as a whole I would like to be 
sure there isn't a more elegant way to achieve the same end result.

Like that sketch of a counter proposal I sent for the reasons listed 
with it. Which were, AFAIR, to avoid needing to add more state machine, 
to avoid mandating drivers have to keep an internal list, and to align 
better with the existing prototypes in the sched ops table (where 
everything operates on jobs).

Regards,

Tvrtko

>> Signed-off-by: Philipp Stanner <phasta@kernel.org>
>> ---
>>   .../gpu/drm/scheduler/tests/mock_scheduler.c  | 34 ++++++++++++-----
>> --
>>   1 file changed, 21 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
>> b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
>> index f999c8859cf7..a72d26ca8262 100644
>> --- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
>> +++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
>> @@ -228,10 +228,30 @@ static void mock_sched_free_job(struct
>> drm_sched_job *sched_job)
>>   	/* Mock job itself is freed by the kunit framework. */
>>   }
>>   
>> +static void mock_sched_fence_context_kill(struct drm_gpu_scheduler
>> *gpu_sched)
>> +{
>> +	struct drm_mock_scheduler *sched =
>> drm_sched_to_mock_sched(gpu_sched);
>> +	struct drm_mock_sched_job *job;
>> +	unsigned long flags;
>> +
>> +	spin_lock_irqsave(&sched->lock, flags);
>> +	list_for_each_entry(job, &sched->job_list, link) {
>> +		spin_lock(&job->lock);
>> +		if (!dma_fence_is_signaled_locked(&job->hw_fence)) {
>> +			dma_fence_set_error(&job->hw_fence, -
>> ECANCELED);
>> +			dma_fence_signal_locked(&job->hw_fence);
>> +		}
>> +		complete(&job->done);
>> +		spin_unlock(&job->lock);
>> +	}
>> +	spin_unlock_irqrestore(&sched->lock, flags);
>> +}
>> +
>>   static const struct drm_sched_backend_ops drm_mock_scheduler_ops = {
>>   	.run_job = mock_sched_run_job,
>>   	.timedout_job = mock_sched_timedout_job,
>> -	.free_job = mock_sched_free_job
>> +	.free_job = mock_sched_free_job,
>> +	.kill_fence_context = mock_sched_fence_context_kill,
>>   };
>>   
>>   /**
>> @@ -300,18 +320,6 @@ void drm_mock_sched_fini(struct
>> drm_mock_scheduler *sched)
>>   		drm_mock_sched_job_complete(job);
>>   	spin_unlock_irqrestore(&sched->lock, flags);
>>   
>> -	/*
>> -	 * Free completed jobs and jobs not yet processed by the DRM
>> scheduler
>> -	 * free worker.
>> -	 */
>> -	spin_lock_irqsave(&sched->lock, flags);
>> -	list_for_each_entry_safe(job, next, &sched->done_list, link)
>> -		list_move_tail(&job->link, &list);
>> -	spin_unlock_irqrestore(&sched->lock, flags);
>> -
>> -	list_for_each_entry_safe(job, next, &list, link)
>> -		mock_sched_free_job(&job->base);
>> -
>>   	drm_sched_fini(&sched->base);
>>   }
>>   
> 

