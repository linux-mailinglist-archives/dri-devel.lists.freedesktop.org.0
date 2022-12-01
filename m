Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7509063EBDE
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 10:02:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEE4410E587;
	Thu,  1 Dec 2022 09:02:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 355A110E586;
 Thu,  1 Dec 2022 09:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669885347; x=1701421347;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6cI432eyqBnlVk/FviAg2Oanm0xAwl8VoD1MxHZDADw=;
 b=ceZnQjamFRSi2w36OAHhlt/vN8dO37g9AXwCQify38JjxZ6D+xZAv9Rp
 HRZ1UnVtBdFf4hSzI2HL7lJVHNcha1/6wyjr0IzqDxx7Y9WkzAcLc62cq
 OzN2JkMMPJlZW1nB+VDMkRLTHfXjaw1wloDPvQb5PJDoKHs3GLJaMTR/K
 UaQO3Snay9iwu/JjlytK+JIq/CuitIWj6geOnUWt09CWYKZj0KFbngoG6
 ClUwGvKy+RWdaD33xXZswmRwFT0HUnDMiUZ1iEx486FjQtjHiwMj3L647
 8n9GblVY8q3RwujVLnFb1K+mp6Kcbbnoc75PWwZ+n0ihTWtVo8/3UEZRp A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="295991219"
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; d="scan'208";a="295991219"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 01:02:26 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="818970502"
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; d="scan'208";a="818970502"
Received: from aguefor-mobl.ger.corp.intel.com (HELO [10.213.229.22])
 ([10.213.229.22])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 01:02:24 -0800
Message-ID: <6d43a21e-6699-e85f-3c5f-3855cbf5342e@linux.intel.com>
Date: Thu, 1 Dec 2022 09:02:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [Intel-gfx] [PATCH v4 5/5] Revert "drm/i915: Improve on suspend /
 resume time with VT-d enabled"
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20221130235805.221010-1-andi.shyti@linux.intel.com>
 <20221130235805.221010-6-andi.shyti@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20221130235805.221010-6-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 30/11/2022 23:58, Andi Shyti wrote:
> This reverts commit 2ef6efa79fecd5e3457b324155d35524d95f2b6b.
> 
> Checking the presence if the IRST (Intel Rapid Start Technology)
> through the ACPI to decide whether to rebuild or not the GGTT
> puts us at the mercy of the boot firmware and we need to
> unnecessarily rely on third parties.
> 
> Because now we avoid adding scratch pages to the entire GGTT we
> don't need this hack anymore.
> 
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_ggtt.c | 69 ++++++----------------------
>   drivers/gpu/drm/i915/gt/intel_gtt.h  | 24 ----------
>   drivers/gpu/drm/i915/i915_driver.c   | 16 -------
>   3 files changed, 13 insertions(+), 96 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> index fa96d925c2596..5896ac44010b0 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> @@ -27,13 +27,6 @@
>   #include "intel_gtt.h"
>   #include "gen8_ppgtt.h"
>   
> -static inline bool suspend_retains_ptes(struct i915_address_space *vm)
> -{
> -	return GRAPHICS_VER(vm->i915) >= 8 &&
> -		!HAS_LMEM(vm->i915) &&
> -		vm->is_ggtt;
> -}
> -
>   static void i915_ggtt_color_adjust(const struct drm_mm_node *node,
>   				   unsigned long color,
>   				   u64 *start,
> @@ -105,23 +98,6 @@ int i915_ggtt_init_hw(struct drm_i915_private *i915)
>   	return 0;
>   }
>   
> -/*
> - * Return the value of the last GGTT pte cast to an u64, if
> - * the system is supposed to retain ptes across resume. 0 otherwise.
> - */
> -static u64 read_last_pte(struct i915_address_space *vm)
> -{
> -	struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
> -	gen8_pte_t __iomem *ptep;
> -
> -	if (!suspend_retains_ptes(vm))
> -		return 0;
> -
> -	GEM_BUG_ON(GRAPHICS_VER(vm->i915) < 8);
> -	ptep = (typeof(ptep))ggtt->gsm + (ggtt_total_entries(ggtt) - 1);
> -	return readq(ptep);
> -}
> -
>   /**
>    * i915_ggtt_suspend_vm - Suspend the memory mappings for a GGTT or DPT VM
>    * @vm: The VM to suspend the mappings for
> @@ -185,10 +161,7 @@ void i915_ggtt_suspend_vm(struct i915_address_space *vm)
>   		i915_gem_object_unlock(obj);
>   	}
>   
> -	if (!suspend_retains_ptes(vm))
> -		vm->clear_range(vm, 0, vm->total);
> -	else
> -		i915_vm_to_ggtt(vm)->probed_pte = read_last_pte(vm);
> +	vm->clear_range(vm, 0, vm->total);
>   
>   	vm->skip_pte_rewrite = save_skip_rewrite;
>   
> @@ -545,8 +518,6 @@ static int init_ggtt(struct i915_ggtt *ggtt)
>   	struct drm_mm_node *entry;
>   	int ret;
>   
> -	ggtt->pte_lost = true;
> -
>   	/*
>   	 * GuC requires all resources that we're sharing with it to be placed in
>   	 * non-WOPCM memory. If GuC is not present or not in use we still need a
> @@ -1263,20 +1234,11 @@ bool i915_ggtt_resume_vm(struct i915_address_space *vm)
>   {
>   	struct i915_vma *vma;
>   	bool write_domain_objs = false;
> -	bool retained_ptes;
>   
>   	drm_WARN_ON(&vm->i915->drm, !vm->is_ggtt && !vm->is_dpt);
>   
> -	/*
> -	 * First fill our portion of the GTT with scratch pages if
> -	 * they were not retained across suspend.
> -	 */
> -	retained_ptes = suspend_retains_ptes(vm) &&
> -		!i915_vm_to_ggtt(vm)->pte_lost &&
> -		!GEM_WARN_ON(i915_vm_to_ggtt(vm)->probed_pte != read_last_pte(vm));
> -
> -	if (!retained_ptes)
> -		vm->clear_range(vm, 0, vm->total);
> +	/* First fill our portion of the GTT with scratch pages */
> +	vm->clear_range(vm, 0, vm->total);
>   
>   	/* clflush objects bound into the GGTT and rebind them. */
>   	list_for_each_entry(vma, &vm->bound_list, vm_link) {
> @@ -1285,16 +1247,16 @@ bool i915_ggtt_resume_vm(struct i915_address_space *vm)
>   			atomic_read(&vma->flags) & I915_VMA_BIND_MASK;
>   
>   		GEM_BUG_ON(!was_bound);
> -		if (!retained_ptes) {
> -			/*
> -			 * Clear the bound flags of the vma resource to allow
> -			 * ptes to be repopulated.
> -			 */
> -			vma->resource->bound_flags = 0;
> -			vma->ops->bind_vma(vm, NULL, vma->resource,
> -					   obj ? obj->cache_level : 0,
> -					   was_bound);
> -		}
> +
> +		/*
> +		 * Clear the bound flags of the vma resource to allow
> +		 * ptes to be repopulated.
> +		 */
> +		vma->resource->bound_flags = 0;
> +		vma->ops->bind_vma(vm, NULL, vma->resource,
> +				   obj ? obj->cache_level : 0,
> +				   was_bound);
> +
>   		if (obj) { /* only used during resume => exclusive access */
>   			write_domain_objs |= fetch_and_zero(&obj->write_domain);
>   			obj->read_domains |= I915_GEM_DOMAIN_GTT;
> @@ -1321,8 +1283,3 @@ void i915_ggtt_resume(struct i915_ggtt *ggtt)
>   
>   	intel_ggtt_restore_fences(ggtt);
>   }
> -
> -void i915_ggtt_mark_pte_lost(struct drm_i915_private *i915, bool val)
> -{
> -	to_gt(i915)->ggtt->pte_lost = val;
> -}
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
> index d1900fec6cd1f..a5a9f7640bd15 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
> @@ -355,19 +355,6 @@ struct i915_ggtt {
>   
>   	bool do_idle_maps;
>   
> -	/**
> -	 * @pte_lost: Are ptes lost on resume?
> -	 *
> -	 * Whether the system was recently restored from hibernate and
> -	 * thus may have lost pte content.
> -	 */
> -	bool pte_lost;
> -
> -	/**
> -	 * @probed_pte: Probed pte value on suspend. Re-checked on resume.
> -	 */
> -	u64 probed_pte;
> -
>   	int mtrr;
>   
>   	/** Bit 6 swizzling required for X tiling */
> @@ -604,17 +591,6 @@ bool i915_ggtt_resume_vm(struct i915_address_space *vm);
>   void i915_ggtt_suspend(struct i915_ggtt *gtt);
>   void i915_ggtt_resume(struct i915_ggtt *ggtt);
>   
> -/**
> - * i915_ggtt_mark_pte_lost - Mark ggtt ptes as lost or clear such a marking
> - * @i915 The device private.
> - * @val whether the ptes should be marked as lost.
> - *
> - * In some cases pte content is retained across suspend, but typically lost
> - * across hibernate. Typically they should be marked as lost on
> - * hibernation restore and such marking cleared on suspend.
> - */
> -void i915_ggtt_mark_pte_lost(struct drm_i915_private *i915, bool val);
> -
>   void
>   fill_page_dma(struct drm_i915_gem_object *p, const u64 val, unsigned int count);
>   
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index 4e1bb3c23c638..4cc3ced839595 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -102,9 +102,6 @@
>   #include "intel_region_ttm.h"
>   #include "vlv_suspend.h"
>   
> -/* Intel Rapid Start Technology ACPI device name */
> -static const char irst_name[] = "INT3392";
> -
>   static const struct drm_driver i915_drm_driver;
>   
>   static void i915_release_bridge_dev(struct drm_device *dev,
> @@ -1496,8 +1493,6 @@ static int i915_pm_suspend(struct device *kdev)
>   		return -ENODEV;
>   	}
>   
> -	i915_ggtt_mark_pte_lost(i915, false);
> -
>   	if (i915->drm.switch_power_state == DRM_SWITCH_POWER_OFF)
>   		return 0;
>   
> @@ -1550,14 +1545,6 @@ static int i915_pm_resume(struct device *kdev)
>   	if (i915->drm.switch_power_state == DRM_SWITCH_POWER_OFF)
>   		return 0;
>   
> -	/*
> -	 * If IRST is enabled, or if we can't detect whether it's enabled,
> -	 * then we must assume we lost the GGTT page table entries, since
> -	 * they are not retained if IRST decided to enter S4.
> -	 */
> -	if (!IS_ENABLED(CONFIG_ACPI) || acpi_dev_present(irst_name, NULL, -1))
> -		i915_ggtt_mark_pte_lost(i915, true);
> -
>   	return i915_drm_resume(&i915->drm);
>   }
>   
> @@ -1617,9 +1604,6 @@ static int i915_pm_restore_early(struct device *kdev)
>   
>   static int i915_pm_restore(struct device *kdev)
>   {
> -	struct drm_i915_private *i915 = kdev_to_i915(kdev);
> -
> -	i915_ggtt_mark_pte_lost(i915, true);
>   	return i915_pm_resume(kdev);
>   }
>   

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
