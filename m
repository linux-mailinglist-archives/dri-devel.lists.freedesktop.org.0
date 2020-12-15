Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 218602DA8C7
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 08:53:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 146926E170;
	Tue, 15 Dec 2020 07:53:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C08306E170
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 07:53:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4C87FAC7F;
 Tue, 15 Dec 2020 07:53:17 +0000 (UTC)
To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie, daniel@ffwll.ch,
 kraxel@redhat.com, alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 linux-kernel@vger.kernel.org
References: <1608001299-7237-1-git-send-email-tiantao6@hisilicon.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/hisilicon: Fix rmmod hibmc_drm failed
Message-ID: <3f32c165-9a83-6238-46dd-9ace8280b584@suse.de>
Date: Tue, 15 Dec 2020 08:53:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <1608001299-7237-1-git-send-email-tiantao6@hisilicon.com>
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
Content-Type: multipart/mixed; boundary="===============0419506040=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0419506040==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="he7udaqwVmKfbAi2gSudhhEpmiK3iKBar"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--he7udaqwVmKfbAi2gSudhhEpmiK3iKBar
Content-Type: multipart/mixed; boundary="I64QpraC53kx1xwVu3S1H4bHbvpqJY03U";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie, daniel@ffwll.ch,
 kraxel@redhat.com, alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 linux-kernel@vger.kernel.org
Message-ID: <3f32c165-9a83-6238-46dd-9ace8280b584@suse.de>
Subject: Re: [PATCH] drm/hisilicon: Fix rmmod hibmc_drm failed
References: <1608001299-7237-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1608001299-7237-1-git-send-email-tiantao6@hisilicon.com>

--I64QpraC53kx1xwVu3S1H4bHbvpqJY03U
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Tian

Am 15.12.20 um 04:01 schrieb Tian Tao:
> drm_irq_uninstall should be called before pci_disable_msi, if use
> devm_drm_irq_install to register the interrupt, the system will
> call pci_disable_msi first and then call drm_irq_uninstall, which
>   will result in the following callstack.
>=20
> kernel BUG at drivers/pci/msi.c:376!
> Internal error: Oops - BUG: 0 [#1] SMP
> CPU: 93 PID: 173814 Comm: rmmod Tainted:
> pstate: a0400009 (NzCv daif +PAN -UAO -TCO BTYPE=3D--)
> pc : free_msi_irqs+0x17c/0x1a0
> lr : free_msi_irqs+0x16c/0x1a0
> sp : ffff2028157f7bd0
> x29: ffff2028157f7bd0 x28: ffff202849edab00
> x27: 0000000000000000 x26: 0000000000000000
> x25: 0000000000000000 x24: 0000000000000000
> x23: ffff0020851da000 x22: ffff0020851da2d8
> x21: ffff0020cc829000 x20: 0000000000000000
> x19: ffff0020d6714800 x18: 0000000000000010
> x17: 0000000000000000 x16: 0000000000000000
> x15: ffffffffffffffff x14: ffff2028957f77df
> x13: ffff2028157f77ed x12: 0000000000000000
> x11: 0000000000000040 x10: ffff800011b2f8e0
> x9 : ffff800011b2f8d8 x8 : ffff2020203fc458
> x7 : 0000000000000000 x6 : 0000000000000000
> x5 : ffff2020203fc430 x4 : ffff2020203fc4a0
> x3 : 0000000000000000 x2 : 0000000000000000
> x1 : 00000000000002c9 x0 : ffff0020d6719500
> Call trace:
>   free_msi_irqs+0x17c/0x1a0
>   pci_disable_msi+0xe4/0x118
>   hibmc_unload+0x44/0x80 [hibmc_drm]
>   hibmc_pci_remove+0x2c/0x38 [hibmc_drm]
>   pci_device_remove+0x48/0x108
>   device_release_driver_internal+0x118/0x1f0
>   driver_detach+0x6c/0xe0
>   bus_remove_driver+0x74/0x100
>   driver_unregister+0x34/0x60
>   pci_unregister_driver+0x24/0xd8
>   hibmc_pci_driver_exit+0x14/0xe768 [hibmc_drm]
>   __arm64_sys_delete_module+0x1fc/0x2d0
>   el0_svc_common.constprop.3+0xa8/0x188
>   do_el0_svc+0x80/0xa0
>   el0_sync_handler+0x8c/0xb0
>   el0_sync+0x15c/0x180
> Code: f940b400 b4ffff00 a903e7b8 f90013b5 (d4210000)
> ---[ end trace 310d94ee8abef44f ]---
> Kernel panic - not syncing: Oops - BUG: Fatal exception
>=20
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---
>   drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/=
gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> index e3ab765b..02f3bd1 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> @@ -251,6 +251,10 @@ static int hibmc_hw_init(struct hibmc_drm_private =
*priv)
>   static int hibmc_unload(struct drm_device *dev)
>   {
>   	drm_atomic_helper_shutdown(dev);
> +
> +	if (dev->irq_enabled)
> +		drm_irq_uninstall(dev);
> +
>   	pci_disable_msi(dev->pdev);

We're trying to move towards managed driver releases; and this feels=20
like a step backwards.

I looked through the PCI-device release code in pcim_release() and it=20
already disables MSI automatically. [1] You can enable the PCI device=20
with pcim_enable_device() instead of pci_enable_device() to use the=20
automatic release. No more need to disable MSI manually.

If this does not work, could you provide a managed version of=20
pci_disable_msi() that solves the problem?

Best regards
Thomas

[1] https://elixir.bootlin.com/linux/latest/source/drivers/pci/pci.c#L197=
6


>  =20
>   	return 0;
> @@ -286,7 +290,7 @@ static int hibmc_load(struct drm_device *dev)
>   	if (ret) {
>   		drm_warn(dev, "enabling MSI failed: %d\n", ret);
>   	} else {
> -		ret =3D devm_drm_irq_install(dev, dev->pdev->irq);
> +		ret =3D drm_irq_install(dev, dev->pdev->irq);
>   		if (ret)
>   			drm_warn(dev, "install irq failed: %d\n", ret);
>   	}
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--I64QpraC53kx1xwVu3S1H4bHbvpqJY03U--

--he7udaqwVmKfbAi2gSudhhEpmiK3iKBar
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/Ya2wFAwAAAAAACgkQlh/E3EQov+C3
dA/+JtDb6vW5xsJVh/Ae+lA1fLNoG/ia2MZho2+KVHdziY3SZtlOUAR8kQnDDeaIyxuiAf6X2Rct
rBh+8lAyDDtIpSM7AsLJvIUXVb/raKNMcLpIx/kFjjLH8X1KHhjRbRh5M7/I3H0oxAXUttMe8HWH
xqmOKyPwXIRS2KD1jUXqd1XO/enKPfPu3fEnnqxYxnf8N0BhXS+T9uq+eDj3VH6swCzR5HmoyLjx
OHEfcuLz2Iy4vwz/mwjptGo6O6uD+x3tB01E9GtVM2TNWMMtZBD7GXensrw30xPFzB39F0o1Ews/
bp6SdEEKpAAbRu5J0GZM3tIamnWaBxuyIMK50paSU/cJpz1dS2W3k+SiZ9Nf0zSc1f3rdyoA6kJy
k8BM898ZiFSDJCCkygNtQzhFcaD0uDVCYg5A55UCvSiJii9lV2saY8L8Q7p4id3xa5MohOwIXfRK
kmozgYEA8uEYIDF9YkYQ28YvN4AApw3Kj/aj4ZAeL3ivagGZfl/46RZa0nul5PzBfeiX+uBegzJi
/iG5P2yPdYRcSjdk5QhhFERfo4lrQ8TwdF2d88sb+5Qnr9tbuxUdexG38icJQL72+XOfWIxrd5+4
O2X/WS/pG5yAh3c6GC1CMbK5tzRhB5feWXbRyxfWggTwhoIKBAHydYY6GkuzS+PNcHr+sjTUkA+H
bQg=
=l6yC
-----END PGP SIGNATURE-----

--he7udaqwVmKfbAi2gSudhhEpmiK3iKBar--

--===============0419506040==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0419506040==--
