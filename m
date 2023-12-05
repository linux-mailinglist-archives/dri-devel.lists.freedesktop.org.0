Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C533804B4A
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 08:42:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C725910E481;
	Tue,  5 Dec 2023 07:42:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F52E10E46C;
 Tue,  5 Dec 2023 07:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701762143; x=1733298143;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ELl8O7w5VEGZT2BmT0YlcrbQyNguvGPwRWjwQ/jh2jk=;
 b=WOsKifFB9UUt08tA3QvJxCxXInzn/Wz1VnNzMxadjdtkchT1zym9agqL
 KOI+fOz4Q1ls1IXAmM3wUnVJwdrThBsMid2rbfKr1jx5yEGvajh9FFJnV
 BQkpZX6ltuHLfqVHLKRSm74ep9/LPPOSYM3kvFUyk9aD5ToKC7mZZrHvs
 oIArQAojzvnZ9EijVqY6E6u2gmHgzZpHcbqbRxFMHCskLkiAPM7l/hvak
 Tkbwwg49V54nCx4ZtUgLWGTjtmgOLTwrguRPGLjVNuh0SPLYPYcnJFUp7
 pI9JcuvGflhYvG6XcshSsKFfaECi8o23wIZ5YpostJ/AZedXI7g9PWA8Y Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="391017217"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="391017217"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 23:42:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="914715299"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="914715299"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.18.237])
 ([10.213.18.237])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 23:42:18 -0800
Message-ID: <f94b02b4-6ac8-4b3e-8aac-4a1a2b27b829@intel.com>
Date: Tue, 5 Dec 2023 08:42:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/display: Check GGTT to determine phys_base
Content-Language: en-US
To: Paz Zcharya <pazz@chromium.org>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
References: <20231130161651.1836047-1-pazz@chromium.org>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20231130161651.1836047-1-pazz@chromium.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Subrata Banik <subratabanik@google.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Manasi Navare <navaremanasi@chromium.org>,
 =?UTF-8?Q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>,
 Sean Paul <seanpaul@chromium.org>, matthew.auld@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Drew Davenport <ddavenport@chromium.org>, Marcin Wojtas <mwojtas@chromium.org>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 30.11.2023 17:16, Paz Zcharya wrote:
> There was an assumption that for iGPU there should be a 1:1 mapping
> of GGTT to physical address pointing to actual framebuffer.
> This assumption is not valid anymore for MTL.
> Fix that by checking GGTT to determine the phys address.
>
> The following algorithm for phys_base should be valid for all platforms:
> 1. Find pte
> 2. if(IS_DGFX(i915) && pte & GEN12_GGTT_PTE_LM) mem =
> i915->mm.regions[INTEL_REGION_LMEM_0] else mem = i915->mm.stolen_region
> 3. phys_base = (pte & I915_GTT_PAGE_MASK) - mem->region.start;
>
> - On older platforms, stolen_region points to system memory, starting at 0
> - on DG2, it uses lmem region which starts at 0 as well
> - on MTL, stolen_region points to stolen-local which starts at 0x800000
>
> Signed-off-by: Paz Zcharya <pazz@chromium.org>

I was waiting for CI with my comments, but without success.
For some reason it didn't run, that's pity next time you can trigger it 
manually via patchwork.

> ---
>
>   .../drm/i915/display/intel_plane_initial.c    | 45 +++++++++----------
>   1 file changed, 22 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
> index a55c09cbd0e4..c4bf02ea966c 100644
> --- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
> +++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
> @@ -51,6 +51,8 @@ initial_plane_vma(struct drm_i915_private *i915,
>   	struct intel_memory_region *mem;
>   	struct drm_i915_gem_object *obj;
>   	struct i915_vma *vma;
> +	gen8_pte_t __iomem *gte = to_gt(i915)->ggtt->gsm;

I have realized this will work only for gen8+. Older gens uses 32bit 
gen6_pte_t.
So another 'if' is necessary. Then in case of older platforms IMO one 
can use
     pte = base;
with comment that it is 1:1 mapping.

Regards
Andrzej

> +	gen8_pte_t pte;
>   	resource_size_t phys_base;
>   	u32 base, size;
>   	u64 pinctl;
> @@ -59,44 +61,41 @@ initial_plane_vma(struct drm_i915_private *i915,
>   		return NULL;
>   
>   	base = round_down(plane_config->base, I915_GTT_MIN_ALIGNMENT);
> -	if (IS_DGFX(i915)) {
> -		gen8_pte_t __iomem *gte = to_gt(i915)->ggtt->gsm;
> -		gen8_pte_t pte;
> +	gte += base / I915_GTT_PAGE_SIZE;
>   
> -		gte += base / I915_GTT_PAGE_SIZE;
> +	pte = ioread64(gte);
>   
> -		pte = ioread64(gte);
> +	if (IS_DGFX(i915)) {
>   		if (!(pte & GEN12_GGTT_PTE_LM)) {
>   			drm_err(&i915->drm,
>   				"Initial plane programming missing PTE_LM bit\n");
>   			return NULL;
>   		}
> -
> -		phys_base = pte & I915_GTT_PAGE_MASK;
>   		mem = i915->mm.regions[INTEL_REGION_LMEM_0];
> -
> -		/*
> -		 * We don't currently expect this to ever be placed in the
> -		 * stolen portion.
> -		 */
> -		if (phys_base >= resource_size(&mem->region)) {
> -			drm_err(&i915->drm,
> -				"Initial plane programming using invalid range, phys_base=%pa\n",
> -				&phys_base);
> -			return NULL;
> -		}
> -
> -		drm_dbg(&i915->drm,
> -			"Using phys_base=%pa, based on initial plane programming\n",
> -			&phys_base);
>   	} else {
> -		phys_base = base;
>   		mem = i915->mm.stolen_region;
>   	}
>   
> +	phys_base = (pte & I915_GTT_PAGE_MASK) - mem->region.start;
> +
>   	if (!mem)
>   		return NULL;
>   
> +	/*
> +	 * We don't currently expect this to ever be placed in the
> +	 * stolen portion.
> +	 */
> +	if (phys_base >= resource_size(&mem->region)) {
> +		drm_err(&i915->drm,
> +			"Initial plane programming using invalid range, phys_base=%pa\n",
> +			&phys_base);
> +		return NULL;
> +	}
> +
> +	drm_dbg(&i915->drm,
> +		"Using phys_base=%pa, based on initial plane programming\n",
> +		&phys_base);
> +
>   	size = round_up(plane_config->base + plane_config->size,
>   			mem->min_page_size);
>   	size -= base;

