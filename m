Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B20ADDC7E
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 21:37:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A91BC10E110;
	Tue, 17 Jun 2025 19:37:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dujnD3/s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EAFD10E110;
 Tue, 17 Jun 2025 19:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750189055; x=1781725055;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=zdx0r8kYKzjls7Lcb3MIIAgVJm/j0BwST+fk8XBnvq0=;
 b=dujnD3/sbE3PEJi6sI+C2kxJeNRXx++JUu0nSAlFCBb0PlJ+xqkkDRaj
 frgxqyZLCuEIGUFjAjlBYm8+E60epoxCBCD5hKWrnoYw1hQWNiDCPhbhM
 xxhUU2ot5cKNCy/geyixOtvoSAyIzy8yJoRySZJixi7+Cnwzltj4neann
 dkvaBJENB/B4VB8xxz6TCchOUEL3Mp5IqA/N69b/vduu9bJa/u/giJn5L
 NwjsFRNAVZoYdiMO/PSbMvEQMSWF7x0dgC0JkzOhMrf9hn5QvMAjMzkuq
 CzhDm/vtqJwam3oZnkEsEkIeqbFJ5/r9c+LV6O8Fy9f38gHo0mllOLhgv Q==;
X-CSE-ConnectionGUID: oWGTfmJmRbahgtTUJDfWeA==
X-CSE-MsgGUID: ecoM3bpCS2SiR98ZVdfLZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="69835865"
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; d="scan'208";a="69835865"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 12:37:34 -0700
X-CSE-ConnectionGUID: dwQ0VBD7Ss+iAaKBMTEFIA==
X-CSE-MsgGUID: Owkl9dVBR+aab/M3AyAxfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; d="scan'208";a="148787219"
Received: from zzombora-mobl1 (HELO [10.245.245.188]) ([10.245.245.188])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 12:37:31 -0700
Message-ID: <e1abbee8dc401e7790049d151e6a2ef3c7b045d9.camel@linux.intel.com>
Subject: Re: [PATCH v3 1/3] drm/gpusvm, drm/pagemap: Move migration
 functionality to drm_pagemap
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 apopple@nvidia.com, airlied@gmail.com, Simona Vetter
 <simona.vetter@ffwll.ch>,  Felix =?ISO-8859-1?Q?K=FChling?=	
 <felix.kuehling@amd.com>, Philip Yang <philip.yang@amd.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>, dakr@kernel.org,
 "Mrozek, Michal"	 <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Date: Tue, 17 Jun 2025 21:37:28 +0200
In-Reply-To: <aFGgD3BpT4yLwhGg@lstrano-desk.jf.intel.com>
References: <20250613140219.87479-1-thomas.hellstrom@linux.intel.com>
 <20250613140219.87479-2-thomas.hellstrom@linux.intel.com>
 <93e663cf-01e7-4241-89ea-3bdda3d19437@intel.com>
 <f08ed0c71c8f193bbf09888e14d0171802415dcf.camel@linux.intel.com>
 <e4d37eb0-ec91-47c5-b888-0b5bbb74db84@intel.com>
 <5da4b6f81517a6c091411a92e1c9d3fd5b902dba.camel@linux.intel.com>
 <aFGgD3BpT4yLwhGg@lstrano-desk.jf.intel.com>
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

On Tue, 2025-06-17 at 10:04 -0700, Matthew Brost wrote:
> On Tue, Jun 17, 2025 at 04:55:26PM +0200, Thomas Hellstr=C3=B6m wrote:
> > On Tue, 2025-06-17 at 20:17 +0530, Ghimiray, Himal Prasad wrote:
> > >=20
> > >=20
> > > On 17-06-2025 18:41, Thomas Hellstr=C3=B6m wrote:
> > > > On Tue, 2025-06-17 at 18:25 +0530, Ghimiray, Himal Prasad
> > > > wrote:
> > > > >=20
> > > > >=20
> > > > > On 13-06-2025 19:32, Thomas Hellstr=C3=B6m wrote:
> > > > > > From: Matthew Brost <matthew.brost@intel.com>
> > > > > >=20
> > > > > > The migration functionality and track-keeping of per-
> > > > > > pagemap
> > > > > > VRAM
> > > > > > mapped to the CPU mm is not per GPU_vm, but rather per
> > > > > > pagemap.
> > > > > > This is also reflected by the functions not needing the
> > > > > > drm_gpusvm
> > > > > > structures. So move to drm_pagemap.
> > > > > >=20
> > > > > > With this, drm_gpusvm shouldn't really access the page
> > > > > > zone-
> > > > > > device-
> > > > > > data
> > > > > > since its meaning is internal to drm_pagemap. Currently
> > > > > > it's
> > > > > > used
> > > > > > to
> > > > > > reject mapping ranges backed by multiple drm_pagemap
> > > > > > allocations.
> > > > > > For now, make the zone-device-data a void pointer.
> > > > > >=20
> > > > > > Alter the interface of drm_gpusvm_migrate_to_devmem() to
> > > > > > ensure
> > > > > > we
> > > > > > don't
> > > > > > pass a gpusvm pointer.
> > > > > >=20
> > > > > > Rename CONFIG_DRM_XE_DEVMEM_MIRROR to
> > > > > > CONFIG_DRM_XE_PAGEMAP.
> > > > > >=20
> > > > > > Matt is listed as author of this commit since he wrote most
> > > > > > of
> > > > > > the
> > > > > > code,
> > > > > > and it makes sense to retain his git authorship.
> > > > > > Thomas mostly moved the code around.
> > > > >=20
> > > > > >=20
> > > > > > v3:
> > > > > > - Kerneldoc fixes (CI)
> > > > > > - Don't update documentation about how the drm_pagemap
> > > > > > =C2=A0=C2=A0=C2=A0 migration should be interpreted until upcomi=
ng
> > > > > > =C2=A0=C2=A0=C2=A0 patches where the functionality is implement=
ed.
> > > > > > =C2=A0=C2=A0=C2=A0 (Matt Brost)
> > > > > >=20
> > > > > > Co-developed-by: Thomas Hellstr=C3=B6m
> > > > > > <thomas.hellstrom@linux.intel.com>
> > > > > > Signed-off-by: Thomas Hellstr=C3=B6m
> > > > > > <thomas.hellstrom@linux.intel.com>
> > > > > > ---
> > > > > > =C2=A0=C2=A0 Documentation/gpu/rfc/gpusvm.rst=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 12 +-
> > > > > > =C2=A0=C2=A0 drivers/gpu/drm/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +-
> > > > > > =C2=A0=C2=A0 drivers/gpu/drm/drm_gpusvm.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 759 +------------
> > > > > > ----
> > > > > > -----
> > > > > > ----
> > > > > > =C2=A0=C2=A0 drivers/gpu/drm/drm_pagemap.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 788
> > > > > > +++++++++++++++++++++++++++
> > > > > > =C2=A0=C2=A0 drivers/gpu/drm/xe/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 10 +-
> > > > > > =C2=A0=C2=A0 drivers/gpu/drm/xe/xe_bo_types.h=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 2 +-
> > > > > > =C2=A0=C2=A0 drivers/gpu/drm/xe/xe_device_types.h |=C2=A0=C2=A0=
 2 +-
> > > > > > =C2=A0=C2=A0 drivers/gpu/drm/xe/xe_svm.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 47 +-
> > > > > > =C2=A0=C2=A0 include/drm/drm_gpusvm.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 96 ----
> > > > > > =C2=A0=C2=A0 include/drm/drm_pagemap.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 101 ++++
> > > > > > =C2=A0=C2=A0 10 files changed, 950 insertions(+), 873 deletions=
(-)
> > > > > > =C2=A0=C2=A0 create mode 100644 drivers/gpu/drm/drm_pagemap.c
> > > > > >=20
> > > > > > diff --git a/Documentation/gpu/rfc/gpusvm.rst
> > > > > > b/Documentation/gpu/rfc/gpusvm.rst
> > > > > > index bcf66a8137a6..469db1372f16 100644
> > > > > > --- a/Documentation/gpu/rfc/gpusvm.rst
> > > > > > +++ b/Documentation/gpu/rfc/gpusvm.rst
> > > > > > @@ -73,15 +73,21 @@ Overview of baseline design
> > > > > > =C2=A0=C2=A0 .. kernel-doc:: drivers/gpu/drm/drm_gpusvm.c
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :doc: Locking
> > > > > > =C2=A0=C2=A0=20
> > > > > > -.. kernel-doc:: drivers/gpu/drm/drm_gpusvm.c
> > > > > > -=C2=A0=C2=A0 :doc: Migration
> > > > > > -
> > > > > > =C2=A0=C2=A0 .. kernel-doc:: drivers/gpu/drm/drm_gpusvm.c
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :doc: Partial Unmapping of Range=
s
> > > > > > =C2=A0=C2=A0=20
> > > > > > =C2=A0=C2=A0 .. kernel-doc:: drivers/gpu/drm/drm_gpusvm.c
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :doc: Examples
> > > > > > =C2=A0=C2=A0=20
> > > > > > +Overview of drm_pagemap design
> > > > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > > +
> > > > > > +.. kernel-doc:: drivers/gpu/drm/drm_pagemap.c
> > > > > > +=C2=A0=C2=A0 :doc: Overview
> > > > > > +
> > > > > > +.. kernel-doc:: drivers/gpu/drm/drm_pagemap.c
> > > > > > +=C2=A0=C2=A0 :doc: Migration
> > > > > > +
> > > > > > =C2=A0=C2=A0 Possible future design features
> > > > > > =C2=A0=C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > > =C2=A0=C2=A0=20
> > > > > > diff --git a/drivers/gpu/drm/Makefile
> > > > > > b/drivers/gpu/drm/Makefile
> > > > > > index 5050ac32bba2..4dafbdc8f86a 100644
> > > > > > --- a/drivers/gpu/drm/Makefile
> > > > > > +++ b/drivers/gpu/drm/Makefile
> > > > > > @@ -104,7 +104,11 @@ obj-
> > > > > > $(CONFIG_DRM_PANEL_BACKLIGHT_QUIRKS)
> > > > > > +=3D
> > > > > > drm_panel_backlight_quirks.o
> > > > > > =C2=A0=C2=A0 #
> > > > > > =C2=A0=C2=A0 obj-$(CONFIG_DRM_EXEC) +=3D drm_exec.o
> > > > > > =C2=A0=C2=A0 obj-$(CONFIG_DRM_GPUVM) +=3D drm_gpuvm.o
> > > > > > -obj-$(CONFIG_DRM_GPUSVM) +=3D drm_gpusvm.o
> > > > > > +
> > > > > > +drm_gpusvm_helper-y :=3D \
> > > > > > +	drm_gpusvm.o\
> > > > > > +	drm_pagemap.o
> > > > > > +obj-$(CONFIG_DRM_GPUSVM) +=3D drm_gpusvm_helper.o
> > > > > > =C2=A0=C2=A0=20
> > > > > > =C2=A0=C2=A0 obj-$(CONFIG_DRM_BUDDY) +=3D drm_buddy.o
> > > > > > =C2=A0=C2=A0=20
> > > > > > diff --git a/drivers/gpu/drm/drm_gpusvm.c
> > > > > > b/drivers/gpu/drm/drm_gpusvm.c
> > > > > > index 7ff81aa0a1ca..ef81381609de 100644
> > > > > > --- a/drivers/gpu/drm/drm_gpusvm.c
> > > > > > +++ b/drivers/gpu/drm/drm_gpusvm.c
> > > > > > @@ -8,10 +8,9 @@
> > > > > > =C2=A0=C2=A0=20
> > > > > > =C2=A0=C2=A0 #include <linux/dma-mapping.h>
> > > > > > =C2=A0=C2=A0 #include <linux/hmm.h>
> > > > > > +#include <linux/hugetlb_inline.h>
> > > > > > =C2=A0=C2=A0 #include <linux/memremap.h>
> > > > > > -#include <linux/migrate.h>
> > > > > > =C2=A0=C2=A0 #include <linux/mm_types.h>
> > > > > > -#include <linux/pagemap.h>
> > > > > > =C2=A0=C2=A0 #include <linux/slab.h>
> > > > > > =C2=A0=C2=A0=20
> > > > > > =C2=A0=C2=A0 #include <drm/drm_device.h>
> > > > > > @@ -107,21 +106,6 @@
> > > > > > =C2=A0=C2=A0=C2=A0 * to add annotations to GPU SVM.
> > > > > > =C2=A0=C2=A0=C2=A0 */
> > > > > > =C2=A0=C2=A0=20
> > > > > > -/**
> > > > > > - * DOC: Migration
> > > > > > - *
> > > > > > - * The migration support is quite simple, allowing
> > > > > > migration
> > > > > > between RAM and
> > > > > > - * device memory at the range granularity. For example,
> > > > > > GPU
> > > > > > SVM
> > > > > > currently does
> > > > > > - * not support mixing RAM and device memory pages within a
> > > > > > range.
> > > > > > This means
> > > > > > - * that upon GPU fault, the entire range can be migrated
> > > > > > to
> > > > > > device
> > > > > > memory, and
> > > > > > - * upon CPU fault, the entire range is migrated to RAM.
> > > > > > Mixed
> > > > > > RAM
> > > > > > and device
> > > > > > - * memory storage within a range could be added in the
> > > > > > future
> > > > > > if
> > > > > > required.
> > > > > > - *
> > > > > > - * The reasoning for only supporting range granularity is
> > > > > > as
> > > > > > follows: it
> > > > > > - * simplifies the implementation, and range sizes are
> > > > > > driver-
> > > > > > defined and should
> > > > > > - * be relatively small.
> > > > > > - */
> > > > > > -
> > > > > > =C2=A0=C2=A0 /**
> > > > > > =C2=A0=C2=A0=C2=A0 * DOC: Partial Unmapping of Ranges
> > > > > > =C2=A0=C2=A0=C2=A0 *
> > > > > > @@ -193,10 +177,9 @@
> > > > > > =C2=A0=C2=A0=C2=A0 *		if (driver_migration_policy(range)) {
> > > > > > =C2=A0=C2=A0=C2=A0 *			mmap_read_lock(mm);
> > > > > > =C2=A0=C2=A0=C2=A0 *			devmem =3D driver_alloc_devmem();
> > > > > > - *			err =3D
> > > > > > drm_gpusvm_migrate_to_devmem(gpusvm,
> > > > > > range,
> > > > > > - *						=09
> > > > > > devmem_allocation,
> > > > > > - *							=C2=A0=C2=A0
> > > > > > &ctx);
> > > > > > - *			mmap_read_unlock(mm);
> > > > > > + *			err =3D
> > > > > > drm_pagemap_migrate_to_devmem(devmem, gpusvm->mm,
> > > > > > gpuva_start,
> > > > > > + *
> > > > > > gpuva_end, driver_pgmap_owner());
> > > > >=20
> > > > >=20
> > > > >=20
> > > > > fix doc passing timeslice as parameter.
> > > >=20
> > > > Will fix.
> > > >=20
> > > > >=20
> > > >=20
> > > > 8<-------------------------------------------------------------
> > > > ----
> > > > ----
> > > > > > +/**
> > > > > > + * drm_pagemap_migrate_to_devmem() - Migrate a struct
> > > > > > mm_struct
> > > > > > range to device memory
> > > > > > + * @devmem_allocation: The device memory allocation to
> > > > > > migrate
> > > > > > to.
> > > > > > + * The caller should hold a reference to the device memory
> > > > > > allocation,
> > > > > > + * and the reference is consumed by this function unless
> > > > > > it
> > > > > > returns with
> > > > > > + * an error.
> > > > > > + * @mm: Pointer to the struct mm_struct.
> > > > > > + * @start: Start of the virtual address range to migrate.
> > > > > > + * @end: End of the virtual address range to migrate.
> > > > > > + * @timeslice_ms: The time requested for the migrated
> > > > > > pages to
> > > > > > + * be present in the cpu memory map before migrated back.
>=20
> As Himal suggests and see below...
>=20
> s/cpu/gpu
>=20
> > > > >=20
> > > > > Shouldn't this be present in gpu or cpu memory map ? We are
> > > > > using
> > > > > this
> > > > > to ensure pagefault can be handled effectively by ensuring
> > > > > pages
> > > > > remain
> > > > > in vram here for prescribed time too.
> > > >=20
> > > > So with this split, drm_pagemap is responsible for migrating
> > > > memory
> > > > and
> > > > updating the CPU memory map only, whereas drm_gpusvm is
> > > > responsible
> > > > for
> > > > setting up the GPU memory maps. So if it remains in the CPU
> > > > memory
> > > > map,
> > > > then nothing will force the gpu vms to invalidate, unless the
> > > > gpu
> > > > driver decides to invalidate itself.
> > >=20
> > > Thats true.
> > >=20
> > > >=20
> > > > But looking at this i should probably rephrase "before migrated
> > > > back"
> > > > to "before being allowed to be migrated back".
> > >=20
> > > The confusion for me is that timeslice_ms does not represent the
> > > time
> > > pages are required to stay in the CPU memory map, but rather the
> > > time
> > > they must remain in the GPU memory map. We defer migrate_to_smem
> > > until=20
> > > this timeslice has expired.
>=20
> Ideally, we'd want the timeslice to ensure CPU residency as well. The
> issue arises because the timeslice is attached to the physical memory
> (drm_gpusvm_devmem), which is not readily available on the GPU fault
> handling side. UMD testing showed that ensuring CPU residency is not
> required for atomics to work, so this part of the implementation was
> left out. We can revisit and find a solution here if it turns out to
> be
> required.
>=20
> For now, I'd fix the kernel doc above (s/cpu/gpu) with my suggestion
> and
> perhaps put in a comment why we don't wait on the GPU fault side.

>=20
> Matt

Hi, Matt, Please see my second response to Himal.

It might be that there is a confusion between "pages present in the cpu
memory map" and "memory present in system memory"?

What I mean with "present in the cpu memory map" is that the pagemap
pages (device private memory) is present in the struct mm_struct for at
least xx ms. The struct mm is the authoritative information of which
pages currently hold the data.

So "migrated pages are present in the cpu memory map" is therefore more
or less equivalent to "data is present in device private memory".

So maybe I should rephrase this as
"The time requested for the pagemap pages to be present in @mm"? And
add a discussion like in Himal's reply on the typical use-case?

the pagemap itself has no control of how and if the gpu vms choose to
expose this. It can only guarantee that the authoritative location of
data is the device private memory for timeslice_ms.

/Thomas



>=20
> >=20
> > Yeah, although drm_pagemap is not aware of any gpu memory map so it
> > would be incorrect to bring that up in the api docs. Could add some
> > discussion, though, that "this could be used to..." and give the
> > typical gpu use-case?
> >=20
> > Thanks,
> > Thomas
> >=20

