Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA8CA2C344
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 14:08:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 873C410E190;
	Fri,  7 Feb 2025 13:08:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B9/FhedQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0B9210E25F;
 Fri,  7 Feb 2025 13:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738933655; x=1770469655;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=oFj9uP98gMgAuTlRAd1gmVyl42n88oMP9RqV00H5o0g=;
 b=B9/FhedQInVEe8m4bTW+X2QWARb/ekPDJFjZifF4gLyJcoE7EMXZfn+n
 Alz9uRPHfJv0I84FRZe83ZYiUPAw4JkBxWKO6DSHYdUafAJKMc3lX21GY
 GCIoGiuBYPYjFylQjdQAVQyhtySyclo7DV9dRfuTxAUandtSVScQhZdvV
 AmCvyWQPV6qgcfkhtosxLH0f5XUsvC+QYJTiMnkv1CtJm++3gomEr+79a
 K6pBUQiUnvASPD9oxcYFwBJvYvfSoX2aTLhRRjgrzV35b7BOdpudvxLni
 1i44CBgJtkHrdKS7+MOHJ2resDIfvbKHEPNP9yEpuG7Te2r6xbbCZQmto Q==;
X-CSE-ConnectionGUID: 01mad80hQzqQJo4DT9SH6Q==
X-CSE-MsgGUID: 40DkxX9SRQiV+gA41Fy37Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="64930317"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="64930317"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 05:07:34 -0800
X-CSE-ConnectionGUID: lP30IbwhS02OuxkY4yUgjQ==
X-CSE-MsgGUID: klVQRnNySSWaM7fvSAFiBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="111729990"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO [10.245.246.108])
 ([10.245.246.108])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 05:07:32 -0800
Message-ID: <014ae51eafa8ca5fbea2948ee823d9a6842fbb71.camel@linux.intel.com>
Subject: Re: [PATCH v4 20/33] drm/xe: Add migrate layer functions for SVM
 support
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Fri, 07 Feb 2025 14:07:29 +0100
In-Reply-To: <20250129195212.745731-21-matthew.brost@intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-21-matthew.brost@intel.com>
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
> Add functions which migrate to / from VRAM accepting a single DPA
> argument (VRAM) and array of dma addresses (SRAM). Used for SVM
> migrations.
>=20
> v2:
> =C2=A0- Don't unlock job_mutex in error path of xe_migrate_vram
> v3:
> =C2=A0- Kernel doc (Thomas)
> =C2=A0- Better commit message (Thomas)
> =C2=A0- s/dword/num_dword (Thomas)
> =C2=A0- Return error to large of migration (Thomas)
>=20
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>


> ---
> =C2=A0drivers/gpu/drm/xe/xe_migrate.c | 175
> ++++++++++++++++++++++++++++++++
> =C2=A0drivers/gpu/drm/xe/xe_migrate.h |=C2=A0 10 ++
> =C2=A02 files changed, 185 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> b/drivers/gpu/drm/xe/xe_migrate.c
> index 278bc96cf593..df4282c71bf0 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1544,6 +1544,181 @@ void xe_migrate_wait(struct xe_migrate *m)
> =C2=A0		dma_fence_wait(m->fence, false);
> =C2=A0}
> =C2=A0
> +static u32 pte_update_cmd_size(u64 size)
> +{
> +	u32 num_dword;
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
> +	num_dword =3D (1 + 2) * DIV_ROUND_UP(entries, 0x1ff);
> +	num_dword +=3D entries * 2;
> +
> +	return num_dword;
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
> +	if (npages * PAGE_SIZE > MAX_PREEMPTDISABLE_TRANSFER)
> +		return ERR_PTR(-EINVAL);
> +
> +	round_update_size =3D npages * PAGE_SIZE;
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
> +/**
> + * xe_migrate_to_vram() - Migrate to VRAM
> + * @m: The migration context.
> + * @npages: Number of pages to migrate.
> + * @src_addr: Array of dma addresses (source of migrate)
> + * @dst_addr: Device physical address of VRAM (destination of
> migrate)
> + *
> + * Copy from an array dma addresses to a VRAM device physical
> address
> + *
> + * Return: dma fence for migrate to signal completion on succees,
> ERR_PTR on
> + * failure
> + */
> +struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long npages,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 dma_addr_t *src_addr,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 u64 dst_addr)
> +{
> +	return xe_migrate_vram(m, npages, src_addr, dst_addr,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XE_MIGRATE_COPY_TO_VRAM);
> +}
> +
> +/**
> + * xe_migrate_from_vram() - Migrate from VRAM
> + * @m: The migration context.
> + * @npages: Number of pages to migrate.
> + * @src_addr: Device physical address of VRAM (source of migrate)
> + * @dst_addr: Array of dma addresses (destination of migrate)
> + *
> + * Copy from a VRAM device physical address to an array dma
> addresses
> + *
> + * Return: dma fence for migrate to signal completion on succees,
> ERR_PTR on
> + * failure
> + */
> +struct dma_fence *xe_migrate_from_vram(struct xe_migrate *m,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long npages,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 src_addr,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_addr_t *dst_addr)
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

