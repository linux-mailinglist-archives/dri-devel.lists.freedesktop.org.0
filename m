Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3044B992C
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 07:26:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C71A10E855;
	Thu, 17 Feb 2022 06:26:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C15AC10E864;
 Thu, 17 Feb 2022 06:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645079158; x=1676615158;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dNl1rlK8v2GtG6lgGcY+Ma0sdxLR8kuh4Kr307+tjVo=;
 b=g9zp9MBEsy9YKgq+VK4j5mmYE+HzA2e8pge3bUwFNEV0yTSL6jPCv/Zx
 2IpO4DVDdlltcTlHvkzI9/zVn51KmQ+HjNsTpTpfpIlI7iwdMRwE+YhPq
 NkJuxVrQUPHNtkzv/igx0iD9cECWchGz4Mdnb4IKjYBWWSgaUs47ftn5t
 i2gX7MLxel0Zot//SWqDAlfIqj/QnVL7iXjGBc5q7lNWkLInQW36b8h1m
 nGCgB3ZonVByfqZ+YxiLRbkpIZPgYk35WD2M9muIVG6YKp/X7OWgvS81q
 pXCDbBbIWPEYEOoV56LYTxddOOKqR4J8ZjrA74+zKbPXLQPsiDThUBmdl Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="275392875"
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="275392875"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 22:25:58 -0800
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="776929797"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 22:25:58 -0800
Date: Wed, 16 Feb 2022 22:25:57 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH] drm/i915/guc/slpc: Use wrapper for reading RP_STATE_CAP
Message-ID: <Yg3qddt0mk3LvvwP@mdroper-desk1.amr.corp.intel.com>
References: <20220216025817.890-1-vinay.belgaumkar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220216025817.890-1-vinay.belgaumkar@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 15, 2022 at 06:58:17PM -0800, Vinay Belgaumkar wrote:
> This will ensure correct values for Gen12+ platforms.
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> index 13b27b8ff74e..cf075e726699 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> @@ -6,6 +6,7 @@
>  #include "i915_drv.h"
>  #include "intel_guc_slpc.h"
>  #include "gt/intel_gt.h"
> +#include "gt/intel_rps.h"
>  
>  static inline struct intel_guc *slpc_to_guc(struct intel_guc_slpc *slpc)
>  {
> @@ -574,10 +575,10 @@ static int slpc_use_fused_rp0(struct intel_guc_slpc *slpc)
>  
>  static void slpc_get_rp_values(struct intel_guc_slpc *slpc)
>  {
> +	struct intel_rps *rps = &slpc_to_gt(slpc)->rps;
>  	u32 rp_state_cap;
>  
> -	rp_state_cap = intel_uncore_read(slpc_to_gt(slpc)->uncore,
> -					 GEN6_RP_STATE_CAP);
> +	rp_state_cap = intel_rps_read_state_cap(rps);
>  
>  	slpc->rp0_freq = REG_FIELD_GET(RP0_CAP_MASK, rp_state_cap) *
>  					GT_FREQUENCY_MULTIPLIER;
> -- 
> 2.34.0
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
