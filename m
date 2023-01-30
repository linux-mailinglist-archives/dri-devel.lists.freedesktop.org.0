Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7951680B54
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 11:51:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59E6210E0DC;
	Mon, 30 Jan 2023 10:51:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0428310E0C4;
 Mon, 30 Jan 2023 10:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675075900; x=1706611900;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=oOqUxn6oGa9LyoLbjY+Jd19jKkG2HTk1BectWKChKV8=;
 b=QyJ3vAFX15VLVgKmN4AaXbWXI7ChEILmla5kGHbf6Djpo/nNOl4k4+Si
 00r4iIf3qnTqJGYBkqodzSu59MOg4w+d7XTuV4fVE/O/7oL/IsGVYUDD7
 xvUqrvSBnJYbJuqxgwCQQL6x1ma/kJrShlZOpjPdgoQNR+5zeY8gQh+Ok
 DcpViED1ApMkZd7ItLnN5QpyH1aTTHg0gbvikZtrCCplQ4FSAKcx9EtjE
 U8d9L4fyq/cFcXt79hciiYS/HJipfyz2dFj7HKfgBdfg7N2EoryEnPKgy
 gXwwUYX28C6cvYRYrC0iFPis8XZaAJNNzl3XjNpetyYraZ9c6XUPmBBWa w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="311148354"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; d="scan'208";a="311148354"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 02:51:35 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="806627670"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; d="scan'208";a="806627670"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.2.187])
 ([10.213.2.187])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 02:51:34 -0800
Message-ID: <e0622adf-fbb0-33f8-1cf6-a1e8a3280357@intel.com>
Date: Mon, 30 Jan 2023 11:51:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH 1/6] drm/i915/ttm: fix sparse warning
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20230130101230.25347-1-matthew.auld@intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230130101230.25347-1-matthew.auld@intel.com>
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30.01.2023 11:12, Matthew Auld wrote:
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

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
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

