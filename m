Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F392D973B
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 12:17:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ECA06E1A7;
	Mon, 14 Dec 2020 11:17:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E37596E1A7
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 11:17:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 47E08AF93;
 Mon, 14 Dec 2020 11:17:29 +0000 (UTC)
Subject: Re: [PATCH] drm/hisilicon: Fix use-after-free
To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie, daniel@ffwll.ch,
 kraxel@redhat.com, alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org
References: <1607941973-32287-1-git-send-email-tiantao6@hisilicon.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <bccc34a2-ca29-1a8c-03af-81842326d531@suse.de>
Date: Mon, 14 Dec 2020 12:17:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <1607941973-32287-1-git-send-email-tiantao6@hisilicon.com>
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
Content-Type: multipart/mixed; boundary="===============1637492020=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1637492020==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="c3Cf5xPJVvs8qdTV6WoBE15WaueOG8WCz"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--c3Cf5xPJVvs8qdTV6WoBE15WaueOG8WCz
Content-Type: multipart/mixed; boundary="9lDcmBDnl8oElnGzHFXcKfvur8dpNuPEw";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie, daniel@ffwll.ch,
 kraxel@redhat.com, alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org
Message-ID: <bccc34a2-ca29-1a8c-03af-81842326d531@suse.de>
Subject: Re: [PATCH] drm/hisilicon: Fix use-after-free
References: <1607941973-32287-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1607941973-32287-1-git-send-email-tiantao6@hisilicon.com>

--9lDcmBDnl8oElnGzHFXcKfvur8dpNuPEw
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 14.12.20 um 11:32 schrieb Tian Tao:
> Fix the problem of dev being released twice.
> ------------[ cut here ]------------
> refcount_t: underflow; use-after-free.
> WARNING: CPU: 75 PID: 15700 at lib/refcount.c:28 refcount_warn_saturate=
+0xd4/0x150
> CPU: 75 PID: 15700 Comm: rmmod Tainted: G            E     5.10.0-rc3+ =
#3
> Hardware name: Huawei TaiShan 200 (Model 2280)/BC82AMDDA, BIOS 0.88 07/=
24/2019
> pstate: 40400009 (nZcv daif +PAN -UAO -TCO BTYPE=3D--)
> pc : refcount_warn_saturate+0xd4/0x150
> lr : refcount_warn_saturate+0xd4/0x150
> sp : ffff2028150cbc00
> x29: ffff2028150cbc00 x28: ffff2028150121c0
> x27: 0000000000000000 x26: 0000000000000000
> x25: 0000000000000000 x24: 0000000000000003
> x23: 0000000000000000 x22: ffff2028150cbc90
> x21: ffff2020038a30a8 x20: ffff2028150cbc90
> x19: ffff0020cd938020 x18: 0000000000000010
> x17: 0000000000000000 x16: 0000000000000000
> x15: ffffffffffffffff x14: ffff2028950cb88f
> x13: ffff2028150cb89d x12: 0000000000000000
> x11: 0000000005f5e0ff x10: ffff2028150cb800
> x9 : 00000000ffffffd0 x8 : 75203b776f6c6672
> x7 : ffff800011a6f7c8 x6 : 0000000000000001
> x5 : 0000000000000000 x4 : 0000000000000000
> x3 : 0000000000000000 x2 : ffff202ffe2f9dc0
> x1 : ffffa02fecf40000 x0 : 0000000000000026
> Call trace:
>   refcount_warn_saturate+0xd4/0x150
>   devm_drm_dev_init_release+0x50/0x70
>   devm_action_release+0x20/0x30
>   release_nodes+0x13c/0x218
>   devres_release_all+0x80/0x170
>   device_release_driver_internal+0x128/0x1f0
>   driver_detach+0x6c/0xe0
>   bus_remove_driver+0x74/0x100
>   driver_unregister+0x34/0x60
>   pci_unregister_driver+0x24/0xd8
>   hibmc_pci_driver_exit+0x14/0xe858 [hibmc_drm]
>   __arm64_sys_delete_module+0x1fc/0x2d0
>   el0_svc_common.constprop.3+0xa8/0x188
>   do_el0_svc+0x80/0xa0
>   el0_sync_handler+0x8c/0xb0
>   el0_sync+0x15c/0x180
> CPU: 75 PID: 15700 Comm: rmmod Tainted: G            E     5.10.0-rc3+ =
#3
> Hardware name: Huawei TaiShan 200 (Model 2280)/BC82AMDDA, BIOS 0.88 07/=
24/2019
> Call trace:
>   dump_backtrace+0x0/0x208
>   show_stack+0x2c/0x40
>   dump_stack+0xd8/0x10c
>   __warn+0xac/0x128
>   report_bug+0xcc/0x180
>   bug_handler+0x24/0x78
>   call_break_hook+0x80/0xa0
>   brk_handler+0x28/0x68
>   do_debug_exception+0x9c/0x148
>   el1_sync_handler+0x7c/0x128
>   el1_sync+0x80/0x100
>   refcount_warn_saturate+0xd4/0x150
>   devm_drm_dev_init_release+0x50/0x70
>   devm_action_release+0x20/0x30
>   release_nodes+0x13c/0x218
>   devres_release_all+0x80/0x170
>   device_release_driver_internal+0x128/0x1f0
>   driver_detach+0x6c/0xe0
>   bus_remove_driver+0x74/0x100
>   driver_unregister+0x34/0x60
>   pci_unregister_driver+0x24/0xd8
>   hibmc_pci_driver_exit+0x14/0xe858 [hibmc_drm]
>   __arm64_sys_delete_module+0x1fc/0x2d0
>   el0_svc_common.constprop.3+0xa8/0x188
>   do_el0_svc+0x80/0xa0
>   el0_sync_handler+0x8c/0xb0
>   el0_sync+0x15c/0x180
> ---[ end trace 00718630d6e5ff18 ]---
>=20
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 1 -
>   1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/=
gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> index 7e91ef1..e3ab765b 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> @@ -364,7 +364,6 @@ static void hibmc_pci_remove(struct pci_dev *pdev)
>  =20
>   	drm_dev_unregister(dev);
>   	hibmc_unload(dev);
> -	drm_dev_put(dev);
>   }
>  =20
>   static const struct pci_device_id hibmc_pci_table[] =3D {
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--9lDcmBDnl8oElnGzHFXcKfvur8dpNuPEw--

--c3Cf5xPJVvs8qdTV6WoBE15WaueOG8WCz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/XScgFAwAAAAAACgkQlh/E3EQov+CP
HBAAnHaR/actD+4s0H3AwnET68o1dE6NrheiiUPaJenFSW+Hnd/JRdDEQI1W0PBmU4yjYnYklSZT
1hM1QFClDRllVi9UwYxS+klzxgeoMN3zQCYS5gEw63yjCdGsdUwaeewALpziTCQoL7I3SXrOeimy
sF+LP+wHS3sw1umtvms8Q79D2N8ca1ZjZtQld3BeTIMEduLhueRq5lb8LemXqO99OvDBzKixi5xa
fmbhkpdBkNQgVS6AnD45V/3mWv4Wl1cKhow9dxl083qhBLae5VVDR69ESNUB960wghJLoW9AwxHK
BUCb74us86tKIQXWR5XkZizZBJtN3N8AgTb/+dEBcPl7xc2vgEzLJBWyh0C8TOsJStk7/hQHkQzU
T+uKq8PmeJNuMfJoJVY9oX4CrnJravYtuEbEOnfbRqX9vuegks/FeRhis/qUGbyuBDT9HLPilCPh
oRycCiIdS4S4d9HDdBmxUct3it2wd/zmmZ5H5JMF307EYY2Ywb/uUotgZ14RlVkvjACgHJ/S9p8v
uDkd6tyVpXw/2jAYZf5vgpJz8WijjaTFzSNdzgWz5EHogMhZuucrDMJQ2pAir9g95iqSLznDBJW8
/jJROSjiCZF0gImW3e65HtUf3X9Rnj5yhMl6oxFHv9QBVnhLCKs62sMEmQjsxkBzOitFghYiq0+T
uu8=
=Y36f
-----END PGP SIGNATURE-----

--c3Cf5xPJVvs8qdTV6WoBE15WaueOG8WCz--

--===============1637492020==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1637492020==--
