Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09915BFC580
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 16:00:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 270FC10E7AA;
	Wed, 22 Oct 2025 14:00:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="UFs2IzEY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBE9810E7A7
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 14:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1761141640;
 bh=zOPxlm/0EYVQxFC7IMu+gn/aku8ed9bw1wifjimq8ZA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UFs2IzEYHyl/wYBzwTtJZpHsasZfqPT2DGYw7UqtJ95Z9lmCpnXv00k3/rcpUBCYb
 O22QyImKGv1R6Jp+vzXIbgYIadmYmGMRdmzDNwFZUrSyBQRUsZfOJ0uivFTH5gukva
 rwaWtSQ3BTH+Tg+agEbv9wDhJsd61W4csZOh6YNwrubMfgON1JU3qZhUN5KPJmauAq
 Ctmrm7PbSy6/8852G8Kgy4Um9E9Es+tvhBenPntXSmlVj3YR7qSaqTzP1wAj4ZmnpZ
 vnkvqFVliBnAndlkcq/YMxmfiPPmXNVryQXNDek2zyea3PdhCFWoc/5h/ak9aALDbz
 AkYLckihDyWQA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 13E8F17E12DF;
 Wed, 22 Oct 2025 16:00:40 +0200 (CEST)
Date: Wed, 22 Oct 2025 16:00:33 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Ketil Johnsen <ketil.johnsen@arm.com>, Liviu Dudau
 <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Heiko Stuebner <heiko@sntech.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/panthor: Fix UAF race between device unplug and
 FW event processing
Message-ID: <20251022160033.2f645528@fedora>
In-Reply-To: <e257f8fe-fe9e-40bf-bd5a-6dad0c3d72e0@arm.com>
References: <20251022103014.1082629-1-ketil.johnsen@arm.com>
 <20251022143751.769c1f23@fedora>
 <e257f8fe-fe9e-40bf-bd5a-6dad0c3d72e0@arm.com>
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

On Wed, 22 Oct 2025 14:36:23 +0100
Steven Price <steven.price@arm.com> wrote:

> On 22/10/2025 13:37, Boris Brezillon wrote:
> > On Wed, 22 Oct 2025 12:30:13 +0200
> > Ketil Johnsen <ketil.johnsen@arm.com> wrote:
> >   
> >> The function panthor_fw_unplug() will free the FW memory sections.
> >> The problem is that there could still be pending FW events which are yet
> >> not handled at this point. process_fw_events_work() can in this case try
> >> to access said freed memory.
> >>
> >> This fix introduces a destroyed state for the panthor_scheduler object,
> >> and we check for this before processing FW events.
> >>
> >> Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>
> >> Fixes: de85488138247 ("drm/panthor: Add the scheduler logical block")
> >> ---
> >> v2:
> >> - Followed Boris's advice and handle the race purely within the
> >>   scheduler block (by adding a destroyed state)
> >> ---
> >>  drivers/gpu/drm/panthor/panthor_sched.c | 15 ++++++++++++---
> >>  1 file changed, 12 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> >> index 0cc9055f4ee52..4996f987b8183 100644
> >> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> >> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> >> @@ -315,6 +315,13 @@ struct panthor_scheduler {
> >>  		 */
> >>  		struct list_head stopped_groups;
> >>  	} reset;
> >> +
> >> +	/**
> >> +	 * @destroyed: Scheduler object is (being) destroyed
> >> +	 *
> >> +	 * Normal scheduler operations should no longer take place.
> >> +	 */
> >> +	bool destroyed;  
> > 
> > Do we really need a new field for that? Can't we just reset
> > panthor_device::scheduler to NULL early enough in the unplug path?
> > I guess it's not that simple if we have works going back to ptdev
> > and then dereferencing ptdev->scheduler, but I think it's also
> > fundamentally broken to have scheduler works active after the
> > scheduler teardown has started, so we might want to add some more
> > checks in the work callbacks too.
> >   
> >>  };
> >>  
> >>  /**
> >> @@ -1765,7 +1772,10 @@ static void process_fw_events_work(struct work_struct *work)
> >>  	u32 events = atomic_xchg(&sched->fw_events, 0);
> >>  	struct panthor_device *ptdev = sched->ptdev;
> >>  
> >> -	mutex_lock(&sched->lock);
> >> +	guard(mutex)(&sched->lock);
> >> +
> >> +	if (sched->destroyed)
> >> +		return;
> >>  
> >>  	if (events & JOB_INT_GLOBAL_IF) {
> >>  		sched_process_global_irq_locked(ptdev);
> >> @@ -1778,8 +1788,6 @@ static void process_fw_events_work(struct work_struct *work)
> >>  		sched_process_csg_irq_locked(ptdev, csg_id);
> >>  		events &= ~BIT(csg_id);
> >>  	}
> >> -
> >> -	mutex_unlock(&sched->lock);
> >>  }
> >>  
> >>  /**
> >> @@ -3882,6 +3890,7 @@ void panthor_sched_unplug(struct panthor_device *ptdev)
> >>  	cancel_delayed_work_sync(&sched->tick_work);
> >>  
> >>  	mutex_lock(&sched->lock);
> >> +	sched->destroyed = true;
> >>  	if (sched->pm.has_ref) {
> >>  		pm_runtime_put(ptdev->base.dev);
> >>  		sched->pm.has_ref = false;  
> > 
> > Hm, I'd really like to see a cancel_work_sync(&sched->fw_events_work)
> > rather than letting the work execute after we've started tearing down
> > the scheduler object.
> > 
> > If you follow my suggestion to reset the ptdev->scheduler field, I
> > guess something like that would do:
> > 
> > void panthor_sched_unplug(struct panthor_device *ptdev)
> > {
> >         struct panthor_scheduler *sched = ptdev->scheduler;
> > 
> > 	/* We want the schedu */
> > 	WRITE_ONCE(*ptdev->scheduler, NULL);
> > 
> > 	cancel_work_sync(&sched->fw_events_work);
> >         cancel_delayed_work_sync(&sched->tick_work);
> > 
> >         mutex_lock(&sched->lock);
> >         if (sched->pm.has_ref) {
> >                 pm_runtime_put(ptdev->base.dev);
> >                 sched->pm.has_ref = false;
> >         }
> >         mutex_unlock(&sched->lock);
> > }
> > 
> > and
> > 
> > void panthor_sched_report_fw_events(struct panthor_device *ptdev, u32 events) {
> > 	struct panthor_scheduler *sched = READ_ONCE(*ptdev->scheduler);
> > 
> > 	/* Scheduler is not initialized, or it's gone. */
> >         if (!sched)
> >                 return;
> > 
> >         atomic_or(events, &sched->fw_events);
> >         sched_queue_work(sched, fw_events);
> > }  
> 
> Note there's also the path of panthor_mmu_irq_handler() calling
> panthor_sched_report_mmu_fault() which will need to READ_ONCE() as well
> to be safe.

This could be hidden behind a panthor_device_get_sched() helper, I
guess. Anyway, it's not so much that I'm against the addition of an
extra bool, but AFAICT, the problem is not entirely solved, as there
could be a pending work that gets executed after sched_unplug()
returns, and I adding this bool check just papers over the real bug
(which is that we never cancel the fw_event work).

> 
> I agree having an extra bool is ugly, but it easier to reason about than
> the lock-free WRITE_ONCE/READ_ONCE dance. It worries me that this will
> be regressed in the future. I can't immediately see how to wrap this in
> a helper to ensure this is kept correct.

Sure, but you're not really catching cases where the work runs after
the scheduler component has been unplugged in case someone forgot to
cancel some works. I think I'd rather identify those cases with a
kernel panic, than a random UAF when the work is being executed.
Ultimately, we should probably audit all works used in the driver, to
make sure they are properly cancelled at unplug() time by the relevant
<component>_unplug() functions.
