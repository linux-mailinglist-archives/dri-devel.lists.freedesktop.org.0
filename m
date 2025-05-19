Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A118ABBE30
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 14:45:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5371D10E13A;
	Mon, 19 May 2025 12:45:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ReNVQb0k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5567C10E0E5;
 Mon, 19 May 2025 12:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747658716; x=1779194716;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=4DDZWrcSVt2GqTXrYHSyPqH1eu60IkKGansx/vJUkac=;
 b=ReNVQb0kVIEWn2B5pARhf+2hu/fznOQn3sJVPkarDnVv8Z4rNnezva9o
 Dql+lfcAcws9JCZ7omfKzkbhHcwtS2eE/mgEERaohQ0WYa+pcZ5tWoZF9
 ETuOox1BjZfESnVgUpcGVhGBTg4CAx6L1yBRiKyCB6WK48xSqj9LGG3ZQ
 Y+W9T8YQ4dnE0hmgDTdrMazTgqvPlulrDNRxNo17CYk+jvn+kcpmRHcnB
 32G1t2IUh1fen/Pjb5DnobAlviT8wo3lqyMzKn7DMugvlx/OPB4ZXR6aA
 7mFtNFbhOAd3AjTpgE9Y9x+9SUtqNiYExdw9OY8G6RpSvA79g+Fb67VlJ A==;
X-CSE-ConnectionGUID: o4wtdZAGR1SXoWChQy1e9Q==
X-CSE-MsgGUID: SbzU3JqHRxSaDeGDznQ7tQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49431203"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="49431203"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 05:45:16 -0700
X-CSE-ConnectionGUID: KtiQx4D5T3m+Qcusx+RWSw==
X-CSE-MsgGUID: SFC9GRC/TsaRbEfkrO4j2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="144119184"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.201])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 05:45:14 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Nemesa Garg <nemesa.garg@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>, Ankit Nautiyal
 <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH 04/10] drm/i915/display: Add filter lut values
In-Reply-To: <20250519122644.3685679-5-nemesa.garg@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250519122644.3685679-1-nemesa.garg@intel.com>
 <20250519122644.3685679-5-nemesa.garg@intel.com>
Date: Mon, 19 May 2025 15:45:11 +0300
Message-ID: <87ecwkvkfc.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 19 May 2025, Nemesa Garg <nemesa.garg@intel.com> wrote:
> Add the register bits related to filter lut values.
> These values are golden values and these value has
> to be loaded one time while enabling the casf.
>
> v2: update commit message[Ankit]
>
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_casf.c     | 22 +++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_casf.h     |  3 +++
>  .../gpu/drm/i915/display/intel_casf_regs.h    | 11 ++++++++++
>  3 files changed, 36 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
> index 314d3fe19884..6dab67eb77ab 100644
> --- a/drivers/gpu/drm/i915/display/intel_casf.c
> +++ b/drivers/gpu/drm/i915/display/intel_casf.c
> @@ -30,6 +30,28 @@
>   * original image.
>   */
>  
> +/* Default LUT values to be loaded one time. */
> +static const u16 sharpness_lut[] = {
> +	4095, 2047, 1364, 1022, 816, 678, 579,
> +	504, 444, 397, 357, 323, 293, 268, 244, 224,
> +	204, 187, 170, 154, 139, 125, 111, 98, 85,
> +	73, 60, 48, 36, 24, 12, 0
> +};
> +
> +void intel_filter_lut_load(struct intel_crtc *crtc,
> +			   const struct intel_crtc_state *crtc_state)

Everything else in the file is prefixed intel_casf_, why is this called
intel_filter_lut_load()?

> +{
> +	struct intel_display *display = to_intel_display(crtc_state);
> +	int i;
> +
> +	intel_de_write(display, SHRPLUT_INDEX(crtc->pipe),
> +		       INDEX_AUTO_INCR | INDEX_VALUE(0));
> +
> +	for (i = 0; i < ARRAY_SIZE(sharpness_lut); i++)
> +		intel_de_write(display, SHRPLUT_DATA(crtc->pipe),
> +			       sharpness_lut[i]);
> +}
> +
>  void intel_casf_update_strength(struct intel_crtc_state *crtc_state)
>  {
>  	struct intel_display *display = to_intel_display(crtc_state);
> diff --git a/drivers/gpu/drm/i915/display/intel_casf.h b/drivers/gpu/drm/i915/display/intel_casf.h
> index 83523fe66c48..80642809c08b 100644
> --- a/drivers/gpu/drm/i915/display/intel_casf.h
> +++ b/drivers/gpu/drm/i915/display/intel_casf.h
> @@ -9,9 +9,12 @@
>  #include <linux/types.h>
>  
>  struct intel_crtc_state;
> +struct intel_crtc;
>  
>  int intel_casf_compute_config(struct intel_crtc_state *crtc_state);
>  void intel_casf_update_strength(struct intel_crtc_state *new_crtc_state);
>  void intel_casf_sharpness_get_config(struct intel_crtc_state *crtc_state);
> +void intel_filter_lut_load(struct intel_crtc *crtc,
> +			   const struct intel_crtc_state *crtc_state);
>  
>  #endif /* __INTEL_CASF_H__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_casf_regs.h b/drivers/gpu/drm/i915/display/intel_casf_regs.h
> index c24ba281ae37..b96950a48335 100644
> --- a/drivers/gpu/drm/i915/display/intel_casf_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_casf_regs.h
> @@ -19,4 +19,15 @@
>  #define   SHARPNESS_FILTER_SIZE_5X5    REG_FIELD_PREP(FILTER_SIZE_MASK, 1)
>  #define   SHARPNESS_FILTER_SIZE_7X7    REG_FIELD_PREP(FILTER_SIZE_MASK, 2)
>  
> +#define _SHRPLUT_DATA_A                        0x682B8
> +#define _SHRPLUT_DATA_B                        0x68AB8
> +#define SHRPLUT_DATA(pipe)             _MMIO_PIPE(pipe, _SHRPLUT_DATA_A, _SHRPLUT_DATA_B)
> +
> +#define _SHRPLUT_INDEX_A               0x682B4
> +#define _SHRPLUT_INDEX_B               0x68AB4
> +#define SHRPLUT_INDEX(pipe)            _MMIO_PIPE(pipe, _SHRPLUT_INDEX_A, _SHRPLUT_INDEX_B)
> +#define   INDEX_AUTO_INCR              REG_BIT(10)
> +#define   INDEX_VALUE_MASK             REG_GENMASK(4, 0)
> +#define   INDEX_VALUE(x)               REG_FIELD_PREP(INDEX_VALUE_MASK, (x))
> +
>  #endif /* __INTEL_CASF_REGS__ */

-- 
Jani Nikula, Intel
