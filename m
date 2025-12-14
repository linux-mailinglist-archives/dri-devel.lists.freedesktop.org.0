Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 594ACCBB901
	for <lists+dri-devel@lfdr.de>; Sun, 14 Dec 2025 10:39:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF8910E1C3;
	Sun, 14 Dec 2025 09:39:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="XjcMW5oY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F044310E1C3
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Dec 2025 09:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1765705174;
 bh=h0u2cejxpXVoLRWKh5wXu2rzjmhKCUpKDzd+BVTCCOQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XjcMW5oY2N+zRJn+Xis7mRQKT9AzEf8m3bGR+B6fYEEIVbes49yu+lcHy6BrHbWjN
 TfqYqHSTL8K4jMs0eGymgXE6bzwBQ0Qz3MLUjRK+9lGv9poaLVFO6wR7Wc/ANM5xWV
 up8O9eAhocCkA3byN/PnE4QClE3LQZTM0W9SJq2f1r0ZN1dDwb6MOqGjAuCBWfg8UZ
 cVR13CorbHM9ibBrtsLYu1yajZH+15EOEnMelUoYKXqBx/MwVD8Pys+kSH7iYkqdZN
 mp1TWrebpshAIl9qjkL9G5YFm5dX7Eyc/2JV0oA8wb8ExWPdH1re9OnEYEkeNhRb/7
 ebStE29w18YVA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8A9E317E1292;
 Sun, 14 Dec 2025 10:39:33 +0100 (CET)
Date: Sun, 14 Dec 2025 10:39:28 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Steven
 Price <steven.price@arm.com>, kernel@collabora.com, Liviu Dudau
 <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v3 1/1] drm/panthor: Support partial unmaps of huge pages
Message-ID: <20251214103928.2dc0690b@fedora>
In-Reply-To: <20251213190835.2444075-2-adrian.larumbe@collabora.com>
References: <20251213190835.2444075-1-adrian.larumbe@collabora.com>
 <20251213190835.2444075-2-adrian.larumbe@collabora.com>
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

On Sat, 13 Dec 2025 19:08:33 +0000
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
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_mmu.c | 66 +++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/pant=
hor/panthor_mmu.c
> index 183da30fa500..f11340a7f59e 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -2110,6 +2110,44 @@ static int panthor_gpuva_sm_step_map(struct drm_gp=
uva_op *op, void *priv)
>  	return 0;
>  }
> =20
> +static bool
> +iova_mapped_as_huge_page(const struct panthor_vma *vma, u64 addr)
> +{
> +	const struct page *pg;
> +	pgoff_t bo_offset;
> +
> +	bo_offset =3D addr - vma->base.va.addr + vma->base.gem.offset;
> +	pg =3D to_panthor_bo(vma->base.gem.obj)->base.pages[bo_offset >> PAGE_S=
HIFT];
> +
> +	return (folio_size(page_folio(pg)) >=3D SZ_2M);

nit: you can drop the extra ()

	return folio_size(page_folio(pg)) >=3D SZ_2M;

> +}
> +
> +static void
> +get_map_unmap_intervals(const struct drm_gpuva_op_remap *op,
> +			const struct panthor_vma *unmap_vma,
> +			u64 *unmap_start, u64 *unmap_range)
> +{
> +	u64 aligned_unmap_start, aligned_unmap_end, unmap_end;
> +
> +	drm_gpuva_op_remap_to_unmap_range(op, unmap_start, unmap_range);
> +	unmap_end =3D *unmap_start + *unmap_range;
> +
> +	aligned_unmap_start =3D ALIGN_DOWN(*unmap_start, SZ_2M);
> +	if (op->prev && aligned_unmap_start < *unmap_start &&
> +	    op->prev->va.addr <=3D aligned_unmap_start &&
> +	    iova_mapped_as_huge_page(unmap_vma, *unmap_start)) {
> +		*unmap_range +=3D *unmap_start - aligned_unmap_start;
> +		*unmap_start =3D aligned_unmap_start;
> +	}
> +
> +	aligned_unmap_end =3D ALIGN(unmap_end, SZ_2M);
> +	if (op->next && aligned_unmap_end > unmap_end &&
> +	    op->next->va.addr + op->next->va.range >=3D aligned_unmap_end &&
> +	    iova_mapped_as_huge_page(unmap_vma, unmap_end - 1)) {
> +		*unmap_range +=3D aligned_unmap_end - unmap_end;
> +	}
> +}
> +
>  static int panthor_gpuva_sm_step_remap(struct drm_gpuva_op *op,
>  				       void *priv)
>  {
> @@ -2121,16 +2159,44 @@ static int panthor_gpuva_sm_step_remap(struct drm=
_gpuva_op *op,
>  	int ret;
> =20
>  	drm_gpuva_op_remap_to_unmap_range(&op->remap, &unmap_start, &unmap_rang=
e);
> +
> +	/*
> +	 * ARM IOMMU page table management code disallows partial unmaps of hug=
e pages,
> +	 * so when a partial unmap is requested, we must first unmap the entire=
 huge
> +	 * page and then remap the difference between the huge page minus the r=
equested
> +	 * unmap region. Calculating the right offsets and ranges for the diffe=
rent unmap
> +	 * and map operations is the responsibility of the following function.
> +	 */
> +	get_map_unmap_intervals(&op->remap, unmap_vma, &unmap_start, &unmap_ran=
ge);

Unfortunately, after 5b8fcf4777e7 ("drm/panthor: Add support for atomic
page table updates"), that's not enough, you also need to extend the
locked region (see [1]).

> +
>  	ret =3D panthor_vm_unmap_pages(vm, unmap_start, unmap_range);
>  	if (ret)
>  		return ret;
> =20
>  	if (op->remap.prev) {
> +		ret =3D panthor_vm_map_pages(vm, unmap_start,
> +					   flags_to_prot(unmap_vma->flags),
> +					   to_drm_gem_shmem_obj(op->remap.prev->gem.obj)->sgt,
> +					   op->remap.prev->gem.offset +
> +					   (unmap_start - op->remap.prev->va.addr),
> +					   op->remap.prev->va.addr + op->remap.prev->va.range -
> +					   unmap_start);
> +		if (ret)
> +			return ret;
> +
>  		prev_vma =3D panthor_vm_op_ctx_get_vma(op_ctx);
>  		panthor_vma_init(prev_vma, unmap_vma->flags);
>  	}
> =20
>  	if (op->remap.next) {
> +		ret =3D panthor_vm_map_pages(vm, op->remap.next->va.addr,
> +					   flags_to_prot(unmap_vma->flags),
> +					   to_drm_gem_shmem_obj(op->remap.next->gem.obj)->sgt,
> +					   op->remap.next->gem.offset,
> +					   unmap_start + unmap_range - op->remap.next->va.addr);
> +		if (ret)
> +			return ret;
> +
>  		next_vma =3D panthor_vm_op_ctx_get_vma(op_ctx);
>  		panthor_vma_init(next_vma, unmap_vma->flags);
>  	}

[1]https://gitlab.freedesktop.org/bbrezillon/linux/-/commit/b4b677796c8c33b=
5be60184bca099ef8fd8c5548
