Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7E272331B
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 00:22:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B8BE10E0BB;
	Mon,  5 Jun 2023 22:22:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6BBC10E0BB;
 Mon,  5 Jun 2023 22:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686003768; x=1717539768;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mKiEKLtE15kF1im0La5gEPWC/apVRa0ZlFLWSHu4EsI=;
 b=AFCoBLuKnBZLHLNRHufUqF5ytusHcSmszETv0eNkzzv2xzRLtlrwJdbb
 AZ4YL0daRFwovJHdQd4i+Cztlmpq4RuJ4mr0evXlPrj7BvKfJzncteuu5
 +WYnB3eC+PkhlWNkTax6l0m9QeFHaCSLNRxpNQJt77Hx50v26VCkXDCHE
 bnNuJrGzv4hduYOFvz5t8GmtGG0yNgpUOck9RPFMoYVjqLk4/cE4fpanP
 bqSIWZtVidSepbRgEErPeI2TpP9l86Emaw5/PXywktwzIefuP2oisp5YB
 IjJhRpxTJADbVQWV8kqoWaKER8XX/3pH5CxyZ/g1qtC7NySzGMILEsc3k w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="341135517"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; d="scan'208";a="341135517"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 15:22:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="821339764"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; d="scan'208";a="821339764"
Received: from twgeistx-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.42.176])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 15:22:46 -0700
Date: Tue, 6 Jun 2023 00:22:41 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Implement fdinfo memory stats
 printing
Message-ID: <ZH5gMSkMrUiXhuTL@ashyti-mobl2.lan>
References: <20230605143720.435046-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230605143720.435046-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tvrtko,

On Mon, Jun 05, 2023 at 03:37:20PM +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Use the newly added drm_print_memory_stats helper to show memory
> utilisation of our objects in drm/driver specific fdinfo output.
> 
> To collect the stats we walk the per memory regions object lists
> and accumulate object size into the respective drm_memory_stats
> categories.
> 
> Objects with multiple possible placements are reported in multiple
> regions for total and shared sizes, while other categories are
> counted only for the currently active region.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Rob Clark <robdclark@gmail.com>
> ---
>  drivers/gpu/drm/i915/i915_drm_client.c | 66 ++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
> index 2a44b3876cb5..2a40f763f8f6 100644
> --- a/drivers/gpu/drm/i915/i915_drm_client.c
> +++ b/drivers/gpu/drm/i915/i915_drm_client.c
> @@ -41,6 +41,70 @@ void __i915_drm_client_free(struct kref *kref)
>  }
>  
>  #ifdef CONFIG_PROC_FS
> +static void
> +add_obj_meminfo(struct drm_i915_gem_object *obj,
> +		struct intel_memory_region *mr,
> +		struct drm_memory_stats stats[INTEL_REGION_UNKNOWN])
> +{
> +	u64 sz = obj->base.size;
> +	enum intel_region_id id;
> +	unsigned int i;
> +
> +	id = mr->id;
> +	if (obj->base.handle_count > 1)
> +		stats[id].shared += sz;
> +	else
> +		stats[id].private += sz;
> +
> +	if (i915_gem_object_has_pages(obj)) {
> +		stats[id].resident += sz;
> +
> +		if (!dma_resv_test_signaled(obj->base.resv,
> +					    dma_resv_usage_rw(true)))
> +			stats[id].active += sz;
> +		else if (i915_gem_object_is_shrinkable(obj) &&
> +			 obj->mm.madv == I915_MADV_DONTNEED)
> +			stats[id].purgeable += sz;

this is a bit off... otherwise:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi

> +	}
> +
> +	/* Attribute size and shared to all possible object memory regions. */
> +	for (i = 0; i < obj->mm.n_placements; i++) {
> +		if (obj->mm.placements[i] == mr)
> +			continue;
> +
> +		id = obj->mm.placements[i]->id;
> +		if (obj->base.handle_count > 1)
> +			stats[id].shared += sz;
> +		else
> +			stats[id].private += sz;
> +	}
> +}
> +
> +static void show_meminfo(struct drm_printer *p, struct drm_file *file)
> +{
> +	struct drm_i915_file_private *file_priv = file->driver_priv;
> +	struct drm_memory_stats stats[INTEL_REGION_UNKNOWN] = {};
> +	struct drm_i915_private *i915 = file_priv->i915;
> +	struct intel_memory_region *mr;
> +	unsigned int id;
> +
> +	for_each_memory_region(mr, i915, id) {
> +		struct drm_i915_gem_object *obj;
> +
> +		mutex_lock(&mr->objects.lock);
> +		list_for_each_entry(obj, &mr->objects.list, mm.region_link)
> +			add_obj_meminfo(obj, mr, stats);
> +		mutex_unlock(&mr->objects.lock);
> +	}
> +
> +	for_each_memory_region(mr, i915, id)
> +		drm_print_memory_stats(p,
> +				       &stats[id],
> +				       DRM_GEM_OBJECT_RESIDENT |
> +				       DRM_GEM_OBJECT_PURGEABLE,
> +				       mr->name);
> +}
> +
>  static const char * const uabi_class_names[] = {
>  	[I915_ENGINE_CLASS_RENDER] = "render",
>  	[I915_ENGINE_CLASS_COPY] = "copy",
> @@ -102,6 +166,8 @@ void i915_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file)
>  	 * ******************************************************************
>  	 */
>  
> +	show_meminfo(p, file);
> +
>  	if (GRAPHICS_VER(i915) < 8)
>  		return;
>  
> -- 
> 2.39.2
