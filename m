Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 748113B2BF7
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 11:56:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4FBE6EA3C;
	Thu, 24 Jun 2021 09:56:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E2106EA3C
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 09:56:39 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9E48C1F43C9B;
 Thu, 24 Jun 2021 10:56:37 +0100 (BST)
Date: Thu, 24 Jun 2021 11:56:32 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v2 2/2] drm/panfrost: Queue jobs on the hardware
Message-ID: <20210624115632.6ac8c073@collabora.com>
In-Reply-To: <c797d32a-1d0f-3d67-d7cd-fc9f9522d741@arm.com>
References: <20210621140226.1685529-1-boris.brezillon@collabora.com>
 <20210621140226.1685529-3-boris.brezillon@collabora.com>
 <c797d32a-1d0f-3d67-d7cd-fc9f9522d741@arm.com>
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

On Thu, 24 Jun 2021 10:23:51 +0100
Steven Price <steven.price@arm.com> wrote:

> >  static void panfrost_job_handle_irq(struct panfrost_device *pfdev, u32 status)
> >  {
> > -	int j;
> > +	struct panfrost_job *done[NUM_JOB_SLOTS][2] = {};
> > +	struct panfrost_job *failed[NUM_JOB_SLOTS] = {};
> > +	u32 js_state, js_events = 0;
> > +	unsigned int i, j;
> >  
> > -	dev_dbg(pfdev->dev, "jobslot irq status=%x\n", status);
> > +	while (status) {
> > +		for (j = 0; j < NUM_JOB_SLOTS; j++) {
> > +			if (status & JOB_INT_MASK_DONE(j)) {
> > +				if (done[j][0]) {
> > +					done[j][1] = panfrost_dequeue_job(pfdev, j);
> > +					WARN_ON(!done[j][1]);
> > +				} else {
> > +					done[j][0] = panfrost_dequeue_job(pfdev, j);
> > +					WARN_ON(!done[j][0]);  
> 
> NIT: I'd be tempted to move this WARN_ON into panfrost_dequeue_job() as
> it's relevant for any call to the function.

Makes sense. I'll move those WARN_ON()s.

> 
> > +				}
> > +			}
> >  
> > -	for (j = 0; status; j++) {
> > -		u32 mask = MK_JS_MASK(j);
> > +			if (status & JOB_INT_MASK_ERR(j)) {
> > +				/* Cancel the next submission. Will be submitted
> > +				 * after we're done handling this failure if
> > +				 * there's no reset pending.
> > +				 */
> > +				job_write(pfdev, JS_COMMAND_NEXT(j), JS_COMMAND_NOP);
> > +				failed[j] = panfrost_dequeue_job(pfdev, j);
> > +			}
> > +		}
> >  
> > -		if (!(status & mask))
> > +		/* JS_STATE is sampled when JOB_INT_CLEAR is written.
> > +		 * For each BIT(slot) or BIT(slot + 16) bit written to
> > +		 * JOB_INT_CLEAR, the corresponding bits in JS_STATE
> > +		 * (BIT(slot) and BIT(slot + 16)) are updated, but this
> > +		 * is racy. If we only have one job done at the time we
> > +		 * read JOB_INT_RAWSTAT but the second job fails before we
> > +		 * clear the status, we end up with a status containing
> > +		 * only the DONE bit and consider both jobs as DONE since
> > +		 * JS_STATE reports both NEXT and CURRENT as inactive.
> > +		 * To prevent that, let's repeat this clear+read steps
> > +		 * until status is 0.
> > +		 */
> > +		job_write(pfdev, JOB_INT_CLEAR, status);
> > +		js_state = job_read(pfdev, JOB_INT_JS_STATE);  
> 
> This seems a bit dodgy. The spec says that JOB_INT_JS_STATE[1] is
> updated only for the job slots which have bits set in the JOB_INT_CLEAR.
> So there's potentially two problems:
> 
>  * The spec makes no gaurentee about the values of the bits for other
> slots. But we're not masking off those bits.
> 
>  * If we loop (e.g. because the other slot finishes while handling the
> first interrupt) then we may lose the state for the first slot.
> 
> I'm not sure what the actual hardware returns in the bits which are
> unrelated to the previous JOB_INT_CLEAR - kbase is careful only to
> consider the bits relating to the slot it's currently dealing with.

Hm, I see. How about something like that?

        struct panfrost_job *done[NUM_JOB_SLOTS][2] = {};
        struct panfrost_job *failed[NUM_JOB_SLOTS] = {};
        u32 js_state = 0, js_events = 0;
        unsigned int i, j;

        while (status) {
                u32 js_state_mask = 0;

                for (j = 0; j < NUM_JOB_SLOTS; j++) {
                        if (status & MK_JS_MASK(j))
                                js_state_mask |= MK_JS_MASK(j);

                        if (status & JOB_INT_MASK_DONE(j)) {
                                if (done[j][0]) {
                                        done[j][1] = panfrost_dequeue_job(pfdev, j);
                                        WARN_ON(!done[j][1]);
                                } else {
                                        done[j][0] = panfrost_dequeue_job(pfdev, j);
                                        WARN_ON(!done[j][0]);
                                }
                        }

                        if (status & JOB_INT_MASK_ERR(j)) {
                                /* Cancel the next submission. Will be submitted
                                 * after we're done handling this failure if
                                 * there's no reset pending.
                                 */
                                job_write(pfdev, JS_COMMAND_NEXT(j), JS_COMMAND_NOP);
                                failed[j] = panfrost_dequeue_job(pfdev, j);
                        }
                }

                /* JS_STATE is sampled when JOB_INT_CLEAR is written.
                 * For each BIT(slot) or BIT(slot + 16) bit written to
                 * JOB_INT_CLEAR, the corresponding bits in JS_STATE
                 * (BIT(slot) and BIT(slot + 16)) are updated, but this
                 * is racy. If we only have one job done at the time we
                 * read JOB_INT_RAWSTAT but the second job fails before we
                 * clear the status, we end up with a status containing
                 * only the DONE bit and consider both jobs as DONE since
                 * JS_STATE reports both NEXT and CURRENT as inactive.
                 * To prevent that, let's repeat this clear+read steps
                 * until status is 0.
                 */
                job_write(pfdev, JOB_INT_CLEAR, status);
                js_state &= ~js_state_mask;
                js_state |= job_read(pfdev, JOB_INT_JS_STATE) & js_state_mask;
                js_events |= status;
                status = job_read(pfdev, JOB_INT_RAWSTAT);
        }


> 
> [1] Actually JOB_IRQ_JS_STATE - I sometimes think we should rename to
> match the spec, I keep searching the docs for the wrong name ;)

I can add a patch doing that :-).

> >  
> > -		status &= ~mask;
> > +	for (j = 0; j < NUM_JOB_SLOTS; j++) {
> > +		if (!(js_events & MK_JS_MASK(j)))
> > +			continue;
> > +
> > +		if (!failed[j] || !pfdev->jobs[j][0])
> > +			continue;
> > +
> > +		if (pfdev->jobs[j][0]->jc == 0) {
> > +			/* The job was cancelled, signal the fence now */
> > +			struct panfrost_job *canceled = panfrost_dequeue_job(pfdev, j);
> > +
> > +			panfrost_mmu_as_put(pfdev, canceled->file_priv->mmu);
> > +			panfrost_devfreq_record_idle(&pfdev->pfdevfreq);
> > +
> > +			dma_fence_set_error(canceled->done_fence, -ECANCELED);
> > +			dma_fence_signal_locked(canceled->done_fence);
> > +			pm_runtime_put_autosuspend(pfdev->dev);
> > +		} else if (!atomic_read(&pfdev->reset.pending)) {
> > +			/* Resume the job we stopped if no reset is pending */
> > +			job_write(pfdev, JS_COMMAND_NEXT(j), JS_COMMAND_START);  
> 
> If I'm following correctly this is resubmitting a soft-stopped job. But
> I haven't seen where the new JC pointer is written.

Not exactly. It's submitting a job that was queued but not started.
When we see a fault, we write NOP to COMMAND_NEXT so the next job is
not started when the interrupt is cleared. And here we're just
requeuing it.

