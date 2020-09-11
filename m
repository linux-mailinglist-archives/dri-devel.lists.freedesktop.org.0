Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09590265F1E
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 13:59:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF3BC6E9FF;
	Fri, 11 Sep 2020 11:59:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B12196E15E
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 11:59:27 +0000 (UTC)
IronPort-SDR: l6ic1khofqepmzl3EyAhm6qY+oZuoHc45vqrEa1dINApY1fsY28liRDazD2lf4s8UBLQXJbOdU
 TVGzYWhWZ/fw==
X-IronPort-AV: E=McAfee;i="6000,8403,9740"; a="220295365"
X-IronPort-AV: E=Sophos;i="5.76,415,1592895600"; d="scan'208";a="220295365"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2020 04:59:26 -0700
IronPort-SDR: nBMbAVI/5fX9U537ITu4TKQLuhp788Uw4uIaLyj26JzUBJOgzO4BGyIzdqhycLa8gkAGBTT4iG
 mCFKfNKttb6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,415,1592895600"; d="scan'208";a="286876173"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga008.fm.intel.com with SMTP; 11 Sep 2020 04:59:22 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 11 Sep 2020 14:59:21 +0300
Date: Fri, 11 Sep 2020 14:59:21 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Stefan Agner <stefan@agner.ch>
Subject: Re: [RFC PATCH 2/3] drm/atomic-helper: add REQUIRE_MATCHING_FB flag
Message-ID: <20200911115921.GD6112@intel.com>
References: <20200910092425.1016976-1-stefan@agner.ch>
 <20200910092425.1016976-2-stefan@agner.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200910092425.1016976-2-stefan@agner.ch>
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
Cc: marex@denx.de, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 tomi.valkeinen@ti.com, laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 10, 2020 at 11:24:24AM +0200, Stefan Agner wrote:
> Add flag which checks that the framebuffer size matches the plane size
> exactly. This is useful for display controller which can't handle
> framebuffers other than the plane/CRTC size.
> =

> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c               | 7 +++++++
>  drivers/gpu/drm/selftests/test-drm_plane_helper.c | 9 +++++++++
>  include/drm/drm_atomic_helper.h                   | 1 +
>  3 files changed, 17 insertions(+)
> =

> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_at=
omic_helper.c
> index 755572a37f3f..8bc7f8c2e566 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -802,6 +802,7 @@ int drm_atomic_helper_check_plane_state(struct drm_pl=
ane_state *plane_state,
>  	int hscale, vscale;
>  	bool can_position =3D flags & DRM_PLANE_CAN_POSITION;
>  	bool can_update_disabled =3D flags & DRM_PLANE_CAN_UPDATE_DISABLED;
> +	bool require_matching_fb =3D flags & DRM_PLANE_REQUIRE_MATCHING_FB;
>  =

>  	WARN_ON(plane_state->crtc && plane_state->crtc !=3D crtc_state->crtc);
>  =

> @@ -860,6 +861,12 @@ int drm_atomic_helper_check_plane_state(struct drm_p=
lane_state *plane_state,
>  		return -EINVAL;
>  	}
>  =

> +	if (require_matching_fb && (drm_rect_width(src) !=3D fb->width ||
> +	    drm_rect_height(src) !=3D fb->height)) {

src rect is .16 fixed point vs. fb dimensions are integers

Still not a fan of these swiss army knife functions but meh.

> +		DRM_DEBUG_KMS("Framebuffer size must match plane size.\n");
> +		return -EINVAL;
> +	}
> +
>  	return 0;
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_check_plane_state);
> diff --git a/drivers/gpu/drm/selftests/test-drm_plane_helper.c b/drivers/=
gpu/drm/selftests/test-drm_plane_helper.c
> index 01e95b2d572f..2c81bbef830e 100644
> --- a/drivers/gpu/drm/selftests/test-drm_plane_helper.c
> +++ b/drivers/gpu/drm/selftests/test-drm_plane_helper.c
> @@ -139,6 +139,15 @@ int igt_check_plane_state(void *ignored)
>  	FAIL_ON(!check_src_eq(&plane_state, 0, 0, 1023 << 16, 767 << 16));
>  	FAIL_ON(!check_crtc_eq(&plane_state, 0, 0, 1023, 767));
>  =

> +	/* Check whether requiring same size framebuffer works correctly. */
> +	set_src(&plane_state, 0, 0, 1024 << 16, 768 << 16);
> +	set_crtc(&plane_state, 0, 0, 1024, 768);
> +	ret =3D drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
> +						  DRM_PLANE_HELPER_NO_SCALING,
> +						  DRM_PLANE_HELPER_NO_SCALING,
> +						  DRM_PLANE_REQUIRE_MATCHING_FB);
> +	FAIL(!ret, "Should not be able to use different size framebuffer with R=
EQUIRE_MATCHING_FB\n");
> +
>  	/* Simple scaling tests. */
>  	set_src(&plane_state, 0, 0, 512 << 16, 384 << 16);
>  	set_crtc(&plane_state, 0, 0, 1024, 768);
> diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_hel=
per.h
> index bb9957b4f91b..244b730e84d3 100644
> --- a/include/drm/drm_atomic_helper.h
> +++ b/include/drm/drm_atomic_helper.h
> @@ -43,6 +43,7 @@ int drm_atomic_helper_check_modeset(struct drm_device *=
dev,
>  =

>  #define DRM_PLANE_CAN_POSITION				BIT(0)
>  #define DRM_PLANE_CAN_UPDATE_DISABLED			BIT(1)
> +#define DRM_PLANE_REQUIRE_MATCHING_FB			BIT(2)
>  =

>  int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_st=
ate,
>  					const struct drm_crtc_state *crtc_state,
> -- =

> 2.28.0
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
