Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEBAB536EF
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 17:06:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 922F210E3A4;
	Thu, 11 Sep 2025 15:06:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="pN3YRm9Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AE6410E37F;
 Thu, 11 Sep 2025 15:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ajC4dQK2/Z8OcvEI4k5f3pswXG9oWpmzoRH7wWNHtSU=; b=pN3YRm9Q9DKFodCI8NUj5xvfr4
 JVg8wehWpGFzZLyY5TygEkI7eeKtLeKwPdQLjqImx1NuDHE7n9kLSHTZy+7wNLiAXe078vRk0P8c7
 CNVEWXwqA4mK1r+fF4pwrz4rfQXyqTKcqvjMpu3KXekNi2uYkLEJeO0RuHoaL2iTaEb6mE7F4RDFr
 Vn5sPaGLmNpbewTXw4oAa8xGENifKzxRQaAmjtF5lBToYtBrKyO2WSY4/ByvhyQsvIoPYum0DbpCa
 vomT6uzM4LXlieQVBCNxiDSGRy7ppGJ1z1ihiEopYxrGHy0Vsr3cPTHIx8NOkCL76HRq4tOxwxRzz
 K0RJ/XFw==;
Received: from [84.66.36.92] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uwisS-009r8Z-CI; Thu, 11 Sep 2025 17:06:24 +0200
Message-ID: <2e18f226-068c-4986-b203-144b6bdb0a7f@igalia.com>
Date: Thu, 11 Sep 2025 16:06:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v8 08/12] drm/sched: Remove idle entity from tree
To: phasta@kernel.org, dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>
References: <20250903101820.63032-1-tvrtko.ursulin@igalia.com>
 <20250903101820.63032-9-tvrtko.ursulin@igalia.com>
 <2f17fb5d359c1ddaf8253454bf0f0d318c90bc8d.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <2f17fb5d359c1ddaf8253454bf0f0d318c90bc8d.camel@mailbox.org>
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


On 11/09/2025 15:32, Philipp Stanner wrote:
> On Wed, 2025-09-03 at 11:18 +0100, Tvrtko Ursulin wrote:
>> There is no need to keep entities with no jobs in the tree so lets remove
>> it once the last job is consumed. This keeps the tree smaller which is
>> nicer and more efficient as entities are removed and re-added on every
>> popped job.
> 
> This reads suspiciously as if it could be an independent patch, not
> necessarily tied to this series. I see it depends on the _pop()
> function you added.
> 
> I think you'd want to make it a bit more obvious that this is not so
> much a general improvement as it is a preparation for followup work. Or
> could it be made generic for the current in-tree scheduler?

Both is true. There is currently no reason idle entities _need_ to be in 
the tree. Removing them would improve O(log n) on the rbtree. But also 
fair scheduler relies on it, see below...

>> Apart from that, the upcoming fair scheduling algorithm will rely on the
>> tree only containing runnable entities.

... ^^^ here.

>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Philipp Stanner <phasta@kernel.org>
>> ---
>>   drivers/gpu/drm/scheduler/sched_rq.c | 28 +++++++++++++++++-----------
>>   1 file changed, 17 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_rq.c b/drivers/gpu/drm/scheduler/sched_rq.c
>> index 16d57461765e..67804815ca0d 100644
>> --- a/drivers/gpu/drm/scheduler/sched_rq.c
>> +++ b/drivers/gpu/drm/scheduler/sched_rq.c
>> @@ -19,6 +19,9 @@ drm_sched_entity_compare_before(struct rb_node *a, const struct rb_node *b)
>>   static void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *entity,
>>   					    struct drm_sched_rq *rq)
>>   {
>> +	lockdep_assert_held(&entity->lock);
>> +	lockdep_assert_held(&rq->lock);
> 
> The callers of drm_sched_rq_remove_fifo_locked() already have some
> lockdep asserts, have you seen them? Are those here redundant /
> additional?
> 
> And are they strictly related to this patch?

Yes, drm_sched_rq_pop_entity() is the new caller, which needs to take 
both locks on its own. So IMO makes sense to add the asserts.

> Maybe you want to investigate the other lockdep assertions and, if
> there's room for improvement, address that in a dedicated patch.

They look okay to me. Are you seeing something is off?

Regards,

Tvrtko

>> +
>>   	if (!RB_EMPTY_NODE(&entity->rb_tree_node)) {
>>   		rb_erase_cached(&entity->rb_tree_node, &rq->rb_tree_root);
>>   		RB_CLEAR_NODE(&entity->rb_tree_node);
>> @@ -158,24 +161,27 @@ void drm_sched_rq_pop_entity(struct drm_sched_entity *entity)
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
>> -	spin_lock(&entity->lock);
>> -	rq = entity->rq;
>> -	spin_lock(&rq->lock);
>> -	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>> -		ts = next_job->submit_ts;
>> -	else
>> -		ts = drm_sched_rq_get_rr_ts(rq, entity);
>> -	drm_sched_rq_update_fifo_locked(entity, rq, ts);
>> +		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>> +			ts = next_job->submit_ts;
>> +		else
>> +			ts = drm_sched_rq_get_rr_ts(rq, entity);
>> +
>> +		drm_sched_rq_update_fifo_locked(entity, rq, ts);
>> +	} else {
>> +		drm_sched_rq_remove_fifo_locked(entity, rq);
>> +	}
>>   	spin_unlock(&rq->lock);
>>   	spin_unlock(&entity->lock);
>>   }
> 

