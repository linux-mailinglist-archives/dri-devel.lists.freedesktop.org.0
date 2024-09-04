Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3FC96BF5A
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 15:59:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1AC510E10D;
	Wed,  4 Sep 2024 13:59:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="TwF5r9sl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D306610E10D
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 13:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1725458341;
 bh=DQB2my14Tc7B1BmSCv5p/w38SHBxxI1Y+G+gxhaEIrk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TwF5r9slZO5Npd/Q5ZZPWWWxjFM/wV8wkQMYkeqtyO8r38esixOYf00YdijQ5XamI
 QJYyt7aD7qHfl308b3Da+RV0VfNy8lQcvYuVc0K97TT5rA0e+/0htw2htaNX1sIrnD
 waRy5vWOIcqaSSK6QQU0ycqUR885EiEjDrdZqjWZhPwXCfiy087GKjHslONFiEwi56
 ybhyIX+komgcErye/inhjhYQ8B1kCic9qdAHbaMt8zdu+iGUUMJj8NVDUmlDJ3yIYZ
 SAWeNKU0nQM9Axg7X8WIi6a5Zcenm4edjqMyY6VEojirdxAthzUhEXFr88G+W1T7KJ
 tZEUuYnUt27wg==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id BD9D017E10BF;
 Wed,  4 Sep 2024 15:59:00 +0200 (CEST)
Date: Wed, 4 Sep 2024 15:58:54 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Mihail Atanassov
 <mihail.atanassov@arm.com>, linux-kernel@vger.kernel.org, Liviu Dudau
 <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org, David Airlie
 <airlied@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Alex Deucher <alexander.deucher@amd.com>, Xinhui Pan
 <Xinhui.Pan@amd.com>, Shashank Sharma <shashank.sharma@amd.com>, Ketil
 Johnsen <ketil.johnsen@arm.com>, Akash Goel <akash.goel@arm.com>
Subject: Re: [RFC PATCH 00/10] drm/panthor: Add user submission
Message-ID: <20240904155854.471ff2a8@collabora.com>
In-Reply-To: <0a362641-6029-4316-bd95-7e00dade89d8@arm.com>
References: <20240828172605.19176-1-mihail.atanassov@arm.com>
 <c64be651-2f40-4535-a537-b8304e6556ce@amd.com>
 <a3e78bf7-931e-4e49-8933-c3df9a503ffd@arm.com>
 <96ef7ae3-4df1-4859-8672-453055bbfe96@amd.com>
 <Ztd7g4Q8V9lFZ53R@phenom.ffwll.local>
 <090ae980-a944-4c00-a26e-d95434414417@amd.com>
 <80ffea9b-63a6-4ae2-8a32-2db051bd7f28@arm.com>
 <20240904132308.7664902e@collabora.com>
 <a5a53492-9651-403e-b613-91ef0b9e80b6@amd.com>
 <298d0516-3b92-47e9-ad54-185de97561ee@arm.com>
 <20240904152018.3de547f6@collabora.com>
 <0a362641-6029-4316-bd95-7e00dade89d8@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Wed, 4 Sep 2024 14:35:12 +0100
Steven Price <steven.price@arm.com> wrote:

> On 04/09/2024 14:20, Boris Brezillon wrote:
> > + Adrian, who has been looking at the shrinker stuff for Panthor
> >=20
> > On Wed, 4 Sep 2024 13:46:12 +0100
> > Steven Price <steven.price@arm.com> wrote:
> >  =20
> >> On 04/09/2024 12:34, Christian K=C3=B6nig wrote: =20
> >>> Hi Boris,
> >>>
> >>> Am 04.09.24 um 13:23 schrieb Boris Brezillon:   =20
> >>>>>>>> Please read up here on why that stuff isn't allowed:
> >>>>>>>> https://www.kernel.org/doc/html/latest/driver-api/dma-buf.html#i=
ndefinite-dma-fences     =20
> >>>>>>> panthor doesn't yet have a shrinker, so all memory is pinned, whi=
ch means
> >>>>>>> memory management easy mode.     =20
> >>>>>> Ok, that at least makes things work for the moment.     =20
> >>>>> Ah, perhaps this should have been spelt out more clearly ;)
> >>>>>
> >>>>> The VM_BIND mechanism that's already in place jumps through some ho=
ops
> >>>>> to ensure that memory is preallocated when the memory operations are
> >>>>> enqueued. So any memory required should have been allocated before =
any
> >>>>> sync object is returned. We're aware of the issue with memory
> >>>>> allocations on the signalling path and trying to ensure that we don=
't
> >>>>> have that.
> >>>>>
> >>>>> I'm hoping that we don't need a shrinker which deals with (active) =
GPU
> >>>>> memory with our design.   =20
> >>>> That's actually what we were planning to do: the panthor shrinker was
> >>>> about to rely on fences attached to GEM objects to know if it can
> >>>> reclaim the memory. This design relies on each job attaching its fen=
ce
> >>>> to the GEM mapped to the VM at the time the job is submitted, such t=
hat
> >>>> memory that's in-use or about-to-be-used doesn't vanish before the G=
PU
> >>>> is done.   =20
> >>
> >> How progressed is this shrinker? =20
> >=20
> > We don't have code yet. All we know is that we want to re-use Dmitry's
> > generic GEM-SHMEM shrinker implementation [1], and adjust it to match
> > the VM model, which means not tracking things at the BO granularity,
> > but at the VM granularity. Actually it has to be an hybrid model, where
> > shared BOs (those imported/exported) are tracked individually, while
> > all private BOs are checked simultaneously (since they all share the VM
> > resv object).
> >  =20
> >> It would be good to have an RFC so that
> >> we can look to see how user submission could fit in with it. =20
> >=20
> > Unfortunately, we don't have that yet :-(. All we have is a rough idea
> > of how things will work, which is basically how TTM reclaim works, but
> > adapted to GEM. =20
>=20
> Fair enough, thanks for the description. We might need to coordinate to
> get this looked at sooner if it's going to be blocking user submission.
>=20
> >> =20
> >>> Yeah and exactly that doesn't work any more when you are using user
> >>> queues, because the kernel has no opportunity to attach a fence for e=
ach
> >>> submission.   =20
> >>
> >> User submission requires a cooperating user space[1]. So obviously user
> >> space would need to ensure any BOs that it expects will be accessed to
> >> be in some way pinned. Since the expectation of user space submission =
is
> >> that we're reducing kernel involvement, I'd also expect these to be
> >> fairly long-term pins.
> >>
> >> [1] Obviously with a timer to kill things from a malicious user space.
> >>
> >> The (closed) 'kbase' driver has a shrinker but is only used on a subset
> >> of memory and it's up to user space to ensure that it keeps the releva=
nt
> >> parts pinned (or more specifically not marking them to be discarded if
> >> there's memory pressure). Not that I think we should be taking it's
> >> model as a reference here.
> >> =20
> >>>>> Memory which user space thinks the GPU might
> >>>>> need should be pinned before the GPU work is submitted. APIs which
> >>>>> require any form of 'paging in' of data would need to be implemente=
d by
> >>>>> the GPU work completing and being resubmitted by user space after t=
he
> >>>>> memory changes (i.e. there could be a DMA fence pending on the GPU =
work).   =20
> >>>> Hard pinning memory could work (ioctl() around gem_pin/unpin()), but
> >>>> that means we can't really transparently swap out GPU memory, or we
> >>>> have to constantly pin/unpin around each job, which means even more
> >>>> ioctl()s than we have now. Another option would be to add the XGS fe=
nce
> >>>> to the BOs attached to the VM, assuming it's created before the job
> >>>> submission itself, but you're no longer reducing the number of user =
<->
> >>>> kernel round trips if you do that, because you now have to create an
> >>>> XSG job for each submission, so you basically get back to one ioctl()
> >>>> per submission.   =20
> >>
> >> As you say the granularity of pinning has to be fairly coarse for user
> >> space submission to make sense. My assumption (could be wildly wrong)
> >> was that most memory would be pinned whenever a context is rendering. =
=20
> >=20
> > The granularity of pinning (in term of which regions are pinned) is not
> > really the problem, we can just assume anything that's mapped to the VM
> > will be used by the GPU (which is what we're planning to do for kernel
> > submission BTW). The problem is making the timeslice during
> > which VM memory is considered unreclaimable as short as possible, such
> > that the system can reclaim memory under mem pressure. Ideally, you want
> > to pin memory as long as you have jobs queued/running, and allow for
> > reclaim when the GPU context is idle.
> >=20
> > We might be able to involve the panthor_scheduler for usermode queues,
> > such that a context that's eligible for scheduling first gets its VM
> > mappings pinned (fence creation + assignment to the VM/BO resvs), and
> > things get reclaimable again when the group is evicted from the CSG
> > slot. That implies evicting idle groups more aggressively than we do
> > know, but there's probably a way around it. =20
>=20
> Can we evict idle groups from the shrinker? User space already has to do
> a little dance to work out whether it needs to "kick" the kernel to do
> the submission. So it would be quite reasonable to extend the kick to
> also pin the VM(s). The shrinker could then proactively evict idle
> groups, and at that point it would be possible to unpin the memory.
>=20
> I'm probably missing something, but that seems like a fairly solid
> solution to me.

The locking might be tricky to get right, but other than that, it looks
like an option that could work. It's definitely worth investigating.

>=20
> >> =20
> >>> For AMDGPU we are currently working on the following solution with
> >>> memory management and user queues:
> >>>
> >>> 1. User queues are created through an kernel IOCTL, submissions work =
by
> >>> writing into a ring buffer and ringing a doorbell.
> >>>
> >>> 2. Each queue can request the kernel to create fences for the current=
ly
> >>> pushed work for a queues which can then be attached to BOs, syncobjs,
> >>> syncfiles etc...
> >>>
> >>> 3. Additional to that we have and eviction/preemption fence attached =
to
> >>> all BOs, page tables, whatever resources we need.
> >>>
> >>> 4. When this eviction fences are requested to signal they first wait =
for
> >>> all submission fences and then suspend the user queues and block
> >>> creating new submission fences until the queues are restarted again.
> >>>
> >>> This way you can still do your memory management inside the kernel (e=
.g.
> >>> move BOs from local to system memory) or even completely suspend and
> >>> resume applications without their interaction, but as Sima said it is
> >>> just horrible complicated to get right.
> >>>
> >>> We have been working on this for like two years now and it still could
> >>> be that we missed something since it is not in production testing yet=
.   =20
> >>
> >> I'm not entirely sure I follow how this doesn't create a dependency
> >> cycle. From your description it sounds like you create a fence from the
> >> user space queue which is then used to prevent eviction of the BOs nee=
ded.
> >>
> >> So to me it sounds like:
> >>
> >> 1. Attach fence to BOs to prevent eviction.
> >>
> >> 2. User space submits work to the ring buffer, rings doorbell.
> >>
> >> 3. Call into the kernel to create the fence for step 1.
> >>
> >> Which is obviously broken. What am I missing?
> >>
> >> One other thing to note is that Mali doesn't have local memory - so the
> >> only benefit of unpinning is if we want to swap to disk (or zram etc).=
 =20
> >=20
> > Which would be good to have, IMHO. If we don't do the implicit swapout
> > based on some sort of least-recently-used-VM, we have to rely on
> > userspace freeing its buffer (or flagging them reclaimable) as soon as
> > they are no longer used by the GPU. =20
>=20
> It's an awkward one because really you do want user space to free
> buffers - generally the user space driver has a fairly large number of
> buffers which are for temporary storage (and kept around to avoid the
> overhead of freeing/allocating each frame). I know we've resorted to
> idle timers in user space in an attempt to do this in the past - but
> it's ugly.

Fair enough.

>=20
> Actual swapout can work, but it incurs a heavy penalty when the
> application becomes active again. But I agree we should probably be
> aiming to add support for this.

I guess the other case is a gazillion of GPU contexts, each keeping
buffers around for good reason. If most of those contexts are idle, I
guess swapping out mostly inactive context is better than having the
OOM kick in to reclaim memory. And yes, there's a hit any time an
inactive context gets active again, if and only if the system was under
memory pressure in the meantime. So I guess the slowdown is acceptable
in that case.

Just to mention that, IIRC, MSM already moved away from explicit BO
reclaim (BO flagged reclaimable from userspace when they're back in the
userspace BO cache) in favor of an LRU-based swapout. Dmitry's work is
also centered around this LRU-based swapout model, even though it also
supports the model we have in panfrost, lima, vc4, etc. So it looks
like the new trend for embedded GPU drivers is to defer this memory
reclaim responsibility entirely to the kernel rather than letting
userspace decide which bits are reclaimable.
