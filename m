Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE15ABD013
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 09:06:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0019910E0D5;
	Tue, 20 May 2025 07:06:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nHRwGMKE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F74510E0FC;
 Tue, 20 May 2025 07:06:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0EFEF61156;
 Tue, 20 May 2025 07:06:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84AEDC4CEE9;
 Tue, 20 May 2025 07:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747724806;
 bh=xbkcSstQSM7LsThUd3dW/NohXvrSVzg1IBKTfxC5v5Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nHRwGMKE8GzXffixF2oL6QS7YA6mXHmHgBYzNy00RsRKFYBJZaAt0fDrn4+dm0rMk
 xdrpD7fkjIBEWU/8v9/YLzIJAGWIR8gBJ3Ct6RbQLUlRevhKE7OyDfre2jUTwto1mI
 dV6oeCAoLAMScVqvjQ5ie9ZzkS4YtEL2xVHPCAOuxLa07PmMDbSB/Http52In5e5In
 xj0RVUR9fSE2PvgwAq/eq90IgL177hdSlY2NBfTTCWedeIvfZf074PQtdOmpg6EI3i
 mFiB71XJwTAA9v8PXq5QS8fbl8MAjgFalmA+V6S4+R5CYz8Z9CdxeMAf3SSOGg7Pr6
 j0vVoCyTCHhJw==
Date: Tue, 20 May 2025 09:06:40 +0200
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
Message-ID: <aCwqAGLLCC2ZLSBK@pollux>
References: <20250514170118.40555-1-robdclark@gmail.com>
 <20250514170118.40555-5-robdclark@gmail.com>
 <51f87f358fa1b7ef8db8b67ee6cde38ae071fbe8.camel@mailbox.org>
 <CAJs_Fx771FFVDVFMn8YJkR9f9Ad-UQspJ9KKQw4u6Cu4TA7YPA@mail.gmail.com>
 <CACu1E7EL+E-M0N-EAN9Bx7u9O6_pECQQdPE2ph575idhVb2Szg@mail.gmail.com>
 <aCYkk4Y7feltfp79@pollux>
 <CAF6AEGsoG_W3A3+BHV4n5EKZQazFubrCyfrtxVUH7+H4-j7i5A@mail.gmail.com>
 <aCY42rgJC4sQ4tp4@pollux>
 <CAF6AEGubHkdhfJz=bAZvctO1aTKDLwRsRyPzkoVrQ7tA6dRbKw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGubHkdhfJz=bAZvctO1aTKDLwRsRyPzkoVrQ7tA6dRbKw@mail.gmail.com>
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

On Thu, May 15, 2025 at 12:56:38PM -0700, Rob Clark wrote:
> On Thu, May 15, 2025 at 11:56 AM Danilo Krummrich <dakr@kernel.org> wrote:
> >
> > On Thu, May 15, 2025 at 10:40:15AM -0700, Rob Clark wrote:
> > > On Thu, May 15, 2025 at 10:30 AM Danilo Krummrich <dakr@kernel.org> wrote:
> > > >
> > > > (Cc: Boris)
> > > >
> > > > On Thu, May 15, 2025 at 12:22:18PM -0400, Connor Abbott wrote:
> > > > > For some context, other drivers have the concept of a "synchronous"
> > > > > VM_BIND ioctl which completes immediately, and drivers implement it by
> > > > > waiting for the whole thing to finish before returning.
> > > >
> > > > Nouveau implements sync by issuing a normal async VM_BIND and subsequently
> > > > waits for the out-fence synchronously.
> > >
> > > As Connor mentioned, we'd prefer it to be async rather than blocking,
> > > in normal cases, otherwise with drm native context for using native
> > > UMD in guest VM, you'd be blocking the single host/VMM virglrender
> > > thread.
> > >
> > > The key is we want to keep it async in the normal cases, and not have
> > > weird edge case CTS tests blow up from being _too_ async ;-)
> >
> > I really wonder why they don't blow up in Nouveau, which also support full
> > asynchronous VM_BIND. Mind sharing which tests blow up? :)
> 
> Maybe it was dEQP-VK.sparse_resources.buffer.ssbo.sparse_residency.buffer_size_2_24,

The test above is part of the smoke testing I do for nouveau, but I haven't seen
such issues yet for nouveau.

> but I might be mixing that up, I'd have to back out this patch and see
> where things blow up, which would take many hours.

Well, you said that you never had this issue with "real" workloads, but only
with VK CTS, so I really think we should know what we are trying to fix here.

We can't just add new generic infrastructure without reasonable and *well
understood* justification.

> There definitely was one where I was seeing >5k VM_BIND jobs pile up,
> so absolutely throttling like this is needed.

I still don't understand why the kernel must throttle this? If userspace uses
async VM_BIND, it obviously can't spam the kernel infinitely without running
into an OOM case.

But let's assume we agree that we want to avoid that userspace can ever OOM itself
through async VM_BIND, then the proposed solution seems wrong:

Do we really want the driver developer to set an arbitrary boundary of a number
of jobs that can be submitted before *async* VM_BIND blocks and becomes
semi-sync?

How do we choose this number of jobs? A very small number to be safe, which
scales badly on powerful machines? A large number that scales well on powerful
machines, but OOMs on weaker ones?

I really think, this isn't the correct solution, but more a workaround.

> Part of the VM_BIND for msm series adds some tracepoints for amount of
> memory preallocated vs used for each job.  That plus scheduler
> tracepoints should let you see how much memory is tied up in
> prealloc'd pgtables.  You might not be noticing only because you are
> running on a big desktop with lots of RAM ;-)
> 
> > > > > But this
> > > > > doesn't work for native context, where everything has to be
> > > > > asynchronous, so we're trying a new approach where we instead submit
> > > > > an asynchronous bind for "normal" (non-sparse/driver internal)
> > > > > allocations and only attach its out-fence to the in-fence of
> > > > > subsequent submits to other queues.
> > > >
> > > > This is what nouveau does and I think other drivers like Xe and panthor do this
> > > > as well.
> > >
> > > No one has added native context support for these drivers yet
> >
> > Huh? What exactly do you mean with "native context" then?
> 
> It is a way to use native usermode driver in a guest VM, by remoting
> at the UAPI level, as opposed to the vk or gl API level.  You can
> generally get equal to native performance, but the guest/host boundary
> strongly encourages asynchronous to hide the guest->host latency.

For the context we're discussing this isn't different to other drivers supporing
async VM_BIND utilizing it from the host, rather than from a guest.

So, my original statement about nouveau, Xe, panthor doing the same thing
without running into trouble should be valid.
