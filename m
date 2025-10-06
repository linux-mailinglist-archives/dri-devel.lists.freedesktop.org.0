Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B79BBBD2A0
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 08:52:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21A1B10E196;
	Mon,  6 Oct 2025 06:52:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="eIwlSBHH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6866B10E196;
 Mon,  6 Oct 2025 06:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1759733572;
 bh=dz/7ybhFy53bNalb8jRF6/95hGJfso+9p3SQZuWaD+w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eIwlSBHHSU3fGpgntkmPgbspid1vf+fh1JA91yxAY6BJMprianRhs2g6YgCGjCuT+
 ojdXWJPfdA926eGkHDJ864aW57Ntr8XblLboCkbpRwnnkcPzUo2208o+A0ik1zQWx3
 E/3y4Pg075Zq/9MU7ziDIdiAnYTXh0GNZ4u+/KxBvkLSh2Sb3Z8BcRTyKwqQUq8s76
 8li7JiqVY7anifjlHOR0rfFyVRjgMtemgO1XGquYJCcv64T530YToTfq5UQSzMBmJD
 kiLUoKNzQPFCM7b+QiiAe/ljf3G9b3/GtyyIGfAEGXlbbL466HvAh8q/gqVtDlpO9U
 cqd76BOVb58EQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 543B617E0AC3;
 Mon,  6 Oct 2025 08:52:51 +0200 (CEST)
Date: Mon, 6 Oct 2025 08:52:47 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?TG/Dr2M=?= Molinari <loic.molinari@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Melissa Wen <mwen@igalia.com>, =?UTF-8?B?TWHDrXJh?= Canal
 <mcanal@igalia.com>, Hugh Dickins <hughd@google.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>,
 Al Viro <viro@zeniv.linux.org.uk>, =?UTF-8?B?TWlrb8WCYWo=?= Wasiak
 <mikolaj.wasiak@intel.com>, Christian Brauner <brauner@kernel.org>, Nitin
 Gote <nitin.r.gote@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Christopher Healy <healych@amazon.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-mm@kvack.org, kernel@collabora.com, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 01/10] drm/shmem-helper: Add huge page fault handler
Message-ID: <20251006085247.52f29f59@fedora>
In-Reply-To: <20251004093054.21388-2-loic.molinari@collabora.com>
References: <20251004093054.21388-1-loic.molinari@collabora.com>
 <20251004093054.21388-2-loic.molinari@collabora.com>
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

On Sat,  4 Oct 2025 11:30:44 +0200
Lo=C3=AFc Molinari <loic.molinari@collabora.com> wrote:

> This gives the mm subsystem the ability to propose the insertion of
> PUD or PMD-sized mappings for the faulting addresses.
>=20
> On builds with CONFIG_TRANSPARENT_HUGEPAGE enabled, if the mmap() user
> address is aligned to a huge page size, if the GEM object is backed by
> shmem buffers on mount points setting the 'huge=3D' option and if the
> shmem backing store manages to allocate a huge folio, the CPU mapping
> will then benefit from significantly increased memcpy() performance.
> When these conditions are met on a system with 2 MiB huge pages, an
> aligned copy of 2 MiB would raise a single page fault instead of 4096.
>=20
> v2:
> - set ret to VM_FAULT_FALLBACK in default switch statement
> - ifdef out paddr declaration
>=20
> Signed-off-by: Lo=C3=AFc Molinari <loic.molinari@collabora.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202509241315.8jjCyL7U-lkp@i=
ntel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202509241654.qJk1H5kr-lkp@i=
ntel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202509241920.PtSEkfd4-lkp@i=
ntel.com/

I'm not sure those Closes/Reported-by tags are needed when you fix bugs
introduced in a previous revisions of the patchset.

> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 56 ++++++++++++++++++++++++--
>  1 file changed, 52 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm=
_gem_shmem_helper.c
> index 50594cf8e17c..22c4b09e10a3 100644
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
> @@ -582,6 +583,10 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_faul=
t *vmf)
>  	vm_fault_t ret;
>  	struct page *page;
>  	pgoff_t page_offset;
> +	unsigned long pfn;
> +#if defined(CONFIG_ARCH_SUPPORTS_PMD_PFNMAP) || defined(CONFIG_ARCH_SUPP=
ORTS_PUD_PFNMAP)
> +	unsigned long paddr;
> +#endif
> =20
>  	/* We don't use vmf->pgoff since that has the fake offset */
>  	page_offset =3D (vmf->address - vma->vm_start) >> PAGE_SHIFT;
> @@ -592,17 +597,57 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fau=
lt *vmf)
>  	    drm_WARN_ON_ONCE(obj->dev, !shmem->pages) ||
>  	    shmem->madv < 0) {
>  		ret =3D VM_FAULT_SIGBUS;
> -	} else {
> -		page =3D shmem->pages[page_offset];
> +		goto out;
> +	}
> =20
> -		ret =3D vmf_insert_pfn(vma, vmf->address, page_to_pfn(page));
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
> +
> +	default:
> +		ret =3D VM_FAULT_FALLBACK;
> +		break;
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
> @@ -639,6 +684,9 @@ static void drm_gem_shmem_vm_close(struct vm_area_str=
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

