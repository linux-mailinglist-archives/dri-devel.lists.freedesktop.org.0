Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A2A680D4D
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 13:14:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AB3110E224;
	Mon, 30 Jan 2023 12:13:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F5A210E224;
 Mon, 30 Jan 2023 12:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675080838; x=1706616838;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=JekjfAihOljUKD65KZMGilfwCk3TUfFFTpssJlkT/os=;
 b=j6iF5sGo+mmRmuQWfxBsbw60tyKuwHFZAgKCBirTub2uMUcYMdBkM8fY
 /LfbiDkIFpK3W6Q7c3BVowT4YQrawc60B/TB/1llFmstzCrxoJsdeeUCI
 bRNppbJNMN5b2xSrnNvzVoOjzs4BsO8h6PbZLKQqUk/xcyNL1iDALekVC
 lHXDOBDX6Ysi6wwaWoPMaYCbkniRGS4ei8F9ZmwKCFGIjJfFzbxjNiX31
 69yalLKuBXKH9zPBprp+20pibJ62DEC0vHe/7ZVuJc9bs4w80/lM5v34x
 3BVJ7PexRLwf8E7+1wAMVzNpCtEFFrv4M1ixljo7i+hFzg8AODWX9ZDcj Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="307191870"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; d="scan'208";a="307191870"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 04:13:57 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="614009603"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; d="scan'208";a="614009603"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.251.209.222])
 ([10.251.209.222])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 04:13:56 -0800
Message-ID: <ef8aa0aa-b661-9979-4f7a-c547569a4281@linux.intel.com>
Date: Mon, 30 Jan 2023 13:13:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 5/6] drm/ttm: stop allocating a dummy resource for
 pipelined gutting
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20230130120636.63765-1-matthew.auld@intel.com>
 <20230130120636.63765-5-matthew.auld@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20230130120636.63765-5-matthew.auld@intel.com>
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/30/2023 1:06 PM, Matthew Auld wrote:
> From: Christian König <christian.koenig@amd.com>
>
> That should not be necessary any more when drivers should at least be
> able to handle a move without a resource.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Acked-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo_util.c | 15 ++-------------
>   1 file changed, 2 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index 7635d7d6b13b..d9d2b0903b22 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -704,30 +704,23 @@ EXPORT_SYMBOL(ttm_bo_move_sync_cleanup);
>    */
>   int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
>   {
> -	static const struct ttm_place sys_mem = { .mem_type = TTM_PL_SYSTEM };
>   	struct ttm_buffer_object *ghost;
> -	struct ttm_resource *sys_res;
>   	struct ttm_tt *ttm;
>   	int ret;
>   
> -	ret = ttm_resource_alloc(bo, &sys_mem, &sys_res);
> -	if (ret)
> -		return ret;
> -
>   	/* If already idle, no need for ghost object dance. */
>   	if (dma_resv_test_signaled(bo->base.resv, DMA_RESV_USAGE_BOOKKEEP)) {
>   		if (!bo->ttm) {
>   			/* See comment below about clearing. */
>   			ret = ttm_tt_create(bo, true);
>   			if (ret)
> -				goto error_free_sys_mem;
> +				return ret;
>   		} else {
>   			ttm_tt_unpopulate(bo->bdev, bo->ttm);
>   			if (bo->type == ttm_bo_type_device)
>   				ttm_tt_mark_for_clear(bo->ttm);
>   		}
>   		ttm_resource_free(bo, &bo->resource);
> -		ttm_bo_assign_mem(bo, sys_res);
>   		return 0;
>   	}
>   
> @@ -744,7 +737,7 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
>   	ret = ttm_tt_create(bo, true);
>   	swap(bo->ttm, ttm);
>   	if (ret)
> -		goto error_free_sys_mem;
> +		return ret;
>   
>   	ret = ttm_buffer_object_transfer(bo, &ghost);
>   	if (ret)
> @@ -760,13 +753,9 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
>   	dma_resv_unlock(&ghost->base._resv);
>   	ttm_bo_put(ghost);
>   	bo->ttm = ttm;
> -	ttm_bo_assign_mem(bo, sys_res);
>   	return 0;
>   
>   error_destroy_tt:
>   	ttm_tt_destroy(bo->bdev, ttm);
> -
> -error_free_sys_mem:
> -	ttm_resource_free(bo, &sys_res);
>   	return ret;
>   }
