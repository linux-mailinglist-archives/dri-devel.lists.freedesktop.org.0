Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC090BCC6C8
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 11:46:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6719010EB9F;
	Fri, 10 Oct 2025 09:46:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="H0vNVI7Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E2410EB9E;
 Fri, 10 Oct 2025 09:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7jq6ZEv53M8S2icSG09bPsLp0Hkm08Ms4LKxX3UDcc8=; b=H0vNVI7Y5npyR8GywMRIeyllBS
 rurovT/X3sF3yWva7MtNjZFRTKdQ3YjVHKAVZhK4Xvv8Dir1In6cZ5BXOGuO8Vsa0q145CzyxUrQF
 2Je5/QmqZQTU9ulrblHIyq63OQmZTkeWyz/yh/tjs10mOT/DtwLPQfjj1vmRFHaAEbiyXwj8NzTjD
 5wDPR9Nl9axqPSgelIabdkagb7xWLRdZoplPwMbchjAEywyN5R0Aw2QLP8KDN26ro2uWLk3K1WVkx
 WTkWaFbXjNv6TYiHuT4oyPb3+S6x3rcDHKh7RJlx6CRwLYv8r4ekZgogNepcLm01h9QTYcHcfBtXt
 qRwvttDQ==;
Received: from [84.66.36.92] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1v79ho-007oqd-Ji; Fri, 10 Oct 2025 11:46:32 +0200
Message-ID: <1785ebaf-776a-4717-9922-3aa0c31d0d52@igalia.com>
Date: Fri, 10 Oct 2025 10:46:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/28] drm/sched: Reverse drm_sched_rq_init arguments
To: phasta@kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>
References: <20251008085359.52404-1-tvrtko.ursulin@igalia.com>
 <20251008085359.52404-2-tvrtko.ursulin@igalia.com>
 <c6fab1fd60d1230b70b4c2bb4d37cdf20ab31f22.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <c6fab1fd60d1230b70b4c2bb4d37cdf20ab31f22.camel@mailbox.org>
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


On 10/10/2025 09:55, Philipp Stanner wrote:
> On Wed, 2025-10-08 at 09:53 +0100, Tvrtko Ursulin wrote:
>> Helper operates on the run queue so lets make that the primary argument.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Philipp Stanner <phasta@kernel.org>
>> ---
>>   drivers/gpu/drm/scheduler/sched_main.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> That's a new patch from the RFC, isn't it?
> 
> And it's a general code improvement that is not related to CFS. I think
> I mentioned it a few times already that a series is easier to review
> and workflows are simplified if generic-improvement patches are
> branched out and sent separately.
> 
> I thought you had agreed with that?

Hm not sure. My workflow is definitely easier if this work is a single 
unit throughout.

Anyway, with this change it still far from consistency, so how much of 
an improvement it brings is open to debate. The general idea is that 
functions in sched_rq.c operate on sched_rq, which is the first 
argument, and by the end of the series the second argument disappears:

void drm_sched_rq_init(struct drm_sched_rq *rq)
{
	spin_lock_init(&rq->lock);
	INIT_LIST_HEAD(&rq->entities);
	rq->rb_tree_root = RB_ROOT_CACHED;
	rq->head_prio = -1;
}

int drm_sched_init(struct drm_gpu_scheduler *sched, const struct 
drm_sched_init_args *args)
{
...
	drm_sched_rq_init(&sched->rq);

But again, even at that point the code base is still not fully 
consistent in this respect aka needs more work. Not least you recently 
asked to rename drm_sched_rq_select_entity(rq) to 
drm_sched_select_entity(sched). So maybe you disagree with this patch 
completely and would prefer drm_sched_rq_init(sched). I don't know. 
Anyway, if you r-b it is trivial to send separately and merge. Or if you 
disapprove I will just drop this patch and rebase.

Regards,

Tvrtko

>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>> index 46119aacb809..8b8c55b25762 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -174,13 +174,13 @@ void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
>>   /**
>>    * drm_sched_rq_init - initialize a given run queue struct
>>    *
>> + * @rq: scheduler run queue
>>    * @sched: scheduler instance to associate with this run queue
>> - * @rq: scheduler run queue
>>    *
>>    * Initializes a scheduler runqueue.
>>    */
>> -static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
>> -			      struct drm_sched_rq *rq)
>> +static void drm_sched_rq_init(struct drm_sched_rq *rq,
>> +			      struct drm_gpu_scheduler *sched)
>>   {
>>   	spin_lock_init(&rq->lock);
>>   	INIT_LIST_HEAD(&rq->entities);
>> @@ -1353,7 +1353,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_
>>   		sched->sched_rq[i] = kzalloc(sizeof(*sched->sched_rq[i]), GFP_KERNEL);
>>   		if (!sched->sched_rq[i])
>>   			goto Out_unroll;
>> -		drm_sched_rq_init(sched, sched->sched_rq[i]);
>> +		drm_sched_rq_init(sched->sched_rq[i], sched);
>>   	}
>>   
>>   	init_waitqueue_head(&sched->job_scheduled);
> 

