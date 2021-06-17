Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC663ABAA5
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 19:30:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C54E6E955;
	Thu, 17 Jun 2021 17:30:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65D5D6E956
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 17:30:28 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id e22so4075843wrc.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 10:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=VKjsPb3fMCD82yCubTQnXQ11fo4UZaoUuAoRoa8fU+s=;
 b=LYE64+gU6GsbdZ3ljaR6NDVdeEdfR+hMQQMkPf8dNum9Pj2oGudcfZ/RS/JzmQMVLT
 Mm63h+ZyUo16OQRJNuRNG9ADWmJNgcmPdWfiXzP3oPSdbCbJ8ZtntEfAu9RkKoK6Lf3m
 CVVxpkCtbzXivnTmMEXhXEGHBp6NjvZ1TuKZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=VKjsPb3fMCD82yCubTQnXQ11fo4UZaoUuAoRoa8fU+s=;
 b=eXr9a5tgp+CIp9CRC67pQVtnnioIFngiPulqyNfErUn9EQg7bJEeeSRNFWj38/Pyt+
 vPd1QAhV/Fm7kiKwidCJ1gEKIKl8YCntDK8k7LoR2TxuAvDI1qg01tf2kTMrIGiLihSm
 1E51Bf3E74oMxT8oAKS0edcgwJzXqL6bzrGIOhtSZQJXojePapzE+8KMazxjBz8oqnp6
 Za7kgFgqO3PIAYQzBfVH9eFRZp0TrKtCJ+2OmzmVZfEUWIJa04Jeb/RCVCw3QMgRVwMk
 o88uF95AdD1fjXuo7xoiQNctp4EiUL0HV/IHVKlYGmMvFVZCu6UeSznbjrssFN3gwZXa
 9W9g==
X-Gm-Message-State: AOAM532VLcSloRaPbBtsPQDKIZ2MVhk+XwSO4YHWkI8xoV3KH5vW1wis
 KrqNo6teTcSKDzaf6IMXehNepQ==
X-Google-Smtp-Source: ABdhPJxKfIxjyPPs3id05Sig8SzR4i9jB56N51cHg3b/UeqChuSBHD1Fh+6wA4472aFmIly7PvwuZQ==
X-Received: by 2002:a05:6000:188:: with SMTP id
 p8mr7257378wrx.296.1623951026952; 
 Thu, 17 Jun 2021 10:30:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n6sm8004282wme.21.2021.06.17.10.30.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 10:30:26 -0700 (PDT)
Date: Thu, 17 Jun 2021 19:30:24 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 1/2] drm/amdgpu: unwrap fence chains in the explicit sync
 fence
Message-ID: <YMuGsGN/mxY+WU+q@phenom.ffwll.local>
References: <20210614174536.5188-1-christian.koenig@amd.com>
 <c474a0e1-e725-be64-0730-57231b5a8d15@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c474a0e1-e725-be64-0730-57231b5a8d15@gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: Alex Deucher <Alexander.Deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 17, 2021 at 09:44:25AM +0200, Christian König wrote:
> Alex do want to review those so that we can close the ticket?

Maybe I'm behind on mails, but 2nd patch still has the issues I think I'm
seeing ...
-Daniel

> 
> Thanks,
> Christian.
> 
> Am 14.06.21 um 19:45 schrieb Christian König:
> > Unwrap the explicit fence if it is a dma_fence_chain and
> > sync to the first fence not matching the owner rules.
> > 
> > Signed-off-by: Christian König <christian.koenig@amd.com>
> > Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c | 118 +++++++++++++----------
> >   1 file changed, 68 insertions(+), 50 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> > index 1b2ceccaf5b0..862eb3c1c4c5 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> > @@ -28,6 +28,8 @@
> >    *    Christian König <christian.koenig@amd.com>
> >    */
> > +#include <linux/dma-fence-chain.h>
> > +
> >   #include "amdgpu.h"
> >   #include "amdgpu_trace.h"
> >   #include "amdgpu_amdkfd.h"
> > @@ -186,6 +188,55 @@ int amdgpu_sync_vm_fence(struct amdgpu_sync *sync, struct dma_fence *fence)
> >   	return amdgpu_sync_fence(sync, fence);
> >   }
> > +/* Determine based on the owner and mode if we should sync to a fence or not */
> > +static bool amdgpu_sync_test_fence(struct amdgpu_device *adev,
> > +				   enum amdgpu_sync_mode mode,
> > +				   void *owner, struct dma_fence *f)
> > +{
> > +	void *fence_owner = amdgpu_sync_get_owner(f);
> > +
> > +	/* Always sync to moves, no matter what */
> > +	if (fence_owner == AMDGPU_FENCE_OWNER_UNDEFINED)
> > +		return true;
> > +
> > +	/* We only want to trigger KFD eviction fences on
> > +	 * evict or move jobs. Skip KFD fences otherwise.
> > +	 */
> > +	if (fence_owner == AMDGPU_FENCE_OWNER_KFD &&
> > +	    owner != AMDGPU_FENCE_OWNER_UNDEFINED)
> > +		return false;
> > +
> > +	/* Never sync to VM updates either. */
> > +	if (fence_owner == AMDGPU_FENCE_OWNER_VM &&
> > +	    owner != AMDGPU_FENCE_OWNER_UNDEFINED)
> > +		return false;
> > +
> > +	/* Ignore fences depending on the sync mode */
> > +	switch (mode) {
> > +	case AMDGPU_SYNC_ALWAYS:
> > +		return true;
> > +
> > +	case AMDGPU_SYNC_NE_OWNER:
> > +		if (amdgpu_sync_same_dev(adev, f) &&
> > +		    fence_owner == owner)
> > +			return false;
> > +		break;
> > +
> > +	case AMDGPU_SYNC_EQ_OWNER:
> > +		if (amdgpu_sync_same_dev(adev, f) &&
> > +		    fence_owner != owner)
> > +			return false;
> > +		break;
> > +
> > +	case AMDGPU_SYNC_EXPLICIT:
> > +		return false;
> > +	}
> > +
> > +	WARN(debug_evictions && fence_owner == AMDGPU_FENCE_OWNER_KFD,
> > +	     "Adding eviction fence to sync obj");
> > +	return true;
> > +}
> > +
> >   /**
> >    * amdgpu_sync_resv - sync to a reservation object
> >    *
> > @@ -211,67 +262,34 @@ int amdgpu_sync_resv(struct amdgpu_device *adev, struct amdgpu_sync *sync,
> >   	/* always sync to the exclusive fence */
> >   	f = dma_resv_excl_fence(resv);
> > -	r = amdgpu_sync_fence(sync, f);
> > +	dma_fence_chain_for_each(f, f) {
> > +		struct dma_fence_chain *chain = to_dma_fence_chain(f);
> > +
> > +		if (amdgpu_sync_test_fence(adev, mode, owner, chain ?
> > +					   chain->fence : f)) {
> > +			r = amdgpu_sync_fence(sync, f);
> > +			dma_fence_put(f);
> > +			if (r)
> > +				return r;
> > +			break;
> > +		}
> > +	}
> >   	flist = dma_resv_shared_list(resv);
> > -	if (!flist || r)
> > -		return r;
> > +	if (!flist)
> > +		return 0;
> >   	for (i = 0; i < flist->shared_count; ++i) {
> > -		void *fence_owner;
> > -
> >   		f = rcu_dereference_protected(flist->shared[i],
> >   					      dma_resv_held(resv));
> > -		fence_owner = amdgpu_sync_get_owner(f);
> > -
> > -		/* Always sync to moves, no matter what */
> > -		if (fence_owner == AMDGPU_FENCE_OWNER_UNDEFINED) {
> > +		if (amdgpu_sync_test_fence(adev, mode, owner, f)) {
> >   			r = amdgpu_sync_fence(sync, f);
> >   			if (r)
> > -				break;
> > -		}
> > -
> > -		/* We only want to trigger KFD eviction fences on
> > -		 * evict or move jobs. Skip KFD fences otherwise.
> > -		 */
> > -		if (fence_owner == AMDGPU_FENCE_OWNER_KFD &&
> > -		    owner != AMDGPU_FENCE_OWNER_UNDEFINED)
> > -			continue;
> > -
> > -		/* Never sync to VM updates either. */
> > -		if (fence_owner == AMDGPU_FENCE_OWNER_VM &&
> > -		    owner != AMDGPU_FENCE_OWNER_UNDEFINED)
> > -			continue;
> > -
> > -		/* Ignore fences depending on the sync mode */
> > -		switch (mode) {
> > -		case AMDGPU_SYNC_ALWAYS:
> > -			break;
> > -
> > -		case AMDGPU_SYNC_NE_OWNER:
> > -			if (amdgpu_sync_same_dev(adev, f) &&
> > -			    fence_owner == owner)
> > -				continue;
> > -			break;
> > -
> > -		case AMDGPU_SYNC_EQ_OWNER:
> > -			if (amdgpu_sync_same_dev(adev, f) &&
> > -			    fence_owner != owner)
> > -				continue;
> > -			break;
> > -
> > -		case AMDGPU_SYNC_EXPLICIT:
> > -			continue;
> > +				return r;
> >   		}
> > -
> > -		WARN(debug_evictions && fence_owner == AMDGPU_FENCE_OWNER_KFD,
> > -		     "Adding eviction fence to sync obj");
> > -		r = amdgpu_sync_fence(sync, f);
> > -		if (r)
> > -			break;
> >   	}
> > -	return r;
> > +	return 0;
> >   }
> >   /**
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
