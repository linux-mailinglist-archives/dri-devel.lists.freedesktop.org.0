Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A8D2D9C4C
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 17:17:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9114C6E30C;
	Mon, 14 Dec 2020 16:17:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E52E16E2F2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 16:17:27 +0000 (UTC)
Date: Mon, 14 Dec 2020 17:17:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607962647;
 bh=c1K+krtUaBbI/TA7v2TyJKDGs1Z5TXt72dnX1Ep2DAM=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=eJJM3UAjjh1eA2Sh79sH95tAu9Z7E4Y29d3xHK/Fb8mEsDX+d0Pg5LHQYAMkvTluo
 bIyLhb4OKi6qieZY8Qj8lTqWrfXX2SMUKylZwQzJL+3Rmo1FFAuPSKHAOp5lF9SS61
 6efl+dULr/SL/SHYTPvOMItKikHof53yfM+WuLEfwyBG9PgkYwUGhVJNqmsHv9VaE5
 jgQL6EYS8TMBBAtPMop5jWjD7/4m4IunpuqbZRmDP/P+Mzt/xE0IMtJwLlXF0A7sS2
 31iH7CZ3wGbraiTTUXjpedFT9bWF/RZF3/BeFAB2jB4O2DNtxfYlItQhbaV0//lrJ0
 cSmsiztuC/eYA==
From: Sebastian Reichel <sre@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v5 21/29] drm/omap: dsi: display_enable cleanup
Message-ID: <20201214161725.hxbvstdrqp2u3y22@earth.universe>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
 <20201208122855.254819-22-tomi.valkeinen@ti.com>
MIME-Version: 1.0
In-Reply-To: <20201208122855.254819-22-tomi.valkeinen@ti.com>
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
Cc: Tony Lindgren <tony@atomide.com>, hns@goldelico.com,
 Sekhar Nori <nsekhar@ti.com>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: multipart/mixed; boundary="===============0668892927=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0668892927==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lnu4432oenmvxfuw"
Content-Disposition: inline


--lnu4432oenmvxfuw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 08, 2020 at 02:28:47PM +0200, Tomi Valkeinen wrote:
> We can drop dsi_display_enable(), which just calls
> _dsi_display_enable(), and rename _dsi_display_enable() to
> dsi_display_enable().
>=20
> The WARN_ON(!dsi_bus_is_locked(dsi)) in dsi_display_enable is extra and
> can be dropped, as _dsi_display_enable() has the same WARN_ON().
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/gpu/drm/omapdrm/dss/dsi.c | 16 +++-------------
>  1 file changed, 3 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/=
dss/dsi.c
> index 44b8e42b52ec..961b991f6498 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -3743,7 +3743,7 @@ static void dsi_display_uninit_dsi(struct dsi_data =
*dsi, bool disconnect_lanes,
>  	}
>  }
> =20
> -static void _dsi_display_enable(struct dsi_data *dsi)
> +static void dsi_display_enable(struct dsi_data *dsi)
>  {
>  	int r;
> =20
> @@ -3772,16 +3772,6 @@ static void _dsi_display_enable(struct dsi_data *d=
si)
>  	DSSDBG("dsi_display_ulps_enable FAILED\n");
>  }
> =20
> -static void dsi_display_enable(struct omap_dss_device *dssdev)
> -{
> -	struct dsi_data *dsi =3D to_dsi_data(dssdev);
> -	DSSDBG("dsi_display_enable\n");
> -
> -	WARN_ON(!dsi_bus_is_locked(dsi));
> -
> -	_dsi_display_enable(dsi);
> -}
> -
>  static void _dsi_display_disable(struct dsi_data *dsi,
>  		bool disconnect_lanes, bool enter_ulps)
>  {
> @@ -3856,7 +3846,7 @@ static void dsi_set_ulps_auto(struct dsi_data *dsi,=
 bool enable)
>  			return;
> =20
>  		dsi_bus_lock(dsi);
> -		_dsi_display_enable(dsi);
> +		dsi_display_enable(dsi);
>  		dsi_enable_te(dsi, true);
>  		dsi_bus_unlock(dsi);
>  	}
> @@ -4947,7 +4937,7 @@ static void dsi_bridge_enable(struct drm_bridge *br=
idge)
> =20
>  	dsi_bus_lock(dsi);
> =20
> -	dsi_display_enable(dssdev);
> +	dsi_display_enable(dsi);
> =20
>  	dsi_enable_video_output(dssdev, VC_VIDEO);
> =20
> --=20
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>=20

--lnu4432oenmvxfuw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl/XkBUACgkQ2O7X88g7
+pq6YA//cRHW1MZbJl5+QVXPMVkGXvAdrnMrzUoJ8twq9RVhNMlz+VRhawD4HFAD
l33Rf5pz/aMiecVoFMRNp28VXOyD0lO0boPBnwPfq/0YcYpTBbFXcEJqDEQVJiAg
eKwEC+YVPFi1wW6kzm2Ynw9nQno0ie21G8qV7CTyD68Nzknaj++AVLXgIn31m0oT
SRN/aSMEngpqCdqRr7mfBOGr4BzxzMkuPSV3Zyg2wlrrq+cSp8voLeM7mQKmIeU5
MiP57A0XXyqWNDO2j8EKfrvpdoB6onON4xXe93MNVF4ylfZH1uByhcOvY+v8dtkw
g2eBuYfCpeafcp54fvh712innZF4M0pdhfTISmWmUQDuuY8qw8iocQwNkK1qwDW3
pf+xjjYy6pIOivsD3zPWMPL79Rw7TTsYuLlBprsJeLYgrIIUv4n7OWkKmJ5e8hic
S/haAnPSESnAG/qDjCnwM3xiAvBUfVaBbJbxTXnXWW1eI4Y5iEJC1WYUxc1MW1xY
YNbslHGpEF9pbZMVeK8QxlHWI7JkndPj1MbaE6xSEI77YmT7riVv7unWn2JERsgg
YdQYkOk7eHYe4PfqKBfYN3GjWQcYCAXLMXs86l2sYBvcjlGm1o9r9fWYphfpLFgQ
rWX+78oBRrd6Wf2KMNsiF/o/ayae8TndEO35UupXuIIQU1jhnIU=
=Yhnq
-----END PGP SIGNATURE-----

--lnu4432oenmvxfuw--

--===============0668892927==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0668892927==--
