Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9F363886B
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 12:14:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF45E10E732;
	Fri, 25 Nov 2022 11:14:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E50DD10E72C;
 Fri, 25 Nov 2022 11:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669374887; x=1700910887;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=6vQDUUCmN97OeyrTkEtUVUUPMl1l0TNrYP591bjYOJs=;
 b=HEC2rmH0nXZJEiKB69E/ywYwPQ4mjCRd5NygK7PRne6bCn3f7GHCv8cD
 4kdDj4i0wKtxlc987IG/jK8hm8t9IPXyl3n1cG/7oWkrktKBxRorbE1Ij
 Xgw0NTEvWR0XF9t5p2qQbZ+znwi2vgZxv7FdvQWTnRw+JEeejqZWeQsQg
 RxxzkWqqYTGHYRI1Gs9hb+TcR5ByZhRTn/sGkCuyNy6NMl3iAMKaWVvAH
 FV9Zm5mhFnpgIr71qzF3GMoyvefSwjeH6wswgIzZ5FovIeKzOzRTbalbX
 TNHn5l6RfHvaqwRjfHNgAQkZ6Kl5NINHf6Y3a2Sohlwm0h0VDz6SJuVeH g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10541"; a="376607627"
X-IronPort-AV: E=Sophos;i="5.96,193,1665471600"; d="scan'208";a="376607627"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2022 03:14:46 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10541"; a="620310984"
X-IronPort-AV: E=Sophos;i="5.96,193,1665471600"; d="scan'208";a="620310984"
Received: from jbrophy1-mobl1.amr.corp.intel.com (HELO [10.213.194.13])
 ([10.213.194.13])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2022 03:14:44 -0800
Message-ID: <d92312af-3c84-8bd9-108b-719fb1ec3a6b@linux.intel.com>
Date: Fri, 25 Nov 2022 11:14:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [Intel-gfx] [PATCH 7/9] drm/i915: stop using ttm_bo_wait
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>
References: <20221125102137.1801-1-christian.koenig@amd.com>
 <20221125102137.1801-7-christian.koenig@amd.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20221125102137.1801-7-christian.koenig@amd.com>
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


+ Matt

On 25/11/2022 10:21, Christian König wrote:
> TTM is just wrapping core DMA functionality here, remove the mid-layer.
> No functional change.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index 5247d88b3c13..d409a77449a3 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -599,13 +599,16 @@ i915_ttm_resource_get_st(struct drm_i915_gem_object *obj,
>   static int i915_ttm_truncate(struct drm_i915_gem_object *obj)
>   {
>   	struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
> -	int err;
> +	long err;
>   
>   	WARN_ON_ONCE(obj->mm.madv == I915_MADV_WILLNEED);
>   
> -	err = ttm_bo_wait(bo, true, false);
> -	if (err)
> +	err = dma_resv_wait_timeout(bo->base.resv, DMA_RESV_USAGE_BOOKKEEP,
> +				    true, 15 * HZ);

This 15 second stuck out a bit for me and then on a slightly deeper look 
it seems this timeout will "leak" into a few of i915 code paths. If we 
look at the difference between the legacy shmem and ttm backend I am not 
sure if the legacy one is blocking or not - but if it can block I don't 
think it would have an arbitrary timeout like this. Matt your thoughts?

Regards,

Tvrtko

> +	if (err < 0)
>   		return err;
> +	if (err == 0)
> +		return -EBUSY;
>   
>   	err = i915_ttm_move_notify(bo);
>   	if (err)
