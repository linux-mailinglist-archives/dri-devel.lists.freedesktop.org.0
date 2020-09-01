Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC74258D51
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 13:21:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B55E6E84E;
	Tue,  1 Sep 2020 11:21:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A8BB6E3D0;
 Tue,  1 Sep 2020 11:21:13 +0000 (UTC)
IronPort-SDR: sRKoR7Glw3FcCugXOIWXNcZvCKRU8DIsaTPJmS7l3vmOjND8RqGo3V4BG/oPjksJ6PzSDNrTYU
 nwNTUU7zQqPA==
X-IronPort-AV: E=McAfee;i="6000,8403,9730"; a="157148451"
X-IronPort-AV: E=Sophos;i="5.76,378,1592895600"; d="scan'208";a="157148451"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2020 04:21:12 -0700
IronPort-SDR: EwpwQ0JHtVb7+3PE9AkWAIvY3jlP6EFJUcqaOycc57+jgZ8MVxwaaP/efK6GO+0gAlMWgGsc3V
 h/TMFjfLoihg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,378,1592895600"; d="scan'208";a="338544596"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 01 Sep 2020 04:21:08 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 01 Sep 2020 14:21:07 +0300
Date: Tue, 1 Sep 2020 14:21:07 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Karthik B S <karthik.b.s@intel.com>
Subject: Re: [PATCH v6 3/7] drm/i915: Add checks specific to async flips
Message-ID: <20200901112107.GH6112@intel.com>
References: <20200807093551.10673-1-karthik.b.s@intel.com>
 <20200807093551.10673-4-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200807093551.10673-4-karthik.b.s@intel.com>
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

On Fri, Aug 07, 2020 at 03:05:47PM +0530, Karthik B S wrote:
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

> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 113 +++++++++++++++++++
>  1 file changed, 113 insertions(+)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index ce2b0c14a073..9629c751d2af 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -14832,6 +14832,110 @@ static bool intel_cpu_transcoders_need_modeset(=
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
> +	struct intel_crtc_state *old_crtc_state, *new_crtc_state;
> +	struct intel_plane_state *new_plane_state, *old_plane_state;
> +	struct intel_crtc *crtc;
> +	struct intel_plane *intel_plane;

s/intel_plane/plane/

> +	int i;
> +
> +	for_each_oldnew_intel_crtc_in_state(state, crtc, old_crtc_state,
> +					    new_crtc_state, i) {
> +		if (needs_modeset(new_crtc_state)) {
> +			DRM_DEBUG_KMS("Modeset Required. Async flip not supported\n");
> +			return -EINVAL;
> +		}
> +
> +		if (!new_crtc_state->uapi.active) {
> +			DRM_DEBUG_KMS("CRTC inactive\n");
> +			return -EINVAL;
> +		}

All the uapi.foo stuff should be hw.foo most likely.

> +		if (old_crtc_state->active_planes !=3D new_crtc_state->active_planes) {
> +			DRM_DEBUG_KMS("Active planes cannot be changed during async flip\n");
> +			return -EINVAL;
> +		}
> +	}
> +
> +	for_each_oldnew_intel_plane_in_state(state, intel_plane, old_plane_stat=
e,
> +					     new_plane_state, i) {
> +		/*TODO: Async flip is only supported through the page flip IOCTL
> +		 * as of now. So support currently added for primary plane only.
> +		 * Support for other planes should be added when async flip is
> +		 * enabled in the atomic IOCTL path.
> +		 */
> +		if (intel_plane->id !=3D PLANE_PRIMARY)
> +			return -EINVAL;
> +
> +		if (old_plane_state->color_plane[0].x !=3D
> +		    new_plane_state->color_plane[0].x ||
> +		    old_plane_state->color_plane[0].y !=3D
> +		    new_plane_state->color_plane[0].y) {
> +			DRM_DEBUG_KMS("Offsets cannot be changed in async flip\n");
> +			return -EINVAL;
> +		}
> +
> +		if (old_plane_state->uapi.fb->modifier !=3D
> +		    new_plane_state->uapi.fb->modifier) {
> +			DRM_DEBUG_KMS("Framebuffer modifiers cannot be changed in async flip\=
n");
> +			return -EINVAL;
> +		}
> +
> +		if (old_plane_state->uapi.fb->format !=3D
> +		    new_plane_state->uapi.fb->format) {
> +			DRM_DEBUG_KMS("Framebuffer format cannot be changed in async flip\n");
> +			return -EINVAL;
> +		}
> +
> +		if (intel_wm_need_update(old_plane_state, new_plane_state)) {

That function is meant for pre-g4x wm hacks only. Do not use.

> +			DRM_DEBUG_KMS("WM update not allowed in async flip\n");
> +			return -EINVAL;
> +		}
> +
> +		if (old_plane_state->uapi.alpha !=3D new_plane_state->uapi.alpha) {
> +			DRM_DEBUG_KMS("Alpha value cannot be changed in async flip\n");
> +			return -EINVAL;
> +		}
> +
> +		if (old_plane_state->uapi.pixel_blend_mode !=3D
> +		    new_plane_state->uapi.pixel_blend_mode) {
> +			DRM_DEBUG_KMS("Pixel blend mode cannot be changed in async flip\n");
> +			return -EINVAL;
> +		}
> +
> +		if (old_plane_state->uapi.color_encoding !=3D new_plane_state->uapi.co=
lor_encoding) {
> +			DRM_DEBUG_KMS("Color encoding cannot be changed in async flip\n");
> +			return -EINVAL;
> +		}
> +
> +		if (old_plane_state->uapi.color_range !=3D new_plane_state->uapi.color=
_range) {
> +			DRM_DEBUG_KMS("Color range cannot be changed in async flip\n");
> +			return -EINVAL;
> +		}

Seems to be missing at least a dst coordinate check.

Not sure we can allow async flip with linear buffers. Older hw at least
had issues with that.

> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * intel_atomic_check - validate state object
>   * @dev: drm device
> @@ -15011,6 +15115,15 @@ static int intel_atomic_check(struct drm_device =
*dev,
>  				       "[modeset]" : "[fastset]");
>  	}
>  =

> +	for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i) {
> +		if (new_crtc_state->uapi.async_flip) {
> +			ret =3D intel_atomic_check_async(state);
> +			if (ret)
> +				goto fail;
> +
> +			break;

Why would we break here?

> +		}
> +	}
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
