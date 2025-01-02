Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB129FFA92
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 15:44:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E93F10E712;
	Thu,  2 Jan 2025 14:44:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n3yL3dic";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 116E110E26C;
 Thu,  2 Jan 2025 14:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735829089; x=1767365089;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=wQ9UWJ6IaihJDStAziKOWhHcPqr/qsHt3j+FQl4L1Og=;
 b=n3yL3dicm3LkEoL41HUeebPd+ZRfABB6Wq/OlS/DzXxp221WOcNRjt/D
 pCDe+EMhQrqM5Amgef0cWbI635lIAzjyyRdWtV0DSMgzFufqXsrUEpJSz
 sZFRa0YpXyiBVLrAd0Vt7bB4dTNJXrtLVuB6dTy1Wy2vjdwFXDmey7/TW
 WZ/hV5nqGtzWAvVMDqJMgI/t6qU34FbEqS2IF62U3npwaz5jnVV+w6Kq8
 c3gowG/XNBZVm1mMbggs6RSz23488Vl5i5MHyUQXsRw3nJNE3ysORCLMu
 xVtj4tKqHezgtyRRBK+XQ+MmZ+EhmPR0IJw8DXp/YNwVpynRf7Qk70pgK w==;
X-CSE-ConnectionGUID: zRHCVuITTuGYiYDExaH2WQ==
X-CSE-MsgGUID: MIB0dgOER7isKLwRIc2bTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="36227625"
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; d="scan'208";a="36227625"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 06:44:48 -0800
X-CSE-ConnectionGUID: z+0/VTWnRH2gzeH1GfD3eQ==
X-CSE-MsgGUID: QCdTSklDQHyMC0gZY7oTWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; d="scan'208";a="106503034"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 06:44:47 -0800
Date: Thu, 2 Jan 2025 16:45:38 +0200
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 14/16] drm/i915/ddi: handle 128b/132b SST in
 intel_ddi_read_func_ctl()
Message-ID: <Z3amkoT6qUACCm-w@ideak-desk.fi.intel.com>
References: <cover.1734643485.git.jani.nikula@intel.com>
 <e522cc88476adbbcc9222df70cb2f76636f7db49.1734643485.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e522cc88476adbbcc9222df70cb2f76636f7db49.1734643485.git.jani.nikula@intel.com>
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

On Thu, Dec 19, 2024 at 11:34:03PM +0200, Jani Nikula wrote:
> We'll only ever get here in MST mode from MST stream encoders; the
> primary encoder's ->get_config() won't be called when we've detected
> it's MST.
> 
> v2: Read mst_master_transcoder in 128b/132b SST path (Imre)
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Imre Deak <imre.deak@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index 04118f2eea94..37b771f07d59 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -4026,6 +4026,11 @@ static void intel_ddi_read_func_ctl_dp_sst(struct intel_encoder *encoder,
>  	crtc_state->lane_count =
>  		((ddi_func_ctl & DDI_PORT_WIDTH_MASK) >> DDI_PORT_WIDTH_SHIFT) + 1;
>  
> +	if (DISPLAY_VER(display) >= 12 &&
> +	    (ddi_func_ctl & TRANS_DDI_MODE_SELECT_MASK) == TRANS_DDI_MODE_SELECT_FDI_OR_128B132B)
> +		crtc_state->mst_master_transcoder =
> +			REG_FIELD_GET(TRANS_DDI_MST_TRANSPORT_SELECT_MASK, ddi_func_ctl);
> +
>  	intel_cpu_transcoder_get_m1_n1(crtc, cpu_transcoder, &crtc_state->dp_m_n);
>  	intel_cpu_transcoder_get_m2_n2(crtc, cpu_transcoder, &crtc_state->dp_m2_n2);
>  
> @@ -4120,9 +4125,19 @@ static void intel_ddi_read_func_ctl(struct intel_encoder *encoder,
>  		intel_ddi_read_func_ctl_fdi(encoder, pipe_config, ddi_func_ctl);
>  	} else if (ddi_mode == TRANS_DDI_MODE_SELECT_DP_SST) {
>  		intel_ddi_read_func_ctl_dp_sst(encoder, pipe_config, ddi_func_ctl);
> -	} else if (ddi_mode == TRANS_DDI_MODE_SELECT_DP_MST ||
> -		   (ddi_mode == TRANS_DDI_MODE_SELECT_FDI_OR_128B132B && HAS_DP20(display))) {
> +	} else if (ddi_mode == TRANS_DDI_MODE_SELECT_DP_MST) {
>  		intel_ddi_read_func_ctl_dp_mst(encoder, pipe_config, ddi_func_ctl);
> +	} else if (ddi_mode == TRANS_DDI_MODE_SELECT_FDI_OR_128B132B && HAS_DP20(display)) {
> +		struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
> +
> +		/*
> +		 * If this is true, we know we're being called from mst stream
> +		 * encoder's ->get_config().
> +		 */
> +		if (intel_dp->is_mst)
> +			intel_ddi_read_func_ctl_dp_mst(encoder, pipe_config, ddi_func_ctl);
> +		else
> +			intel_ddi_read_func_ctl_dp_sst(encoder, pipe_config, ddi_func_ctl);
>  	}
>  }
>  
> -- 
> 2.39.5
> 
