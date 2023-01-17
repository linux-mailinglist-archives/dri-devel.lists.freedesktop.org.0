Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABAD66DD0A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 12:59:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA5910E4A9;
	Tue, 17 Jan 2023 11:59:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F135810E4A9;
 Tue, 17 Jan 2023 11:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673956784; x=1705492784;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=D+crpiL2NOB1I3cJ/3Xr+B6R8ZK4JrWjH9PmxbQMQtw=;
 b=BMi/iFqVtJPfqBdN2v6vrRNsk5YSUu75YAi6EtLOMu1pYHwMGnyD4fVL
 56HyBVoCQB+WZ0Dm11Cr9x8REF/fGEX+AzysM2pK7pDNyBehUchijtE74
 qVPqHQ+4whqWW4voWoSw/bXKOkgyyT/fLf8rFysrBeWVN8G6r1SuCnUfT
 PCzkrQ5201j53ngbUWdR189pDZne/gMjVGiogjvrGp+cLlc2BLoXhASut
 q7OxyvwtdKOgfoicl/hH8Yvcu8TrZHKmUCKPNewFNXPwNqdELxlx/QkM0
 rrCeJOlmh63AKzsHF8kJcENDSU/RrbAfjlx4wFUttWY5ZOapTl08wS1LJ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="326745767"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; d="scan'208";a="326745767"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 03:59:43 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="722628290"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; d="scan'208";a="722628290"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.10.213])
 ([10.213.10.213])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 03:59:41 -0800
Message-ID: <4cb6a6d0-68d9-7bdb-6707-a4bada612ef3@intel.com>
Date: Tue, 17 Jan 2023 12:59:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915: Ratelimit debug log in
 vm_fault_ttm
Content-Language: en-US
To: Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
References: <20230117115350.1071-1-nirmoy.das@intel.com>
 <20230117115350.1071-2-nirmoy.das@intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230117115350.1071-2-nirmoy.das@intel.com>
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
Cc: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17.01.2023 12:53, Nirmoy Das wrote:
> Test like i915_gem_mman_live_selftests/igt_mmap_migrate can cause
> dmesg spamming. Use ratelimit api to reduce log rate.
> 
> References: https://gitlab.freedesktop.org/drm/intel/-/issues/7038
> Cc: Matthew Auld <matthew.auld@intel.com>
> 
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index 8cfed1bef629..25294ddbee46 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -1077,8 +1077,9 @@ static vm_fault_t vm_fault_ttm(struct vm_fault *vmf)
>   		}
>   
>   		if (err) {
> -			drm_dbg(dev, "Unable to make resource CPU accessible(err = %pe)\n",
> -				ERR_PTR(err));
> +			drm_dbg_ratelimited(dev,
> +					    "Unable to make resource CPU accessible(err = %pe)\n",
> +					    ERR_PTR(err));
>   			dma_resv_unlock(bo->base.resv);
>   			ret = VM_FAULT_SIGBUS;
>   			goto out_rpm;

