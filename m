Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BB7A2C2F1
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 13:45:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3358410EB0C;
	Fri,  7 Feb 2025 12:45:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LgSHAG9f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6A8010EAF8;
 Fri,  7 Feb 2025 12:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738932184; x=1770468184;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=cpyEN6yvQCCk0QUlrfuzL95McqEvHciYdFWWeIN0d4w=;
 b=LgSHAG9fF/dKNyGUYTaHvxqA03KHnlZBAyAWuhRVxwlMs5f64pNiB1G0
 3joohVCXAunIOp0Ub/lE+7mBPUcxG0a7n2jwBQm1tUHoOmAyr/7N6afHw
 DqoZ3Mm9kxRH4nkPdAmjzTAaBjm+SqKxltv14nizldkndQ6xJes7UoHFL
 TrEJZ2u5caLVs6rB86kAoHN3eqzEwWa0g4E6Gd1W/YiVp+8vPfB4bnnUt
 kf8E8Pl4ezSKM6KmUGh7Ig3vHVcuf0+Yp01IgMQ125nOjeKtou6jHNHY6
 BUF550UAjc9bjzxZ/p5AwKE8m14NeOjI0gr0hOyNETqMrmg1QuNELwJHa A==;
X-CSE-ConnectionGUID: ssU8QaGNRzufjEzq6VFmJA==
X-CSE-MsgGUID: NwKFOr1iRAKwe6e3PqxXhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="56986183"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="56986183"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 04:43:04 -0800
X-CSE-ConnectionGUID: gxAf63iVS7igDW6UY17YoA==
X-CSE-MsgGUID: EinJezGrTqWLcZ16mr7HCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116130882"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO [10.245.246.108])
 ([10.245.246.108])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 04:43:01 -0800
Message-ID: <52cfa2ba17c5680cad8c3d462f93a76bd88bd232.camel@linux.intel.com>
Subject: Re: [PATCH v4 15/33] drm/xe: Add SVM garbage collector
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Fri, 07 Feb 2025 13:42:59 +0100
In-Reply-To: <20250129195212.745731-16-matthew.brost@intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-16-matthew.brost@intel.com>
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

On Wed, 2025-01-29 at 11:51 -0800, Matthew Brost wrote:
> Add basic SVM garbage collector which destroy a SVM range upon a MMU
> UNMAP event. The garbage collector runs on worker or in GPU fault
> handler and is required as locks in the path of reclaim are required
> and
> cannot be taken the notifier.
>=20
> v2:
> =C2=A0- Flush garbage collector in xe_svm_close
> v3:
> =C2=A0- Better commit message (Thomas)
> =C2=A0- Kernel doc (Thomas)
> =C2=A0- Use list_first_entry_or_null for garbage collector loop (Thomas)
> =C2=A0- Don't add to garbage collector if VM is closed (Thomas)
> v4:
> =C2=A0- Use %pe to print error (Thomas)
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_svm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 91
> +++++++++++++++++++++++++++++++-
> =C2=A0drivers/gpu/drm/xe/xe_svm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5=
 ++
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 4 ++
> =C2=A0drivers/gpu/drm/xe/xe_vm_types.h | 18 +++++++
> =C2=A04 files changed, 116 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_svm.c
> b/drivers/gpu/drm/xe/xe_svm.c
> index ace8c32f3428..3788196b2925 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -28,6 +28,7 @@ xe_svm_range_alloc(struct drm_gpusvm *gpusvm)
> =C2=A0	if (!range)
> =C2=A0		return ERR_PTR(-ENOMEM);
> =C2=A0
> +	INIT_LIST_HEAD(&range->garbage_collector_link);
> =C2=A0	xe_vm_get(gpusvm_to_vm(gpusvm));
> =C2=A0
> =C2=A0	return &range->base;
> @@ -44,6 +45,24 @@ static struct xe_svm_range *to_xe_range(struct
> drm_gpusvm_range *r)
> =C2=A0	return container_of(r, struct xe_svm_range, base);
> =C2=A0}
> =C2=A0
> +static void
> +xe_svm_garbage_collector_add_range(struct xe_vm *vm, struct
> xe_svm_range *range,
> +				=C2=A0=C2=A0 const struct mmu_notifier_range
> *mmu_range)
> +{
> +	struct xe_device *xe =3D vm->xe;
> +
> +	drm_gpusvm_range_set_unmapped(&range->base, mmu_range);
> +
> +	spin_lock(&vm->svm.garbage_collector.lock);
> +	if (list_empty(&range->garbage_collector_link))
> +		list_add_tail(&range->garbage_collector_link,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &vm-
> >svm.garbage_collector.range_list);
> +	spin_unlock(&vm->svm.garbage_collector.lock);
> +
> +	queue_work(xe_device_get_root_tile(xe)->primary_gt-
> >usm.pf_wq,
> +		=C2=A0=C2=A0 &vm->svm.garbage_collector.work);
> +}
> +
> =C2=A0static u8
> =C2=A0xe_svm_range_notifier_event_begin(struct xe_vm *vm, struct
> drm_gpusvm_range *r,
> =C2=A0				=C2=A0 const struct mmu_notifier_range
> *mmu_range,
> @@ -90,7 +109,9 @@ xe_svm_range_notifier_event_end(struct xe_vm *vm,
> struct drm_gpusvm_range *r,
> =C2=A0	xe_svm_assert_in_notifier(vm);
> =C2=A0
> =C2=A0	drm_gpusvm_range_unmap_pages(&vm->svm.gpusvm, r, &ctx);
> -	/* TODO: Add range to garbage collector if VM is not closed
> */
> +	if (!xe_vm_is_closed(vm) && mmu_range->event =3D=3D
> MMU_NOTIFY_UNMAP)
> +		xe_svm_garbage_collector_add_range(vm,
> to_xe_range(r),
> +						=C2=A0=C2=A0 mmu_range);
> =C2=A0}
> =C2=A0
> =C2=A0static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
> @@ -192,6 +213,63 @@ static void xe_svm_invalidate(struct drm_gpusvm
> *gpusvm,
> =C2=A0		xe_svm_range_notifier_event_end(vm, r, mmu_range);
> =C2=A0}
> =C2=A0
> +static int __xe_svm_garbage_collector(struct xe_vm *vm,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_svm_range *range)
> +{
> +	/* TODO: Do unbind */
> +
> +	drm_gpusvm_range_remove(&vm->svm.gpusvm, &range->base);
> +
> +	return 0;
> +}
> +
> +static int xe_svm_garbage_collector(struct xe_vm *vm)
> +{
> +	struct xe_svm_range *range;
> +	int err;
> +
> +	lockdep_assert_held_write(&vm->lock);
> +
> +	if (xe_vm_is_closed_or_banned(vm))
> +		return -ENOENT;
> +
> +	spin_lock(&vm->svm.garbage_collector.lock);
> +	for (;;) {
> +		range =3D list_first_entry_or_null(&vm-
> >svm.garbage_collector.range_list,
> +						 typeof(*range),
> +					=09
> garbage_collector_link);
> +		if (!range)
> +			break;
> +
> +		list_del(&range->garbage_collector_link);
> +		spin_unlock(&vm->svm.garbage_collector.lock);
> +
> +		err =3D __xe_svm_garbage_collector(vm, range);
> +		if (err) {
> +			drm_warn(&vm->xe->drm,
> +				 "Garbage collection failed: %pe\n",
> +				 ERR_PTR(err));
> +			xe_vm_kill(vm, true);
> +			return err;
> +		}
> +
> +		spin_lock(&vm->svm.garbage_collector.lock);
> +	}
> +	spin_unlock(&vm->svm.garbage_collector.lock);
> +
> +	return 0;
> +}
> +
> +static void xe_svm_garbage_collector_work_func(struct work_struct
> *w)
> +{
> +	struct xe_vm *vm =3D container_of(w, struct xe_vm,
> +					svm.garbage_collector.work);
> +
> +	down_write(&vm->lock);
> +	xe_svm_garbage_collector(vm);
> +	up_write(&vm->lock);
> +}
> +
> =C2=A0static const struct drm_gpusvm_ops gpusvm_ops =3D {
> =C2=A0	.range_alloc =3D xe_svm_range_alloc,
> =C2=A0	.range_free =3D xe_svm_range_free,
> @@ -216,6 +294,11 @@ int xe_svm_init(struct xe_vm *vm)
> =C2=A0{
> =C2=A0	int err;
> =C2=A0
> +	spin_lock_init(&vm->svm.garbage_collector.lock);
> +	INIT_LIST_HEAD(&vm->svm.garbage_collector.range_list);
> +	INIT_WORK(&vm->svm.garbage_collector.work,
> +		=C2=A0 xe_svm_garbage_collector_work_func);
> +
> =C2=A0	err =3D drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM", &vm->xe-
> >drm,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 current->mm, NULL, 0, vm->size,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SZ_512M, &gpusvm_ops,
> fault_chunk_sizes,
> @@ -237,6 +320,7 @@ int xe_svm_init(struct xe_vm *vm)
> =C2=A0void xe_svm_close(struct xe_vm *vm)
> =C2=A0{
> =C2=A0	xe_assert(vm->xe, xe_vm_is_closed(vm));
> +	flush_work(&vm->svm.garbage_collector.work);
> =C2=A0}
> =C2=A0
> =C2=A0/**
> @@ -286,7 +370,10 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> struct xe_vma *vma,
> =C2=A0	xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vma));
> =C2=A0
> =C2=A0retry:
> -	/* TODO: Run garbage collector */
> +	/* Always process UNMAPs first so view SVM ranges is current
> */
> +	err =3D xe_svm_garbage_collector(vm);
> +	if (err)
> +		return err;
> =C2=A0
> =C2=A0	r =3D drm_gpusvm_range_find_or_insert(&vm->svm.gpusvm,
> fault_addr,
> =C2=A0					=C2=A0=C2=A0=C2=A0 xe_vma_start(vma),
> xe_vma_end(vma),
> diff --git a/drivers/gpu/drm/xe/xe_svm.h
> b/drivers/gpu/drm/xe/xe_svm.h
> index 03341c8547d5..ef5bc4e919e8 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -19,6 +19,11 @@ struct xe_vma;
> =C2=A0struct xe_svm_range {
> =C2=A0	/** @base: base drm_gpusvm_range */
> =C2=A0	struct drm_gpusvm_range base;
> +	/**
> +	 * @garbage_collector_link: Link into VM's garbage collect
> SVM range
> +	 * list. Protected by VM's garbage collect lock.
> +	 */
> +	struct list_head garbage_collector_link;
> =C2=A0	/**
> =C2=A0	 * @tile_present: Tile mask of binding is present for this
> range.
> =C2=A0	 * Protected by GPU SVM notifier lock.
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 57083b75a602..bdc9b75e0aee 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3123,6 +3123,10 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> void *data, struct drm_file *file)
> =C2=A0		}
> =C2=A0	}
> =C2=A0
> +	/* Ensure all UNMAPs visable */

s/visable/visible/

With that,
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> +	if (xe_vm_in_fault_mode(vm))
> +		flush_work(&vm->svm.garbage_collector.work);
> +
> =C2=A0	err =3D down_write_killable(&vm->lock);
> =C2=A0	if (err)
> =C2=A0		goto put_exec_queue;
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> b/drivers/gpu/drm/xe/xe_vm_types.h
> index 983f724c911b..576316729249 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -146,6 +146,24 @@ struct xe_vm {
> =C2=A0	struct {
> =C2=A0		/** @svm.gpusvm: base GPUSVM used to track fault
> allocations */
> =C2=A0		struct drm_gpusvm gpusvm;
> +		/**
> +		 * @svm.garbage_collector: Garbage collector which
> is used unmap
> +		 * SVM range's GPU bindings and destroy the ranges.
> +		 */
> +		struct {
> +			/** @svm.garbage_collector.lock: Protect's
> range list */
> +			spinlock_t lock;
> +			/**
> +			 * @svm.garbage_collector.range_list: List
> of SVM ranges
> +			 * in the garbage collector.
> +			 */
> +			struct list_head range_list;
> +			/**
> +			 * @svm.garbage_collector.work: Worker which
> the
> +			 * garbage collector runs on.
> +			 */
> +			struct work_struct work;
> +		} garbage_collector;
> =C2=A0	} svm;
> =C2=A0
> =C2=A0	struct xe_device *xe;

