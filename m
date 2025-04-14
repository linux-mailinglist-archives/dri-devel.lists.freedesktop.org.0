Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB33A8869E
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 17:15:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25DE110E614;
	Mon, 14 Apr 2025 15:15:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="c5au2kjO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8876910E60E;
 Mon, 14 Apr 2025 15:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744643706;
 bh=6Z4rCHaoaVx6eLV27ec1WmgX/Go20JRZlSTRABZHfwQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=c5au2kjOg9mW8jMKaE8kxPDZBh2bL9FDIM50YwnTKhnmwf2BEk6Xzh+AKlLFo0/sc
 T+604ZFlpn/LApat9yF/Da3PSxTxeVFHIwcgf0Al7w8K9KaR5uYrykSRo4aeGRNm/2
 nOPzuOEWrJzqtsP91bHVWOxkKInh0LQCdggAyDyyjS3TjLxiYqQ+j6PhnUGPU1sEPI
 RcBO/Gq8MlFwVYFjHjEknP3o/3N0VdTxogC51vU4Ja5hCGHamtL899A4Hzk+sgdsIp
 PykLSI8MFJZ4mRXJH2Uz+rjHJFFDgaO/YRfa/o8TBR5Igysj+hd0zLt7h2GZ9hRhh5
 vAmXLbvJXt3vg==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id BEB4C17E0A5F;
 Mon, 14 Apr 2025 17:15:05 +0200 (CEST)
Date: Mon, 14 Apr 2025 17:15:01 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Liviu Dudau <liviu.dudau@arm.com>, Alyssa Rosenzweig
 <alyssa@rosenzweig.io>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Steven Price <steven.price@arm.com>,
 =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>,
 lima@lists.freedesktop.org, Qiang Yu <yuq825@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, kernel@collabora.com,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Subject: Re: [PATCH v3 0/8] drm: Introduce sparse GEM shmem
Message-ID: <20250414171501.6b5b57f3@collabora.com>
In-Reply-To: <Z_0dBzMjkeWYNSRM@phenom.ffwll.local>
References: <20250410164809.21109cbc@collabora.com>
 <d4ebcb9f-ca1e-40ae-bc3c-613f88552b94@amd.com>
 <20250410175349.6bf6a4ea@collabora.com>
 <d0ab2ffe-77ee-4bda-b127-8648acb71409@amd.com>
 <20250410192054.24a592a5@collabora.com> <Z_gHX5AqQkhbXOjd@blossom>
 <20250410204155.55d5cfc7@collabora.com>
 <Z_kEjFjmsumfmbfM@phenom.ffwll.local>
 <20250414132206.728eacb3@collabora.com>
 <Z_0IyRIrJtlmRg2K@e110455-lin.cambridge.arm.com>
 <Z_0dBzMjkeWYNSRM@phenom.ffwll.local>
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

On Mon, 14 Apr 2025 16:34:47 +0200
Simona Vetter <simona.vetter@ffwll.ch> wrote:

> On Mon, Apr 14, 2025 at 02:08:25PM +0100, Liviu Dudau wrote:
> > On Mon, Apr 14, 2025 at 01:22:06PM +0200, Boris Brezillon wrote: =20
> > > Hi Sima,
> > >=20
> > > On Fri, 11 Apr 2025 14:01:16 +0200
> > > Simona Vetter <simona.vetter@ffwll.ch> wrote:
> > >  =20
> > > > On Thu, Apr 10, 2025 at 08:41:55PM +0200, Boris Brezillon wrote: =20
> > > > > On Thu, 10 Apr 2025 14:01:03 -0400
> > > > > Alyssa Rosenzweig <alyssa@rosenzweig.io> wrote:
> > > > >    =20
> > > > > > > > > In Panfrost and Lima, we don't have this concept of "incr=
emental
> > > > > > > > > rendering", so when we fail the allocation, we just fail =
the GPU job
> > > > > > > > > with an unhandled GPU fault.       =20
> > > > > > > >=20
> > > > > > > > To be honest I think that this is enough to mark those two =
drivers as
> > > > > > > > broken.=C2=A0 It's documented that this approach is a no-go=
 for upstream
> > > > > > > > drivers.
> > > > > > > >=20
> > > > > > > > How widely is that used?     =20
> > > > > > >=20
> > > > > > > It exists in lima and panfrost, and I wouldn't be surprised i=
f a similar
> > > > > > > mechanism was used in other drivers for tiler-based GPUs (etn=
aviv,
> > > > > > > freedreno, powervr, ...), because ultimately that's how tiler=
s work:
> > > > > > > the amount of memory needed to store per-tile primitives (and=
 metadata)
> > > > > > > depends on what the geometry pipeline feeds the tiler with, a=
nd that
> > > > > > > can't be predicted. If you over-provision, that's memory the =
system won't
> > > > > > > be able to use while rendering takes place, even though only =
a small
> > > > > > > portion might actually be used by the GPU. If your allocation=
 is too
> > > > > > > small, it will either trigger a GPU fault (for HW not support=
ing an
> > > > > > > "incremental rendering" mode) or under-perform (because flush=
ing
> > > > > > > primitives has a huge cost on tilers).     =20
> > > > > >=20
> > > > > > Yes and no.
> > > > > >=20
> > > > > > Although we can't allocate more memory for /this/ frame, we kno=
w the
> > > > > > required size is probably constant across its lifetime. That gi=
ves a
> > > > > > simple heuristic to manage the tiler heap efficiently without
> > > > > > allocations - even fallible ones - in the fence signal path:
> > > > > >=20
> > > > > > * Start with a small fixed size tiler heap
> > > > > > * Try to render, let incremental rendering kick in when it's to=
o small.
> > > > > > * When cleaning up the job, check if we used incremental render=
ing.
> > > > > > * If we did - double the size of the heap the next time we subm=
it work.
> > > > > >=20
> > > > > > The tiler heap still grows dynamically - it just does so over t=
he span
> > > > > > of a couple frames. In practice that means a tiny hit to startu=
p time as
> > > > > > we dynamically figure out the right size, incurring extra flush=
ing at
> > > > > > the start, without needing any "grow-on-page-fault" heroics.
> > > > > >=20
> > > > > > This should solve the problem completely for CSF/panthor. So it=
's only
> > > > > > hardware that architecturally cannot do incremental rendering (=
older
> > > > > > Mali: panfrost/lima) where we need this mess.   =20
> > > > >=20
> > > > > OTOH, if we need something
> > > > > for Utgard(Lima)/Midgard/Bifrost/Valhall(Panfrost), why not use t=
he same
> > > > > thing for CSF, since CSF is arguably the sanest of all the HW
> > > > > architectures listed above: allocation can fail/be non-blocking,
> > > > > because there's a fallback to incremental rendering when it fails=
.   =20
> > > >=20
> > > > So this is a really horrible idea to sort this out for panfrost har=
dware,
> > > > which doesn't have a tiler cache flush as a fallback. It's roughly =
three
> > > > stages:
> > > >=20
> > > > 1. A pile of clever tricks to make the chances of running out of me=
mory
> > > > really low. Most of these also make sense for panthor platforms, ju=
st as a
> > > > performance optimization.
> > > >=20
> > > > 2. I terrible way to handle the unavoidable VK_DEVICE_LOST, but in =
a way
> > > > such that the impact should be minimal. This is nasty, and we reall=
y want
> > > > to avoid that for panthor.
> > > >=20
> > > > 3. Mesa quirks so that 2 doesn't actually ever happen in practice.
> > > >=20
> > > > 1. Clever tricks
> > > > ----------------
> > > >=20
> > > > This is a cascade of tricks we can pull in the gpu fault handler:
> > > >=20
> > > > 1a. Allocate with GFP_NORECLAIM. We want this first because that tr=
iggers
> > > >   background reclaim, and that might be enough to get us through an=
d free
> > > >   some easy caches (like clean fs cache and stuff like that which c=
an just
> > > >   be dropped). =20
> > >=20
> > > There's no GFP_NORECLAIM, and given the discussions we had before, I
> > > guess you meant GFP_NOWAIT. Otherwise it's the __GFP_NOWARN |
> > > __GFP_NORETRY I used in this series, and it probably doesn't try hard
> > > enough as pointed out by you and Christian.
> > >  =20
> > > >=20
> > > > 1b Userspace needs to guesstimate a good guess for how much we'll n=
eed. I'm
> > > >   hoping that between render target size and maybe counting the tot=
al
> > > >   amounts of vertices we can do a decent guesstimate for many workl=
oads. =20
> > >=20
> > > There are extra parameters to take into account, like the tile
> > > hierarchy mask (number of binning lists instantiated) and probably
> > > other things I forget, but for simple vertex+fragment pipelines and
> > > direct draws, guessing the worst memory usage case is probably doable.
> > > Throw indirect draws into the mix, and it suddenly becomes a lot more
> > > complicated. Not even talking about GEOM/TESS stages, which makes the
> > > guessing even harder AFAICT.
> > >  =20
> > > >   Note that goal here is not to ensure success, but just to get the=
 rough
> > > >   ballpark. The actual starting number here should aim fairly low, =
so that
> > > >   we avoid wasting memory since this is memory wasted on every cont=
ext
> > > >   (that uses a feature which needs dynamic memory allocation, which=
 I
> > > >   guess for pan* is everything, but for apple it would be more limi=
ted). =20
> > >=20
> > > Ack.
> > >  =20
> > > >=20
> > > > 1c The kernel then keeps an additional global memory pool. Note thi=
s would
> > > >   not have the same semantics as mempool.h, which is aimed GFP_NOIO
> > > >   forward progress guarantees, but more as a preallocation pool. In=
 every
> > > >   CS ioctl we'll make sure the pool is filled, and we probably want=
 to
> > > >   size the pool relative to the context with the biggest dynamic me=
mory
> > > >   usage. So probably this thing needs a shrinker, so we can reclaim=
 it
> > > >   when you don't run an app with a huge buffer need on the gpu anym=
ore. =20
> > >=20
> > > Okay, that's a technique Arm has been using in their downstream driver
> > > (it named JIT-allocation there).
> > >  =20
> > > >=20
> > > >   Note that we're still not sizing this to guarantee success, but t=
ogether
> > > >   with the userspace heuristics it should be big enough to almost a=
lways
> > > >   work out. And since it's global reserve we can afford to waste a =
bit
> > > >   more memory on this one. We might also want to scale this pool by=
 the
> > > >   total memory available, like the watermarks core mm computes. We'=
ll only
> > > >   hang onto this memory when the gpu is in active usage, so this sh=
ould be
> > > >   fine. =20
> > >=20
> > > Sounds like a good idea.
> > >  =20
> > > >=20
> > > >   Also the preallocation would need to happen without holding the m=
emory
> > > >   pool look, so that we can use GFP_KERNEL.
> > > >=20
> > > > Up to this point I think it's all tricks that panthor also wants to
> > > > employ.
> > > >=20
> > > > 1d Next up is scratch dynamic memory. If we can assume that the mem=
ory does
> > > >   not need to survive a batchbuffer (hopefully the case with vulkan=
 render
> > > >   pass) we could steal such memory from other contexts. We could ev=
en do
> > > >   that for contexts which are queued but not yet running on the har=
dware
> > > >   (might need unloading them to be doable with fw renderers like
> > > >   panthor/CSF) as long as we keep such stolen dynamic memory on a s=
eparate
> > > >   free list. Because if we'd entirely free this, or release it into=
 the
> > > >   memory pool we'll make things worse for these other contexts, we =
need to
> > > >   be able to guarantee that any context can always get all the stol=
en
> > > >   dynamic pages back before we start running it on the gpu. =20
> > >=20
> > > Actually, CSF stands in the way of re-allocating memory to other
> > > contexts, because once we've allocated memory to a tiler heap, the FW
> > > manages this pool of chunks, and recycles them. Mesa can intercept
> > > the "returned chunks" and collect those chunks instead of re-assiging
> > > then to the tiler heap through a CS instruction (which goes thought
> > > the FW internallu), but that involves extra collaboration between the
> > > UMD, KMD and FW which we don't have at the moment. Not saying never,
> > > but I'd rather fix things gradually (first the blocking alloc in the
> > > fence-signalling path, then the optimization to share the extra mem
> > > reservation cost among contexts by returning the chunks to the global
> > > kernel pool rather than directly to the heap). =20
> >=20
> > The additional issue with borrowing memory from idle contexts is that i=
t will
> > involve MMU operations, as we will have to move the memory into the act=
ive
> > context address space. CSF GPUs have a limitation that they can only wo=
rk with
> > one address space for the active job when it comes to memory used inter=
nally
> > by the job, so we either have to map the scratch dynamic memory in all =
the
> > jobs before we submit them, or we will have to do MMU maintainance oper=
ations
> > in the OOM path in order to borrow memory from other contexts. =20
>=20
> Hm, this could be tricky. So mmu operations shouldn't be an issue because
> they must work for GFP_NOFS contexts for i/o writeback. You might need to
> much more carefully manage this and make sure the iommu has big enough
> range of pagetables preallocated. This also holds for the other games
> we're playing here, at least for gpu pagetables. But since pagetables are
> really small overhead it might be good to somewhat aggressively
> preallocate them.
>=20
> But yeah this is possible an issue if you you need iommu wrangling, I
> have honestly not looked at the exact rules in there.

We already have a mechanism to pre-allocate page tables in panthor (for
aync VM_BIND requests where we're not allowed to allocate in the
run_job() path), but as said before, I probably won't try this global
mem pool thing on Panthor, since Panthor can do without it for now.
The page table pre-allocation mechanism is something we can easily
transpose to panfrost though.
