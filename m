Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2C3ADD0A3
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 16:56:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC13810E732;
	Tue, 17 Jun 2025 14:55:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V7gMm3LT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C7A510E2AC;
 Tue, 17 Jun 2025 14:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750172158; x=1781708158;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=B6FnhJnDvRly8L5vaAZSE1wsb7QZqcI/IhBhjfzidyo=;
 b=V7gMm3LTkIE0+df4aub+s0w169eu6m+jfuq0dufWV+FP857Aqb0hERaD
 mp48MZeF2LepEIYWvBlIsH4/iIsCOfv7YuxRpAE+FmXnOSnYnfDiTlibQ
 bSWkf+EWIpa7QroY7T3zCoFM9I4d1tCxQd+cUdx9uaOsletcDUgk/qHE3
 4YWZBcYT5MWTwYcRuO2aJ3M5LqwTtcTZ7ZFfdOlWqpPCNFMNm1cziOmGv
 xUU7GYqulicFFDIZXsTK6uk2swuj6GrwjgjlrD3xW0/VEi+5oLJ5hQItp
 3T+xa0jROY6W0Ax5uCzyZAhJUMQD4WmfImInxyTLobXkZCN/TROlz+xqH w==;
X-CSE-ConnectionGUID: HG69XTMuTcezuW1YSNh5yg==
X-CSE-MsgGUID: tFz4cgQuQL+UHHzjz1iWdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52490702"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="52490702"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 07:55:44 -0700
X-CSE-ConnectionGUID: eAnQd7TfSVq1GBxtEYiIFQ==
X-CSE-MsgGUID: VcGK9xCFTMCqdBBn1esNXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="149354682"
Received: from zzombora-mobl1 (HELO [10.245.245.188]) ([10.245.245.188])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 07:55:40 -0700
Message-ID: <5da4b6f81517a6c091411a92e1c9d3fd5b902dba.camel@linux.intel.com>
Subject: Re: [PATCH v3 1/3] drm/gpusvm, drm/pagemap: Move migration
 functionality to drm_pagemap
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, 
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 dri-devel@lists.freedesktop.org, 	apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>,  Felix =?ISO-8859-1?Q?K=FChling?=	
 <felix.kuehling@amd.com>, Philip Yang <philip.yang@amd.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>, dakr@kernel.org,
 "Mrozek, Michal"	 <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Date: Tue, 17 Jun 2025 16:55:26 +0200
In-Reply-To: <e4d37eb0-ec91-47c5-b888-0b5bbb74db84@intel.com>
References: <20250613140219.87479-1-thomas.hellstrom@linux.intel.com>
 <20250613140219.87479-2-thomas.hellstrom@linux.intel.com>
 <93e663cf-01e7-4241-89ea-3bdda3d19437@intel.com>
 <f08ed0c71c8f193bbf09888e14d0171802415dcf.camel@linux.intel.com>
 <e4d37eb0-ec91-47c5-b888-0b5bbb74db84@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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

On Tue, 2025-06-17 at 20:17 +0530, Ghimiray, Himal Prasad wrote:
>=20
>=20
> On 17-06-2025 18:41, Thomas Hellstr=C3=B6m wrote:
> > On Tue, 2025-06-17 at 18:25 +0530, Ghimiray, Himal Prasad wrote:
> > >=20
> > >=20
> > > On 13-06-2025 19:32, Thomas Hellstr=C3=B6m wrote:
> > > > From: Matthew Brost <matthew.brost@intel.com>
> > > >=20
> > > > The migration functionality and track-keeping of per-pagemap
> > > > VRAM
> > > > mapped to the CPU mm is not per GPU_vm, but rather per pagemap.
> > > > This is also reflected by the functions not needing the
> > > > drm_gpusvm
> > > > structures. So move to drm_pagemap.
> > > >=20
> > > > With this, drm_gpusvm shouldn't really access the page zone-
> > > > device-
> > > > data
> > > > since its meaning is internal to drm_pagemap. Currently it's
> > > > used
> > > > to
> > > > reject mapping ranges backed by multiple drm_pagemap
> > > > allocations.
> > > > For now, make the zone-device-data a void pointer.
> > > >=20
> > > > Alter the interface of drm_gpusvm_migrate_to_devmem() to ensure
> > > > we
> > > > don't
> > > > pass a gpusvm pointer.
> > > >=20
> > > > Rename CONFIG_DRM_XE_DEVMEM_MIRROR to CONFIG_DRM_XE_PAGEMAP.
> > > >=20
> > > > Matt is listed as author of this commit since he wrote most of
> > > > the
> > > > code,
> > > > and it makes sense to retain his git authorship.
> > > > Thomas mostly moved the code around.
> > >=20
> > > >=20
> > > > v3:
> > > > - Kerneldoc fixes (CI)
> > > > - Don't update documentation about how the drm_pagemap
> > > > =C2=A0=C2=A0=C2=A0 migration should be interpreted until upcoming
> > > > =C2=A0=C2=A0=C2=A0 patches where the functionality is implemented.
> > > > =C2=A0=C2=A0=C2=A0 (Matt Brost)
> > > >=20
> > > > Co-developed-by: Thomas Hellstr=C3=B6m
> > > > <thomas.hellstrom@linux.intel.com>
> > > > Signed-off-by: Thomas Hellstr=C3=B6m
> > > > <thomas.hellstrom@linux.intel.com>
> > > > ---
> > > > =C2=A0=C2=A0 Documentation/gpu/rfc/gpusvm.rst=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 12 +-
> > > > =C2=A0=C2=A0 drivers/gpu/drm/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +-
> > > > =C2=A0=C2=A0 drivers/gpu/drm/drm_gpusvm.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 759 +----------------
> > > > -----
> > > > ----
> > > > =C2=A0=C2=A0 drivers/gpu/drm/drm_pagemap.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 788
> > > > +++++++++++++++++++++++++++
> > > > =C2=A0=C2=A0 drivers/gpu/drm/xe/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 10 +-
> > > > =C2=A0=C2=A0 drivers/gpu/drm/xe/xe_bo_types.h=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 2 +-
> > > > =C2=A0=C2=A0 drivers/gpu/drm/xe/xe_device_types.h |=C2=A0=C2=A0 2 +=
-
> > > > =C2=A0=C2=A0 drivers/gpu/drm/xe/xe_svm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 47 +-
> > > > =C2=A0=C2=A0 include/drm/drm_gpusvm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 96 ----
> > > > =C2=A0=C2=A0 include/drm/drm_pagemap.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 101 ++++
> > > > =C2=A0=C2=A0 10 files changed, 950 insertions(+), 873 deletions(-)
> > > > =C2=A0=C2=A0 create mode 100644 drivers/gpu/drm/drm_pagemap.c
> > > >=20
> > > > diff --git a/Documentation/gpu/rfc/gpusvm.rst
> > > > b/Documentation/gpu/rfc/gpusvm.rst
> > > > index bcf66a8137a6..469db1372f16 100644
> > > > --- a/Documentation/gpu/rfc/gpusvm.rst
> > > > +++ b/Documentation/gpu/rfc/gpusvm.rst
> > > > @@ -73,15 +73,21 @@ Overview of baseline design
> > > > =C2=A0=C2=A0 .. kernel-doc:: drivers/gpu/drm/drm_gpusvm.c
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :doc: Locking
> > > > =C2=A0=C2=A0=20
> > > > -.. kernel-doc:: drivers/gpu/drm/drm_gpusvm.c
> > > > -=C2=A0=C2=A0 :doc: Migration
> > > > -
> > > > =C2=A0=C2=A0 .. kernel-doc:: drivers/gpu/drm/drm_gpusvm.c
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :doc: Partial Unmapping of Ranges
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0 .. kernel-doc:: drivers/gpu/drm/drm_gpusvm.c
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :doc: Examples
> > > > =C2=A0=C2=A0=20
> > > > +Overview of drm_pagemap design
> > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> > > > +
> > > > +.. kernel-doc:: drivers/gpu/drm/drm_pagemap.c
> > > > +=C2=A0=C2=A0 :doc: Overview
> > > > +
> > > > +.. kernel-doc:: drivers/gpu/drm/drm_pagemap.c
> > > > +=C2=A0=C2=A0 :doc: Migration
> > > > +
> > > > =C2=A0=C2=A0 Possible future design features
> > > > =C2=A0=C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > =C2=A0=C2=A0=20
> > > > diff --git a/drivers/gpu/drm/Makefile
> > > > b/drivers/gpu/drm/Makefile
> > > > index 5050ac32bba2..4dafbdc8f86a 100644
> > > > --- a/drivers/gpu/drm/Makefile
> > > > +++ b/drivers/gpu/drm/Makefile
> > > > @@ -104,7 +104,11 @@ obj-$(CONFIG_DRM_PANEL_BACKLIGHT_QUIRKS)
> > > > +=3D
> > > > drm_panel_backlight_quirks.o
> > > > =C2=A0=C2=A0 #
> > > > =C2=A0=C2=A0 obj-$(CONFIG_DRM_EXEC) +=3D drm_exec.o
> > > > =C2=A0=C2=A0 obj-$(CONFIG_DRM_GPUVM) +=3D drm_gpuvm.o
> > > > -obj-$(CONFIG_DRM_GPUSVM) +=3D drm_gpusvm.o
> > > > +
> > > > +drm_gpusvm_helper-y :=3D \
> > > > +	drm_gpusvm.o\
> > > > +	drm_pagemap.o
> > > > +obj-$(CONFIG_DRM_GPUSVM) +=3D drm_gpusvm_helper.o
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0 obj-$(CONFIG_DRM_BUDDY) +=3D drm_buddy.o
> > > > =C2=A0=C2=A0=20
> > > > diff --git a/drivers/gpu/drm/drm_gpusvm.c
> > > > b/drivers/gpu/drm/drm_gpusvm.c
> > > > index 7ff81aa0a1ca..ef81381609de 100644
> > > > --- a/drivers/gpu/drm/drm_gpusvm.c
> > > > +++ b/drivers/gpu/drm/drm_gpusvm.c
> > > > @@ -8,10 +8,9 @@
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0 #include <linux/dma-mapping.h>
> > > > =C2=A0=C2=A0 #include <linux/hmm.h>
> > > > +#include <linux/hugetlb_inline.h>
> > > > =C2=A0=C2=A0 #include <linux/memremap.h>
> > > > -#include <linux/migrate.h>
> > > > =C2=A0=C2=A0 #include <linux/mm_types.h>
> > > > -#include <linux/pagemap.h>
> > > > =C2=A0=C2=A0 #include <linux/slab.h>
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0 #include <drm/drm_device.h>
> > > > @@ -107,21 +106,6 @@
> > > > =C2=A0=C2=A0=C2=A0 * to add annotations to GPU SVM.
> > > > =C2=A0=C2=A0=C2=A0 */
> > > > =C2=A0=C2=A0=20
> > > > -/**
> > > > - * DOC: Migration
> > > > - *
> > > > - * The migration support is quite simple, allowing migration
> > > > between RAM and
> > > > - * device memory at the range granularity. For example, GPU
> > > > SVM
> > > > currently does
> > > > - * not support mixing RAM and device memory pages within a
> > > > range.
> > > > This means
> > > > - * that upon GPU fault, the entire range can be migrated to
> > > > device
> > > > memory, and
> > > > - * upon CPU fault, the entire range is migrated to RAM. Mixed
> > > > RAM
> > > > and device
> > > > - * memory storage within a range could be added in the future
> > > > if
> > > > required.
> > > > - *
> > > > - * The reasoning for only supporting range granularity is as
> > > > follows: it
> > > > - * simplifies the implementation, and range sizes are driver-
> > > > defined and should
> > > > - * be relatively small.
> > > > - */
> > > > -
> > > > =C2=A0=C2=A0 /**
> > > > =C2=A0=C2=A0=C2=A0 * DOC: Partial Unmapping of Ranges
> > > > =C2=A0=C2=A0=C2=A0 *
> > > > @@ -193,10 +177,9 @@
> > > > =C2=A0=C2=A0=C2=A0 *		if (driver_migration_policy(range)) {
> > > > =C2=A0=C2=A0=C2=A0 *			mmap_read_lock(mm);
> > > > =C2=A0=C2=A0=C2=A0 *			devmem =3D driver_alloc_devmem();
> > > > - *			err =3D
> > > > drm_gpusvm_migrate_to_devmem(gpusvm,
> > > > range,
> > > > - *						=09
> > > > devmem_allocation,
> > > > - *							=C2=A0=C2=A0
> > > > &ctx);
> > > > - *			mmap_read_unlock(mm);
> > > > + *			err =3D
> > > > drm_pagemap_migrate_to_devmem(devmem, gpusvm->mm, gpuva_start,
> > > > + *
> > > > gpuva_end, driver_pgmap_owner());
> > >=20
> > >=20
> > >=20
> > > fix doc passing timeslice as parameter.
> >=20
> > Will fix.
> >=20
> > >=20
> >=20
> > 8<-----------------------------------------------------------------
> > ----
> > > > +/**
> > > > + * drm_pagemap_migrate_to_devmem() - Migrate a struct
> > > > mm_struct
> > > > range to device memory
> > > > + * @devmem_allocation: The device memory allocation to migrate
> > > > to.
> > > > + * The caller should hold a reference to the device memory
> > > > allocation,
> > > > + * and the reference is consumed by this function unless it
> > > > returns with
> > > > + * an error.
> > > > + * @mm: Pointer to the struct mm_struct.
> > > > + * @start: Start of the virtual address range to migrate.
> > > > + * @end: End of the virtual address range to migrate.
> > > > + * @timeslice_ms: The time requested for the migrated pages to
> > > > + * be present in the cpu memory map before migrated back.
> > >=20
> > > Shouldn't this be present in gpu or cpu memory map ? We are using
> > > this
> > > to ensure pagefault can be handled effectively by ensuring pages
> > > remain
> > > in vram here for prescribed time too.
> >=20
> > So with this split, drm_pagemap is responsible for migrating memory
> > and
> > updating the CPU memory map only, whereas drm_gpusvm is responsible
> > for
> > setting up the GPU memory maps. So if it remains in the CPU memory
> > map,
> > then nothing will force the gpu vms to invalidate, unless the gpu
> > driver decides to invalidate itself.
>=20
> Thats true.
>=20
> >=20
> > But looking at this i should probably rephrase "before migrated
> > back"
> > to "before being allowed to be migrated back".
>=20
> The confusion for me is that timeslice_ms does not represent the time
> pages are required to stay in the CPU memory map, but rather the time
> they must remain in the GPU memory map. We defer migrate_to_smem
> until=20
> this timeslice has expired.

Yeah, although drm_pagemap is not aware of any gpu memory map so it
would be incorrect to bring that up in the api docs. Could add some
discussion, though, that "this could be used to..." and give the
typical gpu use-case?

Thanks,
Thomas

