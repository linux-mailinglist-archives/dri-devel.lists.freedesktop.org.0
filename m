Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5673318F71F
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 15:42:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B0F089FC0;
	Mon, 23 Mar 2020 14:42:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30BFD89F35;
 Mon, 23 Mar 2020 14:41:59 +0000 (UTC)
IronPort-SDR: ZsEMEmtCfTatEdbBYWnbs8MwzZTtH4V785aj7Lt+PLdvLpHn4H6+5Y0TBG/maNAXpS2C1lDFM6
 5kB3VX9JIpFQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2020 07:41:43 -0700
IronPort-SDR: wHYjLNUJSelEp0S4B13Besz18RedtEdcN5HZToWnlijDvAqXQL21MwJCEOd1pfdEXFuu5uCykX
 zHKq8t9mPPAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,296,1580803200"; d="scan'208";a="325589290"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga001.jf.intel.com with SMTP; 23 Mar 2020 07:41:38 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 23 Mar 2020 16:41:37 +0200
Date: Mon, 23 Mar 2020 16:41:37 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
Subject: Re: [PATCH v2 4/5] drm/i915/display: Add Nearest-neighbor based
 integer scaling support
Message-ID: <20200323144137.GU13686@intel.com>
References: <20200319102103.28895-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20200319102103.28895-5-pankaj.laxminarayan.bharadiya@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200319102103.28895-5-pankaj.laxminarayan.bharadiya@intel.com>
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
Cc: sameer.lattannavar@intel.com, daniels@collabora.com,
 David Airlie <airlied@linux.ie>, Lucas De Marchi <lucas.demarchi@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 19, 2020 at 03:51:02PM +0530, Pankaj Bharadiya wrote:
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

> Introduce skl_scaler_setup_nearest_neighbor_filter() function which
> configures the scaler filter coefficients to enable nearest-neighbor
> filtering.
> =

> Bspec: 49247
> =

> changes since v1:
> * Rearrange skl_scaler_setup_nearest_neighbor_filter() to iterate the
>   registers directly instead of the phases and taps (Ville)
> =

> changes since RFC:
> * Refine the skl_scaler_setup_nearest_neighbor_filter() logic (Ville)
> =

> Signed-off-by: Shashank Sharma <shashank.sharma@intel.com>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 72 ++++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_display.h |  2 +
>  2 files changed, 74 insertions(+)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index 8f23c4d51c33..791dd908aa89 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -6237,6 +6237,78 @@ void skl_scaler_disable(const struct intel_crtc_st=
ate *old_crtc_state)
>  		skl_detach_scaler(crtc, i);
>  }
>  =

> +static int skl_coef_tap(int i)
> +{
> +	return i % 7;
> +}
> +
> +static u16 skl_nearest_filter_coef(int t)
> +{
> +	return t =3D=3D 3 ? 0x0800 : 0x3000;
> +}
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
> +void skl_scaler_setup_nearest_neighbor_filter(struct drm_i915_private *d=
ev_priv,
> +					      enum pipe pipe, int id, int set)
> +{
> +	int i;
> +
> +	/*enable the index auto increment.*/

Pointless comment, and also misformatted.

> +	intel_de_write_fw(dev_priv,
> +			  SKL_PS_COEF_INDEX_SET(pipe, id, set),
> +			  PS_COEE_INDEX_AUTO_INC);
> +
> +	for (i =3D 0; i < 17 * 7; i +=3D 2) {
> +		u32 tmp;
> +		int t;
> +
> +		t =3D skl_coef_tap(i);
> +		tmp =3D skl_nearest_filter_coef(t);
> +
> +		t =3D skl_coef_tap(i+1);
> +		tmp |=3D skl_nearest_filter_coef(t)<<16;

Missing spaces.

> +
> +		intel_de_write_fw(dev_priv, SKL_PS_COEF_DATA_SET(pipe, id, set),
> +				  tmp);
> +	}

I'd maybe reset the index back to 0 here and disable the auto-increment
bit.

> +}
> +
>  static void skl_pfit_enable(const struct intel_crtc_state *crtc_state)
>  {
>  	struct intel_crtc *crtc =3D to_intel_crtc(crtc_state->uapi.crtc);
> diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/d=
rm/i915/display/intel_display.h
> index adb1225a3480..88f3c77f6806 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.h
> +++ b/drivers/gpu/drm/i915/display/intel_display.h
> @@ -587,6 +587,8 @@ void intel_crtc_arm_fifo_underrun(struct intel_crtc *=
crtc,
>  u16 skl_scaler_calc_phase(int sub, int scale, bool chroma_center);
>  int skl_update_scaler_crtc(struct intel_crtc_state *crtc_state);
>  void skl_scaler_disable(const struct intel_crtc_state *old_crtc_state);
> +void skl_scaler_setup_nearest_neighbor_filter(struct drm_i915_private *d=
ev_priv,
> +					      enum pipe pipe, int id, int set);
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
