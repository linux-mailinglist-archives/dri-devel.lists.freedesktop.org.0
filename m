Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A89C394331
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 15:06:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A72C56F5BB;
	Fri, 28 May 2021 13:06:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77FAA6F5BB
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 13:06:56 +0000 (UTC)
IronPort-SDR: hF1cxPC2tJC0jok5FAfRBBEpfCEVDzHobSfwKDlHgXQ06rJu0AUQ6qDb0mGkLq2v2r/+e/SftX
 uXxVECBo7vOA==
X-IronPort-AV: E=McAfee;i="6200,9189,9997"; a="288548707"
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; d="scan'208";a="288548707"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2021 06:06:51 -0700
IronPort-SDR: wx3VRz31g6+qMCnMFzT3CdWP9lWy/q74GB57uqvRYj/s6F8uXNB5hIMwvoeWQXX6N8k9Yt6stU
 lFljBs0opI5w==
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; d="scan'208";a="443991902"
Received: from jdahlin-mobl1.ger.corp.intel.com (HELO [10.249.254.92])
 ([10.249.254.92])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2021 06:06:49 -0700
Subject: Re: [PATCH] drm/ttm: fix deref of bo->ttm without holding the lock v2
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20210528130041.1683-1-christian.koenig@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <aa17b7d5-1c44-4d2b-431f-5f361481f039@linux.intel.com>
Date: Fri, 28 May 2021 15:06:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210528130041.1683-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: Xinhui.Pan@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/28/21 3:00 PM, Christian König wrote:
> We need to grab the resv lock first before doing that check.
>
> v2 (chk): simplify the change for -fixes
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Hmm, OK, but this doesn't fix the swapped-bo-not-on-lru and unpopulating 
from swap_notify issues. Are you planning a follow up patch for those?

Thanks,

Thomas

> ---
>   drivers/gpu/drm/ttm/ttm_bo.c     | 5 ++++-
>   drivers/gpu/drm/ttm/ttm_device.c | 8 +-------
>   2 files changed, 5 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index cfd0b9292397..ebcffe794adb 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -1172,7 +1172,10 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
>   	if (!ttm_bo_evict_swapout_allowable(bo, ctx, &locked, NULL))
>   		return -EBUSY;
>   
> -	if (!ttm_bo_get_unless_zero(bo)) {
> +	if (!bo->ttm || !ttm_tt_is_populated(bo->ttm) ||
> +	    bo->ttm->page_flags & TTM_PAGE_FLAG_SG ||
> +	    bo->ttm->page_flags & TTM_PAGE_FLAG_SWAPPED ||
> +	    !ttm_bo_get_unless_zero(bo)) {
>   		if (locked)
>   			dma_resv_unlock(bo->base.resv);
>   		return -EBUSY;
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index a1dcf7d55c90..3d9c62b93e29 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -143,14 +143,8 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
>   
>   		for (j = 0; j < TTM_MAX_BO_PRIORITY; ++j) {
>   			list_for_each_entry(bo, &man->lru[j], lru) {
> -				uint32_t num_pages;
> +				uint32_t num_pages = PFN_UP(bo->base.size);
>   
> -				if (!bo->ttm || !ttm_tt_is_populated(bo->ttm) ||
> -				    bo->ttm->page_flags & TTM_PAGE_FLAG_SG ||
> -				    bo->ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)
> -					continue;
> -
> -				num_pages = bo->ttm->num_pages;
>   				ret = ttm_bo_swapout(bo, ctx, gfp_flags);
>   				/* ttm_bo_swapout has dropped the lru_lock */
>   				if (!ret)
