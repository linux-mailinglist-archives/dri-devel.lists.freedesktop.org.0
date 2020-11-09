Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9201E2ABAEC
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 14:27:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D598289916;
	Mon,  9 Nov 2020 13:27:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD88F89916
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 13:27:08 +0000 (UTC)
Received: from earth.universe (dyndsl-037-138-191-067.ewe-ip-backbone.de
 [37.138.191.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1FB7A2076E;
 Mon,  9 Nov 2020 13:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604928428;
 bh=YGoAq9IhGZWUHld8b5bf2SB9KVKXDTE6tVk54H9iHPc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kpbUVZ0+ZNjiNL/foau4yNQSRPt+kLkLgVZxdaGBuCa7+6b3abPXgmwtFBn3upltL
 xiz+axyD6rhybl+8nXhMD33rZmvzM20DiF/85aEjoetuZ81hk/2dquVTazYXT8OSAc
 EBMgObvfrslAVil407noHddGtufUChbtD2nU9jLo=
Received: by earth.universe (Postfix, from userid 1000)
 id 0718B3C0C8E; Mon,  9 Nov 2020 14:27:06 +0100 (CET)
Date: Mon, 9 Nov 2020 14:27:05 +0100
From: Sebastian Reichel <sre@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v3 27/56] drm/omap: dsi: do bus locking in host driver
Message-ID: <20201109132705.6n7h3ogsrlciw5nf@earth.universe>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-28-tomi.valkeinen@ti.com>
 <20201109095255.GX6029@pendragon.ideasonboard.com>
 <3c9eefd3-99bb-edce-f6ac-2fec3678743b@ti.com>
MIME-Version: 1.0
In-Reply-To: <3c9eefd3-99bb-edce-f6ac-2fec3678743b@ti.com>
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
Cc: Tony Lindgren <tony@atomide.com>,
 "H . Nikolaus Schaller" <hns@goldelico.com>, Sekhar Nori <nsekhar@ti.com>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org, Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: multipart/mixed; boundary="===============2124464109=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2124464109==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cqwefbsz34j45lm2"
Content-Disposition: inline


--cqwefbsz34j45lm2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Nov 09, 2020 at 12:08:33PM +0200, Tomi Valkeinen wrote:
> On 09/11/2020 11:52, Laurent Pinchart wrote:
> > Hi Tomi,
> >=20
> > Thank you for the patch.
> >=20
> > On Thu, Nov 05, 2020 at 02:03:04PM +0200, Tomi Valkeinen wrote:
> >> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> >>
> >> This moves the bus locking into the host driver and unexports
> >> the custom API in preparation for drm_panel support.
> >>
> >> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
>=20
> <snip>
>=20
> >>  static int dsicm_update(struct omap_dss_device *dssdev,
> >> @@ -739,7 +704,6 @@ static int dsicm_update(struct omap_dss_device *ds=
sdev,
> >>  	dev_dbg(&ddata->dsi->dev, "update %d, %d, %d x %d\n", x, y, w, h);
> >> =20
> >>  	mutex_lock(&ddata->lock);
> >> -	src->ops->dsi.bus_lock(src);
> >> =20
> >>  	r =3D dsicm_wake_up(ddata);
> >>  	if (r)
> >> @@ -761,11 +725,9 @@ static int dsicm_update(struct omap_dss_device *d=
ssdev,
> >>  	if (r)
> >>  		goto err;
> >> =20
> >> -	/* note: no bus_unlock here. unlock is src framedone_cb */
> >> -	mutex_unlock(&ddata->lock);
> >> +	/* note: no unlock here. unlock is src framedone_cb */
> >=20
> > This change isn't described in the commit message. Could you explain why
> > it's needed ? Locking a mutex in a function and unlocking it elsewhere
> > always scares me.
>=20
> Good catch. I don't know why it is needed. I don't think it is, as
> the dsi driver handles the bus lock.
>=20
> Sebastian, what was the reason for this lock?
>=20
> Note that this goes away in the series, and there's no such lock
> in the end.

It's not really a change. What this patch basically does is to fold
src->ops->dsi.bus_lock(src) into mutex_lock(&ddata->lock), so that
there is only a single locking mechanism. This function previously
had a matching pair of mutex_lock/unlock for ddata->lock, but the
bus was not locked paired. So after conversion the lock must not be
free'd here.

My understanding is, that this is because the bus must not be used
until the update has been done.

-- Sebastian

> >>  	return 0;
> >>  err:
> >> -	src->ops->dsi.bus_unlock(src);
> >>  	mutex_unlock(&ddata->lock);
> >>  	return r;
> >>  }
> >> @@ -791,7 +753,6 @@ static void dsicm_ulps_work(struct work_struct *wo=
rk)
> >>  	struct panel_drv_data *ddata =3D container_of(work, struct panel_drv=
_data,
> >>  			ulps_work.work);
> >>  	struct omap_dss_device *dssdev =3D &ddata->dssdev;
> >> -	struct omap_dss_device *src =3D ddata->src;
> >> =20
> >>  	mutex_lock(&ddata->lock);
> >> =20
> >> @@ -800,11 +761,8 @@ static void dsicm_ulps_work(struct work_struct *w=
ork)
> >>  		return;
> >>  	}
> >> =20
> >> -	src->ops->dsi.bus_lock(src);
> >> -
> >>  	dsicm_enter_ulps(ddata);
> >> =20
> >> -	src->ops->dsi.bus_unlock(src);
> >>  	mutex_unlock(&ddata->lock);
> >>  }
> >> =20
> >> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapd=
rm/dss/dsi.c
> >> index 41431ca34568..d54b743c2b48 100644
> >> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> >> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> >> @@ -476,17 +476,13 @@ static inline u32 dsi_read_reg(struct dsi_data *=
dsi, const struct dsi_reg idx)
> >>  	return __raw_readl(base + idx.idx);
> >>  }
> >> =20
> >> -static void dsi_bus_lock(struct omap_dss_device *dssdev)
> >> +static void dsi_bus_lock(struct dsi_data *dsi)
> >>  {
> >> -	struct dsi_data *dsi =3D to_dsi_data(dssdev);
> >> -
> >>  	down(&dsi->bus_lock);
> >=20
> > Nothing to be addressed in this patch, but is there a reason to use a
> > semaphore instead of a mutex ?
>=20
> It's been a long time, but I think the reason was that mutex gave a warni=
ng after being locked for a
> bit longer time, and semaphore didn't. The resource is reserved while a D=
SI transfer is active, so
> it could be almost 2 frames (wait for vsync and then transfer frame). Or =
reading the frame buffer
> back from the panel, which could take a long time (seconds).
>=20
> There are better ways to implement it (after this series =3D).
>=20
>  Tomi
>=20
> --=20
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

--cqwefbsz34j45lm2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl+pQ54ACgkQ2O7X88g7
+poqDBAAgAX4WVCigoBuE9bhqyMRnvjX9tyZGo4U80BMMLwYd1xpg5HtDEAOIour
bG+sg/7QoAkgxSDSOHqqH0teVVksd4MAKD2xz69Og5qnSxE9evpC0hTeQDR927ob
DsqcqYk3fFzaOnKJeIjHzWmWs3QfixdXMhlgjWTMrm4yVkk/n6GC0qmXeSQQtP3G
FJvC+Mftk0HnOfGORLbzi05g+MmWF+0ORwPpv2wCJNl1/St921LaKHdN1IeuuWSk
D+FyRQ2pF5UftR8SRgSR11bVxKUTZC1Lk9W3SQ0gS0uml1OjdiSv+UAzivrqZLPn
0Pmn07zRjdhPFAEqABdoGXQUxoRRXcKg0vy4UMVO8WATdhIcGCuHdHl+nR4ljkzL
xhtzENOybC7sg7VBnplQlh6jTduIqkFcz0kvb+g4Ocisp8jtuUlhhe+WeW8BMtPn
jVbIASWI3IXdKxTDlKcGOlO2mx7DBze3+Yr05k7Klrku4DcSQ1YGjlamJOC3OKKA
vePU6XLy7U1q8ln2aywkAEJkjPOT8Ez6KKOM4IAd8JEVpcL4eJFqe9JXKd6K+fan
Xv0vg15MFHb4J+KWo9KJktFYfjTGDZx7w/igC+9mO5fF5O/mWN+MXOxBcRDMvLMi
o9dsof1jYrQsS2k/S1qjqEaZ0+gEl2E92j/YPUWAQyHPDG6xN/s=
=ssRc
-----END PGP SIGNATURE-----

--cqwefbsz34j45lm2--

--===============2124464109==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2124464109==--
