Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 415D54CD2EF
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 12:05:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E3B110E682;
	Fri,  4 Mar 2022 11:05:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1651E10E636
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 11:05:20 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 576D1240016;
 Fri,  4 Mar 2022 11:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1646391917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WQQeCyhN2012/SzTzJN3ovmFDgelArEJpQXlJJVMmls=;
 b=DkZuOcxMZEl73X5Mo8ESErGCc7SivNsR8UF6IEf9U0d8uI3SAGQyd8sPZiz0wBnBIdj6WH
 mIxCaNeDqez+7T9jvcMQz0KKupovdHwWtf94awPLwlBvWxhgDTwknsPz/7zuB4bN/GYdC9
 /dLlCwqzUyPA/1P63vJCHwVbxx58nmYJQKkoPhhCmokojc/Wduyfxihg0lSKS/F6PcIOuq
 fDpU7Jvt606wwaBaS7emLgPLvdgegin+1flXmxp61Kv2DTNYCIWs/fOacjBQE155pFKmUk
 rMluY+TGTrjubR3s6NnsCnQGQ89XMcBuVEP+F7iBZ/uaxvM16RsNZ016D1kPhQ==
Date: Fri, 4 Mar 2022 12:05:14 +0100
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v4] drm: of: Lookup if child node has panel or bridge
Message-ID: <YiHyatlgpmkMY4/T@aptenodytes>
References: <20220202160414.16493-1-jagan@amarulasolutions.com>
 <YiEkaBO/lz05DkAD@aptenodytes>
 <20220304085445.avdrxlx5wnytriyk@houat>
 <YiHxU5GvnRuTeWqc@aptenodytes>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tlpIz9xkeRqmc0fh"
Content-Disposition: inline
In-Reply-To: <YiHxU5GvnRuTeWqc@aptenodytes>
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


--tlpIz9xkeRqmc0fh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 04 Mar 22, 12:00, Paul Kocialkowski wrote:
> Hi Maxime,
>=20
> On Fri 04 Mar 22, 09:54, Maxime Ripard wrote:
> > Hi Paul,
> >=20
> > On Thu, Mar 03, 2022 at 09:26:30PM +0100, Paul Kocialkowski wrote:
> > > On Wed 02 Feb 22, 21:34, Jagan Teki wrote:
> > > > Devices can also be child nodes when we also control that device
> > > > through the upstream device (ie, MIPI-DCS for a MIPI-DSI device).
> > > >=20
> > > > drm_of_find_panel_or_bridge can lookup panel or bridge for a given
> > > > device has port and endpoint and it fails to lookup if the device
> > > > has a child nodes.
> > >=20
> > > This patch breaks the logicvc drm driver that I'm currently developpi=
ng.
> > > The symptom is that drm_of_find_panel_or_bridge now always returns
> > > -EPROBE_DEFER even after the panel has probed and is running well.
> > > It seems that the function can no longer find the panel.
> > >=20
> > > I haven't figured out the details, but reverting your patch makes
> > > it work again. I suspect other drivers might be affected as well, so
> > > it would probably be a good idea to revert the patch until the root
> > > cause is clearly understood and the patch can be adapted accordingly.
> > >=20
> > > Here is what the device-tree looks like:
> > >=20
> > > / {
> > > 	panel: panel-lvds {
> > > 		compatible =3D "panel-lvds";
> > >=20
> > > 		[...]
> > >=20
> > > 		port {
> > > 			#address-cells =3D <1>;
> > > 			#size-cells =3D <0>;
> > >=20
> > > 			panel_input: endpoint@0 {
> > > 				reg =3D <0>;
> > > 				remote-endpoint =3D <&logicvc_output>;
> > > 			};
> > > 		};
> > > 	};
> > > };
> > >=20
> > > &amba {
> > > 	logicvc: logicvc@43c00000 {
> > > 		compatible =3D "xylon,logicvc-3.02.a", "syscon", "simple-mfd";
> > > 		reg =3D <0x43c00000 0x6000>;
> > >=20
> > > 		#address-cells =3D <1>;
> > > 		#size-cells =3D <1>;
> > >=20
> > > 		[...]
> > >=20
> > > 		logicvc_display: display-engine@0 {
> > > 			compatible =3D "xylon,logicvc-4.01.a-display";
> > >=20
> > > 			[...]
> >=20
> > I think the issue lies in what you left out here: you have another node
> > aside from the port one, called layers. I *think* the issue is that the
> > code will now pick up the layers node, and try to use it as a panel,
> > which will never probe.
> >=20
> > I've had a look at all the other bindings though, it seems like this
> > driver is the only one that can be affected: the anx7625 seems to be the
> > only other driver that has a child node that isn't either a port or a
> > panel (aux-bus) but it doesn't use drm_of_find_panel_or_bridge either.
>=20
> Thanks a lot for looking into this so quickly!
>=20
> After some testing it clearly appears that you're right and the layers
> node is the one conflicting with the patch. Removing it brings the
> behavior back to normal. I'll try to dig-in a bit more to understand
> why this is happening since it's really not obvious when just looking
> at the patch.

Ah wait I do understand it actually. The patch will take the *first* node
that doesn't have ports/port in it and use that as remote instead of
of_graph_get_remote_node.

So maybe the fix would be to first look via of_graph_get_remote_node and
if nothing is returned then it should try to use the first node as remote.
tl;dr just inverting the order of the logic.

Do you think that would work?

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--tlpIz9xkeRqmc0fh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmIh8moACgkQ3cLmz3+f
v9H/lgf/cao++pSUTsx+8dQm6sC6lb2Hs7xyucYgcSMwxhVlopnw2ea5lqpIDxnk
TLrWDFcwBeSnNfeH82wiwqT3/zApkdetF5W9vyfPO83rtyT1HZzSHly1iML3P28M
Lh0QLyMyt97I169VbBzgBLs5vZVif9x7bcbO9c5WTrzOtJv1wfXyeoKlmiHFD7Qi
nbAiJk4F0UwQGYld7ZCVztjzDHbyNTmmkqdkOq1gH/+sn0OyaTrXmhLmlO7uEbAN
42C7Nww/2+ryioqGFuqFwY9MRgJL71v9P20//x/Zf6ssjeaJGFtb3BmoVAgZKJKU
08mZj3y6zvf1B4tntcRdYnEjWw0UZA==
=dZ85
-----END PGP SIGNATURE-----

--tlpIz9xkeRqmc0fh--
