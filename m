Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B5548D8E8
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 14:31:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6186911246A;
	Thu, 13 Jan 2022 13:31:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFBC911246A;
 Thu, 13 Jan 2022 13:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642080662; x=1673616662;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=CJVM9eyd8wrdFsnCGqIWGgAAhd2S0Y4upFklJt0saYI=;
 b=hl7bAQpuSaA6kFqSF/bNAIpQXCDnbG4/wXKQH3mPEizEaJz1+89+2DpA
 qhdh9Xtn1o3LdMrHJcGjmt8fLUWzXPjY4FMgf4cIXyn56FZlBEN/IA2Qg
 7Z83ezT/MFwCeuCXSxFRp3XsSeKRWXsgn67RvoxsB4RQw58lpU+QKTGb5
 rcUAmztx5QGDWPT3gCj17sT9RwT3dmzNAKLXf7zdp81/J5Up7zR1enWio
 sLpW+Pr+WxePpvxHuDcp9LCsZw4W6HnBJCsi6aB0HOmKz6ZwTMB1h8Itl
 CjDtuNw4SCxCDa5OlFMCr6H2DJj5w+Epy5Z7fj04q1uLyHMsrFM7AFOI0 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="223988815"
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="223988815"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 05:31:02 -0800
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="670514974"
Received: from inechita-mobl2.ger.corp.intel.com (HELO [10.249.254.193])
 ([10.249.254.193])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 05:31:01 -0800
Message-ID: <45f75559-6367-d0ff-bd45-3efca11656a9@linux.intel.com>
Date: Thu, 13 Jan 2022 14:30:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [Intel-gfx] [PATCH v5 1/6] drm/i915: Call i915_gem_evict_vm in
 vm_fault_gtt to prevent new ENOSPC errors, v2.
Content-Language: en-US
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20220113114500.2039439-1-maarten.lankhorst@linux.intel.com>
 <20220113114500.2039439-2-maarten.lankhorst@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20220113114500.2039439-2-maarten.lankhorst@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/13/22 12:44, Maarten Lankhorst wrote:
> Now that we cannot unbind kill the currently locked object directly
> because we're removing short term pinning, we may have to unbind the
> object from gtt manually, using a i915_gem_evict_vm() call.
>
> Changes since v1:
> - Remove -ENOSPC warning, can still happen with concurrent mmaps
>    where we can't unbind the other mmap because of the lock held.
>    This  fixes the gem_mmap_gtt@cpuset tests.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>   drivers/gpu/drm/i915/gem/i915_gem_mman.c | 18 ++++++++++++++++--
>   1 file changed, 16 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> index 5ac2506f4ee8..fafd158e5313 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> @@ -21,6 +21,7 @@
>   #include "i915_trace.h"
>   #include "i915_user_extensions.h"
>   #include "i915_gem_ttm.h"
> +#include "i915_gem_evict.h"
>   #include "i915_vma.h"
>   
>   static inline bool
> @@ -358,8 +359,21 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
>   			vma = i915_gem_object_ggtt_pin_ww(obj, &ww, &view, 0, 0, flags);
>   		}
>   
> -		/* The entire mappable GGTT is pinned? Unexpected! */
> -		GEM_BUG_ON(vma == ERR_PTR(-ENOSPC));
> +		/*
> +		 * The entire mappable GGTT is pinned? Unexpected!
> +		 * Try to evict the object we locked too, as normally we skip it
> +		 * due to lack of short term pinning inside execbuf.
> +		 */
> +		if (vma == ERR_PTR(-ENOSPC)) {
> +			ret = mutex_lock_interruptible(&ggtt->vm.mutex);
> +			if (!ret) {
> +				ret = i915_gem_evict_vm(&ggtt->vm);
> +				mutex_unlock(&ggtt->vm.mutex);
> +			}
> +			if (ret)
> +				goto err_reset;
> +			vma = i915_gem_object_ggtt_pin_ww(obj, &ww, &view, 0, 0, flags);
> +		}
>   	}
>   	if (IS_ERR(vma)) {
>   		ret = PTR_ERR(vma);
