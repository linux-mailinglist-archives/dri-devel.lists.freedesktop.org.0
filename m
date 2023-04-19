Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB98C6E7A41
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 15:05:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 102E810E959;
	Wed, 19 Apr 2023 13:05:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8884E10E14A;
 Wed, 19 Apr 2023 13:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681909532; x=1713445532;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+fzf3GnoD2c1ibr43lQrYPva0Ckqt77AZnGUPWC0xM8=;
 b=aNiJRIO9O1RRA4oWSMc+PS5jjntrBgkjpR1taBpglNe9dsJsU1jrEhpV
 cqT5Vc4SA7ptSqJkb56rHN/kxk+sFMdo8EFXcocildYIQLKbH6K4Soh+R
 YbxjPpsyXDUPWvO2Z4zWN9lTfqjuwiw/4UJakay382irrLUc3QovJMWLd
 EWQ6hG33sOxmrzocX19z6KDDSvDB2/FR4m43+I+zs07xXESEYyjpK+qBf
 HHTeFpVY/GfOn/ivDJUs0+YefduX3BC7syFRnIAZ94Vt/uJq3Q60JZ1C0
 +MbNe2/uXTDHKqcNM/x0hBJVz1vHHQT/7mFI7xpbyJw4LsAkyrz35C9+y w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="344191211"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="344191211"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 06:05:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="694046918"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="694046918"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.18.145])
 ([10.213.18.145])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 06:05:29 -0700
Message-ID: <bb9f41b6-3925-6e48-adda-228633e5fc5a@intel.com>
Date: Wed, 19 Apr 2023 15:05:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [Intel-gfx] [PATCH 5/8] drm/i915/mtl: end support for set caching
 ioctl
Content-Language: en-US
To: fei.yang@intel.com, intel-gfx@lists.freedesktop.org
References: <20230417062503.1884465-1-fei.yang@intel.com>
 <20230417062503.1884465-6-fei.yang@intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230417062503.1884465-6-fei.yang@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17.04.2023 08:25, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> The design is to keep Buffer Object's caching policy immutable through
> out its life cycle. This patch ends the support for set caching ioctl
> from MTL onward. While doing that we also set BO's to be 1-way coherent
> at creation time because GPU is no longer automatically snooping CPU
> cache.
> 
> Signed-off-by: Fei Yang <fei.yang@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_domain.c | 3 +++
>   drivers/gpu/drm/i915/gem/i915_gem_shmem.c  | 9 ++++++++-
>   2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> index d2d5a24301b2..bb3575b1479f 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> @@ -337,6 +337,9 @@ int i915_gem_set_caching_ioctl(struct drm_device *dev, void *data,
>   	if (IS_DGFX(i915))
>   		return -ENODEV;
>   
> +	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
> +		return -EOPNOTSUPP;
> +
>   	switch (args->caching) {
>   	case I915_CACHING_NONE:
>   		level = I915_CACHE_NONE;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> index 37d1efcd3ca6..e602c323896b 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> @@ -601,7 +601,14 @@ static int shmem_object_init(struct intel_memory_region *mem,
>   	obj->write_domain = I915_GEM_DOMAIN_CPU;
>   	obj->read_domains = I915_GEM_DOMAIN_CPU;
>   
> -	if (HAS_LLC(i915))
> +	/*
> +	 * MTL doesn't snooping CPU cache by default for GPU access (namely

Sounds strange, "doesn't snoop" ?


> +	 * 1-way coherency). However some UMD's are currently depending on
> +	 * that. Make 1-way coherent the default setting for MTL. A follow
> +	 * up patch will extend the GEM_CREATE uAPI to allow UMD's specify
> +	 * caching mode at BO creation time

Shouldn't such comment be a part of patch description? or at least 
removed by follow-up patch.

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej


> +	 */
> +	if (HAS_LLC(i915) || (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70)))
>   		/* On some devices, we can have the GPU use the LLC (the CPU
>   		 * cache) for about a 10% performance improvement
>   		 * compared to uncached.  Graphics requests other than

