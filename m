Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE683A91BAE
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 14:11:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CCE310EAE5;
	Thu, 17 Apr 2025 12:11:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ToO2INEx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F17A10EAE2;
 Thu, 17 Apr 2025 12:11:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CA737435C3;
 Thu, 17 Apr 2025 12:11:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36B37C4CEEB;
 Thu, 17 Apr 2025 12:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744891879;
 bh=lqW4ZV78PUpIZxRhUo4K3BhUomPvUbJnWCbvg/1/2mM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ToO2INExwNl4kqty7krMMoCPBGRlj/hMpq8XYSGBqp39URfrfTNAm7q7c4n3ExSkT
 kHUS0TEDN6T7ZEFGZ/ZyotiENfGtZq9N4R2UpdDMSBS0QIQUZV1FyMV1/ZltUizB0/
 mvIo7DFwCuaiCe+0nC9YdiAJqb6RTFcUSG6gUUOkBq7E+Y1iyFu7CCL0K+uVvu+KVf
 F0KRXW7z3aRlk5N4oEkoPRi8VlDm2MVNCvN6eZYcPkk6eK+0cwSclcFlxOQHS6fAQH
 htA0sJd+km5QULpJQvyCf30aBnZr73lfuts/WxQfv1Rxco5QFqpADv1c24hYWwzljW
 llfSIOSsi/ICA==
Date: Thu, 17 Apr 2025 14:11:14 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: phasta@kernel.org, Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] drm/sched: Warn if pending list is not empty
Message-ID: <aADv4ivXZoJpEA7k@pollux>
References: <20250407152239.34429-2-phasta@kernel.org>
 <20250407152239.34429-5-phasta@kernel.org>
 <9607e5a54b8c5041dc7fc134425cc36c0c70b5f3.camel@mailbox.org>
 <3ac34c84-fd84-4598-96e1-239418b7109f@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3ac34c84-fd84-4598-96e1-239418b7109f@igalia.com>
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

On Thu, Apr 17, 2025 at 12:27:29PM +0100, Tvrtko Ursulin wrote:
> 
> On 17/04/2025 08:45, Philipp Stanner wrote:
> > On Mon, 2025-04-07 at 17:22 +0200, Philipp Stanner wrote:
> 
> Problem exactly is that jobs can outlive the entities and the scheduler,
> while some userspace may have a dma fence reference to the job via sync
> file. This new callback would not solve it for xe, but if everything
> required was reference counted it would.

I think you're mixing up the job and the dma_fence here, if a job outlives the
scheduler, it clearly is a bug, always has been.

AFAIK, Xe reference counts it's driver specific job structures *and* the driver
specific scheduler structure, such that drm_sched_fini() won't be called before
all jobs have finished.

The reference counting solution, however, potentially creates subsequent
lifetime problems, which I think have been discussed already in a different
thread already. Philipp can probably link in the corresponding discussion.

> On the design level it feels like it adds too much state machine and makes
> things hard to follow/maintain. It would be nice to find a solutiuon where
> we end up with less state machine and not more.

Multiple solutions have been discussed already, e.g. just wait for the pending
list to be empty, reference count the scheduler for every pending job. Those all
had significant downsides, which I don't see with this proposal.

I'm all for better ideas though -- what do you propose?

> 
> > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > index 6b72278c4b72..ae3152beca14 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > @@ -1465,6 +1465,10 @@ void drm_sched_fini(struct drm_gpu_scheduler
> > > *sched)
> > >   	sched->ready = false;
> > >   	kfree(sched->sched_rq);
> > >   	sched->sched_rq = NULL;
> > > +
> > > +	if (!list_empty(&sched->pending_list))
> > > +		dev_err(sched->dev, "%s: Tearing down scheduler
> > > while jobs are pending!\n",
> > > +			__func__);
> 
> It isn't fair to add this error since it would out of the blue start firing
> for everyone expect nouveau, no? Regardless if there is a leak or not.

I think it is pretty fair to warn when detecting a guaranteed bug, no?

If drm_sched_fini() is call while jobs are still on the pending_list, they won't
ever be freed, because all workqueues are stopped.
