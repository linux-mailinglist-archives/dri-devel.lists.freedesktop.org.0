Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3BA2D9C4F
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 17:20:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EFC689C86;
	Mon, 14 Dec 2020 16:20:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFE3F6E247
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 16:20:13 +0000 (UTC)
Date: Mon, 14 Dec 2020 17:20:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607962813;
 bh=vfNADmTkpeyP7GpS3Ef8nfy2Uc0h9NEszw74DHFk7I4=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=FohRqrIdXoYUL/7sfRfz/mfCb0qESPfU8vSwgb2KHSa8u5MoybITCZi/yQllfxLSy
 DeygHSyN+cTJaWi+DkL/rHfd5rzCZl1NWYS2heT35B1l0U/X7x0u+h9V3H1RcdlfDv
 gWUnQNI6XVyHyfq0qKGFZeBtM6jYXUxCdQfuKJsqTfJSeB8RZ3JQhPv7soeKcLrJqH
 LPEZM3wu3qVMpsqS7pdK9TVPc2FRIhOc3bZxR/ARqMmy3q51tls6o/q+mA2GxZWJri
 oErue5TEM9s2M6pw0dBO+iaiqKnGRlTLAdqEYn2bGK5NW0chywzcL7XRXfsn9oxSX0
 jclceXMM0N93w==
From: Sebastian Reichel <sre@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v5 22/29] drm/omap: dsi: display_disable cleanup
Message-ID: <20201214162011.2uwvtligipx4qpei@earth.universe>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
 <20201208122855.254819-23-tomi.valkeinen@ti.com>
MIME-Version: 1.0
In-Reply-To: <20201208122855.254819-23-tomi.valkeinen@ti.com>
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
Content-Type: multipart/mixed; boundary="===============1015243307=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1015243307==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bzey2a2lo6tuyv4g"
Content-Disposition: inline


--bzey2a2lo6tuyv4g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 08, 2020 at 02:28:48PM +0200, Tomi Valkeinen wrote:
> We can drop dsi_display_disable() which just calls
> _dsi_display_disable(), and rename _dsi_display_disable() to
> dsi_display_disable().
>=20
> The WARN_ON(!dsi_bus_is_locked(dsi)) in dsi_display_disable is extra and
> can be dropped, as _dsi_display_disable() has the same WARN_ON().
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/gpu/drm/omapdrm/dss/dsi.c | 19 +++----------------
>  1 file changed, 3 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/=
dss/dsi.c
> index 961b991f6498..d83346812810 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -63,8 +63,6 @@ static int dsi_vc_send_null(struct dsi_data *dsi, int v=
c, int channel);
>  static ssize_t _omap_dsi_host_transfer(struct dsi_data *dsi, int vc,
>  				       const struct mipi_dsi_msg *msg);
> =20
> -static void dsi_display_disable(struct omap_dss_device *dssdev);
> -
>  #ifdef DSI_PERF_MEASURE
>  static bool dsi_perf;
>  module_param(dsi_perf, bool, 0644);
> @@ -3772,7 +3770,7 @@ static void dsi_display_enable(struct dsi_data *dsi)
>  	DSSDBG("dsi_display_ulps_enable FAILED\n");
>  }
> =20
> -static void _dsi_display_disable(struct dsi_data *dsi,
> +static void dsi_display_disable(struct dsi_data *dsi,
>  		bool disconnect_lanes, bool enter_ulps)
>  {
>  	WARN_ON(!dsi_bus_is_locked(dsi));
> @@ -3791,17 +3789,6 @@ static void _dsi_display_disable(struct dsi_data *=
dsi,
>  	mutex_unlock(&dsi->lock);
>  }
> =20
> -static void dsi_display_disable(struct omap_dss_device *dssdev)
> -{
> -	struct dsi_data *dsi =3D to_dsi_data(dssdev);
> -
> -	WARN_ON(!dsi_bus_is_locked(dsi));
> -
> -	DSSDBG("dsi_display_disable\n");
> -
> -	_dsi_display_disable(dsi, true, false);
> -}
> -
>  static int dsi_enable_te(struct dsi_data *dsi, bool enable)
>  {
>  	dsi->te_enabled =3D enable;
> @@ -3825,7 +3812,7 @@ static void omap_dsi_ulps_work_callback(struct work=
_struct *work)
> =20
>  	dsi_enable_te(dsi, false);
> =20
> -	_dsi_display_disable(dsi, false, true);
> +	dsi_display_disable(dsi, false, true);
> =20
>  	dsi_bus_unlock(dsi);
>  }
> @@ -4959,7 +4946,7 @@ static void dsi_bridge_disable(struct drm_bridge *b=
ridge)
> =20
>  	dsi_disable_video_output(dssdev, VC_VIDEO);
> =20
> -	dsi_display_disable(dssdev);
> +	dsi_display_disable(dsi, true, false);
> =20
>  	dsi_bus_unlock(dsi);
>  }
> --=20
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>=20

--bzey2a2lo6tuyv4g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl/XkLsACgkQ2O7X88g7
+pobgQ/9G+dv+vF3dq+wBJO1r+WGpdjZcy2YdUOt0fetCVFu7ER/YcV/H8Kun1XI
jQzIe0jGNEIZI4FaCGbAxVnymWfFdyy94q+NIaqsyyDPqLPpYlK3UAB7ao4wZieP
6Ii5y0cNqFZpjB+vCJQvaPwhdFRFcpxmuXmFZRZks1xC99CIHC/0oywTZV6EZZEv
k6jMxORuRcusPZqy/fX7hCNGaIgjSu7ScK1atde8hlJjfxzOjoc/H32dZjZUrCEy
n12wzOK2B92XWTErq+dAE0MzRxFv2RmE68yFSXeA5418yPdgMkeSecjMkR+CU354
E+5CD/ebvGGvbVU/6xYWfAB9IDPsqzApdUB1XciCxVCm7pO7dS2K8UAFI0BHSLbB
Qg9JCJFf/N4QNfdHR5UvUKQptgJ3YFGwpvJgKo9tNyM+hiX+wBgemnHv5VibpKQ0
q8uLiS+9w0VT0Fiswz/XxxGiVRyR4TknP/HjX/jd29ZGBbpTzhcIXGhh7rTkQos4
CspjHPZOMEpoTTgtcbc8uuNmVlfM9ldJ0p2hp9yYOFKBVgszynwF+QsXi2k0SuCS
5oUzHF0ypR6GkOezprbeR4r0z/VhyD4hdOyBfGnxLsY1wSMi5p1ifDhE1k8yiMKj
WkHKV6RHwYBsdKkfYwYSH47CWSW8J5WB5G4+2/+IWPDI3NlFt6c=
=7haW
-----END PGP SIGNATURE-----

--bzey2a2lo6tuyv4g--

--===============1015243307==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1015243307==--
