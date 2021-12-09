Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FBB46F7C5
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 00:59:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2EE110E152;
	Thu,  9 Dec 2021 23:59:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FAE610E14E;
 Thu,  9 Dec 2021 23:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639094348; x=1670630348;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vYptbddzHFaDHp00yuMgqNlmeV7nu61+gUIwifXiCfQ=;
 b=l2vTm8CxPTARSogLb6OH0ZwqoBbOygKqlHEh95Iqk/dobOfymnqzN7La
 IFviv/s26OUS+6jb0RW8BpFXXU9H7xcXm1Y28QRYMmsvIG7R8kIGzoIKK
 e+4RSXZcnFbrNE1w1XPMTbnBi6QfoZ2e4EZlFl9ArwQ9jfe1vitT80QeD
 79ZYqAgQ4cV0Y8P+KTRNFLuDHydDMNRorjA+C347tQLenqLRezws8ruhs
 G9OWsYHJD7QJ5Mgt0PGaPHwicH9CzjRmH4jpYZ0Jmufehp6DFTcWzSH2G
 quSbu45GeFTGwJBFDDbhvVtn4JuDOqNzKeWcX5Pi/17lNcc9wyirCboPc w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="262340608"
X-IronPort-AV: E=Sophos;i="5.88,194,1635231600"; d="scan'208";a="262340608"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 15:59:07 -0800
X-IronPort-AV: E=Sophos;i="5.88,194,1635231600"; d="scan'208";a="680541308"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 15:59:06 -0800
Date: Thu, 9 Dec 2021 15:59:04 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v6 08/11] drm/i915/pxp: Use to_gt() helper
Message-ID: <20211209235904.GV2219399@mdroper-desk1.amr.corp.intel.com>
References: <20211209132512.47241-1-andi.shyti@linux.intel.com>
 <20211209132512.47241-9-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211209132512.47241-9-andi.shyti@linux.intel.com>
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
Cc: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Andi Shyti <andi@etezian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 09, 2021 at 03:25:09PM +0200, Andi Shyti wrote:
> Use to_gt() helper consistently throughout the codebase.
> Pure mechanical s/i915->gt/to_gt(i915). No functional changes.
> 
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/pxp/intel_pxp_tee.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> index 5d169624ad60..726c2b5a3fa3 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> @@ -14,9 +14,11 @@
>  #include "intel_pxp_tee.h"
>  #include "intel_pxp_tee_interface.h"
>  
> -static inline struct intel_pxp *i915_dev_to_pxp(struct device *i915_kdev)
> +static  struct intel_pxp *i915_dev_to_pxp(struct device *i915_kdev)

Was dropping the inline here intentional?  It doesn't seem like there's
any reason to drop it, and if it was intentional the whitespace isn't
quite right.


Matt

>  {
> -	return &kdev_to_i915(i915_kdev)->gt.pxp;
> +	struct drm_i915_private *i915 = kdev_to_i915(i915_kdev);
> +
> +	return &to_gt(i915)->pxp;
>  }
>  
>  static int intel_pxp_tee_io_message(struct intel_pxp *pxp,
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
