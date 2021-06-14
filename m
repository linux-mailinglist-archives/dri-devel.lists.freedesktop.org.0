Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1518C3A5DAC
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 09:25:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B74C89D5E;
	Mon, 14 Jun 2021 07:25:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A56B89D5C;
 Mon, 14 Jun 2021 07:25:47 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id ce15so14906717ejb.4;
 Mon, 14 Jun 2021 00:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=3S+6hdJy8zT5PHSGGEV92GAMPcCN8sAp6uvhaz0ZJbw=;
 b=DHNz9DF2Lc5rbJmGSKKv6zQcGKUrdUQ1ZAAHNs71gFIa86bAhrrWXsTYm3GEx27PVv
 omhouq8DkKXMBKzHqZWpgg9+T/iLFNr+eiN4u11sLzmq5uYi1pg/beZSNl4fLvdM7MK7
 oAuaeuhXli26Q2sO1x6NdwoXh5JN8VXMPyVZI6y89n6kOxxNv1OpDTWpQtKCwj8YE0jc
 RM1lMAYNFihi3EoOP98tDFslenzPRvXjXrTNASuDd2J6aDe93Uf0GYspoe1wo+SBb0sx
 AoRlNLeS/H2TqTcBVWmhTJ8q3S3xGDv6h0QMa5OWrJSZcuWnfZNUHrZwGJLPTq2K5Uw/
 caaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=3S+6hdJy8zT5PHSGGEV92GAMPcCN8sAp6uvhaz0ZJbw=;
 b=Te6JgyYuZUZQS31QSMXLB0//aot2GIrDbOhFNzS4202qERUwyrILFBlP5eJtGWT0p8
 Ofpwr/T+jcfIS7KSHL2+dKIYeK2/hDy2jP+7jCdc2Ua7uRPfTs+yPVGPCET1DK3j0pbT
 lsJOqPzeviTJ9NO1DzRByJrGqbCZxoiV/yfKEiRv1gIOh7dWRth5WdutcwhCIjUY3BMS
 JZhOX/MeUt40PUEKB8Sc0GgaLw8n0DGivUj98Ackcf5jTnbVctCme6ttlFl8AcbX6Yyk
 ca7DFog3QolW7ivCmDN1+owbdNJlXTc0Nbq/6MgcDI41VpEVCNsWCTC7+63szl6ToGdv
 wxEA==
X-Gm-Message-State: AOAM530CP02pS50TLjg1WCZXr32IpNuHzHn69EZw0mbA2CVx6qSiOSKR
 uMxf1h24eQPtTYBmRs8Y6pYxUsbXUSE=
X-Google-Smtp-Source: ABdhPJzEBzFWqZ5/EYN1uIEqO2n2lnL/whIG/xnmXtmDd1cPtizEqPSu9Zl+hGhvV52wQMTL8C0cDQ==
X-Received: by 2002:a17:906:b6c5:: with SMTP id
 ec5mr13913525ejb.290.1623655546017; 
 Mon, 14 Jun 2021 00:25:46 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:798b:5008:13f6:30a9?
 ([2a02:908:1252:fb60:798b:5008:13f6:30a9])
 by smtp.gmail.com with ESMTPSA id w8sm148647edc.39.2021.06.14.00.25.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 00:25:45 -0700 (PDT)
Subject: Re: [PATCH 6/7] drm/amdgpu: unwrap fence chains in the explicit sync
 fence
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210610091800.1833-1-christian.koenig@amd.com>
 <20210610091800.1833-7-christian.koenig@amd.com>
 <YMMnzbky0W72PH1d@phenom.ffwll.local>
 <51256567-84d3-76a9-31aa-aee96d01364a@gmail.com>
 <YMN+211wnBJJIj1I@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <1ee8f984-783a-7522-fe4f-1a9593004828@gmail.com>
Date: Mon, 14 Jun 2021 09:25:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YMN+211wnBJJIj1I@phenom.ffwll.local>
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 11.06.21 um 17:18 schrieb Daniel Vetter:
> On Fri, Jun 11, 2021 at 12:09:19PM +0200, Christian König wrote:
>> Am 11.06.21 um 11:07 schrieb Daniel Vetter:
>>> On Thu, Jun 10, 2021 at 11:17:59AM +0200, Christian König wrote:
>>>> Unwrap a the explicit fence if it is a dma_fence_chain and
>>>> sync to the first fence not matching the owner rules.
>>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> ---
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c | 118 +++++++++++++----------
>>>>    1 file changed, 68 insertions(+), 50 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
>>>> index 1b2ceccaf5b0..862eb3c1c4c5 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
>>>> @@ -28,6 +28,8 @@
>>>>     *    Christian König <christian.koenig@amd.com>
>>>>     */
>>>> +#include <linux/dma-fence-chain.h>
>>>> +
>>>>    #include "amdgpu.h"
>>>>    #include "amdgpu_trace.h"
>>>>    #include "amdgpu_amdkfd.h"
>>>> @@ -186,6 +188,55 @@ int amdgpu_sync_vm_fence(struct amdgpu_sync *sync, struct dma_fence *fence)
>>>>    	return amdgpu_sync_fence(sync, fence);
>>>>    }
>>>> +/* Determine based on the owner and mode if we should sync to a fence or not */
>>>> +static bool amdgpu_sync_test_fence(struct amdgpu_device *adev,
>>>> +				   enum amdgpu_sync_mode mode,
>>>> +				   void *owner, struct dma_fence *f)
>>>> +{
>>>> +	void *fence_owner = amdgpu_sync_get_owner(f);
>>>> +
>>>> +	/* Always sync to moves, no matter what */
>>>> +	if (fence_owner == AMDGPU_FENCE_OWNER_UNDEFINED)
>>>> +		return true;
>>>> +
>>>> +	/* We only want to trigger KFD eviction fences on
>>>> +	 * evict or move jobs. Skip KFD fences otherwise.
>>>> +	 */
>>>> +	if (fence_owner == AMDGPU_FENCE_OWNER_KFD &&
>>>> +	    owner != AMDGPU_FENCE_OWNER_UNDEFINED)
>>>> +		return false;
>>>> +
>>>> +	/* Never sync to VM updates either. */
>>>> +	if (fence_owner == AMDGPU_FENCE_OWNER_VM &&
>>>> +	    owner != AMDGPU_FENCE_OWNER_UNDEFINED)
>>>> +		return false;
>>>> +
>>>> +	/* Ignore fences depending on the sync mode */
>>>> +	switch (mode) {
>>>> +	case AMDGPU_SYNC_ALWAYS:
>>>> +		return true;
>>>> +
>>>> +	case AMDGPU_SYNC_NE_OWNER:
>>>> +		if (amdgpu_sync_same_dev(adev, f) &&
>>>> +		    fence_owner == owner)
>>>> +			return false;
>>>> +		break;
>>>> +
>>>> +	case AMDGPU_SYNC_EQ_OWNER:
>>>> +		if (amdgpu_sync_same_dev(adev, f) &&
>>>> +		    fence_owner != owner)
>>>> +			return false;
>>>> +		break;
>>>> +
>>>> +	case AMDGPU_SYNC_EXPLICIT:
>>>> +		return false;
>>>> +	}
>>>> +
>>>> +	WARN(debug_evictions && fence_owner == AMDGPU_FENCE_OWNER_KFD,
>>>> +	     "Adding eviction fence to sync obj");
>>>> +	return true;
>>>> +}
>>>> +
>>>>    /**
>>>>     * amdgpu_sync_resv - sync to a reservation object
>>>>     *
>>>> @@ -211,67 +262,34 @@ int amdgpu_sync_resv(struct amdgpu_device *adev, struct amdgpu_sync *sync,
>>>>    	/* always sync to the exclusive fence */
>>>>    	f = dma_resv_excl_fence(resv);
>>>> -	r = amdgpu_sync_fence(sync, f);
>>>> +	dma_fence_chain_for_each(f, f) {
>>> Jason has some helper for deep-walking fence chains/arrays here I think.
>>> Might want to look into that, so that we have some consistency in how we
>>> pile up multiple exclusive fences.
>> Well those helpers are not from Jason, but from me :)
>>
>> But no, for now the deep inspection is not really helpful here since
>> grabbing a reference to a certain chain node is what that makes the handling
>> easier and faster here.
>>
>> Thinking more about it that should also make it possible for the garbage
>> collection to kick in properly.
> Hm this is tricky to reason about, but yeah with this here it's a true
> chain, and you just need to connect them. But then if a buffer is on
> multiple engines, collapsing things down occasionally might be useful.
>
> But maybe we need to do that in the bigger rework where exclusive fences
> are also just in the dma_fence_list with a "this is an exclusive one btw"
> tag.
>
> I think for the vk import case doing the deep scan makes more sense, it's
> a once-per-frame thing, and there's a much bigger chance that you have a
> pile of fences from different engines on it already.

The problem with Jasons IOCTL is that you *must* do a deep dive and 
flatten out the fences.

Otherwise somebody could use it to create a deep fence structure with 
dma_fence_arrays containing dma_fence_arrays, containing 
dma_fence_arrays etc...

When you then release that structure you overwrite kernel stack because 
the dma_fence_array does a dma_fence_put() on it's entries :)

The dma_fence_chain container is intentionally made in a way to prevent 
that.

> I think a comment explaining why we think deep scan isn't a good idea here
> would be good, just so we can appreciate our foolishness when it all goes
> wrong :-)

Ok, good point.

Thanks,
Christian.

> -Daniel
>
>
>>> Anyway pretty much one of the versions I had in mind too, except I didn't
>>> type it up.
>>>
>>> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Thanks,
>> Christian.
>>
>>>> +		struct dma_fence_chain *chain = to_dma_fence_chain(f);
>>>> +
>>>> +		if (amdgpu_sync_test_fence(adev, mode, owner, chain ?
>>>> +					   chain->fence : f)) {
>>>> +			r = amdgpu_sync_fence(sync, f);
>>>> +			dma_fence_put(f);
>>>> +			if (r)
>>>> +				return r;
>>>> +			break;
>>>> +		}
>>>> +	}
>>>>    	flist = dma_resv_shared_list(resv);
>>>> -	if (!flist || r)
>>>> -		return r;
>>>> +	if (!flist)
>>>> +		return 0;
>>>>    	for (i = 0; i < flist->shared_count; ++i) {
>>>> -		void *fence_owner;
>>>> -
>>>>    		f = rcu_dereference_protected(flist->shared[i],
>>>>    					      dma_resv_held(resv));
>>>> -		fence_owner = amdgpu_sync_get_owner(f);
>>>> -
>>>> -		/* Always sync to moves, no matter what */
>>>> -		if (fence_owner == AMDGPU_FENCE_OWNER_UNDEFINED) {
>>>> +		if (amdgpu_sync_test_fence(adev, mode, owner, f)) {
>>>>    			r = amdgpu_sync_fence(sync, f);
>>>>    			if (r)
>>>> -				break;
>>>> -		}
>>>> -
>>>> -		/* We only want to trigger KFD eviction fences on
>>>> -		 * evict or move jobs. Skip KFD fences otherwise.
>>>> -		 */
>>>> -		if (fence_owner == AMDGPU_FENCE_OWNER_KFD &&
>>>> -		    owner != AMDGPU_FENCE_OWNER_UNDEFINED)
>>>> -			continue;
>>>> -
>>>> -		/* Never sync to VM updates either. */
>>>> -		if (fence_owner == AMDGPU_FENCE_OWNER_VM &&
>>>> -		    owner != AMDGPU_FENCE_OWNER_UNDEFINED)
>>>> -			continue;
>>>> -
>>>> -		/* Ignore fences depending on the sync mode */
>>>> -		switch (mode) {
>>>> -		case AMDGPU_SYNC_ALWAYS:
>>>> -			break;
>>>> -
>>>> -		case AMDGPU_SYNC_NE_OWNER:
>>>> -			if (amdgpu_sync_same_dev(adev, f) &&
>>>> -			    fence_owner == owner)
>>>> -				continue;
>>>> -			break;
>>>> -
>>>> -		case AMDGPU_SYNC_EQ_OWNER:
>>>> -			if (amdgpu_sync_same_dev(adev, f) &&
>>>> -			    fence_owner != owner)
>>>> -				continue;
>>>> -			break;
>>>> -
>>>> -		case AMDGPU_SYNC_EXPLICIT:
>>>> -			continue;
>>>> +				return r;
>>>>    		}
>>>> -
>>>> -		WARN(debug_evictions && fence_owner == AMDGPU_FENCE_OWNER_KFD,
>>>> -		     "Adding eviction fence to sync obj");
>>>> -		r = amdgpu_sync_fence(sync, f);
>>>> -		if (r)
>>>> -			break;
>>>>    	}
>>>> -	return r;
>>>> +	return 0;
>>>>    }
>>>>    /**
>>>> -- 
>>>> 2.25.1
>>>>

