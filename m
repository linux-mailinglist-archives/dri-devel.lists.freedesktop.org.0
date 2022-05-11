Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B907B522D1D
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 09:23:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D39810EDFB;
	Wed, 11 May 2022 07:23:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C322910EDC6;
 Wed, 11 May 2022 07:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652253788; x=1683789788;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=hZsRwIYonbxTpcDjizgtBXa3i6BLOGIQXlZLLA+eOYE=;
 b=L5a8lM27QmHowOned2m+mOJ73bSgUhmzCpv92mh3f22/CIyTuQloUYMt
 iOXeSSU1Wp0Xi/vpKrFYNtvZmDBRFNVU7mjA+DcKzdRgflnm2jeKzC/Ts
 r+ZHa0cchq/HHtXhPfSuDphbuII8a+w8L7F4psJf+XLiv3hOBCwXGn4Oj
 3IIycymhyf7YG79nlgGQ5N1W19d5rONOcuiF9koy/AnxLmum1QPjf4yc7
 Q5z7rfSFK/dRPR0uSu+6v+Ly92LRspiZdebU9eymDiVsRNTCBVRCuGp6l
 EJfP12GyI0F3JqaS50AFfxqTcYrxtPit0zOB0LIO/vXH58I2WPTmG1b9l g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="269747363"
X-IronPort-AV: E=Sophos;i="5.91,216,1647327600"; d="scan'208";a="269747363"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 00:23:08 -0700
X-IronPort-AV: E=Sophos;i="5.91,216,1647327600"; d="scan'208";a="520402804"
Received: from mmlucey-mobl1.ger.corp.intel.com (HELO [10.213.195.130])
 ([10.213.195.130])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 00:23:06 -0700
Message-ID: <2ecc20eb-a80c-8643-4cc8-8f9e18b5919d@linux.intel.com>
Date: Wed, 11 May 2022 08:23:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gem: Flush TLBs for all the tiles
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
References: <20220510203359.92530-1-andi.shyti@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220510203359.92530-1-andi.shyti@linux.intel.com>
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
Cc: Matthew Auld <matthew.auld@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/05/2022 21:33, Andi Shyti wrote:
> During object cleanup we invalidate the TLBs but we do it only
> for gt0. Invalidate the caches for all the tiles.
> 
> Reported-by: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_pages.c | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> index 97c820eee115a..444b9f96ba77c 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> @@ -217,10 +217,15 @@ __i915_gem_object_unset_pages(struct drm_i915_gem_object *obj)
>   
>   	if (test_and_clear_bit(I915_BO_WAS_BOUND_BIT, &obj->flags)) {
>   		struct drm_i915_private *i915 = to_i915(obj->base.dev);
> -		intel_wakeref_t wakeref;
> +		struct intel_gt *gt;
> +		int i;
>   
> -		with_intel_runtime_pm_if_active(&i915->runtime_pm, wakeref)
> -			intel_gt_invalidate_tlbs(to_gt(i915));
> +		for_each_gt(gt, i915, i) {
> +			intel_wakeref_t w;
> +
> +			with_intel_runtime_pm_if_active(gt->uncore->rpm, w)
> +				intel_gt_invalidate_tlbs(gt);
> +		}

LGTM.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

How about an improvement, either immediately or as followup, to define per tile bound flags and so be able to avoid trashing innocent tiles?

Like:

i915_vma_bind:

   set_bit(I915_BO_WAS_BOUND_BIT(vma->vm->gt->info.id), &vma->obj->flags);


__i915_gem_object_unset_pages:

   for_each_gt(gt, i915, i) {
	if (!test_and_clear_bit(I915_BO_WAS_BOUND_BIT(i), &obj->flags))
		continue;

	...
   }

Regards,

Tvrtko

>   	}
>   
>   	return pages;
