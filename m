Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E25ADBFBE37
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 14:38:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1CC010E768;
	Wed, 22 Oct 2025 12:38:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="nXuYgllD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75C9210E768
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 12:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1761136678;
 bh=kuoFaGo1lFWbIqr/873RAd2sTYktB7+UNWZKq7cfbJs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nXuYgllDeWhpaFxvCbTo2kiVnG1MXxMHkHlx/2y+xUS2ga8VHsSGmDT70jPriKFMW
 eBYKwYw3ZKQ3kqabRPSKfrFSPdzQyY56gvBzB64YIM/r8w28qT5WDECk5PfM810nYk
 3nu0AsFwBPq4dG1jmsX3vsqSrtAFYbS/EJF03Ar2OaFVHE+BjUNUzsEaRUWcjDoMs0
 BpHjobTE0/Bh4bwVX52pnkxIKUZs53GY3DLtgZlKzT2zZnJPvhy0DyKikpgzZNf7wn
 lsHJHeyEhpFD5AQgwn5hLMNJ0nkZrD3/rFEMCtvVMBgmIOwTwIOfrLjOdZQ+o81Sq2
 Uldcsx/TWvw2w==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8014917E12AF;
 Wed, 22 Oct 2025 14:37:57 +0200 (CEST)
Date: Wed, 22 Oct 2025 14:37:51 +0200
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
Message-ID: <20251022143751.769c1f23@fedora>
In-Reply-To: <20251022103014.1082629-1-ketil.johnsen@arm.com>
References: <20251022103014.1082629-1-ketil.johnsen@arm.com>
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

On Wed, 22 Oct 2025 12:30:13 +0200
Ketil Johnsen <ketil.johnsen@arm.com> wrote:

> The function panthor_fw_unplug() will free the FW memory sections.
> The problem is that there could still be pending FW events which are yet
> not handled at this point. process_fw_events_work() can in this case try
> to access said freed memory.
> 
> This fix introduces a destroyed state for the panthor_scheduler object,
> and we check for this before processing FW events.
> 
> Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>
> Fixes: de85488138247 ("drm/panthor: Add the scheduler logical block")
> ---
> v2:
> - Followed Boris's advice and handle the race purely within the
>   scheduler block (by adding a destroyed state)
> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 0cc9055f4ee52..4996f987b8183 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -315,6 +315,13 @@ struct panthor_scheduler {
>  		 */
>  		struct list_head stopped_groups;
>  	} reset;
> +
> +	/**
> +	 * @destroyed: Scheduler object is (being) destroyed
> +	 *
> +	 * Normal scheduler operations should no longer take place.
> +	 */
> +	bool destroyed;

Do we really need a new field for that? Can't we just reset
panthor_device::scheduler to NULL early enough in the unplug path?
I guess it's not that simple if we have works going back to ptdev
and then dereferencing ptdev->scheduler, but I think it's also
fundamentally broken to have scheduler works active after the
scheduler teardown has started, so we might want to add some more
checks in the work callbacks too.

>  };
>  
>  /**
> @@ -1765,7 +1772,10 @@ static void process_fw_events_work(struct work_struct *work)
>  	u32 events = atomic_xchg(&sched->fw_events, 0);
>  	struct panthor_device *ptdev = sched->ptdev;
>  
> -	mutex_lock(&sched->lock);
> +	guard(mutex)(&sched->lock);
> +
> +	if (sched->destroyed)
> +		return;
>  
>  	if (events & JOB_INT_GLOBAL_IF) {
>  		sched_process_global_irq_locked(ptdev);
> @@ -1778,8 +1788,6 @@ static void process_fw_events_work(struct work_struct *work)
>  		sched_process_csg_irq_locked(ptdev, csg_id);
>  		events &= ~BIT(csg_id);
>  	}
> -
> -	mutex_unlock(&sched->lock);
>  }
>  
>  /**
> @@ -3882,6 +3890,7 @@ void panthor_sched_unplug(struct panthor_device *ptdev)
>  	cancel_delayed_work_sync(&sched->tick_work);
>  
>  	mutex_lock(&sched->lock);
> +	sched->destroyed = true;
>  	if (sched->pm.has_ref) {
>  		pm_runtime_put(ptdev->base.dev);
>  		sched->pm.has_ref = false;

Hm, I'd really like to see a cancel_work_sync(&sched->fw_events_work)
rather than letting the work execute after we've started tearing down
the scheduler object.

If you follow my suggestion to reset the ptdev->scheduler field, I
guess something like that would do:

void panthor_sched_unplug(struct panthor_device *ptdev)
{
        struct panthor_scheduler *sched = ptdev->scheduler;

	/* We want the schedu */
	WRITE_ONCE(*ptdev->scheduler, NULL);

	cancel_work_sync(&sched->fw_events_work);
        cancel_delayed_work_sync(&sched->tick_work);

        mutex_lock(&sched->lock);
        if (sched->pm.has_ref) {
                pm_runtime_put(ptdev->base.dev);
                sched->pm.has_ref = false;
        }
        mutex_unlock(&sched->lock);
}

and

void panthor_sched_report_fw_events(struct panthor_device *ptdev, u32 events) {
	struct panthor_scheduler *sched = READ_ONCE(*ptdev->scheduler);

	/* Scheduler is not initialized, or it's gone. */
        if (!sched)
                return;

        atomic_or(events, &sched->fw_events);
        sched_queue_work(sched, fw_events);
}


sched_queue_[delayed_]work() could also be automated to issue a drm_WARN_ON()
when it's called and ptdev->scheduler = NULL.
