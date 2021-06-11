Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0FD3A44C6
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 17:19:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93DED6EEB4;
	Fri, 11 Jun 2021 15:18:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5AF06EEB2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 15:18:56 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id n7so360031wri.3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 08:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=3iqaXNgmnvZ8TaI6LhxGwpRrzzL1y/PANdUyFJQrPsk=;
 b=i26rhj6uM+OPLGWa8vOxKTQRw6N0p31AvABUl6VD5OCQOA9pPqYlgNVuvXSkJdDQHA
 6sHDDWoACam7tMrtfeglQ/dwOa8loYDPfixfBitYzfeMT9lXCQIYuFtnL4v91ml58CCM
 XJg9OPblB1rr2XLbl43z98LMde0hcmLNuEC+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=3iqaXNgmnvZ8TaI6LhxGwpRrzzL1y/PANdUyFJQrPsk=;
 b=QS/J61MrdUetjY2pz5yayHcVvSue5sWR3ipNk5NpB268GRwT3bg5JYTUVoOwFz5HmF
 n+xhZ91YAInKeWZLtPqgtb7rF2cI+rHV5juxwgNWvMpRb/CjQe22e5ZG4zkXtwJ+0S4c
 eu2d5b/t2LPXsgxTJ2GVe0sTPEOkJDVrYDCsVzEJOD+nWZvSAFzU9Bae9vAEDLFQhSJ4
 KQwaci1Vof+V6bNlovjfuYDqGdPwgYBzEoUgPiEHO2tbweSfbzVvkmnfiqpoXdGT4tpG
 SbjgwDH1sd1n8nFKNt1YjgXvh221vd0/4xALPlx87jIgcui+WEo4G5mf2k80ZDaldNnn
 OMnQ==
X-Gm-Message-State: AOAM5320bbC1F72e4nqDUgm3cNjTBUWOFkaYOtXyMlzq32zB5G5PxqEu
 RY6xLCVJE05NF7W8Ww8DpVnWc0dHOQyEZg==
X-Google-Smtp-Source: ABdhPJwBZ5ngzJYSE8iwjmZUvzXOwHjadV2GTEa7zjBCIgexa7etmhJ5PIbWf1zqzo0fAPCESkIe3w==
X-Received: by 2002:adf:d1c3:: with SMTP id b3mr4802740wrd.110.1623424734793; 
 Fri, 11 Jun 2021 08:18:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w11sm7470554wrv.89.2021.06.11.08.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 08:18:53 -0700 (PDT)
Date: Fri, 11 Jun 2021 17:18:51 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 6/7] drm/amdgpu: unwrap fence chains in the explicit sync
 fence
Message-ID: <YMN+211wnBJJIj1I@phenom.ffwll.local>
References: <20210610091800.1833-1-christian.koenig@amd.com>
 <20210610091800.1833-7-christian.koenig@amd.com>
 <YMMnzbky0W72PH1d@phenom.ffwll.local>
 <51256567-84d3-76a9-31aa-aee96d01364a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <51256567-84d3-76a9-31aa-aee96d01364a@gmail.com>
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

On Fri, Jun 11, 2021 at 12:09:19PM +0200, Christian König wrote:
> Am 11.06.21 um 11:07 schrieb Daniel Vetter:
> > On Thu, Jun 10, 2021 at 11:17:59AM +0200, Christian König wrote:
> > > Unwrap a the explicit fence if it is a dma_fence_chain and
> > > sync to the first fence not matching the owner rules.
> > > 
> > > Signed-off-by: Christian König <christian.koenig@amd.com>
> > > ---
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c | 118 +++++++++++++----------
> > >   1 file changed, 68 insertions(+), 50 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> > > index 1b2ceccaf5b0..862eb3c1c4c5 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> > > @@ -28,6 +28,8 @@
> > >    *    Christian König <christian.koenig@amd.com>
> > >    */
> > > +#include <linux/dma-fence-chain.h>
> > > +
> > >   #include "amdgpu.h"
> > >   #include "amdgpu_trace.h"
> > >   #include "amdgpu_amdkfd.h"
> > > @@ -186,6 +188,55 @@ int amdgpu_sync_vm_fence(struct amdgpu_sync *sync, struct dma_fence *fence)
> > >   	return amdgpu_sync_fence(sync, fence);
> > >   }
> > > +/* Determine based on the owner and mode if we should sync to a fence or not */
> > > +static bool amdgpu_sync_test_fence(struct amdgpu_device *adev,
> > > +				   enum amdgpu_sync_mode mode,
> > > +				   void *owner, struct dma_fence *f)
> > > +{
> > > +	void *fence_owner = amdgpu_sync_get_owner(f);
> > > +
> > > +	/* Always sync to moves, no matter what */
> > > +	if (fence_owner == AMDGPU_FENCE_OWNER_UNDEFINED)
> > > +		return true;
> > > +
> > > +	/* We only want to trigger KFD eviction fences on
> > > +	 * evict or move jobs. Skip KFD fences otherwise.
> > > +	 */
> > > +	if (fence_owner == AMDGPU_FENCE_OWNER_KFD &&
> > > +	    owner != AMDGPU_FENCE_OWNER_UNDEFINED)
> > > +		return false;
> > > +
> > > +	/* Never sync to VM updates either. */
> > > +	if (fence_owner == AMDGPU_FENCE_OWNER_VM &&
> > > +	    owner != AMDGPU_FENCE_OWNER_UNDEFINED)
> > > +		return false;
> > > +
> > > +	/* Ignore fences depending on the sync mode */
> > > +	switch (mode) {
> > > +	case AMDGPU_SYNC_ALWAYS:
> > > +		return true;
> > > +
> > > +	case AMDGPU_SYNC_NE_OWNER:
> > > +		if (amdgpu_sync_same_dev(adev, f) &&
> > > +		    fence_owner == owner)
> > > +			return false;
> > > +		break;
> > > +
> > > +	case AMDGPU_SYNC_EQ_OWNER:
> > > +		if (amdgpu_sync_same_dev(adev, f) &&
> > > +		    fence_owner != owner)
> > > +			return false;
> > > +		break;
> > > +
> > > +	case AMDGPU_SYNC_EXPLICIT:
> > > +		return false;
> > > +	}
> > > +
> > > +	WARN(debug_evictions && fence_owner == AMDGPU_FENCE_OWNER_KFD,
> > > +	     "Adding eviction fence to sync obj");
> > > +	return true;
> > > +}
> > > +
> > >   /**
> > >    * amdgpu_sync_resv - sync to a reservation object
> > >    *
> > > @@ -211,67 +262,34 @@ int amdgpu_sync_resv(struct amdgpu_device *adev, struct amdgpu_sync *sync,
> > >   	/* always sync to the exclusive fence */
> > >   	f = dma_resv_excl_fence(resv);
> > > -	r = amdgpu_sync_fence(sync, f);
> > > +	dma_fence_chain_for_each(f, f) {
> > Jason has some helper for deep-walking fence chains/arrays here I think.
> > Might want to look into that, so that we have some consistency in how we
> > pile up multiple exclusive fences.
> 
> Well those helpers are not from Jason, but from me :)
> 
> But no, for now the deep inspection is not really helpful here since
> grabbing a reference to a certain chain node is what that makes the handling
> easier and faster here.
> 
> Thinking more about it that should also make it possible for the garbage
> collection to kick in properly.

Hm this is tricky to reason about, but yeah with this here it's a true
chain, and you just need to connect them. But then if a buffer is on
multiple engines, collapsing things down occasionally might be useful.

But maybe we need to do that in the bigger rework where exclusive fences
are also just in the dma_fence_list with a "this is an exclusive one btw"
tag.

I think for the vk import case doing the deep scan makes more sense, it's
a once-per-frame thing, and there's a much bigger chance that you have a
pile of fences from different engines on it already.

I think a comment explaining why we think deep scan isn't a good idea here
would be good, just so we can appreciate our foolishness when it all goes
wrong :-)
-Daniel


> > 
> > Anyway pretty much one of the versions I had in mind too, except I didn't
> > type it up.
> > 
> > Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> Thanks,
> Christian.
> 
> > 
> > > +		struct dma_fence_chain *chain = to_dma_fence_chain(f);
> > > +
> > > +		if (amdgpu_sync_test_fence(adev, mode, owner, chain ?
> > > +					   chain->fence : f)) {
> > > +			r = amdgpu_sync_fence(sync, f);
> > > +			dma_fence_put(f);
> > > +			if (r)
> > > +				return r;
> > > +			break;
> > > +		}
> > > +	}
> > >   	flist = dma_resv_shared_list(resv);
> > > -	if (!flist || r)
> > > -		return r;
> > > +	if (!flist)
> > > +		return 0;
> > >   	for (i = 0; i < flist->shared_count; ++i) {
> > > -		void *fence_owner;
> > > -
> > >   		f = rcu_dereference_protected(flist->shared[i],
> > >   					      dma_resv_held(resv));
> > > -		fence_owner = amdgpu_sync_get_owner(f);
> > > -
> > > -		/* Always sync to moves, no matter what */
> > > -		if (fence_owner == AMDGPU_FENCE_OWNER_UNDEFINED) {
> > > +		if (amdgpu_sync_test_fence(adev, mode, owner, f)) {
> > >   			r = amdgpu_sync_fence(sync, f);
> > >   			if (r)
> > > -				break;
> > > -		}
> > > -
> > > -		/* We only want to trigger KFD eviction fences on
> > > -		 * evict or move jobs. Skip KFD fences otherwise.
> > > -		 */
> > > -		if (fence_owner == AMDGPU_FENCE_OWNER_KFD &&
> > > -		    owner != AMDGPU_FENCE_OWNER_UNDEFINED)
> > > -			continue;
> > > -
> > > -		/* Never sync to VM updates either. */
> > > -		if (fence_owner == AMDGPU_FENCE_OWNER_VM &&
> > > -		    owner != AMDGPU_FENCE_OWNER_UNDEFINED)
> > > -			continue;
> > > -
> > > -		/* Ignore fences depending on the sync mode */
> > > -		switch (mode) {
> > > -		case AMDGPU_SYNC_ALWAYS:
> > > -			break;
> > > -
> > > -		case AMDGPU_SYNC_NE_OWNER:
> > > -			if (amdgpu_sync_same_dev(adev, f) &&
> > > -			    fence_owner == owner)
> > > -				continue;
> > > -			break;
> > > -
> > > -		case AMDGPU_SYNC_EQ_OWNER:
> > > -			if (amdgpu_sync_same_dev(adev, f) &&
> > > -			    fence_owner != owner)
> > > -				continue;
> > > -			break;
> > > -
> > > -		case AMDGPU_SYNC_EXPLICIT:
> > > -			continue;
> > > +				return r;
> > >   		}
> > > -
> > > -		WARN(debug_evictions && fence_owner == AMDGPU_FENCE_OWNER_KFD,
> > > -		     "Adding eviction fence to sync obj");
> > > -		r = amdgpu_sync_fence(sync, f);
> > > -		if (r)
> > > -			break;
> > >   	}
> > > -	return r;
> > > +	return 0;
> > >   }
> > >   /**
> > > -- 
> > > 2.25.1
> > > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
