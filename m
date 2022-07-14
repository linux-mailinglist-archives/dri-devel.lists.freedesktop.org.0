Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CF3575197
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 17:20:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CEC811347A;
	Thu, 14 Jul 2022 15:20:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C18811346D;
 Thu, 14 Jul 2022 15:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657812022; x=1689348022;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=sbZhaT5tdicd4HOKbtLgjSP8ggs3tLu6dffAfZ7Zzk0=;
 b=LyPChm5BH+ib5lg/4gVRjJX4ZThdLQOtnIatkYXN76peOuQhCEyl5CKL
 AxSMy+a6/AK5uZzxYhxWA8a3Bkm90sw3XPzqIjTaY3dICBHpdG5wmbS1+
 S0OKZdr5qYa9o1hZHhA37kqquEXBjqo2ojiYW894uol7V6KlId9wG8tOH
 Y7gmwJO8hQ7I9pxY5vaFhoPTTPvtXvclp5CC2IdIkgQovWzFrFYNV8AM+
 DiWnttUoRgpVJk+TuBFPULM4/BCTAQCX2WXyXMcJtiByT1Lb6SFjWWHjs
 afTK7poU5CzMi0Qooo2PiavDSIFPFVIfeOmPtHqGmRZxx7K/axBuLw6Nx w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10408"; a="265329313"
X-IronPort-AV: E=Sophos;i="5.92,271,1650956400"; d="scan'208";a="265329313"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2022 08:20:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,271,1650956400"; d="scan'208";a="923107992"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by fmsmga005.fm.intel.com with ESMTP; 14 Jul 2022 08:20:18 -0700
Received: from [10.249.147.144] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.147.144])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 26EFKGKA026921; Thu, 14 Jul 2022 16:20:16 +0100
Message-ID: <a85f4b50-aba7-3a43-b8c3-5fed4217b0d9@intel.com>
Date: Thu, 14 Jul 2022 17:20:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH v2 16/21] drm/i915: Define GuC Based TLB invalidation
 routines
Content-Language: en-US
To: Mauro Carvalho Chehab <mchehab@kernel.org>
References: <cover.1657800199.git.mchehab@kernel.org>
 <335645ebfde73421a506d6df72e78d370805aa9c.1657800199.git.mchehab@kernel.org>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <335645ebfde73421a506d6df72e78d370805aa9c.1657800199.git.mchehab@kernel.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 David Airlie <airlied@linux.ie>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 dri-devel@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 linux-kernel@vger.kernel.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>, Borislav Petkov <bp@suse.de>,
 intel-gfx@lists.freedesktop.org,
 Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 14.07.2022 14:06, Mauro Carvalho Chehab wrote:
> From: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
> 
> Add routines to interface with GuC firmware for selective TLB invalidation
> supported on XeHP.
> 
> Signed-off-by: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v2 00/21] at: https://lore.kernel.org/all/cover.1657800199.git.mchehab@kernel.org/
> 
>  .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |  3 +
>  drivers/gpu/drm/i915/gt/uc/intel_guc.c        | 90 +++++++++++++++++++
>  drivers/gpu/drm/i915/gt/uc/intel_guc.h        | 10 +++
>  drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  3 +
>  4 files changed, 106 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
> index fb0af33e43cc..5c019856a269 100644
> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
> @@ -188,6 +188,9 @@ enum intel_guc_state_capture_event_status {
>  #define INTEL_GUC_TLB_INVAL_FLUSH_CACHE (1 << 31)
>  
>  enum intel_guc_tlb_invalidation_type {
> +	INTEL_GUC_TLB_INVAL_FULL = 0x0,
> +	INTEL_GUC_TLB_INVAL_PAGE_SELECTIVE = 0x1,
> +	INTEL_GUC_TLB_INVAL_PAGE_SELECTIVE_CTX = 0x2,
>  	INTEL_GUC_TLB_INVAL_GUC = 0x3,
>  };
>  
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> index 8a104a292598..98260a7bc90b 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> @@ -923,6 +923,96 @@ static int guc_send_invalidate_tlb(struct intel_guc *guc, u32 *action, u32 size)
>  	return err;
>  }
>  
> + /* Full TLB invalidation */
> +int intel_guc_invalidate_tlb_full(struct intel_guc *guc,
> +				  enum intel_guc_tlb_inval_mode mode)
> +{
> +	u32 action[] = {
> +		INTEL_GUC_ACTION_TLB_INVALIDATION,
> +		0,
> +		INTEL_GUC_TLB_INVAL_FULL << INTEL_GUC_TLB_INVAL_TYPE_SHIFT |
> +			mode << INTEL_GUC_TLB_INVAL_MODE_SHIFT |
> +			INTEL_GUC_TLB_INVAL_FLUSH_CACHE,
> +	};
> +
> +	if (!INTEL_GUC_SUPPORTS_TLB_INVALIDATION(guc)) {
> +		DRM_ERROR("Tlb invalidation: Operation not supported in this platform!\n");

s/Tlb/TLB

and use drm_err() or even consider GEM_BUG_ON() as this looks more like
a coding mistake if we will be here, no ?

> +		return 0;
> +	}
> +
> +	return guc_send_invalidate_tlb(guc, action, ARRAY_SIZE(action));
> +}
> +
> +/*
> + * Selective TLB Invalidation for Address Range:
> + * TLB's in the Address Range is Invalidated across all engines.
> + */
> +int intel_guc_invalidate_tlb_page_selective(struct intel_guc *guc,
> +					    enum intel_guc_tlb_inval_mode mode,
> +					    u64 start, u64 length)
> +{
> +	u64 vm_total = BIT_ULL(INTEL_INFO(guc_to_gt(guc)->i915)->ppgtt_size);
> +	u32 address_mask = (ilog2(length) - ilog2(I915_GTT_PAGE_SIZE_4K));

drop extra ( )

> +	u32 full_range = vm_total == length;

bool ?

> +	u32 action[] = {
> +		INTEL_GUC_ACTION_TLB_INVALIDATION,
> +		0,
> +		INTEL_GUC_TLB_INVAL_PAGE_SELECTIVE << INTEL_GUC_TLB_INVAL_TYPE_SHIFT |
> +			mode << INTEL_GUC_TLB_INVAL_MODE_SHIFT |
> +			INTEL_GUC_TLB_INVAL_FLUSH_CACHE,
> +		0,
> +		full_range ? full_range : lower_32_bits(start),
> +		full_range ? 0 : upper_32_bits(start),
> +		full_range ? 0 : address_mask,
> +	};
> +
> +	if (!INTEL_GUC_SUPPORTS_TLB_INVALIDATION_SELECTIVE(guc)) {
> +		DRM_ERROR("Tlb invalidation: Operation not supported in this platform!\n");

as above

> +		return 0;
> +	}
> +
> +	GEM_BUG_ON(!IS_ALIGNED(start, I915_GTT_PAGE_SIZE_4K));
> +	GEM_BUG_ON(!IS_ALIGNED(length, I915_GTT_PAGE_SIZE_4K));
> +	GEM_BUG_ON(range_overflows(start, length, vm_total));
> +
> +	return guc_send_invalidate_tlb(guc, action, ARRAY_SIZE(action));
> +}
> +
> +/*
> + * Selective TLB Invalidation for Context:
> + * Invalidates all TLB's for a specific context across all engines.
> + */
> +int intel_guc_invalidate_tlb_page_selective_ctx(struct intel_guc *guc,
> +						enum intel_guc_tlb_inval_mode mode,
> +						u64 start, u64 length, u32 ctxid)
> +{
> +	u64 vm_total = BIT_ULL(INTEL_INFO(guc_to_gt(guc)->i915)->ppgtt_size);
> +	u32 address_mask = (ilog2(length) - ilog2(I915_GTT_PAGE_SIZE_4K));

drop ( )

> +	u32 full_range = vm_total == length;

bool

> +	u32 action[] = {
> +		INTEL_GUC_ACTION_TLB_INVALIDATION,
> +		0,
> +		INTEL_GUC_TLB_INVAL_PAGE_SELECTIVE_CTX << INTEL_GUC_TLB_INVAL_TYPE_SHIFT |
> +			mode << INTEL_GUC_TLB_INVAL_MODE_SHIFT |
> +			INTEL_GUC_TLB_INVAL_FLUSH_CACHE,
> +		ctxid,
> +		full_range ? full_range : lower_32_bits(start),
> +		full_range ? 0 : upper_32_bits(start),
> +		full_range ? 0 : address_mask,
> +	};
> +
> +	if (!INTEL_GUC_SUPPORTS_TLB_INVALIDATION_SELECTIVE(guc)) {
> +		DRM_ERROR("Tlb invalidation: Operation not supported in this platform!\n");

as above

> +		return 0;
> +	}
> +
> +	GEM_BUG_ON(!IS_ALIGNED(start, I915_GTT_PAGE_SIZE_4K));
> +	GEM_BUG_ON(!IS_ALIGNED(length, I915_GTT_PAGE_SIZE_4K));
> +	GEM_BUG_ON(range_overflows(start, length, vm_total));
> +
> +	return guc_send_invalidate_tlb(guc, action, ARRAY_SIZE(action));
> +}
> +
>  /*
>   * Guc TLB Invalidation: Invalidate the TLB's of GuC itself.
>   */
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index 01c6478451cc..df6ba1c32808 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -384,6 +384,16 @@ int intel_guc_allocate_and_map_vma(struct intel_guc *guc, u32 size,
>  int intel_guc_self_cfg32(struct intel_guc *guc, u16 key, u32 value);
>  int intel_guc_self_cfg64(struct intel_guc *guc, u16 key, u64 value);
>  
> +int intel_guc_g2g_register(struct intel_guc *guc);

drop this, not part of this series

> +
> +int intel_guc_invalidate_tlb_full(struct intel_guc *guc,
> +				  enum intel_guc_tlb_inval_mode mode);
> +int intel_guc_invalidate_tlb_page_selective(struct intel_guc *guc,
> +					    enum intel_guc_tlb_inval_mode mode,
> +					    u64 start, u64 length);
> +int intel_guc_invalidate_tlb_page_selective_ctx(struct intel_guc *guc,
> +						  enum intel_guc_tlb_inval_mode mode,
> +						  u64 start, u64 length, u32 ctxid);
>  int intel_guc_invalidate_tlb_guc(struct intel_guc *guc,
>  				 enum intel_guc_tlb_inval_mode mode);
>  int intel_guc_invalidate_tlb_all(struct intel_guc *guc);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> index 3edf567b3f65..29e402f70a94 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> @@ -436,5 +436,8 @@ enum intel_guc_recv_message {
>  	((intel_guc_ct_enabled(&(guc)->ct)) && \
>  	 (intel_guc_submission_is_used(guc)) && \
>  	 (GRAPHICS_VER(guc_to_gt((guc))->i915) >= 12))
> +#define INTEL_GUC_SUPPORTS_TLB_INVALIDATION_SELECTIVE(guc) \
> +	(INTEL_GUC_SUPPORTS_TLB_INVALIDATION(guc) && \
> +	HAS_SELECTIVE_TLB_INVALIDATION(guc_to_gt(guc)->i915))
>  
>  #endif

,Michal
