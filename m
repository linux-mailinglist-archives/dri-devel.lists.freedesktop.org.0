Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0961CEA0F
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 19:04:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D25B89F97;
	Mon,  7 Oct 2019 17:04:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62D4D89F97
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 17:04:50 +0000 (UTC)
Received: from earth.universe (dyndsl-037-138-090-170.ewe-ip-backbone.de
 [37.138.90.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4FF22206C0;
 Mon,  7 Oct 2019 17:04:49 +0000 (UTC)
Received: by earth.universe (Postfix, from userid 1000)
 id F3A573C0CA1; Mon,  7 Oct 2019 19:04:46 +0200 (CEST)
Date: Mon, 7 Oct 2019 19:04:46 +0200
From: Sebastian Reichel <sre@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH] drm: panels: fix spi aliases of former omap panels
Message-ID: <20191007170446.yotb24s6jhe6nx3r@earth.universe>
References: <20191007164130.31534-1-andreas@kemnade.info>
MIME-Version: 1.0
In-Reply-To: <20191007164130.31534-1-andreas@kemnade.info>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570467889;
 bh=BOSxj+PbQ1BvxlkuWcNqwjbGF5ytNDQBfi3Ioz8A9RQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dsRX/zC2HcBFZgChcpJyDI+i4gajoUvhCBmhI0kaqlSq24fZGjaMG80cwgJwVvb2j
 BetaNhEyORIuE/5xKMaKtOEaElhGn8xiS56iXu2AQ6zyhgUVS2rsAVdybamTWDxypj
 jpFnpsHHD+tK1HZ4ROhFb928jUi60cHNIQqXi04w=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Linux-OMAP <linux-omap@vger.kernel.org>, airlied@linux.ie,
 omi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Tony Lindgren <tony@atomide.com>, thierry.reding@gmail.com,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 sam@ravnborg.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============1247625128=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1247625128==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iql274jatv4mpjov"
Content-Disposition: inline


--iql274jatv4mpjov
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Oct 07, 2019 at 06:41:30PM +0200, Andreas Kemnade wrote:
> When the panels were moved from omap/displays/ to panel/
> omapdss prefix was stripped, which cause spi modalias
> to not contain the vendor-prefix anymore.
>=20
> so we had e.g. in former times:
> compatible=3Domapdss,tpo,td028ttec1 -> modalias=3Dspi:tpo,td028ttec1
> now:
> compatible=3Dtpo,td028ttec1 -> modalias=3Dspi:td028ttec1
>=20
> This is consistent with other drivers. Tested the td028ttec.c
> only, but the pattern looks the same for the other ones.
>=20
> Fixes: 45f16c82db7e8 ("drm/omap: displays: Remove unused panel drivers")
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---

Patch looks good to me, but you have one false positive.

> [...]
>
> diff --git a/drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c b/drivers/gp=
u/drm/panel/panel-sharp-ls037v7dw01.c
> index 46cd9a2501298..838d39a263f53 100644
> --- a/drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c
> +++ b/drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.c
> @@ -204,7 +204,7 @@ static int ls037v7dw01_remove(struct platform_device =
*pdev)
>  }
> =20
>  static const struct of_device_id ls037v7dw01_of_match[] =3D {
> -	{ .compatible =3D "sharp,ls037v7dw01", },
> +	{ .compatible =3D "ls037v7dw01", },
>  	{ /* sentinel */ },
>  };
> =20

The DT compatible should have a vendor prefix.

> [...]

-- Sebastian

--iql274jatv4mpjov
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl2bcCsACgkQ2O7X88g7
+pqKSQ/9HclHNhGRa3L+55z5K08PEFcrfqZTjrhBUnQW/JOnaun8CyHC229w9gfF
cZ8Z3E0HY6xKlIFHP6K3kjdjcPghU58QXAhneBIf8zr0OiChnuleAe3gZ89WAB8f
Zy/PCAj+tNLWaUzhlwYe0VW+IXkDbXrF5VCkwUIs96QFNAduLraco7wMxpnl1Kcl
FQScSqD7wEXQD55dqnJwEVrYfi1C3JjdrtTPXTAZj3mBcpKekYLQ0JzVAx7JqpwQ
PkRXYjCrVwQ7VfO0gXkqxEjXucK+K/gN6dcIz0wj6Evrl+Pj0e3GKl8RPzWZnk0h
dAtJ/HXclZyh+qlQKLj0dmFuVHebBlWaLO30Kl4WiuKsGXAq2NfpXS9+Nq4ZaRXM
X/pH730gVRGvA6/nlPkkkHoqL/0p2/APW40uPBdzUoKCWpOUGoFbG1rknKfVR7Ug
MNCpJXPv7Jgu9U7pd/mkmlLE08Yu76tshniFFZPz8kzkrkkRwrxIimO/65VTIrFr
hpzDkZPD8DLDb2q287r7UwL3zgccP85jMrPj+l+XPyhZTErWk6HTadm+JRqAWSX3
c1Bh47Pb3PPdxSoOp6tddkbeYWutsufe9CA+lXG46tH8X0VKYQ7KtIj+BzclQLkd
NbbAU4Ja6+mExXInkjgnjB1DGIZ/qSZF9TtwmbZUS6Pe5Rp3NEA=
=vfl2
-----END PGP SIGNATURE-----

--iql274jatv4mpjov--

--===============1247625128==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1247625128==--
