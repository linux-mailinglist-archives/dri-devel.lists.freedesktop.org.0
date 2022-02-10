Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9A84B0AA3
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 11:32:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C1210E7CD;
	Thu, 10 Feb 2022 10:32:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2748210E7CB;
 Thu, 10 Feb 2022 10:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644489122; x=1676025122;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=aUoUIvaP0mKqGQFmuLEycrw4C0O3v4YsV66X2+0pIe8=;
 b=h35QXIFWEreuRHj23y9YZlst2k4d1h9wsxNspuuDIXVgrdX//2PWbMhB
 A6E26guMKuTKEePkNJh1p7nfGFqzWuOnbVF6QSpxHDgOqIfTqBjn9//oN
 F0OZOtqmRqo+oB0Nsnex4BpUVNgZlYbhh3G5l3SivBhMjFacGYBemnHFy
 3FvQx/y2g/JhawHbdZH/LPtG8ldeabyYafQ2KkLLdOpBnGroImgFzvlsx
 JhkImOiGjFvYVy1MKr4OGiIxrfHrCFMbC2CUxtdNlF8Ug8ChuDljsV3qn
 5sXmha5h0sHTlO2Q0pFQI0rRB+fI/KRryg+t9XBjzzUBIn/+/lReR1eDs g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10253"; a="233023666"
X-IronPort-AV: E=Sophos;i="5.88,358,1635231600"; d="scan'208";a="233023666"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 02:32:01 -0800
X-IronPort-AV: E=Sophos;i="5.88,358,1635231600"; d="scan'208";a="485636297"
Received: from scurtin-mobl1.ger.corp.intel.com (HELO [10.213.201.86])
 ([10.213.201.86])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 02:31:59 -0800
Message-ID: <1e4fec89-7314-cc7a-db0b-37a1afddec83@linux.intel.com>
Date: Thu, 10 Feb 2022 10:31:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v9 1/6] drm: Add arch arm64 for drm_clflush_virt_range
Content-Language: en-US
To: Michael Cheng <michael.cheng@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220210012617.1061641-1-michael.cheng@intel.com>
 <20220210012617.1061641-2-michael.cheng@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220210012617.1061641-2-michael.cheng@intel.com>
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
Cc: balasubramani.vivekanandan@intel.com, wayne.boyer@intel.com,
 casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/02/2022 01:26, Michael Cheng wrote:
> Add arm64 support for drm_clflush_virt_range. dcache_clean_inval_poc
> performs a flush by first performing a clean, follow by an invalidation
> operation.
> 
> v2 (Michael Cheng): Use correct macro for cleaning and invalidation the
> 		    dcache.
> 
> v3 (Michael Cheng): Remove ifdef for asm/cacheflush.h
> 
> v4 (Michael Cheng): Rebase
> 
> Signed-off-by: Michael Cheng <michael.cheng@intel.com>
> ---
>   drivers/gpu/drm/drm_cache.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
> index 66597e411764..ec8d91b088ff 100644
> --- a/drivers/gpu/drm/drm_cache.c
> +++ b/drivers/gpu/drm/drm_cache.c
> @@ -28,6 +28,7 @@
>    * Authors: Thomas Hellström <thomas-at-tungstengraphics-dot-com>
>    */
>   
> +#include <asm/cacheflush.h>

I thought linux/cacheflush.h would be correct.

Regards,

Tvrtko

>   #include <linux/cc_platform.h>
>   #include <linux/export.h>
>   #include <linux/highmem.h>
> @@ -174,6 +175,10 @@ drm_clflush_virt_range(void *addr, unsigned long length)
>   
>   	if (wbinvd_on_all_cpus())
>   		pr_err("Timed out waiting for cache flush\n");
> +
> +#elif defined(CONFIG_ARM64)
> +	void *end = addr + length;
> +	dcache_clean_inval_poc((unsigned long)addr, (unsigned long)end);
>   #else
>   	WARN_ONCE(1, "Architecture has no drm_cache.c support\n");
>   #endif
