Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C16B23FDEF5
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 17:47:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95AAA89A8B;
	Wed,  1 Sep 2021 15:47:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 742C489A8B;
 Wed,  1 Sep 2021 15:47:32 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10094"; a="206012511"
X-IronPort-AV: E=Sophos;i="5.84,369,1620716400"; d="scan'208";a="206012511"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2021 08:47:31 -0700
X-IronPort-AV: E=Sophos;i="5.84,369,1620716400"; d="scan'208";a="541865816"
Received: from frodasgo-mobl3.amr.corp.intel.com (HELO intel.com)
 ([10.255.39.35])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2021 08:47:30 -0700
Date: Wed, 1 Sep 2021 11:47:28 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 "Vetter, Daniel" <daniel.vetter@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>,
 Daniel Vetter <daniel.vetter@intel.com>,
 "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
Subject: Re: [Intel-gfx] [PATCH v7 10/17] drm/i915/pxp: interfaces for using
 protected objects
Message-ID: <YS+gkOgCB4ZQv5ho@intel.com>
References: <20210828012738.317661-1-daniele.ceraolospurio@intel.com>
 <20210828012738.317661-11-daniele.ceraolospurio@intel.com>
 <YS6fdOrnQ0JyoYi3@intel.com>
 <17361a26-3516-64df-0e47-3e1e025cef1e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17361a26-3516-64df-0e47-3e1e025cef1e@intel.com>
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

On Tue, Aug 31, 2021 at 03:01:51PM -0700, Daniele Ceraolo Spurio wrote:
> <snip>
> 
> > > +}
> > > +
> > > +void intel_pxp_invalidate(struct intel_pxp *pxp)
> > > +{
> > > +	struct drm_i915_private *i915 = pxp_to_gt(pxp)->i915;
> > > +	struct i915_gem_context *ctx, *cn;
> > > +
> > > +	/* ban all contexts marked as protected */
> > > +	spin_lock_irq(&i915->gem.contexts.lock);
> > > +	list_for_each_entry_safe(ctx, cn, &i915->gem.contexts.list, link) {
> > > +		struct i915_gem_engines_iter it;
> > > +		struct intel_context *ce;
> > > +
> > > +		if (!kref_get_unless_zero(&ctx->ref))
> > > +			continue;
> > > +
> > > +		if (likely(!i915_gem_context_uses_protected_content(ctx))) {
> > > +			i915_gem_context_put(ctx);
> > > +			continue;
> > > +		}
> > > +
> > > +		spin_unlock_irq(&i915->gem.contexts.lock);
> > > +
> > > +		/*
> > > +		 * By the time we get here, the HW keys are already long gone,
> > > +		 * so any batch using them that's already on the engines is very
> > > +		 * likely a lost cause (and it has probably already hung the
> > > +		 * engine). Therefore, we skip attempting to pull the running
> > > +		 * context out of the HW and we prioritize bringing the session
> > > +		 * back as soon as possible.
> > > +		 * For each context we ban we increase the ctx->guilty_count, so
> > > +		 * that userspace can see that all the intel contexts have been
> > > +		 * banned (on a non-recoverable gem context, guilty intel
> > > +		 * contexts are banned immediately on reset, so we report the
> > > +		 * same way here).
> > hmm... but guilty specifically means that they indeed caused the GPU hang.
> > does the umd really need this indication? any other way of doing this?
> 
> The request from Daniel was to re-use the existing interface and AFAICT the
> guilty_count is the only one we have for this. The alternative would be to
> add a new flag (like I had in the previous version of this patch), but that
> was shot down already. Lionel can probably comment more on the UMD
> requirements for this since it was a request from the mesa side.

Daniel and Lionel, could you please comment here?
Are we really expanding the guilty from the hang meaning?
Is it really better than creating the new flag?

> 
> 
> > > +		 */
> > > +		for_each_gem_engine(ce, i915_gem_context_lock_engines(ctx), it)
> > > +			if (!intel_context_ban(ce, NULL))
> > > +				atomic_inc(&ctx->guilty_count);
> > > +		i915_gem_context_unlock_engines(ctx);
> > > +
> > > +		/*
> > > +		 * The context has been killed, no need to keep the wakeref.
> > > +		 * This is safe from races because the only other place this
> > > +		 * is touched is context_close and we're holding a ctx ref
> > > +		 */
> > The comments make sense, but maybe we should avoid the optimization here,
> > but maybe we should avoid the optimization and just keep it locked?
> 
> The lock released above the comment and the one taken after the pm_put are
> different ones, so even if we don't release the wakeref here we still need
> to do the same locking steps. Or did you mean something different with
> keeping it locked?

oh, please ignore me here. I thought it was the same locking...

> 
> Thanks,
> Daniele
> 
> > 
> > > +		if (ctx->pxp_wakeref) {
> > > +			intel_runtime_pm_put(&i915->runtime_pm,
> > > +					     ctx->pxp_wakeref);
> > > +			ctx->pxp_wakeref = 0;
> > > +		}
> > > +
> > > +		spin_lock_irq(&i915->gem.contexts.lock);
> > > +		list_safe_reset_next(ctx, cn, link);
> > > +		i915_gem_context_put(ctx);
> > > +	}
> > > +	spin_unlock_irq(&i915->gem.contexts.lock);
> > > +}
> > > +
> > > diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.h b/drivers/gpu/drm/i915/pxp/intel_pxp.h
> > > index 8f1e86caa53f..f942bdd2af0c 100644
> > > --- a/drivers/gpu/drm/i915/pxp/intel_pxp.h
> > > +++ b/drivers/gpu/drm/i915/pxp/intel_pxp.h
> > > @@ -9,6 +9,8 @@
> > >   #include "gt/intel_gt_types.h"
> > >   #include "intel_pxp_types.h"
> > > +struct drm_i915_gem_object;
> > > +
> > >   static inline struct intel_gt *pxp_to_gt(const struct intel_pxp *pxp)
> > >   {
> > >   	return container_of(pxp, struct intel_gt, pxp);
> > > @@ -33,6 +35,10 @@ void intel_pxp_fini_hw(struct intel_pxp *pxp);
> > >   void intel_pxp_mark_termination_in_progress(struct intel_pxp *pxp);
> > >   int intel_pxp_wait_for_arb_start(struct intel_pxp *pxp);
> > > +
> > > +int intel_pxp_key_check(struct intel_pxp *pxp, struct drm_i915_gem_object *obj);
> > > +
> > > +void intel_pxp_invalidate(struct intel_pxp *pxp);
> > >   #else
> > >   static inline void intel_pxp_init(struct intel_pxp *pxp)
> > >   {
> > > @@ -46,6 +52,12 @@ static inline int intel_pxp_wait_for_arb_start(struct intel_pxp *pxp)
> > >   {
> > >   	return -ENODEV;
> > >   }
> > > +
> > > +static inline int intel_pxp_key_check(struct intel_pxp *pxp,
> > > +				      struct drm_i915_gem_object *obj)
> > > +{
> > > +	return -ENODEV;
> > > +}
> > >   #endif
> > >   #endif /* __INTEL_PXP_H__ */
> > > diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> > > index 67c30e534d50..c6a5e4197e40 100644
> > > --- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> > > +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> > > @@ -72,6 +72,9 @@ static int pxp_create_arb_session(struct intel_pxp *pxp)
> > >   		return ret;
> > >   	}
> > > +	if (!++pxp->key_instance)
> > > +		++pxp->key_instance;
> > > +
> > >   	pxp->arb_is_valid = true;
> > >   	return 0;
> > > @@ -85,6 +88,9 @@ static int pxp_terminate_arb_session_and_global(struct intel_pxp *pxp)
> > >   	/* must mark termination in progress calling this function */
> > >   	GEM_WARN_ON(pxp->arb_is_valid);
> > > +	/* invalidate protected objects */
> > > +	intel_pxp_invalidate(pxp);
> > > +
> > >   	/* terminate the hw sessions */
> > >   	ret = intel_pxp_terminate_session(pxp, ARB_SESSION);
> > >   	if (ret) {
> > > diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> > > index 5a170e43c959..c394ab2e452b 100644
> > > --- a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> > > +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> > > @@ -7,7 +7,9 @@
> > >   #define __INTEL_PXP_TYPES_H__
> > >   #include <linux/completion.h>
> > > +#include <linux/list.h>
> > >   #include <linux/mutex.h>
> > > +#include <linux/spinlock.h>
> > >   #include <linux/types.h>
> > >   #include <linux/workqueue.h>
> > > @@ -27,6 +29,13 @@ struct intel_pxp {
> > >   	 */
> > >   	bool arb_is_valid;
> > > +	/*
> > > +	 * Keep track of which key instance we're on, so we can use it to
> > > +	 * determine if an object was created using the current key or a
> > > +	 * previous one.
> > > +	 */
> > > +	u32 key_instance;
> > > +
> > >   	struct mutex tee_mutex; /* protects the tee channel binding */
> > >   	/*
> > > diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> > > index 920e9e852e5a..9ff77732428b 100644
> > > --- a/include/uapi/drm/i915_drm.h
> > > +++ b/include/uapi/drm/i915_drm.h
> > > @@ -1846,12 +1846,36 @@ struct drm_i915_gem_context_param {
> > >    * attempted to use it, never re-use this context param number.
> > >    */
> > >   #define I915_CONTEXT_PARAM_RINGSIZE	0xc
> > > +
> > > +/*
> > > + * I915_CONTEXT_PARAM_PROTECTED_CONTENT:
> > > + *
> > > + * Mark that the context makes use of protected content, which will result
> > > + * in the context being invalidated when the protected content session is. The
> > > + * invalidation is reported back to userspace by banning all the engine contexts
> > > + * within the gem context and increasing the guilty_count to match; this will
> > > + * be reported in the RESET_STATS ioctl the same way as if the bans were due to
> > > + * hangs. Given that the protected content session is killed on suspend, the
> > > + * device is kept awake for the lifetime of a protected context, so the user
> > > + * should make sure to dispose of them once done.
> > > + * This flag can only be set at context creation time and, when set to true,
> > > + * must be preceded by an explicit setting of I915_CONTEXT_PARAM_RECOVERABLE
> > > + * to false. This flag can't be set to true in conjunction with setting the
> > > + * I915_CONTEXT_PARAM_BANNABLE flag to false.
> > > + *
> > > + * In addition to the normal failure cases, setting this flag during context
> > > + * creation can result in the following errors:
> > > + *
> > > + * -ENODEV: feature not available
> > > + * -EPERM: trying to mark a recoverable or not bannable context as protected
> > > + */
> > > +#define I915_CONTEXT_PARAM_PROTECTED_CONTENT    0xd
> > >   /* Must be kept compact -- no holes and well documented */
> > >   	__u64 value;
> > >   };
> > > -/*
> > > +/**
> > >    * Context SSEU programming
> > >    *
> > >    * It may be necessary for either functional or performance reason to configure
> > > @@ -2979,8 +3003,12 @@ struct drm_i915_gem_create_ext {
> > >   	 *
> > >   	 * For I915_GEM_CREATE_EXT_MEMORY_REGIONS usage see
> > >   	 * struct drm_i915_gem_create_ext_memory_regions.
> > > +	 *
> > > +	 * For I915_GEM_CREATE_EXT_PROTECTED_CONTENT usage see
> > > +	 * struct drm_i915_gem_create_ext_protected_content.
> > >   	 */
> > >   #define I915_GEM_CREATE_EXT_MEMORY_REGIONS 0
> > > +#define I915_GEM_CREATE_EXT_PROTECTED_CONTENT 1
> > >   	__u64 extensions;
> > >   };
> > > @@ -3038,6 +3066,31 @@ struct drm_i915_gem_create_ext_memory_regions {
> > >   	__u64 regions;
> > >   };
> > > +/**
> > > + * struct drm_i915_gem_create_ext_protected_content - The
> > > + * I915_OBJECT_PARAM_PROTECTED_CONTENT extension.
> > > + *
> > > + * If this extension is provided, buffer contents are expected to be protected
> > > + * by PXP encryption and require decryption for scan out and processing. This
> > > + * is only possible on platforms that have PXP enabled, on all other scenarios
> > > + * using this extension will cause the ioctl to fail and return -ENODEV. The
> > > + * flags parameter is reserved for future expansion and must currently be set
> > > + * to zero.
> > > + *
> > > + * The buffer contents are considered invalid after a PXP session teardown.
> > > + *
> > > + * The encryption is guaranteed to be processed correctly only if the object
> > > + * is submitted with a context created using the
> > > + * I915_CONTEXT_PARAM_PROTECTED_CONTENT flag. This will also enable extra checks
> > > + * at submission time on the validity of the objects involved.
> > > + */
> > > +struct drm_i915_gem_create_ext_protected_content {
> > > +	/** @base: Extension link. See struct i915_user_extension. */
> > > +	struct i915_user_extension base;
> > > +	/** @flags: reserved for future usage, currently MBZ */
> > > +	__u32 flags;
> > > +};
> > > +
> > >   /* ID of the protected content session managed by i915 when PXP is active */
> > >   #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
> > > -- 
> > > 2.25.1
> > > 
> 
