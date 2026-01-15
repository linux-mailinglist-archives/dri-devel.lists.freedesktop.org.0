Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E0DD231D2
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 09:29:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 113BC10E6D6;
	Thu, 15 Jan 2026 08:29:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="f28IW+Cv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C99710E6D3;
 Thu, 15 Jan 2026 08:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5uMlpcJyCXwB6+skuQb61mTYya2pwG9DB/So1FWSFB8=; b=f28IW+CvsVaZ1h145FVCQw2HuI
 GnK9YSKrx6/Rxgux5n73UbKIqFJjqOtl3JQm+FQeOSgyMveaMC1PP95Gmb+frsTJc8VBv1ljyuMry
 5QYmHos2XfV0r1REM4mm3jErQYqjwhPGANZrbuMaFpRsQSW3wr4/oaD5bGym961PQnXHoWwdGh5DC
 KMjisbjPfHihqYIdjQ6FL+1D7FWH1cK//2ZDLxeVK79xVFlzvbHVN4HWcThglhTlKtZGTCP1SukeH
 sw9CcczdbANqXT/U9NwdKOjNeSaPZ+/IGvz+Ho+aL1CVpwAZ1Xrk79xq0zUdQ3N4/SLqtEM9+f2+P
 KizP5zlg==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vgIix-005e1F-Tf; Thu, 15 Jan 2026 09:28:59 +0100
Message-ID: <1fceb644-ff22-45c8-bd83-4a32786c35f2@igalia.com>
Date: Thu, 15 Jan 2026 08:28:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/28] drm/sched: Add fair scheduling policy
To: Danilo Krummrich <dakr@kernel.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
References: <20251219135351.25880-1-tvrtko.ursulin@igalia.com>
 <20251219135351.25880-10-tvrtko.ursulin@igalia.com>
 <DFONORJMB1ZM.1JHSIXB9ULHJV@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <DFONORJMB1ZM.1JHSIXB9ULHJV@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 14/01/2026 22:13, Danilo Krummrich wrote:
> On Fri Dec 19, 2025 at 2:53 PM CET, Tvrtko Ursulin wrote:
>> diff --git a/drivers/gpu/drm/scheduler/sched_rq.c b/drivers/gpu/drm/scheduler/sched_rq.c
>> index 2d1f579d8352..2fde309d02a6 100644
>> --- a/drivers/gpu/drm/scheduler/sched_rq.c
>> +++ b/drivers/gpu/drm/scheduler/sched_rq.c
>> @@ -16,6 +16,35 @@ drm_sched_entity_compare_before(struct rb_node *a, const struct rb_node *b)
>>   	return ktime_before(ea->oldest_job_waiting, eb->oldest_job_waiting);
>>   }
>>   
>> +static void drm_sched_rq_update_prio(struct drm_sched_rq *rq)
>> +{
>> +	enum drm_sched_priority prio = DRM_SCHED_PRIORITY_INVALID;
>> +	struct rb_node *rb;
>> +
>> +	lockdep_assert_held(&rq->lock);
>> +
>> +	rb = rb_first_cached(&rq->rb_tree_root);
>> +	if (rb) {
>> +		struct drm_sched_entity *entity =
>> +			rb_entry(rb, typeof(*entity), rb_tree_node);
>> +
>> +		/*
>> +		 * The normal locking order is entity then run-queue so taking
>> +		 * the entity lock here would be a locking inversion for the
>> +		 * case when the current head of the run-queue is different from
>> +		 * the one we already have locked. The unlocked read is fine
>> +		 * though, because if the priority had just changed it is no big
>> +		 * deal for our algorithm, but just a transient reachable only
>> +		 * by drivers with userspace dynamic priority changes API. Equal
>> +		 * in effect to the priority change becoming visible a few
>> +		 * instructions later.
>> +		 */
>> +		prio = READ_ONCE(entity->priority);
> 
> I still think that we should address the root cause of the lock inversion
> problem instead.
> 
> I previously mentioned that I can take a look at this beginning of this year,
> which I can do soon.
> 
> In the meantime, can you please explain what's the problem with this specific
> case? This function is only ever called from drm_sched_rq_remove_fifo_locked()
> and drm_sched_rq_update_fifo_locked(), which already seem to hold both locks.

The entity which is locked is likely not the same as entity at the head 
of the run-queue from either call chains.

In one case we have just removed the locked entity from the run-queue, 
while in the other tree has been re-balanced so a different entity may 
have taken the head position.

Also to note is 99% of cases entity->priority is invariant. Only amdgpu 
allows for change of priority post entity creation. So for the rest 
locking would not gain anything.

Even for amdgpu the unlocked read is not very relevant, since the only 
thing this is used is to determine the run-queue insertion position of a 
re-joining entity. So worst thing that could happen, if userspace thread 
would race set priority with the job worker picking the next job, is to 
*one time* pick a different job.

Also to address the root cause of the lock inversion would IMHO be to 
re-design the whole scheduler and this specific function here does not 
seem should be the trigger for that.

Regards,

Tvrtko

>> +	}
>> +
>> +	rq->head_prio = prio;
>> +}
>> +
>>   static void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *entity,
>>   					    struct drm_sched_rq *rq)
>>   {
>> @@ -25,6 +54,7 @@ static void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *entity,
>>   	if (!RB_EMPTY_NODE(&entity->rb_tree_node)) {
>>   		rb_erase_cached(&entity->rb_tree_node, &rq->rb_tree_root);
>>   		RB_CLEAR_NODE(&entity->rb_tree_node);
>> +		drm_sched_rq_update_prio(rq);
>>   	}
>>   }
>>   
>> @@ -46,6 +76,7 @@ static void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
>>   
>>   	rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
>>   		      drm_sched_entity_compare_before);
>> +	drm_sched_rq_update_prio(rq);
>>   }

