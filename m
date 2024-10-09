Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E489B99618B
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 09:55:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C6C310E674;
	Wed,  9 Oct 2024 07:55:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uq9eBzkl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F13E10E674
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 07:55:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4C39E5C5806;
 Wed,  9 Oct 2024 07:55:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E09C5C4CEC5;
 Wed,  9 Oct 2024 07:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728460548;
 bh=Ls7OqrLkaPsaUNbbSAIYCwfHAycozI504hv239H9W6s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uq9eBzkl0EAIS0LZpNSSW2ZSeYlwEGHPLZ4P0heDHiY9T2pg/tsT627sY0L6goaSM
 oA1ZYFqCtavrBNVzSoRgaKKWMDLC+QLEwnJzXXUd/JeV4TNk8HdhwubYsYUhDd6ImF
 LHYN78KwfQkXuGxg4Sfkw5WtoYNLK22EqgR6wHqHLTNxX0btk8w7SDfv6HtZv5qNlk
 Ktz/eMmNzc2b9wwETzNA/+fiicQR5i0S0cVRyf8S4s4f/TdYgFQs25uNvcldn1DdG4
 s6lva+08g4ZqqBVx3+unvMAeGqCYEXzxqwqObYyqO2URvdrGUT6p0+onJ6C8D0BrYI
 P8E5RcXG0vA8w==
Date: Wed, 9 Oct 2024 09:55:45 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: Re: [PATCH] drm/vc4: Set `fbdev_probe` in `struct vc5_drm_driver`
Message-ID: <20241009-melodic-adorable-groundhog-2c01af@houat>
References: <20241009004332.1901833-1-mcanal@igalia.com>
 <164f5bd6-c240-42af-aef4-37db7e2041cc@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="7wtlmzosbpgjzeu7"
Content-Disposition: inline
In-Reply-To: <164f5bd6-c240-42af-aef4-37db7e2041cc@suse.de>
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


--7wtlmzosbpgjzeu7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 09, 2024 at 08:59:29AM GMT, Thomas Zimmermann wrote:
> Hi
>=20
> Am 09.10.24 um 02:40 schrieb Ma=EDra Canal:
> > Currently, when booting the RPi 4B, we get a NULL pointer dereference:
> >=20
> > [    7.642883] Unable to handle kernel NULL pointer dereference at virt=
ual address 0000000000000038
> > [    7.642926] Mem abort info:
> > [    7.642938]   ESR =3D 0x0000000096000044
> > [    7.642951]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
> > [    7.642968]   SET =3D 0, FnV =3D 0
> > [    7.642981]   EA =3D 0, S1PTW =3D 0
> > [    7.642993]   FSC =3D 0x04: level 0 translation fault
> > [    7.643007] Data abort info:
> > [    7.643017]   ISV =3D 0, ISS =3D 0x00000044, ISS2 =3D 0x00000000
> > [    7.643032]   CM =3D 0, WnR =3D 1, TnD =3D 0, TagAccess =3D 0
> > [    7.643046]   GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
> > [    7.643063] user pgtable: 4k pages, 48-bit VAs, pgdp=3D0000000107487=
000
> > [    7.643081] [0000000000000038] pgd=3D0000000000000000, p4d=3D0000000=
000000000
> > [    7.643113] Internal error: Oops: 0000000096000044 [#1] PREEMPT SMP
> > [    7.643131] Modules linked in: snd_bcm2835(C)  [...] vc4 v3d [...]
> > drm_shmem_helper drm_dma_helper drm_kms_helper drm [...] ipv6
> > [    7.643377] CPU: 1 UID: 0 PID: 48 Comm: kworker/u16:2 Tainted: G    =
     C         6.12.0-rc1-00310-g2c34a5464007 #185
> > [    7.643407] Tainted: [C]=3DCRAP
> > [    7.643419] Hardware name: Raspberry Pi 4 Model B Rev 1.5 (DT)
> > [    7.643438] Workqueue: events_unbound deferred_probe_work_func
> > [    7.643477] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BT=
YPE=3D--)
> > [    7.643499] pc : __drm_fb_helper_initial_config_and_unlock+0x40c/0x5=
88 [drm_kms_helper]
> > [    7.643616] lr : __drm_fb_helper_initial_config_and_unlock+0x374/0x5=
88 [drm_kms_helper]
> > [    7.643710] sp : ffff8000806c3900
> > [    7.643724] x29: ffff8000806c3950 x28: ffff431b01a3ec14 x27: 0000000=
000000010
> > [    7.643758] x26: ffff431b0369f000 x25: 0000000036314752 x24: ffff431=
b003b6200
> > [    7.643790] x23: ffff431b0369f000 x22: 00000000000002d0 x21: ffff431=
b003b6030
> > [    7.643821] x20: ffff431b003b6030 x19: ffff431b003b6000 x18: ffff431=
b002e6e48
> > [    7.643852] x17: 0000000000000001 x16: ffffb19c2f10614c x15: 0000000=
000000000
> > [    7.643882] x14: 0000000000000000 x13: ffff431b003b62f0 x12: 0000000=
000000500
> > [    7.643913] x11: 0000000000000000 x10: 0000000000000000 x9 : 005d6e6=
f6362665b
> > [    7.643945] x8 : 0000000000000000 x7 : 0000000000000000 x6 : 0000000=
00000003f
> > [    7.643975] x5 : ffffb19bcb45c59c x4 : 0000000000001e00 x3 : ffffb19=
bcb420c20
> > [    7.644005] x2 : 0000000000000000 x1 : 0000000000000001 x0 : ffff431=
b003b6000
> > [    7.644036] Call trace:
> > [    7.644049]  __drm_fb_helper_initial_config_and_unlock+0x40c/0x588 [=
drm_kms_helper]
> > [    7.644149]  drm_fb_helper_initial_config+0x34/0x4c [drm_kms_helper]
> > [    7.644240]  drm_fbdev_client_hotplug+0x74/0xc8 [drm_kms_helper]
> > [    7.644331]  drm_client_register+0x58/0xa0 [drm]
> > [    7.644571]  drm_fbdev_client_setup+0xc4/0x17c [drm_kms_helper]
> > [    7.644664]  drm_client_setup_with_fourcc+0x28/0x60 [drm_kms_helper]
> > [    7.644755]  vc4_drm_bind+0x218/0x264 [vc4]
> > [    7.644855]  try_to_bring_up_aggregate_device+0x168/0x1b4
> > [    7.644884]  __component_add+0xb8/0x158
> > [    7.644905]  component_add+0x14/0x20
> > [    7.644925]  vc4_hvs_dev_probe+0x1c/0x28 [vc4]
> > [    7.645019]  platform_probe+0xa8/0xd0
> > [    7.645045]  really_probe+0x128/0x2c8
> > [    7.645065]  __driver_probe_device+0xa0/0x128
> > [    7.645086]  driver_probe_device+0x3c/0x1f8
> > [    7.645106]  __device_attach_driver+0x118/0x140
> > [    7.645127]  bus_for_each_drv+0xf4/0x14c
> > [    7.645145]  __device_attach+0xfc/0x194
> > [    7.645164]  device_initial_probe+0x14/0x20
> > [    7.645184]  bus_probe_device+0x94/0x100
> > [    7.645202]  deferred_probe_work_func+0x88/0xc4
> > [    7.645223]  process_scheduled_works+0x194/0x2c4
> > [    7.645246]  worker_thread+0x290/0x39c
> > [    7.645265]  kthread+0xfc/0x184
> > [    7.645289]  ret_from_fork+0x10/0x20
> > [    7.645317] Code: f2ac6c49 aa1303e0 f2cdcde9 f2e00ba9 (f9001d09)
> > [    7.645338] ---[ end trace 0000000000000000 ]---
> >=20
> > This happens because commit 45903624e9fc ("drm/vc4: Run DRM default cli=
ent
> > setup") only added DRM_FBDEV_DMA_DRIVER_OPS to `struct vc4_drm_driver`
> > and didn't add it to `struct vc5_drm_driver`. The `struct vc4_drm_drive=
r`
> > is used in RPi 0-3, as VC4 is also a render node in those RPis. But RPi=
 4
> > and 5 use V3D as the render node and VC4 as modeset node and therefore,
> > use `struct vc5_drm_driver`.
> >=20
> > This commit adds DRM_FBDEV_DMA_DRIVER_OPS to `struct vc5_drm_driver`,
> > ensuring that `fbdev_probe` exists for all VC4 generations.
> >=20
> > Fixes: 45903624e9fc ("drm/vc4: Run DRM default client setup")
> > Signed-off-by: Ma=EDra Canal <mcanal@igalia.com>
>=20
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

It's the third time it was sent:

https://lore.kernel.org/dri-devel/20241002-vc4_fbdev_fix-v1-1-8737bd11b147@=
raspberrypi.com/
https://lore.kernel.org/dri-devel/20241003092826.1942901-3-m.szyprowski@sam=
sung.com/

Maxime

--7wtlmzosbpgjzeu7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZwY2+QAKCRAnX84Zoj2+
dhd3AX4rvxryKPmZIk3AVIx0+57eIFhjdncrheErfLFogoRQDjbqH2uG35+EzIM/
vIn/BxkBgOsiu0mO7heMMNMYCH3+GIBGLHSksz1XIBEOi3GkpPK8h3VC717MVK/S
uz2e/H5OdQ==
=0adW
-----END PGP SIGNATURE-----

--7wtlmzosbpgjzeu7--
