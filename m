Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 525FF87804B
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 14:07:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE024112A5F;
	Mon, 11 Mar 2024 13:07:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E7RoZj2U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02A64112A59;
 Mon, 11 Mar 2024 13:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710162436; x=1741698436;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=q9gdu9OzzJHtm3rmIhmHGmUx8M9j4VLWcCi9yJ7uPBQ=;
 b=E7RoZj2UGWVeScHN/wZQRDSlO/xtGpKlG83BBO27WPC0I/chGL/liJ/n
 FprpS641A+SsizzeeEI7dwaWqsjkY5lAMfH8U+H8aJnW9r+yndB2g0sel
 34D28ic6+VHfbSCZahAjFl54U1uVHvcQIdyohkeGs55Ii0LayTAtBHGZM
 JDVjZ0z1PCzIEJpsJOGa+i1+JYY1mJvsFAL4mJ19fgSsPruRzG7GDm6I0
 6p6lfN09haOwmx2bVlkwICeNS27/PCRJtQEgw4zRAHWgBa1nLzVr/lopM
 XetGrZoEv7PKcXfpQwEI3HxlkGzkuVaj+qdGTARtFXtrWhLXbvrKAaagO w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="8637510"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="8637510"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 06:07:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208";a="15655642"
Received: from binis42x-mobl.gar.corp.intel.com (HELO [10.249.254.59])
 ([10.249.254.59])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 06:07:13 -0700
Message-ID: <cb473e3de479d55cb3cfb2cc0b8ce6ecfd8d5b0c.camel@linux.intel.com>
Subject: Re: [PATCH v4 0/4] TTM unlockable restartable LRU list iteration
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: "Somalapuram, Amaranath" <asomalap@amd.com>, 
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org
Date: Mon, 11 Mar 2024 14:07:11 +0100
In-Reply-To: <13884e7d-f18c-f7a6-97d7-eb57f2bd2100@amd.com>
References: <20240306070125.27071-1-thomas.hellstrom@linux.intel.com>
 <13884e7d-f18c-f7a6-97d7-eb57f2bd2100@amd.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
MIME-Version: 1.0
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

On Fri, 2024-03-08 at 13:13 +0530, Somalapuram, Amaranath wrote:
> Patches are tested on AMD platform.
> Repeated stress test on Unigine Heaven, memory full (VRAM + GTT +
> system=20
> SWAP), then free.
> No errors/warning in kernel log.
> Any suggestion specific tests?

We are testing locally against Intel Xe CI and Intel i915 CI which
should give rather good coverage. If there are some amdgpu tests that
exercise eviction / swapping also with a lot of local objects (Vulkan
apps?) that would be great.

Thanks,
Thomas



>=20
> Regards,
> S.Amarnath
> On 3/6/2024 12:31 PM, Thomas Hellstr=C3=B6m wrote:
> > This patch-set is a prerequisite for a standalone TTM shrinker
> > and for exhaustive TTM eviction using sleeping dma_resv locks,
> > which is the motivation for it.
> >=20
> > Currently when unlocking the TTM lru list lock, iteration needs
> > to be restarted from the beginning, rather from the next LRU list
> > node. This can potentially be a big problem, because if eviction
> > or shrinking fails for whatever reason after unlock, restarting
> > is likely to cause the same failure over and over again.
> >=20
> > There are various schemes to be able to continue the list
> > iteration from where we left off. One such scheme used by the
> > GEM LRU list traversal is to pull items already considered off
> > the LRU list and reinsert them when iteration is done.
> > This has the drawback that concurrent list iteration doesn't see
> > the complete list (which is bad for exhaustive eviction) and also
> > doesn't lend itself well to bulk-move sublists since these will
> > be split in the process where items from those lists are
> > temporarily pulled from the list and moved to the list tail.
> >=20
> > The approach taken here is that list iterators insert themselves
> > into the list next position using a special list node. Iteration
> > is then using that list node as starting point when restarting.
> > Concurrent iterators just skip over the special list nodes.
> >=20
> > This is implemented in patch 1 and 2.
> >=20
> > For bulk move sublist the approach is the same, but when a bulk
> > move sublist is moved to the tail, the iterator is also moved,
> > causing us to skip parts of the list. That is undesirable.
> > Patch 3 deals with that, and when iterator detects it is
> > traversing a sublist, it registers with the ttm_lru_bulk_move
> > struct using a linked list, and when that bulk move sublist
> > is moved to the tail, any iterator registered with it will
> > first be moved to the tail of the sublist.
> > This is implemented in patch 3.
> >=20
> > The restartable property is used in patch 4 to restart swapout if
> > needed, but the main purpose is this paves the way for
> > shrinker- and exhaustive eviction.
> >=20
> > v2:
> > - Rework patch 3 completely.
> > v3:
> > - Fix a NULL pointer dereference found by Xe CI.
> > v4:
> > - Remove some leftover code causing build problems.
> >=20
> > Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Cc: <dri-devel@lists.freedesktop.org>
> >=20
> > Thomas Hellstr=C3=B6m (4):
> > =C2=A0=C2=A0 drm/ttm: Allow TTM LRU list nodes of different types
> > =C2=A0=C2=A0 drm/ttm: Use LRU hitches
> > =C2=A0=C2=A0 drm/ttm, drm/amdgpu, drm/xe: Consider hitch moves within b=
ulk
> > sublist
> > =C2=A0=C2=A0=C2=A0=C2=A0 moves
> > =C2=A0=C2=A0 drm/ttm: Allow continued swapout after -ENOSPC falure
> >=20
> > =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c |=C2=A0=C2=A0 4 +
> > =C2=A0 drivers/gpu/drm/ttm/ttm_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0 drivers/gpu/drm/ttm/ttm_device.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 33 +++-
> > =C2=A0 drivers/gpu/drm/ttm/ttm_resource.c=C2=A0=C2=A0=C2=A0=C2=A0 | 228
> > ++++++++++++++++++++-----
> > =C2=A0 drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +
> > =C2=A0 include/drm/ttm/ttm_device.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> > =C2=A0 include/drm/ttm/ttm_resource.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 96 +++++++++--
> > =C2=A0 7 files changed, 308 insertions(+), 60 deletions(-)
> >=20

