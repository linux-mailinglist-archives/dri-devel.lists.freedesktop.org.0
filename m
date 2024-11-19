Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BBE9D2B6D
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 17:45:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE1910E0AC;
	Tue, 19 Nov 2024 16:45:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eko5B2uT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AF8A10E0AC;
 Tue, 19 Nov 2024 16:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732034736; x=1763570736;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Fv4CsSbZlh6RdO5/ekYTEaAPl2I7QkPd1nCiZA9ZdQ4=;
 b=eko5B2uT7t0+U/8+NyYptS+lAx0Ca37hbDHxtl4uxdI47HGmJo4/XAvh
 eC9RFOx5bWuRC/9XwPHN9++HJkb6HOOf/dA5dNpW8Bq+EYbsnJ/uXwnLg
 WQAhQxSAWrhSo8NLXUVUavYGQjLvB/fWbiiJPrsYst8jYXZvKKK9qdci/
 ONVd9++jXF5UBpdTGCteH9KwiEqHYgF7j660dlX6gBhmh9jX+3tFyLb/l
 42oLYq4+vXC90zUDMs0XVPf42PBrY9KUqAwL3W0p+mWlRrzwImSNwH9lV
 S5StQaL+8HvTF256ZQZCDDX0NB+5/nU+1q+I/KGd+5b7ypsAI7IrdpFsB g==;
X-CSE-ConnectionGUID: MMqtO/SjTnmJsyxkv+lhSw==
X-CSE-MsgGUID: XM1ikTXnRdyDy3GSWdra1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="43452223"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="43452223"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 08:45:36 -0800
X-CSE-ConnectionGUID: Cv1jKe80RCWzs3zPnFYfKw==
X-CSE-MsgGUID: XuOL0uI9TdSloeUUQLGMUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="94543498"
Received: from smoticic-mobl.ger.corp.intel.com (HELO [10.245.246.223])
 ([10.245.246.223])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 08:45:31 -0800
Message-ID: <ffaf905b4c8b6c408e036ea69dd7cbb51735619b.camel@linux.intel.com>
Subject: Re: [PATCH v2 16/29] drm/xe: Add migrate layer functions for SVM
 support
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Tue, 19 Nov 2024 17:45:27 +0100
In-Reply-To: <20241016032518.539495-17-matthew.brost@intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-17-matthew.brost@intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-3.fc39) 
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

On Tue, 2024-10-15 at 20:25 -0700, Matthew Brost wrote:
> Add functions which migrate to / from VRAM accepting a single DPA
> argument (VRAM) and array of dma addresses (SRAM).
>=20
> v2:
> =C2=A0- Don't unlock job_mutex in error path of xe_migrate_vram
>=20
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_migrate.c | 149
> ++++++++++++++++++++++++++++++++
> =C2=A0drivers/gpu/drm/xe/xe_migrate.h |=C2=A0 10 +++
> =C2=A02 files changed, 159 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> b/drivers/gpu/drm/xe/xe_migrate.c
> index cfd31ae49cc1..d7b6636286ae 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1542,6 +1542,155 @@ void xe_migrate_wait(struct xe_migrate *m)
> =C2=A0		dma_fence_wait(m->fence, false);
> =C2=A0}
> =C2=A0
> +static u32 pte_update_cmd_size(u64 size)
> +{
> +	u32 dword;

dwords or num_dword?

> +	u64 entries =3D DIV_ROUND_UP(size, XE_PAGE_SIZE);
> +
> +	XE_WARN_ON(size > MAX_PREEMPTDISABLE_TRANSFER);
> +	/*
> +	 * MI_STORE_DATA_IMM command is used to update page table.
> Each
> +	 * instruction can update maximumly 0x1ff pte entries. To
> update
> +	 * n (n <=3D 0x1ff) pte entries, we need:
> +	 * 1 dword for the MI_STORE_DATA_IMM command header (opcode
> etc)
> +	 * 2 dword for the page table's physical location
> +	 * 2*n dword for value of pte to fill (each pte entry is 2
> dwords)
> +	 */
> +	dword =3D (1 + 2) * DIV_ROUND_UP(entries, 0x1ff);
> +	dword +=3D entries * 2;
> +
> +	return dword;
> +}
> +
> +static void build_pt_update_batch_sram(struct xe_migrate *m,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_bb *bb, u32
> pt_offset,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_addr_t *sram_addr, u32
> size)
> +{
> +	u16 pat_index =3D tile_to_xe(m->tile)->pat.idx[XE_CACHE_WB];
> +	u32 ptes;
> +	int i =3D 0;
> +
> +	ptes =3D DIV_ROUND_UP(size, XE_PAGE_SIZE);
> +	while (ptes) {
> +		u32 chunk =3D min(0x1ffU, ptes);
> +
> +		bb->cs[bb->len++] =3D MI_STORE_DATA_IMM |
> MI_SDI_NUM_QW(chunk);
> +		bb->cs[bb->len++] =3D pt_offset;
> +		bb->cs[bb->len++] =3D 0;
> +
> +		pt_offset +=3D chunk * 8;
> +		ptes -=3D chunk;
> +
> +		while (chunk--) {
> +			u64 addr =3D sram_addr[i++] & PAGE_MASK;
> +
> +			xe_tile_assert(m->tile, addr);
> +			addr =3D m->q->vm->pt_ops->pte_encode_addr(m-
> >tile->xe,
> +							=09
> addr, pat_index,
> +								 0,
> false, 0);
> +			bb->cs[bb->len++] =3D lower_32_bits(addr);
> +			bb->cs[bb->len++] =3D upper_32_bits(addr);
> +		}
> +	}
> +}
> +
> +enum xe_migrate_copy_dir {
> +	XE_MIGRATE_COPY_TO_VRAM,
> +	XE_MIGRATE_COPY_TO_SRAM,
> +};
> +
> +static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
> +					 unsigned long npages,
> +					 dma_addr_t *sram_addr, u64
> vram_addr,
> +					 const enum
> xe_migrate_copy_dir dir)
> +{
> +	struct xe_gt *gt =3D m->tile->primary_gt;
> +	struct xe_device *xe =3D gt_to_xe(gt);
> +	struct dma_fence *fence =3D NULL;
> +	u32 batch_size =3D 2;
> +	u64 src_L0_ofs, dst_L0_ofs;
> +	u64 round_update_size;
> +	struct xe_sched_job *job;
> +	struct xe_bb *bb;
> +	u32 update_idx, pt_slot =3D 0;
> +	int err;
> +
> +	round_update_size =3D min_t(u64, npages * PAGE_SIZE,
> +				=C2=A0 MAX_PREEMPTDISABLE_TRANSFER);

Hm. How does the caller know how many pages were actually migrated?

> +	batch_size +=3D pte_update_cmd_size(round_update_size);
> +	batch_size +=3D EMIT_COPY_DW;
> +
> +	bb =3D xe_bb_new(gt, batch_size, true);
> +	if (IS_ERR(bb)) {
> +		err =3D PTR_ERR(bb);
> +		return ERR_PTR(err);
> +	}
> +
> +	build_pt_update_batch_sram(m, bb, pt_slot * XE_PAGE_SIZE,
> +				=C2=A0=C2=A0 sram_addr, round_update_size);
> +
> +	if (dir =3D=3D XE_MIGRATE_COPY_TO_VRAM) {
> +		src_L0_ofs =3D xe_migrate_vm_addr(pt_slot, 0);
> +		dst_L0_ofs =3D xe_migrate_vram_ofs(xe, vram_addr,
> false);
> +
> +	} else {
> +		src_L0_ofs =3D xe_migrate_vram_ofs(xe, vram_addr,
> false);
> +		dst_L0_ofs =3D xe_migrate_vm_addr(pt_slot, 0);
> +	}
> +
> +	bb->cs[bb->len++] =3D MI_BATCH_BUFFER_END;
> +	update_idx =3D bb->len;
> +
> +	emit_copy(gt, bb, src_L0_ofs, dst_L0_ofs, round_update_size,
> +		=C2=A0 XE_PAGE_SIZE);
> +
> +	job =3D xe_bb_create_migration_job(m->q, bb,
> +					 xe_migrate_batch_base(m,
> true),
> +					 update_idx);
> +	if (IS_ERR(job)) {
> +		err =3D PTR_ERR(job);
> +		goto err;
> +	}
> +
> +	xe_sched_job_add_migrate_flush(job, 0);
> +
> +	mutex_lock(&m->job_mutex);
> +	xe_sched_job_arm(job);
> +	fence =3D dma_fence_get(&job->drm.s_fence->finished);
> +	xe_sched_job_push(job);
> +
> +	dma_fence_put(m->fence);
> +	m->fence =3D dma_fence_get(fence);
> +	mutex_unlock(&m->job_mutex);
> +
> +	xe_bb_free(bb, fence);
> +
> +	return fence;
> +
> +err:
> +	xe_bb_free(bb, NULL);
> +
> +	return ERR_PTR(err);
> +}
> +
> +struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long npages,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 dma_addr_t *src_addr,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 u64 dst_addr)

Kerneldoc.

> +{
> +	return xe_migrate_vram(m, npages, src_addr, dst_addr,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XE_MIGRATE_COPY_TO_VRAM);
> +}
> +
> +struct dma_fence *xe_migrate_from_vram(struct xe_migrate *m,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long npages,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 src_addr,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_addr_t *dst_addr)

Kerneldoc.

> +{
> +	return xe_migrate_vram(m, npages, dst_addr, src_addr,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XE_MIGRATE_COPY_TO_SRAM);
> +}
> +
> =C2=A0#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> =C2=A0#include "tests/xe_migrate.c"
> =C2=A0#endif
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h
> b/drivers/gpu/drm/xe/xe_migrate.h
> index 0109866e398a..6ff9a963425c 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -95,6 +95,16 @@ struct xe_migrate_pt_update {
> =C2=A0
> =C2=A0struct xe_migrate *xe_migrate_init(struct xe_tile *tile);
> =C2=A0
> +struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long npages,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 dma_addr_t *src_addr,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 u64 dst_addr);
> +
> +struct dma_fence *xe_migrate_from_vram(struct xe_migrate *m,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long npages,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 src_addr,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_addr_t *dst_addr);
> +
> =C2=A0struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
> =C2=A0				=C2=A0 struct xe_bo *src_bo,
> =C2=A0				=C2=A0 struct xe_bo *dst_bo,

