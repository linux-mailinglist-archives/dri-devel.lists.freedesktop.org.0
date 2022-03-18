Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F20A4DDCC4
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 16:25:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F16D410EB5B;
	Fri, 18 Mar 2022 15:25:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF0810EB5B
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 15:25:24 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E54B61BF21A;
 Fri, 18 Mar 2022 15:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647617122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XyvG+0AhV6GNZxavZndSgFd1DvfzNuoKrvusjJeU8vE=;
 b=UsYH9OeBcFQ6hgH9ohMrhQ+cU1pfKK0vFkTLHxSk0YHw3H0fj6cr9oqytc3wyHsEDuouTb
 /v6UGrSum7PT9kKgup9zugCZhxlGFtLYzhsQ2zbe7mp1qLs7Ok5lXc6aSFFOoiZI1q5GAE
 2TBwmTtfvuV6EiQt/clDR/KewxpbeC/DywMmcoGwSr1j2EfJ7g51oDB18WHaswH5dMmaBC
 2+omuK1g+4lai9lcIcM0ChSmIcNEQ+sIuvjclC2OrSiRk8GqucokirKUK4svZ/slntAeYZ
 7xPg1TEWhM9cDCimSgM1ASHWhJNIlFbnp1FlaaAmgwGNb+9UKsHAc0Vajjb2Mw==
Date: Fri, 18 Mar 2022 16:25:21 +0100
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH] drm: of: Properly try all possible cases for
 bridge/panel detection
Message-ID: <YjSkYSGY/D82ONjl@aptenodytes>
References: <20220309143200.111292-1-paul.kocialkowski@bootlin.com>
 <20220310145423.but7r7ul4j7h3wxw@houat>
 <YjIFAR2NSfjXdJGe@aptenodytes>
 <20220318151414.vxormel2vfgzss6t@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QRbFUewSOUn4mwmT"
Content-Disposition: inline
In-Reply-To: <20220318151414.vxormel2vfgzss6t@houat>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--QRbFUewSOUn4mwmT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

On Fri 18 Mar 22, 16:14, Maxime Ripard wrote:
> On Wed, Mar 16, 2022 at 04:40:49PM +0100, Paul Kocialkowski wrote:
> > Hi Maxime,
> >=20
> > Thanks for the review!
> >=20
> > On Thu 10 Mar 22, 15:54, Maxime Ripard wrote:
> > > Hi Paul,
> > >=20
> > > On Wed, Mar 09, 2022 at 03:32:00PM +0100, Paul Kocialkowski wrote:
> > > > While bridge/panel detection was initially relying on the usual
> > > > port/ports-based of graph detection, it was recently changed to
> > > > perform the lookup on any child node that is not port/ports
> > > > instead when such a node is available, with no fallback on the
> > > > usual way.
> > > >=20
> > > > This results in breaking detection when a child node is present
> > > > but does not contain any panel or bridge node, even when the
> > > > usual port/ports-based of graph is there.
> > > >=20
> > > > In order to support both situations properly, this commit reworks
> > > > the logic to try both options and not just one of the two: it will
> > > > only return -EPROBE_DEFER when both have failed.
> > > >=20
> > > > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > > Fixes: 80253168dbfd ("drm: of: Lookup if child node has panel or br=
idge")
> > >=20
> > > Thanks, it's in pretty good shape now, but I have a few bike sheds to=
 paint :)
> > >=20
> > > > ---
> > > >  drivers/gpu/drm/drm_of.c | 93 +++++++++++++++++++++---------------=
----
> > > >  1 file changed, 49 insertions(+), 44 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
> > > > index 9d90cd75c457..67f1b7dfc892 100644
> > > > --- a/drivers/gpu/drm/drm_of.c
> > > > +++ b/drivers/gpu/drm/drm_of.c
> > > > @@ -219,6 +219,35 @@ int drm_of_encoder_active_endpoint(struct devi=
ce_node *node,
> > > >  }
> > > >  EXPORT_SYMBOL_GPL(drm_of_encoder_active_endpoint);
> > > > =20
> > > > +static int drm_of_find_remote_panel_or_bridge(struct device_node *=
remote,
> > > > +					      struct drm_panel **panel,
> > > > +					      struct drm_bridge **bridge)
> > >=20
> > > This function performs its look up directly on the struct device_node
> > > passed as argument, so I don't think the "remote" in the name is grea=
t.
> > > Since it's static, we can just call it find_panel_or_bridge, what do =
you
> > > think?
> >=20
> > From a quick look at other DRM code I got the impression that static fu=
nctions
> > also usually carry the drm prefix but I might be wrong.
>=20
> Not necessarily, see handle_conflicting_encoders, commit_tail, commit_wor=
k,
> convert_clip_rect_to_rect, edid_load, etc.
>=20
> Most functions do, but it's not a rule or a convention.

Okay then, I'm fine with find_panel_or_bridge.

> > > > +{
> > > > +	int ret =3D -EPROBE_DEFER;
> > > > +
> > > > +	if (panel) {
> > > > +		*panel =3D of_drm_find_panel(remote);
> > > > +		if (!IS_ERR(*panel))
> > > > +			ret =3D 0;
> > >=20
> > > return 0?
> >=20
> > The idea was to still go through the "*bridge =3D NULL;" path if a brid=
ge
> > pointer is provided, to preserve the original behavior of the function.
> > There may or may not not be any hard expectation on that, in any case
> > I feel like it would be good to avoid out-of-scope functional changes h=
ere.
>=20
> Then we could just clear it just like we clear the panel pointer in
> drm_of_find_panel_or_bridge. It would be more consistent.

Oh absolutely, I agree that would be best.

> > > > +		else
> > > > +			*panel =3D NULL;
> > > > +
> > > > +	}
> > > > +
> > > > +	/* No panel found yet, check for a bridge next. */
> > > > +	if (bridge) {
> > > > +		if (ret) {
> > >=20
> > > And the return above allows to remove that test
> > >=20
> > > > +			*bridge =3D of_drm_find_bridge(remote);
> > > > +			if (*bridge)
> > > > +				ret =3D 0;
> > >=20
> > > return 0?
> > >=20
> > > > +		} else {
> > > > +			*bridge =3D NULL;
> > > > +		}
> > > > +
> > > > +	}
> > > > +
> > > > +	return ret;
> > >=20
> > > And here we can just return -EPROBE_DEFER
> > >=20
> > > > +}
> > > > +
> > >=20
> > > >  /**
> > > >   * drm_of_find_panel_or_bridge - return connected panel or bridge =
device
> > > >   * @np: device tree node containing encoder output ports
> > > > @@ -249,57 +278,33 @@ int drm_of_find_panel_or_bridge(const struct =
device_node *np,
> > > >  	if (panel)
> > > >  		*panel =3D NULL;
> > > > =20
> > > > -	/**
> > > > -	 * Devices can also be child nodes when we also control that devi=
ce
> > > > -	 * through the upstream device (ie, MIPI-DCS for a MIPI-DSI devic=
e).
> > > > -	 *
> > > > -	 * Lookup for a child node of the given parent that isn't either =
port
> > > > -	 * or ports.
> > > > -	 */
> > > > -	for_each_available_child_of_node(np, remote) {
> > > > -		if (of_node_name_eq(remote, "port") ||
> > > > -		    of_node_name_eq(remote, "ports"))
> > > > -			continue;
> > > > -
> > > > -		goto of_find_panel_or_bridge;
> > > > +	/* Check for a graph on the device node first. */
> > > > +	if (of_graph_is_present(np)) {
> > > > +		remote =3D of_graph_get_remote_node(np, port, endpoint);
> > > > +		if (remote) {
> > > > +			ret =3D drm_of_find_remote_panel_or_bridge(remote, panel,
> > > > +								 bridge);
> > > > +			of_node_put(remote);
> > > > +		}
> > > >  	}
> > > > =20
> > > > -	/*
> > > > -	 * of_graph_get_remote_node() produces a noisy error message if p=
ort
> > > > -	 * node isn't found and the absence of the port is a legit case h=
ere,
> > > > -	 * so at first we silently check whether graph presents in the
> > > > -	 * device-tree node.
> > > > -	 */
> > > > -	if (!of_graph_is_present(np))
> > > > -		return -ENODEV;
> > > > -
> > > > -	remote =3D of_graph_get_remote_node(np, port, endpoint);
> > > > -
> > > > -of_find_panel_or_bridge:
> > > > -	if (!remote)
> > > > -		return -ENODEV;
> > > > +	/* Otherwise check for any child node other than port/ports. */
> > > > +	if (ret) {
> > > > +		for_each_available_child_of_node(np, remote) {
> > > > +			if (of_node_name_eq(remote, "port") ||
> > > > +			    of_node_name_eq(remote, "ports"))
> > > > +				continue;
> > > > =20
> > > > -	if (panel) {
> > > > -		*panel =3D of_drm_find_panel(remote);
> > > > -		if (!IS_ERR(*panel))
> > > > -			ret =3D 0;
> > > > -		else
> > > > -			*panel =3D NULL;
> > > > -	}
> > > > +			ret =3D drm_of_find_remote_panel_or_bridge(remote, panel,
> > > > +								 bridge);
> > > > +			of_node_put(remote);
> > > > =20
> > > > -	/* No panel found yet, check for a bridge next. */
> > > > -	if (bridge) {
> > > > -		if (ret) {
> > > > -			*bridge =3D of_drm_find_bridge(remote);
> > > > -			if (*bridge)
> > > > -				ret =3D 0;
> > > > -		} else {
> > > > -			*bridge =3D NULL;
> > > > +			/* Stop at the first found occurrence. */
> > > > +			if (!ret)
> > > > +				break;
> > > >  		}
> > > > -
> > > >  	}
> > > > =20
> > > > -	of_node_put(remote);
> > > >  	return ret;
> > > >  }
> > >=20
> > > So the diff is fairly hard to read, but it ends up as:
> >=20
> > Yeah I agree, not sure what I can do about that.
>=20
> Nothing, really. I don't expect any change there, it just happens sometim=
es :)

All right then :)

I'll send another iteration soon.

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--QRbFUewSOUn4mwmT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmI0pGEACgkQ3cLmz3+f
v9F38wgAiW0fsg1uHAG9RbQHGQPMR6EPkKAA+fF3K8Dw5S8e327Pbb37JOO0OaRq
awMEK2tU+azdYXWM0AY8w2/6FrquKCQOeIIPUyCMNUvDdZYJR1VIcPFeOd75CoWX
uQ6eq7Kp/BiWN0iQzOnXGZwEQWBaYirtzBIS/kbHmVHXoBV6RNSQ3paPffPiuqd0
gbZ6SfUivqhd5F8DNqw9c/EmnRnVcVm5GEdm2hNh8btG9mOgAjWTOl4zT39Bk+JQ
BhyuxGDH72Eqr+NolyiIVs/GkZRb4cfysQOFEqhu3gzdW+H4q88PbgaFrBQ72wEp
iyuWUTkZWcyt3A2QZuCDSfmOk6ctlw==
=CNx8
-----END PGP SIGNATURE-----

--QRbFUewSOUn4mwmT--
