Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B567E54FBBC
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 18:57:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1C9810F3BF;
	Fri, 17 Jun 2022 16:57:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE3D910EB0A;
 Fri, 17 Jun 2022 16:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655485046; x=1687021046;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=W148iBq1FG+Msc13/lGtTcqFp/Gr3+ynFX4fD6ibi+w=;
 b=anCMadccjVxcEyQ/kuVMawPcX3IMb3rqYW8t0LhVfUsji04/wkmx7n31
 GoNcQn5IOEFY+51n9lKQB5H7hXHdxDuzmzNSFFVuOtO95h3D44SBgfxuD
 dvUMgiBiFBCHlfc9mQolH+Rwj/kpf74eZs6BfrbpeH4L51/qbi+pgmKDD
 ay+NE+3/QiU3j2BnFwuoNQBwfTPQ0xGRpTLqX5k0yxntA8zk/heAGPCbD
 IgDO4MHvglMUDntxiJ1KYNXs8+0KCYb2YaEEiA5hUobMPkgYFXZk1W+w2
 Ion/2RrmQB3umOVCLWmxRUh9HlTlF7F3Qjia9r1v3hqjT8nXNGDSZg5sL w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="304934609"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="304934609"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 06:45:36 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="642037027"
Received: from theodo2x-mobl3.amr.corp.intel.com (HELO intel.com)
 ([10.249.41.104])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 06:45:33 -0700
Date: Fri, 17 Jun 2022 15:45:31 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Subject: Re: [PATCH v2 8/9] drm/i915/xehpsdv: Store lmem region in gt
Message-ID: <YqyFe38Tgadb6GmW@intel.intel>
References: <20220616120106.24353-1-anshuman.gupta@intel.com>
 <20220616120106.24353-9-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616120106.24353-9-anshuman.gupta@intel.com>
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
Cc: tilak.tangudu@intel.com, tvrtko.ursulin@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jon.ewins@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Jun 16, 2022 at 05:31:05PM +0530, Anshuman Gupta wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Store a pointer to respective local memory region in intel_gt so it can be
> used when memory local to a GT needs to be allocated.
> 
> Cc: Andi Shyti <andi.shyti@intel.com>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt.c       | 1 +
>  drivers/gpu/drm/i915/gt/intel_gt_types.h | 3 +++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index f33290358c51..7a535f670ae1 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -91,6 +91,7 @@ static int intel_gt_probe_lmem(struct intel_gt *gt)
>  	GEM_BUG_ON(!HAS_REGION(i915, id));
>  	GEM_BUG_ON(i915->mm.regions[id]);
>  	i915->mm.regions[id] = mem;
> +	gt->lmem = mem;
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> index df708802889d..cd7744eaaeaa 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> @@ -23,6 +23,7 @@
>  #include "intel_gt_buffer_pool_types.h"
>  #include "intel_hwconfig.h"
>  #include "intel_llc_types.h"
> +#include "intel_memory_region.h"
>  #include "intel_reset_types.h"
>  #include "intel_rc6_types.h"
>  #include "intel_rps_types.h"
> @@ -202,6 +203,8 @@ struct intel_gt {
>  	 */
>  	phys_addr_t phys_addr;
>  
> +	struct intel_memory_region *lmem;
> +

this was somewhere in my next patch that is getting very
delayed... anyway, with Jani's include note:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi

>  	struct intel_gt_info {
>  		unsigned int id;
>  
> -- 
> 2.26.2
