Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8F3C1FEF7
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 13:07:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D5A310E913;
	Thu, 30 Oct 2025 12:07:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="ru2dQ6r/";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="/T94g59U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12E5110E913
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 12:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1761826013;
 bh=R9PAwQHeMkITXcpMrtxUNPe
 014g4Qj6IEYjyr1zyJvk=; b=ru2dQ6r/nud5HOoqwBE750RvsPrgmvTNrykguX2SZ1+mpDTWiy
 4ttwPDYAX22NS8J3jA4tsVpcyph9xro83VrX0ckATsG/vsCbOeaKuyktd7+9KanuzndX1YZ3nft
 NOnNKn6pXv64CyCxTTGzmZk/Pd1yrKhV+PWQDEdfPNb9+MLo+8LbFMg4Mz9E+pl5cHowoIcXlWg
 fzi/nRhXUUUVTytoIN/6eqlt5YqQOKIp2QAYkOIz111XkRyw3xp46ed1A+51krJ+w51k87TMEv2
 JMKO01bbdr2IGfoHBDchwXuftllMrEdC536eRhYACi5B26/nDh329DVEq30RepHuTyQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1761826013; bh=R9PAwQHeMkITXcpMrtxUNPe
 014g4Qj6IEYjyr1zyJvk=; b=/T94g59U0g1LTiijf/QkKxE7gdalHEpNXHu/fTDmtsBrVR2R14
 zCthAWVelAn2i5oU/yeb8pigXZEpZrSzexAw==;
Message-ID: <442d0e70-c9e2-4bd6-a144-ea083dbf86d2@damsy.net>
Date: Thu, 30 Oct 2025 13:06:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/sched: fix deadlock in
 drm_sched_entity_kill_jobs_cb
To: phasta@kernel.org,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20251029091103.1159-1-pierre-eric.pelloux-prayer@amd.com>
 <fb2881006f843bd85dd02948c4467c81086effc8.camel@mailbox.org>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <fb2881006f843bd85dd02948c4467c81086effc8.camel@mailbox.org>
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



Le 30/10/2025 à 12:17, Philipp Stanner a écrit :
> On Wed, 2025-10-29 at 10:11 +0100, Pierre-Eric Pelloux-Prayer wrote:
>> https://gitlab.freedesktop.org/mesa/mesa/-/issues/13908 pointed out
> 
> This link should be moved to the tag section at the bottom at a Closes:
> tag. Optionally a Reported-by:, too.

The bug report is about a different issue. The potential deadlock being fixed by 
this patch was discovered while investigating it.
I'll add a Reported-by tag though.

> 
>> a possible deadlock:
>>
>> [ 1231.611031]  Possible interrupt unsafe locking scenario:
>>
>> [ 1231.611033]        CPU0                    CPU1
>> [ 1231.611034]        ----                    ----
>> [ 1231.611035]   lock(&xa->xa_lock#17);
>> [ 1231.611038]                                local_irq_disable();
>> [ 1231.611039]                                lock(&fence->lock);
>> [ 1231.611041]                                lock(&xa->xa_lock#17);
>> [ 1231.611044]   <Interrupt>
>> [ 1231.611045]     lock(&fence->lock);
>> [ 1231.611047]
>>                  *** DEADLOCK ***
>>
> 
> The commit message is lacking an explanation as to _how_ and _when_ the
> deadlock comes to be. That's a prerequisite for understanding why the
> below is the proper fix and solution.

I copy-pasted a small chunk of the full deadlock analysis report included in the 
ticket because it's 300+ lines long. Copying the full log isn't useful IMO, but 
I can add more context.

The problem is that a thread (CPU0 above) can lock the job's dependencies 
xa_array without disabling the interrupts.
If a fence signals while CPU0 holds this lock and drm_sched_entity_kill_jobs_cb 
is called, it will try to grab the xa_array lock which is not possible because 
CPU0 holds it already.


> 
> The issue seems to be that you cannot perform certain tasks from within
> that work item?
> 
>> My initial fix was to replace xa_erase by xa_erase_irq, but Christian
>> pointed out that calling dma_fence_add_callback from a callback can
>> also deadlock if the signalling fence and the one passed to
>> dma_fence_add_callback share the same lock.
>>
>> To fix both issues, the code iterating on dependencies and re-arming them
>> is moved out to drm_sched_entity_kill_jobs_work.
>>
>> Suggested-by: Christian König <christian.koenig@amd.com>
>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>> ---
>>   drivers/gpu/drm/scheduler/sched_entity.c | 34 +++++++++++++-----------
>>   1 file changed, 19 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>> index c8e949f4a568..fe174a4857be 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -173,26 +173,15 @@ int drm_sched_entity_error(struct drm_sched_entity *entity)
>>   }
>>   EXPORT_SYMBOL(drm_sched_entity_error);
>>   
>> +static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
>> +					  struct dma_fence_cb *cb);
>> +
>>   static void drm_sched_entity_kill_jobs_work(struct work_struct *wrk)
>>   {
>>   	struct drm_sched_job *job = container_of(wrk, typeof(*job), work);
>> -
>> -	drm_sched_fence_scheduled(job->s_fence, NULL);
>> -	drm_sched_fence_finished(job->s_fence, -ESRCH);
>> -	WARN_ON(job->s_fence->parent);
>> -	job->sched->ops->free_job(job);
> 
> Can free_job() really not be called from within work item context?

It's still called from drm_sched_entity_kill_jobs_work but the diff is slightly 
confusing.

Pierre-Eric


> 
> 
> P.
