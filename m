Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 324B06A5C89
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 16:57:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1131D10E4F1;
	Tue, 28 Feb 2023 15:56:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CDE610E02E;
 Tue, 28 Feb 2023 15:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677599815; x=1709135815;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=5vojCs921cbe6S9LLDdvuT7pbHFqpBrRmcjmWxW/o9Q=;
 b=RnFWG6CpFGUlHVJDmYe7cRTfK/sbCdlQdnSCjtyCjLn0Yk5MoemzdFAR
 z9KmohOcQ2bCRVjeVHPW0YHQUpGeQrgMejnsnB2MwWIwXMfW7C15ajJyI
 2ydNXZlAjeZEpyVnBN220kS6URy0/efHT9/v3jTNTeNAkxiuqfO+QbPFG
 KdBtvFzkNOQ8CocAFewmb/u+K1k61Dz+9Ev3hO/osc/6JVeWBPsOLUA3p
 CyqDrdipVGZQhPjvEYg+R3fJbdWS+/WJhDRVqnNolUWf4YUZXBXX/E/Zx
 NVSBD/U9lxwRi0vvtrn8UP00I6r1uZQsEF2c4nfbqF+zIldED4ncGtmMx Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="336462245"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; d="scan'208";a="336462245"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 07:56:55 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="704454676"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; d="scan'208";a="704454676"
Received: from barumuga-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.47.26])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 07:56:50 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean
 Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH 01/10] drm/i915/dsc: change DSC param tables to follow
 the DSC model
In-Reply-To: <20230228113342.2051425-2-dmitry.baryshkov@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230228113342.2051425-1-dmitry.baryshkov@linaro.org>
 <20230228113342.2051425-2-dmitry.baryshkov@linaro.org>
Date: Tue, 28 Feb 2023 17:56:48 +0200
Message-ID: <874jr5zsu7.fsf@intel.com>
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
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 28 Feb 2023, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> After cross-checking DSC models (20150914, 20161212, 20210623) change
> values in rc_parameters tables to follow config files present inside
> the DSC model. Handle two places, where i915 tables diverged from the
> model, by patching the rc values in the code.
>
> Note: I left one case uncorrected, 8bpp/10bpc/range_max_qp[0], because
> the table in the VESA DSC 1.1 sets it to 4.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/i915/display/intel_vdsc.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
> index 207b2a648d32..d080741fd0b3 100644
> --- a/drivers/gpu/drm/i915/display/intel_vdsc.c
> +++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
> @@ -86,7 +86,7 @@ static const struct rc_parameters rc_parameters[][MAX_COLUMN_INDEX] = {
>  		}
>  	},
>  	/* 6BPP/14BPC */
> -	{ 768, 15, 6144, 15, 25, 23, 27, {
> +	{ 768, 15, 6144, 15, 25, 23, 23, {
>  		{ 0, 16, 0 }, { 7, 18, -2 }, { 15, 20, -2 }, { 16, 20, -4 },
>  		{ 17, 21, -6 }, { 17, 21, -6 }, { 18, 21, -6 }, { 18, 22, -8 },
>  		{ 19, 23, -8 }, { 20, 24, -10 }, { 21, 24, -10 },
> @@ -115,6 +115,10 @@ static const struct rc_parameters rc_parameters[][MAX_COLUMN_INDEX] = {
>  	},
>  	/* 8BPP/10BPC */
>  	{ 512, 12, 6144, 7, 16, 15, 15, {
> +		/*
> +		 * DSC model/pre-SCR-cfg has 8 for range_max_qp[0], however
> +		 * VESA DSC 1.1 Table E-5 sets it to 4.
> +		 */
>  		{ 0, 4, 2 }, { 4, 8, 0 }, { 5, 9, 0 }, { 5, 10, -2 },
>  		{ 7, 11, -4 }, { 7, 11, -6 }, { 7, 11, -8 }, { 7, 12, -8 },
>  		{ 7, 13, -8 }, { 7, 14, -10 }, { 9, 15, -10 }, { 9, 16, -12 },
> @@ -132,7 +136,7 @@ static const struct rc_parameters rc_parameters[][MAX_COLUMN_INDEX] = {
>  	},
>  	/* 8BPP/14BPC */
>  	{ 512, 12, 6144, 15, 24, 23, 23, {
> -		{ 0, 12, 0 }, { 5, 13, 0 }, { 11, 15, 0 }, { 12, 17, -2 },
> +		{ 0, 12, 2 }, { 5, 13, 0 }, { 11, 15, 0 }, { 12, 17, -2 },
>  		{ 15, 19, -4 }, { 15, 19, -6 }, { 15, 19, -8 }, { 15, 20, -8 },
>  		{ 15, 21, -8 }, { 15, 22, -10 }, { 17, 22, -10 },
>  		{ 17, 23, -12 }, { 17, 23, -12 }, { 21, 24, -12 },
> @@ -529,6 +533,16 @@ int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
>  			DSC_RANGE_BPG_OFFSET_MASK;
>  	}
>  
> +	if (DISPLAY_VER(dev_priv) < 13) {
> +		if (compressed_bpp == 6 &&
> +		    vdsc_cfg->bits_per_component == 8)
> +			vdsc_cfg->rc_quant_incr_limit1 = 23;
> +
> +		if (compressed_bpp == 8 &&
> +		    vdsc_cfg->bits_per_component == 14)
> +			vdsc_cfg->rc_range_params[0].range_bpg_offset = 0;
> +	}
> +

I wonder if we shouldn't just use the updated values...

Maybe add a FIXME comment above the block to consider removing it?

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


>  	/*
>  	 * BitsPerComponent value determines mux_word_size:
>  	 * When BitsPerComponent is less than or 10bpc, muxWordSize will be equal to

-- 
Jani Nikula, Intel Open Source Graphics Center
