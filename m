Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B918A6BE2
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 15:08:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B536112C62;
	Tue, 16 Apr 2024 13:08:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YUE+c2c6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21A1A112C62;
 Tue, 16 Apr 2024 13:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713272934; x=1744808934;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Ajjz9eWcM/7jooeC9oEaQuzQ54k1lEzBMZFQZV6p+IM=;
 b=YUE+c2c6THhBhCgHmJK20K9qQFDHtGRM0Y7OnuRdjAvpbDxpm25gY1eS
 63HVgse19OLzmVSe7T1nT48IV8UPXreYTmkOqSIm+efRwdFOL8MQuHRSp
 aG0njjSVCUddBImwp4CqmU/heQ+03P7c9GBSULjR2iveZ/Nd0V5YTw+vT
 YKjkBywYqh5+fecMntm8vUGiIyrB/VGSnHpLSu36bs5MiyVxBR76if/YT
 YvOywz/rzUEnXN1gOMYpcpIwyZuscs/5JYLRNRxFMbgy0nXYQ/9Lc8hSD
 8V6FNQLRIZWFZ2HxWLbFzCGT+mJXdEDsC4G/fnYzJwyeKQSU3n+MwSPb1 Q==;
X-CSE-ConnectionGUID: Dr7Q9KSkTCKJRU21lY/m3g==
X-CSE-MsgGUID: c/l7DVL7RwyqQyKvbSoldA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="26166887"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="26166887"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 06:08:54 -0700
X-CSE-ConnectionGUID: GgycSdmpQoCRh5sEDkdFzg==
X-CSE-MsgGUID: EzfdHUSzSzSFtrvVJ3OA6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="45533931"
Received: from fcgoea-mobl2.ger.corp.intel.com (HELO [10.249.254.79])
 ([10.249.254.79])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 06:08:52 -0700
Message-ID: <d5ea84dccfc9f41ebe27600a5144778683cf944c.camel@linux.intel.com>
Subject: Re: [PATCH v2 0/9] TTM shrinker helpers and xe buffer object shrinker
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 intel-xe@lists.freedesktop.org
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>, 
 dri-devel@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>, 
 "Kuehling, Felix" <Felix.Kuehling@amd.com>
Date: Tue, 16 Apr 2024 15:08:29 +0200
In-Reply-To: <bb679fc6-7890-4b4a-a8cd-8ae7ce087a9f@amd.com>
References: <20240416100730.6666-1-thomas.hellstrom@linux.intel.com>
 <bb679fc6-7890-4b4a-a8cd-8ae7ce087a9f@amd.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
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

Hi, Christian,

On Tue, 2024-04-16 at 13:55 +0200, Christian K=C3=B6nig wrote:
> While patches 1-4 look good from a high level I still think it needs=20
> some prerequisite and re-ordering.
>=20
> First of all make all the cleanups separate patches. In other words
> that=20
> ttm_resource_manager_next() takes only the cursor as argument, adding
> ttm_resource_cursor_fini()/ttm_resource_cursor_fini_locked() as one=20
> patch and then ttm_lru_bulk_move_init()/ttm_lru_bulk_move_fini() as
> second.

Yes, I can take a look at that. I think the shortening of the argument
list of ttm_resource_manager_next() makes sense as a separate cleanup.=C2=
=A0

The other two are needed because of the changes introduced in the
respective patches. I could of course add stubs of these functions
before the patch that currently introduce them if needed, but don't
really see the point. What do you think.

>=20
> With that done I think we should first switch over TTM and all
> drivers=20
> using it to drm_exec as part of it's context object.

So are you ok with adding an optional drm_exec pointer in the
ttm_operation_ctx for this? (That was my plan moving forward).

However, when that has been added, I think it makes sense to leave to
the driver author to port their validation loops and bo allocation over
to using drm_exec. While we made sure the drm_exec object was indeed
passed to the validation helper in the drm_gpuvm code, I'm not sure
everybody actually includes their validation and bo allocation (for
example page-table-bos) in their drm_exec while_not_all_locked() loop,
and I think it's reasonable to require the "port the driver over" to be
an optional but strongly recommended driver effort. If the driver sets
ctx->drm_exec to NULL, it will fallback to current behaviour.

>=20
> Then I would switch over to using LRU hitches for both swapping and=20
> eviction.
>=20
> And when that's finally done we can take a look into the partial
> shmem=20
> swapping :)
>=20
> And Felix is really (and mean *really*) looking forward to the
> partial=20
> shmem swapping as well.

While the LRU walker helper introduced in patch 8 has drm_exec support,
shrinkers don't require it, since they are always trylocking. (However
being able to "evict" system to swap directly in the validation stage
using drm_exec locking is probably something we should support).=20

That's why I opted for implementing shrinking before exhaustive
eviction. But if you insist we can do it the other way around. Most of
what's needed is already in the patches.

/Thomas


>=20
> Regards,
> Christian.
>=20
> Am 16.04.24 um 12:07 schrieb Thomas Hellstr=C3=B6m:
> > This series implements TTM shrinker / eviction helpers and an xe bo
> > shrinker. It builds on two previous series, *and obsoletes these*.
> > First
> >=20
> > https://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg484425.=
html
> >=20
> > for patch 1-4, which IMO still could be reviewed and pushed as a
> > separate series.
> >=20
> > Second the previous TTM shrinker series
> >=20
> > https://lore.kernel.org/linux-mm/b7491378-defd-4f1c-31e2-29e4c77e2d67@a=
md.com/T/
> >=20
> > Where the comment about layering
> > https://lore.kernel.org/linux-mm/b7491378-defd-4f1c-31e2-29e4c77e2d67@a=
md.com/T/#ma918844aa8a6efe8768fdcda0c6590d5c93850c9
> >=20
> > now addressed, and this version also implements shmem objects for
> > backup
> > rather than direct swap-cache insertions, which was used in the
> > previuos
> > series. It turns out that with per-page backup / shrinking, shmem
> > objects
> > appears to work just as well as direct swap-cache insertions with
> > the
> > added benefit that was introduced in the previous TTM shrinker
> > series to
> > avoid running out of swap entries isn't really needed.
> >=20
> > In any case, patch 1-4 are better described in their separate
> > series.
> > (RFC is removed for those).
> >=20
> > Patch 5 could in theory be skipped but introduces a possibility to
> > easily
> > add or test multiple backup backends, like the direct swap-cache
> > insertion or even files into fast dedicated nvme storage for for
> > example.
> >=20
> > Patch 6 introduces helpers in the ttm_pool code for page-by-page
> > shrinking
> > and recovery. It avoids having to temporarily allocate a huge
> > amount of
> > memory to be able to shrink a buffer object. It also introduces the
> > possibility to immediately write-back pages if needed, since that
> > tends
> > to be a bit delayed when left to kswapd.
> >=20
> > Patch 7 Adds a simple error injection to the above code to help
> > increase
> > test coverage.
> >=20
> > Patch 8 introduces a LRU walk helper for eviction and shrinking.
> > It's
> > currently xe-only but not xe-specific and can easily be moved to
> > TTM when
> > used by more than one driver or when eviction is implemented using
> > it.
> >=20
> > Patch 9 introduces a helper callback for shrinking (Also ready to
> > be
> > moved to TTM) and an xe-specific shrinker implementation. It also
> > adds a kunit test to test the shrinker functionality by trying to
> > allocate twice the available amount of RAM as buffer objects. If
> > there
> > is no swap-space available, the buffer objects are marked
> > purgeable.
> >=20
> > v2:
> > - Squash obsolete revision history in the patch commit messages.
> > - Fix a couple of review comments by Christian
> > - Don't store the mem_type in the TTM managers but in the
> > =C2=A0=C2=A0 resource cursor.
> > - Rename introduced TTM *back_up* function names to *backup*
> > - Add ttm pool recovery fault injection.
> > - Shrinker xe kunit test
> > - Various bugfixes
> >=20
> > Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Cc: <dri-devel@lists.freedesktop.org>
> >=20
> > Thomas Hellstr=C3=B6m (8):
> > =C2=A0=C2=A0 drm/ttm: Allow TTM LRU list nodes of different types
> > =C2=A0=C2=A0 drm/ttm: Use LRU hitches
> > =C2=A0=C2=A0 drm/ttm, drm/amdgpu, drm/xe: Consider hitch moves within b=
ulk
> > sublist
> > =C2=A0=C2=A0=C2=A0=C2=A0 moves
> > =C2=A0=C2=A0 drm/ttm: Allow continued swapout after -ENOSPC falure
> > =C2=A0=C2=A0 drm/ttm: Add a virtual base class for graphics memory back=
up
> > =C2=A0=C2=A0 drm/ttm/pool: Provide a helper to shrink pages.
> > =C2=A0=C2=A0 drm/xe, drm/ttm: Provide a generic LRU walker helper
> > =C2=A0=C2=A0 drm/xe: Add a shrinker for xe bos
> >=20
> > =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c |=C2=A0=C2=A0 4 +
> > =C2=A0 drivers/gpu/drm/ttm/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> > =C2=A0 drivers/gpu/drm/ttm/ttm_backup_shmem.c | 137 +++++++++
> > =C2=A0 drivers/gpu/drm/ttm/ttm_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0 drivers/gpu/drm/ttm/ttm_device.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 33 ++-
> > =C2=A0 drivers/gpu/drm/ttm/ttm_pool.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 391
> > ++++++++++++++++++++++++-
> > =C2=A0 drivers/gpu/drm/ttm/ttm_resource.c=C2=A0=C2=A0=C2=A0=C2=A0 | 231=
 ++++++++++++---
> > =C2=A0 drivers/gpu/drm/ttm/ttm_tt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 34 +++
> > =C2=A0 drivers/gpu/drm/xe/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> > =C2=A0 drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 123 ++++++--
> > =C2=A0 drivers/gpu/drm/xe/xe_bo.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +
> > =C2=A0 drivers/gpu/drm/xe/xe_device.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 8 +
> > =C2=A0 drivers/gpu/drm/xe/xe_device_types.h=C2=A0=C2=A0 |=C2=A0=C2=A0 2=
 +
> > =C2=A0 drivers/gpu/drm/xe/xe_shrinker.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 237 +++++++++++++++
> > =C2=A0 drivers/gpu/drm/xe/xe_shrinker.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 18 ++
> > =C2=A0 drivers/gpu/drm/xe/xe_ttm_helpers.c=C2=A0=C2=A0=C2=A0 | 224 ++++=
++++++++++
> > =C2=A0 drivers/gpu/drm/xe/xe_ttm_helpers.h=C2=A0=C2=A0=C2=A0 |=C2=A0 63=
 ++++
> > =C2=A0 drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +
> > =C2=A0 include/drm/ttm/ttm_backup.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 136 +++++++++
> > =C2=A0 include/drm/ttm/ttm_device.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> > =C2=A0 include/drm/ttm/ttm_pool.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +
> > =C2=A0 include/drm/ttm/ttm_resource.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 96 +++++-
> > =C2=A0 include/drm/ttm/ttm_tt.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 19 ++
> > =C2=A0 23 files changed, 1683 insertions(+), 91 deletions(-)
> > =C2=A0 create mode 100644 drivers/gpu/drm/ttm/ttm_backup_shmem.c
> > =C2=A0 create mode 100644 drivers/gpu/drm/xe/xe_shrinker.c
> > =C2=A0 create mode 100644 drivers/gpu/drm/xe/xe_shrinker.h
> > =C2=A0 create mode 100644 drivers/gpu/drm/xe/xe_ttm_helpers.c
> > =C2=A0 create mode 100644 drivers/gpu/drm/xe/xe_ttm_helpers.h
> > =C2=A0 create mode 100644 include/drm/ttm/ttm_backup.h
> >=20
>=20

