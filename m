Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D9F3E4A87
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 19:07:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB45589A20;
	Mon,  9 Aug 2021 17:07:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39B6889A20
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 17:07:48 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 k38-20020a05600c1ca6b029025af5e0f38bso15223539wms.5
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Aug 2021 10:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KSB3J7FAptLZT7iNU2RrzDB0zPGbfzq3oEDT0uP15PM=;
 b=Ezo8Ky4RMdzoENNfaJobyIaVbt323tu9nfmfqkHPOC4X0k4ZaTOAjoxg0IxsO5NzOt
 /BHUwk1s8h9EjinJ050TxSHEyCMWkXhID1hExJbbjAj1XnF6wp53G2Y0qIXcJlvfiE8T
 cfPyB84c+3aMIkPzhFORrc4EmZ0map84XZQlA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KSB3J7FAptLZT7iNU2RrzDB0zPGbfzq3oEDT0uP15PM=;
 b=V/KaWuacVJR2QelFwsBn1/lTsOpSX8rXS7Y14nNPTUbx6NCORvSFCIjnS6OxD7Nczx
 hpl8rkqy9cbO7QkGkAZ5/+p5XCLzHCmIXZaTRLR78lhkwigieEn5ci3DUksmRekdiPx4
 1djhLGY2QVA0q6/jVkkV0tgHSh/w6UO1EKLNbMM8Wt7P3Lgn2Ou2G/+662bJQF7xEL6u
 DjiXdO7qYN5Tnu+cBlnwO7aVH3zgvSdHEb5VGezmzYDpI4qS1GHFbxvSVQhuQJY64Ny6
 jFYwJApSw+cnnxBymZm8z5NuMnuulGzd1IDUVxTO4xzwJCUrg/nsxnY31Vg2EjGPsfHZ
 Vwwg==
X-Gm-Message-State: AOAM533kIoMje/Xf4At2YpHu/GidKqfaCBh+jTVqlAe9pJwyfmRT01YX
 I0OSb3jRWjCDUGd7J+8ivH93oQ==
X-Google-Smtp-Source: ABdhPJxUhn5eCmcPa4FVzji9w2OEVbeO2xq5+wJm/yDD3WNrUqr6LinEkwoBOxsmruO71by4CiyJDQ==
X-Received: by 2002:a1c:4b0a:: with SMTP id y10mr17115324wma.111.1628528866569; 
 Mon, 09 Aug 2021 10:07:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f3sm20542567wro.30.2021.08.09.10.07.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 10:07:46 -0700 (PDT)
Date: Mon, 9 Aug 2021 19:07:44 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 41/46] drm/i915: Eliminate unnecessary VMA
 calls for multi-BB submission
Message-ID: <YRFg4OL0bvPITfwY@phenom.ffwll.local>
References: <20210803222943.27686-1-matthew.brost@intel.com>
 <20210803222943.27686-42-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210803222943.27686-42-matthew.brost@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 03, 2021 at 03:29:38PM -0700, Matthew Brost wrote:
> Certain VMA functions in the execbuf IOCTL only need to be called on
> first or last BB of a multi-BB submission. eb_relocate() on the first

eb_relocate should be outright disallowed on multi lrc execbuf ioctl.
There's no users of that left, and it does substantially simplify the
entire locking problem if we outright disallow that.

> and eb_release_vmas() on the last. Doing so will save CPU / GPU cycles.

Yah for our mix of pin/unpin vs dma_resv_lock/unlock. Now with the current
unpin design this move is ok, but we want/need to switch vma over to
dma_resv_lock. And then it gets really nasty, because you run into a ton
of problems.

To more I read this the less I like this :-/
-Daniel

> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 127 +++++++++++-------
>  .../i915/gem/selftests/i915_gem_execbuffer.c  |  14 +-
>  2 files changed, 83 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index ecdb583cc2eb..70784779872a 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -270,7 +270,7 @@ struct i915_execbuffer {
>  	/** list of vma that have execobj.relocation_count */
>  	struct list_head relocs;
>  
> -	struct i915_gem_ww_ctx ww;
> +	struct i915_gem_ww_ctx *ww;
>  
>  	/**
>  	 * Track the most recently used object for relocations, as we
> @@ -448,7 +448,7 @@ eb_pin_vma(struct i915_execbuffer *eb,
>  		pin_flags |= PIN_GLOBAL;
>  
>  	/* Attempt to reuse the current location if available */
> -	err = i915_vma_pin_ww(vma, &eb->ww, 0, 0, pin_flags);
> +	err = i915_vma_pin_ww(vma, eb->ww, 0, 0, pin_flags);
>  	if (err == -EDEADLK)
>  		return err;
>  
> @@ -457,11 +457,11 @@ eb_pin_vma(struct i915_execbuffer *eb,
>  			return err;
>  
>  		/* Failing that pick any _free_ space if suitable */
> -		err = i915_vma_pin_ww(vma, &eb->ww,
> -					     entry->pad_to_size,
> -					     entry->alignment,
> -					     eb_pin_flags(entry, ev->flags) |
> -					     PIN_USER | PIN_NOEVICT);
> +		err = i915_vma_pin_ww(vma, eb->ww,
> +				      entry->pad_to_size,
> +				      entry->alignment,
> +				      eb_pin_flags(entry, ev->flags) |
> +				      PIN_USER | PIN_NOEVICT);
>  		if (unlikely(err))
>  			return err;
>  	}
> @@ -643,9 +643,9 @@ static int eb_reserve_vma(struct i915_execbuffer *eb,
>  			return err;
>  	}
>  
> -	err = i915_vma_pin_ww(vma, &eb->ww,
> -			   entry->pad_to_size, entry->alignment,
> -			   eb_pin_flags(entry, ev->flags) | pin_flags);
> +	err = i915_vma_pin_ww(vma, eb->ww,
> +			      entry->pad_to_size, entry->alignment,
> +			      eb_pin_flags(entry, ev->flags) | pin_flags);
>  	if (err)
>  		return err;
>  
> @@ -940,7 +940,7 @@ static int eb_lock_vmas(struct i915_execbuffer *eb)
>  		struct eb_vma *ev = &eb->vma[i];
>  		struct i915_vma *vma = ev->vma;
>  
> -		err = i915_gem_object_lock(vma->obj, &eb->ww);
> +		err = i915_gem_object_lock(vma->obj, eb->ww);
>  		if (err)
>  			return err;
>  	}
> @@ -1020,12 +1020,13 @@ eb_get_vma(const struct i915_execbuffer *eb, unsigned long handle)
>  	}
>  }
>  
> -static void eb_release_vmas(struct i915_execbuffer *eb, bool final)
> +static void eb_release_vmas(struct i915_execbuffer *eb, bool final,
> +			    bool unreserve)
>  {
>  	const unsigned int count = eb->buffer_count;
>  	unsigned int i;
>  
> -	for (i = 0; i < count; i++) {
> +	for (i = 0; unreserve && i < count; i++) {
>  		struct eb_vma *ev = &eb->vma[i];
>  		struct i915_vma *vma = ev->vma;
>  
> @@ -1237,7 +1238,7 @@ static void *reloc_iomap(struct drm_i915_gem_object *obj,
>  		if (err)
>  			return ERR_PTR(err);
>  
> -		vma = i915_gem_object_ggtt_pin_ww(obj, &eb->ww, NULL, 0, 0,
> +		vma = i915_gem_object_ggtt_pin_ww(obj, eb->ww, NULL, 0, 0,
>  						  PIN_MAPPABLE |
>  						  PIN_NONBLOCK /* NOWARN */ |
>  						  PIN_NOEVICT);
> @@ -1361,7 +1362,7 @@ static int __reloc_gpu_alloc(struct i915_execbuffer *eb,
>  	}
>  	eb->reloc_pool = NULL;
>  
> -	err = i915_gem_object_lock(pool->obj, &eb->ww);
> +	err = i915_gem_object_lock(pool->obj, eb->ww);
>  	if (err)
>  		goto err_pool;
>  
> @@ -1380,7 +1381,7 @@ static int __reloc_gpu_alloc(struct i915_execbuffer *eb,
>  		goto err_unmap;
>  	}
>  
> -	err = i915_vma_pin_ww(batch, &eb->ww, 0, 0, PIN_USER | PIN_NONBLOCK);
> +	err = i915_vma_pin_ww(batch, eb->ww, 0, 0, PIN_USER | PIN_NONBLOCK);
>  	if (err)
>  		goto err_unmap;
>  
> @@ -1402,7 +1403,7 @@ static int __reloc_gpu_alloc(struct i915_execbuffer *eb,
>  			eb->reloc_context = ce;
>  		}
>  
> -		err = intel_context_pin_ww(ce, &eb->ww);
> +		err = intel_context_pin_ww(ce, eb->ww);
>  		if (err)
>  			goto err_unpin;
>  
> @@ -2017,8 +2018,8 @@ static noinline int eb_relocate_parse_slow(struct i915_execbuffer *eb,
>  	}
>  
>  	/* We may process another execbuffer during the unlock... */
> -	eb_release_vmas(eb, false);
> -	i915_gem_ww_ctx_fini(&eb->ww);
> +	eb_release_vmas(eb, false, true);
> +	i915_gem_ww_ctx_fini(eb->ww);
>  
>  	if (rq) {
>  		/* nonblocking is always false */
> @@ -2062,7 +2063,7 @@ static noinline int eb_relocate_parse_slow(struct i915_execbuffer *eb,
>  		err = eb_reinit_userptr(eb);
>  
>  err_relock:
> -	i915_gem_ww_ctx_init(&eb->ww, true);
> +	i915_gem_ww_ctx_init(eb->ww, true);
>  	if (err)
>  		goto out;
>  
> @@ -2119,8 +2120,8 @@ static noinline int eb_relocate_parse_slow(struct i915_execbuffer *eb,
>  
>  err:
>  	if (err == -EDEADLK) {
> -		eb_release_vmas(eb, false);
> -		err = i915_gem_ww_ctx_backoff(&eb->ww);
> +		eb_release_vmas(eb, false, true);
> +		err = i915_gem_ww_ctx_backoff(eb->ww);
>  		if (!err)
>  			goto repeat_validate;
>  	}
> @@ -2152,7 +2153,7 @@ static noinline int eb_relocate_parse_slow(struct i915_execbuffer *eb,
>  	return err;
>  }
>  
> -static int eb_relocate_parse(struct i915_execbuffer *eb)
> +static int eb_relocate_parse(struct i915_execbuffer *eb, bool first)
>  {
>  	int err;
>  	struct i915_request *rq = NULL;
> @@ -2189,14 +2190,16 @@ static int eb_relocate_parse(struct i915_execbuffer *eb)
>  	/* only throttle once, even if we didn't need to throttle */
>  	throttle = false;
>  
> -	err = eb_validate_vmas(eb);
> -	if (err == -EAGAIN)
> -		goto slow;
> -	else if (err)
> -		goto err;
> +	if (first) {
> +		err = eb_validate_vmas(eb);
> +		if (err == -EAGAIN)
> +			goto slow;
> +		else if (err)
> +			goto err;
> +	}
>  
>  	/* The objects are in their final locations, apply the relocations. */
> -	if (eb->args->flags & __EXEC_HAS_RELOC) {
> +	if (eb->args->flags & __EXEC_HAS_RELOC && first) {
>  		struct eb_vma *ev;
>  
>  		list_for_each_entry(ev, &eb->relocs, reloc_link) {
> @@ -2211,13 +2214,13 @@ static int eb_relocate_parse(struct i915_execbuffer *eb)
>  			goto slow;
>  	}
>  
> -	if (!err)
> +	if (!err && first)
>  		err = eb_parse(eb);
>  
>  err:
>  	if (err == -EDEADLK) {
> -		eb_release_vmas(eb, false);
> -		err = i915_gem_ww_ctx_backoff(&eb->ww);
> +		eb_release_vmas(eb, false, true);
> +		err = i915_gem_ww_ctx_backoff(eb->ww);
>  		if (!err)
>  			goto retry;
>  	}
> @@ -2398,7 +2401,7 @@ shadow_batch_pin(struct i915_execbuffer *eb,
>  	if (IS_ERR(vma))
>  		return vma;
>  
> -	err = i915_vma_pin_ww(vma, &eb->ww, 0, 0, flags);
> +	err = i915_vma_pin_ww(vma, eb->ww, 0, 0, flags);
>  	if (err)
>  		return ERR_PTR(err);
>  
> @@ -2412,7 +2415,7 @@ static struct i915_vma *eb_dispatch_secure(struct i915_execbuffer *eb, struct i9
>  	 * batch" bit. Hence we need to pin secure batches into the global gtt.
>  	 * hsw should have this fixed, but bdw mucks it up again. */
>  	if (eb->batch_flags & I915_DISPATCH_SECURE)
> -		return i915_gem_object_ggtt_pin_ww(vma->obj, &eb->ww, NULL, 0, 0, 0);
> +		return i915_gem_object_ggtt_pin_ww(vma->obj, eb->ww, NULL, 0, 0, 0);
>  
>  	return NULL;
>  }
> @@ -2458,7 +2461,7 @@ static int eb_parse(struct i915_execbuffer *eb)
>  		eb->batch_pool = pool;
>  	}
>  
> -	err = i915_gem_object_lock(pool->obj, &eb->ww);
> +	err = i915_gem_object_lock(pool->obj, eb->ww);
>  	if (err)
>  		goto err;
>  
> @@ -2666,7 +2669,7 @@ static struct i915_request *eb_pin_engine(struct i915_execbuffer *eb, bool throt
>  	 * GGTT space, so do this first before we reserve a seqno for
>  	 * ourselves.
>  	 */
> -	err = intel_context_pin_ww(ce, &eb->ww);
> +	err = intel_context_pin_ww(ce, eb->ww);
>  	if (err)
>  		return ERR_PTR(err);
>  
> @@ -3218,7 +3221,8 @@ i915_gem_do_execbuffer(struct drm_device *dev,
>  		       unsigned int batch_number,
>  		       struct dma_fence *in_fence,
>  		       struct dma_fence *exec_fence,
> -		       struct dma_fence **out_fence)
> +		       struct dma_fence **out_fence,
> +		       struct i915_gem_ww_ctx *ww)
>  {
>  	struct drm_i915_private *i915 = to_i915(dev);
>  	struct i915_execbuffer eb;
> @@ -3239,7 +3243,8 @@ i915_gem_do_execbuffer(struct drm_device *dev,
>  
>  	eb.exec = exec;
>  	eb.vma = (struct eb_vma *)(exec + args->buffer_count + 1);
> -	eb.vma[0].vma = NULL;
> +	if (first)
> +		eb.vma[0].vma = NULL;
>  	eb.reloc_pool = eb.batch_pool = NULL;
>  	eb.reloc_context = NULL;
>  
> @@ -3251,6 +3256,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,
>  	eb.batch_len = args->batch_len;
>  	eb.trampoline = NULL;
>  	eb.composite_fence = NULL;
> +	eb.ww = ww;
>  
>  	eb.fences = NULL;
>  	eb.num_fences = 0;
> @@ -3269,9 +3275,14 @@ i915_gem_do_execbuffer(struct drm_device *dev,
>  	if (err)
>  		goto err_ext;
>  
> -	err = eb_create(&eb);
> -	if (err)
> -		goto err_ext;
> +	if (first) {
> +		err = eb_create(&eb);
> +		if (err)
> +			goto err_ext;
> +	} else {
> +		eb.lut_size = -eb.buffer_count;
> +	}
> +
>  
>  	GEM_BUG_ON(!eb.lut_size);
>  
> @@ -3286,15 +3297,22 @@ i915_gem_do_execbuffer(struct drm_device *dev,
>  	if (unlikely(err))
>  		goto err_context;
>  
> -	err = eb_lookup_vmas(&eb);
> -	if (err) {
> -		eb_release_vmas(&eb, true);
> -		goto err_engine;
> +	if (first) {
> +		err = eb_lookup_vmas(&eb);
> +		if (err) {
> +			eb_release_vmas(&eb, true, true);
> +			goto err_engine;
> +		}
> +
> +	} else {
> +		eb.batch = &eb.vma[eb.batch_index];
>  	}
>  
> -	i915_gem_ww_ctx_init(&eb.ww, true);
>  
> -	err = eb_relocate_parse(&eb);
> +	if (first)
> +		i915_gem_ww_ctx_init(eb.ww, true);
> +
> +	err = eb_relocate_parse(&eb, first);
>  	if (err) {
>  		/*
>  		 * If the user expects the execobject.offset and
> @@ -3307,7 +3325,8 @@ i915_gem_do_execbuffer(struct drm_device *dev,
>  		goto err_vma;
>  	}
>  
> -	ww_acquire_done(&eb.ww.ctx);
> +	if (first)
> +		ww_acquire_done(&eb.ww->ctx);
>  
>  	batch = eb.batch->vma;
>  
> @@ -3410,11 +3429,12 @@ i915_gem_do_execbuffer(struct drm_device *dev,
>  	i915_request_put(eb.request);
>  
>  err_vma:
> -	eb_release_vmas(&eb, true);
> +	eb_release_vmas(&eb, true, err || last);
>  	if (eb.trampoline)
>  		i915_vma_unpin(eb.trampoline);
>  	WARN_ON(err == -EDEADLK);
> -	i915_gem_ww_ctx_fini(&eb.ww);
> +	if (err || last)
> +		i915_gem_ww_ctx_fini(eb.ww);
>  
>  	if (eb.batch_pool)
>  		intel_gt_buffer_pool_put(eb.batch_pool);
> @@ -3476,6 +3496,7 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
>  	const size_t count = args->buffer_count;
>  	int err;
>  	struct i915_gem_context *ctx;
> +	struct i915_gem_ww_ctx ww;
>  	struct intel_context *parent = NULL;
>  	unsigned int num_batches = 1, i;
>  	bool is_parallel = false;
> @@ -3602,7 +3623,8 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
>  				     0,
>  				     in_fence,
>  				     exec_fence,
> -				     out_fences);
> +				     out_fences,
> +				     &ww);
>  
>  	for (i = 1; err == 0 && i < num_batches; i++)
>  		err = i915_gem_do_execbuffer(dev, file, args, exec2_list,
> @@ -3612,7 +3634,8 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
>  					     i,
>  					     NULL,
>  					     NULL,
> -					     out_fences);
> +					     out_fences,
> +					     &ww);
>  
>  	if (is_parallel)
>  		mutex_unlock(&parent->parallel_submit);
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_execbuffer.c
> index 16162fc2782d..710d2700e5b4 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_execbuffer.c
> @@ -32,11 +32,11 @@ static int __igt_gpu_reloc(struct i915_execbuffer *eb,
>  	if (IS_ERR(vma))
>  		return PTR_ERR(vma);
>  
> -	err = i915_gem_object_lock(obj, &eb->ww);
> +	err = i915_gem_object_lock(obj, eb->ww);
>  	if (err)
>  		return err;
>  
> -	err = i915_vma_pin_ww(vma, &eb->ww, 0, 0, PIN_USER | PIN_HIGH);
> +	err = i915_vma_pin_ww(vma, eb->ww, 0, 0, PIN_USER | PIN_HIGH);
>  	if (err)
>  		return err;
>  
> @@ -106,10 +106,12 @@ static int __igt_gpu_reloc(struct i915_execbuffer *eb,
>  static int igt_gpu_reloc(void *arg)
>  {
>  	struct i915_execbuffer eb;
> +	struct i915_gem_ww_ctx ww;
>  	struct drm_i915_gem_object *scratch;
>  	int err = 0;
>  	u32 *map;
>  
> +	eb.ww = &ww;
>  	eb.i915 = arg;
>  
>  	scratch = i915_gem_object_create_internal(eb.i915, 4096);
> @@ -141,20 +143,20 @@ static int igt_gpu_reloc(void *arg)
>  		eb.reloc_pool = NULL;
>  		eb.reloc_context = NULL;
>  
> -		i915_gem_ww_ctx_init(&eb.ww, false);
> +		i915_gem_ww_ctx_init(eb.ww, false);
>  retry:
> -		err = intel_context_pin_ww(eb.context, &eb.ww);
> +		err = intel_context_pin_ww(eb.context, eb.ww);
>  		if (!err) {
>  			err = __igt_gpu_reloc(&eb, scratch);
>  
>  			intel_context_unpin(eb.context);
>  		}
>  		if (err == -EDEADLK) {
> -			err = i915_gem_ww_ctx_backoff(&eb.ww);
> +			err = i915_gem_ww_ctx_backoff(eb.ww);
>  			if (!err)
>  				goto retry;
>  		}
> -		i915_gem_ww_ctx_fini(&eb.ww);
> +		i915_gem_ww_ctx_fini(eb.ww);
>  
>  		if (eb.reloc_pool)
>  			intel_gt_buffer_pool_put(eb.reloc_pool);
> -- 
> 2.28.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
