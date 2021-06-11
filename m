Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C3F3A3E9F
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 11:07:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23B076EE55;
	Fri, 11 Jun 2021 09:07:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E972B6EE54
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 09:07:28 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id z8so5220104wrp.12
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 02:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=v21KKQzll9R0YfaiRjmlIqWbMoPlP2MmVWyU0c10zBw=;
 b=EN45abN0G4uSRlXtfQk1xxxIokti7e65qY9fPMwgXEEVlLVmguU+7A33VMbdvW+W1B
 AdeTvFdjjkirtZmtu7cjyYAleSly4PkQX2HaNGrcGJVjjr+k3qlUbVcY01nWqojYrnjE
 LkphDMSQVXeXrioXVeWefXGwYqUxzOsJj8RNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=v21KKQzll9R0YfaiRjmlIqWbMoPlP2MmVWyU0c10zBw=;
 b=ouoIsDFEaJ7X0pKBEFJQlnJzLChtCAr5p87CdJFQwjjetltZHIU75VICkrbzG3TL0k
 fDD5nJzeAs6CBlKNnoMazFtf3+MCYcotjHLOfV6XgSDPUJ1st11WxrfDvTdkC9F4UP6d
 Mw/QW0gxSyV82Ur/4ObeNnaomsMhn11Dh3QMjAOcz78PJ/bh6wtiSvEmSBgF1sDW4A65
 4Lvunsyhl7xR2Y8x2eL0+mzZiQ2xU7dXbpcXjC48BM9neK0pc3kZg7eO4lS6S3SyGuzq
 DdbEYTqSVCyXgUtP6lPjlQ1ZbduhtfPkpYvrBEG9y/lX1ANXAJ9NkJl2QkV4qeCrx2Zp
 nL1A==
X-Gm-Message-State: AOAM5318U4eJiGeNraRenNjtoEXHTiHA3UbqrVY8jtHZtnO95cVsOl6S
 2OrURVmWqHvYc0yNfbYan9Ufvg==
X-Google-Smtp-Source: ABdhPJxTEW1FkvNi27QxV8GfcShhg+CWBBWO9mLAxNj2IglWZ/6UBlEHd5CBYNiHXVKyDIP1DRnJpQ==
X-Received: by 2002:adf:ef06:: with SMTP id e6mr2855936wro.393.1623402447481; 
 Fri, 11 Jun 2021 02:07:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a12sm5295615wmj.36.2021.06.11.02.07.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 02:07:27 -0700 (PDT)
Date: Fri, 11 Jun 2021 11:07:25 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 6/7] drm/amdgpu: unwrap fence chains in the explicit sync
 fence
Message-ID: <YMMnzbky0W72PH1d@phenom.ffwll.local>
References: <20210610091800.1833-1-christian.koenig@amd.com>
 <20210610091800.1833-7-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210610091800.1833-7-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 10, 2021 at 11:17:59AM +0200, Christian König wrote:
> Unwrap a the explicit fence if it is a dma_fence_chain and
> sync to the first fence not matching the owner rules.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c | 118 +++++++++++++----------
>  1 file changed, 68 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> index 1b2ceccaf5b0..862eb3c1c4c5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> @@ -28,6 +28,8 @@
>   *    Christian König <christian.koenig@amd.com>
>   */
>  
> +#include <linux/dma-fence-chain.h>
> +
>  #include "amdgpu.h"
>  #include "amdgpu_trace.h"
>  #include "amdgpu_amdkfd.h"
> @@ -186,6 +188,55 @@ int amdgpu_sync_vm_fence(struct amdgpu_sync *sync, struct dma_fence *fence)
>  	return amdgpu_sync_fence(sync, fence);
>  }
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
>  /**
>   * amdgpu_sync_resv - sync to a reservation object
>   *
> @@ -211,67 +262,34 @@ int amdgpu_sync_resv(struct amdgpu_device *adev, struct amdgpu_sync *sync,
>  
>  	/* always sync to the exclusive fence */
>  	f = dma_resv_excl_fence(resv);
> -	r = amdgpu_sync_fence(sync, f);
> +	dma_fence_chain_for_each(f, f) {

Jason has some helper for deep-walking fence chains/arrays here I think.
Might want to look into that, so that we have some consistency in how we
pile up multiple exclusive fences.

Anyway pretty much one of the versions I had in mind too, except I didn't
type it up.

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

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
>  	flist = dma_resv_shared_list(resv);
> -	if (!flist || r)
> -		return r;
> +	if (!flist)
> +		return 0;
>  
>  	for (i = 0; i < flist->shared_count; ++i) {
> -		void *fence_owner;
> -
>  		f = rcu_dereference_protected(flist->shared[i],
>  					      dma_resv_held(resv));
>  
> -		fence_owner = amdgpu_sync_get_owner(f);
> -
> -		/* Always sync to moves, no matter what */
> -		if (fence_owner == AMDGPU_FENCE_OWNER_UNDEFINED) {
> +		if (amdgpu_sync_test_fence(adev, mode, owner, f)) {
>  			r = amdgpu_sync_fence(sync, f);
>  			if (r)
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
>  		}
> -
> -		WARN(debug_evictions && fence_owner == AMDGPU_FENCE_OWNER_KFD,
> -		     "Adding eviction fence to sync obj");
> -		r = amdgpu_sync_fence(sync, f);
> -		if (r)
> -			break;
>  	}
> -	return r;
> +	return 0;
>  }
>  
>  /**
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
