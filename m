Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C209FFA8D
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 15:41:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8D2310E70F;
	Thu,  2 Jan 2025 14:41:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cjRSUE6Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0713A10E1F9;
 Thu,  2 Jan 2025 14:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735828907; x=1767364907;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=5zhOTu+QB4XISm4k8Xanyk65npqUMvI2MJUNtgF8thU=;
 b=cjRSUE6Y0CyJvz0p/rqptaYkum+QB7aZiyhC2jEaOF1U+7twKq/mhmaI
 9h/OqR9XlSe9mXcgULh/hfyqo8SjBHSpWKy1u8pl6VxzgZN1ximKWlnDo
 FTd6inN7twBKnO/5A8EaR29Yga1BNUWrkrIgWdU7DLa6xHaWgXCgiltcB
 ySJTSfBaFG9fBkxjVwJnNKewJx4qjAAc5mmfIS+odwTbgSLtRqAgtmSnX
 9XD3CjUQt4HkQDy8jGk/aU32ccG9SldFgIbYMQqephZQh/qZoUqVLWspo
 7onCWpWbXPereRGm8AAEgoWmY7PotB8ZJC+Zl9uLH3vWYycXVxCFMuTEd Q==;
X-CSE-ConnectionGUID: 1Uu16aWPTCCoSkSNNIvYdw==
X-CSE-MsgGUID: IKYH7JVeSgKi71n3bQogvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="36219104"
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; d="scan'208";a="36219104"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 06:41:07 -0800
X-CSE-ConnectionGUID: tSxX+AITTz+NO6+byzUIvg==
X-CSE-MsgGUID: n5Cs79rgSIuSKOjAn1lIcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; d="scan'208";a="101353323"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 06:41:05 -0800
Date: Thu, 2 Jan 2025 16:41:56 +0200
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 13/16] drm/i915/ddi: start distinguishing 128b/132b
 SST and MST at state readout
Message-ID: <Z3altKmovqFnIJTM@ideak-desk.fi.intel.com>
References: <cover.1734643485.git.jani.nikula@intel.com>
 <2c95b57e72ba2a7f07fe377ac71cb4f4038f751d.1734643485.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2c95b57e72ba2a7f07fe377ac71cb4f4038f751d.1734643485.git.jani.nikula@intel.com>
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

On Thu, Dec 19, 2024 at 11:34:02PM +0200, Jani Nikula wrote:
> We'll want to distinguish 128b/132b SST and MST modes at state
> readout. There's a catch, though. From the hardware perspective,
> 128b/132b SST and MST programming are pretty much the same. And we can't
> really ask the sink at this point.
> 
> If we have more than one transcoder in 128b/132b mode associated with
> the port, we can safely assume it's MST. But for MST with only a single
> stream enabled, we are pretty much out of luck. Let's fall back to
> looking at the software state, i.e. intel_dp->is_mst. It should be fine
> for the state checker, but for hardware takeover at probe, we'll have to
> trust the GOP has only enabled SST.
> 
> TODO: Not sure how this *or* our current code handles 128b/132b enabled
> by GOP.
> 
> Cc: Imre Deak <imre.deak@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c | 29 +++++++++++++++++++-----
>  1 file changed, 23 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index 7b739b9c5a06..04118f2eea94 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -786,7 +786,7 @@ static void intel_ddi_get_encoder_pipes(struct intel_encoder *encoder,
>  	intel_wakeref_t wakeref;
>  	enum pipe p;
>  	u32 tmp;
> -	u8 mst_pipe_mask;
> +	u8 mst_pipe_mask = 0, dp128b132b_pipe_mask = 0;
>  
>  	*pipe_mask = 0;
>  	*is_dp_mst = false;
> @@ -823,7 +823,6 @@ static void intel_ddi_get_encoder_pipes(struct intel_encoder *encoder,
>  		goto out;
>  	}
>  
> -	mst_pipe_mask = 0;
>  	for_each_pipe(dev_priv, p) {
>  		enum transcoder cpu_transcoder = (enum transcoder)p;
>  		u32 port_mask, ddi_select, ddi_mode;
> @@ -852,9 +851,10 @@ static void intel_ddi_get_encoder_pipes(struct intel_encoder *encoder,
>  
>  		ddi_mode = tmp & TRANS_DDI_MODE_SELECT_MASK;
>  
> -		if (ddi_mode == TRANS_DDI_MODE_SELECT_DP_MST ||
> -		    (ddi_mode == TRANS_DDI_MODE_SELECT_FDI_OR_128B132B && HAS_DP20(display)))
> +		if (ddi_mode == TRANS_DDI_MODE_SELECT_DP_MST)
>  			mst_pipe_mask |= BIT(p);
> +		else if (ddi_mode == TRANS_DDI_MODE_SELECT_FDI_OR_128B132B && HAS_DP20(display))
> +			dp128b132b_pipe_mask |= BIT(p);
>  
>  		*pipe_mask |= BIT(p);
>  	}
> @@ -864,6 +864,23 @@ static void intel_ddi_get_encoder_pipes(struct intel_encoder *encoder,
>  			    "No pipe for [ENCODER:%d:%s] found\n",
>  			    encoder->base.base.id, encoder->base.name);
>  
> +	if (!mst_pipe_mask && dp128b132b_pipe_mask) {
> +		struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
> +

8b10b and 128b132b can't be mixed on one link, so the above could make
this clear (and more robust) by

	if (dp128b132b_pipe_mask) {
		if (WARN(mst_pipe_mask))
			mst_pipe_mask = 0;

In any case the patch is correct, so either way:

Reviewed-by: Imre Deak <imre.deak@intel.com>

> +		/*
> +		 * If we don't have 8b/10b MST, but have more than one
> +		 * transcoder in 128b/132b mode, we know it must be 128b/132b
> +		 * MST.
> +		 *
> +		 * Otherwise, we fall back to checking the current MST
> +		 * state. It's not accurate for hardware takeover at probe, but
> +		 * we don't expect MST to have been enabled at that point, and
> +		 * can assume it's SST.
> +		 */
> +		if (hweight8(dp128b132b_pipe_mask) > 1 || intel_dp->is_mst)
> +			mst_pipe_mask = dp128b132b_pipe_mask;
> +	}
> +
>  	if (!mst_pipe_mask && hweight8(*pipe_mask) > 1) {
>  		drm_dbg_kms(&dev_priv->drm,
>  			    "Multiple pipes for [ENCODER:%d:%s] (pipe_mask %02x)\n",
> @@ -874,9 +891,9 @@ static void intel_ddi_get_encoder_pipes(struct intel_encoder *encoder,
>  
>  	if (mst_pipe_mask && mst_pipe_mask != *pipe_mask)
>  		drm_dbg_kms(&dev_priv->drm,
> -			    "Conflicting MST and non-MST state for [ENCODER:%d:%s] (pipe_mask %02x mst_pipe_mask %02x)\n",
> +			    "Conflicting MST and non-MST state for [ENCODER:%d:%s] (pipe masks: all %02x, MST %02x, 128b/132b %02x)\n",
>  			    encoder->base.base.id, encoder->base.name,
> -			    *pipe_mask, mst_pipe_mask);
> +			    *pipe_mask, mst_pipe_mask, dp128b132b_pipe_mask);
>  	else
>  		*is_dp_mst = mst_pipe_mask;
>  
> -- 
> 2.39.5
> 
