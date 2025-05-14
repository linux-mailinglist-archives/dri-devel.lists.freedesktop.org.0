Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94831AB6744
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 11:22:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02B3A10E601;
	Wed, 14 May 2025 09:22:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="PsyVtx5k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 431FB10E600;
 Wed, 14 May 2025 09:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+xvjV0ZvkAHR6+EKITxHt18cGf4b/7h8Ucecf/qFrAc=; b=PsyVtx5kKZ1UZq8psx+rKU1+FK
 YVinzp3LhbRPRiDC1qQYVinRqKU6j0rjV5iP91PZknxsmmTD6mvCx01743vTJrxRZLiUPTFhsNRgD
 6cdXjqXPSKR9wFWB01cqVOvqcFLGKr1mSaKTRFCNpTvjftQltqTwN280lpwA74lmcm3fi4C020kFJ
 o1vRF2VhNvakkNfvvZUaczyzHtgpKNrPVn4UPZHXJ66qL5qOhVkpMq/O0wMwP3YXgJ7t/xDwm5sHX
 oy0lLwomDTnVJAGZN3IqnKcKtYrsjxiI0acCkd1SM0oQhhC0FlMV1Di8XVNT4FA46zuKIm6FxWohG
 x7+QOpPA==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uF8Dq-0084Pw-8p; Wed, 14 May 2025 11:22:01 +0200
Message-ID: <bb12359a-a6d5-43fb-8a31-3aec1dcb7a52@igalia.com>
Date: Wed, 14 May 2025 10:22:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 12/16] drm/sched: Remove idle entity from tree
To: phasta@kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>
References: <20250425102034.85133-1-tvrtko.ursulin@igalia.com>
 <20250425102034.85133-13-tvrtko.ursulin@igalia.com>
 <0d94533502890e345a08fafc00919041c2f4b80d.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <0d94533502890e345a08fafc00919041c2f4b80d.camel@mailbox.org>
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


On 12/05/2025 14:03, Philipp Stanner wrote:
> On Fri, 2025-04-25 at 11:20 +0100, Tvrtko Ursulin wrote:
>> There is no need to keep entities with no jobs in the tree so lets
>> remove
>> it once the last job is consumed. This keeps the tree smaller which
>> is
>> nicer and more efficient as entities are removed and re-added on
>> every
>> popped job.
> 
> That there is no need to do so doesn't imply that you can't keep them
> around. The commit message doesn't make the motivation clear
> 
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Philipp Stanner <phasta@kernel.org>
>> ---
>>   drivers/gpu/drm/scheduler/sched_rq.c | 24 +++++++++++++-----------
>>   1 file changed, 13 insertions(+), 11 deletions(-)
> 
> Since this doesn't simplify the code base, I think the only
> justification would be a somewhat decent performance gain. Does this
> patch result in that?
> 
> Otherwise it's probably better to keep git-blame intact here.

I needed this for one of the earlier approaches and I *think* what 
remains with the latest is just the fact it makes the run-queue contain 
only runnable entities (which makes sense and is logical; run-queue <-> 
runnable). And that rb-tree re-balancing is cheaper with smaller trees 
but in the grand scheme of things it is not something I even considered 
attempting to measure.

I will re-consider the fate of this patch once more feedback on the 
series as overall is received. Until then I don't think it makes sense 
to churn it.

Btw another angle to this, which we touched upon with Christian before 
is, if we end up not pruning the tree from unrunnable entities, then we 
could drop the drm_sched_rq->entities list. Making a handful of caller 
which walk it walk the tree instead.

Regards,

Tvrtko

>> diff --git a/drivers/gpu/drm/scheduler/sched_rq.c
>> b/drivers/gpu/drm/scheduler/sched_rq.c
>> index d477a027feb9..2cde89cf25fb 100644
>> --- a/drivers/gpu/drm/scheduler/sched_rq.c
>> +++ b/drivers/gpu/drm/scheduler/sched_rq.c
>> @@ -149,25 +149,27 @@ void drm_sched_rq_pop_entity(struct
>> drm_sched_entity *entity)
>>   {
>>   	struct drm_sched_job *next_job;
>>   	struct drm_sched_rq *rq;
>> -	ktime_t ts;
>>   
>>   	/*
>>   	 * Update the entity's location in the min heap according to
>>   	 * the timestamp of the next job, if any.
>>   	 */
>> +	spin_lock(&entity->lock);
>> +	rq = entity->rq;
>> +	spin_lock(&rq->lock);
>>   	next_job = drm_sched_entity_queue_peek(entity);
>> -	if (!next_job)
>> -		return;
>> +	if (next_job) {
>> +		ktime_t ts;
>>   
>> -	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>> -		ts = next_job->submit_ts;
>> -	else
>> -		ts = drm_sched_rq_get_rr_deadline(rq);
>> +		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>> +			ts = next_job->submit_ts;
>> +		else
>> +			ts = drm_sched_rq_get_rr_deadline(rq);
>>   
>> -	spin_lock(&entity->lock);
>> -	rq = entity->rq;
>> -	spin_lock(&rq->lock);
>> -	drm_sched_rq_update_fifo_locked(entity, rq, ts);
>> +		drm_sched_rq_update_fifo_locked(entity, rq, ts);
>> +	} else {
>> +		drm_sched_rq_remove_fifo_locked(entity, rq);
>> +	}
>>   	spin_unlock(&rq->lock);
>>   	spin_unlock(&entity->lock);
>>   }
> 

