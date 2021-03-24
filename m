Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF7E347750
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 12:28:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65DDD6E9C6;
	Wed, 24 Mar 2021 11:28:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A61E6E9C8
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 11:28:15 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so956749wmy.5
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 04:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=mjhfUs7bAF6j7CMgin31RBf6VYpxm9zePKIqrlkzAFs=;
 b=NuY72QOPXmItkzb07Nabac7vcVupSxriI6Ldb9otuDK4IA1iHkDZ+YOnA65hTw/Och
 ngIeP3e+QkYIFUIPxfcCKzpymxZOU+gAYVq5+YxX0AWcbg8KKL8A6Q/R1rQg9qm3jsbV
 PSzJFegopqj1ghtcXPXFnN9HCvn/z8MYKyF84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=mjhfUs7bAF6j7CMgin31RBf6VYpxm9zePKIqrlkzAFs=;
 b=cXjzl801VPBs4rRDMgYGYaTXPFlmaH0ePS6k43q4docHbm4nT2l1Tqh9pBY02vxntm
 1oDaYp13YNczmN8HdlrPSdrKAF2XZ/M5JRH7+b88jP5UqxzhLp17g8T7qLdKl1+XfHhO
 giQh00L5TVqnuwfgBPFKkS9E77Cm49h3dnuaocdxCewvlE9A1o2Y3Y2E6rQ+6F4wk0ed
 4QT4k6E3QMZ1Mi+IcipNTWsB3kwSkRKnTFtHd6z0oeNTa6LaPu4XJejxka6OKK2zi7Ut
 mT6j5pFDiLdNrIeEZsl4MtiyzrawzMHgmQhtKywtALuN7z2FRhD1KYoX9whpMSN2MA2K
 G8SA==
X-Gm-Message-State: AOAM531A5ILzQSZU8DWxSgyZSWX8E8W/TW6SQZvIcKoa8291jY3kGbJg
 Do6Fx6O5kBJx0XaJuqiKpgrKeg==
X-Google-Smtp-Source: ABdhPJyqwr/hNlD7xar+Xz7f/8+3HPNahzg2bkScbA6pV3gyC6a+nO9M4v/qTCCdwnooNKizyFN86w==
X-Received: by 2002:a1c:2017:: with SMTP id g23mr2400053wmg.126.1616585293113; 
 Wed, 24 Mar 2021 04:28:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u63sm2085156wmg.24.2021.03.24.04.28.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 04:28:12 -0700 (PDT)
Date: Wed, 24 Mar 2021 12:28:10 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v9 16/70] drm/i915: Fix userptr so we do not
 have to worry about obj->mm.lock, v7.
Message-ID: <YFsiSszLEhOO68QB@phenom.ffwll.local>
References: <20210323155059.628690-1-maarten.lankhorst@linux.intel.com>
 <20210323155059.628690-17-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210323155059.628690-17-maarten.lankhorst@linux.intel.com>
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
Cc: Dave Airlie <airlied@redhat.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 23, 2021 at 04:50:05PM +0100, Maarten Lankhorst wrote:
> Instead of doing what we do currently, which will never work with
> PROVE_LOCKING, do the same as AMD does, and something similar to
> relocation slowpath. When all locks are dropped, we acquire the
> pages for pinning. When the locks are taken, we transfer those
> pages in .get_pages() to the bo. As a final check before installing
> the fences, we ensure that the mmu notifier was not called; if it is,
> we return -EAGAIN to userspace to signal it has to start over.
> =

> Changes since v1:
> - Unbinding is done in submit_init only. submit_begin() removed.
> - MMU_NOTFIER -> MMU_NOTIFIER
> Changes since v2:
> - Make i915->mm.notifier a spinlock.
> Changes since v3:
> - Add WARN_ON if there are any page references left, should have been 0.
> - Return 0 on success in submit_init(), bug from spinlock conversion.
> - Release pvec outside of notifier_lock (Thomas).
> Changes since v4:
> - Mention why we're clearing eb->[i + 1].vma in the code. (Thomas)
> - Actually check all invalidations in eb_move_to_gpu. (Thomas)
> - Do not wait when process is exiting to fix gem_ctx_persistence.userptr.
> Changes since v5:
> - Clarify why check on PF_EXITING is (temporarily) required.
> Changes since v6:
> - Ensure userptr validity is checked in set_domain through a special path.
> =

> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Acked-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_domain.c    |  18 +-
>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 101 ++-
>  drivers/gpu/drm/i915/gem/i915_gem_object.h    |  38 +-
>  .../gpu/drm/i915/gem/i915_gem_object_types.h  |  10 +-
>  drivers/gpu/drm/i915/gem/i915_gem_pages.c     |   2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_userptr.c   | 796 ++++++------------
>  drivers/gpu/drm/i915/i915_drv.h               |   9 +-
>  drivers/gpu/drm/i915/i915_gem.c               |   5 +-
>  8 files changed, 395 insertions(+), 584 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/drm=
/i915/gem/i915_gem_domain.c
> index 2f4980bf742e..76cb9f5c66aa 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> @@ -468,14 +468,28 @@ i915_gem_set_domain_ioctl(struct drm_device *dev, v=
oid *data,
>  	if (!obj)
>  		return -ENOENT;
>  =

> +	if (i915_gem_object_is_userptr(obj)) {
> +		/*
> +		 * Try to grab userptr pages, iris uses set_domain to check
> +		 * userptr validity
> +		 */
> +		err =3D i915_gem_object_userptr_validate(obj);
> +		if (!err)
> +			err =3D i915_gem_object_wait(obj,
> +						   I915_WAIT_INTERRUPTIBLE |
> +						   I915_WAIT_PRIORITY |
> +						   (write_domain ? I915_WAIT_ALL : 0),
> +						   MAX_SCHEDULE_TIMEOUT);
> +		goto out;
> +	}
> +
>  	/*
>  	 * Proxy objects do not control access to the backing storage, ergo
>  	 * they cannot be used as a means to manipulate the cache domain
>  	 * tracking for that backing storage. The proxy object is always
>  	 * considered to be outside of any cache domain.
>  	 */
> -	if (i915_gem_object_is_proxy(obj) &&
> -	    !i915_gem_object_is_userptr(obj)) {
> +	if (i915_gem_object_is_proxy(obj)) {
>  		err =3D -ENXIO;
>  		goto out;
>  	}
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu=
/drm/i915/gem/i915_gem_execbuffer.c
> index 795c68fcc6ed..b5ca9eb53565 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -53,14 +53,16 @@ enum {
>  /* __EXEC_OBJECT_NO_RESERVE is BIT(31), defined in i915_vma.h */
>  #define __EXEC_OBJECT_HAS_PIN		BIT(30)
>  #define __EXEC_OBJECT_HAS_FENCE		BIT(29)
> -#define __EXEC_OBJECT_NEEDS_MAP		BIT(28)
> -#define __EXEC_OBJECT_NEEDS_BIAS	BIT(27)
> -#define __EXEC_OBJECT_INTERNAL_FLAGS	(~0u << 27) /* all of the above + */
> +#define __EXEC_OBJECT_USERPTR_INIT	BIT(28)
> +#define __EXEC_OBJECT_NEEDS_MAP		BIT(27)
> +#define __EXEC_OBJECT_NEEDS_BIAS	BIT(26)
> +#define __EXEC_OBJECT_INTERNAL_FLAGS	(~0u << 26) /* all of the above + */
>  #define __EXEC_OBJECT_RESERVED (__EXEC_OBJECT_HAS_PIN | __EXEC_OBJECT_HA=
S_FENCE)
>  =

>  #define __EXEC_HAS_RELOC	BIT(31)
>  #define __EXEC_ENGINE_PINNED	BIT(30)
> -#define __EXEC_INTERNAL_FLAGS	(~0u << 30)
> +#define __EXEC_USERPTR_USED	BIT(29)
> +#define __EXEC_INTERNAL_FLAGS	(~0u << 29)
>  #define UPDATE			PIN_OFFSET_FIXED
>  =

>  #define BATCH_OFFSET_BIAS (256*1024)
> @@ -871,6 +873,26 @@ static int eb_lookup_vmas(struct i915_execbuffer *eb)
>  		}
>  =

>  		eb_add_vma(eb, i, batch, vma);
> +
> +		if (i915_gem_object_is_userptr(vma->obj)) {
> +			err =3D i915_gem_object_userptr_submit_init(vma->obj);
> +			if (err) {
> +				if (i + 1 < eb->buffer_count) {
> +					/*
> +					 * Execbuffer code expects last vma entry to be NULL,
> +					 * since we already initialized this entry,
> +					 * set the next value to NULL or we mess up
> +					 * cleanup handling.
> +					 */
> +					eb->vma[i + 1].vma =3D NULL;
> +				}
> +
> +				return err;
> +			}
> +
> +			eb->vma[i].flags |=3D __EXEC_OBJECT_USERPTR_INIT;
> +			eb->args->flags |=3D __EXEC_USERPTR_USED;
> +		}
>  	}
>  =

>  	if (unlikely(eb->batch->flags & EXEC_OBJECT_WRITE)) {
> @@ -972,7 +994,7 @@ eb_get_vma(const struct i915_execbuffer *eb, unsigned=
 long handle)
>  	}
>  }
>  =

> -static void eb_release_vmas(struct i915_execbuffer *eb, bool final)
> +static void eb_release_vmas(struct i915_execbuffer *eb, bool final, bool=
 release_userptr)
>  {
>  	const unsigned int count =3D eb->buffer_count;
>  	unsigned int i;
> @@ -986,6 +1008,11 @@ static void eb_release_vmas(struct i915_execbuffer =
*eb, bool final)
>  =

>  		eb_unreserve_vma(ev);
>  =

> +		if (release_userptr && ev->flags & __EXEC_OBJECT_USERPTR_INIT) {
> +			ev->flags &=3D ~__EXEC_OBJECT_USERPTR_INIT;
> +			i915_gem_object_userptr_submit_fini(vma->obj);
> +		}
> +
>  		if (final)
>  			i915_vma_put(vma);
>  	}
> @@ -1916,6 +1943,31 @@ static int eb_prefault_relocations(const struct i9=
15_execbuffer *eb)
>  	return 0;
>  }
>  =

> +static int eb_reinit_userptr(struct i915_execbuffer *eb)
> +{
> +	const unsigned int count =3D eb->buffer_count;
> +	unsigned int i;
> +	int ret;
> +
> +	if (likely(!(eb->args->flags & __EXEC_USERPTR_USED)))
> +		return 0;
> +
> +	for (i =3D 0; i < count; i++) {
> +		struct eb_vma *ev =3D &eb->vma[i];
> +
> +		if (!i915_gem_object_is_userptr(ev->vma->obj))
> +			continue;
> +
> +		ret =3D i915_gem_object_userptr_submit_init(ev->vma->obj);
> +		if (ret)
> +			return ret;
> +
> +		ev->flags |=3D __EXEC_OBJECT_USERPTR_INIT;
> +	}
> +
> +	return 0;
> +}
> +
>  static noinline int eb_relocate_parse_slow(struct i915_execbuffer *eb,
>  					   struct i915_request *rq)
>  {
> @@ -1930,7 +1982,7 @@ static noinline int eb_relocate_parse_slow(struct i=
915_execbuffer *eb,
>  	}
>  =

>  	/* We may process another execbuffer during the unlock... */
> -	eb_release_vmas(eb, false);
> +	eb_release_vmas(eb, false, true);
>  	i915_gem_ww_ctx_fini(&eb->ww);
>  =

>  	if (rq) {
> @@ -1971,10 +2023,8 @@ static noinline int eb_relocate_parse_slow(struct =
i915_execbuffer *eb,
>  		err =3D 0;
>  	}
>  =

> -#ifdef CONFIG_MMU_NOTIFIER
>  	if (!err)
> -		flush_workqueue(eb->i915->mm.userptr_wq);
> -#endif
> +		err =3D eb_reinit_userptr(eb);
>  =

>  err_relock:
>  	i915_gem_ww_ctx_init(&eb->ww, true);
> @@ -2036,7 +2086,7 @@ static noinline int eb_relocate_parse_slow(struct i=
915_execbuffer *eb,
>  =

>  err:
>  	if (err =3D=3D -EDEADLK) {
> -		eb_release_vmas(eb, false);
> +		eb_release_vmas(eb, false, false);
>  		err =3D i915_gem_ww_ctx_backoff(&eb->ww);
>  		if (!err)
>  			goto repeat_validate;
> @@ -2133,7 +2183,7 @@ static int eb_relocate_parse(struct i915_execbuffer=
 *eb)
>  =

>  err:
>  	if (err =3D=3D -EDEADLK) {
> -		eb_release_vmas(eb, false);
> +		eb_release_vmas(eb, false, false);
>  		err =3D i915_gem_ww_ctx_backoff(&eb->ww);
>  		if (!err)
>  			goto retry;
> @@ -2208,6 +2258,30 @@ static int eb_move_to_gpu(struct i915_execbuffer *=
eb)
>  						      flags | __EXEC_OBJECT_NO_RESERVE);
>  	}
>  =

> +#ifdef CONFIG_MMU_NOTIFIER
> +	if (!err && (eb->args->flags & __EXEC_USERPTR_USED)) {
> +		spin_lock(&eb->i915->mm.notifier_lock);
> +
> +		/*
> +		 * count is always at least 1, otherwise __EXEC_USERPTR_USED
> +		 * could not have been set
> +		 */
> +		for (i =3D 0; i < count; i++) {
> +			struct eb_vma *ev =3D &eb->vma[i];
> +			struct drm_i915_gem_object *obj =3D ev->vma->obj;
> +
> +			if (!i915_gem_object_is_userptr(obj))
> +				continue;
> +
> +			err =3D i915_gem_object_userptr_submit_done(obj);
> +			if (err)
> +				break;
> +		}
> +
> +		spin_unlock(&eb->i915->mm.notifier_lock);
> +	}
> +#endif
> +
>  	if (unlikely(err))
>  		goto err_skip;
>  =

> @@ -3352,7 +3426,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,
>  =

>  	err =3D eb_lookup_vmas(&eb);
>  	if (err) {
> -		eb_release_vmas(&eb, true);
> +		eb_release_vmas(&eb, true, true);
>  		goto err_engine;
>  	}
>  =

> @@ -3424,6 +3498,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,
>  =

>  	trace_i915_request_queue(eb.request, eb.batch_flags);
>  	err =3D eb_submit(&eb, batch);
> +
>  err_request:
>  	i915_request_get(eb.request);
>  	err =3D eb_request_add(&eb, err);
> @@ -3444,7 +3519,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,
>  	i915_request_put(eb.request);
>  =

>  err_vma:
> -	eb_release_vmas(&eb, true);
> +	eb_release_vmas(&eb, true, true);
>  	if (eb.trampoline)
>  		i915_vma_unpin(eb.trampoline);
>  	WARN_ON(err =3D=3D -EDEADLK);
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm=
/i915/gem/i915_gem_object.h
> index 69509dbd01c7..b5af9c440ac5 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> @@ -59,6 +59,7 @@ i915_gem_object_create_shmem_from_data(struct drm_i915_=
private *i915,
>  				       const void *data, resource_size_t size);
>  =

>  extern const struct drm_i915_gem_object_ops i915_gem_shmem_ops;
> +
>  void __i915_gem_object_release_shmem(struct drm_i915_gem_object *obj,
>  				     struct sg_table *pages,
>  				     bool needs_clflush);
> @@ -278,12 +279,6 @@ i915_gem_object_never_mmap(const struct drm_i915_gem=
_object *obj)
>  	return i915_gem_object_type_has(obj, I915_GEM_OBJECT_NO_MMAP);
>  }
>  =

> -static inline bool
> -i915_gem_object_needs_async_cancel(const struct drm_i915_gem_object *obj)
> -{
> -	return i915_gem_object_type_has(obj, I915_GEM_OBJECT_ASYNC_CANCEL);
> -}
> -
>  static inline bool
>  i915_gem_object_is_framebuffer(const struct drm_i915_gem_object *obj)
>  {
> @@ -573,16 +568,6 @@ void __i915_gem_object_flush_frontbuffer(struct drm_=
i915_gem_object *obj,
>  void __i915_gem_object_invalidate_frontbuffer(struct drm_i915_gem_object=
 *obj,
>  					      enum fb_op_origin origin);
>  =

> -static inline bool
> -i915_gem_object_is_userptr(struct drm_i915_gem_object *obj)
> -{
> -#ifdef CONFIG_MMU_NOTIFIER
> -	return obj->userptr.mm;
> -#else
> -	return false;
> -#endif
> -}
> -
>  static inline void
>  i915_gem_object_flush_frontbuffer(struct drm_i915_gem_object *obj,
>  				  enum fb_op_origin origin)
> @@ -603,4 +588,25 @@ int i915_gem_object_read_from_page(struct drm_i915_g=
em_object *obj, u64 offset,
>  =

>  bool i915_gem_object_is_shmem(const struct drm_i915_gem_object *obj);
>  =

> +#ifdef CONFIG_MMU_NOTIFIER
> +static inline bool
> +i915_gem_object_is_userptr(struct drm_i915_gem_object *obj)
> +{
> +	return obj->userptr.notifier.mm;
> +}
> +
> +int i915_gem_object_userptr_submit_init(struct drm_i915_gem_object *obj);
> +int i915_gem_object_userptr_submit_done(struct drm_i915_gem_object *obj);
> +void i915_gem_object_userptr_submit_fini(struct drm_i915_gem_object *obj=
);
> +int i915_gem_object_userptr_validate(struct drm_i915_gem_object *obj);
> +#else
> +static inline bool i915_gem_object_is_userptr(struct drm_i915_gem_object=
 *obj) { return false; }
> +
> +static inline int i915_gem_object_userptr_submit_init(struct drm_i915_ge=
m_object *obj) { GEM_BUG_ON(1); return -ENODEV; }
> +static inline int i915_gem_object_userptr_submit_done(struct drm_i915_ge=
m_object *obj) { GEM_BUG_ON(1); return -ENODEV; }
> +static inline void i915_gem_object_userptr_submit_fini(struct drm_i915_g=
em_object *obj) { GEM_BUG_ON(1); }
> +static inline int i915_gem_object_userptr_validate(struct drm_i915_gem_o=
bject *obj) { GEM_BUG_ON(1); return -ENODEV; }
> +
> +#endif
> +
>  #endif
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/g=
pu/drm/i915/gem/i915_gem_object_types.h
> index 414322619781..4c0a34231623 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> @@ -7,6 +7,8 @@
>  #ifndef __I915_GEM_OBJECT_TYPES_H__
>  #define __I915_GEM_OBJECT_TYPES_H__
>  =

> +#include <linux/mmu_notifier.h>
> +
>  #include <drm/drm_gem.h>
>  #include <uapi/drm/i915_drm.h>
>  =

> @@ -34,7 +36,6 @@ struct drm_i915_gem_object_ops {
>  #define I915_GEM_OBJECT_IS_SHRINKABLE	BIT(2)
>  #define I915_GEM_OBJECT_IS_PROXY	BIT(3)
>  #define I915_GEM_OBJECT_NO_MMAP		BIT(4)
> -#define I915_GEM_OBJECT_ASYNC_CANCEL	BIT(5)
>  =

>  	/* Interface between the GEM object and its backing storage.
>  	 * get_pages() is called once prior to the use of the associated set
> @@ -299,10 +300,11 @@ struct drm_i915_gem_object {
>  #ifdef CONFIG_MMU_NOTIFIER
>  		struct i915_gem_userptr {
>  			uintptr_t ptr;
> +			unsigned long notifier_seq;
>  =

> -			struct i915_mm_struct *mm;
> -			struct i915_mmu_object *mmu_object;
> -			struct work_struct *work;
> +			struct mmu_interval_notifier notifier;
> +			struct page **pvec;
> +			int page_ref;
>  		} userptr;
>  #endif
>  =

> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/=
i915/gem/i915_gem_pages.c
> index bf61b88a2113..e7d7650072c5 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> @@ -226,7 +226,7 @@ int __i915_gem_object_put_pages(struct drm_i915_gem_o=
bject *obj)
>  	 * get_pages backends we should be better able to handle the
>  	 * cancellation of the async task in a more uniform manner.
>  	 */
> -	if (!pages && !i915_gem_object_needs_async_cancel(obj))
> +	if (!pages)
>  		pages =3D ERR_PTR(-EINVAL);
>  =

>  	if (!IS_ERR(pages))
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/dr=
m/i915/gem/i915_gem_userptr.c
> index b466ab2def4d..1e42fbc68697 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> @@ -2,10 +2,39 @@
>   * SPDX-License-Identifier: MIT
>   *
>   * Copyright =A9 2012-2014 Intel Corporation
> + *
> +  * Based on amdgpu_mn, which bears the following notice:
> + *
> + * Copyright 2014 Advanced Micro Devices, Inc.
> + * All Rights Reserved.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the
> + * "Software"), to deal in the Software without restriction, including
> + * without limitation the rights to use, copy, modify, merge, publish,
> + * distribute, sub license, and/or sell copies of the Software, and to
> + * permit persons to whom the Software is furnished to do so, subject to
> + * the following conditions:
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SH=
ALL
> + * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY=
 CLAIM,
> + * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
> + * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR=
 THE
> + * USE OR OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * The above copyright notice and this permission notice (including the
> + * next paragraph) shall be included in all copies or substantial portio=
ns
> + * of the Software.
> + *
> + */
> +/*
> + * Authors:
> + *    Christian K=F6nig <christian.koenig@amd.com>
>   */
>  =

>  #include <linux/mmu_context.h>
> -#include <linux/mmu_notifier.h>
>  #include <linux/mempolicy.h>
>  #include <linux/swap.h>
>  #include <linux/sched/mm.h>
> @@ -15,373 +44,121 @@
>  #include "i915_gem_object.h"
>  #include "i915_scatterlist.h"
>  =

> -#if defined(CONFIG_MMU_NOTIFIER)
> -
> -struct i915_mm_struct {
> -	struct mm_struct *mm;
> -	struct drm_i915_private *i915;
> -	struct i915_mmu_notifier *mn;
> -	struct hlist_node node;
> -	struct kref kref;
> -	struct rcu_work work;
> -};
> -
> -#include <linux/interval_tree.h>
> -
> -struct i915_mmu_notifier {
> -	spinlock_t lock;
> -	struct hlist_node node;
> -	struct mmu_notifier mn;
> -	struct rb_root_cached objects;
> -	struct i915_mm_struct *mm;
> -};
> -
> -struct i915_mmu_object {
> -	struct i915_mmu_notifier *mn;
> -	struct drm_i915_gem_object *obj;
> -	struct interval_tree_node it;
> -};
> +#ifdef CONFIG_MMU_NOTIFIER
>  =

> -static void add_object(struct i915_mmu_object *mo)
> +/**
> + * i915_gem_userptr_invalidate - callback to notify about mm change
> + *
> + * @mni: the range (mm) is about to update
> + * @range: details on the invalidation
> + * @cur_seq: Value to pass to mmu_interval_set_seq()
> + *
> + * Block for operations on BOs to finish and mark pages as accessed and
> + * potentially dirty.
> + */
> +static bool i915_gem_userptr_invalidate(struct mmu_interval_notifier *mn=
i,
> +					const struct mmu_notifier_range *range,
> +					unsigned long cur_seq)
>  {
> -	GEM_BUG_ON(!RB_EMPTY_NODE(&mo->it.rb));
> -	interval_tree_insert(&mo->it, &mo->mn->objects);
> -}
> +	struct drm_i915_gem_object *obj =3D container_of(mni, struct drm_i915_g=
em_object, userptr.notifier);
> +	struct drm_i915_private *i915 =3D to_i915(obj->base.dev);
> +	long r;
>  =

> -static void del_object(struct i915_mmu_object *mo)
> -{
> -	if (RB_EMPTY_NODE(&mo->it.rb))
> -		return;
> +	if (!mmu_notifier_range_blockable(range))
> +		return false;
>  =

> -	interval_tree_remove(&mo->it, &mo->mn->objects);
> -	RB_CLEAR_NODE(&mo->it.rb);
> -}
> +	spin_lock(&i915->mm.notifier_lock);
>  =

> -static void
> -__i915_gem_userptr_set_active(struct drm_i915_gem_object *obj, bool valu=
e)
> -{
> -	struct i915_mmu_object *mo =3D obj->userptr.mmu_object;
> +	mmu_interval_set_seq(mni, cur_seq);
> +
> +	spin_unlock(&i915->mm.notifier_lock);
>  =

>  	/*
> -	 * During mm_invalidate_range we need to cancel any userptr that
> -	 * overlaps the range being invalidated. Doing so requires the
> -	 * struct_mutex, and that risks recursion. In order to cause
> -	 * recursion, the user must alias the userptr address space with
> -	 * a GTT mmapping (possible with a MAP_FIXED) - then when we have
> -	 * to invalidate that mmaping, mm_invalidate_range is called with
> -	 * the userptr address *and* the struct_mutex held.  To prevent that
> -	 * we set a flag under the i915_mmu_notifier spinlock to indicate
> -	 * whether this object is valid.
> +	 * We don't wait when the process is exiting. This is valid
> +	 * because the object will be cleaned up anyway.
> +	 *
> +	 * This is also temporarily required as a hack, because we
> +	 * cannot currently force non-consistent batch buffers to preempt
> +	 * and reschedule by waiting on it, hanging processes on exit.
>  	 */
> -	if (!mo)
> -		return;
> -
> -	spin_lock(&mo->mn->lock);
> -	if (value)
> -		add_object(mo);
> -	else
> -		del_object(mo);
> -	spin_unlock(&mo->mn->lock);
> -}
> -
> -static int
> -userptr_mn_invalidate_range_start(struct mmu_notifier *_mn,
> -				  const struct mmu_notifier_range *range)
> -{
> -	struct i915_mmu_notifier *mn =3D
> -		container_of(_mn, struct i915_mmu_notifier, mn);
> -	struct interval_tree_node *it;
> -	unsigned long end;
> -	int ret =3D 0;
> -
> -	if (RB_EMPTY_ROOT(&mn->objects.rb_root))
> -		return 0;
> -
> -	/* interval ranges are inclusive, but invalidate range is exclusive */
> -	end =3D range->end - 1;
> -
> -	spin_lock(&mn->lock);
> -	it =3D interval_tree_iter_first(&mn->objects, range->start, end);
> -	while (it) {
> -		struct drm_i915_gem_object *obj;
> -
> -		if (!mmu_notifier_range_blockable(range)) {
> -			ret =3D -EAGAIN;
> -			break;
> -		}
> -
> -		/*
> -		 * The mmu_object is released late when destroying the
> -		 * GEM object so it is entirely possible to gain a
> -		 * reference on an object in the process of being freed
> -		 * since our serialisation is via the spinlock and not
> -		 * the struct_mutex - and consequently use it after it
> -		 * is freed and then double free it. To prevent that
> -		 * use-after-free we only acquire a reference on the
> -		 * object if it is not in the process of being destroyed.
> -		 */
> -		obj =3D container_of(it, struct i915_mmu_object, it)->obj;
> -		if (!kref_get_unless_zero(&obj->base.refcount)) {
> -			it =3D interval_tree_iter_next(it, range->start, end);
> -			continue;
> -		}
> -		spin_unlock(&mn->lock);
> -
> -		ret =3D i915_gem_object_unbind(obj,
> -					     I915_GEM_OBJECT_UNBIND_ACTIVE |
> -					     I915_GEM_OBJECT_UNBIND_BARRIER);
> -		if (ret =3D=3D 0)
> -			ret =3D __i915_gem_object_put_pages(obj);
> -		i915_gem_object_put(obj);
> -		if (ret)
> -			return ret;
> +	if (current->flags & PF_EXITING)
> +		return true;
>  =

> -		spin_lock(&mn->lock);
> -
> -		/*
> -		 * As we do not (yet) protect the mmu from concurrent insertion
> -		 * over this range, there is no guarantee that this search will
> -		 * terminate given a pathologic workload.
> -		 */
> -		it =3D interval_tree_iter_first(&mn->objects, range->start, end);
> -	}
> -	spin_unlock(&mn->lock);
> -
> -	return ret;
> +	/* we will unbind on next submission, still have userptr pins */
> +	r =3D dma_resv_wait_timeout_rcu(obj->base.resv, true, false,
> +				      MAX_SCHEDULE_TIMEOUT);
> +	if (r <=3D 0)
> +		drm_err(&i915->drm, "(%ld) failed to wait for idle\n", r);
>  =

> +	return true;
>  }
>  =

> -static const struct mmu_notifier_ops i915_gem_userptr_notifier =3D {
> -	.invalidate_range_start =3D userptr_mn_invalidate_range_start,
> +static const struct mmu_interval_notifier_ops i915_gem_userptr_notifier_=
ops =3D {
> +	.invalidate =3D i915_gem_userptr_invalidate,
>  };
>  =

> -static struct i915_mmu_notifier *
> -i915_mmu_notifier_create(struct i915_mm_struct *mm)
> -{
> -	struct i915_mmu_notifier *mn;
> -
> -	mn =3D kmalloc(sizeof(*mn), GFP_KERNEL);
> -	if (mn =3D=3D NULL)
> -		return ERR_PTR(-ENOMEM);
> -
> -	spin_lock_init(&mn->lock);
> -	mn->mn.ops =3D &i915_gem_userptr_notifier;
> -	mn->objects =3D RB_ROOT_CACHED;
> -	mn->mm =3D mm;
> -
> -	return mn;
> -}
> -
> -static void
> -i915_gem_userptr_release__mmu_notifier(struct drm_i915_gem_object *obj)
> -{
> -	struct i915_mmu_object *mo;
> -
> -	mo =3D fetch_and_zero(&obj->userptr.mmu_object);
> -	if (!mo)
> -		return;
> -
> -	spin_lock(&mo->mn->lock);
> -	del_object(mo);
> -	spin_unlock(&mo->mn->lock);
> -	kfree(mo);
> -}
> -
> -static struct i915_mmu_notifier *
> -i915_mmu_notifier_find(struct i915_mm_struct *mm)
> -{
> -	struct i915_mmu_notifier *mn, *old;
> -	int err;
> -
> -	mn =3D READ_ONCE(mm->mn);
> -	if (likely(mn))
> -		return mn;
> -
> -	mn =3D i915_mmu_notifier_create(mm);
> -	if (IS_ERR(mn))
> -		return mn;
> -
> -	err =3D mmu_notifier_register(&mn->mn, mm->mm);
> -	if (err) {
> -		kfree(mn);
> -		return ERR_PTR(err);
> -	}
> -
> -	old =3D cmpxchg(&mm->mn, NULL, mn);
> -	if (old) {
> -		mmu_notifier_unregister(&mn->mn, mm->mm);
> -		kfree(mn);
> -		mn =3D old;
> -	}
> -
> -	return mn;
> -}
> -
>  static int
>  i915_gem_userptr_init__mmu_notifier(struct drm_i915_gem_object *obj)
>  {
> -	struct i915_mmu_notifier *mn;
> -	struct i915_mmu_object *mo;
> -
> -	if (GEM_WARN_ON(!obj->userptr.mm))
> -		return -EINVAL;
> -
> -	mn =3D i915_mmu_notifier_find(obj->userptr.mm);
> -	if (IS_ERR(mn))
> -		return PTR_ERR(mn);
> -
> -	mo =3D kzalloc(sizeof(*mo), GFP_KERNEL);
> -	if (!mo)
> -		return -ENOMEM;
> -
> -	mo->mn =3D mn;
> -	mo->obj =3D obj;
> -	mo->it.start =3D obj->userptr.ptr;
> -	mo->it.last =3D obj->userptr.ptr + obj->base.size - 1;
> -	RB_CLEAR_NODE(&mo->it.rb);
> -
> -	obj->userptr.mmu_object =3D mo;
> -	return 0;
> -}
> -
> -static void
> -i915_mmu_notifier_free(struct i915_mmu_notifier *mn,
> -		       struct mm_struct *mm)
> -{
> -	if (mn =3D=3D NULL)
> -		return;
> -
> -	mmu_notifier_unregister(&mn->mn, mm);
> -	kfree(mn);
> -}
> -
> -
> -static struct i915_mm_struct *
> -__i915_mm_struct_find(struct drm_i915_private *i915, struct mm_struct *r=
eal)
> -{
> -	struct i915_mm_struct *it, *mm =3D NULL;
> -
> -	rcu_read_lock();
> -	hash_for_each_possible_rcu(i915->mm_structs,
> -				   it, node,
> -				   (unsigned long)real)
> -		if (it->mm =3D=3D real && kref_get_unless_zero(&it->kref)) {
> -			mm =3D it;
> -			break;
> -		}
> -	rcu_read_unlock();
> -
> -	return mm;
> +	return mmu_interval_notifier_insert(&obj->userptr.notifier, current->mm,
> +					    obj->userptr.ptr, obj->base.size,
> +					    &i915_gem_userptr_notifier_ops);
>  }
>  =

> -static int
> -i915_gem_userptr_init__mm_struct(struct drm_i915_gem_object *obj)
> +static void i915_gem_object_userptr_drop_ref(struct drm_i915_gem_object =
*obj)
>  {
>  	struct drm_i915_private *i915 =3D to_i915(obj->base.dev);
> -	struct i915_mm_struct *mm, *new;
> -	int ret =3D 0;
> -
> -	/* During release of the GEM object we hold the struct_mutex. This
> -	 * precludes us from calling mmput() at that time as that may be
> -	 * the last reference and so call exit_mmap(). exit_mmap() will
> -	 * attempt to reap the vma, and if we were holding a GTT mmap
> -	 * would then call drm_gem_vm_close() and attempt to reacquire
> -	 * the struct mutex. So in order to avoid that recursion, we have
> -	 * to defer releasing the mm reference until after we drop the
> -	 * struct_mutex, i.e. we need to schedule a worker to do the clean
> -	 * up.
> -	 */
> -	mm =3D __i915_mm_struct_find(i915, current->mm);
> -	if (mm)
> -		goto out;
> +	struct page **pvec =3D NULL;
>  =

> -	new =3D kmalloc(sizeof(*mm), GFP_KERNEL);
> -	if (!new)
> -		return -ENOMEM;
> -
> -	kref_init(&new->kref);
> -	new->i915 =3D to_i915(obj->base.dev);
> -	new->mm =3D current->mm;
> -	new->mn =3D NULL;
> -
> -	spin_lock(&i915->mm_lock);
> -	mm =3D __i915_mm_struct_find(i915, current->mm);
> -	if (!mm) {
> -		hash_add_rcu(i915->mm_structs,
> -			     &new->node,
> -			     (unsigned long)new->mm);
> -		mmgrab(current->mm);
> -		mm =3D new;
> +	spin_lock(&i915->mm.notifier_lock);
> +	if (!--obj->userptr.page_ref) {
> +		pvec =3D obj->userptr.pvec;
> +		obj->userptr.pvec =3D NULL;
>  	}
> -	spin_unlock(&i915->mm_lock);
> -	if (mm !=3D new)
> -		kfree(new);
> +	GEM_BUG_ON(obj->userptr.page_ref < 0);
> +	spin_unlock(&i915->mm.notifier_lock);
>  =

> -out:
> -	obj->userptr.mm =3D mm;
> -	return ret;
> -}
> -
> -static void
> -__i915_mm_struct_free__worker(struct work_struct *work)
> -{
> -	struct i915_mm_struct *mm =3D container_of(work, typeof(*mm), work.work=
);
> -
> -	i915_mmu_notifier_free(mm->mn, mm->mm);
> -	mmdrop(mm->mm);
> -	kfree(mm);
> -}
> -
> -static void
> -__i915_mm_struct_free(struct kref *kref)
> -{
> -	struct i915_mm_struct *mm =3D container_of(kref, typeof(*mm), kref);
> -
> -	spin_lock(&mm->i915->mm_lock);
> -	hash_del_rcu(&mm->node);
> -	spin_unlock(&mm->i915->mm_lock);
> -
> -	INIT_RCU_WORK(&mm->work, __i915_mm_struct_free__worker);
> -	queue_rcu_work(system_wq, &mm->work);
> -}
> -
> -static void
> -i915_gem_userptr_release__mm_struct(struct drm_i915_gem_object *obj)
> -{
> -	if (obj->userptr.mm =3D=3D NULL)
> -		return;
> +	if (pvec) {
> +		const unsigned long num_pages =3D obj->base.size >> PAGE_SHIFT;
>  =

> -	kref_put(&obj->userptr.mm->kref, __i915_mm_struct_free);
> -	obj->userptr.mm =3D NULL;
> +		unpin_user_pages(pvec, num_pages);
> +		kfree(pvec);

This one needs to be kvfree apparently, per review from previous round.
Can you pls do a fixup patch? I'm already merging.

For the other pending review comments and suggestions I think it's better
if we handle this in a separate patch series to highlight all the
questions, and ideally with amdgpu folks involved too.
-Daniel

> +	}
>  }
>  =

> -struct get_pages_work {
> -	struct work_struct work;
> -	struct drm_i915_gem_object *obj;
> -	struct task_struct *task;
> -};
> -
> -static struct sg_table *
> -__i915_gem_userptr_alloc_pages(struct drm_i915_gem_object *obj,
> -			       struct page **pvec, unsigned long num_pages)
> +static int i915_gem_userptr_get_pages(struct drm_i915_gem_object *obj)
>  {
> +	struct drm_i915_private *i915 =3D to_i915(obj->base.dev);
> +	const unsigned long num_pages =3D obj->base.size >> PAGE_SHIFT;
>  	unsigned int max_segment =3D i915_sg_segment_size();
>  	struct sg_table *st;
>  	unsigned int sg_page_sizes;
>  	struct scatterlist *sg;
> +	struct page **pvec;
>  	int ret;
>  =

>  	st =3D kmalloc(sizeof(*st), GFP_KERNEL);
>  	if (!st)
> -		return ERR_PTR(-ENOMEM);
> +		return -ENOMEM;
> +
> +	spin_lock(&i915->mm.notifier_lock);
> +	if (GEM_WARN_ON(!obj->userptr.page_ref)) {
> +		spin_unlock(&i915->mm.notifier_lock);
> +		ret =3D -EFAULT;
> +		goto err_free;
> +	}
> +
> +	obj->userptr.page_ref++;
> +	pvec =3D obj->userptr.pvec;
> +	spin_unlock(&i915->mm.notifier_lock);
>  =

>  alloc_table:
>  	sg =3D __sg_alloc_table_from_pages(st, pvec, num_pages, 0,
>  					 num_pages << PAGE_SHIFT, max_segment,
>  					 NULL, 0, GFP_KERNEL);
>  	if (IS_ERR(sg)) {
> -		kfree(st);
> -		return ERR_CAST(sg);
> +		ret =3D PTR_ERR(sg);
> +		goto err;
>  	}
>  =

>  	ret =3D i915_gem_gtt_prepare_pages(obj, st);
> @@ -393,203 +170,20 @@ __i915_gem_userptr_alloc_pages(struct drm_i915_gem=
_object *obj,
>  			goto alloc_table;
>  		}
>  =

> -		kfree(st);
> -		return ERR_PTR(ret);
> +		goto err;
>  	}
>  =

>  	sg_page_sizes =3D i915_sg_page_sizes(st->sgl);
>  =

>  	__i915_gem_object_set_pages(obj, st, sg_page_sizes);
>  =

> -	return st;
> -}
> -
> -static void
> -__i915_gem_userptr_get_pages_worker(struct work_struct *_work)
> -{
> -	struct get_pages_work *work =3D container_of(_work, typeof(*work), work=
);
> -	struct drm_i915_gem_object *obj =3D work->obj;
> -	const unsigned long npages =3D obj->base.size >> PAGE_SHIFT;
> -	unsigned long pinned;
> -	struct page **pvec;
> -	int ret;
> -
> -	ret =3D -ENOMEM;
> -	pinned =3D 0;
> -
> -	pvec =3D kvmalloc_array(npages, sizeof(struct page *), GFP_KERNEL);
> -	if (pvec !=3D NULL) {
> -		struct mm_struct *mm =3D obj->userptr.mm->mm;
> -		unsigned int flags =3D 0;
> -		int locked =3D 0;
> -
> -		if (!i915_gem_object_is_readonly(obj))
> -			flags |=3D FOLL_WRITE;
> -
> -		ret =3D -EFAULT;
> -		if (mmget_not_zero(mm)) {
> -			while (pinned < npages) {
> -				if (!locked) {
> -					mmap_read_lock(mm);
> -					locked =3D 1;
> -				}
> -				ret =3D pin_user_pages_remote
> -					(mm,
> -					 obj->userptr.ptr + pinned * PAGE_SIZE,
> -					 npages - pinned,
> -					 flags,
> -					 pvec + pinned, NULL, &locked);
> -				if (ret < 0)
> -					break;
> -
> -				pinned +=3D ret;
> -			}
> -			if (locked)
> -				mmap_read_unlock(mm);
> -			mmput(mm);
> -		}
> -	}
> -
> -	mutex_lock_nested(&obj->mm.lock, I915_MM_GET_PAGES);
> -	if (obj->userptr.work =3D=3D &work->work) {
> -		struct sg_table *pages =3D ERR_PTR(ret);
> -
> -		if (pinned =3D=3D npages) {
> -			pages =3D __i915_gem_userptr_alloc_pages(obj, pvec,
> -							       npages);
> -			if (!IS_ERR(pages)) {
> -				pinned =3D 0;
> -				pages =3D NULL;
> -			}
> -		}
> -
> -		obj->userptr.work =3D ERR_CAST(pages);
> -		if (IS_ERR(pages))
> -			__i915_gem_userptr_set_active(obj, false);
> -	}
> -	mutex_unlock(&obj->mm.lock);
> -
> -	unpin_user_pages(pvec, pinned);
> -	kvfree(pvec);
> -
> -	i915_gem_object_put(obj);
> -	put_task_struct(work->task);
> -	kfree(work);
> -}
> -
> -static struct sg_table *
> -__i915_gem_userptr_get_pages_schedule(struct drm_i915_gem_object *obj)
> -{
> -	struct get_pages_work *work;
> -
> -	/* Spawn a worker so that we can acquire the
> -	 * user pages without holding our mutex. Access
> -	 * to the user pages requires mmap_lock, and we have
> -	 * a strict lock ordering of mmap_lock, struct_mutex -
> -	 * we already hold struct_mutex here and so cannot
> -	 * call gup without encountering a lock inversion.
> -	 *
> -	 * Userspace will keep on repeating the operation
> -	 * (thanks to EAGAIN) until either we hit the fast
> -	 * path or the worker completes. If the worker is
> -	 * cancelled or superseded, the task is still run
> -	 * but the results ignored. (This leads to
> -	 * complications that we may have a stray object
> -	 * refcount that we need to be wary of when
> -	 * checking for existing objects during creation.)
> -	 * If the worker encounters an error, it reports
> -	 * that error back to this function through
> -	 * obj->userptr.work =3D ERR_PTR.
> -	 */
> -	work =3D kmalloc(sizeof(*work), GFP_KERNEL);
> -	if (work =3D=3D NULL)
> -		return ERR_PTR(-ENOMEM);
> -
> -	obj->userptr.work =3D &work->work;
> -
> -	work->obj =3D i915_gem_object_get(obj);
> -
> -	work->task =3D current;
> -	get_task_struct(work->task);
> -
> -	INIT_WORK(&work->work, __i915_gem_userptr_get_pages_worker);
> -	queue_work(to_i915(obj->base.dev)->mm.userptr_wq, &work->work);
> -
> -	return ERR_PTR(-EAGAIN);
> -}
> -
> -static int i915_gem_userptr_get_pages(struct drm_i915_gem_object *obj)
> -{
> -	const unsigned long num_pages =3D obj->base.size >> PAGE_SHIFT;
> -	struct mm_struct *mm =3D obj->userptr.mm->mm;
> -	struct page **pvec;
> -	struct sg_table *pages;
> -	bool active;
> -	int pinned;
> -	unsigned int gup_flags =3D 0;
> -
> -	/* If userspace should engineer that these pages are replaced in
> -	 * the vma between us binding this page into the GTT and completion
> -	 * of rendering... Their loss. If they change the mapping of their
> -	 * pages they need to create a new bo to point to the new vma.
> -	 *
> -	 * However, that still leaves open the possibility of the vma
> -	 * being copied upon fork. Which falls under the same userspace
> -	 * synchronisation issue as a regular bo, except that this time
> -	 * the process may not be expecting that a particular piece of
> -	 * memory is tied to the GPU.
> -	 *
> -	 * Fortunately, we can hook into the mmu_notifier in order to
> -	 * discard the page references prior to anything nasty happening
> -	 * to the vma (discard or cloning) which should prevent the more
> -	 * egregious cases from causing harm.
> -	 */
> -
> -	if (obj->userptr.work) {
> -		/* active flag should still be held for the pending work */
> -		if (IS_ERR(obj->userptr.work))
> -			return PTR_ERR(obj->userptr.work);
> -		else
> -			return -EAGAIN;
> -	}
> -
> -	pvec =3D NULL;
> -	pinned =3D 0;
> -
> -	if (mm =3D=3D current->mm) {
> -		pvec =3D kvmalloc_array(num_pages, sizeof(struct page *),
> -				      GFP_KERNEL |
> -				      __GFP_NORETRY |
> -				      __GFP_NOWARN);
> -		if (pvec) {
> -			/* defer to worker if malloc fails */
> -			if (!i915_gem_object_is_readonly(obj))
> -				gup_flags |=3D FOLL_WRITE;
> -			pinned =3D pin_user_pages_fast_only(obj->userptr.ptr,
> -							  num_pages, gup_flags,
> -							  pvec);
> -		}
> -	}
> -
> -	active =3D false;
> -	if (pinned < 0) {
> -		pages =3D ERR_PTR(pinned);
> -		pinned =3D 0;
> -	} else if (pinned < num_pages) {
> -		pages =3D __i915_gem_userptr_get_pages_schedule(obj);
> -		active =3D pages =3D=3D ERR_PTR(-EAGAIN);
> -	} else {
> -		pages =3D __i915_gem_userptr_alloc_pages(obj, pvec, num_pages);
> -		active =3D !IS_ERR(pages);
> -	}
> -	if (active)
> -		__i915_gem_userptr_set_active(obj, true);
> -
> -	if (IS_ERR(pages))
> -		unpin_user_pages(pvec, pinned);
> -	kvfree(pvec);
> +	return 0;
>  =

> -	return PTR_ERR_OR_ZERO(pages);
> +err:
> +	i915_gem_object_userptr_drop_ref(obj);
> +err_free:
> +	kfree(st);
> +	return ret;
>  }
>  =

>  static void
> @@ -599,9 +193,6 @@ i915_gem_userptr_put_pages(struct drm_i915_gem_object=
 *obj,
>  	struct sgt_iter sgt_iter;
>  	struct page *page;
>  =

> -	/* Cancel any inflight work and force them to restart their gup */
> -	obj->userptr.work =3D NULL;
> -	__i915_gem_userptr_set_active(obj, false);
>  	if (!pages)
>  		return;
>  =

> @@ -641,19 +232,161 @@ i915_gem_userptr_put_pages(struct drm_i915_gem_obj=
ect *obj,
>  		}
>  =

>  		mark_page_accessed(page);
> -		unpin_user_page(page);
>  	}
>  	obj->mm.dirty =3D false;
>  =

>  	sg_free_table(pages);
>  	kfree(pages);
> +
> +	i915_gem_object_userptr_drop_ref(obj);
> +}
> +
> +static int i915_gem_object_userptr_unbind(struct drm_i915_gem_object *ob=
j, bool get_pages)
> +{
> +	struct sg_table *pages;
> +	int err;
> +
> +	err =3D i915_gem_object_unbind(obj, I915_GEM_OBJECT_UNBIND_ACTIVE);
> +	if (err)
> +		return err;
> +
> +	if (GEM_WARN_ON(i915_gem_object_has_pinned_pages(obj)))
> +		return -EBUSY;
> +
> +	mutex_lock_nested(&obj->mm.lock, I915_MM_GET_PAGES);
> +
> +	pages =3D __i915_gem_object_unset_pages(obj);
> +	if (!IS_ERR_OR_NULL(pages))
> +		i915_gem_userptr_put_pages(obj, pages);
> +
> +	if (get_pages)
> +		err =3D ____i915_gem_object_get_pages(obj);
> +	mutex_unlock(&obj->mm.lock);
> +
> +	return err;
> +}
> +
> +int i915_gem_object_userptr_submit_init(struct drm_i915_gem_object *obj)
> +{
> +	struct drm_i915_private *i915 =3D to_i915(obj->base.dev);
> +	const unsigned long num_pages =3D obj->base.size >> PAGE_SHIFT;
> +	struct page **pvec;
> +	unsigned int gup_flags =3D 0;
> +	unsigned long notifier_seq;
> +	int pinned, ret;
> +
> +	if (obj->userptr.notifier.mm !=3D current->mm)
> +		return -EFAULT;
> +
> +	ret =3D i915_gem_object_lock_interruptible(obj, NULL);
> +	if (ret)
> +		return ret;
> +
> +	/* Make sure userptr is unbound for next attempt, so we don't use stale=
 pages. */
> +	ret =3D i915_gem_object_userptr_unbind(obj, false);
> +	i915_gem_object_unlock(obj);
> +	if (ret)
> +		return ret;
> +
> +	notifier_seq =3D mmu_interval_read_begin(&obj->userptr.notifier);
> +
> +	pvec =3D kvmalloc_array(num_pages, sizeof(struct page *), GFP_KERNEL);
> +	if (!pvec)
> +		return -ENOMEM;
> +
> +	if (!i915_gem_object_is_readonly(obj))
> +		gup_flags |=3D FOLL_WRITE;
> +
> +	pinned =3D ret =3D 0;
> +	while (pinned < num_pages) {
> +		ret =3D pin_user_pages_fast(obj->userptr.ptr + pinned * PAGE_SIZE,
> +					  num_pages - pinned, gup_flags,
> +					  &pvec[pinned]);
> +		if (ret < 0)
> +			goto out;
> +
> +		pinned +=3D ret;
> +	}
> +	ret =3D 0;
> +
> +	spin_lock(&i915->mm.notifier_lock);
> +
> +	if (mmu_interval_read_retry(&obj->userptr.notifier,
> +		!obj->userptr.page_ref ? notifier_seq :
> +		obj->userptr.notifier_seq)) {
> +		ret =3D -EAGAIN;
> +		goto out_unlock;
> +	}
> +
> +	if (!obj->userptr.page_ref++) {
> +		obj->userptr.pvec =3D pvec;
> +		obj->userptr.notifier_seq =3D notifier_seq;
> +
> +		pvec =3D NULL;
> +	}
> +
> +out_unlock:
> +	spin_unlock(&i915->mm.notifier_lock);
> +
> +out:
> +	if (pvec) {
> +		unpin_user_pages(pvec, pinned);
> +		kvfree(pvec);
> +	}
> +
> +	return ret;
> +}
> +
> +int i915_gem_object_userptr_submit_done(struct drm_i915_gem_object *obj)
> +{
> +	if (mmu_interval_read_retry(&obj->userptr.notifier,
> +				    obj->userptr.notifier_seq)) {
> +		/* We collided with the mmu notifier, need to retry */
> +
> +		return -EAGAIN;
> +	}
> +
> +	return 0;
> +}
> +
> +void i915_gem_object_userptr_submit_fini(struct drm_i915_gem_object *obj)
> +{
> +	i915_gem_object_userptr_drop_ref(obj);
> +}
> +
> +int i915_gem_object_userptr_validate(struct drm_i915_gem_object *obj)
> +{
> +	int err;
> +
> +	err =3D i915_gem_object_userptr_submit_init(obj);
> +	if (err)
> +		return err;
> +
> +	err =3D i915_gem_object_lock_interruptible(obj, NULL);
> +	if (!err) {
> +		/*
> +		 * Since we only check validity, not use the pages,
> +		 * it doesn't matter if we collide with the mmu notifier,
> +		 * and -EAGAIN handling is not required.
> +		 */
> +		err =3D i915_gem_object_pin_pages(obj);
> +		if (!err)
> +			i915_gem_object_unpin_pages(obj);
> +
> +		i915_gem_object_unlock(obj);
> +	}
> +
> +	i915_gem_object_userptr_submit_fini(obj);
> +	return err;
>  }
>  =

>  static void
>  i915_gem_userptr_release(struct drm_i915_gem_object *obj)
>  {
> -	i915_gem_userptr_release__mmu_notifier(obj);
> -	i915_gem_userptr_release__mm_struct(obj);
> +	GEM_WARN_ON(obj->userptr.page_ref);
> +
> +	mmu_interval_notifier_remove(&obj->userptr.notifier);
> +	obj->userptr.notifier.mm =3D NULL;
>  }
>  =

>  static int
> @@ -686,7 +419,6 @@ static const struct drm_i915_gem_object_ops i915_gem_=
userptr_ops =3D {
>  	.name =3D "i915_gem_object_userptr",
>  	.flags =3D I915_GEM_OBJECT_IS_SHRINKABLE |
>  		 I915_GEM_OBJECT_NO_MMAP |
> -		 I915_GEM_OBJECT_ASYNC_CANCEL |
>  		 I915_GEM_OBJECT_IS_PROXY,
>  	.get_pages =3D i915_gem_userptr_get_pages,
>  	.put_pages =3D i915_gem_userptr_put_pages,
> @@ -793,6 +525,7 @@ i915_gem_userptr_ioctl(struct drm_device *dev,
>  	i915_gem_object_set_cache_coherency(obj, I915_CACHE_LLC);
>  =

>  	obj->userptr.ptr =3D args->user_ptr;
> +	obj->userptr.notifier_seq =3D ULONG_MAX;
>  	if (args->flags & I915_USERPTR_READ_ONLY)
>  		i915_gem_object_set_readonly(obj);
>  =

> @@ -800,9 +533,7 @@ i915_gem_userptr_ioctl(struct drm_device *dev,
>  	 * at binding. This means that we need to hook into the mmu_notifier
>  	 * in order to detect if the mmu is destroyed.
>  	 */
> -	ret =3D i915_gem_userptr_init__mm_struct(obj);
> -	if (ret =3D=3D 0)
> -		ret =3D i915_gem_userptr_init__mmu_notifier(obj);
> +	ret =3D i915_gem_userptr_init__mmu_notifier(obj);
>  	if (ret =3D=3D 0)
>  		ret =3D drm_gem_handle_create(file, &obj->base, &handle);
>  =

> @@ -821,15 +552,7 @@ i915_gem_userptr_ioctl(struct drm_device *dev,
>  int i915_gem_init_userptr(struct drm_i915_private *dev_priv)
>  {
>  #ifdef CONFIG_MMU_NOTIFIER
> -	spin_lock_init(&dev_priv->mm_lock);
> -	hash_init(dev_priv->mm_structs);
> -
> -	dev_priv->mm.userptr_wq =3D
> -		alloc_workqueue("i915-userptr-acquire",
> -				WQ_HIGHPRI | WQ_UNBOUND,
> -				0);
> -	if (!dev_priv->mm.userptr_wq)
> -		return -ENOMEM;
> +	spin_lock_init(&dev_priv->mm.notifier_lock);
>  #endif
>  =

>  	return 0;
> @@ -837,7 +560,4 @@ int i915_gem_init_userptr(struct drm_i915_private *de=
v_priv)
>  =

>  void i915_gem_cleanup_userptr(struct drm_i915_private *dev_priv)
>  {
> -#ifdef CONFIG_MMU_NOTIFIER
> -	destroy_workqueue(dev_priv->mm.userptr_wq);
> -#endif
>  }
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_=
drv.h
> index d738e2ba07c8..7c16bd283b87 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -558,11 +558,10 @@ struct i915_gem_mm {
>  =

>  #ifdef CONFIG_MMU_NOTIFIER
>  	/**
> -	 * Workqueue to fault in userptr pages, flushed by the execbuf
> -	 * when required but otherwise left to userspace to try again
> -	 * on EAGAIN.
> +	 * notifier_lock for mmu notifiers, memory may not be allocated
> +	 * while holding this lock.
>  	 */
> -	struct workqueue_struct *userptr_wq;
> +	spinlock_t notifier_lock;
>  #endif
>  =

>  	/* shrinker accounting, also useful for userland debugging */
> @@ -936,8 +935,6 @@ struct drm_i915_private {
>  	struct i915_ggtt ggtt; /* VM representing the global address space */
>  =

>  	struct i915_gem_mm mm;
> -	DECLARE_HASHTABLE(mm_structs, 7);
> -	spinlock_t mm_lock;
>  =

>  	/* Kernel Modesetting */
>  =

> diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_=
gem.c
> index dde12ce4f90b..3dee4e31fb14 100644
> --- a/drivers/gpu/drm/i915/i915_gem.c
> +++ b/drivers/gpu/drm/i915/i915_gem.c
> @@ -1067,10 +1067,8 @@ int i915_gem_init(struct drm_i915_private *dev_pri=
v)
>  err_unlock:
>  	i915_gem_drain_workqueue(dev_priv);
>  =

> -	if (ret !=3D -EIO) {
> +	if (ret !=3D -EIO)
>  		intel_uc_cleanup_firmwares(&dev_priv->gt.uc);
> -		i915_gem_cleanup_userptr(dev_priv);
> -	}
>  =

>  	if (ret =3D=3D -EIO) {
>  		/*
> @@ -1127,7 +1125,6 @@ void i915_gem_driver_release(struct drm_i915_privat=
e *dev_priv)
>  	intel_wa_list_free(&dev_priv->gt_wa_list);
>  =

>  	intel_uc_cleanup_firmwares(&dev_priv->gt.uc);
> -	i915_gem_cleanup_userptr(dev_priv);
>  =

>  	i915_gem_drain_freed_objects(dev_priv);
>  =

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
