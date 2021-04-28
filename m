Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D09C36DC92
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 18:00:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45B146E106;
	Wed, 28 Apr 2021 16:00:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 884FC6EBA0;
 Wed, 28 Apr 2021 15:59:58 +0000 (UTC)
IronPort-SDR: Z7v7VEKlz8UM5qq3qv7E68UmPLUzncOcR1o9wceFB0NTMobbDfyDNHXe6le1GkB7SnHRR6hjCR
 fkeJLx2SqxEA==
X-IronPort-AV: E=McAfee;i="6200,9189,9968"; a="260728973"
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; d="scan'208";a="260728973"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2021 08:59:57 -0700
IronPort-SDR: 9HdcBqtv7cMTRGS0oLFFDytsOQ4OKqGisNSmf0a/RmjCeiRlMNJdOd/LOJh+xxtmClcS3XLtOY
 x/pk9j3+ANzQ==
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; d="scan'208";a="387766020"
Received: from akuligox-mobl.ger.corp.intel.com (HELO [10.213.207.221])
 ([10.213.207.221])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2021 08:59:56 -0700
Subject: Re: [Intel-gfx] [PATCH 05/21] drm/i915: Drop the CONTEXT_CLONE API
To: Jason Ekstrand <jason@jlekstrand.net>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210423223131.879208-1-jason@jlekstrand.net>
 <20210423223131.879208-6-jason@jlekstrand.net>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <bd236a6b-5642-967f-e28e-bfbd56390450@linux.intel.com>
Date: Wed, 28 Apr 2021 16:59:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210423223131.879208-6-jason@jlekstrand.net>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 23/04/2021 23:31, Jason Ekstrand wrote:
> This API allows one context to grab bits out of another context upon
> creation.  It can be used as a short-cut for setparam(getparam()) for
> things like I915_CONTEXT_PARAM_VM.  However, it's never been used by any
> real userspace.  It's used by a few IGT tests and that's it.  Since it
> doesn't add any real value (most of the stuff you can CLONE you can copy
> in other ways), drop it.
> 
> There is one thing that this API allows you to clone which you cannot
> clone via getparam/setparam: timelines.  However, timelines are an
> implementation detail of i915 and not really something that needs to be
> exposed to userspace.  Also, sharing timelines between contexts isn't
> obviously useful and supporting it has the potential to complicate i915
> internally.  It also doesn't add any functionality that the client can't
> get in other ways.  If a client really wants a shared timeline, they can
> use a syncobj and set it as an in and out fence on every submit.
> 
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

As mentioned before I have no major problem with removing unused uapi 
apart from disagreeing on when to do it. And the fact I find cloning a 
very plausible equivalent of clone(2). Which is an established nice 
model and all. So a sad ack is all I can give.

Regards,

Tvrtko

> ---
>   drivers/gpu/drm/i915/gem/i915_gem_context.c | 199 +-------------------
>   include/uapi/drm/i915_drm.h                 |  16 +-
>   2 files changed, 6 insertions(+), 209 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index 8a77855123cec..2c2fefa912805 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -1958,207 +1958,14 @@ static int create_setparam(struct i915_user_extension __user *ext, void *data)
>   	return ctx_setparam(arg->fpriv, arg->ctx, &local.param);
>   }
>   
> -static int clone_engines(struct i915_gem_context *dst,
> -			 struct i915_gem_context *src)
> +static int invalid_ext(struct i915_user_extension __user *ext, void *data)
>   {
> -	struct i915_gem_engines *clone, *e;
> -	bool user_engines;
> -	unsigned long n;
> -
> -	e = __context_engines_await(src, &user_engines);
> -	if (!e)
> -		return -ENOENT;
> -
> -	clone = alloc_engines(e->num_engines);
> -	if (!clone)
> -		goto err_unlock;
> -
> -	for (n = 0; n < e->num_engines; n++) {
> -		struct intel_engine_cs *engine;
> -
> -		if (!e->engines[n]) {
> -			clone->engines[n] = NULL;
> -			continue;
> -		}
> -		engine = e->engines[n]->engine;
> -
> -		/*
> -		 * Virtual engines are singletons; they can only exist
> -		 * inside a single context, because they embed their
> -		 * HW context... As each virtual context implies a single
> -		 * timeline (each engine can only dequeue a single request
> -		 * at any time), it would be surprising for two contexts
> -		 * to use the same engine. So let's create a copy of
> -		 * the virtual engine instead.
> -		 */
> -		if (intel_engine_is_virtual(engine))
> -			clone->engines[n] =
> -				intel_execlists_clone_virtual(engine);
> -		else
> -			clone->engines[n] = intel_context_create(engine);
> -		if (IS_ERR_OR_NULL(clone->engines[n])) {
> -			__free_engines(clone, n);
> -			goto err_unlock;
> -		}
> -
> -		intel_context_set_gem(clone->engines[n], dst);
> -	}
> -	clone->num_engines = n;
> -	i915_sw_fence_complete(&e->fence);
> -
> -	/* Serialised by constructor */
> -	engines_idle_release(dst, rcu_replace_pointer(dst->engines, clone, 1));
> -	if (user_engines)
> -		i915_gem_context_set_user_engines(dst);
> -	else
> -		i915_gem_context_clear_user_engines(dst);
> -	return 0;
> -
> -err_unlock:
> -	i915_sw_fence_complete(&e->fence);
> -	return -ENOMEM;
> -}
> -
> -static int clone_flags(struct i915_gem_context *dst,
> -		       struct i915_gem_context *src)
> -{
> -	dst->user_flags = src->user_flags;
> -	return 0;
> -}
> -
> -static int clone_schedattr(struct i915_gem_context *dst,
> -			   struct i915_gem_context *src)
> -{
> -	dst->sched = src->sched;
> -	return 0;
> -}
> -
> -static int clone_sseu(struct i915_gem_context *dst,
> -		      struct i915_gem_context *src)
> -{
> -	struct i915_gem_engines *e = i915_gem_context_lock_engines(src);
> -	struct i915_gem_engines *clone;
> -	unsigned long n;
> -	int err;
> -
> -	/* no locking required; sole access under constructor*/
> -	clone = __context_engines_static(dst);
> -	if (e->num_engines != clone->num_engines) {
> -		err = -EINVAL;
> -		goto unlock;
> -	}
> -
> -	for (n = 0; n < e->num_engines; n++) {
> -		struct intel_context *ce = e->engines[n];
> -
> -		if (clone->engines[n]->engine->class != ce->engine->class) {
> -			/* Must have compatible engine maps! */
> -			err = -EINVAL;
> -			goto unlock;
> -		}
> -
> -		/* serialises with set_sseu */
> -		err = intel_context_lock_pinned(ce);
> -		if (err)
> -			goto unlock;
> -
> -		clone->engines[n]->sseu = ce->sseu;
> -		intel_context_unlock_pinned(ce);
> -	}
> -
> -	err = 0;
> -unlock:
> -	i915_gem_context_unlock_engines(src);
> -	return err;
> -}
> -
> -static int clone_timeline(struct i915_gem_context *dst,
> -			  struct i915_gem_context *src)
> -{
> -	if (src->timeline)
> -		__assign_timeline(dst, src->timeline);
> -
> -	return 0;
> -}
> -
> -static int clone_vm(struct i915_gem_context *dst,
> -		    struct i915_gem_context *src)
> -{
> -	struct i915_address_space *vm;
> -	int err = 0;
> -
> -	if (!rcu_access_pointer(src->vm))
> -		return 0;
> -
> -	rcu_read_lock();
> -	vm = context_get_vm_rcu(src);
> -	rcu_read_unlock();
> -
> -	if (!mutex_lock_interruptible(&dst->mutex)) {
> -		__assign_ppgtt(dst, vm);
> -		mutex_unlock(&dst->mutex);
> -	} else {
> -		err = -EINTR;
> -	}
> -
> -	i915_vm_put(vm);
> -	return err;
> -}
> -
> -static int create_clone(struct i915_user_extension __user *ext, void *data)
> -{
> -	static int (* const fn[])(struct i915_gem_context *dst,
> -				  struct i915_gem_context *src) = {
> -#define MAP(x, y) [ilog2(I915_CONTEXT_CLONE_##x)] = y
> -		MAP(ENGINES, clone_engines),
> -		MAP(FLAGS, clone_flags),
> -		MAP(SCHEDATTR, clone_schedattr),
> -		MAP(SSEU, clone_sseu),
> -		MAP(TIMELINE, clone_timeline),
> -		MAP(VM, clone_vm),
> -#undef MAP
> -	};
> -	struct drm_i915_gem_context_create_ext_clone local;
> -	const struct create_ext *arg = data;
> -	struct i915_gem_context *dst = arg->ctx;
> -	struct i915_gem_context *src;
> -	int err, bit;
> -
> -	if (copy_from_user(&local, ext, sizeof(local)))
> -		return -EFAULT;
> -
> -	BUILD_BUG_ON(GENMASK(BITS_PER_TYPE(local.flags) - 1, ARRAY_SIZE(fn)) !=
> -		     I915_CONTEXT_CLONE_UNKNOWN);
> -
> -	if (local.flags & I915_CONTEXT_CLONE_UNKNOWN)
> -		return -EINVAL;
> -
> -	if (local.rsvd)
> -		return -EINVAL;
> -
> -	rcu_read_lock();
> -	src = __i915_gem_context_lookup_rcu(arg->fpriv, local.clone_id);
> -	rcu_read_unlock();
> -	if (!src)
> -		return -ENOENT;
> -
> -	GEM_BUG_ON(src == dst);
> -
> -	for (bit = 0; bit < ARRAY_SIZE(fn); bit++) {
> -		if (!(local.flags & BIT(bit)))
> -			continue;
> -
> -		err = fn[bit](dst, src);
> -		if (err)
> -			return err;
> -	}
> -
> -	return 0;
> +	return -EINVAL;
>   }
>   
>   static const i915_user_extension_fn create_extensions[] = {
>   	[I915_CONTEXT_CREATE_EXT_SETPARAM] = create_setparam,
> -	[I915_CONTEXT_CREATE_EXT_CLONE] = create_clone,
> +	[I915_CONTEXT_CREATE_EXT_CLONE] = invalid_ext,
>   };
>   
>   static bool client_is_banned(struct drm_i915_file_private *file_priv)
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index a0aaa8298f28d..75a71b6756ed8 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -1887,20 +1887,10 @@ struct drm_i915_gem_context_create_ext_setparam {
>   	struct drm_i915_gem_context_param param;
>   };
>   
> -struct drm_i915_gem_context_create_ext_clone {
> +/* This API has been removed.  On the off chance someone somewhere has
> + * attempted to use it, never re-use this extension number.
> + */
>   #define I915_CONTEXT_CREATE_EXT_CLONE 1
> -	struct i915_user_extension base;
> -	__u32 clone_id;
> -	__u32 flags;
> -#define I915_CONTEXT_CLONE_ENGINES	(1u << 0)
> -#define I915_CONTEXT_CLONE_FLAGS	(1u << 1)
> -#define I915_CONTEXT_CLONE_SCHEDATTR	(1u << 2)
> -#define I915_CONTEXT_CLONE_SSEU		(1u << 3)
> -#define I915_CONTEXT_CLONE_TIMELINE	(1u << 4)
> -#define I915_CONTEXT_CLONE_VM		(1u << 5)
> -#define I915_CONTEXT_CLONE_UNKNOWN -(I915_CONTEXT_CLONE_VM << 1)
> -	__u64 rsvd;
> -};
>   
>   struct drm_i915_gem_context_destroy {
>   	__u32 ctx_id;
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
