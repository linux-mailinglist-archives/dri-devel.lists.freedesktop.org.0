Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD8785BF16
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 15:48:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35E8010E498;
	Tue, 20 Feb 2024 14:48:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fa21UNJq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 819DD10E498;
 Tue, 20 Feb 2024 14:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708440515; x=1739976515;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=meXKs4nthnLwRqIeR9ozUCdxnOa2stibML1LIR1Xa/w=;
 b=Fa21UNJq73dC/5P5Tt4sCsAqoL6fmjAqm9iKZIu2h1CeofVbetSPejJs
 Q6GQl6x4CAsFAiwwxLfuO7bBaQvsiXLpNSEKCBRqCpiJWsSAFXhPm49XO
 jebBy9aJLBXDBUEv8+QBf81lUsuDd0RhswIc6Px0S+U9vkyyP5rrZY9b1
 GEElMR2qZfsujDNgSdk3vAjTyFZ3Ynj57Uz6042mydSyadqIJAhSIMMWr
 2h2bGo83ujZWFSv9oUwy08rUNHiCwYtnOARTdc6AJUiWEpah8Sh4afwJR
 9fZr/qDWywsKJeKPG//+qEAotp8kc3hgUrGeWQps3nhjOB/UsY3kJjb4M A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="13252907"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; d="scan'208";a="13252907"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 06:48:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="9369243"
Received: from dunnejor-mobl2.ger.corp.intel.com (HELO [10.213.231.185])
 ([10.213.231.185])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 06:48:33 -0800
Message-ID: <af007641-9705-4259-b29c-3cb78f67fc64@linux.intel.com>
Date: Tue, 20 Feb 2024 14:48:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/i915/gt: Enable only one CCS for compute
 workload
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, stable@vger.kernel.org,
 Andi Shyti <andi.shyti@kernel.org>
References: <20240220143526.259109-1-andi.shyti@linux.intel.com>
 <20240220143526.259109-3-andi.shyti@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20240220143526.259109-3-andi.shyti@linux.intel.com>
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


On 20/02/2024 14:35, Andi Shyti wrote:
> Enable only one CCS engine by default with all the compute sices

slices

> allocated to it.
> 
> While generating the list of UABI engines to be exposed to the
> user, exclude any additional CCS engines beyond the first
> instance.
> 
> This change can be tested with igt i915_query.
> 
> Fixes: d2eae8e98d59 ("drm/i915/dg2: Drop force_probe requirement")
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: <stable@vger.kernel.org> # v6.2+
> ---
>   drivers/gpu/drm/i915/gt/intel_engine_user.c |  9 +++++++++
>   drivers/gpu/drm/i915/gt/intel_gt.c          | 11 +++++++++++
>   drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  2 ++
>   drivers/gpu/drm/i915/i915_query.c           |  1 +
>   4 files changed, 23 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> index 833987015b8b..7041acc77810 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> @@ -243,6 +243,15 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
>   		if (engine->uabi_class == I915_NO_UABI_CLASS)
>   			continue;
>   
> +		/*
> +		 * Do not list and do not count CCS engines other than the first
> +		 */
> +		if (engine->uabi_class == I915_ENGINE_CLASS_COMPUTE &&
> +		    engine->uabi_instance > 0) {
> +			i915->engine_uabi_class_count[engine->uabi_class]--;
> +			continue;
> +		}

It's a bit ugly to decrement after increment, instead of somehow 
restructuring the loop to satisfy both cases more elegantly. And I 
wonder if internally (in dmesg when engine name is logged) we don't end 
up with ccs0 ccs0 ccs0 ccs0.. for all instances.

> +
>   		rb_link_node(&engine->uabi_node, prev, p);
>   		rb_insert_color(&engine->uabi_node, &i915->uabi_engines);
>   
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index a425db5ed3a2..e19df4ef47f6 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -168,6 +168,14 @@ static void init_unused_rings(struct intel_gt *gt)
>   	}
>   }
>   
> +static void intel_gt_apply_ccs_mode(struct intel_gt *gt)
> +{
> +	if (!IS_DG2(gt->i915))
> +		return;
> +
> +	intel_uncore_write(gt->uncore, XEHP_CCS_MODE, 0);
> +}
> +
>   int intel_gt_init_hw(struct intel_gt *gt)
>   {
>   	struct drm_i915_private *i915 = gt->i915;
> @@ -195,6 +203,9 @@ int intel_gt_init_hw(struct intel_gt *gt)
>   
>   	intel_gt_init_swizzling(gt);
>   
> +	/* Configure CCS mode */
> +	intel_gt_apply_ccs_mode(gt);
> +
>   	/*
>   	 * At least 830 can leave some of the unused rings
>   	 * "active" (ie. head != tail) after resume which
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index cf709f6c05ae..c148113770ea 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -1605,6 +1605,8 @@
>   #define   GEN12_VOLTAGE_MASK			REG_GENMASK(10, 0)
>   #define   GEN12_CAGF_MASK			REG_GENMASK(19, 11)
>   
> +#define XEHP_CCS_MODE                          _MMIO(0x14804)
> +
>   #define GEN11_GT_INTR_DW(x)			_MMIO(0x190018 + ((x) * 4))
>   #define   GEN11_CSME				(31)
>   #define   GEN12_HECI_2				(30)
> diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
> index 3baa2f54a86e..d5a5143971f5 100644
> --- a/drivers/gpu/drm/i915/i915_query.c
> +++ b/drivers/gpu/drm/i915/i915_query.c
> @@ -124,6 +124,7 @@ static int query_geometry_subslices(struct drm_i915_private *i915,
>   	return fill_topology_info(sseu, query_item, sseu->geometry_subslice_mask);
>   }
>   
> +

Zap please.

>   static int
>   query_engine_info(struct drm_i915_private *i915,
>   		  struct drm_i915_query_item *query_item)

Regards,

Tvrtko
