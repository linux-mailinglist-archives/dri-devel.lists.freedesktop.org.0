Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 794BB4F9B13
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 18:51:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5646210E2FF;
	Fri,  8 Apr 2022 16:51:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EFEC10E2FF;
 Fri,  8 Apr 2022 16:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649436691; x=1680972691;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pFtsYhUOl2x5/uSE+YDixqpZibodbOjU37Y3NYpEI2M=;
 b=l0j5AjVqKFfwwA6p5AVsIYQE3Qhiotx7DNgEbnsEnTmdvfGtEJ3G1g16
 ey+aw2VvkN6/axgnKLAHKuquh0Ly02ERBB74R36ulV77Z/MBT907k5QYQ
 02ldFayzTMZZB2+I6Xau+fTyGNPRA9F0/RjSUaLjT7GV64y26jcr88Ku3
 if9pynEfhHd/H5qLu2y+PyfDepGDSfsqtCsDtDOfPusrKvMcCnjZ1eJHI
 lEpattZ9cZRoGw1p9654PYw59TheTXs7BTatxfjKU5n+oxRKQQ1rlvBlz
 05S8h2g+MfSXt1ZtzXi5MEpHmQn6gMy6t+Bw1PydNifcQIpSLPmb9H5bU Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="348074844"
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; d="scan'208";a="348074844"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 09:51:30 -0700
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; d="scan'208";a="550568819"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 09:51:30 -0700
Date: Fri, 8 Apr 2022 09:51:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/i915/uncore: Warn only if unclaimed access remains
 flagged
Message-ID: <YlBoEQsevdFahwYJ@mdroper-desk1.amr.corp.intel.com>
References: <20220408164837.3845786-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220408164837.3845786-1-lucas.demarchi@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 08, 2022 at 09:48:37AM -0700, Lucas De Marchi wrote:
> Commit 4b276ed3c7ac ("drm/i915/uncore: Warn on previous unclaimed
> accesses") tried to improve our report of unclaimed register access,
> however it unveiled cases that were not previously causing any harm.
> 
> Downgrade the first message to debug so we can still see them and
> eventually fix, but don't warn.
> 
> Fixes: 4b276ed3c7ac ("drm/i915/uncore: Warn on previous unclaimed accesses")
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
> 
> Tested on top of intel/CI_DRM_11471 as drm-tip is currently broken by
> other things.
> 
>  drivers/gpu/drm/i915/intel_uncore.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
> index df59ec88459e..83517a703eb6 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.c
> +++ b/drivers/gpu/drm/i915/intel_uncore.c
> @@ -1518,13 +1518,11 @@ __unclaimed_previous_reg_debug(struct intel_uncore *uncore,
>  			       const i915_reg_t reg,
>  			       const bool read)
>  {
> -	if (drm_WARN(&uncore->i915->drm,
> -		     check_for_unclaimed_mmio(uncore),
> -		     "Unclaimed access detected before %s register 0x%x\n",
> -		     read ? "read from" : "write to",
> -		     i915_mmio_reg_offset(reg)))
> -		/* Only report the first N failures */
> -		uncore->i915->params.mmio_debug--;
> +	if (check_for_unclaimed_mmio(uncore))
> +		drm_dbg(&uncore->i915->drm,
> +			"Unclaimed access detected before %s register 0x%x\n",
> +			read ? "read from" : "write to",
> +			i915_mmio_reg_offset(reg));
>  }
>  
>  static inline void
> -- 
> 2.35.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
