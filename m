Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0F163BEF2
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 12:29:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0CC910E029;
	Tue, 29 Nov 2022 11:29:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7395410E3AB
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 11:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SUsOzFYX6369VEsTw2vu105w+NXpS1QAKv5lQeZoahw=; b=qcddboJPOdrZkoFzPtHGHIP+Kb
 APfsM4XwBIx+6XV6PyN2+4lWKCzZIj6VrPHTewG7/Tnd3WvItisslriyA1bpH8ARefkwaxJG5kgRV
 OSbLsGGDeUkNYV3y+jP5Jn2c5D4sHy/1dDaPjbqFpdORk2u61htOgO7sR/zCvhQKH+o16trizi0IG
 YGIe+LpAOu4s/6mqXpPW1gmkH/Tya1FzEs1w1Db27hXM8uMf79rCZI6AzDF3NYrU8AMYWX42tBphp
 zS7MuOqo2pOjkaLBzvmOHLEvy7h5kFkVgBLvVx4PeGGY++8lA5xyagNdlhZiclG9cqY1r9og34ruX
 4iHKcp5A==;
Received: from [41.74.137.107] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ozynE-00AweC-58; Tue, 29 Nov 2022 12:28:52 +0100
Date: Tue, 29 Nov 2022 10:28:32 -0100
From: Melissa Wen <mwen@igalia.com>
To: Yuan Can <yuancan@huawei.com>
Subject: Re: [PATCH 1/2] drm/vkms: Fix memory leak in vkms_init()
Message-ID: <20221129112832.nta6tc2n25kdfzqn@mail.igalia.com>
References: <20221101065156.41584-1-yuancan@huawei.com>
 <20221101065156.41584-2-yuancan@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rd7jic2ovwglwn7s"
Content-Disposition: inline
In-Reply-To: <20221101065156.41584-2-yuancan@huawei.com>
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
Cc: hamohammed.sa@gmail.com, sylphrenadin@gmail.com,
 rodrigosiqueiramelo@gmail.com, dri-devel@lists.freedesktop.org,
 melissa.srw@gmail.com, seanpaul@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--rd7jic2ovwglwn7s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 11/01, Yuan Can wrote:
> A memory leak was reported after the vkms module install failed.
>=20
> unreferenced object 0xffff88810bc28520 (size 16):
>   comm "modprobe", pid 9662, jiffies 4298009455 (age 42.590s)
>   hex dump (first 16 bytes):
>     01 01 00 64 81 88 ff ff 00 00 dc 0a 81 88 ff ff  ...d............
>   backtrace:
>     [<00000000e7561ff8>] kmalloc_trace+0x27/0x60
>     [<000000000b1954a0>] 0xffffffffc45200a9
>     [<00000000abbf1da0>] do_one_initcall+0xd0/0x4f0
>     [<000000001505ee87>] do_init_module+0x1a4/0x680
>     [<00000000958079ad>] load_module+0x6249/0x7110
>     [<00000000117e4696>] __do_sys_finit_module+0x140/0x200
>     [<00000000f74b12d2>] do_syscall_64+0x35/0x80
>     [<000000008fc6fcde>] entry_SYSCALL_64_after_hwframe+0x46/0xb0
>=20
> The reason is that the vkms_init() returns without checking the return
> value of vkms_create(), and if the vkms_create() failed, the config
> allocated at the beginning of vkms_init() is leaked.
>=20
>  vkms_init()
>    config =3D kmalloc(...) # config allocated
>    ...
>    return vkms_create() # vkms_create failed and config is leaked
>=20
> Fix this problem by checking return value of vkms_create() and free the
> config if error happened.
>=20
> Fixes: 2df7af93fdad ("drm/vkms: Add vkms_config type")
> Signed-off-by: Yuan Can <yuancan@huawei.com>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_=
drv.c
> index 0ffe5f0e33f7..dfe983eaa07f 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -218,6 +218,7 @@ static int vkms_create(struct vkms_config *config)
> =20
>  static int __init vkms_init(void)
>  {
> +	int ret;
>  	struct vkms_config *config;
> =20
>  	config =3D kmalloc(sizeof(*config), GFP_KERNEL);
> @@ -230,7 +231,11 @@ static int __init vkms_init(void)
>  	config->writeback =3D enable_writeback;
>  	config->overlay =3D enable_overlay;
> =20
> -	return vkms_create(config);
> +	ret =3D vkms_create(config);
> +	if (ret)
> +		kfree(config);
> +
> +	return ret;

Good catch. Thanks,

Reviewed-by: Melissa Wen <mwen@igalia.com>

>  }
> =20
>  static void vkms_destroy(struct vkms_config *config)
> --=20
> 2.17.1
>=20

--rd7jic2ovwglwn7s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmOF7NkACgkQwqF3j0dL
ehw7ABAAsUwuejKNCWKa/dxEWaPU+edtuZY8ejVuK0YgrrMrhY+gZH4s4wQg5nM0
rSxt/kTiCYPXSufFOFl8OTzw2JvcNvvZuE2euLM9yXWPxWkikOHkBZM2f0QuUDy2
yYUFy5q/R2TjE8ZfhbqQ7K3+O9ONhemPpdMs+KDFaEAwxIT1Xu3Gr0D732Fp/tAR
L6LETG+tlQ+85o5o7uqCDfiKcn0FkEs5+VBQgSaZZAltNYFru+SuTTO3Pqjrf5Md
249q3eptwyhogGluMNSVtqA2J0V6N2SxETGSLzXiQazdU0k7bSLQ0OlyWBhfXCyM
WNQXKyhbHtnk04hdHZWZEugZnf8lH19ESuN5Rx0DVmiZ7LQ+xWkJZkG5xxDLhWmv
4EcKyG2Ag+6J/JovbUrERgPA9mKZ9duzCUqDJm+dGdFsGT2upmvIE+5fg7Lb1ZGM
CX2aK2A97vvvoGym9dXIBonluqMhUxVCBzdI6bqz96f//gwExCO66ITAL1gcT3SG
euqDxTQR782c+5mg3CqTfKCGnOfPNacxyfF34hVlaj11Uql4gD1JNB1z5y3B/9mL
+kyirHxUMFQx1qM+csLal4Ni9VAcHQyQ0SEbtIt9mIQAh2+hQgeBV77a2M4KdmZ0
QtaX26aD8olrkKCm/IU23/CjGPBDZxpd9yrfaNC7/oXnp1HZa4A=
=piG/
-----END PGP SIGNATURE-----

--rd7jic2ovwglwn7s--
