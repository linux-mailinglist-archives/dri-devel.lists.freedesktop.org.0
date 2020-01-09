Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3E9135FCC
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 18:52:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D47DF6E947;
	Thu,  9 Jan 2020 17:51:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 136166E420
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2020 13:43:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id E424428DB47
Date: Thu, 9 Jan 2020 08:43:51 -0500
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH] drm/panfrost: Remove core stack power management
Message-ID: <20200109134351.GA3053@kevin>
References: <20200109133104.11661-1-steven.price@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200109133104.11661-1-steven.price@arm.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Thu, 09 Jan 2020 17:51:28 +0000
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: multipart/mixed; boundary="===============0385683076=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0385683076==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Content-Disposition: inline


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

A-b

On Thu, Jan 09, 2020 at 01:31:04PM +0000, Steven Price wrote:
> Explict management of the GPU's core stacks is only necessary in the
> case of a broken integration with the PDC. Since there are no known
> platforms which have such a broken integration let's remove the explict
> control from the driver since this apparently causes problems on other
> platforms and will have a small performance penality.
>=20
> The out of tree mali_kbase driver contains this text regarding
> controlling the core stack (CONFIGMALI_CORESTACK):
>=20
>   Enabling this feature on supported GPUs will let the driver powering
>   on/off the GPU core stack independently without involving the Power
>   Domain Controller. This should only be enabled on platforms which
>   integration of the PDC to the Mali GPU is known to be problematic.
>   This feature is currently only supported on t-Six and t-HEx GPUs.
>=20
>   If unsure, say N.
>=20
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_gpu.c | 5 -----
>  1 file changed, 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/pa=
nfrost/panfrost_gpu.c
> index 8822ec13a0d6..460fc190de6e 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> @@ -309,10 +309,6 @@ void panfrost_gpu_power_on(struct panfrost_device *p=
fdev)
>  	ret =3D readl_relaxed_poll_timeout(pfdev->iomem + L2_READY_LO,
>  		val, val =3D=3D pfdev->features.l2_present, 100, 1000);
> =20
> -	gpu_write(pfdev, STACK_PWRON_LO, pfdev->features.stack_present);
> -	ret |=3D readl_relaxed_poll_timeout(pfdev->iomem + STACK_READY_LO,
> -		val, val =3D=3D pfdev->features.stack_present, 100, 1000);
> -
>  	gpu_write(pfdev, SHADER_PWRON_LO, pfdev->features.shader_present);
>  	ret |=3D readl_relaxed_poll_timeout(pfdev->iomem + SHADER_READY_LO,
>  		val, val =3D=3D pfdev->features.shader_present, 100, 1000);
> @@ -329,7 +325,6 @@ void panfrost_gpu_power_off(struct panfrost_device *p=
fdev)
>  {
>  	gpu_write(pfdev, TILER_PWROFF_LO, 0);
>  	gpu_write(pfdev, SHADER_PWROFF_LO, 0);
> -	gpu_write(pfdev, STACK_PWROFF_LO, 0);
>  	gpu_write(pfdev, L2_PWROFF_LO, 0);
>  }
> =20
> --=20
> 2.20.1
>=20

--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl4XLgoACgkQ/v5QWgr1
WA3VcA//cEcrQwxrlJ8ndUPseWUHj3sldo778/VRcu6Z6yHCW21o8/xZVa0xQdHX
GQuCTw0vDldVAPmxzKhnt41khOHBtYCqeppjYUdC8BQm7IIe+AbN0DoxYR5xRDaB
Bo8NcZ7ytOSkzI6Ww91jZVx5jq2k8l5Tj628QbWrDa2t1RP2xzUuet9zWH+9IAyE
IjNYszKjYk9MloCyt3AwPSDkHuyKXb9Zc970qHGNAWZC868wIktaQVI6aUl79+uE
UeHzGimWKPVPQnIkuQxCS6MaG0sLdcgRjjsTtfIS6TllYLZ/0mWhbE/6smFmmXIb
EPfuBVjrK9q4WcXy3DhJHrUnpiDdWm/I7xoy8neKbEb4UHJ0qlsi46NRbYv1fge4
fF0fyWw6VHnti9JRkuqsYWdJ052FEvFEqg3+Dal1oC4HG3Rta+rD72mvmsJtZ1sW
JGOXycotJAvQP2U86S7Oml3PcJG9jy4bLvpOk+jU/kTdW12eLhvdouWko/JsCTNI
s7x3AvY5Lj7MgNpPt9AKu1GRLHlEPqvG3jVAztc5i1QxaKKhRtYGyb++fBHpBA8B
PyrJfcHNckWLgF1kY2cfrIeCZcI9yYSM0Oq2+LpOoTJjFTGbq4te0P5pJR0O0nj3
dAY5fKG3kpp7ObzRhho4ANxt1gpZ41AZvT7NMK6zn98i/xYh0Bw=
=nFTn
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--

--===============0385683076==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0385683076==--
