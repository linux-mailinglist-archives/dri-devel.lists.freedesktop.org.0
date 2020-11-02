Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D542A2791
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 10:57:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFAFD6E45D;
	Mon,  2 Nov 2020 09:57:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F72A6E45D
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 09:57:17 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id c18so8745400wme.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 01:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=2moEe4M6RWX1BeWE63G+qTrvJQlvN6wYgVrvOC4WWmo=;
 b=Xeg6XY83fNdnF2WKVFmOTbrsut2ywkINggTnWydLWt8Yd8cZRvVj0+nLXWQVSJqqVv
 U0+dy2OH2Mq+WsKSTVxdpVJT0xJJ42IeUaYahxx+5jTklVYpnQCyIdXhRWroQFsVuU3v
 3ISvamivwEBF6335jau2xlYgQr3m9hokZaQQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=2moEe4M6RWX1BeWE63G+qTrvJQlvN6wYgVrvOC4WWmo=;
 b=PTZSsTJmdbTFRHsdwcdyd8jnXuklfUV0FyoeUNUDdEltNAi0WBlQ1gl+7RWtKkaxGO
 Nbq6eYxkzU+Bb4NmOXxfQVRXtV1aK6MLB2B8XUJSOmQEW/5PRO2JJKXQPGp56Z9y/i/i
 PMf0bEZBWiwH7ocFn/Cq0T9ZwFfPpO9WiaxfIQGJ/03Ve6NfXuUlBQS5f88TGrOySw0B
 CBfI1G34XuHJG/LVZD27SIhwCgIaJJk1YVvE2e3yHfAW2K6vNkEMSzJlrxmHkMDKkVsX
 Z1s+4uUYxgfxdDA4l+CV1uFrrecpcylImoggaI6nIQ7uIQM5gs0lhMa6lMDj6wM9K/Ql
 KdbA==
X-Gm-Message-State: AOAM531eayZ4xSm2dv4ZMj4nQ9s48Da8cRLXMFO9B8smOHpioaXWpXlj
 hLRL2kjelecjF2Z0vrhYSrOi3A==
X-Google-Smtp-Source: ABdhPJxNp49+7gab9PA+n3SNwV7Ow4a1D6qEv2ShIyvcDOkYHWbefdbHOxomMtJImNWH3zwq4BwkbA==
X-Received: by 2002:a05:600c:4147:: with SMTP id
 h7mr888446wmm.186.1604311035513; 
 Mon, 02 Nov 2020 01:57:15 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x18sm22725054wrg.4.2020.11.02.01.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 01:57:14 -0800 (PST)
Date: Mon, 2 Nov 2020 10:57:12 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/2] drm/atomic: Pass the full state to CRTC atomic begin
 and flush
Message-ID: <20201102095712.GK401619@phenom.ffwll.local>
References: <20201028123222.1732139-1-maxime@cerno.tech>
 <20201028123222.1732139-2-maxime@cerno.tech>
 <2cafe0ee-30b3-8749-32f1-9c3ad685cf12@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2cafe0ee-30b3-8749-32f1-9c3ad685cf12@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
 Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 02, 2020 at 09:17:44AM +0100, Thomas Zimmermann wrote:
> Hi
> =

> Am 28.10.20 um 13:32 schrieb Maxime Ripard:
> > The current atomic helpers have either their object state being passed =
as
> > an argument or the full atomic state.
> > =

> > The former is the pattern that was done at first, before switching to t=
he
> > latter for new hooks or when it was needed.
> > =

> > Let's start convert all the remaining helpers to provide a consistent
> > interface, starting with the CRTC's atomic_begin and atomic_flush.
> > =

> > The conversion was done using the coccinelle script below, built tested=
 on
> > all the drivers and actually tested on vc4.
> > =

> > virtual report
> > =

> > @@
> > struct drm_crtc_helper_funcs *FUNCS;
> > identifier old_crtc_state, old_state;
> > identifier crtc;
> > identifier f;
> > @@
> > =

> >  f(struct drm_crtc_state *old_crtc_state)
> >  {
> > 	...
> >  	struct drm_atomic_state *old_state =3D old_crtc_state->state;
> > 	<...
> > -	FUNCS->atomic_begin(crtc, old_crtc_state);
> > +	FUNCS->atomic_begin(crtc, old_state);
> > 	...>
> >  }
> > =

> > @@
> > struct drm_crtc_helper_funcs *FUNCS;
> > identifier old_crtc_state, old_state;
> > identifier crtc;
> > identifier f;
> > @@
> > =

> >  f(struct drm_crtc_state *old_crtc_state)
> >  {
> > 	...
> >  	struct drm_atomic_state *old_state =3D old_crtc_state->state;
> > 	<...
> > -	FUNCS->atomic_flush(crtc, old_crtc_state);
> > +	FUNCS->atomic_flush(crtc, old_state);
> > 	...>
> >  }
> > =

> > @@
> > struct drm_crtc_helper_funcs *FUNCS;
> > struct drm_crtc *crtc;
> > struct drm_crtc_state *crtc_state;
> > identifier dev, state;
> > identifier f;
> > @@
> > =

> >  f(struct drm_device *dev, struct drm_atomic_state *state, ...)
> >  {
> > 	<...
> > -	FUNCS->atomic_begin(crtc, crtc_state);
> > +	FUNCS->atomic_begin(crtc, state);
> > 	...>
> >  }
> > =

> > @@
> > struct drm_crtc_helper_funcs *FUNCS;
> > struct drm_crtc *crtc;
> > struct drm_crtc_state *crtc_state;
> > identifier dev, state;
> > identifier f;
> > @@
> > =

> >  f(struct drm_device *dev, struct drm_atomic_state *state, ...)
> >  {
> > 	<...
> > -	FUNCS->atomic_flush(crtc, crtc_state);
> > +	FUNCS->atomic_flush(crtc, state);
> > 	...>
> >  }
> > =

> > @@
> > identifier crtc, old_state;
> > @@
> > =

> >  struct drm_crtc_helper_funcs {
> > 	...
> > -	void (*atomic_begin)(struct drm_crtc *crtc, struct drm_crtc_state *ol=
d_state);
> > +	void (*atomic_begin)(struct drm_crtc *crtc, struct drm_atomic_state *=
state);
> > 	...
> > -	void (*atomic_flush)(struct drm_crtc *crtc, struct drm_crtc_state *ol=
d_state);
> > +	void (*atomic_flush)(struct drm_crtc *crtc, struct drm_atomic_state *=
state);
> > 	...
> > }
> > =

> > @ crtc_atomic_func @
> > identifier helpers;
> > identifier func;
> > @@
> > =

> > (
> > static struct drm_crtc_helper_funcs helpers =3D {
> > 	...,
> > 	.atomic_begin =3D func,
> > 	...,
> > };
> > |
> > static struct drm_crtc_helper_funcs helpers =3D {
> > 	...,
> > 	.atomic_flush =3D func,
> > 	...,
> > };
> > )
> > =

> > @ ignores_old_state @
> > identifier crtc_atomic_func.func;
> > identifier crtc, old_state;
> > @@
> > =

> > void func(struct drm_crtc *crtc,
> > 		struct drm_crtc_state *old_state)
> > {
> > 	... when !=3D old_state
> > }
> > =

> > @ adds_old_state depends on crtc_atomic_func && !ignores_old_state @
> > identifier crtc_atomic_func.func;
> > identifier crtc, old_state;
> > @@
> > =

> > void func(struct drm_crtc *crtc, struct drm_crtc_state *old_state)
> > {
> > +	struct drm_crtc_state *old_state =3D drm_atomic_get_old_crtc_state(st=
ate, crtc);
> > 	...
> > }
> > =

> > @ depends on crtc_atomic_func @
> > identifier crtc_atomic_func.func;
> > expression E;
> > type T;
> > @@
> > =

> > void func(...)
> > {
> > 	...
> > -	T state =3D E;
> > +	T crtc_state =3D E;
> > 	<+...
> > -	state
> > +	crtc_state
> > 	...+>
> > =

> > }
> > =

> > @ depends on crtc_atomic_func @
> > identifier crtc_atomic_func.func;
> > type T;
> > @@
> > =

> > void func(...)
> > {
> > 	...
> > -	T state;
> > +	T crtc_state;
> > 	<+...
> > -	state
> > +	crtc_state
> > 	...+>
> > =

> > }
> > =

> > @@
> > identifier old_state;
> > identifier crtc;
> > @@
> > =

> >  void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
> > -			   struct drm_crtc_state *old_state
> > +			   struct drm_atomic_state *state
> > 			   )
> > {
> > +	struct drm_crtc_state *old_state =3D drm_atomic_get_old_crtc_state(st=
ate, crtc);
> > 	...
> > }
> > =

> > @@
> > identifier old_state;
> > identifier crtc;
> > @@
> > =

> >  void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
> > -			   struct drm_crtc_state *old_state
> > +			   struct drm_atomic_state *state
> > 			   );
> > =

> > @@
> > identifier old_state;
> > identifier crtc;
> > @@
> > =

> >  void vmw_du_crtc_atomic_begin(struct drm_crtc *crtc,
> > -			   struct drm_crtc_state *old_state
> > +			   struct drm_atomic_state *state
> > 			   )
> > {
> > 	...
> > }
> > =

> > @@
> > identifier old_state;
> > identifier crtc;
> > @@
> > =

> >  void vmw_du_crtc_atomic_begin(struct drm_crtc *crtc,
> > -			   struct drm_crtc_state *old_state
> > +			   struct drm_atomic_state *state
> > 			   );
> > =

> > @@
> > identifier old_state;
> > identifier crtc;
> > @@
> > =

> >  void vmw_du_crtc_atomic_flush(struct drm_crtc *crtc,
> > -			   struct drm_crtc_state *old_state
> > +			   struct drm_atomic_state *state
> > 			   )
> > {
> > 	...
> > }
> > =

> > @@
> > identifier old_state;
> > identifier crtc;
> > @@
> > =

> >  void vmw_du_crtc_atomic_flush(struct drm_crtc *crtc,
> > -			   struct drm_crtc_state *old_state
> > +			   struct drm_atomic_state *state
> > 			   );
> > =

> > @ depends on crtc_atomic_func @
> > identifier crtc_atomic_func.func;
> > identifier old_state;
> > identifier crtc;
> > @@
> > =

> > void func(struct drm_crtc *crtc,
> > -	       struct drm_crtc_state *old_state
> > +	       struct drm_atomic_state *state
> > 	       )
> > 		{ ... }
> > =

> > @ include depends on adds_old_state @
> > @@
> > =

> >  #include <drm/drm_atomic.h>
> > =

> > @ no_include depends on !include && adds_old_state @
> > @@
> > =

> > + #include <drm/drm_atomic.h>
> >   #include <drm/...>
> > =

> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  .../gpu/drm/arm/display/komeda/komeda_crtc.c    |  4 +++-
> >  drivers/gpu/drm/arm/hdlcd_crtc.c                |  2 +-
> >  drivers/gpu/drm/armada/armada_crtc.c            |  4 ++--
> >  drivers/gpu/drm/ast/ast_mode.c                  |  5 ++++-
> >  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c  |  4 ++--
> >  drivers/gpu/drm/drm_atomic_helper.c             |  8 ++++----
> >  drivers/gpu/drm/exynos/exynos_drm_crtc.c        |  4 ++--
> >  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c      |  2 +-
> >  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c  |  4 ++--
> >  drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c |  4 ++--
> >  drivers/gpu/drm/imx/dcss/dcss-crtc.c            |  4 ++--
> >  drivers/gpu/drm/imx/ipuv3-crtc.c                |  4 ++--
> >  drivers/gpu/drm/ingenic/ingenic-drm-drv.c       | 17 +++++++++--------
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c         | 16 ++++++++--------
> >  drivers/gpu/drm/meson/meson_crtc.c              |  4 ++--
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c        |  4 ++--
> >  drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c       |  4 ++--
> >  drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c       |  4 ++--
> >  drivers/gpu/drm/mxsfb/mxsfb_kms.c               |  2 +-
> >  drivers/gpu/drm/omapdrm/omap_crtc.c             |  4 ++--
> >  drivers/gpu/drm/qxl/qxl_display.c               |  2 +-
> >  drivers/gpu/drm/rcar-du/rcar_du_crtc.c          |  4 ++--
> >  drivers/gpu/drm/rockchip/rockchip_drm_vop.c     |  8 ++++++--
> >  drivers/gpu/drm/sti/sti_crtc.c                  |  2 +-
> >  drivers/gpu/drm/stm/ltdc.c                      |  2 +-
> >  drivers/gpu/drm/sun4i/sun4i_crtc.c              |  6 ++++--
> >  drivers/gpu/drm/tegra/dc.c                      | 10 +++++-----
> >  drivers/gpu/drm/tidss/tidss_crtc.c              |  4 +++-
> >  drivers/gpu/drm/tilcdc/tilcdc_crtc.c            |  2 +-
> >  drivers/gpu/drm/vboxvideo/vbox_mode.c           |  2 +-
> >  drivers/gpu/drm/vc4/vc4_drv.h                   |  3 ++-
> >  drivers/gpu/drm/vc4/vc4_hvs.c                   |  4 +++-
> >  drivers/gpu/drm/virtio/virtgpu_display.c        |  2 +-
> >  drivers/gpu/drm/vkms/vkms_crtc.c                |  4 ++--
> >  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c             |  4 ++--
> >  drivers/gpu/drm/vmwgfx/vmwgfx_kms.h             |  4 ++--
> >  drivers/gpu/drm/xlnx/zynqmp_disp.c              |  4 ++--
> >  drivers/gpu/drm/zte/zx_vou.c                    |  2 +-
> >  include/drm/drm_modeset_helper_vtables.h        |  4 ++--
> >  39 files changed, 97 insertions(+), 80 deletions(-)
> > =

> > diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers=
/gpu/drm/arm/display/komeda/komeda_crtc.c
> > index cc65623b5455..df0b9eeb8933 100644
> > --- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> > +++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> > @@ -385,8 +385,10 @@ komeda_crtc_atomic_disable(struct drm_crtc *crtc,
> >  =

> >  static void
> >  komeda_crtc_atomic_flush(struct drm_crtc *crtc,
> > -			 struct drm_crtc_state *old)
> > +			 struct drm_atomic_state *state)
> >  {
> > +	struct drm_crtc_state *old =3D drm_atomic_get_old_crtc_state(state,
> > +								   crtc);
> >  	/* commit with modeset will be handled in enable/disable */
> >  	if (drm_atomic_crtc_needs_modeset(crtc->state))
> >  		return;
> > diff --git a/drivers/gpu/drm/arm/hdlcd_crtc.c b/drivers/gpu/drm/arm/hdl=
cd_crtc.c
> > index 84ac10d59485..a3234bfb0917 100644
> > --- a/drivers/gpu/drm/arm/hdlcd_crtc.c
> > +++ b/drivers/gpu/drm/arm/hdlcd_crtc.c
> > @@ -205,7 +205,7 @@ static enum drm_mode_status hdlcd_crtc_mode_valid(s=
truct drm_crtc *crtc,
> >  }
> >  =

> >  static void hdlcd_crtc_atomic_begin(struct drm_crtc *crtc,
> > -				    struct drm_crtc_state *state)
> > +				    struct drm_atomic_state *state)
> >  {
> >  	struct drm_pending_vblank_event *event =3D crtc->state->event;
> >  =

> > diff --git a/drivers/gpu/drm/armada/armada_crtc.c b/drivers/gpu/drm/arm=
ada/armada_crtc.c
> > index d22ca1496c43..ca643f4e2064 100644
> > --- a/drivers/gpu/drm/armada/armada_crtc.c
> > +++ b/drivers/gpu/drm/armada/armada_crtc.c
> > @@ -429,7 +429,7 @@ static int armada_drm_crtc_atomic_check(struct drm_=
crtc *crtc,
> >  }
> >  =

> >  static void armada_drm_crtc_atomic_begin(struct drm_crtc *crtc,
> > -					 struct drm_crtc_state *old_crtc_state)
> > +					 struct drm_atomic_state *state)
> >  {
> >  	struct armada_crtc *dcrtc =3D drm_to_armada_crtc(crtc);
> >  =

> > @@ -443,7 +443,7 @@ static void armada_drm_crtc_atomic_begin(struct drm=
_crtc *crtc,
> >  }
> >  =

> >  static void armada_drm_crtc_atomic_flush(struct drm_crtc *crtc,
> > -					 struct drm_crtc_state *old_crtc_state)
> > +					 struct drm_atomic_state *state)
> >  {
> >  	struct armada_crtc *dcrtc =3D drm_to_armada_crtc(crtc);
> >  =

> > diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_m=
ode.c
> > index 346dce2d654f..bca03a1a5db7 100644
> > --- a/drivers/gpu/drm/ast/ast_mode.c
> > +++ b/drivers/gpu/drm/ast/ast_mode.c
> > @@ -779,8 +779,11 @@ static int ast_crtc_helper_atomic_check(struct drm=
_crtc *crtc,
> >  }
> >  =

> >  static void
> > -ast_crtc_helper_atomic_flush(struct drm_crtc *crtc, struct drm_crtc_st=
ate *old_crtc_state)
> > +ast_crtc_helper_atomic_flush(struct drm_crtc *crtc,
> > +		             struct drm_atomic_state *state)
> >  {
> > +	struct drm_crtc_state *old_crtc_state =3D drm_atomic_get_old_crtc_sta=
te(state,
> > +								              crtc);
> >  	struct ast_private *ast =3D to_ast_private(crtc->dev);
> >  	struct ast_crtc_state *ast_crtc_state =3D to_ast_crtc_state(crtc->sta=
te);
> >  	struct ast_crtc_state *old_ast_crtc_state =3D to_ast_crtc_state(old_c=
rtc_state);
> > diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/g=
pu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> > index 0e533ded2a96..c17571a3cc2b 100644
> > --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> > +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> > @@ -342,7 +342,7 @@ static int atmel_hlcdc_crtc_atomic_check(struct drm=
_crtc *c,
> >  }
> >  =

> >  static void atmel_hlcdc_crtc_atomic_begin(struct drm_crtc *c,
> > -					  struct drm_crtc_state *old_s)
> > +					  struct drm_atomic_state *state)
> >  {
> >  	struct atmel_hlcdc_crtc *crtc =3D drm_crtc_to_atmel_hlcdc_crtc(c);
> >  =

> > @@ -357,7 +357,7 @@ static void atmel_hlcdc_crtc_atomic_begin(struct dr=
m_crtc *c,
> >  }
> >  =

> >  static void atmel_hlcdc_crtc_atomic_flush(struct drm_crtc *crtc,
> > -					  struct drm_crtc_state *old_s)
> > +					  struct drm_atomic_state *state)
> >  {
> >  	/* TODO: write common plane control register if available */
> >  }
> > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_=
atomic_helper.c
> > index 12d8095318d0..ddd0e3239150 100644
> > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > @@ -2521,7 +2521,7 @@ void drm_atomic_helper_commit_planes(struct drm_d=
evice *dev,
> >  		if (active_only && !new_crtc_state->active)
> >  			continue;
> >  =

> > -		funcs->atomic_begin(crtc, old_crtc_state);
> > +		funcs->atomic_begin(crtc, old_state);
> >  	}
> >  =

> >  	for_each_oldnew_plane_in_state(old_state, plane, old_plane_state, new=
_plane_state, i) {
> > @@ -2579,7 +2579,7 @@ void drm_atomic_helper_commit_planes(struct drm_d=
evice *dev,
> >  		if (active_only && !new_crtc_state->active)
> >  			continue;
> >  =

> > -		funcs->atomic_flush(crtc, old_crtc_state);
> > +		funcs->atomic_flush(crtc, old_state);
> >  	}
> >  }
> >  EXPORT_SYMBOL(drm_atomic_helper_commit_planes);
> > @@ -2617,7 +2617,7 @@ drm_atomic_helper_commit_planes_on_crtc(struct dr=
m_crtc_state *old_crtc_state)
> >  =

> >  	crtc_funcs =3D crtc->helper_private;
> >  	if (crtc_funcs && crtc_funcs->atomic_begin)
> > -		crtc_funcs->atomic_begin(crtc, old_crtc_state);
> > +		crtc_funcs->atomic_begin(crtc, old_state);
> >  =

> >  	drm_for_each_plane_mask(plane, crtc->dev, plane_mask) {
> >  		struct drm_plane_state *old_plane_state =3D
> > @@ -2643,7 +2643,7 @@ drm_atomic_helper_commit_planes_on_crtc(struct dr=
m_crtc_state *old_crtc_state)
> >  	}
> >  =

> >  	if (crtc_funcs && crtc_funcs->atomic_flush)
> > -		crtc_funcs->atomic_flush(crtc, old_crtc_state);
> > +		crtc_funcs->atomic_flush(crtc, old_state);
> >  }
> >  EXPORT_SYMBOL(drm_atomic_helper_commit_planes_on_crtc);
> >  =

> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm=
/exynos/exynos_drm_crtc.c
> > index 928f764efce8..4153f302de7c 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> > @@ -65,7 +65,7 @@ static int exynos_crtc_atomic_check(struct drm_crtc *=
crtc,
> >  }
> >  =

> >  static void exynos_crtc_atomic_begin(struct drm_crtc *crtc,
> > -				     struct drm_crtc_state *old_crtc_state)
> > +				     struct drm_atomic_state *state)
> >  {
> >  	struct exynos_drm_crtc *exynos_crtc =3D to_exynos_crtc(crtc);
> >  =

> > @@ -74,7 +74,7 @@ static void exynos_crtc_atomic_begin(struct drm_crtc =
*crtc,
> >  }
> >  =

> >  static void exynos_crtc_atomic_flush(struct drm_crtc *crtc,
> > -				     struct drm_crtc_state *old_crtc_state)
> > +				     struct drm_atomic_state *state)
> >  {
> >  	struct exynos_drm_crtc *exynos_crtc =3D to_exynos_crtc(crtc);
> >  =

> > diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c b/drivers/gpu/d=
rm/fsl-dcu/fsl_dcu_drm_crtc.c
> > index 7a9e89cfdf9c..2af60d98f48f 100644
> > --- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c
> > +++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c
> > @@ -21,7 +21,7 @@
> >  #include "fsl_dcu_drm_plane.h"
> >  =

> >  static void fsl_dcu_drm_crtc_atomic_flush(struct drm_crtc *crtc,
> > -					  struct drm_crtc_state *old_crtc_state)
> > +					  struct drm_atomic_state *state)
> >  {
> >  	struct drm_device *dev =3D crtc->dev;
> >  	struct fsl_dcu_drm_device *fsl_dev =3D dev->dev_private;
> > diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c b/drivers/g=
pu/drm/hisilicon/hibmc/hibmc_drm_de.c
> > index a1eabadf5adb..3c65151f4451 100644
> > --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
> > +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
> > @@ -390,7 +390,7 @@ static void hibmc_crtc_mode_set_nofb(struct drm_crt=
c *crtc)
> >  }
> >  =

> >  static void hibmc_crtc_atomic_begin(struct drm_crtc *crtc,
> > -				    struct drm_crtc_state *old_state)
> > +				    struct drm_atomic_state *state)
> >  {
> >  	u32 reg;
> >  	struct drm_device *dev =3D crtc->dev;
> > @@ -410,7 +410,7 @@ static void hibmc_crtc_atomic_begin(struct drm_crtc=
 *crtc,
> >  }
> >  =

> >  static void hibmc_crtc_atomic_flush(struct drm_crtc *crtc,
> > -				    struct drm_crtc_state *old_state)
> > +				    struct drm_atomic_state *state)
> >  =

> >  {
> >  	unsigned long flags;
> > diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c b/drivers/=
gpu/drm/hisilicon/kirin/kirin_drm_ade.c
> > index cfe8ff596d55..d84d41f3e78f 100644
> > --- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
> > +++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
> > @@ -485,7 +485,7 @@ static void ade_crtc_mode_set_nofb(struct drm_crtc =
*crtc)
> >  }
> >  =

> >  static void ade_crtc_atomic_begin(struct drm_crtc *crtc,
> > -				  struct drm_crtc_state *old_state)
> > +				  struct drm_atomic_state *state)
> >  {
> >  	struct kirin_crtc *kcrtc =3D to_kirin_crtc(crtc);
> >  	struct ade_hw_ctx *ctx =3D kcrtc->hw_ctx;
> > @@ -498,7 +498,7 @@ static void ade_crtc_atomic_begin(struct drm_crtc *=
crtc,
> >  }
> >  =

> >  static void ade_crtc_atomic_flush(struct drm_crtc *crtc,
> > -				  struct drm_crtc_state *old_state)
> > +				  struct drm_atomic_state *state)
> >  =

> >  {
> >  	struct kirin_crtc *kcrtc =3D to_kirin_crtc(crtc);
> > diff --git a/drivers/gpu/drm/imx/dcss/dcss-crtc.c b/drivers/gpu/drm/imx=
/dcss/dcss-crtc.c
> > index 8f570eb5f471..31267c00782f 100644
> > --- a/drivers/gpu/drm/imx/dcss/dcss-crtc.c
> > +++ b/drivers/gpu/drm/imx/dcss/dcss-crtc.c
> > @@ -53,13 +53,13 @@ static const struct drm_crtc_funcs dcss_crtc_funcs =
=3D {
> >  };
> >  =

> >  static void dcss_crtc_atomic_begin(struct drm_crtc *crtc,
> > -				   struct drm_crtc_state *old_crtc_state)
> > +				   struct drm_atomic_state *state)
> >  {
> >  	drm_crtc_vblank_on(crtc);
> >  }
> >  =

> >  static void dcss_crtc_atomic_flush(struct drm_crtc *crtc,
> > -				   struct drm_crtc_state *old_crtc_state)
> > +				   struct drm_atomic_state *state)
> >  {
> >  	struct dcss_crtc *dcss_crtc =3D container_of(crtc, struct dcss_crtc,
> >  						   base);
> > diff --git a/drivers/gpu/drm/imx/ipuv3-crtc.c b/drivers/gpu/drm/imx/ipu=
v3-crtc.c
> > index b6d864d7a0df..7ebd99ee3240 100644
> > --- a/drivers/gpu/drm/imx/ipuv3-crtc.c
> > +++ b/drivers/gpu/drm/imx/ipuv3-crtc.c
> > @@ -240,13 +240,13 @@ static int ipu_crtc_atomic_check(struct drm_crtc =
*crtc,
> >  }
> >  =

> >  static void ipu_crtc_atomic_begin(struct drm_crtc *crtc,
> > -				  struct drm_crtc_state *old_crtc_state)
> > +				  struct drm_atomic_state *state)
> >  {
> >  	drm_crtc_vblank_on(crtc);
> >  }
> >  =

> >  static void ipu_crtc_atomic_flush(struct drm_crtc *crtc,
> > -				  struct drm_crtc_state *old_crtc_state)
> > +				  struct drm_atomic_state *state)
> >  {
> >  	spin_lock_irq(&crtc->dev->event_lock);
> >  	if (crtc->state->event) {
> > diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/dr=
m/ingenic/ingenic-drm-drv.c
> > index aaa324bd5572..b9c156e13156 100644
> > --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > @@ -303,7 +303,7 @@ ingenic_drm_crtc_mode_valid(struct drm_crtc *crtc, =
const struct drm_display_mode
> >  }
> >  =

> >  static void ingenic_drm_crtc_atomic_begin(struct drm_crtc *crtc,
> > -					  struct drm_crtc_state *oldstate)
> > +					  struct drm_atomic_state *state)
> >  {
> >  	struct ingenic_drm *priv =3D drm_crtc_get_priv(crtc);
> >  	u32 ctrl =3D 0;
> > @@ -323,26 +323,27 @@ static void ingenic_drm_crtc_atomic_begin(struct =
drm_crtc *crtc,
> >  }
> >  =

> >  static void ingenic_drm_crtc_atomic_flush(struct drm_crtc *crtc,
> > -					  struct drm_crtc_state *oldstate)
> > +					  struct drm_atomic_state *state)
> >  {
> >  	struct ingenic_drm *priv =3D drm_crtc_get_priv(crtc);
> > -	struct drm_crtc_state *state =3D crtc->state;
> > -	struct drm_pending_vblank_event *event =3D state->event;
> > +	struct drm_crtc_state *crtc_state =3D crtc->state;
> =

> I was also confused about when to use the state pointer and when to use
> the look-up functions. But that was answered in the threat already.
 =

Maybe a doc to clarify this in all the various @state comments? It
currently doesn't even mention the new way of gettting at these.
Volunteered?
-Daniel


> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> =

> Best regards
> Thomas
> =

> > +	struct drm_pending_vblank_event *event =3D crtc_state->event;
> >  =

> > -	if (drm_atomic_crtc_needs_modeset(state)) {
> > -		ingenic_drm_crtc_update_timings(priv, &state->mode);
> > +	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
> > +		ingenic_drm_crtc_update_timings(priv, &crtc_state->mode);
> >  		priv->update_clk_rate =3D true;
> >  	}
> >  =

> >  	if (priv->update_clk_rate) {
> >  		mutex_lock(&priv->clk_mutex);
> > -		clk_set_rate(priv->pix_clk, state->adjusted_mode.clock * 1000);
> > +		clk_set_rate(priv->pix_clk,
> > +			     crtc_state->adjusted_mode.clock * 1000);
> >  		priv->update_clk_rate =3D false;
> >  		mutex_unlock(&priv->clk_mutex);
> >  	}
> >  =

> >  	if (event) {
> > -		state->event =3D NULL;
> > +		crtc_state->event =3D NULL;
> >  =

> >  		spin_lock_irq(&crtc->dev->event_lock);
> >  		if (drm_crtc_vblank_get(crtc) =3D=3D 0)
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/=
mediatek/mtk_drm_crtc.c
> > index 6fc818049f2d..0fd59dbe5e2d 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > @@ -575,24 +575,24 @@ static void mtk_drm_crtc_atomic_disable(struct dr=
m_crtc *crtc,
> >  }
> >  =

> >  static void mtk_drm_crtc_atomic_begin(struct drm_crtc *crtc,
> > -				      struct drm_crtc_state *old_crtc_state)
> > +				      struct drm_atomic_state *state)
> >  {
> > -	struct mtk_crtc_state *state =3D to_mtk_crtc_state(crtc->state);
> > +	struct mtk_crtc_state *crtc_state =3D to_mtk_crtc_state(crtc->state);
> >  	struct mtk_drm_crtc *mtk_crtc =3D to_mtk_crtc(crtc);
> >  =

> > -	if (mtk_crtc->event && state->base.event)
> > +	if (mtk_crtc->event && crtc_state->base.event)
> >  		DRM_ERROR("new event while there is still a pending event\n");
> >  =

> > -	if (state->base.event) {
> > -		state->base.event->pipe =3D drm_crtc_index(crtc);
> > +	if (crtc_state->base.event) {
> > +		crtc_state->base.event->pipe =3D drm_crtc_index(crtc);
> >  		WARN_ON(drm_crtc_vblank_get(crtc) !=3D 0);
> > -		mtk_crtc->event =3D state->base.event;
> > -		state->base.event =3D NULL;
> > +		mtk_crtc->event =3D crtc_state->base.event;
> > +		crtc_state->base.event =3D NULL;
> >  	}
> >  }
> >  =

> >  static void mtk_drm_crtc_atomic_flush(struct drm_crtc *crtc,
> > -				      struct drm_crtc_state *old_crtc_state)
> > +				      struct drm_atomic_state *state)
> >  {
> >  	struct mtk_drm_crtc *mtk_crtc =3D to_mtk_crtc(crtc);
> >  	int i;
> > diff --git a/drivers/gpu/drm/meson/meson_crtc.c b/drivers/gpu/drm/meson=
/meson_crtc.c
> > index 247ce085886b..d70616da8ce2 100644
> > --- a/drivers/gpu/drm/meson/meson_crtc.c
> > +++ b/drivers/gpu/drm/meson/meson_crtc.c
> > @@ -201,7 +201,7 @@ static void meson_crtc_atomic_disable(struct drm_cr=
tc *crtc,
> >  }
> >  =

> >  static void meson_crtc_atomic_begin(struct drm_crtc *crtc,
> > -				    struct drm_crtc_state *state)
> > +				    struct drm_atomic_state *state)
> >  {
> >  	struct meson_crtc *meson_crtc =3D to_meson_crtc(crtc);
> >  	unsigned long flags;
> > @@ -217,7 +217,7 @@ static void meson_crtc_atomic_begin(struct drm_crtc=
 *crtc,
> >  }
> >  =

> >  static void meson_crtc_atomic_flush(struct drm_crtc *crtc,
> > -				    struct drm_crtc_state *old_crtc_state)
> > +				    struct drm_atomic_state *state)
> >  {
> >  	struct meson_crtc *meson_crtc =3D to_meson_crtc(crtc);
> >  	struct meson_drm *priv =3D meson_crtc->priv;
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm=
/msm/disp/dpu1/dpu_crtc.c
> > index d05aa91bc882..3357317c29d6 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -495,7 +495,7 @@ static void _dpu_crtc_setup_cp_blocks(struct drm_cr=
tc *crtc)
> >  }
> >  =

> >  static void dpu_crtc_atomic_begin(struct drm_crtc *crtc,
> > -		struct drm_crtc_state *old_state)
> > +		struct drm_atomic_state *state)
> >  {
> >  	struct dpu_crtc *dpu_crtc;
> >  	struct dpu_crtc_state *cstate;
> > @@ -557,7 +557,7 @@ static void dpu_crtc_atomic_begin(struct drm_crtc *=
crtc,
> >  }
> >  =

> >  static void dpu_crtc_atomic_flush(struct drm_crtc *crtc,
> > -		struct drm_crtc_state *old_crtc_state)
> > +		struct drm_atomic_state *state)
> >  {
> >  	struct dpu_crtc *dpu_crtc;
> >  	struct drm_device *dev;
> > diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c b/drivers/gpu/dr=
m/msm/disp/mdp4/mdp4_crtc.c
> > index af80f3baf05b..34e3186e236d 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
> > @@ -316,14 +316,14 @@ static int mdp4_crtc_atomic_check(struct drm_crtc=
 *crtc,
> >  }
> >  =

> >  static void mdp4_crtc_atomic_begin(struct drm_crtc *crtc,
> > -				   struct drm_crtc_state *old_crtc_state)
> > +				   struct drm_atomic_state *state)
> >  {
> >  	struct mdp4_crtc *mdp4_crtc =3D to_mdp4_crtc(crtc);
> >  	DBG("%s: begin", mdp4_crtc->name);
> >  }
> >  =

> >  static void mdp4_crtc_atomic_flush(struct drm_crtc *crtc,
> > -				   struct drm_crtc_state *old_crtc_state)
> > +				   struct drm_atomic_state *state)
> >  {
> >  	struct mdp4_crtc *mdp4_crtc =3D to_mdp4_crtc(crtc);
> >  	struct drm_device *dev =3D crtc->dev;
> > diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/dr=
m/msm/disp/mdp5/mdp5_crtc.c
> > index 500f885c0eae..4a53d7b42e9c 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> > @@ -772,13 +772,13 @@ static int mdp5_crtc_atomic_check(struct drm_crtc=
 *crtc,
> >  }
> >  =

> >  static void mdp5_crtc_atomic_begin(struct drm_crtc *crtc,
> > -				   struct drm_crtc_state *old_crtc_state)
> > +				   struct drm_atomic_state *state)
> >  {
> >  	DBG("%s: begin", crtc->name);
> >  }
> >  =

> >  static void mdp5_crtc_atomic_flush(struct drm_crtc *crtc,
> > -				   struct drm_crtc_state *old_crtc_state)
> > +				   struct drm_atomic_state *state)
> >  {
> >  	struct mdp5_crtc *mdp5_crtc =3D to_mdp5_crtc(crtc);
> >  	struct mdp5_crtc_state *mdp5_cstate =3D to_mdp5_crtc_state(crtc->stat=
e);
> > diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/=
mxsfb_kms.c
> > index b0757f84a979..eb0e2b08329b 100644
> > --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> > +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> > @@ -285,7 +285,7 @@ static int mxsfb_crtc_atomic_check(struct drm_crtc =
*crtc,
> >  }
> >  =

> >  static void mxsfb_crtc_atomic_flush(struct drm_crtc *crtc,
> > -				    struct drm_crtc_state *old_state)
> > +				    struct drm_atomic_state *state)
> >  {
> >  	struct drm_pending_vblank_event *event;
> >  =

> > diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omap=
drm/omap_crtc.c
> > index 69a0770ba38e..d7442aa55f89 100644
> > --- a/drivers/gpu/drm/omapdrm/omap_crtc.c
> > +++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
> > @@ -601,12 +601,12 @@ static int omap_crtc_atomic_check(struct drm_crtc=
 *crtc,
> >  }
> >  =

> >  static void omap_crtc_atomic_begin(struct drm_crtc *crtc,
> > -				   struct drm_crtc_state *old_crtc_state)
> > +				   struct drm_atomic_state *state)
> >  {
> >  }
> >  =

> >  static void omap_crtc_atomic_flush(struct drm_crtc *crtc,
> > -				   struct drm_crtc_state *old_crtc_state)
> > +				   struct drm_atomic_state *state)
> >  {
> >  	struct omap_drm_private *priv =3D crtc->dev->dev_private;
> >  	struct omap_crtc *omap_crtc =3D to_omap_crtc(crtc);
> > diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qx=
l_display.c
> > index 45fd76e04bdc..07a3e3c23f09 100644
> > --- a/drivers/gpu/drm/qxl/qxl_display.c
> > +++ b/drivers/gpu/drm/qxl/qxl_display.c
> > @@ -372,7 +372,7 @@ static void qxl_crtc_update_monitors_config(struct =
drm_crtc *crtc,
> >  }
> >  =

> >  static void qxl_crtc_atomic_flush(struct drm_crtc *crtc,
> > -				  struct drm_crtc_state *old_crtc_state)
> > +				  struct drm_atomic_state *state)
> >  {
> >  	qxl_crtc_update_monitors_config(crtc, "flush");
> >  }
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/r=
car-du/rcar_du_crtc.c
> > index 460fb07b786f..b5fb941e0f53 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> > @@ -785,7 +785,7 @@ static void rcar_du_crtc_atomic_disable(struct drm_=
crtc *crtc,
> >  }
> >  =

> >  static void rcar_du_crtc_atomic_begin(struct drm_crtc *crtc,
> > -				      struct drm_crtc_state *old_crtc_state)
> > +				      struct drm_atomic_state *state)
> >  {
> >  	struct rcar_du_crtc *rcrtc =3D to_rcar_crtc(crtc);
> >  =

> > @@ -814,7 +814,7 @@ static void rcar_du_crtc_atomic_begin(struct drm_cr=
tc *crtc,
> >  }
> >  =

> >  static void rcar_du_crtc_atomic_flush(struct drm_crtc *crtc,
> > -				      struct drm_crtc_state *old_crtc_state)
> > +				      struct drm_atomic_state *state)
> >  {
> >  	struct rcar_du_crtc *rcrtc =3D to_rcar_crtc(crtc);
> >  	struct drm_device *dev =3D rcrtc->crtc.dev;
> > diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/=
drm/rockchip/rockchip_drm_vop.c
> > index fcbd758e6531..1c1518d757cb 100644
> > --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> > +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> > @@ -1246,8 +1246,10 @@ static void vop_crtc_gamma_set(struct vop *vop, =
struct drm_crtc *crtc,
> >  }
> >  =

> >  static void vop_crtc_atomic_begin(struct drm_crtc *crtc,
> > -				  struct drm_crtc_state *old_crtc_state)
> > +				  struct drm_atomic_state *state)
> >  {
> > +	struct drm_crtc_state *old_crtc_state =3D drm_atomic_get_old_crtc_sta=
te(state,
> > +								              crtc);
> >  	struct vop *vop =3D to_vop(crtc);
> >  =

> >  	/*
> > @@ -1462,8 +1464,10 @@ static int vop_crtc_atomic_check(struct drm_crtc=
 *crtc,
> >  }
> >  =

> >  static void vop_crtc_atomic_flush(struct drm_crtc *crtc,
> > -				  struct drm_crtc_state *old_crtc_state)
> > +				  struct drm_atomic_state *state)
> >  {
> > +	struct drm_crtc_state *old_crtc_state =3D drm_atomic_get_old_crtc_sta=
te(state,
> > +									      crtc);
> >  	struct drm_atomic_state *old_state =3D old_crtc_state->state;
> >  	struct drm_plane_state *old_plane_state, *new_plane_state;
> >  	struct vop *vop =3D to_vop(crtc);
> > diff --git a/drivers/gpu/drm/sti/sti_crtc.c b/drivers/gpu/drm/sti/sti_c=
rtc.c
> > index 5726746f6d18..409795786f03 100644
> > --- a/drivers/gpu/drm/sti/sti_crtc.c
> > +++ b/drivers/gpu/drm/sti/sti_crtc.c
> > @@ -133,7 +133,7 @@ sti_crtc_mode_set_nofb(struct drm_crtc *crtc)
> >  }
> >  =

> >  static void sti_crtc_atomic_flush(struct drm_crtc *crtc,
> > -				  struct drm_crtc_state *old_crtc_state)
> > +				  struct drm_atomic_state *state)
> >  {
> >  	struct drm_device *drm_dev =3D crtc->dev;
> >  	struct sti_mixer *mixer =3D to_sti_mixer(crtc);
> > diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> > index e9af92d4a74b..3980677435cb 100644
> > --- a/drivers/gpu/drm/stm/ltdc.c
> > +++ b/drivers/gpu/drm/stm/ltdc.c
> > @@ -596,7 +596,7 @@ static void ltdc_crtc_mode_set_nofb(struct drm_crtc=
 *crtc)
> >  }
> >  =

> >  static void ltdc_crtc_atomic_flush(struct drm_crtc *crtc,
> > -				   struct drm_crtc_state *old_crtc_state)
> > +				   struct drm_atomic_state *state)
> >  {
> >  	struct ltdc_device *ldev =3D crtc_to_ltdc(crtc);
> >  	struct drm_device *ddev =3D crtc->dev;
> > diff --git a/drivers/gpu/drm/sun4i/sun4i_crtc.c b/drivers/gpu/drm/sun4i=
/sun4i_crtc.c
> > index 8f91391832db..12e21057b645 100644
> > --- a/drivers/gpu/drm/sun4i/sun4i_crtc.c
> > +++ b/drivers/gpu/drm/sun4i/sun4i_crtc.c
> > @@ -61,8 +61,10 @@ static int sun4i_crtc_atomic_check(struct drm_crtc *=
crtc,
> >  }
> >  =

> >  static void sun4i_crtc_atomic_begin(struct drm_crtc *crtc,
> > -				    struct drm_crtc_state *old_state)
> > +				    struct drm_atomic_state *state)
> >  {
> > +	struct drm_crtc_state *old_state =3D drm_atomic_get_old_crtc_state(st=
ate,
> > +								         crtc);
> >  	struct sun4i_crtc *scrtc =3D drm_crtc_to_sun4i_crtc(crtc);
> >  	struct drm_device *dev =3D crtc->dev;
> >  	struct sunxi_engine *engine =3D scrtc->engine;
> > @@ -82,7 +84,7 @@ static void sun4i_crtc_atomic_begin(struct drm_crtc *=
crtc,
> >  }
> >  =

> >  static void sun4i_crtc_atomic_flush(struct drm_crtc *crtc,
> > -				    struct drm_crtc_state *old_state)
> > +				    struct drm_atomic_state *state)
> >  {
> >  	struct sun4i_crtc *scrtc =3D drm_crtc_to_sun4i_crtc(crtc);
> >  	struct drm_pending_vblank_event *event =3D crtc->state->event;
> > diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> > index 52acc2f8f798..2d86627b0d4e 100644
> > --- a/drivers/gpu/drm/tegra/dc.c
> > +++ b/drivers/gpu/drm/tegra/dc.c
> > @@ -1918,7 +1918,7 @@ static void tegra_crtc_atomic_enable(struct drm_c=
rtc *crtc,
> >  }
> >  =

> >  static void tegra_crtc_atomic_begin(struct drm_crtc *crtc,
> > -				    struct drm_crtc_state *old_crtc_state)
> > +				    struct drm_atomic_state *state)
> >  {
> >  	unsigned long flags;
> >  =

> > @@ -1937,17 +1937,17 @@ static void tegra_crtc_atomic_begin(struct drm_=
crtc *crtc,
> >  }
> >  =

> >  static void tegra_crtc_atomic_flush(struct drm_crtc *crtc,
> > -				    struct drm_crtc_state *old_crtc_state)
> > +				    struct drm_atomic_state *state)
> >  {
> > -	struct tegra_dc_state *state =3D to_dc_state(crtc->state);
> > +	struct tegra_dc_state *crtc_state =3D to_dc_state(crtc->state);
> >  	struct tegra_dc *dc =3D to_tegra_dc(crtc);
> >  	u32 value;
> >  =

> > -	value =3D state->planes << 8 | GENERAL_UPDATE;
> > +	value =3D crtc_state->planes << 8 | GENERAL_UPDATE;
> >  	tegra_dc_writel(dc, value, DC_CMD_STATE_CONTROL);
> >  	value =3D tegra_dc_readl(dc, DC_CMD_STATE_CONTROL);
> >  =

> > -	value =3D state->planes | GENERAL_ACT_REQ;
> > +	value =3D crtc_state->planes | GENERAL_ACT_REQ;
> >  	tegra_dc_writel(dc, value, DC_CMD_STATE_CONTROL);
> >  	value =3D tegra_dc_readl(dc, DC_CMD_STATE_CONTROL);
> >  }
> > diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss=
/tidss_crtc.c
> > index 6739f489dfdf..2218da3b3ca3 100644
> > --- a/drivers/gpu/drm/tidss/tidss_crtc.c
> > +++ b/drivers/gpu/drm/tidss/tidss_crtc.c
> > @@ -163,8 +163,10 @@ static void tidss_crtc_position_planes(struct tids=
s_device *tidss,
> >  }
> >  =

> >  static void tidss_crtc_atomic_flush(struct drm_crtc *crtc,
> > -				    struct drm_crtc_state *old_crtc_state)
> > +				    struct drm_atomic_state *state)
> >  {
> > +	struct drm_crtc_state *old_crtc_state =3D drm_atomic_get_old_crtc_sta=
te(state,
> > +									      crtc);
> >  	struct tidss_crtc *tcrtc =3D to_tidss_crtc(crtc);
> >  	struct drm_device *ddev =3D crtc->dev;
> >  	struct tidss_device *tidss =3D to_tidss(ddev);
> > diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/til=
cdc/tilcdc_crtc.c
> > index d87a9fd4a203..40c59f4bd962 100644
> > --- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> > +++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> > @@ -535,7 +535,7 @@ static void tilcdc_crtc_atomic_disable(struct drm_c=
rtc *crtc,
> >  }
> >  =

> >  static void tilcdc_crtc_atomic_flush(struct drm_crtc *crtc,
> > -				     struct drm_crtc_state *old_state)
> > +				     struct drm_atomic_state *state)
> >  {
> >  	if (!crtc->state->event)
> >  		return;
> > diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vb=
oxvideo/vbox_mode.c
> > index 931c55126148..322bf7133ba1 100644
> > --- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
> > +++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
> > @@ -223,7 +223,7 @@ static void vbox_crtc_atomic_disable(struct drm_crt=
c *crtc,
> >  }
> >  =

> >  static void vbox_crtc_atomic_flush(struct drm_crtc *crtc,
> > -				   struct drm_crtc_state *old_crtc_state)
> > +				   struct drm_atomic_state *state)
> >  {
> >  }
> >  =

> > diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_dr=
v.h
> > index a22478a35199..ada11311e613 100644
> > --- a/drivers/gpu/drm/vc4/vc4_drv.h
> > +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> > @@ -914,7 +914,8 @@ int vc4_hvs_get_fifo_from_output(struct drm_device =
*dev, unsigned int output);
> >  int vc4_hvs_atomic_check(struct drm_crtc *crtc, struct drm_crtc_state =
*state);
> >  void vc4_hvs_atomic_enable(struct drm_crtc *crtc, struct drm_crtc_stat=
e *old_state);
> >  void vc4_hvs_atomic_disable(struct drm_crtc *crtc, struct drm_crtc_sta=
te *old_state);
> > -void vc4_hvs_atomic_flush(struct drm_crtc *crtc, struct drm_crtc_state=
 *state);
> > +void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
> > +			  struct drm_atomic_state *state);
> >  void vc4_hvs_dump_state(struct drm_device *dev);
> >  void vc4_hvs_unmask_underrun(struct drm_device *dev, int channel);
> >  void vc4_hvs_mask_underrun(struct drm_device *dev, int channel);
> > diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hv=
s.c
> > index 4d0a833366ce..0bd5ea435120 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hvs.c
> > +++ b/drivers/gpu/drm/vc4/vc4_hvs.c
> > @@ -414,8 +414,10 @@ void vc4_hvs_atomic_disable(struct drm_crtc *crtc,
> >  }
> >  =

> >  void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
> > -			  struct drm_crtc_state *old_state)
> > +			  struct drm_atomic_state *state)
> >  {
> > +	struct drm_crtc_state *old_state =3D drm_atomic_get_old_crtc_state(st=
ate,
> > +									 crtc);
> >  	struct drm_device *dev =3D crtc->dev;
> >  	struct vc4_dev *vc4 =3D to_vc4_dev(dev);
> >  	struct vc4_crtc_state *vc4_state =3D to_vc4_crtc_state(crtc->state);
> > diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm=
/virtio/virtgpu_display.c
> > index e81183ab87e0..4bf74836bd53 100644
> > --- a/drivers/gpu/drm/virtio/virtgpu_display.c
> > +++ b/drivers/gpu/drm/virtio/virtgpu_display.c
> > @@ -117,7 +117,7 @@ static int virtio_gpu_crtc_atomic_check(struct drm_=
crtc *crtc,
> >  }
> >  =

> >  static void virtio_gpu_crtc_atomic_flush(struct drm_crtc *crtc,
> > -					 struct drm_crtc_state *old_state)
> > +					 struct drm_atomic_state *state)
> >  {
> >  	struct virtio_gpu_output *output =3D drm_crtc_to_virtio_gpu_output(cr=
tc);
> >  =

> > diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vk=
ms_crtc.c
> > index 6a49e70bdf18..0443b7deeaef 100644
> > --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> > +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> > @@ -228,7 +228,7 @@ static void vkms_crtc_atomic_disable(struct drm_crt=
c *crtc,
> >  }
> >  =

> >  static void vkms_crtc_atomic_begin(struct drm_crtc *crtc,
> > -				   struct drm_crtc_state *old_crtc_state)
> > +				   struct drm_atomic_state *state)
> >  {
> >  	struct vkms_output *vkms_output =3D drm_crtc_to_vkms_output(crtc);
> >  =

> > @@ -239,7 +239,7 @@ static void vkms_crtc_atomic_begin(struct drm_crtc =
*crtc,
> >  }
> >  =

> >  static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
> > -				   struct drm_crtc_state *old_crtc_state)
> > +				   struct drm_atomic_state *state)
> >  {
> >  	struct vkms_output *vkms_output =3D drm_crtc_to_vkms_output(crtc);
> >  =

> > diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwg=
fx/vmwgfx_kms.c
> > index a74c9454ade2..bc67f2b930e1 100644
> > --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> > +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> > @@ -554,13 +554,13 @@ int vmw_du_crtc_atomic_check(struct drm_crtc *crt=
c,
> >  =

> >  =

> >  void vmw_du_crtc_atomic_begin(struct drm_crtc *crtc,
> > -			      struct drm_crtc_state *old_crtc_state)
> > +			      struct drm_atomic_state *state)
> >  {
> >  }
> >  =

> >  =

> >  void vmw_du_crtc_atomic_flush(struct drm_crtc *crtc,
> > -			      struct drm_crtc_state *old_crtc_state)
> > +			      struct drm_atomic_state *state)
> >  {
> >  	struct drm_pending_vblank_event *event =3D crtc->state->event;
> >  =

> > diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h b/drivers/gpu/drm/vmwg=
fx/vmwgfx_kms.h
> > index b3d4e7b4c8c5..03f3694015ce 100644
> > --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
> > +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
> > @@ -475,9 +475,9 @@ void vmw_du_plane_unpin_surf(struct vmw_plane_state=
 *vps,
> >  int vmw_du_crtc_atomic_check(struct drm_crtc *crtc,
> >  			     struct drm_atomic_state *state);
> >  void vmw_du_crtc_atomic_begin(struct drm_crtc *crtc,
> > -			      struct drm_crtc_state *old_crtc_state);
> > +			      struct drm_atomic_state *state);
> >  void vmw_du_crtc_atomic_flush(struct drm_crtc *crtc,
> > -			      struct drm_crtc_state *old_crtc_state);
> > +			      struct drm_atomic_state *state);
> >  void vmw_du_crtc_reset(struct drm_crtc *crtc);
> >  struct drm_crtc_state *vmw_du_crtc_duplicate_state(struct drm_crtc *cr=
tc);
> >  void vmw_du_crtc_destroy_state(struct drm_crtc *crtc,
> > diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/=
zynqmp_disp.c
> > index 12d3877b3685..0915cf2c97ac 100644
> > --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> > +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> > @@ -1515,14 +1515,14 @@ static int zynqmp_disp_crtc_atomic_check(struct=
 drm_crtc *crtc,
> >  =

> >  static void
> >  zynqmp_disp_crtc_atomic_begin(struct drm_crtc *crtc,
> > -			      struct drm_crtc_state *old_crtc_state)
> > +			      struct drm_atomic_state *state)
> >  {
> >  	drm_crtc_vblank_on(crtc);
> >  }
> >  =

> >  static void
> >  zynqmp_disp_crtc_atomic_flush(struct drm_crtc *crtc,
> > -			      struct drm_crtc_state *old_crtc_state)
> > +			      struct drm_atomic_state *state)
> >  {
> >  	if (crtc->state->event) {
> >  		struct drm_pending_vblank_event *event;
> > diff --git a/drivers/gpu/drm/zte/zx_vou.c b/drivers/gpu/drm/zte/zx_vou.c
> > index d2a529eba3c9..904f62f3bfc1 100644
> > --- a/drivers/gpu/drm/zte/zx_vou.c
> > +++ b/drivers/gpu/drm/zte/zx_vou.c
> > @@ -473,7 +473,7 @@ static void zx_crtc_atomic_disable(struct drm_crtc =
*crtc,
> >  }
> >  =

> >  static void zx_crtc_atomic_flush(struct drm_crtc *crtc,
> > -				  struct drm_crtc_state *old_state)
> > +				  struct drm_atomic_state *state)
> >  {
> >  	struct drm_pending_vblank_event *event =3D crtc->state->event;
> >  =

> > diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm=
_modeset_helper_vtables.h
> > index b97441deaf93..f2de050085be 100644
> > --- a/include/drm/drm_modeset_helper_vtables.h
> > +++ b/include/drm/drm_modeset_helper_vtables.h
> > @@ -373,7 +373,7 @@ struct drm_crtc_helper_funcs {
> >  	 * transitional plane helpers, but it is optional.
> >  	 */
> >  	void (*atomic_begin)(struct drm_crtc *crtc,
> > -			     struct drm_crtc_state *old_crtc_state);
> > +			     struct drm_atomic_state *state);
> >  	/**
> >  	 * @atomic_flush:
> >  	 *
> > @@ -397,7 +397,7 @@ struct drm_crtc_helper_funcs {
> >  	 * transitional plane helpers, but it is optional.
> >  	 */
> >  	void (*atomic_flush)(struct drm_crtc *crtc,
> > -			     struct drm_crtc_state *old_crtc_state);
> > +			     struct drm_atomic_state *state);
> >  =

> >  	/**
> >  	 * @atomic_enable:
> > =

> =

> -- =

> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer






> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
