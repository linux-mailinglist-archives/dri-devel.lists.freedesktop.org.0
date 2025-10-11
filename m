Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F29D9BCF5A6
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 15:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 522D410E300;
	Sat, 11 Oct 2025 13:21:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="rWhmKISl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A73CC10E300;
 Sat, 11 Oct 2025 13:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ktHk4uy+4BRURsC4B3L5WeYP6RqGkOpOO0/4VDh9QFE=; b=rWhmKISl7oifNuKEXFu8IyKTf0
 S/nVj+TCPD3yxdsHBOURnylwPSsBnZHRhfFP0mKRnqybwKf8GRFJmscaAim5+0z5XaI38X3bxdqyA
 ZfIWAmE5jIlTWPVVPywQZpsrqjoYSaDBC7FLZTxmiKkRz/V5yzrGMwvwOwKB0803f269YOfPj8/NV
 3Yyzf1dZty8Zkfuj656bnFurE9WYk7uvlkSELFVTHBcPgUQV3kDNgYRQhG+WDzZ0PaKupAiHfcQ3i
 zIme3GbrQSeyx+A/gjlhy1AlJ4zS+g4iGaW5MSYO6ELxmfS+c6aRNFt6n5t+CTBq/Kk1Si60+T02M
 R7lAn0Og==;
Received: from [84.66.36.92] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1v7ZXN-008F5v-TQ; Sat, 11 Oct 2025 15:21:29 +0200
Message-ID: <32de35cb-a5d0-43ac-b9e1-4bc33ee5e87b@igalia.com>
Date: Sat, 11 Oct 2025 14:21:29 +0100
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
 <1785ebaf-776a-4717-9922-3aa0c31d0d52@igalia.com>
 <084ffa0dea3f2bc8d0ca2f15e90f46f10ecd49a0.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <084ffa0dea3f2bc8d0ca2f15e90f46f10ecd49a0.camel@mailbox.org>
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


On 10/10/2025 11:36, Philipp Stanner wrote:
> On Fri, 2025-10-10 at 10:46 +0100, Tvrtko Ursulin wrote:
>>
>> On 10/10/2025 09:55, Philipp Stanner wrote:
>>> On Wed, 2025-10-08 at 09:53 +0100, Tvrtko Ursulin wrote:
>>>> Helper operates on the run queue so lets make that the primary argument.
>>>>
>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>> Cc: Christian König <christian.koenig@amd.com>
>>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> Cc: Philipp Stanner <phasta@kernel.org>
>>>> ---
>>>>    drivers/gpu/drm/scheduler/sched_main.c | 8 ++++----
>>>>    1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> That's a new patch from the RFC, isn't it?
>>>
>>> And it's a general code improvement that is not related to CFS. I think
>>> I mentioned it a few times already that a series is easier to review
>>> and workflows are simplified if generic-improvement patches are
>>> branched out and sent separately.
>>>
>>> I thought you had agreed with that?
>>
>> Hm not sure. My workflow is definitely easier if this work is a single
>> unit throughout.
>>
>> Anyway, with this change it still far from consistency, so how much of
>> an improvement it brings is open to debate. The general idea is that
>> functions in sched_rq.c operate on sched_rq, which is the first
>> argument, and by the end of the series the second argument disappears:
>>
>> void drm_sched_rq_init(struct drm_sched_rq *rq)
>> {
>> 	spin_lock_init(&rq->lock);
>> 	INIT_LIST_HEAD(&rq->entities);
>> 	rq->rb_tree_root = RB_ROOT_CACHED;
>> 	rq->head_prio = -1;
>> }
>>
>> int drm_sched_init(struct drm_gpu_scheduler *sched, const struct
>> drm_sched_init_args *args)
>> {
>> ...
>> 	drm_sched_rq_init(&sched->rq);
>>
>> But again, even at that point the code base is still not fully
>> consistent in this respect aka needs more work. Not least you recently
>> asked to rename drm_sched_rq_select_entity(rq) to
>> drm_sched_select_entity(sched). So maybe you disagree with this patch
>> completely and would prefer drm_sched_rq_init(sched). I don't know.
>> Anyway, if you r-b it is trivial to send separately and merge. Or if you
>> disapprove I will just drop this patch and rebase.
> 
> I think it's best to drop it for now and address such things in a
> separate series one day for style and consistency changes which
> hopefully sets it completely straight.

Okay dropped.

Regards,

Tvrtko

> 
> I had something like that on my list, too, for all the docstrings which
> are inconsistent.
> 
> 
> P.
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>> index 46119aacb809..8b8c55b25762 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>> @@ -174,13 +174,13 @@ void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
>>>>    /**
>>>>     * drm_sched_rq_init - initialize a given run queue struct
>>>>     *
>>>> + * @rq: scheduler run queue
>>>>     * @sched: scheduler instance to associate with this run queue
>>>> - * @rq: scheduler run queue
>>>>     *
>>>>     * Initializes a scheduler runqueue.
>>>>     */
>>>> -static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
>>>> -			      struct drm_sched_rq *rq)
>>>> +static void drm_sched_rq_init(struct drm_sched_rq *rq,
>>>> +			      struct drm_gpu_scheduler *sched)
>>>>    {
>>>>    	spin_lock_init(&rq->lock);
>>>>    	INIT_LIST_HEAD(&rq->entities);
>>>> @@ -1353,7 +1353,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_
>>>>    		sched->sched_rq[i] = kzalloc(sizeof(*sched->sched_rq[i]), GFP_KERNEL);
>>>>    		if (!sched->sched_rq[i])
>>>>    			goto Out_unroll;
>>>> -		drm_sched_rq_init(sched, sched->sched_rq[i]);
>>>> +		drm_sched_rq_init(sched->sched_rq[i], sched);
>>>>    	}
>>>>    
>>>>    	init_waitqueue_head(&sched->job_scheduled);
>>>
>>
> 

