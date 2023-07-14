Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A26FC7536C8
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 11:39:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D9C910E02E;
	Fri, 14 Jul 2023 09:39:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C54E710E02E
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 09:39:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: lina@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 606425BC37;
 Fri, 14 Jul 2023 09:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1689327569;
 bh=Eo0bdJOxddjkJgrxpD2ISre7ur+ps1dvERsgKuIIp2w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=UmO/JBwFBdyJU6DmJJlrlj69WA3ro+j7eoBPv/TBGWG+v+e73+63Z2B7h14oc1mwY
 XQcW9dKU6Dz6nqkzYqT3/KWCmsyUmvj9XzU18gp/84OEqyWSyFlYpkhq7wS0kj7+vT
 MbJCB9HiVnxolhmSf+HJRKZSRImv62z4IePNubKwjlyXgdj5iuLpqnC5MBeoWBkZ9r
 BFRpYtz2Hyvk4UhUB+twADUyX3+P+wTK916lt5OVHXhLYr6QJIWu0R48QcS849joi9
 xaXh9ZVjRhxn00j4NyZglN+hljHpu7p9iFLlA01D37ANXmQqYjlgwUMjzDobCgfzUs
 rsSwsG34r9sXA==
Message-ID: <6ba6827b-ab2b-1c03-2c72-eb3f6da7e719@asahilina.net>
Date: Fri, 14 Jul 2023 18:39:23 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/3] drm/scheduler: Add more documentation
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
References: <20230714-drm-sched-fixes-v1-0-c567249709f7@asahilina.net>
 <20230714-drm-sched-fixes-v1-1-c567249709f7@asahilina.net>
 <332e031c-c04e-998c-e401-685c817ea2a1@amd.com>
Content-Language: en-US
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <332e031c-c04e-998c-e401-685c817ea2a1@amd.com>
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
Cc: Faith Ekstrand <faith.ekstrand@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/07/2023 17.40, Christian König wrote:
> Am 14.07.23 um 10:21 schrieb Asahi Lina:
>> Document the implied lifetime rules of the scheduler (or at least the
>> intended ones), as well as the expectations of how resource acquisition
>> should be handled.
>>
>> Signed-off-by: Asahi Lina <lina@asahilina.net>
>> ---
>>    drivers/gpu/drm/scheduler/sched_main.c | 58 ++++++++++++++++++++++++++++++++--
>>    1 file changed, 55 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>> index 7b2bfc10c1a5..1f3bc3606239 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -43,9 +43,61 @@
>>     *
>>     * The jobs in a entity are always scheduled in the order that they were pushed.
>>     *
>> - * Note that once a job was taken from the entities queue and pushed to the
>> - * hardware, i.e. the pending queue, the entity must not be referenced anymore
>> - * through the jobs entity pointer.
>> + * Lifetime rules
>> + * --------------
>> + *
>> + * Getting object lifetimes right across the stack is critical to avoid UAF
>> + * issues. The DRM scheduler has the following lifetime rules:
>> + *
>> + * - The scheduler must outlive all of its entities.
>> + * - Jobs pushed to the scheduler are owned by it, and must only be freed
>> + *   after the free_job() callback is called.
>> + * - Scheduler fences are reference-counted and may outlive the scheduler.
> 
>> + * - The scheduler *may* be destroyed while jobs are still in flight.
> 
> That's not correct. The scheduler can only be destroyed after all the
> entities serving it have been destroyed as well as all the jobs already
> pushed to the hw finished.

The point of this series is to change this behavior so I can actually 
use the scheduler in my use case, and that begins with formally 
documenting it as Daniel suggested. That is, I need it to be safe for 
jobs to not be yet complete before the scheduler is destroyed (the 
entities do get destroyed first, that's the first bullet point).

We already had this discussion. Without this guarantee, I cannot build a 
reasonable safe Rust abstraction. Unless you have another suggestion, as 
far as I can tell it's either this or I give up on using the DRM 
scheduler entirely and reimplement something else on my own.

> What might be possible to add is that the hw is still working on the
> already pushed jobs, but so far that was rejected as undesirable.

Where was this rejected?

>> + * - There is no guarantee that all jobs have been freed when all entities
>> + *   and the scheduled have been destroyed. Jobs may be freed asynchronously
>> + *   after this point.
>> + * - Once a job is taken from the entity's queue and pushed to the hardware,
>> + *   i.e. the pending queue, the entity must not be referenced any more
>> + *   through the job's entity pointer. In other words, entities are not
>> + *   required to outlive job execution.
>> + *
>> + * If the scheduler is destroyed with jobs in flight, the following
>> + * happens:
>> + *
>> + * - Jobs that were pushed but have not yet run will be destroyed as part
>> + *   of the entity cleanup (which must happen before the scheduler itself
>> + *   is destroyed, per the first rule above). This signals the job
>> + *   finished fence with an error flag. This process runs asynchronously
>> + *   after drm_sched_entity_destroy() returns.
>> + * - Jobs that are in-flight on the hardware are "detached" from their
>> + *   driver fence (the fence returned from the run_job() callback). In
>> + *   this case, it is up to the driver to ensure that any bookkeeping or
>> + *   internal data structures have separately managed lifetimes and that
>> + *   the hardware either cancels the jobs or runs them to completion.
>> + *   The DRM scheduler itself will immediately signal the job complete
>> + *   fence (with an error flag) and then call free_job() as part of the
>> + *   cleanup process.
>> + *
>> + * After the scheduler is destroyed, drivers *may* (but are not required to)
>> + * skip signaling their remaining driver fences, as long as they have only ever
>> + * been returned to the scheduler being destroyed as the return value from
>> + * run_job() and not passed anywhere else.
> 
> This is an outright NAK to this. Fences must always be cleanly signaled.

This is just documenting the fact that the DRM scheduler no longer cares 
about the fences after it is destroyed. I can remove it from the docs if 
you want, I don't rely on this behavior.

> IIRC Daniel documented this as mandatory on the dma_fence behavior.

Right, in the general case all dma_fences must be signaled, that's why I 
explicitly said this only applies if the scheduler is the *only* user of 
those fences.

If you don't think this should be a guarantee the scheduler officially 
makes, I'll remove it from the text.

~~ Lina

