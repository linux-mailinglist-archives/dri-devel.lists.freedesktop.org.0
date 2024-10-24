Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 098C99AE071
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 11:21:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED58410E8DA;
	Thu, 24 Oct 2024 09:20:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dXpCRqNa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4682810E8DF;
 Thu, 24 Oct 2024 09:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729761656; x=1761297656;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6u8EqDaa/h1BEwUBfc6pFPW7cVjO/WBYLu/4jWtdvEA=;
 b=dXpCRqNaMdTFfobEzt5Cp/FbQLeq47wd/Qtim3XQSD4SV3cWyIkpfx2/
 ShgUB31V8pKYgVBD6VAFnuJONEspFQ2dztz6L5xphS1pCUKrhj2fWPymA
 vYLD4zyzoeXLHOxQjqJAnXMbg2lwWW0F34sV31bevpuynUYOJ0VUX4iH7
 +/ZdXEv3f89/kk7IfYTmY/gWcWVPED3MC4gL26tLZ9xma+1kyP7qStBs1
 LBlZ9cCKEbY9W5a95JofxcqIV4vmRTVxYrs/mDGmNpRu+k7aSYEvRAgF+
 19Y4CRfLMTNtMuxik8hM5qkSfEDZRpvHUERnnCr3LZ7LAv4XhbUQujdGV A==;
X-CSE-ConnectionGUID: jg7Mlc1qRv+M2GJhEj7Nww==
X-CSE-MsgGUID: PlswNjAzRaKiHvsB9Jc5Fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="29277968"
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="29277968"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 02:20:55 -0700
X-CSE-ConnectionGUID: IitwrG5tSZWPb+3/xheZiw==
X-CSE-MsgGUID: ABDtK7+UQZiZwiDqHSfxNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="84509577"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.245.216])
 ([10.245.245.216])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 02:20:54 -0700
Message-ID: <b48336fe-05e2-446d-9d55-f806f188cb23@intel.com>
Date: Thu, 24 Oct 2024 10:20:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/9] drm/ttm: Add ttm_bo_access
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: mika.kuoppala@intel.com, thomas.hellstrom@linux.intel.com
References: <20241021211835.1675640-1-matthew.brost@intel.com>
 <20241021211835.1675640-3-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20241021211835.1675640-3-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 21/10/2024 22:18, Matthew Brost wrote:
> Non-contiguous VRAM cannot easily be mapped in TTM nor can non-visible
> VRAM easily be accessed. Add ttm_bo_access, which is similar to
> ttm_bo_vm_access, to access such memory.
> 
> v4:
>   - Fix checkpatch warnings (CI)
> v5:
>   - Fix checkpatch warnings (CI)
> 
> Reported-by: Christoph Manszewski <christoph.manszewski@intel.com>
> Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo_util.c | 86 +++++++++++++++++++++++++++++++
>   drivers/gpu/drm/ttm/ttm_bo_vm.c   | 65 +----------------------
>   include/drm/ttm/ttm_bo.h          |  2 +
>   3 files changed, 89 insertions(+), 64 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index d939925efa81..41bb5a7477d3 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -919,3 +919,89 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
>   
>   	return progress;
>   }
> +
> +static int ttm_bo_access_kmap(struct ttm_buffer_object *bo,
> +			      unsigned long offset,
> +			      void *buf, int len, int write)
> +{
> +	unsigned long page = offset >> PAGE_SHIFT;
> +	unsigned long bytes_left = len;
> +	int ret;
> +
> +	/* Copy a page at a time, that way no extra virtual address
> +	 * mapping is needed
> +	 */
> +	offset -= page << PAGE_SHIFT;
> +	do {
> +		unsigned long bytes = min(bytes_left, PAGE_SIZE - offset);
> +		struct ttm_bo_kmap_obj map;
> +		void *ptr;
> +		bool is_iomem;
> +
> +		ret = ttm_bo_kmap(bo, page, 1, &map);
> +		if (ret)
> +			return ret;
> +
> +		ptr = (void *)ttm_kmap_obj_virtual(&map, &is_iomem) + offset;
> +		WARN_ON_ONCE(is_iomem);
> +		if (write)
> +			memcpy(ptr, buf, bytes);
> +		else
> +			memcpy(buf, ptr, bytes);
> +		ttm_bo_kunmap(&map);
> +
> +		page++;
> +		buf += bytes;
> +		bytes_left -= bytes;
> +		offset = 0;
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
> + * Utility function to access a buffer object. Useful when buffer object cannot
> + * be easily mapped (non-contiguous, non-visible, etc...).
> + *
> + * Returns:
> + * 0 if successful, negative error code on failure.

@len if successful

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> + */
> +int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
> +		  void *buf, int len, int write)
> +{
> +	int ret;
> +
> +	if (len < 1 || (offset + len) > bo->base.size)
> +		return -EIO;
> +
> +	ret = ttm_bo_reserve(bo, true, false, NULL);
> +	if (ret)
> +		return ret;
> +
> +	switch (bo->resource->mem_type) {
> +	case TTM_PL_SYSTEM:
> +		fallthrough;
> +	case TTM_PL_TT:
> +		ret = ttm_bo_access_kmap(bo, offset, buf, len, write);
> +		break;
> +	default:
> +		if (bo->bdev->funcs->access_memory)
> +			ret = bo->bdev->funcs->access_memory
> +				(bo, offset, buf, len, write);
> +		else
> +			ret = -EIO;
> +	}
> +
> +	ttm_bo_unreserve(bo);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(ttm_bo_access);
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> index 2c699ed1963a..20b1e5f78684 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -366,45 +366,6 @@ void ttm_bo_vm_close(struct vm_area_struct *vma)
>   }
>   EXPORT_SYMBOL(ttm_bo_vm_close);
>   
> -static int ttm_bo_vm_access_kmap(struct ttm_buffer_object *bo,
> -				 unsigned long offset,
> -				 uint8_t *buf, int len, int write)
> -{
> -	unsigned long page = offset >> PAGE_SHIFT;
> -	unsigned long bytes_left = len;
> -	int ret;
> -
> -	/* Copy a page at a time, that way no extra virtual address
> -	 * mapping is needed
> -	 */
> -	offset -= page << PAGE_SHIFT;
> -	do {
> -		unsigned long bytes = min(bytes_left, PAGE_SIZE - offset);
> -		struct ttm_bo_kmap_obj map;
> -		void *ptr;
> -		bool is_iomem;
> -
> -		ret = ttm_bo_kmap(bo, page, 1, &map);
> -		if (ret)
> -			return ret;
> -
> -		ptr = (uint8_t *)ttm_kmap_obj_virtual(&map, &is_iomem) + offset;
> -		WARN_ON_ONCE(is_iomem);
> -		if (write)
> -			memcpy(ptr, buf, bytes);
> -		else
> -			memcpy(buf, ptr, bytes);
> -		ttm_bo_kunmap(&map);
> -
> -		page++;
> -		buf += bytes;
> -		bytes_left -= bytes;
> -		offset = 0;
> -	} while (bytes_left);
> -
> -	return len;
> -}
> -
>   int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>   		     void *buf, int len, int write)
>   {
> @@ -412,32 +373,8 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>   	unsigned long offset = (addr) - vma->vm_start +
>   		((vma->vm_pgoff - drm_vma_node_start(&bo->base.vma_node))
>   		 << PAGE_SHIFT);
> -	int ret;
> -
> -	if (len < 1 || (offset + len) > bo->base.size)
> -		return -EIO;
>   
> -	ret = ttm_bo_reserve(bo, true, false, NULL);
> -	if (ret)
> -		return ret;
> -
> -	switch (bo->resource->mem_type) {
> -	case TTM_PL_SYSTEM:
> -		fallthrough;
> -	case TTM_PL_TT:
> -		ret = ttm_bo_vm_access_kmap(bo, offset, buf, len, write);
> -		break;
> -	default:
> -		if (bo->bdev->funcs->access_memory)
> -			ret = bo->bdev->funcs->access_memory(
> -				bo, offset, buf, len, write);
> -		else
> -			ret = -EIO;
> -	}
> -
> -	ttm_bo_unreserve(bo);
> -
> -	return ret;
> +	return ttm_bo_access(bo, offset, buf, len, write);
>   }
>   EXPORT_SYMBOL(ttm_bo_vm_access);
>   
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index 5804408815be..8ea11cd8df39 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -421,6 +421,8 @@ void ttm_bo_unpin(struct ttm_buffer_object *bo);
>   int ttm_bo_evict_first(struct ttm_device *bdev,
>   		       struct ttm_resource_manager *man,
>   		       struct ttm_operation_ctx *ctx);
> +int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
> +		  void *buf, int len, int write);
>   vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
>   			     struct vm_fault *vmf);
>   vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
