Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 718512C8404
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 13:20:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F8726E48E;
	Mon, 30 Nov 2020 12:20:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 120B76E48C;
 Mon, 30 Nov 2020 12:20:26 +0000 (UTC)
IronPort-SDR: yYx6dVbEuka7k1B/Drrl6bqakKAIjsa8zJekKe1Mn9vjq/ezfSHJbPFP4dkXrmL51+gcc0RNFR
 7gPDJWJmclyg==
X-IronPort-AV: E=McAfee;i="6000,8403,9820"; a="159677082"
X-IronPort-AV: E=Sophos;i="5.78,381,1599548400"; d="scan'208";a="159677082"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 04:20:25 -0800
IronPort-SDR: NG91eec7ch1hC+h9mP0iRd2bAbZGpj4DVHfJSuSWOFSH9aM4iZTOt0/yzfdWd/H019fUpzkvta
 u77XETT2C6yA==
X-IronPort-AV: E=Sophos;i="5.78,381,1599548400"; d="scan'208";a="549076858"
Received: from cshanno1-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.44.44])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 04:20:22 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [RFC PATCH 131/162] drm/i915/dg1: Add enable_eviction modparam
In-Reply-To: <20201127120718.454037-132-matthew.auld@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20201127120718.454037-1-matthew.auld@intel.com>
 <20201127120718.454037-132-matthew.auld@intel.com>
Date: Mon, 30 Nov 2020 14:20:19 +0200
Message-ID: <87v9dnjat8.fsf@intel.com>
MIME-Version: 1.0
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
Cc: CQ Tang <cq.tang@intel.com>, Sudeep Dutt <sudeep.dutt@intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 27 Nov 2020, Matthew Auld <matthew.auld@intel.com> wrote:
> From: CQ Tang <cq.tang@intel.com>
>
> enable_eviction is used to tune if eviction is enabled (default) or not.
>
> Signed-off-by: Sudeep Dutt <sudeep.dutt@intel.com>
> Signed-off-by: CQ Tang <cq.tang@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_object.c | 1 +
>  drivers/gpu/drm/i915/gem/i915_gem_region.c | 5 +++++
>  drivers/gpu/drm/i915/i915_params.c         | 3 +++
>  drivers/gpu/drm/i915/i915_params.h         | 1 +
>  drivers/gpu/drm/i915/intel_memory_region.c | 2 +-
>  5 files changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> index 7cb5f137522f..46d0f8731db0 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> @@ -293,6 +293,7 @@ static void i915_gem_free_object(struct drm_gem_object *gem_obj)
>  	 * If object had been swapped out, free the hidden object.
>  	 */
>  	if (obj->swapto) {
> +		GEM_BUG_ON(!i915->params.enable_eviction);
>  		i915_gem_object_put(obj->swapto);
>  		obj->swapto = NULL;
>  	}
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_region.c b/drivers/gpu/drm/i915/gem/i915_gem_region.c
> index a437538cd872..e1793c5f8d8c 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_region.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_region.c
> @@ -21,6 +21,7 @@ i915_gem_object_swapout_pages(struct drm_i915_gem_object *obj,
>  	GEM_BUG_ON(i915_gem_object_has_pages(obj));
>  	GEM_BUG_ON(obj->mm.madv != I915_MADV_WILLNEED);
>  	GEM_BUG_ON(obj->mm.region->type != INTEL_MEMORY_LOCAL);
> +	GEM_BUG_ON(!i915->params.enable_eviction);
>  
>  	assert_object_held(obj);
>  
> @@ -70,6 +71,7 @@ static int
>  i915_gem_object_swapin_pages(struct drm_i915_gem_object *obj,
>  			     struct sg_table *pages, unsigned int sizes)
>  {
> +	struct drm_i915_private *i915 = to_i915(obj->base.dev);
>  	struct drm_i915_gem_object *dst, *src;
>  	int err;
>  
> @@ -77,6 +79,7 @@ i915_gem_object_swapin_pages(struct drm_i915_gem_object *obj,
>  	GEM_BUG_ON(i915_gem_object_has_pages(obj));
>  	GEM_BUG_ON(obj->mm.madv != I915_MADV_WILLNEED);
>  	GEM_BUG_ON(obj->mm.region->type != INTEL_MEMORY_LOCAL);
> +	GEM_BUG_ON(!i915->params.enable_eviction);
>  
>  	assert_object_held(obj);
>  
> @@ -146,6 +149,7 @@ i915_gem_object_put_pages_buddy(struct drm_i915_gem_object *obj,
>  int
>  i915_gem_object_get_pages_buddy(struct drm_i915_gem_object *obj)
>  {
> +	struct drm_i915_private *i915 = to_i915(obj->base.dev);
>  	struct intel_memory_region *mem = obj->mm.region;
>  	struct list_head *blocks = &obj->mm.blocks;
>  	resource_size_t size = obj->base.size;
> @@ -222,6 +226,7 @@ i915_gem_object_get_pages_buddy(struct drm_i915_gem_object *obj)
>  	/* if we saved the page contents, swap them in */
>  	if (obj->swapto) {
>  		GEM_BUG_ON(i915_gem_object_is_volatile(obj));
> +		GEM_BUG_ON(!i915->params.enable_eviction);
>  
>  		ret = i915_gem_object_swapin_pages(obj, st,
>  						   sg_page_sizes);
> diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
> index 7f139ea4a90b..bb1ebb6ece95 100644
> --- a/drivers/gpu/drm/i915/i915_params.c
> +++ b/drivers/gpu/drm/i915/i915_params.c
> @@ -197,6 +197,9 @@ i915_param_named_unsafe(fake_lmem_start, ulong, 0400,
>  	"Fake LMEM start offset (default: 0)");
>  #endif
>  
> +i915_param_named_unsafe(enable_eviction, bool, 0600,
> +	"Enable memcpy based eviction which does not rely on DMA resv refactoring)");

Does the module parameter actually need to be writable? Should be
modified via debugfs as a device specific parameter?

BR,
Jani.

> +
>  static __always_inline void _print_param(struct drm_printer *p,
>  					 const char *name,
>  					 const char *type,
> diff --git a/drivers/gpu/drm/i915/i915_params.h b/drivers/gpu/drm/i915/i915_params.h
> index 330c03e2b4f7..87df407d9afb 100644
> --- a/drivers/gpu/drm/i915/i915_params.h
> +++ b/drivers/gpu/drm/i915/i915_params.h
> @@ -72,6 +72,7 @@ struct drm_printer;
>  	param(char *, force_probe, CONFIG_DRM_I915_FORCE_PROBE, 0400) \
>  	param(unsigned long, fake_lmem_start, 0, 0400) \
>  	/* leave bools at the end to not create holes */ \
> +	param(bool, enable_eviction, true, 0600) \
>  	param(bool, enable_hangcheck, true, 0600) \
>  	param(bool, load_detect_test, false, 0600) \
>  	param(bool, force_reset_modeset_test, false, 0600) \
> diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
> index afcd6fe6eaff..57f01ef16628 100644
> --- a/drivers/gpu/drm/i915/intel_memory_region.c
> +++ b/drivers/gpu/drm/i915/intel_memory_region.c
> @@ -175,7 +175,7 @@ static int intel_memory_region_evict(struct intel_memory_region *mem,
>  	list_splice_tail(&still_in_list, *phase);
>  	mutex_unlock(&mem->objects.lock);
>  
> -	if (found < target) {
> +	if (found < target && i915->params.enable_eviction) {
>  		pass++;
>  		phase++;
>  		if (*phase)

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
