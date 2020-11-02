Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B88F52A25DB
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 09:09:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE9236E42C;
	Mon,  2 Nov 2020 08:09:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50CB66E431
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 08:09:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0003CABDE;
 Mon,  2 Nov 2020 08:09:45 +0000 (UTC)
Subject: Re: [PATCH 1/2] drm/atomic: Pass the full state to CRTC atomic_check
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20201028123222.1732139-1-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <7b292ba6-c16f-efd8-d71a-5ae4d07a6b7a@suse.de>
Date: Mon, 2 Nov 2020 09:09:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <20201028123222.1732139-1-maxime@cerno.tech>
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
Content-Type: multipart/mixed; boundary="===============1748274895=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1748274895==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="JpjRZi6BLvl3HHWcSz7YTv9hToUsnnp5I"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--JpjRZi6BLvl3HHWcSz7YTv9hToUsnnp5I
Content-Type: multipart/mixed; boundary="YqMsupnVrtM1oRUNL48SWO2YFDCLJMzO7";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Message-ID: <7b292ba6-c16f-efd8-d71a-5ae4d07a6b7a@suse.de>
Subject: Re: [PATCH 1/2] drm/atomic: Pass the full state to CRTC atomic_check
References: <20201028123222.1732139-1-maxime@cerno.tech>
In-Reply-To: <20201028123222.1732139-1-maxime@cerno.tech>

--YqMsupnVrtM1oRUNL48SWO2YFDCLJMzO7
Content-Type: multipart/mixed;
 boundary="------------E1417DEB8D528742C9D03CDA"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------E1417DEB8D528742C9D03CDA
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi

Am 28.10.20 um 13:32 schrieb Maxime Ripard:
> The current atomic helpers have either their object state being passed =
as
> an argument or the full atomic state.
>=20
> The former is the pattern that was done at first, before switching to t=
he
> latter for new hooks or when it was needed.
>=20
> Let's start convert all the remaining helpers to provide a consistent
> interface, starting with the CRTC's atomic_check.
>=20
> The conversion was done using the coccinelle script below,
> built tested on all the drivers and actually tested on vc4.
>=20
> virtual report
>=20
> @@
> struct drm_crtc_helper_funcs *FUNCS;
> struct drm_crtc *crtc;
> struct drm_crtc_state *crtc_state;
> identifier dev, state;
> identifier ret, f;
> @@
>=20
>  f(struct drm_device *dev, struct drm_atomic_state *state)
>  {
> 	<...
> -	ret =3D FUNCS->atomic_check(crtc, crtc_state);
> +	ret =3D FUNCS->atomic_check(crtc, state);
> 	...>
>  }
>=20
> @@
> identifier crtc, new_state;
> @@
>=20
>  struct drm_crtc_helper_funcs {
>  	...
> -	int (*atomic_check)(struct drm_crtc *crtc, struct drm_crtc_state *new=
_state);
> +	int (*atomic_check)(struct drm_crtc *crtc, struct drm_atomic_state *s=
tate);
>  	...
> }
>=20
> @ crtc_atomic_func @
> identifier helpers;
> identifier func;
> @@
>=20
> static struct drm_crtc_helper_funcs helpers =3D {
> 	...,
> 	.atomic_check =3D func,
> 	...,
> };
>=20
> @ ignores_new_state @
> identifier crtc_atomic_func.func;
> identifier crtc, new_state;
> @@
>=20
>  int func(struct drm_crtc *crtc,
> 		struct drm_crtc_state *new_state)
>  {
> 	... when !=3D new_state
>  }
>=20
> @ adds_new_state depends on crtc_atomic_func && !ignores_new_state @
> identifier crtc_atomic_func.func;
> identifier crtc, new_state;
> @@
>=20
>  int func(struct drm_crtc *crtc, struct drm_crtc_state *new_state)
>  {
> +	struct drm_crtc_state *new_state =3D drm_atomic_get_new_crtc_state(st=
ate, crtc);
>  	...
>  }
>=20
> @ depends on crtc_atomic_func @
> identifier crtc_atomic_func.func;
> expression E;
> type T;
> @@
>=20
>  int func(...)
>  {
> 	...
> -	T state =3D E;
> +	T crtc_state =3D E;
>  	<+...
> -	state
> +	crtc_state
>  	...+>
>  }
>=20
> @ depends on crtc_atomic_func @
> identifier crtc_atomic_func.func;
> type T;
> @@
>=20
>  int func(...)
>  {
>  	...
> -	T state;
> +	T crtc_state;
>  	<+...
> -	state
> +	crtc_state
>  	...+>
>  }
>=20
> @ depends on crtc_atomic_func @
> identifier crtc_atomic_func.func;
> identifier new_state;
> identifier crtc;
> @@
>=20
>  int func(struct drm_crtc *crtc,
> -	       struct drm_crtc_state *new_state
> +	       struct drm_atomic_state *state
> 	       )
>  { ... }
>=20
> @@
> identifier new_state;
> identifier crtc;
> @@
>=20
>  int vmw_du_crtc_atomic_check(struct drm_crtc *crtc,
> -                             struct drm_crtc_state *new_state
> +                             struct drm_atomic_state *state
>                )
>  {
> +       struct drm_crtc_state *new_state =3D drm_atomic_get_new_crtc_st=
ate(state, crtc);
> 	...
>  }
>=20
> @@
> identifier new_state;
> identifier crtc;
> @@
>=20
>  int vmw_du_crtc_atomic_check(struct drm_crtc *crtc,
> -                             struct drm_crtc_state *new_state
> +                             struct drm_atomic_state *state
>                );
>=20
> @ include depends on adds_new_state @
> @@
>=20
>  #include <drm/drm_atomic.h>
>=20
> @ no_include depends on !include && adds_new_state @
> @@
>=20
> + #include <drm/drm_atomic.h>
>   #include <drm/...>
>=20
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

I read through the patch and it looks correct to me. The naming is a bit
off at times. For example, ast_state should now probably be called
ast_crtc_state. But that's not a blocker IMHO.

Best regards
Thomas

> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 14 ++++++-----
>  .../gpu/drm/arm/display/komeda/komeda_crtc.c  | 10 ++++----
>  drivers/gpu/drm/arm/malidp_crtc.c             | 20 ++++++++--------
>  drivers/gpu/drm/armada/armada_crtc.c          | 10 ++++----
>  drivers/gpu/drm/ast/ast_mode.c                | 12 ++++++----
>  .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    |  3 ++-
>  drivers/gpu/drm/drm_atomic_helper.c           |  2 +-
>  drivers/gpu/drm/drm_simple_kms_helper.c       | 10 ++++----
>  drivers/gpu/drm/exynos/exynos_drm_crtc.c      |  8 ++++---
>  drivers/gpu/drm/imx/ipuv3-crtc.c              |  6 +++--
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c     | 19 +++++++++------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 23 +++++++++++--------=

>  drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c     |  2 +-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c     | 13 +++++++----
>  drivers/gpu/drm/mxsfb/mxsfb_kms.c             | 10 ++++----
>  drivers/gpu/drm/nouveau/dispnv50/head.c       |  7 ++++--
>  drivers/gpu/drm/omapdrm/omap_crtc.c           | 13 +++++++----
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c        | 11 +++++----
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c   |  4 +++-
>  drivers/gpu/drm/sun4i/sun4i_crtc.c            |  7 ++++--
>  drivers/gpu/drm/tidss/tidss_crtc.c            | 10 ++++----
>  drivers/gpu/drm/tilcdc/tilcdc_crtc.c          | 12 ++++++----
>  drivers/gpu/drm/vc4/vc4_crtc.c                | 11 +++++----
>  drivers/gpu/drm/vc4/vc4_txp.c                 | 10 ++++----
>  drivers/gpu/drm/virtio/virtgpu_display.c      |  2 +-
>  drivers/gpu/drm/vkms/vkms_crtc.c              | 16 +++++++------
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           |  4 +++-
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.h           |  2 +-
>  drivers/gpu/drm/xlnx/zynqmp_disp.c            |  6 +++--
>  include/drm/drm_modeset_helper_vtables.h      |  5 ++--
>  30 files changed, 170 insertions(+), 112 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/driver=
s/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index b24c14bfab31..eb3a5bfb9f11 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -5488,17 +5488,19 @@ static void dm_update_crtc_active_planes(struct=
 drm_crtc *crtc,
>  }
> =20
>  static int dm_crtc_helper_atomic_check(struct drm_crtc *crtc,
> -				       struct drm_crtc_state *state)
> +				       struct drm_atomic_state *state)
>  {
> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(s=
tate,
> +									  crtc);
>  	struct amdgpu_device *adev =3D drm_to_adev(crtc->dev);
>  	struct dc *dc =3D adev->dm.dc;
> -	struct dm_crtc_state *dm_crtc_state =3D to_dm_crtc_state(state);
> +	struct dm_crtc_state *dm_crtc_state =3D to_dm_crtc_state(crtc_state);=

>  	int ret =3D -EINVAL;
> =20
> -	dm_update_crtc_active_planes(crtc, state);
> +	dm_update_crtc_active_planes(crtc, crtc_state);
> =20
>  	if (unlikely(!dm_crtc_state->stream &&
> -		     modeset_required(state, NULL, dm_crtc_state->stream))) {
> +		     modeset_required(crtc_state, NULL, dm_crtc_state->stream))) {
>  		WARN_ON(1);
>  		return ret;
>  	}
> @@ -5511,8 +5513,8 @@ static int dm_crtc_helper_atomic_check(struct drm=
_crtc *crtc,
>  	 * We want at least one hardware plane enabled to use
>  	 * the stream with a cursor enabled.
>  	 */
> -	if (state->enable && state->active &&
> -	    does_crtc_have_active_cursor(state) &&
> +	if (crtc_state->enable && crtc_state->active &&
> +	    does_crtc_have_active_cursor(crtc_state) &&
>  	    dm_crtc_state->active_planes =3D=3D 0)
>  		return -EINVAL;
> =20
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers=
/gpu/drm/arm/display/komeda/komeda_crtc.c
> index a4bbf56a7fc1..cc65623b5455 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> @@ -74,16 +74,18 @@ static void komeda_crtc_update_clock_ratio(struct k=
omeda_crtc_state *kcrtc_st)
>   */
>  static int
>  komeda_crtc_atomic_check(struct drm_crtc *crtc,
> -			 struct drm_crtc_state *state)
> +			 struct drm_atomic_state *state)
>  {
> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(s=
tate,
> +									  crtc);
>  	struct komeda_crtc *kcrtc =3D to_kcrtc(crtc);
> -	struct komeda_crtc_state *kcrtc_st =3D to_kcrtc_st(state);
> +	struct komeda_crtc_state *kcrtc_st =3D to_kcrtc_st(crtc_state);
>  	int err;
> =20
> -	if (drm_atomic_crtc_needs_modeset(state))
> +	if (drm_atomic_crtc_needs_modeset(crtc_state))
>  		komeda_crtc_update_clock_ratio(kcrtc_st);
> =20
> -	if (state->active) {
> +	if (crtc_state->active) {
>  		err =3D komeda_build_display_data_flow(kcrtc, kcrtc_st);
>  		if (err)
>  			return err;
> diff --git a/drivers/gpu/drm/arm/malidp_crtc.c b/drivers/gpu/drm/arm/ma=
lidp_crtc.c
> index 49766eb7a554..108e7a31bd26 100644
> --- a/drivers/gpu/drm/arm/malidp_crtc.c
> +++ b/drivers/gpu/drm/arm/malidp_crtc.c
> @@ -337,8 +337,10 @@ static int malidp_crtc_atomic_check_scaling(struct=
 drm_crtc *crtc,
>  }
> =20
>  static int malidp_crtc_atomic_check(struct drm_crtc *crtc,
> -				    struct drm_crtc_state *state)
> +				    struct drm_atomic_state *state)
>  {
> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(s=
tate,
> +									  crtc);
>  	struct malidp_drm *malidp =3D crtc_to_malidp_device(crtc);
>  	struct malidp_hw_device *hwdev =3D malidp->dev;
>  	struct drm_plane *plane;
> @@ -373,7 +375,7 @@ static int malidp_crtc_atomic_check(struct drm_crtc=
 *crtc,
>  	 */
> =20
>  	/* first count the number of rotated planes */
> -	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, state) {
> +	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state)=
 {
>  		struct drm_framebuffer *fb =3D pstate->fb;
> =20
>  		if ((pstate->rotation & MALIDP_ROTATED_MASK) || fb->modifier)
> @@ -389,7 +391,7 @@ static int malidp_crtc_atomic_check(struct drm_crtc=
 *crtc,
>  		rot_mem_free +=3D hwdev->rotation_memory[1];
> =20
>  	/* now validate the rotation memory requirements */
> -	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, state) {
> +	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state)=
 {
>  		struct malidp_plane *mp =3D to_malidp_plane(plane);
>  		struct malidp_plane_state *ms =3D to_malidp_plane_state(pstate);
>  		struct drm_framebuffer *fb =3D pstate->fb;
> @@ -417,18 +419,18 @@ static int malidp_crtc_atomic_check(struct drm_cr=
tc *crtc,
>  	}
> =20
>  	/* If only the writeback routing has changed, we don't need a modeset=
 */
> -	if (state->connectors_changed) {
> +	if (crtc_state->connectors_changed) {
>  		u32 old_mask =3D crtc->state->connector_mask;
> -		u32 new_mask =3D state->connector_mask;
> +		u32 new_mask =3D crtc_state->connector_mask;
> =20
>  		if ((old_mask ^ new_mask) =3D=3D
>  		    (1 << drm_connector_index(&malidp->mw_connector.base)))
> -			state->connectors_changed =3D false;
> +			crtc_state->connectors_changed =3D false;
>  	}
> =20
> -	ret =3D malidp_crtc_atomic_check_gamma(crtc, state);
> -	ret =3D ret ? ret : malidp_crtc_atomic_check_ctm(crtc, state);
> -	ret =3D ret ? ret : malidp_crtc_atomic_check_scaling(crtc, state);
> +	ret =3D malidp_crtc_atomic_check_gamma(crtc, crtc_state);
> +	ret =3D ret ? ret : malidp_crtc_atomic_check_ctm(crtc, crtc_state);
> +	ret =3D ret ? ret : malidp_crtc_atomic_check_scaling(crtc, crtc_state=
);
> =20
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/armada/armada_crtc.c b/drivers/gpu/drm/arm=
ada/armada_crtc.c
> index e0fbfc9ce386..d22ca1496c43 100644
> --- a/drivers/gpu/drm/armada/armada_crtc.c
> +++ b/drivers/gpu/drm/armada/armada_crtc.c
> @@ -413,15 +413,17 @@ static void armada_drm_crtc_mode_set_nofb(struct =
drm_crtc *crtc)
>  }
> =20
>  static int armada_drm_crtc_atomic_check(struct drm_crtc *crtc,
> -					struct drm_crtc_state *state)
> +					struct drm_atomic_state *state)
>  {
> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(s=
tate,
> +									  crtc);
>  	DRM_DEBUG_KMS("[CRTC:%d:%s]\n", crtc->base.id, crtc->name);
> =20
> -	if (state->gamma_lut && drm_color_lut_size(state->gamma_lut) !=3D 256=
)
> +	if (crtc_state->gamma_lut && drm_color_lut_size(crtc_state->gamma_lut=
) !=3D 256)
>  		return -EINVAL;
> =20
> -	if (state->color_mgmt_changed)
> -		state->planes_changed =3D true;
> +	if (crtc_state->color_mgmt_changed)
> +		crtc_state->planes_changed =3D true;
> =20
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_m=
ode.c
> index bd03a8a67e3a..346dce2d654f 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -751,24 +751,26 @@ static void ast_crtc_dpms(struct drm_crtc *crtc, =
int mode)
>  }
> =20
>  static int ast_crtc_helper_atomic_check(struct drm_crtc *crtc,
> -					struct drm_crtc_state *state)
> +					struct drm_atomic_state *state)
>  {
> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(s=
tate,
> +									  crtc);
>  	struct drm_device *dev =3D crtc->dev;
>  	struct ast_crtc_state *ast_state;
>  	const struct drm_format_info *format;
>  	bool succ;
> =20
> -	if (!state->enable)
> +	if (!crtc_state->enable)
>  		return 0; /* no mode checks if CRTC is being disabled */
> =20
> -	ast_state =3D to_ast_crtc_state(state);
> +	ast_state =3D to_ast_crtc_state(crtc_state);
> =20
>  	format =3D ast_state->format;
>  	if (drm_WARN_ON_ONCE(dev, !format))
>  		return -EINVAL; /* BUG: We didn't set format in primary check(). */
> =20
> -	succ =3D ast_get_vbios_mode_info(format, &state->mode,
> -				       &state->adjusted_mode,
> +	succ =3D ast_get_vbios_mode_info(format, &crtc_state->mode,
> +				       &crtc_state->adjusted_mode,
>  				       &ast_state->vbios_mode_info);
>  	if (!succ)
>  		return -EINVAL;
> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/g=
pu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> index 2b3888df22f8..0e533ded2a96 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> @@ -325,8 +325,9 @@ static int atmel_hlcdc_crtc_select_output_mode(stru=
ct drm_crtc_state *state)
>  }
> =20
>  static int atmel_hlcdc_crtc_atomic_check(struct drm_crtc *c,
> -					 struct drm_crtc_state *s)
> +					 struct drm_atomic_state *state)
>  {
> +	struct drm_crtc_state *s =3D drm_atomic_get_new_crtc_state(state, c);=

>  	int ret;
> =20
>  	ret =3D atmel_hlcdc_crtc_select_output_mode(s);
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_=
atomic_helper.c
> index a7bcb4b4586c..12d8095318d0 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -918,7 +918,7 @@ drm_atomic_helper_check_planes(struct drm_device *d=
ev,
>  		if (!funcs || !funcs->atomic_check)
>  			continue;
> =20
> -		ret =3D funcs->atomic_check(crtc, new_crtc_state);
> +		ret =3D funcs->atomic_check(crtc, state);
>  		if (ret) {
>  			DRM_DEBUG_ATOMIC("[CRTC:%d:%s] atomic driver check failed\n",
>  					 crtc->base.id, crtc->name);
> diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/=
drm_simple_kms_helper.c
> index fa87b63e152a..4b46689634dd 100644
> --- a/drivers/gpu/drm/drm_simple_kms_helper.c
> +++ b/drivers/gpu/drm/drm_simple_kms_helper.c
> @@ -86,16 +86,18 @@ drm_simple_kms_crtc_mode_valid(struct drm_crtc *crt=
c,
>  }
> =20
>  static int drm_simple_kms_crtc_check(struct drm_crtc *crtc,
> -				     struct drm_crtc_state *state)
> +				     struct drm_atomic_state *state)
>  {
> -	bool has_primary =3D state->plane_mask &
> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(s=
tate,
> +									  crtc);
> +	bool has_primary =3D crtc_state->plane_mask &
>  			   drm_plane_mask(crtc->primary);
> =20
>  	/* We always want to have an active plane with an active CRTC */
> -	if (has_primary !=3D state->enable)
> +	if (has_primary !=3D crtc_state->enable)
>  		return -EINVAL;
> =20
> -	return drm_atomic_add_affected_planes(state->state, crtc);
> +	return drm_atomic_add_affected_planes(crtc_state->state, crtc);
>  }
> =20
>  static void drm_simple_kms_crtc_enable(struct drm_crtc *crtc,
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm=
/exynos/exynos_drm_crtc.c
> index 35f1d1dbb126..928f764efce8 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> @@ -49,15 +49,17 @@ static void exynos_drm_crtc_atomic_disable(struct d=
rm_crtc *crtc,
>  }
> =20
>  static int exynos_crtc_atomic_check(struct drm_crtc *crtc,
> -				     struct drm_crtc_state *state)
> +				     struct drm_atomic_state *state)
>  {
> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(s=
tate,
> +									  crtc);
>  	struct exynos_drm_crtc *exynos_crtc =3D to_exynos_crtc(crtc);
> =20
> -	if (!state->enable)
> +	if (!crtc_state->enable)
>  		return 0;
> =20
>  	if (exynos_crtc->ops->atomic_check)
> -		return exynos_crtc->ops->atomic_check(exynos_crtc, state);
> +		return exynos_crtc->ops->atomic_check(exynos_crtc, crtc_state);
> =20
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/imx/ipuv3-crtc.c b/drivers/gpu/drm/imx/ipu=
v3-crtc.c
> index 7ecc27c41a6a..b6d864d7a0df 100644
> --- a/drivers/gpu/drm/imx/ipuv3-crtc.c
> +++ b/drivers/gpu/drm/imx/ipuv3-crtc.c
> @@ -227,11 +227,13 @@ static bool ipu_crtc_mode_fixup(struct drm_crtc *=
crtc,
>  }
> =20
>  static int ipu_crtc_atomic_check(struct drm_crtc *crtc,
> -				 struct drm_crtc_state *state)
> +				 struct drm_atomic_state *state)
>  {
> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(s=
tate,
> +									  crtc);
>  	u32 primary_plane_mask =3D drm_plane_mask(crtc->primary);
> =20
> -	if (state->active && (primary_plane_mask & state->plane_mask) =3D=3D =
0)
> +	if (crtc_state->active && (primary_plane_mask & crtc_state->plane_mas=
k) =3D=3D 0)
>  		return -EINVAL;
> =20
>  	return 0;
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/dr=
m/ingenic/ingenic-drm-drv.c
> index 2329754af116..aaa324bd5572 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -239,28 +239,33 @@ static void ingenic_drm_crtc_update_timings(struc=
t ingenic_drm *priv,
>  }
> =20
>  static int ingenic_drm_crtc_atomic_check(struct drm_crtc *crtc,
> -					 struct drm_crtc_state *state)
> +					 struct drm_atomic_state *state)
>  {
> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(s=
tate,
> +									  crtc);
>  	struct ingenic_drm *priv =3D drm_crtc_get_priv(crtc);
>  	struct drm_plane_state *f1_state, *f0_state, *ipu_state =3D NULL;
> =20
> -	if (state->gamma_lut &&
> -	    drm_color_lut_size(state->gamma_lut) !=3D ARRAY_SIZE(priv->dma_hw=
descs->palette)) {
> +	if (crtc_state->gamma_lut &&
> +	    drm_color_lut_size(crtc_state->gamma_lut) !=3D ARRAY_SIZE(priv->d=
ma_hwdescs->palette)) {
>  		dev_dbg(priv->dev, "Invalid palette size\n");
>  		return -EINVAL;
>  	}
> =20
> -	if (drm_atomic_crtc_needs_modeset(state) && priv->soc_info->has_osd) =
{
> -		f1_state =3D drm_atomic_get_plane_state(state->state, &priv->f1);
> +	if (drm_atomic_crtc_needs_modeset(crtc_state) && priv->soc_info->has_=
osd) {
> +		f1_state =3D drm_atomic_get_plane_state(crtc_state->state,
> +						      &priv->f1);
>  		if (IS_ERR(f1_state))
>  			return PTR_ERR(f1_state);
> =20
> -		f0_state =3D drm_atomic_get_plane_state(state->state, &priv->f0);
> +		f0_state =3D drm_atomic_get_plane_state(crtc_state->state,
> +						      &priv->f0);
>  		if (IS_ERR(f0_state))
>  			return PTR_ERR(f0_state);
> =20
>  		if (IS_ENABLED(CONFIG_DRM_INGENIC_IPU) && priv->ipu_plane) {
> -			ipu_state =3D drm_atomic_get_plane_state(state->state, priv->ipu_pl=
ane);
> +			ipu_state =3D drm_atomic_get_plane_state(crtc_state->state,
> +							       priv->ipu_plane);
>  			if (IS_ERR(ipu_state))
>  				return PTR_ERR(ipu_state);
> =20
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm=
/msm/disp/dpu1/dpu_crtc.c
> index 5ba9b49dfa7a..d05aa91bc882 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -874,8 +874,10 @@ struct plane_state {
>  };
> =20
>  static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
> -		struct drm_crtc_state *state)
> +		struct drm_atomic_state *state)
>  {
> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(s=
tate,
> +									  crtc);
>  	struct dpu_crtc *dpu_crtc;
>  	struct plane_state *pstates;
>  	struct dpu_crtc_state *cstate;
> @@ -900,32 +902,33 @@ static int dpu_crtc_atomic_check(struct drm_crtc =
*crtc,
>  	pstates =3D kzalloc(sizeof(*pstates) * DPU_STAGE_MAX * 4, GFP_KERNEL)=
;
> =20
>  	dpu_crtc =3D to_dpu_crtc(crtc);
> -	cstate =3D to_dpu_crtc_state(state);
> +	cstate =3D to_dpu_crtc_state(crtc_state);
> =20
> -	if (!state->enable || !state->active) {
> +	if (!crtc_state->enable || !crtc_state->active) {
>  		DPU_DEBUG("crtc%d -> enable %d, active %d, skip atomic_check\n",
> -				crtc->base.id, state->enable, state->active);
> +				crtc->base.id, crtc_state->enable,
> +				crtc_state->active);
>  		goto end;
>  	}
> =20
> -	mode =3D &state->adjusted_mode;
> +	mode =3D &crtc_state->adjusted_mode;
>  	DPU_DEBUG("%s: check", dpu_crtc->name);
> =20
>  	/* force a full mode set if active state changed */
> -	if (state->active_changed)
> -		state->mode_changed =3D true;
> +	if (crtc_state->active_changed)
> +		crtc_state->mode_changed =3D true;
> =20
>  	memset(pipe_staged, 0, sizeof(pipe_staged));
> =20
>  	mixer_width =3D mode->hdisplay / cstate->num_mixers;
> =20
> -	_dpu_crtc_setup_lm_bounds(crtc, state);
> +	_dpu_crtc_setup_lm_bounds(crtc, crtc_state);
> =20
>  	crtc_rect.x2 =3D mode->hdisplay;
>  	crtc_rect.y2 =3D mode->vdisplay;
> =20
>  	 /* get plane state for all drm planes associated with crtc state */
> -	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, state) {
> +	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state)=
 {
>  		struct drm_rect dst, clip =3D crtc_rect;
> =20
>  		if (IS_ERR_OR_NULL(pstate)) {
> @@ -1031,7 +1034,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc =
*crtc,
> =20
>  	atomic_inc(&_dpu_crtc_get_kms(crtc)->bandwidth_ref);
> =20
> -	rc =3D dpu_core_perf_crtc_check(crtc, state);
> +	rc =3D dpu_core_perf_crtc_check(crtc, crtc_state);
>  	if (rc) {
>  		DPU_ERROR("crtc%d failed performance check %d\n",
>  				crtc->base.id, rc);
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c b/drivers/gpu/dr=
m/msm/disp/mdp4/mdp4_crtc.c
> index 6b03ceeb5ba1..af80f3baf05b 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
> @@ -307,7 +307,7 @@ static void mdp4_crtc_atomic_enable(struct drm_crtc=
 *crtc,
>  }
> =20
>  static int mdp4_crtc_atomic_check(struct drm_crtc *crtc,
> -		struct drm_crtc_state *state)
> +		struct drm_atomic_state *state)
>  {
>  	struct mdp4_crtc *mdp4_crtc =3D to_mdp4_crtc(crtc);
>  	DBG("%s: check", mdp4_crtc->name);
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/dr=
m/msm/disp/mdp5/mdp5_crtc.c
> index 747dd8a7aa6e..500f885c0eae 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> @@ -7,6 +7,7 @@
> =20
>  #include <linux/sort.h>
> =20
> +#include <drm/drm_atomic.h>
>  #include <drm/drm_mode.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_flip_work.h>
> @@ -682,15 +683,17 @@ static enum mdp_mixer_stage_id get_start_stage(st=
ruct drm_crtc *crtc,
>  }
> =20
>  static int mdp5_crtc_atomic_check(struct drm_crtc *crtc,
> -		struct drm_crtc_state *state)
> +		struct drm_atomic_state *state)
>  {
> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(s=
tate,
> +									  crtc);
>  	struct mdp5_kms *mdp5_kms =3D get_kms(crtc);
>  	struct drm_plane *plane;
>  	struct drm_device *dev =3D crtc->dev;
>  	struct plane_state pstates[STAGE_MAX + 1];
>  	const struct mdp5_cfg_hw *hw_cfg;
>  	const struct drm_plane_state *pstate;
> -	const struct drm_display_mode *mode =3D &state->adjusted_mode;
> +	const struct drm_display_mode *mode =3D &crtc_state->adjusted_mode;
>  	bool cursor_plane =3D false;
>  	bool need_right_mixer =3D false;
>  	int cnt =3D 0, i;
> @@ -699,7 +702,7 @@ static int mdp5_crtc_atomic_check(struct drm_crtc *=
crtc,
> =20
>  	DBG("%s: check", crtc->name);
> =20
> -	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, state) {
> +	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state)=
 {
>  		if (!pstate->visible)
>  			continue;
> =20
> @@ -731,7 +734,7 @@ static int mdp5_crtc_atomic_check(struct drm_crtc *=
crtc,
>  	if (mode->hdisplay > hw_cfg->lm.max_width)
>  		need_right_mixer =3D true;
> =20
> -	ret =3D mdp5_crtc_setup_pipeline(crtc, state, need_right_mixer);
> +	ret =3D mdp5_crtc_setup_pipeline(crtc, crtc_state, need_right_mixer);=

>  	if (ret) {
>  		DRM_DEV_ERROR(dev->dev, "couldn't assign mixers %d\n", ret);
>  		return ret;
> @@ -744,7 +747,7 @@ static int mdp5_crtc_atomic_check(struct drm_crtc *=
crtc,
>  	WARN_ON(cursor_plane &&
>  		(pstates[cnt - 1].plane->type !=3D DRM_PLANE_TYPE_CURSOR));
> =20
> -	start =3D get_start_stage(crtc, state, &pstates[0].state->base);
> +	start =3D get_start_stage(crtc, crtc_state, &pstates[0].state->base);=

> =20
>  	/* verify that there are not too many planes attached to crtc
>  	 * and that we don't have conflicting mixer stages:
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/=
mxsfb_kms.c
> index 956f631997f2..b0757f84a979 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> @@ -269,17 +269,19 @@ static void mxsfb_crtc_mode_set_nofb(struct mxsfb=
_drm_private *mxsfb)
>  }
> =20
>  static int mxsfb_crtc_atomic_check(struct drm_crtc *crtc,
> -				   struct drm_crtc_state *state)
> +				   struct drm_atomic_state *state)
>  {
> -	bool has_primary =3D state->plane_mask &
> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(s=
tate,
> +									  crtc);
> +	bool has_primary =3D crtc_state->plane_mask &
>  			   drm_plane_mask(crtc->primary);
> =20
>  	/* The primary plane has to be enabled when the CRTC is active. */
> -	if (state->active && !has_primary)
> +	if (crtc_state->active && !has_primary)
>  		return -EINVAL;
> =20
>  	/* TODO: Is this needed ? */
> -	return drm_atomic_add_affected_planes(state->state, crtc);
> +	return drm_atomic_add_affected_planes(crtc_state->state, crtc);
>  }
> =20
>  static void mxsfb_crtc_atomic_flush(struct drm_crtc *crtc,
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.c b/drivers/gpu/drm/=
nouveau/dispnv50/head.c
> index 841edfaf5b9d..0542ca22b33a 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/head.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/head.c
> @@ -30,6 +30,7 @@
>  #include <nvif/event.h>
>  #include <nvif/cl0046.h>
> =20
> +#include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_crtc_helper.h>
>  #include <drm/drm_vblank.h>
> @@ -310,12 +311,14 @@ nv50_head_atomic_check_mode(struct nv50_head *hea=
d, struct nv50_head_atom *asyh)
>  }
> =20
>  static int
> -nv50_head_atomic_check(struct drm_crtc *crtc, struct drm_crtc_state *s=
tate)
> +nv50_head_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state =
*state)
>  {
> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(s=
tate,
> +									  crtc);
>  	struct nouveau_drm *drm =3D nouveau_drm(crtc->dev);
>  	struct nv50_head *head =3D nv50_head(crtc);
>  	struct nv50_head_atom *armh =3D nv50_head_atom(crtc->state);
> -	struct nv50_head_atom *asyh =3D nv50_head_atom(state);
> +	struct nv50_head_atom *asyh =3D nv50_head_atom(crtc_state);
>  	struct nouveau_conn_atom *asyc =3D NULL;
>  	struct drm_connector_state *conns;
>  	struct drm_connector *conn;
> diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omap=
drm/omap_crtc.c
> index fef3b0032fd8..69a0770ba38e 100644
> --- a/drivers/gpu/drm/omapdrm/omap_crtc.c
> +++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
> @@ -569,22 +569,25 @@ static bool omap_crtc_is_manually_updated(struct =
drm_crtc *crtc)
>  }
> =20
>  static int omap_crtc_atomic_check(struct drm_crtc *crtc,
> -				struct drm_crtc_state *state)
> +				struct drm_atomic_state *state)
>  {
> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(s=
tate,
> +									  crtc);
>  	struct drm_plane_state *pri_state;
> =20
> -	if (state->color_mgmt_changed && state->gamma_lut) {
> -		unsigned int length =3D state->gamma_lut->length /
> +	if (crtc_state->color_mgmt_changed && crtc_state->gamma_lut) {
> +		unsigned int length =3D crtc_state->gamma_lut->length /
>  			sizeof(struct drm_color_lut);
> =20
>  		if (length < 2)
>  			return -EINVAL;
>  	}
> =20
> -	pri_state =3D drm_atomic_get_new_plane_state(state->state, crtc->prim=
ary);
> +	pri_state =3D drm_atomic_get_new_plane_state(crtc_state->state,
> +						   crtc->primary);
>  	if (pri_state) {
>  		struct omap_crtc_state *omap_crtc_state =3D
> -			to_omap_crtc_state(state);
> +			to_omap_crtc_state(crtc_state);
> =20
>  		/* Mirror new values for zpos and rotation in omap_crtc_state */
>  		omap_crtc_state->zpos =3D pri_state->zpos;
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/r=
car-du/rcar_du_crtc.c
> index 4c360a255849..460fb07b786f 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> @@ -682,20 +682,23 @@ static void rcar_du_crtc_stop(struct rcar_du_crtc=
 *rcrtc)
>   */
> =20
>  static int rcar_du_crtc_atomic_check(struct drm_crtc *crtc,
> -				     struct drm_crtc_state *state)
> +				     struct drm_atomic_state *state)
>  {
> -	struct rcar_du_crtc_state *rstate =3D to_rcar_crtc_state(state);
> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(s=
tate,
> +									  crtc);
> +	struct rcar_du_crtc_state *rstate =3D to_rcar_crtc_state(crtc_state);=

>  	struct drm_encoder *encoder;
>  	int ret;
> =20
> -	ret =3D rcar_du_cmm_check(crtc, state);
> +	ret =3D rcar_du_cmm_check(crtc, crtc_state);
>  	if (ret)
>  		return ret;
> =20
>  	/* Store the routes from the CRTC output to the DU outputs. */
>  	rstate->outputs =3D 0;
> =20
> -	drm_for_each_encoder_mask(encoder, crtc->dev, state->encoder_mask) {
> +	drm_for_each_encoder_mask(encoder, crtc->dev,
> +				  crtc_state->encoder_mask) {
>  		struct rcar_du_encoder *renc;
> =20
>  		/* Skip the writeback encoder. */
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/=
drm/rockchip/rockchip_drm_vop.c
> index 47835715b44b..fcbd758e6531 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> @@ -1415,8 +1415,10 @@ static void vop_wait_for_irq_handler(struct vop =
*vop)
>  }
> =20
>  static int vop_crtc_atomic_check(struct drm_crtc *crtc,
> -				 struct drm_crtc_state *crtc_state)
> +				 struct drm_atomic_state *state)
>  {
> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(s=
tate,
> +									  crtc);
>  	struct vop *vop =3D to_vop(crtc);
>  	struct drm_plane *plane;
>  	struct drm_plane_state *plane_state;
> diff --git a/drivers/gpu/drm/sun4i/sun4i_crtc.c b/drivers/gpu/drm/sun4i=
/sun4i_crtc.c
> index 999deb64bd70..8f91391832db 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_crtc.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_crtc.c
> @@ -15,6 +15,7 @@
> =20
>  #include <video/videomode.h>
> =20
> +#include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_modes.h>
> @@ -45,14 +46,16 @@ static struct drm_encoder *sun4i_crtc_get_encoder(s=
truct drm_crtc *crtc)
>  }
> =20
>  static int sun4i_crtc_atomic_check(struct drm_crtc *crtc,
> -				    struct drm_crtc_state *state)
> +				    struct drm_atomic_state *state)
>  {
> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(s=
tate,
> +									  crtc);
>  	struct sun4i_crtc *scrtc =3D drm_crtc_to_sun4i_crtc(crtc);
>  	struct sunxi_engine *engine =3D scrtc->engine;
>  	int ret =3D 0;
> =20
>  	if (engine && engine->ops && engine->ops->atomic_check)
> -		ret =3D engine->ops->atomic_check(engine, state);
> +		ret =3D engine->ops->atomic_check(engine, crtc_state);
> =20
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss=
/tidss_crtc.c
> index 848b9c7b553d..6739f489dfdf 100644
> --- a/drivers/gpu/drm/tidss/tidss_crtc.c
> +++ b/drivers/gpu/drm/tidss/tidss_crtc.c
> @@ -85,8 +85,10 @@ void tidss_crtc_error_irq(struct drm_crtc *crtc, u64=
 irqstatus)
>  /* drm_crtc_helper_funcs */
> =20
>  static int tidss_crtc_atomic_check(struct drm_crtc *crtc,
> -				   struct drm_crtc_state *state)
> +				   struct drm_atomic_state *state)
>  {
> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(s=
tate,
> +									  crtc);
>  	struct drm_device *ddev =3D crtc->dev;
>  	struct tidss_device *tidss =3D to_tidss(ddev);
>  	struct dispc_device *dispc =3D tidss->dispc;
> @@ -97,10 +99,10 @@ static int tidss_crtc_atomic_check(struct drm_crtc =
*crtc,
> =20
>  	dev_dbg(ddev->dev, "%s\n", __func__);
> =20
> -	if (!state->enable)
> +	if (!crtc_state->enable)
>  		return 0;
> =20
> -	mode =3D &state->adjusted_mode;
> +	mode =3D &crtc_state->adjusted_mode;
> =20
>  	ok =3D dispc_vp_mode_valid(dispc, hw_videoport, mode);
>  	if (ok !=3D MODE_OK) {
> @@ -109,7 +111,7 @@ static int tidss_crtc_atomic_check(struct drm_crtc =
*crtc,
>  		return -EINVAL;
>  	}
> =20
> -	return dispc_vp_bus_check(dispc, hw_videoport, state);
> +	return dispc_vp_bus_check(dispc, hw_videoport, crtc_state);
>  }
> =20
>  /*
> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/til=
cdc/tilcdc_crtc.c
> index da2ab2aa3577..d87a9fd4a203 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> @@ -657,15 +657,17 @@ static bool tilcdc_crtc_mode_fixup(struct drm_crt=
c *crtc,
>  }
> =20
>  static int tilcdc_crtc_atomic_check(struct drm_crtc *crtc,
> -				    struct drm_crtc_state *state)
> +				    struct drm_atomic_state *state)
>  {
> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(s=
tate,
> +									  crtc);
>  	/* If we are not active we don't care */
> -	if (!state->active)
> +	if (!crtc_state->active)
>  		return 0;
> =20
> -	if (state->state->planes[0].ptr !=3D crtc->primary ||
> -	    state->state->planes[0].state =3D=3D NULL ||
> -	    state->state->planes[0].state->crtc !=3D crtc) {
> +	if (crtc_state->state->planes[0].ptr !=3D crtc->primary ||
> +	    crtc_state->state->planes[0].state =3D=3D NULL ||
> +	    crtc_state->state->planes[0].state->crtc !=3D crtc) {
>  		dev_dbg(crtc->dev->dev, "CRTC primary plane must be present");
>  		return -EINVAL;
>  	}
> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_c=
rtc.c
> index 72141bb24aa5..161c2eb08898 100644
> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> @@ -584,18 +584,21 @@ void vc4_crtc_get_margins(struct drm_crtc_state *=
state,
>  }
> =20
>  static int vc4_crtc_atomic_check(struct drm_crtc *crtc,
> -				 struct drm_crtc_state *state)
> +				 struct drm_atomic_state *state)
>  {
> -	struct vc4_crtc_state *vc4_state =3D to_vc4_crtc_state(state);
> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(s=
tate,
> +									  crtc);
> +	struct vc4_crtc_state *vc4_state =3D to_vc4_crtc_state(crtc_state);
>  	struct drm_connector *conn;
>  	struct drm_connector_state *conn_state;
>  	int ret, i;
> =20
> -	ret =3D vc4_hvs_atomic_check(crtc, state);
> +	ret =3D vc4_hvs_atomic_check(crtc, crtc_state);
>  	if (ret)
>  		return ret;
> =20
> -	for_each_new_connector_in_state(state->state, conn, conn_state, i) {
> +	for_each_new_connector_in_state(crtc_state->state, conn, conn_state,
> +					i) {
>  		if (conn_state->crtc !=3D crtc)
>  			continue;
> =20
> diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_tx=
p.c
> index e0e0b72ea65c..34612edcabbd 100644
> --- a/drivers/gpu/drm/vc4/vc4_txp.c
> +++ b/drivers/gpu/drm/vc4/vc4_txp.c
> @@ -386,16 +386,18 @@ static const struct drm_crtc_funcs vc4_txp_crtc_f=
uncs =3D {
>  };
> =20
>  static int vc4_txp_atomic_check(struct drm_crtc *crtc,
> -				struct drm_crtc_state *state)
> +				struct drm_atomic_state *state)
>  {
> -	struct vc4_crtc_state *vc4_state =3D to_vc4_crtc_state(state);
> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(s=
tate,
> +									  crtc);
> +	struct vc4_crtc_state *vc4_state =3D to_vc4_crtc_state(crtc_state);
>  	int ret;
> =20
> -	ret =3D vc4_hvs_atomic_check(crtc, state);
> +	ret =3D vc4_hvs_atomic_check(crtc, crtc_state);
>  	if (ret)
>  		return ret;
> =20
> -	state->no_vblank =3D true;
> +	crtc_state->no_vblank =3D true;
>  	vc4_state->feed_txp =3D true;
> =20
>  	return 0;
> diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm=
/virtio/virtgpu_display.c
> index 48b3194ee051..e81183ab87e0 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_display.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_display.c
> @@ -111,7 +111,7 @@ static void virtio_gpu_crtc_atomic_disable(struct d=
rm_crtc *crtc,
>  }
> =20
>  static int virtio_gpu_crtc_atomic_check(struct drm_crtc *crtc,
> -					struct drm_crtc_state *state)
> +					struct drm_atomic_state *state)
>  {
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vk=
ms_crtc.c
> index e43e4e1b268a..6a49e70bdf18 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -168,9 +168,11 @@ static const struct drm_crtc_funcs vkms_crtc_funcs=
 =3D {
>  };
> =20
>  static int vkms_crtc_atomic_check(struct drm_crtc *crtc,
> -				  struct drm_crtc_state *state)
> +				  struct drm_atomic_state *state)
>  {
> -	struct vkms_crtc_state *vkms_state =3D to_vkms_crtc_state(state);
> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(s=
tate,
> +									  crtc);
> +	struct vkms_crtc_state *vkms_state =3D to_vkms_crtc_state(crtc_state)=
;
>  	struct drm_plane *plane;
>  	struct drm_plane_state *plane_state;
>  	int i =3D 0, ret;
> @@ -178,12 +180,12 @@ static int vkms_crtc_atomic_check(struct drm_crtc=
 *crtc,
>  	if (vkms_state->active_planes)
>  		return 0;
> =20
> -	ret =3D drm_atomic_add_affected_planes(state->state, crtc);
> +	ret =3D drm_atomic_add_affected_planes(crtc_state->state, crtc);
>  	if (ret < 0)
>  		return ret;
> =20
> -	drm_for_each_plane_mask(plane, crtc->dev, state->plane_mask) {
> -		plane_state =3D drm_atomic_get_existing_plane_state(state->state,
> +	drm_for_each_plane_mask(plane, crtc->dev, crtc_state->plane_mask) {
> +		plane_state =3D drm_atomic_get_existing_plane_state(crtc_state->stat=
e,
>  								  plane);
>  		WARN_ON(!plane_state);
> =20
> @@ -199,8 +201,8 @@ static int vkms_crtc_atomic_check(struct drm_crtc *=
crtc,
>  	vkms_state->num_active_planes =3D i;
> =20
>  	i =3D 0;
> -	drm_for_each_plane_mask(plane, crtc->dev, state->plane_mask) {
> -		plane_state =3D drm_atomic_get_existing_plane_state(state->state,
> +	drm_for_each_plane_mask(plane, crtc->dev, crtc_state->plane_mask) {
> +		plane_state =3D drm_atomic_get_existing_plane_state(crtc_state->stat=
e,
>  								  plane);
> =20
>  		if (!plane_state->visible)
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwg=
fx/vmwgfx_kms.c
> index 312ed0881a99..a74c9454ade2 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> @@ -522,8 +522,10 @@ int vmw_du_cursor_plane_atomic_check(struct drm_pl=
ane *plane,
> =20
> =20
>  int vmw_du_crtc_atomic_check(struct drm_crtc *crtc,
> -			     struct drm_crtc_state *new_state)
> +			     struct drm_atomic_state *state)
>  {
> +	struct drm_crtc_state *new_state =3D drm_atomic_get_new_crtc_state(st=
ate,
> +									 crtc);
>  	struct vmw_display_unit *du =3D vmw_crtc_to_du(new_state->crtc);
>  	int connector_mask =3D drm_connector_mask(&du->connector);
>  	bool has_primary =3D new_state->plane_mask &
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h b/drivers/gpu/drm/vmwg=
fx/vmwgfx_kms.h
> index 3ee03227607c..b3d4e7b4c8c5 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
> @@ -473,7 +473,7 @@ void vmw_du_plane_unpin_surf(struct vmw_plane_state=
 *vps,
>  			     bool unreference);
> =20
>  int vmw_du_crtc_atomic_check(struct drm_crtc *crtc,
> -			     struct drm_crtc_state *state);
> +			     struct drm_atomic_state *state);
>  void vmw_du_crtc_atomic_begin(struct drm_crtc *crtc,
>  			      struct drm_crtc_state *old_crtc_state);
>  void vmw_du_crtc_atomic_flush(struct drm_crtc *crtc,
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/=
zynqmp_disp.c
> index 0b3bd62e7631..12d3877b3685 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> @@ -1506,9 +1506,11 @@ zynqmp_disp_crtc_atomic_disable(struct drm_crtc =
*crtc,
>  }
> =20
>  static int zynqmp_disp_crtc_atomic_check(struct drm_crtc *crtc,
> -					 struct drm_crtc_state *state)
> +					 struct drm_atomic_state *state)
>  {
> -	return drm_atomic_add_affected_planes(state->state, crtc);
> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(s=
tate,
> +									  crtc);
> +	return drm_atomic_add_affected_planes(crtc_state->state, crtc);
>  }
> =20
>  static void
> diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm=
_modeset_helper_vtables.h
> index bde42988c4b5..b97441deaf93 100644
> --- a/include/drm/drm_modeset_helper_vtables.h
> +++ b/include/drm/drm_modeset_helper_vtables.h
> @@ -336,8 +336,7 @@ struct drm_crtc_helper_funcs {
>  	 *
>  	 * This function is called in the check phase of an atomic update. Th=
e
>  	 * driver is not allowed to change anything outside of the free-stand=
ing
> -	 * state objects passed-in or assembled in the overall &drm_atomic_st=
ate
> -	 * update tracking structure.
> +	 * state object passed-in.
>  	 *
>  	 * Also beware that userspace can request its own custom modes, neith=
er
>  	 * core nor helpers filter modes to the list of probe modes reported =
by
> @@ -353,7 +352,7 @@ struct drm_crtc_helper_funcs {
>  	 * deadlock.
>  	 */
>  	int (*atomic_check)(struct drm_crtc *crtc,
> -			    struct drm_crtc_state *state);
> +			    struct drm_atomic_state *state);
> =20
>  	/**
>  	 * @atomic_begin:
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer

--------------E1417DEB8D528742C9D03CDA
Content-Type: application/pgp-keys;
 name="OpenPGP_0x680DC11D530B7A23.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="OpenPGP_0x680DC11D530B7A23.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdgX=
H47
fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0BeB5B=
bqP
5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4YchdHm3bkPj=
z9E
ErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB9GluwvIhSezPg=
nEm
imZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEBAAHNKFRob21hcyBaa=
W1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmNvbT7CwI4EEwEIADgCGwMFCwkIBwIGFQoJCAsCB=
BYC
AwECHgECF4AWIQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCXvxIWAAKCRBoDcEdUwt6I+aZB/9ih=
Onf
G4Lgf1L87cvoXh95/bnaJ6aQhP6/ZeRleuCXflnyDajlm3c9loQr0r2bQUi7JeYwUKbBab2QS=
GJm
DMRGlLMnmzWB8mHmZ6bHAu+2Sth8SraE42p6BB9d8dlYEID+dl/D/xUBeulfkck5rloGtYqDi=
+1Q
DfkEZJaxVSZ6FFkXuQi/G9qcI4iklN2nv02iQ7mZe8WYAysix6s/6vIobhirEBreclSNxXqis=
p8n
91+v855JC11EgRdUXMRK81IAaCKXP8zLx3ixku7mvP9Om61yerHSbeU2HZbIggZYQlFh6llJm=
zF1
CjCWgPTJyk4t4kMTcNOw5ykD47vU/KW+wl0EEBECAB0WIQQn6OOmnzvP/7ktjmoud6EwEfXTw=
gUC
WzodVwAKCRAud6EwEfXTwidvAKDkOADDHfI0QNXqAZcg6i1kOndAYACeLXHBwpjnumkPSyoab=
IiL
+he8r3zCwHMEEAEIAB0WIQQeXZghmQijlU7YzFiqUDvJrg9HpwUCWznxsQAKCRCqUDvJrg9Hp=
42f
CADIvsZcAd04PDFclRltHr2huy6s7+ZZA6PgYlMblEBh4bJA+dNPBTvzpJ7FJv/bmHOa+phWy=
Urj
EpfFGuOKGuWAfzgVAEu52fMrW3/mm+O26z1AKIu8hiZ/x9OAe4AM71ZO2lZrV1/53ZdzWnRuO=
45N
GQcotU8oeVfT9okAfmozmWMmIMq7Q0K6bV8W3qiD5XfDNxjr2caxc/9WX1bZPUo3n0H23MNaA=
Tpy
Oz732UtDh6sKUAB1RfzBBd/REbjHD7+quwJGAdRScyDRncX1vNb2+wihy0ipA69XY3bkhR5iD=
u5r
A9enuiMe6J1IBMI1PZh+vOufB/M6cd2D9RULIJaJwsBzBBABCAAdFiEEuyNtt7Ge78bIRx1op=
/N8
GYw5MYEFAls6MrsACgkQp/N8GYw5MYEnLQf/dwqlDJVQL2q+i8FFaqTMAm0n9jLRV6pN8JxFH=
j0g
voyWUOnQuNdAFgtKd26ZhN8NkLoSMO8E19eBPfLoBIFK5yNNVmRHAZm07MzGbA0uNWINJhmdR=
bZM
RMh0nneXjcEU/IvUmd8TPFTAd24X2mbzHgcaHMLJSVx1ohd4alRJXHIqDobKmiVwekyPnInJn=
zWw
iuZUkIotTkQple1PT/dF3S+KtPXBL6ldQ4NkAeCjsz4wnzSa9+VKOxEhiHM0PMzXSbkCMP+4m=
Xy9
RMplBw9Dm9hN2PSouBPifIrSodiiSWZYXOEkzLiBAB0frCKR63Dnx9kvjCD9Pz5wLd/70rjqI=
c0n
VGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+wsCOBBMBCAA4AhsDBQsJC=
AcC
BhUKCQgLAgQWAgMBAh4BAheAFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl78SF4ACgkQaA3BH=
VML
eiOpGAgAih6C1OnWms/N8eBMC4Q93y/nyywe5vCL22Dr1rwgn6Iw2jOGziJSi7zhY4sEk2NKJ=
5cd
lFrx8mP//b+xO4AGffwBD0Vwpf38Hj2Gt0KjpzRYccqqU+tJPO5c0pjI52ZIV3+kOEFvYGfkN=
PHE
flE+b81T8L2dSXCLtj4WAGUM1rmHn3bCYl+/RwkB+8XnoL5AvrmMcU4Uhb3FJpM4DHExccYkd=
eSL
ojBppOCztBCUpBx3le+8QPVvAvJDuur4wRmjk3sjKClAwzeqoYyUKcN3JDdb3mt3QcJal9rSh=
VEI
7B25IvfmEbs42oGm8GPzPkaNJu3gcska+l5PSTfurNETGsJdBBARAgAdFiEEJ+jjpp87z/+5L=
Y5q
LnehMBH108IFAls6HVcACgkQLnehMBH108LTkACgjLQdDYMENi6BDjY/gd/LF9lMi8oAnR+o0=
FwE
Vb1K1tEMQ/1x+k1U6/xgwsBzBBABCAAdFiEEHl2YIZkIo5VO2MxYqlA7ya4PR6cFAls58bMAC=
gkQ
qlA7ya4PR6cvTAgAzY1N5QMKh8ECRtYcZNmilyV59uHTEY9hAR+203JqWnSGfUKtU7s6xfl5O=
NGq
DI5rULk4Cw2CEIzg9Sat+/lxn36w2f1tEznS5Vb0gVGWrzDAFjj7tB6MnmCzsNb/S1kgxnqJM=
Yor
RYQ7uB3Yr2Fdp08FJxN0ipd5YfzaZ6KoSWcRAv4r1R4ZQGuS77URAg7HDOIrBMOVO+HIn7GYQ=
qPS
5ZFw5yXbvEtL1c5Y8Zdw1AG2VmEXx78TWQVG3kI8/lQF1QI3yrJ1Rp2x5eK9I0OJihv13IlIW=
3sb
QGrj9pxF63kA20ZFaynzFglBGiyxExYvTD0/xKIhzYhj8mtCunPb2cLAcwQQAQgAHRYhBLsjb=
bex
nu/GyEcdaKfzfBmMOTGBBQJbOjLAAAoJEKfzfBmMOTGBBoMIALIW4EtBY28tPwZMOpN/+ARPO=
a2g
Qzpivw7iNtiDTnGIXMCoxly1CybfMdqTHYmuKbEO9AlFAlDOnkgInsn8E65IvgUTVI95Ah+Ob=
iPI
FkYc/9a+AexPl7f5kI9489k77eKtqtMpWFpo/vROmRroSw4JnM7ovwPq1QOSHExfTKbLunzD1=
i3V
4PShSZ6bGsp1LW6Wk0lRMHDuAk3xsyjBWfJwSbrCe3E6OsLG7BuQqEUt2fR6NxdDRSR9tQUp9=
Tri
AYG5LndmUzxeU6FAQjD8Wt1ezOFH5ODcCDXfRyYmE6uCGA4EvO8l9R3o68NPlUjPRAZsCbxJa=
UAg
iazX1nyQGwvOwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHU=
E9e
osYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+q=
bU6
3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWWG=
KdD
egUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lvhFXod=
NFM
AgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsAEQEAAcLAf=
AQY
AQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkDwmcAAAoJEGgNwR1TC3ojp=
fcI
AInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2h9ifw9Nf2TjCZ6AMvC3thAN0r=
FDj
55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxUn+LSiRrOdywn6erjxRi9EYTVLCHcD=
hBE
jKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uIaMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU=
2y3
ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBWHE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/t=
sZv
yEX6zN8CtirPdPWu/VXNRYAl/lat7lSI3H26qrE=3D
=3DmxFq
-----END PGP PUBLIC KEY BLOCK-----

--------------E1417DEB8D528742C9D03CDA--

--YqMsupnVrtM1oRUNL48SWO2YFDCLJMzO7--

--JpjRZi6BLvl3HHWcSz7YTv9hToUsnnp5I
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl+fvskFAwAAAAAACgkQaA3BHVMLeiOV
RAgAkhE53XQ5mp7rtxRTFClOUuZpoBBRExbpMt++ETE9jFo0I5IyZB22WGq7nYFoY+eoGeK9r7vN
1xPQ/ve+2tBzMV/XUZnuzZoTEUOih+SaUuAW1INU2Z8x2jehRVZgudGuWZ7gaPqm/8/XlfVhzlyA
ykbRQhkMlPvAnzvrtOoF/lJuDPc1jDJR7qQyjdClb5NqEg7F7Ld1kOY7Zeb2vDz6IYohbBhmI1dC
+QLJNpJDSmgwuKqVhB4xPx2vqimi4ZxjzjI4Iv26eJvaimJPQ/Km6TyDU78GplmG9B3GK7lwfaA8
8GWxQvq5YEAwBHPVrSF8tKtKW3DOg3hc99Cl5RgWsA==
=BdDo
-----END PGP SIGNATURE-----

--JpjRZi6BLvl3HHWcSz7YTv9hToUsnnp5I--

--===============1748274895==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1748274895==--
