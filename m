Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD0C6D7ED1
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 16:11:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5BC910E97A;
	Wed,  5 Apr 2023 14:11:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6214910E973;
 Wed,  5 Apr 2023 14:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680703889; x=1712239889;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2oUov4UWF8Lmx3dFADc7qojmM8YOCQkPSyu6cuKr5As=;
 b=OO+Yc5oyXgCe0qU1skfS2NA4NdNNkjpXldeQtyJ0T3IB+fkon4z5nkaU
 G/H240tDRDqxdg5lHF6mR8oQ33RY7kQclI7UIhOs7E6k8Fyotu/R/tOJ9
 XraAJW8T8LneioQR71WXwIrTMf6BdgzHRJyHCgFW3C+Y5TF0LpLdpgtBp
 qqr2rCub4v2LYZtNADxgLaaA2h2Ub6pmDjYkNFJ5+Zx2rQkPYLE6R1GQa
 ewUhAXdhRutJrhk9Lqvnn4PquHRqhq66M4wtWdMEfWKJwktrfQ47WLMia
 QYLANtdoxJprcIDn6lwdCNsQUM90kPjw786kcBQzpbzRLB2lnURhmpUI7 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="428745622"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; d="scan'208";a="428745622"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 07:11:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="717055515"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; d="scan'208";a="717055515"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.30.7])
 ([10.213.30.7])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 07:11:19 -0700
Message-ID: <0fd2b66e-958c-32d4-2491-7d3e323e6045@intel.com>
Date: Wed, 5 Apr 2023 16:11:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.1
Subject: Re: [PATCH 2/5] drm/i915/display: Set I915_BO_ALLOC_USER for fb
Content-Language: en-US
To: Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
References: <20230404143100.10452-1-nirmoy.das@intel.com>
 <20230404143100.10452-2-nirmoy.das@intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230404143100.10452-2-nirmoy.das@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 04.04.2023 16:30, Nirmoy Das wrote:
> Framebuffer is exposed to userspace so make sure we set
> proper flags for it. Set I915_BO_PREALLOC for prealloced
> fb so that ttm won't clear existing data.
>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Imre Deak <imre.deak@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
> ---
>   drivers/gpu/drm/i915/display/intel_fbdev.c         | 3 ++-
>   drivers/gpu/drm/i915/display/intel_plane_initial.c | 4 +++-
>   2 files changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
> index 673bcdfb7ff6..f7d48d00ae4b 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
> @@ -163,7 +163,8 @@ static int intelfb_alloc(struct drm_fb_helper *helper,
>   	obj = ERR_PTR(-ENODEV);
>   	if (HAS_LMEM(dev_priv)) {
>   		obj = i915_gem_object_create_lmem(dev_priv, size,
> -						  I915_BO_ALLOC_CONTIGUOUS);
> +						  I915_BO_ALLOC_CONTIGUOUS |
> +						  I915_BO_ALLOC_USER);
>   	} else {
>   		/*
>   		 * If the FB is too big, just don't use it since fbdev is not very
> diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
> index bb6ea7de5c61..736072a8b2b0 100644
> --- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
> +++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
> @@ -110,7 +110,9 @@ initial_plane_vma(struct drm_i915_private *i915,
>   	    size * 2 > i915->dsm.usable_size)
>   		return NULL;
>   
> -	obj = i915_gem_object_create_region_at(mem, phys_base, size, 0);
> +	obj = i915_gem_object_create_region_at(mem, phys_base, size,
> +					       I915_BO_ALLOC_USER |
> +					       I915_BO_PREALLOC);
>   	if (IS_ERR(obj))
>   		return NULL;
>   

