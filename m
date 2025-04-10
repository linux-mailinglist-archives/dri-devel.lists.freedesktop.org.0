Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 432AFA846CA
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 16:48:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D72D10E0A1;
	Thu, 10 Apr 2025 14:48:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="S+4tJIdl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7967B10E0A1;
 Thu, 10 Apr 2025 14:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744296495;
 bh=Km4ZA2D4RxySiEjHkrZF8RHeSOF8nwB3J/O3MEF+aAw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=S+4tJIdlEYap3kEuotD8cbHcIfJCpO16sKFcht7xOGB5dMVN1dpnKrI4FehMpu/1O
 7PoPKj1P5zPFlv+P1vTWp2KqqwYdYMkEkDnh384oQdfsoCNkSVIVhXfeycTMvk8NuN
 7ftK8iODjpak17YcQ85IRbBR7hpnFsLNI7A5DNY4KmYbTH24mn7JdEsrjyAsCe0xfb
 sqxKsjhOsOkyKyuQJ1z4vgi++3RFzEVXh9LtxofPX1IFiAkT9Znu+/u9Ge7f7raw1p
 iDfuIZOKfE4PREM/71AWY1efgc/dTFRW7huGJuYrWZpWhttzcmaK3xYGNRyzG4sh4f
 JdblUd+gbqOeA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3097017E35E5;
 Thu, 10 Apr 2025 16:48:15 +0200 (CEST)
Date: Thu, 10 Apr 2025 16:48:09 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRy?=
 =?UTF-8?B?acOhbg==?= Larumbe <adrian.larumbe@collabora.com>,
 lima@lists.freedesktop.org, Qiang Yu <yuq825@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, kernel@collabora.com, Christian
 =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Alyssa Rosenzweig
 <alyssa@rosenzweig.io>, Faith Ekstrand <faith.ekstrand@collabora.com>
Subject: Re: [PATCH v3 0/8] drm: Introduce sparse GEM shmem
Message-ID: <20250410164809.21109cbc@collabora.com>
In-Reply-To: <20250404092634.2968115-1-boris.brezillon@collabora.com>
References: <20250404092634.2968115-1-boris.brezillon@collabora.com>
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

+Christian, Alyssa and Faith, as suggested by Sima. I'll make sure to
Cc you on v4, but before that, I'd like to get your opinion on the
drm-gem/drm-gem-shmem changes to see if sending a v4 is actually
desirable or if I should go back to the drawing board.

On Fri,  4 Apr 2025 11:26:26 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> This patch series is a proposal for implementing sparse page allocations
> for shmem objects. It was initially motivated by a kind of BO managed by
> the Panfrost/Panthor and Lima drivers, the tiler heap, which grows on
> demand every time the GPU faults on a virtual address within the heap BO
> range.
>=20
> Because keeping a struct page pointer array that can describe the entire
> virtual range is wasteful when only a few backing pages have been
> allocated, we thought a sparse allocation approach with xarrays was a
> more efficient choice.
>=20
> This sparse GEM shmem features takes the form of a new optional
> drm_gem_shmem_sparse_backing object that can be attached to a
> drm_gem_shmem_object at creation time if the driver wants. When this
> sparse GEM shmem backing mode is enabled, the driver is allow to
> partially populate the GEM pages, either at use time, or at fault
> time. The page population can be done progressively as the need for
> more memory arises. The new APIs takes explicit gfp_t flags to solve
> a long standing issue reported by Sima a while ago: all allocations
> happening in the fault handler path shouldn't block.
>=20
> We also introduce two new helpers at the drm_gem.{c,h} level to
> automate the partial xarray population which the GEM-SHMEM logic
> relies on to populate its sparse page array.
>=20
> A few details about the implementation now:
>=20
> - Sparse GEM backing locking is deferred to the driver, because
>   we can't take the resv locks in the GPU fault handler path, and
>   since the page population can come from there, we have to let
>   the driver decide how to lock.
> - The pin/get semantics for sparse GEM shmem objects is different,
>   in that it doesn't populate the pages, but just flag them as
>   being used/required by some GPU component. The page population
>   will happen explicitly at GEM creation time or when a GPU fault
>   happens. Once pages have been populated, they won't disappear
>   until the GEM object is destroyed, purged or evicted. This means
>   you can grow, but not shrink. If we ever need to discard
>   BO ranges, the API can be extended to allow it, but it's not
>   something we needed for the Lima/Panthor/Panfrost case.
> - Panthor and Panfrost changes have been tested, but not extensively.
>   Lima changes have only been compile-tested.
>=20
> Changes from v2:
> - We decided to focus more on the DRM aspects and forget about the
>   sgt building optimizations (sgt helpers taking an xarray instead of
>   a plain array). If the xarray -> array copies happening in that
>   path ever become the bottleneck, we can resurrect those changes.
> - We decided to make the sparse GEM changes less invasive by making
>   them an extra layer on top of drm_gem_shmem_object. What this means
>   is that sparse GEM shmem can now be used as regular GEM shmem
>   objects (vmap, pin, export, ... all work as they would on a regular
>   GEM). When that happens, we just force all pages to be populated,
>   so we kinda lose the benefit of sparse GEMs, but that's fine, because
>   in practice, such objects shouldn't be manipulated as regular GEMs.
>   It just serves as a safety guard to limit the risk of regressions
>   introduced by these sparse GEM shmem changes.
>=20
> Discussion of previus revision can be found here[2][3].
>=20
> For those used to review gitlab MRs, here's a link [1] to a Draft
> MR grouping those changes, but I'm in no way asking that the review
> happens on gitlab.
>=20
> Regards,
>=20
> Boris
>=20
> [1]https://gitlab.freedesktop.org/panfrost/linux/-/merge_requests/16
> [2]https://lore.kernel.org/lkml/20250326021433.772196-1-adrian.larumbe@co=
llabora.com/T/
> [3]https://lore.kernel.org/dri-devel/20250218232552.3450939-1-adrian.laru=
mbe@collabora.com/
>=20
> Adri=C3=A1n Larumbe (1):
>   drm/gem: Add helpers to request a range of pages on a GEM
>=20
> Boris Brezillon (7):
>   drm/gem-shmem: Support sparse backing
>   drm/panfrost: Switch to sparse gem shmem to implement our
>     alloc-on-fault
>   drm/panthor: Add support for alloc-on-fault buffers
>   drm/panthor: Allow kernel BOs to pass DRM_PANTHOR_BO_ALLOC_ON_FAULT
>   drm/panthor: Add a panthor_vm_pre_fault_range() helper
>   drm/panthor: Make heap chunk allocation non-blocking
>   drm/lima: Use drm_gem_shmem_sparse_backing for heap buffers
>=20
>  drivers/gpu/drm/drm_gem.c               | 134 +++++++
>  drivers/gpu/drm/drm_gem_shmem_helper.c  | 404 +++++++++++++++++++-
>  drivers/gpu/drm/lima/lima_gem.c         |  89 ++---
>  drivers/gpu/drm/lima/lima_gem.h         |   1 +
>  drivers/gpu/drm/lima/lima_vm.c          |  48 ++-
>  drivers/gpu/drm/panfrost/panfrost_drv.c |   2 +-
>  drivers/gpu/drm/panfrost/panfrost_gem.c |  37 +-
>  drivers/gpu/drm/panfrost/panfrost_gem.h |   8 +-
>  drivers/gpu/drm/panfrost/panfrost_mmu.c |  98 ++---
>  drivers/gpu/drm/panfrost/panfrost_mmu.h |   2 +
>  drivers/gpu/drm/panthor/panthor_drv.c   |  20 +-
>  drivers/gpu/drm/panthor/panthor_fw.c    |   6 +-
>  drivers/gpu/drm/panthor/panthor_gem.c   |  18 +-
>  drivers/gpu/drm/panthor/panthor_gem.h   |  12 +-
>  drivers/gpu/drm/panthor/panthor_heap.c  | 222 ++++++-----
>  drivers/gpu/drm/panthor/panthor_mmu.c   | 481 ++++++++++++++++++------
>  drivers/gpu/drm/panthor/panthor_mmu.h   |   2 +
>  drivers/gpu/drm/panthor/panthor_sched.c |   6 +-
>  include/drm/drm_gem.h                   |  14 +
>  include/drm/drm_gem_shmem_helper.h      | 285 +++++++++++++-
>  include/uapi/drm/panthor_drm.h          |  19 +-
>  21 files changed, 1492 insertions(+), 416 deletions(-)
>=20

