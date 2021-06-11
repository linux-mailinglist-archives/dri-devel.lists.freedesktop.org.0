Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A638D3A446E
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 16:54:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA656E463;
	Fri, 11 Jun 2021 14:54:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10FB26E463;
 Fri, 11 Jun 2021 14:54:51 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id l2so6408838wrw.6;
 Fri, 11 Jun 2021 07:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Y7TyVbdzqgqvHNhK6kMcHQm3pbGkNUno2jQzlCmCARc=;
 b=TEGe1/9hqN+xGajIy/Zv9jOQksc3JuY5mGhiOMOlbcMaF5/T47jlzBCIXGVndDDe+m
 G5Rr78nDr4DJnabFaGbpFLSNmte9nEMR6PlOPgKLuGRQx4hjgEBibJ0hNxIKb35KuDgR
 O7VwKHxTmz/qF4klj5St1/ZCY4xSYq/vIStmXrW+T1wWPnaE6dmovwOEqyJYcsh/rpvI
 K33HWrBok28EixcJsd+yqpBQyOVqxSJVnE1hXQ4yuW1o6G0CaNPWdTDAYguIOyUbN9W4
 pd4mXpIUOHcZeWxVIvU1k2F0T7jY2zGy48chLrcqDrvIJQ0gOU6cBNEDm37oUqADBLfA
 d8VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Y7TyVbdzqgqvHNhK6kMcHQm3pbGkNUno2jQzlCmCARc=;
 b=gH2jHDn8xlFmJrdmx+fxb+s3PNdKFgMFNVkXbFnyi7I/yruaQwIl5KWeMIb2VoF9rE
 AnZlH0FCZLNHpsvr8u8JMt8kbcF5C507gOVLU6BNOptJ9qMo8NCnEtjhHnbdpuHVRH5m
 ybJzvQeMWn6duazSG7TGyV5WtisAIX/45rLMTni9SIyNM9Qr8+wh5mpsz1IC/urXD9uj
 uOhl/i6dS5THD4M4I5lSbKXuTiNyJByU6AjybjEpLAhlfLiaDe+PqR0WjsHJ/8E4wTtq
 z4k7PbZR9l9csPnEUdQb5noNhdliWS0/vnCQUva/3nDSdo8BsCSH858xYxvW0ALGfKAs
 2XrA==
X-Gm-Message-State: AOAM533DDK8ojUZe0xjqOyplD18HAmi/le4IPb7aGLAhBbkfugfIs/sY
 uueuF7jBNypfNrUXf+ZlVmG778cnuO0=
X-Google-Smtp-Source: ABdhPJx/jHwFQoJl3yQFycbAVqMWHrC91lELvMXB+jkvJ2nTy5EYEYHK43cI9Y3OYSKpVoovZNT/uw==
X-Received: by 2002:adf:f1cb:: with SMTP id z11mr4696509wro.2.1623423289711;
 Fri, 11 Jun 2021 07:54:49 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:bd94:4b9a:99c4:4bc1?
 ([2a02:908:1252:fb60:bd94:4b9a:99c4:4bc1])
 by smtp.gmail.com with ESMTPSA id e17sm8090715wre.79.2021.06.11.07.54.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 07:54:49 -0700 (PDT)
Subject: Re: [PATCH 3/5] dma-buf: add dma_fence_chain_alloc/free v2
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210611120301.10595-1-christian.koenig@amd.com>
 <20210611120301.10595-3-christian.koenig@amd.com>
 <YMN4kUt7dpysElsD@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <f73408af-a72e-3263-6d2c-7f6ec82dc599@gmail.com>
Date: Fri, 11 Jun 2021 16:54:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YMN4kUt7dpysElsD@phenom.ffwll.local>
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



Am 11.06.21 um 16:52 schrieb Daniel Vetter:
> On Fri, Jun 11, 2021 at 02:02:59PM +0200, Christian König wrote:
>> Add a common allocation helper. Cleaning up the mix of kzalloc/kmalloc
>> and some unused code in the selftest.
>>
>> v2: polish kernel doc a bit
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Given how absolutely wrong I was I'm not sure this r-b here is justified
> :-)

Ups, that was also not added intentionally. It's just to hot in my flat 
and to few hours till the weekend.

>
>> ---
>>   drivers/dma-buf/st-dma-fence-chain.c          | 16 ++++---------
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |  4 ++--
>>   drivers/gpu/drm/drm_syncobj.c                 |  6 ++---
>>   .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  6 ++---
>>   drivers/gpu/drm/msm/msm_gem_submit.c          |  6 ++---
>>   include/linux/dma-fence-chain.h               | 23 +++++++++++++++++++
>>   6 files changed, 36 insertions(+), 25 deletions(-)
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
>> index c6eb3aa45668..7ec36d850363 100644
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
>> @@ -66,6 +67,28 @@ to_dma_fence_chain(struct dma_fence *fence)
>>   	return container_of(fence, struct dma_fence_chain, base);
>>   }
>>   
>> +/**
>> + * dma_fence_chain_alloc
>> + *
>> + * Returns a new dma_fence_chain object or NULL on failure.
> 		struct dma_fence_chain for that hyperlink goodness
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
>> + * Frees up an allocated but not used dma_fence_chain node. This doesn't need
> Same here.
>
>> + * an RCU grace period since the fence was never initialized nor published.
> I'd add even more clarification, like:
>
> "After dma_fence_chain_init() has been called the fence must be released
> by calling dma_fence_put(), and not through this function."
>
> That's still a notch too strict (in theory as long as the fence isn't
> published anywhere it's all fine), but it keeps the door open for some
> validation.
>
> With the doc polish:
>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Thanks,
Christian.

>
>
>> + */
>> +static inline void dma_fence_chain_free(struct dma_fence_chain *chain)
>> +{
>> +	kfree(chain);
>> +};
>> +
>>   /**
>>    * dma_fence_chain_for_each - iterate over all fences in chain
>>    * @iter: current fence
>> -- 
>> 2.25.1
>>

