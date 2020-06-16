Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A321FAF12
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 13:24:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A84546E09C;
	Tue, 16 Jun 2020 11:24:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2357C6E09C;
 Tue, 16 Jun 2020 11:24:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5BD39AFCD;
 Tue, 16 Jun 2020 11:24:37 +0000 (UTC)
Subject: Re: [PATCH] drm/shmem-helper: Fix obj->filp derefence
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200615151026.2339113-1-daniel.vetter@ffwll.ch>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 mQENBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAG0J1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPokBVAQTAQgAPhYh
 BHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLCdg62AmR
 irxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6PXo
 clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7
 mneMC5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6i
 KupZstMxstPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8os
 Bv6pnSn7eAq5AQ0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRH
 UE9eosYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgT
 RjP+qbU63Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+R
 dhgATnWWGKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zb
 ehDda8lvhFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r
 12+lqdsAEQEAAYkBPAQYAQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkD
 wmcAAAoJEGgNwR1TC3ojpfcIAInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2
 h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxU
 n+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uI
 aMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBW
 HE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8CtirPdPWu/VXNRYAl/lat7lSI
 3H26qrE=
Message-ID: <3c060e54-d209-dcb8-ca8b-73dd18324a8b@suse.de>
Date: Tue, 16 Jun 2020 13:24:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200615151026.2339113-1-daniel.vetter@ffwll.ch>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============1494199741=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1494199741==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="dgVvp7bERdxCn54G6ylvUzIUB6ZWGkXgQ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--dgVvp7bERdxCn54G6ylvUzIUB6ZWGkXgQ
Content-Type: multipart/mixed; boundary="U0hwKYyf6pjjq0KZGO7bfxBk4iw9xLNzy";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Message-ID: <3c060e54-d209-dcb8-ca8b-73dd18324a8b@suse.de>
Subject: Re: [PATCH] drm/shmem-helper: Fix obj->filp derefence
References: <20200615151026.2339113-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20200615151026.2339113-1-daniel.vetter@ffwll.ch>

--U0hwKYyf6pjjq0KZGO7bfxBk4iw9xLNzy
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Daniel

Am 15.06.20 um 17:10 schrieb Daniel Vetter:
> I broke that in my refactoring:
>=20
> commit 7d2cd72a9aa3df3604cafd169a2d4a525afb68ca
> Author: Daniel Vetter <daniel.vetter@ffwll.ch>
> Date:   Fri May 29 16:05:42 2020 +0200
>=20
>     drm/shmem-helpers: Simplify dma-buf importing
>=20
> Reported-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 7d2cd72a9aa3 ("drm/shmem-helpers: Simplify dma-buf importing")
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/d=
rm_gem_shmem_helper.c
> index 0a7e3b664bc2..3e7ee407a17c 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -70,15 +70,17 @@ __drm_gem_shmem_create(struct drm_device *dev, size=
_t size, bool private)
>  	mutex_init(&shmem->vmap_lock);
>  	INIT_LIST_HEAD(&shmem->madv_list);
> =20
> -	/*
> -	 * Our buffers are kept pinned, so allocating them
> -	 * from the MOVABLE zone is a really bad idea, and
> -	 * conflicts with CMA. See comments above new_inode()
> -	 * why this is required _and_ expected if you're
> -	 * going to pin these pages.
> -	 */
> -	mapping_set_gfp_mask(obj->filp->f_mapping, GFP_HIGHUSER |
> -			     __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
> +	if (!private) {
> +		/*
> +		 * Our buffers are kept pinned, so allocating them
> +		 * from the MOVABLE zone is a really bad idea, and
> +		 * conflicts with CMA. See comments above new_inode()
> +		 * why this is required _and_ expected if you're
> +		 * going to pin these pages.
> +		 */
> +		mapping_set_gfp_mask(obj->filp->f_mapping, GFP_HIGHUSER |
> +				     __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
> +	}

This bug is gone, but now I see

[    5.577857] ------------[ cut here ]------------
[    5.577881] WARNING: CPU: 0 PID: 1 at drivers/gpu/drm/drm_gem.c:564
drm_gem_get_pages+0x190/0x1b0
[    5.577883] Modules linked in:
[    5.577891] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.7.0-1-pae+ #40=

[    5.577893] Hardware name: MSI                              MS-6380
                       /MS-6380                         , BIOS 07.00T

[    5.577897] EIP: drm_gem_get_pages+0x190/0x1b0
[    5.577904] Code: b7 ff 8d 45 b0 e8 30 63 b7 ff e8 6b d8 38 00 eb 9d
8d b4 26 00 00 00 00 66 90 89 fb eb 97 8d 74 26 00 bb f4 ff ff ff eb 8c
90 <0f> 0b bb ea ff ff ff eb 82 8d b4 26 00 00 00 00 0f 0b e9 95 fe ff
[    5.577907] EAX: f24c0c00 EBX: f24c0c00 ECX: f3ae1900 EDX: 00000000
[    5.577909] ESI: 00000000 EDI: 00000000 EBP: f3941b50 ESP: f3941afc
[    5.577912] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00010=
246
[    5.577915] CR0: 80050033 CR2: b7f5c784 CR3: 1b6b8000 CR4: 000006f0
[    5.577918] Call Trace:
[    5.577938]  ? _cond_resched+0x18/0x50
[    5.577950]  drm_gem_shmem_get_pages+0x52/0xa0
[    5.577955]  drm_gem_shmem_vmap+0xa1/0x160
[    5.577963]  skms_simple_display_pipe_update+0x68/0xb0
[    5.577973]  drm_simple_kms_plane_atomic_update+0x23/0x30
[    5.577976]  drm_atomic_helper_commit_planes+0xba/0x220
[    5.577981]  drm_atomic_helper_commit_tail+0x33/0x70
[    5.577984]  commit_tail+0xe7/0x120
[    5.577988]  drm_atomic_helper_commit+0x107/0x130
[    5.577991]  ? drm_atomic_helper_setup_commit+0x5a0/0x5a0
[    5.577995]  drm_atomic_commit+0x3a/0x50
[    5.577999]  drm_client_modeset_commit_atomic+0x1ae/0x1e0
[    5.578004]  drm_client_modeset_commit_locked+0x48/0x80
[    5.578008]  drm_client_modeset_commit+0x20/0x40
[    5.578012]  drm_fb_helper_restore_fbdev_mode_unlocked+0x44/0x90
[    5.578015]  drm_fb_helper_set_par+0x2e/0x40
[    5.578025]  fbcon_init+0x285/0x590
[    5.578035]  visual_init+0xb9/0x120
[    5.578040]  do_bind_con_driver.isra.0+0x18a/0x280
[    5.578045]  do_take_over_console+0x2c/0x40
[    5.578049]  do_fbcon_takeover+0x5f/0xd0
[    5.578053]  fbcon_fb_registered+0xb7/0xe0
[    5.578057]  do_register_framebuffer+0x1ae/0x2e0
[    5.578062]  register_framebuffer+0x1c/0x30
[    5.578065]  __drm_fb_helper_initial_config_and_unlock+0x96/0xd0
[    5.578069]  drm_fbdev_client_hotplug+0x136/0x220
[    5.578072]  drm_fbdev_generic_setup+0x9f/0x14a
[    5.578076]  ? skms_device_create.constprop.0+0x9f/0xb0
[    5.578079]  skms_probe+0x1b/0x20
[    5.578083]  platform_drv_probe+0x47/0x90
[    5.578092]  really_probe+0x2a9/0x3f0
[    5.578096]  driver_probe_device+0xa9/0xf0
[    5.578100]  ? _cond_resched+0x18/0x50
[    5.578103]  device_driver_attach+0x99/0xa0
[    5.578107]  __driver_attach+0x79/0x130
[    5.578111]  ? device_driver_attach+0xa0/0xa0
[    5.578114]  bus_for_each_dev+0x5b/0xa0
[    5.578118]  driver_attach+0x19/0x20
[    5.578122]  ? device_driver_attach+0xa0/0xa0
[    5.578125]  bus_add_driver+0x10d/0x1e0
[    5.578130]  driver_register+0x79/0xd0
[    5.578137]  ? mipi_dsi_bus_init+0x14/0x14
[    5.578140]  __platform_driver_register+0x2f/0x40
[    5.578143]  skms_platform_driver_init+0x14/0x16
[    5.578150]  do_one_initcall+0x42/0x1e0
[    5.578158]  ? rdinit_setup+0x2a/0x2a
[    5.578161]  ? rdinit_setup+0x2a/0x2a
[    5.578166]  do_initcalls+0xae/0xd1
[    5.578170]  kernel_init_freeable+0x108/0x14f
[    5.578181]  ? rest_init+0x9b/0x9b
[    5.578185]  kernel_init+0xd/0xe5
[    5.578193]  ret_from_fork+0x2e/0x38
[    5.578201] ---[ end trace d857253095ede2e3 ]---
[    5.578221] BUG: unable to handle page fault for address: ffffffea
[    5.578223] #PF: supervisor read access in kernel mode
[    5.578225] #PF: error_code(0x0000) - not-present page
[    5.578227] *pdpt =3D 000000001b6b4001 *pde =3D 000000001bc91067 *pte =
=3D
0000000000000000
[    5.578233] Oops: 0000 [#1] SMP NOPTI
[    5.578237] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W
 5.7.0-1-pae+ #40
[    5.578239] Hardware name: MSI                              MS-6380
                       /MS-6380                         , BIOS 07.00T

[    5.578249] EIP: memcpy_toio+0x2b/0x60
[    5.578252] Code: 8d 44 20 00 85 c9 74 47 55 89 e5 57 89 c7 56 89 d6
53 89 cb a8 01 75 3f 83 fb 01 76 08 f7 c7 02 00 00 00 75 1a 89 d9 c1 e9
02 <f3> a5 f6 c3 02 74 02 66 a5 f6 c3 01 74 01 a4 5b 5e 5f 5d c3 90 66
[    5.578255] EAX: f7200000 EBX: 00001400 ECX: 00000500 EDX: ffffffea
[    5.578257] ESI: ffffffea EDI: f7200000 EBP: f3941b3c ESP: f3941b30
[    5.578260] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00010=
216
[    5.578262] CR0: 80050033 CR2: ffffffea CR3: 1b6b8000 CR4: 000006f0
[    5.578263] Call Trace:
[    5.578271]  drm_fb_memcpy_dstclip+0x6f/0x90
[    5.578276]  drm_fb_blit_rect_dstclip+0x8d/0xc0
[    5.578280]  skms_simple_display_pipe_update+0x8d/0xb0
[    5.578285]  drm_simple_kms_plane_atomic_update+0x23/0x30
[    5.578288]  drm_atomic_helper_commit_planes+0xba/0x220
[    5.578292]  drm_atomic_helper_commit_tail+0x33/0x70
[    5.578295]  commit_tail+0xe7/0x120
[    5.578299]  drm_atomic_helper_commit+0x107/0x130
[    5.578303]  ? drm_atomic_helper_setup_commit+0x5a0/0x5a0
[    5.578306]  drm_atomic_commit+0x3a/0x50
[    5.578310]  drm_client_modeset_commit_atomic+0x1ae/0x1e0
[    5.578315]  drm_client_modeset_commit_locked+0x48/0x80
[    5.578318]  drm_client_modeset_commit+0x20/0x40
[    5.578322]  drm_fb_helper_restore_fbdev_mode_unlocked+0x44/0x90
[    5.578325]  drm_fb_helper_set_par+0x2e/0x40
[    5.578329]  fbcon_init+0x285/0x590
[    5.578333]  visual_init+0xb9/0x120
[    5.578338]  do_bind_con_driver.isra.0+0x18a/0x280
[    5.578342]  do_take_over_console+0x2c/0x40

[    5.578346]  do_fbcon_takeover+0x5f/0xd0

[    5.578350]  fbcon_fb_registered+0xb7/0xe0

[    5.578353]  do_register_framebuffer+0x1ae/0x2e0

[    5.578358]  register_framebuffer+0x1c/0x30
[    5.578361]  __drm_fb_helper_initial_config_and_unlock+0x96/0xd0
[    5.578364]  drm_fbdev_client_hotplug+0x136/0x220
[    5.578368]  drm_fbdev_generic_setup+0x9f/0x14a
[    5.578371]  ? skms_device_create.constprop.0+0x9f/0xb0
[    5.578374]  skms_probe+0x1b/0x20
[    5.578377]  platform_drv_probe+0x47/0x90
[    5.578381]  really_probe+0x2a9/0x3f0
[    5.578385]  driver_probe_device+0xa9/0xf0
[    5.578388]  ? _cond_resched+0x18/0x50
[    5.578392]  device_driver_attach+0x99/0xa0
[    5.578396]  __driver_attach+0x79/0x130
[    5.578400]  ? device_driver_attach+0xa0/0xa0
[    5.578403]  bus_for_each_dev+0x5b/0xa0
[    5.578407]  driver_attach+0x19/0x20
[    5.578411]  ? device_driver_attach+0xa0/0xa0
[    5.578414]  bus_add_driver+0x10d/0x1e0
[    5.578418]  driver_register+0x79/0xd0
[    5.578421]  ? mipi_dsi_bus_init+0x14/0x14
[    5.578424]  __platform_driver_register+0x2f/0x40
[    5.578428]  skms_platform_driver_init+0x14/0x16
[    5.578431]  do_one_initcall+0x42/0x1e0
[    5.578434]  ? rdinit_setup+0x2a/0x2a
[    5.578437]  ? rdinit_setup+0x2a/0x2a
[    5.578441]  do_initcalls+0xae/0xd1
[    5.578445]  kernel_init_freeable+0x108/0x14f
[    5.578449]  ? rest_init+0x9b/0x9b
[    5.578453]  kernel_init+0xd/0xe5
[    5.578457]  ret_from_fork+0x2e/0x38
[    5.578459] Modules linked in:
[    5.578463] CR2: 00000000ffffffea
[    5.578472] ---[ end trace d857253095ede2e4 ]---

because drm_gem_get_pages() needs obj->filp.

All this happens for dumb buffers. Why is a dumb buffer set up with
(private =3D=3D true) ? It has an associated file.

Best regards
Thomas





> =20
>  	return shmem;
> =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--U0hwKYyf6pjjq0KZGO7bfxBk4iw9xLNzy--

--dgVvp7bERdxCn54G6ylvUzIUB6ZWGkXgQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl7oq/AACgkQaA3BHVML
eiPIMAf/QrKx3OARGgvIwJ+mUS3FSSVBc+8TY8hhvQZ6z2sJ4TGQbCGmMNwz3txf
a/62Tfcm4F/TmhfC8m28OeHRlyz+9q6OtDYI0YxmeI4tmx2Jcx9T6RYfAmt7bvhI
zX3s/eNVCFgQdQtQKn0KNr8oHXiJsHhftd32eoZITTVmNRpD7yRU+k75iCwz0b0s
OOP4vn++RJDJ7W0JMKCMx+mNPfX7HVHMGDtXHZASsBKkvEvk2wizTWuI9nw3SXoN
X5NwXqxL4+CHZdFD9QcF8QI620XegKbT4omLkhxJuVyaytA3T9swbh9rhizyFfOV
KH/MiHHDv1CCGU0ZUyCs2O9PAcBtqQ==
=wiQR
-----END PGP SIGNATURE-----

--dgVvp7bERdxCn54G6ylvUzIUB6ZWGkXgQ--

--===============1494199741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1494199741==--
