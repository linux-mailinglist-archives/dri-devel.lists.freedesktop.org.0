Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B45B8215C8C
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jul 2020 19:03:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D9C89F1B;
	Mon,  6 Jul 2020 17:03:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5678F89F1B
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jul 2020 17:03:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 53FC5ADBB;
 Mon,  6 Jul 2020 17:03:47 +0000 (UTC)
Subject: Re: [PATCH] drm/hisilicon/hibmc: Move drm_fbdev_generic_setup() down
 to avoid the splat
To: Zenghui Yu <yuzenghui@huawei.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20200706144713.1123-1-yuzenghui@huawei.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <aa244201-9b43-2d35-c236-21391e7af7d0@suse.de>
Date: Mon, 6 Jul 2020 19:03:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200706144713.1123-1-yuzenghui@huawei.com>
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
Cc: xinliang.liu@linaro.org, puck.chen@hisilicon.com, airlied@linux.ie,
 kong.kongxinwei@hisilicon.com, zourongrong@gmail.com,
 wanghaibin.wang@huawei.com, sam@ravnborg.org
Content-Type: multipart/mixed; boundary="===============0358853932=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0358853932==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="psdtDZbLPzNtKiLFO86PfXRfZN7ZR5WeQ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--psdtDZbLPzNtKiLFO86PfXRfZN7ZR5WeQ
Content-Type: multipart/mixed; boundary="GppCVzr4jNWe7h8V8yOrotUUhX0kAb6Bw";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Zenghui Yu <yuzenghui@huawei.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: xinliang.liu@linaro.org, zourongrong@gmail.com, john.stultz@linaro.org,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com, airlied@linux.ie,
 daniel@ffwll.ch, sam@ravnborg.org, wanghaibin.wang@huawei.com
Message-ID: <aa244201-9b43-2d35-c236-21391e7af7d0@suse.de>
Subject: Re: [PATCH] drm/hisilicon/hibmc: Move drm_fbdev_generic_setup() down
 to avoid the splat
References: <20200706144713.1123-1-yuzenghui@huawei.com>
In-Reply-To: <20200706144713.1123-1-yuzenghui@huawei.com>

--GppCVzr4jNWe7h8V8yOrotUUhX0kAb6Bw
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 06.07.20 um 16:47 schrieb Zenghui Yu:
> The HiSilicon hibmc driver triggers a splat at boot time as below
>=20
> [   14.137806] ------------[ cut here ]------------
> [   14.142405] hibmc-drm 0000:0a:00.0: Device has not been registered.
> [   14.148661] WARNING: CPU: 0 PID: 496 at drivers/gpu/drm/drm_fb_helpe=
r.c:2233 drm_fbdev_generic_setup+0x15c/0x1b8
> [   14.158787] [...]
> [   14.278307] Call trace:
> [   14.280742]  drm_fbdev_generic_setup+0x15c/0x1b8
> [   14.285337]  hibmc_pci_probe+0x354/0x418
> [   14.289242]  local_pci_probe+0x44/0x98
> [   14.292974]  work_for_cpu_fn+0x20/0x30
> [   14.296708]  process_one_work+0x1c4/0x4e0
> [   14.300698]  worker_thread+0x2c8/0x528
> [   14.304431]  kthread+0x138/0x140
> [   14.307646]  ret_from_fork+0x10/0x18
> [   14.311205] ---[ end trace a2000ec2d838af4d ]---
>=20
> This turned out to be due to the fbdev device hasn't been registered wh=
en
> drm_fbdev_generic_setup() is invoked. Let's fix the splat by moving it =
down
> after drm_dev_register() which will follow the "Display driver example"=

> documented by commit de99f0600a79 ("drm/drv: DOC: Add driver example
> code").
>=20
> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/=
gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> index a6fd0c29e5b8..544b9993c99e 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> @@ -307,8 +307,6 @@ static int hibmc_load(struct drm_device *dev)
>  	/* reset all the states of crtc/plane/encoder/connector */
>  	drm_mode_config_reset(dev);
> =20
> -	drm_fbdev_generic_setup(dev, dev->mode_config.preferred_depth);
> -
>  	return 0;
> =20
>  err:
> @@ -355,6 +353,9 @@ static int hibmc_pci_probe(struct pci_dev *pdev,
>  			  ret);
>  		goto err_unload;
>  	}
> +
> +	drm_fbdev_generic_setup(dev, dev->mode_config.preferred_depth);
> +
>  	return 0;
> =20
>  err_unload:
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--GppCVzr4jNWe7h8V8yOrotUUhX0kAb6Bw--

--psdtDZbLPzNtKiLFO86PfXRfZN7ZR5WeQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl8DWWwUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiNuXQgAu2j4csMKFEV7y/0lj0/L9VLa/Sgm
w45pdN0fodDKl7UiBUrohv0LBWrHfEO6ID5ym2ClmUZ/3ATsTdpT9qdQ6X487s4M
E/te3KziwlC+lN8+nmvTiypJIqW2buzw61QaZHmGpWufriKPRifON5GN2RyFWq9K
tJZnsHTR5c027ZwX8Ye76pU/plYrHtyMLbIzNXsWriRnhcAqk2ytdwE65Qd+LGSq
Q9jX4cc8QzIxCX0r9ZCbEngXKF1Q9a13IiQ5HHc0CCb3UnkUdAHRsAWVo3njW4xj
7GU1rlMX6hCQeqoEYPcy4jaMF689RO8O++5Tse8KFKt55TvxZWRGp45jjA==
=Jjj6
-----END PGP SIGNATURE-----

--psdtDZbLPzNtKiLFO86PfXRfZN7ZR5WeQ--

--===============0358853932==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0358853932==--
