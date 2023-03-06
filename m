Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E46526ABF6B
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 13:26:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 278BB10E28F;
	Mon,  6 Mar 2023 12:25:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7214A10E237;
 Mon,  6 Mar 2023 12:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678105555; x=1709641555;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DvRJHaMuy/Bgv1wwQbpVAxc6nZfgdyRa1oNnnVhzW6A=;
 b=gF1HX8QnemoWtfy/UdF0CMvkTd+B9XIeldnh8PQfbTWGNThqLAd0mP43
 wupWiHRltoWZJhDTjyqumgWsUbkBtuzSHv1z21dSKb8BPNrh1NPlzaJjc
 Nun9UGk6adTse+izLXjmaqdlb9bx7v/tuHTlXYtCElhqMrhumQW1nXzKG
 dy4mXyP3Y3RMZ2H0Y97hW/Fdmf86N84nndO6+vKPHuBhFVPeKvfBmVUPu
 c2e0ayuFaqG8JC62A96OqehUc6a6AFCa91P7nzZ8L5ncfTWBg0bBa/mYZ
 N8pq80mwDH35jgW7g2ju8XU7WDItrPnJfJn39o5w3+V/7yeX1XMDlihaK w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="363157825"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; d="scan'208";a="363157825"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 04:25:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="678461012"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; d="scan'208";a="678461012"
Received: from bdabrows-mobl.ger.corp.intel.com (HELO [10.252.23.95])
 ([10.252.23.95])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 04:25:53 -0800
Message-ID: <866f81b4-1968-95f8-49be-95b4927d8170@intel.com>
Date: Mon, 6 Mar 2023 12:25:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Subject: Re: [PATCH 1/3] drm/i915: Set I915_BO_ALLOC_USER for framebuffer
To: Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
References: <20230306120732.28656-1-nirmoy.das@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20230306120732.28656-1-nirmoy.das@intel.com>
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
Cc: andi.shyti@intel.com, andrzej.hajda@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/03/2023 12:07, Nirmoy Das wrote:
> Framebuffer is exposed to userspace so set I915_BO_ALLOC_USER
> flag for it. This also make sure that ttm allocates offset
> for lmem objects.
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_dpt.c           | 4 +++-
>   drivers/gpu/drm/i915/display/intel_fbdev.c         | 3 ++-
>   drivers/gpu/drm/i915/display/intel_plane_initial.c | 3 ++-
>   3 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dpt.c b/drivers/gpu/drm/i915/display/intel_dpt.c
> index ad1a37b515fb..2e6238881860 100644
> --- a/drivers/gpu/drm/i915/display/intel_dpt.c
> +++ b/drivers/gpu/drm/i915/display/intel_dpt.c
> @@ -254,7 +254,9 @@ intel_dpt_create(struct intel_framebuffer *fb)
>   
>   	size = round_up(size * sizeof(gen8_pte_t), I915_GTT_PAGE_SIZE);
>   
> -	dpt_obj = i915_gem_object_create_lmem(i915, size, I915_BO_ALLOC_CONTIGUOUS);
> +	dpt_obj = i915_gem_object_create_lmem(i915, size,
> +					      I915_BO_ALLOC_CONTIGUOUS |
> +					      I915_BO_ALLOC_USER);

AFAICT this is just some driver internal stuff for display page-table, 
which gets mapped through GGTT or something, and is not the actual fb. 
Is it really exposed to the user?

>   	if (IS_ERR(dpt_obj) && i915_ggtt_has_aperture(to_gt(i915)->ggtt))
>   		dpt_obj = i915_gem_object_create_stolen(i915, size);
>   	if (IS_ERR(dpt_obj) && !HAS_LMEM(i915)) {
> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
> index 3659350061a7..98ae3a3a986a 100644
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
> index bb6ea7de5c61..4a3680f6a3f5 100644
> --- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
> +++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
> @@ -110,7 +110,8 @@ initial_plane_vma(struct drm_i915_private *i915,
>   	    size * 2 > i915->dsm.usable_size)
>   		return NULL;
>   
> -	obj = i915_gem_object_create_region_at(mem, phys_base, size, 0);
> +	obj = i915_gem_object_create_region_at(mem, phys_base, size,
> +					       I915_BO_ALLOC_USER);

ALLOC_USER has the side effect of also zeroing the memory underneath, 
IIRC. However this here is the pre-allocated fb (will have some boot 
logo stuff), so we shouldn't ever clear it.

>   	if (IS_ERR(obj))
>   		return NULL;
>   
