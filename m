Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BA27B4D29
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 10:16:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F146110E223;
	Mon,  2 Oct 2023 08:16:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A447A10E223
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Oct 2023 08:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696234605; x=1727770605;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=CCm0nCaUAWiZf/2jiZ9UIxoAuD9LhOTJ2OhX2TS+RIA=;
 b=cdRGPp+aNuYehGWNHSd2m2aYXoNn01XAXhV8dqyTzpLsDTa61VjFms8R
 0BlRHB6Nr+GK1Y1AH9OGmeLjfWkh0y8/xUxrYVwYHjJpeJEpIyVejVYfC
 oHFqXdTmSQWIqTcEGihbro64cLtFe63UonrdiMNgOOYKgMt9DdaOQel9s
 irr+7gjfot1+Dwzlq4/gVAJ/hqCLYdqvvTedehQ7/Gf0BqymtoStO/WXI
 QCg8Bg7r8uPRbL2x++kBkxW49WYZKAd/VEPML3CNbq0/aIrq4gtb2sUkE
 KMKofiUdB1dGIVGXrJaSNB5ePjpzCie3ySCHbCrOXHML5V6cXgDTlSDcI w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="449090684"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; d="scan'208";a="449090684"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 01:16:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="1081578756"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; d="scan'208";a="1081578756"
Received: from satiarax-mobl1.gar.corp.intel.com (HELO [10.249.254.231])
 ([10.249.254.231])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 01:16:43 -0700
Message-ID: <2b5648aa-f83d-d8f7-b0fd-39c859f32f33@linux.intel.com>
Date: Mon, 2 Oct 2023 10:16:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] drm/ttm: Make sure the mapped tt pages are decrypted
 when needed
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
References: <20230926040359.3040017-1-zack@kde.org>
 <20230926175113.679880-1-zack@kde.org>
Content-Language: en-US
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230926175113.679880-1-zack@kde.org>
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
Cc: Huang Rui <ray.huang@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Zack

On 9/26/23 19:51, Zack Rusin wrote:
> From: Zack Rusin <zackr@vmware.com>
>
> Some drivers require the mapped tt pages to be decrypted. In an ideal
> world this would have been handled by the dma layer, but the TTM page
> fault handling would have to be rewritten to able to do that.
>
> A side-effect of the TTM page fault handling is using a dma allocation
> per order (via ttm_pool_alloc_page) which makes it impossible to just
> trivially use dma_mmap_attrs. As a result ttm has to be very careful
> about trying to make its pgprot for the mapped tt pages match what
> the dma layer thinks it is. At the ttm layer it's possible to
> deduce the requirement to have tt pages decrypted by checking
> whether coherent dma allocations have been requested and the system
> is running with confidential computing technologies.
>
> This approach isn't ideal but keeping TTM matching DMAs expectations
> for the page properties is in general fragile, unfortunately proper
> fix would require a rewrite of TTM's page fault handling.
>
> Fixes vmwgfx with SEV enabled.
>
> v2: Explicitly include cc_platform.h
>
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> Fixes: 3bf3710e3718 ("drm/ttm: Add a generic TTM memcpy move for page-based iomem")
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Huang Rui <ray.huang@amd.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: <stable@vger.kernel.org> # v5.14+
> ---
>   drivers/gpu/drm/ttm/ttm_bo_util.c | 13 +++++++++++--
>   drivers/gpu/drm/ttm/ttm_tt.c      |  8 ++++++++
>   include/drm/ttm/ttm_tt.h          |  9 ++++++++-
>   3 files changed, 27 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index fd9fd3d15101..0b3f4267130c 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -294,7 +294,13 @@ pgprot_t ttm_io_prot(struct ttm_buffer_object *bo, struct ttm_resource *res,
>   	enum ttm_caching caching;
>   
>   	man = ttm_manager_type(bo->bdev, res->mem_type);
> -	caching = man->use_tt ? bo->ttm->caching : res->bus.caching;
> +	if (man->use_tt) {
> +		caching = bo->ttm->caching;
> +		if (bo->ttm->page_flags & TTM_TT_FLAG_DECRYPTED)
> +			tmp = pgprot_decrypted(tmp);
> +	} else  {
> +		caching = res->bus.caching;
> +	}
>   
>   	return ttm_prot_from_caching(caching, tmp);
>   }
> @@ -337,6 +343,8 @@ static int ttm_bo_kmap_ttm(struct ttm_buffer_object *bo,
>   		.no_wait_gpu = false
>   	};
>   	struct ttm_tt *ttm = bo->ttm;
> +	struct ttm_resource_manager *man =
> +			ttm_manager_type(bo->bdev, bo->resource->mem_type);
>   	pgprot_t prot;
>   	int ret;
>   
> @@ -346,7 +354,8 @@ static int ttm_bo_kmap_ttm(struct ttm_buffer_object *bo,
>   	if (ret)
>   		return ret;
>   
> -	if (num_pages == 1 && ttm->caching == ttm_cached) {
> +	if (num_pages == 1 && ttm->caching == ttm_cached &&
> +	    !(man->use_tt && (ttm->page_flags & TTM_TT_FLAG_DECRYPTED))) {
>   		/*
>   		 * We're mapping a single page, and the desired
>   		 * page protection is consistent with the bo.
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index e0a77671edd6..e4966e2c988d 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -31,6 +31,7 @@
>   
>   #define pr_fmt(fmt) "[TTM] " fmt
>   
> +#include <linux/cc_platform.h>
>   #include <linux/sched.h>
>   #include <linux/shmem_fs.h>
>   #include <linux/file.h>
> @@ -81,6 +82,13 @@ int ttm_tt_create(struct ttm_buffer_object *bo, bool zero_alloc)
>   		pr_err("Illegal buffer object type\n");
>   		return -EINVAL;
>   	}
> +	/*
> +	 * When using dma_alloc_coherent with memory encryption the
> +	 * mapped TT pages need to be decrypted or otherwise the drivers
> +	 * will end up sending encrypted mem to the gpu.
> +	 */
> +	if (bdev->pool.use_dma_alloc && cc_platform_has(CC_ATTR_MEM_ENCRYPT))

You need to use CC_ATTR_GUEST_MEM_ENCRYPT here rather than 
CC_ATTR_MEM_ENCRYPT to avoid touching and breaking the SME case and only 
fix the SEV / SEV-ES case. I'd also hold off the stable inclusion until 
it's completely verified that this doesn't break anything because if it 
does, I suspect all hell will break loose.

With that said, for the functionality

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

But I think this needs a wider Ack at the ttm / drm level for the 
approach taken.

/Thomas.

> +		page_flags |= TTM_TT_FLAG_DECRYPTED;
>   
>   	bo->ttm = bdev->funcs->ttm_tt_create(bo, page_flags);
>   	if (unlikely(bo->ttm == NULL))
> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> index a4eff85b1f44..2b9d856ff388 100644
> --- a/include/drm/ttm/ttm_tt.h
> +++ b/include/drm/ttm/ttm_tt.h
> @@ -79,6 +79,12 @@ struct ttm_tt {
>   	 *   page_flags = TTM_TT_FLAG_EXTERNAL |
>   	 *		  TTM_TT_FLAG_EXTERNAL_MAPPABLE;
>   	 *
> +	 * TTM_TT_FLAG_DECRYPTED: The mapped ttm pages should be marked as
> +	 * not encrypted. The framework will try to match what the dma layer
> +	 * is doing, but note that it is a little fragile because ttm page
> +	 * fault handling abuses the DMA api a bit and dma_map_attrs can't be
> +	 * used to assure pgprot always matches.
> +	 *
>   	 * TTM_TT_FLAG_PRIV_POPULATED: TTM internal only. DO NOT USE. This is
>   	 * set by TTM after ttm_tt_populate() has successfully returned, and is
>   	 * then unset when TTM calls ttm_tt_unpopulate().
> @@ -87,8 +93,9 @@ struct ttm_tt {
>   #define TTM_TT_FLAG_ZERO_ALLOC		BIT(1)
>   #define TTM_TT_FLAG_EXTERNAL		BIT(2)
>   #define TTM_TT_FLAG_EXTERNAL_MAPPABLE	BIT(3)
> +#define TTM_TT_FLAG_DECRYPTED		BIT(4)
>   
> -#define TTM_TT_FLAG_PRIV_POPULATED	BIT(4)
> +#define TTM_TT_FLAG_PRIV_POPULATED	BIT(5)
>   	uint32_t page_flags;
>   	/** @num_pages: Number of pages in the page array. */
>   	uint32_t num_pages;
