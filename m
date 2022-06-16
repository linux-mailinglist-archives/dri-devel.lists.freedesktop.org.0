Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE9654E36A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 16:30:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 071621126B1;
	Thu, 16 Jun 2022 14:30:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE08610E357;
 Thu, 16 Jun 2022 14:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655389821; x=1686925821;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=J6v8J5QcgSyKWcIQxsj1OTlgv6v5a7w3ry5kyZmJgDs=;
 b=XIsuuuupBM8I0ZH7k3H8pYBsjDwklrX2jsrm+GK/WFSsqbdClRGtomXR
 JhQ5TAyjZO7iRshnxcSbhkJKRvcosOJabcnTbuLZONPgzdcIf9R+ctWNu
 eBUA9YDihGbj2iFpTzg8ygEYkVHyDlmez2s/803dzl0QXZ4cJYBvrBHxU
 UFQeEHuqjP0Wx387a2jbQOFyF99JBcXOwHX93N8xPXNxfEeQEysvxsWT8
 tGky38FRruvtExPaFh/JmuRH9dHbzBWooogxJd13tU1aI0Mmd5R8k8o7V
 fqcvGDk2EYj0PGOyEVORKPfsICpF+8UHeXlokxWkBYe/K9vmVvR52HJ6I w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="280293034"
X-IronPort-AV: E=Sophos;i="5.92,305,1650956400"; d="scan'208";a="280293034"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 07:30:19 -0700
X-IronPort-AV: E=Sophos;i="5.92,305,1650956400"; d="scan'208";a="641566330"
Received: from aamendol-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.33.35])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 07:30:18 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v2 8/9] drm/i915/xehpsdv: Store lmem region
 in gt
In-Reply-To: <20220616120106.24353-9-anshuman.gupta@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220616120106.24353-1-anshuman.gupta@intel.com>
 <20220616120106.24353-9-anshuman.gupta@intel.com>
Date: Thu, 16 Jun 2022 17:30:15 +0300
Message-ID: <87y1xwvfyg.fsf@intel.com>
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
Cc: Andi Shyti <andi.shyti@intel.com>, rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 Jun 2022, Anshuman Gupta <anshuman.gupta@intel.com> wrote:
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

Please never add includes in headers when a forward declaration is
sufficient. I'm spending a lot of time trying to reduce the include
dependencies we have.

BR,
Jani.

>  #include "intel_reset_types.h"
>  #include "intel_rc6_types.h"
>  #include "intel_rps_types.h"
> @@ -202,6 +203,8 @@ struct intel_gt {
>  	 */
>  	phys_addr_t phys_addr;
>  
> +	struct intel_memory_region *lmem;
> +
>  	struct intel_gt_info {
>  		unsigned int id;

-- 
Jani Nikula, Intel Open Source Graphics Center
