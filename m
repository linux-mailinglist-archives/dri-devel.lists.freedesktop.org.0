Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 394452FFDF5
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 09:14:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B646E9A3;
	Fri, 22 Jan 2021 08:14:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 252BB6E570;
 Fri, 22 Jan 2021 08:14:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B21B8AB9F;
 Fri, 22 Jan 2021 08:14:47 +0000 (UTC)
Subject: Re: [PATCH v3 3/4] drm/qxl: release shadow on shutdown
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
References: <20210120111240.2509679-1-kraxel@redhat.com>
 <20210120111240.2509679-4-kraxel@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <fbc21376-bb8b-58e8-5ff6-5c644bfeae03@suse.de>
Date: Fri, 22 Jan 2021 09:14:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210120111240.2509679-4-kraxel@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <spice-devel@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>
Content-Type: multipart/mixed; boundary="===============1988873376=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1988873376==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="BHM8OTILCRQMltYlRHrPRsJeGbbtEpZjb"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--BHM8OTILCRQMltYlRHrPRsJeGbbtEpZjb
Content-Type: multipart/mixed; boundary="cLBy6hjRREc7smgQM8lhwvfJEt4CYYBBI";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, open list
 <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <spice-devel@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>
Message-ID: <fbc21376-bb8b-58e8-5ff6-5c644bfeae03@suse.de>
Subject: Re: [PATCH v3 3/4] drm/qxl: release shadow on shutdown
References: <20210120111240.2509679-1-kraxel@redhat.com>
 <20210120111240.2509679-4-kraxel@redhat.com>
In-Reply-To: <20210120111240.2509679-4-kraxel@redhat.com>

--cLBy6hjRREc7smgQM8lhwvfJEt4CYYBBI
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 20.01.21 um 12:12 schrieb Gerd Hoffmann:
> In case we have a shadow surface on shutdown release
> it so it doesn't leak.
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>   drivers/gpu/drm/qxl/qxl_display.c | 4 ++++
>   1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qx=
l_display.c
> index 38d6b596094d..60331e31861a 100644
> --- a/drivers/gpu/drm/qxl/qxl_display.c
> +++ b/drivers/gpu/drm/qxl/qxl_display.c
> @@ -1229,5 +1229,9 @@ int qxl_modeset_init(struct qxl_device *qdev)
>  =20
>   void qxl_modeset_fini(struct qxl_device *qdev)
>   {
> +	if (qdev->dumb_shadow_bo) {

Wrt to my comment on patch 2, this might be the place to unpin the BO.

> +		drm_gem_object_put(&qdev->dumb_shadow_bo->tbo.base);
> +		qdev->dumb_shadow_bo =3D NULL;
> +	}
>   	qxl_destroy_monitors_object(qdev);
>   }
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--cLBy6hjRREc7smgQM8lhwvfJEt4CYYBBI--

--BHM8OTILCRQMltYlRHrPRsJeGbbtEpZjb
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAKiXYFAwAAAAAACgkQlh/E3EQov+CQ
cw//Z/zn8O5Z7aQqXJbqzjKl8N0/MhAdsp+Tws2mP16RQSTAKFaoGsLEghTXg2H5+9ZiQRxFnvmZ
XvvfDkvLkg49VZp6kH5C48xd7OqkFSq7wfE32NrGjsG2DtkCT6rbsD8nqmsOqegCEHdjgXW08ln4
ucmbdn6RBK5N/Qlq8+OojoFGg+J+e/CrbfDG3bOSHtdW1uwXc237oMWaMIEfPKRvOKS84acBw8Mq
1aAvkIMddAnjw4Dw8b114Uj8USxa2xv69V3gU5bss3IhQAcF6jsRDunZKuSlzPlPmNRSe+IJar7F
LwR8i+UCT5/XoNvla0pSh8F0nb6sgA2yesGiktmsYC0AgoOiqAF/0JT9b3OWWoL5nxqh83+ez9Z/
vXHtjizay4whuS5AYp+ULuOmQNzNCMoGNamwt/yDrqhpIpVVnkKTDMiwba7CZUzDgzuJRPstyBIm
Z7Q+JC06qTduWae6yHNxhodQburqLaxKKKTevXom/F2rbhr4uNZF32cpAFsYX70Fn6EVGL3TOAUq
vJNlmMw/Yka019C/mNQvtGakfSbWKKMLs9ssMFzVGvLSQsYCDGup4DM7P7paJrAUaAZAd8SOQpO5
T/oylBM8qFj8u6aDoTWr9deOaHm40Ai2gygwWLA4SbrNlMA6Xk64gTL0JjdB286xnjnIkyY328N1
o1w=
=Nuo2
-----END PGP SIGNATURE-----

--BHM8OTILCRQMltYlRHrPRsJeGbbtEpZjb--

--===============1988873376==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1988873376==--
