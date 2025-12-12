Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D88CB8B85
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 12:35:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE2F210E6FA;
	Fri, 12 Dec 2025 11:35:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TUwV83ck";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 839FB10E6FA;
 Fri, 12 Dec 2025 11:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765539308; x=1797075308;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Gn8O/dx307KJP5l6FOvU6QsrzwAlUoCqN1R/6yvau3o=;
 b=TUwV83ckLWly4ZoCc66Id99sZ9Zn6gwugafuUIHy26DBL5L/92sOSKwG
 teK0TgnLUcLfnMeJII0V6aFLaSyRLJYRmuQ0IDD0pvozOWcMW3TNGxPUA
 Aku6eeYZhRyLb5X+rXlc6Y1PRa5q4Axm3/3Bh4TotZgz1kanwuFtBx1+9
 rI6kS9+2b/yTV6JtRydJ7wV4YgOJ3uCjYpPTs1yGBYEOvxWM+11i3A9lG
 qvRYmeicwRYVSVdko5DWlUUNxG3TR7KX7u/sxjLab6PXZqlC36DhU/xw5
 RzGxL9boaWRhGsf9yH+lCqUMfelJGT7ii3wUZpMSodUhWk/lBC5Dlx4kz w==;
X-CSE-ConnectionGUID: +xk2A662RUmaQ7+bG58D0g==
X-CSE-MsgGUID: EIU6znGySJqKHIetAdbQ/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="66712307"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="66712307"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 03:35:07 -0800
X-CSE-ConnectionGUID: Rh5+WRSgQNWt406eyxWpBw==
X-CSE-MsgGUID: gtf32683Ru+n1rXLq6ADdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="201978906"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.245.106])
 ([10.245.245.106])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 03:35:04 -0800
Message-ID: <b43179723c15c9a20594f4ff52c1d936a5fa04c3.camel@linux.intel.com>
Subject: Re: [PATCH v4 19/22] drm/gpusvm: Introduce a function to scan the
 current migration state
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, 
 intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, apopple@nvidia.com, airlied@gmail.com, 
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com, Matthew
 Brost <matthew.brost@intel.com>,  Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, dakr@kernel.org, "Mrozek, Michal"	
 <michal.mrozek@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Date: Fri, 12 Dec 2025 12:35:00 +0100
In-Reply-To: <b70bec9c-da7b-4bff-9a41-b7548ea92518@intel.com>
References: <20251211165909.219710-1-thomas.hellstrom@linux.intel.com>
 <20251211165909.219710-20-thomas.hellstrom@linux.intel.com>
 <b70bec9c-da7b-4bff-9a41-b7548ea92518@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
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

Hi, Himal

On Fri, 2025-12-12 at 16:51 +0530, Ghimiray, Himal Prasad wrote:
>=20
>=20
> On 11-12-2025 22:29, Thomas Hellstr=C3=B6m wrote:
> > With multi-device we are much more likely to have multiple
> > drm-gpusvm ranges pointing to the same struct mm range.
> >=20
> > To avoid calling into drm_pagemap_populate_mm(), which is always
> > very costly, introduce a much less costly drm_gpusvm function,
> > drm_gpusvm_scan_mm() to scan the current migration state.
> > The device fault-handler and prefetcher can use this function to
> > determine whether migration is really necessary.
> >=20
> > There are a couple of performance improvements that can be done
> > for this function if it turns out to be too costly. Those are
> > documented in the code.
> >=20
> > v3:
> > - New patch.
> >=20
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0 drivers/gpu/drm/drm_gpusvm.c | 121
> > +++++++++++++++++++++++++++++++++++
> > =C2=A0 include/drm/drm_gpusvm.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 29 ++++=
+++++
> > =C2=A0 2 files changed, 150 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/drm_gpusvm.c
> > b/drivers/gpu/drm/drm_gpusvm.c
> > index 4c7474a331bc..aa9a0b60e727 100644
> > --- a/drivers/gpu/drm/drm_gpusvm.c
> > +++ b/drivers/gpu/drm/drm_gpusvm.c
> > @@ -743,6 +743,127 @@ static bool drm_gpusvm_check_pages(struct
> > drm_gpusvm *gpusvm,
> > =C2=A0=C2=A0	return err ? false : true;
> > =C2=A0 }
> > =C2=A0=20
> > +/**
> > + * drm_gpusvm_scan_mm() - Check the migration state of a
> > drm_gpusvm_range
> > + * @range: Pointer to the struct drm_gpusvm_range to check.
> > + * @dev_private_owner: The struct dev_private_owner to use to
> > determine
> > + * compatible device-private pages.
> > + * @pagemap: The struct dev_pagemap pointer to use for pagemap-
> > specific
> > + * checks.
> > + *
> > + * Scan the CPU address space corresponding to @range and return
> > the
> > + * current migration state. Note that the result may be invalid as
> > + * soon as the function returns. It's an advisory check.
> > + *
> > + * TODO: Bail early and call hmm_range_fault() for subranges.
> > + *
> > + * Return: See &enum drm_gpusvm_scan_result.
> > + */
> > +enum drm_gpusvm_scan_result drm_gpusvm_scan_mm(struct
> > drm_gpusvm_range *range,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void
> > *dev_private_owner,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct
> > dev_pagemap *pagemap)
> > +{
> > +	struct mmu_interval_notifier *notifier =3D &range->notifier-
> > >notifier;
> > +	unsigned long start =3D drm_gpusvm_range_start(range);
> > +	unsigned long end =3D drm_gpusvm_range_end(range);
> > +	struct hmm_range hmm_range =3D {
> > +		.default_flags =3D 0,
> > +		.notifier =3D notifier,
> > +		.start =3D start,
> > +		.end =3D end,
> > +		.dev_private_owner =3D dev_private_owner,
> > +	};
> > +	unsigned long timeout =3D
> > +		jiffies +
> > msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
> > +	enum drm_gpusvm_scan_result state =3D
> > DRM_GPUSVM_SCAN_UNPOPULATED, new_state;
> > +	unsigned long *pfns;
> > +	unsigned long npages =3D npages_in_range(start, end);
> > +	const struct dev_pagemap *other =3D NULL;
> > +	int err, i;
> > +
> > +	pfns =3D kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
> > +	if (!pfns)
> > +		return DRM_GPUSVM_SCAN_UNPOPULATED;
> > +
> > +	hmm_range.hmm_pfns =3D pfns;
> > +
> > +retry:
> > +	hmm_range.notifier_seq =3D
> > mmu_interval_read_begin(notifier);
> > +	mmap_read_lock(range->gpusvm->mm);
> > +
> > +	while (true) {
> > +		err =3D hmm_range_fault(&hmm_range);
> > +		if (err =3D=3D -EBUSY) {
> > +			if (time_after(jiffies, timeout))
> > +				break;
> > +
> > +			hmm_range.notifier_seq =3D
> > +				mmu_interval_read_begin(notifier);
> > +			continue;
> > +		}
> > +		break;
> > +	}
> > +	mmap_read_unlock(range->gpusvm->mm);
> > +	if (err)
> > +		goto err_free;
> > +
> > +	drm_gpusvm_notifier_lock(range->gpusvm);
> > +	if (mmu_interval_read_retry(notifier,
> > hmm_range.notifier_seq)) {
> > +		drm_gpusvm_notifier_unlock(range->gpusvm);
> > +		goto retry;
> > +	}
> > +
> > +	for (i =3D 0; i < npages;) {
> > +		struct page *page;
> > +		const struct dev_pagemap *cur =3D NULL;
> > +
> > +		if (!(pfns[i] & HMM_PFN_VALID)) {
> > +			state =3D DRM_GPUSVM_SCAN_UNPOPULATED;
> > +			goto err_free;
> > +		}
> > +
> > +		page =3D hmm_pfn_to_page(pfns[i]);
> > +		if (is_device_private_page(page) ||
> > +		=C2=A0=C2=A0=C2=A0 is_device_coherent_page(page))
> > +			cur =3D page_pgmap(page);
> > +
> > +		if (cur =3D=3D pagemap) {
> > +			new_state =3D DRM_GPUSVM_SCAN_EQUAL;
> > +		} else if (cur && (cur =3D=3D other || !other)) {
> > +			new_state =3D DRM_GPUSVM_SCAN_OTHER;
> > +			other =3D cur;
> > +		} else if (cur) {
> > +			new_state =3D DRM_GPUSVM_SCAN_MIXED_DEVICE;
> > +		} else {
> > +			new_state =3D DRM_GPUSVM_SCAN_SYSTEM;
> > +		}
> > +
> > +		/*
> > +		 * TODO: Could use an array for state
> > +		 * transitions, and caller might want it
> > +		 * to bail early for some results.
> > +		 */
> > +		if (state =3D=3D DRM_GPUSVM_SCAN_UNPOPULATED) {
> > +			state =3D new_state;
> > +		} else if (state !=3D new_state) {
> > +			if (new_state =3D=3D DRM_GPUSVM_SCAN_SYSTEM ||
> > +			=C2=A0=C2=A0=C2=A0 state =3D=3D DRM_GPUSVM_SCAN_SYSTEM)
> > +				state =3D DRM_GPUSVM_SCAN_MIXED;
> > +			else if (state !=3D DRM_GPUSVM_SCAN_MIXED)
> > +				state =3D
> > DRM_GPUSVM_SCAN_MIXED_DEVICE;
> > +		}
> > +
> > +		i +=3D 1ul << drm_gpusvm_hmm_pfn_to_order(pfns[i],
> > i, npages);
> > +	}
> > +
> > +err_free:
> > +	drm_gpusvm_notifier_unlock(range->gpusvm);
> > +
> > +	kvfree(pfns);
> > +	return state;
> > +}
> > +EXPORT_SYMBOL(drm_gpusvm_scan_mm);
> > +
> > =C2=A0 /**
> > =C2=A0=C2=A0 * drm_gpusvm_range_chunk_size() - Determine chunk size for=
 GPU
> > SVM range
> > =C2=A0=C2=A0 * @gpusvm: Pointer to the GPU SVM structure
> > diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
> > index 632e100e6efb..2578ac92a8d4 100644
> > --- a/include/drm/drm_gpusvm.h
> > +++ b/include/drm/drm_gpusvm.h
> > @@ -328,6 +328,35 @@ void drm_gpusvm_free_pages(struct drm_gpusvm
> > *gpusvm,
> > =C2=A0=C2=A0			=C2=A0=C2=A0 struct drm_gpusvm_pages *svm_pages,
> > =C2=A0=C2=A0			=C2=A0=C2=A0 unsigned long npages);
> > =C2=A0=20
> > +/**
> > + * enum drm_gpusvm_scan_result - Scan result from the
> > drm_gpusvm_scan_mm() function.
> > + * @DRM_GPUSVM_SCAN_UNPOPULATED: At least one page was not present
> > or inaccessible.
> > + * @DRM_GPUSVM_SCAN_EQUAL: All pages belong to the struct
> > dev_pagemap indicated as
> > + * the @pagemap argument to the drm_gpusvm_scan_mm() function.
> > + * @DRM_GPUSVM_SCAN_OTHER: All pages belong to exactly one
> > dev_pagemap, which is
> > + * *NOT* the @pagemap argument to the drm_gpusvm_scan_mm(). All
> > pages belong to
> > + * the same device private owner.
> > + * @DRM_GPUSVM_SCAN_SYSTEM: All pages are present and system
> > pages.
> > + * @DRM_GPUSVM_SCAN_MIXED_DEVICE: All pages are device pages and
> > belong to at least
> > + * two different struct dev_pagemaps. All pages belong to the same
> > device private
> > + * owner.
> > + * @DRM_GPUSVM_SCAN_MIXED: Pages are present and are a mix of
> > system pages
> > + * and device-private pages. All device-private pages belong to
> > the same device
> > + * private owner.
> > + */
> > +enum drm_gpusvm_scan_result {
> > +	DRM_GPUSVM_SCAN_UNPOPULATED,
> > +	DRM_GPUSVM_SCAN_EQUAL,
> > +	DRM_GPUSVM_SCAN_OTHER,
> > +	DRM_GPUSVM_SCAN_SYSTEM,
> > +	DRM_GPUSVM_SCAN_MIXED_DEVICE,
> > +	DRM_GPUSVM_SCAN_MIXED,
> > +};
> > +
>=20
> Do we really need these enums, wont simply returning whether all
> pages=20
> in range has same pgmap be sufficient ? Return true or false and use
> to=20
> decide range needs migration or not.
>=20
> If we are expecting some further uses cases for these enums, then
> this=20
> looks OK though.

For the deferred series implementing the migrate_system_only migration
policy the usage looks like=20

	if (migration_status =3D=3D DRM_GPUSVM_SCAN_EQUAL ||
	    (!details->migrate_same_owner &&
	     (migration_status =3D=3D DRM_GPUSVM_SCAN_OTHER ||
	      migration_status =3D=3D DRM_GPUSVM_SCAN_MIXED_DEVICE))) {
		drm_info(dpagemap->drm, "Already migrated!\n");
		return 0;
	}

So not all are needed in the near future. I could look at simplifying a
bit, though, so that we actually only expose what we use currently.

/Thomas


>=20
> > +enum drm_gpusvm_scan_result drm_gpusvm_scan_mm(struct
> > drm_gpusvm_range *range,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void
> > *dev_private_owner,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct
> > dev_pagemap *pagemap);
> > +
> > =C2=A0 #ifdef CONFIG_LOCKDEP
> > =C2=A0 /**
> > =C2=A0=C2=A0 * drm_gpusvm_driver_set_lock() - Set the lock protecting
> > accesses to GPU SVM
>=20

