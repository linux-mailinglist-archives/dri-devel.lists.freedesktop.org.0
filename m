Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3BB9A9D43
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 10:43:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B879210E622;
	Tue, 22 Oct 2024 08:43:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ksC2E1xu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F12810E621;
 Tue, 22 Oct 2024 08:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729586620; x=1761122620;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1xVCYWdghfTV8CkKUBjePtTCTdXLlD0E0XcWTMYLx+k=;
 b=ksC2E1xuVBAHtdAysujTjLTD69YGKJjr9WqddCawkVdP4Nz4ZRo8KUBr
 mepI3+wk2NUuML97lfJJtMJuVaRV///Jb0F1uXAEjjvLoHqVD/0EbLptz
 UWVJiT5RLUuTTaDqrwGs9cUakrg90vJ5NkMbZB5UWml0axsEvtdRVw223
 Z6f12wZTqShRqCiV4Zi5/xIlXHXCArghADO6ATg1VBZFYiQAATKHhAjuX
 8ho1xGW8sYMuwd2D4bZAQMy3DN2WCWGDzFDfmccxaBZYr7JlVhgA0/0PD
 YoaGHboCnX9VbkML8ATtnExoadgQP1NbMtzyHL0eDKlHEl/UMh9F4YnTv Q==;
X-CSE-ConnectionGUID: WGN81RnITCG4fP9zG2T5NQ==
X-CSE-MsgGUID: 4oIE/jhBTs6ykhRjmglQCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39652119"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="39652119"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 01:43:39 -0700
X-CSE-ConnectionGUID: VUgapydwSoqChTZJZhk1qw==
X-CSE-MsgGUID: 1+KmKN4rQMCSMTu84/+Kaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; d="scan'208";a="79866599"
Received: from sosterlu-desk.ger.corp.intel.com (HELO [10.245.244.157])
 ([10.245.244.157])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 01:43:38 -0700
Message-ID: <0dbc501e-c0b0-426b-83bb-fd07c8560876@intel.com>
Date: Tue, 22 Oct 2024 09:43:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/9] drm/xe/display: Update intel_bo_read_from_page to
 use ttm_bo_access
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: mika.kuoppala@intel.com, thomas.hellstrom@linux.intel.com
References: <20241021211835.1675640-1-matthew.brost@intel.com>
 <20241021211835.1675640-7-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20241021211835.1675640-7-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
> Don't open code vmap of a BO, use ttm_bo_access helper which is safe for
> non-contiguous BOs and non-visible BOs.
> 
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

I guess needs fixes tag?

With that,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/display/intel_bo.c | 25 +------------------------
>   1 file changed, 1 insertion(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/intel_bo.c b/drivers/gpu/drm/xe/display/intel_bo.c
> index 9f54fad0f1c0..43141964f6f2 100644
> --- a/drivers/gpu/drm/xe/display/intel_bo.c
> +++ b/drivers/gpu/drm/xe/display/intel_bo.c
> @@ -40,31 +40,8 @@ int intel_bo_fb_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
>   int intel_bo_read_from_page(struct drm_gem_object *obj, u64 offset, void *dst, int size)
>   {
>   	struct xe_bo *bo = gem_to_xe_bo(obj);
> -	struct ttm_bo_kmap_obj map;
> -	void *src;
> -	bool is_iomem;
> -	int ret;
>   
> -	ret = xe_bo_lock(bo, true);
> -	if (ret)
> -		return ret;
> -
> -	ret = ttm_bo_kmap(&bo->ttm, offset >> PAGE_SHIFT, 1, &map);
> -	if (ret)
> -		goto out_unlock;
> -
> -	offset &= ~PAGE_MASK;
> -	src = ttm_kmap_obj_virtual(&map, &is_iomem);
> -	src += offset;
> -	if (is_iomem)
> -		memcpy_fromio(dst, (void __iomem *)src, size);
> -	else
> -		memcpy(dst, src, size);
> -
> -	ttm_bo_kunmap(&map);
> -out_unlock:
> -	xe_bo_unlock(bo);
> -	return ret;
> +	return ttm_bo_access(&bo->ttm, offset, dst, size, 0);
>   }
>   
>   struct intel_frontbuffer *intel_bo_get_frontbuffer(struct drm_gem_object *obj)
