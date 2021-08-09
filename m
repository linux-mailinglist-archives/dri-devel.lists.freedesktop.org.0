Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 970FF3E4A9A
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 19:13:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F9B89C07;
	Mon,  9 Aug 2021 17:13:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE9C989BB3
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 17:12:59 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 k5-20020a05600c1c85b02902e699a4d20cso516999wms.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Aug 2021 10:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XWCA+v0WSlffcmsf71Mb+Guh1y1XEERFp2o2JBykQDM=;
 b=TetCEtGyQKuviOqT9eSGJ8IveAynez9vPkg+sPIvXBl4uiEJC8mvDTehySCJpPYalm
 W7L8NLhgcvVmvFD3v0iNBLnUb2M6Yqgri8wz9G3ZU9u5SF85BpluB+F+FcLA2yN3WzJQ
 FmAhei2IsMjPbJVS+sy4bO3jEzT/glyeho5nY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XWCA+v0WSlffcmsf71Mb+Guh1y1XEERFp2o2JBykQDM=;
 b=mNBefY8gD68G8FRAyrha/ixSGfPIjnfVb45IHu7F97DApqXm99kyIGfQM2bJtL7C+N
 7mlektD1iXxb7aboI7pXkn5/2wfLMF+PEwmhl3NlNcRWJyYfdKP+fMK7QStC2dqVf/uX
 YZgvV8it4cLThjlZwpxcr9D5Q4lib6QMmv1R7nfAn68H7kzLVRDIpon6Ed8JJG1vm3NN
 goC5L38Kk9Enfg52Wwx622yKAAlbA+Ii6EQNyKpx3gBQxlaJR7r/4lGBNQ0UZG0VXQRF
 5QWNUUlgZzYPEwExvHGU58CYmv/mJ/E9zE4gDq2C5pkrOn6yd8DZfg4h4c5Y7F+rNksU
 /Bzw==
X-Gm-Message-State: AOAM530GKsv/SHa6gVRiwUPB0+zIZLiSl/bbiLjynaODbdyGiMjREILN
 g9ybiElMo1wxzSirsZyrEcxMTQ==
X-Google-Smtp-Source: ABdhPJxM0nZ/MJxXi7xe2+iV3Pd3iDqXxEFz+KW/qZ66WdmXmWWFB4x/3z6DNI/rMuqZG+YD8zg22A==
X-Received: by 2002:a1c:1bcd:: with SMTP id
 b196mr17677310wmb.160.1628529178157; 
 Mon, 09 Aug 2021 10:12:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z13sm1967649wmf.46.2021.08.09.10.12.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 10:12:57 -0700 (PDT)
Date: Mon, 9 Aug 2021 19:12:56 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 41/46] drm/i915: Eliminate unnecessary VMA
 calls for multi-BB submission
Message-ID: <YRFiGA9ZdaGigp07@phenom.ffwll.local>
References: <20210803222943.27686-1-matthew.brost@intel.com>
 <20210803222943.27686-42-matthew.brost@intel.com>
 <YRFg4OL0bvPITfwY@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YRFg4OL0bvPITfwY@phenom.ffwll.local>
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

On Mon, Aug 09, 2021 at 07:07:44PM +0200, Daniel Vetter wrote:
> On Tue, Aug 03, 2021 at 03:29:38PM -0700, Matthew Brost wrote:
> > Certain VMA functions in the execbuf IOCTL only need to be called on
> > first or last BB of a multi-BB submission. eb_relocate() on the first
> 
> eb_relocate should be outright disallowed on multi lrc execbuf ioctl.
> There's no users of that left, and it does substantially simplify the
> entire locking problem if we outright disallow that.
> 
> > and eb_release_vmas() on the last. Doing so will save CPU / GPU cycles.
> 
> Yah for our mix of pin/unpin vs dma_resv_lock/unlock. Now with the current
> unpin design this move is ok, but we want/need to switch vma over to
> dma_resv_lock. And then it gets really nasty, because you run into a ton
> of problems.

To give a bit more context of how much this is all nasty: When you publish
a fence, which thanks to rcu lookup of dma_resv happens when you install a
fence, not when you unlock the dma_resv_lock, you're not allowed to
allocate _any_ memory anymore until you're request has finished executing.
This means no allocating anything, including kmalloc for your i915_request
struct for the remaining batches, or the composite fence or anything else
you might do.

userptr also makes this requirement even more fun with additional
serialization requirements against mmu notifier invalidations.

The current execbuf code is a mess in this regard, and the idea is to fix
this with the conversion to drm/sched, because that has a very clear point
of no return. With the design you're pushing you're essentially making
this problem unfixable.
-Daniel

> 
> To more I read this the less I like this :-/
> -Daniel
> 
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 127 +++++++++++-------
> >  .../i915/gem/selftests/i915_gem_execbuffer.c  |  14 +-
> >  2 files changed, 83 insertions(+), 58 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > index ecdb583cc2eb..70784779872a 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > @@ -270,7 +270,7 @@ struct i915_execbuffer {
> >  	/** list of vma that have execobj.relocation_count */
> >  	struct list_head relocs;
> >  
> > -	struct i915_gem_ww_ctx ww;
> > +	struct i915_gem_ww_ctx *ww;
> >  
> >  	/**
> >  	 * Track the most recently used object for relocations, as we
> > @@ -448,7 +448,7 @@ eb_pin_vma(struct i915_execbuffer *eb,
> >  		pin_flags |= PIN_GLOBAL;
> >  
> >  	/* Attempt to reuse the current location if available */
> > -	err = i915_vma_pin_ww(vma, &eb->ww, 0, 0, pin_flags);
> > +	err = i915_vma_pin_ww(vma, eb->ww, 0, 0, pin_flags);
> >  	if (err == -EDEADLK)
> >  		return err;
> >  
> > @@ -457,11 +457,11 @@ eb_pin_vma(struct i915_execbuffer *eb,
> >  			return err;
> >  
> >  		/* Failing that pick any _free_ space if suitable */
> > -		err = i915_vma_pin_ww(vma, &eb->ww,
> > -					     entry->pad_to_size,
> > -					     entry->alignment,
> > -					     eb_pin_flags(entry, ev->flags) |
> > -					     PIN_USER | PIN_NOEVICT);
> > +		err = i915_vma_pin_ww(vma, eb->ww,
> > +				      entry->pad_to_size,
> > +				      entry->alignment,
> > +				      eb_pin_flags(entry, ev->flags) |
> > +				      PIN_USER | PIN_NOEVICT);
> >  		if (unlikely(err))
> >  			return err;
> >  	}
> > @@ -643,9 +643,9 @@ static int eb_reserve_vma(struct i915_execbuffer *eb,
> >  			return err;
> >  	}
> >  
> > -	err = i915_vma_pin_ww(vma, &eb->ww,
> > -			   entry->pad_to_size, entry->alignment,
> > -			   eb_pin_flags(entry, ev->flags) | pin_flags);
> > +	err = i915_vma_pin_ww(vma, eb->ww,
> > +			      entry->pad_to_size, entry->alignment,
> > +			      eb_pin_flags(entry, ev->flags) | pin_flags);
> >  	if (err)
> >  		return err;
> >  
> > @@ -940,7 +940,7 @@ static int eb_lock_vmas(struct i915_execbuffer *eb)
> >  		struct eb_vma *ev = &eb->vma[i];
> >  		struct i915_vma *vma = ev->vma;
> >  
> > -		err = i915_gem_object_lock(vma->obj, &eb->ww);
> > +		err = i915_gem_object_lock(vma->obj, eb->ww);
> >  		if (err)
> >  			return err;
> >  	}
> > @@ -1020,12 +1020,13 @@ eb_get_vma(const struct i915_execbuffer *eb, unsigned long handle)
> >  	}
> >  }
> >  
> > -static void eb_release_vmas(struct i915_execbuffer *eb, bool final)
> > +static void eb_release_vmas(struct i915_execbuffer *eb, bool final,
> > +			    bool unreserve)
> >  {
> >  	const unsigned int count = eb->buffer_count;
> >  	unsigned int i;
> >  
> > -	for (i = 0; i < count; i++) {
> > +	for (i = 0; unreserve && i < count; i++) {
> >  		struct eb_vma *ev = &eb->vma[i];
> >  		struct i915_vma *vma = ev->vma;
> >  
> > @@ -1237,7 +1238,7 @@ static void *reloc_iomap(struct drm_i915_gem_object *obj,
> >  		if (err)
> >  			return ERR_PTR(err);
> >  
> > -		vma = i915_gem_object_ggtt_pin_ww(obj, &eb->ww, NULL, 0, 0,
> > +		vma = i915_gem_object_ggtt_pin_ww(obj, eb->ww, NULL, 0, 0,
> >  						  PIN_MAPPABLE |
> >  						  PIN_NONBLOCK /* NOWARN */ |
> >  						  PIN_NOEVICT);
> > @@ -1361,7 +1362,7 @@ static int __reloc_gpu_alloc(struct i915_execbuffer *eb,
> >  	}
> >  	eb->reloc_pool = NULL;
> >  
> > -	err = i915_gem_object_lock(pool->obj, &eb->ww);
> > +	err = i915_gem_object_lock(pool->obj, eb->ww);
> >  	if (err)
> >  		goto err_pool;
> >  
> > @@ -1380,7 +1381,7 @@ static int __reloc_gpu_alloc(struct i915_execbuffer *eb,
> >  		goto err_unmap;
> >  	}
> >  
> > -	err = i915_vma_pin_ww(batch, &eb->ww, 0, 0, PIN_USER | PIN_NONBLOCK);
> > +	err = i915_vma_pin_ww(batch, eb->ww, 0, 0, PIN_USER | PIN_NONBLOCK);
> >  	if (err)
> >  		goto err_unmap;
> >  
> > @@ -1402,7 +1403,7 @@ static int __reloc_gpu_alloc(struct i915_execbuffer *eb,
> >  			eb->reloc_context = ce;
> >  		}
> >  
> > -		err = intel_context_pin_ww(ce, &eb->ww);
> > +		err = intel_context_pin_ww(ce, eb->ww);
> >  		if (err)
> >  			goto err_unpin;
> >  
> > @@ -2017,8 +2018,8 @@ static noinline int eb_relocate_parse_slow(struct i915_execbuffer *eb,
> >  	}
> >  
> >  	/* We may process another execbuffer during the unlock... */
> > -	eb_release_vmas(eb, false);
> > -	i915_gem_ww_ctx_fini(&eb->ww);
> > +	eb_release_vmas(eb, false, true);
> > +	i915_gem_ww_ctx_fini(eb->ww);
> >  
> >  	if (rq) {
> >  		/* nonblocking is always false */
> > @@ -2062,7 +2063,7 @@ static noinline int eb_relocate_parse_slow(struct i915_execbuffer *eb,
> >  		err = eb_reinit_userptr(eb);
> >  
> >  err_relock:
> > -	i915_gem_ww_ctx_init(&eb->ww, true);
> > +	i915_gem_ww_ctx_init(eb->ww, true);
> >  	if (err)
> >  		goto out;
> >  
> > @@ -2119,8 +2120,8 @@ static noinline int eb_relocate_parse_slow(struct i915_execbuffer *eb,
> >  
> >  err:
> >  	if (err == -EDEADLK) {
> > -		eb_release_vmas(eb, false);
> > -		err = i915_gem_ww_ctx_backoff(&eb->ww);
> > +		eb_release_vmas(eb, false, true);
> > +		err = i915_gem_ww_ctx_backoff(eb->ww);
> >  		if (!err)
> >  			goto repeat_validate;
> >  	}
> > @@ -2152,7 +2153,7 @@ static noinline int eb_relocate_parse_slow(struct i915_execbuffer *eb,
> >  	return err;
> >  }
> >  
> > -static int eb_relocate_parse(struct i915_execbuffer *eb)
> > +static int eb_relocate_parse(struct i915_execbuffer *eb, bool first)
> >  {
> >  	int err;
> >  	struct i915_request *rq = NULL;
> > @@ -2189,14 +2190,16 @@ static int eb_relocate_parse(struct i915_execbuffer *eb)
> >  	/* only throttle once, even if we didn't need to throttle */
> >  	throttle = false;
> >  
> > -	err = eb_validate_vmas(eb);
> > -	if (err == -EAGAIN)
> > -		goto slow;
> > -	else if (err)
> > -		goto err;
> > +	if (first) {
> > +		err = eb_validate_vmas(eb);
> > +		if (err == -EAGAIN)
> > +			goto slow;
> > +		else if (err)
> > +			goto err;
> > +	}
> >  
> >  	/* The objects are in their final locations, apply the relocations. */
> > -	if (eb->args->flags & __EXEC_HAS_RELOC) {
> > +	if (eb->args->flags & __EXEC_HAS_RELOC && first) {
> >  		struct eb_vma *ev;
> >  
> >  		list_for_each_entry(ev, &eb->relocs, reloc_link) {
> > @@ -2211,13 +2214,13 @@ static int eb_relocate_parse(struct i915_execbuffer *eb)
> >  			goto slow;
> >  	}
> >  
> > -	if (!err)
> > +	if (!err && first)
> >  		err = eb_parse(eb);
> >  
> >  err:
> >  	if (err == -EDEADLK) {
> > -		eb_release_vmas(eb, false);
> > -		err = i915_gem_ww_ctx_backoff(&eb->ww);
> > +		eb_release_vmas(eb, false, true);
> > +		err = i915_gem_ww_ctx_backoff(eb->ww);
> >  		if (!err)
> >  			goto retry;
> >  	}
> > @@ -2398,7 +2401,7 @@ shadow_batch_pin(struct i915_execbuffer *eb,
> >  	if (IS_ERR(vma))
> >  		return vma;
> >  
> > -	err = i915_vma_pin_ww(vma, &eb->ww, 0, 0, flags);
> > +	err = i915_vma_pin_ww(vma, eb->ww, 0, 0, flags);
> >  	if (err)
> >  		return ERR_PTR(err);
> >  
> > @@ -2412,7 +2415,7 @@ static struct i915_vma *eb_dispatch_secure(struct i915_execbuffer *eb, struct i9
> >  	 * batch" bit. Hence we need to pin secure batches into the global gtt.
> >  	 * hsw should have this fixed, but bdw mucks it up again. */
> >  	if (eb->batch_flags & I915_DISPATCH_SECURE)
> > -		return i915_gem_object_ggtt_pin_ww(vma->obj, &eb->ww, NULL, 0, 0, 0);
> > +		return i915_gem_object_ggtt_pin_ww(vma->obj, eb->ww, NULL, 0, 0, 0);
> >  
> >  	return NULL;
> >  }
> > @@ -2458,7 +2461,7 @@ static int eb_parse(struct i915_execbuffer *eb)
> >  		eb->batch_pool = pool;
> >  	}
> >  
> > -	err = i915_gem_object_lock(pool->obj, &eb->ww);
> > +	err = i915_gem_object_lock(pool->obj, eb->ww);
> >  	if (err)
> >  		goto err;
> >  
> > @@ -2666,7 +2669,7 @@ static struct i915_request *eb_pin_engine(struct i915_execbuffer *eb, bool throt
> >  	 * GGTT space, so do this first before we reserve a seqno for
> >  	 * ourselves.
> >  	 */
> > -	err = intel_context_pin_ww(ce, &eb->ww);
> > +	err = intel_context_pin_ww(ce, eb->ww);
> >  	if (err)
> >  		return ERR_PTR(err);
> >  
> > @@ -3218,7 +3221,8 @@ i915_gem_do_execbuffer(struct drm_device *dev,
> >  		       unsigned int batch_number,
> >  		       struct dma_fence *in_fence,
> >  		       struct dma_fence *exec_fence,
> > -		       struct dma_fence **out_fence)
> > +		       struct dma_fence **out_fence,
> > +		       struct i915_gem_ww_ctx *ww)
> >  {
> >  	struct drm_i915_private *i915 = to_i915(dev);
> >  	struct i915_execbuffer eb;
> > @@ -3239,7 +3243,8 @@ i915_gem_do_execbuffer(struct drm_device *dev,
> >  
> >  	eb.exec = exec;
> >  	eb.vma = (struct eb_vma *)(exec + args->buffer_count + 1);
> > -	eb.vma[0].vma = NULL;
> > +	if (first)
> > +		eb.vma[0].vma = NULL;
> >  	eb.reloc_pool = eb.batch_pool = NULL;
> >  	eb.reloc_context = NULL;
> >  
> > @@ -3251,6 +3256,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,
> >  	eb.batch_len = args->batch_len;
> >  	eb.trampoline = NULL;
> >  	eb.composite_fence = NULL;
> > +	eb.ww = ww;
> >  
> >  	eb.fences = NULL;
> >  	eb.num_fences = 0;
> > @@ -3269,9 +3275,14 @@ i915_gem_do_execbuffer(struct drm_device *dev,
> >  	if (err)
> >  		goto err_ext;
> >  
> > -	err = eb_create(&eb);
> > -	if (err)
> > -		goto err_ext;
> > +	if (first) {
> > +		err = eb_create(&eb);
> > +		if (err)
> > +			goto err_ext;
> > +	} else {
> > +		eb.lut_size = -eb.buffer_count;
> > +	}
> > +
> >  
> >  	GEM_BUG_ON(!eb.lut_size);
> >  
> > @@ -3286,15 +3297,22 @@ i915_gem_do_execbuffer(struct drm_device *dev,
> >  	if (unlikely(err))
> >  		goto err_context;
> >  
> > -	err = eb_lookup_vmas(&eb);
> > -	if (err) {
> > -		eb_release_vmas(&eb, true);
> > -		goto err_engine;
> > +	if (first) {
> > +		err = eb_lookup_vmas(&eb);
> > +		if (err) {
> > +			eb_release_vmas(&eb, true, true);
> > +			goto err_engine;
> > +		}
> > +
> > +	} else {
> > +		eb.batch = &eb.vma[eb.batch_index];
> >  	}
> >  
> > -	i915_gem_ww_ctx_init(&eb.ww, true);
> >  
> > -	err = eb_relocate_parse(&eb);
> > +	if (first)
> > +		i915_gem_ww_ctx_init(eb.ww, true);
> > +
> > +	err = eb_relocate_parse(&eb, first);
> >  	if (err) {
> >  		/*
> >  		 * If the user expects the execobject.offset and
> > @@ -3307,7 +3325,8 @@ i915_gem_do_execbuffer(struct drm_device *dev,
> >  		goto err_vma;
> >  	}
> >  
> > -	ww_acquire_done(&eb.ww.ctx);
> > +	if (first)
> > +		ww_acquire_done(&eb.ww->ctx);
> >  
> >  	batch = eb.batch->vma;
> >  
> > @@ -3410,11 +3429,12 @@ i915_gem_do_execbuffer(struct drm_device *dev,
> >  	i915_request_put(eb.request);
> >  
> >  err_vma:
> > -	eb_release_vmas(&eb, true);
> > +	eb_release_vmas(&eb, true, err || last);
> >  	if (eb.trampoline)
> >  		i915_vma_unpin(eb.trampoline);
> >  	WARN_ON(err == -EDEADLK);
> > -	i915_gem_ww_ctx_fini(&eb.ww);
> > +	if (err || last)
> > +		i915_gem_ww_ctx_fini(eb.ww);
> >  
> >  	if (eb.batch_pool)
> >  		intel_gt_buffer_pool_put(eb.batch_pool);
> > @@ -3476,6 +3496,7 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
> >  	const size_t count = args->buffer_count;
> >  	int err;
> >  	struct i915_gem_context *ctx;
> > +	struct i915_gem_ww_ctx ww;
> >  	struct intel_context *parent = NULL;
> >  	unsigned int num_batches = 1, i;
> >  	bool is_parallel = false;
> > @@ -3602,7 +3623,8 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
> >  				     0,
> >  				     in_fence,
> >  				     exec_fence,
> > -				     out_fences);
> > +				     out_fences,
> > +				     &ww);
> >  
> >  	for (i = 1; err == 0 && i < num_batches; i++)
> >  		err = i915_gem_do_execbuffer(dev, file, args, exec2_list,
> > @@ -3612,7 +3634,8 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
> >  					     i,
> >  					     NULL,
> >  					     NULL,
> > -					     out_fences);
> > +					     out_fences,
> > +					     &ww);
> >  
> >  	if (is_parallel)
> >  		mutex_unlock(&parent->parallel_submit);
> > diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_execbuffer.c
> > index 16162fc2782d..710d2700e5b4 100644
> > --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_execbuffer.c
> > +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_execbuffer.c
> > @@ -32,11 +32,11 @@ static int __igt_gpu_reloc(struct i915_execbuffer *eb,
> >  	if (IS_ERR(vma))
> >  		return PTR_ERR(vma);
> >  
> > -	err = i915_gem_object_lock(obj, &eb->ww);
> > +	err = i915_gem_object_lock(obj, eb->ww);
> >  	if (err)
> >  		return err;
> >  
> > -	err = i915_vma_pin_ww(vma, &eb->ww, 0, 0, PIN_USER | PIN_HIGH);
> > +	err = i915_vma_pin_ww(vma, eb->ww, 0, 0, PIN_USER | PIN_HIGH);
> >  	if (err)
> >  		return err;
> >  
> > @@ -106,10 +106,12 @@ static int __igt_gpu_reloc(struct i915_execbuffer *eb,
> >  static int igt_gpu_reloc(void *arg)
> >  {
> >  	struct i915_execbuffer eb;
> > +	struct i915_gem_ww_ctx ww;
> >  	struct drm_i915_gem_object *scratch;
> >  	int err = 0;
> >  	u32 *map;
> >  
> > +	eb.ww = &ww;
> >  	eb.i915 = arg;
> >  
> >  	scratch = i915_gem_object_create_internal(eb.i915, 4096);
> > @@ -141,20 +143,20 @@ static int igt_gpu_reloc(void *arg)
> >  		eb.reloc_pool = NULL;
> >  		eb.reloc_context = NULL;
> >  
> > -		i915_gem_ww_ctx_init(&eb.ww, false);
> > +		i915_gem_ww_ctx_init(eb.ww, false);
> >  retry:
> > -		err = intel_context_pin_ww(eb.context, &eb.ww);
> > +		err = intel_context_pin_ww(eb.context, eb.ww);
> >  		if (!err) {
> >  			err = __igt_gpu_reloc(&eb, scratch);
> >  
> >  			intel_context_unpin(eb.context);
> >  		}
> >  		if (err == -EDEADLK) {
> > -			err = i915_gem_ww_ctx_backoff(&eb.ww);
> > +			err = i915_gem_ww_ctx_backoff(eb.ww);
> >  			if (!err)
> >  				goto retry;
> >  		}
> > -		i915_gem_ww_ctx_fini(&eb.ww);
> > +		i915_gem_ww_ctx_fini(eb.ww);
> >  
> >  		if (eb.reloc_pool)
> >  			intel_gt_buffer_pool_put(eb.reloc_pool);
> > -- 
> > 2.28.0
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
