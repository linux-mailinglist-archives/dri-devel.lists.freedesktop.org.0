Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1C43AFD51
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 08:50:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C05389C03;
	Tue, 22 Jun 2021 06:50:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 629DB89C03
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 06:50:56 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D4D0D1F427AD;
 Tue, 22 Jun 2021 07:50:54 +0100 (BST)
Date: Tue, 22 Jun 2021 08:50:52 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v2 2/2] drm/panfrost: Queue jobs on the hardware
Message-ID: <20210622085052.202c9cce@collabora.com>
In-Reply-To: <79669b33-afc7-7eae-988a-f3141fffa2d4@arm.com>
References: <20210621140226.1685529-1-boris.brezillon@collabora.com>
 <20210621140226.1685529-3-boris.brezillon@collabora.com>
 <79669b33-afc7-7eae-988a-f3141fffa2d4@arm.com>
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
Cc: dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 21 Jun 2021 17:08:21 +0100
Steven Price <steven.price@arm.com> wrote:

> On 21/06/2021 15:02, Boris Brezillon wrote:
> > From: Steven Price <steven.price@arm.com>
> > 
> > The hardware has a set of '_NEXT' registers that can hold a second job
> > while the first is executing. Make use of these registers to enqueue a
> > second job per slot.
> > 
> > v2:
> > * Make sure non-faulty jobs get properly paused/resumed on GPU reset
> > 
> > Signed-off-by: Steven Price <steven.price@arm.com>
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> >  drivers/gpu/drm/panfrost/panfrost_device.h |   2 +-
> >  drivers/gpu/drm/panfrost/panfrost_job.c    | 311 ++++++++++++++++-----
> >  2 files changed, 242 insertions(+), 71 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
> > index 95e6044008d2..a87917b9e714 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> > +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> > @@ -101,7 +101,7 @@ struct panfrost_device {
> >  
> >  	struct panfrost_job_slot *js;
> >  
> > -	struct panfrost_job *jobs[NUM_JOB_SLOTS];
> > +	struct panfrost_job *jobs[NUM_JOB_SLOTS][2];
> >  	struct list_head scheduled_jobs;
> >  
> >  	struct panfrost_perfcnt *perfcnt;
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> > index 1b5c636794a1..888eceed227f 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> > @@ -4,6 +4,7 @@
> >  #include <linux/delay.h>
> >  #include <linux/interrupt.h>
> >  #include <linux/io.h>
> > +#include <linux/iopoll.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/pm_runtime.h>
> >  #include <linux/dma-resv.h>
> > @@ -41,6 +42,7 @@ struct panfrost_queue_state {
> >  };
> >  
> >  struct panfrost_job_slot {
> > +	int irq;
> >  	struct panfrost_queue_state queue[NUM_JOB_SLOTS];
> >  	spinlock_t job_lock;
> >  };
> > @@ -148,9 +150,43 @@ static void panfrost_job_write_affinity(struct panfrost_device *pfdev,
> >  	job_write(pfdev, JS_AFFINITY_NEXT_HI(js), affinity >> 32);
> >  }
> >  
> > +static struct panfrost_job *
> > +panfrost_dequeue_job(struct panfrost_device *pfdev, int slot)
> > +{
> > +	struct panfrost_job *job = pfdev->jobs[slot][0];
> > +
> > +	pfdev->jobs[slot][0] = pfdev->jobs[slot][1];
> > +	pfdev->jobs[slot][1] = NULL;
> > +
> > +	return job;
> > +}
> > +
> > +static unsigned int
> > +panfrost_enqueue_job(struct panfrost_device *pfdev, int slot,
> > +		     struct panfrost_job *job)
> > +{
> > +	if (!pfdev->jobs[slot][0]) {
> > +		pfdev->jobs[slot][0] = job;
> > +		return 0;
> > +	}
> > +
> > +	WARN_ON(pfdev->jobs[slot][1]);
> > +	pfdev->jobs[slot][1] = job;
> > +	return 1;
> > +}
> > +
> > +static u32
> > +panfrost_get_job_chain_flag(const struct panfrost_job *job)
> > +{
> > +	struct panfrost_fence *f = to_panfrost_fence(job->done_fence);
> > +
> > +	return (f->seqno & 1) ? JS_CONFIG_JOB_CHAIN_FLAG : 0;  
> 
> Is the seqno going to reliably toggle like this? We need to ensure that
> when there are two jobs on the hardware they have different "job chain
> disambiguation" flags.

f->seqno is assigned the queue->emit_seqno which increases
monotonically at submission time. Since nothing can fail after the
fence creation in the submission path, 2 consecutive jobs on a given
queue should have different (f->seqno & 1) values.

> 
> Also that feature was only introduced in t76x. So relying on that would
> sadly kill off support for t60x, t62x and t72x (albeit I'm not sure how
> 'supported' these are with Mesa anyway).
> 
> It is possible to implement without the disambiguation flag - but it's
> a bit fiddly: it requires clearing out the _NEXT register, checking that
> you actually cleared it successfully (i.e. the hardware didn't just
> start the job before you cleared it) and then doing the action if still
> necessary. And of course then recovering from having cleared out _NEXT.
> There's a reason for adding the feature! ;)

As mentioned in my previous reply, I think I'll just disable this
feature on t72x-.

> 
> I'll try to review the rest and give it a spin later - although it's of
> course it looks quite familiar ;)

Thank you for your valuable feedback.

Regards,

Boris
