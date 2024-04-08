Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F6689C00D
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 15:05:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9916011257D;
	Mon,  8 Apr 2024 13:05:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FMYod2hd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F96A11257C;
 Mon,  8 Apr 2024 13:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712581509; x=1744117509;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=4c3II6I63b5zQez61oUwFmcWIu64F+YsDN+bWmgEMvU=;
 b=FMYod2hdyxOPMck0g9YYdYvSR+FvwgyGibalLRsq1Igoa1Vbh0GkUoop
 EX8SbyvTZoLCK2SBA1STdHhH650GhDDS5IVJATDzCEXYQbPPozNevkD9i
 zXLpy8VTs8kR4jUA9sxd6sq5KnaQ6JEhp/nVYuTae4sqi7SUS6uj8pipI
 IpIpUCEqwE6mm4OsrrgWn1oJ25NjSR02XIz8sEpIA6HZJj6SuY6zv5l5v
 3U5EbKH0/wyWPy1RpkmPUgypwQWpHekoqYBW3bWV/EPEyPD6Vj5tnwoe5
 sT6hZKkJxmTVmTwjd3SIVNeSL/IfskghEy69qRGUUzuVBhqXZWo+PEsSy Q==;
X-CSE-ConnectionGUID: K9Rf7jekTn6ljWFJSk+9rA==
X-CSE-MsgGUID: rx8KeiKBSseLQup8llE5LA==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7713325"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="7713325"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 06:05:05 -0700
X-CSE-ConnectionGUID: wOU44WP1RGGcgbHb5T83dA==
X-CSE-MsgGUID: 9cPMaisRQ5qjx5FXNAhd3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="57351107"
Received: from sbint17x-mobl.gar.corp.intel.com (HELO [10.249.254.38])
 ([10.249.254.38])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 06:05:04 -0700
Message-ID: <2b1773f0872b27ca6610c44d56c6e33b11b4013b.camel@linux.intel.com>
Subject: Re: [RFC PATCH 0/8] TTM shrinker helpers and xe buffer object shrinker
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: "Somalapuram, Amaranath" <asomalap@amd.com>, 
 intel-xe@lists.freedesktop.org
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org
Date: Mon, 08 Apr 2024 15:05:00 +0200
In-Reply-To: <8dcfeda5-fa95-39c5-6264-248941934ee6@amd.com>
References: <20240329145707.3087-1-thomas.hellstrom@linux.intel.com>
 <8dcfeda5-fa95-39c5-6264-248941934ee6@amd.com>
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

Hi, Amaranath,

On Tue, 2024-04-02 at 17:25 +0530, Somalapuram, Amaranath wrote:
>=20
> On 3/29/2024 8:26 PM, Thomas Hellstr=C3=B6m wrote:
> > This series implements TTM shrinker / eviction helpers and an xe bo
> > shrinker. It builds on two previous series. First
> >=20
> > https://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg484425.=
html
> >=20
> > for patch 1-4, which IMO still could be reviewed and pushed as a
> > separate series.
> >=20
> > Second the previous TTM shrinker series=20
> On the latest drm-misc good amount of conflicts on both patch series,
> able to re-base first one, Second on has 16 patches.
> If you have latest re-base patches, Please share it.

I was a bit unclear here. This series includes a rebased variant of the
first series, and the rest of this series is a rework of the remaining
patches in the second series below.

So this series is self-contained and the links are provided only for
reference and context. This series still seems to apply using git am -3
on drm-tip, and with a minor single conflict on drm-misc-next.
(Typically we send the patches against drm-tip since that's what CI is
using).

The below series has not been rebased but I have a version of this
series with a direct-swap-cache insertion backend lying around
somewhere. I can post it or share it on gitlab if you want.

Thanks,
/Thomas



>=20
> Regards,
> S.Amarnath
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
> > Patch 7 introduces a LRU walk helper for eviction and shrinking.
> > It's
> > currently xe-only but not xe-specific and can easily be moved to
> > TTM when
> > used by more than one driver or when eviction is implemented using
> > it.
> >=20
> > Patch 8 introduces a helper callback for shrinking (Also ready to
> > be
> > moved to TTM) and an xe-specific shrinker implementation.
> >=20
> > Testing:
> > ATM I don't think we have good tests to cover the shrinking
> > functionality
> > The series has been tested with a hack that continously creates
> > TTM_TT buffer objects until system memory and swap space is
> > exhausted,
> > and then reads them back and frees them. However, these tests
> > seem to be very slow.
> > Ideally a similar test on a machine with very fast solid state or
> > similar storage should be set up. Ideally also verifying content
> > preservation.
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

