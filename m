Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B3A866F6D
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 10:56:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C0710E436;
	Mon, 26 Feb 2024 09:56:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I0er84Bz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 203C010ED2C;
 Mon, 26 Feb 2024 09:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708941372; x=1740477372;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=smor2AjHrUlxmVtiFaDG33FdOQgYNoZLTLf8nc8xO/o=;
 b=I0er84BzFu611EGAd2pRvFyoiIKtV9StMATncm4UNd7NrAms7a402t46
 qPcEo9uvo0QsV48L2zf1ClSGm9HoYbgat2nPeswCI8F7dybxsJhQWf0U+
 o8nkGvXdU1ve5jzKwcN0dVY4FVRjq8gA4nR4X919h5jY6pl24dr3YTC+W
 Tiz3uB0xU8tSJ1NQsjET7TifQGmfOLFPQdqU/cPbv1Qer01np1oY1tUSz
 xQIME8LET0cn1LGu9QYVWsmL+u2ZuD8e3yrNvJGwsvvR7sDpOVQ16H+sf
 N2TOKPTh/x9QFYBFdFNcGh/hJDv7m5cAeETa4lxXIp6Kh/QbQSj5aq3Bt w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="13859749"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; d="scan'208";a="13859749"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 01:56:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="6958751"
Received: from myakobs-mobl1.ger.corp.intel.com (HELO [10.213.232.131])
 ([10.213.232.131])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 01:56:00 -0800
Message-ID: <4dde7351-3af1-4421-a594-c8f65380c097@linux.intel.com>
Date: Mon, 26 Feb 2024 09:55:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/i915: Support replaying GPU hangs with captured
 context image
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Carlos Santa <carlos.santa@intel.com>
References: <20240221142245.2331484-1-tvrtko.ursulin@linux.intel.com>
 <20240221142245.2331484-3-tvrtko.ursulin@linux.intel.com>
 <Zde3nGm2xFPRivuB@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <Zde3nGm2xFPRivuB@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 22/02/2024 21:07, Rodrigo Vivi wrote:
> On Wed, Feb 21, 2024 at 02:22:45PM +0000, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> When debugging GPU hangs Mesa developers are finding it useful to replay
>> the captured error state against the simulator. But due various simulator
>> limitations which prevent replicating all hangs, one step further is being
>> able to replay against a real GPU.
>>
>> This is almost doable today with the missing part being able to upload the
>> captured context image into the driver state prior to executing the
>> uploaded hanging batch and all the buffers.
>>
>> To enable this last part we add a new context parameter called
>> I915_CONTEXT_PARAM_CONTEXT_IMAGE. It follows the existing SSEU
>> configuration pattern of being able to select which context to apply
>> against, paired with the actual image and its size.
>>
>> Since this is adding a new concept of debug only uapi, we hide it behind
>> a new kconfig option and also require activation with a module parameter.
>> Together with a warning banner printed at driver load, all those combined
>> should be sufficient to guard against inadvertently enabling the feature.
>>
>> In terms of implementation we allow the legacy context set param to be
>> used since that removes the need to record the per context data in the
>> proto context, while still allowing flexibility of specifying context
>> images for any context.
>>
>> Mesa MR using the uapi can be seen at:
>>    https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27594
>>
>> v2:
>>   * Fix whitespace alignment as per checkpatch.
>>   * Added warning on userspace misuse.
>>   * Rebase for extracting ce->default_state shadowing.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>> Cc: Carlos Santa <carlos.santa@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> # v1
> 
> still valid for v2. Thanks for splitting the patch.

Great, thanks!

Now we need to hear from Lionel if he is still keen to have this. In 
which case some acks or tested by would be good.

Regards,

Tvrtko

>> ---
>>   drivers/gpu/drm/i915/Kconfig.debug            |  17 +++
>>   drivers/gpu/drm/i915/gem/i915_gem_context.c   | 113 ++++++++++++++++++
>>   drivers/gpu/drm/i915/gt/intel_context.c       |   2 +
>>   drivers/gpu/drm/i915/gt/intel_context.h       |  22 ++++
>>   drivers/gpu/drm/i915/gt/intel_context_types.h |   1 +
>>   drivers/gpu/drm/i915/gt/intel_lrc.c           |   3 +-
>>   .../gpu/drm/i915/gt/intel_ring_submission.c   |   3 +-
>>   drivers/gpu/drm/i915/i915_params.c            |   5 +
>>   drivers/gpu/drm/i915/i915_params.h            |   3 +-
>>   include/uapi/drm/i915_drm.h                   |  27 +++++
>>   10 files changed, 193 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/Kconfig.debug b/drivers/gpu/drm/i915/Kconfig.debug
>> index 5b7162076850..32e9f70e91ed 100644
>> --- a/drivers/gpu/drm/i915/Kconfig.debug
>> +++ b/drivers/gpu/drm/i915/Kconfig.debug
>> @@ -16,6 +16,23 @@ config DRM_I915_WERROR
>>   
>>   	  If in doubt, say "N".
>>   
>> +config DRM_I915_REPLAY_GPU_HANGS_API
>> +	bool "Enable GPU hang replay userspace API"
>> +	depends on DRM_I915
>> +	depends on EXPERT
>> +	default n
>> +	help
>> +	  Choose this option if you want to enable special and unstable
>> +	  userspace API used for replaying GPU hangs on a running system.
>> +
>> +	  This API is intended to be used by userspace graphics stack developers
>> +	  and provides no stability guarantees.
>> +
>> +	  The API needs to be activated at boot time using the
>> +	  enable_debug_only_api module parameter.
>> +
>> +	  If in doubt, say "N".
>> +
>>   config DRM_I915_DEBUG
>>   	bool "Enable additional driver debugging"
>>   	depends on DRM_I915
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>> index dcbfe32fd30c..481aacbc1772 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>> @@ -78,6 +78,7 @@
>>   #include "gt/intel_engine_user.h"
>>   #include "gt/intel_gpu_commands.h"
>>   #include "gt/intel_ring.h"
>> +#include "gt/shmem_utils.h"
>>   
>>   #include "pxp/intel_pxp.h"
>>   
>> @@ -949,6 +950,7 @@ static int set_proto_ctx_param(struct drm_i915_file_private *fpriv,
>>   	case I915_CONTEXT_PARAM_NO_ZEROMAP:
>>   	case I915_CONTEXT_PARAM_BAN_PERIOD:
>>   	case I915_CONTEXT_PARAM_RINGSIZE:
>> +	case I915_CONTEXT_PARAM_CONTEXT_IMAGE:
>>   	default:
>>   		ret = -EINVAL;
>>   		break;
>> @@ -2092,6 +2094,95 @@ static int get_protected(struct i915_gem_context *ctx,
>>   	return 0;
>>   }
>>   
>> +static int set_context_image(struct i915_gem_context *ctx,
>> +			     struct drm_i915_gem_context_param *args)
>> +{
>> +	struct i915_gem_context_param_context_image user;
>> +	struct intel_context *ce;
>> +	struct file *shmem_state;
>> +	unsigned long lookup;
>> +	void *state;
>> +	int ret = 0;
>> +
>> +	if (!IS_ENABLED(CONFIG_DRM_I915_REPLAY_GPU_HANGS_API))
>> +		return -EINVAL;
>> +
>> +	if (!ctx->i915->params.enable_debug_only_api)
>> +		return -EINVAL;
>> +
>> +	if (args->size < sizeof(user))
>> +		return -EINVAL;
>> +
>> +	if (copy_from_user(&user, u64_to_user_ptr(args->value), sizeof(user)))
>> +		return -EFAULT;
>> +
>> +	if (user.mbz)
>> +		return -EINVAL;
>> +
>> +	if (user.flags & ~(I915_CONTEXT_IMAGE_FLAG_ENGINE_INDEX))
>> +		return -EINVAL;
>> +
>> +	lookup = 0;
>> +	if (user.flags & I915_CONTEXT_IMAGE_FLAG_ENGINE_INDEX)
>> +		lookup |= LOOKUP_USER_INDEX;
>> +
>> +	ce = lookup_user_engine(ctx, lookup, &user.engine);
>> +	if (IS_ERR(ce))
>> +		return PTR_ERR(ce);
>> +
>> +	if (user.size < ce->engine->context_size) {
>> +		ret = -EINVAL;
>> +		goto out_ce;
>> +	}
>> +
>> +	if (drm_WARN_ON_ONCE(&ctx->i915->drm,
>> +			     test_bit(CONTEXT_ALLOC_BIT, &ce->flags))) {
>> +		/*
>> +		 * This is racy but for a debug only API, if userspace is keen
>> +		 * to create and configure contexts, while simultaneously using
>> +		 * them from a second thread, let them suffer by potentially not
>> +		 * executing with the context image they just raced to apply.
>> +		 */
>> +		ret = -EBUSY;
>> +		goto out_ce;
>> +	}
>> +
>> +	state = kmalloc(ce->engine->context_size, GFP_KERNEL);
>> +	if (!state) {
>> +		ret = -ENOMEM;
>> +		goto out_ce;
>> +	}
>> +
>> +	if (copy_from_user(state, u64_to_user_ptr(user.image),
>> +			   ce->engine->context_size)) {
>> +		ret = -EFAULT;
>> +		goto out_state;
>> +	}
>> +
>> +	shmem_state = shmem_create_from_data(ce->engine->name,
>> +					     state, ce->engine->context_size);
>> +	if (IS_ERR(shmem_state)) {
>> +		ret = PTR_ERR(shmem_state);
>> +		goto out_state;
>> +	}
>> +
>> +	if (intel_context_set_own_state(ce)) {
>> +		ret = -EBUSY;
>> +		fput(shmem_state);
>> +		goto out_state;
>> +	}
>> +
>> +	ce->default_state = shmem_state;
>> +
>> +	args->size = sizeof(user);
>> +
>> +out_state:
>> +	kfree(state);
>> +out_ce:
>> +	intel_context_put(ce);
>> +	return ret;
>> +}
>> +
>>   static int ctx_setparam(struct drm_i915_file_private *fpriv,
>>   			struct i915_gem_context *ctx,
>>   			struct drm_i915_gem_context_param *args)
>> @@ -2144,6 +2235,10 @@ static int ctx_setparam(struct drm_i915_file_private *fpriv,
>>   		ret = set_persistence(ctx, args);
>>   		break;
>>   
>> +	case I915_CONTEXT_PARAM_CONTEXT_IMAGE:
>> +		ret = set_context_image(ctx, args);
>> +		break;
>> +
>>   	case I915_CONTEXT_PARAM_PROTECTED_CONTENT:
>>   	case I915_CONTEXT_PARAM_NO_ZEROMAP:
>>   	case I915_CONTEXT_PARAM_BAN_PERIOD:
>> @@ -2488,6 +2583,7 @@ int i915_gem_context_getparam_ioctl(struct drm_device *dev, void *data,
>>   	case I915_CONTEXT_PARAM_BAN_PERIOD:
>>   	case I915_CONTEXT_PARAM_ENGINES:
>>   	case I915_CONTEXT_PARAM_RINGSIZE:
>> +	case I915_CONTEXT_PARAM_CONTEXT_IMAGE:
>>   	default:
>>   		ret = -EINVAL;
>>   		break;
>> @@ -2600,5 +2696,22 @@ int __init i915_gem_context_module_init(void)
>>   	if (!slab_luts)
>>   		return -ENOMEM;
>>   
>> +	if (IS_ENABLED(CONFIG_DRM_I915_REPLAY_GPU_HANGS_API)) {
>> +		pr_notice("**************************************************************\n");
>> +		pr_notice("**     NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE     **\n");
>> +		pr_notice("**                                                          **\n");
>> +		if (i915_modparams.enable_debug_only_api)
>> +			pr_notice("** i915.enable_debug_only_api is intended to be set         **\n");
>> +		else
>> +			pr_notice("** CONFIG_DRM_I915_REPLAY_GPU_HANGS_API builds are intended **\n");
>> +		pr_notice("** for specific userspace graphics stack developers only!   **\n");
>> +		pr_notice("**                                                          **\n");
>> +		pr_notice("** If you are seeing this message please report this to the **\n");
>> +		pr_notice("** provider of your kernel build.                           **\n");
>> +		pr_notice("**                                                          **\n");
>> +		pr_notice("**     NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE     **\n");
>> +		pr_notice("**************************************************************\n");
>> +	}
>> +
>>   	return 0;
>>   }
>> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
>> index a2f1245741bb..b1b8695ba7c9 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_context.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
>> @@ -27,6 +27,8 @@ static void rcu_context_free(struct rcu_head *rcu)
>>   	struct intel_context *ce = container_of(rcu, typeof(*ce), rcu);
>>   
>>   	trace_intel_context_free(ce);
>> +	if (intel_context_has_own_state(ce))
>> +		fput(ce->default_state);
>>   	kmem_cache_free(slab_ce, ce);
>>   }
>>   
>> diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
>> index 25564c01507e..9f523999acd1 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_context.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_context.h
>> @@ -375,6 +375,28 @@ intel_context_clear_nopreempt(struct intel_context *ce)
>>   	clear_bit(CONTEXT_NOPREEMPT, &ce->flags);
>>   }
>>   
>> +#if IS_ENABLED(CONFIG_DRM_I915_REPLAY_GPU_HANGS_API)
>> +static inline bool intel_context_has_own_state(const struct intel_context *ce)
>> +{
>> +	return test_bit(CONTEXT_OWN_STATE, &ce->flags);
>> +}
>> +
>> +static inline bool intel_context_set_own_state(struct intel_context *ce)
>> +{
>> +	return test_and_set_bit(CONTEXT_OWN_STATE, &ce->flags);
>> +}
>> +#else
>> +static inline bool intel_context_has_own_state(const struct intel_context *ce)
>> +{
>> +	return false;
>> +}
>> +
>> +static inline bool intel_context_set_own_state(struct intel_context *ce)
>> +{
>> +	return true;
>> +}
>> +#endif
>> +
>>   u64 intel_context_get_total_runtime_ns(struct intel_context *ce);
>>   u64 intel_context_get_avg_runtime_ns(struct intel_context *ce);
>>   
>> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
>> index b179178680a5..d91b33c3664c 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
>> @@ -132,6 +132,7 @@ struct intel_context {
>>   #define CONTEXT_PERMA_PIN		11
>>   #define CONTEXT_IS_PARKING		12
>>   #define CONTEXT_EXITING			13
>> +#define CONTEXT_OWN_STATE		14
>>   
>>   	struct {
>>   		u64 timeout_us;
>> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
>> index d4eb822d20ae..1038659754f8 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
>> @@ -1173,7 +1173,8 @@ int lrc_alloc(struct intel_context *ce, struct intel_engine_cs *engine)
>>   
>>   	GEM_BUG_ON(ce->state);
>>   
>> -	ce->default_state = engine->default_state;
>> +	if (!intel_context_has_own_state(ce))
>> +		ce->default_state = engine->default_state;
>>   
>>   	vma = __lrc_alloc_state(ce, engine);
>>   	if (IS_ERR(vma))
>> diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
>> index 8625e88e785f..72277bc8322e 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
>> @@ -569,7 +569,8 @@ static int ring_context_alloc(struct intel_context *ce)
>>   {
>>   	struct intel_engine_cs *engine = ce->engine;
>>   
>> -	ce->default_state = engine->default_state;
>> +	if (!intel_context_has_own_state(ce))
>> +		ce->default_state = engine->default_state;
>>   
>>   	/* One ringbuffer to rule them all */
>>   	GEM_BUG_ON(!engine->legacy.ring);
>> diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
>> index de43048543e8..afd95b2b7e4b 100644
>> --- a/drivers/gpu/drm/i915/i915_params.c
>> +++ b/drivers/gpu/drm/i915/i915_params.c
>> @@ -134,6 +134,11 @@ i915_param_named_unsafe(lmem_size, uint, 0400,
>>   i915_param_named_unsafe(lmem_bar_size, uint, 0400,
>>   			"Set the lmem bar size(in MiB).");
>>   
>> +#if IS_ENABLED(CONFIG_DRM_I915_REPLAY_GPU_HANGS_API)
>> +i915_param_named(enable_debug_only_api, bool, 0400,
>> +		 "Enable support for unstable debug only userspace API. (default:false)");
>> +#endif
>> +
>>   static void _param_print_bool(struct drm_printer *p, const char *name,
>>   			      bool val)
>>   {
>> diff --git a/drivers/gpu/drm/i915/i915_params.h b/drivers/gpu/drm/i915/i915_params.h
>> index 1315d7fac850..e2cdf12ce611 100644
>> --- a/drivers/gpu/drm/i915/i915_params.h
>> +++ b/drivers/gpu/drm/i915/i915_params.h
>> @@ -64,7 +64,8 @@ struct drm_printer;
>>   	/* leave bools at the end to not create holes */ \
>>   	param(bool, enable_hangcheck, true, 0600) \
>>   	param(bool, error_capture, true, IS_ENABLED(CONFIG_DRM_I915_CAPTURE_ERROR) ? 0600 : 0) \
>> -	param(bool, enable_gvt, false, IS_ENABLED(CONFIG_DRM_I915_GVT) ? 0400 : 0)
>> +	param(bool, enable_gvt, false, IS_ENABLED(CONFIG_DRM_I915_GVT) ? 0400 : 0) \
>> +	param(bool, enable_debug_only_api, false, IS_ENABLED(CONFIG_DRM_I915_REPLAY_GPU_HANGS_API) ? 0400 : 0)
>>   
>>   #define MEMBER(T, member, ...) T member;
>>   struct i915_params {
>> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>> index 2ee338860b7e..e194d17c3568 100644
>> --- a/include/uapi/drm/i915_drm.h
>> +++ b/include/uapi/drm/i915_drm.h
>> @@ -2154,6 +2154,15 @@ struct drm_i915_gem_context_param {
>>   	__u64 value;
>>   };
>>   
>> +/*
>> + * I915_CONTEXT_PARAM_CONTEXT_IMAGE:
>> + *
>> + * Allows userspace to provide own context images.
>> + *
>> + * Note that this is a debug API not available on production kernel builds.
>> + */
>> +#define I915_CONTEXT_PARAM_CONTEXT_IMAGE	0xe
>> +
>>   /*
>>    * Context SSEU programming
>>    *
>> @@ -2549,6 +2558,24 @@ struct i915_context_param_engines {
>>   	struct i915_engine_class_instance engines[N__]; \
>>   } __attribute__((packed)) name__
>>   
>> +struct i915_gem_context_param_context_image {
>> +	/** @engine: Engine class & instance to be configured. */
>> +	struct i915_engine_class_instance engine;
>> +
>> +	/** @flags: One of the supported flags or zero. */
>> +	__u32 flags;
>> +#define I915_CONTEXT_IMAGE_FLAG_ENGINE_INDEX (1u << 0)
>> +
>> +	/** @size: Size of the image blob pointed to by @image. */
>> +	__u32 size;
>> +
>> +	/** @mbz: Must be zero. */
>> +	__u32 mbz;
>> +
>> +	/** @image: Userspace memory containing the context image. */
>> +	__u64 image;
>> +} __attribute__((packed));
>> +
>>   /**
>>    * struct drm_i915_gem_context_create_ext_setparam - Context parameter
>>    * to set or query during context creation.
>> -- 
>> 2.40.1
>>
