Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C87639C88CE
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 12:24:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70BA210E0A9;
	Thu, 14 Nov 2024 11:24:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Ku01hD7A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D20DB10E0A9
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 11:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1731583460;
 bh=ZEy8nNBtsytuOjErbwO6vAXOJFleF/Cpxim6nzjTHLk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ku01hD7AKTiU/VFRQ1Suftc8KA4PO1asVaSQFgHGE+u2m3fJu4EIQlhBbXnp81n0X
 02PO0knYUz6nxsLDnxo0GJ2CAU3hat+dJ83xRinFDUZHehl38ygw3SfxOxv2vlL04B
 4OLmiTPeVgFZFOz+WSY3UKinKcwt8sf57sDiwKZFtAbvUdnTdEEHbx2jmrEZpIAEXJ
 vXBm9dr4p8WWmQ+E+xoF0nyETFB3d7pbVynrysQAzUoDgWOpj6lmYEKn6Mun+AEhxx
 lTg4OfXUe9Xo2+r6k6yEXwL0tjsHfwD29MCu90q/ctDjKxf2zvOYk0eGvOM+lsowPv
 /HfFGTXoulfLQ==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 2411F17E360A;
 Thu, 14 Nov 2024 12:24:20 +0100 (CET)
Date: Thu, 14 Nov 2024 12:24:13 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com
Subject: Re: [PATCH 4/5] drm/panthor: Be robust against resume failures
Message-ID: <20241114122413.778b01df@collabora.com>
In-Reply-To: <1fde7d30-7b8d-4f20-a38e-957e0f67a295@arm.com>
References: <20241113154257.1971284-1-boris.brezillon@collabora.com>
 <20241113154257.1971284-5-boris.brezillon@collabora.com>
 <1fde7d30-7b8d-4f20-a38e-957e0f67a295@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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

On Thu, 14 Nov 2024 10:51:01 +0000
Steven Price <steven.price@arm.com> wrote:

> On 13/11/2024 15:42, Boris Brezillon wrote:
> > When the runtime PM resume callback returns an error, it puts the device
> > in a state where it can't be resumed anymore. Make sure we can recover
> > from such transient failures by calling pm_runtime_set_suspended()
> > explicitly after a pm_runtime_resume_and_get() failure.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> >  drivers/gpu/drm/panthor/panthor_device.c |  1 +
> >  drivers/gpu/drm/panthor/panthor_device.h | 17 +++++++++++++++++
> >  drivers/gpu/drm/panthor/panthor_drv.c    |  2 +-
> >  drivers/gpu/drm/panthor/panthor_sched.c  |  4 ++--
> >  4 files changed, 21 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> > index 353f3aabef42..d3276b936141 100644
> > --- a/drivers/gpu/drm/panthor/panthor_device.c
> > +++ b/drivers/gpu/drm/panthor/panthor_device.c
> > @@ -486,6 +486,7 @@ int panthor_device_resume(struct device *dev)
> >  
> >  err_set_suspended:
> >  	atomic_set(&ptdev->pm.state, PANTHOR_DEVICE_PM_STATE_SUSPENDED);
> > +	atomic_set(&ptdev->pm.recovery_needed, 1);
> >  	return ret;
> >  }
> >  
> > diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> > index 0e68f5a70d20..cc74e99e53f9 100644
> > --- a/drivers/gpu/drm/panthor/panthor_device.h
> > +++ b/drivers/gpu/drm/panthor/panthor_device.h
> > @@ -9,6 +9,7 @@
> >  #include <linux/atomic.h>
> >  #include <linux/io-pgtable.h>
> >  #include <linux/regulator/consumer.h>
> > +#include <linux/pm_runtime.h>
> >  #include <linux/sched.h>
> >  #include <linux/spinlock.h>
> >  
> > @@ -180,6 +181,9 @@ struct panthor_device {
> >  		 * is suspended.
> >  		 */
> >  		struct page *dummy_latest_flush;
> > +
> > +		/** @recovery_needed: True when a resume attempt failed. */
> > +		atomic_t recovery_needed;
> >  	} pm;
> >  
> >  	/** @profile_mask: User-set profiling flags for job accounting. */
> > @@ -243,6 +247,19 @@ int panthor_device_mmap_io(struct panthor_device *ptdev,
> >  int panthor_device_resume(struct device *dev);
> >  int panthor_device_suspend(struct device *dev);
> >  
> > +static inline int panthor_device_resume_and_get(struct panthor_device *ptdev)
> > +{
> > +	int ret = pm_runtime_resume_and_get(ptdev->base.dev);
> > +
> > +	/* If the resume failed, we need to clear the runtime_error, which we
> > +	 * can done by forcing the RPM state to suspended.
> > +	 */
> > +	if (ret && atomic_cmpxchg(&ptdev->pm.recovery_needed, 1, 0) == 1)  
> 
> I'm unclear what this atomic achieves. At first glance it appears
> pointless: with this change if panthor_device_resume() fails then
> recovery_needed is set to 1. So logically if ret != 0 then also
> recovery_needed == 1.
> 
> My second thought was is this to avoid races? If multiple threads are
> calling this then only one will win the cmpxchg and call
> pm_runtime_set_suspended. But it's not safe - it's quite possible for
> the first thread to get past the cmpxchg and be suspended before the
> second thread comes along and reaches the same point - leading to
> multiple calls to pm_runtime_set_suspended().

Yes, it was here to avoid the race. I don't think there's a risk of
multiple threads calling pm_runtime_set_suspended() without
actually needing such a call, because we won't reach
panthor_device_resume() until the runtime_error has been cleared
(runtime PM bails out early with a -EINVAL). So, in practice, there's no
way two threads can see a recovery_needed=1 unless the error has already
been cleared by the other thread and the second thread triggered
another resume error, in which case the second
pm_runtime_set_suspended() call is legit.

But now that you mention it, it indeed doesn't prevent the second
thread to call pm_runtime_resume_and_get() before the PM runtime_error
has been cleared, leading to potential spurious errors, so that's
annoying.
