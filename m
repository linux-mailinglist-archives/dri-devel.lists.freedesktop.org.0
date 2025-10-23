Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEF4C01BC6
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 16:22:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D58E510E903;
	Thu, 23 Oct 2025 14:22:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 878AC10E902
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 14:22:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A9111516;
 Thu, 23 Oct 2025 07:22:48 -0700 (PDT)
Received: from [10.57.36.33] (unknown [10.57.36.33])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F10ED3F59E;
 Thu, 23 Oct 2025 07:22:52 -0700 (PDT)
Message-ID: <3c8d8fd9-d51d-4caa-ab9d-06a3f6cbaa5c@arm.com>
Date: Thu, 23 Oct 2025 16:22:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/panthor: Fix UAF race between device unplug and FW
 event processing
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251022103014.1082629-1-ketil.johnsen@arm.com>
 <20251022143751.769c1f23@fedora>
 <e257f8fe-fe9e-40bf-bd5a-6dad0c3d72e0@arm.com>
 <20251022160033.2f645528@fedora>
 <1cffaf6a-7e99-416f-af50-5659b1738af2@arm.com>
 <20251022173217.1105681b@fedora>
Content-Language: en-US
From: Ketil Johnsen <ketil.johnsen@arm.com>
In-Reply-To: <20251022173217.1105681b@fedora>
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

On 22/10/2025 17:32, Boris Brezillon wrote:
> On Wed, 22 Oct 2025 15:28:51 +0100
> Steven Price <steven.price@arm.com> wrote:
> 
>> On 22/10/2025 15:00, Boris Brezillon wrote:
>>> On Wed, 22 Oct 2025 14:36:23 +0100
>>> Steven Price <steven.price@arm.com> wrote:
>>>    
>>>> On 22/10/2025 13:37, Boris Brezillon wrote:
>>>>> On Wed, 22 Oct 2025 12:30:13 +0200
>>>>> Ketil Johnsen <ketil.johnsen@arm.com> wrote:
>>>>>      
>>>>>> The function panthor_fw_unplug() will free the FW memory sections.
>>>>>> The problem is that there could still be pending FW events which are yet
>>>>>> not handled at this point. process_fw_events_work() can in this case try
>>>>>> to access said freed memory.
>>>>>>
>>>>>> This fix introduces a destroyed state for the panthor_scheduler object,
>>>>>> and we check for this before processing FW events.
>>>>>>
>>>>>> Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>
>>>>>> Fixes: de85488138247 ("drm/panthor: Add the scheduler logical block")
>>>>>> ---
>>>>>> v2:
>>>>>> - Followed Boris's advice and handle the race purely within the
>>>>>>    scheduler block (by adding a destroyed state)
>>>>>> ---
>>>>>>   drivers/gpu/drm/panthor/panthor_sched.c | 15 ++++++++++++---
>>>>>>   1 file changed, 12 insertions(+), 3 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
>>>>>> index 0cc9055f4ee52..4996f987b8183 100644
>>>>>> --- a/drivers/gpu/drm/panthor/panthor_sched.c
>>>>>> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
>>>>>> @@ -315,6 +315,13 @@ struct panthor_scheduler {
>>>>>>   		 */
>>>>>>   		struct list_head stopped_groups;
>>>>>>   	} reset;
>>>>>> +
>>>>>> +	/**
>>>>>> +	 * @destroyed: Scheduler object is (being) destroyed
>>>>>> +	 *
>>>>>> +	 * Normal scheduler operations should no longer take place.
>>>>>> +	 */
>>>>>> +	bool destroyed;
>>>>>
>>>>> Do we really need a new field for that? Can't we just reset
>>>>> panthor_device::scheduler to NULL early enough in the unplug path?
>>>>> I guess it's not that simple if we have works going back to ptdev
>>>>> and then dereferencing ptdev->scheduler, but I think it's also
>>>>> fundamentally broken to have scheduler works active after the
>>>>> scheduler teardown has started, so we might want to add some more
>>>>> checks in the work callbacks too.
>>>>>      
>>>>>>   };
>>>>>>   
>>>>>>   /**
>>>>>> @@ -1765,7 +1772,10 @@ static void process_fw_events_work(struct work_struct *work)
>>>>>>   	u32 events = atomic_xchg(&sched->fw_events, 0);
>>>>>>   	struct panthor_device *ptdev = sched->ptdev;
>>>>>>   
>>>>>> -	mutex_lock(&sched->lock);
>>>>>> +	guard(mutex)(&sched->lock);
>>>>>> +
>>>>>> +	if (sched->destroyed)
>>>>>> +		return;
>>>>>>   
>>>>>>   	if (events & JOB_INT_GLOBAL_IF) {
>>>>>>   		sched_process_global_irq_locked(ptdev);
>>>>>> @@ -1778,8 +1788,6 @@ static void process_fw_events_work(struct work_struct *work)
>>>>>>   		sched_process_csg_irq_locked(ptdev, csg_id);
>>>>>>   		events &= ~BIT(csg_id);
>>>>>>   	}
>>>>>> -
>>>>>> -	mutex_unlock(&sched->lock);
>>>>>>   }
>>>>>>   
>>>>>>   /**
>>>>>> @@ -3882,6 +3890,7 @@ void panthor_sched_unplug(struct panthor_device *ptdev)
>>>>>>   	cancel_delayed_work_sync(&sched->tick_work);
>>>>>>   
>>>>>>   	mutex_lock(&sched->lock);
>>>>>> +	sched->destroyed = true;
>>>>>>   	if (sched->pm.has_ref) {
>>>>>>   		pm_runtime_put(ptdev->base.dev);
>>>>>>   		sched->pm.has_ref = false;
>>>>>
>>>>> Hm, I'd really like to see a cancel_work_sync(&sched->fw_events_work)
>>>>> rather than letting the work execute after we've started tearing down
>>>>> the scheduler object.
>>>>>
>>>>> If you follow my suggestion to reset the ptdev->scheduler field, I
>>>>> guess something like that would do:
>>>>>
>>>>> void panthor_sched_unplug(struct panthor_device *ptdev)
>>>>> {
>>>>>          struct panthor_scheduler *sched = ptdev->scheduler;
>>>>>
>>>>> 	/* We want the schedu */
>>>>> 	WRITE_ONCE(*ptdev->scheduler, NULL);
>>>>>
>>>>> 	cancel_work_sync(&sched->fw_events_work);
>>>>>          cancel_delayed_work_sync(&sched->tick_work);
>>>>>
>>>>>          mutex_lock(&sched->lock);
>>>>>          if (sched->pm.has_ref) {
>>>>>                  pm_runtime_put(ptdev->base.dev);
>>>>>                  sched->pm.has_ref = false;
>>>>>          }
>>>>>          mutex_unlock(&sched->lock);
>>>>> }
>>>>>
>>>>> and
>>>>>
>>>>> void panthor_sched_report_fw_events(struct panthor_device *ptdev, u32 events) {
>>>>> 	struct panthor_scheduler *sched = READ_ONCE(*ptdev->scheduler);
>>>>>
>>>>> 	/* Scheduler is not initialized, or it's gone. */
>>>>>          if (!sched)
>>>>>                  return;
>>>>>
>>>>>          atomic_or(events, &sched->fw_events);
>>>>>          sched_queue_work(sched, fw_events);
>>>>> }
>>>>
>>>> Note there's also the path of panthor_mmu_irq_handler() calling
>>>> panthor_sched_report_mmu_fault() which will need to READ_ONCE() as well
>>>> to be safe.
>>>
>>> This could be hidden behind a panthor_device_get_sched() helper, I
>>> guess. Anyway, it's not so much that I'm against the addition of an
>>> extra bool, but AFAICT, the problem is not entirely solved, as there
>>> could be a pending work that gets executed after sched_unplug()
>>> returns, and I adding this bool check just papers over the real bug
>>> (which is that we never cancel the fw_event work).
>>>    
>>>>
>>>> I agree having an extra bool is ugly, but it easier to reason about than
>>>> the lock-free WRITE_ONCE/READ_ONCE dance. It worries me that this will
>>>> be regressed in the future. I can't immediately see how to wrap this in
>>>> a helper to ensure this is kept correct.
>>>
>>> Sure, but you're not really catching cases where the work runs after
>>> the scheduler component has been unplugged in case someone forgot to
>>> cancel some works. I think I'd rather identify those cases with a
>>> kernel panic, than a random UAF when the work is being executed.
>>> Ultimately, we should probably audit all works used in the driver, to
>>> make sure they are properly cancelled at unplug() time by the relevant
>>> <component>_unplug() functions.
>>
>> Yes I agree, we should have a cancel_work_sync(&sched->fw_events_work)
>> call somewhere on the unplug path. That needs to be after the job irq
>> has been disabled which is currently done in panthor_fw_unplug().
> 
> Not necessarily. If we prevent any further FW events to queue the
> fw_events work, we can just cancel it in the sched_unplug() path, after
> we've transition to this "sched-is-gone" state.

I don't see how panthor_sched_report_fw_events() could easily avoid 
queuing more work, without making this more complicated than it already 
is with this patch.

panthor_sched_unplug() need to know that 
panthor_sched_report_fw_events() won't schedule more work before it can
safely proceed and cancel pending work.

Ideally we would have disabled/suspended the IRQs to achieve this but 
that happens later in panthor_fw_unplug().

If we hold the sched->lock in panthor_sched_report_fw_events() over both 
the checking of schedulers validity and enqueuing of more work, then we 
achieve that, but modprobe will crash, since 
panthor_sched_report_fw_events() will be called during FW init, before 
ptdev->scheduler is assigned for the first time.

If we go down that route, then we need to also check if scheduler is 
valid in panthor_sched_report_fw_events(), and only take the lock if so. 
More complexity!
Otherwise we must introduce another mechanism to synchronize from 
panthor_sched_report_fw_events() back to panthor_sched_unplug(), but 
that would also add more complexity.

PS: We can not hold the sched->lock while cancelling the work either, as 
process_fw_events_work() already takes the lock. This will deadlock!

I'm currently not able to see how we can make this fix any simpler.

Also, In my mind, the root of the pain is that scheduler and FW module 
are two "equal" modules. If the scheduler owned the FW module, then this 
would be more straight forward. panthor_sched_unplug() would then just 
stop scheduling new work, "unplug" FW and then cancel any pending work. 
But that would of course be a much bigger change, potentially 
introducing a lot of other complications.

--
Ketil
