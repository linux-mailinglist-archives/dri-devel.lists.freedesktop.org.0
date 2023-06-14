Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB7B72FFEA
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 15:22:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4873110E45A;
	Wed, 14 Jun 2023 13:22:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F85610E455;
 Wed, 14 Jun 2023 13:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686748950; x=1718284950;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=krZlgUF812lZ1Msg1luNdv0RZ6yxrI7AK5Nw8giEATI=;
 b=UDMs43fsWXq0FQ965v2WXm403z8zZhfMfZ/4iOO4qNlQ9oW5K77TcfBj
 VikN3Scej99lDxoKk3wnYp8/2W3sRfU7GztTF+cVtsYGQIxLDnaWrA3TO
 4oVwLDS7ZbCGaGmclrIlbk4S0VE5kQh6c3rDT8ebglzHjyfUHgt1dnwSN
 VZ6RYqLRYVoT/8bZAhJKsqo8W/er4ccJDlwPfSF4LnWuG8hyq5syS747/
 ElAoSO95Ss1/Eu4RzvT3imBPUfys8O8msngQfmZIFUw2Sj3O8GxYoHRes
 7cOxXHMIM22i8EX7xwtKtXfIKwz7/FQeh+IjBtzL3XWvrXYvThltwWcDL A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="444977889"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; d="scan'208";a="444977889"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2023 06:22:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="801899074"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; d="scan'208";a="801899074"
Received: from sobyrne-mobl1.ger.corp.intel.com (HELO [10.213.224.182])
 ([10.213.224.182])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2023 06:22:25 -0700
Message-ID: <bebd57fc-7135-dc97-701e-54cb9c2955c0@linux.intel.com>
Date: Wed, 14 Jun 2023 14:22:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/i915: Call page_address() on page acquired with
 GFP_KERNEL flag
Content-Language: en-US
To: Sumitra Sharma <sumitraartsy@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20230614123556.GA381200@sumitra.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230614123556.GA381200@sumitra.com>
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
Cc: Deepak R Varma <drv@mailo.com>, Fabio <fmdefrancesco@gmail.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 14/06/2023 13:35, Sumitra Sharma wrote:
> Pages allocated with GFP_KERNEL cannot come from Highmem.
> That is why there is no need to call kmap() on them.

Are you sure it is GFP_KERNEL backed and not tmpfs? I am not sure myself 
so let me copy Matt and Thomas if they happen to know off hand.

Regards,

Tvrtko

> Therefore, don't call kmap() on the page coming from
> vma_res->bi.pages using for_each_sgt_page() in
> i915_vma_coredump_create().
> 
> Use a plain page_address() to get the kernel address instead.
> 
> Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
> ---
>   drivers/gpu/drm/i915/i915_gpu_error.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
> index f020c0086fbc..6f51cb4fc55c 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> @@ -1164,9 +1164,8 @@ i915_vma_coredump_create(const struct intel_gt *gt,
>   
>   			drm_clflush_pages(&page, 1);
>   
> -			s = kmap(page);
> +			s = page_address(page);
>   			ret = compress_page(compress, s, dst, false);
> -			kunmap(page);
>   
>   			drm_clflush_pages(&page, 1);
>   
