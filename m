Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F633AADE9
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 09:44:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF65F6E0C8;
	Thu, 17 Jun 2021 07:44:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE136E0C8;
 Thu, 17 Jun 2021 07:44:28 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id l1so8233118ejb.6;
 Thu, 17 Jun 2021 00:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=mH6Np5gnCwiK1lKwW3Co42HomL1U87KMUL3SztR36D0=;
 b=O6HVJIih3Zbk/YXiCHGIsJpGQQ3J7RiozNFGNN5X2NaIXDWc2Pl2ksKE2VD60YldA8
 3+xTwHRC+7P7yZt/BBY2L3UMce4lYIfQxifhVya3/xvuN8eRFTh2I4FLf/wgGEDaBqmX
 WTcPY2lt7qhPEYAe8u20Lad4Jg7FYQSRQTBL3QAh5M8eh1aftkClZz4yIwKfm1F2WuJc
 cxCJa0BxA/sQqd7P5iwfbDtUGbG2r2FHm2o/PUUJjTclymFdgQesZ9DE6VVMBpcoWrCQ
 NQATqUYj+LuqP3H5k2IhLa4pLl3LUtl32QZ0O/OazF/8mNc+tUOem5ZDg2c0Ymz8NNjm
 3JhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=mH6Np5gnCwiK1lKwW3Co42HomL1U87KMUL3SztR36D0=;
 b=j0fTP9Ra9dd3pgyZmuo7fRCUIJoFJXt1aV1vX9NzawAaMeFLE8gcgFSUdT9aMISfgp
 MMOgo4xHOnaYUcnGIWR74Km9kNWIE/DlSYzQn8G2B+x18WBK8e6Q6bBd3o8U/OjgSFfD
 cyNFtoJz7qd0PSZjatl8f0+SzdpaHCHs0jJGbQ3/YlHXe0PKyEKQM8iSxEzwERhdU7v5
 1ZO490RTnL03ZEi4+wSvM0kIKPwjM9Vjivi1rEGr5o1DPxt6uHFx+Vf9RLV7ANibvI6L
 9f7X1rletqoEIOK7mIegFwGA88FiJNRKY5ZV9OtBgRkfRZUYlPPD8it0e7M/NFUSFqgJ
 xtXg==
X-Gm-Message-State: AOAM531vNgsxESY7WrCGuzxDNoXIM8DIMhnrCZFneApTLzvtTyDHw63j
 ZXIGD0QzawnDI3IdkLqbd5qrtmUG2Bc=
X-Google-Smtp-Source: ABdhPJz5GBYaJiiB5E/KPlx4CW2B0B2tIwjeqp+mel1rygGB/Rak9sbQgBV8xLzQzaXUXdVBsrG90w==
X-Received: by 2002:a17:907:2074:: with SMTP id
 qp20mr3826949ejb.35.1623915866870; 
 Thu, 17 Jun 2021 00:44:26 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:9a20:5ac9:ee4d:c186?
 ([2a02:908:1252:fb60:9a20:5ac9:ee4d:c186])
 by smtp.gmail.com with ESMTPSA id x9sm3316211ejc.37.2021.06.17.00.44.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jun 2021 00:44:26 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/amdgpu: unwrap fence chains in the explicit sync
 fence
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <Alexander.Deucher@amd.com>
References: <20210614174536.5188-1-christian.koenig@amd.com>
Message-ID: <c474a0e1-e725-be64-0730-57231b5a8d15@gmail.com>
Date: Thu, 17 Jun 2021 09:44:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210614174536.5188-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Alex do want to review those so that we can close the ticket?

Thanks,
Christian.

Am 14.06.21 um 19:45 schrieb Christian König:
> Unwrap the explicit fence if it is a dma_fence_chain and
> sync to the first fence not matching the owner rules.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c | 118 +++++++++++++----------
>   1 file changed, 68 insertions(+), 50 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> index 1b2ceccaf5b0..862eb3c1c4c5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> @@ -28,6 +28,8 @@
>    *    Christian König <christian.koenig@amd.com>
>    */
>   
> +#include <linux/dma-fence-chain.h>
> +
>   #include "amdgpu.h"
>   #include "amdgpu_trace.h"
>   #include "amdgpu_amdkfd.h"
> @@ -186,6 +188,55 @@ int amdgpu_sync_vm_fence(struct amdgpu_sync *sync, struct dma_fence *fence)
>   	return amdgpu_sync_fence(sync, fence);
>   }
>   
> +/* Determine based on the owner and mode if we should sync to a fence or not */
> +static bool amdgpu_sync_test_fence(struct amdgpu_device *adev,
> +				   enum amdgpu_sync_mode mode,
> +				   void *owner, struct dma_fence *f)
> +{
> +	void *fence_owner = amdgpu_sync_get_owner(f);
> +
> +	/* Always sync to moves, no matter what */
> +	if (fence_owner == AMDGPU_FENCE_OWNER_UNDEFINED)
> +		return true;
> +
> +	/* We only want to trigger KFD eviction fences on
> +	 * evict or move jobs. Skip KFD fences otherwise.
> +	 */
> +	if (fence_owner == AMDGPU_FENCE_OWNER_KFD &&
> +	    owner != AMDGPU_FENCE_OWNER_UNDEFINED)
> +		return false;
> +
> +	/* Never sync to VM updates either. */
> +	if (fence_owner == AMDGPU_FENCE_OWNER_VM &&
> +	    owner != AMDGPU_FENCE_OWNER_UNDEFINED)
> +		return false;
> +
> +	/* Ignore fences depending on the sync mode */
> +	switch (mode) {
> +	case AMDGPU_SYNC_ALWAYS:
> +		return true;
> +
> +	case AMDGPU_SYNC_NE_OWNER:
> +		if (amdgpu_sync_same_dev(adev, f) &&
> +		    fence_owner == owner)
> +			return false;
> +		break;
> +
> +	case AMDGPU_SYNC_EQ_OWNER:
> +		if (amdgpu_sync_same_dev(adev, f) &&
> +		    fence_owner != owner)
> +			return false;
> +		break;
> +
> +	case AMDGPU_SYNC_EXPLICIT:
> +		return false;
> +	}
> +
> +	WARN(debug_evictions && fence_owner == AMDGPU_FENCE_OWNER_KFD,
> +	     "Adding eviction fence to sync obj");
> +	return true;
> +}
> +
>   /**
>    * amdgpu_sync_resv - sync to a reservation object
>    *
> @@ -211,67 +262,34 @@ int amdgpu_sync_resv(struct amdgpu_device *adev, struct amdgpu_sync *sync,
>   
>   	/* always sync to the exclusive fence */
>   	f = dma_resv_excl_fence(resv);
> -	r = amdgpu_sync_fence(sync, f);
> +	dma_fence_chain_for_each(f, f) {
> +		struct dma_fence_chain *chain = to_dma_fence_chain(f);
> +
> +		if (amdgpu_sync_test_fence(adev, mode, owner, chain ?
> +					   chain->fence : f)) {
> +			r = amdgpu_sync_fence(sync, f);
> +			dma_fence_put(f);
> +			if (r)
> +				return r;
> +			break;
> +		}
> +	}
>   
>   	flist = dma_resv_shared_list(resv);
> -	if (!flist || r)
> -		return r;
> +	if (!flist)
> +		return 0;
>   
>   	for (i = 0; i < flist->shared_count; ++i) {
> -		void *fence_owner;
> -
>   		f = rcu_dereference_protected(flist->shared[i],
>   					      dma_resv_held(resv));
>   
> -		fence_owner = amdgpu_sync_get_owner(f);
> -
> -		/* Always sync to moves, no matter what */
> -		if (fence_owner == AMDGPU_FENCE_OWNER_UNDEFINED) {
> +		if (amdgpu_sync_test_fence(adev, mode, owner, f)) {
>   			r = amdgpu_sync_fence(sync, f);
>   			if (r)
> -				break;
> -		}
> -
> -		/* We only want to trigger KFD eviction fences on
> -		 * evict or move jobs. Skip KFD fences otherwise.
> -		 */
> -		if (fence_owner == AMDGPU_FENCE_OWNER_KFD &&
> -		    owner != AMDGPU_FENCE_OWNER_UNDEFINED)
> -			continue;
> -
> -		/* Never sync to VM updates either. */
> -		if (fence_owner == AMDGPU_FENCE_OWNER_VM &&
> -		    owner != AMDGPU_FENCE_OWNER_UNDEFINED)
> -			continue;
> -
> -		/* Ignore fences depending on the sync mode */
> -		switch (mode) {
> -		case AMDGPU_SYNC_ALWAYS:
> -			break;
> -
> -		case AMDGPU_SYNC_NE_OWNER:
> -			if (amdgpu_sync_same_dev(adev, f) &&
> -			    fence_owner == owner)
> -				continue;
> -			break;
> -
> -		case AMDGPU_SYNC_EQ_OWNER:
> -			if (amdgpu_sync_same_dev(adev, f) &&
> -			    fence_owner != owner)
> -				continue;
> -			break;
> -
> -		case AMDGPU_SYNC_EXPLICIT:
> -			continue;
> +				return r;
>   		}
> -
> -		WARN(debug_evictions && fence_owner == AMDGPU_FENCE_OWNER_KFD,
> -		     "Adding eviction fence to sync obj");
> -		r = amdgpu_sync_fence(sync, f);
> -		if (r)
> -			break;
>   	}
> -	return r;
> +	return 0;
>   }
>   
>   /**

