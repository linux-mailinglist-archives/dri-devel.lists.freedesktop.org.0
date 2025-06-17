Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B42BADD10A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 17:09:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C01410E76D;
	Tue, 17 Jun 2025 15:09:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="u+easgqy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CA2A10E775
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 15:09:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 599F85C63C3;
 Tue, 17 Jun 2025 15:06:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7359C4CEE3;
 Tue, 17 Jun 2025 15:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750172942;
 bh=GFHXVRfzC0mqtyiNtLvDOfJgC8NaMnttOwFnd4gpPos=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=u+easgqyr5Nv1UFLjGa/E1qiPETFVvSl5Mw1ks1H5dNWdDhN5AQeioE8a8z2xpels
 vQBcgfZS07SupunLRnHH9UIAn/+8P7j4G3+1nxOqQ3ZusnXyEjta9oR6MRJMCdT4qn
 oBBsqOoY/Uaj2hOoXcSwxmH19+tF1F6UxyR4IOj8j4jHauqPDaKT+wMU9DGQpfMd0Y
 7jYzGESm5km23wghRhfFiTBcHDVP554sTMB3laNnp2/0B5K/YNJhSfjQA6j1Wk+6BO
 O/d/B1D74zlauqA56fdKRFyriyW7XMY+DSJG9Ao83zXdbAtR9GjuU7hYsZR5CqaNLY
 v9p5UWiEqdjoQ==
Date: Tue, 17 Jun 2025 17:08:57 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Philipp Stanner <phasta@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: Re: [PATCH v2] drm/sched: Clarify scenarios for separate workqueues
Message-ID: <aFGFCc7eiZJM8RKM@pollux>
References: <20250612144953.111829-2-phasta@kernel.org>
 <aFFy5aG1eOeMU44S@phenom.ffwll.local> <aFF3YIAFkgsAKvQV@pollux>
 <aFF6xeu78cXTGFH0@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFF6xeu78cXTGFH0@phenom.ffwll.local>
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

On Tue, Jun 17, 2025 at 04:25:09PM +0200, Simona Vetter wrote:
> On Tue, Jun 17, 2025 at 04:10:40PM +0200, Danilo Krummrich wrote:
> > On Tue, Jun 17, 2025 at 03:51:33PM +0200, Simona Vetter wrote:
> > > On Thu, Jun 12, 2025 at 04:49:54PM +0200, Philipp Stanner wrote:
> > > > + * NOTE that sharing &struct drm_sched_init_args.submit_wq with the driver
> > > > + * theoretically can deadlock. It must be guaranteed that submit_wq never has
> > > > + * more than max_active - 1 active tasks, or if max_active tasks are reached at
> > > > + * least one of them does not execute operations that may block on dma_fences
> > > > + * that potentially make progress through this scheduler instance. Otherwise,
> > > > + * it is possible that all max_active tasks end up waiting on a dma_fence (that
> > > > + * can only make progress through this schduler instance), while the
> > > > + * scheduler's queued work waits for at least one of the max_active tasks to
> > > > + * finish. Thus, this can result in a deadlock.
> > > 
> > > Uh if you have an ordered wq you deadlock with just one misuse. I'd just
> > > explain that the wq must provide sufficient forward-progress guarantees
> > > for the scheduler, specifically that it's on the dma_fence signalling
> > > critical path and leave the concrete examples for people to figure out
> > > when the design a specific locking scheme.
> > 
> > This isn't a concrete example, is it? It's exactly what you say in slightly
> > different words, with the addition of highlighting the impact of the workqueue's
> > max_active configuration.
> > 
> > I think that's relevant, because N - 1 active tasks can be on the dma_fence
> > signalling critical path without issues.
> > 
> > We could change
> > 
> > 	"if max_active tasks are reached at least one of them must not execute
> > 	 operations that may block on dma_fences that potentially make progress
> > 	 through this scheduler instance"
> > 
> > to 
> > 
> > 	"if max_active tasks are reached at least one of them must not be on the
> > 	 dma_fence signalling critical path"
> > 
> > which is a bit more to the point I think.
> 
> My point was to more state that the wq must be suitable for the scheduler
> jobs as the general issue, and specifically then also highlight the
> dma_fence concurrency issue.

Sure, there are more guarantees the driver has to uphold, but this is one of
them, so I think we should explain it.

> But it's not the only one, you can have driver locks and other fun involved
> here too.

Yeah, but it boils down to the same issue, e.g. if a driver takes a lock in
active work, and this lock is taken elsewhere for activities that violate the
dma_fence signalling critical path.

All the cases I have in mind boil down to that we potentially, either directly
or indirectly (through some synchronization primitive), wait for things we are
not allowed to wait for in the dma_fence signalling critical path.

Or do you mean something different?

> Also since all the paragraphs above talk about ordered wq as the example
> where specifying your own wq makes sense, it's a bit confusing to now
> suddenly only talk about the concurrent wq case without again mentioned
> that the ordered wq case is really limited.

I mean, it talks about both cases in a generic way, i.e. if you set
max_active == 1 in the text it covers the ordered case.

Or do you mean to say that we should *only* allow ordered workqueues to be
shared with the driver?
