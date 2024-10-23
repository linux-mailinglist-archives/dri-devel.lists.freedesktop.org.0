Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C4D9AC237
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 10:52:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43DDD10E0F7;
	Wed, 23 Oct 2024 08:52:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C/hrVGsa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52D3D10E0F7;
 Wed, 23 Oct 2024 08:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729673553; x=1761209553;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Q5ucK7d7uRJd+cvR1lR4/2r90nHVsOJOCPAxYH7QWpM=;
 b=C/hrVGsaevR5xrUlByPsr00+b0+uKusfnOxK+377Q0pOmFZ6ZLyT7lLA
 hpsv1elbcY2s567p+XXXgFQ+/6vNPlp4kBvYFMLlxAsk8NPhdUA5ktKsa
 1dP170axFy1OIhcRazumi9bQqB8NG/SDaZ5dxdkmua2F0dmWGCsYd6Y0K
 Ly1ZbB5rvDZcNOZwaGUcboQ9seHBM4LyriaQtpNFbY28n3QDLgfZhjXwG
 1P6on0zyhS1KqczdwNx9gQuXSJjjhwW6OkuCsyiUiLSggB6tW43rBrGBL
 L/i7aXZsYomErEus/mKfsUKiRzWqBPG8ICpo3s8QTCJbfwLS75FopEMI9 A==;
X-CSE-ConnectionGUID: uK5ERPOlSyqyc8a/rVHqow==
X-CSE-MsgGUID: aWhmlyLhTOGRZHSym/hP/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="51792575"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="51792575"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 01:52:33 -0700
X-CSE-ConnectionGUID: h73qZ12oSHigC3GIMnT0gA==
X-CSE-MsgGUID: ZVHijG1OSPSJdXDXnmMvjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; d="scan'208";a="80207426"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.84])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 01:52:29 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>, Zefan Li
 <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>, Andrew
 Morton <akpm@linux-foundation.org>
Cc: Friedrich Vock <friedrich.vock@gmx.de>, cgroups@vger.kernel.org,
 linux-mm@kvack.org, Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH 6/7] [HACK] drm/xe: Hack to test with mapped pages
 instead of vram.
In-Reply-To: <20241023075302.27194-7-maarten.lankhorst@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241023075302.27194-1-maarten.lankhorst@linux.intel.com>
 <20241023075302.27194-7-maarten.lankhorst@linux.intel.com>
Date: Wed, 23 Oct 2024 11:52:26 +0300
Message-ID: <875xpjurp1.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 23 Oct 2024, Maarten Lankhorst <maarten.lankhorst@linux.intel.com> wrote:
> We will probably want to make this a proper region in TTM for
> everything, so that we can charge VRAM twice, once for mapped
> in sysmem, once for mapped in vram. That way we don't need to
> deal with evict failing from lack of available memory in mapped.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/xe/xe_ttm_sys_mgr.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> index 9844a8edbfe19..20fa8ec8925ef 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> @@ -101,6 +101,18 @@ static void ttm_sys_mgr_fini(struct drm_device *drm, void *arg)
>  	ttm_set_driver_manager(&xe->ttm, XE_PL_TT, NULL);
>  }
>  
> +static inline void apply_cg(struct xe_device *xe,
> +			    struct ttm_resource_manager *man,
> +			    u64 gtt_size)

Ditto here about static inline in .c.

> +{
> +	int cgregion = xe->cg.num_regions++;
> +
> +	xe->cg.regions[cgregion].size = gtt_size;
> +	xe->cg.regions[cgregion].name = "mapped";
> +	man->cgdev = &xe->cg;
> +	man->cgidx = cgregion;
> +
> +}
>  int xe_ttm_sys_mgr_init(struct xe_device *xe)
>  {
>  	struct ttm_resource_manager *man = &xe->mem.sys_mgr;
> @@ -116,6 +128,8 @@ int xe_ttm_sys_mgr_init(struct xe_device *xe)
>  	man->func = &xe_ttm_sys_mgr_func;
>  	ttm_resource_manager_init(man, &xe->ttm, gtt_size >> PAGE_SHIFT);
>  	ttm_set_driver_manager(&xe->ttm, XE_PL_TT, man);
> +	apply_cg(xe, man, gtt_size);
> +
>  	ttm_resource_manager_set_used(man, true);
>  	return drmm_add_action_or_reset(&xe->drm, ttm_sys_mgr_fini, xe);
>  }

-- 
Jani Nikula, Intel
