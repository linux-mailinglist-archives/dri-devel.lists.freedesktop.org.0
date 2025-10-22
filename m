Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3A7BFC330
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 15:37:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0F6D10E7A4;
	Wed, 22 Oct 2025 13:37:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 772EB10E7CC
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 13:36:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B6661063;
 Wed, 22 Oct 2025 06:36:20 -0700 (PDT)
Received: from [10.57.33.187] (unknown [10.57.33.187])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B23CF3F59E;
 Wed, 22 Oct 2025 06:36:25 -0700 (PDT)
Message-ID: <e257f8fe-fe9e-40bf-bd5a-6dad0c3d72e0@arm.com>
Date: Wed, 22 Oct 2025 14:36:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/panthor: Fix UAF race between device unplug and FW
 event processing
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Ketil Johnsen <ketil.johnsen@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251022103014.1082629-1-ketil.johnsen@arm.com>
 <20251022143751.769c1f23@fedora>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251022143751.769c1f23@fedora>
Content-Type: text/plain; charset=UTF-8
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

On 22/10/2025 13:37, Boris Brezillon wrote:
> On Wed, 22 Oct 2025 12:30:13 +0200
> Ketil Johnsen <ketil.johnsen@arm.com> wrote:
> 
>> The function panthor_fw_unplug() will free the FW memory sections.
>> The problem is that there could still be pending FW events which are yet
>> not handled at this point. process_fw_events_work() can in this case try
>> to access said freed memory.
>>
>> This fix introduces a destroyed state for the panthor_scheduler object,
>> and we check for this before processing FW events.
>>
>> Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>
>> Fixes: de85488138247 ("drm/panthor: Add the scheduler logical block")
>> ---
>> v2:
>> - Followed Boris's advice and handle the race purely within the
>>   scheduler block (by adding a destroyed state)
>> ---
>>  drivers/gpu/drm/panthor/panthor_sched.c | 15 ++++++++++++---
>>  1 file changed, 12 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
>> index 0cc9055f4ee52..4996f987b8183 100644
>> --- a/drivers/gpu/drm/panthor/panthor_sched.c
>> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
>> @@ -315,6 +315,13 @@ struct panthor_scheduler {
>>  		 */
>>  		struct list_head stopped_groups;
>>  	} reset;
>> +
>> +	/**
>> +	 * @destroyed: Scheduler object is (being) destroyed
>> +	 *
>> +	 * Normal scheduler operations should no longer take place.
>> +	 */
>> +	bool destroyed;
> 
> Do we really need a new field for that? Can't we just reset
> panthor_device::scheduler to NULL early enough in the unplug path?
> I guess it's not that simple if we have works going back to ptdev
> and then dereferencing ptdev->scheduler, but I think it's also
> fundamentally broken to have scheduler works active after the
> scheduler teardown has started, so we might want to add some more
> checks in the work callbacks too.
> 
>>  };
>>  
>>  /**
>> @@ -1765,7 +1772,10 @@ static void process_fw_events_work(struct work_struct *work)
>>  	u32 events = atomic_xchg(&sched->fw_events, 0);
>>  	struct panthor_device *ptdev = sched->ptdev;
>>  
>> -	mutex_lock(&sched->lock);
>> +	guard(mutex)(&sched->lock);
>> +
>> +	if (sched->destroyed)
>> +		return;
>>  
>>  	if (events & JOB_INT_GLOBAL_IF) {
>>  		sched_process_global_irq_locked(ptdev);
>> @@ -1778,8 +1788,6 @@ static void process_fw_events_work(struct work_struct *work)
>>  		sched_process_csg_irq_locked(ptdev, csg_id);
>>  		events &= ~BIT(csg_id);
>>  	}
>> -
>> -	mutex_unlock(&sched->lock);
>>  }
>>  
>>  /**
>> @@ -3882,6 +3890,7 @@ void panthor_sched_unplug(struct panthor_device *ptdev)
>>  	cancel_delayed_work_sync(&sched->tick_work);
>>  
>>  	mutex_lock(&sched->lock);
>> +	sched->destroyed = true;
>>  	if (sched->pm.has_ref) {
>>  		pm_runtime_put(ptdev->base.dev);
>>  		sched->pm.has_ref = false;
> 
> Hm, I'd really like to see a cancel_work_sync(&sched->fw_events_work)
> rather than letting the work execute after we've started tearing down
> the scheduler object.
> 
> If you follow my suggestion to reset the ptdev->scheduler field, I
> guess something like that would do:
> 
> void panthor_sched_unplug(struct panthor_device *ptdev)
> {
>         struct panthor_scheduler *sched = ptdev->scheduler;
> 
> 	/* We want the schedu */
> 	WRITE_ONCE(*ptdev->scheduler, NULL);
> 
> 	cancel_work_sync(&sched->fw_events_work);
>         cancel_delayed_work_sync(&sched->tick_work);
> 
>         mutex_lock(&sched->lock);
>         if (sched->pm.has_ref) {
>                 pm_runtime_put(ptdev->base.dev);
>                 sched->pm.has_ref = false;
>         }
>         mutex_unlock(&sched->lock);
> }
> 
> and
> 
> void panthor_sched_report_fw_events(struct panthor_device *ptdev, u32 events) {
> 	struct panthor_scheduler *sched = READ_ONCE(*ptdev->scheduler);
> 
> 	/* Scheduler is not initialized, or it's gone. */
>         if (!sched)
>                 return;
> 
>         atomic_or(events, &sched->fw_events);
>         sched_queue_work(sched, fw_events);
> }

Note there's also the path of panthor_mmu_irq_handler() calling
panthor_sched_report_mmu_fault() which will need to READ_ONCE() as well
to be safe.

I agree having an extra bool is ugly, but it easier to reason about than
the lock-free WRITE_ONCE/READ_ONCE dance. It worries me that this will
be regressed in the future. I can't immediately see how to wrap this in
a helper to ensure this is kept correct.

Thanks,
Steve

> 
> 
> sched_queue_[delayed_]work() could also be automated to issue a drm_WARN_ON()
> when it's called and ptdev->scheduler = NULL.

