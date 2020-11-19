Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9002B9605
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 16:22:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 516276E536;
	Thu, 19 Nov 2020 15:22:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 653776E536
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 15:22:04 +0000 (UTC)
IronPort-SDR: ve1MQd/1/nRTn2JSDZM68AJss1JI1k7QO+0jFQp4pLcjXge8Haqlb+WW9a5PrxwtpCHfRNB+bP
 YbcBDP09075A==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="256013019"
X-IronPort-AV: E=Sophos;i="5.77,490,1596524400"; d="scan'208";a="256013019"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2020 07:21:54 -0800
IronPort-SDR: 2QoXCGSuwfFee4Jciyxu1HqHwlsdtgEl52Wi5uSlristjl94kXbR/E6oZXP1zbnoySPHLT7tC/
 cyZI0VGcct6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,490,1596524400"; d="scan'208";a="330963832"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 19 Nov 2020 07:21:49 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 19 Nov 2020 17:21:48 +0200
Date: Thu, 19 Nov 2020 17:21:48 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2] drm: Pass the full state to connectors atomic functions
Message-ID: <20201119152148.GI6112@intel.com>
References: <20201118094758.506730-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201118094758.506730-1-maxime@cerno.tech>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Melissa Wen <melissa.srw@gmail.com>, Leo Li <sunpeng.li@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 18, 2020 at 10:47:58AM +0100, Maxime Ripard wrote:
> The current atomic helpers have either their object state being passed as
> an argument or the full atomic state.
> =

> The former is the pattern that was done at first, before switching to the
> latter for new hooks or when it was needed.
> =

> Now that the CRTCs have been converted, let's move forward with the
> connectors to provide a consistent interface.
> =

> The conversion was done using the coccinelle script below, and built test=
ed
> on all the drivers.
> =

> @@
> identifier connector, connector_state;
> @@
> =

>  struct drm_connector_helper_funcs {
> 	...
> 	struct drm_encoder* (*atomic_best_encoder)(struct drm_connector *connect=
or,
> -						   struct drm_connector_state *connector_state);
> +						   struct drm_atomic_state *state);
> 	...
> }
> =

> @@
> identifier connector, connector_state;
> @@
> =

>  struct drm_connector_helper_funcs {
> 	...
> 	void (*atomic_commit)(struct drm_connector *connector,
> -			      struct drm_connector_state *connector_state);
> +			      struct drm_atomic_state *state);
> 	...
> }
> =

> @@
> struct drm_connector_helper_funcs *FUNCS;
> identifier state;
> identifier connector, connector_state;
> identifier f;
> @@
> =

>  f(..., struct drm_atomic_state *state, ...)
>  {
> 	<+...
> -	FUNCS->atomic_commit(connector, connector_state);
> +	FUNCS->atomic_commit(connector, state);
> 	...+>
>  }
> =

> @@
> struct drm_connector_helper_funcs *FUNCS;
> identifier state;
> identifier connector, connector_state;
> identifier var, f;
> @@
> =

>  f(struct drm_atomic_state *state, ...)

I think there was some way to deal with these variants using a single
rule, but maybe that required the use of the parameter list stuff
which IIRC was a bit ugly. Probably not worth the hassle here.

>  {
> 	<+...
> -	var =3D FUNCS->atomic_best_encoder(connector, connector_state);
> +	var =3D FUNCS->atomic_best_encoder(connector, state);
> 	...+>
>  }
> =

> @ connector_atomic_func @
> identifier helpers;
> identifier func;
> @@
> =

> (
> static struct drm_connector_helper_funcs helpers =3D {
> 	...,
> 	.atomic_best_encoder =3D func,
> 	...,
> };
> |
> static struct drm_connector_helper_funcs helpers =3D {
> 	...,
> 	.atomic_commit =3D func,
> 	...,
> };
> )
> =

> @@
> identifier connector_atomic_func.func;
> identifier connector;
> symbol state;
> @@
> =

>  func(struct drm_connector *connector,
> -      struct drm_connector_state *state
> +      struct drm_connector_state *connector_state
>       )
>  {
> 	...
> -	state
> +	connector_state
>  	...
>  }
> =

> @ ignores_state @
> identifier connector_atomic_func.func;
> identifier connector, connector_state;
> @@
> =

>  func(struct drm_connector *connector,
>       struct drm_connector_state *connector_state)
> {
> 	... when !=3D connector_state
> }
> =

> @ adds_state depends on connector_atomic_func && !ignores_state @
> identifier connector_atomic_func.func;
> identifier connector, connector_state;
> @@
> =

>  func(struct drm_connector *connector, struct drm_connector_state *connec=
tor_state)
>  {
> +	struct drm_connector_state *connector_state =3D drm_atomic_get_new_conn=
ector_state(state, connector);
> 	...
>  }
> =

> @ depends on connector_atomic_func @
> identifier connector_atomic_func.func;
> identifier connector_state;
> identifier connector;
> @@
> =

>  func(struct drm_connector *connector,
> -     struct drm_connector_state *connector_state
> +     struct drm_atomic_state *state
> 	   )
>  { ... }
> =

> @ include depends on adds_state @
> @@
> =

>  #include <drm/drm_atomic.h>
> =

> @ no_include depends on !include && adds_state @
> @@
> =

> + #include <drm/drm_atomic.h>
>   #include <drm/...>

Nicely done with the depends. Also never used that stuff myself
so thanks for the tutorial :)

Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

> =

> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=F6nig" <christian.koenig@amd.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> Cc: Melissa Wen <melissa.srw@gmail.com>
> Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Harry Wentland <harry.wentland@amd.com>
> Reviewed-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> =

> ---
> =

> Changes from v1:
>   - Added missing coccinelle script
> ---
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c |  5 ++++-
>  drivers/gpu/drm/drm_atomic_helper.c                 |  8 ++++----
>  drivers/gpu/drm/i915/display/intel_dp_mst.c         |  7 +++++--
>  drivers/gpu/drm/nouveau/dispnv50/disp.c             |  5 ++++-
>  drivers/gpu/drm/vc4/vc4_txp.c                       |  4 +++-
>  drivers/gpu/drm/vkms/vkms_writeback.c               |  7 +++++--
>  include/drm/drm_modeset_helper_vtables.h            | 13 ++++++-------
>  7 files changed, 31 insertions(+), 18 deletions(-)
> =

> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c =
b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index 6f975c16779d..8ab0b9060d2b 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -24,6 +24,7 @@
>   */
>  =

>  #include <linux/version.h>
> +#include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_dp_mst_helper.h>
>  #include <drm/drm_dp_helper.h>
> @@ -252,8 +253,10 @@ static int dm_dp_mst_get_modes(struct drm_connector =
*connector)
>  =

>  static struct drm_encoder *
>  dm_mst_atomic_best_encoder(struct drm_connector *connector,
> -			   struct drm_connector_state *connector_state)
> +			   struct drm_atomic_state *state)
>  {
> +	struct drm_connector_state *connector_state =3D drm_atomic_get_new_conn=
ector_state(state,
> +											 connector);
>  	struct drm_device *dev =3D connector->dev;
>  	struct amdgpu_device *adev =3D drm_to_adev(dev);
>  	struct amdgpu_crtc *acrtc =3D to_amdgpu_crtc(connector_state->crtc);
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_at=
omic_helper.c
> index ddd0e3239150..ba1507036f26 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -122,7 +122,8 @@ static int handle_conflicting_encoders(struct drm_ato=
mic_state *state,
>  			continue;
>  =

>  		if (funcs->atomic_best_encoder)
> -			new_encoder =3D funcs->atomic_best_encoder(connector, new_conn_state);
> +			new_encoder =3D funcs->atomic_best_encoder(connector,
> +								 state);
>  		else if (funcs->best_encoder)
>  			new_encoder =3D funcs->best_encoder(connector);
>  		else
> @@ -345,8 +346,7 @@ update_connector_routing(struct drm_atomic_state *sta=
te,
>  	funcs =3D connector->helper_private;
>  =

>  	if (funcs->atomic_best_encoder)
> -		new_encoder =3D funcs->atomic_best_encoder(connector,
> -							 new_connector_state);
> +		new_encoder =3D funcs->atomic_best_encoder(connector, state);
>  	else if (funcs->best_encoder)
>  		new_encoder =3D funcs->best_encoder(connector);
>  	else
> @@ -1313,7 +1313,7 @@ static void drm_atomic_helper_commit_writebacks(str=
uct drm_device *dev,
>  =

>  		if (new_conn_state->writeback_job && new_conn_state->writeback_job->fb=
) {
>  			WARN_ON(connector->connector_type !=3D DRM_MODE_CONNECTOR_WRITEBACK);
> -			funcs->atomic_commit(connector, new_conn_state);
> +			funcs->atomic_commit(connector, old_state);
>  		}
>  	}
>  }
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/dr=
m/i915/display/intel_dp_mst.c
> index c8fcec4d0788..4f05ffa3e761 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -23,6 +23,7 @@
>   *
>   */
>  =

> +#include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_edid.h>
>  #include <drm/drm_probe_helper.h>
> @@ -719,11 +720,13 @@ intel_dp_mst_mode_valid_ctx(struct drm_connector *c=
onnector,
>  }
>  =

>  static struct drm_encoder *intel_mst_atomic_best_encoder(struct drm_conn=
ector *connector,
> -							 struct drm_connector_state *state)
> +							 struct drm_atomic_state *state)
>  {
> +	struct drm_connector_state *connector_state =3D drm_atomic_get_new_conn=
ector_state(state,
> +											 connector);
>  	struct intel_connector *intel_connector =3D to_intel_connector(connecto=
r);
>  	struct intel_dp *intel_dp =3D intel_connector->mst_port;
> -	struct intel_crtc *crtc =3D to_intel_crtc(state->crtc);
> +	struct intel_crtc *crtc =3D to_intel_crtc(connector_state->crtc);
>  =

>  	return &intel_dp->mst_encoders[crtc->pipe]->base.base;
>  }
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/no=
uveau/dispnv50/disp.c
> index b111fe24a06b..911c2cbe6aa3 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -32,6 +32,7 @@
>  #include <linux/hdmi.h>
>  #include <linux/component.h>
>  =

> +#include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_dp_helper.h>
>  #include <drm/drm_edid.h>
> @@ -1161,8 +1162,10 @@ nv50_msto_new(struct drm_device *dev, struct nv50_=
head *head, int id)
>  =

>  static struct drm_encoder *
>  nv50_mstc_atomic_best_encoder(struct drm_connector *connector,
> -			      struct drm_connector_state *connector_state)
> +			      struct drm_atomic_state *state)
>  {
> +	struct drm_connector_state *connector_state =3D drm_atomic_get_new_conn=
ector_state(state,
> +											 connector);
>  	struct nv50_mstc *mstc =3D nv50_mstc(connector);
>  	struct drm_crtc *crtc =3D connector_state->crtc;
>  =

> diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
> index 34612edcabbd..8aa5220885f4 100644
> --- a/drivers/gpu/drm/vc4/vc4_txp.c
> +++ b/drivers/gpu/drm/vc4/vc4_txp.c
> @@ -273,8 +273,10 @@ static int vc4_txp_connector_atomic_check(struct drm=
_connector *conn,
>  }
>  =

>  static void vc4_txp_connector_atomic_commit(struct drm_connector *conn,
> -					struct drm_connector_state *conn_state)
> +					struct drm_atomic_state *state)
>  {
> +	struct drm_connector_state *conn_state =3D drm_atomic_get_new_connector=
_state(state,
> +										    conn);
>  	struct vc4_txp *txp =3D connector_to_vc4_txp(conn);
>  	struct drm_gem_cma_object *gem;
>  	struct drm_display_mode *mode;
> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms=
/vkms_writeback.c
> index 67f80ab1e85f..78fdc1d59186 100644
> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> @@ -2,6 +2,7 @@
>  =

>  #include <linux/dma-buf-map.h>
>  =

> +#include <drm/drm_atomic.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_writeback.h>
>  #include <drm/drm_probe_helper.h>
> @@ -105,8 +106,10 @@ static void vkms_wb_cleanup_job(struct drm_writeback=
_connector *connector,
>  }
>  =

>  static void vkms_wb_atomic_commit(struct drm_connector *conn,
> -				  struct drm_connector_state *state)
> +				  struct drm_atomic_state *state)
>  {
> +	struct drm_connector_state *connector_state =3D drm_atomic_get_new_conn=
ector_state(state,
> +											 conn);
>  	struct vkms_device *vkmsdev =3D drm_device_to_vkms_device(conn->dev);
>  	struct vkms_output *output =3D &vkmsdev->output;
>  	struct drm_writeback_connector *wb_conn =3D &output->wb_connector;
> @@ -122,7 +125,7 @@ static void vkms_wb_atomic_commit(struct drm_connecto=
r *conn,
>  	crtc_state->active_writeback =3D conn_state->writeback_job->priv;
>  	crtc_state->wb_pending =3D true;
>  	spin_unlock_irq(&output->composer_lock);
> -	drm_writeback_queue_job(wb_conn, state);
> +	drm_writeback_queue_job(wb_conn, connector_state);
>  }
>  =

>  static const struct drm_connector_helper_funcs vkms_wb_conn_helper_funcs=
 =3D {
> diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_m=
odeset_helper_vtables.h
> index f2de050085be..16ff3fa148f5 100644
> --- a/include/drm/drm_modeset_helper_vtables.h
> +++ b/include/drm/drm_modeset_helper_vtables.h
> @@ -1044,9 +1044,8 @@ struct drm_connector_helper_funcs {
>  	 * NOTE:
>  	 *
>  	 * This function is called in the check phase of an atomic update. The
> -	 * driver is not allowed to change anything outside of the free-standing
> -	 * state objects passed-in or assembled in the overall &drm_atomic_state
> -	 * update tracking structure.
> +	 * driver is not allowed to change anything outside of the
> +	 * &drm_atomic_state update tracking structure passed in.
>  	 *
>  	 * RETURNS:
>  	 *
> @@ -1056,7 +1055,7 @@ struct drm_connector_helper_funcs {
>  	 * for this.
>  	 */
>  	struct drm_encoder *(*atomic_best_encoder)(struct drm_connector *connec=
tor,
> -						   struct drm_connector_state *connector_state);
> +						   struct drm_atomic_state *state);
>  =

>  	/**
>  	 * @atomic_check:
> @@ -1097,15 +1096,15 @@ struct drm_connector_helper_funcs {
>  	 *
>  	 * This hook is to be used by drivers implementing writeback connectors
>  	 * that need a point when to commit the writeback job to the hardware.
> -	 * The writeback_job to commit is available in
> -	 * &drm_connector_state.writeback_job.
> +	 * The writeback_job to commit is available in the new connector state,
> +	 * in &drm_connector_state.writeback_job.
>  	 *
>  	 * This hook is optional.
>  	 *
>  	 * This callback is used by the atomic modeset helpers.
>  	 */
>  	void (*atomic_commit)(struct drm_connector *connector,
> -			      struct drm_connector_state *state);
> +			      struct drm_atomic_state *state);
>  =

>  	/**
>  	 * @prepare_writeback_job:
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
