Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8087F0FD5
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 11:07:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B9DE10E394;
	Mon, 20 Nov 2023 10:07:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25EF810E38A;
 Mon, 20 Nov 2023 10:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700474835; x=1732010835;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=jJIlMZpuwkKpDkHcK/QWHDOVBSdGTpjF0AQ7LQOFB3o=;
 b=S0Z3SZjy72VCeFY1HIhJa2cr4nN3rzpQmmn6UrA7epLHh2cZZ8ROs1jc
 u0EjBpLxEqPQswh15mVdClJwkuHCLzKg1AJIQ35ejOvfC9S+sZ7N3Ud5P
 w63nggsleBtoMQKiAfghsEIxtg2AZcR0JLxqcvRFOX+fLoeuZntK94XR9
 ackHzgZWSIepmso8cbK2tCIwWKl7qulUCThG/DIHPb6eTy2vjaA2GgVsD
 rWicei6My6w+F8egTVUyl0H1EvCnk8igO96BrCjFXHh+9tR+neAPE0WDV
 xO5HXmoBwhGPwJqZJ/bFd5M3xwOm22J42ocgMDRTwJIBv9E2AAv2eBd0o w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="10265500"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; d="scan'208";a="10265500"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 02:04:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="836699534"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; d="scan'208";a="836699534"
Received: from avmoskal-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.40.194])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 02:04:01 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915: Add __rcu annotation to
 cursor when iterating client objects
In-Reply-To: <20231113085457.199053-2-tvrtko.ursulin@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231113085457.199053-1-tvrtko.ursulin@linux.intel.com>
 <20231113085457.199053-2-tvrtko.ursulin@linux.intel.com>
Date: Mon, 20 Nov 2023 12:03:58 +0200
Message-ID: <87cyw4pwq9.fsf@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 13 Nov 2023, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> __rcu annotation is needed to avoid the sparse warnings such as:
>
>   .../i915_drm_client.c:92:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
>   .../i915_drm_client.c:92:9: sparse:    struct list_head [noderef] __rcu *
>   .../i915_drm_client.c:92:9: sparse:    struct list_head *
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Fixes: 968853033d8a ("drm/i915: Implement fdinfo memory stats printing")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202311110610.h0m6ydI5-lkp@intel.com/
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/i915_drm_client.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
> index be9acfd9410e..fa6852713bee 100644
> --- a/drivers/gpu/drm/i915/i915_drm_client.c
> +++ b/drivers/gpu/drm/i915/i915_drm_client.c
> @@ -78,7 +78,7 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
>  	struct drm_i915_private *i915 = fpriv->i915;
>  	struct drm_i915_gem_object *obj;
>  	struct intel_memory_region *mr;
> -	struct list_head *pos;
> +	struct list_head __rcu *pos;
>  	unsigned int id;
>  
>  	/* Public objects. */

-- 
Jani Nikula, Intel
