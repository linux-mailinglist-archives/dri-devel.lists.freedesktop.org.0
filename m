Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BC1A17A70
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 10:46:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DE1E10E524;
	Tue, 21 Jan 2025 09:46:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="HWBm53th";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7856010E1D6;
 Tue, 21 Jan 2025 09:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZBIFSq4Ue2OztPt2h/3mKl5i1AG1MFvW5Zo18rsl06Q=; b=HWBm53th4IwpQ/PypOJ/EDgEH6
 cE76CFBeWG/abK/aZVhfhY07Tiuc5ujlsDmJoFRtDuLC3IPq8FwOTO7BsAfwSVQzPBcIlxhNwvInt
 VxDDp0iUSCLJlZ8Oz97PMKh2ZMobAU7ePCx9JDWd72xkMIyf4TLhmifpOn0MJYnKIJkiqmWSYHbwA
 ip04pc9pb6zi3aDkJe2/TmlJ8aq/ArPqWTYSxwOdygYzxUpIQU3ge3C8VlWZSFcGk7yVroQQm5K2E
 5B4O57ac0echLge8fCZ7g+Ehznk7pvBDy1UozceuBjc3Y1S1xZ+FCvjBHGZ8kBRPplAmyFqkFler3
 cyujYpXg==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1taApZ-0002EK-Ha; Tue, 21 Jan 2025 10:45:57 +0100
Message-ID: <05d2f9f5-a966-4cf0-9848-ed541fbdb2a8@igalia.com>
Date: Tue, 21 Jan 2025 09:45:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/sched: Remove to_drm_sched_job internal helper
To: Danilo Krummrich <dakr@kernel.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
References: <20250120165240.9105-1-tvrtko.ursulin@igalia.com>
 <20250120165240.9105-4-tvrtko.ursulin@igalia.com> <Z46FQw2swGX4yD5i@pollux>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <Z46FQw2swGX4yD5i@pollux>
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


On 20/01/2025 17:17, Danilo Krummrich wrote:
> On Mon, Jan 20, 2025 at 04:52:39PM +0000, Tvrtko Ursulin wrote:
>> The code assumes queue node is the first element in struct
>> drm_sched_job.
> 
> I'd add that this assumption lies in doing the NULL check after the
> container_of(). Without saying that, it might not be that obvious.

Good point, I only put the full explanation in the cover letter.

>> Since this is not documented it can be very fragile so lets
>> just remove the internal helper and explicitly check for "nothing
>> dequeued", before converting the node to a sched job.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Philipp Stanner <phasta@kernel.org>
>> ---
>>   drivers/gpu/drm/scheduler/sched_entity.c | 18 +++++++++---------
>>   drivers/gpu/drm/scheduler/sched_main.c   | 10 +++++-----
>>   2 files changed, 14 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>> index 7c0d266a89ef..8992bb432ec6 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -30,9 +30,6 @@
>>   
>>   #include "gpu_scheduler_trace.h"
>>   
>> -#define to_drm_sched_job(sched_job)		\
>> -		container_of((sched_job), struct drm_sched_job, queue_node)
>> -
>>   /**
>>    * drm_sched_entity_init - Init a context entity used by scheduler when
>>    * submit to HW ring.
>> @@ -476,11 +473,14 @@ drm_sched_job_dependency(struct drm_sched_job *job,
>>   struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>>   {
>>   	struct drm_sched_job *sched_job;
>> +	struct spsc_node *node;
>>   
>> -	sched_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
>> -	if (!sched_job)
>> +	node = spsc_queue_peek(&entity->job_queue);
>> +	if (!node)
>>   		return NULL;
>>   
>> +	sched_job = container_of(node, typeof(*sched_job), queue_node);
> 
> So, here you have this pattern for a valid used case and even twice. I think you
> should add drm_sched_entity_peek_job() instead and document what the
> preconditions are to be allowed to peek given it's an spsc queue.

I thought about it but would have to put the declaration into 
gpu_scheduler.h so I thought it would be a bit better like this. Since 
gpu_scheduler.h in the ideal world should contain as little as possible 
things which individual drivers should not use. And I see from your 
comment on 1/4 that you think the same (just that one was in effect 
documenting the current state of things).

What if I add a new header file local to driver/gpu/drm/scheduler for 
internal API?

Regards,

Tvrtko

>> +
>>   	while ((entity->dependency =
>>   			drm_sched_job_dependency(sched_job, entity))) {
>>   		trace_drm_sched_job_wait_dep(sched_job, entity->dependency);
>> @@ -511,10 +511,10 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>>   	 * the timestamp of the next job, if any.
>>   	 */
>>   	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO) {
>> -		struct drm_sched_job *next;
>> -
>> -		next = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
>> -		if (next) {
>> +		node = spsc_queue_peek(&entity->job_queue);
>> +		if (node) {
>> +			struct drm_sched_job *next =
>> +				container_of(node, typeof(*next), queue_node);
>>   			struct drm_sched_rq *rq;
>>   
>>   			spin_lock(&entity->lock);
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>> index a48be16ab84f..66eee6372253 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -87,9 +87,6 @@ static struct lockdep_map drm_sched_lockdep_map = {
>>   };
>>   #endif
>>   
>> -#define to_drm_sched_job(sched_job)		\
>> -		container_of((sched_job), struct drm_sched_job, queue_node)
>> -
>>   int drm_sched_policy = DRM_SCHED_POLICY_FIFO;
>>   
>>   /**
>> @@ -122,11 +119,14 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
>>   				struct drm_sched_entity *entity)
>>   {
>>   	struct drm_sched_job *s_job;
>> +	struct spsc_node *node;
>>   
>> -	s_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
>> -	if (!s_job)
>> +	node = spsc_queue_peek(&entity->job_queue);
>> +	if (!node)
>>   		return false;
>>   
>> +	s_job = container_of(node, typeof(*s_job), queue_node);
>> +
>>   	/* If a job exceeds the credit limit, truncate it to the credit limit
>>   	 * itself to guarantee forward progress.
>>   	 */
>> -- 
>> 2.47.1
>>
