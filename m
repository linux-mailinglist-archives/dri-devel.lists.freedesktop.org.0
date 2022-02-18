Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 660B54BC156
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 21:45:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 645B610E1A2;
	Fri, 18 Feb 2022 20:45:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE1A10E1A2;
 Fri, 18 Feb 2022 20:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645217113; x=1676753113;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ytGWOUv+rroYtkc9HW6PYgRHtV54zeZ0C2cc5BZEZoQ=;
 b=NY0tpQwxjGR9MmjHCDMPkw4IZJiZmaBKJHQfLMYquX2ahBAQuN02kfsa
 dP/tCa2/L3GHdmTpMJfmFq5tDUy9U0rDpSL3KhyJclW6UNmdUgZGtpF3M
 w1fo7kDzEqU3d7u8tNhOuqB0VbNmyeXI3gVOBH6fSCjJknJ5qw/HxafOH
 Gl8aRlsvnxmhLsGIQjMklq3mofJUzu7VUIH/UkhMFc+z7WFFs7V1+ge+5
 qJAzQyuXo1mJ8CcsmGsao0fz87d/5wbUaK52rkvHXFIPSS/GMqUMzAUIj
 lu3NGPvEtmKpY8F6iyvnzC5b0tuIFrDUyfH7iWGfKRqc/CRuTCrmymAZf A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10262"; a="275800388"
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="275800388"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 12:45:12 -0800
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="705517496"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 12:45:11 -0800
Date: Fri, 18 Feb 2022 12:39:20 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH v3 11/16] drm/i915/guc: Replace check for golden context
 size
Message-ID: <20220218203920.GB3259@jons-linux-dev-box>
References: <20220216174147.3073235-1-lucas.demarchi@intel.com>
 <20220216174147.3073235-12-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220216174147.3073235-12-lucas.demarchi@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 16, 2022 at 09:41:42AM -0800, Lucas De Marchi wrote:
> In the other places in this function, guc->ads_map is being protected
> from access when it's not yet set. However the last check is actually
> about guc->ads_golden_ctxt_size been set before.  These checks should
> always match as the size is initialized on the first call to
> guc_prep_golden_context(), but it's clearer if we have a single return
> and check for guc->ads_golden_ctxt_size.
> 
> This is just a readability improvement, no change in behavior.
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> index 0077a63832ad..b739781bd133 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> @@ -500,10 +500,10 @@ static int guc_prep_golden_context(struct intel_guc *guc)
>  		addr_ggtt += alloc_size;
>  	}
>  
> -	if (iosys_map_is_null(&guc->ads_map))
> -		return total_size;
> +	/* Make sure current size matches what we calculated previously */
> +	if (guc->ads_golden_ctxt_size)
> +		GEM_BUG_ON(guc->ads_golden_ctxt_size != total_size);
>  
> -	GEM_BUG_ON(guc->ads_golden_ctxt_size != total_size);
>  	return total_size;
>  }
>  
> -- 
> 2.35.1
> 
