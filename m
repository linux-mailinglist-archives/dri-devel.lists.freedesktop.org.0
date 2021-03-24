Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BF2347F2D
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 18:21:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FBF26ECC8;
	Wed, 24 Mar 2021 17:21:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7BCA6ECBA
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 17:21:00 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 j20-20020a05600c1914b029010f31e15a7fso1652245wmq.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 10:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=YcBqSJvwdYpatMLo0QwDwowPTQOK5DDUqrkSj6ve6z8=;
 b=TIh0DPuOG/lO+mrgK3GMlloSlJ87Dk2dmlyQPi1S3v+RRY1iNsZvdkxzcQOo58tONU
 o9xLLf94UY6Ko7AeuaJ+Z9hwayXoZ+R2cHoiN6nPyTf4RXVWpJnZNu75RwGatcHzTUo+
 okVm9d8H0WK+8xbEANdgi7HdvPKjfCdJVdGW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YcBqSJvwdYpatMLo0QwDwowPTQOK5DDUqrkSj6ve6z8=;
 b=NW88PKf0D0ZoKfh3vlWDoC9mddL9zD6XEFeNFAFXXvARKiFpZN1ovcmGuSzAs8KbL/
 U493Z+mhPJg4495gNV7sX/HkTvKEVy43RNxgywkq3EX6xkVlSqp0R0kHQi22GPulP2qs
 Qx0zl8NzW2VNXpOD9R3ooy8ffcKAd9LgvzzIgxY5oVMwZ7u0wja/4AW7CXn/PrtDaUAZ
 FKHO4vigcNVGOcbqksKgBr5MB4oz4Dg7Tuhpqu3b7iXL1mmyg4bseXMNST5xYMLojJtH
 sRVV1wzcayxyEvmkR6TAJJqwaMfBusFVaYvasJzLmJhyZNgkTPB7eshtXoHE50henq+q
 Hjqg==
X-Gm-Message-State: AOAM530m5F4u8NHNkjUU/XPLyBIl1CjgL4uVyyRxJjAC1C0fmpK2GIq0
 VkW+jm9joFf6840kZ1QKx5tYgg==
X-Google-Smtp-Source: ABdhPJxyCr0Fpm3LkEad/SKPCNlnDZs1rA/tRcH1v+Uc5/wvZmNHJhhCI2/ll9Nw1Mw2rCO6DGlCdQ==
X-Received: by 2002:a05:600c:35cd:: with SMTP id
 r13mr3983033wmq.186.1616606459314; 
 Wed, 24 Mar 2021 10:20:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p18sm3702218wrs.68.2021.03.24.10.20.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 10:20:58 -0700 (PDT)
Date: Wed, 24 Mar 2021 18:20:57 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v9 66/70] drm/i915: Add ww parameter to
 get_pages() callback
Message-ID: <YFt0+XXSnDINvgr1@phenom.ffwll.local>
References: <20210323155059.628690-1-maarten.lankhorst@linux.intel.com>
 <20210323155059.628690-67-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210323155059.628690-67-maarten.lankhorst@linux.intel.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 23, 2021 at 04:50:55PM +0100, Maarten Lankhorst wrote:
> We will need this to support eviction with lmem, so
> explicitly pass ww as a parameter.
> 
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

I'm leaving this and later patches out for now. Would be good to
fast-track the bsw fix, but the others are for lmem enabling, so imo can
go in through the usual way.
-Daniel

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c           | 3 ++-
>  drivers/gpu/drm/i915/gem/i915_gem_internal.c         | 3 ++-
>  drivers/gpu/drm/i915/gem/i915_gem_object_types.h     | 3 ++-
>  drivers/gpu/drm/i915/gem/i915_gem_pages.c            | 2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_region.c           | 3 ++-
>  drivers/gpu/drm/i915/gem/i915_gem_region.h           | 4 +++-
>  drivers/gpu/drm/i915/gem/i915_gem_shmem.c            | 3 ++-
>  drivers/gpu/drm/i915/gem/i915_gem_stolen.c           | 3 ++-
>  drivers/gpu/drm/i915/gem/i915_gem_userptr.c          | 3 ++-
>  drivers/gpu/drm/i915/gem/selftests/huge_gem_object.c | 3 ++-
>  drivers/gpu/drm/i915/gem/selftests/huge_pages.c      | 9 ++++++---
>  drivers/gpu/drm/i915/gvt/dmabuf.c                    | 3 ++-
>  drivers/gpu/drm/i915/selftests/i915_gem_gtt.c        | 3 ++-
>  13 files changed, 30 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> index 0926e0895ee6..1b3998c066a7 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> @@ -199,7 +199,8 @@ struct dma_buf *i915_gem_prime_export(struct drm_gem_object *gem_obj, int flags)
>  	return drm_gem_dmabuf_export(gem_obj->dev, &exp_info);
>  }
>  
> -static int i915_gem_object_get_pages_dmabuf(struct drm_i915_gem_object *obj)
> +static int i915_gem_object_get_pages_dmabuf(struct drm_i915_gem_object *obj,
> +					    struct i915_gem_ww_ctx *ww)
>  {
>  	struct sg_table *pages;
>  	unsigned int sg_page_sizes;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_internal.c b/drivers/gpu/drm/i915/gem/i915_gem_internal.c
> index 21cc40897ca8..90777fb5f5e0 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_internal.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_internal.c
> @@ -30,7 +30,8 @@ static void internal_free_pages(struct sg_table *st)
>  	kfree(st);
>  }
>  
> -static int i915_gem_object_get_pages_internal(struct drm_i915_gem_object *obj)
> +static int i915_gem_object_get_pages_internal(struct drm_i915_gem_object *obj,
> +					      struct i915_gem_ww_ctx *ww)
>  {
>  	struct drm_i915_private *i915 = to_i915(obj->base.dev);
>  	struct sg_table *st;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> index a5bc42c7087a..280f54a75ab1 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> @@ -50,7 +50,8 @@ struct drm_i915_gem_object_ops {
>  	 * being released or under memory pressure (where we attempt to
>  	 * reap pages for the shrinker).
>  	 */
> -	int (*get_pages)(struct drm_i915_gem_object *obj);
> +	int (*get_pages)(struct drm_i915_gem_object *obj,
> +			 struct i915_gem_ww_ctx *ww);
>  	void (*put_pages)(struct drm_i915_gem_object *obj,
>  			  struct sg_table *pages);
>  	void (*truncate)(struct drm_i915_gem_object *obj);
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> index aed8a37ccdc9..58e222030e10 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> @@ -100,7 +100,7 @@ int ____i915_gem_object_get_pages(struct drm_i915_gem_object *obj)
>  		return -EFAULT;
>  	}
>  
> -	err = obj->ops->get_pages(obj);
> +	err = obj->ops->get_pages(obj, NULL);
>  	GEM_BUG_ON(!err && !i915_gem_object_has_pages(obj));
>  
>  	return err;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_region.c b/drivers/gpu/drm/i915/gem/i915_gem_region.c
> index 6a84fb6dde24..6cb8b70c19bf 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_region.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_region.c
> @@ -20,7 +20,8 @@ i915_gem_object_put_pages_buddy(struct drm_i915_gem_object *obj,
>  }
>  
>  int
> -i915_gem_object_get_pages_buddy(struct drm_i915_gem_object *obj)
> +i915_gem_object_get_pages_buddy(struct drm_i915_gem_object *obj,
> +				struct i915_gem_ww_ctx *ww)
>  {
>  	const u64 max_segment = i915_sg_segment_size();
>  	struct intel_memory_region *mem = obj->mm.region;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_region.h b/drivers/gpu/drm/i915/gem/i915_gem_region.h
> index ebddc86d78f7..c6f250aac925 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_region.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_region.h
> @@ -9,10 +9,12 @@
>  #include <linux/types.h>
>  
>  struct intel_memory_region;
> +struct i915_gem_ww_ctx;
>  struct drm_i915_gem_object;
>  struct sg_table;
>  
> -int i915_gem_object_get_pages_buddy(struct drm_i915_gem_object *obj);
> +int i915_gem_object_get_pages_buddy(struct drm_i915_gem_object *obj,
> +				    struct i915_gem_ww_ctx *ww);
>  void i915_gem_object_put_pages_buddy(struct drm_i915_gem_object *obj,
>  				     struct sg_table *pages);
>  
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> index a9bfa66c8da1..3f80a017959a 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> @@ -25,7 +25,8 @@ static void check_release_pagevec(struct pagevec *pvec)
>  	cond_resched();
>  }
>  
> -static int shmem_get_pages(struct drm_i915_gem_object *obj)
> +static int shmem_get_pages(struct drm_i915_gem_object *obj,
> +			   struct i915_gem_ww_ctx *ww)
>  {
>  	struct drm_i915_private *i915 = to_i915(obj->base.dev);
>  	struct intel_memory_region *mem = obj->mm.region;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> index b0597de206de..5b732b0fe5ce 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> @@ -568,7 +568,8 @@ i915_pages_create_for_stolen(struct drm_device *dev,
>  	return st;
>  }
>  
> -static int i915_gem_object_get_pages_stolen(struct drm_i915_gem_object *obj)
> +static int i915_gem_object_get_pages_stolen(struct drm_i915_gem_object *obj,
> +					    struct i915_gem_ww_ctx *ww)
>  {
>  	struct sg_table *pages =
>  		i915_pages_create_for_stolen(obj->base.dev,
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> index 09b4219eab5d..693d0dbe9ed2 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> @@ -126,7 +126,8 @@ static void i915_gem_object_userptr_drop_ref(struct drm_i915_gem_object *obj)
>  	}
>  }
>  
> -static int i915_gem_userptr_get_pages(struct drm_i915_gem_object *obj)
> +static int i915_gem_userptr_get_pages(struct drm_i915_gem_object *obj,
> +				      struct i915_gem_ww_ctx *ww)
>  {
>  	struct drm_i915_private *i915 = to_i915(obj->base.dev);
>  	const unsigned long num_pages = obj->base.size >> PAGE_SHIFT;
> diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_gem_object.c b/drivers/gpu/drm/i915/gem/selftests/huge_gem_object.c
> index 0c8ecfdf5405..6ce237a5e38d 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/huge_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/huge_gem_object.c
> @@ -25,7 +25,8 @@ static void huge_free_pages(struct drm_i915_gem_object *obj,
>  	kfree(pages);
>  }
>  
> -static int huge_get_pages(struct drm_i915_gem_object *obj)
> +static int huge_get_pages(struct drm_i915_gem_object *obj,
> +			  struct i915_gem_ww_ctx *ww)
>  {
>  #define GFP (GFP_KERNEL | __GFP_NOWARN | __GFP_RETRY_MAYFAIL)
>  	const unsigned long nreal = obj->scratch / PAGE_SIZE;
> diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> index d85ca79ac433..80eeb59aae67 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> @@ -56,7 +56,8 @@ static void huge_pages_free_pages(struct sg_table *st)
>  	kfree(st);
>  }
>  
> -static int get_huge_pages(struct drm_i915_gem_object *obj)
> +static int get_huge_pages(struct drm_i915_gem_object *obj,
> +			  struct i915_gem_ww_ctx *ww)
>  {
>  #define GFP (GFP_KERNEL | __GFP_NOWARN | __GFP_NORETRY)
>  	unsigned int page_mask = obj->mm.page_mask;
> @@ -179,7 +180,8 @@ huge_pages_object(struct drm_i915_private *i915,
>  	return obj;
>  }
>  
> -static int fake_get_huge_pages(struct drm_i915_gem_object *obj)
> +static int fake_get_huge_pages(struct drm_i915_gem_object *obj,
> +			       struct i915_gem_ww_ctx *ww)
>  {
>  	struct drm_i915_private *i915 = to_i915(obj->base.dev);
>  	const u64 max_len = rounddown_pow_of_two(UINT_MAX);
> @@ -234,7 +236,8 @@ static int fake_get_huge_pages(struct drm_i915_gem_object *obj)
>  	return 0;
>  }
>  
> -static int fake_get_huge_pages_single(struct drm_i915_gem_object *obj)
> +static int fake_get_huge_pages_single(struct drm_i915_gem_object *obj,
> +				      struct i915_gem_ww_ctx *ww)
>  {
>  	struct drm_i915_private *i915 = to_i915(obj->base.dev);
>  	struct sg_table *st;
> diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.c b/drivers/gpu/drm/i915/gvt/dmabuf.c
> index d4f883f35b95..609257aaf711 100644
> --- a/drivers/gpu/drm/i915/gvt/dmabuf.c
> +++ b/drivers/gpu/drm/i915/gvt/dmabuf.c
> @@ -55,7 +55,8 @@ static void vgpu_unpin_dma_address(struct intel_vgpu *vgpu,
>  }
>  
>  static int vgpu_gem_get_pages(
> -		struct drm_i915_gem_object *obj)
> +		struct drm_i915_gem_object *obj,
> +		struct i915_gem_ww_ctx *ww)
>  {
>  	struct drm_i915_private *dev_priv = to_i915(obj->base.dev);
>  	struct intel_vgpu *vgpu;
> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> index 2e4f06eaacc1..fc92fed7a04a 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> @@ -50,7 +50,8 @@ static void fake_free_pages(struct drm_i915_gem_object *obj,
>  	kfree(pages);
>  }
>  
> -static int fake_get_pages(struct drm_i915_gem_object *obj)
> +static int fake_get_pages(struct drm_i915_gem_object *obj,
> +			  struct i915_gem_ww_ctx *ww)
>  {
>  #define GFP (GFP_KERNEL | __GFP_NOWARN | __GFP_NORETRY)
>  #define PFN_BIAS 0x1000
> -- 
> 2.31.0
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
