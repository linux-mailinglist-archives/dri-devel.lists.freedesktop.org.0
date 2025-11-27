Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A17C8D72D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 10:11:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD8A010E7B3;
	Thu, 27 Nov 2025 09:11:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="BxqtYSDn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0493610E7B3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 09:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764234684;
 bh=CZVDxFPvZpotjQmTJYpwOltVRuRdNm7V2Ux8+c+1gyE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BxqtYSDnNPl89BUEVoPlvLkNwcfZvneW6HGO9LnSKJ8XtnDOWegfbmD1QQnqLQ9aS
 fIET08r/hRRMo7u3ejb2dZVvwxZnGaWjCjLOZjTlLsNmhN6s+4xNdJcKIHPHM+Iul2
 LQ77VO6qJNwHN6aiNifJd3+JoD9B4pNSNjSqB1qAlWYyILqy1BK1M0mcetYbqRJwyy
 No7/SAhwi/9GHaSc+zvjRc13ZN55EG42dMuFOiBxTVFDDCuCi2VgLqWeX1vJrFr8NL
 K/KzA2sD2anBk76Y9Tgw7JTh+vN9v0Peu+UYFH/nAe6G6dCWd5DNW0M0IlkwP7jNW4
 XAAsw3lx/FNzA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0D0E517E1122;
 Thu, 27 Nov 2025 10:11:24 +0100 (CET)
Date: Thu, 27 Nov 2025 10:11:16 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Steven
 Price <steven.price@arm.com>, kernel@collabora.com, Liviu Dudau
 <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v2 1/1] drm/panthor: Support partial unmaps of huge pages
Message-ID: <20251127101116.012309e7@fedora>
In-Reply-To: <20251127035021.624045-2-adrian.larumbe@collabora.com>
References: <20251127035021.624045-1-adrian.larumbe@collabora.com>
 <20251127035021.624045-2-adrian.larumbe@collabora.com>
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

On Thu, 27 Nov 2025 03:50:13 +0000
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
>  drivers/gpu/drm/panthor/panthor_mmu.c | 76 +++++++++++++++++++++++++++
>  1 file changed, 76 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/pant=
hor/panthor_mmu.c
> index 183da30fa500..41d7974c95ea 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -2110,6 +2110,57 @@ static int panthor_gpuva_sm_step_map(struct drm_gp=
uva_op *op, void *priv)
>  	return 0;
>  }
> =20
> +static bool
> +is_huge_page(const struct panthor_vma *unmap_vma, u64 addr)

The function name doesn't really match the arguments it's being
passed. I'd rename this function iova_mapped_as_huge_page(). I'd also
rename unmap_vma into vma (the helper doesn't have to know that the
test is used for unmapping), and addr into iova.

> +{
> +	const struct page *pg;
> +	pgoff_t bo_offset;
> +
> +	bo_offset =3D addr - unmap_vma->base.va.addr + unmap_vma->base.gem.offs=
et;
> +	pg =3D to_panthor_bo(unmap_vma->base.gem.obj)->base.pages[bo_offset >> =
PAGE_SHIFT];
> +
> +	return (folio_order(page_folio(pg)) >=3D PMD_ORDER);

I don't think we should use PMD_ORDER for this test, because the GPU
MMU page size might differ from the CPU one, and what we care about
here is whether this page is huge from the GPU MMU perspective. IOW, we
should have:

	return folio_size(page_folio(pg)) >=3D SZ_2M;

> +}
> +
> +struct remap_params {
> +	u64 prev_remap_start, prev_remap_range;
> +	u64 next_remap_start, next_remap_range;
> +};
> +
> +static struct remap_params
> +get_map_unmap_intervals(const struct drm_gpuva_op_remap *op,
> +			const struct panthor_vma *unmap_vma,
> +			u64 *unmap_start, u64 *unmap_range)
> +{
> +	u64 aligned_unmap_start, aligned_unmap_end, unmap_end;
> +	struct remap_params params =3D {0};
> +
> +	drm_gpuva_op_remap_to_unmap_range(op, unmap_start, unmap_range);
> +	unmap_end =3D *unmap_start + *unmap_range;
> +
> +	aligned_unmap_start =3D ALIGN_DOWN(*unmap_start, SZ_2M);
> +
> +	if (aligned_unmap_start < *unmap_start &&
> +	    unmap_vma->base.va.addr <=3D aligned_unmap_start &&
> +	    is_huge_page(unmap_vma, *unmap_start)) {
> +		params.prev_remap_start =3D aligned_unmap_start;
> +		params.prev_remap_range =3D *unmap_start & (SZ_2M - 1);
> +		*unmap_range +=3D *unmap_start - aligned_unmap_start;
> +		*unmap_start =3D aligned_unmap_start;
> +	}
> +
> +	aligned_unmap_end =3D ALIGN(unmap_end, SZ_2M);
> +
> +	if (aligned_unmap_end > unmap_end &&
> +	    (unmap_vma->base.va.addr + unmap_vma->base.va.range >=3D aligned_un=
map_end) &&
> +	    is_huge_page(unmap_vma, unmap_end - 1)) {
> +		*unmap_range +=3D params.next_remap_range =3D aligned_unmap_end - unma=
p_end;

Let's do that in two steps to make it more readable please:

		params.next_remap_range =3D aligned_unmap_end - unmap_end;
		*unmap_range +=3D params.next_remap_range;

> +		params.next_remap_start =3D unmap_end;
> +	}
> +
> +	return params;
> +}
> +
>  static int panthor_gpuva_sm_step_remap(struct drm_gpuva_op *op,
>  				       void *priv)
>  {
> @@ -2118,19 +2169,44 @@ static int panthor_gpuva_sm_step_remap(struct drm=
_gpuva_op *op,
>  	struct panthor_vm_op_ctx *op_ctx =3D vm->op_ctx;
>  	struct panthor_vma *prev_vma =3D NULL, *next_vma =3D NULL;
>  	u64 unmap_start, unmap_range;
> +	struct remap_params params;
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
> +	params =3D get_map_unmap_intervals(&op->remap, unmap_vma, &unmap_start,=
 &unmap_range);
> +
>  	ret =3D panthor_vm_unmap_pages(vm, unmap_start, unmap_range);
>  	if (ret)
>  		return ret;
> =20
>  	if (op->remap.prev) {
> +		ret =3D panthor_vm_map_pages(vm, params.prev_remap_start,
> +					   flags_to_prot(unmap_vma->flags),
> +					   to_drm_gem_shmem_obj(op->remap.prev->gem.obj)->sgt,
> +					   op->remap.prev->gem.offset, params.prev_remap_range);
> +		if (ret)
> +			return ret;
> +
>  		prev_vma =3D panthor_vm_op_ctx_get_vma(op_ctx);
>  		panthor_vma_init(prev_vma, unmap_vma->flags);
>  	}
> =20
>  	if (op->remap.next) {
> +		ret =3D panthor_vm_map_pages(vm, params.next_remap_start,
> +					   flags_to_prot(unmap_vma->flags),
> +					   to_drm_gem_shmem_obj(op->remap.next->gem.obj)->sgt,
> +					   op->remap.next->gem.offset, params.next_remap_range);
> +		if (ret)
> +			return ret;
> +
>  		next_vma =3D panthor_vm_op_ctx_get_vma(op_ctx);
>  		panthor_vma_init(next_vma, unmap_vma->flags);
>  	}

