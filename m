Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6522F2D7839
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 15:52:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 676BB6E0B6;
	Fri, 11 Dec 2020 14:52:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C2556E0B6
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 14:52:22 +0000 (UTC)
IronPort-SDR: aR70OTvneMf3Hr1XzIVgMERLM/wlxk/zizyQJFHEvCBF9e4tCVcu5rYkfM8fG16RP1mOb/Somm
 KnTSqxIZ1gYg==
X-IronPort-AV: E=McAfee;i="6000,8403,9831"; a="259156717"
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; d="scan'208";a="259156717"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2020 06:52:22 -0800
IronPort-SDR: SdIg2BGzIvMam8LVgZdYoinYrJ53aa53Ma8rLRL8xCR6STPOhTA8jYsil366QGd0TbcJx35a2H
 ARadcdUU4PrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; d="scan'208";a="322134726"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga007.fm.intel.com with SMTP; 11 Dec 2020 06:52:20 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 11 Dec 2020 16:52:19 +0200
Date: Fri, 11 Dec 2020 16:52:19 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v3 4/4] drm: require each CRTC to have a unique primary
 plane
Message-ID: <X9OHo9u/kECbYGrK@intel.com>
References: <diZcSZPAu0GrvVEqzkkXk1LYv1pDkE536hsLoYTUoUw@cp3-web-016.plabs.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <diZcSZPAu0GrvVEqzkkXk1LYv1pDkE536hsLoYTUoUw@cp3-web-016.plabs.ch>
X-Patchwork-Hint: comment
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 11, 2020 at 01:08:26PM +0000, Simon Ser wrote:
> User-space expects to be able to pick a primary plane for each CRTC
> exposed by the driver. Make sure this assumption holds in
> drm_mode_config_validate.
> =

> Use the legacy drm_crtc.primary field to check this, because it's
> simpler and we require drivers to set it anyways. Accumulate a set of
> primary planes which are already used for a CRTC in a bitmask. Error out
> if a primary plane is re-used.
> =

> v2: new patch
> =

> v3:
> - Use u64 instead of __u64 (Jani)
> - Use `unsigned int` instead of `unsigned` (Jani)
> =

> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_mode_config.c | 21 +++++++++++++++++++++
>  drivers/gpu/drm/drm_plane.c       |  6 ++++++
>  2 files changed, 27 insertions(+)
> =

> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode=
_config.c
> index fbe680035129..c5cf5624c106 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -626,6 +626,9 @@ void drm_mode_config_validate(struct drm_device *dev)
>  {
>  	struct drm_encoder *encoder;
>  	struct drm_crtc *crtc;
> +	struct drm_plane *plane;
> +	u64 primary_with_crtc =3D 0, cursor_with_crtc =3D 0;

u32

> +	unsigned int num_primary =3D 0;
>  =

>  	if (!drm_core_check_feature(dev, DRIVER_MODESET))
>  		return;
> @@ -647,12 +650,30 @@ void drm_mode_config_validate(struct drm_device *de=
v)
>  			     "Bogus primary plane possible_crtcs: [PLANE:%d:%s] must be compa=
tible with [CRTC:%d:%s]\n",
>  			     crtc->primary->base.id, crtc->primary->name,
>  			     crtc->base.id, crtc->name);
> +			WARN(primary_with_crtc & BIT(crtc->primary->index),

drm_plane_mask() all over

> +			     "Primary plane [PLANE:%d:%s] used for two CRTCs",

s/two/multiple/ ?

> +			     crtc->primary->base.id, crtc->primary->name);
> +			primary_with_crtc |=3D BIT(crtc->primary->index);
>  		}
>  		if (crtc->cursor) {
>  			WARN(!(crtc->cursor->possible_crtcs & BIT(crtc->index)),
>  			     "Bogus cursor plane possible_crtcs: [PLANE:%d:%s] must be compat=
ible with [CRTC:%d:%s]\n",
>  			     crtc->cursor->base.id, crtc->cursor->name,
>  			     crtc->base.id, crtc->name);
> +			WARN(cursor_with_crtc & BIT(crtc->cursor->index),
> +			     "Primary plane [PLANE:%d:%s] used for two CRTCs",

s/Primary/Cursor/

> +			     crtc->cursor->base.id, crtc->cursor->name);
> +			cursor_with_crtc |=3D BIT(crtc->cursor->index);
>  		}
>  	}
> +
> +	drm_for_each_plane(plane, dev) {
> +		if (plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY) {
> +			num_primary++;
> +		}
> +	}
> +
> +	WARN(num_primary !=3D dev->mode_config.num_crtc,
> +	     "Must have as many primary planes as there are CRTCs, but have %u =
primary planes and %u CRTCs",
> +	     num_primary, dev->mode_config.num_crtc);
>  }
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 49b0a8b9ac02..a1f4510efa83 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -54,6 +54,12 @@
>   * enum drm_plane_type). A plane can be compatible with multiple CRTCs, =
see
>   * &drm_plane.possible_crtcs.
>   *
> + * Each CRTC must have a unique primary plane userspace can attach to en=
able
> + * the CRTC. In other words, userspace must be able to attach a different
> + * primary plane to each CRTC at the same time. Primary planes can still=
 be
> + * compatible with multiple CRTCs. There must be exactly as many primary=
 planes
> + * as there are CRTCs.
> + *
>   * Legacy uAPI doesn't expose the primary and cursor planes directly. DR=
M core
>   * relies on the driver to set the primary and optionally the cursor pla=
ne used
>   * for legacy IOCTLs. This is done by calling drm_crtc_init_with_planes(=
). All
> -- =

> 2.29.2
> =

> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
