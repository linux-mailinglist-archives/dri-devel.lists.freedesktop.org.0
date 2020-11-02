Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C50DC2A2F30
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 17:06:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC04C6E4D4;
	Mon,  2 Nov 2020 16:06:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF7FA6E4D4
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 16:06:08 +0000 (UTC)
IronPort-SDR: MWiSsQbpc+CxT52eWUrS2CqGU3w2RKF8kFWaGXldwzaehRkkQgnyUrpV54LfANP9QHZfua/Q0p
 g/EOzYZhI8DQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9793"; a="233075273"
X-IronPort-AV: E=Sophos;i="5.77,445,1596524400"; d="scan'208";a="233075273"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2020 08:06:07 -0800
IronPort-SDR: dYd2Bvt0Q4sGBa4X8ZMSF4XWRRNdf32gkGxG8uNXK7oLNnmMnnBHXi7+0IGOTMBh2ZgnYIW0RX
 V6+sY5rTCRVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,445,1596524400"; d="scan'208";a="336211222"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 02 Nov 2020 08:06:04 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 02 Nov 2020 18:06:04 +0200
Date: Mon, 2 Nov 2020 18:06:04 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 3/3] drm: Use the state pointer directly in atomic_check
Message-ID: <20201102160604.GO6112@intel.com>
References: <20201102133834.1176740-1-maxime@cerno.tech>
 <20201102133834.1176740-3-maxime@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201102133834.1176740-3-maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 02, 2020 at 02:38:34PM +0100, Maxime Ripard wrote:
> Now that atomic_check takes the global atomic state as a parameter, we
> don't need to go through the pointer in the CRTC state.
> =

> This was done using the following coccinelle script:
> =

> @ crtc_atomic_func @
> identifier helpers;
> identifier func;
> @@
> =

> static struct drm_crtc_helper_funcs helpers =3D {
> 	...,
> 	.atomic_check =3D func,
> 	...,
> };
> =

> @@
> identifier crtc_atomic_func.func;
> identifier crtc, state;
> @@
> =

>   func(struct drm_crtc *crtc, struct drm_atomic_state *state) {
>   ...
> - struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(sta=
te, crtc);
>   ... when !=3D crtc_state
> - crtc_state->state
> + state
>   ...
>  }
> =

> @@
> struct drm_crtc_state *crtc_state;
> identifier crtc_atomic_func.func;
> identifier crtc, state;
> @@
> =

>   func(struct drm_crtc *crtc, struct drm_atomic_state *state) {
>   ...
> - crtc_state->state
> + state
>   ...
>  }
> =

> Suggested-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

lgtm
Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_simple_kms_helper.c | 2 +-
>  drivers/gpu/drm/mxsfb/mxsfb_kms.c       | 2 +-
>  drivers/gpu/drm/omapdrm/omap_crtc.c     | 2 +-
>  drivers/gpu/drm/tilcdc/tilcdc_crtc.c    | 6 +++---
>  drivers/gpu/drm/vc4/vc4_crtc.c          | 2 +-
>  drivers/gpu/drm/xlnx/zynqmp_disp.c      | 4 +---
>  6 files changed, 8 insertions(+), 10 deletions(-)
> =

> diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/dr=
m_simple_kms_helper.c
> index 4b46689634dd..743e57c1b44f 100644
> --- a/drivers/gpu/drm/drm_simple_kms_helper.c
> +++ b/drivers/gpu/drm/drm_simple_kms_helper.c
> @@ -97,7 +97,7 @@ static int drm_simple_kms_crtc_check(struct drm_crtc *c=
rtc,
>  	if (has_primary !=3D crtc_state->enable)
>  		return -EINVAL;
>  =

> -	return drm_atomic_add_affected_planes(crtc_state->state, crtc);
> +	return drm_atomic_add_affected_planes(state, crtc);
>  }
>  =

>  static void drm_simple_kms_crtc_enable(struct drm_crtc *crtc,
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mx=
sfb_kms.c
> index eb0e2b08329b..9040835289a8 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> @@ -281,7 +281,7 @@ static int mxsfb_crtc_atomic_check(struct drm_crtc *c=
rtc,
>  		return -EINVAL;
>  =

>  	/* TODO: Is this needed ? */
> -	return drm_atomic_add_affected_planes(crtc_state->state, crtc);
> +	return drm_atomic_add_affected_planes(state, crtc);
>  }
>  =

>  static void mxsfb_crtc_atomic_flush(struct drm_crtc *crtc,
> diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdr=
m/omap_crtc.c
> index d7442aa55f89..49621b2e1ab5 100644
> --- a/drivers/gpu/drm/omapdrm/omap_crtc.c
> +++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
> @@ -583,7 +583,7 @@ static int omap_crtc_atomic_check(struct drm_crtc *cr=
tc,
>  			return -EINVAL;
>  	}
>  =

> -	pri_state =3D drm_atomic_get_new_plane_state(crtc_state->state,
> +	pri_state =3D drm_atomic_get_new_plane_state(state,
>  						   crtc->primary);
>  	if (pri_state) {
>  		struct omap_crtc_state *omap_crtc_state =3D
> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcd=
c/tilcdc_crtc.c
> index 40c59f4bd962..30213708fc99 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> @@ -665,9 +665,9 @@ static int tilcdc_crtc_atomic_check(struct drm_crtc *=
crtc,
>  	if (!crtc_state->active)
>  		return 0;
>  =

> -	if (crtc_state->state->planes[0].ptr !=3D crtc->primary ||
> -	    crtc_state->state->planes[0].state =3D=3D NULL ||
> -	    crtc_state->state->planes[0].state->crtc !=3D crtc) {
> +	if (state->planes[0].ptr !=3D crtc->primary ||
> +	    state->planes[0].state =3D=3D NULL ||
> +	    state->planes[0].state->crtc !=3D crtc) {
>  		dev_dbg(crtc->dev->dev, "CRTC primary plane must be present");
>  		return -EINVAL;
>  	}
> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crt=
c.c
> index 06088854c647..ea710beb8e00 100644
> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> @@ -597,7 +597,7 @@ static int vc4_crtc_atomic_check(struct drm_crtc *crt=
c,
>  	if (ret)
>  		return ret;
>  =

> -	for_each_new_connector_in_state(crtc_state->state, conn, conn_state,
> +	for_each_new_connector_in_state(state, conn, conn_state,
>  					i) {
>  		if (conn_state->crtc !=3D crtc)
>  			continue;
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zy=
nqmp_disp.c
> index 444865af9e36..c685d94409b0 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> @@ -1506,9 +1506,7 @@ zynqmp_disp_crtc_atomic_disable(struct drm_crtc *cr=
tc,
>  static int zynqmp_disp_crtc_atomic_check(struct drm_crtc *crtc,
>  					 struct drm_atomic_state *state)
>  {
> -	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(sta=
te,
> -									  crtc);
> -	return drm_atomic_add_affected_planes(crtc_state->state, crtc);
> +	return drm_atomic_add_affected_planes(state, crtc);
>  }
>  =

>  static void
> -- =

> 2.28.0

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
