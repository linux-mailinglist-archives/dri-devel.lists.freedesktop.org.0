Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4447340710A
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 20:42:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 477CA6EA67;
	Fri, 10 Sep 2021 18:42:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB7C6EA67;
 Fri, 10 Sep 2021 18:42:03 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10103"; a="220817877"
X-IronPort-AV: E=Sophos;i="5.85,283,1624345200"; d="scan'208";a="220817877"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2021 11:41:58 -0700
X-IronPort-AV: E=Sophos;i="5.85,283,1624345200"; d="scan'208";a="467282082"
Received: from bwparris-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.255.36.148])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2021 11:41:58 -0700
Date: Fri, 10 Sep 2021 14:41:56 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: [Intel-gfx] [PATCH v9 16/17] drm/i915/pxp: add PXP documentation
Message-ID: <YTum9P19k5HeElxn@intel.com>
References: <20210910153627.1060858-1-daniele.ceraolospurio@intel.com>
 <20210910153627.1060858-17-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210910153627.1060858-17-daniele.ceraolospurio@intel.com>
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

On Fri, Sep 10, 2021 at 08:36:26AM -0700, Daniele Ceraolo Spurio wrote:
> Now that all the pieces are in place we can add a description of how the
> feature works. Also modify the comments in struct intel_pxp into
> kerneldoc.
> 
> v2: improve doc (Rodrigo)
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  Documentation/gpu/i915.rst                 |  8 ++++
>  drivers/gpu/drm/i915/pxp/intel_pxp.c       | 28 +++++++++++++
>  drivers/gpu/drm/i915/pxp/intel_pxp_types.h | 47 ++++++++++++++++------
>  3 files changed, 71 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
> index 101dde3eb1ea..78ecb9d5ec20 100644
> --- a/Documentation/gpu/i915.rst
> +++ b/Documentation/gpu/i915.rst
> @@ -471,6 +471,14 @@ Object Tiling IOCTLs
>  .. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_tiling.c
>     :doc: buffer object tiling
>  
> +Protected Objects
> +-----------------
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/pxp/intel_pxp.c
> +   :doc: PXP
> +
> +.. kernel-doc:: drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> +
>  Microcontrollers
>  ================
>  
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> index 97c6368fddc3..5610634f8929 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
> @@ -11,6 +11,34 @@
>  #include "gt/intel_context.h"
>  #include "i915_drv.h"
>  
> +/**
> + * DOC: PXP
> + *
> + * PXP (Protected Xe Path) is a feature available in Gen12 and newer platforms.
> + * It allows execution and flip to display of protected (i.e. encrypted)
> + * objects. The SW support is enabled via the CONFIG_DRM_I915_PXP kconfig.
> + *
> + * Objects can opt-in to PXP encryption at creation time via the
> + * I915_GEM_CREATE_EXT_PROTECTED_CONTENT create_ext flag. For objects to be
> + * correctly protected they must be used in conjunction with a context created
> + * with the I915_CONTEXT_PARAM_PROTECTED_CONTENT flag. See the documentation
> + * of those two uapi flags for details and restrictions.
> + *
> + * Protected objects are tied to a pxp session; currently we only support one
> + * session, which i915 manages and whose index is available in the uapi
> + * (I915_PROTECTED_CONTENT_DEFAULT_SESSION) for use in instructions targeting
> + * protected objects.
> + * The session is invalidated by the HW when certain events occur (e.g.
> + * suspend/resume). When this happens, all the objects that were used with the
> + * session are marked as invalid and all contexts marked as using protected
> + * content are banned. Any further attempt at using them in an execbuf call is
> + * rejected, while flips are converted to black frames.
> + *
> + * Some of the PXP setup operations are performed by the Management Engine,
> + * which is handled by the mei driver; communication between i915 and mei is
> + * performed via the mei_pxp component module.
> + */
> +
>  /* KCR register definitions */
>  #define KCR_INIT _MMIO(0x320f0)
>  
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> index ae24064bb57e..73ef7d1754e1 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
> @@ -16,42 +16,65 @@
>  struct intel_context;
>  struct i915_pxp_component;
>  
> +/**
> + * struct intel_pxp - pxp state
> + */
>  struct intel_pxp {
> +	/**
> +	 * @pxp_component: i915_pxp_component struct of the bound mei_pxp
> +	 * module. Only set and cleared inside component bind/unbind functions,
> +	 * which are protected by &tee_mutex.
> +	 */
>  	struct i915_pxp_component *pxp_component;
> +	/**
> +	 * @pxp_component_added: track if the pxp component has been added.
> +	 * Set and cleared in tee init and fini functions respectively.
> +	 */
>  	bool pxp_component_added;
>  
> +	/** @ce: kernel-owned context used for PXP operations */
>  	struct intel_context *ce;
>  
> -	/*
> +	/** @arb_mutex: protects arb session start */
> +	struct mutex arb_mutex;
> +	/**
> +	 * @arb_is_valid: tracks arb session status.
>  	 * After a teardown, the arb session can still be in play on the HW
>  	 * even if the keys are gone, so we can't rely on the HW state of the
>  	 * session to know if it's valid and need to track the status in SW.
>  	 */
> -	struct mutex arb_mutex; /* protects arb session start */
>  	bool arb_is_valid;
>  
> -	/*
> -	 * Keep track of which key instance we're on, so we can use it to
> -	 * determine if an object was created using the current key or a
> +	/**
> +	 * @key_instance: tracks which key instance we're on, so we can use it
> +	 * to determine if an object was created using the current key or a
>  	 * previous one.
>  	 */
>  	u32 key_instance;
>  
> -	struct mutex tee_mutex; /* protects the tee channel binding */
> +	/** @tee_mutex: protects the tee channel binding and messaging. */
> +	struct mutex tee_mutex;
>  
> -	/*
> -	 * If the HW perceives an attack on the integrity of the encryption it
> -	 * will invalidate the keys and expect SW to re-initialize the session.
> -	 * We keep track of this state to make sure we only re-start the arb
> -	 * session when required.
> +	/**
> +	 * @hw_state_invalidated: if the HW perceives an attack on the integrity
> +	 * of the encryption it will invalidate the keys and expect SW to
> +	 * re-initialize the session. We keep track of this state to make sure
> +	 * we only re-start the arb session when required.
>  	 */
>  	bool hw_state_invalidated;
>  
> +	/** @irq_enabled: tracks the status of the kcr irqs */
>  	bool irq_enabled;
> +	/**
> +	 * @termination: tracks the status of a pending termination. Only
> +	 * re-initialized under gt->irq_lock and completed in &session_work.
> +	 */
>  	struct completion termination;
>  
> +	/** @session_work: worker that manages session events. */
>  	struct work_struct session_work;
> -	u32 session_events; /* protected with gt->irq_lock */
> +	/** @session_events: pending session events, protected with gt->irq_lock. */
> +	u32 session_events;
>  #define PXP_TERMINATION_REQUEST  BIT(0)
>  #define PXP_TERMINATION_COMPLETE BIT(1)
>  #define PXP_INVAL_REQUIRED       BIT(2)
> -- 
> 2.25.1
> 
