Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E9016F2DC
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 00:02:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A7906E03B;
	Tue, 25 Feb 2020 23:02:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 448606E03B
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 23:02:41 +0000 (UTC)
Received: from earth.universe (unknown [185.62.205.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DA92A20838;
 Tue, 25 Feb 2020 23:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582671761;
 bh=Iv76P/KnGuVmrizES/J6M1T/2JeyyQFG+D1jNICgXPk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NP0hcXZLzk3oyikYtLt4H3rxtr3sutW+Q2P/X3Gg9tg95oTR/TPHRPoTGCJr8uIwv
 wDQfkRJo5XYx9izFyE6ls45CWOm4s4qq+HHrhTw0++j9kH90PBhkx4D3xFF3C/nqJU
 7zYMbIo7oLEK/zd9Ww47dITrP/NwDF2X3NT7lmpQ=
Received: by earth.universe (Postfix, from userid 1000)
 id 8D6A63C0C83; Wed, 26 Feb 2020 00:01:24 +0100 (CET)
Date: Wed, 26 Feb 2020 00:01:24 +0100
From: Sebastian Reichel <sre@kernel.org>
To: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCHv2 00/56] drm/omap: Convert DSI code to use drm_mipi_dsi
 and drm_panel
Message-ID: <20200225230124.fkt35ihyjnokb2ng@earth.universe>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
 <20200225001011.GF37466@atomide.com>
 <20200225022822.wh7omykthv7skojy@earth.universe>
 <20200225154237.GH37466@atomide.com>
MIME-Version: 1.0
In-Reply-To: <20200225154237.GH37466@atomide.com>
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
Cc: kernel@collabora.com, "H. Nikolaus Schaller" <hns@goldelico.com>,
 Merlijn Wajer <merlijn@wizzup.org>, dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0938665393=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0938665393==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ig3uwjrwvdoaax6g"
Content-Disposition: inline


--ig3uwjrwvdoaax6g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Feb 25, 2020 at 07:42:37AM -0800, Tony Lindgren wrote:
> * Sebastian Reichel <sre@kernel.org> [200225 02:29]:
> > On Mon, Feb 24, 2020 at 04:10:11PM -0800, Tony Lindgren wrote:
> > > BTW, I think there's also some refcount issue in general where
> > > the omapdrm related modules cannot be unloaded any longer?
> >=20
> > I wouldn't be too surprised. The dependencies are quite interesting
> > at the moment with omapdss registering omapdrm and then omapdrm
> > registers the drm_device, which references the encoders from
> > omapdss. I think this is something to look at once Laurent's and
> > my branch have been merged to avoid increasing the complexity.
> > Technically it should be possible to link everything into one
> > module.
>=20
> Well the DSS is really DOSSI for Display Output SubSystem
> Interconnect :) The devices on the interconnect are mostly
> independent and ideally the toplevel dss driver would just
> provide Linux generic resources to dispc and various output
> drivers. So probably not a good idea to try to build it all
> into a single module.

All the output drivers and dispc are already in a single module:
omapdss.ko. There is omapdss-base.ko, omapdss.ko and omapdrm.ko
module. omapdss-base.ko contains a few helpers, omapdss.ko contains
dispc and all output encoders, omapdrm has the tiler code and
wraps some of the custom DSS APIs to DRM APIs. I think the best
way forward is to eliminate the custom API and use common DRM
APIs directly. Then merge all 3 modules into one module.

In theory one could add modules for each encoder, but practically
this only increases complexity. DRM cannnot hotplug encoders, so
removing any module results in complete loss of DRM. Also during
probe we need to load all modules, since something might be
connected. So having extra modules is not really useful?

-- Sebastian

--ig3uwjrwvdoaax6g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl5Vpz4ACgkQ2O7X88g7
+pqyWw/8CpE5swdKf450a1xBFcxYUp8leUTzSt9xXyXUNtOT1YB2H52G7oClWxxS
MWEHa4Da2MBTzjio+58NB3zP6i4tgrhOTp//ys/fDXYygHOQammR8yQS7hJ6KdYv
eWQYLN6iERjJAqG+n3wI9JItbmMaMNO4IL2r6DtnDX1GSTShiTNJRfKfz6Y/hjyz
pdGwtVzLEf7Cu7dibMD3SUkUnD58nfjOo2wRspJCWWHM2ZhuJgIufLA3FofZp6MD
m1Xl4ZSD4Yyc7HnCv5YPuWPV1aZ+LQwPmKcZf9BJLdxXxLvTmxtknQlYNwIy92mr
uvnGN2iGyJ/U35fwPxS9zWtmf+reZBDcXy5Mx4tmvtcL2rdcpZ4/QYAefp2nstqI
uzN42hTXmC86+9S51+2TKUsA75U/HkwjK+6toPY842TE4qJQso5ulQjh5pXziYE9
E3CzyBnBe028FQ/er1O0okKjcku4ctTl3G1tp06nBe2oEJ18ksWBzcmpB+Ye69q8
eg1SNU3aezTqa1va5VGiEbHLhf/dlw9+wli55rx55/EguSTjxozyknxQjjK2rQcy
L+HX1XGvTAvtd0qW3odn8x54ZREHhysINsbPcMuOUcadPj7fh6szfUMP7aqQkGDh
ixQ22wsIg6bLbWxwdImvrnFNuh9Mg5PJZY4B6W/fZYnhlH3aL0Y=
=xIxH
-----END PGP SIGNATURE-----

--ig3uwjrwvdoaax6g--

--===============0938665393==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0938665393==--
