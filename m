Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 182064F9164
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 11:08:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F02D10F0AC;
	Fri,  8 Apr 2022 09:08:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7399410E12F;
 Fri,  8 Apr 2022 09:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649408908; x=1680944908;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=nusa4EmK+nPxdUt36aGuigSYRKniiWSU6T978ZUZ/FI=;
 b=dMKEw0ERYQMj/3KYnIV30S4g4+Mh2HIfobSfrD6cnxFGCcE0uExxZuy5
 1srGkik42GEcHNihiKD0BvcXeutI44D+fiAABABSgTEz27/Km9VQkkPxR
 qdV71mw3waJJwKiFI7sZ6WPpqi8zZoQFXljvnFAxasHwQ4MiDH7zzFQRr
 ZhLdMm5UQbF7Q+6kvfEDsrT0wmeLOBhW+3BbfcIyi5fuMoFjVzqMymmRO
 zEQu6VHTcv0wa57mgmmcDxk2K5Ydwl/JU4MMxZmaCrDL2jii73UwNxe1f
 SPghCMVHKHRKYICHH3fX4ACUxD5QhIDfOvUYkzBhdraKaqbOVormq1ZA9 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="322238731"
X-IronPort-AV: E=Sophos;i="5.90,244,1643702400"; d="scan'208";a="322238731"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 02:08:27 -0700
X-IronPort-AV: E=Sophos;i="5.90,244,1643702400"; d="scan'208";a="571422301"
Received: from ddobson-mobl.ger.corp.intel.com (HELO [10.213.224.220])
 ([10.213.224.220])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 02:08:26 -0700
Message-ID: <2b3b28b9-6746-9fb3-3651-16f7a029d2e7@linux.intel.com>
Date: Fri, 8 Apr 2022 10:08:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915: fix
 i915_gem_object_wait_moving_fence
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220407164532.1242578-1-matthew.auld@intel.com>
 <20220407164532.1242578-2-matthew.auld@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220407164532.1242578-2-matthew.auld@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 07/04/2022 17:45, Matthew Auld wrote:
> All of CI is just failing with the following, which prevents loading of
> the module:
> 
>      i915 0000:03:00.0: [drm] *ERROR* Scratch setup failed
> 
> Best guess is that this comes from the pin_map() for the scratch page,
> which does an i915_gem_object_wait_moving_fence() somewhere. It looks
> like this now calls into dma_resv_wait_timeout() which can return the
> remaining timeout, leading to the caller thinking this is an error.
> 
> Fixes: 1d7f5e6c5240 ("drm/i915: drop bo->moving dependency")

Has this one went in bypassing i915 CI and merged via drm-misc-next? If 
so I think it's the 2nd large disruption to i915 CI flows recently so 
the lesson here is try not to bypass i915 CI when merging i915 patches.

In this particular example, unless there were merge conflicts causing 
the series not to apply against drm-tip, it should have been doable to 
copy intel-gfx on all patches and so get the CI results. (Even if just 
with --subject-prefix=CI && --suppress-cc=all before merging.)

The second question is which branch to merge through, on which I think 
i915 maintainers would have liked to be consulted.

Regards,

Tvrtko

> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_object.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> index 2998d895a6b3..1c88d4121658 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> @@ -772,9 +772,14 @@ int i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj,
>   int i915_gem_object_wait_moving_fence(struct drm_i915_gem_object *obj,
>   				      bool intr)
>   {
> +	long ret;
> +
>   	assert_object_held(obj);
> -	return dma_resv_wait_timeout(obj->base. resv, DMA_RESV_USAGE_KERNEL,
> -				     intr, MAX_SCHEDULE_TIMEOUT);
> +
> +	ret = dma_resv_wait_timeout(obj->base. resv, DMA_RESV_USAGE_KERNEL,
> +				    intr, MAX_SCHEDULE_TIMEOUT);
> +
> +	return ret < 0 ? ret : 0;
>   }
>   
>   #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
