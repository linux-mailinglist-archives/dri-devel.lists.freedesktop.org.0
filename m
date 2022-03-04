Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC7F4CD2E7
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 12:00:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD64210E7C5;
	Fri,  4 Mar 2022 11:00:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0858310E7C5
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 11:00:39 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EC8E31BF204;
 Fri,  4 Mar 2022 11:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1646391638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rPKrNaWstEEgg79XZANUmfkyKaWYMIqwlgx/Vz+VEf8=;
 b=axRPrnqrzeitFi2A+MZnn8SslkTJ22wXKfGqa3ZdhLFvDp/vQ/JvWe9V89YMFisRZ0kPm9
 mPawrzeuvBtRZNDVcvuvZ3fJQoR9Os9E1VmTaXKqB3hF/EfFg5PtPjpczl2PjtE89NHazv
 3MvziEhShGmiDfbeAJcT3yPaUhZS79PGydBbJJNDvVIVYtWaKfHb0J7YMByBU7HVIX8T0X
 FPCq+R1LlOFi2wSMe2u9wzGc1O5KkyezwMR4+RKrTbWRBeYBXPAE7s32bwI0YMEHZxg2zt
 TsUOnHFCQBlH3aAAsBoKzktYxvrI6yhtuZPCh8BXeV1hodJCfXD/RmPo/NadWQ==
Date: Fri, 4 Mar 2022 12:00:35 +0100
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v4] drm: of: Lookup if child node has panel or bridge
Message-ID: <YiHxU5GvnRuTeWqc@aptenodytes>
References: <20220202160414.16493-1-jagan@amarulasolutions.com>
 <YiEkaBO/lz05DkAD@aptenodytes>
 <20220304085445.avdrxlx5wnytriyk@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="BxJVPEbmxbyzcbfG"
Content-Disposition: inline
In-Reply-To: <20220304085445.avdrxlx5wnytriyk@houat>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-amarula@amarulasolutions.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--BxJVPEbmxbyzcbfG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

On Fri 04 Mar 22, 09:54, Maxime Ripard wrote:
> Hi Paul,
>=20
> On Thu, Mar 03, 2022 at 09:26:30PM +0100, Paul Kocialkowski wrote:
> > On Wed 02 Feb 22, 21:34, Jagan Teki wrote:
> > > Devices can also be child nodes when we also control that device
> > > through the upstream device (ie, MIPI-DCS for a MIPI-DSI device).
> > >=20
> > > drm_of_find_panel_or_bridge can lookup panel or bridge for a given
> > > device has port and endpoint and it fails to lookup if the device
> > > has a child nodes.
> >=20
> > This patch breaks the logicvc drm driver that I'm currently developping.
> > The symptom is that drm_of_find_panel_or_bridge now always returns
> > -EPROBE_DEFER even after the panel has probed and is running well.
> > It seems that the function can no longer find the panel.
> >=20
> > I haven't figured out the details, but reverting your patch makes
> > it work again. I suspect other drivers might be affected as well, so
> > it would probably be a good idea to revert the patch until the root
> > cause is clearly understood and the patch can be adapted accordingly.
> >=20
> > Here is what the device-tree looks like:
> >=20
> > / {
> > 	panel: panel-lvds {
> > 		compatible =3D "panel-lvds";
> >=20
> > 		[...]
> >=20
> > 		port {
> > 			#address-cells =3D <1>;
> > 			#size-cells =3D <0>;
> >=20
> > 			panel_input: endpoint@0 {
> > 				reg =3D <0>;
> > 				remote-endpoint =3D <&logicvc_output>;
> > 			};
> > 		};
> > 	};
> > };
> >=20
> > &amba {
> > 	logicvc: logicvc@43c00000 {
> > 		compatible =3D "xylon,logicvc-3.02.a", "syscon", "simple-mfd";
> > 		reg =3D <0x43c00000 0x6000>;
> >=20
> > 		#address-cells =3D <1>;
> > 		#size-cells =3D <1>;
> >=20
> > 		[...]
> >=20
> > 		logicvc_display: display-engine@0 {
> > 			compatible =3D "xylon,logicvc-4.01.a-display";
> >=20
> > 			[...]
>=20
> I think the issue lies in what you left out here: you have another node
> aside from the port one, called layers. I *think* the issue is that the
> code will now pick up the layers node, and try to use it as a panel,
> which will never probe.
>=20
> I've had a look at all the other bindings though, it seems like this
> driver is the only one that can be affected: the anx7625 seems to be the
> only other driver that has a child node that isn't either a port or a
> panel (aux-bus) but it doesn't use drm_of_find_panel_or_bridge either.

Thanks a lot for looking into this so quickly!

After some testing it clearly appears that you're right and the layers
node is the one conflicting with the patch. Removing it brings the
behavior back to normal. I'll try to dig-in a bit more to understand
why this is happening since it's really not obvious when just looking
at the patch.

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--BxJVPEbmxbyzcbfG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmIh8VMACgkQ3cLmz3+f
v9HdqQf/bEOhSgo4qxFHrQ4nxlruAhqMaR2PK45eD8441YAXEbLJTBXtkkxkdKml
a6Sf8vXE93ob1EZEBwUKSFu1g5KtDKFdk4LxkWs9mBFiNR6tVt6K9tDiTEDq4V6e
1UXo+neAssbdjQ3bLu7dD+ATPcyL0DDU8+ZM1X6LR5IFhdWIx4DD5EOPkx7p/pPe
AKthWDYSSggFG2ZLcKhbkok5qMOQwX3xm9xbG4CBXpQ/n0IxleIVWuDIcrQ1iyu9
aBLP96FGSVszyuu32UpLl5ffOM9DHwH+Uh+CSvztS2Niu1lFicn3FF8awejjtzhs
vt9Yoc3PPE2cjYdkQQdY8+rriYK7Qw==
=eX6h
-----END PGP SIGNATURE-----

--BxJVPEbmxbyzcbfG--
