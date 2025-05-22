Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DF4AC105F
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 17:53:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2213810E18C;
	Thu, 22 May 2025 15:53:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oH12sr3I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55CC310E18A;
 Thu, 22 May 2025 15:53:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BC1AB6135E;
 Thu, 22 May 2025 15:53:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55FBEC4CEE4;
 Thu, 22 May 2025 15:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747929232;
 bh=j71Wtt6NGq/5NYiuM9Hwj8gMHucqRDMzopuT74X4AM4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oH12sr3IaektTamfX3zPxeOpJwWe63tAxuGU5406UZJvL69MldB6nQlktq0/nN88K
 o9u2Swa4KI78b9LP2vEK6/LQ2748tCqV206mkbapEF4lM3cL/0nVoK1X9VKL//B0XE
 uTaJ3j8mgQu3nFOpnyL7VG/rUKsqrcYMtzxbYR9M6b4baHMQHfz0wYYGW5STWnep1X
 b3sNd9pk9AevMQ5gTCfjRhde8n7aP6T+jsZvg67TLTWQvpyHVlXiFcKUB2pDALjUcE
 Aa9Z+ZiOKxnZSketlExbSaiv4VoKs5dGNPNJhXztMxl8Innh+KiiNV60QJarei3Wv2
 Lqdm2Rn+NbwDg==
Date: Thu, 22 May 2025 17:53:46 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 phasta@kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v4 04/40] drm/sched: Add enqueue credit limit
Message-ID: <aC9Iih1KN6xb9LrK@cassiopeiae>
References: <aCYkk4Y7feltfp79@pollux>
 <CAF6AEGsoG_W3A3+BHV4n5EKZQazFubrCyfrtxVUH7+H4-j7i5A@mail.gmail.com>
 <aCY42rgJC4sQ4tp4@pollux>
 <CAF6AEGubHkdhfJz=bAZvctO1aTKDLwRsRyPzkoVrQ7tA6dRbKw@mail.gmail.com>
 <aCwqAGLLCC2ZLSBK@pollux>
 <CAF6AEGspvuTHU0t9z__p_HkdRNi=cXir3t453AbR6DFNzDpgvw@mail.gmail.com>
 <aCyzyAPbQ1SYbo4q@pollux>
 <CAF6AEGs+WmTO_624A3Pek-1-SD6B4PFu4sDv3htko0ABhfHFzw@mail.gmail.com>
 <aC8Dzgufa9E2MD6t@pollux>
 <CAF6AEGvkrN8H1ZPzrCQF+d_Y_Y5kRdeQjohDqcgpNd-uDKo9yQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGvkrN8H1ZPzrCQF+d_Y_Y5kRdeQjohDqcgpNd-uDKo9yQ@mail.gmail.com>
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

On Thu, May 22, 2025 at 07:47:17AM -0700, Rob Clark wrote:
> On Thu, May 22, 2025 at 4:00 AM Danilo Krummrich <dakr@kernel.org> wrote:
> > On Tue, May 20, 2025 at 10:22:54AM -0700, Rob Clark wrote:
> > > On Tue, May 20, 2025 at 9:54 AM Danilo Krummrich <dakr@kernel.org> wrote:
> > > > On Tue, May 20, 2025 at 09:07:05AM -0700, Rob Clark wrote:
> > > > > On Tue, May 20, 2025 at 12:06 AM Danilo Krummrich <dakr@kernel.org> wrote:
> > > > > > But let's assume we agree that we want to avoid that userspace can ever OOM itself
> > > > > > through async VM_BIND, then the proposed solution seems wrong:
> > > > > >
> > > > > > Do we really want the driver developer to set an arbitrary boundary of a number
> > > > > > of jobs that can be submitted before *async* VM_BIND blocks and becomes
> > > > > > semi-sync?
> > > > > >
> > > > > > How do we choose this number of jobs? A very small number to be safe, which
> > > > > > scales badly on powerful machines? A large number that scales well on powerful
> > > > > > machines, but OOMs on weaker ones?
> > > > >
> > > > > The way I am using it in msm, the credit amount and limit are in units
> > > > > of pre-allocated pages in-flight.  I set the enqueue_credit_limit to
> > > > > 1024 pages, once there are jobs queued up exceeding that limit, they
> > > > > start blocking.
> > > > >
> > > > > The number of _jobs_ is irrelevant, it is # of pre-alloc'd pages in flight.
> > > >
> > > > That doesn't make a difference for my question. How do you know 1024 pages is a
> > > > good value? How do we scale for different machines with different capabilities?
> > > >
> > > > If you have a powerful machine with lots of memory, we might throttle userspace
> > > > for no reason, no?
> > > >
> > > > If the machine has very limited resources, it might already be too much?
> > >
> > > It may be a bit arbitrary, but then again I'm not sure that userspace
> > > is in any better position to pick an appropriate limit.
> > >
> > > 4MB of in-flight pages isn't going to be too much for anything that is
> > > capable enough to run vk, but still allows for a lot of in-flight
> > > maps.
> >
> > Ok, but what about the other way around? What's the performance impact if the
> > limit is chosen rather small, but we're running on a very powerful machine?
> >
> > Since you already have the implementation for hardware you have access to, can
> > you please check if and how performance degrades when you use a very small
> > threshold?
> 
> I mean, considering that some drivers (asahi, at least), _only_
> implement synchronous VM_BIND, I guess blocking in extreme cases isn't
> so bad.

Which is not even upstream yet and eventually will support async VM_BIND too,
AFAIK.

> But I think you are overthinking this.  4MB of pagetables is
> enough to map ~8GB of buffers.
> 
> Perhaps drivers would want to set their limit based on the amount of
> memory the GPU could map, which might land them on a # larger than
> 1024, but still not an order of magnitude more.

Nouveau currently supports an address space width of 128TiB.

In general, we have to cover the range of some small laptop or handheld devices
to huge datacenter machines.

> I don't really have a good setup for testing games that use this, atm,
> fex-emu isn't working for me atm.  But I think Connor has a setup with
> proton working?

I just want to be sure that an arbitrary small limit doing the job for a small
device to not fail VK CTS can't regress the performance on large machines.

So, kindly try to prove that we're not prone to extreme performance regression
with a static value as you propose.

> > Also, I think we should probably put this throttle mechanism in a separate
> > component, that just wraps a counter of bytes or rather pages that can be
> > increased and decreased through an API and the increase just blocks at a certain
> > threshold.
> 
> Maybe?  I don't see why we need to explicitly define the units for the
> credit.  This wasn't done for the existing credit mechanism.. which,
> seems like if you used some extra fences could also have been
> implemented externally.

If you are referring to the credit mechanism in the scheduler for ring buffers,
that's a different case. Drivers know the size of their ring buffers exactly and
the scheduler has the responsibility of when to submit tasks to the ring buffer.
So the scheduler kind of owns the resource.

However, the throttle mechanism you propose is independent from the scheduler,
it depends on the available system memory, a resource the scheduler doesn't own.

I'm fine to make the unit credits as well, but in this case we really care about
the consumption of system memory, so we could just use an applicable unit.

> > This component can then be called by a driver from the job submit IOCTL and the
> > corresponding place where the pre-allocated memory is actually used / freed.
> >
> > Depending on the driver, this might not necessarily be in the scheduler's
> > run_job() callback.
> >
> > We could call the component something like drm_throttle or drm_submit_throttle.
> 
> Maybe?  This still has the same complaint I had about just
> implementing this in msm.. it would have to reach in and use the
> scheduler's job_scheduled wait-queue.  Which, to me at least, seems
> like more of an internal detail about how the scheduler works.

Why? The component should use its own waitqueue. Subsequently, from your code
that releases the pre-allocated memory, you can decrement the counter through
the drm_throttle API, which automatically kicks its the waitqueue.

For instance from your VM_BIND IOCTL you can call

	drm_throttle_inc(value)

which blocks if the increment goes above the threshold. And when you release the
pre-allocated memory you call

	drm_throttle_dec(value)

which wakes the waitqueue and unblocks the drm_throttle_inc() call from your
VM_BIND IOCTL.

Another advantage is that, if necessary, we can make drm_throttle
(automatically) scale for the machines resources, which otherwise we'd need to
pollute the scheduler with.
