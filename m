Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B77926A682
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 15:48:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28BAB6E2E2;
	Tue, 15 Sep 2020 13:48:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 668276E2E0;
 Tue, 15 Sep 2020 13:48:34 +0000 (UTC)
IronPort-SDR: 3xQJbQfJDdaLnq3yqOlz9rby0PnbPJYx7FQ0Nqlzx2vhyWqsY8D6X4rnNVF4RZ2dwVWE+l6Fde
 t5pkdSnAe45g==
X-IronPort-AV: E=McAfee;i="6000,8403,9744"; a="244092125"
X-IronPort-AV: E=Sophos;i="5.76,430,1592895600"; d="scan'208";a="244092125"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2020 06:48:32 -0700
IronPort-SDR: pzqwYJYD7+mysq3xH0RLNKH5WVmgUWkVZGhyHGz6rsToFFJZymD5MantC5zQfL6lNVA1lH43Nx
 Z1PiBIu3FiXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,430,1592895600"; d="scan'208";a="286825988"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga007.fm.intel.com with SMTP; 15 Sep 2020 06:48:28 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 15 Sep 2020 16:48:28 +0300
Date: Tue, 15 Sep 2020 16:48:28 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Karthik B S <karthik.b.s@intel.com>
Subject: Re: [PATCH v8 2/8] drm/i915: Add support for async flips in I915
Message-ID: <20200915134828.GI6112@intel.com>
References: <20200914055633.21109-1-karthik.b.s@intel.com>
 <20200914055633.21109-3-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200914055633.21109-3-karthik.b.s@intel.com>
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
Cc: paulo.r.zanoni@intel.com, michel@daenzer.net,
 dri-devel@lists.freedesktop.org, nicholas.kazlauskas@amd.com,
 vandita.kulkarni@intel.com, uma.shankar@intel.com, daniel.vetter@intel.com,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 14, 2020 at 11:26:27AM +0530, Karthik B S wrote:
> Set the Async Address Update Enable bit in plane ctl
> when async flip is requested.
> =

> v2: -Move the Async flip enablement to individual patch (Paulo)
> =

> v3: -Rebased.
> =

> v4: -Add separate plane hook for async flip case (Ville)
> =

> v5: -Rebased.
> =

> v6: -Move the plane hook to separate patch. (Paulo)
>     -Remove the early return in skl_plane_ctl. (Paulo)
> =

> v7: -Move async address update enable to skl_plane_ctl_crtc() (Ville)
> =

> v8: -Rebased.
> =

> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>

Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 3 +++
>  drivers/gpu/drm/i915/i915_reg.h              | 1 +
>  2 files changed, 4 insertions(+)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index 48712fb0a251..2902fefd217f 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -4785,6 +4785,9 @@ u32 skl_plane_ctl_crtc(const struct intel_crtc_stat=
e *crtc_state)
>  	struct drm_i915_private *dev_priv =3D to_i915(crtc_state->uapi.crtc->de=
v);
>  	u32 plane_ctl =3D 0;
>  =

> +	if (crtc_state->uapi.async_flip)
> +		plane_ctl |=3D PLANE_CTL_ASYNC_FLIP;
> +
>  	if (INTEL_GEN(dev_priv) >=3D 10 || IS_GEMINILAKE(dev_priv))
>  		return plane_ctl;
>  =

> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_=
reg.h
> index 90a05e37ba2f..1c4ddd4deba0 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -6923,6 +6923,7 @@ enum {
>  #define   PLANE_CTL_TILED_X			(1 << 10)
>  #define   PLANE_CTL_TILED_Y			(4 << 10)
>  #define   PLANE_CTL_TILED_YF			(5 << 10)
> +#define   PLANE_CTL_ASYNC_FLIP			(1 << 9)
>  #define   PLANE_CTL_FLIP_HORIZONTAL		(1 << 8)
>  #define   PLANE_CTL_MEDIA_DECOMPRESSION_ENABLE	(1 << 4) /* TGL+ */
>  #define   PLANE_CTL_ALPHA_MASK			(0x3 << 4) /* Pre-GLK */
> -- =

> 2.22.0

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
