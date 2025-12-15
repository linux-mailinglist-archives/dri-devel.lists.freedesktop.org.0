Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD42CBCF75
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 09:34:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C46910E24A;
	Mon, 15 Dec 2025 08:34:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="B88YyYkF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44F2810E24A
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 08:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1765787641;
 bh=gTC1bFM4EKT1kOZaWDUIQhSBZVbeo+T3uFse0zpjFcQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=B88YyYkFG//VXyq8fw1ow7RjJl07VVj1LT77QLfGfH2e0/OZFzdyPJYNveU2k8q//
 1SKD3GY82Mx09+gwwK9pjkgy+jBux+efUgBKxVkfN9NWMfaxXkB4j9iS9/NzRj8FRZ
 WU5A23drucbBXooUikygxLd3D5cgtjazYuyF9UG4P9XB2UmjVgWfTKDJR1qRQulvg2
 2JEZNj3ySf5Uk59pXhb/D+F3HE2j+0DFE7/LX4uQAuHSAA64mL6jdHltuLSopNUS7k
 cD1D2ye5N8CwvKpkZJzeD+QygwdhIvna/HRME0v7CzyjmTsdCh+qZw6dsSePY7rZk+
 /ZWkSdiVBtdPQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 62D7917E127C;
 Mon, 15 Dec 2025 09:34:01 +0100 (CET)
Date: Mon, 15 Dec 2025 09:33:57 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Steven
 Price <steven.price@arm.com>, kernel@collabora.com, Liviu Dudau
 <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v4 1/1] drm/panthor: Support partial unmaps of huge pages
Message-ID: <20251215093357.45c1a38f@fedora>
In-Reply-To: <20251214202426.3186811-2-adrian.larumbe@collabora.com>
References: <20251214202426.3186811-1-adrian.larumbe@collabora.com>
 <20251214202426.3186811-2-adrian.larumbe@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Sun, 14 Dec 2025 20:24:25 +0000
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Commit 33729a5fc0ca ("iommu/io-pgtable-arm: Remove split on unmap
> behavior") did away with the treatment of partial unmaps of huge IOPTEs.
>=20
> In the case of Panthor, that means an attempt to run a VM_BIND unmap
> operation on a memory region whose start address and size aren't 2MiB
> aligned, in the event it intersects with a huge page, would lead to ARM
> IOMMU management code to fail and a warning being raised.
>=20
> Presently, and for lack of a better alternative, it's best to have
> Panthor handle partial unmaps at the driver level, by unmapping entire
> huge pages and remapping the difference between them and the requested
> unmap region.
>=20
> This could change in the future when the VM_BIND uAPI is expanded to
> enforce huge page alignment and map/unmap operational constraints that
> render this code unnecessary.
>=20
> When a partial unmap for a huge PTE is attempted, we also need to expand
> the locked region to encompass whole huge pages.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>

With the few minor things I pointed out addressed, this is

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panthor/panthor_mmu.c | 99 ++++++++++++++++++++++++---
>  1 file changed, 91 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/pant=
hor/panthor_mmu.c
> index a3e5e77fc9ed..cabee92e9580 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -547,12 +547,12 @@ static int as_send_cmd_and_wait(struct panthor_devi=
ce *ptdev, u32 as_nr, u32 cmd
>  	return status;
>  }
> =20
> -static u64 pack_region_range(struct panthor_device *ptdev, u64 region_st=
art, u64 size)
> +static u64 pack_region_range(struct panthor_device *ptdev, u64 *region_s=
tart, u64 *size)
>  {
>  	u8 region_width;
> -	u64 region_end =3D region_start + size;
> +	u64 region_end =3D *region_start + *size;
> =20
> -	if (drm_WARN_ON_ONCE(&ptdev->base, !size))
> +	if (drm_WARN_ON_ONCE(&ptdev->base, !*size))
>  		return 0;
> =20
>  	/*
> @@ -563,16 +563,17 @@ static u64 pack_region_range(struct panthor_device =
*ptdev, u64 region_start, u64
>  	 * change, the desired region starts with this bit (and subsequent bits)
>  	 * zeroed and ends with the bit (and subsequent bits) set to one.
>  	 */
> -	region_width =3D max(fls64(region_start ^ (region_end - 1)),
> +	region_width =3D max(fls64(*region_start ^ (region_end - 1)),
>  			   const_ilog2(AS_LOCK_REGION_MIN_SIZE)) - 1;
> =20
>  	/*
>  	 * Mask off the low bits of region_start (which would be ignored by
>  	 * the hardware anyway)
>  	 */
> -	region_start &=3D GENMASK_ULL(63, region_width);
> +	*region_start &=3D GENMASK_ULL(63, region_width);
> +	*size =3D 1ull << (region_width + 1);
> =20
> -	return region_width | region_start;
> +	return region_width | *region_start;
>  }
> =20
>  static int panthor_mmu_as_enable(struct panthor_device *ptdev, u32 as_nr,
> @@ -1691,12 +1692,19 @@ static int panthor_vm_lock_region(struct panthor_=
vm *vm, u64 start, u64 size)
>  	struct panthor_device *ptdev =3D vm->ptdev;
>  	int ret =3D 0;
> =20
> +	/* sm_step_remap() can call panthor_vm_lock_region() to account for
> +	 * the wider unmap needed when doing a partial huge page unamp. We

								 ^ unmap

> +	 * need to ignore the lock if it's already part of the locked region.
> +	 */
> +	if (start >=3D vm->locked_region.start &&
> +	    start + size <=3D vm->locked_region.start + vm->locked_region.size)
> +		return 0;
> +
>  	mutex_lock(&ptdev->mmu->as.slots_lock);
> -	drm_WARN_ON(&ptdev->base, vm->locked_region.start || vm->locked_region.=
size);
>  	if (vm->as.id >=3D 0 && size) {
>  		/* Lock the region that needs to be updated */
>  		gpu_write64(ptdev, AS_LOCKADDR(vm->as.id),
> -			    pack_region_range(ptdev, start, size));
> +			    pack_region_range(ptdev, &start, &size));
> =20
>  		/* If the lock succeeded, update the locked_region info. */
>  		ret =3D as_send_cmd_and_wait(ptdev, vm->as.id, AS_COMMAND_LOCK);
> @@ -2169,6 +2177,48 @@ static int panthor_gpuva_sm_step_map(struct drm_gp=
uva_op *op, void *priv)
>  	return 0;
>  }
> =20
> +static bool
> +iova_mapped_as_huge_page(struct drm_gpuva_op_map *op, u64 addr)
> +{
> +	const struct page *pg;
> +	pgoff_t bo_offset;
> +
> +	bo_offset =3D addr - op->va.addr + op->gem.offset;
> +	pg =3D to_panthor_bo(op->gem.obj)->base.pages[bo_offset >> PAGE_SHIFT];
> +
> +	return folio_size(page_folio(pg)) >=3D SZ_2M;
> +}
> +
> +static void
> +unmap_hugepage_align(const struct drm_gpuva_op_remap *op,
> +		     u64 *unmap_start, u64 *unmap_range)
> +{
> +	u64 aligned_unmap_start, aligned_unmap_end, unmap_end;
> +
> +	unmap_end =3D *unmap_start + *unmap_range;
> +	aligned_unmap_start =3D ALIGN_DOWN(*unmap_start, SZ_2M);
> +	aligned_unmap_end =3D ALIGN(unmap_end, SZ_2M);
> +
> +	/* If we're dealing with a huge page, make sure the unmap region is
> +	 * aligned on the start of the page.
> +	 */
> +	if (op->prev && aligned_unmap_start < *unmap_start &&
> +	    op->prev->va.addr <=3D aligned_unmap_start &&
> +	    iova_mapped_as_huge_page(op->prev, *unmap_start)) {
> +		*unmap_range +=3D *unmap_start - aligned_unmap_start;
> +		*unmap_start =3D aligned_unmap_start;
> +	}
> +
> +	/* If we're dealing with a huge page, make sure the unmap region is
> +	 * aligned on the end of the page.
> +	 */
> +	if (op->next && aligned_unmap_end > unmap_end &&
> +	    op->next->va.addr + op->next->va.range >=3D aligned_unmap_end &&
> +	    iova_mapped_as_huge_page(op->next, unmap_end - 1)) {
> +		*unmap_range +=3D aligned_unmap_end - unmap_end;
> +	}
> +}
> +
>  static int panthor_gpuva_sm_step_remap(struct drm_gpuva_op *op,
>  				       void *priv)
>  {
> @@ -2177,16 +2227,49 @@ static int panthor_gpuva_sm_step_remap(struct drm=
_gpuva_op *op,
>  	struct panthor_vm_op_ctx *op_ctx =3D vm->op_ctx;
>  	struct panthor_vma *prev_vma =3D NULL, *next_vma =3D NULL;
>  	u64 unmap_start, unmap_range;
> +	int ret;
> =20
>  	drm_gpuva_op_remap_to_unmap_range(&op->remap, &unmap_start, &unmap_rang=
e);

nit: can you add a blank line before the comment?

> +	/*
> +	 * ARM IOMMU page table management code disallows partial unmaps of hug=
e pages,
> +	 * so when a partial unmap is requested, we must first unmap the entire=
 huge
> +	 * page and then remap the difference between the huge page minus the r=
equested
> +	 * unmap region. Calculating the right start address and range for the =
expanded
> +	 * unmap operation is the responsibility of the following function.
> +	 */
> +	unmap_hugepage_align(&op->remap, &unmap_start, &unmap_range);
> +
> +	/* If the range changed, we might have to lock a wider region to guaran=
tee
> +	 * atomicity. panthor_vm_lock_region() bails out early if the new region
> +	 * is already part of the locked region, so no need to do this check he=
re.
> +	 */
> +	panthor_vm_lock_region(vm, unmap_start, unmap_start + unmap_range);
>  	panthor_vm_unmap_pages(vm, unmap_start, unmap_range);
> =20
>  	if (op->remap.prev) {
> +		struct panthor_gem_object *bo =3D to_panthor_bo(op->remap.prev->gem.ob=
j);
> +		u64 offset =3D op->remap.prev->gem.offset + unmap_start - op->remap.pr=
ev->va.addr;
> +		u64 size =3D op->remap.prev->va.addr + op->remap.prev->va.range - unma=
p_start;
> +
> +		ret =3D panthor_vm_map_pages(vm, unmap_start, flags_to_prot(unmap_vma-=
>flags),
> +					   bo->base.sgt, offset, size);
> +		if (ret)
> +			return ret;
> +
>  		prev_vma =3D panthor_vm_op_ctx_get_vma(op_ctx);
>  		panthor_vma_init(prev_vma, unmap_vma->flags);
>  	}
> =20
>  	if (op->remap.next) {
> +		struct panthor_gem_object *bo =3D to_panthor_bo(op->remap.next->gem.ob=
j);
> +		u64 addr =3D op->remap.next->va.addr;
> +		u64 size =3D unmap_start + unmap_range - op->remap.next->va.addr;
> +
> +		ret =3D panthor_vm_map_pages(vm, addr, flags_to_prot(unmap_vma->flags),
> +					   bo->base.sgt, op->remap.next->gem.offset, size);
> +		if (ret)
> +			return ret;
> +
>  		next_vma =3D panthor_vm_op_ctx_get_vma(op_ctx);
>  		panthor_vma_init(next_vma, unmap_vma->flags);
>  	}

