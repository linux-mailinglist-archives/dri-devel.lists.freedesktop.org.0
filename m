Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3356C9614A
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 09:16:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B11910E2D7;
	Mon,  1 Dec 2025 08:16:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="MtQNiUA8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3945F10E0FA;
 Mon,  1 Dec 2025 08:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764577014;
 bh=SjCMyB1dHNwtgPTS0MoHLJhuhnjVA2MdD0tj6aAiy7Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MtQNiUA8jUaVwIUGbuaTBXQWC/AgCctwBHVMPb+164YHYlYfjkrYFBJELoRP0VqGb
 P9DYysHwyY9kNkN4LfOU3AU5gV+OjAkHy48NAyqKLDB8GeZLuhfjPlr524yI4a4YzQ
 VvkTxUKOq+PtulTUbIbaODh1Xj+fWtWz3HKq+LS9iTVwP6xLmecWck7pwCi9gQY0uJ
 PXBtYQTRV2aQxBC+xkYBfdJZjqFfX0pf0/lyTxNAzTFkL6Dy0RMJxjTzXr59VDelRL
 5V6fNUFWH+w1H0gQT+gSiwBWn38MemyT2zTpwxcnhY2dHLO3SE5/VWksC+H8btMcPI
 nfEFt6sQabtYw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9CCE617E126B;
 Mon,  1 Dec 2025 09:16:53 +0100 (CET)
Date: Mon, 1 Dec 2025 09:16:50 +0100
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
 Jonathan Corbet <corbet@lwn.net>, Christopher Healy <healych@amazon.com>,
 Matthew Wilcox <willy@infradead.org>, Bagas Sanjaya <bagasdotme@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v10 02/10] drm/shmem-helper: Map huge pages in fault
 handler
Message-ID: <20251201091650.4c45e494@fedora>
In-Reply-To: <20251128185252.3092-3-loic.molinari@collabora.com>
References: <20251128185252.3092-1-loic.molinari@collabora.com>
 <20251128185252.3092-3-loic.molinari@collabora.com>
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

On Fri, 28 Nov 2025 19:52:44 +0100
Lo=C3=AFc Molinari <loic.molinari@collabora.com> wrote:

> Attempt a PMD sized PFN insertion into the VMA if the faulty address
> of the fault handler is part of a huge page.
>=20
> On builds with CONFIG_TRANSPARENT_HUGEPAGE enabled, if the mmap() user
> address is PMD size aligned, if the GEM object is backed by shmem
> buffers on mountpoints setting the 'huge=3D' option and if the shmem
> backing store manages to allocate a huge folio, CPU mapping would then
> benefit from significantly increased memcpy() performance. When these
> conditions are met on a system with 2 MiB huge pages, an aligned copy
> of 2 MiB would raise a single page fault instead of 4096.
>=20
> v4:
> - implement map_pages instead of huge_fault
>=20
> v6:
> - get rid of map_pages handler for now (keep it for another series
>   along with arm64 contpte support)
>=20
> Signed-off-by: Lo=C3=AFc Molinari <loic.molinari@collabora.com>
> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 55 +++++++++++++++++++++-----
>  1 file changed, 46 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm=
_gem_shmem_helper.c
> index be89be1c804c..81f4ac7cb8f6 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -567,31 +567,68 @@ int drm_gem_shmem_dumb_create(struct drm_file *file=
, struct drm_device *dev,
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_dumb_create);
> =20
> +static bool drm_gem_shmem_fault_is_valid(struct drm_gem_object *obj,
> +					 pgoff_t pgoff)

AFAICT, extracting the fault_is_valid() logic into a helper is
orthogonal to the huge_page mapping stuff, and I don't see it being
used in the rest of the series (I guess it was when you were
introducing support for map_pages()). Maybe this should be done in a
separate patch, or postponed until there's a second place checking for
fault validity, dunno.

> +{
> +	struct drm_gem_shmem_object *shmem =3D to_drm_gem_shmem_obj(obj);
> +
> +	if (drm_WARN_ON_ONCE(obj->dev, !shmem->pages) ||
> +	    pgoff >=3D (obj->size >> PAGE_SHIFT) ||
> +	    shmem->madv < 0)
> +		return false;
> +
> +	return true;
> +}
> +
> +static bool drm_gem_shmem_map_pmd(struct vm_fault *vmf, unsigned long ad=
dr,
> +				  struct page *page)

nit: could we name that one drm_gem_shmem_try_map_pmd()?

With my two nits addressed, the patch is

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> +{
> +#ifdef CONFIG_ARCH_SUPPORTS_PMD_PFNMAP
> +	unsigned long pfn =3D page_to_pfn(page);
> +	unsigned long paddr =3D pfn << PAGE_SHIFT;
> +	bool aligned =3D (addr & ~PMD_MASK) =3D=3D (paddr & ~PMD_MASK);
> +
> +	if (aligned &&
> +	    pmd_none(*vmf->pmd) &&
> +	    folio_test_pmd_mappable(page_folio(page))) {
> +		pfn &=3D PMD_MASK >> PAGE_SHIFT;
> +		if (vmf_insert_pfn_pmd(vmf, pfn, false) =3D=3D VM_FAULT_NOPAGE)
> +			return true;
> +	}
> +#endif
> +
> +	return false;
> +}
> +
>  static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
>  {
>  	struct vm_area_struct *vma =3D vmf->vma;
>  	struct drm_gem_object *obj =3D vma->vm_private_data;
>  	struct drm_gem_shmem_object *shmem =3D to_drm_gem_shmem_obj(obj);
> -	loff_t num_pages =3D obj->size >> PAGE_SHIFT;
> -	vm_fault_t ret;
> -	struct page *page;
> +	struct page **pages =3D shmem->pages;
>  	pgoff_t page_offset;
> +	unsigned long pfn;
> +	vm_fault_t ret;
> =20
>  	/* Offset to faulty address in the VMA (without the fake offset). */
>  	page_offset =3D vmf->pgoff - vma->vm_pgoff;
> =20
>  	dma_resv_lock(shmem->base.resv, NULL);
> =20
> -	if (page_offset >=3D num_pages ||
> -	    drm_WARN_ON_ONCE(obj->dev, !shmem->pages) ||
> -	    shmem->madv < 0) {
> +	if (unlikely(!drm_gem_shmem_fault_is_valid(obj, page_offset))) {
>  		ret =3D VM_FAULT_SIGBUS;
> -	} else {
> -		page =3D shmem->pages[page_offset];
> +		goto out;
> +	}
> =20
> -		ret =3D vmf_insert_pfn(vma, vmf->address, page_to_pfn(page));
> +	if (drm_gem_shmem_map_pmd(vmf, vmf->address, pages[page_offset])) {
> +		ret =3D VM_FAULT_NOPAGE;
> +		goto out;
>  	}
> =20
> +	pfn =3D page_to_pfn(pages[page_offset]);
> +	ret =3D vmf_insert_pfn(vma, vmf->address, pfn);
> +
> + out:
>  	dma_resv_unlock(shmem->base.resv);
> =20
>  	return ret;

