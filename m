Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8B94A71A3
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 14:34:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42B8610E4AB;
	Wed,  2 Feb 2022 13:34:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0ED010E44E;
 Wed,  2 Feb 2022 13:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643808893; x=1675344893;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=5vKWgAx7/cbN9y77fncDnBrN3vJpObfNmaHjbcKoD7A=;
 b=cu1hD+4Lee43azvgh1ku44EkjOWfjW1D/rPMG6LmLX1Hq94YH2lbBmpe
 cPEuYnP7zG2Qif/LzFBOVlQuu9n5WXyTvYCYj5TsVrFq4vimYGLHotIct
 W+O6Dz6T5yDWSO+0ApyTIQtUYQyBLxjK6W7UUYFHoL3irBWU36l/CtXJ8
 BDZtzwvwZZvTcf5NbyGqUtJswAfJ9eCiI1G1CkrFPs0tKvDUoXWm5e0qX
 kMH6exRnu5Za4/6mIE9egG+XsPe2JIa2VZarOfKQju3BH5tLsQTptEOP1
 e5QqY89mxjdiNpZa9mBU+IehbOZIoux7J73eVMxz7T+j0aJ4I91JL8Z+R A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="227883044"
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; d="scan'208";a="227883044"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 05:34:53 -0800
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; d="scan'208";a="583433859"
Received: from xwan118-mobl1.ger.corp.intel.com (HELO [10.249.254.236])
 ([10.249.254.236])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 05:34:52 -0800
Message-ID: <db2784fb-7bd8-40aa-3af2-b06bbcb48e56@linux.intel.com>
Date: Wed, 2 Feb 2022 14:34:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 11/20] drm/i915/ttm: tweak priority hint selection
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220126152155.3070602-1-matthew.auld@intel.com>
 <20220126152155.3070602-12-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20220126152155.3070602-12-matthew.auld@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/26/22 16:21, Matthew Auld wrote:
> For some reason we are selecting PRIO_HAS_PAGES when we don't have
> mm.pages, and vice versa. Perhaps something else is going on here.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>

LGTM. Should we add a Fixes: tag here?

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index e60b677ecd54..e4cd6ccf5ab1 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -848,11 +848,9 @@ void i915_ttm_adjust_lru(struct drm_i915_gem_object *obj)
>   	} else if (obj->mm.madv != I915_MADV_WILLNEED) {
>   		bo->priority = I915_TTM_PRIO_PURGE;
>   	} else if (!i915_gem_object_has_pages(obj)) {
> -		if (bo->priority < I915_TTM_PRIO_HAS_PAGES)
> -			bo->priority = I915_TTM_PRIO_HAS_PAGES;
> +		bo->priority = I915_TTM_PRIO_NO_PAGES;
>   	} else {
> -		if (bo->priority > I915_TTM_PRIO_NO_PAGES)
> -			bo->priority = I915_TTM_PRIO_NO_PAGES;
> +		bo->priority = I915_TTM_PRIO_HAS_PAGES;
>   	}
>   
>   	ttm_bo_move_to_lru_tail(bo, bo->resource, NULL);
