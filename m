Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D8D9734BB
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 12:42:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC64210E77D;
	Tue, 10 Sep 2024 10:42:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="eJudvsXg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4541810E77D;
 Tue, 10 Sep 2024 10:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+ern+g8VHenIdQW3vyJYNFpEsABvBXBRXXdLmG7Ret4=; b=eJudvsXgUXDL4u04/1nObxusYr
 PQ3bga7Ebq4KA9+Bq4QG1xOIuJmr3piq24rAuvxCOtp4/g1qEIS/ni/hpLsUOunFjViyimmSyhb1l
 4UYdK/egEXth6VHu0hoelgKuprikj7Zjj7yi0JpSCxNKrlO0WAVxlBlWAzi1rfHd+yIr7F0lJjbjs
 Jx9KrRw9HSDmJkVBQI9BHBq6FltrtPlPyc/U6UvlkctaMEoYZqLTA0He1oOaJuKPMyw7b4VQhMG+R
 YvCkjB0yi9ibq7U2AGlijmFcb7GKj1jKa6yvAAMioLWgeeQ7jpFdQlM5DW6/6wxvuWhh7WYBlOXDt
 9wIFhxWQ==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1snyKD-00C0b9-Aj; Tue, 10 Sep 2024 12:42:21 +0200
Message-ID: <abe23963-4cd8-486c-b405-ef3504dd106c@igalia.com>
Date: Tue, 10 Sep 2024 11:42:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] drm/sched: Re-order struct drm_sched_rq members for
 clarity
To: Philipp Stanner <pstanner@redhat.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Luben Tuikov
 <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>
References: <20240909171937.51550-1-tursulin@igalia.com>
 <20240909171937.51550-7-tursulin@igalia.com>
 <9dd486a94717c51ec9dfcea648a98487b68a7385.camel@redhat.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <9dd486a94717c51ec9dfcea648a98487b68a7385.camel@redhat.com>
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


On 10/09/2024 11:05, Philipp Stanner wrote:
> On Mon, 2024-09-09 at 18:19 +0100, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>
>> Lets re-order the members to make it clear which are protected by the
>> lock
>> and at the same time document it via kerneldoc.
> 
> I'd prefer if commit messages follow the idiomatic kernel style of that
> order:
>     1. Describe the current situation
>     2. State why it's bad or undesirable
>     3. (describe the solution)
>     4. Conclude commit message through sentences in imperative stating
>        what the commit does.
> 
> In this case I would go for:
> "struct drm_sched_rq contains a spinlock that protects several struct
> members. The current documentation incorrectly states that this lock
> only guards the entities list. In truth, it guards that list, the
> rb_tree and the current entity.
> 
> Document what the lock actually guards. Rearrange struct members so
> that this becomes even more visible."

IMO a bit much to ask for a text book format, for a trivial patch, when 
all points are already implicitly obvious. That is "lets make it clear" 
= current situation is not clear -> obviously bad with no need to 
explain; "and the same time document" = means it is currently not 
documented -> again obviously not desirable.

But okay, since I agree with the point below (*), I can explode the text 
for maximum redundancy.

>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: Luben Tuikov <ltuikov89@gmail.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Philipp Stanner <pstanner@redhat.com>
>> ---
>>   include/drm/gpu_scheduler.h | 10 ++++++----
>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/include/drm/gpu_scheduler.h
>> b/include/drm/gpu_scheduler.h
>> index a06753987d93..d4a3ba333568 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -243,10 +243,10 @@ struct drm_sched_entity {
>>   /**
>>    * struct drm_sched_rq - queue of entities to be scheduled.
>>    *
>> - * @lock: to modify the entities list.
>>    * @sched: the scheduler to which this rq belongs to.
>> - * @entities: list of the entities to be scheduled.
>> + * @lock: protects the list, tree and current entity.
> 
> Would be more consistent with the below comment if you'd address them
> with their full name, aka "protects @entities, @rb_tree_root and
> @current_entity".

*) this one I agree with.

Regards,

Tvrtko

> 
> Thanks,
> P.
> 
> 
>>    * @current_entity: the entity which is to be scheduled.
>> + * @entities: list of the entities to be scheduled.
>>    * @rb_tree_root: root of time based priory queue of entities for
>> FIFO scheduling
>>    *
>>    * Run queue is a set of entities scheduling command submissions for
>> @@ -254,10 +254,12 @@ struct drm_sched_entity {
>>    * the next entity to emit commands from.
>>    */
>>   struct drm_sched_rq {
>> - spinlock_t lock;
>>    struct drm_gpu_scheduler *sched;
>> - struct list_head entities;
>> +
>> + spinlock_t lock;
>> + /* Following members are protected by the @lock: */
>>    struct drm_sched_entity *current_entity;
>> + struct list_head entities;
>>    struct rb_root_cached rb_tree_root;
>>   };
>>   
> 
