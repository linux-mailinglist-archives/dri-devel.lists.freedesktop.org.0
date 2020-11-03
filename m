Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7462A2A4B69
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 17:28:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FCEA6ECB0;
	Tue,  3 Nov 2020 16:28:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EAAA6ECB0
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 16:28:28 +0000 (UTC)
IronPort-SDR: 99OXK8DaBMawYncr8SHgB3vInmkOrHC9S4Ve/Q5p3AjwvokqJeHJKYWr0QQwRmqayFQyS69qwe
 FiyjOAVzQyNA==
X-IronPort-AV: E=McAfee;i="6000,8403,9794"; a="156861120"
X-IronPort-AV: E=Sophos;i="5.77,448,1596524400"; d="scan'208";a="156861120"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2020 08:28:27 -0800
IronPort-SDR: epQQtYr0yPLaNJ/Uj1KDzID3Vyfu+yyu623YIv7jQNPet3kHSnswCf1hkjsHXUhpTZN3D5+mKY
 fBB21T3dTHCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,448,1596524400"; d="scan'208";a="363087295"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 03 Nov 2020 08:28:25 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 03 Nov 2020 18:28:24 +0200
Date: Tue, 3 Nov 2020 18:28:24 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 2/3] drm: Use state helper instead of CRTC state pointer
Message-ID: <20201103162824.GR6112@intel.com>
References: <20201102133834.1176740-1-maxime@cerno.tech>
 <20201102133834.1176740-2-maxime@cerno.tech>
 <20201102160406.GN6112@intel.com>
 <20201103161551.tokfhcsfjtgli7wm@gilmour.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201103161551.tokfhcsfjtgli7wm@gilmour.lan>
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

On Tue, Nov 03, 2020 at 05:15:51PM +0100, Maxime Ripard wrote:
> Hi Ville,
> =

> On Mon, Nov 02, 2020 at 06:04:06PM +0200, Ville Syrj=E4l=E4 wrote:
> > On Mon, Nov 02, 2020 at 02:38:33PM +0100, Maxime Ripard wrote:
> > > Many drivers reference the crtc->pointer in order to get the current =
CRTC
> > > state in their atomic_begin or atomic_flush hooks, which would be the=
 new
> > > CRTC state in the global atomic state since _swap_state happened when=
 those
> > > hooks are run.
> > > =

> > > Use the drm_atomic_get_new_crtc_state helper to get that state to mak=
e it
> > > more obvious.
> > > =

> > > This was made using the coccinelle script below:
> > > =

> > > @ crtc_atomic_func @
> > > identifier helpers;
> > > identifier func;
> > > @@
> > > =

> > > (
> > > static struct drm_crtc_helper_funcs helpers =3D {
> > > 	...,
> > > 	.atomic_begin =3D func,
> > > 	...,
> > > };
> > > |
> > > static struct drm_crtc_helper_funcs helpers =3D {
> > > 	...,
> > > 	.atomic_flush =3D func,
> > > 	...,
> > > };
> > > )
> > > =

> > > @@
> > > identifier crtc_atomic_func.func;
> > > identifier crtc, state;
> > > symbol crtc_state;
> > > expression e;
> > > @@
> > > =

> > >   func(struct drm_crtc *crtc, struct drm_atomic_state *state) {
> > >   ...
> > > - struct tegra_dc_state *crtc_state =3D e;
> > > + struct tegra_dc_state *dc_state =3D e;
> > >   <+...
> > > -       crtc_state
> > > +	dc_state
> > >   ...+>
> > >   }
> > > =

> > > @@
> > > identifier crtc_atomic_func.func;
> > > identifier crtc, state;
> > > symbol crtc_state;
> > > expression e;
> > > @@
> > > =

> > >   func(struct drm_crtc *crtc, struct drm_atomic_state *state) {
> > >   ...
> > > - struct mtk_crtc_state *crtc_state =3D e;
> > > + struct mtk_crtc_state *mtk_crtc_state =3D e;
> > >   <+...
> > > -       crtc_state
> > > +	mtk_crtc_state
> > >   ...+>
> > >   }
> > =

> > These reanames seem a bit out of scpe for this patch. But I guess you
> > needed then to get the rest of the cocci to work on some drivers?
> =

> Yeah, those two drivers already had a variable named crtc_state, calling
> container_of on crtc->state
> =

> It was cleaner to me to have an intermediate variable storing the result
> of drm_atomic_get_new_crtc_state, but then the most obvious name was
> taken so I had to rename those two variables before doing so.
> =

> > The basic idea looks good:
> > Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > =

> > But I guess up to the individual driver folks to bikeshed the variable
> > naming and whatnot.
> > =

> > One thing I spotted is that a few drivers now gained two aliasing crtc
> > state pointers in the function: one with the drm type, the other with
> > a driver specific type. That's something we've outlawed in i915 since
> > it was making life rather confusing. In i915 we now prefer to use only
> > the i915 specific types in most places.
> =

> I didn't spot any of those cases, do you have an example of where it
> happened?

eg. ast:
+       struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state=
(state,                               =

+                                                                         c=
rtc);                               =

        struct drm_crtc_state *old_crtc_state =3D drm_atomic_get_old_crtc_s=
tate(state,                           =

                                                                           =
   crtc);                           =

        struct ast_private *ast =3D to_ast_private(crtc->dev);             =
                                      =

-       struct ast_crtc_state *ast_crtc_state =3D to_ast_crtc_state(crtc->s=
tate);                                =

+       struct ast_crtc_state *ast_crtc_state =3D to_ast_crtc_state(crtc_st=
ate);       =


So here both 'crtc_state' and 'ast_crtc_state' are basically the same
thing, which can get a bit confusing especially within larger functions
with lots of variables. =


In i915 we would just have
struct intel_crtc_state *crtc_state =3D whatever;
and any access to the base class would be done via crtc_state->base.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
