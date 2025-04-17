Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16249A92026
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 16:48:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B44710E0E8;
	Thu, 17 Apr 2025 14:48:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BaMbbMiV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 879F510E0E8;
 Thu, 17 Apr 2025 14:48:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CAA446112E;
 Thu, 17 Apr 2025 14:48:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1C73C4CEE4;
 Thu, 17 Apr 2025 14:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744901320;
 bh=RI/pNBGOBuU1tex11uln3ZwTbH6w91FDPPlShMn6CMY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BaMbbMiVO72PWqE+wuhllqZfSj1/11mbYrcY3ytogNL6BTf/uS27sNzpQw6FUvXUn
 ou3fGk/g+RImiLZEXMgEQOxRUMIARQFUnNQ/qUhO4wEkPjyTuFAD1HtPqimfzmmmNO
 l5jkFSHRA1uGhwy5hrZbpWyf/1s1YbQ3oviafPEOCBO6l+HPioi/cccK4EyhIuJ5Mf
 AHr4YhvXN8snAD4m4nL6CdexEBU8MPFm8yb4RUgMD1YKA/TZy9tJA/0Q06EQtbfkmh
 BYgG41G7daMyrjKi9cBQE/X3RELHy00IpjV8US1lNmsNntENQjPwjkbIJYENOo7Avf
 rfS4hnN/PlwCw==
Date: Thu, 17 Apr 2025 16:48:34 +0200
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
Message-ID: <aAEUwjzZ9w9xlKRY@cassiopeiae>
References: <20250407152239.34429-2-phasta@kernel.org>
 <20250407152239.34429-5-phasta@kernel.org>
 <9607e5a54b8c5041dc7fc134425cc36c0c70b5f3.camel@mailbox.org>
 <3ac34c84-fd84-4598-96e1-239418b7109f@igalia.com>
 <aADv4ivXZoJpEA7k@pollux>
 <83758ca7-8ece-433e-b904-3d21690ead23@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <83758ca7-8ece-433e-b904-3d21690ead23@igalia.com>
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

On Thu, Apr 17, 2025 at 03:20:44PM +0100, Tvrtko Ursulin wrote:
> 
> On 17/04/2025 13:11, Danilo Krummrich wrote:
> > On Thu, Apr 17, 2025 at 12:27:29PM +0100, Tvrtko Ursulin wrote:
> > > 
> > > On 17/04/2025 08:45, Philipp Stanner wrote:
> > > > On Mon, 2025-04-07 at 17:22 +0200, Philipp Stanner wrote:
> > > 
> > > Problem exactly is that jobs can outlive the entities and the scheduler,
> > > while some userspace may have a dma fence reference to the job via sync
> > > file. This new callback would not solve it for xe, but if everything
> > > required was reference counted it would.
> > 
> > I think you're mixing up the job and the dma_fence here, if a job outlives the
> > scheduler, it clearly is a bug, always has been.
> > 
> > AFAIK, Xe reference counts it's driver specific job structures *and* the driver
> > specific scheduler structure, such that drm_sched_fini() won't be called before
> > all jobs have finished.
> 
> Yes, sorry, dma fence. But it is not enough to postpone drm_sched_fini until
> the job is not finished. Problem is exported dma fence holds the pointer to
> drm_sched_fence (and so oopses in drm_sched_fence_get_timeline_name on
> fence->sched->name) *after* job had finished and driver was free to tear
> everything down.

Well, that's a bug in drm_sched_fence then and independent from the other topic.
Once the finished fence in a struct drm_sched_fence has been signaled it must
live independent of the scheduler.

The lifetime of the drm_sched_fence is entirely independent from the scheduler
itself, as you correctly point out.

Starting to reference count things to keep the whole scheduler etc. alive as
long as the drm_sched_fence lives is not the correct solution.

> > Multiple solutions have been discussed already, e.g. just wait for the pending
> > list to be empty, reference count the scheduler for every pending job. Those all
> > had significant downsides, which I don't see with this proposal.
> > 
> > I'm all for better ideas though -- what do you propose?
> 
> I think we need to brainstorm both issues and see if there is a solution
> which solves them both, with bonus points for being elegant.

The problems are not related. As mentioned above, once signaled a
drm_sched_fence must not depend on the scheduler any longer.

> > > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > index 6b72278c4b72..ae3152beca14 100644
> > > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > @@ -1465,6 +1465,10 @@ void drm_sched_fini(struct drm_gpu_scheduler
> > > > > *sched)
> > > > >    	sched->ready = false;
> > > > >    	kfree(sched->sched_rq);
> > > > >    	sched->sched_rq = NULL;
> > > > > +
> > > > > +	if (!list_empty(&sched->pending_list))
> > > > > +		dev_err(sched->dev, "%s: Tearing down scheduler
> > > > > while jobs are pending!\n",
> > > > > +			__func__);
> > > 
> > > It isn't fair to add this error since it would out of the blue start firing
> > > for everyone expect nouveau, no? Regardless if there is a leak or not.
> > 
> > I think it is pretty fair to warn when detecting a guaranteed bug, no?
> > 
> > If drm_sched_fini() is call while jobs are still on the pending_list, they won't
> > ever be freed, because all workqueues are stopped.
> 
> Is it a guaranteed bug for drivers are aware of the drm_sched_fini()
> limitation and are cleaning up upon themselves?

How could a driver clean up on itself (unless the driver holds its own list of
pending jobs)?

Once a job is in flight (i.e. it's on the pending_list) we must guarantee that
free_job() is called by the scheduler, which it can't do if we call
drm_sched_fini() before the pending_list is empty.

> In other words if you apply the series up to here would it trigger for
> nouveau?

No, because nouveau does something very stupid, i.e. replicate the pending_list.

> Reportedly it triggers for the mock scheduler which also has no
> leak.

That sounds impossible. How do you ensure you do *not* leak memory when you tear
down the scheduler while it still has pending jobs? Or in other words, who calls
free_job() if not the scheduler itself?

> Also, I asked in my initial reply if we have a list of which of the current
> drivers suffer from memory leaks. Is it all or some etc.

Not all, but quite some I think. The last time I looked (which is about a year
ago) amdgpu for instance could leak memory when you unbind the driver while
enough jobs are in flight.
