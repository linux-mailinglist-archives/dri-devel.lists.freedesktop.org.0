Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0155797BE9F
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 17:29:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 596BF10E1A6;
	Wed, 18 Sep 2024 15:29:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a6dO8Oev";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D4410E113;
 Wed, 18 Sep 2024 15:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726673383; x=1758209383;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=b/1VrQYm3TU6FBjsewqbK2HKShBl4GYcqw0r/OxPbVM=;
 b=a6dO8OevEYmigDfi1LoBvXkZnt1dMf+f2LHtDoiRt8XfuEzR97vq3mdb
 sKtydBpDpHAQc2jEUignZQuGqtUFb+GneBbnMWLxou2oPQaMR180YifbQ
 cE0ReI7QreZsDJFiPa1J/iNi1YHGod2dMYLcQ4uf1Q7L4tO+jWvw2WNVf
 ts0uLcApRFdIxlp3af9h6TPhhj951TVf0o54vbXtMNOb+3qXf4+b+qk/W
 8L2lhWPir7e/bKOErXkhAz3JvZe9By8ciTfNon6F7Ioy4T771CWJLsRfQ
 jBWDAFC84G2okNxMg/z1wh3QMjvaeevAmgINJPuTNsjDqk2CAp39ZkPOF A==;
X-CSE-ConnectionGUID: znqx/EQoS9q3WpojQ15VMQ==
X-CSE-MsgGUID: cwVEws/bT4uq3JgkDIAhdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25687824"
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="25687824"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 08:29:43 -0700
X-CSE-ConnectionGUID: EU3P0K4pT822PFacLrmJ9Q==
X-CSE-MsgGUID: vmsZaeNQSfKogSYaGzGKHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="69900117"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.202])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 08:29:41 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Nemesa Garg <nemesa.garg@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: Re: [PATCH v3 2/5] drm/i915/display: Compute the scaler filter
 coefficients
In-Reply-To: <20240917092634.1109572-3-nemesa.garg@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240917092634.1109572-1-nemesa.garg@intel.com>
 <20240917092634.1109572-3-nemesa.garg@intel.com>
Date: Wed, 18 Sep 2024 18:29:37 +0300
Message-ID: <871q1haske.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Tue, 17 Sep 2024, Nemesa Garg <nemesa.garg@intel.com> wrote:
> The sharpness property requires the use of one of the scaler
> so need to set the sharpness scaler coefficient values.
> These values are based on experiments and vary for different
> tap value/win size. These values are normalized by taking the
> sum of all values and then dividing each value with a sum.
>
> v2: Fix ifndef header naming issue reported by kernel test robot
> v3: Rename file name[Arun]
>     Replace array size number with macro[Arun]
>
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>  drivers/gpu/drm/i915/Makefile                 |   1 +
>  drivers/gpu/drm/i915/display/intel_display.c  |   2 +
>  .../drm/i915/display/intel_display_types.h    |   2 +
>  .../drm/i915/display/intel_sharpness_filter.c | 106 ++++++++++++++++++
>  .../drm/i915/display/intel_sharpness_filter.h |  38 +++++++
>  drivers/gpu/drm/i915/i915_reg.h               |   2 +
>  drivers/gpu/drm/xe/Makefile                   |   1 +
>  7 files changed, 152 insertions(+)
>  create mode 100644 drivers/gpu/drm/i915/display/intel_sharpness_filter.c
>  create mode 100644 drivers/gpu/drm/i915/display/intel_sharpness_filter.h
>
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index c63fa2133ccb..28e5f3b95371 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -280,6 +280,7 @@ i915-y +=3D \
>  	display/intel_pmdemand.o \
>  	display/intel_psr.o \
>  	display/intel_quirks.o \
> +	display/intel_sharpness_filter.o \
>  	display/intel_sprite.o \
>  	display/intel_sprite_uapi.o \
>  	display/intel_tc.o \
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index b4ef4d59da1a..e447a316ec38 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -5917,6 +5917,8 @@ static int intel_atomic_check_planes(struct intel_a=
tomic_state *state)
>  		if (ret)
>  			return ret;
>=20=20
> +		intel_sharpness_scaler_compute_config(new_crtc_state);
> +
>  		/*
>  		 * On some platforms the number of active planes affects
>  		 * the planes' minimum cdclk calculation. Add such planes
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers=
/gpu/drm/i915/display/intel_display_types.h
> index f29e5dc3db91..5636f9b60d5d 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -56,6 +56,7 @@
>  #include "intel_display_power.h"
>  #include "intel_dpll_mgr.h"
>  #include "intel_wm_types.h"
> +#include "intel_sharpness_filter.h"

There are probably very few places that actually need the sharpness
filter interfaces. Yet this is the only place where you include the
header, and expose those interfaces to all modules in display.

>=20=20
>  struct drm_printer;
>  struct __intel_global_objs_state;
> @@ -1072,6 +1073,7 @@ struct intel_crtc_state {
>  		struct drm_property_blob *degamma_lut, *gamma_lut, *ctm;
>  		struct drm_display_mode mode, pipe_mode, adjusted_mode;
>  		enum drm_scaling_filter scaling_filter;
> +		struct intel_sharpness_filter casf_params;

And it's all because of this. I think it's actually better to hoist the
struct definition in this file, and drop the include. Yes, this file is
already massive, but that's a tradeoff I prefer over making the includes
harder to track.

Also, I'm guessing I know what "casf" means, but it's used in the series
with zero explanation.

>  	} hw;
>=20=20
>  	/* actual state of LUTs */
> diff --git a/drivers/gpu/drm/i915/display/intel_sharpness_filter.c b/driv=
ers/gpu/drm/i915/display/intel_sharpness_filter.c
> new file mode 100644
> index 000000000000..e5fbffbe0428
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_sharpness_filter.c
> @@ -0,0 +1,106 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =C2=A9 2024 Intel Corporation
> + *
> + */
> +

Please add a brief comment here, describing what this file is about, and
explain "casf".

> +#include "i915_reg.h"
> +#include "intel_de.h"
> +#include "intel_display_types.h"
> +#include "skl_scaler.h"
> +
> +#define MAX_NUM_UNIQUE_COEF_FOR_SHARPNESS_FILTER 7
> +#define SCALER_FILTER_NUM_TAPS 7

This is a duplicate definition.

> +#define SCALER_FILTER_NUM_PHASES 17
> +#define FILTER_COEFF_0_125 125
> +#define FILTER_COEFF_0_25 250
> +#define FILTER_COEFF_0_5 500
> +#define FILTER_COEFF_1_0 1000
> +#define FILTER_COEFF_0_0 0
> +
> +const u16 filtercoeff_1[] =3D {FILTER_COEFF_0_0, FILTER_COEFF_0_0,
> +FILTER_COEFF_0_5, FILTER_COEFF_1_0, FILTER_COEFF_0_5, FILTER_COEFF_0_0, =
FILTER_COEFF_0_0};
> +
> +const u16 filtercoeff_2[] =3D {FILTER_COEFF_0_0, FILTER_COEFF_0_25,
> +FILTER_COEFF_0_5, FILTER_COEFF_1_0, FILTER_COEFF_0_5, FILTER_COEFF_0_25,=
 FILTER_COEFF_0_0};
> +
> +const u16 filtercoeff_3[] =3D {FILTER_COEFF_0_125, FILTER_COEFF_0_25,
> +FILTER_COEFF_0_5, FILTER_COEFF_1_0, FILTER_COEFF_0_5, FILTER_COEFF_0_25,=
 FILTER_COEFF_0_125};
> +
> +void intel_sharpness_filter_enable(struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display =3D to_intel_display(crtc);
> +	struct intel_crtc *crtc =3D to_intel_crtc(crtc_state->uapi.crtc);
> +	int id =3D crtc_state->scaler_state.scaler_id;
> +
> +	intel_de_write_fw(display, GLK_PS_COEF_INDEX_SET(crtc->pipe, id, 0),
> +			  PS_COEF_INDEX_AUTO_INC);
> +
> +	intel_de_write_fw(display, GLK_PS_COEF_INDEX_SET(crtc->pipe, id, 1),
> +			  PS_COEF_INDEX_AUTO_INC);
> +
> +	for (int index =3D 0; index < 60; index++) {

Magic 60?

> +		intel_de_write_fw(display, GLK_PS_COEF_DATA_SET(crtc->pipe, id, 0),
> +				  crtc_state->hw.casf_params.scaler_coefficient[index]);
> +		intel_de_write_fw(display, GLK_PS_COEF_DATA_SET(crtc->pipe, id, 1),
> +				  crtc_state->hw.casf_params. scaler_coefficient[index]);

This is the place to convert some other data to register format, not
before.

> +	}
> +}
> +
> +static void convert_sharpness_coef_binary(struct scaler_filter_coeff *co=
eff,
> +					  u16 coefficient)
> +{
> +	if (coefficient < 25) {
> +		coeff->mantissa =3D (coefficient * 2048) / 100;
> +		coeff->exp =3D 3;
> +	} else if (coefficient < 50) {
> +		coeff->mantissa =3D (coefficient * 1024) / 100;
> +		coeff->exp =3D 2;
> +	} else if (coefficient < 100) {
> +		coeff->mantissa =3D (coefficient * 512) / 100;
> +		coeff->exp =3D 1;
> +	} else {
> +		coeff->mantissa =3D (coefficient * 256) / 100;
> +		coeff->exp =3D 0;
> +	}
> +}
> +
> +static void intel_sharpness_filter_coeff(struct intel_crtc_state *crtc_s=
tate)
> +{
> +	const u16 *filtercoeff;
> +	u16 filter_coeff[MAX_NUM_UNIQUE_COEF_FOR_SHARPNESS_FILTER];
> +	u16 sumcoeff =3D 0;
> +	u8 i;
> +
> +	if (crtc_state->hw.casf_params.win_size =3D=3D 0)
> +		filtercoeff =3D filtercoeff_1;
> +	else if (crtc_state->hw.casf_params.win_size =3D=3D 1)
> +		filtercoeff =3D filtercoeff_2;
> +	else
> +		filtercoeff =3D filtercoeff_3;
> +
> +	for (i =3D 0; i < MAX_NUM_UNIQUE_COEF_FOR_SHARPNESS_FILTER; i++)
> +		sumcoeff +=3D *(filtercoeff + i);
> +
> +	for (i =3D 0; i < MAX_NUM_UNIQUE_COEF_FOR_SHARPNESS_FILTER; i++) {
> +		filter_coeff[i] =3D (*(filtercoeff + i) * 100 / sumcoeff);
> +		convert_sharpness_coef_binary(&crtc_state->hw.casf_params.coeff[i],
> +					      filter_coeff[i]);
> +	}
> +}
> +
> +void intel_sharpness_scaler_compute_config(struct intel_crtc_state *crtc=
_state)
> +{
> +	u16 phase, tapindex, phaseoffset;
> +	u16 *coeff =3D (u16 *)crtc_state->hw.casf_params.scaler_coefficient;

It's an u32 array. Do not hide this, do not cast it. (It probably
shouldn't be u32, or u16, but rather a higher level abstraction at this
stage.)

> +
> +	intel_sharpness_filter_coeff(crtc_state);
> +
> +	for (phase =3D 0; phase < SCALER_FILTER_NUM_PHASES; phase++) {
> +		phaseoffset =3D SCALER_FILTER_NUM_TAPS * phase;
> +		for (tapindex =3D 0; tapindex < SCALER_FILTER_NUM_TAPS; tapindex++) {
> +			coeff[phaseoffset + tapindex] =3D
> +				SHARP_COEFF_TO_REG_FORMAT(crtc_state->hw.casf_params.coeff[tapindex]=
);
> +		}
> +	}

Why does compute config need to convert to register format? We don't
generally store register values in crtc state.

> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_sharpness_filter.h b/driv=
ers/gpu/drm/i915/display/intel_sharpness_filter.h
> new file mode 100644
> index 000000000000..d1dc65e747fe
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_sharpness_filter.h
> @@ -0,0 +1,38 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2024 Intel Corporation
> + */
> +
> +#ifndef __INTEL_SHARPNESS_FILTER_H__
> +#define __INTEL_SHARPNESS_FILTER_H__
> +
> +#include <linux/types.h>
> +
> +#define SHARP_COEFF_TO_REG_FORMAT(coefficient) ((u16)(coefficient.sign <=
< 15 | \
> +			coefficient.exp << 12 | coefficient.mantissa << 3))

No. Define the registers in terms of the masks and fields. Use the
register macros to fill in the contents.

> +
> +struct intel_crtc;

Unused.

> +struct intel_crtc_state;
> +struct intel_atomic_state;

Unused.

> +
> +struct scaler_filter_coeff {
> +	u16 sign;
> +	u16 exp;
> +	u16 mantissa;
> +};
> +
> +struct intel_sharpness_filter {
> +#defines SCALER_FILTER_NUM_TAPS 7
> +#define SCLAER_FILTER_COEFF 119
> +	struct scaler_filter_coeff coeff[SCALER_FILTER_NUM_TAPS];
> +	u32 scaler_coefficient[SCLAER_FILTER_COEFF];

Why do you need both? Isn't the latter something that's calculated from
the former?

> +	bool strength_changed;
> +	u8 win_size;
> +	bool need_scaler;
> +	u8 strength;
> +};
> +
> +void intel_sharpness_filter_enable(struct intel_crtc_state *crtc_state);
> +void intel_sharpness_scaler_compute_config(struct intel_crtc_state *crtc=
_state);
> +
> +#endif /* __INTEL_SHARPEN_FILTER_H__ */
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_=
reg.h
> index 41f4350a7c6c..84b05b57ad52 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -2257,6 +2257,8 @@
>  #define   PS_VERT_INT_INVERT_FIELD		REG_BIT(20)
>  #define   PS_PROG_SCALE_FACTOR			REG_BIT(19) /* tgl+ */
>  #define   PS_PWRUP_PROGRESS			REG_BIT(17)
> +#define   PS_BYPASS_ARMING			REG_BIT(10)
> +#define   PS_DB_STALL				REG_BIT(9)
>  #define   PS_V_FILTER_BYPASS			REG_BIT(8)
>  #define   PS_VADAPT_EN				REG_BIT(7) /* skl/bxt */
>  #define   PS_VADAPT_MODE_MASK			REG_GENMASK(6, 5) /* skl/bxt */
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 8f1c5c329f79..26b4b516c9ec 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -254,6 +254,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) +=3D \
>  	i915-display/intel_psr.o \
>  	i915-display/intel_qp_tables.o \
>  	i915-display/intel_quirks.o \
> +	i915-display/intel_sharpness_filter.o \
>  	i915-display/intel_snps_phy.o \
>  	i915-display/intel_tc.o \
>  	i915-display/intel_vblank.o \

--=20
Jani Nikula, Intel
