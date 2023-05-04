Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A33016F6C60
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 14:51:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89F8A10E42E;
	Thu,  4 May 2023 12:51:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D36310E169;
 Thu,  4 May 2023 12:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683204685; x=1714740685;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=5/0BeN5dEfeq86oY4gWQj/1vjWhIs2HZGREskWAytv8=;
 b=bB5dJbjUvUO0Hyh9WwNdE9fbELejrjpwkWXAP81UGAQvo3ZLChYMNl1d
 5AsyADjET5NfIkHmQkc/mIAr5oH2FNzUJ7DOu6CQKfRGrmpkvZXVOnhCq
 HXQfD/qWTXNItqFYF/LOEB3vc9clnELn3JiDwEGJ6rP9bWf39k8wlrJ2T
 iT8p6CT4D5Ugrg49paC1nxNPQNtW0NseeRUNCptdLkScra5nqdR1jVtdM
 JVz6BLR9+yPYKpMZlCxuojjIHSLZS1XJ/GotY0y3oh+fCpNUCVVhUngcZ
 JQdHH/yn/M14HZtVrRvFvynFgnimZNgz4PEtrY9jKY2Z6HAGvWf1d/bMo A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="376988343"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="376988343"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 05:51:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="808701457"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="808701457"
Received: from tarabr1x-mobl.ger.corp.intel.com (HELO [10.213.213.121])
 ([10.213.213.121])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 05:51:22 -0700
Message-ID: <4c464bd6-9edc-3098-5c24-6d6da2a75c39@linux.intel.com>
Date: Thu, 4 May 2023 13:51:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v5 2/5] drm/i915: use pat_index instead of cache_level
Content-Language: en-US
To: fei.yang@intel.com, intel-gfx@lists.freedesktop.org
References: <20230503230211.2834340-1-fei.yang@intel.com>
 <20230503230211.2834340-3-fei.yang@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230503230211.2834340-3-fei.yang@intel.com>
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
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 04/05/2023 00:02, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> Currently the KMD is using enum i915_cache_level to set caching policy for
> buffer objects. This is flaky because the PAT index which really controls
> the caching behavior in PTE has far more levels than what's defined in the
> enum. In addition, the PAT index is platform dependent, having to translate
> between i915_cache_level and PAT index is not reliable, and makes the code
> more complicated.
> 
>>From UMD's perspective there is also a necessity to set caching policy for
> performance fine tuning. It's much easier for the UMD to directly use PAT
> index because the behavior of each PAT index is clearly defined in Bspec.
> Having the abstracted i915_cache_level sitting in between would only cause
> more ambiguity.
> 
> For these reasons this patch replaces i915_cache_level with PAT index. Also
> note, the cache_level is not completely removed yet, because the KMD still
> has the need of creating buffer objects with simple cache settings such as
> cached, uncached, or writethrough. For such simple cases, using cache_level
> would help simplify the code.
> 
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Fei Yang <fei.yang@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

[snip]

> diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> index bb6998d67133..f2334a713c4e 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> @@ -56,7 +56,7 @@ static u64 gen8_pte_encode(dma_addr_t addr,
>   }

^^^

How come there are no changes to gen8_pte_encode?

vvv

>   
>   static u64 mtl_pte_encode(dma_addr_t addr,
> -			  enum i915_cache_level level,
> +			  unsigned int pat_index,
>   			  u32 flags)

Prototype and implementation changed here for mtl_pte_encode.

And we have:

	if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 70))
		ppgtt->vm.pte_encode = mtl_pte_encode;
	else
		ppgtt->vm.pte_encode = gen8_pte_encode;

So should be same prototype. And:

  	u64 (*pte_encode)(dma_addr_t addr,
-			  enum i915_cache_level level,
+			  unsigned int pat_index,
  			  u32 flags); /* Create a valid PTE */

Patch relies on the compiler considering enum equal to unsigned int?

But the implementation of gen8_pte_encode and most ggtt counterparts is 
looking at the passed in pat index and thinks it is cache level.

How is that supposed to work?! Or I am blind and am missing something?

Regards,

Tvrtko
