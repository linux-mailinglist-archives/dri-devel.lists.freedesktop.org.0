Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AD03B4721
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 18:02:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2CB96EE0D;
	Fri, 25 Jun 2021 16:02:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F03EB6EE0D
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jun 2021 16:02:13 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 85AFD1F4444D;
 Fri, 25 Jun 2021 17:02:12 +0100 (BST)
Date: Fri, 25 Jun 2021 18:02:07 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v3 10/15] drm/panfrost: Make sure job interrupts are
 masked before resetting
Message-ID: <20210625180207.329b1956@collabora.com>
In-Reply-To: <49a60b4f-911e-2c03-29ce-4b1b9f605b3d@arm.com>
References: <20210625133327.2598825-1-boris.brezillon@collabora.com>
 <20210625133327.2598825-11-boris.brezillon@collabora.com>
 <49a60b4f-911e-2c03-29ce-4b1b9f605b3d@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 25 Jun 2021 16:55:12 +0100
Steven Price <steven.price@arm.com> wrote:

> On 25/06/2021 14:33, Boris Brezillon wrote:
> > This is not yet needed because we let active jobs be killed during by
> > the reset and we don't really bother making sure they can be restarted.
> > But once we start adding soft-stop support, controlling when we deal
> > with the remaining interrrupts and making sure those are handled before
> > the reset is issued gets tricky if we keep job interrupts active.
> > 
> > Let's prepare for that and mask+flush job IRQs before issuing a reset.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> >  drivers/gpu/drm/panfrost/panfrost_job.c | 21 +++++++++++++++------
> >  1 file changed, 15 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> > index 88d34fd781e8..0566e2f7e84a 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> > @@ -34,6 +34,7 @@ struct panfrost_queue_state {
> >  struct panfrost_job_slot {
> >  	struct panfrost_queue_state queue[NUM_JOB_SLOTS];
> >  	spinlock_t job_lock;
> > +	int irq;
> >  };
> >  
> >  static struct panfrost_job *
> > @@ -400,7 +401,15 @@ static void panfrost_reset(struct panfrost_device *pfdev,
> >  	if (bad)
> >  		drm_sched_increase_karma(bad);
> >  
> > -	spin_lock(&pfdev->js->job_lock);  
> 
> I'm not sure it's safe to remove this lock as this protects the
> pfdev->jobs array: I can't see what would prevent panfrost_job_close()
> running at the same time without the lock. Am I missing something?

Ah, you're right, I'll add it back.

> 
> > +	/* Mask job interrupts and synchronize to make sure we won't be
> > +	 * interrupted during our reset.
> > +	 */
> > +	job_write(pfdev, JOB_INT_MASK, 0);
> > +	synchronize_irq(pfdev->js->irq);
> > +
> > +	/* Schedulers are stopped and interrupts are masked+flushed, we don't
> > +	 * need to protect the 'evict unfinished jobs' lock with the job_lock.
> > +	 */
> >  	for (i = 0; i < NUM_JOB_SLOTS; i++) {
> >  		if (pfdev->jobs[i]) {
> >  			pm_runtime_put_noidle(pfdev->dev);
> > @@ -408,7 +417,6 @@ static void panfrost_reset(struct panfrost_device *pfdev,
> >  			pfdev->jobs[i] = NULL;
> >  		}
> >  	}
> > -	spin_unlock(&pfdev->js->job_lock);
> >  
> >  	panfrost_device_reset(pfdev);
> >  
> > @@ -504,6 +512,7 @@ static void panfrost_job_handle_irq(struct panfrost_device *pfdev, u32 status)
> >  
> >  			job = pfdev->jobs[j];
> >  			/* Only NULL if job timeout occurred */
> > +			WARN_ON(!job);  
> 
> Was this WARN_ON intentional?

Yes, now that we mask and synchronize the irq in the reset I don't see
any reason why we would end up with an event but no job to attach this
even to, but maybe I missed something.
