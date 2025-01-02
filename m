Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 665F59FFABE
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 16:03:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 896C810E718;
	Thu,  2 Jan 2025 15:03:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="frLGgQ0/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43F2210E718;
 Thu,  2 Jan 2025 15:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735830199; x=1767366199;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=Q6+WGyBoT8ttbb4UrhO9wsUYyZsPESKmHh8fCN08wfM=;
 b=frLGgQ0/HqZdzUX1/97KMkk6KV7z4mnvqkbXpBBVqp/Jqj1zIL/QChtj
 Dfo7qU6TBVa9OBrgvnXYoVfZ1Uz00I1qhQTN7X6vRm8SAQFTF/vLO7epK
 RBWqCRStiQ54CdOwXTIEx8sm80UTFHvr/Vc92b9d23qVHs9IU2QvzB0R9
 lpXL+txIOUlCpOwWLwdir9sySN5lImG40DCVIakKmcdcPBZmolceAm9Kb
 3u79Hdk1XcGIRQVhc9RAe439FnI4vu8bo9l1CJCKgHj06Du9P6AuIpV8C
 RLpvm2Eif+FEsT2vIwqTZH/xqUXHcQCxVVIlfN190Ql49UdCUvDtm8bCA A==;
X-CSE-ConnectionGUID: VqNrs3wpRNaH9rkSRmhEUA==
X-CSE-MsgGUID: FFKbklR9Ra+gmG+GUMvlig==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="46557899"
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; d="scan'208";a="46557899"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 07:03:05 -0800
X-CSE-ConnectionGUID: DBlq+hIJSwWt67SQbn02JA==
X-CSE-MsgGUID: 5c/JiHBsRUqNB4p65xygNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="106582138"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 07:03:03 -0800
Date: Thu, 2 Jan 2025 17:03:54 +0200
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 15/16] drm/i915/ddi: disable trancoder port select for
 128b/132b SST
Message-ID: <Z3aq2mYJ_uGqXtfP@ideak-desk.fi.intel.com>
References: <cover.1734643485.git.jani.nikula@intel.com>
 <ef870539039a73ab70c70db56d19cba5adc4544b.1734643485.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef870539039a73ab70c70db56d19cba5adc4544b.1734643485.git.jani.nikula@intel.com>
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 19, 2024 at 11:34:04PM +0200, Jani Nikula wrote:
> 128b/1232b SST will have mst_master_transcoder set and matching
> cpu_transcoder. Ensure disable also for 128b/132b SST.
> 
> Co-developed-by: Imre Deak <imre.deak@intel.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Imre Deak <imre.deak@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index 37b771f07d59..c74c3ab25589 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -657,6 +657,7 @@ void intel_ddi_disable_transcoder_func(const struct intel_crtc_state *crtc_state
>  	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
>  	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
>  	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
> +	bool is_mst = intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP_MST);
>  	u32 ctl;
>  
>  	if (DISPLAY_VER(dev_priv) >= 11)
> @@ -676,7 +677,8 @@ void intel_ddi_disable_transcoder_func(const struct intel_crtc_state *crtc_state
>  			 TRANS_DDI_PORT_SYNC_MASTER_SELECT_MASK);
>  
>  	if (DISPLAY_VER(dev_priv) >= 12) {
> -		if (!intel_dp_mst_is_master_trans(crtc_state)) {
> +		if (!intel_dp_mst_is_master_trans(crtc_state) ||
> +		    (!is_mst && intel_dp_is_uhbr(crtc_state))) {
>  			ctl &= ~(TGL_TRANS_DDI_PORT_MASK |
>  				 TRANS_DDI_MODE_SELECT_MASK);
>  		}
> -- 
> 2.39.5
> 
