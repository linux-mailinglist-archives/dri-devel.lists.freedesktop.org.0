Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E23B4AD56C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 11:20:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30F1810E5A9;
	Tue,  8 Feb 2022 10:20:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE17510E5A9;
 Tue,  8 Feb 2022 10:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644315631; x=1675851631;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=QR/FGcjZGeFX/ZbBbenaXNWwLhYv6QtpxCSe6+NHh4g=;
 b=RCRt14Y5lVE/A/W0NEF5L90TPDrH66bAGixSSHFc+qKMJ7XjfDmIdfwg
 yKJ5wVU98fVv7qJTdMXFCPNx5ukJL0p66GxqKdrwdNHegYCBfwBmk6Lps
 nPoq2ddZNoo/90EqryKvDDjiBcF6zasJ6c2GVgvRxsYStbA7aNb/kt6YI
 XXIMxuIZVNxSEg5OIc7GtZdJeoSuCIRRX5J/23UYsE3Ckjfk9WP1ZFg8a
 zk/4+Trdn7tIk+XltHR8PyOPUbRSjBh0AGfVbOgyWuvJQHS9+0F7HJIhg
 SMMkDQ6DfCRFu363WA7vr4uWgsPbineuY5/6Lk17hYfoerTwpGz1C/xVB g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="249127140"
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="249127140"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 02:20:31 -0800
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="525497170"
Received: from kgonza2-mobl2.gar.corp.intel.com (HELO [10.213.198.226])
 ([10.213.198.226])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 02:20:29 -0800
Message-ID: <cc66b673-a875-1c50-e437-1ce29e7b2d15@linux.intel.com>
Date: Tue, 8 Feb 2022 10:20:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 6/6] drm: Add arch arm64 for drm_clflush_virt_range
Content-Language: en-US
To: Michael Cheng <michael.cheng@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220207201127.648624-1-michael.cheng@intel.com>
 <20220207201127.648624-7-michael.cheng@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220207201127.648624-7-michael.cheng@intel.com>
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


On 07/02/2022 20:11, Michael Cheng wrote:
> Use flush_tlb_kernel_range when invoking drm_clflush_virt_range on
> arm64 platforms. Using flush_tlb_kernel_range will:
> 
> 1. Make sure prior page-table updates have been completed
> 2. Invalidate the TLB
> 3. Check if the TLB invalidation has been completed

Arm does not have a clflush equivalent but invalidating TLBs there 
includes flushing caches?

Regards,

Tvrtko

> Signed-off-by: Michael Cheng <michael.cheng@intel.com>
> ---
>   drivers/gpu/drm/drm_cache.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
> index f19d9acbe959..d2506060a7c8 100644
> --- a/drivers/gpu/drm/drm_cache.c
> +++ b/drivers/gpu/drm/drm_cache.c
> @@ -176,6 +176,10 @@ drm_clflush_virt_range(void *addr, unsigned long length)
>   
>   	if (wbinvd_on_all_cpus())
>   		pr_err("Timed out waiting for cache flush\n");
> +
> +#elif defined(CONFIG_ARM64)
> +	void *end = addr + length;
> +	flush_tlb_kernel_range(*addr, *end);
>   #else
>   	pr_err("Architecture has no drm_cache.c support\n");
>   	WARN_ON_ONCE(1);
