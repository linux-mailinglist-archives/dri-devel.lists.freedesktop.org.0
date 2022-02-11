Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C3B4B273A
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 14:33:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A35C710EC32;
	Fri, 11 Feb 2022 13:33:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B480510EC2F;
 Fri, 11 Feb 2022 13:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644586423; x=1676122423;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ZB0thDY0O1ufxTNqhnXJ7IpR3uJXkuqwgo6tVv0SNWE=;
 b=iz+rxyT1INq3g7sD4ORkxKuRiupCHXMbRF69qh+yK/P3DobD50ELfIM9
 6gVidPvbBWU+l8GdGYjp+Q7ypy6wA8jxabmdpG95CCsl+Or3mKfc46SdB
 1+ADfB9Dp16Ua1XvQeNqPcgl5O5wkoujDtrUvTLU8ze21Zi7whSskBaOS
 +/3nmJGXwqJ4vxCPABPHxvfvPtBzWX4Fzd2EpPbJ0GYPUmXsC2n/aFR3O
 Q4ocHo7bzd4vk6ipAscY+akmi8wMJ5ILMPeW8ubXq0vqqmAMzVix7VU9m
 r7K4erFmCuSk9I2ax3VYYD7xp6DMf6HpoFzAu2w9RZjuxi8QxzahtzF/p A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="249480908"
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; d="scan'208";a="249480908"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 05:33:43 -0800
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; d="scan'208";a="542092408"
Received: from rriverox-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.19.108])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 05:33:40 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Michael Cheng <michael.cheng@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v1 1/1] drm/i915/gt: Move wbvind_on_all_cpus #define
In-Reply-To: <20220210214216.1227694-2-michael.cheng@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220210214216.1227694-1-michael.cheng@intel.com>
 <20220210214216.1227694-2-michael.cheng@intel.com>
Date: Fri, 11 Feb 2022 15:33:37 +0200
Message-ID: <87iltl7cjy.fsf@intel.com>
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
Cc: tvrtko.ursulin@linux.intel.com, michael.cheng@intel.com,
 balasubramani.vivekanandan@intel.com, wayne.boyer@intel.com,
 casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 10 Feb 2022, Michael Cheng <michael.cheng@intel.com> wrote:
> Move wbvind_on_all_cpus to intel_gt.h. This will allow other wbind_on_all_cpus
> calls to benefit from the #define logic, and prevent compiler errors
> when building for non-x86 architectures.
>
> Signed-off-by: Michael Cheng <michael.cheng@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_pm.c | 7 -------
>  drivers/gpu/drm/i915/gt/intel_gt.h     | 7 +++++++
>  2 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pm.c b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
> index 6da68b38f00f..ff7340ae5ac8 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_pm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
> @@ -12,13 +12,6 @@
>  
>  #include "i915_drv.h"
>  
> -#if defined(CONFIG_X86)
> -#include <asm/smp.h>
> -#else
> -#define wbinvd_on_all_cpus() \
> -	pr_warn(DRIVER_NAME ": Missing cache flush in %s\n", __func__)
> -#endif
> -
>  void i915_gem_suspend(struct drm_i915_private *i915)
>  {
>  	GEM_TRACE("%s\n", dev_name(i915->drm.dev));
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
> index 2dad46c3eff2..149e8c13e402 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.h
> @@ -10,6 +10,13 @@
>  #include "intel_gt_types.h"
>  #include "intel_reset.h"
>  
> +#if defined(CONFIG_X86)
> +#include <asm/smp.h>
> +#else
> +#define wbinvd_on_all_cpus() \
> +         pr_warn(DRIVER_NAME ": Missing cache flush in %s\n", __func__)
> +#endif

Don't include headers from headers if it can be avoided.

gt/intel_gt.h is included from 79 files. We don't want all of them to
include <asm/smp.h> when only 3 files actually need
wbinvd_on_all_cpus().

Also, gt/intel_gt.h has absolutely nothing to do with
wbinvd_on_all_cpus() or asm/smp.h. Please don't use topical headers as
dumping grounds for random things.

Maybe a better idea is to add a local wrapper for wbinvd_on_all_cpus()
that does the right thing. Or add the above in a dedicated header.


BR,
Jani.


> +
>  struct drm_i915_private;
>  struct drm_printer;

-- 
Jani Nikula, Intel Open Source Graphics Center
