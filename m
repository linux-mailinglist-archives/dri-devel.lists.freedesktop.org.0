Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7942A984760
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 16:13:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0CF310E2BD;
	Tue, 24 Sep 2024 14:13:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="cOzAC4TO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5029110E2BD;
 Tue, 24 Sep 2024 14:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FN15zMSTmhz7Nauhya2gPIoC/eGYXanuEqcHORTclQ8=; b=cOzAC4TOqcazXtKCVlKKpTCxFp
 g1RYfL3k9ZbmcdsuHWKirdRzZ76BGE8Eby+ZeR0WKE2YInzJ9V78RF3wD1vIus6IqF7SfzqGoQjlj
 NuDKIp6pq9o4q4J63g2jflmoeTiLPpGhANx8x+zdTuS688xqEbp/QUiqHlV0+CnUuhmDYG9Kf9F3O
 w3S6QuRuk86fntcx+s9W6I95lJoEOaS0koSkgvRtJF/CmHIHXx1xb4hrrs0+BDny6LZCGMkP4LRUN
 C3MiGNXbV3ZyNp588uJ3ns0LgcsRTt06hf8WAtLR/WKvdwX9kgjDj/Tl90O0u0ZKtUEnu860ONpF+
 CYHTD0Yg==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1st6He-000Ul1-Pw; Tue, 24 Sep 2024 16:12:54 +0200
Message-ID: <1b56854b-5357-4efa-b31b-950eb85ee277@igalia.com>
Date: Tue, 24 Sep 2024 15:12:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] drm/sched: Always wake up correct scheduler in
 drm_sched_entity_push_job
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Philipp Stanner <pstanner@redhat.com>, stable@vger.kernel.org
References: <20240924101914.2713-1-tursulin@igalia.com>
 <20240924101914.2713-3-tursulin@igalia.com>
 <4dcce6db-cdb1-4378-8fea-8540ec7539ef@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <4dcce6db-cdb1-4378-8fea-8540ec7539ef@amd.com>
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


On 24/09/2024 14:55, Christian König wrote:
> I've pushed the first to drm-misc-next, but that one here fails to apply 
> cleanly.

This appears due 440d52b370b0 ("drm/sched: Fix dynamic job-flow control 
race") in drm-misc-fixes.

In theory 1-3 from my series are fixes. Should they also go to 
drm-misc-fixes? I am not too familiar with the drm-misc flow.

Or the series now needs to wait for some backmerge?

Regards,

Tvrtko

> Am 24.09.24 um 12:19 schrieb Tvrtko Ursulin:
>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>
>> Since drm_sched_entity_modify_sched() can modify the entities run queue,
>> lets make sure to only dereference the pointer once so both adding and
>> waking up are guaranteed to be consistent.
>>
>> Alternative of moving the spin_unlock to after the wake up would for now
>> be more problematic since the same lock is taken inside
>> drm_sched_rq_update_fifo().
>>
>> v2:
>>   * Improve commit message. (Philipp)
>>   * Cache the scheduler pointer directly. (Christian)
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Fixes: b37aced31eb0 ("drm/scheduler: implement a function to modify 
>> sched list")
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: Luben Tuikov <ltuikov89@gmail.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: Philipp Stanner <pstanner@redhat.com>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: <stable@vger.kernel.org> # v5.7+
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/scheduler/sched_entity.c | 10 ++++++++--
>>   1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c 
>> b/drivers/gpu/drm/scheduler/sched_entity.c
>> index 0e002c17fcb6..a75eede8bf8d 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -599,6 +599,9 @@ void drm_sched_entity_push_job(struct 
>> drm_sched_job *sched_job)
>>       /* first job wakes up scheduler */
>>       if (first) {
>> +        struct drm_gpu_scheduler *sched;
>> +        struct drm_sched_rq *rq;
>> +
>>           /* Add the entity to the run queue */
>>           spin_lock(&entity->rq_lock);
>>           if (entity->stopped) {
>> @@ -608,13 +611,16 @@ void drm_sched_entity_push_job(struct 
>> drm_sched_job *sched_job)
>>               return;
>>           }
>> -        drm_sched_rq_add_entity(entity->rq, entity);
>> +        rq = entity->rq;
>> +        sched = rq->sched;
>> +
>> +        drm_sched_rq_add_entity(rq, entity);
>>           spin_unlock(&entity->rq_lock);
>>           if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>>               drm_sched_rq_update_fifo(entity, submit_ts);
>> -        drm_sched_wakeup(entity->rq->sched);
>> +        drm_sched_wakeup(sched);
>>       }
>>   }
>>   EXPORT_SYMBOL(drm_sched_entity_push_job);
> 
