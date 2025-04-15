Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0CCA8988F
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 11:48:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2381189864;
	Tue, 15 Apr 2025 09:48:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="jAQG1Bb7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AB2F10E6B0;
 Tue, 15 Apr 2025 09:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744710474;
 bh=ev1dKGgkyaB+xbSWhuG1TOgmV77GnFn9Wko/27LFpJs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jAQG1Bb7ull3MEe/lRhYOaDe4zsp+4UUq46fvu2FQeqXq3sYoYcP2cvU7gOU4OAnO
 +wUHgpQSoi6h0Xrqm17orQUPrbf1x0PK5UeldWcKSOW+1a+2QkdGEGbq0wS1eW0Hwb
 a5rp38JLseKCOzyC19QqDnfMkrz9YeXKry9FHqxAZVdBNIClHBNpKT1wkHihs5z+m8
 0gNp2IKAgUAymOymXo0bdjMDf7ehuoxT/NToxo45zNcEZWqr/d+EUwVmAnoQCdSU9z
 5xW2XR/ceygcAkXmomtKGoVncR3GomTjoAAwgtQjaWHFfzYy6DDTBjowQALuvWeSlx
 xQXRFo923A1fg==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B998117E0FD5;
 Tue, 15 Apr 2025 11:47:53 +0200 (CEST)
Date: Tue, 15 Apr 2025 11:47:47 +0200
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
Message-ID: <20250415114747.5f65db54@collabora.com>
In-Reply-To: <1b9b8795-5f5c-4831-ad6b-29b88f21b621@arm.com>
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

On Mon, 14 Apr 2025 16:34:35 +0100
Steven Price <steven.price@arm.com> wrote:

> On 14/04/2025 13:47, Boris Brezillon wrote:
> > On Fri, 11 Apr 2025 16:39:02 +0200
> > Boris Brezillon <boris.brezillon@collabora.com> wrote:
> >  =20
> >> On Fri, 11 Apr 2025 15:13:26 +0200
> >> Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
> >> =20
> >>>>     =20
> >>>>> Background is that you don't get a crash, nor error message, nor
> >>>>> anything indicating what is happening.     =20
> >>>> The job times out at some point, but we might get stuck in the fault
> >>>> handler waiting for memory, which is pretty close to a deadlock, I
> >>>> suspect.     =20
> >>>
> >>> I don't know those drivers that well, but at least for amdgpu the
> >>> problem would be that the timeout handling would need to grab some of
> >>> the locks the memory management is holding waiting for the timeout
> >>> handling to do something....
> >>>
> >>> So that basically perfectly closes the circle. With a bit of lock you
> >>> get a message after some time that the kernel is stuck, but since
> >>> that are all sleeping locks I strongly doubt so.
> >>>
> >>> As immediately action please provide patches which changes those
> >>> GFP_KERNEL into GFP_NOWAIT.   =20
> >>
> >> Sure, I can do that. =20
> >=20
> > Hm, I might have been too prompt at claiming this was doable. In
> > practice, doing that might regress Lima and Panfrost in situations
> > where trying harder than GFP_NOWAIT would free up some memory. Not
> > saying this was right to use GFP_KERNEL in the first place, but some
> > expectations were set by this original mistake, so I'll probably need
> > Lima developers to vouch in for this change after they've done some
> > testing on a system under high memory pressure, and I'd need to do the
> > same kind of testing for Panfrost and ask Steve if he's okay with that
> > too. =20
>=20
> It's a tricky one. The ideal would be to teach user space how to recover
> from the memory allocation failure (even on older GPUs it's still in
> theory possible to break up the work and do incremental rendering). But
> that ship sailed long ago so this would be a regression.
>=20
> I did consider GFP_ATOMIC as an option, but really we shouldn't be
> accessing "memory reserves" in such a situation.
>=20
> For background: In the "kbase" driver (Linux kernel driver for the
> closed source user space 'DDK' driver for Midgard/Bifrost GPUs) we had a
> "JIT memory allocator". The idea here was that if you have multiple
> renderings in flight you can attempt to share the tiler heap memory
> between them. So in this case when we can't allocate more memory and we
> know there's another tiler heap which is going to be freed by a fragment
> job that's already running, we can block knowing the memory is going to
> become available.
>=20
> It was designed to do the same thing as CSF's incremental rendering -
> allow us to opportunistically allocate memory but not fail the rendering
> if it wasn't available.
>=20
> But it was a nightmare to have any confidence of it being deadlock free
> and the implementation was frankly terrible - which is ultimately why
> CSF GPU's have this ability in hardware to perform incremental rendering
> without failing the job. But effectively this approach requires
> allocating just enough memory for one complete tiler heap while ensuring
> forward progress and opportunistically allowing extra memory to give a
> performance boost.
>=20
> TLDR; I think we should try switching to GFP_NOWAIT in Panfrost and do
> some testing with memory pressure. It might be acceptable (and an
> occasional job failure is better than an occasional lock up). If it
> turns out it's too easy to trigger job failures like this then we'll
> need to rethink.

I thought about this incremental-rendering-on-JM thing during the past
few days, and I'd like to run one idea through you if you don't mind.
What if we tried to implement incremental rendering the way it's done
for CSF, that is, when we get a fault on a tiler heap object we:

1. flush caches on the tiler heap range (with a FLUSH_MEM command on the
   faulty AS), such that any primitive data that have been queued so far
   get pushed to the memory

2. use a different AS for an IR (Increment Rendering) fragment job that
   have been provided by the UMD at submission time, just like the
   CSF backend of the UMD registers an exception handler for tiler OOMs
   at the moment.
   Make it so this IR fragment job chain is queued immediately after the
   currently running fragment job (if any). This IR fragment job should
   consume all the primitives written so far and push the result to a
   framebuffer. There's a bit of patching to do on the final
   fragment job chain, because the FB preload setup will differ if
   IR took place, but that should be doable with simple WRITE_VALUE jobs
   turning NULL jobs into FRAGMENT jobs (or the other way around)
   such that they get skipped/activated depending on whether IR took
   place or not.

3. collect pages covering consumed primitives and make the heap range
   covering those consumed pages fault on further accesses (basically
   iommu->unmap() the section we collected pages from). We probably
   need to keep a couple pages around the top/bottom tiler heap
   pointers, because some partially written primitives might be crossing
   a heap chunk boundary, but assuming our heap has more than 4 chunks
   available (which we can ensure at tiler heap allocation time), we
   should be good.

4. use one of the collected pages to satisfy the growing request, and
   acknowledge the fault on the faulty AS. We can pick from the pool
   of collected pages to satisfy new growing requests until it's
   depleted again.

5. repeat steps 1-4 until all primitives are flushed.

6. reset the tiler heap mapping by doing an iommu->unmap() on the whole
   heap BO range, and collect all the pages that were previously
   allocated to the heap such that the next allocation can be satisfied
   immediately

Of course, this only works if primitives are added to the list only
when they are fully written (that is, all data for the primitive has
been written, and the primitive can be consumed by the fragment job
without hazards).

Just to be clear, this is a long term plan to try and fix this on JM
HW, and given the changes it involves (UMD needs to be taught about IR
on JM), we'll still need the GFP_NOWAIT fix for the time being.
