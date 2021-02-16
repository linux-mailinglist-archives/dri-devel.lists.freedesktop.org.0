Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 119E731CADF
	for <lists+dri-devel@lfdr.de>; Tue, 16 Feb 2021 14:08:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B71286E94C;
	Tue, 16 Feb 2021 13:08:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A34D86E94C;
 Tue, 16 Feb 2021 13:08:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 00D0FAF2C;
 Tue, 16 Feb 2021 13:08:27 +0000 (UTC)
Subject: Re: [PATCH 01/10] drm/qxl: properly handle device init failures
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
References: <20210216113716.716996-1-kraxel@redhat.com>
 <20210216113716.716996-2-kraxel@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <c9451a9a-b8b4-9393-4397-624df4eba3ff@suse.de>
Date: Tue, 16 Feb 2021 14:08:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210216113716.716996-2-kraxel@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, Tong Zhang <ztong0001@gmail.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
Content-Type: multipart/mixed; boundary="===============0459621211=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0459621211==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="lnl5ZartAQhJsKAaL1FzuGkzuhW2eJapG"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--lnl5ZartAQhJsKAaL1FzuGkzuhW2eJapG
Content-Type: multipart/mixed; boundary="v3YlMpUxeDNS2gAiEYBJgOuJKw4QJpk4f";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, Tong Zhang <ztong0001@gmail.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <spice-devel@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>
Message-ID: <c9451a9a-b8b4-9393-4397-624df4eba3ff@suse.de>
Subject: Re: [PATCH 01/10] drm/qxl: properly handle device init failures
References: <20210216113716.716996-1-kraxel@redhat.com>
 <20210216113716.716996-2-kraxel@redhat.com>
In-Reply-To: <20210216113716.716996-2-kraxel@redhat.com>

--v3YlMpUxeDNS2gAiEYBJgOuJKw4QJpk4f
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 16.02.21 um 12:37 schrieb Gerd Hoffmann:
> Specifically do not try release resources which where
> not allocated in the first place.

I still think this should eventually be resolved by using managed code.=20
But for now

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

>=20
> Cc: Tong Zhang <ztong0001@gmail.com>
> Tested-by: Tong Zhang <ztong0001@gmail.com>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>   drivers/gpu/drm/qxl/qxl_display.c | 3 +++
>   drivers/gpu/drm/qxl/qxl_kms.c     | 4 ++++
>   2 files changed, 7 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qx=
l_display.c
> index c326412136c5..ec50d2cfd4e1 100644
> --- a/drivers/gpu/drm/qxl/qxl_display.c
> +++ b/drivers/gpu/drm/qxl/qxl_display.c
> @@ -1183,6 +1183,9 @@ int qxl_destroy_monitors_object(struct qxl_device=
 *qdev)
>   {
>   	int ret;
>  =20
> +	if (!qdev->monitors_config_bo)
> +		return 0;
> +
>   	qdev->monitors_config =3D NULL;
>   	qdev->ram_header->monitors_config =3D 0;
>  =20
> diff --git a/drivers/gpu/drm/qxl/qxl_kms.c b/drivers/gpu/drm/qxl/qxl_km=
s.c
> index 66d74aaaee06..4dc5ad13f12c 100644
> --- a/drivers/gpu/drm/qxl/qxl_kms.c
> +++ b/drivers/gpu/drm/qxl/qxl_kms.c
> @@ -288,6 +288,10 @@ void qxl_device_fini(struct qxl_device *qdev)
>   {
>   	int cur_idx;
>  =20
> +	/* check if qxl_device_init() was successful (gc_work is initialized =
last) */
> +	if (!qdev->gc_work.func)
> +		return;
> +
>   	for (cur_idx =3D 0; cur_idx < 3; cur_idx++) {
>   		if (!qdev->current_release_bo[cur_idx])
>   			continue;
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--v3YlMpUxeDNS2gAiEYBJgOuJKw4QJpk4f--

--lnl5ZartAQhJsKAaL1FzuGkzuhW2eJapG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmArw8kFAwAAAAAACgkQlh/E3EQov+AS
yw/9HQv+slrvfu2KApiw6CP4w+/qHpWmhrAjamB7sY5PzEy8uPw6IkWHn2OOeP0T3wO/43MujjqW
2DfNZNZh9Yvsl+OmtFUu/ABbmrN5H2YbMd89EFnFwrTewf8AjW5aELMRiazpwDZmiF9t4zY8Zbgg
kFD6vckqqHcN6/7svmAuQi4XVxjq7+ULrar3JThqpCwlb38bK4BaGF0sfOaknBfO9qE9J1Yjdzqr
Mw62KXPUM6sghE1smDOg+qAW6WuSdpnD3eEDW0Dg7xyFDeywcizAVAMHMBz9nMsCKl14QMzg+P5a
zEwvucnXKFcEbvIhcCbcTal13EwW1nrPc0QlhrE/Xml+LYoMI3mSI0YtwsR4CiudLbgpSQxBggvi
VsRx7vv874ARwop79x6HpmTnx4GX+fJ9EJa4KFAfuPmqvZr46KczplxqP2kB5im99LW7o9tZ3kdv
vfGKo2BT8UI0Yc1rkrIEx/nXiYkco+VO9Sf6wbq29+WHcs5EVsPkC8Yz0NIXsQ3/m06Nwugy1Tx9
b5DdhJWuFnNgc0ThnmcsCcPxfBh3X4txOetY3rf7Foc2qGdO/7D/v5osEDvlHNcynQvq1N1PKqaN
g37G2NS2lnzYJKasEDnBIaTxy1hEHJs++9TCgdGbWa1WJ8a98NTCGQw5TsdBA9S1uBEmG59xY8/O
tP4=
=Wtgq
-----END PGP SIGNATURE-----

--lnl5ZartAQhJsKAaL1FzuGkzuhW2eJapG--

--===============0459621211==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0459621211==--
