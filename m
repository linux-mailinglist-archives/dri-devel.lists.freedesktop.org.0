Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF709A9E7E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 11:29:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2D2010E30E;
	Tue, 22 Oct 2024 09:29:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gmqv53oO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1082B10E30C;
 Tue, 22 Oct 2024 09:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729589374; x=1761125374;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=bVtsbujQRJDXVHcvA9EzgMot4EQmIO+kwEaPJwKnJPk=;
 b=Gmqv53oO1a/nzQ3k3J1tx0kDseLzOHekTYEemFupvvoEdTZd/LXoN/qP
 jAz4oKHPMOl2Nkivovm3AyG68Cu4cm4TskaBlD+6+X5eBbkPhOmdfOrcG
 vzZQIDKRRiv2fqZxOReTwg9HpelnAfM4ttMZz/Aby8RkWgHkKSRg9s05d
 cmMP530kvGryoQZPt4F+mG8j03W47qmfpAZC3ZxVbvXqq/8SNSZq1Mdgn
 1ssMl1KsQEmbwFeouFgf96kzGEREtlKU4Wa5hBlw/AM67aZ/nhlsYX/3Z
 1a5yKZKtj8WEh3FS7gBQjdtgeNOcJRd2NYG8/U/ztIie4vroYPVmsmHaI g==;
X-CSE-ConnectionGUID: L/T/PqI6STi4SmQRohVReA==
X-CSE-MsgGUID: tcihFkS7RP2kE0Zfqk41/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="29315878"
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; d="scan'208";a="29315878"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 02:29:33 -0700
X-CSE-ConnectionGUID: DOltpixTS5qU+SXyyZaxrQ==
X-CSE-MsgGUID: qs9BlZzwRQ+nnwjrkDBKlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; d="scan'208";a="79374974"
Received: from mkuoppal-desk.fi.intel.com (HELO localhost) ([10.237.72.193])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 02:29:32 -0700
From: Mika Kuoppala <mika.kuoppala@intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: matthew.auld@intel.com, thomas.hellstrom@linux.intel.com
Subject: Re: [PATCH v5 2/9] drm/ttm: Add ttm_bo_access
In-Reply-To: <20241021211835.1675640-3-matthew.brost@intel.com>
References: <20241021211835.1675640-1-matthew.brost@intel.com>
 <20241021211835.1675640-3-matthew.brost@intel.com>
Date: Tue, 22 Oct 2024 12:18:52 +0300
Message-ID: <87bjzcze9v.fsf@mkuoppal-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Matthew Brost <matthew.brost@intel.com> writes:

> Non-contiguous VRAM cannot easily be mapped in TTM nor can non-visible
> VRAM easily be accessed. Add ttm_bo_access, which is similar to
> ttm_bo_vm_access, to access such memory.
>
> v4:
>  - Fix checkpatch warnings (CI)
> v5:
>  - Fix checkpatch warnings (CI)
>
> Reported-by: Christoph Manszewski <christoph.manszewski@intel.com>
> Suggested-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

With the igt/xe_eudebug* coverage,

Tested-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

> ---
>  drivers/gpu/drm/ttm/ttm_bo_util.c | 86 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/ttm/ttm_bo_vm.c   | 65 +----------------------
>  include/drm/ttm/ttm_bo.h          |  2 +
>  3 files changed, 89 insertions(+), 64 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_=
bo_util.c
> index d939925efa81..41bb5a7477d3 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -919,3 +919,89 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk=
, struct ttm_device *bdev,
>=20=20
>  	return progress;
>  }
> +
> +static int ttm_bo_access_kmap(struct ttm_buffer_object *bo,
> +			      unsigned long offset,
> +			      void *buf, int len, int write)
> +{
> +	unsigned long page =3D offset >> PAGE_SHIFT;
> +	unsigned long bytes_left =3D len;
> +	int ret;
> +
> +	/* Copy a page at a time, that way no extra virtual address
> +	 * mapping is needed
> +	 */
> +	offset -=3D page << PAGE_SHIFT;
> +	do {
> +		unsigned long bytes =3D min(bytes_left, PAGE_SIZE - offset);
> +		struct ttm_bo_kmap_obj map;
> +		void *ptr;
> +		bool is_iomem;
> +
> +		ret =3D ttm_bo_kmap(bo, page, 1, &map);
> +		if (ret)
> +			return ret;
> +
> +		ptr =3D (void *)ttm_kmap_obj_virtual(&map, &is_iomem) + offset;
> +		WARN_ON_ONCE(is_iomem);
> +		if (write)
> +			memcpy(ptr, buf, bytes);
> +		else
> +			memcpy(buf, ptr, bytes);
> +		ttm_bo_kunmap(&map);
> +
> +		page++;
> +		buf +=3D bytes;
> +		bytes_left -=3D bytes;
> +		offset =3D 0;
> +	} while (bytes_left);
> +
> +	return len;
> +}
> +
> +/**
> + * ttm_bo_access - Helper to access a buffer object
> + *
> + * @bo: ttm buffer object
> + * @offset: access offset into buffer object
> + * @buf: pointer to caller memory to read into or write from
> + * @len: length of access
> + * @write: write access
> + *
> + * Utility function to access a buffer object. Useful when buffer object=
 cannot
> + * be easily mapped (non-contiguous, non-visible, etc...).
> + *
> + * Returns:
> + * 0 if successful, negative error code on failure.
> + */
> +int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
> +		  void *buf, int len, int write)
> +{
> +	int ret;
> +
> +	if (len < 1 || (offset + len) > bo->base.size)
> +		return -EIO;
> +
> +	ret =3D ttm_bo_reserve(bo, true, false, NULL);
> +	if (ret)
> +		return ret;
> +
> +	switch (bo->resource->mem_type) {
> +	case TTM_PL_SYSTEM:
> +		fallthrough;
> +	case TTM_PL_TT:
> +		ret =3D ttm_bo_access_kmap(bo, offset, buf, len, write);
> +		break;
> +	default:
> +		if (bo->bdev->funcs->access_memory)
> +			ret =3D bo->bdev->funcs->access_memory
> +				(bo, offset, buf, len, write);
> +		else
> +			ret =3D -EIO;
> +	}
> +
> +	ttm_bo_unreserve(bo);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(ttm_bo_access);
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo=
_vm.c
> index 2c699ed1963a..20b1e5f78684 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -366,45 +366,6 @@ void ttm_bo_vm_close(struct vm_area_struct *vma)
>  }
>  EXPORT_SYMBOL(ttm_bo_vm_close);
>=20=20
> -static int ttm_bo_vm_access_kmap(struct ttm_buffer_object *bo,
> -				 unsigned long offset,
> -				 uint8_t *buf, int len, int write)
> -{
> -	unsigned long page =3D offset >> PAGE_SHIFT;
> -	unsigned long bytes_left =3D len;
> -	int ret;
> -
> -	/* Copy a page at a time, that way no extra virtual address
> -	 * mapping is needed
> -	 */
> -	offset -=3D page << PAGE_SHIFT;
> -	do {
> -		unsigned long bytes =3D min(bytes_left, PAGE_SIZE - offset);
> -		struct ttm_bo_kmap_obj map;
> -		void *ptr;
> -		bool is_iomem;
> -
> -		ret =3D ttm_bo_kmap(bo, page, 1, &map);
> -		if (ret)
> -			return ret;
> -
> -		ptr =3D (uint8_t *)ttm_kmap_obj_virtual(&map, &is_iomem) + offset;
> -		WARN_ON_ONCE(is_iomem);
> -		if (write)
> -			memcpy(ptr, buf, bytes);
> -		else
> -			memcpy(buf, ptr, bytes);
> -		ttm_bo_kunmap(&map);
> -
> -		page++;
> -		buf +=3D bytes;
> -		bytes_left -=3D bytes;
> -		offset =3D 0;
> -	} while (bytes_left);
> -
> -	return len;
> -}
> -
>  int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>  		     void *buf, int len, int write)
>  {
> @@ -412,32 +373,8 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, uns=
igned long addr,
>  	unsigned long offset =3D (addr) - vma->vm_start +
>  		((vma->vm_pgoff - drm_vma_node_start(&bo->base.vma_node))
>  		 << PAGE_SHIFT);
> -	int ret;
> -
> -	if (len < 1 || (offset + len) > bo->base.size)
> -		return -EIO;
>=20=20
> -	ret =3D ttm_bo_reserve(bo, true, false, NULL);
> -	if (ret)
> -		return ret;
> -
> -	switch (bo->resource->mem_type) {
> -	case TTM_PL_SYSTEM:
> -		fallthrough;
> -	case TTM_PL_TT:
> -		ret =3D ttm_bo_vm_access_kmap(bo, offset, buf, len, write);
> -		break;
> -	default:
> -		if (bo->bdev->funcs->access_memory)
> -			ret =3D bo->bdev->funcs->access_memory(
> -				bo, offset, buf, len, write);
> -		else
> -			ret =3D -EIO;
> -	}
> -
> -	ttm_bo_unreserve(bo);
> -
> -	return ret;
> +	return ttm_bo_access(bo, offset, buf, len, write);
>  }
>  EXPORT_SYMBOL(ttm_bo_vm_access);
>=20=20
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index 5804408815be..8ea11cd8df39 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -421,6 +421,8 @@ void ttm_bo_unpin(struct ttm_buffer_object *bo);
>  int ttm_bo_evict_first(struct ttm_device *bdev,
>  		       struct ttm_resource_manager *man,
>  		       struct ttm_operation_ctx *ctx);
> +int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
> +		  void *buf, int len, int write);
>  vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
>  			     struct vm_fault *vmf);
>  vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
> --=20
> 2.34.1
