Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AD71F82C1
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jun 2020 12:18:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB596E422;
	Sat, 13 Jun 2020 10:17:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E986E83C
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 14:11:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 3800A2A4ACF
Date: Thu, 11 Jun 2020 10:11:27 -0400
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: Re: [PATCH 1/2] panfrost: Make sure GPU is powered on when reading
 GPU_LATEST_FLUSH_ID
Message-ID: <20200611141127.GA1834@kevin>
References: <20200611085900.49740-1-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20200611085900.49740-1-tomeu.vizoso@collabora.com>
X-Mailman-Approved-At: Sat, 13 Jun 2020 10:16:46 +0000
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>
Content-Type: multipart/mixed; boundary="===============0725795410=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0725795410==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OgqxwSJOaUobr8KG"
Content-Disposition: inline


--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Both patches are Reviewed-by: Alyssa Rosenzweig
<alyssa.rosenzweig@collabora.com>

On Thu, Jun 11, 2020 at 10:58:43AM +0200, Tomeu Vizoso wrote:
> Bifrost devices do support the flush reduction feature, so on first job
> submit we were trying to read the register while still powered off.
>=20
> If the GPU is powered off, the feature doesn't bring any benefit, so
> don't try to read.
>=20
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_gpu.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/pa=
nfrost/panfrost_gpu.c
> index f2c1ddc41a9b..e0f190e43813 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> @@ -10,6 +10,7 @@
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> =20
>  #include "panfrost_device.h"
>  #include "panfrost_features.h"
> @@ -368,7 +369,16 @@ void panfrost_gpu_fini(struct panfrost_device *pfdev)
> =20
>  u32 panfrost_gpu_get_latest_flush_id(struct panfrost_device *pfdev)
>  {
> -	if (panfrost_has_hw_feature(pfdev, HW_FEATURE_FLUSH_REDUCTION))
> -		return gpu_read(pfdev, GPU_LATEST_FLUSH_ID);
> +	u32 flush_id;
> +
> +	if (panfrost_has_hw_feature(pfdev, HW_FEATURE_FLUSH_REDUCTION)) {
> +		/* Flush reduction only makes sense when the GPU is kept powered on be=
tween jobs */
> +		if (pm_runtime_get_if_in_use(pfdev->dev)) {
> +			flush_id =3D gpu_read(pfdev, GPU_LATEST_FLUSH_ID);
> +			pm_runtime_put(pfdev->dev);
> +			return flush_id;
> +		}
> +	}
> +
>  	return 0;
>  }
> --=20
> 2.21.0
>=20

--OgqxwSJOaUobr8KG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl7iO4YACgkQ/v5QWgr1
WA0tPBAArzmVDiuBFirXaT97r1Ge78bboVEyZU99PhlWzzQsuA9Cxn5THkpl1Od+
BYGXVCycozrZNwEvHnTzI6NruL1ZgLK9NrIT/afZSK4dzg6lLiZplyi7dCul/YAU
J/UWU5/g4ae8aPWMXz2v1wiwcpA0N2PS/5WQxKwm6f45B7aBudchG7Ofdhpg8LrW
EFP7ScKMWYmnGYzfwUZ2uXawnHpBrNoXS1ZQ21EfA22V4LOJvmH7zzh2o/ldhq5P
3FHu8MdNyiNgrSyU07Fe+zJ3jt5MkGI4EiR36r90vvBlv3C75ov7wtPcPgyEsURI
b51D5+osyt1Q9GmHYrpxFo73H/qPYqxCnZW1cVSrd74h2VKdv/QzSeALg2VHfQNW
W9d1U3SjD+BKzwgCvNCEppken3nG5nsHPc39CXwoetZ5hOrzy0iQMCJ2rzjxLC3d
TCIzOU6MbHvUVNYqeBqe+bkftoN98Gf9+JUnKyZJSbolkbaUF0vZyI3xoP5ga+wm
PMyx89WjZauM0VQP6rUbkDmzhzQihvWYId276r37CTYrKY/jLo52b5RChWDUnIJb
dfMZ6BF7fDoUPszOSEeaqkYmf8HtyLYl95h7FMLD56ewdMDUAKSujXyXq9D3+wYc
1JSQEGBHIPhMw783zOmGWp+nVozQ/O2+9R28NJLYbDdQClQ4Gcc=
=K7V+
-----END PGP SIGNATURE-----

--OgqxwSJOaUobr8KG--

--===============0725795410==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0725795410==--
