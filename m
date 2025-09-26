Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D77BA3236
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 11:27:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA42310E351;
	Fri, 26 Sep 2025 09:27:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Q8TgSI7U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDD0610E368
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 09:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1758878830;
 bh=idjfPRcmAeJBF0gLrwOSORannB/WQOpILPm6lZ3m1jA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Q8TgSI7Uy4TW24lL4gkyvMHMVTYyfLriOu9NCLxKwsTNIgmi/jhlpu+033881Mcjk
 Jf1eiE4uzGBoTr3jXuouOiTxOC4CA8T7W5ij55Ya+N+FZb+5/4fBQAm5iYhcaNW7RL
 zClRzt3IQKZKnzXAzESQ2cCBu0935PJDReiutzF1jPZriAyGViP5eDbTwLWmCGfZAc
 r20rhHW4dS7WMqJD2etU4ct0FJG7xSdbYt1C/cRIRK0/TaVjEvL0akT7vb6PopI+kG
 Gr6KvOTRt2O2DaKu8zzOIxQ/nfmUGDqox2/qFvx1JfTLHlTWOG7+eugaE7zovTki3V
 uFBnbaxn3keXQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8B4C017E12C9;
 Fri, 26 Sep 2025 11:27:10 +0200 (CEST)
Date: Fri, 26 Sep 2025 11:26:49 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?TG/Dr2M=?= Molinari <loic.molinari@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH] drm/shmem-helper: Add huge page fault handler
Message-ID: <20250926112649.7b541197@fedora>
In-Reply-To: <20250923095634.50051-1-loic.molinari@collabora.com>
References: <20250923095634.50051-1-loic.molinari@collabora.com>
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

On Tue, 23 Sep 2025 11:56:34 +0200
Lo=C3=AFc Molinari <loic.molinari@collabora.com> wrote:

> This gives the mm subsystem the ability to propose the insertion of a
> PMD or PUD mapping for the faulting address.
>=20
> If the virtual address provided from userspace with mmap() using the
> address hint parameter is aligned to a huge page size, if the GEM
> object is backed by a tmpfs mount point using Transparent Hugepage and
> if the shmem backing store manages to allocate enough contiguous
> physical pages to fit within a huge page, the CPU mapping will then
> benefit from significantly increased memcpy() performance. For
> instance, when these conditions are met on a system with 2 MiB huge
> pages, a (fresh) aligned copy of 2 MiB would raise a single page fault
> instead of 4096.
>=20
> Signed-off-by: Lo=C3=AFc Molinari <loic.molinari@collabora.com>
> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 51 ++++++++++++++++++++++++--
>  1 file changed, 47 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm=
_gem_shmem_helper.c
> index 50594cf8e17c..30aa0d72093b 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -573,7 +573,8 @@ int drm_gem_shmem_dumb_create(struct drm_file *file, =
struct drm_device *dev,
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_dumb_create);
> =20
> -static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
> +static vm_fault_t drm_gem_shmem_huge_fault(struct vm_fault *vmf,
> +					   unsigned int order)
>  {
>  	struct vm_area_struct *vma =3D vmf->vma;
>  	struct drm_gem_object *obj =3D vma->vm_private_data;
> @@ -582,6 +583,7 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault=
 *vmf)
>  	vm_fault_t ret;
>  	struct page *page;
>  	pgoff_t page_offset;
> +	unsigned long pfn, paddr;
> =20
>  	/* We don't use vmf->pgoff since that has the fake offset */
>  	page_offset =3D (vmf->address - vma->vm_start) >> PAGE_SHIFT;
> @@ -592,17 +594,55 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fau=
lt *vmf)
>  	    drm_WARN_ON_ONCE(obj->dev, !shmem->pages) ||
>  	    shmem->madv < 0) {
>  		ret =3D VM_FAULT_SIGBUS;
> -	} else {
> -		page =3D shmem->pages[page_offset];
> +		goto out;
> +	}
> +
> +	page =3D shmem->pages[page_offset];
> +	pfn =3D page_to_pfn(page);
> +
> +	switch (order) {
> +	case 0:
> +		ret =3D vmf_insert_pfn(vma, vmf->address, pfn);
> +		break;
> +
> +#ifdef CONFIG_ARCH_SUPPORTS_PMD_PFNMAP
> +	case PMD_ORDER:
> +		paddr =3D pfn << PAGE_SHIFT;
> +		if (((vmf->address & ~PMD_MASK) =3D=3D (paddr & ~PMD_MASK)) &&
> +		    (folio_order(page_folio(page)) =3D=3D PMD_ORDER))
> +			ret =3D vmf_insert_pfn_pmd(
> +				    vmf, pfn & (PMD_MASK >> PAGE_SHIFT), false);
> +		else
> +			ret =3D VM_FAULT_FALLBACK;
> +		break;
> +#endif
> +
> +#ifdef CONFIG_ARCH_SUPPORTS_PUD_PFNMAP
> +	case PUD_ORDER:
> +		paddr =3D pfn << PAGE_SHIFT;
> +		if (((vmf->address & ~PUD_MASK) =3D=3D (paddr & ~PUD_MASK)) &&
> +		    (folio_order(page_folio(page)) =3D=3D PUD_ORDER))
> +			ret =3D vmf_insert_pfn_pud(
> +				    vmf, pfn & (PUD_MASK >> PAGE_SHIFT), false);
> +		else
> +			ret =3D VM_FAULT_FALLBACK;
> +		break;
> +#endif
> =20
> -		ret =3D vmf_insert_pfn(vma, vmf->address, page_to_pfn(page));
> +	default:

Not sure about the error, but we should have something like

		ret =3D VM_FAULT_FALLBACK;
		break;

because otherwise ret is uninitialized. We probably want a WARN_ON()
too, because this function is not supposed to be called with a
non-PTE/PUD/PMD order.

The rest looks good to me, so once this is addressed, you can add

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

>  	}
> =20
> + out:
>  	dma_resv_unlock(shmem->base.resv);
> =20
>  	return ret;
>  }
> =20
> +static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
> +{
> +	return drm_gem_shmem_huge_fault(vmf, 0);
> +}
> +
>  static void drm_gem_shmem_vm_open(struct vm_area_struct *vma)
>  {
>  	struct drm_gem_object *obj =3D vma->vm_private_data;
> @@ -639,6 +679,9 @@ static void drm_gem_shmem_vm_close(struct vm_area_str=
uct *vma)
> =20
>  const struct vm_operations_struct drm_gem_shmem_vm_ops =3D {
>  	.fault =3D drm_gem_shmem_fault,
> +#if defined(CONFIG_ARCH_SUPPORTS_PMD_PFNMAP) || defined(CONFIG_ARCH_SUPP=
ORTS_PUD_PFNMAP)
> +	.huge_fault =3D drm_gem_shmem_huge_fault,
> +#endif
>  	.open =3D drm_gem_shmem_vm_open,
>  	.close =3D drm_gem_shmem_vm_close,
>  };

