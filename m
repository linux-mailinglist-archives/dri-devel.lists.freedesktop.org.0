Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1D72A25EE
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 09:17:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 537E86E43D;
	Mon,  2 Nov 2020 08:17:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F6F6E437
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 08:17:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 507C0ABDE;
 Mon,  2 Nov 2020 08:17:45 +0000 (UTC)
Subject: Re: [PATCH 2/2] drm/atomic: Pass the full state to CRTC atomic begin
 and flush
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20201028123222.1732139-1-maxime@cerno.tech>
 <20201028123222.1732139-2-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <2cafe0ee-30b3-8749-32f1-9c3ad685cf12@suse.de>
Date: Mon, 2 Nov 2020 09:17:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <20201028123222.1732139-2-maxime@cerno.tech>
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
Content-Type: multipart/mixed; boundary="===============0958990929=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0958990929==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="vLqccpk2mS2gihMPnmWNli2ADRPy5AxVw"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--vLqccpk2mS2gihMPnmWNli2ADRPy5AxVw
Content-Type: multipart/mixed; boundary="KcazbrCah0NpvHQjOBvnbt2mIbirqF2Cf";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Message-ID: <2cafe0ee-30b3-8749-32f1-9c3ad685cf12@suse.de>
Subject: Re: [PATCH 2/2] drm/atomic: Pass the full state to CRTC atomic begin
 and flush
References: <20201028123222.1732139-1-maxime@cerno.tech>
 <20201028123222.1732139-2-maxime@cerno.tech>
In-Reply-To: <20201028123222.1732139-2-maxime@cerno.tech>

--KcazbrCah0NpvHQjOBvnbt2mIbirqF2Cf
Content-Type: multipart/mixed;
 boundary="------------2D2499A33BBA943C122E6E60"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------2D2499A33BBA943C122E6E60
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
> interface, starting with the CRTC's atomic_begin and atomic_flush.
>=20
> The conversion was done using the coccinelle script below, built tested=
 on
> all the drivers and actually tested on vc4.
>=20
> virtual report
>=20
> @@
> struct drm_crtc_helper_funcs *FUNCS;
> identifier old_crtc_state, old_state;
> identifier crtc;
> identifier f;
> @@
>=20
>  f(struct drm_crtc_state *old_crtc_state)
>  {
> 	...
>  	struct drm_atomic_state *old_state =3D old_crtc_state->state;
> 	<...
> -	FUNCS->atomic_begin(crtc, old_crtc_state);
> +	FUNCS->atomic_begin(crtc, old_state);
> 	...>
>  }
>=20
> @@
> struct drm_crtc_helper_funcs *FUNCS;
> identifier old_crtc_state, old_state;
> identifier crtc;
> identifier f;
> @@
>=20
>  f(struct drm_crtc_state *old_crtc_state)
>  {
> 	...
>  	struct drm_atomic_state *old_state =3D old_crtc_state->state;
> 	<...
> -	FUNCS->atomic_flush(crtc, old_crtc_state);
> +	FUNCS->atomic_flush(crtc, old_state);
> 	...>
>  }
>=20
> @@
> struct drm_crtc_helper_funcs *FUNCS;
> struct drm_crtc *crtc;
> struct drm_crtc_state *crtc_state;
> identifier dev, state;
> identifier f;
> @@
>=20
>  f(struct drm_device *dev, struct drm_atomic_state *state, ...)
>  {
> 	<...
> -	FUNCS->atomic_begin(crtc, crtc_state);
> +	FUNCS->atomic_begin(crtc, state);
> 	...>
>  }
>=20
> @@
> struct drm_crtc_helper_funcs *FUNCS;
> struct drm_crtc *crtc;
> struct drm_crtc_state *crtc_state;
> identifier dev, state;
> identifier f;
> @@
>=20
>  f(struct drm_device *dev, struct drm_atomic_state *state, ...)
>  {
> 	<...
> -	FUNCS->atomic_flush(crtc, crtc_state);
> +	FUNCS->atomic_flush(crtc, state);
> 	...>
>  }
>=20
> @@
> identifier crtc, old_state;
> @@
>=20
>  struct drm_crtc_helper_funcs {
> 	...
> -	void (*atomic_begin)(struct drm_crtc *crtc, struct drm_crtc_state *ol=
d_state);
> +	void (*atomic_begin)(struct drm_crtc *crtc, struct drm_atomic_state *=
state);
> 	...
> -	void (*atomic_flush)(struct drm_crtc *crtc, struct drm_crtc_state *ol=
d_state);
> +	void (*atomic_flush)(struct drm_crtc *crtc, struct drm_atomic_state *=
state);
> 	...
> }
>=20
> @ crtc_atomic_func @
> identifier helpers;
> identifier func;
> @@
>=20
> (
> static struct drm_crtc_helper_funcs helpers =3D {
> 	...,
> 	.atomic_begin =3D func,
> 	...,
> };
> |
> static struct drm_crtc_helper_funcs helpers =3D {
> 	...,
> 	.atomic_flush =3D func,
> 	...,
> };
> )
>=20
> @ ignores_old_state @
> identifier crtc_atomic_func.func;
> identifier crtc, old_state;
> @@
>=20
> void func(struct drm_crtc *crtc,
> 		struct drm_crtc_state *old_state)
> {
> 	... when !=3D old_state
> }
>=20
> @ adds_old_state depends on crtc_atomic_func && !ignores_old_state @
> identifier crtc_atomic_func.func;
> identifier crtc, old_state;
> @@
>=20
> void func(struct drm_crtc *crtc, struct drm_crtc_state *old_state)
> {
> +	struct drm_crtc_state *old_state =3D drm_atomic_get_old_crtc_state(st=
ate, crtc);
> 	...
> }
>=20
> @ depends on crtc_atomic_func @
> identifier crtc_atomic_func.func;
> expression E;
> type T;
> @@
>=20
> void func(...)
> {
> 	...
> -	T state =3D E;
> +	T crtc_state =3D E;
> 	<+...
> -	state
> +	crtc_state
> 	...+>
>=20
> }
>=20
> @ depends on crtc_atomic_func @
> identifier crtc_atomic_func.func;
> type T;
> @@
>=20
> void func(...)
> {
> 	...
> -	T state;
> +	T crtc_state;
> 	<+...
> -	state
> +	crtc_state
> 	...+>
>=20
> }
>=20
> @@
> identifier old_state;
> identifier crtc;
> @@
>=20
>  void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
> -			   struct drm_crtc_state *old_state
> +			   struct drm_atomic_state *state
> 			   )
> {
> +	struct drm_crtc_state *old_state =3D drm_atomic_get_old_crtc_state(st=
ate, crtc);
> 	...
> }
>=20
> @@
> identifier old_state;
> identifier crtc;
> @@
>=20
>  void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
> -			   struct drm_crtc_state *old_state
> +			   struct drm_atomic_state *state
> 			   );
>=20
> @@
> identifier old_state;
> identifier crtc;
> @@
>=20
>  void vmw_du_crtc_atomic_begin(struct drm_crtc *crtc,
> -			   struct drm_crtc_state *old_state
> +			   struct drm_atomic_state *state
> 			   )
> {
> 	...
> }
>=20
> @@
> identifier old_state;
> identifier crtc;
> @@
>=20
>  void vmw_du_crtc_atomic_begin(struct drm_crtc *crtc,
> -			   struct drm_crtc_state *old_state
> +			   struct drm_atomic_state *state
> 			   );
>=20
> @@
> identifier old_state;
> identifier crtc;
> @@
>=20
>  void vmw_du_crtc_atomic_flush(struct drm_crtc *crtc,
> -			   struct drm_crtc_state *old_state
> +			   struct drm_atomic_state *state
> 			   )
> {
> 	...
> }
>=20
> @@
> identifier old_state;
> identifier crtc;
> @@
>=20
>  void vmw_du_crtc_atomic_flush(struct drm_crtc *crtc,
> -			   struct drm_crtc_state *old_state
> +			   struct drm_atomic_state *state
> 			   );
>=20
> @ depends on crtc_atomic_func @
> identifier crtc_atomic_func.func;
> identifier old_state;
> identifier crtc;
> @@
>=20
> void func(struct drm_crtc *crtc,
> -	       struct drm_crtc_state *old_state
> +	       struct drm_atomic_state *state
> 	       )
> 		{ ... }
>=20
> @ include depends on adds_old_state @
> @@
>=20
>  #include <drm/drm_atomic.h>
>=20
> @ no_include depends on !include && adds_old_state @
> @@
>=20
> + #include <drm/drm_atomic.h>
>   #include <drm/...>
>=20
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  .../gpu/drm/arm/display/komeda/komeda_crtc.c    |  4 +++-
>  drivers/gpu/drm/arm/hdlcd_crtc.c                |  2 +-
>  drivers/gpu/drm/armada/armada_crtc.c            |  4 ++--
>  drivers/gpu/drm/ast/ast_mode.c                  |  5 ++++-
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c  |  4 ++--
>  drivers/gpu/drm/drm_atomic_helper.c             |  8 ++++----
>  drivers/gpu/drm/exynos/exynos_drm_crtc.c        |  4 ++--
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c      |  2 +-
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c  |  4 ++--
>  drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c |  4 ++--
>  drivers/gpu/drm/imx/dcss/dcss-crtc.c            |  4 ++--
>  drivers/gpu/drm/imx/ipuv3-crtc.c                |  4 ++--
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c       | 17 +++++++++--------=

>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c         | 16 ++++++++--------
>  drivers/gpu/drm/meson/meson_crtc.c              |  4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c        |  4 ++--
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c       |  4 ++--
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c       |  4 ++--
>  drivers/gpu/drm/mxsfb/mxsfb_kms.c               |  2 +-
>  drivers/gpu/drm/omapdrm/omap_crtc.c             |  4 ++--
>  drivers/gpu/drm/qxl/qxl_display.c               |  2 +-
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c          |  4 ++--
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c     |  8 ++++++--
>  drivers/gpu/drm/sti/sti_crtc.c                  |  2 +-
>  drivers/gpu/drm/stm/ltdc.c                      |  2 +-
>  drivers/gpu/drm/sun4i/sun4i_crtc.c              |  6 ++++--
>  drivers/gpu/drm/tegra/dc.c                      | 10 +++++-----
>  drivers/gpu/drm/tidss/tidss_crtc.c              |  4 +++-
>  drivers/gpu/drm/tilcdc/tilcdc_crtc.c            |  2 +-
>  drivers/gpu/drm/vboxvideo/vbox_mode.c           |  2 +-
>  drivers/gpu/drm/vc4/vc4_drv.h                   |  3 ++-
>  drivers/gpu/drm/vc4/vc4_hvs.c                   |  4 +++-
>  drivers/gpu/drm/virtio/virtgpu_display.c        |  2 +-
>  drivers/gpu/drm/vkms/vkms_crtc.c                |  4 ++--
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c             |  4 ++--
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.h             |  4 ++--
>  drivers/gpu/drm/xlnx/zynqmp_disp.c              |  4 ++--
>  drivers/gpu/drm/zte/zx_vou.c                    |  2 +-
>  include/drm/drm_modeset_helper_vtables.h        |  4 ++--
>  39 files changed, 97 insertions(+), 80 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers=
/gpu/drm/arm/display/komeda/komeda_crtc.c
> index cc65623b5455..df0b9eeb8933 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> @@ -385,8 +385,10 @@ komeda_crtc_atomic_disable(struct drm_crtc *crtc,
> =20
>  static void
>  komeda_crtc_atomic_flush(struct drm_crtc *crtc,
> -			 struct drm_crtc_state *old)
> +			 struct drm_atomic_state *state)
>  {
> +	struct drm_crtc_state *old =3D drm_atomic_get_old_crtc_state(state,
> +								   crtc);
>  	/* commit with modeset will be handled in enable/disable */
>  	if (drm_atomic_crtc_needs_modeset(crtc->state))
>  		return;
> diff --git a/drivers/gpu/drm/arm/hdlcd_crtc.c b/drivers/gpu/drm/arm/hdl=
cd_crtc.c
> index 84ac10d59485..a3234bfb0917 100644
> --- a/drivers/gpu/drm/arm/hdlcd_crtc.c
> +++ b/drivers/gpu/drm/arm/hdlcd_crtc.c
> @@ -205,7 +205,7 @@ static enum drm_mode_status hdlcd_crtc_mode_valid(s=
truct drm_crtc *crtc,
>  }
> =20
>  static void hdlcd_crtc_atomic_begin(struct drm_crtc *crtc,
> -				    struct drm_crtc_state *state)
> +				    struct drm_atomic_state *state)
>  {
>  	struct drm_pending_vblank_event *event =3D crtc->state->event;
> =20
> diff --git a/drivers/gpu/drm/armada/armada_crtc.c b/drivers/gpu/drm/arm=
ada/armada_crtc.c
> index d22ca1496c43..ca643f4e2064 100644
> --- a/drivers/gpu/drm/armada/armada_crtc.c
> +++ b/drivers/gpu/drm/armada/armada_crtc.c
> @@ -429,7 +429,7 @@ static int armada_drm_crtc_atomic_check(struct drm_=
crtc *crtc,
>  }
> =20
>  static void armada_drm_crtc_atomic_begin(struct drm_crtc *crtc,
> -					 struct drm_crtc_state *old_crtc_state)
> +					 struct drm_atomic_state *state)
>  {
>  	struct armada_crtc *dcrtc =3D drm_to_armada_crtc(crtc);
> =20
> @@ -443,7 +443,7 @@ static void armada_drm_crtc_atomic_begin(struct drm=
_crtc *crtc,
>  }
> =20
>  static void armada_drm_crtc_atomic_flush(struct drm_crtc *crtc,
> -					 struct drm_crtc_state *old_crtc_state)
> +					 struct drm_atomic_state *state)
>  {
>  	struct armada_crtc *dcrtc =3D drm_to_armada_crtc(crtc);
> =20
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_m=
ode.c
> index 346dce2d654f..bca03a1a5db7 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -779,8 +779,11 @@ static int ast_crtc_helper_atomic_check(struct drm=
_crtc *crtc,
>  }
> =20
>  static void
> -ast_crtc_helper_atomic_flush(struct drm_crtc *crtc, struct drm_crtc_st=
ate *old_crtc_state)
> +ast_crtc_helper_atomic_flush(struct drm_crtc *crtc,
> +		             struct drm_atomic_state *state)
>  {
> +	struct drm_crtc_state *old_crtc_state =3D drm_atomic_get_old_crtc_sta=
te(state,
> +								              crtc);
>  	struct ast_private *ast =3D to_ast_private(crtc->dev);
>  	struct ast_crtc_state *ast_crtc_state =3D to_ast_crtc_state(crtc->sta=
te);
>  	struct ast_crtc_state *old_ast_crtc_state =3D to_ast_crtc_state(old_c=
rtc_state);
> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/g=
pu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> index 0e533ded2a96..c17571a3cc2b 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> @@ -342,7 +342,7 @@ static int atmel_hlcdc_crtc_atomic_check(struct drm=
_crtc *c,
>  }
> =20
>  static void atmel_hlcdc_crtc_atomic_begin(struct drm_crtc *c,
> -					  struct drm_crtc_state *old_s)
> +					  struct drm_atomic_state *state)
>  {
>  	struct atmel_hlcdc_crtc *crtc =3D drm_crtc_to_atmel_hlcdc_crtc(c);
> =20
> @@ -357,7 +357,7 @@ static void atmel_hlcdc_crtc_atomic_begin(struct dr=
m_crtc *c,
>  }
> =20
>  static void atmel_hlcdc_crtc_atomic_flush(struct drm_crtc *crtc,
> -					  struct drm_crtc_state *old_s)
> +					  struct drm_atomic_state *state)
>  {
>  	/* TODO: write common plane control register if available */
>  }
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_=
atomic_helper.c
> index 12d8095318d0..ddd0e3239150 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -2521,7 +2521,7 @@ void drm_atomic_helper_commit_planes(struct drm_d=
evice *dev,
>  		if (active_only && !new_crtc_state->active)
>  			continue;
> =20
> -		funcs->atomic_begin(crtc, old_crtc_state);
> +		funcs->atomic_begin(crtc, old_state);
>  	}
> =20
>  	for_each_oldnew_plane_in_state(old_state, plane, old_plane_state, new=
_plane_state, i) {
> @@ -2579,7 +2579,7 @@ void drm_atomic_helper_commit_planes(struct drm_d=
evice *dev,
>  		if (active_only && !new_crtc_state->active)
>  			continue;
> =20
> -		funcs->atomic_flush(crtc, old_crtc_state);
> +		funcs->atomic_flush(crtc, old_state);
>  	}
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_commit_planes);
> @@ -2617,7 +2617,7 @@ drm_atomic_helper_commit_planes_on_crtc(struct dr=
m_crtc_state *old_crtc_state)
> =20
>  	crtc_funcs =3D crtc->helper_private;
>  	if (crtc_funcs && crtc_funcs->atomic_begin)
> -		crtc_funcs->atomic_begin(crtc, old_crtc_state);
> +		crtc_funcs->atomic_begin(crtc, old_state);
> =20
>  	drm_for_each_plane_mask(plane, crtc->dev, plane_mask) {
>  		struct drm_plane_state *old_plane_state =3D
> @@ -2643,7 +2643,7 @@ drm_atomic_helper_commit_planes_on_crtc(struct dr=
m_crtc_state *old_crtc_state)
>  	}
> =20
>  	if (crtc_funcs && crtc_funcs->atomic_flush)
> -		crtc_funcs->atomic_flush(crtc, old_crtc_state);
> +		crtc_funcs->atomic_flush(crtc, old_state);
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_commit_planes_on_crtc);
> =20
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm=
/exynos/exynos_drm_crtc.c
> index 928f764efce8..4153f302de7c 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> @@ -65,7 +65,7 @@ static int exynos_crtc_atomic_check(struct drm_crtc *=
crtc,
>  }
> =20
>  static void exynos_crtc_atomic_begin(struct drm_crtc *crtc,
> -				     struct drm_crtc_state *old_crtc_state)
> +				     struct drm_atomic_state *state)
>  {
>  	struct exynos_drm_crtc *exynos_crtc =3D to_exynos_crtc(crtc);
> =20
> @@ -74,7 +74,7 @@ static void exynos_crtc_atomic_begin(struct drm_crtc =
*crtc,
>  }
> =20
>  static void exynos_crtc_atomic_flush(struct drm_crtc *crtc,
> -				     struct drm_crtc_state *old_crtc_state)
> +				     struct drm_atomic_state *state)
>  {
>  	struct exynos_drm_crtc *exynos_crtc =3D to_exynos_crtc(crtc);
> =20
> diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c b/drivers/gpu/d=
rm/fsl-dcu/fsl_dcu_drm_crtc.c
> index 7a9e89cfdf9c..2af60d98f48f 100644
> --- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c
> +++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c
> @@ -21,7 +21,7 @@
>  #include "fsl_dcu_drm_plane.h"
> =20
>  static void fsl_dcu_drm_crtc_atomic_flush(struct drm_crtc *crtc,
> -					  struct drm_crtc_state *old_crtc_state)
> +					  struct drm_atomic_state *state)
>  {
>  	struct drm_device *dev =3D crtc->dev;
>  	struct fsl_dcu_drm_device *fsl_dev =3D dev->dev_private;
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c b/drivers/g=
pu/drm/hisilicon/hibmc/hibmc_drm_de.c
> index a1eabadf5adb..3c65151f4451 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
> @@ -390,7 +390,7 @@ static void hibmc_crtc_mode_set_nofb(struct drm_crt=
c *crtc)
>  }
> =20
>  static void hibmc_crtc_atomic_begin(struct drm_crtc *crtc,
> -				    struct drm_crtc_state *old_state)
> +				    struct drm_atomic_state *state)
>  {
>  	u32 reg;
>  	struct drm_device *dev =3D crtc->dev;
> @@ -410,7 +410,7 @@ static void hibmc_crtc_atomic_begin(struct drm_crtc=
 *crtc,
>  }
> =20
>  static void hibmc_crtc_atomic_flush(struct drm_crtc *crtc,
> -				    struct drm_crtc_state *old_state)
> +				    struct drm_atomic_state *state)
> =20
>  {
>  	unsigned long flags;
> diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c b/drivers/=
gpu/drm/hisilicon/kirin/kirin_drm_ade.c
> index cfe8ff596d55..d84d41f3e78f 100644
> --- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
> +++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
> @@ -485,7 +485,7 @@ static void ade_crtc_mode_set_nofb(struct drm_crtc =
*crtc)
>  }
> =20
>  static void ade_crtc_atomic_begin(struct drm_crtc *crtc,
> -				  struct drm_crtc_state *old_state)
> +				  struct drm_atomic_state *state)
>  {
>  	struct kirin_crtc *kcrtc =3D to_kirin_crtc(crtc);
>  	struct ade_hw_ctx *ctx =3D kcrtc->hw_ctx;
> @@ -498,7 +498,7 @@ static void ade_crtc_atomic_begin(struct drm_crtc *=
crtc,
>  }
> =20
>  static void ade_crtc_atomic_flush(struct drm_crtc *crtc,
> -				  struct drm_crtc_state *old_state)
> +				  struct drm_atomic_state *state)
> =20
>  {
>  	struct kirin_crtc *kcrtc =3D to_kirin_crtc(crtc);
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-crtc.c b/drivers/gpu/drm/imx=
/dcss/dcss-crtc.c
> index 8f570eb5f471..31267c00782f 100644
> --- a/drivers/gpu/drm/imx/dcss/dcss-crtc.c
> +++ b/drivers/gpu/drm/imx/dcss/dcss-crtc.c
> @@ -53,13 +53,13 @@ static const struct drm_crtc_funcs dcss_crtc_funcs =
=3D {
>  };
> =20
>  static void dcss_crtc_atomic_begin(struct drm_crtc *crtc,
> -				   struct drm_crtc_state *old_crtc_state)
> +				   struct drm_atomic_state *state)
>  {
>  	drm_crtc_vblank_on(crtc);
>  }
> =20
>  static void dcss_crtc_atomic_flush(struct drm_crtc *crtc,
> -				   struct drm_crtc_state *old_crtc_state)
> +				   struct drm_atomic_state *state)
>  {
>  	struct dcss_crtc *dcss_crtc =3D container_of(crtc, struct dcss_crtc,
>  						   base);
> diff --git a/drivers/gpu/drm/imx/ipuv3-crtc.c b/drivers/gpu/drm/imx/ipu=
v3-crtc.c
> index b6d864d7a0df..7ebd99ee3240 100644
> --- a/drivers/gpu/drm/imx/ipuv3-crtc.c
> +++ b/drivers/gpu/drm/imx/ipuv3-crtc.c
> @@ -240,13 +240,13 @@ static int ipu_crtc_atomic_check(struct drm_crtc =
*crtc,
>  }
> =20
>  static void ipu_crtc_atomic_begin(struct drm_crtc *crtc,
> -				  struct drm_crtc_state *old_crtc_state)
> +				  struct drm_atomic_state *state)
>  {
>  	drm_crtc_vblank_on(crtc);
>  }
> =20
>  static void ipu_crtc_atomic_flush(struct drm_crtc *crtc,
> -				  struct drm_crtc_state *old_crtc_state)
> +				  struct drm_atomic_state *state)
>  {
>  	spin_lock_irq(&crtc->dev->event_lock);
>  	if (crtc->state->event) {
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/dr=
m/ingenic/ingenic-drm-drv.c
> index aaa324bd5572..b9c156e13156 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -303,7 +303,7 @@ ingenic_drm_crtc_mode_valid(struct drm_crtc *crtc, =
const struct drm_display_mode
>  }
> =20
>  static void ingenic_drm_crtc_atomic_begin(struct drm_crtc *crtc,
> -					  struct drm_crtc_state *oldstate)
> +					  struct drm_atomic_state *state)
>  {
>  	struct ingenic_drm *priv =3D drm_crtc_get_priv(crtc);
>  	u32 ctrl =3D 0;
> @@ -323,26 +323,27 @@ static void ingenic_drm_crtc_atomic_begin(struct =
drm_crtc *crtc,
>  }
> =20
>  static void ingenic_drm_crtc_atomic_flush(struct drm_crtc *crtc,
> -					  struct drm_crtc_state *oldstate)
> +					  struct drm_atomic_state *state)
>  {
>  	struct ingenic_drm *priv =3D drm_crtc_get_priv(crtc);
> -	struct drm_crtc_state *state =3D crtc->state;
> -	struct drm_pending_vblank_event *event =3D state->event;
> +	struct drm_crtc_state *crtc_state =3D crtc->state;

I was also confused about when to use the state pointer and when to use
the look-up functions. But that was answered in the threat already.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Best regards
Thomas

> +	struct drm_pending_vblank_event *event =3D crtc_state->event;
> =20
> -	if (drm_atomic_crtc_needs_modeset(state)) {
> -		ingenic_drm_crtc_update_timings(priv, &state->mode);
> +	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
> +		ingenic_drm_crtc_update_timings(priv, &crtc_state->mode);
>  		priv->update_clk_rate =3D true;
>  	}
> =20
>  	if (priv->update_clk_rate) {
>  		mutex_lock(&priv->clk_mutex);
> -		clk_set_rate(priv->pix_clk, state->adjusted_mode.clock * 1000);
> +		clk_set_rate(priv->pix_clk,
> +			     crtc_state->adjusted_mode.clock * 1000);
>  		priv->update_clk_rate =3D false;
>  		mutex_unlock(&priv->clk_mutex);
>  	}
> =20
>  	if (event) {
> -		state->event =3D NULL;
> +		crtc_state->event =3D NULL;
> =20
>  		spin_lock_irq(&crtc->dev->event_lock);
>  		if (drm_crtc_vblank_get(crtc) =3D=3D 0)
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/=
mediatek/mtk_drm_crtc.c
> index 6fc818049f2d..0fd59dbe5e2d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -575,24 +575,24 @@ static void mtk_drm_crtc_atomic_disable(struct dr=
m_crtc *crtc,
>  }
> =20
>  static void mtk_drm_crtc_atomic_begin(struct drm_crtc *crtc,
> -				      struct drm_crtc_state *old_crtc_state)
> +				      struct drm_atomic_state *state)
>  {
> -	struct mtk_crtc_state *state =3D to_mtk_crtc_state(crtc->state);
> +	struct mtk_crtc_state *crtc_state =3D to_mtk_crtc_state(crtc->state);=

>  	struct mtk_drm_crtc *mtk_crtc =3D to_mtk_crtc(crtc);
> =20
> -	if (mtk_crtc->event && state->base.event)
> +	if (mtk_crtc->event && crtc_state->base.event)
>  		DRM_ERROR("new event while there is still a pending event\n");
> =20
> -	if (state->base.event) {
> -		state->base.event->pipe =3D drm_crtc_index(crtc);
> +	if (crtc_state->base.event) {
> +		crtc_state->base.event->pipe =3D drm_crtc_index(crtc);
>  		WARN_ON(drm_crtc_vblank_get(crtc) !=3D 0);
> -		mtk_crtc->event =3D state->base.event;
> -		state->base.event =3D NULL;
> +		mtk_crtc->event =3D crtc_state->base.event;
> +		crtc_state->base.event =3D NULL;
>  	}
>  }
> =20
>  static void mtk_drm_crtc_atomic_flush(struct drm_crtc *crtc,
> -				      struct drm_crtc_state *old_crtc_state)
> +				      struct drm_atomic_state *state)
>  {
>  	struct mtk_drm_crtc *mtk_crtc =3D to_mtk_crtc(crtc);
>  	int i;
> diff --git a/drivers/gpu/drm/meson/meson_crtc.c b/drivers/gpu/drm/meson=
/meson_crtc.c
> index 247ce085886b..d70616da8ce2 100644
> --- a/drivers/gpu/drm/meson/meson_crtc.c
> +++ b/drivers/gpu/drm/meson/meson_crtc.c
> @@ -201,7 +201,7 @@ static void meson_crtc_atomic_disable(struct drm_cr=
tc *crtc,
>  }
> =20
>  static void meson_crtc_atomic_begin(struct drm_crtc *crtc,
> -				    struct drm_crtc_state *state)
> +				    struct drm_atomic_state *state)
>  {
>  	struct meson_crtc *meson_crtc =3D to_meson_crtc(crtc);
>  	unsigned long flags;
> @@ -217,7 +217,7 @@ static void meson_crtc_atomic_begin(struct drm_crtc=
 *crtc,
>  }
> =20
>  static void meson_crtc_atomic_flush(struct drm_crtc *crtc,
> -				    struct drm_crtc_state *old_crtc_state)
> +				    struct drm_atomic_state *state)
>  {
>  	struct meson_crtc *meson_crtc =3D to_meson_crtc(crtc);
>  	struct meson_drm *priv =3D meson_crtc->priv;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm=
/msm/disp/dpu1/dpu_crtc.c
> index d05aa91bc882..3357317c29d6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -495,7 +495,7 @@ static void _dpu_crtc_setup_cp_blocks(struct drm_cr=
tc *crtc)
>  }
> =20
>  static void dpu_crtc_atomic_begin(struct drm_crtc *crtc,
> -		struct drm_crtc_state *old_state)
> +		struct drm_atomic_state *state)
>  {
>  	struct dpu_crtc *dpu_crtc;
>  	struct dpu_crtc_state *cstate;
> @@ -557,7 +557,7 @@ static void dpu_crtc_atomic_begin(struct drm_crtc *=
crtc,
>  }
> =20
>  static void dpu_crtc_atomic_flush(struct drm_crtc *crtc,
> -		struct drm_crtc_state *old_crtc_state)
> +		struct drm_atomic_state *state)
>  {
>  	struct dpu_crtc *dpu_crtc;
>  	struct drm_device *dev;
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c b/drivers/gpu/dr=
m/msm/disp/mdp4/mdp4_crtc.c
> index af80f3baf05b..34e3186e236d 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
> @@ -316,14 +316,14 @@ static int mdp4_crtc_atomic_check(struct drm_crtc=
 *crtc,
>  }
> =20
>  static void mdp4_crtc_atomic_begin(struct drm_crtc *crtc,
> -				   struct drm_crtc_state *old_crtc_state)
> +				   struct drm_atomic_state *state)
>  {
>  	struct mdp4_crtc *mdp4_crtc =3D to_mdp4_crtc(crtc);
>  	DBG("%s: begin", mdp4_crtc->name);
>  }
> =20
>  static void mdp4_crtc_atomic_flush(struct drm_crtc *crtc,
> -				   struct drm_crtc_state *old_crtc_state)
> +				   struct drm_atomic_state *state)
>  {
>  	struct mdp4_crtc *mdp4_crtc =3D to_mdp4_crtc(crtc);
>  	struct drm_device *dev =3D crtc->dev;
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/dr=
m/msm/disp/mdp5/mdp5_crtc.c
> index 500f885c0eae..4a53d7b42e9c 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> @@ -772,13 +772,13 @@ static int mdp5_crtc_atomic_check(struct drm_crtc=
 *crtc,
>  }
> =20
>  static void mdp5_crtc_atomic_begin(struct drm_crtc *crtc,
> -				   struct drm_crtc_state *old_crtc_state)
> +				   struct drm_atomic_state *state)
>  {
>  	DBG("%s: begin", crtc->name);
>  }
> =20
>  static void mdp5_crtc_atomic_flush(struct drm_crtc *crtc,
> -				   struct drm_crtc_state *old_crtc_state)
> +				   struct drm_atomic_state *state)
>  {
>  	struct mdp5_crtc *mdp5_crtc =3D to_mdp5_crtc(crtc);
>  	struct mdp5_crtc_state *mdp5_cstate =3D to_mdp5_crtc_state(crtc->stat=
e);
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/=
mxsfb_kms.c
> index b0757f84a979..eb0e2b08329b 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> @@ -285,7 +285,7 @@ static int mxsfb_crtc_atomic_check(struct drm_crtc =
*crtc,
>  }
> =20
>  static void mxsfb_crtc_atomic_flush(struct drm_crtc *crtc,
> -				    struct drm_crtc_state *old_state)
> +				    struct drm_atomic_state *state)
>  {
>  	struct drm_pending_vblank_event *event;
> =20
> diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omap=
drm/omap_crtc.c
> index 69a0770ba38e..d7442aa55f89 100644
> --- a/drivers/gpu/drm/omapdrm/omap_crtc.c
> +++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
> @@ -601,12 +601,12 @@ static int omap_crtc_atomic_check(struct drm_crtc=
 *crtc,
>  }
> =20
>  static void omap_crtc_atomic_begin(struct drm_crtc *crtc,
> -				   struct drm_crtc_state *old_crtc_state)
> +				   struct drm_atomic_state *state)
>  {
>  }
> =20
>  static void omap_crtc_atomic_flush(struct drm_crtc *crtc,
> -				   struct drm_crtc_state *old_crtc_state)
> +				   struct drm_atomic_state *state)
>  {
>  	struct omap_drm_private *priv =3D crtc->dev->dev_private;
>  	struct omap_crtc *omap_crtc =3D to_omap_crtc(crtc);
> diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qx=
l_display.c
> index 45fd76e04bdc..07a3e3c23f09 100644
> --- a/drivers/gpu/drm/qxl/qxl_display.c
> +++ b/drivers/gpu/drm/qxl/qxl_display.c
> @@ -372,7 +372,7 @@ static void qxl_crtc_update_monitors_config(struct =
drm_crtc *crtc,
>  }
> =20
>  static void qxl_crtc_atomic_flush(struct drm_crtc *crtc,
> -				  struct drm_crtc_state *old_crtc_state)
> +				  struct drm_atomic_state *state)
>  {
>  	qxl_crtc_update_monitors_config(crtc, "flush");
>  }
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/r=
car-du/rcar_du_crtc.c
> index 460fb07b786f..b5fb941e0f53 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> @@ -785,7 +785,7 @@ static void rcar_du_crtc_atomic_disable(struct drm_=
crtc *crtc,
>  }
> =20
>  static void rcar_du_crtc_atomic_begin(struct drm_crtc *crtc,
> -				      struct drm_crtc_state *old_crtc_state)
> +				      struct drm_atomic_state *state)
>  {
>  	struct rcar_du_crtc *rcrtc =3D to_rcar_crtc(crtc);
> =20
> @@ -814,7 +814,7 @@ static void rcar_du_crtc_atomic_begin(struct drm_cr=
tc *crtc,
>  }
> =20
>  static void rcar_du_crtc_atomic_flush(struct drm_crtc *crtc,
> -				      struct drm_crtc_state *old_crtc_state)
> +				      struct drm_atomic_state *state)
>  {
>  	struct rcar_du_crtc *rcrtc =3D to_rcar_crtc(crtc);
>  	struct drm_device *dev =3D rcrtc->crtc.dev;
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/=
drm/rockchip/rockchip_drm_vop.c
> index fcbd758e6531..1c1518d757cb 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> @@ -1246,8 +1246,10 @@ static void vop_crtc_gamma_set(struct vop *vop, =
struct drm_crtc *crtc,
>  }
> =20
>  static void vop_crtc_atomic_begin(struct drm_crtc *crtc,
> -				  struct drm_crtc_state *old_crtc_state)
> +				  struct drm_atomic_state *state)
>  {
> +	struct drm_crtc_state *old_crtc_state =3D drm_atomic_get_old_crtc_sta=
te(state,
> +								              crtc);
>  	struct vop *vop =3D to_vop(crtc);
> =20
>  	/*
> @@ -1462,8 +1464,10 @@ static int vop_crtc_atomic_check(struct drm_crtc=
 *crtc,
>  }
> =20
>  static void vop_crtc_atomic_flush(struct drm_crtc *crtc,
> -				  struct drm_crtc_state *old_crtc_state)
> +				  struct drm_atomic_state *state)
>  {
> +	struct drm_crtc_state *old_crtc_state =3D drm_atomic_get_old_crtc_sta=
te(state,
> +									      crtc);
>  	struct drm_atomic_state *old_state =3D old_crtc_state->state;
>  	struct drm_plane_state *old_plane_state, *new_plane_state;
>  	struct vop *vop =3D to_vop(crtc);
> diff --git a/drivers/gpu/drm/sti/sti_crtc.c b/drivers/gpu/drm/sti/sti_c=
rtc.c
> index 5726746f6d18..409795786f03 100644
> --- a/drivers/gpu/drm/sti/sti_crtc.c
> +++ b/drivers/gpu/drm/sti/sti_crtc.c
> @@ -133,7 +133,7 @@ sti_crtc_mode_set_nofb(struct drm_crtc *crtc)
>  }
> =20
>  static void sti_crtc_atomic_flush(struct drm_crtc *crtc,
> -				  struct drm_crtc_state *old_crtc_state)
> +				  struct drm_atomic_state *state)
>  {
>  	struct drm_device *drm_dev =3D crtc->dev;
>  	struct sti_mixer *mixer =3D to_sti_mixer(crtc);
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index e9af92d4a74b..3980677435cb 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -596,7 +596,7 @@ static void ltdc_crtc_mode_set_nofb(struct drm_crtc=
 *crtc)
>  }
> =20
>  static void ltdc_crtc_atomic_flush(struct drm_crtc *crtc,
> -				   struct drm_crtc_state *old_crtc_state)
> +				   struct drm_atomic_state *state)
>  {
>  	struct ltdc_device *ldev =3D crtc_to_ltdc(crtc);
>  	struct drm_device *ddev =3D crtc->dev;
> diff --git a/drivers/gpu/drm/sun4i/sun4i_crtc.c b/drivers/gpu/drm/sun4i=
/sun4i_crtc.c
> index 8f91391832db..12e21057b645 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_crtc.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_crtc.c
> @@ -61,8 +61,10 @@ static int sun4i_crtc_atomic_check(struct drm_crtc *=
crtc,
>  }
> =20
>  static void sun4i_crtc_atomic_begin(struct drm_crtc *crtc,
> -				    struct drm_crtc_state *old_state)
> +				    struct drm_atomic_state *state)
>  {
> +	struct drm_crtc_state *old_state =3D drm_atomic_get_old_crtc_state(st=
ate,
> +								         crtc);
>  	struct sun4i_crtc *scrtc =3D drm_crtc_to_sun4i_crtc(crtc);
>  	struct drm_device *dev =3D crtc->dev;
>  	struct sunxi_engine *engine =3D scrtc->engine;
> @@ -82,7 +84,7 @@ static void sun4i_crtc_atomic_begin(struct drm_crtc *=
crtc,
>  }
> =20
>  static void sun4i_crtc_atomic_flush(struct drm_crtc *crtc,
> -				    struct drm_crtc_state *old_state)
> +				    struct drm_atomic_state *state)
>  {
>  	struct sun4i_crtc *scrtc =3D drm_crtc_to_sun4i_crtc(crtc);
>  	struct drm_pending_vblank_event *event =3D crtc->state->event;
> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> index 52acc2f8f798..2d86627b0d4e 100644
> --- a/drivers/gpu/drm/tegra/dc.c
> +++ b/drivers/gpu/drm/tegra/dc.c
> @@ -1918,7 +1918,7 @@ static void tegra_crtc_atomic_enable(struct drm_c=
rtc *crtc,
>  }
> =20
>  static void tegra_crtc_atomic_begin(struct drm_crtc *crtc,
> -				    struct drm_crtc_state *old_crtc_state)
> +				    struct drm_atomic_state *state)
>  {
>  	unsigned long flags;
> =20
> @@ -1937,17 +1937,17 @@ static void tegra_crtc_atomic_begin(struct drm_=
crtc *crtc,
>  }
> =20
>  static void tegra_crtc_atomic_flush(struct drm_crtc *crtc,
> -				    struct drm_crtc_state *old_crtc_state)
> +				    struct drm_atomic_state *state)
>  {
> -	struct tegra_dc_state *state =3D to_dc_state(crtc->state);
> +	struct tegra_dc_state *crtc_state =3D to_dc_state(crtc->state);
>  	struct tegra_dc *dc =3D to_tegra_dc(crtc);
>  	u32 value;
> =20
> -	value =3D state->planes << 8 | GENERAL_UPDATE;
> +	value =3D crtc_state->planes << 8 | GENERAL_UPDATE;
>  	tegra_dc_writel(dc, value, DC_CMD_STATE_CONTROL);
>  	value =3D tegra_dc_readl(dc, DC_CMD_STATE_CONTROL);
> =20
> -	value =3D state->planes | GENERAL_ACT_REQ;
> +	value =3D crtc_state->planes | GENERAL_ACT_REQ;
>  	tegra_dc_writel(dc, value, DC_CMD_STATE_CONTROL);
>  	value =3D tegra_dc_readl(dc, DC_CMD_STATE_CONTROL);
>  }
> diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss=
/tidss_crtc.c
> index 6739f489dfdf..2218da3b3ca3 100644
> --- a/drivers/gpu/drm/tidss/tidss_crtc.c
> +++ b/drivers/gpu/drm/tidss/tidss_crtc.c
> @@ -163,8 +163,10 @@ static void tidss_crtc_position_planes(struct tids=
s_device *tidss,
>  }
> =20
>  static void tidss_crtc_atomic_flush(struct drm_crtc *crtc,
> -				    struct drm_crtc_state *old_crtc_state)
> +				    struct drm_atomic_state *state)
>  {
> +	struct drm_crtc_state *old_crtc_state =3D drm_atomic_get_old_crtc_sta=
te(state,
> +									      crtc);
>  	struct tidss_crtc *tcrtc =3D to_tidss_crtc(crtc);
>  	struct drm_device *ddev =3D crtc->dev;
>  	struct tidss_device *tidss =3D to_tidss(ddev);
> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/til=
cdc/tilcdc_crtc.c
> index d87a9fd4a203..40c59f4bd962 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> @@ -535,7 +535,7 @@ static void tilcdc_crtc_atomic_disable(struct drm_c=
rtc *crtc,
>  }
> =20
>  static void tilcdc_crtc_atomic_flush(struct drm_crtc *crtc,
> -				     struct drm_crtc_state *old_state)
> +				     struct drm_atomic_state *state)
>  {
>  	if (!crtc->state->event)
>  		return;
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vb=
oxvideo/vbox_mode.c
> index 931c55126148..322bf7133ba1 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
> @@ -223,7 +223,7 @@ static void vbox_crtc_atomic_disable(struct drm_crt=
c *crtc,
>  }
> =20
>  static void vbox_crtc_atomic_flush(struct drm_crtc *crtc,
> -				   struct drm_crtc_state *old_crtc_state)
> +				   struct drm_atomic_state *state)
>  {
>  }
> =20
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_dr=
v.h
> index a22478a35199..ada11311e613 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.h
> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> @@ -914,7 +914,8 @@ int vc4_hvs_get_fifo_from_output(struct drm_device =
*dev, unsigned int output);
>  int vc4_hvs_atomic_check(struct drm_crtc *crtc, struct drm_crtc_state =
*state);
>  void vc4_hvs_atomic_enable(struct drm_crtc *crtc, struct drm_crtc_stat=
e *old_state);
>  void vc4_hvs_atomic_disable(struct drm_crtc *crtc, struct drm_crtc_sta=
te *old_state);
> -void vc4_hvs_atomic_flush(struct drm_crtc *crtc, struct drm_crtc_state=
 *state);
> +void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
> +			  struct drm_atomic_state *state);
>  void vc4_hvs_dump_state(struct drm_device *dev);
>  void vc4_hvs_unmask_underrun(struct drm_device *dev, int channel);
>  void vc4_hvs_mask_underrun(struct drm_device *dev, int channel);
> diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hv=
s.c
> index 4d0a833366ce..0bd5ea435120 100644
> --- a/drivers/gpu/drm/vc4/vc4_hvs.c
> +++ b/drivers/gpu/drm/vc4/vc4_hvs.c
> @@ -414,8 +414,10 @@ void vc4_hvs_atomic_disable(struct drm_crtc *crtc,=

>  }
> =20
>  void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
> -			  struct drm_crtc_state *old_state)
> +			  struct drm_atomic_state *state)
>  {
> +	struct drm_crtc_state *old_state =3D drm_atomic_get_old_crtc_state(st=
ate,
> +									 crtc);
>  	struct drm_device *dev =3D crtc->dev;
>  	struct vc4_dev *vc4 =3D to_vc4_dev(dev);
>  	struct vc4_crtc_state *vc4_state =3D to_vc4_crtc_state(crtc->state);
> diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm=
/virtio/virtgpu_display.c
> index e81183ab87e0..4bf74836bd53 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_display.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_display.c
> @@ -117,7 +117,7 @@ static int virtio_gpu_crtc_atomic_check(struct drm_=
crtc *crtc,
>  }
> =20
>  static void virtio_gpu_crtc_atomic_flush(struct drm_crtc *crtc,
> -					 struct drm_crtc_state *old_state)
> +					 struct drm_atomic_state *state)
>  {
>  	struct virtio_gpu_output *output =3D drm_crtc_to_virtio_gpu_output(cr=
tc);
> =20
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vk=
ms_crtc.c
> index 6a49e70bdf18..0443b7deeaef 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -228,7 +228,7 @@ static void vkms_crtc_atomic_disable(struct drm_crt=
c *crtc,
>  }
> =20
>  static void vkms_crtc_atomic_begin(struct drm_crtc *crtc,
> -				   struct drm_crtc_state *old_crtc_state)
> +				   struct drm_atomic_state *state)
>  {
>  	struct vkms_output *vkms_output =3D drm_crtc_to_vkms_output(crtc);
> =20
> @@ -239,7 +239,7 @@ static void vkms_crtc_atomic_begin(struct drm_crtc =
*crtc,
>  }
> =20
>  static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
> -				   struct drm_crtc_state *old_crtc_state)
> +				   struct drm_atomic_state *state)
>  {
>  	struct vkms_output *vkms_output =3D drm_crtc_to_vkms_output(crtc);
> =20
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwg=
fx/vmwgfx_kms.c
> index a74c9454ade2..bc67f2b930e1 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> @@ -554,13 +554,13 @@ int vmw_du_crtc_atomic_check(struct drm_crtc *crt=
c,
> =20
> =20
>  void vmw_du_crtc_atomic_begin(struct drm_crtc *crtc,
> -			      struct drm_crtc_state *old_crtc_state)
> +			      struct drm_atomic_state *state)
>  {
>  }
> =20
> =20
>  void vmw_du_crtc_atomic_flush(struct drm_crtc *crtc,
> -			      struct drm_crtc_state *old_crtc_state)
> +			      struct drm_atomic_state *state)
>  {
>  	struct drm_pending_vblank_event *event =3D crtc->state->event;
> =20
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h b/drivers/gpu/drm/vmwg=
fx/vmwgfx_kms.h
> index b3d4e7b4c8c5..03f3694015ce 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
> @@ -475,9 +475,9 @@ void vmw_du_plane_unpin_surf(struct vmw_plane_state=
 *vps,
>  int vmw_du_crtc_atomic_check(struct drm_crtc *crtc,
>  			     struct drm_atomic_state *state);
>  void vmw_du_crtc_atomic_begin(struct drm_crtc *crtc,
> -			      struct drm_crtc_state *old_crtc_state);
> +			      struct drm_atomic_state *state);
>  void vmw_du_crtc_atomic_flush(struct drm_crtc *crtc,
> -			      struct drm_crtc_state *old_crtc_state);
> +			      struct drm_atomic_state *state);
>  void vmw_du_crtc_reset(struct drm_crtc *crtc);
>  struct drm_crtc_state *vmw_du_crtc_duplicate_state(struct drm_crtc *cr=
tc);
>  void vmw_du_crtc_destroy_state(struct drm_crtc *crtc,
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/=
zynqmp_disp.c
> index 12d3877b3685..0915cf2c97ac 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> @@ -1515,14 +1515,14 @@ static int zynqmp_disp_crtc_atomic_check(struct=
 drm_crtc *crtc,
> =20
>  static void
>  zynqmp_disp_crtc_atomic_begin(struct drm_crtc *crtc,
> -			      struct drm_crtc_state *old_crtc_state)
> +			      struct drm_atomic_state *state)
>  {
>  	drm_crtc_vblank_on(crtc);
>  }
> =20
>  static void
>  zynqmp_disp_crtc_atomic_flush(struct drm_crtc *crtc,
> -			      struct drm_crtc_state *old_crtc_state)
> +			      struct drm_atomic_state *state)
>  {
>  	if (crtc->state->event) {
>  		struct drm_pending_vblank_event *event;
> diff --git a/drivers/gpu/drm/zte/zx_vou.c b/drivers/gpu/drm/zte/zx_vou.=
c
> index d2a529eba3c9..904f62f3bfc1 100644
> --- a/drivers/gpu/drm/zte/zx_vou.c
> +++ b/drivers/gpu/drm/zte/zx_vou.c
> @@ -473,7 +473,7 @@ static void zx_crtc_atomic_disable(struct drm_crtc =
*crtc,
>  }
> =20
>  static void zx_crtc_atomic_flush(struct drm_crtc *crtc,
> -				  struct drm_crtc_state *old_state)
> +				  struct drm_atomic_state *state)
>  {
>  	struct drm_pending_vblank_event *event =3D crtc->state->event;
> =20
> diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm=
_modeset_helper_vtables.h
> index b97441deaf93..f2de050085be 100644
> --- a/include/drm/drm_modeset_helper_vtables.h
> +++ b/include/drm/drm_modeset_helper_vtables.h
> @@ -373,7 +373,7 @@ struct drm_crtc_helper_funcs {
>  	 * transitional plane helpers, but it is optional.
>  	 */
>  	void (*atomic_begin)(struct drm_crtc *crtc,
> -			     struct drm_crtc_state *old_crtc_state);
> +			     struct drm_atomic_state *state);
>  	/**
>  	 * @atomic_flush:
>  	 *
> @@ -397,7 +397,7 @@ struct drm_crtc_helper_funcs {
>  	 * transitional plane helpers, but it is optional.
>  	 */
>  	void (*atomic_flush)(struct drm_crtc *crtc,
> -			     struct drm_crtc_state *old_crtc_state);
> +			     struct drm_atomic_state *state);
> =20
>  	/**
>  	 * @atomic_enable:
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer

--------------2D2499A33BBA943C122E6E60
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

--------------2D2499A33BBA943C122E6E60--

--KcazbrCah0NpvHQjOBvnbt2mIbirqF2Cf--

--vLqccpk2mS2gihMPnmWNli2ADRPy5AxVw
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl+fwKgFAwAAAAAACgkQaA3BHVMLeiNh
/Qf7BScieez11BJGRk6a51aRBZWoQGLC7mGXiE5U8bY7et3F2gB5L+zZRuK6wafuOP9gEDQvdhpY
qEyw/3ITeS3GPnsT1/S8wpFQXu49OYcLV+GmDgEs/garBgvXo1bZ+JYF4eAUu281qmKXBiaFwOLw
8BEJu01FZ0EjxmF4HOv2bYyescivddLQlS83Bh6cNlzLFjpj5oZT2UKDLfXBTsAaSS2Ou22UxiMl
u4UtRud+oebjkIRgArKPaQIYutcCDnj8j3B4GDwcJLkU/9Uu06PbSPkdaDdN/psDr1aYdg1GRSE5
bFvaRm8BKbc3Q9EWjqVDBsiRtfXj7a8g9wxzdCRLfQ==
=xnb2
-----END PGP SIGNATURE-----

--vLqccpk2mS2gihMPnmWNli2ADRPy5AxVw--

--===============0958990929==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0958990929==--
