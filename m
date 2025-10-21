Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B42C5BF720A
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 16:42:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C947C10E605;
	Tue, 21 Oct 2025 14:42:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="gcEwCGpt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 153A510E605
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 14:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1761057731;
 bh=AdOTqC6GnppcuVY2+ZB5OHVNph65GMdeDJ+SDxsEadI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gcEwCGptiVGdGVW7I0QsjIyInYkV3j4tfo4x2NFO/rgVTGXFJ9gxiLO8Yulsyyn7R
 e+0OLncKWE1DQQAjZQtwK1F/n75dGq7/m8sYza6+NQReOlQSTOoJw7roe+hm0lKvxy
 q/1B6GDNXDj3nj0kOHDKQegAfygNbQGwYFT1tsfDViktIQ+d1jG/NQg3tPMfIynM0h
 JDSyDBMP/Gfx5NQGjivBSW6lDP91vnoVN8YKLgGoOdjsJp9N6vulfNLJel5nrv3/VA
 fBxQ25+gBI4kHdNi3FcJz3fMQ5LXwssB7KDoJhVZ4SmZ5djtHHays7nLaYyvSM+HhW
 L86mJlAam+RTw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id CCDDF17E00AC;
 Tue, 21 Oct 2025 16:42:10 +0200 (CEST)
Date: Tue, 21 Oct 2025 16:42:03 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Steven
 Price <steven.price@arm.com>, kernel@collabora.com, Liviu Dudau
 <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH] drm/panthor: Support partial unmaps of huge pages
Message-ID: <20251021164203.2b9fec35@fedora>
In-Reply-To: <20251019032108.3498086-1-adrian.larumbe@collabora.com>
References: <20251019032108.3498086-1-adrian.larumbe@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
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

Hi Adrian,

On Sun, 19 Oct 2025 04:19:42 +0100
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
>  drivers/gpu/drm/panthor/panthor_mmu.c | 129 +++++++++++++++++++++++++-
>  1 file changed, 126 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/pant=
hor/panthor_mmu.c
> index 2d041a2e75e9..f9d200e57c04 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -2093,6 +2093,98 @@ static int panthor_gpuva_sm_step_map(struct drm_gp=
uva_op *op, void *priv)
>  	return 0;
>  }
> =20
> +static bool
> +is_huge_page_partial_unmap(const struct panthor_vma *unmap_vma,
> +			   const struct drm_gpuva_op_map *op,
> +			   u64 unmap_start, u64 unmap_range,
> +			   u64 sz2m_prev, u64 sz2m_next)
> +{
> +	size_t pgcount, pgsize;
> +	const struct page *pg;
> +	pgoff_t bo_offset;
> +
> +	if (op->va.addr < unmap_vma->base.va.addr) {
> +		bo_offset =3D unmap_start - unmap_vma->base.va.addr + unmap_vma->base.=
gem.offset;
> +		sz2m_prev =3D ALIGN_DOWN(unmap_start, SZ_2M);
> +		sz2m_next =3D ALIGN(unmap_start + 1, SZ_2M);
> +		pgsize =3D get_pgsize(unmap_start, unmap_range, &pgcount);
> +
> +	} else {
> +		bo_offset =3D ((unmap_start + unmap_range - 1) - unmap_vma->base.va.ad=
dr)
> +			+ unmap_vma->base.gem.offset;
> +		sz2m_prev =3D ALIGN_DOWN(unmap_start + unmap_range - 1, SZ_2M);
> +		sz2m_next =3D ALIGN(unmap_start + unmap_range, SZ_2M);
> +		pgsize =3D get_pgsize(sz2m_prev, unmap_start + unmap_range - sz2m_prev=
, &pgcount);
> +	}
> +
> +	pg =3D to_panthor_bo(unmap_vma->base.gem.obj)->base.pages[bo_offset >> =
PAGE_SHIFT];
> +
> +	if (pgsize =3D=3D SZ_4K && folio_order(page_folio(pg)) =3D=3D PMD_ORDER=
 &&
> +	    unmap_vma->base.va.addr <=3D sz2m_prev && unmap_vma->base.va.addr +
> +	    unmap_vma->base.va.range >=3D sz2m_next)
> +		return true;
> +
> +	return false;
> +}
> +
> +struct remap_params {
> +	u64 prev_unmap_start, prev_unmap_range;
> +	u64 prev_remap_start, prev_remap_range;
> +	u64 next_unmap_start, next_unmap_range;
> +	u64 next_remap_start, next_remap_range;
> +	u64 unmap_start, unmap_range;
> +};
> +
> +static struct remap_params
> +get_map_unmap_intervals(const struct drm_gpuva_op_remap *op,
> +			const struct panthor_vma *unmap_vma)
> +{
> +	u64 unmap_start, unmap_range, sz2m_prev, sz2m_next;
> +	struct remap_params params =3D {0};
> +
> +	drm_gpuva_op_remap_to_unmap_range(op, &unmap_start, &unmap_range);
> +
> +	if (op->prev) {
> +		sz2m_prev =3D ALIGN_DOWN(unmap_start, SZ_2M);
> +		sz2m_next =3D ALIGN(unmap_start + 1, SZ_2M);
> +
> +		if (is_huge_page_partial_unmap(unmap_vma, op->prev, unmap_start,
> +					       unmap_range, sz2m_prev, sz2m_next)) {
> +			params.prev_unmap_start =3D sz2m_prev;
> +			params.prev_unmap_range =3D SZ_2M;
> +			params.prev_remap_start =3D sz2m_prev;
> +			params.prev_remap_range =3D unmap_start & (SZ_2M - 1);
> +
> +			u64 diff =3D min(sz2m_next - unmap_start, unmap_range);
> +
> +			unmap_range -=3D diff;
> +			unmap_start +=3D diff;
> +		}
> +	}
> +
> +	if (op->next) {
> +		sz2m_prev =3D ALIGN_DOWN(unmap_start + unmap_range - 1, SZ_2M);
> +		sz2m_next =3D ALIGN(unmap_start + unmap_range, SZ_2M);
> +
> +		if (is_huge_page_partial_unmap(unmap_vma, op->next, unmap_start,
> +					       unmap_range, sz2m_prev, sz2m_next)) {
> +			if (unmap_range) {
> +				params.next_unmap_start =3D sz2m_prev;
> +				params.next_unmap_range =3D SZ_2M;
> +				unmap_range -=3D op->next->va.addr & (SZ_2M - 1);
> +			}
> +
> +			params.next_remap_start =3D op->next->va.addr;
> +			params.next_remap_range =3D SZ_2M - (op->next->va.addr & (SZ_2M - 1));
> +		}
> +	}
> +
> +	params.unmap_start =3D unmap_start;
> +	params.unmap_range =3D unmap_range;
> +
> +	return params;
> +}
> +
>  static int panthor_gpuva_sm_step_remap(struct drm_gpuva_op *op,
>  				       void *priv)
>  {
> @@ -2100,20 +2192,51 @@ static int panthor_gpuva_sm_step_remap(struct drm=
_gpuva_op *op,
>  	struct panthor_vm *vm =3D priv;
>  	struct panthor_vm_op_ctx *op_ctx =3D vm->op_ctx;
>  	struct panthor_vma *prev_vma =3D NULL, *next_vma =3D NULL;
> -	u64 unmap_start, unmap_range;
> +	struct remap_params params;
>  	int ret;
> =20
> -	drm_gpuva_op_remap_to_unmap_range(&op->remap, &unmap_start, &unmap_rang=
e);
> -	ret =3D panthor_vm_unmap_pages(vm, unmap_start, unmap_range);
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
> +	params =3D get_map_unmap_intervals(&op->remap, unmap_vma);
> +
> +	ret =3D panthor_vm_unmap_pages(vm, params.unmap_start, params.unmap_ran=
ge);
>  	if (ret)
>  		return ret;
> =20
>  	if (op->remap.prev) {
> +		ret =3D panthor_vm_unmap_pages(vm, params.prev_unmap_start,
> +					     params.prev_unmap_range);

This should be part of the previous unmap.

> +		if (ret)
> +			return ret;
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
> +		ret =3D panthor_vm_unmap_pages(vm, params.next_unmap_start,
> +					     params.next_unmap_range);

This one too.

> +		if (ret)
> +			return ret;
> +
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

Overall, it feels more complicated than what I had in mind (see
below, only compile-tested though).

Cheers,

Boris

--->8---
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/pantho=
r/panthor_mmu.c
index 6dec4354e378..15718241fd2f 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -2093,27 +2093,104 @@ static int panthor_gpuva_sm_step_map(struct drm_gp=
uva_op *op, void *priv)
        return 0;
 }
=20
+static void
+align_unmap_range(const struct drm_gpuva_op_remap *op,
+                 u64 *unmap_start, u64 *unmap_end)
+{
+       u64 aligned_unmap_start =3D ALIGN_DOWN(*unmap_start, SZ_2M);
+       u64 aligned_unmap_end =3D ALIGN(*unmap_end, SZ_2M);
+
+       /* If we're dealing with a huge page, make sure the unmap region is
+        * aligned on the start of the page.
+        */
+       if (op->prev && aligned_unmap_start < *unmap_start &&
+           op->prev->va.addr <=3D aligned_unmap_start) {
+               struct panthor_gem_object *bo =3D to_panthor_bo(op->prev->g=
em.obj);
+               u64 bo_offset =3D op->prev->gem.offset + *unmap_start -
+                               op->prev->va.addr;
+               const struct page *pg =3D bo->base.pages[bo_offset >> PAGE_=
SHIFT];
+
+               if (folio_size(page_folio(pg)) >=3D SZ_2M)
+                       *unmap_start =3D aligned_unmap_start;
+       }
+
+       /* If we're dealing with a huge page, make sure the unmap region is
+        * aligned on the end of the page.
+        */
+       if (op->next && aligned_unmap_end > *unmap_end &&
+           op->next->va.addr + op->next->va.range >=3D aligned_unmap_end) {
+               struct panthor_gem_object *bo =3D to_panthor_bo(op->next->g=
em.obj);
+               u64 bo_offset =3D op->next->gem.offset + op->next->va.addr +
+                               op->next->va.range - *unmap_end;
+               const struct page *pg =3D bo->base.pages[bo_offset >> PAGE_=
SHIFT];
+
+               if (folio_size(page_folio(pg)) >=3D SZ_2M)
+                       *unmap_end =3D aligned_unmap_end;
+       }
+}
+
 static int panthor_gpuva_sm_step_remap(struct drm_gpuva_op *op,
                                       void *priv)
 {
        struct panthor_vma *unmap_vma =3D container_of(op->remap.unmap->va,=
 struct panthor_vma, base);
+       u64 unmap_start, unmap_range, unmap_end, aligned_unmap_start, align=
ed_unmap_end;
        struct panthor_vm *vm =3D priv;
        struct panthor_vm_op_ctx *op_ctx =3D vm->op_ctx;
        struct panthor_vma *prev_vma =3D NULL, *next_vma =3D NULL;
-       u64 unmap_start, unmap_range;
        int ret;
=20
+       /*
+        * ARM IOMMU page table management code disallows partial unmaps of=
 huge pages,
+        * so when a partial unmap is requested, we must first unmap the en=
tire huge
+        * page and then remap the difference between the huge page minus t=
he requested
+        * unmap region. Calculating the right offsets and ranges for the d=
ifferent unmap
+        * and map operations is the responsibility of the following functi=
on.
+        */
        drm_gpuva_op_remap_to_unmap_range(&op->remap, &unmap_start, &unmap_=
range);
-       ret =3D panthor_vm_unmap_pages(vm, unmap_start, unmap_range);
+       unmap_end =3D unmap_start + unmap_range;
+       aligned_unmap_start =3D unmap_start;
+       aligned_unmap_end =3D unmap_end;
+       align_unmap_range(&op->remap, &aligned_unmap_start, &aligned_unmap_=
end);
+
+       ret =3D panthor_vm_unmap_pages(vm, aligned_unmap_start,
+                                    aligned_unmap_end - aligned_unmap_star=
t);
        if (ret)
                return ret;
=20
        if (op->remap.prev) {
+               if (aligned_unmap_start < unmap_start) {
+                       struct panthor_gem_object *bo =3D
+                               to_panthor_bo(op->remap.prev->gem.obj);
+                       u64 bo_offset =3D op->remap.prev->gem.offset +
+                                       aligned_unmap_start - op->remap.pre=
v->va.addr;
+
+                       ret =3D panthor_vm_map_pages(vm, aligned_unmap_star=
t,
+                                                  flags_to_prot(unmap_vma-=
>flags),
+                                                  bo->base.sgt, bo_offset,
+                                                  unmap_start - aligned_un=
map_start);
+                       if (ret)
+                               return ret;
+               }
+
                prev_vma =3D panthor_vm_op_ctx_get_vma(op_ctx);
                panthor_vma_init(prev_vma, unmap_vma->flags);
        }
=20
        if (op->remap.next) {
+               if (aligned_unmap_end > unmap_end) {
+                       struct panthor_gem_object *bo =3D
+                               to_panthor_bo(op->remap.next->gem.obj);
+                       u64 bo_offset =3D op->remap.next->gem.offset + unma=
p_end -
+                                       op->remap.next->va.addr;
+
+                       ret =3D panthor_vm_map_pages(vm, unmap_end,
+                                                  flags_to_prot(unmap_vma-=
>flags),
+                                                  bo->base.sgt, bo_offset,
+                                                  aligned_unmap_end - unma=
p_end);
+                       if (ret)
+                               return ret;
+               }
+
                next_vma =3D panthor_vm_op_ctx_get_vma(op_ctx);
                panthor_vma_init(next_vma, unmap_vma->flags);
        }

