Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACB59A65AF
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 13:01:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B9D10E494;
	Mon, 21 Oct 2024 11:01:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iFzD/Joi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88BD110E491;
 Mon, 21 Oct 2024 11:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729508472; x=1761044472;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=jc42B55bk4vQT6zBfcZ8FwudMrXeyLuvZGrR9YUkF4Q=;
 b=iFzD/JoiCCV0xQTrSzwrcVK1O/zbCrhPycXFejmLutIT2tdBxfcDRve7
 yQaKYR2YYsuV36jt4pEZ8sF9QkREUcInDEPX46b8XWyTaK2f7fHSd3B5q
 yFYe874r95NxHH9K1n+NQFPnHhaEOua/aSTGq6+EweJTHBirTh8pukPJa
 EPKEtNdSDptfoVION0amIHrsbmtLxpvDfVmBrf3Oj4GDGAyKHJ4923VTv
 HbYwa/4skA2XroJdH9470WQKSyNzTZCljzCnjK3xrQz/6jYRTAe5hIf2y
 UPCxe+XRFDnxTwd1iAoTwxA3BFp/xlAq3tdxInB8o65Cbhuk1YKttL7+I w==;
X-CSE-ConnectionGUID: Sx3luQB6S+S43BkSUDsTYw==
X-CSE-MsgGUID: tQD8yJGWQxKc0VeGvJo2sQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29104770"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29104770"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 04:01:11 -0700
X-CSE-ConnectionGUID: nMdHKpc7QViGaC+eNLP5Mg==
X-CSE-MsgGUID: wRQf0nfmTmGcY5AziXGlRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="84095111"
Received: from carterle-desk.ger.corp.intel.com (HELO [10.245.246.239])
 ([10.245.246.239])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 04:01:09 -0700
Message-ID: <0e75325ea53f1bfe8a22af662c31c3620ddea58b.camel@linux.intel.com>
Subject: Re: [PATCH v3 3/6] drm/xe: Update xe_ttm_access_memory to use GPU
 for non-visible access
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Date: Mon, 21 Oct 2024 13:01:06 +0200
In-Reply-To: <4fc5fd25-dc7a-4e13-a6c1-adec1f20e5fc@intel.com>
References: <20241019192030.1505020-1-matthew.brost@intel.com>
 <20241019192030.1505020-4-matthew.brost@intel.com>
 <4fc5fd25-dc7a-4e13-a6c1-adec1f20e5fc@intel.com>
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

On Mon, 2024-10-21 at 11:15 +0100, Matthew Auld wrote:
> On 19/10/2024 20:20, Matthew Brost wrote:
> > Add migrate layer functions to access VRAM and update
> > xe_ttm_access_memory to use for non-visible access.
> >=20
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>=20
> I guess this needs some IGTs? In i915 I think we have test_ptrace()
> in=20
> gem_mmap_offset.c, which could maybe be ported or something similar?
>=20
> > ---
> > =C2=A0 drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 18 ++-
> > =C2=A0 drivers/gpu/drm/xe/xe_migrate.c | 267
> > ++++++++++++++++++++++++++++++++
> > =C2=A0 drivers/gpu/drm/xe/xe_migrate.h |=C2=A0=C2=A0 4 +
> > =C2=A0 3 files changed, 285 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > b/drivers/gpu/drm/xe/xe_bo.c
> > index 99557af16120..0a7b91df69c2 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -1133,13 +1133,22 @@ static int xe_ttm_access_memory(struct
> > ttm_buffer_object *ttm_bo,
> > =C2=A0=C2=A0	if (!mem_type_is_vram(ttm_bo->resource->mem_type))
> > =C2=A0=C2=A0		return -EIO;
> > =C2=A0=20
> > -	/* FIXME: Use GPU for non-visible VRAM */
> > -	if (!xe_ttm_resource_visible(ttm_bo->resource))
> > -		return -EIO;
> > -
> > =C2=A0=C2=A0	if (!xe_pm_runtime_get_if_in_use(xe))
> > =C2=A0=C2=A0		return -EIO;

I think we should be able to use a xe_pm_runtime_get() outside the bo
lock to avoid failing, right? That would require ttm_bo_vm_access() to
be used as a helper from within a xe_bo_vm_access(), though and the
above called replaced by xe_pm_runtime_get_noresume().

Is this called ever called from reclaim or dma-fence signalling?

/Thomas

> > =C2=A0=20
> > +	if (!xe_ttm_resource_visible(ttm_bo->resource) || len >=3D
> > SZ_16K) {
>=20
> I guess commit message/title should be updated to mention that this
> also=20
> used for large accesses?
>=20
> > +		struct xe_migrate *migrate =3D
> > +			mem_type_to_migrate(xe, ttm_bo->resource-
> > >mem_type);
> > +		int err;
> > +
> > +		err =3D xe_migrate_access_memory(migrate, bo,
> > offset, buf, len,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write);
> > +		if (err)
> > +			return err;
>=20
> Looks to be leaking the rpm ref here?
>=20
> > +
> > +		goto out;
> > +	}
> > +
> > =C2=A0=C2=A0	vram =3D res_to_mem_region(ttm_bo->resource);
> > =C2=A0=C2=A0	xe_res_first(ttm_bo->resource, offset & PAGE_MASK, bo-
> > >size, &cursor);
> > =C2=A0=20
> > @@ -1161,6 +1170,7 @@ static int xe_ttm_access_memory(struct
> > ttm_buffer_object *ttm_bo,
> > =C2=A0=C2=A0			xe_res_next(&cursor, PAGE_SIZE);
> > =C2=A0=C2=A0	} while (bytes_left);
> > =C2=A0=20
> > +out:
> > =C2=A0=C2=A0	xe_pm_runtime_put(xe);
> > =C2=A0=20
> > =C2=A0=C2=A0	return len;
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > b/drivers/gpu/drm/xe/xe_migrate.c
> > index cfd31ae49cc1..ccdca1f79bb2 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -1542,6 +1542,273 @@ void xe_migrate_wait(struct xe_migrate *m)
> > =C2=A0=C2=A0		dma_fence_wait(m->fence, false);
> > =C2=A0 }
> > =C2=A0=20
> > +static u32 pte_update_cmd_size(u64 size)
> > +{
> > +	u32 dword;
> > +	u64 entries =3D DIV_ROUND_UP(size, XE_PAGE_SIZE);
> > +
> > +	XE_WARN_ON(size > MAX_PREEMPTDISABLE_TRANSFER);
> > +	/*
> > +	 * MI_STORE_DATA_IMM command is used to update page table.
> > Each
> > +	 * instruction can update maximumly 0x1ff pte entries. To
> > update
> > +	 * n (n <=3D 0x1ff) pte entries, we need:
> > +	 * 1 dword for the MI_STORE_DATA_IMM command header
> > (opcode etc)
> > +	 * 2 dword for the page table's physical location
> > +	 * 2*n dword for value of pte to fill (each pte entry is 2
> > dwords)
> > +	 */
> > +	dword =3D (1 + 2) * DIV_ROUND_UP(entries, 0x1ff);
> > +	dword +=3D entries * 2;
> > +
> > +	return dword;
> > +}
> > +
> > +static void build_pt_update_batch_sram(struct xe_migrate *m,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_bb *bb, u32
> > pt_offset,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_addr_t *sram_addr, u32
> > size)
> > +{
> > +	u16 pat_index =3D tile_to_xe(m->tile)->pat.idx[XE_CACHE_WB];
> > +	u32 ptes;
> > +	int i =3D 0;
> > +
> > +	ptes =3D DIV_ROUND_UP(size, XE_PAGE_SIZE);
> > +	while (ptes) {
> > +		u32 chunk =3D min(0x1ffU, ptes);
> > +
> > +		bb->cs[bb->len++] =3D MI_STORE_DATA_IMM |
> > MI_SDI_NUM_QW(chunk);
> > +		bb->cs[bb->len++] =3D pt_offset;
> > +		bb->cs[bb->len++] =3D 0;
> > +
> > +		pt_offset +=3D chunk * 8;
> > +		ptes -=3D chunk;
> > +
> > +		while (chunk--) {
> > +			u64 addr =3D sram_addr[i++] & PAGE_MASK;
> > +
> > +			xe_tile_assert(m->tile, addr);
> > +			addr =3D m->q->vm->pt_ops-
> > >pte_encode_addr(m->tile->xe,
> > +							=09
> > addr, pat_index,
> > +							=09
> > 0, false, 0);
> > +			bb->cs[bb->len++] =3D lower_32_bits(addr);
> > +			bb->cs[bb->len++] =3D upper_32_bits(addr);
> > +		}
> > +	}
> > +}
> > +
> > +enum xe_migrate_copy_dir {
> > +	XE_MIGRATE_COPY_TO_VRAM,
> > +	XE_MIGRATE_COPY_TO_SRAM,
> > +};
> > +
> > +static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
> > +					 unsigned long len,
> > +					 unsigned long
> > sram_offset,
> > +					 dma_addr_t *sram_addr,
> > u64 vram_addr,
> > +					 const enum
> > xe_migrate_copy_dir dir)
> > +{
> > +	struct xe_gt *gt =3D m->tile->primary_gt;
> > +	struct xe_device *xe =3D gt_to_xe(gt);
> > +	struct dma_fence *fence =3D NULL;
> > +	u32 batch_size =3D 2;
> > +	u64 src_L0_ofs, dst_L0_ofs;
> > +	struct xe_sched_job *job;
> > +	struct xe_bb *bb;
> > +	u32 update_idx, pt_slot =3D 0;
> > +	unsigned long npages =3D DIV_ROUND_UP(len + sram_offset,
> > PAGE_SIZE);
> > +	int err;
> > +
> > +	xe_assert(xe, npages * PAGE_SIZE <=3D
> > MAX_PREEMPTDISABLE_TRANSFER);
> > +
> > +	batch_size +=3D pte_update_cmd_size(len);
> > +	batch_size +=3D EMIT_COPY_DW;
> > +
> > +	bb =3D xe_bb_new(gt, batch_size, true);
> > +	if (IS_ERR(bb)) {
> > +		err =3D PTR_ERR(bb);
> > +		return ERR_PTR(err);
> > +	}
> > +
> > +	build_pt_update_batch_sram(m, bb, pt_slot * XE_PAGE_SIZE,
> > +				=C2=A0=C2=A0 sram_addr, len + sram_offset);
> > +
> > +	if (dir =3D=3D XE_MIGRATE_COPY_TO_VRAM) {
> > +		src_L0_ofs =3D xe_migrate_vm_addr(pt_slot, 0) +
> > sram_offset;
> > +		dst_L0_ofs =3D xe_migrate_vram_ofs(xe, vram_addr,
> > false);
> > +
> > +	} else {
> > +		src_L0_ofs =3D xe_migrate_vram_ofs(xe, vram_addr,
> > false);
> > +		dst_L0_ofs =3D xe_migrate_vm_addr(pt_slot, 0) +
> > sram_offset;
> > +	}
> > +
> > +	bb->cs[bb->len++] =3D MI_BATCH_BUFFER_END;
> > +	update_idx =3D bb->len;
> > +
> > +	emit_copy(gt, bb, src_L0_ofs, dst_L0_ofs, len,
> > XE_PAGE_SIZE);
> > +
> > +	job =3D xe_bb_create_migration_job(m->q, bb,
> > +					 xe_migrate_batch_base(m,
> > true),
> > +					 update_idx);
> > +	if (IS_ERR(job)) {
> > +		err =3D PTR_ERR(job);
> > +		goto err;
> > +	}
> > +
> > +	xe_sched_job_add_migrate_flush(job, 0);
> > +
> > +	mutex_lock(&m->job_mutex);
> > +	xe_sched_job_arm(job);
> > +	fence =3D dma_fence_get(&job->drm.s_fence->finished);
> > +	xe_sched_job_push(job);
> > +
> > +	dma_fence_put(m->fence);
> > +	m->fence =3D dma_fence_get(fence);
> > +	mutex_unlock(&m->job_mutex);
> > +
> > +	xe_bb_free(bb, fence);
> > +
> > +	return fence;
> > +
> > +err:
> > +	xe_bb_free(bb, NULL);
> > +
> > +	return ERR_PTR(err);
> > +}
> > +
> > +static void xe_migrate_dma_unmap(struct xe_device *xe, dma_addr_t
> > *dma_addr,
> > +				 int len, int write)
> > +{
> > +	unsigned long i, npages =3D DIV_ROUND_UP(len, PAGE_SIZE);
> > +
> > +	for (i =3D 0; i < npages; ++i) {
> > +		if (!dma_addr[i])
> > +			continue;
> > +
> > +		dma_unmap_page(xe->drm.dev, dma_addr[i],
> > PAGE_SIZE,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write ? DMA_TO_DEVICE :
> > DMA_FROM_DEVICE);
> > +	}
> > +	kfree(dma_addr);
> > +}
> > +
> > +static dma_addr_t *xe_migrate_dma_map(struct xe_device *xe,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *buf, int len, int
> > write)
> > +{
> > +	dma_addr_t *dma_addr;
> > +	unsigned long i, npages =3D DIV_ROUND_UP(len, PAGE_SIZE);
> > +
> > +	dma_addr =3D kcalloc(npages, sizeof(*dma_addr), GFP_KERNEL);
> > +	if (!dma_addr)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	for (i =3D 0; i < npages; ++i) {
> > +		dma_addr_t addr;
> > +		struct page *page;
> > +
> > +		if (is_vmalloc_addr(buf))
> > +			page =3D vmalloc_to_page(buf);
> > +		else
> > +			page =3D virt_to_page(buf);
> > +
> > +		addr =3D dma_map_page(xe->drm.dev,
> > +				=C2=A0=C2=A0=C2=A0 page, 0, PAGE_SIZE,
> > +				=C2=A0=C2=A0=C2=A0 write ? DMA_TO_DEVICE :
> > +				=C2=A0=C2=A0=C2=A0 DMA_FROM_DEVICE);
> > +		if (dma_mapping_error(xe->drm.dev, addr))
> > +			goto err_fault;
> > +
> > +		dma_addr[i] =3D addr;
> > +		buf +=3D PAGE_SIZE;
> > +	}
> > +
> > +	return dma_addr;
> > +
> > +err_fault:
> > +	xe_migrate_dma_unmap(xe, dma_addr, len, write);
> > +	return ERR_PTR(-EFAULT);
> > +}
> > +
> > +/**
> > + * xe_migrate_access_memory - Access memory of a BO via GPU
> > + *
> > + * @m: The migration context.
> > + * @bo: buffer object
> > + * @offset: access offset into buffer object
> > + * @buf: pointer to caller memory to read into or write from
> > + * @len: length of access
> > + * @write: write access
> > + *
> > + * Access memory of a BO via GPU either reading in or writing from
> > a passed in
> > + * pointer. Pointer is dma mapped for GPU access and GPU commands
> > are issued to
> > + * read to or write from pointer.
> > + *
> > + * Returns:
> > + * 0 if successful, negative error code on failure.
> > + */
> > +int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo
> > *bo,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long offset, void *buf, int
> > len,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0 int write)
> > +{
> > +	struct xe_tile *tile =3D m->tile;
> > +	struct xe_device *xe =3D tile_to_xe(tile);
> > +	struct xe_res_cursor cursor;
> > +	struct dma_fence *fence =3D NULL;
> > +	dma_addr_t *dma_addr;
> > +	unsigned long page_offset =3D (unsigned long)buf &
> > ~PAGE_MASK;
> > +	int bytes_left =3D len, current_page =3D 0;
> > +
> > +	xe_bo_assert_held(bo);
> > +
> > +	dma_addr =3D xe_migrate_dma_map(xe, buf, len + page_offset,
> > write);
> > +	if (IS_ERR(dma_addr))
> > +		return PTR_ERR(dma_addr);
> > +
> > +	xe_res_first(bo->ttm.resource, offset, bo->size, &cursor);
> > +
> > +	do {
> > +		struct dma_fence *__fence;
> > +		u64 vram_addr =3D vram_region_gpu_offset(bo-
> > >ttm.resource) +
> > +			cursor.start;
> > +		int current_bytes;
> > +
> > +		if (cursor.size > MAX_PREEMPTDISABLE_TRANSFER)
> > +			current_bytes =3D min_t(int, bytes_left,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > MAX_PREEMPTDISABLE_TRANSFER);
> > +		else
> > +			current_bytes =3D min_t(int, bytes_left,
> > cursor.size);
> > +
> > +		if (fence)
> > +			dma_fence_put(fence);
> > +
> > +		__fence =3D xe_migrate_vram(m, current_bytes,
> > +					=C2=A0 (unsigned long)buf &
> > ~PAGE_MASK,
> > +					=C2=A0 dma_addr + current_page,
> > +					=C2=A0 vram_addr, write ?
> > +					=C2=A0 XE_MIGRATE_COPY_TO_VRAM
> > :
> > +					=C2=A0
> > XE_MIGRATE_COPY_TO_SRAM);
> > +		if (IS_ERR(__fence)) {
> > +			if (fence)
> > +				dma_fence_wait(fence, false);
> > +			fence =3D __fence;
> > +			goto out_err;
> > +		}
> > +		fence =3D __fence;
> > +
> > +		buf +=3D current_bytes;
> > +		offset +=3D current_bytes;
> > +		current_page +=3D DIV_ROUND_UP(current_bytes,
> > PAGE_SIZE);
> > +		bytes_left -=3D current_bytes;
> > +		if (bytes_left)
> > +			xe_res_next(&cursor, current_bytes);
> > +	} while (bytes_left);
> > +
> > +	dma_fence_wait(fence, false);
> > +	xe_migrate_dma_unmap(xe, dma_addr, len + page_offset,
> > write);
> > +
> > +	return 0;
> > +
> > +out_err:
> > +	xe_migrate_dma_unmap(xe, dma_addr, len + page_offset,
> > write);
> > +	return PTR_ERR(fence);
> > +}
> > +
> > =C2=A0 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> > =C2=A0 #include "tests/xe_migrate.c"
> > =C2=A0 #endif
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.h
> > b/drivers/gpu/drm/xe/xe_migrate.h
> > index 0109866e398a..94197d262178 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.h
> > +++ b/drivers/gpu/drm/xe/xe_migrate.h
> > @@ -102,6 +102,10 @@ struct dma_fence *xe_migrate_copy(struct
> > xe_migrate *m,
> > =C2=A0=C2=A0				=C2=A0 struct ttm_resource *dst,
> > =C2=A0=C2=A0				=C2=A0 bool copy_only_ccs);
> > =C2=A0=20
> > +int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo
> > *bo,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long offset, void *buf, int
> > len,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0 int write);
> > +
> > =C2=A0 #define XE_MIGRATE_CLEAR_FLAG_BO_DATA		BIT(0)
> > =C2=A0 #define XE_MIGRATE_CLEAR_FLAG_CCS_DATA		BIT(1)
> > =C2=A0 #define
> > XE_MIGRATE_CLEAR_FLAG_FULL	(XE_MIGRATE_CLEAR_FLAG_BO_DATA | \

