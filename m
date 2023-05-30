Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7680716CE5
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 20:54:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04AEB10E411;
	Tue, 30 May 2023 18:54:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA46B10E413;
 Tue, 30 May 2023 18:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685472847; x=1717008847;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0kulKMLy7Yg0yE/BDh7sWLThl83dTtSuMe48DHfeets=;
 b=oKDCTPai7NSSvJjNE9W0cFGe2BrXju9fjsLFcjYCB7sc6NZHN7mW9JrK
 GLmkfOvX+hWZm24NuHl997+YjjIlDzQBQIwwMfUwIRZB3mjSu0qWSJTp/
 coe5pmwCd8itX4ic5fIEVu2okUZmmr8gzWNEjRvFMXXwHhE7H4ze9pT5o
 cKmk++RQCX0c+Z+CQbhYxjnWV4lMSz4AZFuXPSjwDPA0TsyeqH+cYDtv8
 ExCYeysXtg7OdTkGvWRjDFI38vGRHUZiey8peM/kCWg5Qod6aqRrevR5d
 3wQien28qkahr8qPv/duR0sMPLqHlc005Jk3TPfmLqUFksLXw9d5bXeDT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="418504061"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="418504061"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 11:54:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="796381521"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="796381521"
Received: from amyachev-mobl3.ccr.corp.intel.com (HELO intel.com)
 ([10.252.53.184])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 11:54:04 -0700
Date: Tue, 30 May 2023 20:54:01 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 1/2] drm/i915/gt: Fix second parameter type of pre-gen8
 pte_encode callbacks
Message-ID: <ZHZGSbiIG3PNAfCQ@ashyti-mobl2.lan>
References: <20230530-i915-gt-cache_level-wincompatible-function-pointer-types-strict-v1-0-54501d598229@kernel.org>
 <20230530-i915-gt-cache_level-wincompatible-function-pointer-types-strict-v1-1-54501d598229@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530-i915-gt-cache_level-wincompatible-function-pointer-types-strict-v1-1-54501d598229@kernel.org>
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

On Tue, May 30, 2023 at 11:24:38AM -0700, Nathan Chancellor wrote:
> When booting a kernel compiled with CONFIG_CFI_CLANG (kCFI), there is a
> CFI failure in ggtt_probe_common() when trying to call hsw_pte_encode()
> via an indirect call:
> 
>   [    5.030027] CFI failure at ggtt_probe_common+0xd1/0x130 [i915] (target: hsw_pte_encode+0x0/0x30 [i915]; expected type: 0xf5c1d0fc)
> 
> With kCFI, indirect calls are validated against their expected type
> versus actual type and failures occur when the two types do not match.
> 
> clang's -Wincompatible-function-pointer-types-strict can catch this at
> compile time but it is not enabled for the kernel yet:
> 
>   drivers/gpu/drm/i915/gt/intel_ggtt.c:1155:23: error: incompatible function pointer types assigning to 'u64 (*)(dma_addr_t, unsigned int, u32)' (aka 'unsigned long long (*)(unsigned int, unsigned int, unsigned int)') from 'u64 (dma_addr_t,
>   enum i915_cache_level, u32)' (aka 'unsigned long long (unsigned int, enum i915_cache_level, unsigned int)') [-Werror,-Wincompatible-function-pointer-types-strict]
>                   ggtt->vm.pte_encode = iris_pte_encode;
>                                       ^ ~~~~~~~~~~~~~~~
>   drivers/gpu/drm/i915/gt/intel_ggtt.c:1157:23: error: incompatible function pointer types assigning to 'u64 (*)(dma_addr_t, unsigned int, u32)' (aka 'unsigned long long (*)(unsigned int, unsigned int, unsigned int)') from 'u64 (dma_addr_t,
>   enum i915_cache_level, u32)' (aka 'unsigned long long (unsigned int, enum i915_cache_level, unsigned int)') [-Werror,-Wincompatible-function-pointer-types-strict]
>                   ggtt->vm.pte_encode = hsw_pte_encode;
>                                       ^ ~~~~~~~~~~~~~~
>   drivers/gpu/drm/i915/gt/intel_ggtt.c:1159:23: error: incompatible function pointer types assigning to 'u64 (*)(dma_addr_t, unsigned int, u32)' (aka 'unsigned long long (*)(unsigned int, unsigned int, unsigned int)') from 'u64 (dma_addr_t,
>   enum i915_cache_level, u32)' (aka 'unsigned long long (unsigned int, enum i915_cache_level, unsigned int)') [-Werror,-Wincompatible-function-pointer-types-strict]
>                   ggtt->vm.pte_encode = byt_pte_encode;
>                                       ^ ~~~~~~~~~~~~~~
>   drivers/gpu/drm/i915/gt/intel_ggtt.c:1161:23: error: incompatible function pointer types assigning to 'u64 (*)(dma_addr_t, unsigned int, u32)' (aka 'unsigned long long (*)(unsigned int, unsigned int, unsigned int)') from 'u64 (dma_addr_t,
>   enum i915_cache_level, u32)' (aka 'unsigned long long (unsigned int, enum i915_cache_level, unsigned int)') [-Werror,-Wincompatible-function-pointer-types-strict]
>                   ggtt->vm.pte_encode = ivb_pte_encode;
>                                       ^ ~~~~~~~~~~~~~~
>   drivers/gpu/drm/i915/gt/intel_ggtt.c:1163:23: error: incompatible function pointer types assigning to 'u64 (*)(dma_addr_t, unsigned int, u32)' (aka 'unsigned long long (*)(unsigned int, unsigned int, unsigned int)') from 'u64 (dma_addr_t,
>   enum i915_cache_level, u32)' (aka 'unsigned long long (unsigned int, enum i915_cache_level, unsigned int)') [-Werror,-Wincompatible-function-pointer-types-strict]
>                   ggtt->vm.pte_encode = snb_pte_encode;
>                                       ^ ~~~~~~~~~~~~~~
>   5 errors generated.
> 
> In this case, the pre-gen8 pte_encode functions have a second parameter
> type of 'enum i915_cache_level' whereas the function pointer prototype
> in 'struct i915_address_space' expects a second parameter type of
> 'unsigned int'.
> 
> Update the second parameter of the callbacks and the comment above them
> noting that these statements are still valid, which matches other
> functions and files, to clear up the kCFI failures at run time.
> 
> Fixes: 9275277d5324 ("drm/i915: use pat_index instead of cache_level")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

That's correct!

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Thanks,
Andi
