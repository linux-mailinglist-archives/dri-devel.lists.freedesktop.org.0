Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A22926A6B6
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 16:03:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B4E46E351;
	Tue, 15 Sep 2020 14:03:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AF876E34D;
 Tue, 15 Sep 2020 14:03:38 +0000 (UTC)
IronPort-SDR: yW+cD79sJNgU1VaxZwkHPcCqxb4tqyMZBsPTZnwQMsiNRq1JNXXr3anqM6FCofNtt47PqJnVCP
 w9ERJ3+IMW7w==
X-IronPort-AV: E=McAfee;i="6000,8403,9744"; a="156686728"
X-IronPort-AV: E=Sophos;i="5.76,430,1592895600"; d="scan'208";a="156686728"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2020 07:03:37 -0700
IronPort-SDR: J2Iv2O7/AegCKcjmoBvxKy1FYHqh9b7wO/IIAYV96GfVcTrjdk98eSX8Yg3yJEfS1qcEF77hw6
 9hGZPIfEa6iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,430,1592895600"; d="scan'208";a="306633545"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 15 Sep 2020 07:03:33 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 15 Sep 2020 17:03:32 +0300
Date: Tue, 15 Sep 2020 17:03:32 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Karthik B S <karthik.b.s@intel.com>
Subject: Re: [PATCH v8 3/8] drm/i915: Add checks specific to async flips
Message-ID: <20200915140332.GJ6112@intel.com>
References: <20200914055633.21109-1-karthik.b.s@intel.com>
 <20200914055633.21109-4-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200914055633.21109-4-karthik.b.s@intel.com>
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

On Mon, Sep 14, 2020 at 11:26:28AM +0530, Karthik B S wrote:
> If flip is requested on any other plane, reject it.
> =

> Make sure there is no change in fbc, offset and framebuffer modifiers
> when async flip is requested.
> =

> If any of these are modified, reject async flip.
> =

> v2: -Replace DRM_ERROR (Paulo)
>     -Add check for changes in OFFSET, FBC, RC(Paulo)
> =

> v3: -Removed TODO as benchmarking tests have been run now.
> =

> v4: -Added more state checks for async flip (Ville)
>     -Moved intel_atomic_check_async to the end of intel_atomic_check
>      as the plane checks needs to pass before this. (Ville)
>     -Removed crtc_state->enable_fbc check. (Ville)
>     -Set the I915_MODE_FLAG_GET_SCANLINE_FROM_TIMESTAMP flag for async
>      flip case as scanline counter is not reliable here.
> =

> v5: -Fix typo and other check patch errors seen in CI
>      in 'intel_atomic_check_async' function.
> =

> v6: -Don't call intel_atomic_check_async multiple times. (Ville)
>     -Remove the check for n_planes in intel_atomic_check_async
>     -Added documentation for async flips. (Paulo)
> =

> v7: -Replace 'intel_plane' with 'plane'. (Ville)
>     -Replace all uapi.foo as hw.foo. (Ville)
>     -Do not use intel_wm_need_update function. (Ville)
>     -Add destination coordinate check. (Ville)
>     -Do not allow async flip with linear buffer
>      on older hw as it has issues with this. (Ville)
>     -Remove break after intel_atomic_check_async. (Ville)
> =

> v8: -Rebased.
> =

> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 143 +++++++++++++++++++
>  1 file changed, 143 insertions(+)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index 2902fefd217f..a0c17d94daf3 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -14876,6 +14876,142 @@ static bool intel_cpu_transcoders_need_modeset(=
struct intel_atomic_state *state,
>  	return false;
>  }
>  =

> +/**
> + * DOC: asynchronous flip implementation
> + *
> + * Asynchronous page flip is the implementation for the DRM_MODE_PAGE_FL=
IP_ASYNC
> + * flag. Currently async flip is only supported via the drmModePageFlip =
IOCTL.
> + * Correspondingly, support is currently added for primary plane only.
> + *
> + * Async flip can only change the plane surface address, so anything else
> + * changing is rejected from the intel_atomic_check_async() function.
> + * Once this check is cleared, flip done interrupt is enabled using
> + * the skl_enable_flip_done() function.
> + *
> + * As soon as the surface address register is written, flip done interru=
pt is
> + * generated and the requested events are sent to the usersapce in the i=
nterrupt
> + * handler itself. The timestamp and sequence sent during the flip done =
event
> + * correspond to the last vblank and have no relation to the actual time=
 when
> + * the flip done event was sent.
> + */
> +
> +static int intel_atomic_check_async(struct intel_atomic_state *state)
> +{
> +	struct drm_i915_private *dev_priv =3D to_i915(state->base.dev);
> +	struct intel_crtc_state *old_crtc_state, *new_crtc_state;
> +	struct intel_plane_state *new_plane_state, *old_plane_state;
> +	struct intel_crtc *crtc;
> +	struct intel_plane *plane;
> +	int i;
> +
> +	for_each_oldnew_intel_crtc_in_state(state, crtc, old_crtc_state,
> +					    new_crtc_state, i) {
> +		if (needs_modeset(new_crtc_state)) {
> +			DRM_DEBUG_KMS("Modeset Required. Async flip not supported\n");

Per-device debugs pls. drm_dbg_kms() etc.

> +			return -EINVAL;
> +		}
> +
> +		if (!new_crtc_state->hw.active) {
> +			DRM_DEBUG_KMS("CRTC inactive\n");
> +			return -EINVAL;
> +		}
> +		if (old_crtc_state->active_planes !=3D new_crtc_state->active_planes) {
> +			DRM_DEBUG_KMS("Active planes cannot be changed during async flip\n");
> +			return -EINVAL;
> +		}
> +	}
> +
> +	for_each_oldnew_intel_plane_in_state(state, plane, old_plane_state,
> +					     new_plane_state, i) {
> +		/*TODO: Async flip is only supported through the page flip IOCTL

Comment formatting is wrong.

> +		 * as of now. So support currently added for primary plane only.
> +		 * Support for other planes should be added when async flip is
> +		 * enabled in the atomic IOCTL path.

Obviously only for hw that actually supports it. Which I think
means vlv/chv and icl+.

> +		 */
> +		if (plane->id !=3D PLANE_PRIMARY)
> +			return -EINVAL;
> +
> +		/*FIXME: This check is kept generic for all gen <=3D 10 platforms.

More bad formatting.

> +		 * Need to verify this for all gen9 and gen10 platforms to enable
> +		 * this selectively if required.
> +		 */
> +		if (new_plane_state->hw.fb->modifier =3D=3D DRM_FORMAT_MOD_LINEAR &&
> +		    INTEL_GEN(dev_priv) <=3D 10) {

I would drop the gen check for the time being. Much easier for
bisection if we don't enable random features for random platforms in
the initial enabling patch.

Hmm. We're also missing a check for CCS. CCS does not support async
flips iirc. So I recommand only explicitly allowing X/Y/Yf tile here
(assuming all those are supposed to work), reject everything else.

> +			DRM_DEBUG_KMS("Linear memory does not support async flips on gen <=3D=
 10\n");
> +			return -EINVAL;
> +		}
> +
> +		if (old_plane_state->color_plane[0].x !=3D
> +		    new_plane_state->color_plane[0].x ||
> +		    old_plane_state->color_plane[0].y !=3D
> +		    new_plane_state->color_plane[0].y) {
> +			DRM_DEBUG_KMS("Offsets cannot be changed in async flip\n");
> +			return -EINVAL;
> +		}
> +
> +		if (old_plane_state->hw.fb->modifier !=3D
> +		    new_plane_state->hw.fb->modifier) {
> +			DRM_DEBUG_KMS("Framebuffer modifiers cannot be changed in async flip\=
n");
> +			return -EINVAL;
> +		}
> +
> +		if (old_plane_state->hw.fb->format !=3D
> +		    new_plane_state->hw.fb->format) {
> +			DRM_DEBUG_KMS("Framebuffer format cannot be changed in async flip\n");
> +			return -EINVAL;
> +		}
> +
> +		if (old_plane_state->hw.rotation !=3D
> +		    new_plane_state->hw.rotation) {
> +			DRM_DEBUG_KMS("Rotation cannot be changed in async flip\n");
> +			return -EINVAL;
> +		}
> +
> +		if (old_plane_state->hw.fb->width !=3D
> +		    new_plane_state->hw.fb->width ||
> +		    old_plane_state->hw.fb->height !=3D
> +		    new_plane_state->hw.fb->height) {

FB size is irrelevant. This check can be dropped.

But stride will need to be checked. Looks like that one is missing.
Though we should check plane_state->color_plane[0].stride instead
of the original fb stride, since the former is what we actually program
into the hw.

> +			DRM_DEBUG_KMS("Framebuffer dimensions cannot be changed in async flip=
\n");
> +			return -EINVAL;
> +		}
> +
> +		if (old_plane_state->uapi.src_w !=3D new_plane_state->uapi.src_w ||
> +		    old_plane_state->uapi.src_h !=3D new_plane_state->uapi.src_h ||
> +		    old_plane_state->uapi.src_x !=3D new_plane_state->uapi.src_x ||
> +		    old_plane_state->uapi.src_y !=3D new_plane_state->uapi.src_y ||
> +		    old_plane_state->uapi.crtc_w !=3D new_plane_state->uapi.crtc_w ||
> +		    old_plane_state->uapi.crtc_h !=3D new_plane_state->uapi.crtc_h ||
> +		    old_plane_state->uapi.crtc_x !=3D new_plane_state->uapi.crtc_x ||
> +		    old_plane_state->uapi.crtc_y !=3D new_plane_state->uapi.crtc_y) {
> +			DRM_DEBUG_KMS("Plane size/co-ordinates cannot be changed in async fli=
p\n");

These should check the uapi.src/dst rectangles instead.
In fact I think just two drm_rect_equals() calls will do here,
and then I think we can also drop the color_plane[0].x/y checks
above since they should be the same as checking the src.x1/y1.

> +			return -EINVAL;
> +		}
> +
> +		if (old_plane_state->hw.alpha !=3D new_plane_state->hw.alpha) {
> +			DRM_DEBUG_KMS("Alpha value cannot be changed in async flip\n");
> +			return -EINVAL;
> +		}
> +
> +		if (old_plane_state->hw.pixel_blend_mode !=3D
> +		    new_plane_state->hw.pixel_blend_mode) {
> +			DRM_DEBUG_KMS("Pixel blend mode cannot be changed in async flip\n");
> +			return -EINVAL;
> +		}
> +
> +		if (old_plane_state->hw.color_encoding !=3D new_plane_state->hw.color_=
encoding) {
> +			DRM_DEBUG_KMS("Color encoding cannot be changed in async flip\n");
> +			return -EINVAL;
> +		}
> +
> +		if (old_plane_state->hw.color_range !=3D new_plane_state->hw.color_ran=
ge) {
> +			DRM_DEBUG_KMS("Color range cannot be changed in async flip\n");
> +			return -EINVAL;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * intel_atomic_check - validate state object
>   * @dev: drm device
> @@ -15053,6 +15189,13 @@ static int intel_atomic_check(struct drm_device =
*dev,
>  				       "[modeset]" : "[fastset]");
>  	}
>  =

> +	for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i) {
> +		if (new_crtc_state->uapi.async_flip) {
> +			ret =3D intel_atomic_check_async(state);
> +			if (ret)
> +				goto fail;
> +		}
> +	}

I would put this before the state dump above. Could even stick it into
the same loop I guess.

>  	return 0;
>  =

>   fail:
> -- =

> 2.22.0

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
