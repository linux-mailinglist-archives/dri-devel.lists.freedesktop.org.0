Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D7E4603D
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 16:12:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B27AE89915;
	Fri, 14 Jun 2019 14:12:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57A47898F5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 14:12:15 +0000 (UTC)
X-Originating-IP: 90.88.23.150
Received: from localhost (aaubervilliers-681-1-81-150.w90-88.abo.wanadoo.fr
 [90.88.23.150]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 0E6D6E0012;
 Fri, 14 Jun 2019 14:12:11 +0000 (UTC)
Date: Fri, 14 Jun 2019 16:12:11 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v4 02/12] drm/client: Restrict the plane_state scope
Message-ID: <20190614141211.rl7ihqgzllcai634@flea>
References: <cover.5fc7840dc8fb24744516c13acb8c8aa18e44c0d0.1560514379.git-series.maxime.ripard@bootlin.com>
 <4f6344cb770047cf5808791d849bbc0cbd330e54.1560514379.git-series.maxime.ripard@bootlin.com>
 <87wohouz90.fsf@intel.com>
MIME-Version: 1.0
In-Reply-To: <87wohouz90.fsf@intel.com>
User-Agent: NeoMutt/20180716
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: eben@raspberrypi.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Sean Paul <seanpaul@chromium.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1651225889=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1651225889==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aamkoqa56liih3yy"
Content-Disposition: inline


--aamkoqa56liih3yy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jani,

On Fri, Jun 14, 2019 at 03:28:59PM +0300, Jani Nikula wrote:
> On Fri, 14 Jun 2019, Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> > The drm_client_modeset_commit_atomic function uses two times the
> > plane_state variable in inner blocks of code, but the variable has a scope
> > global to this function.
> >
> > This will lead to inadvertent devs to reuse the variable in the second
> > block with the value left by the first, without any warning from the
> > compiler since value would have been initialized.
> >
> > Fix this by moving the variable declaration to the proper scope.
>
> This is an improvement, but I'd consider renaming also to not shadow
> variables.
>
> > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> > ---
> >  drivers/gpu/drm/drm_client_modeset.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
> > index 006bf7390e7d..8264c3a732b0 100644
> > --- a/drivers/gpu/drm/drm_client_modeset.c
> > +++ b/drivers/gpu/drm/drm_client_modeset.c
> > @@ -861,7 +861,6 @@ EXPORT_SYMBOL(drm_client_panel_rotation);
> >  static int drm_client_modeset_commit_atomic(struct drm_client_dev *client, bool active)
> >  {
> >  	struct drm_device *dev = client->dev;
> > -	struct drm_plane_state *plane_state;
> >  	struct drm_plane *plane;
> >  	struct drm_atomic_state *state;
> >  	struct drm_modeset_acquire_ctx ctx;
> > @@ -879,6 +878,8 @@ static int drm_client_modeset_commit_atomic(struct drm_client_dev *client, bool
> >  	state->acquire_ctx = &ctx;
> >  retry:
> >  	drm_for_each_plane(plane, dev) {
> > +		struct drm_plane_state *plane_state;
> > +
> >  		plane_state = drm_atomic_get_plane_state(state, plane);
> >  		if (IS_ERR(plane_state)) {
> >  			ret = PTR_ERR(plane_state);
> > @@ -901,6 +902,8 @@ static int drm_client_modeset_commit_atomic(struct drm_client_dev *client, bool
> >  		unsigned int rotation;
> >
> >  		if (drm_client_panel_rotation(mode_set, &rotation)) {
> > +			struct drm_plane_state *plane_state;
> > +

That's not super clear from that patch, but this variable will not
shadow the first one.

The code layout is pretty much this one:

loop () {
  struct drm_plane_state *plane_state;

  [...]
}

loop () {
  loop () {
    struct drm_plane_state *plane_state;

    [...]
  }
}

so the shadowing doesn't exist

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--aamkoqa56liih3yy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXQOrOwAKCRDj7w1vZxhR
xW5mAP9nvSTCf8R9NI55hn+KNljdsPykl3kNnrUaeBJVZsFCNAEAh28Ek8xCtB8e
7jJcsFN+S2aAIDQUEeSc7Ip8zgJZ0wY=
=34/H
-----END PGP SIGNATURE-----

--aamkoqa56liih3yy--

--===============1651225889==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1651225889==--
