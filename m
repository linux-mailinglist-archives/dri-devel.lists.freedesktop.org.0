Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64353C047FA
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 08:33:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15F3110E9DD;
	Fri, 24 Oct 2025 06:33:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="gImnAHZE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4772D10E9DD
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 06:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1761287625;
 bh=Qc39eqmI9gPVn9vR0vEYWjeuquhrPwsZNu2wAMekIUk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gImnAHZE38U2UB4CjasBg+2kWwhMIg1mPNs7RRbrmolL/jD8SMbZaZFIjMHqPJZAS
 XyJLLXncJOKMMVS5v4OXYTRPiezdIlGZDa/Q9/l+eT3R9mT9zsbgwoZRh1sab72utd
 f/ebuoPWhxtt9g8roEvNbM5dUNzeuijNgb1TcRH0pN4wRGg3ZukRwdo7gEhX9n/RlK
 i7hHibI2lpgQxoKtPBLiL6R3jU/cEfOUJuKe2u8u4W8dYGG02FBl2SMOkqB/xsVNjS
 xMxWOoY6twfB2BSMi/Q2fQFuImXjScBCekmacCbCosJ0yZK4CneA5BP4D88BnH4M15
 mnl0GExFqbPvQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 43E0617E0CA1;
 Fri, 24 Oct 2025 08:33:45 +0200 (CEST)
Date: Fri, 24 Oct 2025 08:33:38 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Ketil Johnsen <ketil.johnsen@arm.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Heiko Stuebner
 <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/panthor: Fix UAF race between device unplug and
 FW event processing
Message-ID: <20251024083338.755c1129@fedora>
In-Reply-To: <3c8d8fd9-d51d-4caa-ab9d-06a3f6cbaa5c@arm.com>
References: <20251022103014.1082629-1-ketil.johnsen@arm.com>
 <20251022143751.769c1f23@fedora>
 <e257f8fe-fe9e-40bf-bd5a-6dad0c3d72e0@arm.com>
 <20251022160033.2f645528@fedora>
 <1cffaf6a-7e99-416f-af50-5659b1738af2@arm.com>
 <20251022173217.1105681b@fedora>
 <3c8d8fd9-d51d-4caa-ab9d-06a3f6cbaa5c@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Thu, 23 Oct 2025 16:22:48 +0200
Ketil Johnsen <ketil.johnsen@arm.com> wrote:

> On 22/10/2025 17:32, Boris Brezillon wrote:
> > On Wed, 22 Oct 2025 15:28:51 +0100
> > Steven Price <steven.price@arm.com> wrote:
> >   
> >> On 22/10/2025 15:00, Boris Brezillon wrote:  
> >>> On Wed, 22 Oct 2025 14:36:23 +0100
> >>> Steven Price <steven.price@arm.com> wrote:
> >>>      
> >>>> On 22/10/2025 13:37, Boris Brezillon wrote:  
> >>>>> On Wed, 22 Oct 2025 12:30:13 +0200
> >>>>> Ketil Johnsen <ketil.johnsen@arm.com> wrote:
> >>>>>        
> >>>>>> The function panthor_fw_unplug() will free the FW memory sections.
> >>>>>> The problem is that there could still be pending FW events which are yet
> >>>>>> not handled at this point. process_fw_events_work() can in this case try
> >>>>>> to access said freed memory.
> >>>>>>
> >>>>>> This fix introduces a destroyed state for the panthor_scheduler object,
> >>>>>> and we check for this before processing FW events.
> >>>>>>
> >>>>>> Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>
> >>>>>> Fixes: de85488138247 ("drm/panthor: Add the scheduler logical block")
> >>>>>> ---
> >>>>>> v2:
> >>>>>> - Followed Boris's advice and handle the race purely within the
> >>>>>>    scheduler block (by adding a destroyed state)
> >>>>>> ---
> >>>>>>   drivers/gpu/drm/panthor/panthor_sched.c | 15 ++++++++++++---
> >>>>>>   1 file changed, 12 insertions(+), 3 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> >>>>>> index 0cc9055f4ee52..4996f987b8183 100644
> >>>>>> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> >>>>>> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> >>>>>> @@ -315,6 +315,13 @@ struct panthor_scheduler {
> >>>>>>   		 */
> >>>>>>   		struct list_head stopped_groups;
> >>>>>>   	} reset;
> >>>>>> +
> >>>>>> +	/**
> >>>>>> +	 * @destroyed: Scheduler object is (being) destroyed
> >>>>>> +	 *
> >>>>>> +	 * Normal scheduler operations should no longer take place.
> >>>>>> +	 */
> >>>>>> +	bool destroyed;  
> >>>>>
> >>>>> Do we really need a new field for that? Can't we just reset
> >>>>> panthor_device::scheduler to NULL early enough in the unplug path?
> >>>>> I guess it's not that simple if we have works going back to ptdev
> >>>>> and then dereferencing ptdev->scheduler, but I think it's also
> >>>>> fundamentally broken to have scheduler works active after the
> >>>>> scheduler teardown has started, so we might want to add some more
> >>>>> checks in the work callbacks too.
> >>>>>        
> >>>>>>   };
> >>>>>>   
> >>>>>>   /**
> >>>>>> @@ -1765,7 +1772,10 @@ static void process_fw_events_work(struct work_struct *work)
> >>>>>>   	u32 events = atomic_xchg(&sched->fw_events, 0);
> >>>>>>   	struct panthor_device *ptdev = sched->ptdev;
> >>>>>>   
> >>>>>> -	mutex_lock(&sched->lock);
> >>>>>> +	guard(mutex)(&sched->lock);
> >>>>>> +
> >>>>>> +	if (sched->destroyed)
> >>>>>> +		return;
> >>>>>>   
> >>>>>>   	if (events & JOB_INT_GLOBAL_IF) {
> >>>>>>   		sched_process_global_irq_locked(ptdev);
> >>>>>> @@ -1778,8 +1788,6 @@ static void process_fw_events_work(struct work_struct *work)
> >>>>>>   		sched_process_csg_irq_locked(ptdev, csg_id);
> >>>>>>   		events &= ~BIT(csg_id);
> >>>>>>   	}
> >>>>>> -
> >>>>>> -	mutex_unlock(&sched->lock);
> >>>>>>   }
> >>>>>>   
> >>>>>>   /**
> >>>>>> @@ -3882,6 +3890,7 @@ void panthor_sched_unplug(struct panthor_device *ptdev)
> >>>>>>   	cancel_delayed_work_sync(&sched->tick_work);
> >>>>>>   
> >>>>>>   	mutex_lock(&sched->lock);
> >>>>>> +	sched->destroyed = true;
> >>>>>>   	if (sched->pm.has_ref) {
> >>>>>>   		pm_runtime_put(ptdev->base.dev);
> >>>>>>   		sched->pm.has_ref = false;  
> >>>>>
> >>>>> Hm, I'd really like to see a cancel_work_sync(&sched->fw_events_work)
> >>>>> rather than letting the work execute after we've started tearing down
> >>>>> the scheduler object.
> >>>>>
> >>>>> If you follow my suggestion to reset the ptdev->scheduler field, I
> >>>>> guess something like that would do:
> >>>>>
> >>>>> void panthor_sched_unplug(struct panthor_device *ptdev)
> >>>>> {
> >>>>>          struct panthor_scheduler *sched = ptdev->scheduler;
> >>>>>
> >>>>> 	/* We want the schedu */
> >>>>> 	WRITE_ONCE(*ptdev->scheduler, NULL);
> >>>>>
> >>>>> 	cancel_work_sync(&sched->fw_events_work);
> >>>>>          cancel_delayed_work_sync(&sched->tick_work);
> >>>>>
> >>>>>          mutex_lock(&sched->lock);
> >>>>>          if (sched->pm.has_ref) {
> >>>>>                  pm_runtime_put(ptdev->base.dev);
> >>>>>                  sched->pm.has_ref = false;
> >>>>>          }
> >>>>>          mutex_unlock(&sched->lock);
> >>>>> }
> >>>>>
> >>>>> and
> >>>>>
> >>>>> void panthor_sched_report_fw_events(struct panthor_device *ptdev, u32 events) {
> >>>>> 	struct panthor_scheduler *sched = READ_ONCE(*ptdev->scheduler);
> >>>>>
> >>>>> 	/* Scheduler is not initialized, or it's gone. */
> >>>>>          if (!sched)
> >>>>>                  return;
> >>>>>
> >>>>>          atomic_or(events, &sched->fw_events);
> >>>>>          sched_queue_work(sched, fw_events);
> >>>>> }  
> >>>>
> >>>> Note there's also the path of panthor_mmu_irq_handler() calling
> >>>> panthor_sched_report_mmu_fault() which will need to READ_ONCE() as well
> >>>> to be safe.  
> >>>
> >>> This could be hidden behind a panthor_device_get_sched() helper, I
> >>> guess. Anyway, it's not so much that I'm against the addition of an
> >>> extra bool, but AFAICT, the problem is not entirely solved, as there
> >>> could be a pending work that gets executed after sched_unplug()
> >>> returns, and I adding this bool check just papers over the real bug
> >>> (which is that we never cancel the fw_event work).
> >>>      
> >>>>
> >>>> I agree having an extra bool is ugly, but it easier to reason about than
> >>>> the lock-free WRITE_ONCE/READ_ONCE dance. It worries me that this will
> >>>> be regressed in the future. I can't immediately see how to wrap this in
> >>>> a helper to ensure this is kept correct.  
> >>>
> >>> Sure, but you're not really catching cases where the work runs after
> >>> the scheduler component has been unplugged in case someone forgot to
> >>> cancel some works. I think I'd rather identify those cases with a
> >>> kernel panic, than a random UAF when the work is being executed.
> >>> Ultimately, we should probably audit all works used in the driver, to
> >>> make sure they are properly cancelled at unplug() time by the relevant
> >>> <component>_unplug() functions.  
> >>
> >> Yes I agree, we should have a cancel_work_sync(&sched->fw_events_work)
> >> call somewhere on the unplug path. That needs to be after the job irq
> >> has been disabled which is currently done in panthor_fw_unplug().  
> > 
> > Not necessarily. If we prevent any further FW events to queue the
> > fw_events work, we can just cancel it in the sched_unplug() path, after
> > we've transition to this "sched-is-gone" state.  
> 
> I don't see how panthor_sched_report_fw_events() could easily avoid 
> queuing more work, without making this more complicated than it already 
> is with this patch.
> 
> panthor_sched_unplug() need to know that 
> panthor_sched_report_fw_events() won't schedule more work before it can
> safely proceed and cancel pending work.
> 
> Ideally we would have disabled/suspended the IRQs to achieve this but 
> that happens later in panthor_fw_unplug().
> 
> If we hold the sched->lock in panthor_sched_report_fw_events() over both 
> the checking of schedulers validity and enqueuing of more work, then we 
> achieve that, but modprobe will crash, since 
> panthor_sched_report_fw_events() will be called during FW init, before 
> ptdev->scheduler is assigned for the first time.
> 
> If we go down that route, then we need to also check if scheduler is 
> valid in panthor_sched_report_fw_events(), and only take the lock if so. 
> More complexity!
> Otherwise we must introduce another mechanism to synchronize from 
> panthor_sched_report_fw_events() back to panthor_sched_unplug(), but 
> that would also add more complexity.
> 
> PS: We can not hold the sched->lock while cancelling the work either, as 
> process_fw_events_work() already takes the lock. This will deadlock!
> 
> I'm currently not able to see how we can make this fix any simpler.

I think I just found one. There are disable[_delayed]_work_sync() helpers
that do exactly what we want: flag the work as disabled, cancel the work
if it's pending, and wait for completion if it's currently executing. With
that, I don't think we need anything but the disable[_delayed]_work_sync()
calls in the various unplug path we have. I guess it would also be good
to transition to {disable,enable}[_delayed]_work_sync() in the reset path
so we can get rid of some open-coded logic doing the same thing in
sched_queue[_delayed]_work() helpers, but we can keep that for later.

--->8---
diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index 81df49880bd8..c771d66a9690 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -120,7 +120,7 @@ static void panthor_device_reset_cleanup(struct drm_device *ddev, void *data)
 {
        struct panthor_device *ptdev = container_of(ddev, struct panthor_device, base);
 
-       cancel_work_sync(&ptdev->reset.work);
+       disable_work_sync(&ptdev->reset.work);
        destroy_workqueue(ptdev->reset.wq);
 }
 
diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index df767e82148a..5d9f38f301dc 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1163,7 +1163,7 @@ void panthor_fw_unplug(struct panthor_device *ptdev)
 {
        struct panthor_fw_section *section;
 
-       cancel_delayed_work_sync(&ptdev->fw->watchdog.ping_work);
+       disable_delayed_work_sync(&ptdev->fw->watchdog.ping_work);
 
        if (!IS_ENABLED(CONFIG_PM) || pm_runtime_active(ptdev->base.dev)) {
                /* Make sure the IRQ handler cannot be called after that point. */
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 3d1f57e3990f..adc4fd71175e 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -3855,7 +3855,10 @@ void panthor_sched_unplug(struct panthor_device *ptdev)
 {
        struct panthor_scheduler *sched = ptdev->scheduler;
 
-       cancel_delayed_work_sync(&sched->tick_work);
+       /* Disable all works before proceeding with the teardown. */
+       disable_work_sync(&sched->sync_upd_work);
+       disable_work_sync(&sched->fw_events_work);
+       disable_delayed_work_sync(&sched->tick_work);
 
        mutex_lock(&sched->lock);
        if (sched->pm.has_ref) {

