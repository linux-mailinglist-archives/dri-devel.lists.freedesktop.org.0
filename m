Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA08D9ADE40
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 09:53:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F03E410E8CB;
	Thu, 24 Oct 2024 07:53:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UKT1mdyx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 068C310E8CA;
 Thu, 24 Oct 2024 07:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729756406; x=1761292406;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=vTR/z9BcUAT3VxLFbbZPQzWa9IVKBORmnnBMh89ROnU=;
 b=UKT1mdyxCzFHfkyYI5rb9A1kCb1Wn9C2G6heErJ+pGRbG6SocKM60eWx
 /tiYzyQycbQLN6AE1aghCrfbuzoqHRQXldIn+STwcHVXsLkbTwptt4ffh
 UOii5lS3nAJ9njUXiyBpzCeUSHOuH6/4zmnzi8WZn4g4T1F76QlC1+E+X
 0EBZxBcU50iq7McQ6SXVQL0/4ED1GokBRjj+DVgtCtDNk3OoS3OMmBlaw
 SkZTbYjObrGbMSYhmRc19Ggg09Hp+978aHqKrq1GQvGSNx4V7G8UpEoBQ
 NVlajf+WgE/D1LpNcVztQw9daXKsPlr9QqOH+o5xdthPVPLP4H3UGQWN4 A==;
X-CSE-ConnectionGUID: CFAoeyEqTra3CprlznLkFA==
X-CSE-MsgGUID: OWMhu3rESYmodbiCMmVhEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="29270632"
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="29270632"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 00:53:25 -0700
X-CSE-ConnectionGUID: 0lLHbDrnQ9KHDHsCweoesw==
X-CSE-MsgGUID: S7AEVMjAQRObk+BjmCEdTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="80934902"
Received: from mkuoppal-desk.fi.intel.com (HELO localhost) ([10.237.72.193])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 00:53:23 -0700
From: Mika Kuoppala <mika.kuoppala@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 matthew.auld@intel.com, thomas.hellstrom@linux.intel.com
Subject: Re: [PATCH v5 2/9] drm/ttm: Add ttm_bo_access
In-Reply-To: <Zxl6ExJzU0QO2lht@DUT025-TGLU.fm.intel.com>
References: <20241021211835.1675640-1-matthew.brost@intel.com>
 <20241021211835.1675640-3-matthew.brost@intel.com>
 <87bjzcze9v.fsf@mkuoppal-desk> <Zxl6ExJzU0QO2lht@DUT025-TGLU.fm.intel.com>
Date: Thu, 24 Oct 2024 10:42:41 +0300
Message-ID: <878queymj2.fsf@mkuoppal-desk>
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

> On Tue, Oct 22, 2024 at 12:18:52PM +0300, Mika Kuoppala wrote:
>> Matthew Brost <matthew.brost@intel.com> writes:
>>=20
>> > Non-contiguous VRAM cannot easily be mapped in TTM nor can non-visible
>> > VRAM easily be accessed. Add ttm_bo_access, which is similar to
>> > ttm_bo_vm_access, to access such memory.
>> >
>> > v4:
>> >  - Fix checkpatch warnings (CI)
>> > v5:
>> >  - Fix checkpatch warnings (CI)
>> >
>> > Reported-by: Christoph Manszewski <christoph.manszewski@intel.com>
>> > Suggested-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
>> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>=20
>> With the igt/xe_eudebug* coverage,
>>=20
>> Tested-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
>
> Thanks! Is this for the series or just this patch?
>

Whole series applied but the coverage tested only
ttm_bo_access().
-Mika

> Matt
>
>>=20
>> > ---
>> >  drivers/gpu/drm/ttm/ttm_bo_util.c | 86 +++++++++++++++++++++++++++++++
>> >  drivers/gpu/drm/ttm/ttm_bo_vm.c   | 65 +----------------------
>> >  include/drm/ttm/ttm_bo.h          |  2 +
>> >  3 files changed, 89 insertions(+), 64 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/t=
tm_bo_util.c
>> > index d939925efa81..41bb5a7477d3 100644
>> > --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
>> > +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
>> > @@ -919,3 +919,89 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *w=
alk, struct ttm_device *bdev,
>> >=20=20
>> >  	return progress;
>> >  }
>> > +
>> > +static int ttm_bo_access_kmap(struct ttm_buffer_object *bo,
>> > +			      unsigned long offset,
>> > +			      void *buf, int len, int write)
>> > +{
>> > +	unsigned long page =3D offset >> PAGE_SHIFT;
>> > +	unsigned long bytes_left =3D len;
>> > +	int ret;
>> > +
>> > +	/* Copy a page at a time, that way no extra virtual address
>> > +	 * mapping is needed
>> > +	 */
>> > +	offset -=3D page << PAGE_SHIFT;
>> > +	do {
>> > +		unsigned long bytes =3D min(bytes_left, PAGE_SIZE - offset);
>> > +		struct ttm_bo_kmap_obj map;
>> > +		void *ptr;
>> > +		bool is_iomem;
>> > +
>> > +		ret =3D ttm_bo_kmap(bo, page, 1, &map);
>> > +		if (ret)
>> > +			return ret;
>> > +
>> > +		ptr =3D (void *)ttm_kmap_obj_virtual(&map, &is_iomem) + offset;
>> > +		WARN_ON_ONCE(is_iomem);
>> > +		if (write)
>> > +			memcpy(ptr, buf, bytes);
>> > +		else
>> > +			memcpy(buf, ptr, bytes);
>> > +		ttm_bo_kunmap(&map);
>> > +
>> > +		page++;
>> > +		buf +=3D bytes;
>> > +		bytes_left -=3D bytes;
>> > +		offset =3D 0;
>> > +	} while (bytes_left);
>> > +
>> > +	return len;
>> > +}
>> > +
>> > +/**
>> > + * ttm_bo_access - Helper to access a buffer object
>> > + *
>> > + * @bo: ttm buffer object
>> > + * @offset: access offset into buffer object
>> > + * @buf: pointer to caller memory to read into or write from
>> > + * @len: length of access
>> > + * @write: write access
>> > + *
>> > + * Utility function to access a buffer object. Useful when buffer obj=
ect cannot
>> > + * be easily mapped (non-contiguous, non-visible, etc...).
>> > + *
>> > + * Returns:
>> > + * 0 if successful, negative error code on failure.
>> > + */
>> > +int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
>> > +		  void *buf, int len, int write)
>> > +{
>> > +	int ret;
>> > +
>> > +	if (len < 1 || (offset + len) > bo->base.size)
>> > +		return -EIO;
>> > +
>> > +	ret =3D ttm_bo_reserve(bo, true, false, NULL);
>> > +	if (ret)
>> > +		return ret;
>> > +
>> > +	switch (bo->resource->mem_type) {
>> > +	case TTM_PL_SYSTEM:
>> > +		fallthrough;
>> > +	case TTM_PL_TT:
>> > +		ret =3D ttm_bo_access_kmap(bo, offset, buf, len, write);
>> > +		break;
>> > +	default:
>> > +		if (bo->bdev->funcs->access_memory)
>> > +			ret =3D bo->bdev->funcs->access_memory
>> > +				(bo, offset, buf, len, write);
>> > +		else
>> > +			ret =3D -EIO;
>> > +	}
>> > +
>> > +	ttm_bo_unreserve(bo);
>> > +
>> > +	return ret;
>> > +}
>> > +EXPORT_SYMBOL(ttm_bo_access);
>> > diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm=
_bo_vm.c
>> > index 2c699ed1963a..20b1e5f78684 100644
>> > --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>> > +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>> > @@ -366,45 +366,6 @@ void ttm_bo_vm_close(struct vm_area_struct *vma)
>> >  }
>> >  EXPORT_SYMBOL(ttm_bo_vm_close);
>> >=20=20
>> > -static int ttm_bo_vm_access_kmap(struct ttm_buffer_object *bo,
>> > -				 unsigned long offset,
>> > -				 uint8_t *buf, int len, int write)
>> > -{
>> > -	unsigned long page =3D offset >> PAGE_SHIFT;
>> > -	unsigned long bytes_left =3D len;
>> > -	int ret;
>> > -
>> > -	/* Copy a page at a time, that way no extra virtual address
>> > -	 * mapping is needed
>> > -	 */
>> > -	offset -=3D page << PAGE_SHIFT;
>> > -	do {
>> > -		unsigned long bytes =3D min(bytes_left, PAGE_SIZE - offset);
>> > -		struct ttm_bo_kmap_obj map;
>> > -		void *ptr;
>> > -		bool is_iomem;
>> > -
>> > -		ret =3D ttm_bo_kmap(bo, page, 1, &map);
>> > -		if (ret)
>> > -			return ret;
>> > -
>> > -		ptr =3D (uint8_t *)ttm_kmap_obj_virtual(&map, &is_iomem) + offset;
>> > -		WARN_ON_ONCE(is_iomem);
>> > -		if (write)
>> > -			memcpy(ptr, buf, bytes);
>> > -		else
>> > -			memcpy(buf, ptr, bytes);
>> > -		ttm_bo_kunmap(&map);
>> > -
>> > -		page++;
>> > -		buf +=3D bytes;
>> > -		bytes_left -=3D bytes;
>> > -		offset =3D 0;
>> > -	} while (bytes_left);
>> > -
>> > -	return len;
>> > -}
>> > -
>> >  int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>> >  		     void *buf, int len, int write)
>> >  {
>> > @@ -412,32 +373,8 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, =
unsigned long addr,
>> >  	unsigned long offset =3D (addr) - vma->vm_start +
>> >  		((vma->vm_pgoff - drm_vma_node_start(&bo->base.vma_node))
>> >  		 << PAGE_SHIFT);
>> > -	int ret;
>> > -
>> > -	if (len < 1 || (offset + len) > bo->base.size)
>> > -		return -EIO;
>> >=20=20
>> > -	ret =3D ttm_bo_reserve(bo, true, false, NULL);
>> > -	if (ret)
>> > -		return ret;
>> > -
>> > -	switch (bo->resource->mem_type) {
>> > -	case TTM_PL_SYSTEM:
>> > -		fallthrough;
>> > -	case TTM_PL_TT:
>> > -		ret =3D ttm_bo_vm_access_kmap(bo, offset, buf, len, write);
>> > -		break;
>> > -	default:
>> > -		if (bo->bdev->funcs->access_memory)
>> > -			ret =3D bo->bdev->funcs->access_memory(
>> > -				bo, offset, buf, len, write);
>> > -		else
>> > -			ret =3D -EIO;
>> > -	}
>> > -
>> > -	ttm_bo_unreserve(bo);
>> > -
>> > -	return ret;
>> > +	return ttm_bo_access(bo, offset, buf, len, write);
>> >  }
>> >  EXPORT_SYMBOL(ttm_bo_vm_access);
>> >=20=20
>> > diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
>> > index 5804408815be..8ea11cd8df39 100644
>> > --- a/include/drm/ttm/ttm_bo.h
>> > +++ b/include/drm/ttm/ttm_bo.h
>> > @@ -421,6 +421,8 @@ void ttm_bo_unpin(struct ttm_buffer_object *bo);
>> >  int ttm_bo_evict_first(struct ttm_device *bdev,
>> >  		       struct ttm_resource_manager *man,
>> >  		       struct ttm_operation_ctx *ctx);
>> > +int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
>> > +		  void *buf, int len, int write);
>> >  vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
>> >  			     struct vm_fault *vmf);
>> >  vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>> > --=20
>> > 2.34.1
