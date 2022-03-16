Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B194DB511
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 16:41:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A2EF10E719;
	Wed, 16 Mar 2022 15:40:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA33910E719
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 15:40:55 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5D04F20000D;
 Wed, 16 Mar 2022 15:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647445251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yvaTKdVkvoK+k9A//eTH+hD8ZVKex8j820Ugfib5OWM=;
 b=OBRJ98tC7G23OKzFoiHmLACw6kNVmFzEbguDzCMZDn2zk+ngtTQPFWh8P8ELaswuuVaJpY
 KlXWnm0AFhEWfzow7uZAN5/x2JolmTOC5AuqbbJTGv8WekODlwqcp+6yS0NKfxrQ+ehh8r
 RfVvTywVn4f6Ef1uUVlNEE9TVsxt+SJ9MVsBtQfG87FPUAIMZSZclTYMN4JDrZ2qamqtHX
 qiik7L1vqXpCemEEUrSduhCXKzPwC+ANGxBst216qTfSpdhfnt2NeYOC4MvBaCq/BMvENg
 k4CI3cxRsdcJ8t/CJIdPgWco66UibQtHbDAOy9iFm13gtHeEEuILBeO9hY/crQ==
Date: Wed, 16 Mar 2022 16:40:49 +0100
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH] drm: of: Properly try all possible cases for
 bridge/panel detection
Message-ID: <YjIFAR2NSfjXdJGe@aptenodytes>
References: <20220309143200.111292-1-paul.kocialkowski@bootlin.com>
 <20220310145423.but7r7ul4j7h3wxw@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KXMtiZ7mfH5WW4cU"
Content-Disposition: inline
In-Reply-To: <20220310145423.but7r7ul4j7h3wxw@houat>
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


--KXMtiZ7mfH5WW4cU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

Thanks for the review!

On Thu 10 Mar 22, 15:54, Maxime Ripard wrote:
> Hi Paul,
>=20
> On Wed, Mar 09, 2022 at 03:32:00PM +0100, Paul Kocialkowski wrote:
> > While bridge/panel detection was initially relying on the usual
> > port/ports-based of graph detection, it was recently changed to
> > perform the lookup on any child node that is not port/ports
> > instead when such a node is available, with no fallback on the
> > usual way.
> >=20
> > This results in breaking detection when a child node is present
> > but does not contain any panel or bridge node, even when the
> > usual port/ports-based of graph is there.
> >=20
> > In order to support both situations properly, this commit reworks
> > the logic to try both options and not just one of the two: it will
> > only return -EPROBE_DEFER when both have failed.
> >=20
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > Fixes: 80253168dbfd ("drm: of: Lookup if child node has panel or bridge=
")
>=20
> Thanks, it's in pretty good shape now, but I have a few bike sheds to pai=
nt :)
>=20
> > ---
> >  drivers/gpu/drm/drm_of.c | 93 +++++++++++++++++++++-------------------
> >  1 file changed, 49 insertions(+), 44 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
> > index 9d90cd75c457..67f1b7dfc892 100644
> > --- a/drivers/gpu/drm/drm_of.c
> > +++ b/drivers/gpu/drm/drm_of.c
> > @@ -219,6 +219,35 @@ int drm_of_encoder_active_endpoint(struct device_n=
ode *node,
> >  }
> >  EXPORT_SYMBOL_GPL(drm_of_encoder_active_endpoint);
> > =20
> > +static int drm_of_find_remote_panel_or_bridge(struct device_node *remo=
te,
> > +					      struct drm_panel **panel,
> > +					      struct drm_bridge **bridge)
>=20
> This function performs its look up directly on the struct device_node
> passed as argument, so I don't think the "remote" in the name is great.
> Since it's static, we can just call it find_panel_or_bridge, what do you
> think?

=46rom a quick look at other DRM code I got the impression that static func=
tions
also usually carry the drm prefix but I might be wrong.

> > +{
> > +	int ret =3D -EPROBE_DEFER;
> > +
> > +	if (panel) {
> > +		*panel =3D of_drm_find_panel(remote);
> > +		if (!IS_ERR(*panel))
> > +			ret =3D 0;
>=20
> return 0?

The idea was to still go through the "*bridge =3D NULL;" path if a bridge
pointer is provided, to preserve the original behavior of the function.
There may or may not not be any hard expectation on that, in any case
I feel like it would be good to avoid out-of-scope functional changes here.

> > +		else
> > +			*panel =3D NULL;
> > +
> > +	}
> > +
> > +	/* No panel found yet, check for a bridge next. */
> > +	if (bridge) {
> > +		if (ret) {
>=20
> And the return above allows to remove that test
>=20
> > +			*bridge =3D of_drm_find_bridge(remote);
> > +			if (*bridge)
> > +				ret =3D 0;
>=20
> return 0?
>=20
> > +		} else {
> > +			*bridge =3D NULL;
> > +		}
> > +
> > +	}
> > +
> > +	return ret;
>=20
> And here we can just return -EPROBE_DEFER
>=20
> > +}
> > +
>=20
> >  /**
> >   * drm_of_find_panel_or_bridge - return connected panel or bridge devi=
ce
> >   * @np: device tree node containing encoder output ports
> > @@ -249,57 +278,33 @@ int drm_of_find_panel_or_bridge(const struct devi=
ce_node *np,
> >  	if (panel)
> >  		*panel =3D NULL;
> > =20
> > -	/**
> > -	 * Devices can also be child nodes when we also control that device
> > -	 * through the upstream device (ie, MIPI-DCS for a MIPI-DSI device).
> > -	 *
> > -	 * Lookup for a child node of the given parent that isn't either port
> > -	 * or ports.
> > -	 */
> > -	for_each_available_child_of_node(np, remote) {
> > -		if (of_node_name_eq(remote, "port") ||
> > -		    of_node_name_eq(remote, "ports"))
> > -			continue;
> > -
> > -		goto of_find_panel_or_bridge;
> > +	/* Check for a graph on the device node first. */
> > +	if (of_graph_is_present(np)) {
> > +		remote =3D of_graph_get_remote_node(np, port, endpoint);
> > +		if (remote) {
> > +			ret =3D drm_of_find_remote_panel_or_bridge(remote, panel,
> > +								 bridge);
> > +			of_node_put(remote);
> > +		}
> >  	}
> > =20
> > -	/*
> > -	 * of_graph_get_remote_node() produces a noisy error message if port
> > -	 * node isn't found and the absence of the port is a legit case here,
> > -	 * so at first we silently check whether graph presents in the
> > -	 * device-tree node.
> > -	 */
> > -	if (!of_graph_is_present(np))
> > -		return -ENODEV;
> > -
> > -	remote =3D of_graph_get_remote_node(np, port, endpoint);
> > -
> > -of_find_panel_or_bridge:
> > -	if (!remote)
> > -		return -ENODEV;
> > +	/* Otherwise check for any child node other than port/ports. */
> > +	if (ret) {
> > +		for_each_available_child_of_node(np, remote) {
> > +			if (of_node_name_eq(remote, "port") ||
> > +			    of_node_name_eq(remote, "ports"))
> > +				continue;
> > =20
> > -	if (panel) {
> > -		*panel =3D of_drm_find_panel(remote);
> > -		if (!IS_ERR(*panel))
> > -			ret =3D 0;
> > -		else
> > -			*panel =3D NULL;
> > -	}
> > +			ret =3D drm_of_find_remote_panel_or_bridge(remote, panel,
> > +								 bridge);
> > +			of_node_put(remote);
> > =20
> > -	/* No panel found yet, check for a bridge next. */
> > -	if (bridge) {
> > -		if (ret) {
> > -			*bridge =3D of_drm_find_bridge(remote);
> > -			if (*bridge)
> > -				ret =3D 0;
> > -		} else {
> > -			*bridge =3D NULL;
> > +			/* Stop at the first found occurrence. */
> > +			if (!ret)
> > +				break;
> >  		}
> > -
> >  	}
> > =20
> > -	of_node_put(remote);
> >  	return ret;
> >  }
>=20
> So the diff is fairly hard to read, but it ends up as:

Yeah I agree, not sure what I can do about that.

> >        int ret =3D -EPROBE_DEFER;
> >        struct device_node *remote;
> >
> >        if (!panel && !bridge)
> >                return -EINVAL;
> >        if (panel)
> >                *panel =3D NULL;
> >
> >        /* Check for a graph on the device node first. */
> >       if (of_graph_is_present(np)) {
> >                remote =3D of_graph_get_remote_node(np, port, endpoint);
> >                if (remote) {
> >                        ret =3D drm_of_find_remote_panel_or_bridge(remot=
e, panel,
> >                                                                 bridge);
> >                        of_node_put(remote);
>=20
> I think we can simplify this by doing
>=20
>                         if (!ret)
> 			        return ret;
>=20
> >                }
> >        }
> >
> >        /* Otherwise check for any child node other than port/ports. */
> >        if (ret) {
>=20
> And thus we won't have to check for ret here

Yes I agree this one makes things more readable.

> >                for_each_available_child_of_node(np, remote) {
>=20
> I'm a bit reluctant with variables that we reuse from one loop to
> another, especially since it's a bit misleading here. What about using a
> (loop local) remote variable in the of_graph path, and a loop-local
> variable node or child here?

I feel like reusing variables across loops is quite a common thing and
not really an issue on its own, but I agree that calling this one remote
is confusing and "child" would make things clearer here.

> >                        if (of_node_name_eq(remote, "port") ||
> >                            of_node_name_eq(remote, "ports"))
> >                                continue;
> >
> >                        ret =3D drm_of_find_remote_panel_or_bridge(remot=
e, panel,
> >                                                                 bridge);
> >                        of_node_put(remote);
> >
> >                        /* Stop at the first found occurrence. */
> >                        if (!ret)
> >                                break;
>=20
> Ditto, let's just return here

Sure, fair enough!

> >                }
> >       }
> >
> >        return ret;
>=20
> And then we can just return EPROBE_DEFER here (and get rid of ret entirel=
y)

Sounds good to me, thanks!

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--KXMtiZ7mfH5WW4cU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmIyBQEACgkQ3cLmz3+f
v9F+oAf/ciGczxoupYmT3Pnv1aSOfqs0G2KaF8kiOUt+LxjBasejZPuerM6INk7P
636bFeiPd4B5Lf6NjFx9fJspBFK93qXdC3ym7hEsobSKYD8/OtDwlw9Y6u3JsKNk
lOvCyawaVLLhzD7Qlt/vO+HqK6Xe/KYOemsEEp7Lnr+SCkVFcg7WrbPAANgAzrVH
J2IQh2Mm99SH6FlwRcMyVijEVm3XLqYpQGiBqqYKANZMP1nlHTwEhuhIv6d4dZfQ
YaGTYQBFL+zGaGB+yYTlgEASOTABd/LlgsLI9I08DttLTeBFxFBJUpln6OvTYNCW
Kb38uayMpwwplWiWKETJg1NjKtBuRQ==
=vilI
-----END PGP SIGNATURE-----

--KXMtiZ7mfH5WW4cU--
