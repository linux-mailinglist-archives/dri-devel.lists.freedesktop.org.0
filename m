Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D3B878FC8
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 09:34:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 278B910F1B4;
	Tue, 12 Mar 2024 08:34:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="AtL1wQV8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8339A10F1B4
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 08:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9dANuzX5KDs3eYm1ApWB856eAMw2Utp9BHx5J2HMrHg=; b=AtL1wQV8ipM8UTPJ9ovcea4bdv
 G8rnseUCAn7iuTFFcPTN2Ofw/LaNUVIs4eQux/5Bqkhm+I4m2BNIt0VdZxh2/YRo/qhjgnpvmgha9
 XPZcyDEuParkNm6MXd9oWtef7JBgw3oZHcIGfnwJoRjZFvC9L/xkUdVngyn7uD/BdjIn4NT4kyfJr
 aggWsAQrf8XpqzB4ORDKgrBKen2LaupFs5jDXdQMwZy8PfNsRREvrYMCNJD2YQ4Q8nL6IooaiuPo9
 d1/N3nGdyZdRPTYsEG8ZI4jDR8dxfsiSjQK06RwOFChnrtgxTFhmTlGEDAvMCUgep2fQVZNGz+Pwj
 8qB0MTBA==;
Received: from cm-81-9-209-58.telecable.es ([81.9.209.58] helo=[192.168.1.135])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rjxaH-009DZd-7X; Tue, 12 Mar 2024 09:34:05 +0100
Message-ID: <70b7c5b2e826d5c339618395d65233598669a9bb.camel@igalia.com>
Subject: Re: [PATCH 5/5] drm/v3d: Enable super pages
From: Iago Toral <itoral@igalia.com>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Melissa Wen
 <mwen@igalia.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,  Daniel Vetter
 <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Date: Tue, 12 Mar 2024 09:34:03 +0100
In-Reply-To: <20240311100959.205545-6-mcanal@igalia.com>
References: <20240311100959.205545-1-mcanal@igalia.com>
 <20240311100959.205545-6-mcanal@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
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

El lun, 11-03-2024 a las 07:06 -0300, Ma=C3=ADra Canal escribi=C3=B3:
> The V3D MMU also supports 1MB pages, called super pages. In order to
> set a 1MB page in the MMU, we need to make sure that page table
> entries
> for all 4KB pages within a super page must be correctly configured.
>=20
> Therefore, if the BO is larger than 2MB, we allocate it in a separate
> mountpoint that uses THP. This will allow us to create a contiguous
> memory region to create our super pages. In order to place the page
> table entries in the MMU, we iterate over the 256 4KB pages and
> insert
> the PTE.
>=20
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
> =C2=A0drivers/gpu/drm/v3d/v3d_bo.c=C2=A0=C2=A0=C2=A0 | 19 +++++++++++++++=
++--
> =C2=A0drivers/gpu/drm/v3d/v3d_drv.c=C2=A0=C2=A0 |=C2=A0 7 +++++++
> =C2=A0drivers/gpu/drm/v3d/v3d_drv.h=C2=A0=C2=A0 |=C2=A0 6 ++++--
> =C2=A0drivers/gpu/drm/v3d/v3d_gemfs.c |=C2=A0 6 ++++++
> =C2=A0drivers/gpu/drm/v3d/v3d_mmu.c=C2=A0=C2=A0 | 24 ++++++++++++++++++++=
++--
> =C2=A05 files changed, 56 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/v3d/v3d_bo.c
> b/drivers/gpu/drm/v3d/v3d_bo.c
> index a07ede668cc1..cb8e49a33be7 100644
> --- a/drivers/gpu/drm/v3d/v3d_bo.c
> +++ b/drivers/gpu/drm/v3d/v3d_bo.c
> @@ -94,6 +94,7 @@ v3d_bo_create_finish(struct drm_gem_object *obj)
> =C2=A0	struct v3d_dev *v3d =3D to_v3d_dev(obj->dev);
> =C2=A0	struct v3d_bo *bo =3D to_v3d_bo(obj);
> =C2=A0	struct sg_table *sgt;
> +	u64 align;
> =C2=A0	int ret;
>=20
> =C2=A0	/* So far we pin the BO in the MMU for its lifetime, so use
> @@ -103,6 +104,9 @@ v3d_bo_create_finish(struct drm_gem_object *obj)
> =C2=A0	if (IS_ERR(sgt))
> =C2=A0		return PTR_ERR(sgt);
>=20
> +	bo->huge_pages =3D (obj->size >=3D SZ_2M && v3d->super_pages);

We have this check for detecting huge pages replicated here and in
v3d_bo_create, but I think we can just do this check once in
v3d_bo_create and assign this field there as well so we don't have to
repeat the check in both functions?

> +	align =3D bo->huge_pages ? SZ_1M : SZ_4K;
> +
> =C2=A0	spin_lock(&v3d->mm_lock);
> =C2=A0	/* Allocate the object's space in the GPU's page tables.
> =C2=A0	 * Inserting PTEs will happen later, but the offset is for
> the
> @@ -110,7 +114,7 @@ v3d_bo_create_finish(struct drm_gem_object *obj)
> =C2=A0	 */
> =C2=A0	ret =3D drm_mm_insert_node_generic(&v3d->mm, &bo->node,
> =C2=A0					 obj->size >>
> V3D_MMU_PAGE_SHIFT,
> -					 GMP_GRANULARITY >>
> V3D_MMU_PAGE_SHIFT, 0, 0);
> +					 align >>
> V3D_MMU_PAGE_SHIFT, 0, 0);

This is making another change to drop the page align size for the
regular case from GMP_GRANULARITY to 4KB. I think this change is
relevant enough that it would probably deserve a separate commit
explaining the rationale for it. What do you think?

> =C2=A0	spin_unlock(&v3d->mm_lock);
> =C2=A0	if (ret)
> =C2=A0		return ret;
> @@ -130,10 +134,21 @@ struct v3d_bo *v3d_bo_create(struct drm_device
> *dev, struct drm_file *file_priv,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 size_t unaligned_size)
> =C2=A0{
> =C2=A0	struct drm_gem_shmem_object *shmem_obj;
> +	struct v3d_dev *v3d =3D to_v3d_dev(dev);
> =C2=A0	struct v3d_bo *bo;
> +	size_t size;
> =C2=A0	int ret;
>=20
> -	shmem_obj =3D drm_gem_shmem_create(dev, unaligned_size);
> +	size =3D PAGE_ALIGN(unaligned_size);
> +
> +	/* To avoid memory fragmentation, we only use THP if the BO
> is bigger
> +	 * than two Super Pages (1MB).
> +	 */
> +	if (size >=3D SZ_2M && v3d->super_pages)
> +		shmem_obj =3D drm_gem_shmem_create_with_mnt(dev, size,
> v3d->gemfs);
> +	else
> +		shmem_obj =3D drm_gem_shmem_create(dev, size);
> +
> =C2=A0	if (IS_ERR(shmem_obj))
> =C2=A0		return ERR_CAST(shmem_obj);
> =C2=A0	bo =3D to_v3d_bo(&shmem_obj->base);
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c
> b/drivers/gpu/drm/v3d/v3d_drv.c
> index 3debf37e7d9b..96f4d8227407 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.c
> +++ b/drivers/gpu/drm/v3d/v3d_drv.c
> @@ -36,6 +36,11 @@
> =C2=A0#define DRIVER_MINOR 0
> =C2=A0#define DRIVER_PATCHLEVEL 0
>=20
> +static bool super_pages =3D true;
> +module_param_named(super_pages, super_pages, bool, 0400);
> +MODULE_PARM_DESC(super_pages, "Enable/Disable Super Pages support.
> Note: \
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 To enable Super Pages, you need
> support to THP.");

I guess you meant to say '(...) support for THP'?

> +
> =C2=A0static int v3d_get_param_ioctl(struct drm_device *dev, void *data,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_file *file_priv)
> =C2=A0{
> @@ -308,6 +313,8 @@ static int v3d_platform_drm_probe(struct
> platform_device *pdev)
> =C2=A0		return -ENOMEM;
> =C2=A0	}
>=20
> +	v3d->super_pages =3D super_pages;
> +
> =C2=A0	ret =3D v3d_gem_init(drm);
> =C2=A0	if (ret)
> =C2=A0		goto dma_free;
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.h
> b/drivers/gpu/drm/v3d/v3d_drv.h
> index d2ce8222771a..795087663739 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.h
> +++ b/drivers/gpu/drm/v3d/v3d_drv.h
> @@ -17,9 +17,8 @@ struct clk;
> =C2=A0struct platform_device;
> =C2=A0struct reset_control;
>=20
> -#define GMP_GRANULARITY (128 * 1024)
> -
> =C2=A0#define V3D_MMU_PAGE_SHIFT 12
> +#define V3D_PAGE_FACTOR (PAGE_SIZE >> V3D_MMU_PAGE_SHIFT)
>=20
> =C2=A0#define V3D_MAX_QUEUES (V3D_CPU + 1)
>=20
> @@ -123,6 +122,7 @@ struct v3d_dev {
> =C2=A0	 * tmpfs instance used for shmem backed objects
> =C2=A0	 */
> =C2=A0	struct vfsmount *gemfs;
> +	bool super_pages;
>=20
> =C2=A0	struct work_struct overflow_mem_work;
>=20
> @@ -211,6 +211,8 @@ struct v3d_bo {
> =C2=A0	struct list_head unref_head;
>=20
> =C2=A0	void *vaddr;
> +
> +	bool huge_pages;
> =C2=A0};
>=20
> =C2=A0static inline struct v3d_bo *
> diff --git a/drivers/gpu/drm/v3d/v3d_gemfs.c
> b/drivers/gpu/drm/v3d/v3d_gemfs.c
> index 8518b7da6f73..bcde3138f555 100644
> --- a/drivers/gpu/drm/v3d/v3d_gemfs.c
> +++ b/drivers/gpu/drm/v3d/v3d_gemfs.c
> @@ -12,6 +12,10 @@ void v3d_gemfs_init(struct v3d_dev *v3d)
> =C2=A0	struct file_system_type *type;
> =C2=A0	struct vfsmount *gemfs;
>=20
> +	/* The user doesn't want support for Super Pages */
> +	if (!v3d->super_pages)
> +		goto err;
> +
> =C2=A0	/*
> =C2=A0	 * By creating our own shmemfs mountpoint, we can pass in
> =C2=A0	 * mount flags that better match our usecase. However, we
> @@ -35,6 +39,8 @@ void v3d_gemfs_init(struct v3d_dev *v3d)
>=20
> =C2=A0err:
> =C2=A0	v3d->gemfs =3D NULL;
> +	v3d->super_pages =3D false;
> +
> =C2=A0	drm_notice(&v3d->drm,
> =C2=A0		=C2=A0=C2=A0 "Transparent Hugepage support is recommended for
> optimal performance on this platform!\n");
> =C2=A0}
> diff --git a/drivers/gpu/drm/v3d/v3d_mmu.c
> b/drivers/gpu/drm/v3d/v3d_mmu.c
> index 14f3af40d6f6..2f368dc2c0ca 100644
> --- a/drivers/gpu/drm/v3d/v3d_mmu.c
> +++ b/drivers/gpu/drm/v3d/v3d_mmu.c
> @@ -89,6 +89,9 @@ void v3d_mmu_insert_ptes(struct v3d_bo *bo)
> =C2=A0	u32 page =3D bo->node.start;
> =C2=A0	u32 page_prot =3D V3D_PTE_WRITEABLE | V3D_PTE_VALID;
> =C2=A0	struct sg_dma_page_iter dma_iter;
> +	int ctg_size =3D drm_prime_get_contiguous_size(shmem_obj-
> >sgt);
> +	u32 page_size =3D 0;
> +	u32 npages =3D 0;

Maybe call this npages_4kb so it is more explicit about its purpose?

>=20
> =C2=A0	for_each_sgtable_dma_page(shmem_obj->sgt, &dma_iter, 0) {
> =C2=A0		dma_addr_t dma_addr =3D
> sg_page_iter_dma_address(&dma_iter);
> @@ -96,10 +99,27 @@ void v3d_mmu_insert_ptes(struct v3d_bo *bo)
> =C2=A0		u32 pte =3D page_prot | page_address;
> =C2=A0		u32 i;
>=20
> -		BUG_ON(page_address + (PAGE_SIZE >>
> V3D_MMU_PAGE_SHIFT) >=3D
> +		if (npages =3D=3D 0) {
> +			if (ctg_size >=3D SZ_1M && bo->huge_pages) {
> +				page_size =3D SZ_1M;
> +				npages =3D 256;
> +			} else {
> +				page_size =3D SZ_4K;
> +				npages =3D V3D_PAGE_FACTOR;

Does it make sense to make this relative to V3D_PAGE_FACTOR when we are
hardcoding the page size to 4KB? And if it does, should we not make
pages for the huge_pages case also be based on the page factor for
consistency?

> +			}
> +
> +			ctg_size -=3D npages * SZ_4K;
> +		}
> +
> +		if (page_size =3D=3D SZ_1M)
> +			pte |=3D V3D_PTE_SUPERPAGE;
> +
> +		BUG_ON(page_address + V3D_PAGE_FACTOR >=3D
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(24));
> -		for (i =3D 0; i < PAGE_SIZE >> V3D_MMU_PAGE_SHIFT;
> i++)
> +		for (i =3D 0; i < V3D_PAGE_FACTOR; i++)
> =C2=A0			v3d->pt[page++] =3D pte + i;
> +
> +		npages -=3D V3D_PAGE_FACTOR;

So just to be sure I get this right: if we allocate a super page, here
we are only assigning the first 4KB of its contiguous address space in
the page table, and then we continue iterating over the remaining DMA
pages fitting them into the super page until we assign all the pages in
the object or we exhaust the super page (in which case we go back to
npages =3D=3D 0 and make a decision again for the remaining size). Is that
correct?


> =C2=A0	}
>=20
> =C2=A0	WARN_ON_ONCE(page - bo->node.start !=3D
> --
> 2.43.0
>=20
>=20

