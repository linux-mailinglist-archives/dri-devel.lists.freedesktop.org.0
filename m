Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F48D293F34
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 17:05:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 087496ECE2;
	Tue, 20 Oct 2020 15:05:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AE226ECDC;
 Tue, 20 Oct 2020 15:05:26 +0000 (UTC)
IronPort-SDR: q4hP99+Jthw6RkadzuZYjREpnA3lv+KeVso94GYl/h9KH4v4jxiG/tAMpIi9IfEXe4Irf6uMh8
 jNmHuR6jdw2w==
X-IronPort-AV: E=McAfee;i="6000,8403,9779"; a="154165999"
X-IronPort-AV: E=Sophos;i="5.77,397,1596524400"; d="scan'208";a="154165999"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2020 08:02:29 -0700
IronPort-SDR: Mv8BGaIN96dDX9IxMJJt29ubRH+IR63WCMzDhopF9M0aDn1eHPEXw1vWzEsW0Stw2r7lCsdX6G
 /Sh26NXxZB9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,397,1596524400"; d="scan'208";a="358551400"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 20 Oct 2020 08:02:23 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 20 Oct 2020 18:02:23 +0300
Date: Tue, 20 Oct 2020 18:02:23 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
Subject: Re: [PATCH v6 4/5] drm/i915/display: Add Nearest-neighbor based
 integer scaling support
Message-ID: <20201020150223.GY6112@intel.com>
References: <20201012184130.937-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20201012184130.937-5-pankaj.laxminarayan.bharadiya@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201012184130.937-5-pankaj.laxminarayan.bharadiya@intel.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>, daniels@collabora.com,
 Anshuman Gupta <anshuman.gupta@intel.com>, David Airlie <airlied@linux.ie>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Manasi Navare <manasi.d.navare@intel.com>,
 lorusak@gmail.com, themagnificentmrg@gmail.com, sameer.lattannavar@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 13, 2020 at 12:11:29AM +0530, Pankaj Bharadiya wrote:
> Integer scaling (IS) is a nearest-neighbor upscaling technique that
> simply scales up the existing pixels by an integer
> (i.e., whole number) multiplier.Nearest-neighbor (NN) interpolation
> works by filling in the missing color values in the upscaled image
> with that of the coordinate-mapped nearest source pixel value.
> =

> Both IS and NN preserve the clarity of the original image. Integer
> scaling is particularly useful for pixel art games that rely on
> sharp, blocky images to deliver their distinctive look.
> =

> Introduce functions to configure the scaler filter coefficients to
> enable nearest-neighbor filtering.
> =

> Bspec: 49247
> =

> changes since v4:
> * Make cnl_coef_tap(), cnl_nearest_filter_coef() inline (Uma)
> changes since v3:
> * None
> changes since v2:
> * Move APIs from 5/5 into this patch.
> * Change filter programming related function names to cnl_*, move
>   filter select bits related code into inline function (Ville)
> changes since v1:
> * Rearrange skl_scaler_setup_nearest_neighbor_filter() to iterate the
>   registers directly instead of the phases and taps (Ville)
> =

> changes since RFC:
> * Refine the skl_scaler_setup_nearest_neighbor_filter() logic (Ville)
> =

> Reviewed-by: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Shashank Sharma <shashank.sharma@intel.com>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 99 ++++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_display.h |  4 +
>  2 files changed, 103 insertions(+)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index cf1417ff54d7..871a1f44a2bd 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -6285,6 +6285,105 @@ void skl_scaler_disable(const struct intel_crtc_s=
tate *old_crtc_state)
>  		skl_detach_scaler(crtc, i);
>  }
>  =

> +static inline int cnl_coef_tap(int i)
> +{
> +	return i % 7;
> +}
> +
> +static inline u16 cnl_nearest_filter_coef(int t)
> +{
> +	return t =3D=3D 3 ? 0x0800 : 0x3000;
> +}

If the compiler doesn't inline these without manual help then the
compiler is broken. So I'd just drop these pointless inline keywords.

Quick scan over all the rest looks OK.
From my POV it all looks good so for the series:
Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

But please address Simon's concerns about the kernel docs.

> +
> +/**
> + *  Theory behind setting nearest-neighbor integer scaling:
> + *
> + *  17 phase of 7 taps requires 119 coefficients in 60 dwords per set.
> + *  The letter represents the filter tap (D is the center tap) and the n=
umber
> + *  represents the coefficient set for a phase (0-16).
> + *
> + *         +------------+------------------------+----------------------=
--+
> + *         |Index value | Data value coeffient 1 | Data value coeffient =
2 |
> + *         +------------+------------------------+----------------------=
--+
> + *         |   00h      |          B0            |          A0          =
  |
> + *         +------------+------------------------+----------------------=
--+
> + *         |   01h      |          D0            |          C0          =
  |
> + *         +------------+------------------------+----------------------=
--+
> + *         |   02h      |          F0            |          E0          =
  |
> + *         +------------+------------------------+----------------------=
--+
> + *         |   03h      |          A1            |          G0          =
  |
> + *         +------------+------------------------+----------------------=
--+
> + *         |   04h      |          C1            |          B1          =
  |
> + *         +------------+------------------------+----------------------=
--+
> + *         |   ...      |          ...           |          ...         =
  |
> + *         +------------+------------------------+----------------------=
--+
> + *         |   38h      |          B16           |          A16         =
  |
> + *         +------------+------------------------+----------------------=
--+
> + *         |   39h      |          D16           |          C16         =
  |
> + *         +------------+------------------------+----------------------=
--+
> + *         |   3Ah      |          F16           |          C16         =
  |
> + *         +------------+------------------------+----------------------=
--+
> + *         |   3Bh      |        Reserved        |          G16         =
  |
> + *         +------------+------------------------+----------------------=
--+
> + *
> + *  To enable nearest-neighbor scaling:  program scaler coefficents with
> + *  the center tap (Dxx) values set to 1 and all other values set to 0 a=
s per
> + *  SCALER_COEFFICIENT_FORMAT
> + *
> + */
> +
> +static void cnl_program_nearest_filter_coefs(struct drm_i915_private *de=
v_priv,
> +					     enum pipe pipe, int id, int set)
> +{
> +	int i;
> +
> +	intel_de_write_fw(dev_priv, CNL_PS_COEF_INDEX_SET(pipe, id, set),
> +			  PS_COEE_INDEX_AUTO_INC);
> +
> +	for (i =3D 0; i < 17 * 7; i +=3D 2) {
> +		u32 tmp;
> +		int t;
> +
> +		t =3D cnl_coef_tap(i);
> +		tmp =3D cnl_nearest_filter_coef(t);
> +
> +		t =3D cnl_coef_tap(i + 1);
> +		tmp |=3D cnl_nearest_filter_coef(t) << 16;
> +
> +		intel_de_write_fw(dev_priv, CNL_PS_COEF_DATA_SET(pipe, id, set),
> +				  tmp);
> +	}
> +
> +	intel_de_write_fw(dev_priv, CNL_PS_COEF_INDEX_SET(pipe, id, set), 0);
> +}
> +
> +inline u32 skl_scaler_get_filter_select(enum drm_scaling_filter filter, =
int set)
> +{
> +	if (filter =3D=3D DRM_SCALING_FILTER_NEAREST_NEIGHBOR) {
> +		return (PS_FILTER_PROGRAMMED |
> +			PS_Y_VERT_FILTER_SELECT(set) |
> +			PS_Y_HORZ_FILTER_SELECT(set) |
> +			PS_UV_VERT_FILTER_SELECT(set) |
> +			PS_UV_HORZ_FILTER_SELECT(set));
> +	}
> +
> +	return PS_FILTER_MEDIUM;
> +}
> +
> +void skl_scaler_setup_filter(struct drm_i915_private *dev_priv, enum pip=
e pipe,
> +			     int id, int set, enum drm_scaling_filter filter)
> +{
> +	switch (filter) {
> +	case DRM_SCALING_FILTER_DEFAULT:
> +		break;
> +	case DRM_SCALING_FILTER_NEAREST_NEIGHBOR:
> +		cnl_program_nearest_filter_coefs(dev_priv, pipe, id, set);
> +		break;
> +	default:
> +		MISSING_CASE(filter);
> +	}
> +}
> +
>  static void skl_pfit_enable(const struct intel_crtc_state *crtc_state)
>  {
>  	struct intel_crtc *crtc =3D to_intel_crtc(crtc_state->uapi.crtc);
> diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/d=
rm/i915/display/intel_display.h
> index d10b7c8cde3f..1b946209e06b 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.h
> +++ b/drivers/gpu/drm/i915/display/intel_display.h
> @@ -28,6 +28,7 @@
>  #include <drm/drm_util.h>
>  =

>  enum link_m_n_set;
> +enum drm_scaling_filter;
>  struct dpll;
>  struct drm_connector;
>  struct drm_device;
> @@ -599,6 +600,9 @@ void intel_crtc_arm_fifo_underrun(struct intel_crtc *=
crtc,
>  =

>  u16 skl_scaler_calc_phase(int sub, int scale, bool chroma_center);
>  void skl_scaler_disable(const struct intel_crtc_state *old_crtc_state);
> +u32 skl_scaler_get_filter_select(enum drm_scaling_filter filter, int set=
);
> +void skl_scaler_setup_filter(struct drm_i915_private *dev_priv, enum pip=
e pipe,
> +			     int id, int set, enum drm_scaling_filter filter);
>  void ilk_pfit_disable(const struct intel_crtc_state *old_crtc_state);
>  u32 glk_plane_color_ctl(const struct intel_crtc_state *crtc_state,
>  			const struct intel_plane_state *plane_state);
> -- =

> 2.23.0

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
