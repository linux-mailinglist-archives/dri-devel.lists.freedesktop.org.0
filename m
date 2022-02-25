Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6354C4AB5
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 17:28:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A542210E49E;
	Fri, 25 Feb 2022 16:28:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E47EA10E3CE;
 Fri, 25 Feb 2022 16:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645806517; x=1677342517;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=uThX2L/pp/s5tmGrcBZyaqcQC5m0yvkB1SobFZMhdfI=;
 b=FlEd/PokR8g6hDpqTQ3mCL9L6EgMcfepgfgqzs/+laoNfSbyt0viKvm1
 nRo2drdLmxlLs0484lplM7EH/KluwmPHUe2mYGWHZd3B5ZyMtqHVSZjWD
 f1PBPEzqQTfHdYVZSX3mOtE159h4YY3dAKSRBHlOL9gaayvFSgAjzhp/h
 moIaDLZRvidpU+1bIvgb8EXQcFmdAYalQFdt6FXTIbWYTb2j/pxo6Is9u
 G75AYMxo3AcHxx4OTea20Er8RWmQQm5XhDCR+NuAazoRANaugqO9E0/wl
 LWXn5/85e6RSouzpj3ntuZvbZAHxRV4NupktYSK2+4utGG9PisbyC4HUS w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="252448347"
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="252448347"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 08:28:36 -0800
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="549320272"
Received: from pkinsell-mobl.ger.corp.intel.com (HELO [10.213.234.117])
 ([10.213.234.117])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 08:28:34 -0800
Message-ID: <011a236d-7ed4-0d48-e8a6-c9bd98740d5b@linux.intel.com>
Date: Fri, 25 Feb 2022 16:28:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v12 1/6] drm: Add arch arm64 for drm_clflush_virt_range
Content-Language: en-US
To: Michael Cheng <michael.cheng@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220225032436.904942-1-michael.cheng@intel.com>
 <20220225032436.904942-2-michael.cheng@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220225032436.904942-2-michael.cheng@intel.com>
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
Cc: balasubramani.vivekanandan@intel.com, wayne.boyer@intel.com,
 casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 25/02/2022 03:24, Michael Cheng wrote:
> Add arm64 support for drm_clflush_virt_range. caches_clean_inval_pou
> performs a flush by first performing a clean, follow by an invalidation
> operation.
> 
> v2 (Michael Cheng): Use correct macro for cleaning and invalidation the
> 		    dcache. Thanks Tvrtko for the suggestion.
> 
> v3 (Michael Cheng): Replace asm/cacheflush.h with linux/cacheflush.h
> 
> v4 (Michael Cheng): Arm64 does not export dcache_clean_inval_poc as a
> 		    symbol that could be use by other modules, thus use
> 		    caches_clean_inval_pou instead. Also this version
> 	            removes include for cacheflush, since its already
> 		    included base on architecture type.

What does it mean that it is included based on architecture type? Some 
of the other header already pulls it in?

Regards,

Tvrtko

> Signed-off-by: Michael Cheng <michael.cheng@intel.com>
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/drm_cache.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
> index c3e6e615bf09..81c28714f930 100644
> --- a/drivers/gpu/drm/drm_cache.c
> +++ b/drivers/gpu/drm/drm_cache.c
> @@ -174,6 +174,11 @@ drm_clflush_virt_range(void *addr, unsigned long length)
>   
>   	if (wbinvd_on_all_cpus())
>   		pr_err("Timed out waiting for cache flush\n");
> +
> +#elif defined(CONFIG_ARM64)
> +	void *end = addr + length;
> +	caches_clean_inval_pou((unsigned long)addr, (unsigned long)end);
> +
>   #else
>   	WARN_ONCE(1, "Architecture has no drm_cache.c support\n");
>   #endif
