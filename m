Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A328BAB66AF
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 11:00:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF8F010E406;
	Wed, 14 May 2025 09:00:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="BOx+tBig";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C70F10E3CE;
 Wed, 14 May 2025 09:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lJdg20ozelse5JeC2xYfOfqoPfnhVG+nWl3aKixa+sM=; b=BOx+tBigY9mMdJBVscCQmCfeqQ
 zrpM4AkmB+8T/dMIq0gmZLSju8gBBcoGcjLvM2t+f/3d2o/u9IEZbVRdmGedO0H3QqPxPVLcRzp4b
 Z8KgBgd691WOQ1KYYJExc+djCJbf5gbcOruvRwuvI84/s+Q8R8sXCnaotISYELKIK3ZBXZWrNTn5l
 +b9CknZzFPVlS4pYGC3TVqA49uxpDk2ZDuuA98AHtJEwDGpDENCduYun1jKARUW2luReAi3air8h2
 cDgi//d3AcV77soOYjTi+3amsJJJQs6aq5XBjGpTIc4urEkPETFmMM7Q0jujTTsPsZVgWSLZv+Bsb
 ksjSlePA==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uF7st-0083wb-67; Wed, 14 May 2025 11:00:22 +0200
Message-ID: <df07237c-455e-408f-a94b-7404a6310906@igalia.com>
Date: Wed, 14 May 2025 10:00:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 10/16] drm/sched: Free all finished jobs at once
To: phasta@kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>
References: <20250425102034.85133-1-tvrtko.ursulin@igalia.com>
 <20250425102034.85133-11-tvrtko.ursulin@igalia.com>
 <be814eed623a1b99f7ec5246fbe177213d763fdf.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <be814eed623a1b99f7ec5246fbe177213d763fdf.camel@mailbox.org>
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


On 12/05/2025 13:56, Philipp Stanner wrote:
> On Fri, 2025-04-25 at 11:20 +0100, Tvrtko Ursulin wrote:
>> To implement fair scheduling we will need as accurate as possible
>> view
>> into per entity GPU time utilisation. Because sched fence execution
>> time
>> are only adjusted for accuracy in the free worker we need to process
>> completed jobs as soon as possible so the metric is most up to date
>> when
>> view from the submission side of things.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Philipp Stanner <phasta@kernel.org>
>> ---
>>   drivers/gpu/drm/scheduler/sched_main.c | 15 ++-------------
>>   1 file changed, 2 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>> b/drivers/gpu/drm/scheduler/sched_main.c
>> index 8950c7705f57..22428a1569dd 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -865,13 +865,12 @@ drm_sched_select_entity(struct
>> drm_gpu_scheduler *sched)
>>    * drm_sched_get_finished_job - fetch the next finished job to be
>> destroyed
>>    *
>>    * @sched: scheduler instance
>> - * @have_more: are there more finished jobs on the list
>>    *
>>    * Returns the next finished job from the pending list (if there is
>> one)
>>    * ready for it to be destroyed.
>>    */
>>   static struct drm_sched_job *
>> -drm_sched_get_finished_job(struct drm_gpu_scheduler *sched, bool
>> *have_more)
>> +drm_sched_get_finished_job(struct drm_gpu_scheduler *sched)
>>   {
>>   	struct drm_sched_job *job, *next;
>>   
>> @@ -886,7 +885,6 @@ drm_sched_get_finished_job(struct
>> drm_gpu_scheduler *sched, bool *have_more)
>>   		/* cancel this job's TO timer */
>>   		cancel_delayed_work(&sched->work_tdr);
>>   
>> -		*have_more = false;
>>   		next = list_first_entry_or_null(&sched-
>>> pending_list,
>>   						typeof(*next),
>> list);
>>   		if (next) {
>> @@ -896,10 +894,6 @@ drm_sched_get_finished_job(struct
>> drm_gpu_scheduler *sched, bool *have_more)
>>   				next->s_fence->scheduled.timestamp =
>>   					dma_fence_timestamp(&job-
>>> s_fence->finished);
>>   
>> -			if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
>> -				     &next->s_fence-
>>> finished.flags))
>> -				*have_more = true;
>> -
>>   			/* start TO timer for next job */
>>   			drm_sched_start_timeout(sched);
>>   		}
>> @@ -958,14 +952,9 @@ static void drm_sched_free_job_work(struct
>> work_struct *w)
>>   	struct drm_gpu_scheduler *sched =
>>   		container_of(w, struct drm_gpu_scheduler,
>> work_free_job);
>>   	struct drm_sched_job *job;
>> -	bool have_more;
>>   
>> -	job = drm_sched_get_finished_job(sched, &have_more);
>> -	if (job) {
>> +	while ((job = drm_sched_get_finished_job(sched)))
>>   		sched->ops->free_job(job);
>> -		if (have_more)
>> -			__drm_sched_run_free_queue(sched);
>> -	}
> 
> Are there any have_more users left after that?
> 
> Removing here what was added before IMO makes it more questionable
> adding that improvement in the first place.

Yep, it is definitely not typical to add and then remove stuff in the 
same series. Reason is series was not intended (or expected) to get 
accepted as one. I was expecting easy cleanups to get in fast and the 
rest to keep iterating for who knows how long.

Regards,

Tvrtko

