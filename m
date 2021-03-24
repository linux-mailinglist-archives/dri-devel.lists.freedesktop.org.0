Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 444A23476E0
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 12:13:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3A566E9C1;
	Wed, 24 Mar 2021 11:13:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E0FF6E9C6
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 11:13:53 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id x7so1552691wrw.10
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 04:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=B1xGBVTejKcQ1HCjhzu+vENZoHeEyRx4OXc51ZX0vn0=;
 b=izTA58A5CUKZbKN6oP/6+IQrFctaI6k/g3XMhUNirzJrDIo0tC1zM8lbn1yKCryf3e
 dD0M09G7IksO4z7cGkqwxCBWxXDQWT8ZykB8gjIzcnEzuEAT/W4i3GuSN6dKc67w6/Zt
 y5xVvJlq1weTguNHCLZzg8Xyr3einRWkt5Fq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=B1xGBVTejKcQ1HCjhzu+vENZoHeEyRx4OXc51ZX0vn0=;
 b=j2g+iWX3SE9VAB+UIP1R5HyQwCWxv7y/Bh2x3ZDCIbYoSmCUTL/w1vRyls77l/xpfi
 DKxDGVWEeXSxRb4yMipDt3vpRLsA72wUl/yPjBnKoGgcFLnCxvE0vcynQNGlU4MVg1Tn
 3FrB9Q7lPAE9R23lX6PUipeNREGuDXw09SXgZpeGayRIXrQDxpY1K2zYqmx9iCWk4biy
 wobTPVpnsKm2vV/HHR6nAEbXs6Ay1pYwLWRBLxh73XI2NhvkkMVGXxv6gch1r5KF7lzU
 iKwd8an7/9/O6B/MAA0Q2TVCEhBV/bCSTsr6LoJYLAMn5MyN3KiLOMUn2Bbr/O288qrH
 5hAw==
X-Gm-Message-State: AOAM533Vy4zMS4aw8qMh9eMNH3aSmAH+RKIEh5AngcC8b62+JzdS+5md
 V7qlzHbFbIHMg90H2IcRe3JNhCn6Tp9Gvoxe
X-Google-Smtp-Source: ABdhPJxHYy9DHsfXaRGydxU/umfNCzn8cC7XLhT2r0L67l+Z0STsWeX+D4iS6DNQ8PfPviRyVp113A==
X-Received: by 2002:a5d:6945:: with SMTP id r5mr2824273wrw.367.1616584432087; 
 Wed, 24 Mar 2021 04:13:52 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p27sm2153191wmi.12.2021.03.24.04.13.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 04:13:51 -0700 (PDT)
Date: Wed, 24 Mar 2021 12:13:49 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v9 17/70] drm/i915: Flatten obj->mm.lock
Message-ID: <YFse7ZlKdYfLkiqB@phenom.ffwll.local>
References: <20210323155059.628690-1-maarten.lankhorst@linux.intel.com>
 <20210323155059.628690-18-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210323155059.628690-18-maarten.lankhorst@linux.intel.com>
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 23, 2021 at 04:50:06PM +0100, Maarten Lankhorst wrote:
> With userptr fixed, there is no need for all separate lockdep classes
> now, and we can remove all lockdep tricks used. A trylock in the
> shrinker is all we need now to flatten the locking hierarchy.
> =

> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Reviewed-by: Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>

Minor conflict with this one here when applying, due to lack of

https://lore.kernel.org/intel-gfx/20210202154318.19246-1-chris@chris-wilson=
.co.

It's not a bad idea, but if we do this we really should move this helper
into the right headers, and ideally get linux-mm/-fs folks to ack this as
a good idea. Especially Dave Chinner very much wants to be in the loop for
anything that touches fs_reclaim lockdep annotations.
-Daniel


> ---
>  drivers/gpu/drm/i915/gem/i915_gem_object.c   |  5 +--
>  drivers/gpu/drm/i915/gem/i915_gem_object.h   | 20 ++----------
>  drivers/gpu/drm/i915/gem/i915_gem_pages.c    | 34 ++++++++++----------
>  drivers/gpu/drm/i915/gem/i915_gem_phys.c     |  2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_shrinker.c | 10 +++---
>  drivers/gpu/drm/i915/gem/i915_gem_userptr.c  |  2 +-
>  6 files changed, 27 insertions(+), 46 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm=
/i915/gem/i915_gem_object.c
> index 6083b9c14be6..821cb40f8d73 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> @@ -62,7 +62,7 @@ void i915_gem_object_init(struct drm_i915_gem_object *o=
bj,
>  			  const struct drm_i915_gem_object_ops *ops,
>  			  struct lock_class_key *key, unsigned flags)
>  {
> -	__mutex_init(&obj->mm.lock, ops->name ?: "obj->mm.lock", key);
> +	mutex_init(&obj->mm.lock);
>  =

>  	spin_lock_init(&obj->vma.lock);
>  	INIT_LIST_HEAD(&obj->vma.list);
> @@ -86,9 +86,6 @@ void i915_gem_object_init(struct drm_i915_gem_object *o=
bj,
>  	mutex_init(&obj->mm.get_page.lock);
>  	INIT_RADIX_TREE(&obj->mm.get_dma_page.radix, GFP_KERNEL | __GFP_NOWARN);
>  	mutex_init(&obj->mm.get_dma_page.lock);
> -
> -	if (IS_ENABLED(CONFIG_LOCKDEP) && i915_gem_object_is_shrinkable(obj))
> -		fs_reclaim_taints_mutex(&obj->mm.lock);
>  }
>  =

>  /**
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm=
/i915/gem/i915_gem_object.h
> index b5af9c440ac5..a0e1c4ff0de4 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> @@ -372,27 +372,10 @@ void __i915_gem_object_set_pages(struct drm_i915_ge=
m_object *obj,
>  int ____i915_gem_object_get_pages(struct drm_i915_gem_object *obj);
>  int __i915_gem_object_get_pages(struct drm_i915_gem_object *obj);
>  =

> -enum i915_mm_subclass { /* lockdep subclass for obj->mm.lock/struct_mute=
x */
> -	I915_MM_NORMAL =3D 0,
> -	/*
> -	 * Only used by struct_mutex, when called "recursively" from
> -	 * direct-reclaim-esque. Safe because there is only every one
> -	 * struct_mutex in the entire system.
> -	 */
> -	I915_MM_SHRINKER =3D 1,
> -	/*
> -	 * Used for obj->mm.lock when allocating pages. Safe because the object
> -	 * isn't yet on any LRU, and therefore the shrinker can't deadlock on
> -	 * it. As soon as the object has pages, obj->mm.lock nests within
> -	 * fs_reclaim.
> -	 */
> -	I915_MM_GET_PAGES =3D 1,
> -};
> -
>  static inline int __must_check
>  i915_gem_object_pin_pages(struct drm_i915_gem_object *obj)
>  {
> -	might_lock_nested(&obj->mm.lock, I915_MM_GET_PAGES);
> +	might_lock(&obj->mm.lock);
>  =

>  	if (atomic_inc_not_zero(&obj->mm.pages_pin_count))
>  		return 0;
> @@ -436,6 +419,7 @@ i915_gem_object_unpin_pages(struct drm_i915_gem_objec=
t *obj)
>  }
>  =

>  int __i915_gem_object_put_pages(struct drm_i915_gem_object *obj);
> +int __i915_gem_object_put_pages_locked(struct drm_i915_gem_object *obj);
>  void i915_gem_object_truncate(struct drm_i915_gem_object *obj);
>  void i915_gem_object_writeback(struct drm_i915_gem_object *obj);
>  =

> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/=
i915/gem/i915_gem_pages.c
> index e7d7650072c5..e947d4c0da1f 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> @@ -114,7 +114,7 @@ int __i915_gem_object_get_pages(struct drm_i915_gem_o=
bject *obj)
>  {
>  	int err;
>  =

> -	err =3D mutex_lock_interruptible_nested(&obj->mm.lock, I915_MM_GET_PAGE=
S);
> +	err =3D mutex_lock_interruptible(&obj->mm.lock);
>  	if (err)
>  		return err;
>  =

> @@ -196,21 +196,13 @@ __i915_gem_object_unset_pages(struct drm_i915_gem_o=
bject *obj)
>  	return pages;
>  }
>  =

> -int __i915_gem_object_put_pages(struct drm_i915_gem_object *obj)
> +int __i915_gem_object_put_pages_locked(struct drm_i915_gem_object *obj)
>  {
>  	struct sg_table *pages;
> -	int err;
>  =

>  	if (i915_gem_object_has_pinned_pages(obj))
>  		return -EBUSY;
>  =

> -	/* May be called by shrinker from within get_pages() (on another bo) */
> -	mutex_lock(&obj->mm.lock);
> -	if (unlikely(atomic_read(&obj->mm.pages_pin_count))) {
> -		err =3D -EBUSY;
> -		goto unlock;
> -	}
> -
>  	i915_gem_object_release_mmap_offset(obj);
>  =

>  	/*
> @@ -226,14 +218,22 @@ int __i915_gem_object_put_pages(struct drm_i915_gem=
_object *obj)
>  	 * get_pages backends we should be better able to handle the
>  	 * cancellation of the async task in a more uniform manner.
>  	 */
> -	if (!pages)
> -		pages =3D ERR_PTR(-EINVAL);
> -
> -	if (!IS_ERR(pages))
> +	if (!IS_ERR_OR_NULL(pages))
>  		obj->ops->put_pages(obj, pages);
>  =

> -	err =3D 0;
> -unlock:
> +	return 0;
> +}
> +
> +int __i915_gem_object_put_pages(struct drm_i915_gem_object *obj)
> +{
> +	int err;
> +
> +	if (i915_gem_object_has_pinned_pages(obj))
> +		return -EBUSY;
> +
> +	/* May be called by shrinker from within get_pages() (on another bo) */
> +	mutex_lock(&obj->mm.lock);
> +	err =3D __i915_gem_object_put_pages_locked(obj);
>  	mutex_unlock(&obj->mm.lock);
>  =

>  	return err;
> @@ -341,7 +341,7 @@ void *i915_gem_object_pin_map(struct drm_i915_gem_obj=
ect *obj,
>  	    !i915_gem_object_type_has(obj, I915_GEM_OBJECT_HAS_IOMEM))
>  		return ERR_PTR(-ENXIO);
>  =

> -	err =3D mutex_lock_interruptible_nested(&obj->mm.lock, I915_MM_GET_PAGE=
S);
> +	err =3D mutex_lock_interruptible(&obj->mm.lock);
>  	if (err)
>  		return ERR_PTR(err);
>  =

> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_phys.c b/drivers/gpu/drm/i=
915/gem/i915_gem_phys.c
> index 06c481ff79d8..44329c435cf1 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_phys.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
> @@ -236,7 +236,7 @@ int i915_gem_object_attach_phys(struct drm_i915_gem_o=
bject *obj, int align)
>  	if (err)
>  		return err;
>  =

> -	err =3D mutex_lock_interruptible_nested(&obj->mm.lock, I915_MM_GET_PAGE=
S);
> +	err =3D mutex_lock_interruptible(&obj->mm.lock);
>  	if (err)
>  		goto err_unlock;
>  =

> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/d=
rm/i915/gem/i915_gem_shrinker.c
> index b64a0788381f..3052ef5ad89d 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
> @@ -49,9 +49,9 @@ static bool unsafe_drop_pages(struct drm_i915_gem_objec=
t *obj,
>  		flags =3D I915_GEM_OBJECT_UNBIND_TEST;
>  =

>  	if (i915_gem_object_unbind(obj, flags) =3D=3D 0)
> -		__i915_gem_object_put_pages(obj);
> +		return true;
>  =

> -	return !i915_gem_object_has_pages(obj);
> +	return false;
>  }
>  =

>  static void try_to_writeback(struct drm_i915_gem_object *obj,
> @@ -200,10 +200,10 @@ i915_gem_shrink(struct drm_i915_private *i915,
>  =

>  			spin_unlock_irqrestore(&i915->mm.obj_lock, flags);
>  =

> -			if (unsafe_drop_pages(obj, shrink)) {
> +			if (unsafe_drop_pages(obj, shrink) &&
> +			    mutex_trylock(&obj->mm.lock)) {
>  				/* May arrive from get_pages on another bo */
> -				mutex_lock(&obj->mm.lock);
> -				if (!i915_gem_object_has_pages(obj)) {
> +				if (!__i915_gem_object_put_pages_locked(obj)) {
>  					try_to_writeback(obj, shrink);
>  					count +=3D obj->base.size >> PAGE_SHIFT;
>  				}
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/dr=
m/i915/gem/i915_gem_userptr.c
> index 1e42fbc68697..503325e74eff 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> @@ -253,7 +253,7 @@ static int i915_gem_object_userptr_unbind(struct drm_=
i915_gem_object *obj, bool
>  	if (GEM_WARN_ON(i915_gem_object_has_pinned_pages(obj)))
>  		return -EBUSY;
>  =

> -	mutex_lock_nested(&obj->mm.lock, I915_MM_GET_PAGES);
> +	mutex_lock(&obj->mm.lock);
>  =

>  	pages =3D __i915_gem_object_unset_pages(obj);
>  	if (!IS_ERR_OR_NULL(pages))
> -- =

> 2.31.0
> =

> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
