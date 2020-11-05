Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D25C2A841D
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 17:56:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 221326EDD5;
	Thu,  5 Nov 2020 16:56:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A411C6EDD5
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 16:56:42 +0000 (UTC)
IronPort-SDR: BrxB2i3fkhVvUFDxcN8Ml6GqEz1b9ipW1XEL/ZF4CTXUuZPS0RiGKZoLLafYzM/EZPwFB1oUri
 2nj0/bOOOY4w==
X-IronPort-AV: E=McAfee;i="6000,8403,9796"; a="187326407"
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; d="scan'208";a="187326407"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2020 08:56:42 -0800
IronPort-SDR: nwlx9oFFDRatX9dvZt8ulbAkDk9A6PsuAUo22HTvGxwJ0LzOQRcjxQdat7tZ9rNgDOkscA3yAi
 jlUeFw1HYvcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; d="scan'208";a="364407017"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 05 Nov 2020 08:56:38 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 05 Nov 2020 18:56:38 +0200
Date: Thu, 5 Nov 2020 18:56:37 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 2/3] drm: Use state helper instead of CRTC state pointer
Message-ID: <20201105165637.GB6112@intel.com>
References: <20201102133834.1176740-1-maxime@cerno.tech>
 <20201102133834.1176740-2-maxime@cerno.tech>
 <20201102160406.GN6112@intel.com>
 <20201103161551.tokfhcsfjtgli7wm@gilmour.lan>
 <20201103162824.GR6112@intel.com>
 <20201105163528.lghgwaigdmir7ujt@gilmour.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105163528.lghgwaigdmir7ujt@gilmour.lan>
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

On Thu, Nov 05, 2020 at 05:35:28PM +0100, Maxime Ripard wrote:
> On Tue, Nov 03, 2020 at 06:28:24PM +0200, Ville Syrj=E4l=E4 wrote:
> > On Tue, Nov 03, 2020 at 05:15:51PM +0100, Maxime Ripard wrote:
> > > Hi Ville,
> > > =

> > > On Mon, Nov 02, 2020 at 06:04:06PM +0200, Ville Syrj=E4l=E4 wrote:
> > > > On Mon, Nov 02, 2020 at 02:38:33PM +0100, Maxime Ripard wrote:
> > > > > Many drivers reference the crtc->pointer in order to get the curr=
ent CRTC
> > > > > state in their atomic_begin or atomic_flush hooks, which would be=
 the new
> > > > > CRTC state in the global atomic state since _swap_state happened =
when those
> > > > > hooks are run.
> > > > > =

> > > > > Use the drm_atomic_get_new_crtc_state helper to get that state to=
 make it
> > > > > more obvious.
> > > > > =

> > > > > This was made using the coccinelle script below:
> > > > > =

> > > > > @ crtc_atomic_func @
> > > > > identifier helpers;
> > > > > identifier func;
> > > > > @@
> > > > > =

> > > > > (
> > > > > static struct drm_crtc_helper_funcs helpers =3D {
> > > > > 	...,
> > > > > 	.atomic_begin =3D func,
> > > > > 	...,
> > > > > };
> > > > > |
> > > > > static struct drm_crtc_helper_funcs helpers =3D {
> > > > > 	...,
> > > > > 	.atomic_flush =3D func,
> > > > > 	...,
> > > > > };
> > > > > )
> > > > > =

> > > > > @@
> > > > > identifier crtc_atomic_func.func;
> > > > > identifier crtc, state;
> > > > > symbol crtc_state;
> > > > > expression e;
> > > > > @@
> > > > > =

> > > > >   func(struct drm_crtc *crtc, struct drm_atomic_state *state) {
> > > > >   ...
> > > > > - struct tegra_dc_state *crtc_state =3D e;
> > > > > + struct tegra_dc_state *dc_state =3D e;
> > > > >   <+...
> > > > > -       crtc_state
> > > > > +	dc_state
> > > > >   ...+>
> > > > >   }
> > > > > =

> > > > > @@
> > > > > identifier crtc_atomic_func.func;
> > > > > identifier crtc, state;
> > > > > symbol crtc_state;
> > > > > expression e;
> > > > > @@
> > > > > =

> > > > >   func(struct drm_crtc *crtc, struct drm_atomic_state *state) {
> > > > >   ...
> > > > > - struct mtk_crtc_state *crtc_state =3D e;
> > > > > + struct mtk_crtc_state *mtk_crtc_state =3D e;
> > > > >   <+...
> > > > > -       crtc_state
> > > > > +	mtk_crtc_state
> > > > >   ...+>
> > > > >   }
> > > > =

> > > > These reanames seem a bit out of scpe for this patch. But I guess y=
ou
> > > > needed then to get the rest of the cocci to work on some drivers?
> > > =

> > > Yeah, those two drivers already had a variable named crtc_state, call=
ing
> > > container_of on crtc->state
> > > =

> > > It was cleaner to me to have an intermediate variable storing the res=
ult
> > > of drm_atomic_get_new_crtc_state, but then the most obvious name was
> > > taken so I had to rename those two variables before doing so.
> > > =

> > > > The basic idea looks good:
> > > > Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > > =

> > > > But I guess up to the individual driver folks to bikeshed the varia=
ble
> > > > naming and whatnot.
> > > > =

> > > > One thing I spotted is that a few drivers now gained two aliasing c=
rtc
> > > > state pointers in the function: one with the drm type, the other wi=
th
> > > > a driver specific type. That's something we've outlawed in i915 sin=
ce
> > > > it was making life rather confusing. In i915 we now prefer to use o=
nly
> > > > the i915 specific types in most places.
> > > =

> > > I didn't spot any of those cases, do you have an example of where it
> > > happened?
> > =

> > eg. ast:
> > +       struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_s=
tate(state,                               =

> > +                                                                      =
   crtc);                               =

> >         struct drm_crtc_state *old_crtc_state =3D drm_atomic_get_old_cr=
tc_state(state,                           =

> >                                                                        =
       crtc);                           =

> >         struct ast_private *ast =3D to_ast_private(crtc->dev);         =
                                          =

> > -       struct ast_crtc_state *ast_crtc_state =3D to_ast_crtc_state(crt=
c->state);                                =

> > +       struct ast_crtc_state *ast_crtc_state =3D to_ast_crtc_state(crt=
c_state);       =

> > =

> > So here both 'crtc_state' and 'ast_crtc_state' are basically the same
> > thing, which can get a bit confusing especially within larger functions
> > with lots of variables. =

> =

> Ah, that kind of aliasing, ok. So it's purely an issue with
> ergonomics/convenience?

Yeah, I got fed up with it in i915 because I had a hard time
reasoning how the state was being mutated when it was being
accesed through multiple pointers in the same function. And
didn't help that the variable names were all over the place.

> =

> It seems to be a widespread pattern (I know we're using it in vc4 and
> sun4i, and from those reworks I've seen a number of drivers doing so).
> I'm not entirely sure how we should fix it through coccinelle too :/

I think we've been doing these by hand in i915 for the most part.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
