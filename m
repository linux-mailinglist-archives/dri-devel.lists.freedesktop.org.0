Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C9521EBB4
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 10:46:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A0FC6E3D8;
	Tue, 14 Jul 2020 08:46:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24BE26E3D8
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 08:46:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 48E2FABF4;
 Tue, 14 Jul 2020 08:46:22 +0000 (UTC)
Subject: Re: KASAN: use-after-free Read in drm_gem_object_release
From: Thomas Zimmermann <tzimmermann@suse.de>
To: butt3rflyh4ck <butterflyhuangxx@gmail.com>, security@kernel.org
References: <CAFcO6XO58pV+j9gu5Hha3JUW555EPQo6ELTvxRyQ5PWu_1gsUA@mail.gmail.com>
 <4f26b648-1595-3f9a-4236-3d1b3e7134a8@suse.de>
Message-ID: <59a8ed6f-6052-baa3-55a8-9856a2effce9@suse.de>
Date: Tue, 14 Jul 2020 10:46:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4f26b648-1595-3f9a-4236-3d1b3e7134a8@suse.de>
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
Cc: robdclark@chromium.org, airlied@linux.ie, syzkaller-bugs@googlegroups.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 seanpaul@chromium.org, sam@ravnborg.org, emil.velikov@collabora.com
Content-Type: multipart/mixed; boundary="===============0178118085=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0178118085==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="RswaFX4eq05LEL3kebtkCrkKMPV1Q2KkW"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--RswaFX4eq05LEL3kebtkCrkKMPV1Q2KkW
Content-Type: multipart/mixed; boundary="LZW5mQhZVVY91SEh3Kk51YKuV8ajDbkRd";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: butt3rflyh4ck <butterflyhuangxx@gmail.com>, security@kernel.org
Cc: robdclark@chromium.org, airlied@linux.ie,
 syzkaller-bugs@googlegroups.com, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, seanpaul@chromium.org, sam@ravnborg.org,
 emil.velikov@collabora.com
Message-ID: <59a8ed6f-6052-baa3-55a8-9856a2effce9@suse.de>
Subject: Re: KASAN: use-after-free Read in drm_gem_object_release
References: <CAFcO6XO58pV+j9gu5Hha3JUW555EPQo6ELTvxRyQ5PWu_1gsUA@mail.gmail.com>
 <4f26b648-1595-3f9a-4236-3d1b3e7134a8@suse.de>
In-Reply-To: <4f26b648-1595-3f9a-4236-3d1b3e7134a8@suse.de>

--LZW5mQhZVVY91SEh3Kk51YKuV8ajDbkRd
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 14.07.20 um 09:41 schrieb Thomas Zimmermann:
> Hi
>=20
> Am 10.07.20 um 10:24 schrieb butt3rflyh4ck:
>> I report a bug (in linux-5.8.0-rc4) found by syzkaller.
>>
>> kernel config: https://github.com/butterflyhack/syzkaller-fuzz/blob/ma=
ster/v5.8.0-rc4.config
>>
>> I test the reproducer and crash too.
>>
>> In the drm_em_vram_t() function,  ttm_bo_init() function call
>> ttm_bo_init_reserved(),
>> the ttm_bo_init_reserved() function  call ttm_bo_put(), it will free
>> gbo->bo that is struct ttm_buffer_object.
>>
>> then, goto the err_drm_gem_object_release lable,
>> drm_gem_object_release() function will free gbo->bo.base, so cause use=

>> after free.
>=20
> Thanks for reporting. I think we recently had a patch for this problem,=

> [1] but I asked for some changes. Are you in a position to test a fix?
>=20
> Best regards
> Thomas
>=20
>=20
> [1]
> https://lore.kernel.org/dri-devel/20200620062134.82961-1-jiayang5@huawe=
i.com/

I sent out a patchset with this patch and a few additional changes.

https://lore.kernel.org/dri-devel/20200714083238.28479-1-tzimmermann@suse=
=2Ede/T/#t

Best regards
Thomas

>=20
>>
>> crash log:
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> BUG: KASAN: use-after-free in drm_gem_object_release+0xf7/0x120
>> drivers/gpu/drm/drm_gem.c:953
>> Read of size 8 at addr ffff888064dfd928 by task syz-executor.2/1320
>>
>> CPU: 1 PID: 1320 Comm: syz-executor.2 Not tainted 5.8.0-rc4+ #1
>> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
>> 1.10.2-1ubuntu1 04/01/2014
>> Call Trace:
>>  __dump_stack lib/dump_stack.c:77 [inline]
>>  dump_stack+0x18f/0x20d lib/dump_stack.c:118
>>  print_address_description.constprop.0.cold+0xae/0x436 mm/kasan/report=
=2Ec:383
>>  __kasan_report mm/kasan/report.c:513 [inline]
>>  kasan_report.cold+0x1f/0x37 mm/kasan/report.c:530
>>  drm_gem_object_release+0xf7/0x120 drivers/gpu/drm/drm_gem.c:953
>>  drm_gem_vram_init drivers/gpu/drm/drm_gem_vram_helper.c:211 [inline]
>>  drm_gem_vram_create+0x3e6/0x5e0 drivers/gpu/drm/drm_gem_vram_helper.c=
:244
>>  drm_gem_vram_fill_create_dumb+0x17a/0x310
>> drivers/gpu/drm/drm_gem_vram_helper.c:615
>>  drm_gem_vram_driver_dumb_create+0x51/0xb0
>> drivers/gpu/drm/drm_gem_vram_helper.c:710
>>  drm_mode_create_dumb+0x27c/0x300 drivers/gpu/drm/drm_dumb_buffers.c:9=
4
>>  drm_ioctl_kernel+0x220/0x2e0 drivers/gpu/drm/drm_ioctl.c:787
>>  drm_ioctl+0x4d2/0x96f drivers/gpu/drm/drm_ioctl.c:887
>>  vfs_ioctl fs/ioctl.c:48 [inline]
>>  ksys_ioctl+0x11a/0x180 fs/ioctl.c:753
>>  __do_sys_ioctl fs/ioctl.c:762 [inline]
>>  __se_sys_ioctl fs/ioctl.c:760 [inline]
>>  __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:760
>>  do_syscall_64+0x60/0xe0 arch/x86/entry/common.c:384
>>  entry_SYSCALL_64_after_hwframe+0x44/0xa9
>> RIP: 0033:0x467a29
>> Code: Bad RIP value.
>> RSP: 002b:00007f98f2d40c48 EFLAGS: 00000246 ORIG_RAX: 0000000000000010=

>> RAX: ffffffffffffffda RBX: 000000000076bf00 RCX: 0000000000467a29
>> RDX: 0000000020000040 RSI: 00000000c02064b2 RDI: 0000000000000003
>> RBP: 000000000070c600 R08: 0000000000000000 R09: 0000000000000000
>> R10: 0000000000000000 R11: 0000000000000246 R12: 00007f98f2d416bc
>> R13: 0000000000000297 R14: 0000000000702040 R15: 00000000004d2418
>>
>> Allocated by task 1320:
>>  save_stack+0x1b/0x40 mm/kasan/common.c:48
>>  set_track mm/kasan/common.c:56 [inline]
>>  __kasan_kmalloc.constprop.0+0xc2/0xd0 mm/kasan/common.c:494
>>  kmem_cache_alloc_trace+0x14f/0x2d0 mm/slab.c:3551
>>  kmalloc include/linux/slab.h:555 [inline]
>>  kzalloc include/linux/slab.h:669 [inline]
>>  drm_gem_vram_create+0x425/0x5e0 drivers/gpu/drm/drm_gem_vram_helper.c=
:239
>>  drm_gem_vram_fill_create_dumb+0x17a/0x310
>> drivers/gpu/drm/drm_gem_vram_helper.c:615
>>  drm_gem_vram_driver_dumb_create+0x51/0xb0
>> drivers/gpu/drm/drm_gem_vram_helper.c:710
>>  drm_mode_create_dumb+0x27c/0x300 drivers/gpu/drm/drm_dumb_buffers.c:9=
4
>>  drm_ioctl_kernel+0x220/0x2e0 drivers/gpu/drm/drm_ioctl.c:787
>>  drm_ioctl+0x4d2/0x96f drivers/gpu/drm/drm_ioctl.c:887
>>  vfs_ioctl fs/ioctl.c:48 [inline]
>>  ksys_ioctl+0x11a/0x180 fs/ioctl.c:753
>>  __do_sys_ioctl fs/ioctl.c:762 [inline]
>>  __se_sys_ioctl fs/ioctl.c:760 [inline]
>>  __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:760
>>  do_syscall_64+0x60/0xe0 arch/x86/entry/common.c:384
>>  entry_SYSCALL_64_after_hwframe+0x44/0xa9
>>
>> Freed by task 1320:
>>  save_stack+0x1b/0x40 mm/kasan/common.c:48
>>  set_track mm/kasan/common.c:56 [inline]
>>  kasan_set_free_info mm/kasan/common.c:316 [inline]
>>  __kasan_slab_free+0xf5/0x140 mm/kasan/common.c:455
>>  __cache_free mm/slab.c:3426 [inline]
>>  kfree+0x103/0x2c0 mm/slab.c:3757
>>  ttm_bo_release+0xae1/0x1350 drivers/gpu/drm/ttm/ttm_bo.c:632
>>  kref_put include/linux/kref.h:65 [inline]
>>  ttm_bo_put drivers/gpu/drm/ttm/ttm_bo.c:638 [inline]
>>  ttm_bo_init_reserved+0xb04/0xd00 drivers/gpu/drm/ttm/ttm_bo.c:1339
>>  ttm_bo_init+0x10e/0x330 drivers/gpu/drm/ttm/ttm_bo.c:1366
>>  drm_gem_vram_init drivers/gpu/drm/drm_gem_vram_helper.c:202 [inline]
>>  drm_gem_vram_create+0x3c1/0x5e0 drivers/gpu/drm/drm_gem_vram_helper.c=
:244
>>  drm_gem_vram_fill_create_dumb+0x17a/0x310
>> drivers/gpu/drm/drm_gem_vram_helper.c:615
>>  drm_gem_vram_driver_dumb_create+0x51/0xb0
>> drivers/gpu/drm/drm_gem_vram_helper.c:710
>>  drm_mode_create_dumb+0x27c/0x300 drivers/gpu/drm/drm_dumb_buffers.c:9=
4
>>  drm_ioctl_kernel+0x220/0x2e0 drivers/gpu/drm/drm_ioctl.c:787
>>  drm_ioctl+0x4d2/0x96f drivers/gpu/drm/drm_ioctl.c:887
>>  vfs_ioctl fs/ioctl.c:48 [inline]
>>  ksys_ioctl+0x11a/0x180 fs/ioctl.c:753
>>  __do_sys_ioctl fs/ioctl.c:762 [inline]
>>  __se_sys_ioctl fs/ioctl.c:760 [inline]
>>  __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:760
>>  do_syscall_64+0x60/0xe0 arch/x86/entry/common.c:384
>>  entry_SYSCALL_64_after_hwframe+0x44/0xa9
>>
>> The buggy address belongs to the object at ffff888064dfd800
>>  which belongs to the cache kmalloc-1k of size 1024
>> The buggy address is located 296 bytes inside of
>>  1024-byte region [ffff888064dfd800, ffff888064dfdc00)
>> The buggy address belongs to the page:
>> page:ffffea0001937f40 refcount:1 mapcount:0 mapping:0000000000000000 i=
ndex:0x0
>> flags: 0xfffe0000000200(slab)
>> raw: 00fffe0000000200 ffffea0000f3c248 ffffea0001ad7388 ffff88806bc00c=
40
>> raw: 0000000000000000 ffff888064dfd000 0000000100000002 00000000000000=
00
>> page dumped because: kasan: bad access detected
>>
>> Memory state around the buggy address:
>>  ffff888064dfd800: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>>  ffff888064dfd880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>>> ffff888064dfd900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>>                                   ^
>>  ffff888064dfd980: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>>  ffff888064dfda00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>> Regards,
>>  butt3rflyh4ck.
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--LZW5mQhZVVY91SEh3Kk51YKuV8ajDbkRd--

--RswaFX4eq05LEL3kebtkCrkKMPV1Q2KkW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl8NcNgUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiPV5wgAl1K7s0MUIrDaxPFo36icEhUgW0Pc
uKuFA3Ouh8CPBzvChZgRhNd74qo7BuEuO847aD/oAHkFz/lPKvtGffmokuIODU7K
SLvt17UVvjOrtTNNmwV4bVwZnfjRK4hBMhLs26zRokS185DthaJpWpfZehNWiVMO
sJekyo4kz0+LgFQU05foqJ3EjE00BZD3aHV4fgzvuNezTXZvKmFuQ90tWDw7GppN
zaYM2gPEigtcTADTpCnrZD2TfuGUkRkkFKL0T3UBSXPGnUpmvufVYGoKUqn2ZZAu
+Jh4LheBCrPnTffWZQbriujUuVlLcyxPHHpLNzOmZyMakctqHs7jVYkfxQ==
=HAiv
-----END PGP SIGNATURE-----

--RswaFX4eq05LEL3kebtkCrkKMPV1Q2KkW--

--===============0178118085==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0178118085==--
