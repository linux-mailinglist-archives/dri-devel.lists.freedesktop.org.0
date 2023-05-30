Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B8A716CEF
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 20:56:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5ADC10E403;
	Tue, 30 May 2023 18:56:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1C4110E1AC;
 Tue, 30 May 2023 18:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685472963; x=1717008963;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Y5AoYXRK/lzx+qlXuPvnsTaV9VUjyPA5r2LGFZtIMKg=;
 b=KJJBHiFx8jWabGshdFfoSseItDttqhelmwAINdoQ2eFhHCPUBTWO9dLS
 2Aejj73bHLYRIlhzaapRekjWDc6eq31UNlqsR0Mj6ulceeDVjQ52EyWGc
 KiddBGe6BIUlNmXwm4+ERtB6Na48JJdsWDDPCEXGQfzJGc8wSGfWCUmBp
 tGB6Yl2beB6ZKbjbJbNqG8zgEsTahhZ+AO3H5ghPMKByMnL9gYb3qBM3H
 bJ6Vs1DzfJXcm/RcM5mp33w88/QyL22ljhrAepZrulhflXE0K1r7isEPP
 qA6OWWu8KG20d0HrtOXW3bA0OmPaKOePxpxE9KkWFaETAFzAz3QaeklK0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="418504579"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="418504579"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 11:56:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="796382497"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="796382497"
Received: from amyachev-mobl3.ccr.corp.intel.com (HELO intel.com)
 ([10.252.53.184])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 11:55:59 -0700
Date: Tue, 30 May 2023 20:55:57 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 2/2] drm/i915/gt: Fix parameter in
 gmch_ggtt_insert_{entries,page}()
Message-ID: <ZHZGvSvYHC4SdwTh@ashyti-mobl2.lan>
References: <20230530-i915-gt-cache_level-wincompatible-function-pointer-types-strict-v1-0-54501d598229@kernel.org>
 <20230530-i915-gt-cache_level-wincompatible-function-pointer-types-strict-v1-2-54501d598229@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530-i915-gt-cache_level-wincompatible-function-pointer-types-strict-v1-2-54501d598229@kernel.org>
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
Cc: tvrtko.ursulin@linux.intel.com, llvm@lists.linux.dev, fei.yang@intel.com,
 trix@redhat.com, intel-gfx@lists.freedesktop.org, ndesaulniers@google.com,
 patches@lists.linux.dev, dri-devel@lists.freedesktop.org,
 andi.shyti@linux.intel.com, rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nathan,

On Tue, May 30, 2023 at 11:24:39AM -0700, Nathan Chancellor wrote:
> When building with clang's -Wincompatible-function-pointer-types-strict,
> the following warnings occur:
> 
>   drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c:102:23: error: incompatible function pointer types assigning to 'void (*)(struct i915_address_space *, dma_addr_t, u64, unsigned int, u32)' (aka 'void (*)(struct i915_address_space *, unsigned int, unsigned long long, unsigned int, unsigned int)') from 'void (struct i915_address_space *, dma_addr_t, u64, enum i915_cache_level, u32)' (aka 'void (struct i915_address_space *, unsigned int, unsigned long long, enum i915_cache_level, unsigned int)') [-Werror,-Wincompatible-function-pointer-types-strict]
>           ggtt->vm.insert_page = gmch_ggtt_insert_page;
>                                ^ ~~~~~~~~~~~~~~~~~~~~~
>   drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c:103:26: error: incompatible function pointer types assigning to 'void (*)(struct i915_address_space *, struct i915_vma_resource *, unsigned int, u32)' (aka 'void (*)(struct i915_address_space *, struct i915_vma_resource *, unsigned int, unsigned int)') from 'void (struct i915_address_space *, struct i915_vma_resource *, enum i915_cache_level, u32)' (aka 'void (struct i915_address_space *, struct i915_vma_resource *, enum i915_cache_level, unsigned int)') [-Werror, -Wincompatible-function-pointer-types-strict]
>           ggtt->vm.insert_entries = gmch_ggtt_insert_entries;
>                                   ^ ~~~~~~~~~~~~~~~~~~~~~~~~
>   2 errors generated.
> 
> The warning is pointing out that while 'enum i915_cache_level' and
> 'unsigned int' are ABI compatible, these indirect calls will fail
> clang's kernel Control Flow Integrity (kCFI) checks, as the callback's
> signature does not exactly match the prototype's signature.
> 
> To fix this, replace the cache_level parameter with pat_index, as was
> done in other places within i915 where there is no difference between
> cache_level and pat_index on certain generations.
> 
> Fixes: 9275277d5324 ("drm/i915: use pat_index instead of cache_level")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

same clang issue as before, I'm OK with this patch, from my side:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Thanks,
Andi
