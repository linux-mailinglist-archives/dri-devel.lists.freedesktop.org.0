Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B6FAB9BE1
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 14:21:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B4010EA9E;
	Fri, 16 May 2025 12:21:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EnWY2+9r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D70EA10EA9C;
 Fri, 16 May 2025 12:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747398082; x=1778934082;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=KbMQWLdkhUidzB/bEjJRkq+md35Gtch4REzxgBVHyHA=;
 b=EnWY2+9rThw2P0l/MCsYl1Ap2Tkhwi/OQ4AzHfONXd3eivbv+vK7zIEB
 WV2XCC1twhJmHzrr6FJlgtr83p/BQufqNHwAp8ZxO0kFHMdnty/90ysoo
 qBOIz7p5TvLLSSwvJszkQk+SAEihAtQd472mb5791jALqpAGyCzmIfTOa
 ND96il3JbZMXn10231OJNdIZUkaVnVUa09J9c+VDOEjBZDsuv3pqoraDz
 7W7XU+doa612ynmEFO7/zZOG2uI9WDZ7Iz8y4OkwnsF39/pWcSpxgOt/J
 j8WYrnpqFtNpJi7M47czsZoCN6nosBGwObXf9WIIbbW9TZrSh1yg0+pDm A==;
X-CSE-ConnectionGUID: 7kYEuhgCSh+yMkoARI37KA==
X-CSE-MsgGUID: M2sIwA4TTxeQzrV1uRHrTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60710179"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="60710179"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 05:21:22 -0700
X-CSE-ConnectionGUID: kMLqN3/uSM28YvOAcz9ZYA==
X-CSE-MsgGUID: hCeQz30nT7SfLV2uwZAsDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="138594781"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.133])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 05:21:18 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Haoxiang Li <haoxiang_li2024@163.com>, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, airlied@gmail.com,
 simona@ffwll.ch, gustavo.sousa@intel.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Haoxiang Li
 <haoxiang_li2024@163.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2 RESEND] drm/i915/display: Add check for
 alloc_ordered_workqueue() and alloc_workqueue()
In-Reply-To: <20250424025539.3504019-1-haoxiang_li2024@163.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250424025539.3504019-1-haoxiang_li2024@163.com>
Date: Fri, 16 May 2025 15:21:15 +0300
Message-ID: <87cyc8wxtw.fsf@intel.com>
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

On Thu, 24 Apr 2025, Haoxiang Li <haoxiang_li2024@163.com> wrote:
> Add check for the return value of alloc_ordered_workqueue()
> and alloc_workqueue(). Furthermore, if some allocations fail,
> cleanup works are added to avoid potential memory leak problem.
>
> Fixes: 40053823baad ("drm/i915/display: move modeset probe/remove functions to intel_display_driver.c")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>

This patch seems to have been neglected, apologies.

I've rebased it and included it as part of a bigger series [1].

Thanks for the patch.

BR,
Jani.


[1] https://lore.kernel.org/r/cover.1747397638.git.jani.nikula@intel.com



> ---
> Changes in v2:
> - Split the compound conditional statement into separate
>   conditional statements to facilitate cleanup works.
> - Add cleanup works to destory work queues if allocations fail,
>   and modify the later goto destination to do the full excercise.
> - modify the patch description. Thanks, Jani!
> ---
>  .../drm/i915/display/intel_display_driver.c   | 30 +++++++++++++++----
>  1 file changed, 25 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
> index 31740a677dd8..ac94561715dc 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_driver.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
> @@ -241,31 +241,45 @@ int intel_display_driver_probe_noirq(struct intel_display *display)
>  	intel_dmc_init(display);
>  
>  	display->wq.modeset = alloc_ordered_workqueue("i915_modeset", 0);
> +	if (!display->wq.modeset) {
> +		ret = -ENOMEM;
> +		goto cleanup_vga_client_pw_domain_dmc;
> +	}
> +
>  	display->wq.flip = alloc_workqueue("i915_flip", WQ_HIGHPRI |
>  						WQ_UNBOUND, WQ_UNBOUND_MAX_ACTIVE);
> +	if (!display->wq.flip) {
> +		ret = -ENOMEM;
> +		goto cleanup_wq_modeset;
> +	}
> +
>  	display->wq.cleanup = alloc_workqueue("i915_cleanup", WQ_HIGHPRI, 0);
> +	if (!display->wq.cleanup) {
> +		ret = -ENOMEM;
> +		goto cleanup_wq_flip;
> +	}
>  
>  	intel_mode_config_init(display);
>  
>  	ret = intel_cdclk_init(display);
>  	if (ret)
> -		goto cleanup_vga_client_pw_domain_dmc;
> +		goto cleanup_wq_cleanup;
>  
>  	ret = intel_color_init(display);
>  	if (ret)
> -		goto cleanup_vga_client_pw_domain_dmc;
> +		goto cleanup_wq_cleanup;
>  
>  	ret = intel_dbuf_init(i915);
>  	if (ret)
> -		goto cleanup_vga_client_pw_domain_dmc;
> +		goto cleanup_wq_cleanup;
>  
>  	ret = intel_bw_init(i915);
>  	if (ret)
> -		goto cleanup_vga_client_pw_domain_dmc;
> +		goto cleanup_wq_cleanup;
>  
>  	ret = intel_pmdemand_init(display);
>  	if (ret)
> -		goto cleanup_vga_client_pw_domain_dmc;
> +		goto cleanup_wq_cleanup;
>  
>  	intel_init_quirks(display);
>  
> @@ -273,6 +287,12 @@ int intel_display_driver_probe_noirq(struct intel_display *display)
>  
>  	return 0;
>  
> +cleanup_wq_cleanup:
> +	destroy_workqueue(display->wq.cleanup);
> +cleanup_wq_flip:
> +	destroy_workqueue(display->wq.flip);
> +cleanup_wq_modeset:
> +	destroy_workqueue(display->wq.modeset);
>  cleanup_vga_client_pw_domain_dmc:
>  	intel_dmc_fini(display);
>  	intel_power_domains_driver_remove(display);

-- 
Jani Nikula, Intel
