Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85129A856BC
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 10:38:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81D5C10EB3A;
	Fri, 11 Apr 2025 08:38:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="BeA1o36G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88EEB10EB53;
 Fri, 11 Apr 2025 08:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744360722;
 bh=4HvqAkHvCmWpZTSbksXIHbQSOLSYhqFyVHjSsXV5SoY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BeA1o36G+Avn/S333p3GniurUu5SxVyQ6M+RVA+ye9XzgAPfPOaN556g6ZPHb2V7R
 3IgMjIkci+GDKdhwhjCceuOovhBy+m7L18VOF/QxREX1sUW+NFN3TrXdAh/WLmxo1U
 zCk8lJ7YR3pmPPVjDRnk8QrgfyFATZ1xCS9Vbui1LZNN8Ykhc8Guf9jP6MROEowZXI
 ecym2UQvoOeaFJ+TctX1cPpk6qfZpBCj3EKEll6Bm+ZVZpLu752bwk9cQVtm1zHqb0
 5NBR/C6JRri+fLgPz5LRwkYXy+tggwZ4MyD8Ty+FLX8O+smrHhZhsbNlo3YKWy/YTj
 W9LLzc+NM+smQ==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id D7FA517E0881;
 Fri, 11 Apr 2025 10:38:41 +0200 (CEST)
Date: Fri, 11 Apr 2025 10:38:37 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRy?=
 =?UTF-8?B?acOhbg==?= Larumbe <adrian.larumbe@collabora.com>,
 lima@lists.freedesktop.org, Qiang Yu <yuq825@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, kernel@collabora.com,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Subject: Re: [PATCH v3 0/8] drm: Introduce sparse GEM shmem
Message-ID: <20250411103837.753cd92e@collabora.com>
In-Reply-To: <4d47cb90-8ed4-4a69-bd91-b90ebd2c9aca@amd.com>
References: <20250404092634.2968115-1-boris.brezillon@collabora.com>
 <20250410164809.21109cbc@collabora.com>
 <d4ebcb9f-ca1e-40ae-bc3c-613f88552b94@amd.com>
 <20250410175349.6bf6a4ea@collabora.com>
 <d0ab2ffe-77ee-4bda-b127-8648acb71409@amd.com>
 <20250410192054.24a592a5@collabora.com> <Z_gHX5AqQkhbXOjd@blossom>
 <20250410204155.55d5cfc7@collabora.com>
 <4d47cb90-8ed4-4a69-bd91-b90ebd2c9aca@amd.com>
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

On Fri, 11 Apr 2025 10:04:07 +0200
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> Am 10.04.25 um 20:41 schrieb Boris Brezillon:
> > On Thu, 10 Apr 2025 14:01:03 -0400
> > Alyssa Rosenzweig <alyssa@rosenzweig.io> wrote:
> > =20
> >>>>> In Panfrost and Lima, we don't have this concept of "incremental
> >>>>> rendering", so when we fail the allocation, we just fail the
> >>>>> GPU job with an unhandled GPU fault.     =20
> >>>> To be honest I think that this is enough to mark those two
> >>>> drivers as broken.=C2=A0 It's documented that this approach is a
> >>>> no-go for upstream drivers.
> >>>>
> >>>> How widely is that used?   =20
> >>> It exists in lima and panfrost, and I wouldn't be surprised if a
> >>> similar mechanism was used in other drivers for tiler-based GPUs
> >>> (etnaviv, freedreno, powervr, ...), because ultimately that's how
> >>> tilers work: the amount of memory needed to store per-tile
> >>> primitives (and metadata) depends on what the geometry pipeline
> >>> feeds the tiler with, and that can't be predicted. If you
> >>> over-provision, that's memory the system won't be able to use
> >>> while rendering takes place, even though only a small portion
> >>> might actually be used by the GPU. If your allocation is too
> >>> small, it will either trigger a GPU fault (for HW not supporting
> >>> an "incremental rendering" mode) or under-perform (because
> >>> flushing primitives has a huge cost on tilers).   =20
> >> Yes and no.
> >>
> >> Although we can't allocate more memory for /this/ frame, we know
> >> the required size is probably constant across its lifetime. That
> >> gives a simple heuristic to manage the tiler heap efficiently
> >> without allocations - even fallible ones - in the fence signal
> >> path:
> >>
> >> * Start with a small fixed size tiler heap
> >> * Try to render, let incremental rendering kick in when it's too
> >> small.
> >> * When cleaning up the job, check if we used incremental rendering.
> >> * If we did - double the size of the heap the next time we submit
> >> work.
> >>
> >> The tiler heap still grows dynamically - it just does so over the
> >> span of a couple frames. In practice that means a tiny hit to
> >> startup time as we dynamically figure out the right size,
> >> incurring extra flushing at the start, without needing any
> >> "grow-on-page-fault" heroics.
> >>
> >> This should solve the problem completely for CSF/panthor. So it's
> >> only hardware that architecturally cannot do incremental rendering
> >> (older Mali: panfrost/lima) where we need this mess. =20
> > OTOH, if we need something
> > for Utgard(Lima)/Midgard/Bifrost/Valhall(Panfrost), why not use the
> > same thing for CSF, since CSF is arguably the sanest of all the HW
> > architectures listed above: allocation can fail/be non-blocking,
> > because there's a fallback to incremental rendering when it fails. =20
>=20
> Yeah that is a rather interesting point Alyssa noted here.
>=20
> So basically you could as well implement it like this:
> 1. Userspace makes a submission.
> 2. HW finds buffer is not large enough, sets and error code and
> completes submission. 3. Userspace detects error, re-allocates buffer
> with increased size. 4. Userspace re-submits to incremental complete
> the submission. 5. Eventually repeat until fully completed.
>=20
> That would work but is likely just not the most performant solution.
> So faulting in memory on demand is basically just an optimization and
> that is ok as far as I can see.

Yeah, Alyssa's suggestion got me thinking too, and I think I can come
up with a plan where we try non-blocking allocation first, and if it
fails, we trigger incremental rendering, and queue a blocking
heap-chunk allocation on separate workqueue, such that next time the
tiler heap hits an OOM, it has a chunk (or multiple chunks) readily
available if the blocking allocation completed in the meantime. That's
basically what Alyssa suggested, with an optimization if the system is
not under memory pressure, and without userspace being involved (so no
uAPI changes).

I guess this leaves older GPUs that don't support incremental rendering
in a bad place though.

>=20
> That is then a rather good justification for your work Boris. Because
> a common component makes it possible to implement a common fault
> injection functionality to make sure that the fallback path is
> properly exercised in testing.

I can also add an fault injection mechanism to validate that, yep.

Thanks,

Boris
