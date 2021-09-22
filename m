Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4918441468B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 12:35:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D416EB71;
	Wed, 22 Sep 2021 10:35:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C46D46EB6F;
 Wed, 22 Sep 2021 10:35:03 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10114"; a="203719689"
X-IronPort-AV: E=Sophos;i="5.85,313,1624345200"; d="scan'208";a="203719689"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2021 03:35:01 -0700
X-IronPort-AV: E=Sophos;i="5.85,313,1624345200"; d="scan'208";a="512930172"
Received: from bbrowne-mobl.ger.corp.intel.com (HELO [10.213.200.151])
 ([10.213.200.151])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2021 03:34:59 -0700
Subject: Re: [PATCH 15/26] drm/i915: use the new iterator in
 i915_request_await_object v2
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch
References: <20210922091044.2612-1-christian.koenig@amd.com>
 <20210922091044.2612-16-christian.koenig@amd.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <0af21739-f397-096b-d4fa-e51840603c6f@linux.intel.com>
Date: Wed, 22 Sep 2021 11:34:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210922091044.2612-16-christian.koenig@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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


On 22/09/2021 10:10, Christian König wrote:
> Simplifying the code a bit.
> 
> v2: add missing rcu_read_lock()/rcu_read_unlock()
> v3: use dma_resv_for_each_fence instead
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/i915/i915_request.c | 34 +++++------------------------
>   1 file changed, 5 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> index ce446716d092..3839712ebd23 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -1509,38 +1509,14 @@ i915_request_await_object(struct i915_request *to,
>   			  struct drm_i915_gem_object *obj,
>   			  bool write)
>   {
> -	struct dma_fence *excl;
> +	struct dma_resv_iter cursor;
> +	struct dma_fence *fence;
>   	int ret = 0;
>   
> -	if (write) {
> -		struct dma_fence **shared;
> -		unsigned int count, i;
> -
> -		ret = dma_resv_get_fences(obj->base.resv, &excl, &count,
> -					  &shared);
> +	dma_resv_for_each_fence(&cursor, obj->base.resv, write, fence) {
> +		ret = i915_request_await_dma_fence(to, fence);
>   		if (ret)
> -			return ret;
> -
> -		for (i = 0; i < count; i++) {
> -			ret = i915_request_await_dma_fence(to, shared[i]);
> -			if (ret)
> -				break;
> -
> -			dma_fence_put(shared[i]);
> -		}
> -
> -		for (; i < count; i++)
> -			dma_fence_put(shared[i]);
> -		kfree(shared);
> -	} else {
> -		excl = dma_resv_get_excl_unlocked(obj->base.resv);
> -	}
> -
> -	if (excl) {
> -		if (ret == 0)
> -			ret = i915_request_await_dma_fence(to, excl);
> -
> -		dma_fence_put(excl);
> +			break;
>   	}
>   
>   	return ret;
> 

Short and sweet. I hope CI confirms all callers have it locked and in 
the meantime I will risk it:

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
