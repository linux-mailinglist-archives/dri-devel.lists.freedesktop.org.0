Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8D0AB9A93
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 12:54:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CA9310EA6A;
	Fri, 16 May 2025 10:54:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QFxwAOXh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B1889CCE;
 Fri, 16 May 2025 10:54:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9ADC1629F7;
 Fri, 16 May 2025 10:54:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D00BC4CEE4;
 Fri, 16 May 2025 10:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747392849;
 bh=ohc7DfDIiQvdNb0dPe1MlJPp2M1+sDApTZIAeaQEVZs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QFxwAOXhSLpKcmSjFxSe38/EmugB/y4Bof2khjyqSZjTgTgG3bJnpHuSnPP/TDfgj
 kPvyQGxJSB7MabEM4bmwq/hh2Pf+g3lfH0zah2/RnbZYTXu1SfSDFxCK14iUVzh1zu
 ItMge9aGk/Pvsgl0R83sOOQdzgjdUw2fLO2+IKOxod6OLRTIckCBFjHLRyn3UU3+bH
 4zfNRkJvMurCXhZuoXhMDziFQqslOwY0Op6eBGGY3NN83tBliHoNYNnLk5Z+pEaIuC
 rWRjhY0kHGlVexot5A3c/WXIRXeE8xI//D4C9dVJMpFWp0qY2TtMILV3nV3Oo0Bic2
 QUmPwcorDjuug==
Date: Fri, 16 May 2025 12:54:00 +0200
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
Message-ID: <aCcZSA79X9Nk2mzh@pollux>
References: <20250424095535.26119-2-phasta@kernel.org>
 <20250424095535.26119-4-phasta@kernel.org>
 <1297389f-70f6-4813-8de8-1a0c4f92250a@igalia.com>
 <aCcLMhS5kyD60PEX@pollux>
 <e152d20b-c62e-47d9-a891-7910d1d24c6a@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e152d20b-c62e-47d9-a891-7910d1d24c6a@igalia.com>
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

On Fri, May 16, 2025 at 11:19:50AM +0100, Tvrtko Ursulin wrote:
> 
> On 16/05/2025 10:53, Danilo Krummrich wrote:
> > On Fri, May 16, 2025 at 10:33:30AM +0100, Tvrtko Ursulin wrote:
> > > On 24/04/2025 10:55, Philipp Stanner wrote:
> > > > +	 * @kill_fence_context: kill the fence context belonging to this scheduler
> > > 
> > > Which fence context would that be? ;)
> > 
> > There's one one per ring and a scheduler instance represents a single ring. So,
> > what should be specified here?
> 
> I was pointing out the fact not all drivers are 1:1 sched:entity.

I'm well aware, but how is that relevant? Entities don't have an associated
fence context, but a GPU Ring (either hardware or software) has, which a
scheduler instance represents.

> Thought it would be obvious from the ";)".

I should read from ";)" that you refer to a 1:N-sched:entity relationship (which
doesn't seem to be related)?

> > > Also, "fence context" would be a new terminology in gpu_scheduler.h API
> > > level. You could call it ->sched_fini() or similar to signify at which point
> > > in the API it gets called and then the fact it takes sched as parameter
> > > would be natural.
> > 
> > The driver should tear down the fence context in this callback, not the while
> > scheduler. ->sched_fini() would hence be misleading.
> 
> Not the while what? Not while drm_sched_fini()?

*whole

> Could call it sched_kill()
> or anything. My point is that we dont' have "fence context" in the API but
> entities so adding a new term sounds sub-optimal.

In the callback the driver should neither tear down an entity, nor the whole
scheduler, hence we shouldn't call it like that. sched_kill() is therefore
misleading as well.

It should be named after what it actually does (or should do). Feel free to
propose a different name that conforms with that.

> > > We also probably want some commentary on the topic of indefinite (or very
> > > long at least) blocking a thread exit / SIGINT/TERM/KILL time.
> > 
> > You mean in case the driver does implement the callback, but does *not* properly
> > tear down the fence context? So, you ask for describing potential consequences
> > of drivers having bugs in the implementation of the callback? Or something else?
> 
> I was proposing the kerneldoc for the vfunc should document the callback
> must not block, or if blocking is unavoidable, either document a guideline
> on how long is acceptable. Maybe even enforce a limit in the scheduler core
> itself.

Killing the fence context shouldn't block.
