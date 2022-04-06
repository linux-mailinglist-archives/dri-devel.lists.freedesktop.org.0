Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6444F57C7
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 10:30:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6B2B10EE73;
	Wed,  6 Apr 2022 08:30:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDF2610EE73
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 08:30:41 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CAABEC0004;
 Wed,  6 Apr 2022 08:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649233839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x58PUGpYCESbbCtEZlbi5sZBeRskMKKvlojIazBIayg=;
 b=d0wVV32QEFvychcF08K0IwDp8FoTXZ2CJnGZWtqGuf79n2hPuOqEMgLNj4aAayLv5sTLZv
 REkIZxkFKkU+37sIkxn1dgsW6cVmDp+B3xJ8vTB/Si5og7LVUtgTfK+q7KCmtQKWFffD9K
 +TXBlJzZ9/yKj5lFvVdtyOBUo0ExX5vcdAIJ+pq/KWfO+B+Cy1I451QiaJsXgYje0Pmomw
 rVBEwJMaPk0vahFkp9jRsAB91V+pLbPg3bayx1qDSfzpezY/5kNrhzcF0NbfUMiBeYTFks
 5OcB6k9vUFy600orslqrcyFSrA9AXORsvG5VYMorAACPKS1PXsL7JSbSlRnSQA==
Date: Wed, 6 Apr 2022 10:30:38 +0200
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3] drm: of: Properly try all possible cases for
 bridge/panel detection
Message-ID: <Yk1Prpew7Sn//tZN@aptenodytes>
References: <20220329132732.628474-1-paul.kocialkowski@bootlin.com>
 <YkZulslrzeurp43U@ripper> <YkatbpubQjwBWOiK@aptenodytes>
 <Ykx1yQGROqyiu/yJ@orome>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0yOxSLaMWlYo0LFA"
Content-Disposition: inline
In-Reply-To: <Ykx1yQGROqyiu/yJ@orome>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--0yOxSLaMWlYo0LFA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Thierry,

On Tue 05 Apr 22, 19:00, Thierry Reding wrote:
> On Fri, Apr 01, 2022 at 09:44:46AM +0200, Paul Kocialkowski wrote:
> > Hi Bjorn,
> >=20
> > On Thu 31 Mar 22, 20:16, Bjorn Andersson wrote:
> > > On Tue 29 Mar 06:27 PDT 2022, Paul Kocialkowski wrote:
> > >=20
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
> > >=20
> > > Thanks for your patch Paul, it fixed a regression on a device where I
> > > have a eDP bridge with an of_graph and a aux-bus defined.
> > >=20
> > > But unfortunately it does not resolve the regression I have for the
> > > USB based DisplayPort setup described below.
> > >=20
> > >=20
> > > In the Qualcomm DisplayPort driver We're calling:
> > >=20
> > > 	devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
> > >=20
> > > and with the following DT snippet the behavior changed:
> > >=20
> > > displayport-controller@ae90000 {
> > > 	compatible =3D "qcom,sc8180x-dp";
> > > 	...
> > >=20
> > > 	operating-points-v2 =3D <&dp0_opp_table>;
> > >=20
> > > 	ports {
> > > 		#address-cells =3D <1>;
> > > 		#size-cells =3D <0>;
> > >=20
> > > 		port@0 {
> > > 			reg =3D <0>;
> > > 			dp0_in: endpoint {
> > > 				remote-endpoint =3D <&display_driver>;
> > > 			};
> > > 		};
> > > 	};
> > >=20
> > > 	dp0_opp_table: opp-table {
> > > 		...;
> > > 	};
> > > };
> > >=20
> > > Prior to the introduction of 80253168dbfd ("drm: of: Lookup if child
> > > node has panel or bridge") this would return -ENODEV, so we could
> > > differentiate the case when we have a statically defined eDP panel fr=
om
> > > that of a dynamically attached (over USB) DP panel.
> > >=20
> > > Prior to your change, above case without the opp-table node would have
> > > still returned -ENODEV.
> > >=20
> > > But now this will just return -EPROBE_DEFER in both cases.
> >=20
> > Oh that's right, the -ENODEV case was just completely removed by my cha=
nge.
> > Initially this would happen if !of_graph_is_present or if the remote no=
de
> > doesn't exist.
> >=20
> > Now that we are also checking for child nodes, we can't just return -EN=
ODEV
> > when the graph or remote node is missing: we must also check that there=
 is no
> > child node that is a panel/bridge.
> >=20
> > For the graph remote case, we can reliabily return -EPROBE_DEFER when
> > of_graph_is_present and the remote exists and of_device_is_available.
> > Otherwise we can go for -ENODEV. I think getting -EPROBE_DEFER at this =
point
> > should stop the drm_of_find_panel_or_bridge process.
> >=20
> > On the other hand for the child panel/bridge node case, I don't see how=
 we
> > can reliably distinguish between -EPROBE_DEFER and -ENODEV, because
> > of_drm_find_panel and of_drm_find_bridge will behave the same if the ch=
ild
> > node is a not-yet-probed panel/bridge or a totally unrelated node.
> > So I think we should always return -EPROBE_DEFER in that case.
> >=20
> > As a result you can't get -ENODEV if using the of graph while having any
> > (unrelated) child node there, so your issue remains.
> >=20
> > Do you see any way we could make this work?
> >=20
> > > I thought the appropriate method of referencing the dsi panel was to
> > > actually reference that using the of_graph, even though it's a child =
of
> > > the dsi controller - that's at least how we've done it in e.g. [1].
> > > I find this to be much nicer than to just blindly define that all
> > > children of any sort of display controller must be a bridge or a pane=
l.
> >=20
> > Yes I totally agree. Given that using the child node directly apparently
> > can't allow us to distinguish between -EPROBE_DEFER/-ENODEV I would be =
in
> > favor of dropping this mechanism and going with explicit of graph in an=
y case
> > (even if it's a child node). I don't see any downside to this approach.
> >=20
> > What do yout think?
>=20
> This patch has recently starting causing failures on various Tegra
> devices that use drm_of_find_panel_or_bridge() for the case where the
> output might be connected to an eDP or LVDS panel. However, that same
> output could also be connected to an HDMI or DP monitor, in which case
> we obviously don't want a DT representation because it's all
> discoverable.
>=20
> If I understand correctly, that's similar to what Bjorn described. In my
> case I was able to fix the regression by returning -ENODEV at the very
> end of the function (i.e. no matching ports were found and no graph is
> present).

Okay so I'll send a patch that returns -ENODEV when possible, but there
is still a case where we can't distinguish between -EPROBE_DEFER and -ENODE=
V,
which calls for removing the whole child node-based mechanism.

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--0yOxSLaMWlYo0LFA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmJNT64ACgkQ3cLmz3+f
v9GHXAf+I7lNzoF+dBJbZYSkY3LfZOYIFKgzdHp6vgNm0qCjCqH3OeQoLqIpSA9D
hc4ePKaNeO1hCWbdAIqUnlbcrVRX8WDxZnzsKT9mDltsr928el9BeSMybUiIzRzz
1n/Oaxm2sz+5q8Pd9Zo98eZKArECSqPN89oBCq2ur0xPDsVVrwnlDG6GGu01O7HT
m+4TqKE+zI50cFQ0bf8vOIIDS9A4XVQhJ91fMr4Qt8uoImiiTMbudooG55WTNyaM
R4/1NPFvB+awBLh44lXq69dcWR91HB5v0qExhXFQuuvrE1+5x/d0rg4sCpNrTq3k
Wu2OJ+0FIrQehcMtxias/2CVFmWwQw==
=j6eO
-----END PGP SIGNATURE-----

--0yOxSLaMWlYo0LFA--
