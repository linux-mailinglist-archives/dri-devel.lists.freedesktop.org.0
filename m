Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E614DDEC3
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 17:22:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB10C10E579;
	Fri, 18 Mar 2022 16:22:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50DEF10EA0E
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 16:22:49 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 007A81BF210;
 Fri, 18 Mar 2022 16:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647620567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uq2Qb6X27nCUYPdksuv5fbn1CZt7KpmCpCYAg/lInrg=;
 b=LbSnPI7pRGqTUSOKD0jO6k4zWroEBNFLISuo6CaFiwsyBVk9IplOhpe4ouPIBiI4wTMXKz
 Hnu/jlaDys4kDh7J0qEhMNmDsAs6B7WHgFkwTwyNnl4npUOaeW9PEwqwNIGBES34t4qR89
 XR2xNA/aZTMLrWt1PMQqyrbS9zULl6faeFeccl2KhwYrApmN/CfkHYrNgiETK4XvDeEYUE
 apBkdNAn8miJsHlhHrme6dhQVibvnfbCTwYoMJgMWzgLEweHdkpTbBDJV2fReJIJGjwsns
 tyhl9839J7f9W28U3qz1jIq8tWIVeqWY6sk9BhXpM4onJ63efi7SNs25jtTh6Q==
Date: Fri, 18 Mar 2022 17:22:46 +0100
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2] drm: of: Properly try all possible cases for
 bridge/panel detection
Message-ID: <YjSx1rNLTh/L3MQQ@aptenodytes>
References: <20220318160249.126431-1-paul.kocialkowski@bootlin.com>
 <20220318161847.ezi6yat4on7rvfdf@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qzk6y2i25Ocz8kr4"
Content-Disposition: inline
In-Reply-To: <20220318161847.ezi6yat4on7rvfdf@houat>
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--qzk6y2i25Ocz8kr4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

On Fri 18 Mar 22, 17:18, Maxime Ripard wrote:
> On Fri, Mar 18, 2022 at 05:02:49PM +0100, Paul Kocialkowski wrote:
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
> > ---
> >=20
> > Changes since v1:
> > - Renamed remote to node;
> > - Renamed helper to find_panel_or_bridge;
> > - Cleared bridge pointer early;
> > - Returned early to make the code more concise;
> >=20
> > ---
> >  drivers/gpu/drm/drm_of.c | 98 ++++++++++++++++++++--------------------
> >  1 file changed, 49 insertions(+), 49 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
> > index 9d90cd75c457..63137c833b7a 100644
> > --- a/drivers/gpu/drm/drm_of.c
> > +++ b/drivers/gpu/drm/drm_of.c
> > @@ -219,6 +219,28 @@ int drm_of_encoder_active_endpoint(struct device_n=
ode *node,
> >  }
> >  EXPORT_SYMBOL_GPL(drm_of_encoder_active_endpoint);
> > =20
> > +static int find_panel_or_bridge(struct device_node *node,
> > +				struct drm_panel **panel,
> > +				struct drm_bridge **bridge)
> > +{
> > +	if (panel) {
> > +		*panel =3D of_drm_find_panel(node);
> > +		if (!IS_ERR(*panel))
> > +			return 0;
> > +		else
> > +			*panel =3D NULL;
>=20
> You don't need the else branch here, we already cleared panel in
> drm_of_find_panel_or_bridge

I think we do, because of_drm_find_panel doesn't return NULL when an error
happens but PTR_ERR(), so we need to clear it to keep up with previous
expectations.

> Looks good otherwise, thanks!

Great, thanks for the review!

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--qzk6y2i25Ocz8kr4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmI0sdYACgkQ3cLmz3+f
v9FYhwf/WQ8GZXg5/AGKF3+gIauL7GFsdyj5L+GYaSZd0t+RoKtv2Voi3YZay6Yy
XoL2HpQvmcx5/iWvD3PvwzRZpy3K2fYxKAXL/sLXcvQiF+Y7veWCACaWp+KuJnVI
oq718NfVZcD5zb5vfmClMQfxhZ3TIpQULENBRpA/Cf8ybJncRSxkQ7U2MMNcw0Ds
uAr/f00z8vnI6TYhqX5ZPZY93qZoxQ5ts6WsSwv3WKK6Uiu5GI5X9VEaP+4cA8Ls
1xeuJge+qsvCtsCmxaSABAB29+uLsp0CsjI3YxdITxWk3ym1BrxnH+7fZdpLE/68
LwT429yuLMGoWVmN7nCKZufrN76bVA==
=cWfF
-----END PGP SIGNATURE-----

--qzk6y2i25Ocz8kr4--
