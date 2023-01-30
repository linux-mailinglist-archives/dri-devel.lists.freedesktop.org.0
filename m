Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDACF680D14
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 13:09:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F21E10E220;
	Mon, 30 Jan 2023 12:09:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA64D89E59;
 Mon, 30 Jan 2023 12:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675080589; x=1706616589;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ncmP73RvttEpwA82RMnfOsInUnkDxnPA/E/sIzKWR7o=;
 b=kOHYxt0LF3Zga4v0Dt/UygYezMH1xL0qtP/uOj2NAn6WUvpMxRXXQuO1
 r2AAOhrOrLHQd0RFhSqUoUx7bUHZHWP9lT8VQmvSOgH4hSxrtB5ep7yFy
 Ge/jYgttqAnHqtLzrAW35497VVlqJtANWC0/JjX2QcI3V1qahQ2q+3zdb
 VHS9L7pEyhBeYpXfNphmDs+fl1cZ6EPeLMPkA1rFQXCeLHZyapclDZE3z
 friAVjFOBva5D1TtnPZck3IFHNtbQTUrDv/nY6sP6RsmHMNwkdhLfR/mO
 8fxwENBq36V2u+Mbqug7c0SoRVVbGiL5+m0fwKxBPcaM2XxtQkkH1/z8x Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="389906000"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; d="scan'208";a="389906000"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 04:09:49 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="806649733"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; d="scan'208";a="806649733"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.251.209.222])
 ([10.251.209.222])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 04:09:47 -0800
Message-ID: <47e6dfdd-caa4-53b2-5aa5-4b168ffdb7a7@linux.intel.com>
Date: Mon, 30 Jan 2023 13:09:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/6] drm/i915/ttm: fix sparse warning
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20230130120636.63765-1-matthew.auld@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20230130120636.63765-1-matthew.auld@intel.com>
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, kernel test robot <lkp@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/30/2023 1:06 PM, Matthew Auld wrote:
> Sparse complains with:
>
> drivers/gpu/drm/i915/gem/i915_gem_ttm.c:1066:21: sparse:
> 	expected restricted vm_fault_t [assigned] [usertype] ret
> drivers/gpu/drm/i915/gem/i915_gem_ttm.c:1066:21: sparse: got int
>
> Fixes: 516198d317d8 ("drm/i915: audit bo->resource usage v3")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Christian König <ckoenig.leichtzumerken@gmail.com>
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index 7420276827a5..4758f21c91e1 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -1067,11 +1067,12 @@ static vm_fault_t vm_fault_ttm(struct vm_fault *vmf)
>   			.interruptible = true,
>   			.no_wait_gpu = true, /* should be idle already */
>   		};
> +		int err;
>   
>   		GEM_BUG_ON(!bo->ttm || !(bo->ttm->page_flags & TTM_TT_FLAG_SWAPPED));
>   
> -		ret = ttm_bo_validate(bo, i915_ttm_sys_placement(), &ctx);
> -		if (ret) {
> +		err = ttm_bo_validate(bo, i915_ttm_sys_placement(), &ctx);
> +		if (err) {
>   			dma_resv_unlock(bo->base.resv);
>   			return VM_FAULT_SIGBUS;
>   		}
