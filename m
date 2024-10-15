Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FBF99E574
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 13:21:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01A8210E56F;
	Tue, 15 Oct 2024 11:21:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BpPfwb+f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 380F010E1B9;
 Tue, 15 Oct 2024 11:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728991290; x=1760527290;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=0ewV0D1RxWOE0VLFETll9aV4Xxx4md13rJvHQq0LnOk=;
 b=BpPfwb+fihBf6YCIMnSZMLHOolT7udMw4AemtRLpgQydLUUgL7CSxRLT
 ZQOUgC4LHw6v+L6/KxUxSPGLND8z2Up+xSSDpghMTCcaKWFn2aHjOG4/8
 DPkPolpbhR5HSsRKtRaxl6woUUC/OlCEyB7FIdyG7/TeBafNeUd80fJzr
 ZOZ7IFG+aN6UfxGJDvbeZoLUGaTwCTs1YzXZ9/WRHFzQPSf1t6MLM5pM4
 hXT2XjRPjOl83nTx3giDQ+5+fNXeqAfdV2RqGPolgvOLvst44bO3r8aSU
 1lXlo3q7w1HuY2ZGxIs951OtuviWMSmOTodtpDJnugDSiDue+Imph/At6 Q==;
X-CSE-ConnectionGUID: dncIlGgZRT6jCkZvV1dxdQ==
X-CSE-MsgGUID: Ew7BUFu7RXeZ9DIAAVhlGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="32297657"
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; d="scan'208";a="32297657"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 04:21:29 -0700
X-CSE-ConnectionGUID: ncMsm8CZRh6ov6ecOvRpzQ==
X-CSE-MsgGUID: mGlqmG8BTrOSWEQ9bWFcQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; d="scan'208";a="77482151"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO [10.245.246.43])
 ([10.245.246.43])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 04:21:28 -0700
Message-ID: <5f369b087ed3ef53cf255c212b0aef6fe1a7e613.camel@linux.intel.com>
Subject: Re: [RFC PATCH] mm/hmm, mm/migrate_device: Allow p2p access and p2p
 migration
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Jason Gunthorpe
 <jgg@nvidia.com>,  Simona Vetter <simona.vetter@ffwll.ch>, DRI-devel
 <dri-devel@lists.freedesktop.org>, Linux Memory Management List
 <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>
Date: Tue, 15 Oct 2024 13:21:25 +0200
In-Reply-To: <20241015111322.97514-1-thomas.hellstrom@linux.intel.com>
References: <20241015111322.97514-1-thomas.hellstrom@linux.intel.com>
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

On Tue, 2024-10-15 at 13:13 +0200, Thomas Hellstr=C3=B6m wrote:
> Introduce a way for hmm_range_fault() and migrate_vma_setup() to
> identify
> foreign devices with fast interconnect and thereby allow
> both direct access over the interconnect and p2p migration.
>=20
> The need for a callback arises because without it, the p2p ability
> would
> need to be static and determined at dev_pagemap creation time. With
> a callback it can be determined dynamically, and in the migrate case
> the callback could separate out local device pages.
>=20
> The hmm_range_fault() change has been tested internally, the
> migrate_vma_setup() change hasn't yet.
>=20
> Seeking early feedback. Any suggestions appreciated.
>=20
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Jason Gunthorpe <jgg@nvidia.com>
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Cc: DRI-devel <dri-devel@lists.freedesktop.org>
> Cc: Linux Memory Management List <linux-mm@kvack.org>
> Cc: LKML <linux-kernel@vger.kernel.org>
>=20
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> ---
> =C2=A0include/linux/hmm.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 ++
> =C2=A0include/linux/migrate.h | 29 +++++++++++++++++++++++++++++
> =C2=A0mm/hmm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 13 +++++++++++--
> =C2=A0mm/migrate_device.c=C2=A0=C2=A0=C2=A0=C2=A0 | 12 ++++++++++++
> =C2=A04 files changed, 54 insertions(+), 2 deletions(-)
>=20
> diff --git a/include/linux/hmm.h b/include/linux/hmm.h
> index 126a36571667..4de909a1e10a 100644
> --- a/include/linux/hmm.h
> +++ b/include/linux/hmm.h
> @@ -12,6 +12,7 @@
> =C2=A0#include <linux/mm.h>
> =C2=A0
> =C2=A0struct mmu_interval_notifier;
> +struct p2p_allow;
> =C2=A0
> =C2=A0/*
> =C2=A0 * On output:
> @@ -97,6 +98,7 @@ struct hmm_range {
> =C2=A0	unsigned long		default_flags;
> =C2=A0	unsigned long		pfn_flags_mask;
> =C2=A0	void			*dev_private_owner;
> +	struct p2p_allow=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *p2p;
> =C2=A0};
> =C2=A0
> =C2=A0/*
> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
> index 002e49b2ebd9..0ff085b633e3 100644
> --- a/include/linux/migrate.h
> +++ b/include/linux/migrate.h
> @@ -183,10 +183,37 @@ static inline unsigned long
> migrate_pfn(unsigned long pfn)
> =C2=A0	return (pfn << MIGRATE_PFN_SHIFT) | MIGRATE_PFN_VALID;
> =C2=A0}
> =C2=A0
> +struct p2p_allow;
> +
> +/**
> + * struct p2p_allow_ops - Functions for detailed cross-device
> access.
> + */
> +struct p2p_allow_ops {
> +	/**
> +	 * @p2p_allow: Whether to allow cross-device access to
> device_private pages.
> +	 * @allow: Pointer to a struct p2p_allow. Typically
> subclassed by the caller
> +	 * to provide needed information.
> +	 * @page: The page being queried.
> +	 */
> +	bool (*p2p_allow)(struct p2p_allow *allow, struct page
> *page);
> +};
> +
> +/**
> + * struct p2p_allow - Information needed to allow cross-device
> access.
> + * @ops: Pointer to a struct p2p_allow_ops.
> + *
> + * This struct is intended to be embedded / subclassed to provide
> additional
> + * information needed by the @ops p2p_allow() callback.
> + */
> +struct p2p_allow {
> +	const struct p2p_allow_ops *ops;
> +};
> +
> =C2=A0enum migrate_vma_direction {
> =C2=A0	MIGRATE_VMA_SELECT_SYSTEM =3D 1 << 0,
> =C2=A0	MIGRATE_VMA_SELECT_DEVICE_PRIVATE =3D 1 << 1,
> =C2=A0	MIGRATE_VMA_SELECT_DEVICE_COHERENT =3D 1 << 2,
> +	MIGRATE_VMA_SELECT_DEVICE_P2P =3D 1 << 3,
> =C2=A0};
> =C2=A0
> =C2=A0struct migrate_vma {
> @@ -222,6 +249,8 @@ struct migrate_vma {
> =C2=A0	 * a migrate_to_ram() callback.
> =C2=A0	 */
> =C2=A0	struct page		*fault_page;
> +	/* Optional identification of devices for p2p migration */
> +	struct p2p_allow=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *p2p;
> =C2=A0};
> =C2=A0
> =C2=A0int migrate_vma_setup(struct migrate_vma *args);
> diff --git a/mm/hmm.c b/mm/hmm.c
> index 7e0229ae4a5a..8c28f9b22ed2 100644
> --- a/mm/hmm.c
> +++ b/mm/hmm.c
> @@ -19,6 +19,7 @@
> =C2=A0#include <linux/pagemap.h>
> =C2=A0#include <linux/swapops.h>
> =C2=A0#include <linux/hugetlb.h>
> +#include <linux/migrate.h>
> =C2=A0#include <linux/memremap.h>
> =C2=A0#include <linux/sched/mm.h>
> =C2=A0#include <linux/jump_label.h>
> @@ -220,6 +221,15 @@ static inline unsigned long
> pte_to_hmm_pfn_flags(struct hmm_range *range,
> =C2=A0	return pte_write(pte) ? (HMM_PFN_VALID | HMM_PFN_WRITE) :
> HMM_PFN_VALID;
> =C2=A0}
> =C2=A0
> +static bool hmm_allow_devmem(struct hmm_range *range, struct page
> *page)
> +{
> +	if (likely(page->pgmap->owner =3D=3D range->dev_private_owner))
> +		return true;
> +	if (likely(!range->p2p))
> +		return false;
> +	return range->p2p->ops->p2p_allow(range->p2p, page);
> +}
> +
> =C2=A0static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long
> addr,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long end, pmd_t *pmdp, p=
te_t
> *ptep,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long *hmm_pfn)
> @@ -248,8 +258,7 @@ static int hmm_vma_handle_pte(struct mm_walk
> *walk, unsigned long addr,
> =C2=A0		 * just report the PFN.
> =C2=A0		 */
> =C2=A0		if (is_device_private_entry(entry) &&
> -		=C2=A0=C2=A0=C2=A0 pfn_swap_entry_to_page(entry)->pgmap->owner =3D=3D
> -		=C2=A0=C2=A0=C2=A0 range->dev_private_owner) {
> +		=C2=A0=C2=A0=C2=A0 hmm_allow_devmem(range,
> pfn_swap_entry_to_page(entry))) {
> =C2=A0			cpu_flags =3D HMM_PFN_VALID;
> =C2=A0			if (is_writable_device_private_entry(entry))
> =C2=A0				cpu_flags |=3D HMM_PFN_WRITE;
> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> index 9cf26592ac93..8e643a3872c9 100644
> --- a/mm/migrate_device.c
> +++ b/mm/migrate_device.c
> @@ -54,6 +54,13 @@ static int migrate_vma_collect_hole(unsigned long
> start,
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +static bool migrate_vma_allow_p2p(struct migrate_vma *migrate,
> struct page *page)
> +{
> +	if (likely(!migrate->p2p))
> +		return false;
> +	return migrate->p2p->ops->p2p_allow(migrate->p2p, page);
> +}
> +
> =C2=A0static int migrate_vma_collect_pmd(pmd_t *pmdp,
> =C2=A0				=C2=A0=C2=A0 unsigned long start,
> =C2=A0				=C2=A0=C2=A0 unsigned long end,
> @@ -138,6 +145,11 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> =C2=A0			=C2=A0=C2=A0=C2=A0 page->pgmap->owner !=3D migrate-
> >pgmap_owner)
> =C2=A0				goto next;
> =C2=A0
> +			if (!(migrate->flags &
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MIGRATE_VMA_SELECT_DEVICE_P2P) ||
> +			=C2=A0=C2=A0=C2=A0 !migrate_vma_allow_p2p(migrate, page))
> +				goto next;
> +

And obviously some inverted logic here, sigh, but hopefully the intent
is clear..

/Thomas


> =C2=A0			mpfn =3D migrate_pfn(page_to_pfn(page)) |
> =C2=A0					MIGRATE_PFN_MIGRATE;
> =C2=A0			if (is_writable_device_private_entry(entry))

