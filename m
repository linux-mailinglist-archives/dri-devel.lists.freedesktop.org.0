Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA1FA93BD6
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 19:17:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 563A010E238;
	Fri, 18 Apr 2025 17:17:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="D/5dyZLX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 586 seconds by postgrey-1.36 at gabe;
 Fri, 18 Apr 2025 17:17:12 UTC
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14E2A10E238
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 17:17:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 69D3610273DBF; 
 Fri, 18 Apr 2025 19:07:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1744996036; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=CY3ybeEvZswn7mTzJEo870uU1YtFroIwRrSUBzp5+v0=;
 b=D/5dyZLXHPrXzHpWT4ABFOWkh6sluYURfX7f2u8rkqFUrONd5tplGzJ+DMlLx+3LbBctVT
 BHu5lKRc+CEFJ345J9lnXrregcz5YxGZlqh1p2FyVhyCKSDPV3HsWUlqzn3xNf7YFAhbxo
 YEhu8w2fVyeazJmWW+F/GK+AKA/BhPGNYj/A9rIE/K8LcCAHS1qxD4zDmdTDs3uzU6iOFW
 8/YPNQD93G1kSUzwmSkl0UWJX7mnDS5PQDGot/iqnjYO1dDmRC31Rg/Jz2P0YM+XUTySgZ
 FJyhU0C8ql8OHN4VsI3KE4oT4bZlZySOCUbaom+Ult6gxc4N8z4P90ozoUF2Vg==
Date: Fri, 18 Apr 2025 19:07:10 +0200
From: Pavel Machek <pavel@denx.de>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Leonid Arapov <arapovl839@gmail.com>, Helge Deller <deller@gmx.de>,
 krzysztof.kozlowski@linaro.org, u.kleine-koenig@baylibre.com,
 linux@treblig.org, linux-omap@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH AUTOSEL 5.10 8/8] fbdev: omapfb: Add 'plane' value check
Message-ID: <aAKGvh0fdMZPT9Jd@duo.ucw.cz>
References: <20250403192031.2682315-1-sashal@kernel.org>
 <20250403192031.2682315-8-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="ZBo/N4CwvGP6QfRI"
Content-Disposition: inline
In-Reply-To: <20250403192031.2682315-8-sashal@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ZBo/N4CwvGP6QfRI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Function dispc_ovl_setup is not intended to work with the value OMAP_DSS_=
WB
> of the enum parameter plane.
>=20
> The value of this parameter is initialized in dss_init_overlays and in the
> current state of the code it cannot take this value so it's not a real
> problem.
>=20
> For the purposes of defensive coding it wouldn't be superfluous to check
> the parameter value, because some functions down the call stack process
> this value correctly and some not.
>=20
> For example, in dispc_ovl_setup_global_alpha it may lead to buffer
> overflow.
>=20
> Add check for this value.
>=20
> Found by Linux Verification Center (linuxtesting.org) with SVACE static
> analysis tool.

As changelog explains, this is robustness, not really a bug fix. We
should not need it in -stable. (Or maybe rules file should be updated,
because noone seems to be following this rule).

Best regards,
								Pavel
							=09
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
> @@ -2751,9 +2751,13 @@ int dispc_ovl_setup(enum omap_plane plane, const s=
truct omap_overlay_info *oi,
>  		bool mem_to_mem)
>  {
>  	int r;
> -	enum omap_overlay_caps caps =3D dss_feat_get_overlay_caps(plane);
> +	enum omap_overlay_caps caps;
>  	enum omap_channel channel;
> =20
> +	if (plane =3D=3D OMAP_DSS_WB)
> +		return -EINVAL;
> +
> +	caps =3D dss_feat_get_overlay_caps(plane);
>  	channel =3D dispc_ovl_get_channel_out(plane);
> =20
>  	DSSDBG("dispc_ovl_setup %d, pa %pad, pa_uv %pad, sw %d, %d,%d, %dx%d ->"

--=20
DENX Software Engineering GmbH,        Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--ZBo/N4CwvGP6QfRI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaAKGvgAKCRAw5/Bqldv6
8k5AAKCQX8B0UtiYfqSSUIgj9Cciyl+X/ACgtg4ARUVHHH5jlNdHfPqoc3tE+/Y=
=SFK+
-----END PGP SIGNATURE-----

--ZBo/N4CwvGP6QfRI--
