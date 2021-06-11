Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E073A4461
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 16:52:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B97A96EE96;
	Fri, 11 Jun 2021 14:52:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A38776E7F5
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 14:52:04 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id a20so6421592wrc.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 07:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=4LoyqH/pL2mhEAc9qjc8YOfLpOE6Aljc3R6meb3Zeis=;
 b=jrG4iKNN14+GZpLDHSMYpwX5jy1sYwylW0x7b0hxU8Shj+y5ugV3j2r6S4nBJ5r7ru
 QbfdHH6fKr5BTFArOdM6LRnldTXPB2bNeaSXmm1EbVg6nwEFbdOA/ajp7FEzL3GOrNg4
 SAPR3m1bMuhbcxd7fIHnHKvpgkrnX/4u5t1Lk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=4LoyqH/pL2mhEAc9qjc8YOfLpOE6Aljc3R6meb3Zeis=;
 b=aeA1p6hSv3oX46o637jBuPMPfZC0sE4eqpsu9xIFp2TdQKEhbzS4U/5trzDeAB76ta
 zUz2g54hjnro+v3V0yQrKMPoUY1RyEmIqsrcSowcCg/4PPu10Xpmyek+Dk1d2tlU+5oc
 YEytzurYJo5GZvuqDT9FAXPdM/N20m51uACT6bwoCTIwqOC1HTaNjefADDTsDE5D8XEO
 uYLrhBvPLYkXVg/CK/DJ5lcp0VgqZpx/kPWCv80uZTWOP/xgMoG4c9FKSrccEwQ1l0xO
 nx5sfRQQ24rgFOYB6NeFpI2Ka5y2KLSBO0zOMZyP+oBdxgSfZd+EYa5JVv8tqqad10SE
 hCCQ==
X-Gm-Message-State: AOAM533Ly1NALvTuiNMXLkcRQt5VfZUf713lpAlKEWfz6FOVdHdwjyoB
 t7qfiEOMQWmP7aUjyrsJcROTDQ==
X-Google-Smtp-Source: ABdhPJwSG2yaJwNTsiM1yM7aQg2nz//PupOD39Qk51PWl+iU/2RAqE1RzyCfXj3ARkljhO6H0bZlHw==
X-Received: by 2002:a5d:6584:: with SMTP id q4mr4501529wru.230.1623423123517; 
 Fri, 11 Jun 2021 07:52:03 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g17sm9427748wrh.72.2021.06.11.07.52.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 07:52:03 -0700 (PDT)
Date: Fri, 11 Jun 2021 16:52:01 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 3/5] dma-buf: add dma_fence_chain_alloc/free v2
Message-ID: <YMN4kUt7dpysElsD@phenom.ffwll.local>
References: <20210611120301.10595-1-christian.koenig@amd.com>
 <20210611120301.10595-3-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210611120301.10595-3-christian.koenig@amd.com>
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

On Fri, Jun 11, 2021 at 02:02:59PM +0200, Christian König wrote:
> Add a common allocation helper. Cleaning up the mix of kzalloc/kmalloc
> and some unused code in the selftest.
> 
> v2: polish kernel doc a bit
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Given how absolutely wrong I was I'm not sure this r-b here is justified
:-)

> ---
>  drivers/dma-buf/st-dma-fence-chain.c          | 16 ++++---------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |  4 ++--
>  drivers/gpu/drm/drm_syncobj.c                 |  6 ++---
>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  6 ++---
>  drivers/gpu/drm/msm/msm_gem_submit.c          |  6 ++---
>  include/linux/dma-fence-chain.h               | 23 +++++++++++++++++++
>  6 files changed, 36 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/dma-buf/st-dma-fence-chain.c b/drivers/dma-buf/st-dma-fence-chain.c
> index 9525f7f56119..8ce1ea59d31b 100644
> --- a/drivers/dma-buf/st-dma-fence-chain.c
> +++ b/drivers/dma-buf/st-dma-fence-chain.c
> @@ -58,28 +58,20 @@ static struct dma_fence *mock_fence(void)
>  	return &f->base;
>  }
>  
> -static inline struct mock_chain {
> -	struct dma_fence_chain base;
> -} *to_mock_chain(struct dma_fence *f) {
> -	return container_of(f, struct mock_chain, base.base);
> -}
> -
>  static struct dma_fence *mock_chain(struct dma_fence *prev,
>  				    struct dma_fence *fence,
>  				    u64 seqno)
>  {
> -	struct mock_chain *f;
> +	struct dma_fence_chain *f;
>  
> -	f = kmalloc(sizeof(*f), GFP_KERNEL);
> +	f = dma_fence_chain_alloc();
>  	if (!f)
>  		return NULL;
>  
> -	dma_fence_chain_init(&f->base,
> -			     dma_fence_get(prev),
> -			     dma_fence_get(fence),
> +	dma_fence_chain_init(f, dma_fence_get(prev), dma_fence_get(fence),
>  			     seqno);
>  
> -	return &f->base.base;
> +	return &f->base;
>  }
>  
>  static int sanitycheck(void *arg)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index 90136f9dedd6..325e82621467 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -1124,7 +1124,7 @@ static int amdgpu_cs_process_syncobj_timeline_out_dep(struct amdgpu_cs_parser *p
>  
>  		dep->chain = NULL;
>  		if (syncobj_deps[i].point) {
> -			dep->chain = kmalloc(sizeof(*dep->chain), GFP_KERNEL);
> +			dep->chain = dma_fence_chain_alloc();
>  			if (!dep->chain)
>  				return -ENOMEM;
>  		}
> @@ -1132,7 +1132,7 @@ static int amdgpu_cs_process_syncobj_timeline_out_dep(struct amdgpu_cs_parser *p
>  		dep->syncobj = drm_syncobj_find(p->filp,
>  						syncobj_deps[i].handle);
>  		if (!dep->syncobj) {
> -			kfree(dep->chain);
> +			dma_fence_chain_free(dep->chain);
>  			return -EINVAL;
>  		}
>  		dep->point = syncobj_deps[i].point;
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index fdd2ec87cdd1..1c5b9ef6da37 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -861,7 +861,7 @@ static int drm_syncobj_transfer_to_timeline(struct drm_file *file_private,
>  				     &fence);
>  	if (ret)
>  		goto err;
> -	chain = kzalloc(sizeof(struct dma_fence_chain), GFP_KERNEL);
> +	chain = dma_fence_chain_alloc();
>  	if (!chain) {
>  		ret = -ENOMEM;
>  		goto err1;
> @@ -1402,10 +1402,10 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
>  		goto err_points;
>  	}
>  	for (i = 0; i < args->count_handles; i++) {
> -		chains[i] = kzalloc(sizeof(struct dma_fence_chain), GFP_KERNEL);
> +		chains[i] = dma_fence_chain_alloc();
>  		if (!chains[i]) {
>  			for (j = 0; j < i; j++)
> -				kfree(chains[j]);
> +				dma_fence_chain_free(chains[j]);
>  			ret = -ENOMEM;
>  			goto err_chains;
>  		}
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index 66789111a24b..a22cb86730b3 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -2983,7 +2983,7 @@ __free_fence_array(struct eb_fence *fences, unsigned int n)
>  	while (n--) {
>  		drm_syncobj_put(ptr_mask_bits(fences[n].syncobj, 2));
>  		dma_fence_put(fences[n].dma_fence);
> -		kfree(fences[n].chain_fence);
> +		dma_fence_chain_free(fences[n].chain_fence);
>  	}
>  	kvfree(fences);
>  }
> @@ -3097,9 +3097,7 @@ add_timeline_fence_array(struct i915_execbuffer *eb,
>  				return -EINVAL;
>  			}
>  
> -			f->chain_fence =
> -				kmalloc(sizeof(*f->chain_fence),
> -					GFP_KERNEL);
> +			f->chain_fence = dma_fence_chain_alloc();
>  			if (!f->chain_fence) {
>  				drm_syncobj_put(syncobj);
>  				dma_fence_put(fence);
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index 5480852bdeda..6ff6df6c4791 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -586,9 +586,7 @@ static struct msm_submit_post_dep *msm_parse_post_deps(struct drm_device *dev,
>  				break;
>  			}
>  
> -			post_deps[i].chain =
> -				kmalloc(sizeof(*post_deps[i].chain),
> -				        GFP_KERNEL);
> +			post_deps[i].chain = dma_fence_chain_alloc();
>  			if (!post_deps[i].chain) {
>  				ret = -ENOMEM;
>  				break;
> @@ -605,7 +603,7 @@ static struct msm_submit_post_dep *msm_parse_post_deps(struct drm_device *dev,
>  
>  	if (ret) {
>  		for (j = 0; j <= i; ++j) {
> -			kfree(post_deps[j].chain);
> +			dma_fence_chain_free(post_deps[j].chain);
>  			if (post_deps[j].syncobj)
>  				drm_syncobj_put(post_deps[j].syncobj);
>  		}
> diff --git a/include/linux/dma-fence-chain.h b/include/linux/dma-fence-chain.h
> index c6eb3aa45668..7ec36d850363 100644
> --- a/include/linux/dma-fence-chain.h
> +++ b/include/linux/dma-fence-chain.h
> @@ -12,6 +12,7 @@
>  
>  #include <linux/dma-fence.h>
>  #include <linux/irq_work.h>
> +#include <linux/slab.h>
>  
>  /**
>   * struct dma_fence_chain - fence to represent an node of a fence chain
> @@ -66,6 +67,28 @@ to_dma_fence_chain(struct dma_fence *fence)
>  	return container_of(fence, struct dma_fence_chain, base);
>  }
>  
> +/**
> + * dma_fence_chain_alloc
> + *
> + * Returns a new dma_fence_chain object or NULL on failure.

		struct dma_fence_chain for that hyperlink goodness

> + */
> +static inline struct dma_fence_chain *dma_fence_chain_alloc(void)
> +{
> +	return kmalloc(sizeof(struct dma_fence_chain), GFP_KERNEL);
> +};
> +
> +/**
> + * dma_fence_chain_free
> + * @chain: chain node to free
> + *
> + * Frees up an allocated but not used dma_fence_chain node. This doesn't need

Same here.

> + * an RCU grace period since the fence was never initialized nor published.

I'd add even more clarification, like:

"After dma_fence_chain_init() has been called the fence must be released
by calling dma_fence_put(), and not through this function."

That's still a notch too strict (in theory as long as the fence isn't
published anywhere it's all fine), but it keeps the door open for some
validation.

With the doc polish:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>


> + */
> +static inline void dma_fence_chain_free(struct dma_fence_chain *chain)
> +{
> +	kfree(chain);
> +};
> +
>  /**
>   * dma_fence_chain_for_each - iterate over all fences in chain
>   * @iter: current fence
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
