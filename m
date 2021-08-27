Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D35D3F9B0E
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 16:45:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 164436E982;
	Fri, 27 Aug 2021 14:44:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 807C86E985;
 Fri, 27 Aug 2021 14:44:53 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10089"; a="217686972"
X-IronPort-AV: E=Sophos;i="5.84,356,1620716400"; d="scan'208";a="217686972"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2021 07:44:46 -0700
X-IronPort-AV: E=Sophos;i="5.84,356,1620716400"; d="scan'208";a="538125294"
Received: from aleenaha-mobl1.ger.corp.intel.com (HELO [10.213.228.247])
 ([10.213.228.247])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2021 07:44:44 -0700
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915: Handle Intel igfx + Intel dgfx
 hybrid graphics setup
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
References: <20210827133039.287075-1-tvrtko.ursulin@linux.intel.com>
 <20210827143941.287958-1-tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <9c042851-9a27-6bc7-0749-ed0c573e9c80@linux.intel.com>
Date: Fri, 27 Aug 2021 15:44:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210827143941.287958-1-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 27/08/2021 15:39, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> In short this makes i915 work for hybrid setups (DRI_PRIME=1 with Mesa)
> when rendering is done on Intel dgfx and scanout/composition on Intel
> igfx.
> 
> Before this patch the driver was not quite ready for that setup, mainly
> because it was able to emit a semaphore wait between the two GPUs, which
> results in deadlocks because semaphore target location in HWSP is neither
> shared between the two, nor mapped in both GGTT spaces.
> 
> To fix it the patch adds an additional check to a couple of relevant code
> paths in order to prevent using semaphores for inter-engine
> synchronisation between different driver instances.
> 
> Patch also moves singly used i915_gem_object_last_write_engine to be
> private in its only calling unit (debugfs), while modifying it to only
> show activity belonging to the respective driver instance.
> 
> What remains in this problem space is the question of the GEM busy ioctl.
> We have a somewhat ambigous comment there saying only status of native
> fences will be reported, which could be interpreted as either i915, or
> native to the drm fd. For now I have decided to leave that as is, meaning
> any i915 instance activity continues to be reported.
> 
> v2:
>   * Avoid adding rq->i915. (Chris)
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_object.h | 17 ----------
>   drivers/gpu/drm/i915/i915_debugfs.c        | 39 ++++++++++++++++++++--
>   drivers/gpu/drm/i915/i915_request.c        | 12 ++++++-
>   3 files changed, 47 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> index 48112b9d76df..3043fcbd31bd 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> @@ -503,23 +503,6 @@ i915_gem_object_finish_access(struct drm_i915_gem_object *obj)
>   	i915_gem_object_unpin_pages(obj);
>   }
>   
> -static inline struct intel_engine_cs *
> -i915_gem_object_last_write_engine(struct drm_i915_gem_object *obj)
> -{
> -	struct intel_engine_cs *engine = NULL;
> -	struct dma_fence *fence;
> -
> -	rcu_read_lock();
> -	fence = dma_resv_get_excl_unlocked(obj->base.resv);
> -	rcu_read_unlock();
> -
> -	if (fence && dma_fence_is_i915(fence) && !dma_fence_is_signaled(fence))
> -		engine = to_request(fence)->engine;
> -	dma_fence_put(fence);
> -
> -	return engine;
> -}
> -
>   void i915_gem_object_set_cache_coherency(struct drm_i915_gem_object *obj,
>   					 unsigned int cache_level);
>   void i915_gem_object_flush_if_display(struct drm_i915_gem_object *obj);
> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
> index 04351a851586..55fd6191eb32 100644
> --- a/drivers/gpu/drm/i915/i915_debugfs.c
> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
> @@ -135,13 +135,46 @@ static const char *stringify_vma_type(const struct i915_vma *vma)
>   	return "ppgtt";
>   }
>   
> +static char *
> +last_write_engine(struct drm_i915_private *i915,
> +		  struct drm_i915_gem_object *obj)
> +{
> +	struct intel_engine_cs *engine;
> +	struct dma_fence *fence;
> +	char *res = NULL;
> +
> +	rcu_read_lock();
> +	fence = dma_resv_get_excl_unlocked(obj->base.resv);
> +	rcu_read_unlock();
> +
> +	if (!fence || dma_fence_is_signaled(fence))
> +		goto out;
> +
> +	if (!dma_fence_is_i915(fence)) {
> +		res = "<external-fence>";
> +		goto out;
> +	}
> +
> +	engine = to_request(fence)->engine;
> +	if (engine->gt->i915 != i915) {
> +		res = "<external-i915>";
> +		goto out;
> +	}
> +
> +	res = engine->name;
> +
> +out:
> +	dma_fence_put(fence);
> +	return res;
> +}
> +
>   void
>   i915_debugfs_describe_obj(struct seq_file *m, struct drm_i915_gem_object *obj)
>   {
>   	struct drm_i915_private *dev_priv = to_i915(obj->base.dev);
> -	struct intel_engine_cs *engine;
>   	struct i915_vma *vma;
>   	int pin_count = 0;
> +	char *engine;
>   
>   	seq_printf(m, "%pK: %c%c%c %8zdKiB %02x %02x %s%s%s",
>   		   &obj->base,
> @@ -230,9 +263,9 @@ i915_debugfs_describe_obj(struct seq_file *m, struct drm_i915_gem_object *obj)
>   	if (i915_gem_object_is_framebuffer(obj))
>   		seq_printf(m, " (fb)");
>   
> -	engine = i915_gem_object_last_write_engine(obj);
> +	engine = last_write_engine(dev_priv, obj);
>   	if (engine)
> -		seq_printf(m, " (%s)", engine->name);
> +		seq_printf(m, " (%s)", engine);

Or I zap this from the code altogether. Not sure it is very useful since 
the only caller is i915_gem_framebuffer debugfs file and how much it can 
care about maybe hitting the timing window when exclusive fence will 
contain something.

Regards,

Tvrtko

>   }
>   
>   static int i915_gem_object_info(struct seq_file *m, void *data)
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> index ce446716d092..64adf619fe82 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -1152,6 +1152,12 @@ __emit_semaphore_wait(struct i915_request *to,
>   	return 0;
>   }
>   
> +static bool
> +can_use_semaphore_wait(struct i915_request *to, struct i915_request *from)
> +{
> +	return to->engine->gt == from->engine->gt;
> +}
> +
>   static int
>   emit_semaphore_wait(struct i915_request *to,
>   		    struct i915_request *from,
> @@ -1160,6 +1166,9 @@ emit_semaphore_wait(struct i915_request *to,
>   	const intel_engine_mask_t mask = READ_ONCE(from->engine)->mask;
>   	struct i915_sw_fence *wait = &to->submit;
>   
> +	if (!can_use_semaphore_wait(to, from))
> +		goto await_fence;
> +
>   	if (!intel_context_use_semaphores(to->context))
>   		goto await_fence;
>   
> @@ -1263,7 +1272,8 @@ __i915_request_await_execution(struct i915_request *to,
>   	 * immediate execution, and so we must wait until it reaches the
>   	 * active slot.
>   	 */
> -	if (intel_engine_has_semaphores(to->engine) &&
> +	if (can_use_semaphore_wait(to, from) &&
> +	    intel_engine_has_semaphores(to->engine) &&
>   	    !i915_request_has_initial_breadcrumb(to)) {
>   		err = __emit_semaphore_wait(to, from, from->fence.seqno - 1);
>   		if (err < 0)
> 
