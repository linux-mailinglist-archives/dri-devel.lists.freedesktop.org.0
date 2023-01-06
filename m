Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F2665FDFC
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 10:30:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0229C10E846;
	Fri,  6 Jan 2023 09:30:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8415C10E845;
 Fri,  6 Jan 2023 09:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672997414; x=1704533414;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=L3XLTnt2PC2phaQBntNILIbKLlk/h/c2gjDwb/kJpOc=;
 b=eHiyA4p0oVsM9/VudTH8EKBd6MXJxLPJdkuz4aUpDsWtMqJ3zrpbNxGO
 vWkWix9FTMAuB6fLc3FuntauaYYU9sPsESwFldf81npUW19BTqrL/J8D4
 dIOhVxITpmb7ZEhjNy/3L6BhUa7nsQXleLC7PfFQu6lAb9Y+Ia9fn0Sgy
 nSGFY3PS9OvDz25bQmceMyrTBwcaqiah3A3AfBgbmrRksPpFalwAcNp84
 c5/7GW7vtGZXq86XFvNuBCwpmTG/St/L+qch0m0GN6VJuLbeZZ0xJIMFb
 C8Jz192x5YloOt24grbTmqbY6ZEXPvwPG9yuELp0vlRAjjUPfBQRT67zd Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="310232295"
X-IronPort-AV: E=Sophos;i="5.96,304,1665471600"; d="scan'208";a="310232295"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2023 01:30:13 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="779921070"
X-IronPort-AV: E=Sophos;i="5.96,304,1665471600"; d="scan'208";a="779921070"
Received: from joe-255.igk.intel.com (HELO localhost) ([172.22.229.67])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2023 01:30:08 -0800
Date: Fri, 6 Jan 2023 10:30:06 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: Re: [PATCH] drm/i915: Add missing check and destroy for
 alloc_workqueue
Message-ID: <20230106093006.GA1586324@linux.intel.com>
References: <20230106090934.6348-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230106090934.6348-1-jiasheng@iscas.ac.cn>
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
Cc: tvrtko.ursulin@linux.intel.com, stanislav.lisovskiy@intel.com,
 intel-gfx@lists.freedesktop.org, lucas.demarchi@intel.com,
 linux-kernel@vger.kernel.org, manasi.d.navare@intel.com,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 06, 2023 at 05:09:34PM +0800, Jiasheng Jiang wrote:
> Add checks for the return value of alloc_workqueue and
> alloc_ordered_workqueue as they may return NULL pointer and cause NULL
> pointer dereference.
> Moreover, destroy them when fails later in order to avoid memory leak.
> Because in `drivers/gpu/drm/i915/i915_driver.c`, if
> intel_modeset_init_noirq fails, its workqueues will not be destroyed.
> 
> Fixes: c26a058680dc ("drm/i915: Use a high priority wq for nonblocking plane updates")
> Fixes: 757fffcfdffb ("drm/i915: Put all non-blocking modesets onto an ordered wq")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>

Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

>  drivers/gpu/drm/i915/display/intel_display.c | 21 ++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 6c2686ecb62a..58f6840d6bd8 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -8655,26 +8655,35 @@ int intel_modeset_init_noirq(struct drm_i915_private *i915)
>  	intel_dmc_ucode_init(i915);
>  
>  	i915->display.wq.modeset = alloc_ordered_workqueue("i915_modeset", 0);
> +	if (!i915->display.wq.modeset) {
> +		ret = -ENOMEM;
> +		goto cleanup_vga_client_pw_domain_dmc;
> +	}
> +
>  	i915->display.wq.flip = alloc_workqueue("i915_flip", WQ_HIGHPRI |
>  						WQ_UNBOUND, WQ_UNBOUND_MAX_ACTIVE);
> +	if (!i915->display.wq.flip) {
> +		ret = -ENOMEM;
> +		goto cleanup_modeset;
> +	}
>  
>  	intel_mode_config_init(i915);
>  
>  	ret = intel_cdclk_init(i915);
>  	if (ret)
> -		goto cleanup_vga_client_pw_domain_dmc;
> +		goto cleanup_flip;
>  
>  	ret = intel_color_init(i915);
>  	if (ret)
> -		goto cleanup_vga_client_pw_domain_dmc;
> +		goto cleanup_flip;
>  
>  	ret = intel_dbuf_init(i915);
>  	if (ret)
> -		goto cleanup_vga_client_pw_domain_dmc;
> +		goto cleanup_flip;
>  
>  	ret = intel_bw_init(i915);
>  	if (ret)
> -		goto cleanup_vga_client_pw_domain_dmc;
> +		goto cleanup_flip;
>  
>  	init_llist_head(&i915->display.atomic_helper.free_list);
>  	INIT_WORK(&i915->display.atomic_helper.free_work,
> @@ -8686,6 +8695,10 @@ int intel_modeset_init_noirq(struct drm_i915_private *i915)
>  
>  	return 0;
>  
> +cleanup_flip:
> +	destroy_workqueue(i915->display.wq.flip);
> +cleanup_modeset:
> +	destroy_workqueue(i915->display.wq.modeset);
>  cleanup_vga_client_pw_domain_dmc:
>  	intel_dmc_ucode_fini(i915);
>  	intel_power_domains_driver_remove(i915);
> -- 
> 2.25.1
> 
