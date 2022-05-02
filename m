Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD7B51752D
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 18:56:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66DA510EB54;
	Mon,  2 May 2022 16:56:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9DA710EB24;
 Mon,  2 May 2022 16:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651510565; x=1683046565;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=on4aduI7sI4ypy4fKFyDCH6Rdi8s/emQoUUqpj7l8Uk=;
 b=bQGpNK2Zeu4FmmwN/NkIttFsKnJ0KfT/99QY68gsRQUaNZb+it8lLfNW
 0OT7VKqCf2SH+wQMCc0cFmADxLMvRyRGExdLuArRgxALfj+aBwqhkZkTd
 2Nm4NneKbbgKo33hGumJjURdmEog6G5E1aYxcte2Rpvjx7SIUO4vyifRL
 DyzStvEJCb8mpT5mTh575b+TkYZXGLZcpXa79S2rawWpRWxZtctOWasU9
 w2eDCC9OVJxRBqsf2YrVQW3oK4YKoH09s9QoxD89fdVnd+tJvTeAXjusr
 RtWyiCZPrWrzeT137cOYuYxSDXyc/1t/jXF1tSpv5Hwter0U5dLOQ4QrH A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="266850664"
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="266850664"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 09:56:05 -0700
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="583795872"
Received: from jpwagner-mobl2.amr.corp.intel.com (HELO intel.com)
 ([10.255.39.103])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 09:56:04 -0700
Date: Mon, 2 May 2022 12:55:55 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 04/11] drm/i915/pvc: Read correct RP_STATE_CAP register
Message-ID: <YnANG9PMB6FoNZwG@intel.com>
References: <20220502163417.2635462-1-matthew.d.roper@intel.com>
 <20220502163417.2635462-5-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220502163417.2635462-5-matthew.d.roper@intel.com>
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

On Mon, May 02, 2022 at 09:34:10AM -0700, Matt Roper wrote:
> The SoC registers, including RP_STATE_CAP, have moved to a new location
> in GTTMMADR on Ponte Vecchio.  We need to update the register offset
> accordingly.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_rps.c | 4 +++-
>  drivers/gpu/drm/i915/i915_reg.h     | 1 +
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> index 3476a11f294c..3bd8415a0f1b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> @@ -1075,7 +1075,9 @@ static u32 intel_rps_read_state_cap(struct intel_rps *rps)
>  	struct drm_i915_private *i915 = rps_to_i915(rps);
>  	struct intel_uncore *uncore = rps_to_uncore(rps);
>  
> -	if (IS_XEHPSDV(i915))
> +	if (IS_PONTEVECCHIO(i915))
> +		return intel_uncore_read(uncore, PVC_RP_STATE_CAP);
> +	else if (IS_XEHPSDV(i915))
>  		return intel_uncore_read(uncore, XEHPSDV_RP_STATE_CAP);
>  	else if (IS_GEN9_LP(i915))
>  		return intel_uncore_read(uncore, BXT_RP_STATE_CAP);
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 9ccb67eec1bd..4a3d7b96ef43 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -1846,6 +1846,7 @@
>  #define BXT_RP_STATE_CAP        _MMIO(0x138170)
>  #define GEN9_RP_STATE_LIMITS	_MMIO(0x138148)
>  #define XEHPSDV_RP_STATE_CAP	_MMIO(0x250014)
> +#define PVC_RP_STATE_CAP	_MMIO(0x281014)
>  
>  #define GT0_PERF_LIMIT_REASONS		_MMIO(0x1381a8)
>  #define   GT0_PERF_LIMIT_REASONS_MASK	0xde3
> -- 
> 2.35.1
> 
