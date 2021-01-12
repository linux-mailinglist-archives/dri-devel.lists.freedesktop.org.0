Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D531A2F4615
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 09:21:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 210AE89DFB;
	Wed, 13 Jan 2021 08:21:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E09A6E1CF
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 12:02:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 12E091F45198
Received: by earth.universe (Postfix, from userid 1000)
 id C46B83C0C94; Tue, 12 Jan 2021 13:02:46 +0100 (CET)
Date: Tue, 12 Jan 2021 13:02:46 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCHv1] video: omapfb2: Make standard and custom DSI command
 mode panel driver mutually exclusive
Message-ID: <20210112120246.ujhjyylrlgfrfvig@earth.universe>
References: <20210108122540.657501b2@canb.auug.org.au>
 <20210108112441.14609-1-sebastian.reichel@collabora.com>
 <20210108195839.GA1429715@ravnborg.org>
MIME-Version: 1.0
In-Reply-To: <20210108195839.GA1429715@ravnborg.org>
X-Mailman-Approved-At: Wed, 13 Jan 2021 08:21:20 +0000
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-fbdev@vger.kernel.org,
 Tomi Valkeinen <tomba@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-next@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, kernel@collabora.com
Content-Type: multipart/mixed; boundary="===============1311424816=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1311424816==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iijg5xf7wxvodjnw"
Content-Disposition: inline


--iijg5xf7wxvodjnw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[replace Tomi's TI mail address with something working]

Hi,

On Fri, Jan 08, 2021 at 08:58:39PM +0100, Sam Ravnborg wrote:
> Hi Sebastian,
>=20
> On Fri, Jan 08, 2021 at 12:24:41PM +0100, Sebastian Reichel wrote:
> > Standard DRM panel driver for DSI command mode panel used by omapfb2 is=
 also
> > available now. Just like the other panels its module name clashes with =
the
> > module from drivers/video/fbdev/omap2/omapfb/displays, part of the depr=
ecated
> > omapfb2 fbdev driver. As omapfb2 can only be compiled when the omapdrm =
driver
> > is disabled, and the DRM panel drivers are useless in that case, make t=
he
> > omapfb2 panel depend on the standard DRM panels being disabled to fix
> > the name clash.
> >=20
> > Fixes: cf64148abcfd ("drm/panel: Move OMAP's DSI command mode panel dri=
ver")
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
>=20
> For a backport this looks good:
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

Thanks.

> But why is it it we need omapfb at all when we have omapdrm?

I think there are two reasons omapfb has not been killed yet. One
reason was missing support for manually updated DSI panels, which
have been working since 1 or 2 kernel releases now. The other reason
is some people using it in combination with an out-of-tree PowerVR
kernel driver. There is currently work going on to use a more recent
PowerVR driver based on omapdrm driven by Maemo Leste people.

> Can we sunset all or some parts of omap support in video/?
> If not, what is missing to do so.

IDK the exact status of the PowerVR work and have not been using
omapfb myself for years. I don't think there is a reason to rush
this, so my suggestion is removing it in 3 steps giving people
the chance to complain:

1. Add 'depends on EXPERT' to 'FB_OMAP2' and add deprecation notice
   referencing omapdrm in help text in 5.12
2. Add 'depends on BROKEN' in 5.13
3. Drop drivers/video/fbdev/omap2 afterwards

-- Sebastian

--iijg5xf7wxvodjnw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl/9j9YACgkQ2O7X88g7
+prP1A//Vgw/MQFN4Vxba+rQpa+HIzqlPLKGsiMXfU4Xhix/+Csd+gL8u+8rWNjG
+Fx+MeNgwQPnyGXnHoi822auQ2s5XVJkRjXH5tKxmW5Emu0W+xKvZMlZ552WlJ0u
w9Y6689o+enXxXizPHM4o1fyl6K5NPBZu/9z8xjn0IkWnZU8zYMo+/fEetRGMW06
VbZvZkKynGV8kjWXhwATJx/Xk+ZU7ZvY5z+d6LP26alM5fxVhl1ODxPEo5ADPvX8
Ue8fpNzXowu+GcfHZbWlFdZlG6Vr1IsiOG/gyzWKVTR3wIyzFTBSiYBJMGIcKfI1
FtnrO6Pqrp9mxDSzW9MpaIF97+QZ84QvN98ot5BLl7FTP/NCBUk312Wv9xaWC7Du
MKZ9RzIB1rhOni/5sGOsEQkNT+77GlKfU87HwbyDzYzYBTrWkfYMOPkdmRG6RXhg
nyBgPSY4cbeA8n25j+YUV85P6k1OtTLcaosDAw22RNe8IGe7NvWvcPvzhNpXa1oa
nHMMuqVT0ZblCP35vW8HfqQ5mkhzeVE5HM6qGooddTRPZx0zEo5CbbWn0qg983ln
DV33qMVCzUpqUpwJw1TSjfZJM8ieHVcajQ7hvRWkpw/+Grr//ejCcnmht+nbSRIe
HNqAi8JOmKLHfELAMaNRpJZniA+BWGSPW27h7sRdXelW8p2dzSA=
=lu/2
-----END PGP SIGNATURE-----

--iijg5xf7wxvodjnw--

--===============1311424816==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1311424816==--
