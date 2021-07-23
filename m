Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F0B3D341C
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 07:34:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 771946FA43;
	Fri, 23 Jul 2021 05:34:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59E546FA43
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 05:34:28 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1m6npG-0005rP-96; Fri, 23 Jul 2021 07:34:22 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1m6npC-0003jJ-Gc; Fri, 23 Jul 2021 07:34:18 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1m6npC-00075a-Ff; Fri, 23 Jul 2021 07:34:18 +0200
Date: Fri, 23 Jul 2021 07:34:18 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the driver-core tree
Message-ID: <20210723053418.fizdbfnu4if2hs5x@pengutronix.de>
References: <20210723150944.528c10af@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wwe4bxoweyfjcqqy"
Content-Disposition: inline
In-Reply-To: <20210723150944.528c10af@canb.auug.org.au>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Dave Airlie <airlied@linux.ie>, Greg KH <greg@kroah.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--wwe4bxoweyfjcqqy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Stephen,

On Fri, Jul 23, 2021 at 03:09:44PM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the driver-core tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>=20
> drivers/gpu/drm/drm_dp_aux_bus.c:106:13: error: initialization of 'void (=
*)(struct device *)' from incompatible pointer type 'int (*)(struct device =
*)' [-Werror=3Dincompatible-pointer-types]
>   106 |  .remove  =3D dp_aux_ep_remove,
>       |             ^~~~~~~~~~~~~~~~
> drivers/gpu/drm/drm_dp_aux_bus.c:106:13: note: (near initialization for '=
dp_aux_bus_type.remove')
>=20
> Caused by commit
>=20
>   aeb33699fc2c ("drm: Introduce the DP AUX bus")
>=20
> from the drm tree interacting with commit
>=20
>   fc7a6209d571 ("bus: Make remove callback return void")
>=20
> from the driver-core tree.
>=20
> I applied the following merge fix patch.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 23 Jul 2021 14:58:25 +1000
> Subject: [PATCH] fix for "drm: Introduce the DP AUX bus"
>=20
> interaction with "bus: Make remove callback return void"
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/gpu/drm/drm_dp_aux_bus.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_dp_aux_bus.c b/drivers/gpu/drm/drm_dp_au=
x_bus.c
> index e49a70f3691b..298ea7a49591 100644
> --- a/drivers/gpu/drm/drm_dp_aux_bus.c
> +++ b/drivers/gpu/drm/drm_dp_aux_bus.c
> @@ -67,9 +67,8 @@ static int dp_aux_ep_probe(struct device *dev)
>   *
>   * Calls through to the endpoint driver remove.
>   *
> - * Return: 0 if no error or negative error code.
>   */
> -static int dp_aux_ep_remove(struct device *dev)
> +static void dp_aux_ep_remove(struct device *dev)
>  {
>  	struct dp_aux_ep_driver *aux_ep_drv =3D to_dp_aux_ep_drv(dev->driver);
>  	struct dp_aux_ep_device *aux_ep =3D to_dp_aux_ep_dev(dev);
> @@ -77,8 +76,6 @@ static int dp_aux_ep_remove(struct device *dev)
>  	if (aux_ep_drv->remove)
>  		aux_ep_drv->remove(aux_ep);
>  	dev_pm_domain_detach(dev, true);
> -
> -	return 0;
>  }

This looks right.

Greg provided a tag containing fc7a6209d571 ("bus: Make remove callback
return void") at

	git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git tags/=
bus_remove_return_void-5.15

(see https://lore.kernel.org/lkml/YPkwQwf0dUKnGA7L@kroah.com).

It would be great if this could be merged into the drm tree with the
above diff squashed into the merge commit.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--wwe4bxoweyfjcqqy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmD6VNcACgkQwfwUeK3K
7AlfBAf/Zy8qvQXPKZUxJSnVaxZnzyG/ohkmvclUmS6qFSFq7xB/q+AeOkPrdpEG
lehUg+vcs4e4IH2aLTGJmh22cu2PV8B5JcOG7clivg6FJJhxfjUE4/9OKgXJmLub
nmxhlNhDQ9P0rtn//0oXrsTh5D7WAYASV9gCdGymGmsOsX6FjwfoH5eTes0O6Xif
GNsBwBOziDhup7TniikMZ7wGnMZK873J5ftporulm48c/ytDaoFHeHeQsxkHwmzX
2fHwJh6w7Biipd1wSYILy/bbkhq8wYtSbXq5Bh4vkAX4kgomgueirRozeuye9mDR
pQ33bclEaAX2dCKQQmj8cKnjyA6DIw==
=ach8
-----END PGP SIGNATURE-----

--wwe4bxoweyfjcqqy--
