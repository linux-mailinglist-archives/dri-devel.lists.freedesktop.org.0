Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B20133A3FD5
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 12:09:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 929F46EE68;
	Fri, 11 Jun 2021 10:09:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA74D6EE67;
 Fri, 11 Jun 2021 10:09:22 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 f16-20020a05600c1550b02901b00c1be4abso8326084wmg.2; 
 Fri, 11 Jun 2021 03:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=35QIqVu+POFSBYZ0PL0HI3dssJ5+/2M1k9rMSVlNk3E=;
 b=Qr4GHfHGFcdzfXTdimt1+MCw/WxDwHDkY33Iy45RZ1B0l/yPVnZrxfZDfrLnsMC0JE
 2ubdqWQyHD9RHYBLcBHIsyglj2o3VaTe986z7rRotZxCIhz8CayNzQeKcLS0zJY0AGkJ
 dbrpTJ+8lZ5FvbBV3ZSm3oOIsb9YW/gVRZZpH7bVuQX+NbRJkIlsF7UhKw2wiP0B3XHX
 +YZDCb0wa0iDzxUstypizoEzYigWoTVqSWU2GM8fF6VX6SPsEaLw8hcd6zPgLCe9B0TG
 9SQ7gMDMy+rJlxiSdYyDpREK3D+vimnR2nUyzUEByxqs73BZna1uJwMBUuapaeurDV6m
 lWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=35QIqVu+POFSBYZ0PL0HI3dssJ5+/2M1k9rMSVlNk3E=;
 b=STVYrfJpqp8/uJPTjR11mw7UvXSzhqay49sY4rQ8ZkH4jlqJpp/2DBcVhts4TtRdhJ
 YhU0/6GNObra2Q0MQqr3MxRma+/W8FgufbKAKOWOTahUsceCFym2FsSDsCYUiW7GlPvE
 ZKriDTGKl1NrOkF7heDkFuB8MRJRizvAXjHNn7qgnBr4JBITAZQAq0IEOyBcUFkxTFB8
 /odFkdhnY5d2ik0nzrhOxnSTs4Q78hrx7RauP3TpvxYBjfSyRW4lnDp/U6UIKtx9PC3s
 nJV7LqJNBDj6HYOqRRCjHzQIrZXVuLlIRERUDkY2KWppwgA24e9iV+TUiMGcLZkJeVUC
 R+BQ==
X-Gm-Message-State: AOAM532soZX5N9j0iDscyMjCgJON3ViaohdY3k0osmmWY3jjvT9bFGAn
 SdX+reMEO6LJCxKPJ7X7v/ZnJGqauH0=
X-Google-Smtp-Source: ABdhPJwnDvvI8lmr1v89UrZztwRINkEcMj7v8p5EP2mxkVNC2Q//RAEgw/G1npuHE74zohLwg8b6Ew==
X-Received: by 2002:a05:600c:354f:: with SMTP id
 i15mr3110395wmq.38.1623406161423; 
 Fri, 11 Jun 2021 03:09:21 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:108e:ba37:cb49:9c3?
 ([2a02:908:1252:fb60:108e:ba37:cb49:9c3])
 by smtp.gmail.com with ESMTPSA id g205sm12623322wme.6.2021.06.11.03.09.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 03:09:20 -0700 (PDT)
Subject: Re: [PATCH 6/7] drm/amdgpu: unwrap fence chains in the explicit sync
 fence
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210610091800.1833-1-christian.koenig@amd.com>
 <20210610091800.1833-7-christian.koenig@amd.com>
 <YMMnzbky0W72PH1d@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <51256567-84d3-76a9-31aa-aee96d01364a@gmail.com>
Date: Fri, 11 Jun 2021 12:09:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YMMnzbky0W72PH1d@phenom.ffwll.local>
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

Am 11.06.21 um 11:07 schrieb Daniel Vetter:
> On Thu, Jun 10, 2021 at 11:17:59AM +0200, Christian König wrote:
>> Unwrap a the explicit fence if it is a dma_fence_chain and
>> sync to the first fence not matching the owner rules.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c | 118 +++++++++++++----------
>>   1 file changed, 68 insertions(+), 50 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
>> index 1b2ceccaf5b0..862eb3c1c4c5 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
>> @@ -28,6 +28,8 @@
>>    *    Christian König <christian.koenig@amd.com>
>>    */
>>   
>> +#include <linux/dma-fence-chain.h>
>> +
>>   #include "amdgpu.h"
>>   #include "amdgpu_trace.h"
>>   #include "amdgpu_amdkfd.h"
>> @@ -186,6 +188,55 @@ int amdgpu_sync_vm_fence(struct amdgpu_sync *sync, struct dma_fence *fence)
>>   	return amdgpu_sync_fence(sync, fence);
>>   }
>>   
>> +/* Determine based on the owner and mode if we should sync to a fence or not */
>> +static bool amdgpu_sync_test_fence(struct amdgpu_device *adev,
>> +				   enum amdgpu_sync_mode mode,
>> +				   void *owner, struct dma_fence *f)
>> +{
>> +	void *fence_owner = amdgpu_sync_get_owner(f);
>> +
>> +	/* Always sync to moves, no matter what */
>> +	if (fence_owner == AMDGPU_FENCE_OWNER_UNDEFINED)
>> +		return true;
>> +
>> +	/* We only want to trigger KFD eviction fences on
>> +	 * evict or move jobs. Skip KFD fences otherwise.
>> +	 */
>> +	if (fence_owner == AMDGPU_FENCE_OWNER_KFD &&
>> +	    owner != AMDGPU_FENCE_OWNER_UNDEFINED)
>> +		return false;
>> +
>> +	/* Never sync to VM updates either. */
>> +	if (fence_owner == AMDGPU_FENCE_OWNER_VM &&
>> +	    owner != AMDGPU_FENCE_OWNER_UNDEFINED)
>> +		return false;
>> +
>> +	/* Ignore fences depending on the sync mode */
>> +	switch (mode) {
>> +	case AMDGPU_SYNC_ALWAYS:
>> +		return true;
>> +
>> +	case AMDGPU_SYNC_NE_OWNER:
>> +		if (amdgpu_sync_same_dev(adev, f) &&
>> +		    fence_owner == owner)
>> +			return false;
>> +		break;
>> +
>> +	case AMDGPU_SYNC_EQ_OWNER:
>> +		if (amdgpu_sync_same_dev(adev, f) &&
>> +		    fence_owner != owner)
>> +			return false;
>> +		break;
>> +
>> +	case AMDGPU_SYNC_EXPLICIT:
>> +		return false;
>> +	}
>> +
>> +	WARN(debug_evictions && fence_owner == AMDGPU_FENCE_OWNER_KFD,
>> +	     "Adding eviction fence to sync obj");
>> +	return true;
>> +}
>> +
>>   /**
>>    * amdgpu_sync_resv - sync to a reservation object
>>    *
>> @@ -211,67 +262,34 @@ int amdgpu_sync_resv(struct amdgpu_device *adev, struct amdgpu_sync *sync,
>>   
>>   	/* always sync to the exclusive fence */
>>   	f = dma_resv_excl_fence(resv);
>> -	r = amdgpu_sync_fence(sync, f);
>> +	dma_fence_chain_for_each(f, f) {
> Jason has some helper for deep-walking fence chains/arrays here I think.
> Might want to look into that, so that we have some consistency in how we
> pile up multiple exclusive fences.

Well those helpers are not from Jason, but from me :)

But no, for now the deep inspection is not really helpful here since 
grabbing a reference to a certain chain node is what that makes the 
handling easier and faster here.

Thinking more about it that should also make it possible for the garbage 
collection to kick in properly.

>
> Anyway pretty much one of the versions I had in mind too, except I didn't
> type it up.
>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Thanks,
Christian.

>
>> +		struct dma_fence_chain *chain = to_dma_fence_chain(f);
>> +
>> +		if (amdgpu_sync_test_fence(adev, mode, owner, chain ?
>> +					   chain->fence : f)) {
>> +			r = amdgpu_sync_fence(sync, f);
>> +			dma_fence_put(f);
>> +			if (r)
>> +				return r;
>> +			break;
>> +		}
>> +	}
>>   
>>   	flist = dma_resv_shared_list(resv);
>> -	if (!flist || r)
>> -		return r;
>> +	if (!flist)
>> +		return 0;
>>   
>>   	for (i = 0; i < flist->shared_count; ++i) {
>> -		void *fence_owner;
>> -
>>   		f = rcu_dereference_protected(flist->shared[i],
>>   					      dma_resv_held(resv));
>>   
>> -		fence_owner = amdgpu_sync_get_owner(f);
>> -
>> -		/* Always sync to moves, no matter what */
>> -		if (fence_owner == AMDGPU_FENCE_OWNER_UNDEFINED) {
>> +		if (amdgpu_sync_test_fence(adev, mode, owner, f)) {
>>   			r = amdgpu_sync_fence(sync, f);
>>   			if (r)
>> -				break;
>> -		}
>> -
>> -		/* We only want to trigger KFD eviction fences on
>> -		 * evict or move jobs. Skip KFD fences otherwise.
>> -		 */
>> -		if (fence_owner == AMDGPU_FENCE_OWNER_KFD &&
>> -		    owner != AMDGPU_FENCE_OWNER_UNDEFINED)
>> -			continue;
>> -
>> -		/* Never sync to VM updates either. */
>> -		if (fence_owner == AMDGPU_FENCE_OWNER_VM &&
>> -		    owner != AMDGPU_FENCE_OWNER_UNDEFINED)
>> -			continue;
>> -
>> -		/* Ignore fences depending on the sync mode */
>> -		switch (mode) {
>> -		case AMDGPU_SYNC_ALWAYS:
>> -			break;
>> -
>> -		case AMDGPU_SYNC_NE_OWNER:
>> -			if (amdgpu_sync_same_dev(adev, f) &&
>> -			    fence_owner == owner)
>> -				continue;
>> -			break;
>> -
>> -		case AMDGPU_SYNC_EQ_OWNER:
>> -			if (amdgpu_sync_same_dev(adev, f) &&
>> -			    fence_owner != owner)
>> -				continue;
>> -			break;
>> -
>> -		case AMDGPU_SYNC_EXPLICIT:
>> -			continue;
>> +				return r;
>>   		}
>> -
>> -		WARN(debug_evictions && fence_owner == AMDGPU_FENCE_OWNER_KFD,
>> -		     "Adding eviction fence to sync obj");
>> -		r = amdgpu_sync_fence(sync, f);
>> -		if (r)
>> -			break;
>>   	}
>> -	return r;
>> +	return 0;
>>   }
>>   
>>   /**
>> -- 
>> 2.25.1
>>

