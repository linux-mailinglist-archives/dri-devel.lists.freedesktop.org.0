Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D47A97832C
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 17:01:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B721210E27C;
	Fri, 13 Sep 2024 15:01:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="JSHig6wl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E1710E27C;
 Fri, 13 Sep 2024 15:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jRtvym4vdFZsRu+vOfh/4TCoAnkQvlh4RpJ2P11oRSo=; b=JSHig6wl9A9S/PMOqtZov/5CUM
 u+YDakoQHl0N7jxTKID7uZPewnzKbMrKL9Vd+VCs3hF5HV3lY8CFye4pg98roPeH8g6TKkPyTSJeD
 ACIIehKA0Q36bQsrSaq20sZ8XxUNYfLUwn1Ag5wTePtPzQWoev05gYHL2fyv/OM8Uo03eTO2ZeIYr
 5fVy5frPKwr2Ri6GnUzAq480BuDAQeLbC26607vYT/CLWhk3DGpxf7oTAv31qZPq2DMulO3IJZ9K6
 k8/Qo+TCxVICdV22UrvKHUDbFjEu20CChHQc9d4sZsSsIip9auDyMxTGbmPBbmbRom4kWIw6EWBPS
 5waavAMg==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sp7nP-00DNRU-6n; Fri, 13 Sep 2024 17:01:15 +0200
Message-ID: <1d68285d-0734-4eb1-a4b6-f695b8728f46@igalia.com>
Date: Fri, 13 Sep 2024 16:01:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] drm/sched: Further optimise drm_sched_entity_push_job
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
References: <20240909171937.51550-1-tursulin@igalia.com>
 <20240909171937.51550-9-tursulin@igalia.com>
 <cd0dcdf4-a001-4fc3-9803-3e8b85cbc89f@gmail.com>
 <48b74e60-6e75-4929-aa30-503f4a4cd5e8@igalia.com>
 <aed37179-292b-41d0-878d-95f248d5ee8e@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <aed37179-292b-41d0-878d-95f248d5ee8e@amd.com>
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


On 10/09/2024 16:03, Christian König wrote:
> Am 10.09.24 um 11:46 schrieb Tvrtko Ursulin:
>>
>> On 10/09/2024 10:08, Christian König wrote:
>>> Am 09.09.24 um 19:19 schrieb Tvrtko Ursulin:
>>>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>>
>>>> Having removed one re-lock cycle on the entity->lock in a patch titled
>>>> "drm/sched: Optimise drm_sched_entity_push_job", with only a tiny bit
>>>> larger refactoring we can do the same optimisation on the rq->lock.
>>>> (Currently both drm_sched_rq_add_entity() and
>>>> drm_sched_rq_update_fifo_locked() take and release the same lock.)
>>>
>>> I think that goes into the wrong direction.
>>>
>>> Probably better to move this here into drm_sched_rq_add_entity():
>>>
>>>            if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>>>               drm_sched_rq_update_fifo_locked(entity, submit_ts);
>>>
>>> We can then also drop adding the entity to the rr list when FIFO is 
>>> in use.
>>
>> Unfortuntely there is a few other places which appear to rely on the 
>> list. Like drm_sched_fini,
> 
> That should be only a warning.

Warning as in?

>> drm_sched_increase_karma and 
> 
> The karma handling was another bad idea from AMD how to populate back 
> errors to userspace and I've just recently documented together with Sima 
> that we should use dma-fence errors instead.
> 
> Just didn't had time to tackle cleaning that up yet.
> 
>> even amdgpu_job_stop_all_jobs_on_sched.
> 
> Uff, seeing that for the first time just now. Another bad idea how to 
> handle things which doesn't take the appropriate locks and looks racy to 
> me.
> 
> 
>> Latter could perhaps be solved by adding an iterator helper to the 
>> scheduler, which would perhaps be a good move for component isolation. 
>> And first two could be handled by implementing a complete and mutually 
>> exclusive duality of how entities are walked depending on scheduling 
>> mode. Plus making the scheduling mode only be configurable at boot. It 
>> feels doable but significant work and in the meantime removing the 
>> double re-lock maybe acceptable?
> 
> I don't think we should optimize for something we want to remove in the 
> long term.

I knew using the term optimise would just making things more difficult 
for myself. :) Lets view this as cleaning up the API to avoid the 
inelegance of taking the same lock twice right next to each other.

If we can achieve this while not making the API worse then there is 
nothing to lose either short, med or long term.

> If possible I would rather say that we should completely drop the RR 
> approach and only use FIFO or even something more sophisticated.

No complaints from me, but I don't know how that would work other than 
putting a depreciation warning if someone selected RR. And keeping that 
for a good number of kernel releases. Any other ideas?

Regards,

Tvrtko
