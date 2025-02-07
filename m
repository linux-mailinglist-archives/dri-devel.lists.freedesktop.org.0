Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99625A2C049
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 11:15:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D705710EA93;
	Fri,  7 Feb 2025 10:15:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cf88tJrM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79CD410EA93;
 Fri,  7 Feb 2025 10:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738923345; x=1770459345;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Y5PlIehexw8c9uoDpoNQ0kDX4O4yzunv9aoov0CbdeQ=;
 b=cf88tJrMWDokl92L8LNuARpojMv0R3iYKObGyaXl1hSKlWQPB2W4Kmw1
 ++v0axxiHNRL1bb1GlZ5lC8PIyqUY3NTkaI5OfCHEXVvq4kLx5BTmVKYk
 4MXnpLj1CSzpb1HbrK36/9QETy2ShcDgSoosmZjpybq7AeRg2qh/eYQ3Z
 aa4Mbf67g7r6QqyLOtY+fx/gXayYKHOSPePmdStnCoPIiO2bnP+5Oq/8c
 /tm57uR001n7LGHDE14Zg0QMr9Lb4PLvM1F7SASd6GwAn7f5YjGdcwOEQ
 kYWuJ0qOVlfEzqfSkvnYWxDpGqkr9UHutYBk5pU3mfVe9XiA0zHI4zuu0 A==;
X-CSE-ConnectionGUID: DbdkHSCsRk23UvzfU1yaag==
X-CSE-MsgGUID: PaMWcWHWROaAyWIOJGFdXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="27167017"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="27167017"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 02:15:44 -0800
X-CSE-ConnectionGUID: 1mo+IbpTRqe8cP1t3nCOkQ==
X-CSE-MsgGUID: Dcbh6G4RTdqEMQeS5ldnqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="111685476"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO [10.245.246.108])
 ([10.245.246.108])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 02:15:41 -0800
Message-ID: <65ff860787898466ff56215962d118494358088d.camel@linux.intel.com>
Subject: Re: [PATCH v4 11/33] drm/xe: Nuke VM's mapping upon close
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Fri, 07 Feb 2025 11:15:38 +0100
In-Reply-To: <20250129195212.745731-12-matthew.brost@intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-12-matthew.brost@intel.com>
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
> Clear root PT entry and invalidate entire VM's address space when
> closing the VM. Will prevent the GPU from accessing any of the VM's
> memory after closing.
>=20
> v2:
> =C2=A0- s/vma/vm in kernel doc (CI)
> =C2=A0- Don't nuke migration VM as this occur at driver unload (CI)
> v3:
> =C2=A0- Rebase and pull into SVM series (Thomas)
> =C2=A0- Wait for pending binds (Thomas)
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 24
> +++++++++++++++++++++
> =C2=A0drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |=C2=A0 2 ++
> =C2=A0drivers/gpu/drm/xe/xe_pt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 14 ++++++=
++++++
> =C2=A0drivers/gpu/drm/xe/xe_pt.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +=
++
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 22 ++++++=
+++++++++++++
> =C2=A05 files changed, 65 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index 0a93831c0a02..1ef21ed01d1b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -410,6 +410,30 @@ int xe_gt_tlb_invalidation_range(struct xe_gt
> *gt,
> =C2=A0	return send_tlb_invalidation(&gt->uc.guc, fence, action,
> len);
> =C2=A0}
> =C2=A0
> +/**
> + * xe_gt_tlb_invalidation_vm - Issue a TLB invalidation on this GT
> for a VM
> + * @gt: graphics tile
> + * @vm: VM to invalidate
> + *
> + * Invalidate entire VM's address space
> + */
> +void xe_gt_tlb_invalidation_vm(struct xe_gt *gt, struct xe_vm *vm)
> +{
> +	struct xe_gt_tlb_invalidation_fence fence;
> +	u64 range =3D 1ull << vm->xe->info.va_bits;
> +	int ret;
> +
> +	xe_gt_tlb_invalidation_fence_init(gt, &fence, true);
> +
> +	ret =3D xe_gt_tlb_invalidation_range(gt, &fence, 0, range, vm-
> >usm.asid);
> +	if (ret < 0) {
> +		xe_gt_tlb_invalidation_fence_fini(&fence);
> +		return;
> +	}
> +
> +	xe_gt_tlb_invalidation_fence_wait(&fence);
> +}
> +
> =C2=A0/**
> =C2=A0 * xe_gt_tlb_invalidation_vma - Issue a TLB invalidation on this GT
> for a VMA
> =C2=A0 * @gt: GT structure
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> index 672acfcdf0d7..abe9b03d543e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> @@ -12,6 +12,7 @@
> =C2=A0
> =C2=A0struct xe_gt;
> =C2=A0struct xe_guc;
> +struct xe_vm;
> =C2=A0struct xe_vma;
> =C2=A0
> =C2=A0int xe_gt_tlb_invalidation_init_early(struct xe_gt *gt);
> @@ -21,6 +22,7 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt);
> =C2=A0int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_gt_tlb_invalidati=
on_fence
> *fence,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vma *vma);
> +void xe_gt_tlb_invalidation_vm(struct xe_gt *gt, struct xe_vm *vm);
> =C2=A0int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
> =C2=A0				 struct xe_gt_tlb_invalidation_fence
> *fence,
> =C2=A0				 u64 start, u64 end, u32 asid);
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 99b97bf37c05..c5060011ad43 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -214,6 +214,20 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags,
> struct llist_head *deferred)
> =C2=A0	xe_pt_free(pt);
> =C2=A0}
> =C2=A0
> +/**
> + * xe_pt_clear() - Clear a page-table.
> + * @xe: xe device.
> + * @pt: The page-table.
> + *
> + * Clears page-table by setting to zero.
> + */
> +void xe_pt_clear(struct xe_device *xe, struct xe_pt *pt)
> +{
> +	struct iosys_map *map =3D &pt->bo->vmap;
> +
> +	xe_map_memset(xe, map, 0, 0, SZ_4K);
> +}
> +
> =C2=A0/**
> =C2=A0 * DOC: Pagetable building
> =C2=A0 *
> diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
> index 9ab386431cad..8e43912ae8e9 100644
> --- a/drivers/gpu/drm/xe/xe_pt.h
> +++ b/drivers/gpu/drm/xe/xe_pt.h
> @@ -13,6 +13,7 @@ struct dma_fence;
> =C2=A0struct xe_bo;
> =C2=A0struct xe_device;
> =C2=A0struct xe_exec_queue;
> +struct xe_svm_range;
> =C2=A0struct xe_sync_entry;
> =C2=A0struct xe_tile;
> =C2=A0struct xe_vm;
> @@ -35,6 +36,8 @@ void xe_pt_populate_empty(struct xe_tile *tile,
> struct xe_vm *vm,
> =C2=A0
> =C2=A0void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head
> *deferred);
> =C2=A0
> +void xe_pt_clear(struct xe_device *xe, struct xe_pt *pt);
> +
> =C2=A0int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_op=
s
> *vops);
> =C2=A0struct dma_fence *xe_pt_update_ops_run(struct xe_tile *tile,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vma_ops *vops);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index bc34e6738c8c..82026c5a154d 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1537,8 +1537,30 @@ struct xe_vm *xe_vm_create(struct xe_device
> *xe, u32 flags)
> =C2=A0
> =C2=A0static void xe_vm_close(struct xe_vm *vm)
> =C2=A0{
> +	bool migration =3D (vm->flags & XE_VM_FLAG_MIGRATION);

Do we need a separate bool here? Only used in one place AFAICT.

Otherwise,
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>


> +
> =C2=A0	down_write(&vm->lock);
> +
> =C2=A0	vm->size =3D 0;
> +
> +	if (!migration) {
> +		struct xe_tile *tile;
> +		struct xe_gt *gt;
> +		u8 id;
> +
> +		/* Wait for pending binds */
> +		dma_resv_wait_timeout(xe_vm_resv(vm),
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DMA_RESV_USAGE_BOOKKEEP,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 false, MAX_SCHEDULE_TIMEOUT);
> +
> +		for_each_tile(tile, vm->xe, id)
> +			if (vm->pt_root[id])
> +				xe_pt_clear(vm->xe, vm-
> >pt_root[id]);
> +
> +		for_each_gt(gt, vm->xe, id)
> +			xe_gt_tlb_invalidation_vm(gt, vm);
> +	}
> +
> =C2=A0	up_write(&vm->lock);
> =C2=A0}
> =C2=A0

