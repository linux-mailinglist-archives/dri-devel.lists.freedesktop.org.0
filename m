Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11043AC0A3A
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 13:00:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 388DF10E966;
	Thu, 22 May 2025 11:00:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WcCEbIaQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91AAA10E938;
 Thu, 22 May 2025 11:00:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C73125C49FA;
 Thu, 22 May 2025 10:58:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5519CC4CEE4;
 Thu, 22 May 2025 11:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747911636;
 bh=PYI7vpOuR2UMtKq8PUt1Q1ak0/7zynD9AcO4jhKTgjs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WcCEbIaQ91oyzISl3Wzab95PTIBy/iA/lM1T3q6iTGKzrT3syzSCSxiXzvYcdJ/mn
 cmxUq6w7K423sd+23FxVPceaEcuw0wYwsxJXWLVaeMC6+icHJNc28GWR9Hqlvsuj+9
 KN/MFsSqmOr+PKDVb7VJ5JkqKxV/sZKUPn+mT+Ulki+sUdmYNM15TlOe6HvP7/h33x
 PFW6ethFKy00GvxfQRDyZaqxLsPc4ZLuK2xDD8E9A590gG3P1IRIo02yLZkvFgtuzE
 rru4hr+bepkKB7Hv1BYwg/kPim4hNpIdm9gcHV3A9kmvjWQvfnYHdZ4/CwJ6ncPxF7
 LsCCDpMHrsgkg==
Date: Thu, 22 May 2025 13:00:30 +0200
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
Message-ID: <aC8Dzgufa9E2MD6t@pollux>
References: <CAJs_Fx771FFVDVFMn8YJkR9f9Ad-UQspJ9KKQw4u6Cu4TA7YPA@mail.gmail.com>
 <CACu1E7EL+E-M0N-EAN9Bx7u9O6_pECQQdPE2ph575idhVb2Szg@mail.gmail.com>
 <aCYkk4Y7feltfp79@pollux>
 <CAF6AEGsoG_W3A3+BHV4n5EKZQazFubrCyfrtxVUH7+H4-j7i5A@mail.gmail.com>
 <aCY42rgJC4sQ4tp4@pollux>
 <CAF6AEGubHkdhfJz=bAZvctO1aTKDLwRsRyPzkoVrQ7tA6dRbKw@mail.gmail.com>
 <aCwqAGLLCC2ZLSBK@pollux>
 <CAF6AEGspvuTHU0t9z__p_HkdRNi=cXir3t453AbR6DFNzDpgvw@mail.gmail.com>
 <aCyzyAPbQ1SYbo4q@pollux>
 <CAF6AEGs+WmTO_624A3Pek-1-SD6B4PFu4sDv3htko0ABhfHFzw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGs+WmTO_624A3Pek-1-SD6B4PFu4sDv3htko0ABhfHFzw@mail.gmail.com>
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

On Tue, May 20, 2025 at 10:22:54AM -0700, Rob Clark wrote:
> On Tue, May 20, 2025 at 9:54 AM Danilo Krummrich <dakr@kernel.org> wrote:
> > On Tue, May 20, 2025 at 09:07:05AM -0700, Rob Clark wrote:
> > > On Tue, May 20, 2025 at 12:06 AM Danilo Krummrich <dakr@kernel.org> wrote:
> > > > But let's assume we agree that we want to avoid that userspace can ever OOM itself
> > > > through async VM_BIND, then the proposed solution seems wrong:
> > > >
> > > > Do we really want the driver developer to set an arbitrary boundary of a number
> > > > of jobs that can be submitted before *async* VM_BIND blocks and becomes
> > > > semi-sync?
> > > >
> > > > How do we choose this number of jobs? A very small number to be safe, which
> > > > scales badly on powerful machines? A large number that scales well on powerful
> > > > machines, but OOMs on weaker ones?
> > >
> > > The way I am using it in msm, the credit amount and limit are in units
> > > of pre-allocated pages in-flight.  I set the enqueue_credit_limit to
> > > 1024 pages, once there are jobs queued up exceeding that limit, they
> > > start blocking.
> > >
> > > The number of _jobs_ is irrelevant, it is # of pre-alloc'd pages in flight.
> >
> > That doesn't make a difference for my question. How do you know 1024 pages is a
> > good value? How do we scale for different machines with different capabilities?
> >
> > If you have a powerful machine with lots of memory, we might throttle userspace
> > for no reason, no?
> >
> > If the machine has very limited resources, it might already be too much?
> 
> It may be a bit arbitrary, but then again I'm not sure that userspace
> is in any better position to pick an appropriate limit.
> 
> 4MB of in-flight pages isn't going to be too much for anything that is
> capable enough to run vk, but still allows for a lot of in-flight
> maps.

Ok, but what about the other way around? What's the performance impact if the
limit is chosen rather small, but we're running on a very powerful machine?

Since you already have the implementation for hardware you have access to, can
you please check if and how performance degrades when you use a very small
threshold?

Also, I think we should probably put this throttle mechanism in a separate
component, that just wraps a counter of bytes or rather pages that can be
increased and decreased through an API and the increase just blocks at a certain
threshold.

This component can then be called by a driver from the job submit IOCTL and the
corresponding place where the pre-allocated memory is actually used / freed.

Depending on the driver, this might not necessarily be in the scheduler's
run_job() callback.

We could call the component something like drm_throttle or drm_submit_throttle.
