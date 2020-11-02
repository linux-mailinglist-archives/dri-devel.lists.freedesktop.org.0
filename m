Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4232A2EF5
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 17:04:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64A586E49C;
	Mon,  2 Nov 2020 16:04:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A48E6E49C
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 16:04:32 +0000 (UTC)
IronPort-SDR: kv/iDjLQhhNYN6znF51C2wNmKgdBTxaayo/xRl3ecd+0f2c82lt7gv8PGPpqDQputEKweyYoBl
 HZRWGGEwV+Hg==
X-IronPort-AV: E=McAfee;i="6000,8403,9793"; a="148188178"
X-IronPort-AV: E=Sophos;i="5.77,445,1596524400"; d="scan'208";a="148188178"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2020 08:04:10 -0800
IronPort-SDR: +wlVGZLGhCZDxglafeArj/PS63qDxMllXPyfsieyIihUB+b6fclKszXRVi/XccuVToHEKfYUUL
 NKuKxEXm6r4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,445,1596524400"; d="scan'208";a="363286411"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 02 Nov 2020 08:04:07 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 02 Nov 2020 18:04:06 +0200
Date: Mon, 2 Nov 2020 18:04:06 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 2/3] drm: Use state helper instead of CRTC state pointer
Message-ID: <20201102160406.GN6112@intel.com>
References: <20201102133834.1176740-1-maxime@cerno.tech>
 <20201102133834.1176740-2-maxime@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201102133834.1176740-2-maxime@cerno.tech>
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

On Mon, Nov 02, 2020 at 02:38:33PM +0100, Maxime Ripard wrote:
> Many drivers reference the crtc->pointer in order to get the current CRTC
> state in their atomic_begin or atomic_flush hooks, which would be the new
> CRTC state in the global atomic state since _swap_state happened when tho=
se
> hooks are run.
> =

> Use the drm_atomic_get_new_crtc_state helper to get that state to make it
> more obvious.
> =

> This was made using the coccinelle script below:
> =

> @ crtc_atomic_func @
> identifier helpers;
> identifier func;
> @@
> =

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
> =

> @@
> identifier crtc_atomic_func.func;
> identifier crtc, state;
> symbol crtc_state;
> expression e;
> @@
> =

>   func(struct drm_crtc *crtc, struct drm_atomic_state *state) {
>   ...
> - struct tegra_dc_state *crtc_state =3D e;
> + struct tegra_dc_state *dc_state =3D e;
>   <+...
> -       crtc_state
> +	dc_state
>   ...+>
>   }
> =

> @@
> identifier crtc_atomic_func.func;
> identifier crtc, state;
> symbol crtc_state;
> expression e;
> @@
> =

>   func(struct drm_crtc *crtc, struct drm_atomic_state *state) {
>   ...
> - struct mtk_crtc_state *crtc_state =3D e;
> + struct mtk_crtc_state *mtk_crtc_state =3D e;
>   <+...
> -       crtc_state
> +	mtk_crtc_state
>   ...+>
>   }

These reanames seem a bit out of scpe for this patch. But I guess you
needed then to get the rest of the cocci to work on some drivers?

The basic idea looks good:
Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

But I guess up to the individual driver folks to bikeshed the variable
naming and whatnot.

One thing I spotted is that a few drivers now gained two aliasing crtc
state pointers in the function: one with the drm type, the other with
a driver specific type. That's something we've outlawed in i915 since
it was making life rather confusing. In i915 we now prefer to use only
the i915 specific types in most places.

> =

> @ replaces_new_state @
> identifier crtc_atomic_func.func;
> identifier crtc, state, crtc_state;
> @@
> =

>   func(struct drm_crtc *crtc, struct drm_atomic_state *state) {
>   ...
> - struct drm_crtc_state *crtc_state =3D crtc->state;
> + struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(sta=
te, crtc);
>   ...
>  }
> =

> @@
> identifier crtc_atomic_func.func;
> identifier crtc, state, crtc_state;
> @@
> =

>   func(struct drm_crtc *crtc, struct drm_atomic_state *state) {
>   struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(sta=
te, crtc);
>   ...
> - crtc->state
> + crtc_state
>   ...
>  }
> =

> @ adds_new_state @
> identifier crtc_atomic_func.func;
> identifier crtc, state;
> @@
> =

>   func(struct drm_crtc *crtc, struct drm_atomic_state *state) {
> + struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(sta=
te, crtc);
>   ...
> - crtc->state
> + crtc_state
>   ...
>  }
> =

> @ include depends on adds_new_state || replaces_new_state @
> @@
> =

>  #include <drm/drm_atomic.h>
> =

> @ no_include depends on !include && (adds_new_state || replaces_new_state=
) @
> @@
> =

> + #include <drm/drm_atomic.h>
>   #include <drm/...>
> =

> Suggested-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/arm/display/komeda/komeda_crtc.c |  4 +++-
>  drivers/gpu/drm/armada/armada_crtc.c             |  8 ++++++--
>  drivers/gpu/drm/ast/ast_mode.c                   |  4 +++-
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c        |  7 +++++--
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c          | 15 +++++++++------
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c      |  6 ++++--
>  drivers/gpu/drm/tegra/dc.c                       |  8 +++++---
>  drivers/gpu/drm/virtio/virtgpu_display.c         |  4 +++-
>  8 files changed, 38 insertions(+), 18 deletions(-)
> =

> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/g=
pu/drm/arm/display/komeda/komeda_crtc.c
> index df0b9eeb8933..4b485eb512e2 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> @@ -387,10 +387,12 @@ static void
>  komeda_crtc_atomic_flush(struct drm_crtc *crtc,
>  			 struct drm_atomic_state *state)
>  {
> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(sta=
te,
> +									  crtc);
>  	struct drm_crtc_state *old =3D drm_atomic_get_old_crtc_state(state,
>  								   crtc);
>  	/* commit with modeset will be handled in enable/disable */
> -	if (drm_atomic_crtc_needs_modeset(crtc->state))
> +	if (drm_atomic_crtc_needs_modeset(crtc_state))
>  		return;
>  =

>  	komeda_crtc_do_flush(crtc, old);
> diff --git a/drivers/gpu/drm/armada/armada_crtc.c b/drivers/gpu/drm/armad=
a/armada_crtc.c
> index ca643f4e2064..3ebcf5a52c8b 100644
> --- a/drivers/gpu/drm/armada/armada_crtc.c
> +++ b/drivers/gpu/drm/armada/armada_crtc.c
> @@ -431,11 +431,13 @@ static int armada_drm_crtc_atomic_check(struct drm_=
crtc *crtc,
>  static void armada_drm_crtc_atomic_begin(struct drm_crtc *crtc,
>  					 struct drm_atomic_state *state)
>  {
> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(sta=
te,
> +									  crtc);
>  	struct armada_crtc *dcrtc =3D drm_to_armada_crtc(crtc);
>  =

>  	DRM_DEBUG_KMS("[CRTC:%d:%s]\n", crtc->base.id, crtc->name);
>  =

> -	if (crtc->state->color_mgmt_changed)
> +	if (crtc_state->color_mgmt_changed)
>  		armada_drm_update_gamma(crtc);
>  =

>  	dcrtc->regs_idx =3D 0;
> @@ -445,6 +447,8 @@ static void armada_drm_crtc_atomic_begin(struct drm_c=
rtc *crtc,
>  static void armada_drm_crtc_atomic_flush(struct drm_crtc *crtc,
>  					 struct drm_atomic_state *state)
>  {
> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(sta=
te,
> +									  crtc);
>  	struct armada_crtc *dcrtc =3D drm_to_armada_crtc(crtc);
>  =

>  	DRM_DEBUG_KMS("[CRTC:%d:%s]\n", crtc->base.id, crtc->name);
> @@ -455,7 +459,7 @@ static void armada_drm_crtc_atomic_flush(struct drm_c=
rtc *crtc,
>  	 * If we aren't doing a full modeset, then we need to queue
>  	 * the event here.
>  	 */
> -	if (!drm_atomic_crtc_needs_modeset(crtc->state)) {
> +	if (!drm_atomic_crtc_needs_modeset(crtc_state)) {
>  		dcrtc->update_pending =3D true;
>  		armada_drm_crtc_queue_state_event(crtc);
>  		spin_lock_irq(&dcrtc->irq_lock);
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mod=
e.c
> index 22f0e65fbe9a..87c5c5f35f10 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -782,10 +782,12 @@ static void
>  ast_crtc_helper_atomic_flush(struct drm_crtc *crtc,
>  			     struct drm_atomic_state *state)
>  {
> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(sta=
te,
> +								          crtc);
>  	struct drm_crtc_state *old_crtc_state =3D drm_atomic_get_old_crtc_state=
(state,
>  									      crtc);
>  	struct ast_private *ast =3D to_ast_private(crtc->dev);
> -	struct ast_crtc_state *ast_crtc_state =3D to_ast_crtc_state(crtc->state=
);
> +	struct ast_crtc_state *ast_crtc_state =3D to_ast_crtc_state(crtc_state);
>  	struct ast_crtc_state *old_ast_crtc_state =3D to_ast_crtc_state(old_crt=
c_state);
>  =

>  	/*
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/=
ingenic/ingenic-drm-drv.c
> index b9c156e13156..7603f86dd0d1 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -305,11 +305,13 @@ ingenic_drm_crtc_mode_valid(struct drm_crtc *crtc, =
const struct drm_display_mode
>  static void ingenic_drm_crtc_atomic_begin(struct drm_crtc *crtc,
>  					  struct drm_atomic_state *state)
>  {
> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(sta=
te,
> +									  crtc);
>  	struct ingenic_drm *priv =3D drm_crtc_get_priv(crtc);
>  	u32 ctrl =3D 0;
>  =

>  	if (priv->soc_info->has_osd &&
> -	    drm_atomic_crtc_needs_modeset(crtc->state)) {
> +	    drm_atomic_crtc_needs_modeset(crtc_state)) {
>  		/*
>  		 * If IPU plane is enabled, enable IPU as source for the F1
>  		 * plane; otherwise use regular DMA.
> @@ -326,7 +328,8 @@ static void ingenic_drm_crtc_atomic_flush(struct drm_=
crtc *crtc,
>  					  struct drm_atomic_state *state)
>  {
>  	struct ingenic_drm *priv =3D drm_crtc_get_priv(crtc);
> -	struct drm_crtc_state *crtc_state =3D crtc->state;
> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(sta=
te,
> +									  crtc);
>  	struct drm_pending_vblank_event *event =3D crtc_state->event;
>  =

>  	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/me=
diatek/mtk_drm_crtc.c
> index 23f5c10b0c67..193848fd7515 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -11,6 +11,7 @@
>  #include <asm/barrier.h>
>  #include <soc/mediatek/smi.h>
>  =

> +#include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_plane_helper.h>
>  #include <drm/drm_probe_helper.h>
> @@ -577,17 +578,19 @@ static void mtk_drm_crtc_atomic_disable(struct drm_=
crtc *crtc,
>  static void mtk_drm_crtc_atomic_begin(struct drm_crtc *crtc,
>  				      struct drm_atomic_state *state)
>  {
> -	struct mtk_crtc_state *crtc_state =3D to_mtk_crtc_state(crtc->state);
> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(sta=
te,
> +									  crtc);
> +	struct mtk_crtc_state *mtk_crtc_state =3D to_mtk_crtc_state(crtc_state);
>  	struct mtk_drm_crtc *mtk_crtc =3D to_mtk_crtc(crtc);
>  =

> -	if (mtk_crtc->event && crtc_state->base.event)
> +	if (mtk_crtc->event && mtk_crtc_state->base.event)
>  		DRM_ERROR("new event while there is still a pending event\n");
>  =

> -	if (crtc_state->base.event) {
> -		crtc_state->base.event->pipe =3D drm_crtc_index(crtc);
> +	if (mtk_crtc_state->base.event) {
> +		mtk_crtc_state->base.event->pipe =3D drm_crtc_index(crtc);
>  		WARN_ON(drm_crtc_vblank_get(crtc) !=3D 0);
> -		mtk_crtc->event =3D crtc_state->base.event;
> -		crtc_state->base.event =3D NULL;
> +		mtk_crtc->event =3D mtk_crtc_state->base.event;
> +		mtk_crtc_state->base.event =3D NULL;
>  	}
>  }
>  =

> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/dr=
m/rockchip/rockchip_drm_vop.c
> index 8cd39fca81a3..f820654b2492 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> @@ -1248,6 +1248,8 @@ static void vop_crtc_gamma_set(struct vop *vop, str=
uct drm_crtc *crtc,
>  static void vop_crtc_atomic_begin(struct drm_crtc *crtc,
>  				  struct drm_atomic_state *state)
>  {
> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(sta=
te,
> +								          crtc);
>  	struct drm_crtc_state *old_crtc_state =3D drm_atomic_get_old_crtc_state=
(state,
>  									      crtc);
>  	struct vop *vop =3D to_vop(crtc);
> @@ -1256,8 +1258,8 @@ static void vop_crtc_atomic_begin(struct drm_crtc *=
crtc,
>  	 * Only update GAMMA if the 'active' flag is not changed,
>  	 * otherwise it's updated by .atomic_enable.
>  	 */
> -	if (crtc->state->color_mgmt_changed &&
> -	    !crtc->state->active_changed)
> +	if (crtc_state->color_mgmt_changed &&
> +	    !crtc_state->active_changed)
>  		vop_crtc_gamma_set(vop, crtc, old_crtc_state);
>  }
>  =

> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> index 2d86627b0d4e..85dd7131553a 100644
> --- a/drivers/gpu/drm/tegra/dc.c
> +++ b/drivers/gpu/drm/tegra/dc.c
> @@ -1939,15 +1939,17 @@ static void tegra_crtc_atomic_begin(struct drm_cr=
tc *crtc,
>  static void tegra_crtc_atomic_flush(struct drm_crtc *crtc,
>  				    struct drm_atomic_state *state)
>  {
> -	struct tegra_dc_state *crtc_state =3D to_dc_state(crtc->state);
> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(sta=
te,
> +									  crtc);
> +	struct tegra_dc_state *dc_state =3D to_dc_state(crtc_state);
>  	struct tegra_dc *dc =3D to_tegra_dc(crtc);
>  	u32 value;
>  =

> -	value =3D crtc_state->planes << 8 | GENERAL_UPDATE;
> +	value =3D dc_state->planes << 8 | GENERAL_UPDATE;
>  	tegra_dc_writel(dc, value, DC_CMD_STATE_CONTROL);
>  	value =3D tegra_dc_readl(dc, DC_CMD_STATE_CONTROL);
>  =

> -	value =3D crtc_state->planes | GENERAL_ACT_REQ;
> +	value =3D dc_state->planes | GENERAL_ACT_REQ;
>  	tegra_dc_writel(dc, value, DC_CMD_STATE_CONTROL);
>  	value =3D tegra_dc_readl(dc, DC_CMD_STATE_CONTROL);
>  }
> diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/v=
irtio/virtgpu_display.c
> index 4bf74836bd53..a6caebd4a0dd 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_display.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_display.c
> @@ -119,6 +119,8 @@ static int virtio_gpu_crtc_atomic_check(struct drm_cr=
tc *crtc,
>  static void virtio_gpu_crtc_atomic_flush(struct drm_crtc *crtc,
>  					 struct drm_atomic_state *state)
>  {
> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(sta=
te,
> +									  crtc);
>  	struct virtio_gpu_output *output =3D drm_crtc_to_virtio_gpu_output(crtc=
);
>  =

>  	/*
> @@ -127,7 +129,7 @@ static void virtio_gpu_crtc_atomic_flush(struct drm_c=
rtc *crtc,
>  	 * in the plane update callback, and here we just check
>  	 * whenever we must force the modeset.
>  	 */
> -	if (drm_atomic_crtc_needs_modeset(crtc->state)) {
> +	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
>  		output->needs_modeset =3D true;
>  	}
>  }
> -- =

> 2.28.0

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
