Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB97D26FBCC
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 13:51:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11C1F6ECD7;
	Fri, 18 Sep 2020 11:51:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEAF06E159;
 Fri, 18 Sep 2020 11:51:37 +0000 (UTC)
IronPort-SDR: ees26yQb4YgNmY1VFvcgdPUXzxq3UfHh22mLIA5ur9JBJJX+WD+09isIMEQUeJRzWQFtfpsPQo
 yl0qGvwKgrmg==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="147659058"
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; d="scan'208";a="147659058"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2020 04:51:37 -0700
IronPort-SDR: sUUF/kqZTjC9h2XnwEdF/YLwJYiUZSsjXMWhq1wOWdHZF1HlXO1TOqg/ZSuycKt0wbDBXsBeQw
 sBwprXwWNH7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; d="scan'208";a="410266761"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 18 Sep 2020 04:51:33 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 18 Sep 2020 14:51:32 +0300
Date: Fri, 18 Sep 2020 14:51:32 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Karthik B S <karthik.b.s@intel.com>
Subject: Re: [PATCH v10 3/8] drm/i915: Add checks specific to async flips
Message-ID: <20200918115132.GI6112@intel.com>
References: <20200916150824.15749-4-karthik.b.s@intel.com>
 <20200918090234.18038-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200918090234.18038-1-karthik.b.s@intel.com>
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

On Fri, Sep 18, 2020 at 02:32:34PM +0530, Karthik B S wrote:
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

> v9: -Replace DRM_DEBUG_KMS with drm_dbg_kms(). (Ville)
>     -Fix comment formatting. (Ville)
>     -Remove gen specific checks. (Ville)
>     -Remove irrelevant FB size check. (Ville)
>     -Add missing stride check. (Ville)
>     -Use drm_rect_equals() instead of individual checks. (Ville)
>     -Call intel_atomic_check_async before state dump. (Ville)
> =

> v10: -Fix the checkpatch errors seen on CI.
> =

> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 137 +++++++++++++++++++
>  1 file changed, 137 insertions(+)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index 30e8908ee263..7327ed4a04f8 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -14877,6 +14877,137 @@ static bool intel_cpu_transcoders_need_modeset(=
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
> +	struct drm_i915_private *i915 =3D to_i915(state->base.dev);
> +	struct intel_crtc_state *old_crtc_state, *new_crtc_state;
> +	struct intel_plane_state *new_plane_state, *old_plane_state;a

All plane/crtc states can be const I believe.

> +	struct intel_crtc *crtc;
> +	struct intel_plane *plane;
> +	int i;
> +
> +	for_each_oldnew_intel_crtc_in_state(state, crtc, old_crtc_state,
> +					    new_crtc_state, i) {
> +		if (needs_modeset(new_crtc_state)) {
> +			drm_dbg_kms(&i915->drm, "Modeset Required. Async flip not supported\n=
");
> +			return -EINVAL;
> +		}
> +
> +		if (!new_crtc_state->hw.active) {
> +			drm_dbg_kms(&i915->drm, "CRTC inactive\n");
> +			return -EINVAL;
> +		}
> +		if (old_crtc_state->active_planes !=3D new_crtc_state->active_planes) {
> +			drm_dbg_kms(&i915->drm,
> +				    "Active planes cannot be changed during async flip\n");
> +			return -EINVAL;
> +		}
> +	}
> +
> +	for_each_oldnew_intel_plane_in_state(state, plane, old_plane_state,
> +					     new_plane_state, i) {
> +		/*
> +		 * TODO: Async flip is only supported through the page flip IOCTL
> +		 * as of now. So support currently added for primary plane only.
> +		 * Support for other planes on platforms on which supports
> +		 * this(vlv/chv and icl+) should be added when async flip is
> +		 * enabled in the atomic IOCTL path.
> +		 */
> +		if (plane->id !=3D PLANE_PRIMARY)
> +			return -EINVAL;
> +
> +		/*
> +		 * FIXME: This check is kept generic for all platforms.
> +		 * Need to verify this for all gen9 and gen10 platforms to enable
> +		 * this selectively if required.
> +		 */
> +		if (!(new_plane_state->hw.fb->modifier !=3D I915_FORMAT_MOD_X_TILED ||
> +		      new_plane_state->hw.fb->modifier !=3D I915_FORMAT_MOD_Y_TILED ||
> +		      new_plane_state->hw.fb->modifier !=3D I915_FORMAT_MOD_Yf_TILED))=
 {

I suspect a switch() would be less ugly

looks good otherwise
Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

> +			drm_dbg_kms(&i915->drm,
> +				    "Linear memory/CCS does not support async flips\n");
> +			return -EINVAL;
> +		}
> +
> +		if (old_plane_state->color_plane[0].stride !=3D
> +		    new_plane_state->color_plane[0].stride) {
> +			drm_dbg_kms(&i915->drm, "Stride cannot be changed in async flip\n");
> +			return -EINVAL;
> +		}
> +
> +		if (old_plane_state->hw.fb->modifier !=3D
> +		    new_plane_state->hw.fb->modifier) {
> +			drm_dbg_kms(&i915->drm,
> +				    "Framebuffer modifiers cannot be changed in async flip\n");
> +			return -EINVAL;
> +		}
> +
> +		if (old_plane_state->hw.fb->format !=3D
> +		    new_plane_state->hw.fb->format) {
> +			drm_dbg_kms(&i915->drm,
> +				    "Framebuffer format cannot be changed in async flip\n");
> +			return -EINVAL;
> +		}
> +
> +		if (old_plane_state->hw.rotation !=3D
> +		    new_plane_state->hw.rotation) {
> +			drm_dbg_kms(&i915->drm, "Rotation cannot be changed in async flip\n");
> +			return -EINVAL;
> +		}
> +
> +		if (!drm_rect_equals(&old_plane_state->uapi.src, &new_plane_state->uap=
i.src) ||
> +		    !drm_rect_equals(&old_plane_state->uapi.dst, &new_plane_state->uap=
i.dst)) {
> +			drm_dbg_kms(&i915->drm,
> +				    "Plane size/co-ordinates cannot be changed in async flip\n");
> +			return -EINVAL;
> +		}
> +
> +		if (old_plane_state->hw.alpha !=3D new_plane_state->hw.alpha) {
> +			drm_dbg_kms(&i915->drm, "Alpha value cannot be changed in async flip\=
n");
> +			return -EINVAL;
> +		}
> +
> +		if (old_plane_state->hw.pixel_blend_mode !=3D
> +		    new_plane_state->hw.pixel_blend_mode) {
> +			drm_dbg_kms(&i915->drm,
> +				    "Pixel blend mode cannot be changed in async flip\n");
> +			return -EINVAL;
> +		}
> +
> +		if (old_plane_state->hw.color_encoding !=3D new_plane_state->hw.color_=
encoding) {
> +			drm_dbg_kms(&i915->drm,
> +				    "Color encoding cannot be changed in async flip\n");
> +			return -EINVAL;
> +		}
> +
> +		if (old_plane_state->hw.color_range !=3D new_plane_state->hw.color_ran=
ge) {
> +			drm_dbg_kms(&i915->drm, "Color range cannot be changed in async flip\=
n");
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
> @@ -15045,6 +15176,12 @@ static int intel_atomic_check(struct drm_device =
*dev,
>  =

>  	for_each_oldnew_intel_crtc_in_state(state, crtc, old_crtc_state,
>  					    new_crtc_state, i) {
> +		if (new_crtc_state->uapi.async_flip) {
> +			ret =3D intel_atomic_check_async(state);
> +			if (ret)
> +				goto fail;
> +		}
> +
>  		if (!needs_modeset(new_crtc_state) &&
>  		    !new_crtc_state->update_pipe)
>  			continue;
> -- =

> 2.22.0

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
