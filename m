Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1793A416D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 13:48:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26D046E145;
	Fri, 11 Jun 2021 11:48:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57D726E145;
 Fri, 11 Jun 2021 11:48:21 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id a11so5739074wrt.13;
 Fri, 11 Jun 2021 04:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=RMsKJSTNIZ28Zt0Am5SohF0EBTu38mJyQQdNKwItc40=;
 b=cKmSE//6zDTg2STH+eubMUyEWD+QP9oJVVom8DJMeiJ5x/DieYH2CF+bHHBOaiA8Ub
 8VwJ4onBFmcAr0Pc4teGduS+HfEF1NGY9qNaRnCjjiMzbWUOGXCaybKRbt0pa3OkZChr
 Qg6MpVYD4Aay9ck7KhOJQj5gk9994e/xc/OQ+wAwEb57BL2mISMZqJ0qdzdENgm41fJB
 9nLHQPh7cXr9YooPpWNwbUEt2wcprFzP/PTsYAFGW64z2I485Wm6NV/XY0uvMAY4icn9
 0TPzc+Am309Dg67wXPl3F8WKsskbIVmonM+QLXshvB+As5DfSoiZ6xR3sR4cmZD9+nk+
 i+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=RMsKJSTNIZ28Zt0Am5SohF0EBTu38mJyQQdNKwItc40=;
 b=RWlFUDShIQoVKky//xoeRKPZ70vBstypv5uooG/Z1CEbGfUFA2vlMIKONUlSZ8i8/B
 WevaeKwpLa2ITaYAuSRyOdOPfg+y++4fBb/YoV/8uTyVnLcrffFCmbTJnw30PMhyE/Bn
 mgnWdIAnQgLpK8XJqU3DOBScqI7etncpBxayCeQkTmYzQ22i7rvDHFvy1pXflhC0v5dj
 i60WyQWPu5viz2muUeA4cqRWEOWrKZpMro9Bp/ch7y1AoSCTK2ZuOr0kBxkLU/DcETzU
 HDKVAO3fr4MVOI2OMaZMBdQ7rg/HZJFWusv53HAUIgIhjKvnPADVHxVpQwj4LiCNFXCJ
 p/1g==
X-Gm-Message-State: AOAM533rpbtWntZ/7lJiXqYvMpUEbJqdiYLx1Ruikd4+aZmjkbjannIN
 yDVYVyRGItUMjFhejHAywRj3/rFeaOE=
X-Google-Smtp-Source: ABdhPJy7zLcWEZDOwM8wj75/briLXGr/D1i+/4BQhUB22hGQGgjllA/IO5f/j60IupsYYOSUd4xE7Q==
X-Received: by 2002:a5d:414e:: with SMTP id c14mr3487911wrq.81.1623412100024; 
 Fri, 11 Jun 2021 04:48:20 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:bd94:4b9a:99c4:4bc1?
 ([2a02:908:1252:fb60:bd94:4b9a:99c4:4bc1])
 by smtp.gmail.com with ESMTPSA id s62sm12944841wms.13.2021.06.11.04.48.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 04:48:19 -0700 (PDT)
Subject: Re: [PATCH 2/7] dma-buf: add dma_fence_chain_alloc/free
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210610091800.1833-1-christian.koenig@amd.com>
 <20210610091800.1833-3-christian.koenig@amd.com>
 <YMMW0ROMlgJQyTdU@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <43177627-bc11-74b0-f88c-6475dd2904ff@gmail.com>
Date: Fri, 11 Jun 2021 13:48:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YMMW0ROMlgJQyTdU@phenom.ffwll.local>
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

Am 11.06.21 um 09:54 schrieb Daniel Vetter:
> On Thu, Jun 10, 2021 at 11:17:55AM +0200, Christian König wrote:
>> Add a common allocation helper. Cleaning up the mix of kzalloc/kmalloc
>> and some unused code in the selftest.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/dma-buf/st-dma-fence-chain.c          | 16 ++++----------
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |  4 ++--
>>   drivers/gpu/drm/drm_syncobj.c                 |  6 ++---
>>   .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  6 ++---
>>   drivers/gpu/drm/msm/msm_gem_submit.c          |  6 ++---
>>   include/linux/dma-fence-chain.h               | 22 +++++++++++++++++++
>>   6 files changed, 35 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/dma-buf/st-dma-fence-chain.c b/drivers/dma-buf/st-dma-fence-chain.c
>> index 9525f7f56119..8ce1ea59d31b 100644
>> --- a/drivers/dma-buf/st-dma-fence-chain.c
>> +++ b/drivers/dma-buf/st-dma-fence-chain.c
>> @@ -58,28 +58,20 @@ static struct dma_fence *mock_fence(void)
>>   	return &f->base;
>>   }
>>   
>> -static inline struct mock_chain {
>> -	struct dma_fence_chain base;
>> -} *to_mock_chain(struct dma_fence *f) {
>> -	return container_of(f, struct mock_chain, base.base);
>> -}
>> -
>>   static struct dma_fence *mock_chain(struct dma_fence *prev,
>>   				    struct dma_fence *fence,
>>   				    u64 seqno)
>>   {
>> -	struct mock_chain *f;
>> +	struct dma_fence_chain *f;
>>   
>> -	f = kmalloc(sizeof(*f), GFP_KERNEL);
>> +	f = dma_fence_chain_alloc();
>>   	if (!f)
>>   		return NULL;
>>   
>> -	dma_fence_chain_init(&f->base,
>> -			     dma_fence_get(prev),
>> -			     dma_fence_get(fence),
>> +	dma_fence_chain_init(f, dma_fence_get(prev), dma_fence_get(fence),
>>   			     seqno);
>>   
>> -	return &f->base.base;
>> +	return &f->base;
>>   }
>>   
>>   static int sanitycheck(void *arg)
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> index 90136f9dedd6..325e82621467 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> @@ -1124,7 +1124,7 @@ static int amdgpu_cs_process_syncobj_timeline_out_dep(struct amdgpu_cs_parser *p
>>   
>>   		dep->chain = NULL;
>>   		if (syncobj_deps[i].point) {
>> -			dep->chain = kmalloc(sizeof(*dep->chain), GFP_KERNEL);
>> +			dep->chain = dma_fence_chain_alloc();
>>   			if (!dep->chain)
>>   				return -ENOMEM;
>>   		}
>> @@ -1132,7 +1132,7 @@ static int amdgpu_cs_process_syncobj_timeline_out_dep(struct amdgpu_cs_parser *p
>>   		dep->syncobj = drm_syncobj_find(p->filp,
>>   						syncobj_deps[i].handle);
>>   		if (!dep->syncobj) {
>> -			kfree(dep->chain);
>> +			dma_fence_chain_free(dep->chain);
>>   			return -EINVAL;
>>   		}
>>   		dep->point = syncobj_deps[i].point;
>> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
>> index fdd2ec87cdd1..1c5b9ef6da37 100644
>> --- a/drivers/gpu/drm/drm_syncobj.c
>> +++ b/drivers/gpu/drm/drm_syncobj.c
>> @@ -861,7 +861,7 @@ static int drm_syncobj_transfer_to_timeline(struct drm_file *file_private,
>>   				     &fence);
>>   	if (ret)
>>   		goto err;
>> -	chain = kzalloc(sizeof(struct dma_fence_chain), GFP_KERNEL);
>> +	chain = dma_fence_chain_alloc();
>>   	if (!chain) {
>>   		ret = -ENOMEM;
>>   		goto err1;
>> @@ -1402,10 +1402,10 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
>>   		goto err_points;
>>   	}
>>   	for (i = 0; i < args->count_handles; i++) {
>> -		chains[i] = kzalloc(sizeof(struct dma_fence_chain), GFP_KERNEL);
>> +		chains[i] = dma_fence_chain_alloc();
>>   		if (!chains[i]) {
>>   			for (j = 0; j < i; j++)
>> -				kfree(chains[j]);
>> +				dma_fence_chain_free(chains[j]);
>>   			ret = -ENOMEM;
>>   			goto err_chains;
>>   		}
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> index 66789111a24b..a22cb86730b3 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> @@ -2983,7 +2983,7 @@ __free_fence_array(struct eb_fence *fences, unsigned int n)
>>   	while (n--) {
>>   		drm_syncobj_put(ptr_mask_bits(fences[n].syncobj, 2));
>>   		dma_fence_put(fences[n].dma_fence);
>> -		kfree(fences[n].chain_fence);
>> +		dma_fence_chain_free(fences[n].chain_fence);
>>   	}
>>   	kvfree(fences);
>>   }
>> @@ -3097,9 +3097,7 @@ add_timeline_fence_array(struct i915_execbuffer *eb,
>>   				return -EINVAL;
>>   			}
>>   
>> -			f->chain_fence =
>> -				kmalloc(sizeof(*f->chain_fence),
>> -					GFP_KERNEL);
>> +			f->chain_fence = dma_fence_chain_alloc();
>>   			if (!f->chain_fence) {
>>   				drm_syncobj_put(syncobj);
>>   				dma_fence_put(fence);
>> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
>> index 5480852bdeda..6ff6df6c4791 100644
>> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
>> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
>> @@ -586,9 +586,7 @@ static struct msm_submit_post_dep *msm_parse_post_deps(struct drm_device *dev,
>>   				break;
>>   			}
>>   
>> -			post_deps[i].chain =
>> -				kmalloc(sizeof(*post_deps[i].chain),
>> -				        GFP_KERNEL);
>> +			post_deps[i].chain = dma_fence_chain_alloc();
>>   			if (!post_deps[i].chain) {
>>   				ret = -ENOMEM;
>>   				break;
>> @@ -605,7 +603,7 @@ static struct msm_submit_post_dep *msm_parse_post_deps(struct drm_device *dev,
>>   
>>   	if (ret) {
>>   		for (j = 0; j <= i; ++j) {
>> -			kfree(post_deps[j].chain);
>> +			dma_fence_chain_free(post_deps[j].chain);
>>   			if (post_deps[j].syncobj)
>>   				drm_syncobj_put(post_deps[j].syncobj);
>>   		}
>> diff --git a/include/linux/dma-fence-chain.h b/include/linux/dma-fence-chain.h
>> index 9d6a062be640..5f45689a6d2e 100644
>> --- a/include/linux/dma-fence-chain.h
>> +++ b/include/linux/dma-fence-chain.h
>> @@ -12,6 +12,7 @@
>>   
>>   #include <linux/dma-fence.h>
>>   #include <linux/irq_work.h>
>> +#include <linux/slab.h>
>>   
>>   /**
>>    * struct dma_fence_chain - fence to represent an node of a fence chain
>> @@ -53,6 +54,27 @@ to_dma_fence_chain(struct dma_fence *fence)
>>   	return container_of(fence, struct dma_fence_chain, base);
>>   }
>>   
>> +/**
>> + * dma_fence_chain_alloc
>> + *
>> + * Returns a new dma_fence_chain object
> ... or NULL on failure.
>
>> + */
>> +static inline struct dma_fence_chain *dma_fence_chain_alloc(void)
>> +{
>> +	return kmalloc(sizeof(struct dma_fence_chain), GFP_KERNEL);
>> +};
>> +
>> +/**
>> + * dma_fence_chain_free
>> + * @chain: chain node to free
>> + *
>> + * Frees up an allocated but not used dma_fence_chain node.
>> + */
>> +static inline void dma_fence_chain_free(struct dma_fence_chain *chain)
>> +{
>> +	kfree(chain);
> kfree_rcu, and I guess this means this patch here should be cc: stable.

Nope, kfree() is correct here.

This is to free up fences which never been initialized, so an RCU grace 
period isn't necessary because nobody could potentially have a reference.

Christian.

> This is kinda why I'm questioning whether this "dma_fence are protected by
> rcu" cross driver api is really a good idea. We largely get it wrong in
> the details in a _ton_ of places.
>
> With the details fixed:
>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
>> +
>>   /**
>>    * dma_fence_chain_for_each - iterate over all fences in chain
>>    * @iter: current fence
>> -- 
>> 2.25.1
>>

