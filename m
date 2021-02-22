Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B359532133E
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 10:40:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05AFA6E92F;
	Mon, 22 Feb 2021 09:40:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EB2C6E92F
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 09:40:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0884DACCF;
 Mon, 22 Feb 2021 09:40:01 +0000 (UTC)
Subject: Re: [PATCH] drm/ast: fix memory leak when unload the driver
To: Tong Zhang <ztong0001@gmail.com>, Dave Airlie <airlied@redhat.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210222023322.984885-1-ztong0001@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <4f8e20f8-880b-5aae-da48-e06c32e3e14c@suse.de>
Date: Mon, 22 Feb 2021 10:39:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210222023322.984885-1-ztong0001@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1537175359=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1537175359==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="dZTOeeJRDc43qHnZ5vOWKE1Oq82W5WHH3"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--dZTOeeJRDc43qHnZ5vOWKE1Oq82W5WHH3
Content-Type: multipart/mixed; boundary="6m3GrRZ7yINexKWmlU4PoFTmlzIxxOiFU";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Tong Zhang <ztong0001@gmail.com>, Dave Airlie <airlied@redhat.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <4f8e20f8-880b-5aae-da48-e06c32e3e14c@suse.de>
Subject: Re: [PATCH] drm/ast: fix memory leak when unload the driver
References: <20210222023322.984885-1-ztong0001@gmail.com>
In-Reply-To: <20210222023322.984885-1-ztong0001@gmail.com>

--6m3GrRZ7yINexKWmlU4PoFTmlzIxxOiFU
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 22.02.21 um 03:33 schrieb Tong Zhang:
> a connector is leaked upon module unload, it seems that we should do
> similar to sample driver as suggested in drm_drv.c.
>=20
> Adding drm_atomic_helper_shutdown() in ast_pci_remove to prevent leakin=
g.
>=20
> [  153.822134] WARNING: CPU: 0 PID: 173 at drivers/gpu/drm/drm_mode_con=
fig.c:504 drm_mode_config_cle0
> [  153.822698] Modules linked in: ast(-) drm_vram_helper drm_ttm_helper=
 ttm [last unloaded: ttm]
> [  153.823197] CPU: 0 PID: 173 Comm: modprobe Tainted: G        W      =
   5.11.0-03615-g55f62bc873474
> [  153.823708] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS=
 rel-1.13.0-48-gd9c812dda519-4
> [  153.824333] RIP: 0010:drm_mode_config_cleanup+0x418/0x470
> [  153.824637] Code: 0c 00 00 00 00 48 8b 84 24 a8 00 00 00 65 48 33 04=
 25 28 00 00 00 75 65 48 81 c0
> [  153.825668] RSP: 0018:ffff888103c9fb70 EFLAGS: 00010212
> [  153.825962] RAX: ffff888102b0d100 RBX: ffff888102b0c298 RCX: fffffff=
f818d8b2b
> [  153.826356] RDX: dffffc0000000000 RSI: 000000007fffffff RDI: ffff888=
102b0c298
> [  153.826748] RBP: ffff888103c9fba0 R08: 0000000000000001 R09: ffffed1=
020561857
> [  153.827146] R10: ffff888102b0c2b7 R11: ffffed1020561856 R12: ffff888=
102b0c000
> [  153.827538] R13: ffff888102b0c2d8 R14: ffff888102b0c2d8 R15: 1ffff11=
020793f70
> [  153.827935] FS:  00007f24bff456a0(0000) GS:ffff88815b400000(0000) kn=
lGS:0000000000000000
> [  153.828380] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  153.828697] CR2: 0000000001c39018 CR3: 0000000103c90000 CR4: 0000000=
0000006f0
> [  153.829096] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000=
000000000
> [  153.829486] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000=
000000400
> [  153.829883] Call Trace:
> [  153.830024]  ? drmm_mode_config_init+0x930/0x930
> [  153.830281]  ? cpumask_next+0x16/0x20
> [  153.830488]  ? mnt_get_count+0x66/0x80
> [  153.830699]  ? drm_mode_config_cleanup+0x470/0x470
> [  153.830972]  drm_managed_release+0xed/0x1c0
> [  153.831208]  drm_dev_release+0x3a/0x50
> [  153.831420]  release_nodes+0x39e/0x410
> [  153.831631]  ? devres_release+0x40/0x40
> [  153.831852]  device_release_driver_internal+0x158/0x270
> [  153.832143]  driver_detach+0x76/0xe0
> [  153.832344]  bus_remove_driver+0x7e/0x100
> [  153.832568]  pci_unregister_driver+0x28/0xf0
> [  153.832821]  __x64_sys_delete_module+0x268/0x300
> [  153.833086]  ? __ia32_sys_delete_module+0x300/0x300
> [  153.833357]  ? call_rcu+0x372/0x4f0
> [  153.833553]  ? fpregs_assert_state_consistent+0x4d/0x60
> [  153.833840]  ? exit_to_user_mode_prepare+0x2f/0x130
> [  153.834118]  do_syscall_64+0x33/0x40
> [  153.834317]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> [  153.834597] RIP: 0033:0x7f24bfec7cf7
> [  153.834797] Code: 48 89 57 30 48 8b 04 24 48 89 47 38 e9 1d a0 02 00=
 48 89 f8 48 89 f7 48 89 d6 41
> [  153.835812] RSP: 002b:00007fff72e6cb58 EFLAGS: 00000202 ORIG_RAX: 00=
000000000000b0
> [  153.836234] RAX: ffffffffffffffda RBX: 00007f24bff45690 RCX: 00007f2=
4bfec7cf7
> [  153.836623] RDX: 00000000ffffffff RSI: 0000000000000080 RDI: 0000000=
001c2fb10
> [  153.837018] RBP: 0000000001c2fac0 R08: 2f2f2f2f2f2f2f2f R09: 0000000=
001c2fac0
> [  153.837408] R10: fefefefefefefeff R11: 0000000000000202 R12: 0000000=
001c2fac0
> [  153.837798] R13: 0000000001c2f9d0 R14: 0000000000000000 R15: 0000000=
000000001
> [  153.838194] ---[ end trace b92031513bbe596c ]---
> [  153.838441] [drm:drm_mode_config_cleanup] *ERROR* connector VGA-1 le=
aked!
>=20
> Signed-off-by: Tong Zhang <ztong0001@gmail.com>

I've added the patch to drm-misc-next. Thanks a lot!

Best regards
Thomas

> ---
>   drivers/gpu/drm/ast/ast_drv.c | 2 ++
>   1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_dr=
v.c
> index 667b450606ef..b047c0ea43e8 100644
> --- a/drivers/gpu/drm/ast/ast_drv.c
> +++ b/drivers/gpu/drm/ast/ast_drv.c
> @@ -30,6 +30,7 @@
>   #include <linux/module.h>
>   #include <linux/pci.h>
>  =20
> +#include <drm/drm_atomic_helper.h>
>   #include <drm/drm_crtc_helper.h>
>   #include <drm/drm_drv.h>
>   #include <drm/drm_fb_helper.h>
> @@ -138,6 +139,7 @@ static void ast_pci_remove(struct pci_dev *pdev)
>   	struct drm_device *dev =3D pci_get_drvdata(pdev);
>  =20
>   	drm_dev_unregister(dev);
> +	drm_atomic_helper_shutdown(dev);
>   }
>  =20
>   static int ast_drm_freeze(struct drm_device *dev)
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--6m3GrRZ7yINexKWmlU4PoFTmlzIxxOiFU--

--dZTOeeJRDc43qHnZ5vOWKE1Oq82W5WHH3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAze+8FAwAAAAAACgkQlh/E3EQov+DC
sRAAluU5/1d9OS+DBkyw3kJIxmEMG3duJJNQUlDzNiP6zx6jzPGZJSA7upQKzER9yBG2HpHJc3zD
CfRfhdrondITR29FUuBYdv2KqzWsV9yDYXHcKYgjd+7Qrj8EUKXSFLiB2lkvtinKpAjfITBccZ7R
hSkYeGPpQ/6IE1yZryFAzCxOQCHtknrwkpjNlb+8BZAJvEKxKG33kEbsGv88HTStpRL9d+fLaCgR
AFsCdGm06mUbTVfdRtVMQQT2Th8pwB5MVL+BEt7MliDLhUj3WbxA3lSo73vOvsfv1LDIbtkrxG4a
8Z3HHVuMwCq2zW52qcs0UqMPSCzjmLWOtIAHXqbge72q/tOxWifYS1uHj7Ks7r8h/8IF8IdLbi8X
jDPufVtGSWESDj4mgVwxZlnWJ21vsQqFPP0/ouEsJsJ6H0EvfiVRK0j3cpGdopWrQvmjRNz8Zczd
7BypRBWqJIZ3Smjl/jzcAwKo/NflqsZb1LhCIT5iWR+iKy6Xh+aOLlXQ8LUi6UxVt4VLXyU5i59s
wRouK7IF+qQmzX5sv2LIZhaRXLS6Tyc28B2k5t//62MSMUbcsgTx/fAia8OM44NhTFQFmsuY0c7D
G8qOFOelwh1xBlpIWkOu4JLdSqAcyl9kFnn5xd+cIeBZgVFEeivgV2PojzPK9cQMAwlRZZYIwAjU
h4o=
=tUtG
-----END PGP SIGNATURE-----

--dZTOeeJRDc43qHnZ5vOWKE1Oq82W5WHH3--

--===============1537175359==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1537175359==--
