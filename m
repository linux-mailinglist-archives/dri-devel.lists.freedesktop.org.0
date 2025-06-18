Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C89FBADF15F
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 17:26:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2031B10E8B1;
	Wed, 18 Jun 2025 15:26:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GvjShcqF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC61310E8B1;
 Wed, 18 Jun 2025 15:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750260416; x=1781796416;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=0ExvmLPm+DRwhqNPnBfAB17rQPyBEWUAnYZmKiB2F0U=;
 b=GvjShcqFvgq5uxl+s0A2sb38lKA02QQ+Cw7WnTHzKoR4w6YXjgXaNhWB
 YBDO+0+xqPaJpioSJcolhwGB188ek5e2hdbVFONl+/TvC65kMXFoNL5gb
 kfxlnCgONgT7UeiO4T6j+YXwPpDi7HiRMq+OEHZvXJIvg1o6OBVHwLT+8
 WsRETN/JrG6lsOVEuPgh3pAo/matMAzZxWZ+AG3iALje50XIrMpPzmgp/
 Fm6/66X8wMBq0+xqwW+xCWP9kJIEbIEoSVCs/Q4hiBHbxPXLaxFnzAe70
 xBPc/2+LanSwI08Ri/lMnAjSMoCdCloJWgkBdggsUqo2F3o5Y85Ai0cpc w==;
X-CSE-ConnectionGUID: 6rFQCHzuRUydKxLh/bMb6Q==
X-CSE-MsgGUID: Z9f++QblQFWTT7CFGG79NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="63835771"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="63835771"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 08:26:55 -0700
X-CSE-ConnectionGUID: 3+F8SlqCQpWaf9mRYRQ1/w==
X-CSE-MsgGUID: 1cua30j/Sci+MJMCVnCA2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="149515693"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.244.50])
 ([10.245.244.50])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 08:26:51 -0700
Message-ID: <4abc82eebd1cdcea72d7cdae3dd9dd1241125437.camel@linux.intel.com>
Subject: Re: [PATCH v4 1/3] drm/gpusvm, drm/pagemap: Move migration
 functionality to drm_pagemap
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 apopple@nvidia.com, airlied@gmail.com, Simona Vetter
 <simona.vetter@ffwll.ch>,  Felix =?ISO-8859-1?Q?K=FChling?=	
 <felix.kuehling@amd.com>, Philip Yang <philip.yang@amd.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>, dakr@kernel.org,
 "Mrozek, Michal"	 <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Date: Wed, 18 Jun 2025 17:26:48 +0200
In-Reply-To: <aFLaujtwFe1igOo1@lstrano-desk.jf.intel.com>
References: <20250618092633.8616-1-thomas.hellstrom@linux.intel.com>
 <20250618092633.8616-2-thomas.hellstrom@linux.intel.com>
 <53531659-eaf2-4843-ae2a-a36473e10b78@intel.com>
 <aFLaujtwFe1igOo1@lstrano-desk.jf.intel.com>
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

Hi, Matt,

On Wed, 2025-06-18 at 08:26 -0700, Matthew Brost wrote:
> On Wed, Jun 18, 2025 at 04:21:22PM +0530, Ghimiray, Himal Prasad
> wrote:
> >=20
> >=20
> > On 18-06-2025 14:56, Thomas Hellstr=C3=B6m wrote:
> > > From: Matthew Brost <matthew.brost@intel.com>
> > >=20
> > > The migration functionality and track-keeping of per-pagemap VRAM
> > > mapped to the CPU mm is not per GPU_vm, but rather per pagemap.
> > > This is also reflected by the functions not needing the
> > > drm_gpusvm
> > > structures. So move to drm_pagemap.
> > >=20
> > > With this, drm_gpusvm shouldn't really access the page zone-
> > > device-data
> > > since its meaning is internal to drm_pagemap. Currently it's used
> > > to
> > > reject mapping ranges backed by multiple drm_pagemap allocations.
> > > For now, make the zone-device-data a void pointer.
> > >=20
> > > Alter the interface of drm_gpusvm_migrate_to_devmem() to ensure
> > > we don't
> > > pass a gpusvm pointer.
> > >=20
> > > Rename CONFIG_DRM_XE_DEVMEM_MIRROR to CONFIG_DRM_XE_PAGEMAP.
> > >=20
> > > Matt is listed as author of this commit since he wrote most of
> > > the code,
> > > and it makes sense to retain his git authorship.
> > > Thomas mostly moved the code around.
> > >=20
> > > v3:
> > > - Kerneldoc fixes (CI)
> > > - Don't update documentation about how the drm_pagemap
> > > =C2=A0=C2=A0 migration should be interpreted until upcoming
> > > =C2=A0=C2=A0 patches where the functionality is implemented.
> > > =C2=A0=C2=A0 (Matt Brost)
> > > v4:
> > > - More kerneldoc fixes around timeslice_ms
> > > =C2=A0=C2=A0 (Himal Ghimiray, Matt Brost)
> > >=20
> > > Co-developed-by: Thomas Hellstr=C3=B6m
> > > <thomas.hellstrom@linux.intel.com>
> > > Signed-off-by: Thomas Hellstr=C3=B6m
> > > <thomas.hellstrom@linux.intel.com>
>=20
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Since you're listed as author of the patch, can I add your SOB?

Thanks,
Thomas

>=20
> > > ---
> > > =C2=A0 Documentation/gpu/rfc/gpusvm.rst=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 12 +-
> > > =C2=A0 drivers/gpu/drm/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +-
> > > =C2=A0 drivers/gpu/drm/drm_gpusvm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 760 +-------------------
> > > -----
> > > =C2=A0 drivers/gpu/drm/drm_pagemap.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 794
> > > +++++++++++++++++++++++++++
> > > =C2=A0 drivers/gpu/drm/xe/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 10 +-
> > > =C2=A0 drivers/gpu/drm/xe/xe_bo_types.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 2 +-
> > > =C2=A0 drivers/gpu/drm/xe/xe_device_types.h |=C2=A0=C2=A0 2 +-
> > > =C2=A0 drivers/gpu/drm/xe/xe_svm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 47 +-
> > > =C2=A0 include/drm/drm_gpusvm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 96 ----
> > > =C2=A0 include/drm/drm_pagemap.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 101 ++++
> > > =C2=A0 10 files changed, 957 insertions(+), 873 deletions(-)
> > > =C2=A0 create mode 100644 drivers/gpu/drm/drm_pagemap.c
> > >=20
> > > diff --git a/Documentation/gpu/rfc/gpusvm.rst
> > > b/Documentation/gpu/rfc/gpusvm.rst
> > > index bcf66a8137a6..469db1372f16 100644
> > > --- a/Documentation/gpu/rfc/gpusvm.rst
> > > +++ b/Documentation/gpu/rfc/gpusvm.rst
> > > @@ -73,15 +73,21 @@ Overview of baseline design
> > > =C2=A0 .. kernel-doc:: drivers/gpu/drm/drm_gpusvm.c
> > > =C2=A0=C2=A0=C2=A0=C2=A0 :doc: Locking
> > > -.. kernel-doc:: drivers/gpu/drm/drm_gpusvm.c
> > > -=C2=A0=C2=A0 :doc: Migration
> > > -
> > > =C2=A0 .. kernel-doc:: drivers/gpu/drm/drm_gpusvm.c
> > > =C2=A0=C2=A0=C2=A0=C2=A0 :doc: Partial Unmapping of Ranges
> > > =C2=A0 .. kernel-doc:: drivers/gpu/drm/drm_gpusvm.c
> > > =C2=A0=C2=A0=C2=A0=C2=A0 :doc: Examples
> > > +Overview of drm_pagemap design
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +.. kernel-doc:: drivers/gpu/drm/drm_pagemap.c
> > > +=C2=A0=C2=A0 :doc: Overview
> > > +
> > > +.. kernel-doc:: drivers/gpu/drm/drm_pagemap.c
> > > +=C2=A0=C2=A0 :doc: Migration
> > > +
> > > =C2=A0 Possible future design features
> > > =C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> > > index 5050ac32bba2..4dafbdc8f86a 100644
> > > --- a/drivers/gpu/drm/Makefile
> > > +++ b/drivers/gpu/drm/Makefile
> > > @@ -104,7 +104,11 @@ obj-$(CONFIG_DRM_PANEL_BACKLIGHT_QUIRKS) +=3D
> > > drm_panel_backlight_quirks.o
> > > =C2=A0 #
> > > =C2=A0 obj-$(CONFIG_DRM_EXEC) +=3D drm_exec.o
> > > =C2=A0 obj-$(CONFIG_DRM_GPUVM) +=3D drm_gpuvm.o
> > > -obj-$(CONFIG_DRM_GPUSVM) +=3D drm_gpusvm.o
> > > +
> > > +drm_gpusvm_helper-y :=3D \
> > > +	drm_gpusvm.o\
> > > +	drm_pagemap.o
> > > +obj-$(CONFIG_DRM_GPUSVM) +=3D drm_gpusvm_helper.o
> > > =C2=A0 obj-$(CONFIG_DRM_BUDDY) +=3D drm_buddy.o
> > > diff --git a/drivers/gpu/drm/drm_gpusvm.c
> > > b/drivers/gpu/drm/drm_gpusvm.c
> > > index 7ff81aa0a1ca..6e2c155a6969 100644
> > > --- a/drivers/gpu/drm/drm_gpusvm.c
> > > +++ b/drivers/gpu/drm/drm_gpusvm.c
> > > @@ -8,10 +8,9 @@
> > > =C2=A0 #include <linux/dma-mapping.h>
> > > =C2=A0 #include <linux/hmm.h>
> > > +#include <linux/hugetlb_inline.h>
> > > =C2=A0 #include <linux/memremap.h>
> > > -#include <linux/migrate.h>
> > > =C2=A0 #include <linux/mm_types.h>
> > > -#include <linux/pagemap.h>
> > > =C2=A0 #include <linux/slab.h>
> > > =C2=A0 #include <drm/drm_device.h>
> > > @@ -107,21 +106,6 @@
> > > =C2=A0=C2=A0 * to add annotations to GPU SVM.
> > > =C2=A0=C2=A0 */
> > > -/**
> > > - * DOC: Migration
> > > - *
> > > - * The migration support is quite simple, allowing migration
> > > between RAM and
> > > - * device memory at the range granularity. For example, GPU SVM
> > > currently does
> > > - * not support mixing RAM and device memory pages within a
> > > range. This means
> > > - * that upon GPU fault, the entire range can be migrated to
> > > device memory, and
> > > - * upon CPU fault, the entire range is migrated to RAM. Mixed
> > > RAM and device
> > > - * memory storage within a range could be added in the future if
> > > required.
> > > - *
> > > - * The reasoning for only supporting range granularity is as
> > > follows: it
> > > - * simplifies the implementation, and range sizes are driver-
> > > defined and should
> > > - * be relatively small.
> > > - */
> > > -
> > > =C2=A0 /**
> > > =C2=A0=C2=A0 * DOC: Partial Unmapping of Ranges
> > > =C2=A0=C2=A0 *
> > > @@ -193,10 +177,10 @@
> > > =C2=A0=C2=A0 *		if (driver_migration_policy(range)) {
> > > =C2=A0=C2=A0 *			mmap_read_lock(mm);
> > > =C2=A0=C2=A0 *			devmem =3D driver_alloc_devmem();
> > > - *			err =3D
> > > drm_gpusvm_migrate_to_devmem(gpusvm, range,
> > > - *							=C2=A0=C2=A0
> > > devmem_allocation,
> > > - *							=C2=A0=C2=A0
> > > &ctx);
> > > - *			mmap_read_unlock(mm);
> > > + *			err =3D
> > > drm_pagemap_migrate_to_devmem(devmem, gpusvm->mm, gpuva_start,
> > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > gpuva_end, ctx->timeslice_ms,
> > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > driver_pgmap_owner());
> > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mmap_read_unlo=
ck(mm);
> > > =C2=A0=C2=A0 *			if (err)	// CPU mappings may have
> > > changed
> > > =C2=A0=C2=A0 *				goto retry;
> > > =C2=A0=C2=A0 *		}
> > > @@ -288,97 +272,6 @@ npages_in_range(unsigned long start,
> > > unsigned long end)
> > > =C2=A0=C2=A0	return (end - start) >> PAGE_SHIFT;
> > > =C2=A0 }
> > > -/**
> > > - * struct drm_gpusvm_zdd - GPU SVM zone device data
> > > - *
> > > - * @refcount: Reference count for the zdd
> > > - * @devmem_allocation: device memory allocation
> > > - * @device_private_page_owner: Device private pages owner
> > > - *
> > > - * This structure serves as a generic wrapper installed in
> > > - * page->zone_device_data. It provides infrastructure for
> > > looking up a device
> > > - * memory allocation upon CPU page fault and asynchronously
> > > releasing device
> > > - * memory once the CPU has no page references. Asynchronous
> > > release is useful
> > > - * because CPU page references can be dropped in IRQ contexts,
> > > while releasing
> > > - * device memory likely requires sleeping locks.
> > > - */
> > > -struct drm_gpusvm_zdd {
> > > -	struct kref refcount;
> > > -	struct drm_gpusvm_devmem *devmem_allocation;
> > > -	void *device_private_page_owner;
> > > -};
> > > -
> > > -/**
> > > - * drm_gpusvm_zdd_alloc() - Allocate a zdd structure.
> > > - * @device_private_page_owner: Device private pages owner
> > > - *
> > > - * This function allocates and initializes a new zdd structure.
> > > It sets up the
> > > - * reference count and initializes the destroy work.
> > > - *
> > > - * Return: Pointer to the allocated zdd on success, ERR_PTR() on
> > > failure.
> > > - */
> > > -static struct drm_gpusvm_zdd *
> > > -drm_gpusvm_zdd_alloc(void *device_private_page_owner)
> > > -{
> > > -	struct drm_gpusvm_zdd *zdd;
> > > -
> > > -	zdd =3D kmalloc(sizeof(*zdd), GFP_KERNEL);
> > > -	if (!zdd)
> > > -		return NULL;
> > > -
> > > -	kref_init(&zdd->refcount);
> > > -	zdd->devmem_allocation =3D NULL;
> > > -	zdd->device_private_page_owner =3D
> > > device_private_page_owner;
> > > -
> > > -	return zdd;
> > > -}
> > > -
> > > -/**
> > > - * drm_gpusvm_zdd_get() - Get a reference to a zdd structure.
> > > - * @zdd: Pointer to the zdd structure.
> > > - *
> > > - * This function increments the reference count of the provided
> > > zdd structure.
> > > - *
> > > - * Return: Pointer to the zdd structure.
> > > - */
> > > -static struct drm_gpusvm_zdd *drm_gpusvm_zdd_get(struct
> > > drm_gpusvm_zdd *zdd)
> > > -{
> > > -	kref_get(&zdd->refcount);
> > > -	return zdd;
> > > -}
> > > -
> > > -/**
> > > - * drm_gpusvm_zdd_destroy() - Destroy a zdd structure.
> > > - * @ref: Pointer to the reference count structure.
> > > - *
> > > - * This function queues the destroy_work of the zdd for
> > > asynchronous destruction.
> > > - */
> > > -static void drm_gpusvm_zdd_destroy(struct kref *ref)
> > > -{
> > > -	struct drm_gpusvm_zdd *zdd =3D
> > > -		container_of(ref, struct drm_gpusvm_zdd,
> > > refcount);
> > > -	struct drm_gpusvm_devmem *devmem =3D zdd-
> > > >devmem_allocation;
> > > -
> > > -	if (devmem) {
> > > -		complete_all(&devmem->detached);
> > > -		if (devmem->ops->devmem_release)
> > > -			devmem->ops->devmem_release(devmem);
> > > -	}
> > > -	kfree(zdd);
> > > -}
> > > -
> > > -/**
> > > - * drm_gpusvm_zdd_put() - Put a zdd reference.
> > > - * @zdd: Pointer to the zdd structure.
> > > - *
> > > - * This function decrements the reference count of the provided
> > > zdd structure
> > > - * and schedules its destruction if the count drops to zero.
> > > - */
> > > -static void drm_gpusvm_zdd_put(struct drm_gpusvm_zdd *zdd)
> > > -{
> > > -	kref_put(&zdd->refcount, drm_gpusvm_zdd_destroy);
> > > -}
> > > -
> > > =C2=A0 /**
> > > =C2=A0=C2=A0 * drm_gpusvm_range_find() - Find GPU SVM range from GPU =
SVM
> > > notifier
> > > =C2=A0=C2=A0 * @notifier: Pointer to the GPU SVM notifier structure.
> > > @@ -945,7 +838,7 @@ drm_gpusvm_range_chunk_size(struct drm_gpusvm
> > > *gpusvm,
> > > =C2=A0=C2=A0		 * process-many-malloc' fails. In the failure
> > > case, each process
> > > =C2=A0=C2=A0		 * mallocs 16k but the CPU VMA is ~128k which
> > > results in 64k SVM
> > > =C2=A0=C2=A0		 * ranges. When migrating the SVM ranges, some
> > > processes fail in
> > > -		 * drm_gpusvm_migrate_to_devmem with
> > > 'migrate.cpages !=3D npages'
> > > +		 * drm_pagemap_migrate_to_devmem with
> > > 'migrate.cpages !=3D npages'
> > > =C2=A0=C2=A0		 * and then upon drm_gpusvm_range_get_pages
> > > device pages from
> > > =C2=A0=C2=A0		 * other processes are collected + faulted in
> > > which creates all
> > > =C2=A0=C2=A0		 * sorts of problems. Unsure exactly how this
> > > happening, also
> > > @@ -1363,7 +1256,7 @@ int drm_gpusvm_range_get_pages(struct
> > > drm_gpusvm *gpusvm,
> > > =C2=A0=C2=A0		.dev_private_owner =3D gpusvm-
> > > >device_private_page_owner,
> > > =C2=A0=C2=A0	};
> > > =C2=A0=C2=A0	struct mm_struct *mm =3D gpusvm->mm;
> > > -	struct drm_gpusvm_zdd *zdd;
> > > +	void *zdd;
> > > =C2=A0=C2=A0	unsigned long timeout =3D
> > > =C2=A0=C2=A0		jiffies +
> > > msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
> > > =C2=A0=C2=A0	unsigned long i, j;
> > > @@ -1465,7 +1358,7 @@ int drm_gpusvm_range_get_pages(struct
> > > drm_gpusvm *gpusvm,
> > > =C2=A0=C2=A0				}
> > > =C2=A0=C2=A0				pagemap =3D page_pgmap(page);
> > > -				dpagemap =3D zdd-
> > > >devmem_allocation->dpagemap;
> > > +				dpagemap =3D
> > > drm_pagemap_page_to_dpagemap(page);
> > > =C2=A0=C2=A0				if (drm_WARN_ON(gpusvm->drm,
> > > !dpagemap)) {
> > > =C2=A0=C2=A0					/*
> > > =C2=A0=C2=A0					 * Raced. This is not
> > > supposed to happen
> > > @@ -1489,7 +1382,7 @@ int drm_gpusvm_range_get_pages(struct
> > > drm_gpusvm *gpusvm,
> > > =C2=A0=C2=A0		} else {
> > > =C2=A0=C2=A0			dma_addr_t addr;
> > > -			if (is_zone_device_page(page) || zdd) {
> > > +			if (is_zone_device_page(page) ||
> > > pagemap) {
> > > =C2=A0=C2=A0				err =3D -EOPNOTSUPP;
> > > =C2=A0=C2=A0				goto err_unmap;
> > > =C2=A0=C2=A0			}
> > > @@ -1517,7 +1410,7 @@ int drm_gpusvm_range_get_pages(struct
> > > drm_gpusvm *gpusvm,
> > > =C2=A0=C2=A0		flags.has_dma_mapping =3D true;
> > > =C2=A0=C2=A0	}
> > > -	if (zdd) {
> > > +	if (pagemap) {
> > > =C2=A0=C2=A0		flags.has_devmem_pages =3D true;
> > > =C2=A0=C2=A0		range->dpagemap =3D dpagemap;
> > > =C2=A0=C2=A0	}
> > > @@ -1545,6 +1438,7 @@
> > > EXPORT_SYMBOL_GPL(drm_gpusvm_range_get_pages);
> > > =C2=A0 /**
> > > =C2=A0=C2=A0 * drm_gpusvm_range_unmap_pages() - Unmap pages associate=
d with
> > > a GPU SVM range
> > > + * drm_gpusvm_range_evict() - Evict GPU SVM range
> > > =C2=A0=C2=A0 * @gpusvm: Pointer to the GPU SVM structure
> > > =C2=A0=C2=A0 * @range: Pointer to the GPU SVM range structure
> > > =C2=A0=C2=A0 * @ctx: GPU SVM context
> > > @@ -1575,562 +1469,11 @@ void drm_gpusvm_range_unmap_pages(struct
> > > drm_gpusvm *gpusvm,
> > > =C2=A0 EXPORT_SYMBOL_GPL(drm_gpusvm_range_unmap_pages);
> > > =C2=A0 /**
> > > - * drm_gpusvm_migration_unlock_put_page() - Put a migration page
> > > - * @page: Pointer to the page to put
> > > - *
> > > - * This function unlocks and puts a page.
> > > - */
> > > -static void drm_gpusvm_migration_unlock_put_page(struct page
> > > *page)
> > > -{
> > > -	unlock_page(page);
> > > -	put_page(page);
> > > -}
> > > -
> > > -/**
> > > - * drm_gpusvm_migration_unlock_put_pages() - Put migration pages
> > > - * @npages: Number of pages
> > > - * @migrate_pfn: Array of migrate page frame numbers
> > > - *
> > > - * This function unlocks and puts an array of pages.
> > > - */
> > > -static void drm_gpusvm_migration_unlock_put_pages(unsigned long
> > > npages,
> > > -						=C2=A0 unsigned long
> > > *migrate_pfn)
> > > -{
> > > -	unsigned long i;
> > > -
> > > -	for (i =3D 0; i < npages; ++i) {
> > > -		struct page *page;
> > > -
> > > -		if (!migrate_pfn[i])
> > > -			continue;
> > > -
> > > -		page =3D migrate_pfn_to_page(migrate_pfn[i]);
> > > -		drm_gpusvm_migration_unlock_put_page(page);
> > > -		migrate_pfn[i] =3D 0;
> > > -	}
> > > -}
> > > -
> > > -/**
> > > - * drm_gpusvm_get_devmem_page() - Get a reference to a device
> > > memory page
> > > - * @page: Pointer to the page
> > > - * @zdd: Pointer to the GPU SVM zone device data
> > > - *
> > > - * This function associates the given page with the specified
> > > GPU SVM zone
> > > - * device data and initializes it for zone device usage.
> > > - */
> > > -static void drm_gpusvm_get_devmem_page(struct page *page,
> > > -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_gpusvm_zdd
> > > *zdd)
> > > -{
> > > -	page->zone_device_data =3D drm_gpusvm_zdd_get(zdd);
> > > -	zone_device_page_init(page);
> > > -}
> > > -
> > > -/**
> > > - * drm_gpusvm_migrate_map_pages() - Map migration pages for GPU
> > > SVM migration
> > > - * @dev: The device for which the pages are being mapped
> > > - * @dma_addr: Array to store DMA addresses corresponding to
> > > mapped pages
> > > - * @migrate_pfn: Array of migrate page frame numbers to map
> > > - * @npages: Number of pages to map
> > > - * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> > > - *
> > > - * This function maps pages of memory for migration usage in GPU
> > > SVM. It
> > > - * iterates over each page frame number provided in
> > > @migrate_pfn, maps the
> > > - * corresponding page, and stores the DMA address in the
> > > provided @dma_addr
> > > - * array.
> > > - *
> > > - * Return: 0 on success, -EFAULT if an error occurs during
> > > mapping.
> > > - */
> > > -static int drm_gpusvm_migrate_map_pages(struct device *dev,
> > > -					dma_addr_t *dma_addr,
> > > -					unsigned long
> > > *migrate_pfn,
> > > -					unsigned long npages,
> > > -					enum dma_data_direction
> > > dir)
> > > -{
> > > -	unsigned long i;
> > > -
> > > -	for (i =3D 0; i < npages; ++i) {
> > > -		struct page *page =3D
> > > migrate_pfn_to_page(migrate_pfn[i]);
> > > -
> > > -		if (!page)
> > > -			continue;
> > > -
> > > -		if (WARN_ON_ONCE(is_zone_device_page(page)))
> > > -			return -EFAULT;
> > > -
> > > -		dma_addr[i] =3D dma_map_page(dev, page, 0,
> > > PAGE_SIZE, dir);
> > > -		if (dma_mapping_error(dev, dma_addr[i]))
> > > -			return -EFAULT;
> > > -	}
> > > -
> > > -	return 0;
> > > -}
> > > -
> > > -/**
> > > - * drm_gpusvm_migrate_unmap_pages() - Unmap pages previously
> > > mapped for GPU SVM migration
> > > - * @dev: The device for which the pages were mapped
> > > - * @dma_addr: Array of DMA addresses corresponding to mapped
> > > pages
> > > - * @npages: Number of pages to unmap
> > > - * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> > > - *
> > > - * This function unmaps previously mapped pages of memory for
> > > GPU Shared Virtual
> > > - * Memory (SVM). It iterates over each DMA address provided in
> > > @dma_addr, checks
> > > - * if it's valid and not already unmapped, and unmaps the
> > > corresponding page.
> > > - */
> > > -static void drm_gpusvm_migrate_unmap_pages(struct device *dev,
> > > -					=C2=A0=C2=A0 dma_addr_t *dma_addr,
> > > -					=C2=A0=C2=A0 unsigned long npages,
> > > -					=C2=A0=C2=A0 enum
> > > dma_data_direction dir)
> > > -{
> > > -	unsigned long i;
> > > -
> > > -	for (i =3D 0; i < npages; ++i) {
> > > -		if (!dma_addr[i] || dma_mapping_error(dev,
> > > dma_addr[i]))
> > > -			continue;
> > > -
> > > -		dma_unmap_page(dev, dma_addr[i], PAGE_SIZE,
> > > dir);
> > > -	}
> > > -}
> > > -
> > > -/**
> > > - * drm_gpusvm_migrate_to_devmem() - Migrate GPU SVM range to
> > > device memory
> > > + * drm_gpusvm_range_evict() - Evict GPU SVM range
> > > =C2=A0=C2=A0 * @gpusvm: Pointer to the GPU SVM structure
> > > - * @range: Pointer to the GPU SVM range structure
> > > - * @devmem_allocation: Pointer to the device memory allocation.
> > > The caller
> > > - *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 should hold a refere=
nce to the device
> > > memory allocation,
> > > - *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 which should be drop=
ped via ops-
> > > >devmem_release or upon
> > > - *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the failure of this =
function.
> > > - * @ctx: GPU SVM context
> > > - *
> > > - * This function migrates the specified GPU SVM range to device
> > > memory. It
> > > - * performs the necessary setup and invokes the driver-specific
> > > operations for
> > > - * migration to device memory. Upon successful return,
> > > @devmem_allocation can
> > > - * safely reference @range until ops->devmem_release is called
> > > which only upon
> > > - * successful return. Expected to be called while holding the
> > > mmap lock in read
> > > - * mode.
> > > - *
> > > - * Return: 0 on success, negative error code on failure.
> > > - */
> > > -int drm_gpusvm_migrate_to_devmem(struct drm_gpusvm *gpusvm,
> > > -				 struct drm_gpusvm_range *range,
> > > -				 struct drm_gpusvm_devmem
> > > *devmem_allocation,
> > > -				 const struct drm_gpusvm_ctx
> > > *ctx)
> > > -{
> > > -	const struct drm_gpusvm_devmem_ops *ops =3D
> > > devmem_allocation->ops;
> > > -	unsigned long start =3D drm_gpusvm_range_start(range),
> > > -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 end =3D drm_gpusvm_range_end(range)=
;
> > > -	struct migrate_vma migrate =3D {
> > > -		.start		=3D start,
> > > -		.end		=3D end,
> > > -		.pgmap_owner	=3D gpusvm-
> > > >device_private_page_owner,
> > > -		.flags		=3D MIGRATE_VMA_SELECT_SYSTEM,
> > > -	};
> > > -	struct mm_struct *mm =3D gpusvm->mm;
> > > -	unsigned long i, npages =3D npages_in_range(start, end);
> > > -	struct vm_area_struct *vas;
> > > -	struct drm_gpusvm_zdd *zdd =3D NULL;
> > > -	struct page **pages;
> > > -	dma_addr_t *dma_addr;
> > > -	void *buf;
> > > -	int err;
> > > -
> > > -	mmap_assert_locked(gpusvm->mm);
> > > -
> > > -	if (!range->flags.migrate_devmem)
> > > -		return -EINVAL;
> > > -
> > > -	if (!ops->populate_devmem_pfn || !ops->copy_to_devmem ||
> > > -	=C2=A0=C2=A0=C2=A0 !ops->copy_to_ram)
> > > -		return -EOPNOTSUPP;
> > > -
> > > -	vas =3D vma_lookup(mm, start);
> > > -	if (!vas) {
> > > -		err =3D -ENOENT;
> > > -		goto err_out;
> > > -	}
> > > -
> > > -	if (end > vas->vm_end || start < vas->vm_start) {
> > > -		err =3D -EINVAL;
> > > -		goto err_out;
> > > -	}
> > > -
> > > -	if (!vma_is_anonymous(vas)) {
> > > -		err =3D -EBUSY;
> > > -		goto err_out;
> > > -	}
> > > -
> > > -	buf =3D kvcalloc(npages, 2 * sizeof(*migrate.src) +
> > > sizeof(*dma_addr) +
> > > -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(*pages), GFP_KERNEL);
> > > -	if (!buf) {
> > > -		err =3D -ENOMEM;
> > > -		goto err_out;
> > > -	}
> > > -	dma_addr =3D buf + (2 * sizeof(*migrate.src) * npages);
> > > -	pages =3D buf + (2 * sizeof(*migrate.src) +
> > > sizeof(*dma_addr)) * npages;
> > > -
> > > -	zdd =3D drm_gpusvm_zdd_alloc(gpusvm-
> > > >device_private_page_owner);
> > > -	if (!zdd) {
> > > -		err =3D -ENOMEM;
> > > -		goto err_free;
> > > -	}
> > > -
> > > -	migrate.vma =3D vas;
> > > -	migrate.src =3D buf;
> > > -	migrate.dst =3D migrate.src + npages;
> > > -
> > > -	err =3D migrate_vma_setup(&migrate);
> > > -	if (err)
> > > -		goto err_free;
> > > -
> > > -	if (!migrate.cpages) {
> > > -		err =3D -EFAULT;
> > > -		goto err_free;
> > > -	}
> > > -
> > > -	if (migrate.cpages !=3D npages) {
> > > -		err =3D -EBUSY;
> > > -		goto err_finalize;
> > > -	}
> > > -
> > > -	err =3D ops->populate_devmem_pfn(devmem_allocation,
> > > npages, migrate.dst);
> > > -	if (err)
> > > -		goto err_finalize;
> > > -
> > > -	err =3D drm_gpusvm_migrate_map_pages(devmem_allocation-
> > > >dev, dma_addr,
> > > -					=C2=A0=C2=A0 migrate.src, npages,
> > > DMA_TO_DEVICE);
> > > -	if (err)
> > > -		goto err_finalize;
> > > -
> > > -	for (i =3D 0; i < npages; ++i) {
> > > -		struct page *page =3D pfn_to_page(migrate.dst[i]);
> > > -
> > > -		pages[i] =3D page;
> > > -		migrate.dst[i] =3D migrate_pfn(migrate.dst[i]);
> > > -		drm_gpusvm_get_devmem_page(page, zdd);
> > > -	}
> > > -
> > > -	err =3D ops->copy_to_devmem(pages, dma_addr, npages);
> > > -	if (err)
> > > -		goto err_finalize;
> > > -
> > > -	/* Upon success bind devmem allocation to range and zdd
> > > */
> > > -	devmem_allocation->timeslice_expiration =3D
> > > get_jiffies_64() +
> > > -		msecs_to_jiffies(ctx->timeslice_ms);
> > > -	zdd->devmem_allocation =3D devmem_allocation;	/* Owns
> > > ref */
> > > -
> > > -err_finalize:
> > > -	if (err)
> > > -		drm_gpusvm_migration_unlock_put_pages(npages,
> > > migrate.dst);
> > > -	migrate_vma_pages(&migrate);
> > > -	migrate_vma_finalize(&migrate);
> > > -	drm_gpusvm_migrate_unmap_pages(devmem_allocation->dev,
> > > dma_addr, npages,
> > > -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DMA_TO_DEVICE);
> > > -err_free:
> > > -	if (zdd)
> > > -		drm_gpusvm_zdd_put(zdd);
> > > -	kvfree(buf);
> > > -err_out:
> > > -	return err;
> > > -}
> > > -EXPORT_SYMBOL_GPL(drm_gpusvm_migrate_to_devmem);
> > > -
> > > -/**
> > > - * drm_gpusvm_migrate_populate_ram_pfn() - Populate RAM PFNs for
> > > a VM area
> > > - * @vas: Pointer to the VM area structure, can be NULL
> > > - * @fault_page: Fault page
> > > - * @npages: Number of pages to populate
> > > - * @mpages: Number of pages to migrate
> > > - * @src_mpfn: Source array of migrate PFNs
> > > - * @mpfn: Array of migrate PFNs to populate
> > > - * @addr: Start address for PFN allocation
> > > - *
> > > - * This function populates the RAM migrate page frame numbers
> > > (PFNs) for the
> > > - * specified VM area structure. It allocates and locks pages in
> > > the VM area for
> > > - * RAM usage. If vas is non-NULL use alloc_page_vma for
> > > allocation, if NULL use
> > > - * alloc_page for allocation.
> > > - *
> > > - * Return: 0 on success, negative error code on failure.
> > > - */
> > > -static int drm_gpusvm_migrate_populate_ram_pfn(struct
> > > vm_area_struct *vas,
> > > -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct page
> > > *fault_page,
> > > -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long
> > > npages,
> > > -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long
> > > *mpages,
> > > -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long
> > > *src_mpfn,
> > > -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long
> > > *mpfn,
> > > -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long
> > > addr)
> > > -{
> > > -	unsigned long i;
> > > -
> > > -	for (i =3D 0; i < npages; ++i, addr +=3D PAGE_SIZE) {
> > > -		struct page *page, *src_page;
> > > -
> > > -		if (!(src_mpfn[i] & MIGRATE_PFN_MIGRATE))
> > > -			continue;
> > > -
> > > -		src_page =3D migrate_pfn_to_page(src_mpfn[i]);
> > > -		if (!src_page)
> > > -			continue;
> > > -
> > > -		if (fault_page) {
> > > -			if (src_page->zone_device_data !=3D
> > > -			=C2=A0=C2=A0=C2=A0 fault_page->zone_device_data)
> > > -				continue;
> > > -		}
> > > -
> > > -		if (vas)
> > > -			page =3D alloc_page_vma(GFP_HIGHUSER, vas,
> > > addr);
> > > -		else
> > > -			page =3D alloc_page(GFP_HIGHUSER);
> > > -
> > > -		if (!page)
> > > -			goto free_pages;
> > > -
> > > -		mpfn[i] =3D migrate_pfn(page_to_pfn(page));
> > > -	}
> > > -
> > > -	for (i =3D 0; i < npages; ++i) {
> > > -		struct page *page =3D
> > > migrate_pfn_to_page(mpfn[i]);
> > > -
> > > -		if (!page)
> > > -			continue;
> > > -
> > > -		WARN_ON_ONCE(!trylock_page(page));
> > > -		++*mpages;
> > > -	}
> > > -
> > > -	return 0;
> > > -
> > > -free_pages:
> > > -	for (i =3D 0; i < npages; ++i) {
> > > -		struct page *page =3D
> > > migrate_pfn_to_page(mpfn[i]);
> > > -
> > > -		if (!page)
> > > -			continue;
> > > -
> > > -		put_page(page);
> > > -		mpfn[i] =3D 0;
> > > -	}
> > > -	return -ENOMEM;
> > > -}
> > > -
> > > -/**
> > > - * drm_gpusvm_evict_to_ram() - Evict GPU SVM range to RAM
> > > - * @devmem_allocation: Pointer to the device memory allocation
> > > - *
> > > - * Similar to __drm_gpusvm_migrate_to_ram but does not require
> > > mmap lock and
> > > - * migration done via migrate_device_* functions.
> > > - *
> > > - * Return: 0 on success, negative error code on failure.
> > > - */
> > > -int drm_gpusvm_evict_to_ram(struct drm_gpusvm_devmem
> > > *devmem_allocation)
> > > -{
> > > -	const struct drm_gpusvm_devmem_ops *ops =3D
> > > devmem_allocation->ops;
> > > -	unsigned long npages, mpages =3D 0;
> > > -	struct page **pages;
> > > -	unsigned long *src, *dst;
> > > -	dma_addr_t *dma_addr;
> > > -	void *buf;
> > > -	int i, err =3D 0;
> > > -	unsigned int retry_count =3D 2;
> > > -
> > > -	npages =3D devmem_allocation->size >> PAGE_SHIFT;
> > > -
> > > -retry:
> > > -	if (!mmget_not_zero(devmem_allocation->mm))
> > > -		return -EFAULT;
> > > -
> > > -	buf =3D kvcalloc(npages, 2 * sizeof(*src) +
> > > sizeof(*dma_addr) +
> > > -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(*pages), GFP_KERNEL);
> > > -	if (!buf) {
> > > -		err =3D -ENOMEM;
> > > -		goto err_out;
> > > -	}
> > > -	src =3D buf;
> > > -	dst =3D buf + (sizeof(*src) * npages);
> > > -	dma_addr =3D buf + (2 * sizeof(*src) * npages);
> > > -	pages =3D buf + (2 * sizeof(*src) + sizeof(*dma_addr)) *
> > > npages;
> > > -
> > > -	err =3D ops->populate_devmem_pfn(devmem_allocation,
> > > npages, src);
> > > -	if (err)
> > > -		goto err_free;
> > > -
> > > -	err =3D migrate_device_pfns(src, npages);
> > > -	if (err)
> > > -		goto err_free;
> > > -
> > > -	err =3D drm_gpusvm_migrate_populate_ram_pfn(NULL, NULL,
> > > npages, &mpages,
> > > -						=C2=A0 src, dst, 0);
> > > -	if (err || !mpages)
> > > -		goto err_finalize;
> > > -
> > > -	err =3D drm_gpusvm_migrate_map_pages(devmem_allocation-
> > > >dev, dma_addr,
> > > -					=C2=A0=C2=A0 dst, npages,
> > > DMA_FROM_DEVICE);
> > > -	if (err)
> > > -		goto err_finalize;
> > > -
> > > -	for (i =3D 0; i < npages; ++i)
> > > -		pages[i] =3D migrate_pfn_to_page(src[i]);
> > > -
> > > -	err =3D ops->copy_to_ram(pages, dma_addr, npages);
> > > -	if (err)
> > > -		goto err_finalize;
> > > -
> > > -err_finalize:
> > > -	if (err)
> > > -		drm_gpusvm_migration_unlock_put_pages(npages,
> > > dst);
> > > -	migrate_device_pages(src, dst, npages);
> > > -	migrate_device_finalize(src, dst, npages);
> > > -	drm_gpusvm_migrate_unmap_pages(devmem_allocation->dev,
> > > dma_addr, npages,
> > > -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DMA_FROM_DEVICE);
> > > -err_free:
> > > -	kvfree(buf);
> > > -err_out:
> > > -	mmput_async(devmem_allocation->mm);
> > > -
> > > -	if (completion_done(&devmem_allocation->detached))
> > > -		return 0;
> > > -
> > > -	if (retry_count--) {
> > > -		cond_resched();
> > > -		goto retry;
> > > -	}
> > > -
> > > -	return err ?: -EBUSY;
> > > -}
> > > -EXPORT_SYMBOL_GPL(drm_gpusvm_evict_to_ram);
> > > -
> > > -/**
> > > - * __drm_gpusvm_migrate_to_ram() - Migrate GPU SVM range to RAM
> > > (internal)
> > > - * @vas: Pointer to the VM area structure
> > > - * @device_private_page_owner: Device private pages owner
> > > - * @page: Pointer to the page for fault handling (can be NULL)
> > > - * @fault_addr: Fault address
> > > - * @size: Size of migration
> > > - *
> > > - * This internal function performs the migration of the
> > > specified GPU SVM range
> > > - * to RAM. It sets up the migration, populates + dma maps RAM
> > > PFNs, and
> > > - * invokes the driver-specific operations for migration to RAM.
> > > - *
> > > - * Return: 0 on success, negative error code on failure.
> > > - */
> > > -static int __drm_gpusvm_migrate_to_ram(struct vm_area_struct
> > > *vas,
> > > -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void
> > > *device_private_page_owner,
> > > -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct page *page,
> > > -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long fault_addr,
> > > -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long size)
> > > -{
> > > -	struct migrate_vma migrate =3D {
> > > -		.vma		=3D vas,
> > > -		.pgmap_owner	=3D device_private_page_owner,
> > > -		.flags		=3D
> > > MIGRATE_VMA_SELECT_DEVICE_PRIVATE |
> > > -			MIGRATE_VMA_SELECT_DEVICE_COHERENT,
> > > -		.fault_page	=3D page,
> > > -	};
> > > -	struct drm_gpusvm_zdd *zdd;
> > > -	const struct drm_gpusvm_devmem_ops *ops;
> > > -	struct device *dev =3D NULL;
> > > -	unsigned long npages, mpages =3D 0;
> > > -	struct page **pages;
> > > -	dma_addr_t *dma_addr;
> > > -	unsigned long start, end;
> > > -	void *buf;
> > > -	int i, err =3D 0;
> > > -
> > > -	if (page) {
> > > -		zdd =3D page->zone_device_data;
> > > -		if (time_before64(get_jiffies_64(),
> > > -				=C2=A0 zdd->devmem_allocation-
> > > >timeslice_expiration))
> > > -			return 0;
> > > -	}
> > > -
> > > -	start =3D ALIGN_DOWN(fault_addr, size);
> > > -	end =3D ALIGN(fault_addr + 1, size);
> > > -
> > > -	/* Corner where VMA area struct has been partially
> > > unmapped */
> > > -	if (start < vas->vm_start)
> > > -		start =3D vas->vm_start;
> > > -	if (end > vas->vm_end)
> > > -		end =3D vas->vm_end;
> > > -
> > > -	migrate.start =3D start;
> > > -	migrate.end =3D end;
> > > -	npages =3D npages_in_range(start, end);
> > > -
> > > -	buf =3D kvcalloc(npages, 2 * sizeof(*migrate.src) +
> > > sizeof(*dma_addr) +
> > > -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(*pages), GFP_KERNEL);
> > > -	if (!buf) {
> > > -		err =3D -ENOMEM;
> > > -		goto err_out;
> > > -	}
> > > -	dma_addr =3D buf + (2 * sizeof(*migrate.src) * npages);
> > > -	pages =3D buf + (2 * sizeof(*migrate.src) +
> > > sizeof(*dma_addr)) * npages;
> > > -
> > > -	migrate.vma =3D vas;
> > > -	migrate.src =3D buf;
> > > -	migrate.dst =3D migrate.src + npages;
> > > -
> > > -	err =3D migrate_vma_setup(&migrate);
> > > -	if (err)
> > > -		goto err_free;
> > > -
> > > -	/* Raced with another CPU fault, nothing to do */
> > > -	if (!migrate.cpages)
> > > -		goto err_free;
> > > -
> > > -	if (!page) {
> > > -		for (i =3D 0; i < npages; ++i) {
> > > -			if (!(migrate.src[i] &
> > > MIGRATE_PFN_MIGRATE))
> > > -				continue;
> > > -
> > > -			page =3D
> > > migrate_pfn_to_page(migrate.src[i]);
> > > -			break;
> > > -		}
> > > -
> > > -		if (!page)
> > > -			goto err_finalize;
> > > -	}
> > > -	zdd =3D page->zone_device_data;
> > > -	ops =3D zdd->devmem_allocation->ops;
> > > -	dev =3D zdd->devmem_allocation->dev;
> > > -
> > > -	err =3D drm_gpusvm_migrate_populate_ram_pfn(vas, page,
> > > npages, &mpages,
> > > -						=C2=A0 migrate.src,
> > > migrate.dst,
> > > -						=C2=A0 start);
> > > -	if (err)
> > > -		goto err_finalize;
> > > -
> > > -	err =3D drm_gpusvm_migrate_map_pages(dev, dma_addr,
> > > migrate.dst, npages,
> > > -					=C2=A0=C2=A0 DMA_FROM_DEVICE);
> > > -	if (err)
> > > -		goto err_finalize;
> > > -
> > > -	for (i =3D 0; i < npages; ++i)
> > > -		pages[i] =3D migrate_pfn_to_page(migrate.src[i]);
> > > -
> > > -	err =3D ops->copy_to_ram(pages, dma_addr, npages);
> > > -	if (err)
> > > -		goto err_finalize;
> > > -
> > > -err_finalize:
> > > -	if (err)
> > > -		drm_gpusvm_migration_unlock_put_pages(npages,
> > > migrate.dst);
> > > -	migrate_vma_pages(&migrate);
> > > -	migrate_vma_finalize(&migrate);
> > > -	if (dev)
> > > -		drm_gpusvm_migrate_unmap_pages(dev, dma_addr,
> > > npages,
> > > -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DMA_FROM_DEVICE);
> > > -err_free:
> > > -	kvfree(buf);
> > > -err_out:
> > > -
> > > -	return err;
> > > -}
> > > -
> > > -/**
> > > - * drm_gpusvm_range_evict - Evict GPU SVM range
> > > =C2=A0=C2=A0 * @range: Pointer to the GPU SVM range to be removed
> > > =C2=A0=C2=A0 *
> > > - * This function evicts the specified GPU SVM range. This
> > > function will not
> > > - * evict coherent pages.
> > > + * This function evicts the specified GPU SVM range.
> > > =C2=A0=C2=A0 *
> > > =C2=A0=C2=A0 * Return: 0 on success, a negative error code on failure=
.
> > > =C2=A0=C2=A0 */
> > > @@ -2182,60 +1525,6 @@ int drm_gpusvm_range_evict(struct
> > > drm_gpusvm *gpusvm,
> > > =C2=A0 }
> > > =C2=A0 EXPORT_SYMBOL_GPL(drm_gpusvm_range_evict);
> > > -/**
> > > - * drm_gpusvm_page_free() - Put GPU SVM zone device data
> > > associated with a page
> > > - * @page: Pointer to the page
> > > - *
> > > - * This function is a callback used to put the GPU SVM zone
> > > device data
> > > - * associated with a page when it is being released.
> > > - */
> > > -static void drm_gpusvm_page_free(struct page *page)
> > > -{
> > > -	drm_gpusvm_zdd_put(page->zone_device_data);
> > > -}
> > > -
> > > -/**
> > > - * drm_gpusvm_migrate_to_ram() - Migrate GPU SVM range to RAM
> > > (page fault handler)
> > > - * @vmf: Pointer to the fault information structure
> > > - *
> > > - * This function is a page fault handler used to migrate a GPU
> > > SVM range to RAM.
> > > - * It retrieves the GPU SVM range information from the faulting
> > > page and invokes
> > > - * the internal migration function to migrate the range back to
> > > RAM.
> > > - *
> > > - * Return: VM_FAULT_SIGBUS on failure, 0 on success.
> > > - */
> > > -static vm_fault_t drm_gpusvm_migrate_to_ram(struct vm_fault
> > > *vmf)
> > > -{
> > > -	struct drm_gpusvm_zdd *zdd =3D vmf->page-
> > > >zone_device_data;
> > > -	int err;
> > > -
> > > -	err =3D __drm_gpusvm_migrate_to_ram(vmf->vma,
> > > -					=C2=A0 zdd-
> > > >device_private_page_owner,
> > > -					=C2=A0 vmf->page, vmf-
> > > >address,
> > > -					=C2=A0 zdd-
> > > >devmem_allocation->size);
> > > -
> > > -	return err ? VM_FAULT_SIGBUS : 0;
> > > -}
> > > -
> > > -/*
> > > - * drm_gpusvm_pagemap_ops - Device page map operations for GPU
> > > SVM
> > > - */
> > > -static const struct dev_pagemap_ops drm_gpusvm_pagemap_ops =3D {
> > > -	.page_free =3D drm_gpusvm_page_free,
> > > -	.migrate_to_ram =3D drm_gpusvm_migrate_to_ram,
> > > -};
> > > -
> > > -/**
> > > - * drm_gpusvm_pagemap_ops_get() - Retrieve GPU SVM device page
> > > map operations
> > > - *
> > > - * Return: Pointer to the GPU SVM device page map operations
> > > structure.
> > > - */
> > > -const struct dev_pagemap_ops *drm_gpusvm_pagemap_ops_get(void)
> > > -{
> > > -	return &drm_gpusvm_pagemap_ops;
> > > -}
> > > -EXPORT_SYMBOL_GPL(drm_gpusvm_pagemap_ops_get);
> > > -
> > > =C2=A0 /**
> > > =C2=A0=C2=A0 * drm_gpusvm_has_mapping() - Check if GPU SVM has mappin=
g for
> > > the given address range
> > > =C2=A0=C2=A0 * @gpusvm: Pointer to the GPU SVM structure.
> > > @@ -2280,28 +1569,5 @@ void drm_gpusvm_range_set_unmapped(struct
> > > drm_gpusvm_range *range,
> > > =C2=A0 }
> > > =C2=A0 EXPORT_SYMBOL_GPL(drm_gpusvm_range_set_unmapped);
> > > -/**
> > > - * drm_gpusvm_devmem_init() - Initialize a GPU SVM device memory
> > > allocation
> > > - *
> > > - * @dev: Pointer to the device structure which device memory
> > > allocation belongs to
> > > - * @mm: Pointer to the mm_struct for the address space
> > > - * @ops: Pointer to the operations structure for GPU SVM device
> > > memory
> > > - * @dpagemap: The struct drm_pagemap we're allocating from.
> > > - * @size: Size of device memory allocation
> > > - */
> > > -void drm_gpusvm_devmem_init(struct drm_gpusvm_devmem
> > > *devmem_allocation,
> > > -			=C2=A0=C2=A0=C2=A0 struct device *dev, struct mm_struct
> > > *mm,
> > > -			=C2=A0=C2=A0=C2=A0 const struct drm_gpusvm_devmem_ops
> > > *ops,
> > > -			=C2=A0=C2=A0=C2=A0 struct drm_pagemap *dpagemap, size_t
> > > size)
> > > -{
> > > -	init_completion(&devmem_allocation->detached);
> > > -	devmem_allocation->dev =3D dev;
> > > -	devmem_allocation->mm =3D mm;
> > > -	devmem_allocation->ops =3D ops;
> > > -	devmem_allocation->dpagemap =3D dpagemap;
> > > -	devmem_allocation->size =3D size;
> > > -}
> > > -EXPORT_SYMBOL_GPL(drm_gpusvm_devmem_init);
> > > -
> > > =C2=A0 MODULE_DESCRIPTION("DRM GPUSVM");
> > > =C2=A0 MODULE_LICENSE("GPL");
> > > diff --git a/drivers/gpu/drm/drm_pagemap.c
> > > b/drivers/gpu/drm/drm_pagemap.c
> > > new file mode 100644
> > > index 000000000000..cef4657b6e8a
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/drm_pagemap.c
> > > @@ -0,0 +1,794 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> > > +/*
> > > + * Copyright =C2=A9 2024-2025 Intel Corporation
> > > + */
> > > +
> > > +#include <linux/dma-mapping.h>
> > > +#include <linux/migrate.h>
> > > +#include <linux/pagemap.h>
> > > +#include <drm/drm_pagemap.h>
> > > +
> > > +/**
> > > + * DOC: Overview
> > > + *
> > > + * The DRM pagemap layer is intended to augment the dev_pagemap
> > > functionality by
> > > + * providing a way to populate a struct mm_struct virtual range
> > > with device
> > > + * private pages and to provide helpers to abstract device
> > > memory allocations,
> > > + * to migrate memory back and forth between device memory and
> > > system RAM and
> > > + * to handle access (and in the future migration) between
> > > devices implementing
> > > + * a fast interconnect that is not necessarily visible to the
> > > rest of the
> > > + * system.
> > > + *
> > > + * Typically the DRM pagemap receives requests from one or more
> > > DRM GPU SVM
> > > + * instances to populate struct mm_struct virtual ranges with
> > > memory.
> > > + */
> > > +
> > > +/**
> > > + * DOC: Migration
> > > + *
> > > + * The migration support is quite simple, allowing migration
> > > between RAM and
> > > + * device memory at the range granularity. For example, GPU SVM
> > > currently does
> > > + * not support mixing RAM and device memory pages within a
> > > range. This means
> > > + * that upon GPU fault, the entire range can be migrated to
> > > device memory, and
> > > + * upon CPU fault, the entire range is migrated to RAM. Mixed
> > > RAM and device
> > > + * memory storage within a range could be added in the future if
> > > required.
> > > + *
> > > + * The reasoning for only supporting range granularity is as
> > > follows: it
> > > + * simplifies the implementation, and range sizes are driver-
> > > defined and should
> > > + * be relatively small.
> > > + *
> > > + *
> > > + * Key DRM pagemap components:
> > > + *
> > > + * - Device Memory Allocations:
> > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Embedded structure containing enoug=
h information for the
> > > drm_pagemap to
> > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 migrate to / from device memory.
> > > + *
> > > + * - Device Memory Operations:
> > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Define the interface for driver-spe=
cific device memory
> > > operations
> > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 release memory, populate pfns, and =
copy to / from device
> > > memory.
> > > + */
> > > +
> > > +/**
> > > + * struct drm_pagemap_zdd - GPU SVM zone device data
> > > + *
> > > + * @refcount: Reference count for the zdd
> > > + * @devmem_allocation: device memory allocation
> > > + * @device_private_page_owner: Device private pages owner
> > > + *
> > > + * This structure serves as a generic wrapper installed in
> > > + * page->zone_device_data. It provides infrastructure for
> > > looking up a device
> > > + * memory allocation upon CPU page fault and asynchronously
> > > releasing device
> > > + * memory once the CPU has no page references. Asynchronous
> > > release is useful
> > > + * because CPU page references can be dropped in IRQ contexts,
> > > while releasing
> > > + * device memory likely requires sleeping locks.
> > > + */
> > > +struct drm_pagemap_zdd {
> > > +	struct kref refcount;
> > > +	struct drm_pagemap_devmem *devmem_allocation;
> > > +	void *device_private_page_owner;
> > > +};
> > > +
> > > +/**
> > > + * drm_pagemap_zdd_alloc() - Allocate a zdd structure.
> > > + * @device_private_page_owner: Device private pages owner
> > > + *
> > > + * This function allocates and initializes a new zdd structure.
> > > It sets up the
> > > + * reference count and initializes the destroy work.
> > > + *
> > > + * Return: Pointer to the allocated zdd on success, ERR_PTR() on
> > > failure.
> > > + */
> > > +static struct drm_pagemap_zdd *
> > > +drm_pagemap_zdd_alloc(void *device_private_page_owner)
> > > +{
> > > +	struct drm_pagemap_zdd *zdd;
> > > +
> > > +	zdd =3D kmalloc(sizeof(*zdd), GFP_KERNEL);
> > > +	if (!zdd)
> > > +		return NULL;
> > > +
> > > +	kref_init(&zdd->refcount);
> > > +	zdd->devmem_allocation =3D NULL;
> > > +	zdd->device_private_page_owner =3D
> > > device_private_page_owner;
> > > +
> > > +	return zdd;
> > > +}
> > > +
> > > +/**
> > > + * drm_pagemap_zdd_get() - Get a reference to a zdd structure.
> > > + * @zdd: Pointer to the zdd structure.
> > > + *
> > > + * This function increments the reference count of the provided
> > > zdd structure.
> > > + *
> > > + * Return: Pointer to the zdd structure.
> > > + */
> > > +static struct drm_pagemap_zdd *drm_pagemap_zdd_get(struct
> > > drm_pagemap_zdd *zdd)
> > > +{
> > > +	kref_get(&zdd->refcount);
> > > +	return zdd;
> > > +}
> > > +
> > > +/**
> > > + * drm_pagemap_zdd_destroy() - Destroy a zdd structure.
> > > + * @ref: Pointer to the reference count structure.
> > > + *
> > > + * This function queues the destroy_work of the zdd for
> > > asynchronous destruction.
> > > + */
> > > +static void drm_pagemap_zdd_destroy(struct kref *ref)
> > > +{
> > > +	struct drm_pagemap_zdd *zdd =3D
> > > +		container_of(ref, struct drm_pagemap_zdd,
> > > refcount);
> > > +	struct drm_pagemap_devmem *devmem =3D zdd-
> > > >devmem_allocation;
> > > +
> > > +	if (devmem) {
> > > +		complete_all(&devmem->detached);
> > > +		if (devmem->ops->devmem_release)
> > > +			devmem->ops->devmem_release(devmem);
> > > +	}
> > > +	kfree(zdd);
> > > +}
> > > +
> > > +/**
> > > + * drm_pagemap_zdd_put() - Put a zdd reference.
> > > + * @zdd: Pointer to the zdd structure.
> > > + *
> > > + * This function decrements the reference count of the provided
> > > zdd structure
> > > + * and schedules its destruction if the count drops to zero.
> > > + */
> > > +static void drm_pagemap_zdd_put(struct drm_pagemap_zdd *zdd)
> > > +{
> > > +	kref_put(&zdd->refcount, drm_pagemap_zdd_destroy);
> > > +}
> > > +
> > > +/**
> > > + * drm_pagemap_migration_unlock_put_page() - Put a migration
> > > page
> > > + * @page: Pointer to the page to put
> > > + *
> > > + * This function unlocks and puts a page.
> > > + */
> > > +static void drm_pagemap_migration_unlock_put_page(struct page
> > > *page)
> > > +{
> > > +	unlock_page(page);
> > > +	put_page(page);
> > > +}
> > > +
> > > +/**
> > > + * drm_pagemap_migration_unlock_put_pages() - Put migration
> > > pages
> > > + * @npages: Number of pages
> > > + * @migrate_pfn: Array of migrate page frame numbers
> > > + *
> > > + * This function unlocks and puts an array of pages.
> > > + */
> > > +static void drm_pagemap_migration_unlock_put_pages(unsigned long
> > > npages,
> > > +						=C2=A0=C2=A0 unsigned long
> > > *migrate_pfn)
> > > +{
> > > +	unsigned long i;
> > > +
> > > +	for (i =3D 0; i < npages; ++i) {
> > > +		struct page *page;
> > > +
> > > +		if (!migrate_pfn[i])
> > > +			continue;
> > > +
> > > +		page =3D migrate_pfn_to_page(migrate_pfn[i]);
> > > +		drm_pagemap_migration_unlock_put_page(page);
> > > +		migrate_pfn[i] =3D 0;
> > > +	}
> > > +}
> > > +
> > > +/**
> > > + * drm_pagemap_get_devmem_page() - Get a reference to a device
> > > memory page
> > > + * @page: Pointer to the page
> > > + * @zdd: Pointer to the GPU SVM zone device data
> > > + *
> > > + * This function associates the given page with the specified
> > > GPU SVM zone
> > > + * device data and initializes it for zone device usage.
> > > + */
> > > +static void drm_pagemap_get_devmem_page(struct page *page,
> > > +					struct drm_pagemap_zdd
> > > *zdd)
> > > +{
> > > +	page->zone_device_data =3D drm_pagemap_zdd_get(zdd);
> > > +	zone_device_page_init(page);
> > > +}
> > > +
> > > +/**
> > > + * drm_pagemap_migrate_map_pages() - Map migration pages for GPU
> > > SVM migration
> > > + * @dev: The device for which the pages are being mapped
> > > + * @dma_addr: Array to store DMA addresses corresponding to
> > > mapped pages
> > > + * @migrate_pfn: Array of migrate page frame numbers to map
> > > + * @npages: Number of pages to map
> > > + * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> > > + *
> > > + * This function maps pages of memory for migration usage in GPU
> > > SVM. It
> > > + * iterates over each page frame number provided in
> > > @migrate_pfn, maps the
> > > + * corresponding page, and stores the DMA address in the
> > > provided @dma_addr
> > > + * array.
> > > + *
> > > + * Returns: 0 on success, -EFAULT if an error occurs during
> > > mapping.
> > > + */
> > > +static int drm_pagemap_migrate_map_pages(struct device *dev,
> > > +					 dma_addr_t *dma_addr,
> > > +					 unsigned long
> > > *migrate_pfn,
> > > +					 unsigned long npages,
> > > +					 enum dma_data_direction
> > > dir)
> > > +{
> > > +	unsigned long i;
> > > +
> > > +	for (i =3D 0; i < npages; ++i) {
> > > +		struct page *page =3D
> > > migrate_pfn_to_page(migrate_pfn[i]);
> > > +
> > > +		if (!page)
> > > +			continue;
> > > +
> > > +		if (WARN_ON_ONCE(is_zone_device_page(page)))
> > > +			return -EFAULT;
> > > +
> > > +		dma_addr[i] =3D dma_map_page(dev, page, 0,
> > > PAGE_SIZE, dir);
> > > +		if (dma_mapping_error(dev, dma_addr[i]))
> > > +			return -EFAULT;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +/**
> > > + * drm_pagemap_migrate_unmap_pages() - Unmap pages previously
> > > mapped for GPU SVM migration
> > > + * @dev: The device for which the pages were mapped
> > > + * @dma_addr: Array of DMA addresses corresponding to mapped
> > > pages
> > > + * @npages: Number of pages to unmap
> > > + * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> > > + *
> > > + * This function unmaps previously mapped pages of memory for
> > > GPU Shared Virtual
> > > + * Memory (SVM). It iterates over each DMA address provided in
> > > @dma_addr, checks
> > > + * if it's valid and not already unmapped, and unmaps the
> > > corresponding page.
> > > + */
> > > +static void drm_pagemap_migrate_unmap_pages(struct device *dev,
> > > +					=C2=A0=C2=A0=C2=A0 dma_addr_t
> > > *dma_addr,
> > > +					=C2=A0=C2=A0=C2=A0 unsigned long
> > > npages,
> > > +					=C2=A0=C2=A0=C2=A0 enum
> > > dma_data_direction dir)
> > > +{
> > > +	unsigned long i;
> > > +
> > > +	for (i =3D 0; i < npages; ++i) {
> > > +		if (!dma_addr[i] || dma_mapping_error(dev,
> > > dma_addr[i]))
> > > +			continue;
> > > +
> > > +		dma_unmap_page(dev, dma_addr[i], PAGE_SIZE,
> > > dir);
> > > +	}
> > > +}
> > > +
> > > +static unsigned long
> > > +npages_in_range(unsigned long start, unsigned long end)
> > > +{
> > > +	return (end - start) >> PAGE_SHIFT;
> > > +}
> > > +
> > > +/**
> > > + * drm_pagemap_migrate_to_devmem() - Migrate a struct mm_struct
> > > range to device memory
> > > + * @devmem_allocation: The device memory allocation to migrate
> > > to.
> > > + * The caller should hold a reference to the device memory
> > > allocation,
> > > + * and the reference is consumed by this function unless it
> > > returns with
> > > + * an error.
> > > + * @mm: Pointer to the struct mm_struct.
> > > + * @start: Start of the virtual address range to migrate.
> > > + * @end: End of the virtual address range to migrate.
> > > + * @timeslice_ms: The time requested for the migrated pagemap
> > > pages to
> > > + * be present in @mm before being allowed to be migrated back.
> > > + * @pgmap_owner: Not used currently, since only system memory is
> > > considered.
> > > + *
> > > + * This function migrates the specified virtual address range to
> > > device memory.
> > > + * It performs the necessary setup and invokes the driver-
> > > specific operations for
> > > + * migration to device memory. Expected to be called while
> > > holding the mmap lock in
> > > + * at least read mode.
> > > + *
> > > + * Note: The @timeslice_ms parameter can typically be used to
> > > force data to
> > > + * remain in pagemap pages long enough for a GPU to perform a
> > > task and to prevent
> > > + * a migration livelock. One alternative would be for the GPU
> > > driver to block
> > > + * in a mmu_notifier for the specified amount of time, but
> > > adding the
> > > + * functionality to the pagemap is likely nicer to the system as
> > > a whole.
> > > + *
> > > + * Return: %0 on success, negative error code on failure.
> > > + */
> > > +int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem
> > > *devmem_allocation,
> > > +				=C2=A0 struct mm_struct *mm,
> > > +				=C2=A0 unsigned long start, unsigned
> > > long end,
> > > +				=C2=A0 unsigned long timeslice_ms,
> > > +				=C2=A0 void *pgmap_owner)
> > > +{
> > > +	const struct drm_pagemap_devmem_ops *ops =3D
> > > devmem_allocation->ops;
> > > +	struct migrate_vma migrate =3D {
> > > +		.start		=3D start,
> > > +		.end		=3D end,
> > > +		.pgmap_owner	=3D pgmap_owner,
> > > +		.flags		=3D MIGRATE_VMA_SELECT_SYSTEM,
> > > +	};
> > > +	unsigned long i, npages =3D npages_in_range(start, end);
> > > +	struct vm_area_struct *vas;
> > > +	struct drm_pagemap_zdd *zdd =3D NULL;
> > > +	struct page **pages;
> > > +	dma_addr_t *dma_addr;
> > > +	void *buf;
> > > +	int err;
> > > +
> > > +	mmap_assert_locked(mm);
> > > +
> > > +	if (!ops->populate_devmem_pfn || !ops->copy_to_devmem ||
> > > +	=C2=A0=C2=A0=C2=A0 !ops->copy_to_ram)
> > > +		return -EOPNOTSUPP;
> > > +
> > > +	vas =3D vma_lookup(mm, start);
> > > +	if (!vas) {
> > > +		err =3D -ENOENT;
> > > +		goto err_out;
> > > +	}
> > > +
> > > +	if (end > vas->vm_end || start < vas->vm_start) {
> > > +		err =3D -EINVAL;
> > > +		goto err_out;
> > > +	}
> > > +
> > > +	if (!vma_is_anonymous(vas)) {
> > > +		err =3D -EBUSY;
> > > +		goto err_out;
> > > +	}
> > > +
> > > +	buf =3D kvcalloc(npages, 2 * sizeof(*migrate.src) +
> > > sizeof(*dma_addr) +
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(*pages), GFP_KERNEL);
> > > +	if (!buf) {
> > > +		err =3D -ENOMEM;
> > > +		goto err_out;
> > > +	}
> > > +	dma_addr =3D buf + (2 * sizeof(*migrate.src) * npages);
> > > +	pages =3D buf + (2 * sizeof(*migrate.src) +
> > > sizeof(*dma_addr)) * npages;
> > > +
> > > +	zdd =3D drm_pagemap_zdd_alloc(pgmap_owner);
> > > +	if (!zdd) {
> > > +		err =3D -ENOMEM;
> > > +		goto err_free;
> > > +	}
> > > +
> > > +	migrate.vma =3D vas;
> > > +	migrate.src =3D buf;
> > > +	migrate.dst =3D migrate.src + npages;
> > > +
> > > +	err =3D migrate_vma_setup(&migrate);
> > > +	if (err)
> > > +		goto err_free;
> > > +
> > > +	if (!migrate.cpages) {
> > > +		err =3D -EFAULT;
> > > +		goto err_free;
> > > +	}
> > > +
> > > +	if (migrate.cpages !=3D npages) {
> > > +		err =3D -EBUSY;
> > > +		goto err_finalize;
> > > +	}
> > > +
> > > +	err =3D ops->populate_devmem_pfn(devmem_allocation,
> > > npages, migrate.dst);
> > > +	if (err)
> > > +		goto err_finalize;
> > > +
> > > +	err =3D drm_pagemap_migrate_map_pages(devmem_allocation-
> > > >dev, dma_addr,
> > > +					=C2=A0=C2=A0=C2=A0 migrate.src, npages,
> > > DMA_TO_DEVICE);
> > > +	if (err)
> > > +		goto err_finalize;
> > > +
> > > +	for (i =3D 0; i < npages; ++i) {
> > > +		struct page *page =3D pfn_to_page(migrate.dst[i]);
> > > +
> > > +		pages[i] =3D page;
> > > +		migrate.dst[i] =3D migrate_pfn(migrate.dst[i]);
> > > +		drm_pagemap_get_devmem_page(page, zdd);
> > > +	}
> > > +
> > > +	err =3D ops->copy_to_devmem(pages, dma_addr, npages);
> > > +	if (err)
> > > +		goto err_finalize;
> > > +
> > > +	/* Upon success bind devmem allocation to range and zdd
> > > */
> > > +	devmem_allocation->timeslice_expiration =3D
> > > get_jiffies_64() +
> > > +		msecs_to_jiffies(timeslice_ms);
> > > +	zdd->devmem_allocation =3D devmem_allocation;	/* Owns
> > > ref */
> > > +
> > > +err_finalize:
> > > +	if (err)
> > > +		drm_pagemap_migration_unlock_put_pages(npages,
> > > migrate.dst);
> > > +	migrate_vma_pages(&migrate);
> > > +	migrate_vma_finalize(&migrate);
> > > +	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev,
> > > dma_addr, npages,
> > > +					DMA_TO_DEVICE);
> > > +err_free:
> > > +	if (zdd)
> > > +		drm_pagemap_zdd_put(zdd);
> > > +	kvfree(buf);
> > > +err_out:
> > > +	return err;
> > > +}
> > > +EXPORT_SYMBOL_GPL(drm_pagemap_migrate_to_devmem);
> > > +
> > > +/**
> > > + * drm_pagemap_migrate_populate_ram_pfn() - Populate RAM PFNs
> > > for a VM area
> > > + * @vas: Pointer to the VM area structure, can be NULL
> > > + * @fault_page: Fault page
> > > + * @npages: Number of pages to populate
> > > + * @mpages: Number of pages to migrate
> > > + * @src_mpfn: Source array of migrate PFNs
> > > + * @mpfn: Array of migrate PFNs to populate
> > > + * @addr: Start address for PFN allocation
> > > + *
> > > + * This function populates the RAM migrate page frame numbers
> > > (PFNs) for the
> > > + * specified VM area structure. It allocates and locks pages in
> > > the VM area for
> > > + * RAM usage. If vas is non-NULL use alloc_page_vma for
> > > allocation, if NULL use
> > > + * alloc_page for allocation.
> > > + *
> > > + * Return: 0 on success, negative error code on failure.
> > > + */
> > > +static int drm_pagemap_migrate_populate_ram_pfn(struct
> > > vm_area_struct *vas,
> > > +						struct page
> > > *fault_page,
> > > +						unsigned long
> > > npages,
> > > +						unsigned long
> > > *mpages,
> > > +						unsigned long
> > > *src_mpfn,
> > > +						unsigned long
> > > *mpfn,
> > > +						unsigned long
> > > addr)
> > > +{
> > > +	unsigned long i;
> > > +
> > > +	for (i =3D 0; i < npages; ++i, addr +=3D PAGE_SIZE) {
> > > +		struct page *page, *src_page;
> > > +
> > > +		if (!(src_mpfn[i] & MIGRATE_PFN_MIGRATE))
> > > +			continue;
> > > +
> > > +		src_page =3D migrate_pfn_to_page(src_mpfn[i]);
> > > +		if (!src_page)
> > > +			continue;
> > > +
> > > +		if (fault_page) {
> > > +			if (src_page->zone_device_data !=3D
> > > +			=C2=A0=C2=A0=C2=A0 fault_page->zone_device_data)
> > > +				continue;
> > > +		}
> > > +
> > > +		if (vas)
> > > +			page =3D alloc_page_vma(GFP_HIGHUSER, vas,
> > > addr);
> > > +		else
> > > +			page =3D alloc_page(GFP_HIGHUSER);
> > > +
> > > +		if (!page)
> > > +			goto free_pages;
> > > +
> > > +		mpfn[i] =3D migrate_pfn(page_to_pfn(page));
> > > +	}
> > > +
> > > +	for (i =3D 0; i < npages; ++i) {
> > > +		struct page *page =3D
> > > migrate_pfn_to_page(mpfn[i]);
> > > +
> > > +		if (!page)
> > > +			continue;
> > > +
> > > +		WARN_ON_ONCE(!trylock_page(page));
> > > +		++*mpages;
> > > +	}
> > > +
> > > +	return 0;
> > > +
> > > +free_pages:
> > > +	for (i =3D 0; i < npages; ++i) {
> > > +		struct page *page =3D
> > > migrate_pfn_to_page(mpfn[i]);
> > > +
> > > +		if (!page)
> > > +			continue;
> > > +
> > > +		put_page(page);
> > > +		mpfn[i] =3D 0;
> > > +	}
> > > +	return -ENOMEM;
> > > +}
> > > +
> > > +/**
> > > + * drm_pagemap_evict_to_ram() - Evict GPU SVM range to RAM
> > > + * @devmem_allocation: Pointer to the device memory allocation
> > > + *
> > > + * Similar to __drm_pagemap_migrate_to_ram but does not require
> > > mmap lock and
> > > + * migration done via migrate_device_* functions.
> > > + *
> > > + * Return: 0 on success, negative error code on failure.
> > > + */
> > > +int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem
> > > *devmem_allocation)
> > > +{
> > > +	const struct drm_pagemap_devmem_ops *ops =3D
> > > devmem_allocation->ops;
> > > +	unsigned long npages, mpages =3D 0;
> > > +	struct page **pages;
> > > +	unsigned long *src, *dst;
> > > +	dma_addr_t *dma_addr;
> > > +	void *buf;
> > > +	int i, err =3D 0;
> > > +	unsigned int retry_count =3D 2;
> > > +
> > > +	npages =3D devmem_allocation->size >> PAGE_SHIFT;
> > > +
> > > +retry:
> > > +	if (!mmget_not_zero(devmem_allocation->mm))
> > > +		return -EFAULT;
> > > +
> > > +	buf =3D kvcalloc(npages, 2 * sizeof(*src) +
> > > sizeof(*dma_addr) +
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(*pages), GFP_KERNEL);
> > > +	if (!buf) {
> > > +		err =3D -ENOMEM;
> > > +		goto err_out;
> > > +	}
> > > +	src =3D buf;
> > > +	dst =3D buf + (sizeof(*src) * npages);
> > > +	dma_addr =3D buf + (2 * sizeof(*src) * npages);
> > > +	pages =3D buf + (2 * sizeof(*src) + sizeof(*dma_addr)) *
> > > npages;
> > > +
> > > +	err =3D ops->populate_devmem_pfn(devmem_allocation,
> > > npages, src);
> > > +	if (err)
> > > +		goto err_free;
> > > +
> > > +	err =3D migrate_device_pfns(src, npages);
> > > +	if (err)
> > > +		goto err_free;
> > > +
> > > +	err =3D drm_pagemap_migrate_populate_ram_pfn(NULL, NULL,
> > > npages, &mpages,
> > > +						=C2=A0=C2=A0 src, dst, 0);
> > > +	if (err || !mpages)
> > > +		goto err_finalize;
> > > +
> > > +	err =3D drm_pagemap_migrate_map_pages(devmem_allocation-
> > > >dev, dma_addr,
> > > +					=C2=A0=C2=A0=C2=A0 dst, npages,
> > > DMA_FROM_DEVICE);
> > > +	if (err)
> > > +		goto err_finalize;
> > > +
> > > +	for (i =3D 0; i < npages; ++i)
> > > +		pages[i] =3D migrate_pfn_to_page(src[i]);
> > > +
> > > +	err =3D ops->copy_to_ram(pages, dma_addr, npages);
> > > +	if (err)
> > > +		goto err_finalize;
> > > +
> > > +err_finalize:
> > > +	if (err)
> > > +		drm_pagemap_migration_unlock_put_pages(npages,
> > > dst);
> > > +	migrate_device_pages(src, dst, npages);
> > > +	migrate_device_finalize(src, dst, npages);
> > > +	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev,
> > > dma_addr, npages,
> > > +					DMA_FROM_DEVICE);
> > > +err_free:
> > > +	kvfree(buf);
> > > +err_out:
> > > +	mmput_async(devmem_allocation->mm);
> > > +
> > > +	if (completion_done(&devmem_allocation->detached))
> > > +		return 0;
> > > +
> > > +	if (retry_count--) {
> > > +		cond_resched();
> > > +		goto retry;
> > > +	}
> > > +
> > > +	return err ?: -EBUSY;
> > > +}
> > > +EXPORT_SYMBOL_GPL(drm_pagemap_evict_to_ram);
> > > +
> > > +/**
> > > + * __drm_pagemap_migrate_to_ram() - Migrate GPU SVM range to RAM
> > > (internal)
> > > + * @vas: Pointer to the VM area structure
> > > + * @device_private_page_owner: Device private pages owner
> > > + * @page: Pointer to the page for fault handling (can be NULL)
> > > + * @fault_addr: Fault address
> > > + * @size: Size of migration
> > > + *
> > > + * This internal function performs the migration of the
> > > specified GPU SVM range
> > > + * to RAM. It sets up the migration, populates + dma maps RAM
> > > PFNs, and
> > > + * invokes the driver-specific operations for migration to RAM.
> > > + *
> > > + * Return: 0 on success, negative error code on failure.
> > > + */
> > > +static int __drm_pagemap_migrate_to_ram(struct vm_area_struct
> > > *vas,
> > > +					void
> > > *device_private_page_owner,
> > > +					struct page *page,
> > > +					unsigned long
> > > fault_addr,
> > > +					unsigned long size)
> > > +{
> > > +	struct migrate_vma migrate =3D {
> > > +		.vma		=3D vas,
> > > +		.pgmap_owner	=3D device_private_page_owner,
> > > +		.flags		=3D
> > > MIGRATE_VMA_SELECT_DEVICE_PRIVATE |
> > > +		MIGRATE_VMA_SELECT_DEVICE_COHERENT,
> > > +		.fault_page	=3D page,
> > > +	};
> > > +	struct drm_pagemap_zdd *zdd;
> > > +	const struct drm_pagemap_devmem_ops *ops;
> > > +	struct device *dev =3D NULL;
> > > +	unsigned long npages, mpages =3D 0;
> > > +	struct page **pages;
> > > +	dma_addr_t *dma_addr;
> > > +	unsigned long start, end;
> > > +	void *buf;
> > > +	int i, err =3D 0;
> > > +
> > > +	if (page) {
> > > +		zdd =3D page->zone_device_data;
> > > +		if (time_before64(get_jiffies_64(),
> > > +				=C2=A0 zdd->devmem_allocation-
> > > >timeslice_expiration))
> > > +			return 0;
> > > +	}
> > > +
> > > +	start =3D ALIGN_DOWN(fault_addr, size);
> > > +	end =3D ALIGN(fault_addr + 1, size);
> > > +
> > > +	/* Corner where VMA area struct has been partially
> > > unmapped */
> > > +	if (start < vas->vm_start)
> > > +		start =3D vas->vm_start;
> > > +	if (end > vas->vm_end)
> > > +		end =3D vas->vm_end;
> > > +
> > > +	migrate.start =3D start;
> > > +	migrate.end =3D end;
> > > +	npages =3D npages_in_range(start, end);
> > > +
> > > +	buf =3D kvcalloc(npages, 2 * sizeof(*migrate.src) +
> > > sizeof(*dma_addr) +
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(*pages), GFP_KERNEL);
> > > +	if (!buf) {
> > > +		err =3D -ENOMEM;
> > > +		goto err_out;
> > > +	}
> > > +	dma_addr =3D buf + (2 * sizeof(*migrate.src) * npages);
> > > +	pages =3D buf + (2 * sizeof(*migrate.src) +
> > > sizeof(*dma_addr)) * npages;
> > > +
> > > +	migrate.vma =3D vas;
> > > +	migrate.src =3D buf;
> > > +	migrate.dst =3D migrate.src + npages;
> > > +
> > > +	err =3D migrate_vma_setup(&migrate);
> > > +	if (err)
> > > +		goto err_free;
> > > +
> > > +	/* Raced with another CPU fault, nothing to do */
> > > +	if (!migrate.cpages)
> > > +		goto err_free;
> > > +
> > > +	if (!page) {
> > > +		for (i =3D 0; i < npages; ++i) {
> > > +			if (!(migrate.src[i] &
> > > MIGRATE_PFN_MIGRATE))
> > > +				continue;
> > > +
> > > +			page =3D
> > > migrate_pfn_to_page(migrate.src[i]);
> > > +			break;
> > > +		}
> > > +
> > > +		if (!page)
> > > +			goto err_finalize;
> > > +	}
> > > +	zdd =3D page->zone_device_data;
> > > +	ops =3D zdd->devmem_allocation->ops;
> > > +	dev =3D zdd->devmem_allocation->dev;
> > > +
> > > +	err =3D drm_pagemap_migrate_populate_ram_pfn(vas, page,
> > > npages, &mpages,
> > > +						=C2=A0=C2=A0 migrate.src,
> > > migrate.dst,
> > > +						=C2=A0=C2=A0 start);
> > > +	if (err)
> > > +		goto err_finalize;
> > > +
> > > +	err =3D drm_pagemap_migrate_map_pages(dev, dma_addr,
> > > migrate.dst, npages,
> > > +					=C2=A0=C2=A0=C2=A0 DMA_FROM_DEVICE);
> > > +	if (err)
> > > +		goto err_finalize;
> > > +
> > > +	for (i =3D 0; i < npages; ++i)
> > > +		pages[i] =3D migrate_pfn_to_page(migrate.src[i]);
> > > +
> > > +	err =3D ops->copy_to_ram(pages, dma_addr, npages);
> > > +	if (err)
> > > +		goto err_finalize;
> > > +
> > > +err_finalize:
> > > +	if (err)
> > > +		drm_pagemap_migration_unlock_put_pages(npages,
> > > migrate.dst);
> > > +	migrate_vma_pages(&migrate);
> > > +	migrate_vma_finalize(&migrate);
> > > +	if (dev)
> > > +		drm_pagemap_migrate_unmap_pages(dev, dma_addr,
> > > npages,
> > > +						DMA_FROM_DEVICE)
> > > ;
> > > +err_free:
> > > +	kvfree(buf);
> > > +err_out:
> > > +
> > > +	return err;
> > > +}
> > > +
> > > +/**
> > > + * drm_pagemap_page_free() - Put GPU SVM zone device data
> > > associated with a page
> > > + * @page: Pointer to the page
> > > + *
> > > + * This function is a callback used to put the GPU SVM zone
> > > device data
> > > + * associated with a page when it is being released.
> > > + */
> > > +static void drm_pagemap_page_free(struct page *page)
> > > +{
> > > +	drm_pagemap_zdd_put(page->zone_device_data);
> > > +}
> > > +
> > > +/**
> > > + * drm_pagemap_migrate_to_ram() - Migrate a virtual range to RAM
> > > (page fault handler)
> > > + * @vmf: Pointer to the fault information structure
> > > + *
> > > + * This function is a page fault handler used to migrate a
> > > virtual range
> > > + * to ram. The device memory allocation in which the device page
> > > is found is
> > > + * migrated in its entirety.
> > > + *
> > > + * Returns:
> > > + * VM_FAULT_SIGBUS on failure, 0 on success.
> > > + */
> > > +static vm_fault_t drm_pagemap_migrate_to_ram(struct vm_fault
> > > *vmf)
> > > +{
> > > +	struct drm_pagemap_zdd *zdd =3D vmf->page-
> > > >zone_device_data;
> > > +	int err;
> > > +
> > > +	err =3D __drm_pagemap_migrate_to_ram(vmf->vma,
> > > +					=C2=A0=C2=A0 zdd-
> > > >device_private_page_owner,
> > > +					=C2=A0=C2=A0 vmf->page, vmf-
> > > >address,
> > > +					=C2=A0=C2=A0 zdd-
> > > >devmem_allocation->size);
> > > +
> > > +	return err ? VM_FAULT_SIGBUS : 0;
> > > +}
> > > +
> > > +static const struct dev_pagemap_ops drm_pagemap_pagemap_ops =3D {
> > > +	.page_free =3D drm_pagemap_page_free,
> > > +	.migrate_to_ram =3D drm_pagemap_migrate_to_ram,
> > > +};
> > > +
> > > +/**
> > > + * drm_pagemap_pagemap_ops_get() - Retrieve GPU SVM device page
> > > map operations
> > > + *
> > > + * Returns:
> > > + * Pointer to the GPU SVM device page map operations structure.
> > > + */
> > > +const struct dev_pagemap_ops *drm_pagemap_pagemap_ops_get(void)
> > > +{
> > > +	return &drm_pagemap_pagemap_ops;
> > > +}
> > > +EXPORT_SYMBOL_GPL(drm_pagemap_pagemap_ops_get);
> > > +
> > > +/**
> > > + * drm_pagemap_devmem_init() - Initialize a drm_pagemap device
> > > memory allocation
> > > + *
> > > + * @devmem_allocation: The struct drm_pagemap_devmem to
> > > initialize.
> > > + * @dev: Pointer to the device structure which device memory
> > > allocation belongs to
> > > + * @mm: Pointer to the mm_struct for the address space
> > > + * @ops: Pointer to the operations structure for GPU SVM device
> > > memory
> > > + * @dpagemap: The struct drm_pagemap we're allocating from.
> > > + * @size: Size of device memory allocation
> > > + */
> > > +void drm_pagemap_devmem_init(struct drm_pagemap_devmem
> > > *devmem_allocation,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0 struct device *dev, struct
> > > mm_struct *mm,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0 const struct drm_pagemap_devmem_ops
> > > *ops,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_pagemap *dpagemap,
> > > size_t size)
> > > +{
> > > +	init_completion(&devmem_allocation->detached);
> > > +	devmem_allocation->dev =3D dev;
> > > +	devmem_allocation->mm =3D mm;
> > > +	devmem_allocation->ops =3D ops;
> > > +	devmem_allocation->dpagemap =3D dpagemap;
> > > +	devmem_allocation->size =3D size;
> > > +}
> > > +EXPORT_SYMBOL_GPL(drm_pagemap_devmem_init);
> > > +
> > > +/**
> > > + * drm_pagemap_page_to_dpagemap() - Return a pointer the
> > > drm_pagemap of a page
> > > + * @page: The struct page.
> > > + *
> > > + * Return: A pointer to the struct drm_pagemap of a device
> > > private page that
> > > + * was populated from the struct drm_pagemap. If the page was
> > > *not* populated
> > > + * from a struct drm_pagemap, the result is undefined and the
> > > function call
> > > + * may result in dereferencing and invalid address.
> > > + */
> > > +struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page
> > > *page)
> > > +{
> > > +	struct drm_pagemap_zdd *zdd =3D page->zone_device_data;
> > > +
> > > +	return zdd->devmem_allocation->dpagemap;
> > > +}
> > > +EXPORT_SYMBOL_GPL(drm_pagemap_page_to_dpagemap);
> > > diff --git a/drivers/gpu/drm/xe/Kconfig
> > > b/drivers/gpu/drm/xe/Kconfig
> > > index c57f1da0791d..b5eab4d29211 100644
> > > --- a/drivers/gpu/drm/xe/Kconfig
> > > +++ b/drivers/gpu/drm/xe/Kconfig
> > > @@ -86,14 +86,16 @@ config DRM_XE_GPUSVM
> > > =C2=A0=C2=A0	=C2=A0 If in doubut say "Y".
> > > -config DRM_XE_DEVMEM_MIRROR
> > > -	bool "Enable device memory mirror"
> > > +config DRM_XE_PAGEMAP
> > > +	bool "Enable device memory pool for SVM"
> > > =C2=A0=C2=A0	depends on DRM_XE_GPUSVM
> > > =C2=A0=C2=A0	select GET_FREE_REGION
> > > =C2=A0=C2=A0	default y
> > > =C2=A0=C2=A0	help
> > > -	=C2=A0 Disable this option only if you want to compile out
> > > without device
> > > -	=C2=A0 memory mirror. Will reduce KMD memory footprint when
> > > disabled.
> > > +	=C2=A0 Disable this option only if you don't want to expose
> > > local device
> > > +	=C2=A0 memory for SVM. Will reduce KMD memory footprint when
> > > disabled.
> > > +
> > > +	=C2=A0 If in doubut say "Y".
> > > =C2=A0 config DRM_XE_FORCE_PROBE
> > > =C2=A0=C2=A0	string "Force probe xe for selected Intel hardware IDs"
> > > diff --git a/drivers/gpu/drm/xe/xe_bo_types.h
> > > b/drivers/gpu/drm/xe/xe_bo_types.h
> > > index eb5e83c5f233..e0efaf23d051 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> > > @@ -86,7 +86,7 @@ struct xe_bo {
> > > =C2=A0=C2=A0	u16 cpu_caching;
> > > =C2=A0=C2=A0	/** @devmem_allocation: SVM device memory allocation */
> > > -	struct drm_gpusvm_devmem devmem_allocation;
> > > +	struct drm_pagemap_devmem devmem_allocation;
> > > =C2=A0=C2=A0	/** @vram_userfault_link: Link into
> > > @mem_access.vram_userfault.list */
> > > =C2=A0=C2=A0		struct list_head vram_userfault_link;
> > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> > > b/drivers/gpu/drm/xe/xe_device_types.h
> > > index ac27389ccb8b..4a907231c0fc 100644
> > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > @@ -105,7 +105,7 @@ struct xe_vram_region {
> > > =C2=A0=C2=A0	void __iomem *mapping;
> > > =C2=A0=C2=A0	/** @ttm: VRAM TTM manager */
> > > =C2=A0=C2=A0	struct xe_ttm_vram_mgr ttm;
> > > -#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
> > > +#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
> > > =C2=A0=C2=A0	/** @pagemap: Used to remap device memory as ZONE_DEVICE
> > > */
> > > =C2=A0=C2=A0	struct dev_pagemap pagemap;
> > > =C2=A0=C2=A0	/**
> > > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > > b/drivers/gpu/drm/xe/xe_svm.c
> > > index 83c63fd7b481..51b01a11a0cf 100644
> > > --- a/drivers/gpu/drm/xe/xe_svm.c
> > > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > > @@ -329,7 +329,7 @@ static void
> > > xe_svm_garbage_collector_work_func(struct work_struct *w)
> > > =C2=A0=C2=A0	up_write(&vm->lock);
> > > =C2=A0 }
> > > -#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
> > > +#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
> > > =C2=A0 static struct xe_vram_region *page_to_vr(struct page *page)
> > > =C2=A0 {
> > > @@ -517,12 +517,12 @@ static int xe_svm_copy_to_ram(struct page
> > > **pages, dma_addr_t *dma_addr,
> > > =C2=A0=C2=A0	return xe_svm_copy(pages, dma_addr, npages,
> > > XE_SVM_COPY_TO_SRAM);
> > > =C2=A0 }
> > > -static struct xe_bo *to_xe_bo(struct drm_gpusvm_devmem
> > > *devmem_allocation)
> > > +static struct xe_bo *to_xe_bo(struct drm_pagemap_devmem
> > > *devmem_allocation)
> > > =C2=A0 {
> > > =C2=A0=C2=A0	return container_of(devmem_allocation, struct xe_bo,
> > > devmem_allocation);
> > > =C2=A0 }
> > > -static void xe_svm_devmem_release(struct drm_gpusvm_devmem
> > > *devmem_allocation)
> > > +static void xe_svm_devmem_release(struct drm_pagemap_devmem
> > > *devmem_allocation)
> > > =C2=A0 {
> > > =C2=A0=C2=A0	struct xe_bo *bo =3D to_xe_bo(devmem_allocation);
> > > @@ -539,7 +539,7 @@ static struct drm_buddy *tile_to_buddy(struct
> > > xe_tile *tile)
> > > =C2=A0=C2=A0	return &tile->mem.vram.ttm.mm;
> > > =C2=A0 }
> > > -static int xe_svm_populate_devmem_pfn(struct drm_gpusvm_devmem
> > > *devmem_allocation,
> > > +static int xe_svm_populate_devmem_pfn(struct drm_pagemap_devmem
> > > *devmem_allocation,
> > > =C2=A0=C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long npages,
> > > unsigned long *pfn)
> > > =C2=A0 {
> > > =C2=A0=C2=A0	struct xe_bo *bo =3D to_xe_bo(devmem_allocation);
> > > @@ -562,7 +562,7 @@ static int xe_svm_populate_devmem_pfn(struct
> > > drm_gpusvm_devmem *devmem_allocatio
> > > =C2=A0=C2=A0	return 0;
> > > =C2=A0 }
> > > -static const struct drm_gpusvm_devmem_ops gpusvm_devmem_ops =3D {
> > > +static const struct drm_pagemap_devmem_ops dpagemap_devmem_ops =3D
> > > {
> > > =C2=A0=C2=A0	.devmem_release =3D xe_svm_devmem_release,
> > > =C2=A0=C2=A0	.populate_devmem_pfn =3D xe_svm_populate_devmem_pfn,
> > > =C2=A0=C2=A0	.copy_to_devmem =3D xe_svm_copy_to_devmem,
> > > @@ -714,7 +714,7 @@ u64 xe_svm_find_vma_start(struct xe_vm *vm,
> > > u64 start, u64 end, struct xe_vma *v
> > > =C2=A0=C2=A0					 min(end,
> > > xe_vma_end(vma)));
> > > =C2=A0 }
> > > -#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
> > > +#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
> > > =C2=A0 static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
> > > =C2=A0 {
> > > =C2=A0=C2=A0	return &tile->mem.vram;
> > > @@ -742,6 +742,9 @@ int xe_svm_alloc_vram(struct xe_vm *vm,
> > > struct xe_tile *tile,
> > > =C2=A0=C2=A0	ktime_t end =3D 0;
> > > =C2=A0=C2=A0	int err;
> > > +	if (!range->base.flags.migrate_devmem)
> > > +		return -EINVAL;
> > > +
> > > =C2=A0=C2=A0	range_debug(range, "ALLOCATE VRAM");
> > > =C2=A0=C2=A0	if (!mmget_not_zero(mm))
> > > @@ -761,19 +764,23 @@ int xe_svm_alloc_vram(struct xe_vm *vm,
> > > struct xe_tile *tile,
> > > =C2=A0=C2=A0		goto unlock;
> > > =C2=A0=C2=A0	}
> > > -	drm_gpusvm_devmem_init(&bo->devmem_allocation,
> > > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vm->xe->drm.dev, mm,
> > > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gpusvm_devmem_ops,
> > > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &tile->mem.vram.dpagemap,
> > > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_svm_range_size(range));
> > > +	drm_pagemap_devmem_init(&bo->devmem_allocation,
> > > +				vm->xe->drm.dev, mm,
> > > +				&dpagemap_devmem_ops,
> > > +				&tile->mem.vram.dpagemap,
> > > +				xe_svm_range_size(range));
> > > =C2=A0=C2=A0	blocks =3D &to_xe_ttm_vram_mgr_resource(bo->ttm.resource=
)-
> > > >blocks;
> > > =C2=A0=C2=A0	list_for_each_entry(block, blocks, link)
> > > =C2=A0=C2=A0		block->private =3D vr;
> > > =C2=A0=C2=A0	xe_bo_get(bo);
> > > -	err =3D drm_gpusvm_migrate_to_devmem(&vm->svm.gpusvm,
> > > &range->base,
> > > -					=C2=A0=C2=A0 &bo-
> > > >devmem_allocation, ctx);
> > > +	err =3D drm_pagemap_migrate_to_devmem(&bo-
> > > >devmem_allocation,
> > > +					=C2=A0=C2=A0=C2=A0 mm,
> > > +					=C2=A0=C2=A0=C2=A0
> > > xe_svm_range_start(range),
> > > +					=C2=A0=C2=A0=C2=A0
> > > xe_svm_range_end(range),
> > > +					=C2=A0=C2=A0=C2=A0 ctx->timeslice_ms,
> > > +					=C2=A0=C2=A0=C2=A0
> > > xe_svm_devm_owner(vm->xe));
> > > =C2=A0=C2=A0	if (err)
> > > =C2=A0=C2=A0		xe_svm_devmem_release(&bo->devmem_allocation);
> > > @@ -848,13 +855,13 @@ int xe_svm_handle_pagefault(struct xe_vm
> > > *vm, struct xe_vma *vma,
> > > =C2=A0=C2=A0	struct drm_gpusvm_ctx ctx =3D {
> > > =C2=A0=C2=A0		.read_only =3D xe_vma_read_only(vma),
> > > =C2=A0=C2=A0		.devmem_possible =3D IS_DGFX(vm->xe) &&
> > > -			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
> > > +			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
> > > =C2=A0=C2=A0		.check_pages_threshold =3D IS_DGFX(vm->xe) &&
> > > -			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
> > > ? SZ_64K : 0,
> > > +			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ?
> > > SZ_64K : 0,
> > > =C2=A0=C2=A0		.devmem_only =3D atomic && IS_DGFX(vm->xe) &&
> > > -			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
> > > +			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
> > > =C2=A0=C2=A0		.timeslice_ms =3D atomic && IS_DGFX(vm->xe) &&
> > > -			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
> > > ?
> > > +			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ?
> > > =C2=A0=C2=A0			vm->xe->atomic_svm_timeslice_ms : 0,
> > > =C2=A0=C2=A0	};
> > > =C2=A0=C2=A0	struct xe_svm_range *range;
> > > @@ -992,7 +999,7 @@ bool xe_svm_has_mapping(struct xe_vm *vm, u64
> > > start, u64 end)
> > > =C2=A0=C2=A0 */
> > > =C2=A0 int xe_svm_bo_evict(struct xe_bo *bo)
> > > =C2=A0 {
> > > -	return drm_gpusvm_evict_to_ram(&bo->devmem_allocation);
> > > +	return drm_pagemap_evict_to_ram(&bo->devmem_allocation);
> > > =C2=A0 }
> > > =C2=A0 /**
> > > @@ -1045,7 +1052,7 @@ int xe_svm_range_get_pages(struct xe_vm
> > > *vm, struct xe_svm_range *range,
> > > =C2=A0=C2=A0	return err;
> > > =C2=A0 }
> > > -#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
> > > +#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
> > > =C2=A0 static struct drm_pagemap_device_addr
> > > =C2=A0 xe_drm_pagemap_device_map(struct drm_pagemap *dpagemap,
> > > @@ -1102,7 +1109,7 @@ int xe_devm_add(struct xe_tile *tile,
> > > struct xe_vram_region *vr)
> > > =C2=A0=C2=A0	vr->pagemap.range.start =3D res->start;
> > > =C2=A0=C2=A0	vr->pagemap.range.end =3D res->end;
> > > =C2=A0=C2=A0	vr->pagemap.nr_range =3D 1;
> > > -	vr->pagemap.ops =3D drm_gpusvm_pagemap_ops_get();
> > > +	vr->pagemap.ops =3D drm_pagemap_pagemap_ops_get();
> > > =C2=A0=C2=A0	vr->pagemap.owner =3D xe_svm_devm_owner(xe);
> > > =C2=A0=C2=A0	addr =3D devm_memremap_pages(dev, &vr->pagemap);
> > > diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
> > > index 6a5156476bf4..4aedc5423aff 100644
> > > --- a/include/drm/drm_gpusvm.h
> > > +++ b/include/drm/drm_gpusvm.h
> > > @@ -16,91 +16,9 @@ struct drm_gpusvm;
> > > =C2=A0 struct drm_gpusvm_notifier;
> > > =C2=A0 struct drm_gpusvm_ops;
> > > =C2=A0 struct drm_gpusvm_range;
> > > -struct drm_gpusvm_devmem;
> > > =C2=A0 struct drm_pagemap;
> > > =C2=A0 struct drm_pagemap_device_addr;
> > > -/**
> > > - * struct drm_gpusvm_devmem_ops - Operations structure for GPU
> > > SVM device memory
> > > - *
> > > - * This structure defines the operations for GPU Shared Virtual
> > > Memory (SVM)
> > > - * device memory. These operations are provided by the GPU
> > > driver to manage device memory
> > > - * allocations and perform operations such as migration between
> > > device memory and system
> > > - * RAM.
> > > - */
> > > -struct drm_gpusvm_devmem_ops {
> > > -	/**
> > > -	 * @devmem_release: Release device memory allocation
> > > (optional)
> > > -	 * @devmem_allocation: device memory allocation
> > > -	 *
> > > -	 * Release device memory allocation and drop a reference
> > > to device
> > > -	 * memory allocation.
> > > -	 */
> > > -	void (*devmem_release)(struct drm_gpusvm_devmem
> > > *devmem_allocation);
> > > -
> > > -	/**
> > > -	 * @populate_devmem_pfn: Populate device memory PFN
> > > (required for migration)
> > > -	 * @devmem_allocation: device memory allocation
> > > -	 * @npages: Number of pages to populate
> > > -	 * @pfn: Array of page frame numbers to populate
> > > -	 *
> > > -	 * Populate device memory page frame numbers (PFN).
> > > -	 *
> > > -	 * Return: 0 on success, a negative error code on
> > > failure.
> > > -	 */
> > > -	int (*populate_devmem_pfn)(struct drm_gpusvm_devmem
> > > *devmem_allocation,
> > > -				=C2=A0=C2=A0 unsigned long npages,
> > > unsigned long *pfn);
> > > -
> > > -	/**
> > > -	 * @copy_to_devmem: Copy to device memory (required for
> > > migration)
> > > -	 * @pages: Pointer to array of device memory pages
> > > (destination)
> > > -	 * @dma_addr: Pointer to array of DMA addresses (source)
> > > -	 * @npages: Number of pages to copy
> > > -	 *
> > > -	 * Copy pages to device memory.
> > > -	 *
> > > -	 * Return: 0 on success, a negative error code on
> > > failure.
> > > -	 */
> > > -	int (*copy_to_devmem)(struct page **pages,
> > > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_addr_t *dma_addr,
> > > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long npages);
> > > -
> > > -	/**
> > > -	 * @copy_to_ram: Copy to system RAM (required for
> > > migration)
> > > -	 * @pages: Pointer to array of device memory pages
> > > (source)
> > > -	 * @dma_addr: Pointer to array of DMA addresses
> > > (destination)
> > > -	 * @npages: Number of pages to copy
> > > -	 *
> > > -	 * Copy pages to system RAM.
> > > -	 *
> > > -	 * Return: 0 on success, a negative error code on
> > > failure.
> > > -	 */
> > > -	int (*copy_to_ram)(struct page **pages,
> > > -			=C2=A0=C2=A0 dma_addr_t *dma_addr,
> > > -			=C2=A0=C2=A0 unsigned long npages);
> > > -};
> > > -
> > > -/**
> > > - * struct drm_gpusvm_devmem - Structure representing a GPU SVM
> > > device memory allocation
> > > - *
> > > - * @dev: Pointer to the device structure which device memory
> > > allocation belongs to
> > > - * @mm: Pointer to the mm_struct for the address space
> > > - * @detached: device memory allocations is detached from device
> > > pages
> > > - * @ops: Pointer to the operations structure for GPU SVM device
> > > memory
> > > - * @dpagemap: The struct drm_pagemap of the pages this
> > > allocation belongs to.
> > > - * @size: Size of device memory allocation
> > > - * @timeslice_expiration: Timeslice expiration in jiffies
> > > - */
> > > -struct drm_gpusvm_devmem {
> > > -	struct device *dev;
> > > -	struct mm_struct *mm;
> > > -	struct completion detached;
> > > -	const struct drm_gpusvm_devmem_ops *ops;
> > > -	struct drm_pagemap *dpagemap;
> > > -	size_t size;
> > > -	u64 timeslice_expiration;
> > > -};
> > > -
> > > =C2=A0 /**
> > > =C2=A0=C2=A0 * struct drm_gpusvm_ops - Operations structure for GPU S=
VM
> > > =C2=A0=C2=A0 *
> > > @@ -361,15 +279,6 @@ void drm_gpusvm_range_unmap_pages(struct
> > > drm_gpusvm *gpusvm,
> > > =C2=A0=C2=A0				=C2=A0 struct drm_gpusvm_range
> > > *range,
> > > =C2=A0=C2=A0				=C2=A0 const struct drm_gpusvm_ctx
> > > *ctx);
> > > -int drm_gpusvm_migrate_to_devmem(struct drm_gpusvm *gpusvm,
> > > -				 struct drm_gpusvm_range *range,
> > > -				 struct drm_gpusvm_devmem
> > > *devmem_allocation,
> > > -				 const struct drm_gpusvm_ctx
> > > *ctx);
> > > -
> > > -int drm_gpusvm_evict_to_ram(struct drm_gpusvm_devmem
> > > *devmem_allocation);
> > > -
> > > -const struct dev_pagemap_ops *drm_gpusvm_pagemap_ops_get(void);
> > > -
> > > =C2=A0 bool drm_gpusvm_has_mapping(struct drm_gpusvm *gpusvm, unsigne=
d
> > > long start,
> > > =C2=A0=C2=A0			=C2=A0=C2=A0=C2=A0 unsigned long end);
> > > @@ -380,11 +289,6 @@ drm_gpusvm_range_find(struct
> > > drm_gpusvm_notifier *notifier, unsigned long start,
> > > =C2=A0 void drm_gpusvm_range_set_unmapped(struct drm_gpusvm_range
> > > *range,
> > > =C2=A0=C2=A0				=C2=A0=C2=A0 const struct
> > > mmu_notifier_range *mmu_range);
> > > -void drm_gpusvm_devmem_init(struct drm_gpusvm_devmem
> > > *devmem_allocation,
> > > -			=C2=A0=C2=A0=C2=A0 struct device *dev, struct mm_struct
> > > *mm,
> > > -			=C2=A0=C2=A0=C2=A0 const struct drm_gpusvm_devmem_ops
> > > *ops,
> > > -			=C2=A0=C2=A0=C2=A0 struct drm_pagemap *dpagemap, size_t
> > > size);
> > > -
> > > =C2=A0 #ifdef CONFIG_LOCKDEP
> > > =C2=A0 /**
> > > =C2=A0=C2=A0 * drm_gpusvm_driver_set_lock() - Set the lock protecting
> > > accesses to GPU SVM
> > > diff --git a/include/drm/drm_pagemap.h
> > > b/include/drm/drm_pagemap.h
> > > index 202c157ff4d7..dabc9c365df4 100644
> > > --- a/include/drm/drm_pagemap.h
> > > +++ b/include/drm/drm_pagemap.h
> > > @@ -7,6 +7,7 @@
> > > =C2=A0 #include <linux/types.h>
> > > =C2=A0 struct drm_pagemap;
> > > +struct drm_pagemap_zdd;
> > > =C2=A0 struct device;
> > > =C2=A0 /**
> > > @@ -104,4 +105,104 @@ struct drm_pagemap {
> > > =C2=A0=C2=A0	struct device *dev;
> > > =C2=A0 };
> > > +struct drm_pagemap_devmem;
> > > +
> > > +/**
> > > + * struct drm_pagemap_devmem_ops - Operations structure for GPU
> > > SVM device memory
> > > + *
> > > + * This structure defines the operations for GPU Shared Virtual
> > > Memory (SVM)
> > > + * device memory. These operations are provided by the GPU
> > > driver to manage device memory
> > > + * allocations and perform operations such as migration between
> > > device memory and system
> > > + * RAM.
> > > + */
> > > +struct drm_pagemap_devmem_ops {
> > > +	/**
> > > +	 * @devmem_release: Release device memory allocation
> > > (optional)
> > > +	 * @devmem_allocation: device memory allocation
> > > +	 *
> > > +	 * Release device memory allocation and drop a reference
> > > to device
> > > +	 * memory allocation.
> > > +	 */
> > > +	void (*devmem_release)(struct drm_pagemap_devmem
> > > *devmem_allocation);
> > > +
> > > +	/**
> > > +	 * @populate_devmem_pfn: Populate device memory PFN
> > > (required for migration)
> > > +	 * @devmem_allocation: device memory allocation
> > > +	 * @npages: Number of pages to populate
> > > +	 * @pfn: Array of page frame numbers to populate
> > > +	 *
> > > +	 * Populate device memory page frame numbers (PFN).
> > > +	 *
> > > +	 * Return: 0 on success, a negative error code on
> > > failure.
> > > +	 */
> > > +	int (*populate_devmem_pfn)(struct drm_pagemap_devmem
> > > *devmem_allocation,
> > > +				=C2=A0=C2=A0 unsigned long npages,
> > > unsigned long *pfn);
> > > +
> > > +	/**
> > > +	 * @copy_to_devmem: Copy to device memory (required for
> > > migration)
> > > +	 * @pages: Pointer to array of device memory pages
> > > (destination)
> > > +	 * @dma_addr: Pointer to array of DMA addresses (source)
> > > +	 * @npages: Number of pages to copy
> > > +	 *
> > > +	 * Copy pages to device memory.
> > > +	 *
> > > +	 * Return: 0 on success, a negative error code on
> > > failure.
> > > +	 */
> > > +	int (*copy_to_devmem)(struct page **pages,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_addr_t *dma_addr,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long npages);
> > > +
> > > +	/**
> > > +	 * @copy_to_ram: Copy to system RAM (required for
> > > migration)
> > > +	 * @pages: Pointer to array of device memory pages
> > > (source)
> > > +	 * @dma_addr: Pointer to array of DMA addresses
> > > (destination)
> > > +	 * @npages: Number of pages to copy
> > > +	 *
> > > +	 * Copy pages to system RAM.
> > > +	 *
> > > +	 * Return: 0 on success, a negative error code on
> > > failure.
> > > +	 */
> > > +	int (*copy_to_ram)(struct page **pages,
> > > +			=C2=A0=C2=A0 dma_addr_t *dma_addr,
> > > +			=C2=A0=C2=A0 unsigned long npages);
> > > +};
> > > +
> > > +/**
> > > + * struct drm_pagemap_devmem - Structure representing a GPU SVM
> > > device memory allocation
> > > + *
> > > + * @dev: Pointer to the device structure which device memory
> > > allocation belongs to
> > > + * @mm: Pointer to the mm_struct for the address space
> > > + * @detached: device memory allocations is detached from device
> > > pages
> > > + * @ops: Pointer to the operations structure for GPU SVM device
> > > memory
> > > + * @dpagemap: The struct drm_pagemap of the pages this
> > > allocation belongs to.
> > > + * @size: Size of device memory allocation
> > > + * @timeslice_expiration: Timeslice expiration in jiffies
> > > + */
> > > +struct drm_pagemap_devmem {
> > > +	struct device *dev;
> > > +	struct mm_struct *mm;
> > > +	struct completion detached;
> > > +	const struct drm_pagemap_devmem_ops *ops;
> > > +	struct drm_pagemap *dpagemap;
> > > +	size_t size;
> > > +	u64 timeslice_expiration;
> > > +};
> > > +
> > > +int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem
> > > *devmem_allocation,
> > > +				=C2=A0 struct mm_struct *mm,
> > > +				=C2=A0 unsigned long start, unsigned
> > > long end,
> > > +				=C2=A0 unsigned long timeslice_ms,
> > > +				=C2=A0 void *pgmap_owner);
> > > +
> > > +int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem
> > > *devmem_allocation);
> > > +
> > > +const struct dev_pagemap_ops *drm_pagemap_pagemap_ops_get(void);
> > > +
> > > +struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page
> > > *page);
> > > +
> > > +void drm_pagemap_devmem_init(struct drm_pagemap_devmem
> > > *devmem_allocation,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0 struct device *dev, struct
> > > mm_struct *mm,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0 const struct drm_pagemap_devmem_ops
> > > *ops,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_pagemap *dpagemap,
> > > size_t size);
> >=20
> > LGTM
> > Reviewed-by: Himal Prasad Ghimiray
> > <himal.prasad.ghimiray@intel.com>> +
> > > =C2=A0 #endif
> >=20

