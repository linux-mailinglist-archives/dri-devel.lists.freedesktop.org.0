Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 614B4A9080A
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 17:54:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C841710E288;
	Wed, 16 Apr 2025 15:53:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="XjuklmSS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2267410E098;
 Wed, 16 Apr 2025 15:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744818831;
 bh=d3ascWmgwCjDdKF7Rv9hEXGBvid3nn8R25VA7/of4y4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XjuklmSSMWb8f2alezh08Ldt4g5rqxjf+AGgxjjfS+XdbULbosf7K+5q3PCNa9o/O
 VWR5434Qe28ts0CgMO9yBRz8fkAbztcmutusB5/3/Q2CPfLo8WL0d3vncfIA4pAnNc
 1YP/Y2gpPoIh5r/Yr4RtlxIyBOCEMTgQXu1qykGbj0zYfvSC4dT8IZyuKqODb9L2S7
 y14bWLLOT0QRyPt9cbIMcC92YXtaZWUPc/EluF09PQuHXytZj5oakmggsHzVLNzxpj
 Y2kvpLlkrzaczg2j6DyM+6ittdt97IVInZqWmPnMcvw+RLkOT15KnEVP6yqaJCjXC7
 wOv4hmJwpoO4A==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9F7A117E0062;
 Wed, 16 Apr 2025 17:53:50 +0200 (CEST)
Date: Wed, 16 Apr 2025 17:53:45 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Alyssa
 Rosenzweig <alyssa@rosenzweig.io>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>,
 lima@lists.freedesktop.org, Qiang Yu <yuq825@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, kernel@collabora.com,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Subject: Re: [PATCH v3 0/8] drm: Introduce sparse GEM shmem
Message-ID: <20250416175345.4a25abef@collabora.com>
In-Reply-To: <3c85fd64-2e09-49ca-af45-fd4fcf3c0d7a@arm.com>
References: <20250404092634.2968115-1-boris.brezillon@collabora.com>
 <20250410164809.21109cbc@collabora.com>
 <d4ebcb9f-ca1e-40ae-bc3c-613f88552b94@amd.com>
 <20250410175349.6bf6a4ea@collabora.com>
 <d0ab2ffe-77ee-4bda-b127-8648acb71409@amd.com>
 <20250410192054.24a592a5@collabora.com> <Z_gHX5AqQkhbXOjd@blossom>
 <20250410204155.55d5cfc7@collabora.com>
 <4d47cb90-8ed4-4a69-bd91-b90ebd2c9aca@amd.com>
 <20250411103837.753cd92e@collabora.com>
 <9fd6fb8c-7dbb-467d-a759-eec852e1f006@amd.com>
 <20250411140254.042f9862@collabora.com>
 <73a28f35-9576-4089-8976-07cd1aa64432@amd.com>
 <20250411150056.62cb7042@collabora.com>
 <c15cef68-bab5-4e09-89ae-52266ab1e4dd@amd.com>
 <20250411163902.1d0db9da@collabora.com>
 <20250414144714.6372738b@collabora.com>
 <1b9b8795-5f5c-4831-ad6b-29b88f21b621@arm.com>
 <20250415114747.5f65db54@collabora.com>
 <3c85fd64-2e09-49ca-af45-fd4fcf3c0d7a@arm.com>
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

On Wed, 16 Apr 2025 16:16:05 +0100
Steven Price <steven.price@arm.com> wrote:

> On 15/04/2025 10:47, Boris Brezillon wrote:
> > On Mon, 14 Apr 2025 16:34:35 +0100
> > Steven Price <steven.price@arm.com> wrote:
> >  =20
> >> On 14/04/2025 13:47, Boris Brezillon wrote: =20
> >>> On Fri, 11 Apr 2025 16:39:02 +0200
> >>> Boris Brezillon <boris.brezillon@collabora.com> wrote:
> >>>    =20
> >>>> On Fri, 11 Apr 2025 15:13:26 +0200
> >>>> Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
> >>>>   =20
> >>>>>>       =20
> >>>>>>> Background is that you don't get a crash, nor error message, nor
> >>>>>>> anything indicating what is happening.       =20
> >>>>>> The job times out at some point, but we might get stuck in the fau=
lt
> >>>>>> handler waiting for memory, which is pretty close to a deadlock, I
> >>>>>> suspect.       =20
> >>>>>
> >>>>> I don't know those drivers that well, but at least for amdgpu the
> >>>>> problem would be that the timeout handling would need to grab some =
of
> >>>>> the locks the memory management is holding waiting for the timeout
> >>>>> handling to do something....
> >>>>>
> >>>>> So that basically perfectly closes the circle. With a bit of lock y=
ou
> >>>>> get a message after some time that the kernel is stuck, but since
> >>>>> that are all sleeping locks I strongly doubt so.
> >>>>>
> >>>>> As immediately action please provide patches which changes those
> >>>>> GFP_KERNEL into GFP_NOWAIT.     =20
> >>>>
> >>>> Sure, I can do that.   =20
> >>>
> >>> Hm, I might have been too prompt at claiming this was doable. In
> >>> practice, doing that might regress Lima and Panfrost in situations
> >>> where trying harder than GFP_NOWAIT would free up some memory. Not
> >>> saying this was right to use GFP_KERNEL in the first place, but some
> >>> expectations were set by this original mistake, so I'll probably need
> >>> Lima developers to vouch in for this change after they've done some
> >>> testing on a system under high memory pressure, and I'd need to do the
> >>> same kind of testing for Panfrost and ask Steve if he's okay with that
> >>> too.   =20
> >>
> >> It's a tricky one. The ideal would be to teach user space how to recov=
er
> >> from the memory allocation failure (even on older GPUs it's still in
> >> theory possible to break up the work and do incremental rendering). But
> >> that ship sailed long ago so this would be a regression.
> >>
> >> I did consider GFP_ATOMIC as an option, but really we shouldn't be
> >> accessing "memory reserves" in such a situation.
> >>
> >> For background: In the "kbase" driver (Linux kernel driver for the
> >> closed source user space 'DDK' driver for Midgard/Bifrost GPUs) we had=
 a
> >> "JIT memory allocator". The idea here was that if you have multiple
> >> renderings in flight you can attempt to share the tiler heap memory
> >> between them. So in this case when we can't allocate more memory and we
> >> know there's another tiler heap which is going to be freed by a fragme=
nt
> >> job that's already running, we can block knowing the memory is going to
> >> become available.
> >>
> >> It was designed to do the same thing as CSF's incremental rendering -
> >> allow us to opportunistically allocate memory but not fail the renderi=
ng
> >> if it wasn't available.
> >>
> >> But it was a nightmare to have any confidence of it being deadlock free
> >> and the implementation was frankly terrible - which is ultimately why
> >> CSF GPU's have this ability in hardware to perform incremental renderi=
ng
> >> without failing the job. But effectively this approach requires
> >> allocating just enough memory for one complete tiler heap while ensuri=
ng
> >> forward progress and opportunistically allowing extra memory to give a
> >> performance boost.
> >>
> >> TLDR; I think we should try switching to GFP_NOWAIT in Panfrost and do
> >> some testing with memory pressure. It might be acceptable (and an
> >> occasional job failure is better than an occasional lock up). If it
> >> turns out it's too easy to trigger job failures like this then we'll
> >> need to rethink. =20
> >=20
> > I thought about this incremental-rendering-on-JM thing during the past
> > few days, and I'd like to run one idea through you if you don't mind.
> > What if we tried to implement incremental rendering the way it's done
> > for CSF, that is, when we get a fault on a tiler heap object we: =20
>=20
> CSF adds the ability for the command stream to make decisions between
> 'jobs'. kbase has the concept of 'soft jobs' allowing the kernel to do
> actions between jobs. I fear to make this work we'd need something
> similar - see below.
>=20
> > 1. flush caches on the tiler heap range (with a FLUSH_MEM command on the
> >    faulty AS), such that any primitive data that have been queued so far
> >    get pushed to the memory =20
>=20
> So I'm not entirely sure whether you are proposing doing this on the
> back of a MMU fault or not. Doing a FLUSH_MEM while the tiler is waiting
> for a memory fault to be resolved is unlikely to work (it won't flush
> the tiler's internal caches). The tiler is a very complex beast and has
> some elaborate caches. We don't support soft-stopping tiler jobs (they
> just run to completion) because the H/W guys could never figure out how
> to safely stop the tiler - so I very much doubt we can deal with the
> half-completed state of the tiler.
>=20
> > 2. use a different AS for an IR (Increment Rendering) fragment job that
> >    have been provided by the UMD at submission time, just like the
> >    CSF backend of the UMD registers an exception handler for tiler OOMs
> >    at the moment. =20
>=20
> It's an interesting idea - I worry about internal deadlocks within the
> GPU. There's some magic which ties vertex processing and the tiler
> together, and I'm not sure whether a hung tiler job could lead to hung
> vertex tasks on the shader cores. But it's possible my worries are
> unfounded.
>=20
> >    Make it so this IR fragment job chain is queued immediately after the
> >    currently running fragment job (if any). This IR fragment job should
> >    consume all the primitives written so far and push the result to a
> >    framebuffer. There's a bit of patching to do on the final
> >    fragment job chain, because the FB preload setup will differ if
> >    IR took place, but that should be doable with simple WRITE_VALUE jobs
> >    turning NULL jobs into FRAGMENT jobs (or the other way around)
> >    such that they get skipped/activated depending on whether IR took
> >    place or not. =20
>=20
> You're probably more of an expert than me on that part - it certainly
> sounds plausible.
>=20
> > 3. collect pages covering consumed primitives and make the heap range
> >    covering those consumed pages fault on further accesses (basically
> >    iommu->unmap() the section we collected pages from). We probably
> >    need to keep a couple pages around the top/bottom tiler heap
> >    pointers, because some partially written primitives might be crossing
> >    a heap chunk boundary, but assuming our heap has more than 4 chunks
> >    available (which we can ensure at tiler heap allocation time), we
> >    should be good. =20
>=20
> I'm not sure if it's sufficient to keep the last 'n' chunks. But at
> least in theory it should be possible to identify chunks that are still
> active.
>=20
> > 4. use one of the collected pages to satisfy the growing request, and
> >    acknowledge the fault on the faulty AS. We can pick from the pool
> >    of collected pages to satisfy new growing requests until it's
> >    depleted again.
> >=20
> > 5. repeat steps 1-4 until all primitives are flushed. =20
>=20
> Running the IR fragment jobs from part way through the tiler heap on
> subsequent renderings could be tricky - I'm not sure if we have a way of
> doing that?
>=20
> > 6. reset the tiler heap mapping by doing an iommu->unmap() on the whole
> >    heap BO range, and collect all the pages that were previously
> >    allocated to the heap such that the next allocation can be satisfied
> >    immediately
> >=20
> > Of course, this only works if primitives are added to the list only
> > when they are fully written (that is, all data for the primitive has
> > been written, and the primitive can be consumed by the fragment job
> > without hazards). =20
>=20
> Yeah, the hardware certainly wasn't designed for this ;)
>=20
> The H/W designers approach is simple:
>=20
>  1. Submit vertex/tiler job with small tiler heap
>=20
>  2. Job fails with OUT_OF_MEMORY, capture index of last completed vertex
>     which is written to the job descriptor
>=20
>  3. Submit fragment job to incrementally render.
>=20
>  4. Submit new vertex/tiler job using the index captured in step 2.
>=20
>  5. Loop back to 2.
>=20
> The problem from an implementation point of view is either you give up
> on fences (bounce back to user space between each step), or you need
> start writing job descriptors in the kernel.
>=20
> Clearly one option is to go the whole hog and have something looking
> like the CSF firmware running in the kernel. It's not a popular option
> though! ;)
>=20
> > Just to be clear, this is a long term plan to try and fix this on JM
> > HW, and given the changes it involves (UMD needs to be taught about IR
> > on JM), we'll still need the GFP_NOWAIT fix for the time being. =20
>=20
> Agreed, and I like the ingenuity of it - but having seen the H/W team
> give up on soft-stopping the tiler I'm not convinced it will work
> leaving the tiler waiting on an MMU fault.

Yeah, looking at the answers you gave, it doesn't sounds like this is
going to work, but thanks for taking the time to look at my crazy idea
:-).

Boris
