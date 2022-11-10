Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 765FA6244AD
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 15:50:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C22C10E846;
	Thu, 10 Nov 2022 14:50:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDAC910E83A;
 Thu, 10 Nov 2022 14:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668091800; x=1699627800;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=7MxnbuTAE3WAWNVc0OdZyWz/GDjq9W/RdOjM4WTr/2c=;
 b=HFXhu5YWs30YSH+8tOeNzWwi4PHLGBYcuY8wW02uH+qKZxaBNNmYrEZv
 wHIQdQ27leOOHnH2VSFFZOTh/45cNbMit0PSkcVtA2vhWwQeKAkRB9Num
 xd+33CGc7B0G9rr8vNIcJVvFGc79dlEQf43yxLns03DCRz2etb3ZypOb6
 f6tvlXOHJabMOPD/apL90ONPp78TUATAqCYdH1kVf0hh1d4g1/OE+10xg
 tDtr6nmWCVNMXvjf3zJoLy+iiqS7E6zE7aeS6yLNvGyZq6SGH48WBfdy5
 1QGzja/HCs7zqljxcUb0OITvraRVyejmNGjBboYP/liM17hFgn5M1SiY7 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="298822172"
X-IronPort-AV: E=Sophos;i="5.96,154,1665471600"; d="scan'208";a="298822172"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 06:49:58 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="726406555"
X-IronPort-AV: E=Sophos;i="5.96,154,1665471600"; d="scan'208";a="726406555"
Received: from inovosel-mobl3.ger.corp.intel.com (HELO [10.252.17.163])
 ([10.252.17.163])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 06:49:55 -0800
Message-ID: <1d066cb4-fb82-bffd-5e89-97ba572be3fa@intel.com>
Date: Thu, 10 Nov 2022 14:49:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.1
Subject: Re: [PATCH] drm/i915: Fix unhandled deadlock in grab_vma()
Content-Language: en-GB
To: Mani Milani <mani@chromium.org>, LKML <linux-kernel@vger.kernel.org>
References: <20221110053133.2433412-1-mani@chromium.org>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20221110053133.2433412-1-mani@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/11/2022 05:31, Mani Milani wrote:
> At present, the gpu thread crashes at times when grab_vma() attempts to
> acquire a gem object lock when in a deadlock state.
> 
> Problems:
> I identified the following 4 issues in the current code:
> 1. Since grab_vma() calls i915_gem_object_trylock(), which consequently
>     calls ww_mutex_trylock(), to acquire lock, it does not perform any
>     -EDEADLK handling; And -EALREADY handling is also unreliable,
>     according to the description of ww_mutex_trylock().
> 2. Since the return value of grab_vma() is a boolean showing
>     success/failure, it does not provide any extra information on the
>     failure reason, and therefore does not provide any mechanism to its
>     caller to take any action to fix a potential deadlock.
> 3. Current grab_vma() implementation produces inconsistent behaviour
>     depending on the refcount value, without informing the caller. If
>     refcount is already zero, grab_vma() neither acquires lock nor
>     increments the refcount, but still returns 'true' for success! This
>     means that grab_vma() returning true (for success) does not always
>     mean that the gem obj is actually safely accessible.
> 4. Currently, calling "i915_gem_object_lock(obj,ww)" is meant to be
>     followed by a consequent "i915_gem_object_unlock(obj)" ONLY if the
>     original 'ww' object pointer was NULL, or otherwise not be called and
>     leave the houskeeping to "i915_gem_ww_ctx_fini(ww)". There are a few
>     issues with this:
>     - This is not documented anywhere in the code (that I could find),
>       but only explained in an older commit message.
>     - This produces an inconsistent usage of the lock/unlock functions,
>       increasing the chance of mistakes and issues.
>     - This is not a clean design as it requires any new code that calls
>       these lock/unlock functions to know their internals, as well as the
>       internals of the functions calling the new code being added.
> 
> Fix:
> To fix the issues above, this patch:
> 1. Changes grab_vma() to call i915_gem_object_lock() instead of
>     i915_gem_object_trylock(), to handle -EDEADLK and -EALREADY cases.
>     This should not cause any issue since the PIN_NONBLOCK flag is
>     checked beforehand in the 2 cases grab_vma() is called.
> 2. Changes grab_vma() to return the actual error code, instead of bool.
> 3. Changes grab_vma() to behave consistently when returning success, by
>     both incrementing the refcount and acquiring lock at all times.
> 4. Changes i915_gem_object_unlock() to pair with i915_gem_object_lock()
>     nicely in all cases and do the housekeeping without the need for the
>     caller to do anything other than simply calling lock and unlock.
> 5. Ensures the gem obj->obj_link is initialized and deleted from the ww
>     list such that it can be tested for emptiness using list_empty().
> 
> Signed-off-by: Mani Milani <mani@chromium.org>
> ---
> 
>   drivers/gpu/drm/i915/gem/i915_gem_object.c |  2 +
>   drivers/gpu/drm/i915/gem/i915_gem_object.h | 10 ++++-
>   drivers/gpu/drm/i915/i915_gem_evict.c      | 48 ++++++++++++----------
>   drivers/gpu/drm/i915/i915_gem_ww.c         |  8 ++--
>   4 files changed, 41 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> index 369006c5317f..69d013b393fb 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> @@ -78,6 +78,8 @@ void i915_gem_object_init(struct drm_i915_gem_object *obj,
>   
>   	INIT_LIST_HEAD(&obj->mm.link);
>   
> +	INIT_LIST_HEAD(&obj->obj_link);
> +
>   	INIT_LIST_HEAD(&obj->lut_list);
>   	spin_lock_init(&obj->lut_lock);
>   
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> index 1723af9b0f6a..7e7a61bdf52c 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> @@ -219,7 +219,7 @@ static inline bool i915_gem_object_trylock(struct drm_i915_gem_object *obj,
>   		return ww_mutex_trylock(&obj->base.resv->lock, &ww->ctx);
>   }
>   
> -static inline void i915_gem_object_unlock(struct drm_i915_gem_object *obj)
> +static inline void __i915_gem_object_unlock(struct drm_i915_gem_object *obj)
>   {
>   	if (obj->ops->adjust_lru)
>   		obj->ops->adjust_lru(obj);
> @@ -227,6 +227,14 @@ static inline void i915_gem_object_unlock(struct drm_i915_gem_object *obj)
>   	dma_resv_unlock(obj->base.resv);
>   }
>   
> +static inline void i915_gem_object_unlock(struct drm_i915_gem_object *obj)
> +{
> +	if (list_empty(&obj->obj_link))
> +		__i915_gem_object_unlock(obj);
> +	else
> +		i915_gem_ww_unlock_single(obj);
> +}
> +
>   static inline void
>   i915_gem_object_set_readonly(struct drm_i915_gem_object *obj)
>   {
> diff --git a/drivers/gpu/drm/i915/i915_gem_evict.c b/drivers/gpu/drm/i915/i915_gem_evict.c
> index f025ee4fa526..3eb514b4eddc 100644
> --- a/drivers/gpu/drm/i915/i915_gem_evict.c
> +++ b/drivers/gpu/drm/i915/i915_gem_evict.c
> @@ -55,29 +55,33 @@ static int ggtt_flush(struct intel_gt *gt)
>   	return intel_gt_wait_for_idle(gt, MAX_SCHEDULE_TIMEOUT);
>   }
>   
> -static bool grab_vma(struct i915_vma *vma, struct i915_gem_ww_ctx *ww)
> +static int grab_vma(struct i915_vma *vma, struct i915_gem_ww_ctx *ww)
>   {
> +	int err;
> +
> +	/* Dead objects don't need pins */
> +	if (dying_vma(vma))
> +		atomic_and(~I915_VMA_PIN_MASK, &vma->flags);
> +
> +	err = i915_gem_object_lock(vma->obj, ww);

AFAIK the issue here is that we are already holding the vm->mutex, so 
this can potentially deadlock, which I guess is why this was trylock.

We typically grab a bunch of object locks during execbuf, and then grab 
the vm->mutex, before binding the vma for each object. So vm->mutex is 
always our inner lock, and the object lock is the outer one. Using a 
full lock here then inverts that locking AFAICT. Like say if one process 
is holding object A + vm->mutex and then tries to grab object B here in 
grab_vma(), but another process is already holding object B + waiting to 
grab vm->mutex?

> +
>   	/*
>   	 * We add the extra refcount so the object doesn't drop to zero until
> -	 * after ungrab_vma(), this way trylock is always paired with unlock.
> +	 * after ungrab_vma(), this way lock is always paired with unlock.
>   	 */
> -	if (i915_gem_object_get_rcu(vma->obj)) {
> -		if (!i915_gem_object_trylock(vma->obj, ww)) {
> -			i915_gem_object_put(vma->obj);
> -			return false;
> -		}
> -	} else {
> -		/* Dead objects don't need pins */
> -		atomic_and(~I915_VMA_PIN_MASK, &vma->flags);
> -	}
> +	if (!err)
> +		i915_gem_object_get(vma->obj);
>   
> -	return true;
> +	return err;
>   }
>   
>   static void ungrab_vma(struct i915_vma *vma)
>   {
> -	if (dying_vma(vma))
> +	if (dying_vma(vma)) {
> +		/* Dead objects don't need pins */
> +		atomic_and(~I915_VMA_PIN_MASK, &vma->flags);
>   		return;
> +	}
>   
>   	i915_gem_object_unlock(vma->obj);
>   	i915_gem_object_put(vma->obj);
> @@ -93,10 +97,11 @@ mark_free(struct drm_mm_scan *scan,
>   	if (i915_vma_is_pinned(vma))
>   		return false;
>   
> -	if (!grab_vma(vma, ww))
> +	if (grab_vma(vma, ww))
>   		return false;
>   
>   	list_add(&vma->evict_link, unwind);
> +
>   	return drm_mm_scan_add_block(scan, &vma->node);
>   }
>   
> @@ -284,10 +289,12 @@ i915_gem_evict_something(struct i915_address_space *vm,
>   		vma = container_of(node, struct i915_vma, node);
>   
>   		/* If we find any non-objects (!vma), we cannot evict them */
> -		if (vma->node.color != I915_COLOR_UNEVICTABLE &&
> -		    grab_vma(vma, ww)) {
> -			ret = __i915_vma_unbind(vma);
> -			ungrab_vma(vma);
> +		if (vma->node.color != I915_COLOR_UNEVICTABLE) {
> +			ret = grab_vma(vma, ww);
> +			if (!ret) {
> +				ret = __i915_vma_unbind(vma);
> +				ungrab_vma(vma);
> +			}
>   		} else {
>   			ret = -ENOSPC;
>   		}
> @@ -382,10 +389,9 @@ int i915_gem_evict_for_node(struct i915_address_space *vm,
>   			break;
>   		}
>   
> -		if (!grab_vma(vma, ww)) {
> -			ret = -ENOSPC;
> +		ret = grab_vma(vma, ww);
> +		if (ret)
>   			break;
> -		}
>   
>   		/*
>   		 * Never show fear in the face of dragons!
> diff --git a/drivers/gpu/drm/i915/i915_gem_ww.c b/drivers/gpu/drm/i915/i915_gem_ww.c
> index 3f6ff139478e..937b279f50fc 100644
> --- a/drivers/gpu/drm/i915/i915_gem_ww.c
> +++ b/drivers/gpu/drm/i915/i915_gem_ww.c
> @@ -19,16 +19,14 @@ static void i915_gem_ww_ctx_unlock_all(struct i915_gem_ww_ctx *ww)
>   	struct drm_i915_gem_object *obj;
>   
>   	while ((obj = list_first_entry_or_null(&ww->obj_list, struct drm_i915_gem_object, obj_link))) {
> -		list_del(&obj->obj_link);
> -		i915_gem_object_unlock(obj);
> -		i915_gem_object_put(obj);
> +		i915_gem_ww_unlock_single(obj);
>   	}
>   }
>   
>   void i915_gem_ww_unlock_single(struct drm_i915_gem_object *obj)
>   {
> -	list_del(&obj->obj_link);
> -	i915_gem_object_unlock(obj);
> +	list_del_init(&obj->obj_link);
> +	__i915_gem_object_unlock(obj);
>   	i915_gem_object_put(obj);
>   }
>   
