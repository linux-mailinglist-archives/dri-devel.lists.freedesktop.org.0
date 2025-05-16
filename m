Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7D3AB9B97
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 14:00:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0378010E139;
	Fri, 16 May 2025 12:00:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Z5JTBLi8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F344610E139;
 Fri, 16 May 2025 12:00:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BC44149C10;
 Fri, 16 May 2025 12:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9940C4CEE4;
 Fri, 16 May 2025 12:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747396823;
 bh=Qa4y3GKkOrdDTRVqctWigtG5EuAl1QVHRyJ3XDg5GgQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z5JTBLi86om3e1ktFqyK9J1w3qVtyTj4drUlCJ8fOOfIx22CBRF4gOwlHPds/Czn1
 3OaBhbxhIQwbEkKsJhIN5bpGxzWvoSdzxPejoxiERNzhFhfZBCcAkFiWB4f7jFg3x6
 jQ5PQyvsC/nu6Le9Jr3VhGgfsVgsl5lPWBE5Apfx0l8uM0NZDjtscqdk/ItWcqcPGq
 gkC8JYIjdrL36c3jrbKiI2bFaRizn6N85qfESnYYyQd1PjZESLKbUxmlaK8lwecnY4
 AlVxKcNpvN4/27iLfqLYqe946Du1Npgrw3LUnd1rXyA+mQN9SPlT4SIlqXL5MxaPlz
 0LdXI6nFfW6NQ==
Date: Fri, 16 May 2025 14:00:17 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Philipp Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH v2 2/6] drm/sched: Prevent teardown waitque from blocking
 too long
Message-ID: <aCco0RFRVM1POr6J@pollux>
References: <20250424095535.26119-2-phasta@kernel.org>
 <20250424095535.26119-4-phasta@kernel.org>
 <1297389f-70f6-4813-8de8-1a0c4f92250a@igalia.com>
 <aCcLMhS5kyD60PEX@pollux>
 <e152d20b-c62e-47d9-a891-7910d1d24c6a@igalia.com>
 <aCcZSA79X9Nk2mzh@pollux>
 <24173faf-c2f0-4d08-93db-587891dc8b5d@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24173faf-c2f0-4d08-93db-587891dc8b5d@igalia.com>
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

On Fri, May 16, 2025 at 12:35:52PM +0100, Tvrtko Ursulin wrote:
> 
> On 16/05/2025 11:54, Danilo Krummrich wrote:
> > On Fri, May 16, 2025 at 11:19:50AM +0100, Tvrtko Ursulin wrote:
> > > 
> > > On 16/05/2025 10:53, Danilo Krummrich wrote:
> > > > On Fri, May 16, 2025 at 10:33:30AM +0100, Tvrtko Ursulin wrote:
> > > > > On 24/04/2025 10:55, Philipp Stanner wrote:
> > > > > > +	 * @kill_fence_context: kill the fence context belonging to this scheduler
> > > > > 
> > > > > Which fence context would that be? ;)
> > > > 
> > > > There's one one per ring and a scheduler instance represents a single ring. So,
> > > > what should be specified here?
> > > 
> > > I was pointing out the fact not all drivers are 1:1 sched:entity.
> > 
> > I'm well aware, but how is that relevant? Entities don't have an associated
> > fence context, but a GPU Ring (either hardware or software) has, which a
> > scheduler instance represents.
> 
> Aha! Well.. how it is relevant and do entities not have an associated fence
> context? Well, entity->fence_context.. that was my first association this
> whole time. Never it crossed my mind this is talking about the hardware
> fence context. Proof in the pudding naming should be improved.

It says "fence context belonging to this scheduler", which should be
unambiguous, however I agree that we could mark out the difference even more.

> But I also don't think there is a requirement for fences returned from
> ->run_job() to have a single context. Which again makes it not the best
> naming.

It's implied by the fact that a scheduler instance represents a ring. Having
multiple fence contexts per ring doesn't make any sense.

But it's indeed not written down -- we should do that then.

> > In the callback the driver should neither tear down an entity, nor the whole
> > scheduler, hence we shouldn't call it like that. sched_kill() is therefore
> > misleading as well.
> 
>  ->sched_exit()? ->sched_stop()? ->sched_cleanup()?

I think this all would throw up questions like "What does {exit,stop,cleanup}
mean in this context?". And the answer would be "kill the fence context of the
ring represented by the scheduler".

I think we want a name that represents that without an indirection that we have
to define.

> > It should be named after what it actually does (or should do). Feel free to
> > propose a different name that conforms with that.
> > 
> > > > > We also probably want some commentary on the topic of indefinite (or very
> > > > > long at least) blocking a thread exit / SIGINT/TERM/KILL time.
> > > > 
> > > > You mean in case the driver does implement the callback, but does *not* properly
> > > > tear down the fence context? So, you ask for describing potential consequences
> > > > of drivers having bugs in the implementation of the callback? Or something else?
> > > 
> > > I was proposing the kerneldoc for the vfunc should document the callback
> > > must not block, or if blocking is unavoidable, either document a guideline
> > > on how long is acceptable. Maybe even enforce a limit in the scheduler core
> > > itself.
> > 
> > Killing the fence context shouldn't block.
> 
> Cool. And maybe convert the wait_event to wait_event_timeout with a warning
> to be robust.

That would make sense if it could deadlock, but even if the driver does nothing
it should terminate eventually. The rule that we always rely on is that we
guarantee throughout the kernel that fences are signalled eventually.
