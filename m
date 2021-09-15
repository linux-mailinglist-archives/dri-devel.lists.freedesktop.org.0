Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F93E40C229
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 10:57:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 128296E8EB;
	Wed, 15 Sep 2021 08:57:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 821666E8EB
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 08:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
 bh=3FPgUcEP/4l20/MeFbecSZBXGYRkb+JiuiXdE3qdmyk=; 
 b=HLaZHY1k8NEmUpJBVPHSd6khaeDE83f2vRNiNbWB1vwQS28xXZn0InGzt/M0DrnYv/CGaHI0esE8+Z5OeCcy4PwoyNYPZcj0hD86ASO9Hm1/PKnLBq5Rk1+ryjI2p6Lzq3EdBf2sO9EuHvgK4RnlZqh/xAG6rKAajxmXQ5YBAwg15Ksm+5API4S89JsGK7gu92BlRq3nnGpOCYZQBjJlUmRzod2eWmlRqKCPGpo8SNgTuXUypRp7BDrtuFIjGKZzHy8wc4KKOhY6FO2JEFwUcP7tN6tQUlgzJWSgTRk5UgwTeKKqhFsg9lXfgs6iL7aNqJZ2Xic7Q4DWFIYMjjHVNA==;
Received: from a95-92-181-29.cpe.netcabo.pt ([95.92.181.29]
 helo=mail.igalia.com) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mQQje-0004A4-M9; Wed, 15 Sep 2021 10:57:42 +0200
Date: Wed, 15 Sep 2021 09:57:07 +0100
From: Melissa Wen <mwen@igalia.com>
To: Iago Toral Quiroga <itoral@igalia.com>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/v3d: fix wait for TMU write combiner flush
Message-ID: <20210915085707.7ph5sx4nnetb2mbn@mail.igalia.com>
References: <20210914055549.4340-1-itoral@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xuofpj6nig6uj3yk"
Content-Disposition: inline
In-Reply-To: <20210914055549.4340-1-itoral@igalia.com>
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


--xuofpj6nig6uj3yk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 09/14, Iago Toral Quiroga wrote:
> The hardware sets the TMUWCF bit back to 0 when the TMU write
> combiner flush completes so we should be checking for that instead
> of the L2TFLS bit.
>=20
> Fixes spurious Vulkan CTS failures in:
> dEQP-VK.binding_model.descriptorset_random.*
Hi Iago,

makes sense to me.

can you add the fix tag?
Fixes: d223f98f02099 ("drm/v3d: Add support for compute shader dispatch")=
=20

also, you forgot to add your Signed-off-by tag.
> ---
>  drivers/gpu/drm/v3d/v3d_gem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
> index a3529809d547..5159f544bc16 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -197,7 +197,7 @@ v3d_clean_caches(struct v3d_dev *v3d)
> =20
>  	V3D_CORE_WRITE(core, V3D_CTL_L2TCACTL, V3D_L2TCACTL_TMUWCF);
>  	if (wait_for(!(V3D_CORE_READ(core, V3D_CTL_L2TCACTL) &
> -		       V3D_L2TCACTL_L2TFLS), 100)) {
> +		       V3D_L2TCACTL_TMUWCF), 100)) {
>  		DRM_ERROR("Timeout waiting for L1T write combiner flush\n");
hm.. would it be clearer to say "TMU write combiner" here?

in the next version, you can already include:
Reviewed-by: Melissa Wen <mwen@igalia.com>

Thanks,

Melissa
>  	}
> =20
> --=20
> 2.25.1
>=20

--xuofpj6nig6uj3yk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmFBtV4ACgkQwqF3j0dL
ehzlww/9HefTR/Jf0sBaLElhwT4enavgFiwGzq8eoqRAhtzI3Ek19stMuhT/mu55
fdYt29UACp2fL/3C41SEgTqvnIOilRYem6Xm4nujxiON0CkUI6FrzDWVrZ2PqhhP
UFjm1TqHQf9I1SvGLKzw2m9GFNwIHOgtPUo/TniBMAc7NN4u+sde1dvkA2FKWhai
dvK5WRCwWk9UegRE9ECsvtJzv4S9gm6noWJY/9JpCT9H3tNKAG7SHq+SjOaiAC5a
vAl0+SQR+LNzbIWXO4MAwtewydeU4kn4C+DaVp48sMWICfGFq+oMVwqYJfFaBuN+
GC8yyn3h8Ek2DPIS6cqqcN7pXhPu74yioKXOKPEzK8JW5L/M1iIQ1iFiZpi2+4bS
8A2gpKnOHXJcG14nAWfLpmkQg13I1W+A762l5DIwnNbihqTlvYIWzudiefxta2G5
dAh2UlDcso6iq53FHk8jKJRyKOQY4an6g9zzHwTqroHdq2kFHeQR/L/sKt3fiWGE
e3zyn38fmfhjB3rFlKlywPyvuUofBuQohSuTLmFfOWgbo7MBodpoRevmxcTwL/tM
EhLwEY/GFlUXw2G5ANPVKJ876LinAepiYafWIrbfiCI5pdKU2JeXaqb3kGlf+mjX
tInAvjq5hdrPCdFZxNFqj3JcVfvDCF8LHVbzUHajegIFjCB7Ii4=
=q7VP
-----END PGP SIGNATURE-----

--xuofpj6nig6uj3yk--
