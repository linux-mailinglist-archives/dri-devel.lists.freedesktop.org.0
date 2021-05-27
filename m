Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B46A4392C16
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 12:44:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2B936EE6F;
	Thu, 27 May 2021 10:44:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E1E26EE6D
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 10:44:07 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso2295571wmh.4
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 03:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=T8b0jWwrqw+mw0R5Dk24GCiMy1H1Ono6k0dXnPiHh30=;
 b=JJFfHPQsZcMF4IHdihJKQOaYZwx9gob7sF0JpoUWzqGHbuGWYJj0YIwfkggQqTDHH7
 uceRmXZMZSEq31MbD4n+QLFvGPeKpk4LHZQRVjjTZqXXO3rQNU6EkcsvNAFcqiMKlz7C
 +XWdLiYGTi5G7BrZvouNR4JnCu1sJa/i9Ld4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=T8b0jWwrqw+mw0R5Dk24GCiMy1H1Ono6k0dXnPiHh30=;
 b=WNaK/zl757vzOjRLOKg+4pubBt/zrFekC1fMdI0xXurkMgZ4H0jMVLgaMbORheUTEV
 QkfjzMWSTuNhPV0337pAiCd8KDgQYFVG3THFWHtIa2DEFyNC0p5hl0EOAN3rBmKx56SL
 cIhIBdQ6e179mpXDw1C2uvTx7t2eDalIrNjGqtr6Ntvu9EWbDKZZ4yQMbpXloH57uno5
 7uuz/KXMc3QubQOJ3ZWCbgrxUB4Rpa6eldGI4LhquuuTlqkr7En7nzp3wp4iWpk0dHVU
 /07H0GZqi+TmoGtcIe/bRJWQiU/j9KpXIix7z4iSjCLwvaTm03zrHzqXyIZGUGMLdj3O
 oXEQ==
X-Gm-Message-State: AOAM5320G83vlE4iFZjj/wZX6mHAm0L8PajjUDFBJtl3EuMn7i4PgLyK
 HUAgHDzAolfj5Lc8LWNOMXOQzA==
X-Google-Smtp-Source: ABdhPJzvVlIG7q9RkQkQs/uCp2zQOjSholQSb333D1QZRjtP8ojbDnJ+CYKhgKrnUHTNAB9MDJF/Hg==
X-Received: by 2002:a7b:ca58:: with SMTP id m24mr7737841wml.151.1622112246203; 
 Thu, 27 May 2021 03:44:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u18sm2380525wmj.15.2021.05.27.03.44.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 03:44:05 -0700 (PDT)
Date: Thu, 27 May 2021 12:44:03 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH 12/12] drm/i915/gem: Manage all set-domain waits explicitly
Message-ID: <YK9389/yYBMl8cCP@phenom.ffwll.local>
References: <20210526141456.2334192-1-tvrtko.ursulin@linux.intel.com>
 <20210526141456.2334192-13-tvrtko.ursulin@linux.intel.com>
 <5aaf24d3-9171-ee1f-5b89-fd1a501afc01@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5aaf24d3-9171-ee1f-5b89-fd1a501afc01@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 26, 2021 at 03:30:57PM +0100, Matthew Auld wrote:
> On 26/05/2021 15:14, Tvrtko Ursulin wrote:
> > From: Chris Wilson <chris@chris-wilson.co.uk>
> > 
> > Only perform the domain transition under the object lock, and push the
> > required waits to outside the lock.

Do we have actual performance data justifying this? Anything else
justifying this?

If we resurrect patches, I do expect actual review happens here, and
that's not even close the case for this patch here at least. I didn't
bother looking at the others.
-Daniel

> > 
> > v2 (Tvrtko):
> >   * Rebase.
> > 
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > Reviewed-by: Matthew Auld <matthew.auld@intel.com> # v1
> > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gem/i915_gem_clflush.c   |   9 +-
> >   drivers/gpu/drm/i915/gem/i915_gem_clflush.h   |   2 -
> >   drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |   4 +-
> >   drivers/gpu/drm/i915/gem/i915_gem_domain.c    | 163 +++++-------------
> >   .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |   4 +-
> >   drivers/gpu/drm/i915/gem/i915_gem_object.h    |  12 +-
> >   .../gpu/drm/i915/gem/i915_gem_object_types.h  |   6 +
> >   .../gpu/drm/i915/gem/selftests/huge_pages.c   |   8 -
> >   .../i915/gem/selftests/i915_gem_coherency.c   |  31 +++-
> >   .../drm/i915/gem/selftests/i915_gem_phys.c    |   8 +-
> >   .../drm/i915/gem/selftests/igt_gem_utils.c    |   3 +
> >   drivers/gpu/drm/i915/i915_gem.c               |   4 +-
> >   12 files changed, 89 insertions(+), 165 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
> > index daf9284ef1f5..e4c24558eaa8 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
> > @@ -51,8 +51,6 @@ static struct clflush *clflush_work_create(struct drm_i915_gem_object *obj)
> >   {
> >   	struct clflush *clflush;
> > -	GEM_BUG_ON(!obj->cache_dirty);
> > -
> >   	clflush = kmalloc(sizeof(*clflush), GFP_KERNEL);
> >   	if (!clflush)
> >   		return NULL;
> > @@ -101,13 +99,10 @@ bool i915_gem_clflush_object(struct drm_i915_gem_object *obj,
> >   	trace_i915_gem_object_clflush(obj);
> > -	clflush = NULL;
> > -	if (!(flags & I915_CLFLUSH_SYNC))
> > -		clflush = clflush_work_create(obj);
> > +	clflush = clflush_work_create(obj);
> >   	if (clflush) {
> >   		i915_sw_fence_await_reservation(&clflush->base.chain,
> > -						obj->base.resv, NULL, true,
> > -						i915_fence_timeout(to_i915(obj->base.dev)),
> > +						obj->base.resv, NULL, true, 0,
> >   						I915_FENCE_GFP);
> >   		dma_resv_add_excl_fence(obj->base.resv, &clflush->base.dma);
> >   		dma_fence_work_commit(&clflush->base);
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_clflush.h b/drivers/gpu/drm/i915/gem/i915_gem_clflush.h
> > index e6c382973129..4cd5787d1507 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_clflush.h
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_clflush.h
> > @@ -9,12 +9,10 @@
> >   #include <linux/types.h>
> > -struct drm_i915_private;
> >   struct drm_i915_gem_object;
> >   bool i915_gem_clflush_object(struct drm_i915_gem_object *obj,
> >   			     unsigned int flags);
> >   #define I915_CLFLUSH_FORCE BIT(0)
> > -#define I915_CLFLUSH_SYNC BIT(1)
> >   #endif /* __I915_GEM_CLFLUSH_H__ */
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> > index ccede73c6465..0926e0895ee6 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> > @@ -132,7 +132,7 @@ static int i915_gem_begin_cpu_access(struct dma_buf *dma_buf, enum dma_data_dire
> >   	if (!err)
> >   		err = i915_gem_object_pin_pages(obj);
> >   	if (!err) {
> > -		err = i915_gem_object_set_to_cpu_domain(obj, write);
> > +		i915_gem_object_set_to_cpu_domain(obj, write);
> >   		i915_gem_object_unpin_pages(obj);
> >   	}
> >   	if (err == -EDEADLK) {
> > @@ -156,7 +156,7 @@ static int i915_gem_end_cpu_access(struct dma_buf *dma_buf, enum dma_data_direct
> >   	if (!err)
> >   		err = i915_gem_object_pin_pages(obj);
> >   	if (!err) {
> > -		err = i915_gem_object_set_to_gtt_domain(obj, false);
> > +		i915_gem_object_set_to_gtt_domain(obj, false);
> >   		i915_gem_object_unpin_pages(obj);
> >   	}
> >   	if (err == -EDEADLK) {
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> > index 073822100da7..39fda97c49a7 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> > @@ -49,7 +49,7 @@ flush_write_domain(struct drm_i915_gem_object *obj, unsigned int flush_domains)
> >   		break;
> >   	case I915_GEM_DOMAIN_CPU:
> > -		i915_gem_clflush_object(obj, I915_CLFLUSH_SYNC);
> > +		i915_gem_clflush_object(obj, 0);
> >   		break;
> >   	case I915_GEM_DOMAIN_RENDER:
> > @@ -97,34 +97,13 @@ void i915_gem_object_flush_if_display_locked(struct drm_i915_gem_object *obj)
> >    * This function returns when the move is complete, including waiting on
> >    * flushes to occur.
> >    */
> > -int
> > +void
> >   i915_gem_object_set_to_wc_domain(struct drm_i915_gem_object *obj, bool write)
> >   {
> > -	int ret;
> > -
> >   	assert_object_held(obj);
> > -	ret = i915_gem_object_wait(obj,
> > -				   I915_WAIT_INTERRUPTIBLE |
> > -				   (write ? I915_WAIT_ALL : 0),
> > -				   MAX_SCHEDULE_TIMEOUT);
> > -	if (ret)
> > -		return ret;
> > -
> >   	if (obj->write_domain == I915_GEM_DOMAIN_WC)
> > -		return 0;
> > -
> > -	/* Flush and acquire obj->pages so that we are coherent through
> > -	 * direct access in memory with previous cached writes through
> > -	 * shmemfs and that our cache domain tracking remains valid.
> > -	 * For example, if the obj->filp was moved to swap without us
> > -	 * being notified and releasing the pages, we would mistakenly
> > -	 * continue to assume that the obj remained out of the CPU cached
> > -	 * domain.
> > -	 */
> > -	ret = i915_gem_object_pin_pages(obj);
> > -	if (ret)
> > -		return ret;
> > +		return;
> >   	flush_write_domain(obj, ~I915_GEM_DOMAIN_WC);
> > @@ -145,9 +124,6 @@ i915_gem_object_set_to_wc_domain(struct drm_i915_gem_object *obj, bool write)
> >   		obj->write_domain = I915_GEM_DOMAIN_WC;
> >   		obj->mm.dirty = true;
> >   	}
> > -
> > -	i915_gem_object_unpin_pages(obj);
> > -	return 0;
> >   }
> >   /**
> > @@ -158,34 +134,13 @@ i915_gem_object_set_to_wc_domain(struct drm_i915_gem_object *obj, bool write)
> >    * This function returns when the move is complete, including waiting on
> >    * flushes to occur.
> >    */
> > -int
> > +void
> >   i915_gem_object_set_to_gtt_domain(struct drm_i915_gem_object *obj, bool write)
> >   {
> > -	int ret;
> > -
> >   	assert_object_held(obj);
> > -	ret = i915_gem_object_wait(obj,
> > -				   I915_WAIT_INTERRUPTIBLE |
> > -				   (write ? I915_WAIT_ALL : 0),
> > -				   MAX_SCHEDULE_TIMEOUT);
> > -	if (ret)
> > -		return ret;
> > -
> >   	if (obj->write_domain == I915_GEM_DOMAIN_GTT)
> > -		return 0;
> > -
> > -	/* Flush and acquire obj->pages so that we are coherent through
> > -	 * direct access in memory with previous cached writes through
> > -	 * shmemfs and that our cache domain tracking remains valid.
> > -	 * For example, if the obj->filp was moved to swap without us
> > -	 * being notified and releasing the pages, we would mistakenly
> > -	 * continue to assume that the obj remained out of the CPU cached
> > -	 * domain.
> > -	 */
> > -	ret = i915_gem_object_pin_pages(obj);
> > -	if (ret)
> > -		return ret;
> > +		return;
> >   	flush_write_domain(obj, ~I915_GEM_DOMAIN_GTT);
> > @@ -214,9 +169,6 @@ i915_gem_object_set_to_gtt_domain(struct drm_i915_gem_object *obj, bool write)
> >   				i915_vma_set_ggtt_write(vma);
> >   		spin_unlock(&obj->vma.lock);
> >   	}
> > -
> > -	i915_gem_object_unpin_pages(obj);
> > -	return 0;
> >   }
> >   /**
> > @@ -431,25 +383,23 @@ i915_gem_object_pin_to_display_plane(struct drm_i915_gem_object *obj,
> >    * This function returns when the move is complete, including waiting on
> >    * flushes to occur.
> >    */
> > -int
> > +void
> >   i915_gem_object_set_to_cpu_domain(struct drm_i915_gem_object *obj, bool write)
> >   {
> > -	int ret;
> > -
> >   	assert_object_held(obj);
> > -	ret = i915_gem_object_wait(obj,
> > -				   I915_WAIT_INTERRUPTIBLE |
> > -				   (write ? I915_WAIT_ALL : 0),
> > -				   MAX_SCHEDULE_TIMEOUT);
> > -	if (ret)
> > -		return ret;
> > -
> >   	flush_write_domain(obj, ~I915_GEM_DOMAIN_CPU);
> >   	/* Flush the CPU cache if it's still invalid. */
> >   	if ((obj->read_domains & I915_GEM_DOMAIN_CPU) == 0) {
> > -		i915_gem_clflush_object(obj, I915_CLFLUSH_SYNC);
> > +		/*
> > +		 * While we track when we write though the CPU cache
> > +		 * (with obj->cache_dirty), this is only a guide as we do
> > +		 * not know when the CPU may have speculatively populated
> > +		 * the cache. We have to invalidate such speculative cachelines
> > +		 * prior to reading writes by the GPU.
> > +		 */
> > +		i915_gem_clflush_object(obj, 0);
> >   		obj->read_domains |= I915_GEM_DOMAIN_CPU;
> >   	}
> > @@ -463,8 +413,6 @@ i915_gem_object_set_to_cpu_domain(struct drm_i915_gem_object *obj, bool write)
> >   	 */
> >   	if (write)
> >   		__start_cpu_write(obj);
> > -
> > -	return 0;
> >   }
> >   /**
> > @@ -502,32 +450,14 @@ i915_gem_set_domain_ioctl(struct drm_device *dev, void *data,
> >   	if (!obj)
> >   		return -ENOENT;
> > -	/*
> > -	 * Try to flush the object off the GPU without holding the lock.
> > -	 * We will repeat the flush holding the lock in the normal manner
> > -	 * to catch cases where we are gazumped.
> > -	 */
> > -	err = i915_gem_object_wait(obj,
> > -				   I915_WAIT_INTERRUPTIBLE |
> > -				   I915_WAIT_PRIORITY |
> > -				   (write_domain ? I915_WAIT_ALL : 0),
> > -				   MAX_SCHEDULE_TIMEOUT);
> > -	if (err)
> > -		goto out;
> > -
> >   	if (i915_gem_object_is_userptr(obj)) {
> >   		/*
> >   		 * Try to grab userptr pages, iris uses set_domain to check
> >   		 * userptr validity
> >   		 */
> >   		err = i915_gem_object_userptr_validate(obj);
> > -		if (!err)
> > -			err = i915_gem_object_wait(obj,
> > -						   I915_WAIT_INTERRUPTIBLE |
> > -						   I915_WAIT_PRIORITY |
> > -						   (write_domain ? I915_WAIT_ALL : 0),
> > -						   MAX_SCHEDULE_TIMEOUT);
> > -		goto out;
> > +		if (err)
> > +			goto out;
> >   	}
> >   	/*
> > @@ -572,11 +502,11 @@ i915_gem_set_domain_ioctl(struct drm_device *dev, void *data,
> >   		goto out_unpin;
> >   	if (read_domains & I915_GEM_DOMAIN_WC)
> > -		err = i915_gem_object_set_to_wc_domain(obj, write_domain);
> > +		i915_gem_object_set_to_wc_domain(obj, write_domain);
> >   	else if (read_domains & I915_GEM_DOMAIN_GTT)
> > -		err = i915_gem_object_set_to_gtt_domain(obj, write_domain);
> > +		i915_gem_object_set_to_gtt_domain(obj, write_domain);
> >   	else
> > -		err = i915_gem_object_set_to_cpu_domain(obj, write_domain);
> > +		i915_gem_object_set_to_cpu_domain(obj, write_domain);
> >   out_unpin:
> >   	i915_gem_object_unpin_pages(obj);
> > @@ -584,6 +514,11 @@ i915_gem_set_domain_ioctl(struct drm_device *dev, void *data,
> >   out_unlock:
> >   	i915_gem_object_unlock(obj);
> > +	err = i915_gem_object_wait(obj,
> > +				   I915_WAIT_INTERRUPTIBLE |
> > +				   I915_WAIT_PRIORITY |
> > +				   (write_domain ? I915_WAIT_ALL : 0),
> > +				   MAX_SCHEDULE_TIMEOUT);
> >   	if (!err && write_domain)
> >   		i915_gem_object_invalidate_frontbuffer(obj, ORIGIN_CPU);
> > @@ -608,26 +543,21 @@ int i915_gem_object_prepare_read(struct drm_i915_gem_object *obj,
> >   	assert_object_held(obj);
> > -	ret = i915_gem_object_wait(obj,
> > -				   I915_WAIT_INTERRUPTIBLE,
> > -				   MAX_SCHEDULE_TIMEOUT);
> > -	if (ret)
> > -		return ret;
> > -
> >   	ret = i915_gem_object_pin_pages(obj);
> >   	if (ret)
> >   		return ret;
> >   	if (obj->cache_coherent & I915_BO_CACHE_COHERENT_FOR_READ ||
> > -	    !static_cpu_has(X86_FEATURE_CLFLUSH)) {
> > -		ret = i915_gem_object_set_to_cpu_domain(obj, false);
> > -		if (ret)
> > -			goto err_unpin;
> > -		else
> > -			goto out;
> > -	}
> > +	    !static_cpu_has(X86_FEATURE_CLFLUSH))
> > +		i915_gem_object_set_to_cpu_domain(obj, false);
> > +	else
> > +		flush_write_domain(obj, ~I915_GEM_DOMAIN_CPU);
> > -	flush_write_domain(obj, ~I915_GEM_DOMAIN_CPU);
> > +	ret = i915_gem_object_wait(obj,
> > +				   I915_WAIT_INTERRUPTIBLE,
> > +				   MAX_SCHEDULE_TIMEOUT);
> > +	if (ret)
> > +		goto err_unpin;
> >   	/* If we're not in the cpu read domain, set ourself into the gtt
> >   	 * read domain and manually flush cachelines (if required). This
> > @@ -638,7 +568,6 @@ int i915_gem_object_prepare_read(struct drm_i915_gem_object *obj,
> >   	    !(obj->read_domains & I915_GEM_DOMAIN_CPU))
> >   		*needs_clflush = CLFLUSH_BEFORE;
> > -out:
> >   	/* return with the pages pinned */
> >   	return 0;
> > @@ -658,27 +587,22 @@ int i915_gem_object_prepare_write(struct drm_i915_gem_object *obj,
> >   	assert_object_held(obj);
> > -	ret = i915_gem_object_wait(obj,
> > -				   I915_WAIT_INTERRUPTIBLE |
> > -				   I915_WAIT_ALL,
> > -				   MAX_SCHEDULE_TIMEOUT);
> > -	if (ret)
> > -		return ret;
> > -
> >   	ret = i915_gem_object_pin_pages(obj);
> >   	if (ret)
> >   		return ret;
> >   	if (obj->cache_coherent & I915_BO_CACHE_COHERENT_FOR_WRITE ||
> > -	    !static_cpu_has(X86_FEATURE_CLFLUSH)) {
> > -		ret = i915_gem_object_set_to_cpu_domain(obj, true);
> > -		if (ret)
> > -			goto err_unpin;
> > -		else
> > -			goto out;
> > -	}
> > +	    !static_cpu_has(X86_FEATURE_CLFLUSH))
> > +		i915_gem_object_set_to_cpu_domain(obj, true);
> > +	else
> > +		flush_write_domain(obj, ~I915_GEM_DOMAIN_CPU);
> > -	flush_write_domain(obj, ~I915_GEM_DOMAIN_CPU);
> > +	ret = i915_gem_object_wait(obj,
> > +				   I915_WAIT_INTERRUPTIBLE |
> > +				   I915_WAIT_ALL,
> > +				   MAX_SCHEDULE_TIMEOUT);
> > +	if (ret)
> > +		goto err_unpin;
> >   	/* If we're not in the cpu write domain, set ourself into the
> >   	 * gtt write domain and manually flush cachelines (as required).
> > @@ -696,7 +620,6 @@ int i915_gem_object_prepare_write(struct drm_i915_gem_object *obj,
> >   			*needs_clflush |= CLFLUSH_BEFORE;
> >   	}
> > -out:
> >   	i915_gem_object_invalidate_frontbuffer(obj, ORIGIN_CPU);
> >   	obj->mm.dirty = true;
> >   	/* return with the pages pinned */
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > index 297143511f99..40fda9e81a78 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > @@ -1212,9 +1212,7 @@ static void *reloc_iomap(struct drm_i915_gem_object *obj,
> >   		if (use_cpu_reloc(cache, obj))
> >   			return NULL;
> > -		err = i915_gem_object_set_to_gtt_domain(obj, true);
> > -		if (err)
> > -			return ERR_PTR(err);
> > +		i915_gem_object_set_to_gtt_domain(obj, true);
> >   		vma = i915_gem_object_ggtt_pin_ww(obj, &eb->ww, NULL, 0, 0,
> >   						  PIN_MAPPABLE |
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> > index 2ebd79537aea..8bbc835e70ce 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> > @@ -515,12 +515,12 @@ void i915_gem_object_set_cache_coherency(struct drm_i915_gem_object *obj,
> >   void i915_gem_object_flush_if_display(struct drm_i915_gem_object *obj);
> >   void i915_gem_object_flush_if_display_locked(struct drm_i915_gem_object *obj);
> > -int __must_check
> > -i915_gem_object_set_to_wc_domain(struct drm_i915_gem_object *obj, bool write);
> > -int __must_check
> > -i915_gem_object_set_to_gtt_domain(struct drm_i915_gem_object *obj, bool write);
> > -int __must_check
> > -i915_gem_object_set_to_cpu_domain(struct drm_i915_gem_object *obj, bool write);
> > +void i915_gem_object_set_to_wc_domain(struct drm_i915_gem_object *obj,
> > +				      bool write);
> > +void i915_gem_object_set_to_gtt_domain(struct drm_i915_gem_object *obj,
> > +				       bool write);
> > +void i915_gem_object_set_to_cpu_domain(struct drm_i915_gem_object *obj,
> > +				       bool write);
> >   struct i915_vma * __must_check
> >   i915_gem_object_pin_to_display_plane(struct drm_i915_gem_object *obj,
> >   				     struct i915_gem_ww_ctx *ww,
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> > index 0727d0c76aa0..b8f0413bc3b0 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> > @@ -188,6 +188,12 @@ struct drm_i915_gem_object {
> >   	unsigned int cache_coherent:2;
> >   #define I915_BO_CACHE_COHERENT_FOR_READ BIT(0)
> >   #define I915_BO_CACHE_COHERENT_FOR_WRITE BIT(1)
> > +	/*
> > +	 * Note cache_dirty is only a guide; we know when we have written
> > +	 * through the CPU cache, but we do not know when the CPU may have
> > +	 * speculatively populated the cache. Before a read via the cache
> > +	 * of GPU written memory, we have to cautiously invalidate the cache.
> > +	 */
> >   	unsigned int cache_dirty:1;
> >   	/**
> > diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> > index 33dd4e2a1010..d85ca79ac433 100644
> > --- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> > +++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> > @@ -972,14 +972,6 @@ static int gpu_write(struct intel_context *ce,
> >   		     u32 dw,
> >   		     u32 val)
> >   {
> > -	int err;
> > -
> > -	i915_gem_object_lock(vma->obj, NULL);
> > -	err = i915_gem_object_set_to_gtt_domain(vma->obj, true);
> > -	i915_gem_object_unlock(vma->obj);
> > -	if (err)
> > -		return err;
> > -
> >   	return igt_gpu_fill_dw(ce, vma, dw * sizeof(u32),
> >   			       vma->size >> PAGE_SHIFT, val);
> >   }
> > diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c
> > index e937b6629019..77ba6d1ef4e4 100644
> > --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c
> > +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_coherency.c
> > @@ -90,8 +90,13 @@ static int gtt_set(struct context *ctx, unsigned long offset, u32 v)
> >   	int err = 0;
> >   	i915_gem_object_lock(ctx->obj, NULL);
> > -	err = i915_gem_object_set_to_gtt_domain(ctx->obj, true);
> > +	i915_gem_object_set_to_gtt_domain(ctx->obj, true);
> >   	i915_gem_object_unlock(ctx->obj);
> > +
> > +	err = i915_gem_object_wait(ctx->obj,
> > +				   I915_WAIT_ALL |
> > +				   I915_WAIT_INTERRUPTIBLE,
> > +				   HZ / 2);
> >   	if (err)
> >   		return err;
> > @@ -123,8 +128,12 @@ static int gtt_get(struct context *ctx, unsigned long offset, u32 *v)
> >   	int err = 0;
> >   	i915_gem_object_lock(ctx->obj, NULL);
> > -	err = i915_gem_object_set_to_gtt_domain(ctx->obj, false);
> > +	i915_gem_object_set_to_gtt_domain(ctx->obj, false);
> >   	i915_gem_object_unlock(ctx->obj);
> > +
> > +	err = i915_gem_object_wait(ctx->obj,
> > +				   I915_WAIT_INTERRUPTIBLE,
> > +				   HZ / 2);
> >   	if (err)
> >   		return err;
> > @@ -155,8 +164,13 @@ static int wc_set(struct context *ctx, unsigned long offset, u32 v)
> >   	int err;
> >   	i915_gem_object_lock(ctx->obj, NULL);
> > -	err = i915_gem_object_set_to_wc_domain(ctx->obj, true);
> > +	i915_gem_object_set_to_wc_domain(ctx->obj, true);
> >   	i915_gem_object_unlock(ctx->obj);
> > +
> > +	err = i915_gem_object_wait(ctx->obj,
> > +				   I915_WAIT_ALL |
> > +				   I915_WAIT_INTERRUPTIBLE,
> > +				   HZ / 2);
> >   	if (err)
> >   		return err;
> > @@ -178,8 +192,12 @@ static int wc_get(struct context *ctx, unsigned long offset, u32 *v)
> >   	int err;
> >   	i915_gem_object_lock(ctx->obj, NULL);
> > -	err = i915_gem_object_set_to_wc_domain(ctx->obj, false);
> > +	i915_gem_object_set_to_wc_domain(ctx->obj, false);
> >   	i915_gem_object_unlock(ctx->obj);
> > +
> > +	err = i915_gem_object_wait(ctx->obj,
> > +				   I915_WAIT_INTERRUPTIBLE,
> > +				   HZ / 2);
> >   	if (err)
> >   		return err;
> > @@ -205,9 +223,7 @@ static int gpu_set(struct context *ctx, unsigned long offset, u32 v)
> >   		return PTR_ERR(vma);
> >   	i915_gem_object_lock(ctx->obj, NULL);
> > -	err = i915_gem_object_set_to_gtt_domain(ctx->obj, true);
> > -	if (err)
> > -		goto out_unlock;
> > +	i915_gem_object_set_to_gtt_domain(ctx->obj, false);
> 
> IIRC Daniel pointed out that this looks odd, since this now becomes
> write=false for some reason. I think keep this as write=true, since it does
> look like that is what gpu_set wants.

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
